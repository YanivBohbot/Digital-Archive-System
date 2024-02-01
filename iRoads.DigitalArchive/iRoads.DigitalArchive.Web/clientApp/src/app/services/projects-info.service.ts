import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject, map, Observable, Subject, tap } from 'rxjs';
import { environment } from 'src/environments/environment';
import { ProjectApi } from '../enum/apiPaths.enum';
import { caseApproval } from '../models/caseApproval';
import { levelApproval } from '../models/levelApproval';
import { updatedProject } from '../models/updatedProject';
import { User } from '../models/User';
import { AppConfigService } from './shared/appConfig.service';

@Injectable({
  providedIn: 'root',
})
export class ProjectsInfoService {
  isForDemo = this.appConfigService.data.isForDemo;
  enableconsole = !environment.production;
  detailsProject: any;
  merhavAgaf: any;
  documentdetails: any;
  $projectValidationCaseEmitter = new Observable<any>();
  projectId!: string;
  codeLevel!: number;
  systemType: string | undefined;
  contract!: string;
  levels!: any[];
  level: any;
  selectedContract: any
  autorizedAction!: any[];

  public _refreshNeeds$ = new Subject<void>();
  public _getProjectDetails$ = new Subject<any>();
  public _refreshDocumentList$ = new Subject<void>();
  public _refreshScreen$ = new Subject<void>();
  private levelsSubject = new BehaviorSubject<any[]>([]);
  public levels$ = this.levelsSubject.asObservable();
  levelConfirme: boolean = false;
  public _hideAuthorizedLevel$ = new Subject<boolean>();


  private base_url = this.isForDemo
    ? this.appConfigService.data.isUrlDemo
    : this.appConfigService.data.baseUrl;

  constructor(private http: HttpClient,private appConfigService: AppConfigService) {}

  get sendProjectDetails() {
    return this._getProjectDetails$;
  }
  
  get hideAuthorizedLevel() {
    return this._hideAuthorizedLevel$;
  }

  get refreshNeeded() {
    return this._refreshNeeds$;
  }
  get refreshNeededDocuments() {
    return this._refreshDocumentList$;
  }

  get getRefreshScreen() {
    return this._refreshScreen$;
  }
  get getlevelsSub() {
    return this.levelsSubject;
  }

  getProjectDetails(projectId?: string, contract?: string) {

    let myParams = new HttpParams();

    if (projectId) {
      myParams = myParams.append('ProjectID', projectId);
    }
    if (contract) {
      myParams = myParams.append('Contract', contract);
    }

    const options = {
      params: myParams,
    };

    let url = `${this.base_url}/${ProjectApi.getProjectDetails}`;

    return this.http.get(url, options);
  }

  getProjectLevels(projectId: string) {
    
    let myParams = new HttpParams();
    myParams = myParams.append('ProjectID', projectId);
    const options = {
      params: myParams,
    };
    let url = `${this.base_url}/${ProjectApi.getProjectLevels}`;
    return this.http.get(url, options);
  }

  getDocumentsForProjectProgress(
    projectId: string,
    MNF: string,
    PageNum: number,
    codeLevel?: number | null,
    contract?: string | null,
    WBS?: string | null
   
  ): Observable<any> {

    let myParams = new HttpParams();
    myParams = myParams.append('ProjectID', projectId).append('MNF', MNF);

    if (codeLevel) {
      myParams = myParams.append('LevelCode', codeLevel);
    }
    if (contract) {
      myParams = myParams.append('Contract', contract);
    }

    if (WBS) {
      myParams = myParams.append('WBS', WBS);
    }
    myParams = myParams.append('PageNum', PageNum);

    const options = {
      params: myParams,
    };

    let url = `${this.base_url}/${ProjectApi.getDocumentForProjectProgress}`;
    if (this.isForDemo && contract === 'changed') {
      return this.http.get<any>(
        '../../../assets/demo/secondemoDocuments Changed.json'
      );
    } else if (this.isForDemo) {
      return this.http.get<any>('../../../assets/demo/demoDocuments.json');
    }
    return this.http.get<any>(url, options);
  }

  levelConfirm(data: levelApproval) {
    let url = `${this.base_url}/${ProjectApi.postLevelApproval}`; 
    return this.http.post(url, data);
  }

  getAuthorizationCase(data: caseApproval) {
    let url = `${this.base_url}/${ProjectApi.postCaseApproval}`; 
    return this.http.post(url, data);
  }

  saveDocumentDetails(data: any) {
    let url = `${this.base_url}/${ProjectApi.saveDocumentDetails}`;
    return this.http.post(url, data);
  }

  getDocumentHistory(documentId: string) {
    let searchParams = new HttpParams();
    searchParams = searchParams.append('DocId', documentId);
    const options = {
      params: searchParams,
    };

    let url = `${this.base_url}/${ProjectApi.getDocumentHistory}`; 
    return this.http.get(url, options);
  }

  addCommentsToDocument(comments: any, documentId: number) {
    let url = `${this.base_url}`;
    return this.http.put<any>(url, comments);
  }

  updateProjectDetails(data: updatedProject) {
    let url = `${this.base_url}/${ProjectApi.updateProjectDetails}`;
    return this.http.post(url, data);
  }

  getValidationEmitter() {
    return this.$projectValidationCaseEmitter;
  }

  /*
   ?? i need to check how to send the paramters ??
    ?? there is a list of paramters do i need to send it as object ? or paramters only ? 
    !!  do i send it like this => filtersProject: filtersProject ???
   * @param filtersProject  filtersProject: string
   * @returns 
   */


  getFavoriteProject(
    user: User,
    actionOnFavorite: string,
    projectId: string,
    levelcode: string,
    contract: string
  ) {
    if (this.isForDemo) {
      return this.http.get('../../../assets/demo/returnGeneralSucess.json');
    }

    let searchParams = new HttpParams();
    searchParams = searchParams.append('ProjectID', projectId);

    if (actionOnFavorite) {
      searchParams = searchParams.append('action', actionOnFavorite);
    }

    if (projectId) {
      searchParams = searchParams.append('ProjectID', projectId);
    }
    if (contract) {
      searchParams = searchParams.append('Contract', contract);
    }

    const options = {
      params: searchParams,
    };

    let url = `${this.base_url}/${ProjectApi.getFavoriteProject}`;
    return this.http.get(url, options);
  }

  getReport(codeMamap: string) {
    if (this.isForDemo) {
      return this.http.get('../../../assets/demo/returnGeneralSucess.json');
    }

    let searchParams = new HttpParams();
    searchParams = searchParams.append('codeMaMAp', codeMamap);

    const options = {
      params: searchParams,
    };

    let url = `${this.base_url}/${ProjectApi.getReport}`;
    return this.http.get(url, options);
  }
}
