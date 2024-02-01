using AutoMapper;
using iRoads.DigitalArchive.BusinessLogic.Interfaces;
using iRoads.DigitalArchive.Entities.Site;
using iRoads.DigitalArchive.Models.Command;
using iRoads.DigitalArchive.Models.Enums;
using iRoads.DigitalArchive.Models.Model;
using Ness.DataAccess.Repository.CrossPlatform;
using Ness.Framework.BusinessLogic;
using Ness.Framework.Core.Interfaces.Log;
using Newtonsoft.Json;
using System;

namespace iRoads.DigitalArchive.BusinessLogic
{
    public class ActionLogBL : BaseBL, IActionLogBL
    {
        readonly ILogger logger;
        readonly string className;

        public ActionLogBL(IRepository repository, IMapper mapper, ILogger logger) : base(repository, mapper)
        {
            this.logger = logger;
            this.className = GetType().Name;
        }

        /*
         * 2.6.9
         */
        public ResultModel SaveActionLog(ActionLogCommand command)
        {
            logger.LogInfo(className, HelperBL.GetCurrentMethod(), "START", JsonConvert.SerializeObject(command));
            command.UserName = command.User.UserName;
            ResultModel result = new ResultModel
            {
                ErrorCode = (int)Status.SUCCESS
            };
            try
            {
               
                _repository[currentRepository].ExecuteTransaction(session =>
                {
                    Save<ActionLogCommand, Logs>(command, session);
                });
            }
            catch (Exception e)
            {
                result.ErrorCode = (int)Status.FAIL;
                result.ErrorMsg = e.Message;
                logger.LogError(className, HelperBL.GetCurrentMethod(), e.Message, JsonConvert.SerializeObject(command), e);
            }

            logger.LogInfo(className, HelperBL.GetCurrentMethod(), "END", JsonConvert.SerializeObject(command));

            return result;
        }

    }
}
