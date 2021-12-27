import { AfterViewInit, Component, HostListener, OnDestroy, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Subscription } from 'rxjs';
import { AuthenticationService } from 'src/app/services/authentication.service';


@Component({
  selector: 'app-login-status',
  templateUrl: './login-status.component.html',
  styleUrls: ['./login-status.component.css']
})
export class LoginStatusComponent implements OnInit, AfterViewInit, OnDestroy {

  isHeAuthorized: boolean = false;
  authenticated: boolean;
  subscription: Subscription;
  firstName: string = localStorage.getItem("firstName")
  dropdownString: string = "ss";
  isMobile: boolean;


  constructor(private authService: AuthenticationService) { 
    this.subscription = this.authService.isUserLogged.subscribe(data => 
      this.authenticated = data
      )
  }

  
  ngOnInit(): void {
    this.isAuthenticated();
    this.isAuthorized();

    this.isMobile = this.getIsMobile();
    window.onresize = () => {
      this.isMobile = this.getIsMobile();
    };

 //   window.onresize = () => this.isTablet = window.innerWidth <= 769;
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

  getIsMobile(): boolean {
    const w = document.documentElement.clientWidth;
    const breakpoint = 769;
    if (w < breakpoint) {
      return true;
    } else {
      return false;
    }
  }

  getRefreshBtnChange(): boolean {
    const w = document.documentElement.clientWidth;
    const breakpoint = 1000;
    if (w < breakpoint) {
      return true;
    } else {
      return false;
    }
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
    this.refresh();
  }

  ngAfterViewInit(): void {
    this.isMobile = this.getIsMobile();
    window.onresize = () => {
      this.isMobile = this.getIsMobile();
    };
  }

  refresh(): void {
    window.location.reload();
  }

  ngOnDestroy() {
    this.subscription.unsubscribe();
  }

}
