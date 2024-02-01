import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { ProjectApi } from '../enum/apiPaths.enum';
import { AppConfigService } from './shared/appConfig.service';

@Injectable({
  providedIn: 'root',
})
export class UserService {
  isForDemo = this.appConfigService.data.isForDemo;
  private base_url = this.isForDemo ? this.appConfigService.data.isUrlDemo : this.appConfigService.data.baseUrl;

  constructor(private http: HttpClient, private appConfigService: AppConfigService) { }

  getAuthorizedActionsForUserRole(
    projectId: string,
    codeLevel?: number | null,
    contract?: string | null
  ) {
    if (this.isForDemo) {
      return this.http.get('../../../assets/demo/actionUsersData.json');
    }

    let myParams = new HttpParams();
    myParams = myParams.append('ProjectId', projectId);
    if (codeLevel) {
      myParams = myParams.append('LevelCode', codeLevel);
    }
    if (contract) {
      myParams = myParams.append('Contract', contract);
    }

    const options = {
      params: myParams,
    };
    let url = `${this.base_url}/${ProjectApi.getAuthorizedActionsForUserRole}`;
    return this.http.get(url, options);
  }

  getUserDetails(projectId: string) {

    let myParams = new HttpParams();
    myParams = myParams.append('ProjectId', projectId);

    const options = {
      params: myParams,
    };

    let url = `${this.base_url}/${ProjectApi.getApprovers}`;
    return this.http.get(url, options)
  }






}
