
using iRoads.DigitalArchive.Models.Query;
using iRoads.DigitalArchive.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Ness.Framework.Core.Utils;
using Ness.Framework.Models.Viewmodel;

namespace iRoads.DigitalArchive.Web.Controllers
{
    //[Authorize(Policy = "TokenPolicy")]
    [Route("api/Lookup")]
    public class LookupController : BaseController
    {
        private readonly ILookupService service;
        public LookupController(ILookupService lookupService)
        {
            service = lookupService;
        }
        // GET api/<controller>
        [HttpGet]
        public IActionResult Get()
        {
            return Ok();
        }

        [HttpPost]
        [Route("Get")]
        public async Task<IActionResult> Get([FromBody] LookupsQuery query)
        {
            string cacheKey = string.Format("Lookups.{0}.{1}", "All", string.Join(",", query.lookupsList));
            var vm = this.Cache(cacheKey);
            if (vm == null)
            {
                vm = await service.GetAsync<LookupViewModel<object>, IList<string>>(query.lookupsList);
                vm.Cache(cacheKey, DateTime.Now.Now().AddMinutes(60));
            }
            return Ok(vm);
        }
    }
}
