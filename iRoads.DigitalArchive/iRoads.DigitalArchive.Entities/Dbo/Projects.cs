using Ness.Framework.Entities.Dbo;
using System;


namespace iRoads.DigitalArchive.Entities.Dbo
{

    public class Projects : EntityBase
    {
        public Projects() { }
        public virtual string ProjectId { get; set; }
        public virtual string ProjectTypes { get; set; }
        public virtual int ClassificationCode { get; set; }
        public virtual string Mnf { get; set; }
        public virtual string GeneralNote { get; set; }
        public virtual string ControlManager { get; set; }
        public virtual int CaseControlStatusCode { get; set; }
        public virtual DateTime CaseControlDate { get; set; }
        public virtual string MainContractor { get; set; }
        public virtual string WbsNum { get; set; }
        public virtual string TenderType { get; set; }
        public virtual string RoadRailNum { get; set; }
        public virtual string Interchange { get; set; }
        public virtual string OperationDepartment { get; set; }
        public virtual string ManagementCompany { get; set; }
        public virtual string MamapUserName { get; set; }
        public virtual string MamapFullName { get; set; }
        public virtual string MamapEmail { get; set; }
        public virtual string ManhapAllUserName { get; set; }
        public virtual string ManhapFullName { get; set; }
        public virtual string ManhapUserName { get; set; }
        public virtual string ManhapEmail { get; set; }
        public virtual string AgafManagerEmail { get; set; }
        public virtual string MemoneBakaraEmail { get; set; }
        public virtual string PlannerAllUserName { get; set; }
        public virtual string Name { get; set; }
        public virtual string Content { get; set; }
        public virtual string Contracts { get; set; }
        public virtual string MerhavAgaf { get; set; }
        public virtual int CurrentLevelCode { get; set; }
    }
}
