import { Component, OnInit } from '@angular/core';
import { User } from './common/user';
import { AuthenticationService } from './services/authentication.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  title = 'zoran-demo-front';

  user: User;
  loggedIn: boolean = false;
  userName: string;

  constructor(private authenticationService: AuthenticationService) {}

  
  ngOnInit() {
    this.user = this.authenticationService.getUserFromLocalCache();
    this.userName = this.user.firstName;

    if (this.user !== undefined) {
      this.loggedIn = true;
    }

    console.log(this.user.firstName);

  }
}
