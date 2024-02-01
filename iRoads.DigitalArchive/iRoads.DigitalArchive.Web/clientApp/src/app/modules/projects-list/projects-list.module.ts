import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Routes } from '@angular/router';
import { ProjectsListComponent } from 'src/app/components/projects-list/projects-list.component';
import { MatTableModule } from '@angular/material/table';
import { MatButtonModule } from '@angular/material/button';
import { MatFormFieldModule } from '@angular/material/form-field';
import { ProjectListHeaderComponent } from 'src/app/components/projects-list/project-list-header/project-list-header.component';
import { SearchAreaComponent } from 'src/app/components/projects-list/project-list-header/search-area/search-area.component';
import { ProjectsTableComponent } from 'src/app/components/projects-list/projects-table/projects-table.component';
import { MatIconModule } from '@angular/material/icon';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { MatSelectModule } from '@angular/material/select';
import { MatInputModule } from '@angular/material/input';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatNativeDateModule, MAT_DATE_LOCALE } from '@angular/material/core';
import { MatSortModule } from '@angular/material/sort';
import { MatDialogModule } from '@angular/material/dialog';
import { MatPaginatorModule } from '@angular/material/paginator';
import { ControlManagerModalComponent } from 'src/app/components/projects-list/control-manager-modal/control-manager-modal.component';
import { MatAutocompleteModule } from '@angular/material/autocomplete';

const routes: Routes = [{ path: '', component: ProjectsListComponent }];

@NgModule({
  declarations: [
    ProjectsListComponent,
    ProjectListHeaderComponent,
    SearchAreaComponent,
    ProjectsTableComponent,
    ControlManagerModalComponent,
  ],
  imports: [
    FormsModule,
    CommonModule,
    RouterModule.forChild(routes),
    MatTableModule,
    MatButtonModule,
    MatFormFieldModule,
    MatIconModule,
    MatSelectModule,
    MatCheckboxModule,
    ReactiveFormsModule,
    MatInputModule,
    MatDatepickerModule,
    MatNativeDateModule,
    MatSortModule,
    MatDialogModule,
    MatPaginatorModule,
    MatAutocompleteModule
  ],
  exports: [],
  providers: [
    { provide: MAT_DATE_LOCALE, useValue: 'he-HE' }
  ],
})
export class ProjectsListModule {}
