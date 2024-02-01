import { NgModule } from '@angular/core';
import { CommonModule, DatePipe } from '@angular/common';
import { RouterModule, Routes } from '@angular/router';
import { ProjectsDetailsComponent } from 'src/app/components/projects-details/projects-details.component';
import { MatTableModule } from '@angular/material/table';
import { MatButtonModule } from '@angular/material/button';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatSelectModule } from '@angular/material/select';
import { MatIconModule } from '@angular/material/icon';
import { MatTabsModule } from '@angular/material/tabs';
import { ProjectSubHeaderComponent } from 'src/app/components/projects-details/project-sub-header/project-sub-header.component';
import { DetailsComponent } from 'src/app/components/projects-details/project-sub-header/details/details.component';

import { MatDialogModule } from '@angular/material/dialog';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatInputModule } from '@angular/material/input';
import {MatBadgeModule} from '@angular/material/badge';
import { UpdateStatusBakaraModalComponent } from 'src/app/components/projects-details/level-tab/update-status-bakara-modal/update-status-bakara-modal.component';
import { MatPaginatorModule } from '@angular/material/paginator';
import { AddManhapCommentsModalComponent } from 'src/app/components/projects-details/level-tab/add-manhap-comments-modal/add-manhap-comments-modal.component';
import { DocumentHistoryComponent } from 'src/app/components/projects-details/level-tab/document-history/document-history.component';
import { SubDataAreaComponent } from 'src/app/components/projects-details/level-tab/document-history/sub-data-area/sub-data-area.component';
import { DocumentsListComponent } from 'src/app/components/projects-details/level-tab/documents-list/documents-list.component';
import { LevelTabSubHeaderComponent } from 'src/app/components/projects-details/level-tab/level-tab-sub-header/level-tab-sub-header.component';
import { LevelTabComponent } from 'src/app/components/projects-details/level-tab/level-tab.component';
import { ProjectDetailsModalComponent } from 'src/app/components/projects-details/project-sub-header/project-details-modal/project-details-modal.component';
import { AuthorizationLevelModalComponent } from 'src/app/components/projects-details/level-tab/level-tab-sub-header/authorization-level-modal/authorization-level-modal.component';
import { OrderByPipe } from 'src/app/pipes/order-by.pipe';

const routes: Routes = [
  { path: '', component: ProjectsDetailsComponent },
];

@NgModule({
  declarations: [
    ProjectsDetailsComponent,
    ProjectSubHeaderComponent,
    DetailsComponent,
    LevelTabSubHeaderComponent,
    ProjectDetailsModalComponent,
    LevelTabComponent,
    DocumentsListComponent,
    AddManhapCommentsModalComponent,
    UpdateStatusBakaraModalComponent,
    DocumentHistoryComponent,
    SubDataAreaComponent,
    AuthorizationLevelModalComponent,
    OrderByPipe
    
  ],
  imports: [
    CommonModule,
    RouterModule.forChild(routes),
    MatTableModule,
    MatButtonModule,
    MatFormFieldModule,
    MatSelectModule,
    MatIconModule,
    MatTabsModule,
    MatBadgeModule,
    MatDialogModule,
    FormsModule,
    MatInputModule,
    ReactiveFormsModule,
    MatPaginatorModule,
    
  ],
  exports: [
    ProjectsDetailsComponent,
    ProjectSubHeaderComponent,
    DetailsComponent,
  ],
  providers: [DatePipe],
})
export class ProjectdetailsModule {}
