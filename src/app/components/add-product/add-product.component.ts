import { HttpErrorResponse } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Subscription } from 'rxjs';
import { Product } from 'src/app/common/product';
import { ProductCategory } from 'src/app/common/product-category';
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



  constructor(private productService: ProductService, private router: Router) { }

  ngOnInit(): void {
    this.listProductCategories();
  }

  onAddProduct(product: Product) {

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
          this.router.navigateByUrl('/add-product-form');
        },
        (errorResponse: HttpErrorResponse) => {
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
}
