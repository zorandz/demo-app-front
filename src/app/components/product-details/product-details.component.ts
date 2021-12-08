import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { CartItem } from 'src/app/common/cart-item';
import { Product } from 'src/app/common/product';
import { CartService } from 'src/app/services/cart.service';
import { ProductService } from 'src/app/services/product.service';

@Component({
  selector: 'app-product-details',
  templateUrl: './product-details.component.html',
  styleUrls: ['./product-details.component.css']
})
export class ProductDetailsComponent implements OnInit {

  private theProductId?: string | null | number;
  product: Product;

  constructor(private route: ActivatedRoute,
              private productService: ProductService,
              private cartService: CartService) { }

  ngOnInit(): void {
    this.route.paramMap.subscribe(() => {
      this.handleProductDetails();
    })
  }

  handleProductDetails() {
      this.theProductId = +this.route.snapshot.paramMap.get('id')!;

    this.productService.getProduct(this.theProductId).subscribe(
      data => this.product = data
    )
  }

  addToCart() {
    const cartItem = new CartItem(this.product);

    this.cartService.addToCart(cartItem);
  }
}
