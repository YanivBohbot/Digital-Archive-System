export interface ProjectDetailsToSearch {

  isExcel: boolean;
  projectID: string;
  levelCode: number;
  CaseControlStatusCode: number;
  startLevelDate: Date;
  endLevelDate: Date;
  mamapStatus: number;
  archivStatus: number
  controllerManager: string;
  WBS: string;
  Tender: string;
  Road: string;
  Interchange: string;
  Contract: string;
  OperationDepartment: string;
  OperatingContractor: string;
  Company: string;
  Mamap: string;
  Manhap: string;
  DisplayFavoriteProjects: boolean;
  DisplayManhapCommentsProjects: boolean;
  DisplayInvalidDocsProjects: boolean;
  DisplayArchivedProjects: boolean;

}



