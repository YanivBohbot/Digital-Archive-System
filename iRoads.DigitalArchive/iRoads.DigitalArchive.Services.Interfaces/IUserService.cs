using iRoads.DigitalArchive.Models.Command;
using iRoads.DigitalArchive.Models.Model;
using iRoads.DigitalArchive.Models.Query;
using Ness.Framework.Models.Viewmodel;
using System.Threading.Tasks;

namespace iRoads.DigitalArchive.Services.Interfaces
{
    public interface IUserService : IServiceBase
    {
        User GetByUserName(string value);
        User GetUserDetails();
    }
}
