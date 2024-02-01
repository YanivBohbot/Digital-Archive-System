using System.Net;
using Ness.Framework.Core.Utils;
using Ness.Framework.Core.WebApi.Exceptions;
using System.Net.Http.Headers;
using Microsoft.Extensions.Configuration;
using System.Net.Http.Json;
using System;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;
using System.Text;

namespace iRoads.DigitalArchive.IdentificationApp.Helpers
{


    public class NetworkHttpClient : INetworkHttpClient
    {
        public static readonly string GeneralError = "שגיאה. נא לפנות למנהל המערכת.";
        private readonly TimeSpan TimeOut = TimeSpan.FromSeconds(600);
        private HttpClient client;
        private CookieContainer Cookies;
        private HttpResponseHeaders headers;
        private readonly string baseUrl; 
        public NetworkHttpClient(IConfiguration configuration)
        {
            baseUrl = configuration["BaseUrl"];
						//Cookies = new CookieContainer();
						//var cookie = HttpContext.Current.Session.Get<Cookie>("cookies");
						//if (cookie != null)
						//    Cookies.Add(new Uri(baseUrl), new Cookie(cookie.Name, cookie.Value));
						//HttpClientHandler httpClientHandler = new HttpClientHandler();
						//httpClientHandler.CookieContainer = Cookies;
						//httpClientHandler.UseCookies = true;

						//client = new HttpClient(httpClientHandler);
						client = new HttpClient();
            //var token = HttpContext.Current.Session.Get<string>("SessionID");
            //if (!string.IsNullOrEmpty(token))
            //    client.DefaultRequestHeaders.Add("Authorization", "Basic " + token);
            client.BaseAddress = new Uri(baseUrl);
            client.Timeout = TimeOut;
        }

        public async Task<string> ReadAsync(string route)
        {
            HttpResponseMessage response = await client.GetAsync(route);
            if (response.IsSuccessStatusCode)
            {
                headers = response.Headers;
                var res = response.Content.ReadAsStringAsync().Result;
                return res;
            }
            else
            {
                string msg = response.Content.ReadAsStringAsync().Result;
                var ex = new HttpException((int)response.StatusCode, msg);
                throw ex;
            }
        }

        public async Task<string> PostJson<T>(T data, string route)
            where T : class
        {
            var response = await client.PostAsync(string.Format("{0}{1}", baseUrl, "api/" + route), 
                 JsonContent.Create(data));


            if (response.IsSuccessStatusCode)
            {
                headers = response.Headers;
                var res = response.Content.ReadAsStringAsync().Result;
                return res;
            }
            else
            {
                string msg = response.Content.ReadAsStringAsync().Result;
                var ex = new HttpException((int)response.StatusCode, msg);
                throw ex;
            }

        }

        public async Task<string> PostDirectJson<T>(T data, string route)
            where T : class
        {
           
            var stringPayload = JsonConvert.SerializeObject(data);

            // Wrap our JSON inside a StringContent which then can be used by the HttpClient class
            var httpContent = new StringContent(stringPayload, Encoding.UTF8, "application/json");

            //var httpClient = new HttpClient();

// Do the actual request and await the response
            var httpResponse = await client.PostAsync( route, httpContent);

            if (httpResponse.IsSuccessStatusCode)
            {
                headers = httpResponse.Headers;
                var res = httpResponse.Content.ReadAsStringAsync().Result;
                return res;
            }
            else
            {
                string msg = httpResponse.Content.ReadAsStringAsync().Result;
                var ex = new HttpException((int)httpResponse.StatusCode, msg);
                throw ex;
            }


        }



        public CookieCollection GetCookies()
        {
            return Cookies.GetCookies(new Uri(baseUrl));
        }

        public HttpResponseHeaders GetResponseHeaders()
        {
            return headers;
        }
    }
}