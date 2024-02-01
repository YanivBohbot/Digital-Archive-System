using iRoads.DigitalArchive.Models.Command;
using iRoads.DigitalArchive.Models.Model;
using iRoads.DigitalArchive.Models.Query;
using iRoads.DigitalArchive.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using Ness.Framework.Models.Viewmodel;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace iRoads.DigitalArchive.Web.Controllers
{
    [Route("api/User")]
    public class LoginController : BaseController
    {
        private readonly IUserService service;
        private readonly IConfiguration configuration;


        public LoginController(IUserService userService, IConfiguration configuration)
        {
            service = userService;
            this.configuration = configuration;
        }

        [AllowAnonymous]
        [HttpPost]
        public IActionResult Login([FromBody]LoginCommand c)
        {
            IActionResult response;
            var vm = service.Get<BaseViewModel<User>, LoginCommand>(c);

            var user = vm.Details;

            if (user != null)
            {
                
                response = Ok(new { Details = user });
            }
            else
            {
                switch (vm.Status)
                {
                    case 1:
                        response = BadRequest(new { details = vm.Messages.FirstOrDefault() });
                        break;
                    case 2:
                        response = NotFound(new { details = vm.Messages.FirstOrDefault() });
                        break;
                    case 3:
                        response = NotFound(new { details = vm.Messages.FirstOrDefault() });
                        break;
                    default:
                        response = Unauthorized(new { details = vm.Messages.FirstOrDefault() });
                        break;
                }
            }




            return response;
        }

        
       

    }


}

