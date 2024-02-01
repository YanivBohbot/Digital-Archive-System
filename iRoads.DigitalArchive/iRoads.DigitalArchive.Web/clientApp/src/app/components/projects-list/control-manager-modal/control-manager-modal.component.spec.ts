import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ControlManagerModalComponent } from './control-manager-modal.component';

describe('ControlManagerModalComponent', () => {
  let component: ControlManagerModalComponent;
  let fixture: ComponentFixture<ControlManagerModalComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ControlManagerModalComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ControlManagerModalComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
