import { Component, EventEmitter, Output } from '@angular/core';
import { Subject } from 'rxjs/internal/Subject';
import { environment } from '../../../environments/environment';

@Component({
  selector: 'app-projects-list',
  templateUrl: './projects-list.component.html',
  styleUrls: ['./projects-list.component.scss']
})
export class ProjectsListComponent {
  enableconsole = !environment.production;
  notify: EventEmitter<any> = new EventEmitter();
  clearNotify: EventEmitter<any> = new EventEmitter();

  searchEventIsClicked(event: any) {
    this.notify.emit(event);

  }

  clearEventIsClicked() {
    this.clearNotify.emit();

  }

  
}
