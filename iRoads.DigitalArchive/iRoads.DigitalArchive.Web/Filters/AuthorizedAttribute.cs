using iRoads.DigitalArchive.BusinessLogic.Interfaces;
using iRoads.DigitalArchive.Models.Model;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System.Web.Http.Results;

namespace iRoads.DigitalArchive.Web.Filters
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
    public class AuthorizedAttribute : Attribute, IAuthorizationFilter, IAuthorizationRequirement
    {
        public void OnAuthorization(AuthorizationFilterContext context)
        {

            var userBL = context.HttpContext.RequestServices.GetService(typeof(IUserBL)) as IUserBL;
            var account = context.HttpContext.Items["User"];
            if (account == null)
            {
                // not logged in
                context.Result = new JsonResult(new { message = "Unauthorized" }) { StatusCode = StatusCodes.Status401Unauthorized };
            }
        }
    }
}
