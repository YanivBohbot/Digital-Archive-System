

using System;

namespace iRoads.DigitalArchive.Models.Query
{
    public class ProjectsQuery : BaseQuery
    {
        public ProjectsQuery() { }

        public bool IsExcel { get; set; }
        public string ProjectDescription { get; set; }
        public int? LevelCode { get; set; }
        public DateTime? StartLevelDate { get; set; }
        public DateTime? EndLevelDate { get; set; }
        public int? MamapStatus { get; set; }
        public int? ArchivStatus { get; set; }
        public string ControllerManager { get; set; }
        public string WBS { get; set; }
        public string Tender { get; set; }
        public string Road { get; set; }
        public string Interchange { get; set; }
        public string Contract { get; set; }
        public string OperationDepartment { get; set; }
        public string OperatingContractor { get; set; }
        public string Company { get; set; }
        public string Mamap { get; set; }
        public string Manhap { get; set; }
        public bool DisplayFavoriteProjects { get; set; }
        public bool DisplayManhapCommentsProjects { get; set; }
        public bool DisplayInvalidDocsProjects { get; set; }
        public bool DisplayArchivedProjects { get; set; }

        public int PageSize { get; set; }
        public int PageNumber { get; set; }
    }
}
