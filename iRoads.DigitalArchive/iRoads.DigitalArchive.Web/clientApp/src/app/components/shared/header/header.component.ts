import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { SystemType } from 'src/app/enum/generalEnums.enum';
import { ProjectsInfoService } from 'src/app/services/projects-info.service';
import { SharedUserService } from 'src/app/services/shared/sharedUser.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss'],
})
export class HeaderComponent {
  systemeName: string = 'מערכת בקרה פרויקטים';
  screenName: string = 'בקרת תיק פרויקט';

  systemType :any;
  system = SystemType
  flagRikuz!: boolean;
  flagMenifa!: boolean;
  flagSAP!: boolean;

  constructor(
    protected sharedUserSvc: SharedUserService,
    private activatedRoute: ActivatedRoute,
    protected projectInfoSvc: ProjectsInfoService
  ) {
    this.activatedRoute.queryParams.subscribe((params: any) => {
      this.systemType = params['s'];
      this.projectInfoSvc.systemType = this.systemType ?? SystemType.Default;
    
    });
  }

  ngOninit() {}



 
}
