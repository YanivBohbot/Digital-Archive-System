export interface projectStages{

    ProjectId:  string ; 
    LevelCode: number;
    LevelDescription: string;
    subdescription?:string;
    StartBusinessLevelDate : Date;
    BusinessLevelControlStatusCode: string;
    BusinessLevelControlStatusDesc : string,
    UserNameArchiv: string;
    PhaseApprovalArcCode: number;
    PhaseApprovalArcDesc:string;
    PashApprovalArcDate: string;
    UserNameMamap: string;
    PhaseApprovalMamapCode: string; 
    PhaseApprovalMamapDesc: string;
    PashApprovalMamapDate: string ;
    BusinessLevelStatusDate: Date;
    InvalidDocsCount: number;
    Contracts?: ContractModel []; 

}


export interface ContractModel {

    ContractName : string;
    ContractControlStatusDesc:string,
    ContractControlStatusCode: number;
    ContractControlStatusDate: Date;
    InvalidContractDocsCount:number;


}
