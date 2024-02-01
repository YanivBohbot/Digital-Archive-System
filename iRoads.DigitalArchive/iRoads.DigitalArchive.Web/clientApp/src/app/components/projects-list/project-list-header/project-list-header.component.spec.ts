import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ProjectListHeaderComponent } from './project-list-header.component';

describe('ProjectListHeaderComponent', () => {
  let component: ProjectListHeaderComponent;
  let fixture: ComponentFixture<ProjectListHeaderComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ProjectListHeaderComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ProjectListHeaderComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
