export enum Api_Path {
  invoker = 'Invoker',
  login = 'Login',
  role = 'Role'
}

export enum ProjectApi {
  getProjectDetails = 'Project/ProjectDetails',
  getProjectLevels = 'Project/ProjectLevels',
  getDocumentForProjectProgress = 'Project/ProjectLevelDocs',
  getAuthorizedActionsForUserRole = 'Project/RoleAllowActions',
  getApprovers = 'GetApprovers',
  postLevelApproval = 'Project/LevelApproval',
  postCaseApproval = 'Project/CaseApproval',
  saveDocumentDetails = 'Project/SaveDocument',
  getDocumentHistory = 'Project/DocumentHistory', 
  updateProjectDetails = 'Project/UpdateProjectDetails',
  getFavoriteProject = 'Project/getFavorite',
  getReport ='Project/getReport',
}
export enum ProjectsApi {
  getProjects = 'Projects/Projects',
  getControlManagers = 'Projects/ControlManagers',
  updateFavorites = 'Projects/UpdateFavoriteProject',
  GetCombos = 'Projects/GetCombos'
}
export enum UserApi {
  getUserName = 'User/GetUserName',
  getUserGroup = 'User/GetUserGroup',
  getAuthorizedActionsForUserRole = 'User/GetAuthorizedActionsForUserRole',
}

export enum LookupApi {
  get = 'Lookup/Get',
  getAll = 'Lookup/GetAll',
  getDesignatedSpace = 'Lookup/GetDesignatedSpace',
  getStatusBakaraList = 'Lookup/getStatusBakara',
  getRejectionReasonsList = 'Lookup/rejectionReasons',
  getStatusLevelCode='Lookup/getStatusLevelCode',
  getBusinessLevel = 'Lookup/getBusinessLevel',
  getBusinessLevelControl ='Lookup/getBusinessLevelControlStatus',
  getBusinessLevelSubject = 'Lookup/BusinessLevelSubject',
  getCaseControlStatus = 'Lookup/CaseControlStatus',
  getDocumentChangeReason = 'Lookup/getDocumentChangeReason',
  getDocumentStatus  = 'Lookup/getDocumentStatus',
  getRoles = 'Lookup/getRoles',
  getUserActions = 'Lookup/getUserActions'

}
