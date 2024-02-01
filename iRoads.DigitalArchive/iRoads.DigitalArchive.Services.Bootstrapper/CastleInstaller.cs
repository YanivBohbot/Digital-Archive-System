using Castle.MicroKernel.Registration;
using Castle.MicroKernel.SubSystems.Configuration;
using Castle.Windsor;
using iRoads.DigitalArchive.Services.Interfaces;

namespace iRoads.DigitalArchive.Services.Bootstrapper
{
    public class CastleInstaller : IWindsorInstaller
    {
        public void Install(IWindsorContainer container, IConfigurationStore store)
        {
            container.Register(
                Classes.FromAssemblyNamed("iRoads.DigitalArchive.Services")
                .BasedOn<IServiceBase>()
                .WithService.AllInterfaces()
                .LifestyleTransient());

        }
    }
}
