using iRoads.DigitalArchive.Entities.Dbo;
using Ness.Framework.Entities.Mapping;

namespace iRoads.DigitalArchive.Entities.Mapping {
    
    
    public class ProjectBusinessLevelMap : EntityBaseMap<ProjectBusinessLevel> {
        
        public ProjectBusinessLevelMap() {
			Table("ProjectBusinessLevel");
			Id(x => x.Id).GeneratedBy.Identity().Column("Id");
			Map(x => x.ProjectId).Column("ProjectId").Unique().Not.Nullable();
			Map(x => x.Mnf).Column("MNF").Not.Nullable();
			Map(x => x.LevelCode).Column("LevelCode").Not.Nullable().Unique();
			Map(x => x.Contract).Column("Contract").Unique();
			Map(x => x.StartBusinessLevelDate).Column("StartBusinessLevelDate");
			Map(x => x.BusinessLevelControlStatusCode).Column("BusinessLevelControlStatusCode").Not.Nullable();
			Map(x => x.BusinessLevelStatusDate).Column("BusinessLevelStatusDate");
			Map(x => x.PhaseApprovalArcCode).Column("PhaseApprovalArcCode");
			Map(x => x.PhaseApprovalMamapCode).Column("PhaseApprovalMamapCode");
			Map(x => x.PhaseApprovalArcDate).Column("PhaseApprovalArcDate");
			Map(x => x.PhaseApprovalMamapDate).Column("PhaseApprovalMamapDate");
			Map(x => x.UserNameArchiv).Column("UserNameArchiv");
			Map(x => x.UserNameMamap).Column("UserNameMamap");
			Map(x => x.DesignatedSpace).Column("DesignatedSpace");
			Map(x => x.IV_CCRN).Column("IV_CCRN");
            Map(x => x.FromInterface).Column("FromInterface");

        }
    }
}
