import { ComponentFixture, TestBed } from '@angular/core/testing';
import { SubDataAreaComponent } from './sub-data-area.component';



describe('UpdatestatusbakaraComponent', () => {
  let component: SubDataAreaComponent;
  let fixture: ComponentFixture<SubDataAreaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SubDataAreaComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(SubDataAreaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
