using FluentNHibernate.Mapping;

using iRoads.DigitalArchive.Entities.Dbo; 

namespace iRoads.DigitalArchive.Entities.Mapping {
    
    
    public class SoaBusinessLevelMap : BaseEntityMapping<SoaBusinessLevel> {
        
        public SoaBusinessLevelMap() {
			Table("SOABusinessLevel");
			Id(x => x.Id).GeneratedBy.Identity().Column("Id");
            Map(x => x.ProjectId).Column("ProjectId").Not.Nullable(); ;
			Map(x => x.LevelCode).Column("LevelCode").Not.Nullable();
			Map(x => x.Contract).Column("Contract");
			Map(x => x.FromInterface).Column("FromInterface");
			Map(x => x.StartLevelDate).Column("StartLevelDate").Not.Nullable();
			Map(x => x.StatusLevelCode).Column("StatusLevelCode").Not.Nullable();
            Map(x => x.ManagementStatus).Column("ManagementStatus");
            Map(x => x.Error).Column("Error");
        }
    }
}
