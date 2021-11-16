import { Component, Injectable, OnInit } from '@angular/core';
import { ProductCategory } from 'src/app/common/product-category';
import { ProductService } from 'src/app/services/product.service';
import { EventEmitter } from '@angular/core';

@Component({
  selector: 'app-product-category-menu',
  templateUrl: './product-category-menu.component.html',
  styleUrls: ['./product-category-menu.component.css']
})

export class ProductCategoryMenuComponent implements OnInit {

  productCategories: ProductCategory[] | undefined;
  categoryChanged: EventEmitter<string> | undefined;

  constructor(private productService: ProductService) { }

  ngOnInit(): void {
    this.listProductCategories();
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

}
