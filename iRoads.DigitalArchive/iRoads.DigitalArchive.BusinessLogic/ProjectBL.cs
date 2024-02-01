using AutoMapper;
using FluentNHibernate.Conventions;
using iRoads.DigitalArchive.BusinessLogic.Interfaces;
using iRoads.DigitalArchive.Entities.Dbo;
using iRoads.DigitalArchive.Entities.Lookup;
using iRoads.DigitalArchive.Models.Command;
using iRoads.DigitalArchive.Models.Enums;
using iRoads.DigitalArchive.Models.Model;
using iRoads.DigitalArchive.Models.Query;
using Microsoft.Extensions.Configuration;
using MoreLinq;
using MoreLinq.Extensions;
using Ness.DataAccess.Repository.CrossPlatform;
using Ness.Framework.BusinessLogic;
using Ness.Framework.Core.Interfaces.Log;
using Ness.Framework.Models.App;
using Ness.Framework.Models.Viewmodel;
using Newtonsoft.Json;
using NHibernate.Type;
using NHibernate;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Dynamic.Core;
using System.Threading.Tasks;
using System.Text.RegularExpressions;

namespace iRoads.DigitalArchive.BusinessLogic
{
	public class ProjectBL : BaseBL, IProjectBL
	{
		readonly ISOAProjectsBL _SOAProjectsBL;
		readonly ILogger logger;
		readonly string className;
		private readonly IConfiguration configuration;
		private readonly List<BaseLookup> rejectReazonLookup;
		private readonly List<BaseLookup> docStatusLookup;
		private readonly List<BaseLookup> docChangeReazonLookup;
		private const int UNASSINGED = -1;
		private const string SOURCE = "Project Details Screen";
		private readonly IActionLogBL actionLogBL;




		public ProjectBL(IRepository repository, IMapper mapper, ISOAProjectsBL sOAProjectsBL, IConfiguration configuration, ILogger logger, IActionLogBL actionLogBL) : base(repository, mapper)
		{
			_SOAProjectsBL = sOAProjectsBL;
			this.logger = logger;
			this.className = GetType().Name;
			this.configuration = configuration;
			rejectReazonLookup = GetLookup<RejectReason>();
			docStatusLookup = GetLookup<DocumentStatus>();
			docChangeReazonLookup = GetLookup<DocumentChangeReason>();
			this.actionLogBL = actionLogBL;
		}

		public override T Get<T, M>(M query)
		{
			logger.LogInfo(className, HelperBL.GetCurrentMethod(), "START", JsonConvert.SerializeObject(query));

			T vm = new T();
			if (typeof(M) == typeof(ProjectQuery))
				vm = (T)(Object)GetProjectDetails(query as ProjectQuery);
			if (typeof(M) == typeof(ProjectLevelQuery))
			{
				var q = query as ProjectLevelQuery;
				q.GetLevelDocs = true;
				q.CreateLevels = true;
				vm = (T)(Object)GetProjectLevels(q);
			}
			if (typeof(M) == typeof(ProjectLevelDocsQuery))
				vm = (T)(Object)GetProjectLevelDocs(query as ProjectLevelDocsQuery);
			if (typeof(M) == typeof(RoleAllowActionsQuery))
				vm = (T)(Object)GetRoleAllowActions(query as RoleAllowActionsQuery);
			if (typeof(M) == typeof(DocumentHistoryQuery))
				vm = (T)(Object)GetDocumentHistory(query as DocumentHistoryQuery);

			logger.LogInfo(className, HelperBL.GetCurrentMethod(), "END", JsonConvert.SerializeObject(query), JsonConvert.SerializeObject(vm));

			return vm;

		}

		public override T Save<T, M>(M command)
		{

			logger.LogInfo(className, HelperBL.GetCurrentMethod(), "START", JsonConvert.SerializeObject(command));

			T vm = new T();
			if (typeof(M) == typeof(SaveBusinessLevelApprovalCommand))
				vm = (T)(Object)PostLevelApproval(command as SaveBusinessLevelApprovalCommand);
			if (typeof(M) == typeof(SaveProjectCaseApprovalCommand))
				vm = (T)(Object)PostCaseApproval(command as SaveProjectCaseApprovalCommand);
			if (typeof(M) == typeof(SaveDocumentCommand))
				vm = (T)(Object)PostSaveDocument(command as SaveDocumentCommand);
			if (typeof(M) == typeof(UpdateProjectCommand))
				vm = (T)(Object)PostUpdateProjectDetails(command as UpdateProjectCommand);
			logger.LogInfo(className, HelperBL.GetCurrentMethod(), "END", JsonConvert.SerializeObject(command), JsonConvert.SerializeObject(vm));

			return vm;
		}

		#region Post Services

		private BaseViewModel PostUpdateProjectDetails(UpdateProjectCommand c)
		{
			logger.LogInfo(className, HelperBL.GetCurrentMethod(), "START", JsonConvert.SerializeObject(c));
			var result = new BaseViewModel();
			try
			{
				var allowActions = GetRoleAllowActions(new RoleAllowActionsQuery() { User = c.User, ProjectID = c.ProjectID });
				if (!(IsActionExists(allowActions.Details.AllowActions, (int)AuthorizedActionsCode.SET_CONTROL_MANAGER) ||
					IsActionExists(allowActions.Details.AllowActions, (int)AuthorizedActionsCode.CASE_COMMENTS)))
				{
					result.Status = (int)Status.NOT_ALLOWED;
					result.Messages.Add(new Message() { Text = "אין הרשאה לעדכון אחראי בקרה/ כתיבת הערות לתיק" });
					return result;
				}

				Projects p = null;
				_repository[currentRepository].Execute(session =>
					{
						p = session.Query<Projects>().Where(x => x.ProjectId == c.ProjectID).FirstOrDefault();

					});
				if (p == null)
				{
					result.Status = (int)Status.DOESNT_EXIST;
					result.Messages.Add(new Message() { Text = "המערכת לא איתרה את הפרויקט" });
					return result;
				}

				if (string.IsNullOrEmpty(c.ControlManager))
				{
					c.ControlManager = null;
				}

				_repository[currentRepository].Execute(session =>
				{
					if (p.ControlManager != c.ControlManager)
					{
						p.ControlManager = c.ControlManager;
					}
					if (!string.IsNullOrEmpty(c.GeneralNote))
					{
						p.GeneralNote = c.GeneralNote;
					}
					if (!string.IsNullOrEmpty(c.Merchav_Agaf))
					{
						p.MerhavAgaf = c.Merchav_Agaf;
					}
					Save(p, session);
				});
				result.Status = (int)Status.SUCCESS;
			}
			catch (Exception e)
			{
				result.Status = (int)Status.FAIL;
				result.Messages.Add(new Message() { Text = Messages.TECHNICAL_ERROR_MSG });

				logger.LogError(className, HelperBL.GetCurrentMethod(), e.Message, JsonConvert.SerializeObject(c), e);

			}
			logger.LogInfo(className, HelperBL.GetCurrentMethod(), "END", JsonConvert.SerializeObject(c), JsonConvert.SerializeObject(result));
			return result;
		}
		private BaseViewModel<DocumentModel> PostSaveDocument(SaveDocumentCommand command)
		{
			logger.LogInfo(className, HelperBL.GetCurrentMethod(), "START", JsonConvert.SerializeObject(command));
			BaseViewModel<DocumentModel> result = new BaseViewModel<DocumentModel>();
			try
			{
				if (string.IsNullOrEmpty(command.ProjectId) || !command.LevelCode.HasValue)
				{
					result.Messages.Add(new Message() { Text = "missing required parameters" });
					result.Status = (int)Status.FAIL;
					logger.LogError(className, HelperBL.GetCurrentMethod(), "missing required parameters", JsonConvert.SerializeObject(command), null);

					return result;
				}
				var allowActions = GetRoleAllowActions(new RoleAllowActionsQuery() { User = command.User, ProjectID = command.ProjectId });
				if (!IsActionExists(allowActions.Details.AllowActions, (int)AuthorizedActionsCode.DOCUMENT_CONTROL_APPROVAL)
					&& !IsActionExists(allowActions.Details.AllowActions, (int)AuthorizedActionsCode.WRITE_ATTENTION))
				{
					result.Status = (int)Status.NOT_ALLOWED;
					result.Messages.Add(new Message() { LogLevel = LogLevel.Error, Text = "אין הרשאה לעדכון פרטי מסמך" });
					logger.LogError(className, HelperBL.GetCurrentMethod(), "אין הרשאה לעדכון פרטי מסמך", JsonConvert.SerializeObject(command), null);

					return result;
				}
				if (!IsActionExists(allowActions.Details.AllowActions, (int)AuthorizedActionsCode.WRITE_ATTENTION)
					&& !string.IsNullOrEmpty(command.ManhapComments))
				{
					result.Status = (int)Status.NOT_ALLOWED;
					result.Messages.Add(new Message() { LogLevel = LogLevel.Error, Text = "התקבלו הערות מנהפ ממשתמש השייך לקבוצת משתמשים שאינה מורשה לטפל בהערות מנהפ" });
					logger.LogError(className, HelperBL.GetCurrentMethod(), "התקבלו הערות מנהפ ממשתמש השייך לקבוצת משתמשים שאינה מורשה לטפל בהערות מנהפ", JsonConvert.SerializeObject(command), null);

					return result;
				}
				if (!IsActionExists(allowActions.Details.AllowActions, (int)AuthorizedActionsCode.DOCUMENT_CONTROL_APPROVAL)
					&& command.DocStatus.HasValue)
				{
					result.Status = (int)Status.NOT_ALLOWED;
					result.Messages.Add(new Message() { LogLevel = LogLevel.Error, Text = "התקבל סטטוס מסמך ממשתמש השייך לקבוצת משתמשים שאינה מורשה לטפל בעדכון סטטוס מסמך" });
					logger.LogError(className, HelperBL.GetCurrentMethod(), "התקבל סטטוס מסמך ממשתמש השייך לקבוצת משתמשים שאינה מורשה לטפל בעדכון סטטוס מסמך", JsonConvert.SerializeObject(command), null);

					return result;
				}
				ProjectDocuments document;
				if (command.DocId.HasValue)
				{
					document = UpdateDocument(command);
					if (document == null)
					{
						result.Messages.Add(new Message() { Text = "המערכת לא איתרה את המסמך שנדרש לעדכן" });
						result.Status = (int)Status.NOT_FOUND;

						logger.LogError(className, HelperBL.GetCurrentMethod(), "המערכת לא איתרה את המסמך שנדרש לעדכן", JsonConvert.SerializeObject(command), null);
						return result;
					}
				}
				else
				{
					document = AddDocument(command);
				}
				result.Details = new DocumentModel() { DocId = document.Id };
				result.Status = (int)Status.SUCCESS;
			}
			catch (Exception e)
			{
				result.Messages.Add(new Message() { Text = Messages.TECHNICAL_ERROR_MSG });
				result.Status = (int)Status.FAIL;
				logger.LogError(className, HelperBL.GetCurrentMethod(), e.Message, JsonConvert.SerializeObject(command), e);
			}
			logger.LogInfo(className, HelperBL.GetCurrentMethod(), "END", JsonConvert.SerializeObject(command), JsonConvert.SerializeObject(result));
			return result;
		}
		private BaseViewModel PostCaseApproval(SaveProjectCaseApprovalCommand command)
		{
			logger.LogInfo(className, HelperBL.GetCurrentMethod(), "START", JsonConvert.SerializeObject(command));
			var result = new BaseViewModel();
			try
			{
				var allowActions = GetRoleAllowActions(new RoleAllowActionsQuery() { ProjectID = command.ProjectID });
				if (!IsActionExists(allowActions.Details.AllowActions, (int)AuthorizedActionsCode.ARCHIVE_APPROVAL_FOR_CASE))
				{
					result.Status = (int)Status.NOT_ALLOWED;
					result.Messages.Add(new Message() { Text = "אין הרשאה לאישור תיק" });

					logger.LogInfo(className, HelperBL.GetCurrentMethod(), "", JsonConvert.SerializeObject(command));

					return result;
				}
				var project = GetProjectDetails(new ProjectQuery()
				{
					User = command.User,
					ProjectID = command.ProjectID
				});
				if (project.Details == null)
				{
					result.Status = (int)Status.DOESNT_EXIST;
					result.Messages.Add(new Message() { Text = "המערכת לא איתרה את הפרויקט" });
					logger.LogInfo(className, HelperBL.GetCurrentMethod(), "", JsonConvert.SerializeObject(command));
					return result;
				}
				if (project.Details.CaseControlStatusCode == (int)CaseControlStatusEnum.Finished)
				{
					result.Status = (int)Status.FAIL;
					result.Messages.Add(new Message() { Text = "התיק כבר מאושר" });
					logger.LogInfo(className, HelperBL.GetCurrentMethod(), "", JsonConvert.SerializeObject(command));
					return result;
				}
				var levels = GetProjectLevels(new ProjectLevelQuery() { ProjectID = command.ProjectID, User = command.User });
				foreach (var level in levels.Data)
				{
					if (level.BusinessLevelControlStatusCode != (int)BusinessLevelControlStatusEnum.COMPLETED)
					{
						result.Status = (int)Status.FAIL;
						result.Messages.Add(new Message() { Text = "לא ניתן לאשר את התיק - ישנם שלבים עסקיים שטרם אושרו" });
						logger.LogInfo(className, HelperBL.GetCurrentMethod(), "", JsonConvert.SerializeObject(command));
						return result;
					}
				}
				_repository[currentRepository].Execute(session =>
				{
					var project = session.Query<Projects>().Where(x => x.ProjectId == command.ProjectID).FirstOrDefault();
					project.CaseControlStatusCode = (int)CaseControlStatusEnum.Finished;
					project.CaseControlDate = DateTime.Now;
					Save(project, session);
				});
				SaveCaseApprovalCommand soaCommand = new SaveCaseApprovalCommand() { ProjectID = command.ProjectID, User = command.User, CaseControlStatusCode = (int)CaseControlStatusEnum.Finished };
				_SOAProjectsBL.Save<ResultModel, SaveCaseApprovalCommand>(soaCommand);
				result.Status = (int)Status.SUCCESS;
			}
			catch (Exception e)
			{
				result.Status = (int)Status.FAIL;
				result.Messages.Add(new Message() { Text = Messages.TECHNICAL_ERROR_MSG });
				logger.LogError(className, HelperBL.GetCurrentMethod(), e.Message, JsonConvert.SerializeObject(command), e);
			}
			logger.LogInfo(className, HelperBL.GetCurrentMethod(), "END", JsonConvert.SerializeObject(command), JsonConvert.SerializeObject(result));
			return result;
		}
		private BaseViewModel<ProjectBusinessLevelsModel> PostLevelApproval(SaveBusinessLevelApprovalCommand command)
		{
			logger.LogInfo(className, HelperBL.GetCurrentMethod() + " FromClient", "START", JsonConvert.SerializeObject(command));
			BaseViewModel<ProjectBusinessLevelsModel> result = new BaseViewModel<ProjectBusinessLevelsModel>();
			try
			{
				var allowActions = GetRoleAllowActions(
					new RoleAllowActionsQuery()
					{
						User = command.User,
						ProjectID = command.ProjectID,
						LevelCode = command.LevelCode
					});
				if (!IsActionExists(allowActions.Details.AllowActions, (int)AuthorizedActionsCode.ARCHIVE_APPROVAL_FOR_LEVEL)
					&& !IsActionExists(allowActions.Details.AllowActions, (int)AuthorizedActionsCode.MAMAP_APPROVAL_FOR_LEVEL))
				{
					result.Status = (int)Status.NOT_ALLOWED;
					result.Messages.Add(new Message() { Text = "אין הרשאה לעדכון שלב עסקי" });
					logger.LogInfo(className, HelperBL.GetCurrentMethod() + " FromClient", result.Messages[0].Text, JsonConvert.SerializeObject(command));
					return result;
				}
				List<ProjectBusinessLevel> levels = null;
				_repository[currentRepository].Execute(session =>
				{
					levels = session.Query<ProjectBusinessLevel>().Where(x => x.ProjectId == command.ProjectID && x.LevelCode == command.LevelCode).ToList();

					if (!string.IsNullOrEmpty(command.Contracts))
					{
						levels = session.Query<ProjectBusinessLevel>().Where(x =>
						x.ProjectId == command.ProjectID
						&& x.LevelCode == command.LevelCode
						&& x.Contract == command.Contracts).ToList();
					}
				});
				if (levels.IsEmpty())
				{
					result.Status = (int)Status.DOESNT_EXIST;
					result.Messages.Add(new Message() { Text = "המערכת לא איתרה את השלבים בפרויקט" });
					logger.LogInfo(className, HelperBL.GetCurrentMethod() + " FromClient", result.Messages[0].Text, JsonConvert.SerializeObject(command));

					return result;
				}
				List<ProjectDocuments> projectDocs = null;

				_repository[currentRepository].Execute(session =>
				{
					if (!string.IsNullOrEmpty(command.Contracts))
					{
						projectDocs = session.Query<ProjectDocuments>()
						.Where(x => x.ProjectId == command.ProjectID
						&& x.LevelCode == command.LevelCode
						&& (x.DocumentStatusCode == null || x.DocumentStatusCode == (int)DocumentStausEnum.NOT_TESTED)
						&& x.SourceDocId != null
						&& x.Contract.Equals(command.Contracts)).ToList();
					}
					else
					{
						projectDocs = session.Query<ProjectDocuments>()
						.Where(x => x.ProjectId == command.ProjectID
						&& x.LevelCode == command.LevelCode
						&& (x.DocumentStatusCode == null || x.DocumentStatusCode == (int)DocumentStausEnum.NOT_TESTED)
						&& x.SourceDocId != null).ToList();
					}
				});
				if (projectDocs == null || projectDocs.IsNotEmpty())
				{
					result.Status = (int)Status.FAIL;
					result.Messages.Add(new Message() { Text = "לא ניתן לאשר את השלב - יש מסמכים ללא סטטוס" });
					logger.LogInfo(className, HelperBL.GetCurrentMethod() + " FromClient", result.Messages[0].Text, JsonConvert.SerializeObject(command));
					return result;
				}

				_repository[currentRepository].Execute(session =>
				{
					projectDocs = session.Query<ProjectDocuments>().Where(x =>
					x.ProjectId == command.ProjectID
					&& x.LevelCode == command.LevelCode
					&& x.DocumentStatusCode == (int)DocumentStausEnum.INVALID).ToList();

					if (!string.IsNullOrEmpty(command.Contracts))
					{
						projectDocs = session.Query<ProjectDocuments>().Where(x =>
						x.ProjectId == command.ProjectID
						&& x.LevelCode == command.LevelCode
						&& x.DocumentStatusCode == (int)DocumentStausEnum.INVALID
						&& x.Contract == command.Contracts).ToList();
					}
				});
				if (projectDocs == null || projectDocs.IsNotEmpty())
				{
					result.Status = (int)Status.FAIL;
					result.Messages.Add(new Message() { Text = "לא ניתן לאשר את השלב - יש מסמכים בסטטוס 'לא תקין'" });
					logger.LogInfo(className, HelperBL.GetCurrentMethod() + " FromClient", result.Messages[0].Text, JsonConvert.SerializeObject(command));
					return result;
				}

				if (IsActionExists(allowActions.Details.AllowActions, (int)AuthorizedActionsCode.ARCHIVE_APPROVAL_FOR_LEVEL))
				{
					UpdateNotRelevantDocs(command);
					_repository[currentRepository].Execute(session =>
					{
						foreach (var level in levels)
						{
							//ניתן אישור
							level.PhaseApprovalArcCode = (int)PhaseApprovalStatusEnum.COMPLETED;
							level.PhaseApprovalArcDate = DateTime.Now;
							level.UserNameArchiv = command.User.UserName;
							Save(level, session);
						}


						if (!string.IsNullOrEmpty(command.Contracts))
						{
							projectDocs = session.Query<ProjectDocuments>().Where(x =>
							x.ProjectId == command.ProjectID
							&& x.LevelCode == command.LevelCode
							&& x.Contract == command.Contracts).ToList();
						}
						else
						{
							projectDocs = session.Query<ProjectDocuments>().Where(x =>
							x.ProjectId == command.ProjectID
							&& x.LevelCode == command.LevelCode).ToList();

						}
						foreach (var doc in projectDocs)
						{
							if (doc.DocumentStatusCode == (int)DocumentStausEnum.NOT_TESTED)
							{
								doc.DocumentStatusCode = (int)DocumentStausEnum.IRRELEVANT;
								Save(doc, session);
							}
						}
					});

				}
				else if (IsActionExists(allowActions.Details.AllowActions, (int)AuthorizedActionsCode.MAMAP_APPROVAL_FOR_LEVEL))
				{
					_repository[currentRepository].Execute(session =>
					{
						foreach (var level in levels)
						{
							level.PhaseApprovalMamapCode = (int)PhaseApprovalStatusEnum.COMPLETED;
							level.PhaseApprovalMamapDate = DateTime.Now;
							level.UserNameMamap = command.User.UserName;
							Save(level, session);
						}
					});
				}
				_repository[currentRepository].Execute(session =>
				{
					levels = session.Query<ProjectBusinessLevel>().Where(x =>
					x.ProjectId == command.ProjectID
					&& x.LevelCode == command.LevelCode
					&& x.PhaseApprovalMamapCode == (int)PhaseApprovalStatusEnum.COMPLETED
					&& x.PhaseApprovalArcDate != null
					&& x.PhaseApprovalMamapDate != null
					&& x.PhaseApprovalArcCode == (int)PhaseApprovalStatusEnum.COMPLETED
					&& x.BusinessLevelControlStatusCode != (int)BusinessLevelControlStatusEnum.COMPLETED).ToList();
				});

				if (levels.IsNotEmpty())
				{
					foreach (var item in levels)
					{
						bool saveBitzua = CheckBitzua(item);
						if (item.LevelCode == (int)BusinessLevelEnum.TICHNUN_RISHONI
						|| item.LevelCode == (int)BusinessLevelEnum.TICHNUN_MUKDAM
						|| item.LevelCode == (int)BusinessLevelEnum.TICHNUN_MEFORAT
						|| item.LevelCode == (int)BusinessLevelEnum.HESHBON_SOFI_KABLANI
						|| saveBitzua)
						{
							SaveLevelApprovalCommand soaCommand = new SaveLevelApprovalCommand()
							{
								Contracts = item.Contract,
								ProjectID = item.ProjectId,
								LevelCode = item.LevelCode,
								IV_CCRN = item.IV_CCRN,
								User = command.User
							};

							var soaRes = _SOAProjectsBL.Save<ResultModel, SaveLevelApprovalCommand>(soaCommand);
							if (soaRes.ErrorCode != (int)Status.SUCCESS)
							{

								logger.LogError(className, HelperBL.GetCurrentMethod() + " FromClient", "Complete Level in SOA failed - " + soaRes.ErrorMsg, JsonConvert.SerializeObject(soaCommand), new Exception(soaRes.ErrorMsg));

							}
						}

						CompleteLevel(item);


					}



				}
				else
				{
					_repository[currentRepository].Execute(session =>
					{


						if (!string.IsNullOrEmpty(command.Contracts))
						{
							levels = session.Query<ProjectBusinessLevel>().Where(x =>
						   x.ProjectId == command.ProjectID
						   && x.LevelCode == command.LevelCode
						   && (x.PhaseApprovalMamapCode == (int)PhaseApprovalStatusEnum.COMPLETED
						   || x.PhaseApprovalArcCode == (int)PhaseApprovalStatusEnum.COMPLETED)
						   && x.BusinessLevelControlStatusCode != (int)BusinessLevelControlStatusEnum.NOT_COMPLETED
						   && x.Contract == command.Contracts).ToList();
						}
						else
						{
							levels = session.Query<ProjectBusinessLevel>().Where(x =>
							x.ProjectId == command.ProjectID
							&& x.LevelCode == command.LevelCode
							&& x.BusinessLevelControlStatusCode != (int)BusinessLevelControlStatusEnum.NOT_COMPLETED
							&& (x.PhaseApprovalMamapCode == (int)PhaseApprovalStatusEnum.COMPLETED
							|| x.PhaseApprovalArcCode == (int)PhaseApprovalStatusEnum.COMPLETED)).ToList();

						}
					});
					if (levels.IsNotEmpty())
					{
						_repository[currentRepository].Execute(session =>
						{
							foreach (var level in levels)
							{
								//בקרה טרם הושלמה
								level.BusinessLevelControlStatusCode = (int)BusinessLevelControlStatusEnum.NOT_COMPLETED;
								level.BusinessLevelStatusDate = DateTime.Now;
								Save(level, session);
							}
						});
					}
				}
				result.Data = GetProjectLevels(new ProjectLevelQuery() { ProjectID = command.ProjectID, User = command.User }).Data;
				result.Status = (int)Status.SUCCESS;
			}
			catch (Exception e)
			{
				result.Status = (int)Status.FAIL;
				result.Messages.Add(new Message() { Text = Messages.TECHNICAL_ERROR_MSG });

				logger.LogError(className, HelperBL.GetCurrentMethod() + " FromClient", e.Message, JsonConvert.SerializeObject(command), e);

			}
			logger.LogInfo(className, HelperBL.GetCurrentMethod() + " FromClient", "END", JsonConvert.SerializeObject(command), JsonConvert.SerializeObject(result));
			return result;
		}

		private bool CheckBitzua(ProjectBusinessLevel item)
		{
			if (item.LevelCode == (int)BusinessLevelEnum.BITZUA)
			{
				var incompleteLevels = new List<ProjectBusinessLevel>();
				_repository[currentRepository].Execute(session =>
				{
					incompleteLevels = session.Query<ProjectBusinessLevel>().Where(x =>
					x.ProjectId == item.ProjectId
					&& x.LevelCode == item.LevelCode
					&& x.Contract != item.Contract
					&& x.BusinessLevelControlStatusCode != (int)BusinessLevelControlStatusEnum.COMPLETED).ToList();
				});
				return incompleteLevels.IsEmpty();
			}
			return false;


		}
		#endregion

		#region Get Services
		private BaseViewModel<DocumentHistoryModel> GetDocumentHistory(DocumentHistoryQuery query)
		{
			logger.LogInfo(className, HelperBL.GetCurrentMethod(), "START", JsonConvert.SerializeObject(query));
			BaseViewModel<DocumentHistoryModel> response = new BaseViewModel<DocumentHistoryModel>();
			try
			{
				List<HistoryModel> history = new List<HistoryModel>();
				_repository[currentRepository].Execute(session =>
				{
					var historyLst = session.Query<History>().Where(x => x.ProjectDocId == query.DocId).ToList();
					historyLst.ForEach(h => history.Add(_mapper.Map<HistoryModel>(h)));
					history.ForEach(h =>
									{
										h.ChangeReasonDesc = GetLookupDesc(docChangeReazonLookup, h.ChangeReasonCode);
										h.RejectReasonDesc = h.RejectReasonCode.HasValue ? GetLookupDesc(rejectReazonLookup, h.RejectReasonCode.Value) : null;
										h.ControlStatusDesc = h.ControlStatus.HasValue ? GetLookupDesc(docStatusLookup, h.ControlStatus.Value) : null;
									});
				});
				if (history.IsEmpty())
				{
					response.Status = (int)Status.DOESNT_EXIST;
					response.Messages.Add(new Message() { LogLevel = LogLevel.Error, Text = "אין נתוני היסטוריה על מסמך" });

					logger.LogInfo(className, HelperBL.GetCurrentMethod(), "אין נתוני היסטוריה על מסמך", "");

					return response;
				}

				var model = new DocumentHistoryModel() { History = history };
				_repository[currentRepository].Execute(session =>
				{
					var doc = session.Query<ProjectDocuments>().Where(x => x.Id == query.DocId).FirstOrDefault();
					model.DocName = doc.DocName;
					model.DocType = doc.DocType;
				});
				response.Details = model;
				response.Status = (int)Status.SUCCESS;
			}
			catch (Exception e)
			{
				response.Status = (int)Status.FAIL;
				response.Messages.Add(new Message() { LogLevel = LogLevel.Error, Text = Messages.TECHNICAL_ERROR_MSG });
				logger.LogError(className, HelperBL.GetCurrentMethod(), e.Message, JsonConvert.SerializeObject(query), e);
			}
			logger.LogInfo(className, HelperBL.GetCurrentMethod(), "END", JsonConvert.SerializeObject(query), JsonConvert.SerializeObject(response));
			return response;
		}
		private BaseViewModel<RoleAllowActionsModel> GetRoleAllowActions(RoleAllowActionsQuery query)
		{
			logger.LogInfo(className, HelperBL.GetCurrentMethod(), "START", JsonConvert.SerializeObject(query));
			BaseViewModel<RoleAllowActionsModel> response = new BaseViewModel<RoleAllowActionsModel>();
			try
			{
				var userRole = query.User.Role;
				RoleAllowActionsModel model = new RoleAllowActionsModel
				{
					AllowActions = new List<ActionModel>()
				};
				List<int?> roleActions = null;
				_repository[currentRepository].Execute(session =>
				{
					roleActions = session.Query<Permissions>().Where(x => userRole == x.RoleCode).Select(x => x.ActionCode).Distinct().ToList();
				});
				var actions = roleActions.Where(x => x.HasValue).ToList();
				foreach (var action in roleActions)
				{
					//אישור בקרת ארכיב לתיק
					if (action == (int)AuthorizedActionsCode.ARCHIVE_APPROVAL_FOR_CASE)
					{
						var project = GetProjectDetails(new ProjectQuery()
						{
							User = query.User,
							ProjectID = query.ProjectID
						});
						if (project.Details.CaseControlStatusCode == (int)CaseControlStatusEnum.Finished)
						{
							actions.Remove(action);
						}
					}
					//אישור בקרת ארכיב לשלב או אישור בקרת ממפ לשלב
					if (action == (int)AuthorizedActionsCode.ARCHIVE_APPROVAL_FOR_LEVEL || action == (int)AuthorizedActionsCode.MAMAP_APPROVAL_FOR_LEVEL)
					{
						var projectLevels = GetProjectLevels(new ProjectLevelQuery() { ProjectID = query.ProjectID, User = query.User });
						var currentLevel = projectLevels.Data.Where(x => x.LevelCode == query.LevelCode).FirstOrDefault();
						if (currentLevel != null && currentLevel.BusinessLevelControlStatusCode == (int)BusinessLevelControlStatusEnum.COMPLETED)
						{
							actions.Remove(action);
						}
					}
					//אישור סופי קבלני
					if (query.LevelCode == (int)BusinessLevelEnum.HESHBON_SOFI_KABLANI && actions.Contains((int)AuthorizedActionsCode.MAMAP_APPROVAL_FOR_LEVEL))
					{
						actions.Remove((int)AuthorizedActionsCode.MAMAP_APPROVAL_FOR_LEVEL);
					}
				}
				_repository[currentRepository].Execute(session =>
				{
					model.AllowActions = session.Query<UserActions>().Where(x =>
					actions.Contains(x.Code))
						.Select(x =>
						new ActionModel() { Code = x.Code, Description = x.Description }
						).ToList();
				});
				response.Details = model;
			}
			catch (Exception e)
			{
				response.Status = (int)Status.FAIL;
				response.Messages.Add(new Message() { Text = Messages.TECHNICAL_ERROR_MSG });
				logger.LogError(className, HelperBL.GetCurrentMethod(), e.Message, JsonConvert.SerializeObject(query), e);
			}
			logger.LogInfo(className, HelperBL.GetCurrentMethod(), "END", JsonConvert.SerializeObject(query), JsonConvert.SerializeObject(response));
			return response;
		}


		public static string CleanStr(string str)
		{
			Regex reg = new Regex("[*'/\",_&#--– ^()@]");

			return string.Join("", reg.Replace(str.Trim(), string.Empty).Split(default(string[]), StringSplitOptions.RemoveEmptyEntries));
		}
		private BaseViewModel<DocumentModel> GetProjectLevelDocs(ProjectLevelDocsQuery query, bool createLevels = false)
		{
			logger.LogInfo(className, HelperBL.GetCurrentMethod(), "START", JsonConvert.SerializeObject(query));

			BaseViewModel<DocumentModel> response = new BaseViewModel<DocumentModel>
			{
				Status = (int)Status.SUCCESS
			};
			try
			{
				LevelDocsModel result = null;
				//step 1 :get docs from soa service
				var task = Task.Run(() =>
					_SOAProjectsBL.Get<LevelDocsModel, LevelDocsQuery>(new LevelDocsQuery()
					{
						ProjectID = query.ProjectID,
						Contracts = query.Contract,
						WBS = query.WBS,
						MNF = query.MNF,
						LevelCode = query.LevelCode,
						User = query.User
					})
				);
				if (task.Wait(TimeSpan.FromSeconds(Convert.ToDouble(configuration["GetSoaDocsTimeout"]))))
				{
					result = task.Result;
				}
				else
				{
					response.Status = (int)Status.FAIL;
					response.Messages.Add(new Message() { LogLevel = LogLevel.Error, Text = "תקלת מערכת - לא ניתן להציג מסמכים" });
				}
				if (result == null || result.ErrorCode != (int)Status.SUCCESS)
				{

					logger.LogError(className, HelperBL.GetCurrentMethod(), "result of docs is null", JsonConvert.SerializeObject(query), new Exception("result of docs is null"));
					response.Status = (int)Status.FAIL;
					response.Messages.Add(new Message() { LogLevel = LogLevel.Error, Text = "תקלת מערכת - לא ניתן להציג מסמכים" });
				}
				else if (result.Docs.IsEmpty())
				{
					logger.LogInfo(className, HelperBL.GetCurrentMethod(), "ERROR - no soa docs!!!", JsonConvert.SerializeObject(query));
				}
				else
				{
					if (createLevels)
					{
						CreateLevels(query);
					}

				}

				var canProjectReturnBack = CheckIfProjectCanReturnBack(query);
				//step 2 :get docTypes
				var docTypes = GetSPProjectDocTypes(query.ProjectID, query.LevelCode);
				//step 3 :get documents from db table
				var documents = GetlProjectSystemDocuments(query);

				List<DocumentModel> modelList = new List<DocumentModel>();
				bool newDocs = false;
				var soaDocuments = result?.Docs.Where(x => x.Type != null);

				foreach (var dt in docTypes)
				{
					var soaDocs = soaDocuments?.Where(x =>
					 CleanStr(x.Type).Equals(CleanStr(dt.DocType))
					&& (string.IsNullOrEmpty(x.Discipline) || x.Discipline == dt.Discipline));
					if ((bool)(soaDocs?.IsNotEmpty()))
					{
						foreach (var sDoc in soaDocs)
						{
							var sysDocs = documents.Where(x => !string.IsNullOrEmpty(x.SourceDocId) && x.SourceDocId.Equals(sDoc.SourceDocId));

							if (sysDocs.IsNotEmpty())
							{
								foreach (var doc in sysDocs)
								{
									DocumentModel model = new DocumentModel()
									{
										DocId = doc.Id,
										SourceDocId = doc.SourceDocId,
										LevelCode = query.LevelCode,
										Type = dt.DocType,
										URL = sDoc.URL,
										FileName = sDoc.FileName,
										AttachedBy = sDoc.AttachedBy,
										AttachedDate = sDoc.AttachedDate,
										Element = sDoc.Element,
										AttachedProcess = sDoc.AttachedProcess,
										DocSubject = dt.DocSubject,
										Discipline = dt.Discipline,
										Info = sDoc.Info,
										DocStatusCode = doc.DocumentStatusCode,
										DocStatusDesc = doc.DocumentStatusCode.HasValue ? GetLookupDesc(docStatusLookup, doc.DocumentStatusCode.Value) : string.Empty,
										ReasonRejectCode = doc.ReasonRejectCode,
										ReasonRejectDesc = doc.ReasonRejectCode.HasValue ? GetLookupDesc(rejectReazonLookup, doc.ReasonRejectCode.Value) : null,
										ControlComments = doc.ControlComments,
										ControlDate = doc.ControlDate,
										ControlerName = doc.ControlerName,
										ManhapComments = doc.ManhapComments
									};
									modelList.Add(model);
								}
							}
							else
							{
								var document = InsertDocument(new SaveDocumentCommand()
								{
									SourceDocId = sDoc.SourceDocId,
									LevelCode = query.LevelCode,
									ProjectId = query.ProjectID,
									DocType = dt.DocType,
									Contract = query.Contract,
									Discipline = dt.Discipline
								});
								DocumentModel model = new DocumentModel()
								{
									DocId = document.Id,
									SourceDocId = document.SourceDocId,
									LevelCode = query.LevelCode,
									Type = dt.DocType,
									URL = sDoc.URL,
									FileName = sDoc.FileName,
									AttachedBy = sDoc.AttachedBy,
									AttachedDate = sDoc.AttachedDate,
									Element = sDoc.Element,
									AttachedProcess = sDoc.AttachedProcess,
									DocSubject = dt.DocSubject,
									Discipline = dt.Discipline,
									Info = sDoc.Info,
									DocStatusCode = document.DocumentStatusCode,
									DocStatusDesc = document.DocumentStatusCode.HasValue ? GetLookupDesc(docStatusLookup, document.DocumentStatusCode.Value) : string.Empty,
									ReasonRejectCode = document.ReasonRejectCode,
									ReasonRejectDesc = document.ReasonRejectCode.HasValue ? GetLookupDesc(rejectReazonLookup, document.ReasonRejectCode.Value) : null,
									ControlComments = document.ControlComments,
									ControlDate = document.ControlDate,
									ControlerName = document.ControlerName,
									ManhapComments = document.ManhapComments
								};
								modelList.Add(model);
							}
						}
					}
					//else
					//{
					var sysDoc = documents?.Where(x =>
					CleanStr(x.DocType).Equals(CleanStr(dt.DocType))
					&& (x.Discipline == null || !string.IsNullOrEmpty(x.Discipline) && x.Discipline == dt.Discipline));
					if (sysDoc.IsNotEmpty())
					{
						foreach (var doc in sysDoc)
						{
							if (modelList.FirstOrDefault(x => x.DocId == doc.Id) == null)
							{
								DocumentModel model = new DocumentModel()
								{
									DocId = doc.Id,
									SourceDocId = doc.SourceDocId,
									LevelCode = query.LevelCode,
									AttachedBy = doc.AttachedBy,
									AttachedDate = doc.AttachedDate,
									AttachedProcess = doc.AttachedProcess,
									Type = dt.DocType,
									WBS = query.WBS,
									DocStatusCode = doc.DocumentStatusCode,
									DocStatusDesc = doc.DocumentStatusCode.HasValue ? GetLookupDesc(docStatusLookup, doc.DocumentStatusCode.Value) : string.Empty,
									ReasonRejectCode = doc.ReasonRejectCode,
									ReasonRejectDesc = doc.ReasonRejectCode.HasValue ? GetLookupDesc(rejectReazonLookup, doc.ReasonRejectCode.Value) : null,
									ControlComments = doc.ControlComments,
									ControlDate = doc.ControlDate,
									ControlerName = doc.ControlerName,
									DocSubject = dt.DocSubject,
									Discipline = dt.Discipline,
									ManhapComments = doc.ManhapComments
								};
								modelList.Add(model);
							}
						}
					}
					else
					{
						DocumentModel model = new DocumentModel()
						{
							DocId = null,
							LevelCode = query.LevelCode,
							Type = dt.DocType,
							DocSubject = dt.DocSubject,
							Discipline = dt.Discipline,
							WBS = query.WBS,
						};
						modelList.Add(model);
					}
					//}
				}

				if (canProjectReturnBack)
				{
					foreach (var item in modelList)
					{
						if (item.SourceDocId != null)
						{
							if (item.DocStatusCode == null || item.DocStatusCode == (int)DocumentStausEnum.NOT_TESTED)
							{
								newDocs = true;
							}
						}
					}
					if (newDocs)
					{
						_repository[currentRepository].Execute(session =>
						   {
							   ProjectBusinessLevel level = session.Query<ProjectBusinessLevel>().Where(x =>
						   x.ProjectId == query.ProjectID
						   && x.LevelCode == query.LevelCode).FirstOrDefault();

							   level.BusinessLevelControlStatusCode = (int)BusinessLevelControlStatusEnum.NOT_COMPLETED;
							   level.PhaseApprovalArcCode = (int)PhaseApprovalStatusEnum.NOT_COMPLETED;
							   level.PhaseApprovalArcDate = null;
							   level.BusinessLevelStatusDate = DateTime.Now;
							   Save(level, session);
						   });
					}

				}
				List<DocumentModel> orderList = new List<DocumentModel>();
				//מנהפ
				if (query.User.Role == (int)UserRoleEnum.MANHAP)
				{
					orderList = modelList.Where(x =>
					x.DocStatusCode == (int)DocumentStausEnum.INVALID
					&& string.IsNullOrEmpty(x.ManhapComments))
						.OrderBy(x => x.DocSubject)
						.ThenBy(x => x.Type).ToList();

					orderList.AddRange(modelList.Where(x =>
					!orderList.Contains(x))
						.OrderBy(x => x.DocSubject)
						.ThenBy(x => x.Type).ToList());
				}//ארכיב או מנהל ארכיב
				else if (query.User.Role == (int)UserRoleEnum.ARCHIVE || query.User.Role == (int)UserRoleEnum.ARCHIVE_MANAGER)
				{
					orderList = modelList.Where(x =>
					!x.DocStatusCode.HasValue)
						.OrderBy(x => x.DocSubject)
						.ThenBy(x => x.Type).ToList();

					orderList.AddRange(modelList.Where(x =>
					x.DocStatusCode == (int)DocumentStausEnum.INVALID
					&& string.IsNullOrEmpty(x.ManhapComments))
						.OrderBy(x => x.DocSubject)
						.ThenBy(x => x.Type).ToList());

					orderList.AddRange(modelList.Where(x =>
					!orderList.Contains(x))
						.OrderBy(x => x.DocSubject)
						.ThenBy(x => x.Type).ToList());
				}
				else
				{
					orderList = modelList.OrderBy(x => x.DocSubject).ThenBy(x => x.Type).ToList();
				}
				response.Data = orderList;


			}
			catch (Exception e)
			{
				response.Status = (int)Status.FAIL;

				logger.LogError(className, HelperBL.GetCurrentMethod(), e.Message, JsonConvert.SerializeObject(query), e);

			}
			logger.LogInfo(className, HelperBL.GetCurrentMethod(), "END", JsonConvert.SerializeObject(query), JsonConvert.SerializeObject(response));
			return response;
		}

		private bool CheckIfProjectCanReturnBack(ProjectLevelDocsQuery query)
		{
			var res = false;
			if (query.LevelCode == (int)BusinessLevelEnum.HESDEREI_TNUA
				|| query.LevelCode == (int)BusinessLevelEnum.STATUTORIKA
				|| query.LevelCode == (int)BusinessLevelEnum.MEKARKEIN)
			{
				_repository[currentRepository].Execute(session =>
				{
					ProjectBusinessLevel level = session.Query<ProjectBusinessLevel>().Where(x =>
					x.ProjectId == query.ProjectID
					&& x.LevelCode == query.LevelCode).FirstOrDefault();

					if (level != null)
					{
						if (level.PhaseApprovalArcCode == (int)PhaseApprovalStatusEnum.COMPLETED)
						{
							res = true;
						}
					}
				});
			}
			return res;
		}

		private void CreateLevels(ProjectLevelDocsQuery query)
		{
			if (query.LevelCode == (int)BusinessLevelEnum.HESDEREI_TNUA
				|| query.LevelCode == (int)BusinessLevelEnum.STATUTORIKA
				|| query.LevelCode == (int)BusinessLevelEnum.MEKARKEIN)
			{
				_repository[currentRepository].Execute(session =>
				{
					var level = session.Query<ProjectBusinessLevel>().Where(x =>
					x.ProjectId == query.ProjectID
					&& x.LevelCode == query.LevelCode).FirstOrDefault();

					if (level == null)
					{
						var project = session.Query<Projects>().Where(x => x.ProjectId == query.ProjectID).FirstOrDefault();
						ProjectBusinessLevel l = new ProjectBusinessLevel()
						{
							ProjectId = query.ProjectID,
							Mnf = project.Mnf,
							LevelCode = query.LevelCode,
							StartBusinessLevelDate = DateTime.Now,
							BusinessLevelControlStatusCode = (int)BusinessLevelControlStatusEnum.NOT_COMPLETED,
							PhaseApprovalArcCode = (int)PhaseApprovalStatusEnum.NOT_COMPLETED,
							PhaseApprovalMamapCode = (int)PhaseApprovalStatusEnum.NOT_COMPLETED,
							PhaseApprovalArcDate = null,
							PhaseApprovalMamapDate = null,
							BusinessLevelStatusDate = DateTime.Now,
							FromInterface = false
						};
						Save(l, session);
					}
					else
					{
						if (level.BusinessLevelControlStatusCode == (int)BusinessLevelControlStatusEnum.NOT_YET_STARTED)
						{
							level.BusinessLevelControlStatusCode = (int)BusinessLevelControlStatusEnum.NOT_COMPLETED;
							level.PhaseApprovalArcCode = (int)PhaseApprovalStatusEnum.NOT_COMPLETED;
							level.PhaseApprovalMamapCode = (int)PhaseApprovalStatusEnum.NOT_COMPLETED;
							level.PhaseApprovalArcDate = null;
							level.PhaseApprovalMamapDate = null;
							level.BusinessLevelStatusDate = DateTime.Now;
							Save(level, session);
						}
					}
				});
			}
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
		private BaseViewModel<ProjectModel> GetProjectDetails(ProjectQuery projectQuery)
		{
			logger.LogInfo(className, HelperBL.GetCurrentMethod(), "START", JsonConvert.SerializeObject(projectQuery));
			ActionLogCommand actionLog = new ActionLogCommand
			{
				ActionCode = (int)LogActionsEnum.ENTER_SCREEN,
				DateHour = DateTime.Now,
				UpdateDate = DateTime.Now,
				User = projectQuery.User,
				NewValue = JsonConvert.SerializeObject(projectQuery),
				Source = SOURCE
			};
			actionLogBL.SaveActionLog(actionLog);
			BaseViewModel<ProjectModel> response = new BaseViewModel<ProjectModel>();
			try
			{
				var projectModel = new ProjectModel();
				Projects p = null;
				int currLevel = UNASSINGED;
				if (!string.IsNullOrEmpty(projectQuery.ProjectID))
				{

					_repository[currentRepository].Execute(session =>
					{
						p = session.Query<Projects>().Where(x => x.ProjectId == projectQuery.ProjectID).FirstOrDefault();

					});
					if (p == null)
					{
						response.Status = (int)Status.DOESNT_EXIST;
						response.Messages.Add(new Message() { LogLevel = LogLevel.Error, Text = "המערכת לא איתרה את הפרויקט" });
						logger.LogError(className, HelperBL.GetCurrentMethod(), "המערכת לא איתרה את הפרויקט", JsonConvert.SerializeObject(projectQuery), new Exception());
						return response;
					}

				}
				else if (!string.IsNullOrEmpty(projectQuery.Contract))
				{
					_repository[currentRepository].Execute(session =>
					{
						p = session.Query<ProjectBusinessLevel>().Where(x => x.Contract == projectQuery.Contract).Join(session.Query<Projects>(), pbl => pbl.ProjectId, p => p.ProjectId, (pbl, p) => p).FirstOrDefault();

					});
					if (p == null)
					{
						response.Status = (int)Status.DOESNT_EXIST;
						logger.LogError(className, HelperBL.GetCurrentMethod(), "המערכת לא איתרה את הפרויקט", JsonConvert.SerializeObject(projectQuery), new Exception());
						return response;
					}
				}
				currLevel = p.CurrentLevelCode;
				projectModel = _mapper.Map<ProjectModel>(p);
				var currUserName = projectQuery.User.UserName.ToLower();
				//ממפ
				if (projectQuery.User.Role == (int)UserRoleEnum.MAMAP)
				{
					if (!(currUserName.Contains(projectModel.MamapUserName.ToLower())
						|| projectModel.MamapUserName.ToLower().Contains(currUserName)))
					{
						response.Status = (int)Status.NOT_ALLOWED;
						response.Messages.Add(new Message() { LogLevel = LogLevel.Error, Text = "אין הרשאה לפרויקט" });
						logger.LogError(className, HelperBL.GetCurrentMethod(), "אין הרשאה לפרויקט", JsonConvert.SerializeObject(projectQuery), new Exception());
						return response;
					}
				}
				//מנהפ
				else if (projectQuery.User.Role == (int)UserRoleEnum.MANHAP)
				{
					if (!(currUserName.Contains(projectModel.ManhapUserName.ToLower())
						|| projectModel.ManhapAllUserName.ToLower().Contains(currUserName)))
					{
						response.Status = (int)Status.NOT_ALLOWED;
						logger.LogError(className, HelperBL.GetCurrentMethod(), "אין הרשאה לפרויקט", JsonConvert.SerializeObject(projectQuery), new Exception());
						return response;
					}
				}
				//צוות מתכננים
				else if (projectQuery.User.Role == (int)UserRoleEnum.PLANNER)
				{
					if (!(currUserName.Contains(projectModel.PlannerAllUserName.ToLower())
						|| projectModel.PlannerAllUserName.ToLower().Contains(currUserName)))
					{
						response.Status = (int)Status.NOT_ALLOWED;
						logger.LogError(className, HelperBL.GetCurrentMethod(), "אין הרשאה לפרויקט", JsonConvert.SerializeObject(projectQuery), new Exception());
						return response;
					}
				}

				var activeLevels = GetProjectBusinessLevels(projectQuery.ProjectID,
					new List<int>() {
						(int)BusinessLevelControlStatusEnum.NOT_COMPLETED
					});
				List<LevelModel> currentLevels = new List<LevelModel>();
				string contracts = string.Empty;
				if (activeLevels != null)
				{
					foreach (var level in activeLevels)
					{
						if (level.LevelCode == currLevel)
						{
							currentLevels.Add(new LevelModel()
							{
								Code = level.LevelCode,
								Description = level.Description,
								LevelDate = level.StartBusinessLevelDate != null ? level.StartBusinessLevelDate.Value : DateTime.MinValue,
								Status = level.BusinessLevelControlStatusCode
							});
						}
						if (level.Contract != null && !contracts.Contains(level.Contract))
						{
							contracts += level.Contract + ",";
						}
					}
				}
				projectModel.ProjectLevels = currentLevels;
				projectModel.Contracts = contracts;
				response.Details = projectModel;
				response.Status = (int)Status.SUCCESS;
			}
			catch (Exception e)
			{
				response.Status = (int)Status.FAIL;
				response.Messages.Add(new Message() { LogLevel = LogLevel.Error, Text = Messages.TECHNICAL_ERROR_MSG });
				logger.LogError(className, HelperBL.GetCurrentMethod(), e.Message, JsonConvert.SerializeObject(projectQuery), e);

			}
			logger.LogInfo(className, HelperBL.GetCurrentMethod(), "END", JsonConvert.SerializeObject(projectQuery), JsonConvert.SerializeObject(response));
			return response;
		}
		private BaseViewModel<ProjectBusinessLevelsModel> GetProjectLevels(ProjectLevelQuery projectQuery)
		{

			logger.LogInfo(className, HelperBL.GetCurrentMethod(), "START", JsonConvert.SerializeObject(projectQuery));

			BaseViewModel<ProjectBusinessLevelsModel> response = new BaseViewModel<ProjectBusinessLevelsModel>();
			try
			{
				//handle levls status for 4'5'6 levels
				string wbs_num = string.Empty;
				string mnf = string.Empty;
				_repository[currentRepository].Execute(session =>
				{
					var p = session.Query<Projects>().Where(x => x.ProjectId == projectQuery.ProjectID).FirstOrDefault();
					wbs_num = p?.WbsNum;
					mnf = p?.Mnf;

				});
				if (projectQuery.CreateLevels.HasValue && projectQuery.CreateLevels.Value)
				{
					GetProjectLevelDocs(new ProjectLevelDocsQuery() { LevelCode = (int)BusinessLevelEnum.HESDEREI_TNUA, ProjectID = projectQuery.ProjectID, User = projectQuery.User, WBS = wbs_num }, true);
					GetProjectLevelDocs(new ProjectLevelDocsQuery() { LevelCode = (int)BusinessLevelEnum.STATUTORIKA, ProjectID = projectQuery.ProjectID, User = projectQuery.User, WBS = wbs_num }, true);
					GetProjectLevelDocs(new ProjectLevelDocsQuery() { LevelCode = (int)BusinessLevelEnum.MEKARKEIN, ProjectID = projectQuery.ProjectID, User = projectQuery.User, MNF = mnf }, true);
				}
				//end

				List<ProjectBusinessLevelsModel> results = new List<ProjectBusinessLevelsModel>();
				var levels = GetSPProjectLevelByProjectID(projectQuery.ProjectID);
				var contractsLevelsGroup = levels.Where(l => !string.IsNullOrEmpty(l.Contract)).GroupBy(l => l.LevelCode);
				results.AddRange(levels.Where(l => string.IsNullOrEmpty(l.Contract)));
				foreach (var contract in contractsLevelsGroup)
				{
					int levelStatus = (int)BusinessLevelControlStatusEnum.NOT_COMPLETED;
					string levelStatusDesc = BusinessLevelControlStatusDescEnum.NOT_COMPLETED;

					if (contract.All(x => x.BusinessLevelControlStatusCode == (int)BusinessLevelControlStatusEnum.COMPLETED))
					{
						levelStatus = (int)BusinessLevelControlStatusEnum.COMPLETED;
						levelStatusDesc = BusinessLevelControlStatusDescEnum.COMPLETED;
					}
					else if (contract.All(x => x.BusinessLevelControlStatusCode == (int)BusinessLevelControlStatusEnum.NOT_YET_STARTED))
					{
						levelStatus = (int)BusinessLevelControlStatusEnum.NOT_YET_STARTED;
						levelStatusDesc = BusinessLevelControlStatusDescEnum.NOT_YET_STARTED;
					}

					var contracts = new List<ContractModel>();

					foreach (var contractLevel in contract)
					{
						contracts.Add(new ContractModel()
						{
							ContractControlStatusCode = contractLevel.BusinessLevelControlStatusCode,
							ContractControlStatusDesc = contractLevel.BusinessLevelControlStatusDesc,
							ContractControlStatusDate = contractLevel.BusinessLevelStatusDate,
							ArcStatusDesc = contractLevel.PhaseApprovalArcDesc,
							ArcStatusCode = contractLevel.PhaseApprovalArcCode == null ? (int)PhaseApprovalStatusEnum.NOT_YET_STARTED : (int)contractLevel.PhaseApprovalArcCode,
							MamapStatusCode = contractLevel.PhaseApprovalMamapCode == null ? (int)PhaseApprovalStatusEnum.NOT_YET_STARTED : (int)contractLevel.PhaseApprovalMamapCode,
							MamapStatusDesc = contractLevel.PhaseApprovalMamapDesc,
							ContractName = contractLevel.Contract,
							InvalidContractDocsCount = contractLevel.InvalidDocsCount
						});
					}
					var level = contract.FirstOrDefault();
					level.Contracts = contracts;
					level.BusinessLevelControlStatusCode = levelStatus;
					level.BusinessLevelControlStatusDesc = levelStatusDesc;
					results.Add(level);
				}

				response.Data = results.OrderBy(x => x.LevelCode).ToList();
				response.Status = (int)Status.SUCCESS;
			}
			catch (Exception e)
			{
				response.Status = (int)Status.FAIL;
				logger.LogError(className, HelperBL.GetCurrentMethod(), e.Message, JsonConvert.SerializeObject(projectQuery), e);
			}
			logger.LogInfo(className, HelperBL.GetCurrentMethod(), "END", JsonConvert.SerializeObject(projectQuery), JsonConvert.SerializeObject(response));
			return response;
		}

		private List<ProjectBusinessLevelsModel> GetProjectBusinessLevels(string projectId, List<int> controlStatuses = null)
		{
			List<ProjectBusinessLevelsModel> levels = new List<ProjectBusinessLevelsModel>();

			_repository[currentRepository].Execute(session =>
			{
				var currlevels = session.Query<ProjectBusinessLevel>().Where(x =>
				x.ProjectId == projectId
				&& (controlStatuses == null ||
					controlStatuses.Contains(x.BusinessLevelControlStatusCode)))
						.Join(session.Query<BusinessLevel>(), pbl =>
							pbl.LevelCode, bl => bl.Code, (pbl, bl) => new { level = pbl, description = bl.Description }).ToList();
				foreach (var l in currlevels)
				{
					var level = _mapper.Map<ProjectBusinessLevelsModel>(l.level);
					level.Description = l.description;
					levels.Add(level);
				}

			});

			return levels;
		}

		private List<ProjectDocuments> GetlProjectSystemDocuments(ProjectLevelDocsQuery query)
		{
			List<ProjectDocuments> docs = null;

			_repository[currentRepository].Execute(session =>
			{
				var documents = session.Query<ProjectDocuments>().Where(x => x.ProjectId == query.ProjectID
				&& x.LevelCode == query.LevelCode);

				if (query.LevelCode == (int)BusinessLevelEnum.BAKARAT_ECHUT
				|| query.LevelCode == (int)BusinessLevelEnum.HESHBON_SOFI_KABLANI
				|| query.LevelCode == (int)BusinessLevelEnum.BITZUA)
				{
					documents = documents.Where(c => string.IsNullOrEmpty(query.Contract) || c.Contract == query.Contract);
				}
				if (documents != null)
				{
					docs = documents.ToList();
				}
			});

			return docs;
		}
		#endregion
		private void UpdateNotRelevantDocs(SaveBusinessLevelApprovalCommand command)
		{
			_repository[currentRepository].Execute(session =>
			{
				var notRelevantDocs = session.Query<ProjectDocuments>().Where(x =>
				x.ProjectId == command.ProjectID
				&& x.LevelCode == command.LevelCode
				&& x.DocumentStatusCode == null
				&& (x.SourceDocId == null || x.SourceDocId == string.Empty)).ToList();

				if (!string.IsNullOrEmpty(command.Contracts))
				{
					notRelevantDocs = session.Query<ProjectDocuments>().Where(x =>
					x.ProjectId == command.ProjectID
					&& x.LevelCode == command.LevelCode
					&& x.DocumentStatusCode == null
					&& (x.SourceDocId == null || x.SourceDocId == string.Empty)
					&& x.Contract == command.Contracts).ToList();
				}
				foreach (var doc in notRelevantDocs)
				{
					doc.DocumentStatusCode = (int)DocumentStausEnum.IRRELEVANT;
					Save(doc, session);
				}
			});
		}
		private void CompleteLevel(ProjectBusinessLevel level)
		{
			_repository[currentRepository].Execute(session =>
					   {

						   level.BusinessLevelControlStatusCode = (int)BusinessLevelControlStatusEnum.COMPLETED;
						   level.BusinessLevelStatusDate = DateTime.Now;
						   Save(level, session);

					   });
		}

		public bool IsActionExists(List<ActionModel> allowActions, int action)
		{
			return allowActions.Exists(x => x.Code == action);

		}
		private ProjectDocuments UpdateDocument(SaveDocumentCommand command)
		{
			try
			{
				ProjectDocuments doc = null;
				_repository[currentRepository].Execute(session =>
				{
					doc = session.Query<ProjectDocuments>().Where(x => x.Id == command.DocId).FirstOrDefault();
				});
				if (doc == null)
				{
					return doc;
				}

				InsertHistory(command, command.DocId.Value);
				doc.ProjectId = command.ProjectId;
				doc.LevelCode = command.LevelCode.Value;
				if (!string.IsNullOrEmpty(command.Contract))
				{
					doc.Contract = command.Contract;
				}
				if (command.RejectReasonCode.HasValue)
				{
					doc.ReasonRejectCode = command.RejectReasonCode.Value;
				}
				if (!string.IsNullOrEmpty(command.Discipline))
				{
					doc.Discipline = command.Discipline;
				}
				if (command.DocStatus.HasValue)
				{
					if (command.DocStatus.Value == (int)DocumentStausEnum.VALID || command.DocStatus.Value == (int)DocumentStausEnum.IRRELEVANT)
					{
						doc.ReasonRejectCode = null;
					}
					doc.DocumentStatusCode = command.DocStatus.Value;
					doc.ControlerName = command.User.DisplayName;
					doc.ControlDate = DateTime.Now;

					SendDocStatusToSOA(command);
				}

				if (!string.IsNullOrEmpty(command.ControlComments))
				{
					doc.ControlComments = command.ControlComments;
					doc.ManhapComments = null;
					doc.ControlDate = DateTime.Now;
					doc.DocumentStatusCode = command.DocStatus ?? (int)DocumentStausEnum.NOT_TESTED;
				}
				if (!string.IsNullOrEmpty(command.ManhapComments))
				{
					doc.ManhapComments = command.ManhapComments;
					doc.ManhapDate = DateTime.Now;
				}

				_repository[currentRepository].Execute(session =>
				{
					doc = Save(doc, session) as ProjectDocuments;
				});
				return doc;
			}
			catch (Exception ex)
			{
				throw ex;
			}

		}
		private ProjectDocuments AddDocument(SaveDocumentCommand command)
		{
			try
			{
				//Add value to ProjectDocuments table
				var doc = InsertDocument(command);

				InsertHistory(command, doc.Id);
				SendDocStatusToSOA(command);
				return doc;
			}
			catch (Exception e)
			{
				throw e;
			}

		}

		private void SendDocStatusToSOA(SaveDocumentCommand command)
		{
			try
			{
				var tableName = "";
				var parameters = new Dictionary<string, Tuple<object, IType>>
					{

						{ "LevelCode", new Tuple<object, IType>(command.LevelCode, NHibernateUtil.Int32) },
						{ "DocType", new Tuple<object, IType>(command.DocType, NHibernateUtil.String) }

					};
				var x = _repository[currentRepository].ExecuteSp<StringResultModel>("GetTableName", parameters).FirstOrDefault();
				if (x != null)
				{
					tableName = x.result;
				}


				if ((command.DocStatus == (int)DocumentStausEnum.VALID
					 || command.DocStatus == (int)DocumentStausEnum.INVALID)
					&& command.SourceDocId != null)
				{

					int SOADocStatus = (int)command.DocStatus == (int)DocumentStausEnum.VALID ?
																(int)SOADocumentStausEnum.VALID :
																(int)SOADocumentStausEnum.INVALID;
					SaveSoaDocumentStatusCommand soaCommand = new SaveSoaDocumentStatusCommand()
					{
						User = command.User,
						Contract = command.Contract?.Trim(),
						DocId = command.SourceDocId,
						DocumentStatusCode = SOADocStatus,
						//LevelCode = command.LevelCode.Value,
						ProjectID = command.ProjectId,
						TableName = tableName,
					};
					_SOAProjectsBL.Save<object, SaveSoaDocumentStatusCommand>(soaCommand);
				}
			}
			catch (Exception e)
			{
				throw e;
			}

		}

		private void InsertHistory(SaveDocumentCommand command, int docId)
		{
			History history = new History();
			int changeReasonCode = (int)ChangeReasonCodeEnum.UPDATE_DOC_STATUS;
			if (!command.DocStatus.HasValue)
			{
				if (command.RejectReasonCode.HasValue)
				{
					changeReasonCode = (int)ChangeReasonCodeEnum.UPDATE_REJECT_REASON;
				}
				else if (!string.IsNullOrEmpty(command.ControlComments))
				{
					changeReasonCode = (int)ChangeReasonCodeEnum.UPDATE_CONTROL_COMMENTS;
				}
				else if (!string.IsNullOrEmpty(command.ManhapComments))
				{
					changeReasonCode = (int)ChangeReasonCodeEnum.UPDATE_MANHAP_COMMENTS;
				}
			}
			history.ChangeReasonCode = changeReasonCode;
			history.CreateDate = DateTime.Now;
			history.ControlStatus = command.DocStatus;
			history.RejectReasonCode = command.RejectReasonCode;
			history.ControlComments = command.ControlComments;
			history.ManhapComments = command.ManhapComments;
			history.UpdatedBy = command.User.DisplayName;
			history.ProjectDocId = docId;
			try
			{
				_repository[currentRepository].Execute(session =>
				{
					Save(history, session);
				});
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}
		private ProjectDocuments InsertDocument(SaveDocumentCommand command)
		{
			try
			{
				ProjectDocuments document = new ProjectDocuments
				{
					ProjectId = command.ProjectId,
					LevelCode = command.LevelCode.Value,
					Contract = command.Contract?.Trim(),
					DocType = command.DocType,
					SourceDocId = command.SourceDocId,
					Discipline = command.Discipline
				};

				if (!string.IsNullOrEmpty(command.DocURL))
				{
					var urlSplt = command.DocURL.Split('/');
					document.DocName = urlSplt[^1];
				}

				document.ReasonRejectCode = command.RejectReasonCode;
				document.ControlComments = command.ControlComments;
				if (command.DocStatus.HasValue || (!string.IsNullOrEmpty(command.ControlComments)))
				{
					document.ControlDate = DateTime.Now;
				}
				if (command.DocStatus.HasValue)
				{
					document.ControlerName = command.User.DisplayName;
				}
				if (!string.IsNullOrEmpty(command.ManhapComments))
				{
					document.ManhapComments = command.ManhapComments;
					document.ManhapDate = DateTime.Now;
				}
				else
				{
					document.DocumentStatusCode = command.DocStatus ?? (int)DocumentStausEnum.NOT_TESTED;
				}
				_repository[currentRepository].Execute(session =>
				{
					var doc = session.Query<ProjectDocuments>().Where(d =>
					d.SourceDocId == document.SourceDocId
					&& d.ProjectId == document.ProjectId
					&& d.DocType == document.DocType
					&& d.Discipline == document.Discipline
					&& d.Contract == document.Contract).FirstOrDefault();
					if (doc == null)
						document = Save(document, session) as ProjectDocuments;
					else
					{
						document = doc;
					}
				});
				//Add value to history table
				return document;
			}
			catch (Exception e)
			{
				throw e;
			}

		}

		#region SP
		public IList<ProjectBusinessLevelsModel> GetSPProjectLevelByProjectID(string projectId)
		{
			var parameters = new Dictionary<string, Tuple<object, IType>>
			{
				{ "Project_ID", new Tuple<object, IType>(projectId, NHibernateUtil.String) }
			};
			return _repository[currentRepository].ExecuteSp<ProjectBusinessLevelsModel>("[dbo].[GetProjectLevelsSP]", parameters);
		}
		public IList<DocumentTypesModel> GetSPProjectDocTypes(string projectId, int levelCode)
		{
			var parameters = new Dictionary<string, Tuple<object, IType>>
			{
				{ "Project_ID", new Tuple<object, IType>(projectId, NHibernateUtil.String) },
				{ "LevelCode", new Tuple<object, IType>(levelCode, NHibernateUtil.Int16) }
			};
			return _repository[currentRepository].ExecuteSp<DocumentTypesModel>("[dbo].[GetProjectDocTypes]", parameters);
		}
		#endregion
	}
}
