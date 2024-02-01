using FluentNHibernate.Mapping;

using iRoads.DigitalArchive.Entities.Dbo;
using Ness.Framework.Entities.Mapping;

namespace iRoads.DigitalArchive.Entities.Mapping {
    
    
    public class FavoriteProjectsMap : EntityBaseMap<FavoriteProjects> {
        
        public FavoriteProjectsMap() {
			Table("FavoriteProjects");
			Id(x => x.ProjectId).GeneratedBy.Assigned().Column("ProjectId");
			Map(x => x.LevelCode).Column("LevelCode").Not.Nullable();
			Map(x => x.Contract).Column("Contract");
			Map(x => x.ControlManager).Column("ControlManager").Not.Nullable();
            Map(x => x.CreateDate).Column("CreateDate").Not.Nullable();
            Map(x => x.CreateUser).Column("CreateUser").Not.Nullable();
            Map(x => x.UpdateUser).Column("UpdateUser").Not.Nullable();
        }
    }
}
