export interface projectsDetails{
    
    Id: string;
    Name: string; 
    Mnf: number;
    CaseControlStatusCode : number;
    ProjectLevels : ControlLevelStatusModel[];
    ControlManager: string,
    statusBakaraMamap : number; 
    dateBakaraMamap : Date; 
    statusBakaraArchive: number; 
    dateBakaraArchive: Date;
    WbsNum : string[];
    TenderType: string;
    RoadRailNum: number;
    Interchange:string;
    Contracts: string[];
    OperationDepartment: string;
    MainContractor: string[];
    ManagementCompany:string;
    MamapUserName : string;
    Manhap: string;
    ProjectTypes: string[];
    ClassificationCode: number;
    MerhavAgaf: string;

}


 
export interface ControlLevelStatusModel {
    Code: number,
    Description: string,
    LevelDate: Date;
    Status : number;
}

