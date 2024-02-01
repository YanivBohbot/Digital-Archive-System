using System;
using System.Collections.Generic;
using System.Text;

namespace iRoads.DigitalArchive.Models.Model
{
    public class ProjectBusinessLevelModel
    {
        public int Id { get; set; }
        public string ProjectId { get; set; }
        public string Mnf { get; set; }
        public int LevelCode { get; set; }
        public string Contract { get; set; }
        public DateTime? StartBusinessLevelDate { get; set; }
        public int BusinessLevelControlStatusCode { get; set; }
        public DateTime? BusinessLevelStatusDate { get; set; }
        public int? PhaseApprovalArcCode { get; set; }
        public int? PhaseApprovalMamapCode { get; set; }
        public DateTime? PhaseApprovalArcDate { get; set; }
        public DateTime? PhaseApprovalMamapDate { get; set; }
        public string UserNameArchiv { get; set; }
        public string UserNameMamap { get; set; }
        public string DesignatedSpace { get; set; }
        public string IV_CCRN { get; set; }
        public bool FromInterface { get; set; }
        public DateTime? UpdateDate { get; set; }
    }
}
