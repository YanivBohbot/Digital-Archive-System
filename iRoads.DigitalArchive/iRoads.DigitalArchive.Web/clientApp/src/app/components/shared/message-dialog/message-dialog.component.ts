import { Component, Inject, NgModule, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';


@Component({
  selector: 'app-message-dialog',
  templateUrl: './message-dialog.component.html',
})
export class MessageDialogComponent implements OnInit {

  constructor(public dialogRef: MatDialogRef<MessageDialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: DialogData) { }

  ngOnInit(): void {
  }

  cancel() {
    if (this.data.cancelEvent) {
      this.data.cancelEvent();
    }
    this.dialogRef.close();
  }

  close() {
    if (this.data.okEvent) {
      this.data.okEvent();
    }
    this.dialogRef.close();
  }



  
}

interface DialogData {
  title: string;
  message: string;
  cancelButton?: string;
  okButton: string;
  okEvent?: any;
  cancelEvent?: any;
}
