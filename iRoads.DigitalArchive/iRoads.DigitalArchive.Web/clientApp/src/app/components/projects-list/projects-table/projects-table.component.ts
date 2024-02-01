import { formatDate } from '@angular/common';
import {
  AfterViewInit,
  Component,
  EventEmitter,
  Input,
  OnInit,
  ViewChild,
} from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MatPaginator, MatPaginatorIntl } from '@angular/material/paginator';
import { Sort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Route, Router } from '@angular/router';
import { ProjectsListService } from 'src/app/services/projects-list.service';
import { SharedUserService } from 'src/app/services/shared/sharedUser.service';
import { environment } from 'src/environments/environment';
import { RoleCode, Messages, StatusLevelDesc, PhaseApprovalStatus } from '../../../enum/generalEnums.enum';
import { ProjectsInfoService } from '../../../services/projects-info.service';
import { UtilitiesService } from '../../../services/shared/utilities.service';
import { HebrewPaginatorIntl } from '../../projects-details/level-tab/documents-list/hebrew-paginator-Intl';
import { ControlManagerModalComponent } from '../control-manager-modal/control-manager-modal.component';

@Component({
  selector: 'app-projects-table',
  templateUrl: './projects-table.component.html',
  styleUrls: ['./projects-table.component.scss'],
  providers: [{ provide: MatPaginatorIntl, useClass: HebrewPaginatorIntl }]

})

export class ProjectsTableComponent implements OnInit, AfterViewInit {
  displayEditControl = true;
  enableconsole = !environment.production;
  displayedColumnsNames = [
    'star',
    'projectNum',
    'projectDesc',
    'contractualContract',
    'currentControlStage',
    'currentControlDate',
    'controlStatusMMP',
    'controlStatusArchive',
    'controlOfficer',
    'MMP',
    'managementCompany',
  ];
  dataSource = new MatTableDataSource<any>([]);
  onlyFavorite = false;
  onlyMNHP = false;
  onlyInvalidDocument = false;
  onlyArchive = false;
  isExcel = false;
  sortedData!: any[];
  DEFAULT_PAGE_SIZE = 10;
  searchFields = {
    freeSearch: [''],
    currentControlStep: [''],
    startDate: [''],
    endDate: [''],
    controlStatusMMP: [''],
    archiveControlStatus: [''],
    controlOfficer: [''],
    WBS: [''],
    tenders: [''],
    road: [''],
    junctionOrInterchange: [''],
    contractorContract: [''],
    operationsDivision: [''],
    constructor: [''],
    managementCompany: [''],
    MMP: [''],
    MNHP: ['']
  };

  @Input() searchEventInChild: EventEmitter<any> = new EventEmitter();
  @Input() clearEventInChild: EventEmitter<any> = new EventEmitter();

  pageSize = this.DEFAULT_PAGE_SIZE;
  pageNumber = 0;
  totalSize = 0;
  @ViewChild(MatPaginator) paginator: MatPaginator;

  constructor(
    public dialog: MatDialog,
    private projectsSvc: ProjectsListService,
    private utilitiesSvc: UtilitiesService,
    private router: Router,
    private projectInfoScv: ProjectsInfoService,
    private sharedUserSvc: SharedUserService,
    private utilitiesService: UtilitiesService
  ) { }

  handlePage(event: any) {
    var data = sessionStorage.getItem("data") || null;
    let indexChanged = event.previousPageIndex != event.pageIndex;
    let pageSizeChanged = event.pageSize != this.pageSize;
    this.pageNumber = event.pageIndex;
    this.pageSize = event.pageSize;
    sessionStorage.setItem("pageSize", this.pageSize + '');
    sessionStorage.setItem("pageNumber", this.pageNumber + '');
    this.iterator();
    if (data && (indexChanged || pageSizeChanged)) {
        var getdata = sessionStorage.getItem('data');
        if (getdata != null) {
            let updatedData= JSON.parse(getdata);
               updatedData['pageNumber'] = this.pageNumber;
               updatedData['pageSize'] = this.pageSize;
              sessionStorage.setItem('data', JSON.stringify(updatedData));
        }
        data = JSON.parse(sessionStorage['data']);
    }
    this.getProjects(data);
  }

  sortData(sort: Sort) {
    const data = this.dataSource.data.slice();
    if (!sort.active || sort.direction === '') {
      this.sortedData = data;
      return;
    }

    this.sortedData = data.sort((a: any, b: any) => {
      const isAsc = sort.direction === 'asc';
      switch (sort.active) {
        case 'contractualContract':
          return compare(
            a['contractualContract'],
            b['contractualContract'],
            isAsc
          );
        default:
          return 0;
      }
    });
  }

  onExcelClicked(event: any) {
    this.isExcel = true;
    this.getProjects(null);
  }

  changeFavorite(element: any) {
    element.IsFavorite = !element.IsFavorite;
    this.projectsSvc.updateFavorite({
      ProjectId: element.ProjectId,
      IsFavorite: element.IsFavorite,
      LevelCode: element.CurrentLevel,
      Contract: element.Contracts
    }).subscribe(
      (res: any) => { })
  }

  onSearchClicked(event: any) {

    this.searchFields = event;
    this.pageNumber = 0;
    this.getProjects(null);
  }

  ngAfterViewInit() {

    //this.paginator._intl.itemsPerPageLabel = 'שורות לעמוד:';

    this.dataSource.paginator = this.paginator;
    this.displayEditControl = this.sharedUserSvc.getUser()?.Role == RoleCode.ARCHIVE || this.sharedUserSvc.getUser()?.Role == RoleCode.ARCHIVE_MANAGER;
  }

  checkStatusControlMMP(element: any) {
    if (element.MamapStatus == PhaseApprovalStatus.COMPLETED) {
      return 'status-success';
    } else if (element.MamapStatus == PhaseApprovalStatus.NOT_COMPLETED) {
      return 'status-failed';
    }
    return 'status-before';
  }

  checkStatusControlArch(element: any) {
    if (element.ArchivStatus == PhaseApprovalStatus.COMPLETED) {
      return 'status-success';
    } else if (element.ArchivStatus == PhaseApprovalStatus.NOT_COMPLETED) {
      return 'status-failed';
    }
    return 'status-before';
  }

  download(data: any, fileName: any) {
    var octetStreamMime = 'application/octet-stream';
    var success = false;



    // Get the headers
    // headers = getResponseHeaders();



    // Get the filename from the x-filename header or default to "download.bin"
    var filename = fileName;



    // Determine the content type from the header or default to "application/octet-stream"
    var contentType = octetStreamMime;



    var binary_string = window.atob(data);
    var len = binary_string.length;
    var bytes = new Uint8Array(len);
    for (var i = 0; i < len; i++) {
      bytes[i] = binary_string.charCodeAt(i);
    }
    data = bytes;
    try {
      // Try using msSaveBlob if supported
      var blob = new Blob([data], { type: contentType });


      // Try using other saveBlob implementations, if available
      var saveBlob = (navigator as any).webkitSaveBlob || (navigator as any).mozSaveBlob || (navigator as any).saveBlob;
      if (saveBlob === undefined) throw "Not supported";
      // saveBlob(blob, filename);

      success = true;
    } catch (ex) {

    }
    if (!success) {
      // Get the blob url creator
      var urlCreator = window.URL || (window as any).webkitURL || (window as any).mozURL || (window as any).msURL;
      if (urlCreator) {
        // Try to use a download link
        var link = document.createElement('a');
        if ('download' in link) {
          // Try to simulate a click
          try {
            // Prepare a blob URL



            var blob = new Blob([data], { type: contentType });
            var url = urlCreator.createObjectURL(blob);
            link.setAttribute('href', url);



            // Set the download attribute (Supported in Chrome 14+ / Firefox 20+)
            link.setAttribute("download", filename);



            // Simulate clicking the download link
            var event = document.createEvent('MouseEvents');
            event.initMouseEvent('click', true, true, window, 1, 0, 0, 0, 0, false, false, false, false, 0, null);
            link.dispatchEvent(event);
            success = true;
          } catch (ex) {
          }
        }
        if (!success) {
          // Fallback to window.location method
          try {
            // Prepare a blob URL
            // Use application/octet-stream when using window.location to force download



            var blob = new Blob([data], { type: octetStreamMime });
            var url = urlCreator.createObjectURL(blob);
            (window as any).location = url;
            success = true;
          } catch (ex) {



          }
        }
      }
    }
    if (!success) {
      alert('היצוא נכשל');
    }
  }

  async getProjects(data: any) {
    let startDate = this.searchFields.startDate.toString() != '' ? formatDate(this.searchFields.startDate.toLocaleString(), "yyyy-MM-dd", "en-GB") : this.searchFields.startDate;
    let endDate = this.searchFields.endDate.toString() != '' ? formatDate(this.searchFields.endDate.toLocaleString(), "yyyy-MM-dd", "en-GB") : this.searchFields.endDate;
    if (data == null) {
      data = {
        pageNumber: this.pageNumber,
        pageSize: this.pageSize,
        IsExcel: this.isExcel,
        ProjectDescription: this.searchFields.freeSearch,
        LevelCode: this.searchFields.currentControlStep,
        StartLevelDate: startDate,
        EndLevelDate: endDate,
        MamapStatus: this.searchFields.controlStatusMMP,
        ArchivStatus: this.searchFields.archiveControlStatus,
        ControllerManager: this.searchFields.controlOfficer,
        WBS: this.searchFields.WBS,
        Tender: this.searchFields.tenders,
        Road: this.searchFields.road,
        Interchange: this.searchFields.junctionOrInterchange,
        Contract: this.searchFields.contractorContract,
        OperationDepartment: this.searchFields.operationsDivision,
        OperatingContractor: this.searchFields.constructor,
        Company: this.searchFields.managementCompany,
        Mamap: this.searchFields.MMP,
        Manhap: this.searchFields.MNHP,
        DisplayFavoriteProjects: this.onlyFavorite,
        DisplayManhapCommentsProjects: this.onlyMNHP,
        DisplayInvalidDocsProjects: this.onlyInvalidDocument,
        DisplayArchivedProjects: this.onlyArchive


      }
    }

    sessionStorage.setItem("data", JSON.stringify(data));
    this.projectsSvc.getProjectsList(data).subscribe(
      (res: any) => {
        if (!res || (res.Status != 0 && res.Messages.length > 0)) {
          this.utilitiesSvc.showOkMessage(
            Messages.SystemTitle,
            res.Messages[0].Text,
            Messages.OKBtn
          );
          return;
        }
        if (this.isExcel) {
          this.isExcel = false;

          this.download(res.Details.Excel, "export_project_list.xlsx")
          return;
        }
        this.totalSize = res.TotalRows;
        res = res.Details.Projects;

        this.dataSource = new MatTableDataSource(res);

        this.sortedData = this.dataSource.data.slice()

        this.iterator();
        this.paginator.pageIndex = this.pageNumber;

      }
    )
  }

  navigateToProjectDetailsPage(element: any) {

    let contract = element.Contracts;
    let projectId = element.ProjectId;
    let codeLevel = element.CurrentLevel;

    this.router.navigate(['/project/'], {
      queryParams: { id: projectId, level: codeLevel, contract: contract }
    });
  }

  private iterator() {
    const end = (this.pageNumber + 1) * this.pageSize;
    const start = this.pageNumber * this.pageSize;

  }

  ngOnInit(): void {

    let data = null;
    if (sessionStorage.getItem("pageSize") != undefined) {
      this.pageSize = parseInt(sessionStorage["pageSize"]);
    }

    if (sessionStorage.getItem("return") == "true") {
      if (sessionStorage.getItem("data")) {
        data = JSON.parse(sessionStorage['data']);
        this.pageNumber = parseInt(sessionStorage["pageNumber"]);
        this.onlyFavorite = data.DisplayFavoriteProjects;
        this.onlyMNHP = data.DisplayManhapCommentsProjects;
        this.onlyInvalidDocument = data.DisplayInvalidDocsProjects;
      }
      else {
        this.pageSize = this.DEFAULT_PAGE_SIZE;
        this.pageNumber = 0;
        this.onlyFavorite = false;
        this.onlyMNHP = false;
        this.onlyInvalidDocument = false;
      }
    }

    if (this.searchEventInChild) {
      this.searchEventInChild.subscribe((data) => {
        this.onSearchClicked(data);
      });
    }

    if (this.clearEventInChild) {
      this.clearEventInChild.subscribe((data) => {
        this.clearSearch();
      });
    }

    this.getProjects(data);
  }

  clearSearch() {
    this.pageNumber = 0;
    this.onlyFavorite = false;
    this.onlyMNHP = false;
    this.onlyInvalidDocument = false;
  }

  openDialog(element: any) {
    if (!this.displayEditControl) return;
    let dialogRef = this.dialog.open(ControlManagerModalComponent);
    dialogRef.afterClosed().subscribe((res) => {
      if (res !== element.ControlManager) {
        element.ControlManager = res;
        this.updateProjectFn(element)
      }
    });

    dialogRef.componentInstance.controlManager = element.ControlManager;
  }

  updateProjectFn(element: any) {
    var updatedProject = {
      projectID: element.ProjectId,
      controlManager: element.ControlManager
    };

    this.projectInfoScv.updateProjectDetails(updatedProject).subscribe(
      (data: any) => {

        if (data.Status != 0 && data.Messages.length > 0) {
          this.utilitiesService.showOkMessage(
            Messages.SystemTitle,
            data.Messages[0].Text,
            Messages.OKBtn
          );
          return;
        }
      },
      (error: any) => { }
    );

  }
}


function compare(a: number | string, b: number | string, isAsc: boolean) {
  return (a < b ? -1 : 1) * (isAsc ? 1 : -1);
}
