
using System.Text;
using Castle.MicroKernel.Resolvers.SpecializedResolvers;
using Castle.Windsor;
using Castle.Windsor.Installer;
using Castle.Windsor.MsDependencyInjection;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Ness.Framework.Core.Utils;
using Ness.Framework.Models.Viewmodel;
using AutoMapper;
using Ness.Framework.Core.Interfaces.Log;
using Ness.Framework.Logger;
using iRoads.DigitalArchive.BusinessLogic.Interfaces;

namespace iRoads.DigitalArchive.AlertFinishedProjects.Service
{
    class Program
    {
        private static IConfigurationRoot Configuration;
        private static IWindsorContainer _container;
        private static IServiceProvider ServiceProvider;
        private static ILogger Logger;
        private static string className;

        public static async Task Main(string[] args)
        {

            Logger = _container.Resolve<ILogger>();
            className = " iRoads.DigitalArchive.AlertManhap.Service.Main";
            Logger.LogInfo(className, "Main", "START", string.Empty);


            Console.WriteLine(DateTime.Now.Now() + ": Start Sending Mail Service");
            Init();
            await SendMail();

            Console.WriteLine(DateTime.Now.Now() + ": End Sending Mail Service");
            Logger.LogInfo(className, "Main", "END", string.Empty);
        }

        private static void Init()
        {
            var builder = new ConfigurationBuilder()
               .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true);
            Configuration = builder.Build();

            IServiceCollection services = new ServiceCollection();

            services.AddSingleton<IConfiguration>(Configuration);
            services.AddSingleton<ILogger, FileLogger>();
            services.AddDistributedMemoryCache();
            services.AddMemoryCache();


            Encoding.RegisterProvider(CodePagesEncodingProvider.Instance);

            //services.AddAutoMapper(c =>
            //{
            //    c.AddProfile(new ViewModelToDomainMappingProfile());
            //    c.AddProfile(new DomainToViewModelMappingProfile());

            //});

            _container = new WindsorContainer();
            try
            {
                _container.Install(FromAssembly.Named("iRoads.DigitalArchive.BusinessLogic.Bootstrapper"));
            }
            catch (Exception e)
            {
                var s = e;
            }

            _container.Kernel.Resolver.AddSubResolver(new CollectionResolver(_container.Kernel, true));
            ServiceProvider = WindsorRegistrationHelper.CreateServiceProvider(_container, services);
            var appBuilder = new ApplicationBuilder(ServiceProvider);
            services.AddSingleton<IApplicationBuilder>(appBuilder);
            CacheHelper.Configure();
        }

        private static async Task SendMail()
        {
            var soaBL = _container.Resolve<ISOAProjectsBL>();

            try
            {
                Logger.LogInfo(className, "sendMailTask()", "START", string.Empty);
                await soaBL.SendAlertMailOfControlEnding();
            }
            catch (Exception e)
            {
                Logger.LogError(className, "sendMailTask()", "ERROR", string.Empty, e);
            }
            Logger.LogInfo(className, "sendMailTask()", "END", string.Empty);
        }
    }


}

