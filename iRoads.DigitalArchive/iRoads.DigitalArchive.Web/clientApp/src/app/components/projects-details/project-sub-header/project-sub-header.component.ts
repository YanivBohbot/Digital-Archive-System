import { Component, Input, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { SystemType } from 'src/app/enum/generalEnums.enum';
import { ProjectsInfoService } from 'src/app/services/projects-info.service';

@Component({
  selector: 'app-project-sub-header',
  templateUrl: './project-sub-header.component.html',
  styleUrls: ['./project-sub-header.component.scss'],
})
export class ProjectSubHeaderComponent implements OnInit {
  systemType = SystemType;
  constructor(
    private router: Router,
    protected projectInfoSvc: ProjectsInfoService
  ) {}

  ngOnInit() {}

  goBackToProjectList() {
    localStorage.removeItem('pageState');
    localStorage.removeItem('expandedState');
    sessionStorage.setItem('return', 'true');
    this.router.navigate(['']);
  }
}
