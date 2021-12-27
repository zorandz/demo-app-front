import { CommonModule } from '@angular/common';
import { HttpClientModule } from '@angular/common/http';
import { CUSTOM_ELEMENTS_SCHEMA, NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { RouterModule, Routes } from '@angular/router';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { NotifierModule } from 'angular-notifier';
import { DashboardComponent } from './admin-dashboard/admin-dashboard/admin-dashboard.component';
import { AppComponent } from './app.component';
import { AddProductComponent } from './components/add-product/add-product.component';
import { CartDetailsComponent } from './components/cart-details/cart-details.component';
import { CartStatusComponent } from './components/cart-status/cart-status.component';
import { CheckoutComponent } from './components/checkout/checkout.component';
import { LoginStatusComponent } from './components/login-status/login-status.component';
import { ProductCategoryMenuComponent } from './components/product-category-menu/product-category-menu.component';
import { ProductDetailsComponent } from './components/product-details/product-details.component';
import { ProductListComponent } from './components/product-list/product-list.component';
import { RibbonComponent } from './components/ribbon/ribbon.component';
import { SearchComponent } from './components/search/search.component';
import { NotificationModule } from './notification.module';
import { OwnerComponent } from './components/owner/owner.component';
import { NotificationService } from './services/notification.service';

const routes: Routes = [ 
  // { path: 'order-history', component: OrderHistoryComponent },
{ path: 'category/:id', component: ProductListComponent },
{ path: 'category', component: ProductListComponent },
// { path: 'products', redirectTo: '/login' },
{ path: 'products', component: ProductListComponent },
  { path: 'checkout', component: CheckoutComponent},
 { path: 'cart-details', component: CartDetailsComponent},
 { path: 'products/:id', component: ProductDetailsComponent},
 { path: 'search/:keyword', component: ProductListComponent },
 { path: 'actuator', component: DashboardComponent},
 //{ path: '', redirectTo: '/products', pathMatch: 'full' },
 { path: '', redirectTo: '/login', pathMatch: 'full' },
 { path: 'add-product-form', component: AddProductComponent },
 { path: 'about-owner', component: OwnerComponent },
 //{ path: '**', redirectTo: '/login', pathMatch: 'full' }
];

@NgModule({

  declarations: [
    AppComponent,
    SearchComponent,
    LoginStatusComponent,
    CartStatusComponent,
    ProductCategoryMenuComponent,
    ProductListComponent,
    LoginStatusComponent,
    AddProductComponent,
    RibbonComponent,
    OwnerComponent
  ],
  imports: [
    RouterModule.forRoot(routes, { useHash: true }), 
    CommonModule,
    NgbModule,
    HttpClientModule,
    ReactiveFormsModule,
    NotificationModule,
    FormsModule
  ],
  exports: [RouterModule,  AppComponent,
    SearchComponent,
    LoginStatusComponent,
    CartStatusComponent,
    ProductCategoryMenuComponent,
    ProductListComponent,
    LoginStatusComponent,
    AddProductComponent,
    CommonModule,
    NgbModule,
    HttpClientModule,
    ReactiveFormsModule,
    NotificationModule,
    FormsModule
  ],
  providers: [ NotificationService ]
})
export class AppRoutingModule { }
