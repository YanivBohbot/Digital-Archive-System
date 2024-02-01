using Ness.Framework.BusinessLogic;
using System.Threading.Tasks;

namespace iRoads.DigitalArchive.BusinessLogic.Interfaces
{
    public interface IMailBL : IBaseBL
    {
        Task Send();
        string SendOtp(string UserName);
        void MailComposer(Ness.Framework.Razor.Models.BaseModel model);
        Ness.Framework.Razor.Models.BaseModel Composer<T>(int UserName, string password);
    }
}
