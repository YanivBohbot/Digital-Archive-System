import { Component, OnInit } from '@angular/core';
import {
  FormControl,
  FormGroup,
  FormGroupDirective,
  Validators,
} from '@angular/forms';
import {
  DocStatusCodeEnum,
  RoleCode,
  Messages,
  PhaseApprovalStatus,
} from 'src/app/enum/generalEnums.enum';
import { documentToSave } from 'src/app/models/documentToSave';
import { LookupService } from 'src/app/services/shared/lookup.service';
import { SharedUserService } from 'src/app/services/shared/sharedUser.service';
import { UtilitiesService } from 'src/app/services/shared/utilities.service';
import { ProjectsInfoService } from '../../../../../services/projects-info.service';

@Component({
  selector: 'app-sub-data-area',
  templateUrl: './sub-data-area.component.html',
  styleUrls: ['./sub-data-area.component.scss'],
})
export class SubDataAreaComponent implements OnInit {
  isValidFormSubmitted = false;
  updateStatusForm!: FormGroup;
  statusCodeSelected!: number;
  flagrRejectReasonField = false;
  showCommentsField = true;
  statusBakaraList: any[] = [];
  isArchiv!: boolean;
  rejectionReasonsList: any[] = [];
  rejectionReasonsSelected!: number;
  readonly: boolean = false;
  disabled: boolean = false;
  user: any;
  docId!: string;
  selectedContract: any;
  manapCommentsForm!: FormGroup;
  constructor(
    private projectservice: ProjectsInfoService,
    protected lookupservice: LookupService,
    private sharedUserSvc: SharedUserService,
    private utilitiesSvc: UtilitiesService
  ) { }

  ngOnInit() {
    if (this.sharedUserSvc.getUser()?.Role === RoleCode.ARCHIVE) {
      this.isArchiv = true;
    } else {
      this.isArchiv = false;
    }

    this.updateStatusForm = new FormGroup({
      statusBakaraListController: new FormControl('', Validators.required),
      commentsController: new FormControl(''),
      rejectionReasonsListController: new FormControl('', Validators.required),
    });

    if (this.canLockComments()) {
      this.readonly = true;
      this.disabled = true;
      this.manapCommentsForm = new FormGroup({
      CommentsController: new FormControl<string>('',
       Validators.required),
      });
    }else{
      this.manapCommentsForm = new FormGroup({
        CommentsController: new FormControl<string>('',
         Validators.required),
        });
    }
  }

  canLockComments() {
    if (this.projectservice.level.Contract != null) {
      this.selectedContract = this.projectservice.level.Contracts.find(
        (itemcontract: any) =>
          itemcontract.ContractName === this.projectservice.contract
      );
      return (this.selectedContract.ArcStatusCode == PhaseApprovalStatus.COMPLETED
        && this.selectedContract.MamapStatusCode === PhaseApprovalStatus.COMPLETED);
    }
    return (this.projectservice.level.PhaseApprovalArcCode === PhaseApprovalStatus.COMPLETED
      && this.projectservice.level.PhaseApprovalMamapCode === PhaseApprovalStatus.COMPLETED);
 
  }

  onFormSubmit(updateStatusForm: any, formDirective: FormGroupDirective) {
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
      levelCode: this.projectservice.documentdetails.LevelCode,
      contract: this.projectservice.contract,
      docId: this.projectservice.documentdetails.DocId,
      sourceDocId: this.projectservice.documentdetails.SourceDocId,
      docStatus:
        this.updateStatusForm.controls['statusBakaraListController'].value,
      rejectReasonCode: selectedRejectionReason,
      controlComments: CommentReason,
      docType: this.projectservice.documentdetails.Type,
      docURL: this.projectservice.documentdetails.FileName,
      discipline: this.projectservice.documentdetails.Discipline
    };

    this.saveDocuments(docToSave);
    this.updateStatusForm.reset();
    formDirective.resetForm();
  }

  onManapCommentsSubmit(formDirective: FormGroupDirective) {
    if (this.manapCommentsForm.invalid) {
      return;
    }
    
    var docToSave: documentToSave = {
      projectId: this.projectservice.projectId,
      levelCode: this.projectservice.codeLevel,
      contract: this.projectservice.contract,
      docId: this.projectservice.documentdetails.DocId,
      sourceDocId: this.projectservice.documentdetails.SourceDocId,
      manhapComments:
        this.manapCommentsForm.controls['CommentsController'].value,
      docStatus: undefined,
      rejectReasonCode: undefined,
      controlComments: undefined,
      docType: this.projectservice.documentdetails.Type,
      docURL: this.projectservice.documentdetails.FileName,
      discipline: this.projectservice.documentdetails.Discipline
    };

    this.saveDocuments(docToSave);
    this.resetManapForm();
    formDirective.resetForm();
  }

  saveDocuments(documentToSave: any) {
    const that = this;
    this.projectservice
      .saveDocumentDetails(documentToSave)
      .subscribe((data: any) => {
        if (data.Status != 0 && data.Messages.length > 0) {
          this.utilitiesSvc.showOkMessage(
            Messages.SystemTitle,
            data.Messages[0].Text,
            Messages.OKBtn
          );
          return;
        }

        this.projectservice.documentdetails.DocId = data.Details.DocId;
        this.projectservice._refreshNeeds$.next();

        this.projectservice
          .getProjectLevels(this.projectservice.projectId)
          .subscribe((dataLevels: any) => {
            this.projectservice.levels = dataLevels['Data'];

            if (this.projectservice.levels.length != 0) {
              let selectedTab = this.projectservice.levels.find(
                (x) => x.codeLevel == this.projectservice.codeLevel
              );
              if (selectedTab) {
                let newCount = selectedTab.InvalidDocsCount;
                selectedTab.InvalidDocsCount = newCount;
              }
            }
          });
      });
  }
  statusCodeChange(selectedStatus: any) {
    switch (selectedStatus) {
      case DocStatusCodeEnum.VALID: {
        this.flagrRejectReasonField = false;

        this.updateStatusForm.controls[
          'rejectionReasonsListController'
        ].disable();
        this.showCommentsField = false;
        break;
      }
      case DocStatusCodeEnum.INVALID: {
        this.flagrRejectReasonField = true;
        this.updateStatusForm.controls[
          'rejectionReasonsListController'
        ].enable();
        this.showCommentsField = true;
        break;
      }
      case DocStatusCodeEnum.IRRELEVANT: {
        this.flagrRejectReasonField = false;
        this.updateStatusForm.controls[
          'rejectionReasonsListController'
        ].disable();
        this.showCommentsField = false;
        break;
      }
      default:
        this.flagrRejectReasonField = false;
        this.updateStatusForm.controls[
          'rejectionReasonsListController'
        ].disable();
        this.showCommentsField = true;
        break;
    }
  }

  resetForm() {
    this.updateStatusForm.reset();
  }
  resetManapForm() {
    this.manapCommentsForm.reset();
  }
}
