import { HttpErrorResponse } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Subscription } from 'rxjs';
import { NotificationType } from 'src/app/common/enum/notification-type';
import { Product } from 'src/app/common/product';
import { ProductCategory } from 'src/app/common/product-category';
import { NotificationService } from 'src/app/services/notification.service';
import { ProductService } from 'src/app/services/product.service';

@Component({
  selector: 'app-add-product',
  templateUrl: './add-product.component.html',
  styleUrls: ['./add-product.component.css']
})
export class AddProductComponent implements OnInit {
  productCategories: ProductCategory[] | undefined;
  private subscriptions: Subscription[] = [];
  active: boolean = true;
  showLoading: boolean;
  categoryName: string = "";
  categoryId: number = 0;
  notify: boolean = false;



  constructor(private productService: ProductService, private router: Router,
  private notificationService: NotificationService) { }

  ngOnInit(): void {
    this.listProductCategories();
  }

  onAddProduct(product: Product) {
    this.showLoading = true;
    if (product.categoryId == 1) {
      this.categoryName = "Books";
    } else if (product.categoryId == 2) {
      this.categoryName = "Coffee Mugs";
    } else if (product.categoryId == 3) {
      this.categoryName = "Mouse Pads";
    } else {
      this.categoryName = "Luggage Tags";
    }

    const formData = this.productService.createNewProduct(product, product.active, this.categoryName);
    this.subscriptions.push(
      this.productService.addProduct(formData).subscribe(
        (response: Product) => {
          this.showLoading = false;
          this.sendNotification(NotificationType.SUCCESS, `Product successfully created.`);
          this.notify = true;
          this.router.navigateByUrl('/add-product-form');
        },
        (errorResponse: HttpErrorResponse) => {
          this.sendNotification(NotificationType.SUCCESS, `There was an error, please try again.`);
          this.notify = true;
          this.showLoading = false;
        }
      )
    );
  }

  listProductCategories() {
    this.productService.getProductCategories().subscribe(
      (data: any[] | undefined) => {
        this.productCategories = data;

      }
    )
  }

  private sendNotification(notificationType: NotificationType, message: string): void {
    if (message) {
      this.notificationService.notify(notificationType, message);
      setTimeout(()=>{                           
        this.notify = false;
   }, 4000);
    } else {
      this.notificationService.notify(notificationType, 'An error occurred. Please try again.');
      setTimeout(()=>{                           
        this.notify = false;
   }, 4000);
    }
  }
}
