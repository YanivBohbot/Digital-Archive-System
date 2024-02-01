export enum Messages {
  ErrorTitle = 'שגיאה',
  SystemTitle = 'הודעת מערכת',
  ValidationCase = 'אישור תיק',
  QuestionValidation = 'האם לאשר את התיק ?',
  OKBtn = 'אישור',
  CancelBtn = 'ביטול',
  IdleSAML = 'נותק החיבור לשרת, אנא התחבר/י מחדש',
  AuthorizeAction = 'אין לך הרשאה לבצע פעולה זו',
  GeneralError = 'תקלת מערכת, אנא פנה למנהל מערכת',
  Captcha = 'שימו לב, חרגתם ממדיניות כמות הפניות המותרת לפעולה זו',
  Err400 = 'נותק החיבור לשרת, אנא בצע רענון לדף (F5)',
  SessionIdle = 'המערכת עומדת להתנתק, האם ברצונך לחזור למערכת?',
  ContinueBtn = 'כן, אני רוצה להמשיך',
  FinishBtn = 'לא, סיימתי',
  UnderstandBtn = 'הבנתי',
  Idle = 'בעקבות חוסר פעילות ממושכת נותקת מהאתר והנך מועבר למסך הכניסה',
  Exit = 'יציאה',
  MustRejectionsReasons = 'חובה לבחור סיבת דחיה',
  NoHistoryExist = 'אין נתוני היסטוריה על המסמך',
}

export enum Messages {
  messageForUndefinedLevelBusinness = 'לפרויקט לא מוגדר שלב עסקי חשבון סופי קבלן ובו חוזה קבלני מבוקש',
  datachanged = 'changed',
}

export enum BuisnessLevel {
  TICHNUN_RISHONI = 1,
  TICHNUN_MUKDAM = 2,
  TICHNUN_MEFORAT = 3,
  HESDEREI_TNUA = 4,
  STATUTORIKA = 5,
  MEKARKEIN = 6,
  BAKARAT_ECHUT = 7,
  HESHBON_SOFI_KABLANI = 8,
  BITZUA = 9,
}

export enum StatusLevelDesc {
  COMPLETED = 'בקרה הושלמה',
  NOT_STARTED = 'טרם החל השלב',
  NOT_COMPLETED = 'בקרה טרם הושלמה',
}


export enum PhaseApprovalStatus {
  COMPLETED = 2,
  NOT_COMPLETED = 3,
  NOT_STARTED = 1
}

export enum PhaseApprovalStatusDesc {
  COMPLETED = 'הושלמה',
  CONTROL_COMPLETED = 'בקרה הושלמה',
  NOT_COMPLETED = 'בקרה טרם הושלמה',
  NOT_STARTED = 'טרם החל השלב'
}

export enum StatusLevelCode {
  COMPLETED = 1,
  NOT_COMPLETED = 2,
  NOT_STARTED = 3,
}

export enum SystemType {
  Default = 'rikuz',
  MNF = 'MNF',
  SAP = 'SAP',
}

export enum TypeChanged {
  updatedDoc = 'עדכון מסמך',
  updatedStatusControl = 'עדכון סטטוס בקרה',
  manhapComments = 'התייחסות מנה״פ',
}

export enum AuthorizedActionsCode {
  ARCHIVE_APPROVAL_FOR_CASE = 1, 
  ARCHIVE_APPROVAL_FOR_LEVEL = 2, 
  DOCUMENT_CONTROL_APPROVAL = 3, 
  CASE_COMMENTS = 4, 
  SELECT_MERHAV_AGAF = 5,    
  WATCH_PROJECTS_SCREEN = 6, 
  CREATE_EXCEL = 7, 
  SEND_BY_MAIL_INCOMPLETE_CONTROL_REPORT = 8,     
  MAMAP_APPROVAL_FOR_LEVEL = 9,
  SET_CONTROL_MANAGER = 10,   
  WRITE_ATTENTION = 11  
}

export enum LabelActionsButtons {
  ARCHIVE_APPROVAL_FOR_CASE = 'אישור בקרת ארכיב לתיק',
  ARCHIVE_APPROVAL_FOR_LEVEL = 'אשר בקרת ארכיב לשלב',
  DOCUMENT_CONTROL_APPROVAL = 'אישור בקרת מסמך',
  CASE_COMMENTS = 'כתיבת הערות לתיק ',
  SELECT_MERHAV_AGAF = 'בחירה מרחב / אגף ייעודי מתוך רשימה',
  MAMAP_APPROVAL_FOR_LEVEL =  'אשר בקרת ממ"פ לשלב'
 

}

export enum RoleCode {
  ARCHIVE = 1,
  MAMAP = 2,
  ARCHIVE_MANAGER = 3,
  PROJECT_MANAGER = 4,
  READ_ONLY = 5,
  PLANNING_TEAM = 6,
  ADMIN = 7,
}

export enum DocStatusCodeEnum {
  NOT_TESTED = 0,
  VALID = 1,
  IRRELEVANT = 2,
  INVALID = 3,
}

export enum DocStatusDescEnum {
  VALID = 'תקין',
  INVALID = 'לא תקין',
  IRRELEVANT = 'לא רלוונטי',
}

export enum ChangeReasonDescEnum {
  ADD_DOC = 'הוספת מסמך',
  UPDATE_DOC_STATUS = 'עדכון סטטוס מסמך',
  UPDATE_REJECT_REASON = 'עדכון סיבת דחייה',
  UPDATE_CONTROL_COMMENTS = 'עדכון הערות בקרה',
  UPDATE_MANHAP_COMMENTS = 'עדכון התייחסות מנה"פ'
}

export enum ChangeReasonCodeEnum {
  ADD_DOC = 1,
  UPDATE_DOC_STATUS = 2,
  UPDATE_REJECT_REASON = 3,
  UPDATE_CONTROL_COMMENTS = 4,
  UPDATE_MANHAP_COMMENTS = 5
}
