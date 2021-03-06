import { CUSTOM_ELEMENTS_SCHEMA, NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Routes } from '@angular/router';
import { HttpClientModule } from '@angular/common/http';
import { LoginComponent } from '../components/login/login.component';
import { RegisterComponent } from '../components/register/register.component';
import { UserComponent } from '../components/user/user.component'
import { AuthenticationGuard } from 'src/app/guard/authentication.guard';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { NotificationModule } from 'src/app/notification.module';
import { PortfolioComponent } from '../components/portfolio/portfolio.component';
import { SnackbarComponent } from 'src/app/components/snackbar/snackbar.component';

const routes: Routes = [ 
  { path: 'register', component: RegisterComponent },
  { path: 'login', component: LoginComponent },
  { path: 'user/management', component: UserComponent, canActivate: [AuthenticationGuard]},
  { path: 'portfolio', component: PortfolioComponent }
 // { path: '', redirectTo: '/login', pathMatch: 'full' }
];


@NgModule({
  declarations: [
    LoginComponent,
    RegisterComponent,
    UserComponent,
    PortfolioComponent,
    SnackbarComponent,

  ],
  imports: [
    CommonModule,
    HttpClientModule,
    FormsModule,
    RouterModule.forRoot(routes),
    ReactiveFormsModule,
    NotificationModule,
  ],
  exports: [
    LoginComponent,
    RegisterComponent,
    UserComponent,
    RouterModule,
    NotificationModule
  ],
  providers: [ AuthenticationGuard ],
  schemas: [ CUSTOM_ELEMENTS_SCHEMA ]

})
export class UserManagementModule { }
