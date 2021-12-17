import { Component, Input, OnInit } from '@angular/core';
import { of } from 'rxjs';
import { delay } from 'rxjs/operators';

@Component({
  selector: 'app-snackbar',
  templateUrl: './snackbar.component.html',
  styleUrls: ['./snackbar.component.css']
})
export class SnackbarComponent implements OnInit {
  @Input() public message = '';
  public isShown = false;

  constructor() { }

  ngOnInit(): void {
   

  }

  public showMessage(message: string): void {
    this.isShown = true;
    this.message = message;

    const subscription = of(null).pipe(delay(5000)).subscribe({
      complete: () => {
        this.isShown = false;
        subscription.unsubscribe();
      }
    });
  }

  

}
