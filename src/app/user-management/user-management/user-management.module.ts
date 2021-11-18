import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes } from '@angular/router';
import { HttpClientModule } from '@angular/common/http';
import { LoginComponent } from 'src/app/user-management/components/login/login.component';
import { RegisterComponent } from '../components/register/register.component';
import { UserComponent } from '../components/user/user.component'

const routes: Routes = [ 
  // { path: 'order-history', component: OrderHistoryComponent },
];


@NgModule({
  declarations: [
    LoginComponent,
    RegisterComponent,
    UserComponent
  ],
  imports: [
    CommonModule,
    HttpClientModule
  ],
  exports: [
    LoginComponent,
    RegisterComponent,
    UserComponent
  ]
})
export class UserManagementModule { }
