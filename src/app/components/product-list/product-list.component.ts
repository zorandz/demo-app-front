import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { CartItem } from 'src/app/common/cart-item';
import { CustomHttpResponse } from 'src/app/common/custom-http-response';
import { NotificationType } from 'src/app/common/enum/notification-type';
import { Role } from 'src/app/common/enum/role';
import { Product } from 'src/app/common/product';
import { ProductCategory } from 'src/app/common/product-category';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { CartService } from 'src/app/services/cart.service';
import { NotificationService } from 'src/app/services/notification.service';
import { ProductService } from 'src/app/services/product.service';
import { ProductCategoryMenuComponent } from '../product-category-menu/product-category-menu.component';

@Component({
  selector: 'app-products-list',
  templateUrl: './products-list-grid.component.html',
  styleUrls: ['./product-list.component.css']
})
export class ProductListComponent implements OnInit {

  products: Product[] = [];
  currentCategoryId: number = 1;
  categories: ProductCategory[] = [];
  previousCategoryId: number = 1;
  searchMode!: boolean;
  areEmpty!: boolean;
  notify: boolean;

  //properties for pagination:
  thePageNumber: number = 1;
  thePageSize: number = 12;
  theTotalElements: number = 0;

  previousKeyword!: string;
  showButton: boolean;
  notificationTimeout: any;

  constructor(private productService: ProductService, 
              private route: ActivatedRoute,
              private cartService: CartService,
              private notificationService: NotificationService,
              private authenticationService: AuthenticationService
              ) { }

  ngOnInit(): void {
    this.route.paramMap.subscribe(() => {
      this.listProducts();
    })

   // this.isLogged();
  }

  updatePageSize(value: number) {
    this.thePageSize = value;
    this.thePageNumber = 1;
    this.listProducts();

  }

  


  onDelete(id: number) {
    this.productService.delete(id).subscribe(
      (response: CustomHttpResponse) => {
        console.log(response)
        this.sendNotification(NotificationType.SUCCESS, `Product successfully deleted.`);
          this.notify = true;
      },
      errorRes => {
      }
    )
   // this.refresh();
  }

  private sendNotification(notificationType: NotificationType, message: string): void {
    if (message) {
      this.notificationService.notify(notificationType, message);
      this.notificationTimeout = setTimeout(()=>{                           
        this.notify = false;
   }, 4000);
    } else {
      this.notificationService.notify(notificationType, 'An error occurred. Please try again.');
      this.notificationTimeout = setTimeout(()=>{                           
        this.notify = false;
   }, 4000);
    }
  }

  refresh(): void {
    window.location.reload();
    }

  onUpdate(id: number) {

  }

  listProducts() {   
    this.searchMode = this.route.snapshot.paramMap.has("keyword");

    if (this.searchMode) {
      this.handleSearchProducts()
    } else {
      this.handleListProducts();
    }
  }

  handleListProducts() {
    //check if "id" parameter is available
    const hasCategoryId: boolean = this.route.snapshot.paramMap.has("id");

    if (hasCategoryId) {
      //get the "id" param string, convert string to a number
      this.currentCategoryId = +this.route.snapshot.paramMap.get('id')!;
    }
    else {
      this.currentCategoryId = 1;
    }

    if (this.previousCategoryId != this.currentCategoryId) {
      this.thePageNumber = 1;
    }

    this.previousCategoryId = this.currentCategoryId;

    this.productService.getProductListPaginate(this.thePageNumber -1,
                                              this.thePageSize,
                                              this.currentCategoryId)
                                              .subscribe(this.processResult());
  }

  processResult() {
    return (data: any) => {
      this.products = data._embedded.products;
      this.thePageNumber = data.page.number + 1;
      this.thePageSize = data.page.size;
      this.theTotalElements = data.page.totalElements;
    }
  }

  handleSearchProducts() {
    const theKeyword = this.route.snapshot.paramMap.get("keyword");

    // If we have different keyword than previous
    //then set thePageNumber to 1

    if (this.previousKeyword != theKeyword) {
      this.thePageNumber = 1;
    }     

    this.previousKeyword = theKeyword!;

    this.productService.searchProducstPaginate(this.thePageNumber - 1,
                                              this.thePageSize,
                                              theKeyword!)
                                              .subscribe(this.processResult());
  }

  addToCart(product: Product) {
    const theCartItem = new CartItem(product);

    this.cartService.addToCart(theCartItem);
    if (!this.notify) {
      clearTimeout(this.notificationTimeout);
    }
    this.sendNotification(NotificationType.SUCCESS, `${product.name} added to cart.`);
    this.notify = true;
  }

  public get isAdmin(): boolean {
    return this.getUserRole() === Role.ADMIN || this.getUserRole() === Role.SUPER_ADMIN;
  }

  public get isManager(): boolean {
    return this.isAdmin || this.getUserRole() === Role.MANAGER;
  }

  public get isAdminOrManager(): boolean {
    return this.isAdmin || this.isManager;
  }

  private getUserRole(): string {
    return this.authenticationService.getUserFromLocalCache().role;
  }

  isLogged() {
    if (this.authenticationService.isUserLoggedIn() && this.authenticationService.isAuthorized(JSON.parse(localStorage.getItem('user')))){
      this.showButton = true;
    }
  }

}
