using FluentNHibernate.Mapping;

using iRoads.DigitalArchive.Entities.Dbo;

namespace iRoads.DigitalArchive.Entities.Mapping
{


    public class ProjectsFullMap : ClassMap<ProjectsFull>
    {

        public ProjectsFullMap()
        {
            Table("ProjectsFull");
            Id(x => x.Id).Column("Id");
            Map(x => x.ProjectId).Column("ProjectId");
            Map(x => x.LevelCode).Column("LevelCode").Nullable();
            Map(x => x.Mnf).Column("MNF");
            Map(x => x.RoadRailNum).Column("RoadRailNum").Nullable();  
            Map(x => x.Interchange).Column("Interchange").Nullable();
            Map(x => x.TenderType).Column("TenderType").Nullable();
            
            Map(x => x.ControlManager).Column("ControlManager").Nullable();
            Map(x => x.MainContractor).Column("MainContractor").Nullable();
            Map(x => x.WbsNum).Column("WBS_Num").Nullable();
            Map(x => x.OperationDepartment).Column("OperationDepartment").Nullable();
            Map(x => x.ManagementCompany).Column("ManagementCompany").Nullable();
            Map(x => x.MamapFullName).Column("MamapFullName").Nullable();
            Map(x => x.ManhapAllUserName).Column("ManhapAllUserName").Nullable();
            Map(x => x.MamapUserName).Column("MamapUserName").Nullable();
            Map(x => x.ManhapFullName).Column("ManhapFullName").Nullable();
            Map(x => x.ManhapUserName).Column("ManhapUserName").Nullable();
            Map(x => x.PlannerAllUserName).Column("PlannerAllUserName").Nullable();
            Map(x => x.Name).Column("Name").Nullable();
            
            Map(x => x.CurrentLevelDesc).Column("CurrentLevelDesc").Nullable();
            Map(x => x.BusinessLevelControlStatusCode).Column("BusinessLevelControlStatusCode").Nullable();
            Map(x => x.PhaseApprovalMamapCode).Column("PhaseApprovalMamapCode").Nullable();
            Map(x => x.MamapStatusDesc).Column("MamapStatusDesc").Nullable();
            Map(x => x.PhaseApprovalArcCode).Column("PhaseApprovalArcCode").Nullable();
            Map(x => x.ArchivStatusDesc).Column("ArchivStatusDesc").Nullable();
            Map(x => x.Contract).Column("Contract").Nullable();
            Map(x => x.StartBusinessLevelDate).Column("StartBusinessLevelDate").Nullable();
            Map(x => x.CreateUser).Column("CreateUser").Nullable();
            Map(x => x.IsComments).Column("IsComments").Nullable();
            Map(x => x.IsInvalidDocs).Column("IsInvalidDocs").Nullable();

        }
    }
}
