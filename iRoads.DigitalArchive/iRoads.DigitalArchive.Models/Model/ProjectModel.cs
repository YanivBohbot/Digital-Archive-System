using FluentNHibernate.Mapping;
using System;
using System.Collections.Generic;
using System.Text;

namespace iRoads.DigitalArchive.Models.Model
{
    public class ProjectModel : BaseModel
    {
        public string ProjectId;
        public string ProjectTypes;
        public int ClassificationCode;
        public string Mnf;
        public string GeneralNote;
        public string ControlManager;
        public int CaseControlStatusCode;
        public DateTime CaseControlDate;
        public string MainContractor;
        public string Contracts;
        public string WbsNum;
        public string TenderType;
        public string RoadRailNum;
        public string Interchange;
        public string OperationDepartment;
        public string ManagementCompany;
        public string MamapUserName { get; set; }

        public string MamapFullName { get; set; }
        public string MamapEmail { get; set; }
        public string ManhapAllUserName { get; set; }
        public string ManhapFullName { get; set; }
        public string ManhapUserName { get; set; }
        public string ManhapEmail { get; set; }
        public string AgafManagerEmail { get; set; }
        public string MemoneBakaraEmail { get; set; }
        public string PlannerAllUserName { get; set; }
        public string Name;
        public string Content;
        public string MerhavAgaf;
        public List<LevelModel> ProjectLevels;

     

    }
    public class ProjectsModel:BaseModel
    {
        public List<ProjectListItemModel> Projects { get; set; }

        public byte[] Excel { get; set; }
    }
    public class ProjectListItemModel
    {
        public string ProjectId { get; set; }
        public string Description { get; set; }
        public string MNF { get; set; }
        public int? CurrentLevel { get; set; }
        public string CurrentLevelDesc { get; set; }
        public DateTime CurrentLevelDate { get; set; }
        public int? MamapStatus { get; set; }
        public string MamapStatusDesc { get; set; }
        public int? ArchivStatus { get; set; }
        public string ArchivStatusDesc { get; set; }
        public string ControlManager { get; set; }
        public string Contracts { get; set; }
        public string Company { get; set; }
        public string Mamap { get; set; }
        public bool IsFavorite { get; set; }
        public bool IsArchived { get; set; }
        public string WBS { get; set; }

    }
}
