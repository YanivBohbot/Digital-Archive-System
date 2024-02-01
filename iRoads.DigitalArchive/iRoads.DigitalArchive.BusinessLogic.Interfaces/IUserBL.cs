using iRoads.DigitalArchive.Models.Command;
using iRoads.DigitalArchive.Models.Model;
using iRoads.DigitalArchive.Models.Query;
using Ness.Framework.BusinessLogic;
using Ness.Framework.Models.Viewmodel;
using System.Threading.Tasks;

namespace iRoads.DigitalArchive.BusinessLogic.Interfaces
{
    public interface IUserBL : IBaseBL
    {
        User GetCurrentUser();
        User GetByUserName(string value);
    }
}
