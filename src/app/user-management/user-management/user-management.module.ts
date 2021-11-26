import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Routes } from '@angular/router';
import { HttpClientModule } from '@angular/common/http';
import { LoginComponent } from '../components/login/login.component';
import { RegisterComponent } from '../components/register/register.component';
import { UserComponent } from '../components/user/user.component'
import { AuthenticationGuard } from 'src/app/guard/authentication.guard';
import { FormsModule } from '@angular/forms';
import { NotificationModule } from 'src/app/notification.module';
import { NotifierModule } from 'angular-notifier';

const routes: Routes = [ 
  { path: 'register', component: RegisterComponent },
  { path: 'login', component: LoginComponent },
  { path: 'user/management', component: UserComponent, canActivate: [AuthenticationGuard]},
 // { path: '', redirectTo: '/login', pathMatch: 'full' }
];


@NgModule({
  declarations: [
    LoginComponent,
    RegisterComponent,
    UserComponent,
  ],
  imports: [
    CommonModule,
    HttpClientModule,
    FormsModule,
    RouterModule.forRoot(routes)
  ],
  exports: [
    LoginComponent,
    RegisterComponent,
    UserComponent,
    RouterModule,
  ],
  providers: [ AuthenticationGuard ],

})
export class UserManagementModule { }
