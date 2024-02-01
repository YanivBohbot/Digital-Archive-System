import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import {
  BuisnessLevel,
  Messages,
  SystemType,
} from 'src/app/enum/generalEnums.enum';
import { ProjectsInfoService } from 'src/app/services/projects-info.service';
import { UtilitiesService } from 'src/app/services/shared/utilities.service';
import { LookupService } from 'src/app/services/shared/lookup.service';
import { AuthService } from '../../services/shared/auth.service';

@Component({
  selector: 'app-projects-details',
  templateUrl: './projects-details.component.html',
  styleUrls: ['./projects-details.component.scss'],
})
export class ProjectsDetailsComponent implements OnInit {
  DetailsProject: any;
  codeError: number | undefined;
  DocumentsList: any[] = [];
  projectId!: string;
  codeLevel!: number;
  contract!: string;
  stageLevelList: any;
  autorizedaction: any;
  systemType: any;
  selectedIndex: any;

  constructor(
    private activatedRoute: ActivatedRoute,
    private utilitiesSvc: UtilitiesService,
    private projectInfoSvc: ProjectsInfoService,
    private lookupservice: LookupService,
    private auth: AuthService
  ) {
    this.activatedRoute.queryParams.subscribe((params) => {
      this.contract = params['contract'];

      let projectId = params['id'];
      this.projectId = projectId;
      let codeLevel = params['level'];
      this.codeLevel = parseInt(codeLevel!);
      this.projectInfoSvc.projectId = this.projectId;
      this.projectInfoSvc.codeLevel =
        this.projectInfoSvc.systemType == SystemType.SAP
          ? BuisnessLevel.HESHBON_SOFI_KABLANI
          : this.codeLevel;

      this.projectInfoSvc.contract = this.contract;
      this.projectInfoSvc.selectedContract = this.projectInfoSvc.level?.Contracts?.find(
        (itemcontract: any) =>
          itemcontract.ContractName === this.contract
      );
    });


    if (this.projectInfoSvc.systemType === SystemType.SAP) {
      this.projectInfoSvc.getRefreshScreen.subscribe((data: any) => {
        this.GetProjectDetails(undefined, this.contract);
      })
    }
  }

  ngOnInit() {
    this.lookupservice
      .getLookupsByList(['RejectReason', 'DocumentStatus', 'DesignatedSpace'])
      .subscribe((data: any) => {
        this.lookupservice.saveLookups(data.Data);
        this.lookupservice.merhavlist =
          this.lookupservice.getLookupByName('DesignatedSpace');
        this.lookupservice.statusBakaraList =
          this.lookupservice.getLookupByName('DocumentStatus');
        this.lookupservice.rejectionReasonsList =
          this.lookupservice.getLookupByName('RejectReason');
      });

    if (this.projectInfoSvc.systemType != SystemType.SAP) {
      this.GetProjectDetails(this.projectId, this.contract);
    } else {
      this.GetProjectDetails(undefined, this.contract);
    }

    this.auth.getUserRole(this.projectId)


  }

  GetProjectDetails(projectId?: string, contract?: string) {

    this.projectInfoSvc
      .getProjectDetails(projectId, contract)
      .subscribe((data: any) => {
       
        if (data.Status != 0 && data.Messages.length > 0) {
          this.utilitiesSvc.showOkMessage(
            Messages.SystemTitle,
            data.Messages[0].Text,
            Messages.OKBtn
          );
          return;
        } else {

          this.projectInfoSvc.detailsProject = data['Details'];
          this.projectInfoSvc.merhavAgaf = this.projectInfoSvc.detailsProject.MerhavAgaf;
          const contracts = this.projectInfoSvc.detailsProject.Contracts;
          this.projectInfoSvc.detailsProject.Contracts = contracts.replace(/^,|,$/g, "");
          this.projectInfoSvc.projectId =  this.projectInfoSvc.detailsProject?.ProjectId;

          if (this.projectInfoSvc.detailsProject) {
            this.projectInfoSvc.detailsProject.ProjectLevels =
              this.projectInfoSvc.detailsProject.ProjectLevels.sort(
                (a: any, b: any) => a.LevelDate.localeCompare(b.LevelDate)
              );
          }

          this.projectInfoSvc
            .getProjectLevels(this.projectInfoSvc.projectId)
            .subscribe(
              (data: any) => {

                if (data.Status != 0 && data.Messages.length > 0) {
                  this.utilitiesSvc.showOkMessage(
                    Messages.SystemTitle,
                    data.Messages[0].Text,
                    Messages.OKBtn
                  );
                  return;
                } else {
                  this.stageLevelList = data['Data'];

                  this.projectInfoSvc.levels = this.stageLevelList;
                  if (this.projectInfoSvc.levels.length != 0) {
                
                    this.projectInfoSvc.getlevelsSub.next(this.projectInfoSvc.levels);
                  }
                }
              },
              (error: any) => { }
            );

            this.projectInfoSvc.sendProjectDetails.next(data['Details']);
        }
      });
  }
}
