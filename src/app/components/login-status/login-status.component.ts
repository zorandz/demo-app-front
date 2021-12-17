import { Component, HostListener, OnDestroy, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Subscription } from 'rxjs';
import { AuthenticationService } from 'src/app/services/authentication.service';

@Component({
  selector: 'app-login-status',
  templateUrl: './login-status.component.html',
  styleUrls: ['./login-status.component.css']
})
export class LoginStatusComponent implements OnInit, OnDestroy {

  isHeAuthorized: boolean = false;
  authenticated: boolean;
  subscription: Subscription;
  firstName: string = localStorage.getItem("firstName")
  dropdownString: string = "ss";


  constructor(private authService: AuthenticationService) { 
    this.subscription = this.authService.isUserLogged.subscribe(data => 
      this.authenticated = data
      )
  }

  
  ngOnInit(): void {
    this.isAuthenticated();
    this.isAuthorized();
  }
  /*
  @HostListener("window:click")
  closeDropdown() {
    if (this.dropdownString == "dropIt") {
      this.dropdownString = "ss";
      console.log("mislim")
    }
  }
*/
  isAuthorized() {
    this.isHeAuthorized = this.authService.isAuthorized(JSON.parse(localStorage.getItem('user')));
    console.log(this.isAuthorized);
  }

  dropdown(input: string) {
    if (this.dropdownString == input) {
      this.dropdownString = "ss";
    } else {
      this.dropdownString = "dropIt";
    }
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
    this.dropdownString = "ss"
  }

  
  ngOnDestroy() {
    this.subscription.unsubscribe();
  }

}
