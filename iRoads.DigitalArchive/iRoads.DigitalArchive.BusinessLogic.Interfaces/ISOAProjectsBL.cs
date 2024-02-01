using Ness.Framework.BusinessLogic;
using System.Threading.Tasks;

namespace iRoads.DigitalArchive.BusinessLogic.Interfaces
{
    public interface ISOAProjectsBL: IBaseBL
    {
        public Task SendAlertMailToManhap();
        public Task SendAlertMailOfControlEnding();
    }
}
