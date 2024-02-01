using iRoads.DigitalArchive.Models.Command;
using iRoads.DigitalArchive.Models.Model;
using iRoads.DigitalArchive.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace iRoads.DigitalArchive.Web.Controllers
{
    [Route("api/ActionLog")]
    [ApiController]
    public class ActionLogController : BaseController
    {

        private IActionLogService service;

        public ActionLogController(IActionLogService s)
        {
            this.service = s;
        }

        //2.6.9 
        [HttpPost]
        [Route("SaveLog")]
        public IActionResult SaveActionLog([FromBody] ActionLogCommand c)
        {
            var vm = service.Save<ResultModel, ActionLogCommand>(c);
            return Ok(vm);
        }

        //2.6.10 
        [HttpPost]
        [Route("SaveLogIntoFile")]
        public IActionResult SaveActionLogIntoFile([FromBody] ActionLogCommand c)
        {
            var vm = service.Save<ResultModel, ActionLogCommand>(c);
            return Ok(vm);
        }

    }
}
