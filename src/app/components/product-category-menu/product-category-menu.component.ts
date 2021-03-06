import { Component, Injectable, OnDestroy, OnInit } from '@angular/core';
import { ProductCategory } from 'src/app/common/product-category';
import { ProductService } from 'src/app/services/product.service';
import { EventEmitter } from '@angular/core';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { Subscription } from 'rxjs';

@Component({
  selector: 'app-product-category-menu',
  templateUrl: './product-category-menu.component.html',
  styleUrls: ['./product-category-menu.component.css']
})

export class ProductCategoryMenuComponent implements OnInit, OnDestroy {

  productCategories: ProductCategory[] | undefined;
  categoryChanged: EventEmitter<string> | undefined;
  isHeAuthorized: boolean;
  isHeAuthenticated: boolean;
  subscription: Subscription;
  subscription2: Subscription;

  constructor(private productService: ProductService, private authService: AuthenticationService) {
    
    this.subscription = this.authService.isUserLogged.subscribe(data => {
      this.isHeAuthenticated = data;
    })
    
    this.subscription2 = this.authService.isUserAuthorized.subscribe(data => {
      this.isHeAuthorized = data;
      })
    
   }

  ngOnInit(): void {
    this.listProductCategories();
    this.isLogged();
  }

  parseBoolean(localStorage: string): boolean {
    if (localStorage == "true") {
      return true;
    } else {
      return false;
    }
  }

  onClick(category: string) {
    this.categoryChanged?.emit(category);
  }

  listProductCategories() {
    this.productService.getProductCategories().subscribe(
      (data: any[] | undefined) => {
        this.productCategories = data;

      }
    )
  }

  isLogged() {
    if (this.authService.isUserLoggedIn() && this.authService.isAuthorized(JSON.parse(localStorage.getItem('user')))){
      this.isHeAuthenticated = true;
      this.isHeAuthorized = true;
    }
  }


/*
  isAdmin() {
    let user = new User();
    user = this.authService.getUserFromLocalCache();
    if (user.role == Role.ADMIN || user.role == Role.SUPER_ADMIN) {
      this.userIsAdmin = true;
    } else {
      this.userIsAdmin = false;
    }
    
  }
  */

  ngOnDestroy(): void {
    this.subscription.unsubscribe();
    this.subscription2.unsubscribe();
    this.isHeAuthenticated = false;
    this.isHeAuthorized = false;
  }

}
