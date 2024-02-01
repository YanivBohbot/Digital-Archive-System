using System.Net;
using System.Threading.Tasks;

namespace iRoads.DigitalArchive.IdentificationApp.Helpers
{
    public interface INetworkHttpClient
    {
        public static string baseUrl;
        Task<string> ReadAsync(string route);

        //Task<HttpResponseMessage> PostJsonAsync<T>(T fileData, string route) where T : class;
        // Task<bool> PostJsonAsync<T>(T data, string route)
        //    where T : class;


        Task<string> PostJson<T>(T data, string route)
            where T : class;

        Task<string> PostDirectJson<T>(T data, string route)
            where T : class;
        CookieCollection GetCookies();
    }
}
