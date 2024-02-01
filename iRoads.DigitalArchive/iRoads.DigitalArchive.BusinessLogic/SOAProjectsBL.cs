using AutoMapper;
using FluentNHibernate.Conventions;
using iRoads.DigitalArchive.BusinessLogic.Interfaces;
using iRoads.DigitalArchive.DataAccess.Networking;
using iRoads.DigitalArchive.Entities.Dbo;
using iRoads.DigitalArchive.Entities.Lookup;
using iRoads.DigitalArchive.Models.Command;
using iRoads.DigitalArchive.Models.Enums;
using iRoads.DigitalArchive.Models.Model;
using iRoads.DigitalArchive.Models.Query;
using iRoads.DigitalArchive.Razor.Models.Email;
using Microsoft.AspNetCore.Mvc.ApplicationModels;
using Ness.DataAccess.Repository.CrossPlatform;
using Ness.Framework.BusinessLogic;
using Ness.Framework.Core.Interfaces.Log;
using Ness.Framework.Core.Interfaces.ReadFiles;
using Ness.Framework.Entities.Site;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using NHibernate;
using NHibernate.Type;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.Json.Nodes;
using System.Threading.Tasks;

namespace iRoads.DigitalArchive.BusinessLogic
{
    public class SOAProjectsBL : BaseBL, ISOAProjectsBL
    {
        private readonly IActionLogBL actionLogBL;
        private readonly ILogger logger;
        private readonly string className;
        private readonly INetworkHttpClient httpClient;
        private readonly IMailBL mailBl;
        private readonly IUserBL userBL;
        private readonly IExcelFileHelper excelFileHelper;
        private readonly string rootPath;
        private const string SOURCE = "SOA Interface";

        public SOAProjectsBL(IRepository repository, IMapper mapper, IActionLogBL bl, ILogger logger,
            INetworkHttpClient httpClient, IMailBL mailBl, IUserBL userBL,
            IExcelFileHelper excelFileHelper) : base(repository, mapper)
        {
            this.actionLogBL = bl;
            this.logger = logger;
            this.className = GetType().Name;
            this.httpClient = httpClient;
            this.mailBl = mailBl;
            this.userBL = userBL;
            this.excelFileHelper = excelFileHelper;
            this.rootPath = AppDomain.CurrentDomain.BaseDirectory + "MailAttachments";
        }

        public override T Get<T, M>(M query)
        {
            T vm = new T();
            logger.LogInfo(className, HelperBL.GetCurrentMethod(), "START", JsonConvert.SerializeObject(query));
            if (typeof(M) == typeof(LevelDocsQuery))
                vm = (T)(Object)GetLevelDocs(query as LevelDocsQuery);
            logger.LogInfo(className, HelperBL.GetCurrentMethod(), "END", JsonConvert.SerializeObject(query), JsonConvert.SerializeObject(vm));
            return vm;
        }

        public override T Save<T, M>(M command)
        {
            T vm = new T();
            logger.LogInfo(className, HelperBL.GetCurrentMethod(), "START", JsonConvert.SerializeObject(command));

            if (typeof(M) == typeof(SaveSoaProjectsCommand))
                vm = (T)(Object)SaveSoaProjects(command as SaveSoaProjectsCommand);
            if (typeof(M) == typeof(SaveSoaProjectLevelsCommand))
                vm = (T)(Object)SaveSoaProjectLevels(command as SaveSoaProjectLevelsCommand);
            if (typeof(M) == typeof(SaveCaseApprovalCommand))
                vm = (T)(Object)PostCaseApproval(command as SaveCaseApprovalCommand);
            if (typeof(M) == typeof(SaveLevelApprovalCommand))
                vm = (T)(Object)PostLevelApproval(command as SaveLevelApprovalCommand);
            if (typeof(M) == typeof(SaveSoaDocumentStatusCommand))
                vm = (T)(Object)UpdateSoaDocumentStatus(command as SaveSoaDocumentStatusCommand);

            logger.LogInfo(className, HelperBL.GetCurrentMethod(), "END", JsonConvert.SerializeObject(command), JsonConvert.SerializeObject(vm));
            return vm;
        }

        #region methods

        /*
         * 2.6.1
         * */
        private ResultModel SaveSoaProjects(SaveSoaProjectsCommand c)
        {

            ResultModel result = new ResultModel();
            try
            {
                logger.LogInfo(className, HelperBL.GetCurrentMethod(), "START", JsonConvert.SerializeObject(c));

                List<SOAProjectModel> baseModel = c.Model;

                var query = baseModel.GroupBy(x => new
                {
                    x.ProjectId
                })
                                 .Where(g => g.Count() > 1)
                                 .Select(y => new { Element = y.Key, Counter = y.Count() })
                                 .ToList();
                foreach (var item in query)
                {
                    var id = item.Element.ProjectId;
                    result.ErrorMessages.Add("מספר הפרוייקט נשלח יותר מפעם אחת " + id);
                }

                ActionLogCommand actionLog = new ActionLogCommand
                {
                    ActionCode = (int)LogActionsEnum.CHANGE_VALUE,
                    DateHour = DateTime.Now,
                    Source = SOURCE

                };
                List<SOAProjectModel> noDuplicates = baseModel.GroupBy(x => new { x.ProjectId }).Select(x => x.First()).ToList();

                foreach (var item in noDuplicates)
                {
                    _repository[currentRepository].ExecuteTransaction(session =>
                    {
                        Save<SOAProjectModel, SoaImpProjects>(item, session);
                        actionLog.UpdateDate = DateTime.Now;
                        actionLog.User = c.User;
                        actionLog.NewValue = item.ProjectId;
                        actionLogBL.SaveActionLog(actionLog);

                        if (item.Contracts != null)
                        {
                            var splitContracts = item.Contracts.Split(",");
                            foreach (var contract in splitContracts)
                            {
                                if (!string.IsNullOrEmpty(contract))
                                {
                                    CheckAndCreateLevelAndContract(session, contract, (int)BusinessLevelEnum.BAKARAT_ECHUT, item.ProjectId, item.Mnf);
                                    CheckAndCreateLevelAndContract(session, contract, (int)BusinessLevelEnum.HESHBON_SOFI_KABLANI, item.ProjectId, item.Mnf);
                                    CheckAndCreateLevelAndContract(session, contract, (int)BusinessLevelEnum.BITZUA, item.ProjectId, item.Mnf);
                                }

                            }
                        }

                    });
                }

                _repository[currentRepository].ExecuteTransaction(session =>
                {
                    var failed = session.Query<SoaImpProjects>().Where(x => x.ManagementStatus.Contains("בתהליך כשל"));
                    if (failed != null)
                    {
                        List<SoaImpProjects> list = failed.ToList();

                        foreach (var item in list)//update management status for failed rows
                        {

                            logger.LogInfo(className, HelperBL.GetCurrentMethod(), "item failed", JsonConvert.SerializeObject(item));

                            item.ManagementStatus = "נכשל";
                            Save(item, session);
                        }
                    }
                });

                logger.LogInfo(className, HelperBL.GetCurrentMethod(), "END", JsonConvert.SerializeObject(c), JsonConvert.SerializeObject(result));

            }
            catch (Exception e)
            {
                result.ErrorCode = (int)Status.FAIL;
                result.ErrorMsg = e.Message;
                logger.LogError(className, HelperBL.GetCurrentMethod(), e.Message, JsonConvert.SerializeObject(c), e);

            }


            return result;
        }

        private void CheckAndCreateLevelAndContract(ISession session, string contract, int level, string projectID, string MNF)
        {
            var item = new ProjectBusinessLevelModel();
            try
            {

                var projectLevel = session.Query<ProjectBusinessLevel>().Where(x =>
                x.Contract == contract.Trim()
                && x.LevelCode == level
                && x.ProjectId == projectID).FirstOrDefault();
                if (projectLevel == null)
                {
                    item = new ProjectBusinessLevelModel()
                    {
                        LevelCode = level,
                        Contract = contract.Trim(),
                        ProjectId = projectID,
                        BusinessLevelControlStatusCode = (int)BusinessLevelControlStatusEnum.NOT_YET_STARTED,
                        Mnf = MNF,
                        PhaseApprovalArcCode = (int)PhaseApprovalStatusEnum.NOT_YET_STARTED,
                        PhaseApprovalArcDate = null,
                        PhaseApprovalMamapCode = (int)PhaseApprovalStatusEnum.NOT_YET_STARTED,
                        PhaseApprovalMamapDate = null,
                        UpdateDate = DateTime.Now,
                        FromInterface = false
                    };
                    Save<ProjectBusinessLevelModel, ProjectBusinessLevel>(item, session);
                }

            }
            catch (Exception e)
            {
                logger.LogError(className, HelperBL.GetCurrentMethod(), e.Message, JsonConvert.SerializeObject(item), e);
                throw e;

            }

        }


        /*
         * 2.6.2
         * */
        private ResultModel SaveSoaProjectLevels(SaveSoaProjectLevelsCommand c)
        {
            ResultModel result = new ResultModel();
            try
            {
                logger.LogInfo(className, HelperBL.GetCurrentMethod(), "START", JsonConvert.SerializeObject(c));

                List<SOABusinessLevelsModel> baseModel = c.Model;
                var query = baseModel.GroupBy(x => new
                {
                    x.ProjectId,
                    x.Contract,
                    x.LevelCode
                })
                .Where(g => g.Count() > 1)
                .Select(y => new { Element = y.Key, Counter = y.Count() })
                .ToList();

                foreach (var item in query)
                {
                    var id = item.Element.ProjectId;
                    var contract = item.Element.Contract;
                    var level = item.Element.LevelCode;
                    if (contract != null)
                    {
                        result.ErrorMessages.Add("מספר הפרוייקט, חוזה ושלב נשלחו יותר מפעם אחת " + id + ", " + contract + ", " + level);
                    }
                }

                List<SOABusinessLevelsModel> noDuplicates = baseModel.GroupBy(x => 
                new { x.ProjectId, x.LevelCode, x.Contract })
                    .Select(x => x.Last()).ToList();

                foreach (var item in noDuplicates)
                {
                    item.FromInterface = true;

                    Projects project = new Projects();
                    _repository[currentRepository].ExecuteTransaction(session =>
                    {
                        project = session.Query<Projects>().Where(
                                                            x => x.ProjectId == item.ProjectId).FirstOrDefault();
                    });
                    if (project == null)
                    {
                        result.ErrorCode = (int)Status.DOESNT_EXIST;
                        result.ErrorMessages.Add("פרוייקט לא קיים במערכת מסמכים " + item.ProjectId);
                        logger.LogInfo(className, HelperBL.GetCurrentMethod(), "Project Doesn't Exist", JsonConvert.SerializeObject(item));
                        continue;
                    }

                    var levelCode = item.LevelCode;
                    if (item.Contract == null 
                        && (levelCode == (int)BusinessLevelEnum.HESHBON_SOFI_KABLANI 
                            || levelCode == (int)BusinessLevelEnum.BITZUA 
                            || levelCode == (int)BusinessLevelEnum.BAKARAT_ECHUT))
                    {
                        result.ErrorCode = (int)Status.FAIL;
                        result.ErrorMsg = "אין אפשרות להכניס שלב זה ללא חוזה";
                    }
                    else
                    {
                        var levelWithContract = new ProjectBusinessLevel();
                        _repository[currentRepository].Execute(session =>
                        {
                            levelWithContract = session.Query<ProjectBusinessLevel>().Where(
                                                            x => x.ProjectId != item.ProjectId
                                                            && x.Contract == item.Contract && item.Contract != null).FirstOrDefault();
                        });
                        if (levelWithContract != null)
                        {
                            result.ErrorCode = (int)Status.DOESNT_EXIST;
                            result.ErrorMessages.Add("חוזה מקושר לפרוייקט אחר " + item.Contract);
                            logger.LogInfo(className, HelperBL.GetCurrentMethod(), "Contract is attached to a different ProjectID", JsonConvert.SerializeObject(item));
                            continue;
                        }

                        _repository[currentRepository].Execute(session =>
                        {
                            SaveSoaBusinessLevelItem(item);
                        });

                        item.FromInterface = false;
                        if (levelCode == (int)BusinessLevelEnum.BITZUA && item.StatusLevelCode == (int)SOALevelControlStatusEnum.ACTIVE)
                        {

                            _repository[currentRepository].Execute(session =>
                            {
                                item.LevelCode = (int)BusinessLevelEnum.BAKARAT_ECHUT;
                                SoaBusinessLevel project = session.Query<SoaBusinessLevel>().Where(
                                                           x => x.ProjectId == item.ProjectId &&
                                                           x.LevelCode == item.LevelCode &&
                                                           x.Contract == item.Contract).FirstOrDefault();

                                SaveSoaBusinessLevelItem(item);
                            });

                        }
                        else if (levelCode == (int)BusinessLevelEnum.HESHBON_SOFI_KABLANI && item.StatusLevelCode == (int)SOALevelControlStatusEnum.ACTIVE)
                        {

                            _repository[currentRepository].Execute(session =>
                            {
                                item.LevelCode = (int)BusinessLevelEnum.BAKARAT_ECHUT;
                                SoaBusinessLevel project = session.Query<SoaBusinessLevel>().Where(
                                                         x => x.ProjectId == item.ProjectId &&
                                                         x.LevelCode == item.LevelCode &&
                                                         x.Contract == item.Contract).FirstOrDefault();

                                SaveSoaBusinessLevelItem(item);
                            });


                            _repository[currentRepository].Execute(session =>
                            {
                                item.LevelCode = (int)BusinessLevelEnum.BITZUA;
                                SoaBusinessLevel project = session.Query<SoaBusinessLevel>().Where(
                                                         x => x.ProjectId == item.ProjectId &&
                                                         x.LevelCode == item.LevelCode &&
                                                         x.Contract == item.Contract).FirstOrDefault();
                                SaveSoaBusinessLevelItem(item);
                            });
                        }
                    }

                }
                _repository[currentRepository].ExecuteTransaction(session =>
                {
                    var failed = session.Query<SoaBusinessLevel>().Where(x => x.ManagementStatus.Contains("בתהליך כשל"));
                    if (failed != null)
                    {
                        List<SoaBusinessLevel> list = failed.ToList();

                        foreach (var item in list)//update management status for failed rows
                        {
                            try
                            {
                                logger.LogInfo(className, HelperBL.GetCurrentMethod(), "item failed", JsonConvert.SerializeObject(item));
                            }
                            catch (IOException ioe)
                            { }
                            item.ManagementStatus = "נכשל";
                            Save(item, session);
                        }
                    }
                });



                logger.LogInfo(className, HelperBL.GetCurrentMethod(), "END", null, JsonConvert.SerializeObject(result));
            }
            catch (Exception e)
            {
                result.ErrorCode = (int)Status.FAIL;
                result.ErrorMsg = e.Message;
                logger.LogError(className, HelperBL.GetCurrentMethod(), e.Message, JsonConvert.SerializeObject(c), e);

            }



            return result;
        }

        private void SaveSoaBusinessLevelItem(SOABusinessLevelsModel item)
        {
            try
            {
                var parameters = new Dictionary<string, Tuple<object, IType>>
                    {
                        { "ProjectId", new Tuple<object, IType>(item.ProjectId, NHibernateUtil.String) },
                        { "LevelCode", new Tuple<object, IType>(item.LevelCode, NHibernateUtil.Int32) },
                        { "Contract", new Tuple<object, IType>(item.Contract, NHibernateUtil.String) },
                        { "StartLevelDate", new Tuple<object, IType>(item.StartLevelDate, NHibernateUtil.DateTime) },
                        { "StatusLevelCode", new Tuple<object, IType>(item.StatusLevelCode, NHibernateUtil.Int32) },
                        { "IV_CCRN", new Tuple<object, IType>(item.IV_CCRN, NHibernateUtil.String) },
                        { "FromInterface", new Tuple<object, IType>(item.FromInterface, NHibernateUtil.Boolean) }
                    };

                _repository[currentRepository].ExecuteSp<object>("SaveOrUpdateSOABusinessLevel", parameters).FirstOrDefault();

            }
            catch (Exception e)
            {
                logger.LogError(className, HelperBL.GetCurrentMethod(), e.Message, JsonConvert.SerializeObject(item), e);
                //throw e;
            }
        }

        /*
         * 2.6.3
         * */
        private LevelDocsModel GetLevelDocs(LevelDocsQuery levelDocsQuery)
        {

            LevelDocsModel docsModel = new LevelDocsModel();


            LevelDocs levelDocs = new LevelDocs
            {
                ProjectID = levelDocsQuery.ProjectID,
                UserName = levelDocsQuery.User.UserName,
                Contract = levelDocsQuery.Contracts,
                wbsNum = levelDocsQuery.WBS,
                LevelCode = levelDocsQuery.LevelCode,
                mnf = levelDocsQuery.MNF

            };
            try
            {
                ProjectBusinessLevel level = new ProjectBusinessLevel();
                _repository[currentRepository].Execute(session =>
                {
                    level = session.Query<ProjectBusinessLevel>().Where(x => 
                    x.LevelCode == levelDocsQuery.LevelCode
                    && x.Contract == levelDocsQuery.Contracts
                    && x.ProjectId == levelDocsQuery.ProjectID).FirstOrDefault();
                });
                if (levelDocsQuery.LevelCode == (int)BusinessLevelEnum.HESHBON_SOFI_KABLANI &&
                    ((level != null && level.BusinessLevelControlStatusCode == (int)BusinessLevelControlStatusEnum.NOT_YET_STARTED) 
                        || (level == null && levelDocsQuery.LevelCode == (int)BusinessLevelEnum.HESHBON_SOFI_KABLANI)))
                {
                    logger.LogInfo(className, HelperBL.GetCurrentMethod(), "LEVEL 8 IS NOT YET STATED -> NO DOCUMENTS WILL BE LOADED", JsonConvert.SerializeObject(levelDocsQuery), JsonConvert.SerializeObject(docsModel));
                }
                else
                {
                    logger.LogInfo(className, HelperBL.GetCurrentMethod(), "START", JsonConvert.SerializeObject(levelDocsQuery));
                    BusinessLevel businessLevel = new BusinessLevel();
                    _repository[currentRepository].Execute(session =>
                        {
                            businessLevel = session.Query<BusinessLevel>().Where(x => x.Code == levelDocsQuery.LevelCode).FirstOrDefault();
                        });
                    IList<string> URLS = businessLevel.SoaUrl.Split(',');
                    foreach (string url in URLS)
                    {
                        _repository[currentRepository].Execute(session =>
                        {
                            var JsonRes = httpClient.PostDirectJson(levelDocs, url.Trim()).GetAwaiter().GetResult();
                            JObject obj = JsonConvert.DeserializeObject<JObject>(JsonRes);
                            if (obj != null)
                            {
                                foreach (JProperty item in obj.Children().Cast<JProperty>())
                                {
                                    if (item.Value.Type.Equals(JTokenType.Array))
                                    {
                                        JArray jsonArray = item.Value as JArray;
                                        foreach (JObject doc in jsonArray.Cast<JObject>())
                                        {
                                            DocumentModel documentModel = new DocumentModel
                                            {
                                                SourceDocId = (string)doc["SourceDocID"],
                                                AttachedBy = (string)doc["User"],
                                                AttachedDate = (DateTime?)doc["Date"],
                                                URL = (string)doc["URL"],
                                                Discipline = (string)doc["Discipline"],
                                                SogBakara = (string)doc["SogBakara"],
                                                Type = (string)doc["Type"],
                                                Element = (string)doc["Element"],
                                                DocStatusCode = (string)doc["Status"] == null ? (int)DocumentStausEnum.NOT_TESTED : (int)doc["Status"],
                                                FileName = (string)doc["FileName"],
                                                LevelCode = levelDocsQuery.LevelCode

                                            };
                                            var code = session.Query<DocumentStatus>().Where(x => x.Code == documentModel.DocStatusCode).FirstOrDefault();
                                            if (code != null)
                                                documentModel.DocStatusDesc = code.Description;
                                            docsModel.Docs.Add(documentModel);

                                        }
                                    }
                                }

                            }
                        });
                    }
                }
                docsModel.ErrorCode = (int)Status.SUCCESS;
                docsModel.ErrorMessage = "Success";

                logger.LogInfo(className, HelperBL.GetCurrentMethod(), "END", JsonConvert.SerializeObject(levelDocsQuery), JsonConvert.SerializeObject(docsModel));

            }
            catch (Exception e)
            {
                docsModel.ErrorCode = (int)Status.FAIL;
                docsModel.ErrorMessage = "אין מסמכים להצגה";

                logger.LogError(className, HelperBL.GetCurrentMethod(), e.Message, JsonConvert.SerializeObject(levelDocsQuery), e);


            }

            docsModel.Project_IID = levelDocsQuery.ProjectID;
            return docsModel;
        }


        /*
         * 2.6.4
         * */
        private ResultModel PostCaseApproval(SaveCaseApprovalCommand c)
        {

            var url = "";//TODO Niva
            ResultModel result = new ResultModel();

            try
            {
                logger.LogInfo(className, HelperBL.GetCurrentMethod(), "START", JsonConvert.SerializeObject(c));
                _repository[currentRepository].ExecuteTransaction(session =>
                {
                    var JsonRes = httpClient.PostDirectJson(c, url).GetAwaiter().GetResult();
                    Console.WriteLine(JsonRes);
                });

                ActionLogCommand actionLog = new ActionLogCommand
                {
                    ActionCode = (int)LogActionsEnum.CHANGE_VALUE,
                    DateHour = DateTime.Now,
                    UpdateDate = DateTime.Now,
                    User = c.User,
                    NewValue = JsonConvert.SerializeObject(c),
                    Source = SOURCE
                };
                actionLogBL.SaveActionLog(actionLog);
                logger.LogInfo(className, HelperBL.GetCurrentMethod(), "END", JsonConvert.SerializeObject(c), JsonConvert.SerializeObject(result));

            }
            catch (Exception e)
            {
                result.ErrorCode = (int)Status.FAIL;
                result.ErrorMsg = e.Message;
                logger.LogError(className, HelperBL.GetCurrentMethod(), e.Message, JsonConvert.SerializeObject(c), e);

            }


            return result;
        }

        /*
         * 2.6.5
         * */
        private ResultModel PostLevelApproval(SaveLevelApprovalCommand c)
        {

            ResultModel result = new ResultModel();

            try
            {
                logger.LogInfo(className, HelperBL.GetCurrentMethod(), "START", JsonConvert.SerializeObject(c));
                _repository[currentRepository].ExecuteTransaction(session =>
               {
                   Config ApproveLevelMenifa = session.Query<Config>().Where(x => x.Id == "ApproveLevelMenifa").FirstOrDefault();
                   Config ApproveLevelSAP = session.Query<Config>().Where(x => x.Id == "ApproveLevelSAP").FirstOrDefault();
                   if (ApproveLevelSAP == null || ApproveLevelMenifa == null)
                   {
                       result.ErrorCode = (int)Status.FAIL;
                       result.ErrorMsg = "Can't load URLS from DB";
                       logger.LogError(className, HelperBL.GetCurrentMethod(), result.ErrorMsg, JsonConvert.SerializeObject(c), new Exception(result.ErrorMsg));
                   }
                   else
                   {
                       var url1 = ApproveLevelMenifa.Value;
                       var url2 = ApproveLevelSAP.Value;
                       var isLevelCodeConstructors = c.LevelCode == (int)BusinessLevelEnum.HESHBON_SOFI_KABLANI;



                       var url = isLevelCodeConstructors ? url2 : url1;//8 is constructors contract
                       JsonObject jsonObject = new JsonObject();

                       if (!isLevelCodeConstructors)
                       {
                           jsonObject["ProjectIID"] = c.ProjectID;
                           jsonObject["Stage"] = c.LevelCode == (int)BusinessLevelEnum.TICHNUN_RISHONI ? 2 
                                               : c.LevelCode == (int)BusinessLevelEnum.TICHNUN_MUKDAM ? 3 
                                               : c.LevelCode == (int)BusinessLevelEnum.TICHNUN_MEFORAT ? 5 
                                               : (int)BusinessLevelEnum.BITZUA + 1;

                       }
                       else
                       {
                           jsonObject["IV_CCRN"] = c.IV_CCRN;
                           jsonObject["IV_EBELN"] = c.Contracts;
                       }
                       jsonObject["UserName"] = c.User.UserName;

                       ActionLogCommand actionLog = new ActionLogCommand
                       {
                           ActionCode = (int)LogActionsEnum.CHANGE_VALUE,
                           DateHour = DateTime.Now,
                           UpdateDate = DateTime.Now,
                           User = c.User,
                           NewValue = JsonConvert.SerializeObject(c),
                           Source = SOURCE
                       };
                       actionLogBL.SaveActionLog(actionLog);
                       var JsonRes = httpClient.PostDirectJson(jsonObject, url).GetAwaiter().GetResult();
                       result.ErrorCode = (int)Status.SUCCESS;
                   }


               });
                logger.LogInfo(className, HelperBL.GetCurrentMethod(), "END", JsonConvert.SerializeObject(c), JsonConvert.SerializeObject(result));


            }
            catch (Exception e)
            {
                result.ErrorCode = (int)Status.FAIL;
                result.ErrorMsg = e.Message;
                logger.LogError(className, HelperBL.GetCurrentMethod(), e.Message, JsonConvert.SerializeObject(c), e);

            }

            return result;
        }


        /*
       * 2.6.6
       * */
        public async Task SendAlertMailToManhap()
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

                await _repository[currentRepository].ExecuteTransactionAsync(async session =>
                {
                    Config AlertManhapLastRunningDate = session.Query<Config>().Where(x => x.Id == "AlertManhapLastRunningDate").FirstOrDefault();
                    if (AlertManhapLastRunningDate != null)
                    {
                        lastRunningDate = DateTime.Parse(AlertManhapLastRunningDate.Value);
                    }
                    message = session.Query<EmailMessages>().Where(x => x.Id == 2).FirstOrDefault();
                    if (message != null)
                    {
                        emailModel.Subject = message.Subject;
                        emailModel.Title = message.Body;
                    }


                    var parameters = new Dictionary<string, Tuple<object, IType>>
                    {
                        { "LastRun", new Tuple<object, IType>(lastRunningDate, NHibernateUtil.DateTime) }
                    };

                    IList<ManhapModel> manhaps = _repository[currentRepository].ExecuteSp<ManhapModel>("GetInvalidDocsSP", parameters);


                    if (manhaps.Count > 0)
                    {

                        var groupByManhaps = manhaps.GroupBy(x => new { x.ManhapUserName })
                     .Where(g => g.IsNotEmpty())
                     .Select(y => new { Element = y.Key, Counter = y.Count(), Value = y.ToArray() })
                     .ToList();


                        foreach (var item in groupByManhaps)
                        {
                            if (item.Element == null)
                                continue;

                            emailModel.Emails = new List<string>
                            {
                                item.Value.First().ManhapEmail,
                                item.Value.First().MemoneBakaraEmail
                            };
                            emailModel.Attachments = CreateExcelFile(item.Value, item.Element.ManhapUserName, "AlertManhap.xlsx");
                            mailBl.MailComposer(emailModel);
                            await mailBl.Send();

                        }
                    }
                    ConfigModel model = new ConfigModel()
                    {
                        Id = "AlertManhapLastRunningDate",
                        Value = DateTime.Now.ToString()
                    };
                    SaveConfig(model);
                });

                logger.LogInfo(className, HelperBL.GetCurrentMethod(), "END", null);
            }
            catch (Exception e)
            {
                result.ErrorCode = (int)Status.FAIL;
                result.ErrorMsg = e.Message;
                logger.LogError(className, HelperBL.GetCurrentMethod(), e.Message, null, e);

            }


        }


        /*
         * 2.6.7
         * */
        public async Task SendAlertMailOfControlEnding()
        {
            ResultModel result = new ResultModel();


            try
            {
                logger.LogInfo(className, HelperBL.GetCurrentMethod(), "START", null);
                DateTime lastRunningDate = DateTime.Now;
                DeleteAttachmentFolder();
                EmailModel emailModel = new EmailModel
                {
                    User = userBL.GetCurrentUser()
                };
                EmailMessages message = new EmailMessages();

                await _repository[currentRepository].ExecuteAsync(async session =>
                {
                    Config AlertManhapLastRunningDate = session.Query<Config>().Where(x => x.Id == "AlertOfControlEndingLastRunningDate").FirstOrDefault();
                    if (AlertManhapLastRunningDate != null)
                    {
                        lastRunningDate = DateTime.Parse(AlertManhapLastRunningDate.Value);
                    }

                    var parameters = new Dictionary<string, Tuple<object, IType>>
                    {
                        { "LastRun", new Tuple<object, IType>(lastRunningDate, NHibernateUtil.DateTime) }
                    };


                    IList<ManhapAndMamapMailModel> finishedProjects = _repository[currentRepository].ExecuteSp<ManhapAndMamapMailModel>("GetFinishedProjectsSP", parameters);


                    if (finishedProjects.Count > 0)
                    {

                        await SendToManhaps(session, emailModel, finishedProjects);
                        await SendToMamaps(session, emailModel, finishedProjects);
                        await SendToOthers(session, emailModel, finishedProjects);
                    }

                    ConfigModel model = new ConfigModel
                    {
                        Id = "AlertOfControlEndingLastRunningDate",
                        Value = DateTime.Now.ToString()

                    };
                    SaveConfig(model);

                });

                logger.LogInfo(className, HelperBL.GetCurrentMethod(), "END", null);
            }
            catch (Exception e)
            {
                result.ErrorCode = (int)Status.FAIL;
                result.ErrorMsg = e.Message;
                logger.LogError(className, HelperBL.GetCurrentMethod(), e.Message, null, e);

            }

        }

        private async Task SendToManhaps(ISession session, EmailModel emailModel, IList<ManhapAndMamapMailModel> finishedProjects)
        {

            var groupByManhaps = finishedProjects.GroupBy(x => new { x.ManhapUserName })
         .Where(g => g.IsNotEmpty())
         .Select(y => new { Element = y.Key, Counter = y.Count(), Value = y.ToArray() })
         .ToList();

            EmailMessages message = session.Query<EmailMessages>().Where(x => x.Id == 3).FirstOrDefault();
            if (message != null)
            {
                emailModel.Subject = message.Subject;
                emailModel.Title = message.Body;
            }


            foreach (var item in groupByManhaps)
            {
                if (item.Element == null)
                    continue;

                emailModel.Emails = new List<string>
                            {
                                item.Value.First().ManhapEmail
                            };
                emailModel.Attachments = CreateExcelFile(item.Value, item.Element.ManhapUserName + "-Finished", "AlertManhapFinishedProjects.xlsx");
                mailBl.MailComposer(emailModel);
                await mailBl.Send();

            }


        }

        private async Task SendToOthers(ISession session, EmailModel emailModel, IList<ManhapAndMamapMailModel> finishedProjects)
        {

            var groupByMnf = finishedProjects.GroupBy(x => new { x.MNF })
         .Where(g => g.IsNotEmpty())
         .Select(y => new { Element = y.Key, Counter = y.Count(), Value = y.ToArray() })
         .ToList();

            EmailMessages message = session.Query<EmailMessages>().Where(x => x.Id == 3).FirstOrDefault();
            if (message != null)
            {
                emailModel.Subject = message.Subject;
                emailModel.Title = message.Body;
            }
            Config mailingList = session.Query<Config>().Where(x => x.Id == "mailingList").FirstOrDefault();

            foreach (var item in groupByMnf)
            {
                if (item.Element == null)
                    continue;

                emailModel.Emails = new List<string>
                            {
                                item.Value.First().AgafManagerEmail,
                                item.Value.First().MemoneBakaraEmail,
                                mailingList.Value
                            };
                emailModel.Attachments = CreateExcelFile(item.Value, item.Element.MNF + "-Finished", "AlertAllUsersFinishedProjects.xlsx");
                mailBl.MailComposer(emailModel);
                await mailBl.Send();


            }



        }

        private async Task SendToMamaps(ISession session, EmailModel emailModel, IList<ManhapAndMamapMailModel> finishedProjects)
        {

            var groupByMamaps = finishedProjects.GroupBy(x => new { x.MamapUserName })
         .Where(g => g.IsNotEmpty())
         .Select(y => new { Element = y.Key, Counter = y.Count(), Value = y.ToArray() })
         .ToList();

            EmailMessages message = session.Query<EmailMessages>().Where(x => x.Id == 3).FirstOrDefault();
            if (message != null)
            {
                emailModel.Subject = message.Subject;
                emailModel.Title = message.Body;
            }

            foreach (var item in groupByMamaps)
            {
                if (item.Element == null)
                    continue;

                emailModel.Emails = new List<string>
                            {
                                item.Value.First().MamapEmail
                            };
                emailModel.Attachments = CreateExcelFile(item.Value, item.Element.MamapUserName + "-Finished", "AlertMamapFinishedProjects.xlsx");
                mailBl.MailComposer(emailModel);
                await mailBl.Send();

            }

        }


        /*
         * 2.6.8
         * */
        private ResultModel UpdateSoaDocumentStatus(SaveSoaDocumentStatusCommand c)
        {
            ResultModel result = new ResultModel();

            try
            {
                logger.LogInfo(className, HelperBL.GetCurrentMethod(), "START", JsonConvert.SerializeObject(c));

                _repository[currentRepository].ExecuteTransaction(session =>
                {

                    Config API = session.Query<Config>().Where(x => x.Id == "UpdateDocAPI").FirstOrDefault();
                    var url = API.Value;
                    var obj = new SaveDocModel()
                    {
                        ProjectID = c.ProjectID,
                        Status = c.DocumentStatusCode.ToString(),
                        UserName = c.User.UserName,
                        DocID = c.DocId,
                        Contract = c.Contract,
                        TableName = c.TableName
                    };


                    var JsonRes = httpClient.PostDirectJson(obj, url).GetAwaiter().GetResult();
                    ActionLogCommand actionLog = new ActionLogCommand
                    {
                        ActionCode = (int)LogActionsEnum.CHANGE_VALUE,
                        DateHour = DateTime.Now,
                        UpdateDate = DateTime.Now,
                        User = c.User,
                        NewValue = JsonRes,
                        Source = SOURCE
                    };
                    actionLogBL.SaveActionLog(actionLog);
                });
            }
            catch (Exception e)
            {
                result.ErrorCode = (int)Status.FAIL;
                result.ErrorMsg = e.Message;
                logger.LogError(className, HelperBL.GetCurrentMethod(), e.Message, JsonConvert.SerializeObject(c), e);

            }

            return result;
        }


        #region private methods

        private void SaveConfig(ConfigModel model)
        {
            Dictionary<string, Tuple<object, IType>> parameters = new Dictionary<string, Tuple<object, IType>>
                    {
                        { "Key", new Tuple<object, IType>(model.Id, NHibernate.NHibernateUtil.String) },
                        { "Value", new Tuple<object, IType>(model.Value, NHibernate.NHibernateUtil.String) }
                    };

            _repository[currentRepository].ExecuteSp<object>("SaveOrUpdateConfig", parameters);

        }

        private void DeleteAttachmentFolder()
        {
            if (Directory.Exists(rootPath))
            {
                var dir = new DirectoryInfo(rootPath);
                dir.Delete(true);
            }

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


        #endregion private methods

        #endregion
    }


}
