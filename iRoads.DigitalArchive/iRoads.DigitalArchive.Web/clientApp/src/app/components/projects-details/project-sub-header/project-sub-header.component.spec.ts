import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ProjectSubHeaderComponent } from './project-sub-header.component';

describe('ProjectListSubHeaderComponent', () => {
  let component: ProjectSubHeaderComponent;
  let fixture: ComponentFixture<ProjectSubHeaderComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ProjectSubHeaderComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ProjectSubHeaderComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
