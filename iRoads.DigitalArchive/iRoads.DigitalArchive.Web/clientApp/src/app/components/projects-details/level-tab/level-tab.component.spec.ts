import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LevelTabComponent } from './level-tab.component';

describe('StepsTabComponent', () => {
  let component: LevelTabComponent;
  let fixture: ComponentFixture<LevelTabComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ LevelTabComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(LevelTabComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
