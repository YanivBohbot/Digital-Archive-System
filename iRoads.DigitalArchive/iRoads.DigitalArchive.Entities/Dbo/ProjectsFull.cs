using Ness.Framework.Entities.Dbo;
using System;
using System.Collections.Generic;
using System.Text;

namespace iRoads.DigitalArchive.Entities.Dbo
{
    public class ProjectsFull
    {
        public virtual int Id { get; set; }
        public virtual string ProjectId { get; set; }
        public virtual int? LevelCode { get; set; }

        public virtual string Mnf { get; set; }
        public virtual string RoadRailNum { get; set; }
        
        public virtual string ControlManager { get; set; }
        public virtual string MainContractor { get; set; }
        public virtual string WbsNum { get; set; }
        public virtual string Interchange { get; set; }
        public virtual string TenderType { get; set; }
        
        public virtual string OperationDepartment { get; set; }
        public virtual string ManagementCompany { get; set; }
        public virtual string MamapFullName { get; set; }
        public virtual string MamapUserName { get; set; }
        public virtual string ManhapFullName { get; set; }
        public virtual string ManhapUserName { get; set; }
        public virtual string ManhapAllUserName { get; set; }
        public virtual string PlannerAllUserName { get; set; }
        public virtual string Name { get; set; }
        public virtual string CurrentLevelDesc { get; set; }
        public virtual int? BusinessLevelControlStatusCode { get; set; }
        public virtual int? PhaseApprovalMamapCode { get; set; }
        public virtual string MamapStatusDesc { get; set; }
        public virtual int? PhaseApprovalArcCode { get; set; }
        public virtual string ArchivStatusDesc { get; set; }
        public virtual string Contract { get; set; }
        public virtual DateTime? StartBusinessLevelDate { get; set; }
        public virtual string CreateUser { get; set; }
        public virtual bool? IsComments { get; set; }
        public virtual bool? IsInvalidDocs { get; set; }
    }
}
