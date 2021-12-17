import { Component, OnInit, OnDestroy, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { HttpResponse, HttpErrorResponse } from '@angular/common/http';
import { BehaviorSubject, Subscription } from 'rxjs';
import { AuthenticationService } from '../../../services/authentication.service';
import { NotificationService } from '../../../services/notification.service';
import { User } from '../../../common/user';
import { NotificationType } from '../../../common/enum/notification-type';
import { HeaderType } from '../../../common/enum/header-type';
import { Role } from 'src/app/common/enum/role';
import { SnackbarComponent } from 'src/app/components/snackbar/snackbar.component';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit, OnDestroy {
  public showLoading: boolean;
  private subscriptions: Subscription[] = [];
  notify: boolean;

  constructor(private router: Router, private authService: AuthenticationService,
              private notificationService: NotificationService) {}

  ngOnInit(): void {
    if (this.authService.isUserLoggedIn()) {
      this.router.navigateByUrl('/user/management');
    } else {
      this.router.navigateByUrl('/login');
    }
  }

  public onLogin(user: User): void {
    this.showLoading = true;
    this.subscriptions.push(
      this.authService.login(user).subscribe(
        (response: HttpResponse<User>) => {
          console.log(response)
          localStorage.setItem("firstName", response.body.firstName);
          localStorage.setItem("user", JSON.stringify(response.body))
          const token = response.headers.get(HeaderType.JWT_TOKEN);
          this.authService.saveToken(token);
          this.authService.addUserToLocalCache(response.body);
          this.showLoading = false;
          this.authService.isUserAuthorized.next(this.isAuthorized(response.body));
          this.authService.isUserLogged.next(true);
          this.sendNotification(NotificationType.SUCCESS, "You successfully logged in!");
          this.notify = true;
          this.refresh();
        },
        (errorResponse: HttpErrorResponse) => {
          this.sendErrorNotification(NotificationType.ERROR, errorResponse.error.message);
          this.showLoading = false;
          this.notify = true;
        }
      )
    );
  }

  
  public isAuthorized(user: User): boolean {
    if (user.role == Role.ADMIN || user.role == Role.SUPER_ADMIN) {
      return true;
    } else {
     return false;
    }
  }

  private isAuthorizedString(user: User): string {
    if (this.isAuthorized(user)) {
      return "true";
    } else {
      return "false";
    }
  }

  private sendErrorNotification(notificationType: NotificationType, message: string): void {
    if (message) {
      this.notificationService.notify(notificationType, message);
    } else {
      this.notificationService.notify(notificationType, 'An error occurred. Please try again.');
    }
  }


  private sendNotification(notificationType: NotificationType, message: string): void {
    if (message) {
      this.notificationService.notify(notificationType, message);
      setTimeout(()=>{                           
        this.notify = false;
   }, 4000);
    } else {
      this.notificationService.notify(notificationType, 'An error occurred. Please try again.');
      setTimeout(()=>{                           
        this.notify = false;
   }, 4000);
    }
  }

  ngOnDestroy(): void {
    this.subscriptions.forEach(sub => sub.unsubscribe());
  }

  refresh(): void {
    window.location.reload();
    }

}

