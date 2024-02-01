import { ComponentFixture, TestBed } from '@angular/core/testing';
import { AuthorizationLevelModalComponent } from './authorization-level-modal.component';



describe('AuthorizationLevelComponent', () => {
  let component: AuthorizationLevelModalComponent;
  let fixture: ComponentFixture<AuthorizationLevelModalComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AuthorizationLevelModalComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(AuthorizationLevelModalComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
