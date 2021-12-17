import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { Routes } from '@angular/router';
import { HTTP_INTERCEPTORS } from '@angular/common/http';
import { CheckoutComponent } from './components/checkout/checkout.component';
import { ProductDetailsComponent } from './components/product-details/product-details.component';
import { CartDetailsComponent } from './components/cart-details/cart-details.component';
import { UserManagementModule } from './user-management/user-management/user-management.module';
import { AuthInterceptor } from './auth.interceptor';
import { AuthenticationGuard } from './guard/authentication.guard';
import { NotificationModule } from './notification.module';
import { AdminDashboardModule } from './admin-dashboard/module/admin-dashboard/admin-dashboard.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { NotificationService } from './services/notification.service';

const routes: Routes = [
]

@NgModule({
  declarations: [    
    CheckoutComponent, ProductDetailsComponent, CartDetailsComponent,
  ],
  imports: [
    AppRoutingModule,
    UserManagementModule,
    BrowserModule,
    AdminDashboardModule,
    ReactiveFormsModule,
    FormsModule,
    NotificationModule
  ],
  providers: [ NotificationService, AuthenticationGuard, { provide: HTTP_INTERCEPTORS, useClass: AuthInterceptor, multi: true }],
  bootstrap: [AppComponent],
})
export class AppModule { }
