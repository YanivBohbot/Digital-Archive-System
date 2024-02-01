import { TestBed } from '@angular/core/testing';

import { ProjectsprojectInfoSvcice } from './projects-info.service';

describe('ProjectsprojectInfoSvcice', () => {
  let service: ProjectsprojectInfoSvcice;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ProjectsprojectInfoSvcice);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
