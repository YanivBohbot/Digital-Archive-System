import { AfterContentChecked, AfterContentInit, AfterViewChecked, AfterViewInit, ChangeDetectorRef, Component, EventEmitter, OnInit, Output } from '@angular/core';
import { FormBuilder, FormControl } from '@angular/forms';
import { DateAdapter } from '@angular/material/core';
import { map, startWith } from 'rxjs';
import { Observable } from 'rxjs/internal/Observable';
import { environment } from '../../../../../environments/environment';
import { ProjectsListService } from '../../../../services/projects-list.service';
import { LookupService } from '../../../../services/shared/lookup.service';

@Component({
  selector: 'app-search-area',
  templateUrl: './search-area.component.html',
  styleUrls: ['./search-area.component.scss']
})
export class SearchAreaComponent implements OnInit, AfterViewInit {
  list = ['הכל'];
  showMoreDetails = false;
  enableconsole = !environment.production;
  startDate: any;

  WBSFilteredOptions: Observable<string[]>;
  controlOfficerFilteredOptions: Observable<string[]>;
  tendersFilteredOptions: Observable<string[]>;
  roadFilteredOptions: Observable<string[]>;
  junctionOrInterchangeFilteredOptions: Observable<string[]>;
  contractsFilteredOptions: Observable<string[]>;
  operationsDivisionFilteredOptions: Observable<string[]>;
  constructorFilteredOptions: Observable<string[]>;
  managementCompanyFilteredOptions: Observable<string[]>;
  MMPFilteredOptions: Observable<string[]>;
  MNHPFilteredOptions: Observable<string[]>;



  @Output() searchClicked = new EventEmitter<any>();
  @Output() clearClicked = new EventEmitter<any>();

  WBSControl = new FormControl();
  controlOfficerControl = new FormControl();
  tendersControl = new FormControl();
  roadControl = new FormControl();
  junctionOrInterchangeControl = new FormControl();
  contractsControl = new FormControl();
  operationsDivisionControl = new FormControl();
  constructorDivisionControl = new FormControl();
  managementCompanyControl = new FormControl();
  MMPControl = new FormControl();
  MNHPControl = new FormControl();

  searchForm = this.fb.group({
    freeSearch: [''],
    currentControlStep: [''],
    startDate: [''],
    endDate: [''],
    controlStatusMMP: [''],
    archiveControlStatus: [''],
    controlOfficer: this.controlOfficerControl,
    WBS: this.WBSControl,
    tenders: this.tendersControl,
    road: this.roadControl,
    junctionOrInterchange: this.junctionOrInterchangeControl,
    contractorContract: this.contractsControl,
    operationsDivision: this.operationsDivisionControl,
    constructor: this.constructorDivisionControl,
    managementCompany: this.managementCompanyControl,
    MMP: this.MMPControl,
    MNHP: this.MNHPControl
  });
  combo: any = {
    ControlManagers: [],
    WBS: [],
    Tenders: [],
    Roads: [],
    Intersects: [],
    Contracts: [],
    Agaf: [],
    Contractors: [],
    Company: [],
    Mamap: [],
    Manhap: [],

  }
  BusinessLevel: any = []
  PhaseApprovalStatus: any = []

  constructor(private fb: FormBuilder,
    private lookupservice: LookupService,
    private listServ: ProjectsListService) {
  }
  ngAfterViewInit(): void {

  }

  ngOnInit(): void {
    this.lookupservice
      .getLookupsByList(['BusinessLevel', 'PhaseApprovalStatus'])
      .subscribe((data: any) => {
        this.lookupservice.saveLookups(data.Data);
        this.BusinessLevel = this.lookupservice.getLookupByName("BusinessLevel");
        this.PhaseApprovalStatus = this.lookupservice.getLookupByName("PhaseApprovalStatus").map((x: any) => Object.assign({}, x));
        this.PhaseApprovalStatus.unshift({ Code: -1, Description: 'הכל' });

      });


    this.searchForm = this.fb.group({
      freeSearch: [''],
      currentControlStep: [''],
      startDate: [''],
      endDate: [''],
      controlStatusMMP: [''],
      archiveControlStatus: [''],
      controlOfficer: this.controlOfficerControl,
      WBS: this.WBSControl,
      tenders: this.tendersControl,
      road: this.roadControl,
      junctionOrInterchange: this.junctionOrInterchangeControl,
      contractorContract: this.contractsControl,
      operationsDivision: this.operationsDivisionControl,
      constructor: this.constructorDivisionControl,
      managementCompany: this.managementCompanyControl,
      MMP: this.MMPControl,
      MNHP: this.MNHPControl
    });
    this.listServ.getCombos().subscribe((res: any) => {
      this.combo = res.Details;

      this.WBSFilteredOptions = this.WBSControl.valueChanges.pipe(
        startWith(''),
        map(value => this._filter(value || '', this.combo.WBS)),
      );

      this.controlOfficerFilteredOptions = this.controlOfficerControl.valueChanges.pipe(
        startWith(''),
        map(value => this._filter(value || '', this.combo.ControlManagers)),
      );

      this.tendersFilteredOptions = this.tendersControl.valueChanges.pipe(
        startWith(''),
        map(value => this._filter(value || '', this.combo.Tenders)),
      );

      this.roadFilteredOptions = this.roadControl.valueChanges.pipe(
        startWith(''),
        map(value => this._filter(value || '', this.combo.Roads)),
      );

      this.contractsFilteredOptions = this.contractsControl.valueChanges.pipe(
        startWith(''),
        map(value => this._filter(value || '', this.combo.Contracts)),
      );

      this.junctionOrInterchangeFilteredOptions = this.junctionOrInterchangeControl.valueChanges.pipe(
        startWith(''),
        map(value => this._filter(value || '', this.combo.Intersects)),
      );

      this.managementCompanyFilteredOptions = this.managementCompanyControl.valueChanges.pipe(
        startWith(''),
        map(value => this._filter(value || '', this.combo.Company)),
      );

      this.MMPFilteredOptions = this.MMPControl.valueChanges.pipe(
        startWith(''),
        map(value => this._filter(value || '', this.combo.Mamap)),
      );

      this.MNHPFilteredOptions = this.MNHPControl.valueChanges.pipe(
        startWith(''),
        map(value => this._filter(value || '', this.combo.Manhap)),
      );

      this.operationsDivisionFilteredOptions = this.operationsDivisionControl.valueChanges.pipe(
        startWith(''),
        map(value => this._filter(value || '', this.combo.Agaf)),
      );

      this.constructorFilteredOptions = this.constructorDivisionControl.valueChanges.pipe(
        startWith(''),
        map(value => this._filter(value || '', this.combo.Contractors)),
      );

    })

    this.initCombos();



  }

  private initCombos() {
    if (sessionStorage.getItem("return") == "true") {
      var data = JSON.parse(sessionStorage['data']);
      this.searchForm.controls['freeSearch'].setValue(data.ProjectDescription);
      this.searchForm.controls['currentControlStep'].setValue(data.LevelCode);
      this.searchForm.controls['startDate'].setValue(data.StartLevelDate);
      this.searchForm.controls['endDate'].setValue(data.EndLevelDate);
      this.searchForm.controls['controlStatusMMP'].setValue(data.MamapStatus);
      this.searchForm.controls['archiveControlStatus'].setValue(data.ArchivStatus);
      this.WBSControl.setValue(data.WBS);
      this.controlOfficerControl.setValue(data.ControllerManager);
      this.tendersControl.setValue(data.Tender);
      this.roadControl.setValue(data.Road);
      this.junctionOrInterchangeControl.setValue(data.Interchange);
      this.contractsControl.setValue(data.Contract);
      this.operationsDivisionControl.setValue(data.OperationDepartment);
      this.constructorDivisionControl.setValue(data.OperatingContractor);
      this.managementCompanyControl.setValue(data.Company);
      this.MMPControl.setValue(data.Mamap);
      this.MNHPControl.setValue(data.Manhap);
      sessionStorage.setItem("return", "false")
      this.showMoreDetails = sessionStorage['showMoreDetails'] === 'true'

    } else {
      this.WBSControl.setValue('');
      this.controlOfficerControl.setValue('');
      this.tendersControl.setValue('');
      this.roadControl.setValue('');
      this.junctionOrInterchangeControl.setValue('');
      this.contractsControl.setValue('');
      this.operationsDivisionControl.setValue('');
      this.constructorDivisionControl.setValue('');
      this.managementCompanyControl.setValue('');
      this.MMPControl.setValue('');
      this.MNHPControl.setValue('');
    }
  }

  private _filter(value: string, list: any): string[] {
    const filterValue = value.toLowerCase();

    return list.filter((option: string) => option.toLowerCase().includes(filterValue));
  }

  clearSearch() {
    this.clearClicked.emit()

    this.searchForm = this.fb.group({
      freeSearch: [''],
      currentControlStep: [''],
      startDate: [''],
      endDate: [''],
      controlStatusMMP: [''],
      archiveControlStatus: [''],
      controlOfficer: this.controlOfficerControl,
      WBS: this.WBSControl,
      tenders: this.tendersControl,
      road: this.roadControl,
      junctionOrInterchange: this.junctionOrInterchangeControl,
      contractorContract: this.contractsControl,
      operationsDivision: this.operationsDivisionControl,
      constructor: this.constructorDivisionControl,
      managementCompany: this.managementCompanyControl,
      MMP: this.MMPControl,
      MNHP: this.MNHPControl
    });
    this.WBSControl.setValue('');
    this.controlOfficerControl.setValue('');
    this.tendersControl.setValue('');
    this.roadControl.setValue('');
    this.junctionOrInterchangeControl.setValue('');
    this.contractsControl.setValue('');
    this.operationsDivisionControl.setValue('');
    this.constructorDivisionControl.setValue('');
    this.managementCompanyControl.setValue('');
    this.MMPControl.setValue('');
    this.MNHPControl.setValue('');

    this.searchByFilters(null);


  }

  onDateChange() {
    this.startDate = this.searchForm.value.startDate;
  }

  searchByFilters(event: any) {
    sessionStorage.setItem("showMoreDetails", this.showMoreDetails.toString().toLowerCase())
    this.searchClicked.emit(this.searchForm.value);

  }
}


