using iRoads.DigitalArchive.Models.Command;
using iRoads.DigitalArchive.Models.Model;
using iRoads.DigitalArchive.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;
using Ness.Framework.Models.Viewmodel;

namespace iRoads.DigitalArchive.Web.Controllers
{
    [Route("api/Role")]
    [ApiController]
    public class RoleController : Controller
    {

        private readonly IUserService service;
        private readonly IConfiguration configuration;


        public RoleController(IUserService userService, IConfiguration configuration)
        {
            service = userService;
            this.configuration = configuration;
        }

        [HttpPost]
        public IActionResult GetRole([FromBody] RoleCommand c)
        {
            IActionResult response;
            var vm = service.Get<BaseViewModel<User>, RoleCommand>(c);

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
