using iRoads.DigitalArchive.Models.Model;
using Microsoft.AspNetCore.Mvc;
using Ness.Framework.Core.Utils;


namespace iRoads.DigitalArchive.Web.Controllers
{
    public class BaseController : Controller
    {
        protected User user { get; set; }

        public BaseController()
        {
            //user = Ness.Framework.Core.Web.HttpContext.Current.Session.Get<User>("user");

        }

    }
}
