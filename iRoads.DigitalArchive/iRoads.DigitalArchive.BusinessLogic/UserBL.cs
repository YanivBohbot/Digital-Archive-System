using AutoMapper;
using iRoads.DigitalArchive.BusinessLogic.Interfaces;
using iRoads.DigitalArchive.Entities.Dbo;
using iRoads.DigitalArchive.Models.Command;
using iRoads.DigitalArchive.Models.Enums;
using iRoads.DigitalArchive.Models.Model;
using Microsoft.Extensions.Configuration;
using Ness.DataAccess.Repository.CrossPlatform;
using Ness.Framework.BusinessLogic;
using Ness.Framework.Core.Interfaces.Log;
using Ness.Framework.Core.Web;
using Ness.Framework.Models.App;
using Ness.Framework.Models.Viewmodel;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.DirectoryServices.AccountManagement;
using System.Linq;

namespace iRoads.DigitalArchive.BusinessLogic
{
    public class UserBL : BaseBL, IUserBL
    {
        private readonly IConfiguration _configuration;
        private string userName;
        private readonly PrincipalContext domain;
        private string ArchiveGroup;
        private readonly ILogger logger;
        private readonly string className;
        private const int UNASSINGED = -1;


        public UserBL(IRepository repository, IMapper mapper, IConfiguration configuration, ILogger logger) : base(repository, mapper)
        {
            this.logger = logger;
            this.className = GetType().Name;
            _configuration = configuration;
            domain = new PrincipalContext(ContextType.Domain);
            ArchiveGroup = _configuration["ArchiveGroup"];

        }

        public override T Get<T, M>(M query)
        {
            T vm = new T();
            if (typeof(M) == typeof(LoginCommand))
                vm = (T)(Object)Get_LoggedOnUserData(query as LoginCommand);
            if (typeof(M) == typeof(RoleCommand))
                vm = (T)(Object)GetUserRole(query as RoleCommand);
            return vm;
        }

        private BaseViewModel<User> GetUserRole(RoleCommand roleCommand)
        {
            BaseViewModel<User> res = new BaseViewModel<User>();

            try
            {
                User user = roleCommand.User;
                user.Role = user.Role != (int)UserRoleEnum.ARCHIVE ? GetRole(roleCommand) : (int)UserRoleEnum.ARCHIVE;

                res.Details = user;
            }
            catch (Exception ex)
            {
                res.Status = (int)Status.FAIL;
                var msg = new Message
                {
                    Text = ex.Message,
                    LogLevel = LogLevel.Error
                };
                res.Messages.Add(msg);
                return res;
            }

            return res;
        }

        private int GetRole(RoleCommand c)
        {
            int Role = UNASSINGED;
            try
            {
               
                
                    logger.LogInfo(className, HelperBL.GetCurrentMethod(), "START", userName);
               
                userName = c.User.UserName;
                _repository[currentRepository].ExecuteTransaction(session =>
                {
                    var projectKey = c?.ProjectID;
                    if (projectKey != null)
                    {
                        var project = session.Query<Projects>().Where(x => x.ProjectId == projectKey &&
                        (x.MamapUserName.ToLower().Contains(userName.ToLower()))
                        ).FirstOrDefault();
                        if (project != null)
                        {
                            Role = (int)UserRoleEnum.MAMAP; 
                        }
                        else
                        {
                            project = session.Query<Projects>().Where(x => x.ProjectId == projectKey &&
                            x.ManhapUserName.ToLower().Contains(userName.ToLower())
                            ).FirstOrDefault();
                            if (project != null)
                            {
                                Role = (int)UserRoleEnum.MANHAP;
                            }
                            else
                            {
                                project = session.Query<Projects>().Where(x => x.ProjectId == projectKey &&
                                (x.ManhapAllUserName.ToLower().Contains(userName.ToLower()))
                                ).FirstOrDefault();
                                if (project != null)
                                {
                                    Role = (int)UserRoleEnum.MANHAP;
                                }
                                else
                                {
                                    project = session.Query<Projects>().Where(x => x.ProjectId == projectKey &&
                                    (x.PlannerAllUserName.ToLower().Contains(userName.ToLower()))
                                    ).FirstOrDefault();
                                    if (project != null)
                                    {
                                        Role = (int)UserRoleEnum.PLANNER;
                                    }
                                    else
                                    {
                                        Role = (int)UserRoleEnum.WATCH_ONLY;
                                    }
                                }
                            }
                        }


                    }
                    else
                    {
                        var project = session.Query<Projects>().Where(x => x.MamapUserName.ToLower().Contains(userName.ToLower())).OrderBy(x => x.CaseControlDate).FirstOrDefault();
                        if (project != null)
                        {
                            Role = (int)UserRoleEnum.MAMAP;
                        }
                        else
                        {
                            project = session.Query<Projects>().Where(x => x.ManhapUserName.ToLower().Contains(userName.ToLower())).OrderBy(x => x.CaseControlDate).FirstOrDefault();
                            if (project != null)
                            {
                                Role = (int)UserRoleEnum.MANHAP;
                            }
                            else
                            {
                                project = session.Query<Projects>().Where(x => x.ManhapAllUserName.ToLower().Contains(userName.ToLower())).OrderBy(x => x.CaseControlDate).FirstOrDefault();
                                if (project != null)
                                {
                                    Role = (int)UserRoleEnum.MANHAP;
                                }
                                else
                                {
                                    project = session.Query<Projects>().Where(x => x.PlannerAllUserName.ToLower().Contains(userName.ToLower())).OrderBy(x => x.CaseControlDate).FirstOrDefault();
                                    if (project != null)
                                    {
                                        Role = (int)UserRoleEnum.PLANNER;
                                    }
                                    else
                                    {
                                        Role = (int)UserRoleEnum.WATCH_ONLY;
                                    }
                                }
                            }
                        }
                    }
                });
                logger.LogInfo(className, HelperBL.GetCurrentMethod(), "END", userName, JsonConvert.SerializeObject(Role));

            }
            catch (Exception ex)
            {
                logger.LogError(className, HelperBL.GetCurrentMethod(), ex.Message, null, ex);

            }
            return Role;
        }

        public BaseViewModel<User> Get_LoggedOnUserData(LoginCommand query)
        {
            return GetUser(query);
        }

        public BaseViewModel<User> GetUser(LoginCommand c)
        {
            userName = c.UserName;
            logger.LogInfo(className, HelperBL.GetCurrentMethod(), "UserName From: HttpContext.Current?.User.Identity?.Name: is" + userName, userName);
            BaseViewModel<User> res = new BaseViewModel<User>();
            User user;
            try
            {
                if (userName == null)
                {
                    var msg = new Message
                    {
                        Text = "המערכת לא הצליחה לאתר את קוד המשתמש מה - NTLM",
                        LogLevel = LogLevel.Error
                    };
                    res.Messages.Add(msg);
                    res.Status = (int)Status.DOESNT_EXIST;
                    return res;
                }
                UserPrincipal userPrincipal = UserPrincipal.FindByIdentity(domain, userName);


                List<GroupPrincipal> groups = GetGroups(userName);
                var isPsnextusers = groups != null && groups.Where(x => x.Name.Equals("psnextusers")).FirstOrDefault() != null;
                if (!isPsnextusers)
                {
                    var msg = new Message
                    {
                        Text = "אינך מורשה להכנס למערכת",
                        LogLevel = LogLevel.Error
                    };
                    res.Messages.Add(msg);
                    res.Status = (int)Status.NOT_ALLOWED;
                    return res;
                }

                if (userPrincipal == null)
                {
                    var msg = new Message
                    {
                        Text = "משתמש לא אותר ב AD",
                        LogLevel = LogLevel.Error
                    };
                    try
                    {
                        logger.LogInfo(className, HelperBL.GetCurrentMethod(), msg.Text  + " " + userName, userName);
                    }
                    catch (Exception ex)
                    { }
                    res.Messages.Add(msg);
                    res.Status = (int)Status.NOT_FOUND;
                    return res;
                }
                user = new User()
                {
                    UserName = userPrincipal.SamAccountName,
                    DisplayName = userPrincipal.DisplayName,
                    IdNumber = userPrincipal.EmployeeId
                };
                logger.LogInfo(className, HelperBL.GetCurrentMethod(), "currUser: ", user.UserName);
                if (groups == null)
                {
                    logger.LogError(className, HelperBL.GetCurrentMethod(), "groups are null", null, null);

                }
                var isArchive_RW = groups.Where(x => x.Name.Equals(ArchiveGroup)).FirstOrDefault() != null;
                if (isArchive_RW)
                {
                    user.Role = (int)UserRoleEnum.ARCHIVE;
                }
                else
                {
                    user.Role = GetRole(new RoleCommand
                    {
                        User = user

                    });
                }
                res.Status = (int)Status.SUCCESS;
                res.Details = user;
                return res;
            }
            catch (Exception ex)
            {
                res.Status = (int)Status.FAIL;
                var msg = new Message
                {
                    Text = Messages.TECHNICAL_ERROR_MSG,
                    LogLevel = LogLevel.Error
                };
                res.Messages.Add(msg);
                logger.LogError(className, HelperBL.GetCurrentMethod(), ex.Message, null, ex);

                return res;
            }



        }

        private List<GroupPrincipal> GetGroups(string userName)
        {
            List<GroupPrincipal> result = new List<GroupPrincipal>();

            // establish domain context
            PrincipalContext yourDomain = new PrincipalContext(ContextType.Domain);

            // find your user
            UserPrincipal user = UserPrincipal.FindByIdentity(yourDomain, userName);

            // if found - grab its groups
            if (user != null)
            {
                PrincipalSearchResult<Principal> groups = user.GetAuthorizationGroups();

                // iterate over all groups
                foreach (Principal p in groups)
                {
                    // make sure to add only group principals
                    if (p is GroupPrincipal)
                    {
                        result.Add((GroupPrincipal)p);
                    }
                }
            }

            return result;
        }


        public User GetCurrentUser()
        {
            return HttpContext.Current.Items["User"] as User;

        }

        public User GetByUserName(string userNameToCheck)
        {
            UserPrincipal userPrincipal = UserPrincipal.FindByIdentity(domain, userNameToCheck);
            if (userPrincipal == null) { return null; }
            return new User()
            {
                UserName = userPrincipal.SamAccountName,
                DisplayName = userPrincipal.DisplayName,
                IdNumber = userPrincipal.EmployeeId
            };


        }

    }
}
