import { CommonModule } from '@angular/common';
import { HttpClientModule } from '@angular/common/http';
import { NgModule } from '@angular/core';
import { ReactiveFormsModule } from '@angular/forms';
import { RouterModule, Routes } from '@angular/router';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { DashboardComponent } from './admin-dashboard/admin-dashboard/admin-dashboard.component';
import { AppComponent } from './app.component';
import { CartDetailsComponent } from './components/cart-details/cart-details.component';
import { CartStatusComponent } from './components/cart-status/cart-status.component';
import { CheckoutComponent } from './components/checkout/checkout.component';
import { LoginStatusComponent } from './components/login-status/login-status.component';
import { ProductCategoryMenuComponent } from './components/product-category-menu/product-category-menu.component';
import { ProductDetailsComponent } from './components/product-details/product-details.component';
import { ProductListComponent } from './components/product-list/product-list.component';
import { SearchComponent } from './components/search/search.component';
import { NotificationModule } from './notification.module';

const routes: Routes = [ 
  // { path: 'order-history', component: OrderHistoryComponent },
{ path: 'category/:id', component: ProductListComponent },
{ path: 'category', component: ProductListComponent },
{ path: 'products', component: ProductListComponent },
  { path: 'checkout', component: CheckoutComponent},
 { path: 'cart-details', component: CartDetailsComponent},
 { path: 'products/:id', component: ProductDetailsComponent},
 { path: 'search/:keyword', component: ProductListComponent },
 { path: 'actuator', component: DashboardComponent},
 { path: '', redirectTo: '/products', pathMatch: 'full' },
 //{ path: '**', redirectTo: '/products', pathMatch: 'full' }
];

@NgModule({
  declarations: [
    AppComponent,
    SearchComponent,
    LoginStatusComponent,
    CartStatusComponent,
    ProductCategoryMenuComponent,
    ProductListComponent,
    LoginStatusComponent
  ],
  imports: [
    RouterModule.forRoot(routes), 
    CommonModule,
    NgbModule,
    HttpClientModule,
    ReactiveFormsModule,
    NotificationModule
  ],
  exports: [RouterModule,  AppComponent,
    SearchComponent,
    LoginStatusComponent,
    CartStatusComponent,
    ProductCategoryMenuComponent,
    ProductListComponent,
    LoginStatusComponent,
    CommonModule,
    NgbModule,
    HttpClientModule,
    ReactiveFormsModule,
    NotificationModule
  ]
})
export class AppRoutingModule { }
