using DocumentFormat.OpenXml.InkML;
using iRoads.DigitalArchive.BusinessLogic;
using iRoads.DigitalArchive.BusinessLogic.Interfaces;
using iRoads.DigitalArchive.Models.Command;
using iRoads.DigitalArchive.Models.Model;
using iRoads.DigitalArchive.Models.Query;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Net;
using System.Text;
namespace iRoads.DigitalArchive.Web.Filters
{
    public class APISetUserFilterAttribute : IActionFilter
    {


        public void OnActionExecuted(ActionExecutedContext context)
        {
            //throw new NotImplementedException();
        }

        public void OnActionExecuting(ActionExecutingContext actionContext)
        {

			Ness.Framework.Core.Interfaces.Log.ILogger logger = (Ness.Framework.Core.Interfaces.Log.ILogger)actionContext.HttpContext.RequestServices.GetService(typeof(Ness.Framework.Core.Interfaces.Log.ILogger));
			if (actionContext.ActionArguments != null && actionContext.ActionArguments.Count == 1)
            {

                var token = actionContext.HttpContext.Request.Headers["Authorization"].FirstOrDefault()?.Split(" ").Last();
                if (string.IsNullOrEmpty(token))
                {
                    if (!actionContext.HttpContext.Request.Path.Value.Contains("api/User"))
					{
						if (logger != null)
						{
							logger.LogError("APISetUserFilterAttribute", "OnActionExecuting", "ERROR - token is null", string.Empty, null);
						}
						actionContext.Result = new JsonResult(new { message = "Unauthorized" }) { StatusCode = StatusCodes.Status401Unauthorized };
					}

					return;
                }
                if (logger != null)
                {
                    logger.LogInfo("APISetUserFilterAttribute", "OnActionExecuting", "token is: " + token, string.Empty, null);
                }

                User user = attachAccountToContext(actionContext.HttpContext, token);
                if (user == null)
                {
                    actionContext.Result = new JsonResult(new { message = "Unauthorized" }) { StatusCode = StatusCodes.Status401Unauthorized };
                    return;
                }
                var requestParam = actionContext.ActionArguments.First();
                var cmd = requestParam.Value as BaseCommand;
                if (cmd != null)
                {
                    cmd.User = user;

                }

                var cmdSave = requestParam.Value as BaseCommandSave<List<SOAProjectModel>, int>;
                
                if (cmdSave != null)
                {
                    cmdSave.User = user;

                }
                var cmdSave2 = requestParam.Value as BaseCommandSave<List<SOABusinessLevelsModel>, int>;
                if (cmdSave2 != null)
                {
                    cmdSave2.User = user;

                }
                var qry = requestParam.Value as BaseQuery;
                if (qry != null)
                {
                    qry.User = user;

                }

            }
        }





        private User attachAccountToContext(HttpContext context, string token)
        {
			Ness.Framework.Core.Interfaces.Log.ILogger logger = (Ness.Framework.Core.Interfaces.Log.ILogger)context.RequestServices.GetService(typeof(Ness.Framework.Core.Interfaces.Log.ILogger));
			try
            {
                var _configuration = context.RequestServices.GetService<IConfiguration>();

                var tokenHandler = new JwtSecurityTokenHandler();
                var key = Encoding.ASCII.GetBytes(_configuration["Jwt:Key"]);
                tokenHandler.ValidateToken(token, new TokenValidationParameters
                {
                    ValidateIssuerSigningKey = true,
                    IssuerSigningKey = new SymmetricSecurityKey(key),
                    ValidateIssuer = true,
                    ValidateAudience = true,
                    // set clockskew to zero so tokens expire exactly at token expiration time (instead of 5 minutes later)
                    ClockSkew = TimeSpan.Zero,
                    ValidIssuer = _configuration["Jwt:Issuer"],
                    ValidAudience = _configuration["Jwt:Audience"],
                }, out SecurityToken validatedToken);

                var jwtToken = (JwtSecurityToken)validatedToken;
                var userName = jwtToken.Claims.First(x => x.Type.ToLower().Contains("NameIdentifier".ToLower()));
                var role = jwtToken.Claims.First(x => x.Type.ToLower().Contains("Role".ToLower()));
                var displayName = jwtToken.Claims.First(x => x.Type.ToLower().Contains("Name".ToLower()));
                //var idNumber = jwtToken.Claims.First(x => x.Type.ToLower().Contains("SerialNumber".ToLower()));
                // attach user to context on successful jwt validation
                User user = new User()
                {
                    UserName = userName.Value.ToString(),
                    Role = Int32.Parse(role.Value.ToString()),
                    DisplayName = displayName.Value.ToString()
                    //IdNumber = idNumber.Value.ToString()
                };
                return user;

            }
            catch (Exception e)
            {
				if (logger != null)
				{
					logger.LogError("APISetUserFilterAttribute", "attachAccountToContext", "ERROR", string.Empty, e);
				}
				return null;
                // do nothing if jwt validation fails
                // account is not attached to context so request won't have access to secure routes
            }
        }
    }
}
