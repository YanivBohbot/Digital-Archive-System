import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { map, of } from 'rxjs';
import { environment } from 'src/environments/environment';
import { ProjectsApi } from '../enum/apiPaths.enum';
import { AppConfigService } from './shared/appConfig.service';

@Injectable({
  providedIn: 'root',
})
export class ProjectsListService {
  isForDemo = this.appConfigService.data.isForDemo;
  enableconsole = !environment.production;
  controlManagersList: string[] = [];
  private base_url = this.isForDemo
    ? this.appConfigService.data.isUrlDemo
    : this.appConfigService.data.baseUrl;

  constructor(private http: HttpClient,private appConfigService: AppConfigService) {}
  getProjectsList(params: any) {
    if (this.isForDemo) {
      return this.http.get('../../../assets/demo/projectListData.json');
    }

    let searchParams = params; //new HttpParams();
    // searchParams = searchParams.append('filter', );  filtersProject
    const options = {
      params: searchParams,
    };

    let url = `${this.base_url}/${ProjectsApi.getProjects}`;
    return this.http.get(url, options);
  }

  updateFavorite(data: any) {
    let url = `${this.base_url}/${ProjectsApi.updateFavorites}`; //endpoint to enter => for get docs leshlav project`;
    return this.http.post(url, data);
  }
  getCombos() {
    let url = `${this.base_url}/${ProjectsApi.GetCombos}`;
    return this.http.get(url)
  }
  getControlManagers() {
    if (this.controlManagersList && this.controlManagersList.length > 0) {
      return of<string[]>(this.controlManagersList);
    }

    if (this.isForDemo) {
      return this.http.get('../../../assets/demo/controlManagers.json');
    }

    let url = `${this.base_url}/${ProjectsApi.getControlManagers}`;
    return this.http.get(url).pipe(
      map((response: any) => {
        return response.Data;
      })
    );
  }
}
