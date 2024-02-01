using iRoads.DigitalArchive.Models.Command;
using iRoads.DigitalArchive.Models.Model;
using iRoads.DigitalArchive.Models.Query;
using iRoads.DigitalArchive.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;
using Ness.Framework.Models.Viewmodel;

namespace iRoads.DigitalArchive.Web.Controllers
{
    [Route("api/Project")]
    [ApiController]
    public class ProjectController : BaseController
    {
        private IProjectService service;

        public ProjectController(IProjectService s)
        {
            this.service = s;
        }

        //2.5.6.2.1 service: שליפת פרטי פרויקט 
        [HttpGet]
        [Route("ProjectDetails")]
        public IActionResult GetProjectDetails([FromQuery]ProjectQuery query)
        {
            var vm = service.Get<BaseViewModel<ProjectModel>, ProjectQuery>(query);
            return Ok(vm);
        }

        //2.5.6.2.2 service: שליפת שלבי פרויקט
        [HttpGet]
        [Route("ProjectLevels")]
        public IActionResult GetProjectLevels([FromQuery]ProjectLevelQuery query)
        {
            var vm = service.Get<BaseViewModel<ProjectBusinessLevelsModel>, ProjectLevelQuery>(query);
            return Ok(vm);
        }

        //2.5.6.2.3 service: שליפת מסמכים לשלב בפרויקט
        [HttpGet]
        [Route("ProjectLevelDocs")]
        public IActionResult GetProjectLevelDocs([FromQuery] ProjectLevelDocsQuery query)
        {
            var vm = service.Get<BaseViewModel<DocumentModel>, ProjectLevelDocsQuery>(query);
            return Ok(vm);
        }

        //2.5.6.2.4 service: שליפת פעולות מותרות לתפקיד
        [HttpGet]
        [Route("RoleAllowActions")]
        public IActionResult GetRoleAllowActions([FromQuery] RoleAllowActionsQuery query)
        {
            var vm = service.Get<BaseViewModel<RoleAllowActionsModel>, RoleAllowActionsQuery>(query);
            return Ok(vm);
        }

        //2.5.6.2.5 service: אישור שלב
        [HttpPost]
        [Route("LevelApproval")]
        public IActionResult PostLevelApproval([FromBody] SaveBusinessLevelApprovalCommand c)
        {
            var vm = service.Save<BaseViewModel<ProjectBusinessLevelsModel>, SaveBusinessLevelApprovalCommand>(c);
            return Ok(vm);
        }

        //2.5.6.2.6 service: אישור תיק
        [HttpPost]
        [Route("CaseApproval")]
        public IActionResult PostCaseApproval([FromBody] SaveProjectCaseApprovalCommand c)
        {
            var vm = service.Save<BaseViewModel, SaveProjectCaseApprovalCommand>(c);
            return Ok(vm);
        }

        //2.5.6.2.7 service:שמירת פרטי מסמך 
        [HttpPost]
        [Route("SaveDocument")]
        public IActionResult PostSaveDocument([FromBody]SaveDocumentCommand c)
        {
            var vm = service.Save<BaseViewModel<DocumentModel>, SaveDocumentCommand>(c);
            return Ok(vm);
        }

        //2.5.4.2.7 service:עדכון פרטי פרויקט 
        [HttpPost]
        [Route("UpdateProjectDetails")]
        public IActionResult PostUpdateProjectDetails([FromBody]UpdateProjectCommand c)
        {
            var vm = service.Save<BaseViewModel, UpdateProjectCommand>(c);
            return Ok(vm);
        }


        //2.5.6.2.8 service: שליפת היסטורית מסמך
        [HttpGet]
        [Route("DocumentHistory")]
        public IActionResult GetDocumentHistory([FromQuery]DocumentHistoryQuery query)
        {
            var vm = service.Get<BaseViewModel<DocumentHistoryModel>,DocumentHistoryQuery>(query);
            return Ok(vm);
        }
    }
}