import { Component, EventEmitter, Output } from '@angular/core';
import { environment } from '../../../../environments/environment';

@Component({
  selector: 'app-project-list-header',
  templateUrl: './project-list-header.component.html',
  styleUrls: ['./project-list-header.component.scss']
})
export class ProjectListHeaderComponent {
  enableconsole = !environment.production;

  @Output() searchEventParent = new EventEmitter<any>();
  @Output() clearEventParent = new EventEmitter<any>();

  searchEventParentFn(event: any) {
    this.searchEventParent.emit(event);
  }

  clearClickedFN() {
    this.clearEventParent.emit();
  }
}
