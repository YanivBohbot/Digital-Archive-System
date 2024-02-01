using Microsoft.AspNetCore;

namespace iRoads.DigitalArchive.Web
{
    public class Program
    {
        public static void Main(string[] args)
        {
            BuildWebHost(args).Run();
        }

        public static IWebHost BuildWebHost(string[] args) =>
            WebHost.CreateDefaultBuilder(args)
                .UseStartup<Startup>()
                .UseKestrel().UseIIS()
                .ConfigureAppConfiguration(cfg =>
                {
                    cfg.AddEnvironmentVariables();
                })
                .Build();
    }
}
