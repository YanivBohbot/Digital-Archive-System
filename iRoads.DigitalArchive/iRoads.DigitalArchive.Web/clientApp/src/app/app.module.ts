import { APP_INITIALIZER, NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { LoaderService } from './services/shared/loader/loader.service';
import { HttpConfigInterceptor } from './services/shared/loader/httpconfig.interceptor';
import { HttpCancelService } from './services/shared/loader/httpcancel.service';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HTTP_INTERCEPTORS } from '@angular/common/http';
import { LoaderModule } from './modules/loader.module';
import { HttpClientModule } from '@angular/common/http';
import { HeaderComponent } from './components/shared/header/header.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatDialogModule } from '@angular/material/dialog';
import { MessageDialogComponent } from './components/shared/message-dialog/message-dialog.component';
import { FormsModule } from '@angular/forms';
import { JwtModule, JwtModuleOptions } from '@auth0/angular-jwt';
import { AppConfigService } from './services/shared/appConfig.service';
import { ProjectdetailsModule } from './modules/projectdetails/projectdetails.module';
import { ProjectsListModule } from './modules/projects-list/projects-list.module';
export function myTokenGetter() {
  return localStorage.getItem('token');
}
export function setupAppConfigServiceFactory(
  service: AppConfigService
): Function {
  return () => service.loadAppConfig();
}
const JWT_Module_Options: JwtModuleOptions = {
  config: {
    tokenGetter: myTokenGetter,
    allowedDomains: [
      'https://localhost:7061',
      'http://localhost:39207',
      'http://localhost:53243',
    ],
  },
};

@NgModule({
  declarations: [AppComponent, HeaderComponent, MessageDialogComponent],
  imports: [
    FormsModule,
    BrowserModule,
    AppRoutingModule,
    LoaderModule,
    HttpClientModule,
    BrowserAnimationsModule,
    MatDialogModule,
    JwtModule.forRoot(JWT_Module_Options),
    ProjectdetailsModule,
    ProjectsListModule,
  ],
  providers: [
    {
      provide: APP_INITIALIZER,
      useFactory: setupAppConfigServiceFactory,
      deps: [
        AppConfigService
      ],
      multi: true
    },
    {
      provide: HTTP_INTERCEPTORS,
      useClass: HttpConfigInterceptor,
      multi: true,
    },
    LoaderService,
    HttpCancelService
  ],
  bootstrap: [AppComponent],
})
export class AppModule { }
