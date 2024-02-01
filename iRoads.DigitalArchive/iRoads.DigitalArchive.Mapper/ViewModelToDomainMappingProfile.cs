using AutoMapper;
using iRoads.DigitalArchive.Entities.Dbo;
using iRoads.DigitalArchive.Entities.Site;
using iRoads.DigitalArchive.Models.Command;
using iRoads.DigitalArchive.Models.Model;
using Ness.Framework.Entities.Site;
using Ness.Framework.Models.App;
using Ness.Framework.Models.Lookup;

namespace iRoads.DigitalArchive.Mapper
{
    public class ViewModelToDomainMappingProfile : Profile
    {
        public ViewModelToDomainMappingProfile() : base("ViewModelToDomainMappingProfile")
        {
            CreateMap<Entities.Lookup.Roles, Entities.Site.Roles>();
            CreateMap<Menurole, Entities.Site.Rolemenu>();
            CreateMap<Menu, Entities.Site.Menus>();

            CreateMap<BaseSetting, Messages>()
                    .ForMember(t => t.Description, o =>
                    {
                        o.MapFrom(x => x.Value);
                    });

            CreateMap<BaseSetting, Config>();

            CreateMap<Models.Model.User, Entities.Site.Users>();

            CreateMap<Models.Model.TaskJob, Entities.Dbo.Taskjobs>()
              .AfterMap((s, t) =>
              {
                  t.TaskTypes = new Entities.Lookup.Tasktypes();
                  t.TaskTypes.Code = s.TaskTypeCode;
              });

            CreateMap<SOAProjectModel, SoaImpProjects>();
            CreateMap<SOABusinessLevelsModel, SoaBusinessLevel>();
            CreateMap<ProjectBusinessLevelsModel,ProjectBusinessLevel>();
            CreateMap<ProjectBusinessLevelModel, ProjectBusinessLevel>();
            CreateMap<ProjectModel, Projects>();
            CreateMap<HistoryModel, History>();
            CreateMap<ProjectDocumentsModel,ProjectDocuments>();
            CreateMap<ActionLogCommand, Logs>();

        }
    }
}