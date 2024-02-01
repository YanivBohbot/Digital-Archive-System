import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class AppConfigService {

  data: any = {};

  constructor(private http: HttpClient) { }

  loadAppConfig(): Promise<any> {
    let defaults = {
      "baseUrl": "/api",
      "isForDemo": false,
      "isOnlyClient": false,
      "isUrlDemo": "/api",
      "baseLoginUrl": "/Login/api"
    };

    return new Promise<any>(resolve => {
      this.http.get('config.json?_cache_buster=' + new Date().getTime()).subscribe({
        next: (response: any) => {
          this.data = Object.assign({}, defaults || {}, response || {});
          resolve(this.data);
        },
        error: () => {
          console.log('using default configuration');
          this.data = Object.assign({}, defaults || {});
          resolve(this.data);
        }
      });
    });
  }

}