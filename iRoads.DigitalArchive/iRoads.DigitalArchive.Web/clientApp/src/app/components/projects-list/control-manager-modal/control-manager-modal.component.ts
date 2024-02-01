import { Component, Inject } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { ProjectsListService } from 'src/app/services/projects-list.service';

@Component({
  selector: 'app-control-manager-modal',
  templateUrl: './control-manager-modal.component.html',
  styleUrls: ['./control-manager-modal.component.scss'],
})


export class ControlManagerModalComponent {

  controlManager: any;
  
  constructor(@Inject(MAT_DIALOG_DATA) private data: any,
    private fb: FormBuilder,
    protected projectsSvc: ProjectsListService,
    public matDialogRef: MatDialogRef<ControlManagerModalComponent>
  ) {
    this.projectsSvc.getControlManagers().subscribe((res: any) => {
      this.projectsSvc.controlManagersList = res;
      //if (res.indexOf("") == -1)
      //  this.projectsSvc.controlManagersList.unshift("");
    });

  }

  onSelectChanged(event: any) {
   

  }

  save() {
    this.matDialogRef.close(this.controlManager);
    //this.matDialogRef.disableClose = true;//disable default close operation
    //this.matDialogRef.backdropClick().subscribe(result => {
    //  this.matDialogRef.close(this.controlManager);
    //});
  }
}
