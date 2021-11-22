import { Component, OnDestroy, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';
import { AuthenticationService } from 'src/app/services/authentication.service';

@Component({
  selector: 'app-login-status',
  templateUrl: './login-status.component.html',
  styleUrls: ['./login-status.component.css']
})
export class LoginStatusComponent implements OnInit, OnDestroy {

  authenticated: boolean;
  subscription: Subscription;
  firstName: string = localStorage.getItem("firstName")
  


  constructor(private authService: AuthenticationService) { 
    this.subscription = this.authService.isUserLogged.subscribe(data => 
      this.authenticated = data
      )
  }
    
  ngOnInit(): void {
    this.isAuthenticated();
  }

  isAuthenticated() {
    this.authenticated = this.authService.isUserLoggedIn();
  }

  
  getNameFromCache() {
    this.firstName = localStorage.getItem("firstName");
  }
  
  onLogout() {
    this.authService.logOut();
    localStorage.clear();
    this.authenticated = false;
  }

  
  saveFirstNameToCache() {

  }


  ngOnDestroy() {
    this.subscription.unsubscribe();
  }

}
