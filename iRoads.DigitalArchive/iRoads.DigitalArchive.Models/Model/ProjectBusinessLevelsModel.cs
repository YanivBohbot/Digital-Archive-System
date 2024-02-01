using System;
using System.Collections.Generic;
using System.Text;

namespace iRoads.DigitalArchive.Models.Model
{
    public class ProjectBusinessLevelsModel
    {
        public int Id ;
        public string ProjectId ;
        public string Mnf ;
        public int LevelCode ;
        public int InvalidDocsCount;
        public string Description ;
        public string Contract;
        public DateTime? StartBusinessLevelDate ;
        public int BusinessLevelControlStatusCode;
        public string BusinessLevelControlStatusDesc;
        public DateTime? BusinessLevelStatusDate;
        public int? PhaseApprovalArcCode ;
        public string PhaseApprovalArcDesc;
        public int? PhaseApprovalMamapCode ;
        public string PhaseApprovalMamapDesc;
        public DateTime? PhaseApprovalArcDate ;
        public DateTime? PhaseApprovalMamapDate ;
        public string UserNameArchiv ;
        public string UserNameMamap ;
        public string DesignatedSpace ;
        public IList<ContractModel> Contracts;
        public string IV_CCRN { get; set; }
    }

    public class ContractModel
    {
        public string ContractName;
        public int ContractControlStatusCode;
        public string ContractControlStatusDesc;
        public string ArcStatusDesc;
        public string MamapStatusDesc;
        public int ArcStatusCode;
        public int MamapStatusCode;
        public DateTime? ContractControlStatusDate;
        public int InvalidContractDocsCount;

    }
}
