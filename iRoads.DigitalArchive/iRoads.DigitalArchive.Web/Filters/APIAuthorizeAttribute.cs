using System.Net;
using System.Web.Http.Controllers;
using System.Web.Http.Filters;
using DocumentFormat.OpenXml.InkML;
using iRoads.DigitalArchive.Models.Model;
using iRoads.DigitalArchive.Services.Interfaces;

namespace iRoads.DigitalArchive.Web.Filters
{
    public class APIAuthorizeAttribute : AuthorizationFilterAttribute
    {
        private IUserService _userService;
        public APIAuthorizeAttribute(IUserService userService)
        {
            _userService = userService;
        }
        public override void OnAuthorization(HttpActionContext actionContext)
        {
            User userData = _userService.GetUserDetails();
            if (userData == null)
            {
                HandleUnAuthorized(actionContext);
            }
            return;

        }

        private void HandleUnAuthorized(HttpActionContext actionContext)
        {
            actionContext.Response = new HttpResponseMessage(HttpStatusCode.Unauthorized);
        }
    }
}
