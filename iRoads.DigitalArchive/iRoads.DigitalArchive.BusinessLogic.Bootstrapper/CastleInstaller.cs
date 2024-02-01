using Castle.MicroKernel.Registration;
using Castle.MicroKernel.SubSystems.Configuration;
using Castle.Windsor;
using Microsoft.Extensions.Configuration;
using Ness.DataAccess.Fluent.CrossPlatform;
using Ness.DataAccess.Repository.CrossPlatform;
using Ness.Framework.BusinessLogic;
using Ness.Framework.Core.Interfaces.ReadFiles;
using Ness.Framework.Core.Interfaces.Utils;
using Ness.Framework.Core.ReadFiles;
using Ness.Framework.Core.Utils;
using Ness.Framework.Razor;
using CastleClasses = Castle.MicroKernel.Registration;

namespace iRoads.DigitalArchive.BusinessLogic.Bootstrapper
{
    public class CastleInstaller : IWindsorInstaller
    {
        public void Install(IWindsorContainer container, IConfigurationStore store)
        {
            container.Register(
              Component.For<IMail>().ImplementedBy<Mail>().LifestyleTransient(),
              Component.For<ISms>().ImplementedBy<Sms>().LifestyleTransient()
              );

            container.Register(
               Component.For<ISessionFactoryHelper>().ImplementedBy<NHibernateHelper>().DependsOn(Dependency.OnValue("Configuration", container.Resolve<IConfiguration>())).LifestyleTransient()
               );

            container.Register(
               Component.For<IRepository>().ImplementedBy<Repository>().LifestyleTransient()
               );
            container.Register(
                 Component.For<IEmailService>().ImplementedBy<EmailHelper>(),
                 Component.For<ISmsService>().ImplementedBy<SmsHelper>(),
                 Component.For<IExcelFileHelper>().ImplementedBy<ExcelFileHelper>()
                 );
            container.Register(
                       CastleClasses.Classes
                       .FromAssemblyNamed("Ness.Framework.BusinessLogic")
                       .BasedOn(typeof(IBaseBL))
                       .WithService.AllInterfaces()
                       .LifestylePerThread()
                       );
            container.Register(
                   CastleClasses.Classes
                   .FromAssemblyNamed("iRoads.DigitalArchive.BusinessLogic")
                   .BasedOn(typeof(IBaseBL))
                   .WithService.AllInterfaces()
                   .LifestylePerThread()
                   );
        }
    }
}
