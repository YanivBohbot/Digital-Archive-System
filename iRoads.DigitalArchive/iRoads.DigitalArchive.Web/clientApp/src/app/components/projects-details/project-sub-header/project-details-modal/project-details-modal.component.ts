import { Component, OnInit, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { SystemType } from 'src/app/enum/generalEnums.enum';
import { ProjectsInfoService } from 'src/app/services/projects-info.service';

@Component({
  selector: 'app-project-details-modal',
  templateUrl: './project-details-modal.component.html',
  styleUrls: ['./project-details-modal.component.scss'],
})
export class ProjectDetailsModalComponent implements OnInit {
  constructor(
    @Inject(MAT_DIALOG_DATA) public data: any,
    private ref: MatDialogRef<ProjectDetailsModalComponent>,
    protected projectDetails: ProjectsInfoService
  ) {}

  systemType = SystemType;

  ngOnInit(): void {

  }

  Closepopup() {
    this.ref.close();
  }
}
