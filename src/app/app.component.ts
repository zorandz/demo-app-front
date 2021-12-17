import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { BehaviorSubject } from 'rxjs';
import { User } from './common/user';
import { AuthenticationService } from './services/authentication.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  title = 'zoran-demo-front';
  disappear: boolean;

  portfolioMode: boolean = false;
  router: Router;
  showNotifier: boolean = false;
  
  constructor(private _router: Router) {
    this.router = _router;
  }

  onClick() {
    this.disappear = !this.disappear;
  }
  
  ngOnInit() {
  }
}
