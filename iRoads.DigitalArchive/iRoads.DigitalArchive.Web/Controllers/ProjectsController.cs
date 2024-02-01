using iRoads.DigitalArchive.Models.Command;
using iRoads.DigitalArchive.Models.Model;
using iRoads.DigitalArchive.Models.Query;
using iRoads.DigitalArchive.Services.Interfaces;
using iRoads.DigitalArchive.Web.Filters;
using Microsoft.AspNetCore.Mvc;
using Ness.Framework.Models.Viewmodel;

namespace iRoads.DigitalArchive.Web.Controllers
{
    [Route("api/Projects")]
    [ApiController]
    public class ProjectsController : BaseController
    {
        private IProjectsService service;

        public ProjectsController(IProjectsService s)
        {
            this.service = s;
        }

        //2.5.5.2.1 service: שליפת פרויקטים 
        [HttpGet]
        [Route("Projects")]
        public IActionResult GetProjects([FromQuery] ProjectsQuery query)
        {
            var vm = service.Get<BaseViewModel<ProjectsModel>, ProjectsQuery>(query);
            return Ok(vm);
        }
        
        [HttpGet]
        [Route("ControlManagers")]
        public IActionResult GetControlManagers([FromQuery] ControlManagersQuery query)
        {
            var vm = service.Get<BaseViewModel<string>, ControlManagersQuery>(query);
            return Ok(vm);
        }
        [HttpPost]
        [Route("GenerateReport")]
        public IActionResult GetUserDetails([FromQuery] GenerateReportCommand query)
        {
            var vm = service.Save<BaseViewModel, GenerateReportCommand>(query);
            return Ok(vm);
        }

        [HttpGet]
        [Route("GetCombos")]
        public IActionResult GetCombos([FromQuery] BaseQuery query)
        {
            var vm = service.Get<BaseViewModel, BaseQuery>(query);
            return Ok(vm);
        }

        //2.5.4.2.2 service: טיפול במועדפים
        [HttpPost]
        [Route("UpdateFavoriteProject")]
        public IActionResult UpdateFavoriteProject([FromBody] FavoriteProjectItem command)
        {
            var vm = service.Save<BaseViewModel, FavoriteProjectItem>(command);
            return Ok(vm);
        }

    }
}
