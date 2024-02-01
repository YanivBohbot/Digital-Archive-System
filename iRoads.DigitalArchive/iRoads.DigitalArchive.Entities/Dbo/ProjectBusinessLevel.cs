using System;
using System.Text;
using System.Collections.Generic;
using Ness.Framework.Entities.Dbo;

namespace iRoads.DigitalArchive.Entities.Dbo {
    
    public class ProjectBusinessLevel : EntityBase {
        public virtual int Id { get; set; }
        public virtual string ProjectId { get; set; }
        public virtual string Mnf { get; set; }
        public virtual int LevelCode { get; set; }
        public virtual string Contract { get; set; }
        public virtual DateTime? StartBusinessLevelDate { get; set; }
        public virtual int BusinessLevelControlStatusCode { get; set; }
        public virtual DateTime? BusinessLevelStatusDate { get; set; }
        public virtual int? PhaseApprovalArcCode { get; set; }
        public virtual int? PhaseApprovalMamapCode { get; set; }
        public virtual DateTime? PhaseApprovalArcDate { get; set; }
        public virtual DateTime? PhaseApprovalMamapDate { get; set; }
        public virtual string UserNameArchiv { get; set; }
        public virtual string UserNameMamap { get; set; }
        public virtual string DesignatedSpace { get; set; }
        public virtual string IV_CCRN { get; set; }
        public virtual bool FromInterface { get; set; }
    }
}
