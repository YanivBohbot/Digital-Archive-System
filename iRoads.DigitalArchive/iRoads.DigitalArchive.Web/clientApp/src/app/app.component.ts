import { Component } from '@angular/core';
import { MatIconRegistry } from '@angular/material/icon';
import { DomSanitizer } from '@angular/platform-browser';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'clientApp';


  constructor(private matIconRegistry: MatIconRegistry, private domSanitizer: DomSanitizer) {
    console.log("0.1.0.10");
    this.matIconRegistry.addSvgIcon(
      'star',
      this.domSanitizer.bypassSecurityTrustResourceUrl(
        '../assets/images/star.svg'
      )
    );
    this.matIconRegistry.addSvgIcon(
      'star-fill',
      this.domSanitizer.bypassSecurityTrustResourceUrl(
        '../assets/images/star-fill.svg'
      )
    );
    this.matIconRegistry.addSvgIcon(
      'star-header',
      this.domSanitizer.bypassSecurityTrustResourceUrl(
        '../assets/images/star-header.svg'
      )
    );
  }
}
