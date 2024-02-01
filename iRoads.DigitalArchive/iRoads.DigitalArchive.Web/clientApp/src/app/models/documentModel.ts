
export interface documentModel{

    SourceDocId?: string;
    DocId: number;
    ProjectId: string;
    LevelCode:number;
    Type:string;
    URL:string;
    FileName: string;
    Date:Date;
    Info:string;
    AttachedProcess: string;
    AttachedDate: Date;
    AttachedBy: string;
    DocumentName:string; 
    Discipline: string;
    Element:string;
    DocStatusCode: string;
    DocStatusDesc:string
    DocSubject:string;
    ReasonRejectCode: string;
    ReasonRejectDesc:string;
    ControlComments: string;
    ControlDate: Date;
    ControlerName: string;
    ManhapComments:string


}