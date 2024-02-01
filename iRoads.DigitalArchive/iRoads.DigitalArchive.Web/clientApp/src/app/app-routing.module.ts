import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AuthGuard } from './auth.guard';

const routes: Routes = [
  { path: 'project', loadChildren: () => import('./modules/projectdetails/projectdetails.module').then(m => m.ProjectdetailsModule) , canActivate: [AuthGuard]},
  { path: '', loadChildren: () => import('./modules/projects-list/projects-list.module').then(m => m.ProjectsListModule), canActivate: [AuthGuard] }
];

@NgModule({
  imports: [RouterModule.forRoot(routes, { useHash: true })],
  exports: [RouterModule],
  providers: [AuthGuard]
})
export class AppRoutingModule { }
