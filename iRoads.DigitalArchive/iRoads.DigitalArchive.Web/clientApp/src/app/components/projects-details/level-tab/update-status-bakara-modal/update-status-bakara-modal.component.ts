import { Component, OnInit, Inject } from '@angular/core';
import { FormGroup, Validators, FormControl } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import {
  DocStatusCodeEnum,
  Messages
} from 'src/app/enum/generalEnums.enum';
import { documentModel } from 'src/app/models/documentModel';
import { documentToSave } from 'src/app/models/documentToSave';
import { ProjectsInfoService } from 'src/app/services/projects-info.service';
import { LookupService } from 'src/app/services/shared/lookup.service';
import { UtilitiesService } from 'src/app/services/shared/utilities.service';


@Component({
  selector: 'app-update-status-bakara-modal',
  templateUrl: './update-status-bakara-modal.component.html',
  styleUrls: ['./update-status-bakara-modal.component.scss'],
})
export class UpdateStatusBakaraModalComponent implements OnInit {
  isValidFormSubmitted = false;
  updateStatusForm!: FormGroup;
  statusCodeSelected!: number;
  rejectionReasonsSelected!: number;
  statusBakaraList: any[] = [];
  rejectionReasonsList: any[] = [];
  showRejectReasonField = false;
  showCommentsField = true;
  statusBakara!: string;

  constructor(
    @Inject(MAT_DIALOG_DATA) public document: documentModel,
    private ref: MatDialogRef<UpdateStatusBakaraModalComponent>,
    private projectservice: ProjectsInfoService,
    private utilitiesService: UtilitiesService,
    private lookupservice: LookupService
  ) {
    this.updateStatusForm = new FormGroup({
      statusBakaraListController: new FormControl('', Validators.required),
      commentsController: new FormControl(''),
      rejectionReasonsListController: new FormControl('', Validators.required),
    });
  }

  ngOnInit() {
     if (!this.document.SourceDocId){
      this.statusBakaraList = this.lookupservice.statusBakaraList.filter(item => item.Code != DocStatusCodeEnum.VALID);
    }
    else{
      this.statusBakaraList = this.lookupservice.statusBakaraList;
    }
    this.rejectionReasonsList = this.lookupservice.rejectionReasonsList;
  }

  Closepopup() {
    this.ref.close();
  }

  updateStatusBakara() {
    this.projectservice;
  }

  onFormSubmit() {
    
    if (this.updateStatusForm.invalid) {
      return;
    }

    const selectedStatus = this.updateStatusForm.get(
      'statusBakaraListController'
    )?.value;
    let selectedRejectionReason = '';
    let CommentReason = '';

    if (selectedStatus === DocStatusCodeEnum.INVALID) {
      selectedRejectionReason = this.updateStatusForm.get(
        'rejectionReasonsListController'
      )?.value;
      CommentReason = this.updateStatusForm.get('commentsController')?.value;
    }
    
    var docToSave: documentToSave = {
      projectId: this.projectservice.projectId,
      levelCode: this.document.LevelCode,
      contract: this.projectservice.contract,
      docId: this.document.DocId,
      sourceDocId: this.document.SourceDocId,
      manhapComments: this.document.ManhapComments,
      docStatus:
        this.updateStatusForm.controls['statusBakaraListController'].value,
      rejectReasonCode: selectedRejectionReason,
      controlComments: CommentReason,
      docType: this.document.Type,
      docURL: this.document.FileName,
      discipline: this.document.Discipline
    };

    if (this.updateStatusForm.controls['statusBakaraListController'].value ===
        DocStatusCodeEnum.INVALID &&
      !this.updateStatusForm.controls['rejectionReasonsListController'].value) {
      this.utilitiesService.showOkMessage(
        Messages.SystemTitle,
        Messages.MustRejectionsReasons,
        Messages.OKBtn
      );
    }

    this.projectservice
      .saveDocumentDetails(docToSave)
      .subscribe((data: any) => {
        if (data.Status != 0 && data.Messages.length > 0) {
          this.utilitiesService.showOkMessage(
            Messages.SystemTitle,
            data.Messages[0].Text,
            Messages.OKBtn
          );
          return;
        }

        this.projectservice.documentdetails = data.Details;
        this.projectservice
          .getProjectLevels(this.projectservice.projectId)
          .subscribe((data: any) => {
            this.projectservice.levels = data['Data'];

            if (this.projectservice.levels.length != 0) {
              this.projectservice.getlevelsSub.next(this.projectservice.levels);
              this.projectservice._refreshDocumentList$.next();
            }
          });
      });
  }

  statusCodeChange(selectedStatus: any) {
    switch (selectedStatus) {
      case DocStatusCodeEnum.VALID: {
        this.showRejectReasonField = false;
        this.updateStatusForm.controls[
          'rejectionReasonsListController'
        ].disable();
        this.showCommentsField = false;
        break;
      }
      case DocStatusCodeEnum.INVALID: {
        this.showRejectReasonField = true;
        this.updateStatusForm.controls[
          'rejectionReasonsListController'
        ].enable();
        this.showCommentsField = true;
        break;
      }
      case DocStatusCodeEnum.IRRELEVANT: {
        this.showRejectReasonField = false;
        this.updateStatusForm.controls[
          'rejectionReasonsListController'
        ].disable();
        this.showCommentsField = false;
        break;
      }
      default:
        this.showRejectReasonField = false;
        this.updateStatusForm.controls[
          'rejectionReasonsListController'
        ].disable();
        this.showCommentsField = true;
        break;
    }
  }

  resetForm(form: FormGroup) {
    form.reset();
  }


}
