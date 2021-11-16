import { CommonModule } from '@angular/common';
import { HttpClientModule } from '@angular/common/http';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { AppComponent } from './app.component';
import { CartStatusComponent } from './components/cart-status/cart-status.component';
import { LoginStatusComponent } from './components/login-status/login-status.component';
import { LoginComponent } from './components/login/login.component';
import { ProductCategoryMenuComponent } from './components/product-category-menu/product-category-menu.component';
import { ProductListComponent } from './components/product-list/product-list.component';
import { SearchComponent } from './components/search/search.component';

const routes: Routes = [ 
  // { path: 'order-history', component: OrderHistoryComponent },
{ path: 'login', component: LoginComponent },
{ path: 'category/:id', component: ProductListComponent },
{ path: 'category', component: ProductListComponent },
{ path: 'products', component: ProductListComponent },
/*  { path: 'checkout', component: CheckoutComponent},
 { path: 'cart-details', component: CartDetailsComponent},
 { path: 'products/:id', component: ProductDetailsComponent},
 { path: 'search/:keyword', component: ProductsListComponent },
 { path: '', redirectTo: '/products', pathMatch: 'full' },*/
 { path: '**', redirectTo: '/products', pathMatch: 'full' }];

@NgModule({
  declarations: [
    AppComponent,
    SearchComponent,
    LoginComponent,
    LoginStatusComponent,
    CartStatusComponent,
    ProductCategoryMenuComponent,
    ProductListComponent
  ],
  imports: [
    RouterModule.forRoot(routes), 
    CommonModule,
    NgbModule,
    HttpClientModule
  ],
  exports: [RouterModule,  AppComponent,
    SearchComponent,
    LoginComponent,
    LoginStatusComponent,
    CartStatusComponent,
    ProductCategoryMenuComponent,
    ProductListComponent,
    CommonModule,
    NgbModule,
    HttpClientModule
  ]
})
export class AppRoutingModule { }
