using Newtonsoft.Json.Linq;
using ConfigurationManager = System.Configuration.ConfigurationManager;
using Microsoft.AspNetCore.Mvc;
using Ness.Framework.Core.WebApi.Exceptions;
using System.Net;

using iRoads.DigitalArchive.Models.Model;
using iRoads.DigitalArchive.DataAccess.Networking;
using iRoads.DigitalArchive.Services.Interfaces;

namespace iRoads.DigitalArchive.Web.Controllers
{
    [Route("api/Invoker")]
    public class InvokerController : Controller
    {
        protected INetworkHttpClient networkHttpClient;
        private IUserService _userService;

        public InvokerController(INetworkHttpClient networkHttp, IUserService userService)
        {
            networkHttpClient = networkHttp;
            _userService = userService;
        }

        [HttpGet]
        public IActionResult Get([FromQuery] string method, [FromQuery] string param = "")
        {
            User userData = _userService.GetUserDetails();
            if (userData == null)
            {
                return Unauthorized();
            }
            if (string.IsNullOrEmpty(method))
            {
                return BadRequest();
            }
            try
            {
                var data = networkHttpClient.ReadAsync("api/" + method + "/?" + param).Result;
                return Ok(data);
            }
            catch (HttpRequestException ex)
            {
                throw GetResponseExecption(ex);
            }
        }




       
        [HttpPost]
        public IActionResult Post(string method, [FromBody] JObject value)
        {
            User userData = _userService.GetUserDetails();
            if (userData == null)
            {
                return Unauthorized();
            }
            if (string.IsNullOrEmpty(method))
            {
                return BadRequest();
            }
            try
            {
                var data = networkHttpClient.PostJson<JObject>(value, method).Result;
                return Ok(data);
            }
            catch (HttpRequestException ex)
            {
                throw GetResponseExecption(ex);
            }
        }

        private HttpException GetResponseExecption(HttpRequestException ex)
        {
            HttpResponseMessage resp = new HttpResponseMessage
            {
                StatusCode = (HttpStatusCode)Enum.ToObject(typeof(HttpStatusCode), ex.StatusCode),
                Content = new StringContent(ex.Message)
            };
            throw new System.Web.Http.HttpResponseException(resp);
        }

        [HttpGet]
        [Route("GetInstrumentationKey")]
        public IActionResult GetInstrumentationKey()
        {
            var key = ConfigurationManager.AppSettings["APPINSIGHTS_INSTRUMENTATIONKEY"].ToString();
            return Ok(key);
        }

        [HttpGet]
        [Route("GetAppCode")]
        public IActionResult GetAppCode()
        {
            var key = ConfigurationManager.AppSettings["appCode"].ToString();
            return Ok(key);
        }


    }


}
