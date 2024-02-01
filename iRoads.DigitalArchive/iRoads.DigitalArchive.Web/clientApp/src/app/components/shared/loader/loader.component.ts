import { Component, Input, OnInit, OnDestroy, ChangeDetectorRef  } from '@angular/core';

import { Subscription } from 'rxjs';
import { LoaderService, LoaderState } from 'src/app/services/shared/loader/loader.service';


@Component({
  
  selector: 'loader',
  templateUrl: 'loader.component.html'
})

export class LoaderComponent implements OnInit, OnDestroy{

  @Input() loaderText: string ="טוען נתונים...";
  @Input() showManual!: boolean;
  show: boolean = false;
  private subscription!: Subscription;

  constructor(private loaderService: LoaderService, private _changeDetectorRef: ChangeDetectorRef) { 

    this.subscription = this.loaderService.loaderState
      .subscribe((state: LoaderState) => {
        this.show = state.show;
        this._changeDetectorRef.detectChanges();
      });
  }

  ngOnInit() {
   
  }
  
  ngOnDestroy() {
    this.subscription.unsubscribe();
  }
}
