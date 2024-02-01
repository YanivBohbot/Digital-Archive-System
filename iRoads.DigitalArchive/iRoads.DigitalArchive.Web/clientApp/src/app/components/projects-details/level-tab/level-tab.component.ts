import {
  Component,
  Input,
  OnInit,
  ViewChild,
} from '@angular/core';
import { MatTabGroup } from '@angular/material/tabs';
import { ActivatedRoute, Router } from '@angular/router';
import { Subscription } from 'rxjs';
import {
  BuisnessLevel,
  Messages,
  StatusLevelDesc,
  SystemType,
} from 'src/app/enum/generalEnums.enum';
import { UtilitiesService } from 'src/app/services/shared/utilities.service';
import { UserService } from 'src/app/services/user.service';
import { ProjectsInfoService } from '../../../services/projects-info.service';


@Component({
  selector: 'app-level-tab',
  templateUrl: './level-tab.component.html',
  styleUrls: ['./level-tab.component.scss'],
})
export class LevelTabComponent implements OnInit {
  autorizedaction: any;
  yeshHozim: boolean = false;
  @Input() sugSystem: boolean = false;
  @Input() displayedColumnsNames: any;
  listHozim: any[] = [];
  projectId!: string;
  data: any;
  codeLevel!: number;
  contract!: string;
  stageLevelList: any;
  tabIndex!: number;
  ActiveTabIndex!: number;
  systemType: any;
  public levelsList!: any[];
  selectedContract: any;
  private subscription!: Subscription;

  @ViewChild('MatGroup') tabGroup!: MatTabGroup;

  updatedStatusLevel: any;
 
  constructor(
    private route: Router,
    private activatedRoute: ActivatedRoute,
    private userprojectInfoSvcice: UserService,
    private utilitiesSvc: UtilitiesService,
    protected projectInfoSvc: ProjectsInfoService
  ) {
    this.subscription = this.projectInfoSvc.levels$.subscribe(
      (levels: any[]) => {
        if (levels.length != 0 && this.tabGroup) {
          this.levelsList = levels;

          if (this.projectInfoSvc.systemType === SystemType.SAP) {
            this.levelsList = this.levelsList.filter((x: any) => {
              return x.LevelCode === BuisnessLevel.HESHBON_SOFI_KABLANI;
            });

            if ( this.levelsList.length == 0 || !this.projectInfoSvc.contract ) {
              this.utilitiesSvc.showOkMessage(
                Messages.SystemTitle,
                Messages.messageForUndefinedLevelBusinness,
                Messages.OKBtn
              );
            }

            if (this.levelsList[0]?.Contracts) {
              if (
                this.levelsList[0]?.Contracts.filter((y: any) => {
                  return ( y.ContractName.toString() ===  this.projectInfoSvc.contract );
                 }).length == 0
              ) {
                this.utilitiesSvc.showOkMessage(
                  Messages.SystemTitle,
                  Messages.messageForUndefinedLevelBusinness,
                  Messages.OKBtn
                );
              }
            }
            this.projectInfoSvc.codeLevel = this.levelsList[0].LevelCode;
          } else if (
            this.projectInfoSvc.systemType === SystemType.Default ||
            this.projectInfoSvc.systemType === SystemType.MNF
          ) {
          
            if (this.projectInfoSvc.codeLevel) {
              let indexTab = levels.findIndex(
                (x) => x.LevelCode == this.projectInfoSvc.codeLevel
              );
              this.tabGroup.selectedIndex = indexTab;
            }

            if (!this.projectInfoSvc.codeLevel) {
              var foundContractorLevelwithstatus = this.levelsList.filter(
                (x: any) => {
                  return (
                    x.LevelCode === BuisnessLevel.HESHBON_SOFI_KABLANI &&
                    x.BusinessLevelControlStatusDesc === StatusLevelDesc.NOT_COMPLETED );
                }
              );

              if (foundContractorLevelwithstatus.length > 0) {
                this.projectInfoSvc.codeLevel =
                  foundContractorLevelwithstatus[0].LevelCode;
                let indexTab = levels.findIndex(
                  (x) => x.LevelCode == this.projectInfoSvc.codeLevel
                );
                this.tabGroup.selectedIndex = indexTab;
              } else {
                var ControlnotyetcompletedLevels = this.levelsList.filter(
                  (x: any) => {
                    return (
                      x.BusinessLevelControlStatusDesc === StatusLevelDesc.NOT_COMPLETED );
                  }
                );
                if (ControlnotyetcompletedLevels.length > 0) {
                  const foundMinimumLevelWithStatus = this.levelsList.reduce(
                    (minItem, item) => {
                      if (
                        item.BusinessLevelControlStatusDesc === StatusLevelDesc.NOT_COMPLETED && item.LevelCode < minItem.LevelCode ) {
                        return item;
                      }
                      return minItem;
                    },
                    { LevelCode: Number.MAX_VALUE }
                  );

                  if (foundMinimumLevelWithStatus) {
                    this.projectInfoSvc.codeLevel = foundMinimumLevelWithStatus.LevelCode;
                    this.tabGroup.selectedIndex = foundMinimumLevelWithStatus.LevelCode - 1;
                  }
                }
              }
            }
          }
        }
      }
    );
  }

  ngOnDestroy() {
    this.subscription.unsubscribe();
  }

  ngOnInit() {
    this.projectId = this.projectInfoSvc.projectId;
    this.systemType = this.projectInfoSvc.systemType;
    this.contract = this.projectInfoSvc.contract;
  }

  async onTabChange(indexTab: any) {
    this.projectId = this.projectInfoSvc.projectId;
    this.projectInfoSvc.codeLevel = this.levelsList[indexTab].LevelCode;
    this.route.navigate([], {
      relativeTo: this.activatedRoute,
      queryParams: {
        id: this.projectInfoSvc.projectId,
        level: this.projectInfoSvc.codeLevel,
        contract: this.contract,
        s: this.systemType,
      },
      queryParamsHandling: 'merge',
    });
    this.userprojectInfoSvcice
      .getAuthorizedActionsForUserRole(
        this.projectId,
        this.projectInfoSvc.codeLevel,
        this.contract
      )
      .subscribe((data: any) => {
        if (data.Status != 0 && data.Messages.length > 0) {
          this.utilitiesSvc.showOkMessage(
            Messages.SystemTitle,
            data.Messages[0].Text,
            Messages.OKBtn
          );
          return;
        }
        this.projectInfoSvc.autorizedAction = data.Details['AllowActions'];
      });
  }

  ContractClicked(contract: any) {
    this.contract = contract.ContractName.toString();

    this.selectedContract = contract;
  }

  checkStatusDesc(item: any) {
    if (item.BusinessLevelControlStatusDesc == StatusLevelDesc.COMPLETED) {
      return 'status-success';
    } else if (
      item.BusinessLevelControlStatusDesc == StatusLevelDesc.NOT_COMPLETED
    ) {
      return 'status-failed';
    }
    return 'status-before';
  }
}
