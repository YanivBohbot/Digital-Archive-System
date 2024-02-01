using AutoMapper;
using iRoads.DigitalArchive.Entities.Dbo;
using iRoads.DigitalArchive.Entities.Lookup;
using iRoads.DigitalArchive.Entities.Site;
using iRoads.DigitalArchive.Models.Command;
using iRoads.DigitalArchive.Models.Model;
using Ness.Framework.Entities.Site;
using Ness.Framework.Models.App;
using Ness.Framework.Models.Lookup;

namespace iRoads.DigitalArchive.Mapper
{
    public class DomainToViewModelMappingProfile : Profile
    {
        public DomainToViewModelMappingProfile() : base("DomainToViewModelMappingProfile")
        {
            CreateMap<Entities.Site.Roles, Entities.Lookup.Roles>();
            CreateMap<Entities.Site.Roles, RoleBase>();
            CreateMap<Entities.Site.Rolemenu, Menurole>();
            CreateMap<Entities.Site.Menus, Menu>();

            CreateMap<Messages, BaseSetting>()
             .ForMember(t => t.Value, o =>
             {
                 o.MapFrom(x => x.Description);
             });

            CreateMap<Config, BaseSetting>();

            CreateMap<Entities.Dbo.Taskjobs, Models.Model.TaskJob>()
             .ForMember(t => t.TaskTypeCode, o =>
             {
                 o.MapFrom(x => x.TaskTypes.Code);
             });


            CreateMap<SoaImpProjects, SOAProjectModel>();
            CreateMap<SoaBusinessLevel, SOABusinessLevelsModel>();
            CreateMap<ProjectBusinessLevel, ProjectBusinessLevelsModel>();
            CreateMap<ProjectBusinessLevel, ProjectBusinessLevelModel>();
            CreateMap<Projects,ProjectModel>();
            CreateMap<History, HistoryModel>();
            CreateMap<ProjectDocuments, ProjectDocumentsModel>();
            CreateMap<Logs, ActionLogCommand>();
            

        }
    }
}
