using FluentNHibernate.Mapping;

using iRoads.DigitalArchive.Entities.Dbo; 

namespace iRoads.DigitalArchive.Entities.Mapping {
    
    
    public class ProjectsMap : BaseEntityMapping<Projects> {
        
        public ProjectsMap() {
			Table("Projects");
			Id(x => x.ProjectId).GeneratedBy.Assigned().Column("ProjectId");
			Map(x => x.ProjectTypes).Column("ProjectTypes");
			Map(x => x.ClassificationCode).Column("ClassificationCode").Not.Nullable();
			Map(x => x.Mnf).Column("MNF").Not.Nullable();
			Map(x => x.GeneralNote).Column("GeneralNote");
			Map(x => x.ControlManager).Column("ControlManager");
			Map(x => x.CaseControlStatusCode).Column("CaseControlStatusCode").Not.Nullable();
			Map(x => x.CaseControlDate).Column("CaseControlDate").Not.Nullable();
			Map(x => x.MainContractor).Column("MainContractor");
			Map(x => x.WbsNum).Column("WBS_Num");
			Map(x => x.TenderType).Column("TenderType");
			Map(x => x.RoadRailNum).Column("RoadRailNum");
			Map(x => x.Interchange).Column("Interchange");
			Map(x => x.OperationDepartment).Column("OperationDepartment");
			Map(x => x.ManagementCompany).Column("ManagementCompany");
			Map(x => x.MamapUserName).Column("MamapUserName");
			Map(x => x.MamapFullName).Column("MamapFullName");
			Map(x => x.MamapEmail).Column("MamapEmail");
			Map(x => x.ManhapAllUserName).Column("ManhapAllUserName");
			Map(x => x.ManhapFullName).Column("ManhapFullName");
			Map(x => x.ManhapUserName).Column("ManhapUserName");
			Map(x => x.ManhapEmail).Column("ManhapEmail");
			Map(x => x.AgafManagerEmail).Column("AgafManagerEmail");
			Map(x => x.MemoneBakaraEmail).Column("MemoneBakaraEmail");
			Map(x => x.PlannerAllUserName).Column("PlannerAllUserName");
			Map(x => x.Name).Column("Name");
			Map(x => x.Content).Column("Content");
			Map(x => x.Contracts).Column("Contracts");
			Map(x => x.MerhavAgaf).Column("Merhav_Agaf");
			Map(x => x.CurrentLevelCode).Column("CurrentLevelCode");
        }
    }
}
