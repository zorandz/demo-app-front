import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-login-status',
  templateUrl: './login-status.component.html',
  styleUrls: ['./login-status.component.css']
})
export class LoginStatusComponent implements OnInit {

  isAuthenticated: boolean = false;
  userFullName!: string;

  constructor() { }
    
  ngOnInit(): void {
    // subscribe to authentication state changes
 /*   this.oktaAuthService.authState$.subscribe(
      (result) => {
        this.isAuthenticated = result.isAuthenticated;
        this.getUserDetails();
      }

    )
    */
  }
  getUserDetails() {
/*    if (this.isAuthenticated) {

      // fetch the logged in user details (user's claims)

      //user full name is exposed as a property name
      this.oktaAuth.getUser().then(
        res => {
          this.userFullName = res.name;

   //       this.storage.setItem('userEmail', JSON.stringify(res.email));

   */
        }
//  )}}

  logout() {
    // Terminates the session with Okta 
    // and removes current tokens.

   // this.oktaAuth.signOut();    
  
  }

}
