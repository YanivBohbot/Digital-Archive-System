using AutoMapper;
using iRoads.DigitalArchive.BusinessLogic.Interfaces;
using iRoads.DigitalArchive.Entities.Dbo;
using iRoads.DigitalArchive.Entities.Lookup;
using iRoads.DigitalArchive.Models.Command;
using iRoads.DigitalArchive.Models.Enums;
using iRoads.DigitalArchive.Models.Model;
using iRoads.DigitalArchive.Models.Query;
using iRoads.DigitalArchive.Razor.Models.Email;
using Microsoft.Extensions.Configuration;
using MoreLinq;
using MoreLinq.Extensions;
using Ness.DataAccess.Repository.CrossPlatform;
using Ness.Framework.BusinessLogic;
using Ness.Framework.Core.Interfaces.Log;
using Ness.Framework.Core.Interfaces.ReadFiles;
using Ness.Framework.Models.App;
using Ness.Framework.Models.Viewmodel;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.DirectoryServices.AccountManagement;
using System.IO;
using System.Linq;
using System.Linq.Dynamic.Core;
using Messages = iRoads.DigitalArchive.Models.Enums.Messages;

namespace iRoads.DigitalArchive.BusinessLogic
{
    public class ProjectsBL : BaseBL, IProjectsBL
    {
        readonly IProjectBL _ProjectBL;
        private readonly IActionLogBL actionLogBL;

        readonly ILogger logger;
        readonly string className;
        private readonly IConfiguration configuration;
        private readonly IExcelFileHelper excelFileHelper;
        private readonly string rootPath;
        private readonly List<BaseLookup> levelsLookup;
        private readonly IMailBL mailBl;
        private readonly IUserBL userBL;
        private readonly string conStr;
        private const int UNASSINGED = -1;
        private const string SOURCE = "Projects List Screen";



        public ProjectsBL(IRepository repository, IMapper mapper, IProjectBL projectBL, IConfiguration configuration, ILogger logger
        , IUserBL userBL, IMailBL mailBl, IExcelFileHelper excelFileHelper, IActionLogBL actionLogBL) : base(repository, mapper)
        {
            _ProjectBL = projectBL;
            this.logger = logger;
            this.mailBl = mailBl;
            this.userBL = userBL;
            this.className = GetType().Name;
            this.configuration = configuration;
            this.conStr = configuration["ConnectionStrings:ConnStr"];
            this.excelFileHelper = excelFileHelper;
            this.rootPath = AppDomain.CurrentDomain.BaseDirectory + "ManapEmailReports";
            levelsLookup = GetLookup<BusinessLevel>();
            this.actionLogBL = actionLogBL;

        }

        public override T Get<T, M>(M query)
        {

            logger.LogInfo(className, HelperBL.GetCurrentMethod(), "START", JsonConvert.SerializeObject(query));


            _ = new T();
            T vm;
            if (typeof(M) == typeof(ProjectsQuery))
                vm = (T)(Object)GetProjects(query as ProjectsQuery);
            else if (typeof(M) == typeof(ControlManagersQuery))
                vm = (T)(Object)GetControlManagers(query as ControlManagersQuery);

            else
                vm = (T)(Object)GetCombos();


            logger.LogInfo(className, HelperBL.GetCurrentMethod(), "END", JsonConvert.SerializeObject(query), JsonConvert.SerializeObject(vm));
            return vm;

        }

        private BaseViewModel<ComboOptions> GetCombos()
        {
            var result = new BaseViewModel<ComboOptions>();
            logger.LogInfo(className, HelperBL.GetCurrentMethod(), "START", null);


            try
            {

                using var conn = new SqlConnection(this.conStr);
                var cmd = new SqlCommand("GetCombosSP", conn)
                {
                    CommandType = CommandType.StoredProcedure
                };
                var ds = new DataSet();
                using (var da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds);

                }
                conn.Close();
                result.Details = new ComboOptions
                {
                    WBS = GetListFromTable(ds, 0),
                    Agaf = GetListFromTable(ds, 1),
                    ControlManagers = GetListFromTable(ds, 2),
                    Tenders = GetListFromTable(ds, 3),
                    Contracts = GetListFromTable(ds, 4),
                    Contractors = GetListFromTable(ds, 5),
                    Company = GetListFromTable(ds, 6),
                    Mamap = GetListFromTable(ds, 7),
                    Manhap = GetListFromTable(ds, 8),
                    Roads = GetListFromTable(ds, 9),
                    Intersects = GetListFromTable(ds, 10)
                };


            }
            catch (Exception e)
            {
                result.Status = (int)Status.FAIL;
                result.Messages.Add(new Message
                {
                    LogLevel = LogLevel.Error,
                    Text = e.Message,
                });
                logger.LogError(className, HelperBL.GetCurrentMethod(), e.Message, null, e);
            }
            logger.LogInfo(className, HelperBL.GetCurrentMethod(), "END", JsonConvert.SerializeObject(result));

            return result;
        }

        private static List<string> GetListFromTable(DataSet ds, int index)
        {
            return ds.Tables[index].AsEnumerable().Select(r => r.Field<string>(0)).ToList();
        }

        public override T Save<T, M>(M command)
        {
            logger.LogInfo(className, HelperBL.GetCurrentMethod(), "START", JsonConvert.SerializeObject(command));
            T vm = new T();
            if (typeof(M) == typeof(FavoriteProjectItem))
                vm = (T)(Object)PostUpdateFavoriteProject(command as FavoriteProjectItem);
            else if (typeof(M) == typeof(GenerateReportCommand))
                vm = (T)(Object)GenerateReport(command as GenerateReportCommand);
            logger.LogInfo(className, HelperBL.GetCurrentMethod(), "END", JsonConvert.SerializeObject(command), JsonConvert.SerializeObject(vm));

            return vm;
        }

        private BaseViewModel GenerateReport(GenerateReportCommand query)
        {
            var vm = new BaseViewModel();
            try
            {
                RoleAllowActionsQuery allowActionsQuery = new RoleAllowActionsQuery() { User = query.User };
                var allowActions = _ProjectBL.Get<BaseViewModel<RoleAllowActionsModel>, RoleAllowActionsQuery>(allowActionsQuery);
                if (!allowActions.Details.AllowActions.Exists(x => x.Code == (int)AuthorizedActionsCode.SEND_BY_MAIL_INCOMPLETE_CONTROL_REPORT))
                {
                    vm.Status = (int)Status.NOT_ALLOWED;
                    vm.Messages.Add(new Message() { LogLevel = LogLevel.Error, Text = "אינך מורשה להפיק דוח זה" });
                    return vm;
                }
                List<Tuple<Projects, ProjectBusinessLevel>> reportProjects = null;
                _repository[currentRepository].Execute(session =>
                {
                    reportProjects = session.Query<ProjectBusinessLevel>().Where(l =>
                    l.BusinessLevelControlStatusCode == (int)BusinessLevelControlStatusEnum.NOT_COMPLETED)
                    .Join(session.Query<Projects>()
                    .Where(p =>
                    p.MamapUserName.Contains(query.MamapUserName))
                    , p => p.ProjectId, pbl => pbl.ProjectId, (p, pbl) => new Tuple<Projects, ProjectBusinessLevel>(pbl, p)).ToList();
                });
                if (reportProjects != null)
                {
                    var t = reportProjects.Select(x => new
                    {
                        ProjectId = x.Item1.Mnf,
                        Description = x.Item1.Name,
                        LevelName = GetLookupDesc(levelsLookup, x.Item2.LevelCode),
                        StatusDate = x.Item2.BusinessLevelStatusDate,
                        Company = x.Item1.ManagementCompany,
                        Mamap = x.Item1.MamapFullName
                    }).ToList();

                    var project = reportProjects.FirstOrDefault()?.Item1;
                    if (project != null)
                    {
                        var result = SendControlMamapReportEMail(project.AgafManagerEmail, new List<string>() { project.MamapEmail, project.MemoneBakaraEmail }, t);
                        if (!string.IsNullOrEmpty(result.ErrorMsg))
                        {
                            vm.Status = result.ErrorCode;
                            vm.Messages.Add(new Message() { LogLevel = LogLevel.Error, Text = result.ErrorMsg });
                            return vm;
                        }
                    }
                    else
                    {
                        vm.Status = (int)Status.NOT_FOUND;
                        vm.Messages.Add(new Message() { LogLevel = LogLevel.Error, Text = "לא נמצאו פרויקטים" });
                        return vm;
                    }
                }
                vm.Status = 0;
            }
            catch (Exception)
            {
                vm.Status = (int)Status.FAIL; ;
                vm.Messages.Add(new Message() { LogLevel = LogLevel.Error, Text = Messages.TECHNICAL_ERROR_MSG });
            }
            return vm;
        }
        private void DeleteAttachmentFolder()
        {
            if (Directory.Exists(rootPath))
            {
                var dir = new DirectoryInfo(rootPath);
                dir.Delete(true);
            }

        }
        public ResultModel SendControlMamapReportEMail<T>(string mainEmail, List<string> emails, IList<T> data)
        {
            ResultModel result = new ResultModel();

            try
            {
                DeleteAttachmentFolder();

                logger.LogInfo(className, HelperBL.GetCurrentMethod(), "START", null);

                EmailModel emailModel = new EmailModel
                {
                    User = userBL.GetCurrentUser()
                };
                EmailMessages message = new EmailMessages();

                DateTime lastRunningDate = DateTime.Now;

                _repository[currentRepository].ExecuteTransactionAsync(async session =>
                {
                    message = session.Query<EmailMessages>().Where(x => x.Id == 1).FirstOrDefault();
                    if (message != null)
                    {
                        emailModel.Subject = message.Subject;
                        emailModel.Title = message.Body;
                    }


                    var parameters = new Dictionary<string, Tuple<object, NHibernate.Type.IType>>
                    {
                        { "LastRun", new Tuple<object, NHibernate.Type.IType>(lastRunningDate, NHibernate.NHibernateUtil.DateTime) }
                    };


                    emailModel.Email = mainEmail;
                    emailModel.Emails = emails;
                    emailModel.Attachments = CreateExcelFile(data, message.Subject, "MamapReport.xlsx");
                    mailBl.MailComposer(emailModel);
                    await mailBl.Send();


                });

                logger.LogInfo(className, HelperBL.GetCurrentMethod(), "END", null, JsonConvert.SerializeObject(result));
            }
            catch (Exception e)
            {
                result.ErrorCode = (int)Status.DOESNT_EXIST;
                result.ErrorMsg = "מערכת לא הצליחה להפיק דואל למנהל אגף פרויקטים ולנמענים" + e.Message;
                logger.LogError(className, HelperBL.GetCurrentMethod(), e.Message, null, e);

            }
            return result;

        }

        private IList<string> CreateExcelFile<T>(IList<T> list, string title, string template)
        {
            IList<string> paths = new List<string>();

            if (!Directory.Exists(rootPath))
                Directory.CreateDirectory(rootPath);
            string path = rootPath + Path.DirectorySeparatorChar + title + ".xlsx";
            try
            {

                var model = new
                {
                    Data = list
                };
                byte[] fileData = excelFileHelper.GenerateExcelFromTemplate(template, model);
                File.WriteAllBytes(path, fileData);
            }
            catch (Exception e)
            {
                throw e;
            }
            paths.Add(path);
            return paths;
        }
        #region Get Services

        private BaseViewModel<ProjectsModel> GetProjects(ProjectsQuery query)
        {
            logger.LogInfo(className, HelperBL.GetCurrentMethod(), "START", JsonConvert.SerializeObject(query));
            ActionLogCommand actionLog = new ActionLogCommand
            {
                ActionCode = (int)LogActionsEnum.ENTER_SCREEN,
                DateHour = DateTime.Now,
                UpdateDate = DateTime.Now,
                User = query.User,
                NewValue = JsonConvert.SerializeObject(query),
                Source = SOURCE
            };
            actionLogBL.SaveActionLog(actionLog);

            if (query.ArchivStatus == UNASSINGED)
            {
                query.ArchivStatus = null;
            }
            if (query.MamapStatus == UNASSINGED)
            {
                query.MamapStatus = null;
            }
            BaseViewModel<ProjectsModel> response = new BaseViewModel<ProjectsModel>
            {
                Details = new ProjectsModel()
            };
            try
            {
                var projectModel = new ProjectListItemModel();
                List<ProjectsFull> sortedProject = null;
                query.PageNumber++;
                _repository[currentRepository].Execute(session =>
                    {
                        var projectLevels = session.Query<ProjectsFull>();

                        if (projectLevels != null)
                        {

                            if (!string.IsNullOrEmpty(query.ProjectDescription))
                            {
                                var values = query.ProjectDescription.Split(' ');
                                foreach (var val in values)
                                {
                                    projectLevels = projectLevels.Where(x => x.Name.Contains(val)
                                    || x.ProjectId.Contains(val)
                                    || x.Mnf.Contains(val)
                                    || x.RoadRailNum.Contains(val));
                                }

                            }

                        }

                        if (query.LevelCode.HasValue)
                        {
                            projectLevels = projectLevels.Where(b => b.LevelCode == query.LevelCode);
                        }
                        if (query.StartLevelDate.HasValue)
                        {
                            projectLevels = projectLevels.Where(b =>
                                            b.StartBusinessLevelDate.HasValue
                                            && b.StartBusinessLevelDate >= query.StartLevelDate);
                        }
                        if (query.EndLevelDate.HasValue)
                        {
                            projectLevels = projectLevels.Where(b => b.StartBusinessLevelDate.HasValue && b.StartBusinessLevelDate <= query.EndLevelDate);
                        }
                        if (query.MamapStatus.HasValue)
                        {

                            projectLevels = projectLevels.Where(b =>
                            query.MamapStatus == (int)PhaseApprovalStatusEnum.NOT_YET_STARTED ? b.PhaseApprovalMamapCode == null || b.PhaseApprovalMamapCode == (int)PhaseApprovalStatusEnum.NOT_YET_STARTED
                            : (b.PhaseApprovalMamapCode.HasValue && b.PhaseApprovalMamapCode == query.MamapStatus));
                        }
                        if (query.ArchivStatus.HasValue)
                        {
                            projectLevels = projectLevels.Where(b =>
                            query.ArchivStatus == (int)PhaseApprovalStatusEnum.NOT_YET_STARTED ? b.PhaseApprovalArcCode == null || b.PhaseApprovalArcCode == (int)PhaseApprovalStatusEnum.NOT_YET_STARTED
                            : (b.PhaseApprovalArcCode.HasValue && b.PhaseApprovalArcCode == query.ArchivStatus));

                        }
                        if (!IsEmpty(query.ControllerManager))
                        {
                            projectLevels = projectLevels.Where(p => p.ControlManager.Contains(query.ControllerManager));
                        }
                        if (!IsEmpty(query.WBS))
                        {
                            projectLevels = projectLevels.Where(p => p.WbsNum.Contains(query.WBS));
                        }
                        if (!IsEmpty(query.Tender))
                        {
                            projectLevels = projectLevels.Where(p => p.TenderType.Contains(query.Tender));
                        }
                        if (!IsEmpty(query.Road))
                        {
                            projectLevels = projectLevels.Where(p => p.RoadRailNum.Contains(query.Road));
                        }
                        if (!IsEmpty(query.Interchange))
                        {
                            projectLevels = projectLevels.Where(p => p.Interchange.Contains(query.Interchange));
                        }
                        if (!IsEmpty(query.Contract))
                        {
                            List<int> projectsId = new List<int>();
                            var contracts = query.Contract.Split(',');
                            foreach (var contract in contracts)
                            {
                                var projects = projectLevels.Where(b => b.Contract.Contains(contract));
                                foreach (var p in projects)
                                {
                                    projectsId.Add(p.Id);
                                }
                            }
                            projectLevels = projectLevels.Where(p => projectsId.Contains(p.Id));
                        }
                        if (!IsEmpty(query.OperationDepartment))
                        {
                            projectLevels = projectLevels.Where(p => p.OperationDepartment.Contains(query.OperationDepartment));
                        }
                        if (!IsEmpty(query.OperatingContractor))
                        {
                            projectLevels = projectLevels.Where(p => p.MainContractor.Contains(query.OperatingContractor));
                        }
                        if (!IsEmpty(query.Company))
                        {
                            projectLevels = projectLevels.Where(p => p.ManagementCompany.Contains(query.Company));
                        }
                        if (!IsEmpty(query.Mamap))
                        {
                            projectLevels = projectLevels.Where(p => p.MamapFullName.Contains(query.Mamap));
                        }
                        if (!IsEmpty(query.Manhap))
                        {
                            projectLevels = projectLevels.Where(p => p.ManhapFullName.Contains(query.Manhap));
                        }
                        if (query.DisplayFavoriteProjects)
                        {
                            projectLevels = projectLevels.Where(b => b.CreateUser == query.User.UserName);
                        }
                        if (query.DisplayManhapCommentsProjects)
                        {
                            projectLevels = projectLevels.Where(d => d.IsComments.HasValue && d.IsComments.Value == true);
                        }
                        if (query.DisplayInvalidDocsProjects)
                        {
                            projectLevels = projectLevels.Where(d => d.IsInvalidDocs.HasValue && d.IsInvalidDocs.Value == true);
                        }
                        //Talia 15/05/2023 - Idit said archive not exist yet so this filter wrong
                        //if (query.DisplayArchivedProjects)
                        //{
                        //    projectLevels = projectLevels.Where(b => b.PhaseApprovalArcCode.HasValue &&
                        //    b.PhaseApprovalArcCode.Value == 2 && b.PhaseApprovalMamapCode.HasValue && b.PhaseApprovalMamapCode.Value == 2);
                        //}
                        //else
                        //{
                        //    projectLevels = projectLevels.Where(b => !(b.PhaseApprovalArcCode.HasValue &&
                        //    b.PhaseApprovalArcCode.Value == 2 && b.PhaseApprovalMamapCode.HasValue && b.PhaseApprovalMamapCode.Value == 2));
                        //}
                        if (query.User.Role == (int)UserRoleEnum.MAMAP)
                        {
                            projectLevels = projectLevels.Where(p => p.MamapUserName.Contains(query.User.UserName));
                        }
                        if (query.User.Role == (int)UserRoleEnum.MANHAP)
                        {
                            projectLevels = projectLevels.Where(p => p.ManhapUserName.Contains(query.User.UserName)
                            || p.ManhapAllUserName.Contains(query.User.UserName));
                        }
                        if (query.User.Role == (int)UserRoleEnum.PLANNER)
                        {
                            projectLevels = projectLevels.Where(p => p.PlannerAllUserName.Contains(query.User.UserName));
                        }
                        //projectLevels = projectLevels.Where(b => b.BusinessLevelControlStatusCode.HasValue && b.BusinessLevelControlStatusCode == 2);
                        projectLevels = projectLevels.Where(b => b.StartBusinessLevelDate.HasValue);
                        sortedProject = projectLevels.Where(p => p.LevelCode.HasValue && p.LevelCode.Value == (int)BusinessLevelEnum.HESHBON_SOFI_KABLANI).OrderBy(b => b.Mnf).ToList();
                        sortedProject.AddRange(projectLevels.Where(p => p.LevelCode != (int)BusinessLevelEnum.HESHBON_SOFI_KABLANI).OrderBy(b => b.Mnf).ToList());
                        response.TotalRows = sortedProject.Count;
                    });

                if (query.IsExcel)
                {
                    var t = sortedProject.Select(x => new
                    {
                        ProjectId = x.Mnf,
                        Description = x.Name,
                        x.Contract,
                        Level = x.CurrentLevelDesc,
                        LevelDate = x.StartBusinessLevelDate?.ToString("dd/MM/yyyy"),
                        MamapStatus = x.MamapStatusDesc,
                        ArchivStatus = x.ArchivStatusDesc,
                        MainController = x.ControlManager,
                        Mamap = x.MamapFullName,
                        Company = x.ManagementCompany,
                        MNF = x.Mnf
                    }).ToList();
                    var model = new
                    {
                        Data = t
                    };
                    byte[] fileData = excelFileHelper.GenerateExcelFromTemplate("export_project_list.xlsx", model);
                    response.Details.Excel = fileData;
                }
                else
                {
                    List<ProjectListItemModel> projectsLst = new List<ProjectListItemModel>();
                    if (query.PageNumber > 1)
                    {
                        sortedProject = sortedProject.Skip(query.PageSize * (query.PageNumber - 1)).Take(query.PageSize).ToList();
                    }
                    else
                    {
                        sortedProject = sortedProject.Take(query.PageSize).ToList();
                    }
                    sortedProject.ForEach(x =>
                    {
                        ProjectListItemModel p = new ProjectListItemModel
                        {
                            ProjectId = x.ProjectId,
                            Description = x.Name,
                            Contracts = x.Contract,
                            CurrentLevel = x.LevelCode,
                            CurrentLevelDesc = x.CurrentLevelDesc,
                            CurrentLevelDate = x.StartBusinessLevelDate.Value,
                            WBS = x.WbsNum,
                            MamapStatus = x.PhaseApprovalMamapCode,
                            MamapStatusDesc = x.MamapStatusDesc,
                            ArchivStatus = x.PhaseApprovalArcCode,
                            ArchivStatusDesc = x.ArchivStatusDesc,
                            ControlManager = x.ControlManager,
                            Mamap = x.MamapFullName,
                            Company = x.ManagementCompany,
                            IsFavorite = x.CreateUser != null && x.CreateUser == query.User.UserName,
                            IsArchived = x.PhaseApprovalArcCode == (int)PhaseApprovalStatusEnum.COMPLETED
                                    && x.PhaseApprovalMamapCode == (int)PhaseApprovalStatusEnum.COMPLETED,
                            MNF = x.Mnf
                        };
                        projectsLst.Add(p);

                    });
                    response.Details.Projects = projectsLst;
                }


            }
            catch (Exception e)
            {
                response.Status = (int)Status.FAIL;
                response.Messages.Add(new Message
                {
                    Text = e.Message,
                    LogLevel = LogLevel.Error
                });

                logger.LogError(className, HelperBL.GetCurrentMethod(), e.Message, JsonConvert.SerializeObject(query), e);

            }
            logger.LogInfo(className, HelperBL.GetCurrentMethod(), "END", JsonConvert.SerializeObject(query), JsonConvert.SerializeObject(response));
            return response;
        }


        private BaseViewModel<string> GetControlManagers(ControlManagersQuery query)
        {
            logger.LogInfo(className, HelperBL.GetCurrentMethod(), "START", string.Empty);

            BaseViewModel<string> vm = new BaseViewModel<string>();

            string archiveGroup = configuration["ArchiveGroup"];

            using (var context = new PrincipalContext(ContextType.Domain))
            {
                using (var group = GroupPrincipal.FindByIdentity(context, archiveGroup))
                {
                    if (group == null)
                    {
                        logger.LogInfo(className, HelperBL.GetCurrentMethod(), "ERROR - Group does not exist", archiveGroup);
                        vm.Status = (int)Status.NOT_FOUND;
                        vm.Messages.Add(new Message() { Text = "קבוצת משתמשי ארכיב לא קיימת" });
                        return vm;
                    }
                    else
                    {
                        var users = group.GetMembers(true);
                        foreach (UserPrincipal user in users)
                        {
                            vm.Data.Add(user.DisplayName);
                        }
                    }
                }
            }



            logger.LogInfo(className, HelperBL.GetCurrentMethod(), "END", string.Empty, JsonConvert.SerializeObject(vm));
            return vm;
        }


        #endregion
        private BaseViewModel PostUpdateFavoriteProject(FavoriteProjectItem command)
        {
            logger.LogInfo(className, HelperBL.GetCurrentMethod(), "START", JsonConvert.SerializeObject(command));
            BaseViewModel response = new BaseViewModel();
            try
            {
                var pr = command;

                if (command.IsFavorite)
                {
                    _repository[currentRepository].Execute(session =>
                    {
                        var favoriteProject = session.Query<FavoriteProjects>().Where(p =>
                        p.CreateUser.Contains(command.User.UserName)
                        && p.ProjectId == pr.ProjectId
                        && p.LevelCode == pr.LevelCode
                        && p.Contract == pr.Contract
                        && p.IsRowDeleted == false).FirstOrDefault();

                        if (favoriteProject == null)
                        {
                            FavoriteProjects fp = new FavoriteProjects()
                            {
                                ProjectId = pr.ProjectId,
                                Contract = pr.Contract,
                                LevelCode = pr.LevelCode,
                                CreateUser = command.User.UserName,
                                UpdateUser = command.User.UserName,
                                CreateDate = DateTime.Now,
                                ControlManager = default
                            };
                            Save(fp, session);
                        }


                    });

                }
                else
                {
                    _repository[currentRepository].Execute(session =>
                    {
                        FavoriteProjects favoriteProject = session.Query<FavoriteProjects>().Where(p =>
                        p.CreateUser.Contains(command.User.UserName)
                        && p.ProjectId == pr.ProjectId
                        && p.LevelCode == pr.LevelCode
                        && p.Contract == pr.Contract).FirstOrDefault();

                        if (favoriteProject != null)
                        {
                            Save(favoriteProject, session, true);
                        }


                    });
                }
                response.Status = (int)Status.SUCCESS;
            }
            catch (Exception e)
            {
                response.Status = (int)Status.FAIL;
                logger.LogError(className, HelperBL.GetCurrentMethod(), e.Message, JsonConvert.SerializeObject(command), e);
            }

            return response;
        }
        private List<BaseLookup> GetLookup<T>()
        {
            var values = new List<BaseLookup>();
            _repository[currentRepository].Execute(session =>
            {
                values = session.Query<T>().Cast<BaseLookup>().ToList();
            });
            return values;
        }

        private string GetLookupDesc(List<BaseLookup> values, int code)
        {
            return values.Where(x => x.Code == code).Select(x => x.Description).FirstOrDefault();
        }

        private bool IsEmpty(string str)
        {
            return string.IsNullOrEmpty(str) || str == "null";
        }
    }
}
