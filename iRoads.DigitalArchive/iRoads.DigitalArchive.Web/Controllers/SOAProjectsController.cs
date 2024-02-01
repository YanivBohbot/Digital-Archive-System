using iRoads.DigitalArchive.Models.Command;
using iRoads.DigitalArchive.Models.Model;
using iRoads.DigitalArchive.Models.Query;
using iRoads.DigitalArchive.Services.Interfaces;
using iRoads.DigitalArchive.Web.Filters;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace iRoads.DigitalArchive.Web.Controllers
{
    [Route("api/SoaProjects")]
    [ApiController]
    public class SOAProjectsController : BaseController
    {

        private readonly ISOAProjectsService service;

        public SOAProjectsController(ISOAProjectsService s)
        {
            this.service = s;
        }

        //2.6.1 service: insert or update SOA projects
        [HttpPost]
        [Route("Save")]
        public IActionResult InsertOrUpdateProjects([FromBody] SaveSoaProjectsCommand c)
        {
            var vm = service.Save<ResultModel, SaveSoaProjectsCommand>(c);
            return Ok(vm);
        }

        //2.6.2 service: post project levels
        [HttpPost]
        [Route("ProjectLevels")]
        public IActionResult InsertOrUpdateProjectLevels([FromBody] SaveSoaProjectLevelsCommand c)
        {
            var vm = service.Save<ResultModel, SaveSoaProjectLevelsCommand>(c);
            return Ok(vm);
        }

        //2.6.3 service: שליפת מסמכים לשלב בפרויקט SOA
        [HttpGet]
        [Route("LevelDocs")]
        public IActionResult GetLevelDocs([FromQuery]LevelDocsQuery q)
        {
            var vm = service.Get<LevelDocsModel, LevelDocsQuery>(q);
            return Ok(vm);
        }

        //2.6.4 service: post case approval
        [HttpPost]
        [Route("CaseApproval")]
        public IActionResult PostCaseApproval([FromBody] SaveCaseApprovalCommand c)
        {
            var vm = service.Save<ResultModel, SaveCaseApprovalCommand>(c);
            return Ok(vm);
        }

        //2.6.5 service: post level approval
        [HttpPost]
        [Route("LevelApproval")]
        public IActionResult PostLevelApproval([FromBody] SaveLevelApprovalCommand c)
        {
            var vm = service.Save<ResultModel, SaveLevelApprovalCommand>(c);
            return Ok(vm);
        }

        //2.6.8 service: update soa document status
        [HttpPost]
        [Route("UpdateSoaDoc")]
        public IActionResult UpdateSoaDocumentStatus([FromBody] SaveSoaDocumentStatusCommand c)
        {
            var vm = service.Save<ResultModel, SaveSoaDocumentStatusCommand>(c);
            return Ok(vm);
        }
        
    }
}
