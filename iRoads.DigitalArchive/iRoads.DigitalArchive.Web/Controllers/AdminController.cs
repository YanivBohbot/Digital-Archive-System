using Microsoft.AspNetCore.Mvc;
using Ness.Framework.Core.Utils;

namespace iRoads.DigitalArchive.Web.Controllers
{
    public class AdminController : BaseController
    {
        public AdminController()
        {
        }

        [HttpGet]
        [Route("DeleteCache/")]
        public IActionResult ClearCache()
        {
            CacheHelper.Clear();
            return Ok();
        }
    }
}
