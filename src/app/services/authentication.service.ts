import { Injectable } from '@angular/core';
import { HttpClient, HttpResponse, HttpErrorResponse } from '@angular/common/http';
import { environment } from '../../environments/environment';
import { BehaviorSubject, Observable } from 'rxjs';
import { User } from '../common/user';
import { JwtHelperService } from '@auth0/angular-jwt';
import { ActivatedRoute, Route, Router } from '@angular/router';
import { Role } from '../common/enum/role';
import { User2 } from '../common/user2';


@Injectable({providedIn: 'root'})
export class AuthenticationService {
  public host = environment.ApiUrl;
  private jwtHelper = new JwtHelperService();
  private token: string;
  private loggedInUsername: string;
  public isUserLogged: BehaviorSubject<boolean> = new BehaviorSubject<boolean>(false);
  public isUserAuthorized: BehaviorSubject<boolean> = new BehaviorSubject<boolean>(false);


  constructor(private http: HttpClient, private route: Router) {}

  public login(user: User): Observable<HttpResponse<User2>> {
    return this.http.post<User2>(`${this.host}/user/login`, user, { observe: 'response' });
  }

  public register(user: User): Observable<User> {
    return this.http.post<User>(`${this.host}/user/register`, user);
  }

  public logOut(): void {
    this.token = null;
    this.loggedInUsername = null;
    localStorage.removeItem('user');
    localStorage.removeItem('token');
    localStorage.removeItem('users');
    this.route.navigateByUrl("/products");
    this.isUserAuthorized.next(false);
    this.isUserLogged.next(false);
  }

  public saveToken(token: string): void {
    this.token = token;
    localStorage.setItem('token', token);
  }

  public addUserToLocalCache(user: User): void {
    localStorage.setItem('user', JSON.stringify(user));
  }

  public getUserFromLocalCache(): User {
    return JSON.parse(localStorage.getItem('user'));
  }
  
  public loadToken(): void {
    this.token = localStorage.getItem('token');
  }

  public getToken(): string {
    return this.token;
  }

  public isAuthorized(user: User): boolean {
    if (user.role == Role.ADMIN || user.role == Role.SUPER_ADMIN) {
      return true;
    } else {
     return false;
    }
  }

  public isUserLoggedIn(): boolean {
    this.loadToken();
    if (this.token != null && this.token !== ''){
      if (this.jwtHelper.decodeToken(this.token).sub != null || '') {
        if (!this.jwtHelper.isTokenExpired(this.token)) {
          this.loggedInUsername = this.jwtHelper.decodeToken(this.token).sub;
          return true;
        }
      }
    } else {
      this.logOut();
      return false;
    }
    return false;
  }

}
