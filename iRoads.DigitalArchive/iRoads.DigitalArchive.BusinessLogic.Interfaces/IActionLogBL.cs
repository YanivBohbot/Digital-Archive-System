using iRoads.DigitalArchive.Models.Command;
using iRoads.DigitalArchive.Models.Model;
using Ness.Framework.BusinessLogic;

namespace iRoads.DigitalArchive.BusinessLogic.Interfaces
{
    public interface IActionLogBL: IBaseBL
    {
        ResultModel SaveActionLog(ActionLogCommand command);
        

    }
}
