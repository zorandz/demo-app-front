import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, Router } from '@angular/router';
import { AuthenticationService } from '../services/authentication.service';
import { NotificationService } from '../services/notification.service';
import { NotificationType } from '../common/enum/notification-type';
import { Role } from '../common/enum/role';

@Injectable({providedIn: 'root'})
export class AuthenticationGuard implements CanActivate {

  constructor(private authenticationService: AuthenticationService, private router: Router,
              private notificationService: NotificationService) {}

  canActivate(next: ActivatedRouteSnapshot, state: RouterStateSnapshot): boolean {
    return this.isUserLoggedIn();
  }

  private isUserLoggedIn(): boolean {

    if (!this.authenticationService.isUserLoggedIn) {
      return false;
    }

    if (localStorage.getItem(JSON.parse("user").role) != Role.SUPER_ADMIN) {
      this.notificationService.notify(NotificationType.ERROR, `Unauthorized to access this page.`);
      return false;
    }

    if (this.authenticationService.isUserLoggedIn()) {
      return true;
    }
    this.router.navigate(['/login']);
    this.notificationService.notify(NotificationType.ERROR, `You need to log in to access this page`);
    return false;
  }

}
