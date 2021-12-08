import { Component, OnDestroy, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';
import { CartItem } from 'src/app/common/cart-item';
import { CartService } from 'src/app/services/cart.service';

@Component({
  selector: 'app-cart-details',
  templateUrl: './cart-details.component.html',
  styleUrls: ['./cart-details.component.css']
})
export class CartDetailsComponent implements OnInit, OnDestroy {

  cartItems: CartItem[] = [];
  totalPrice: number = 0;
  totalQuantity: number = 0;

  subscription!: Subscription;
  subscription2!: Subscription;

  storage: Storage = sessionStorage;

  constructor(private cartService: CartService) { 
  }

  ngOnInit(): void {
    this.listCartDetails();
  }

  listCartDetails() {

    //get a handle to the cart items
    this.cartItems = this.cartService.cartItems;
    this.storage.setItem('cartItems', JSON.stringify(this.cartItems));

    //subscribe to the cart totalPrice
    this.subscription = this.cartService.totalPrice.subscribe(
      data => this.totalPrice = data
      )
      
      // subscribe to the cart totalQuantity
      this.subscription2 = this.cartService.totalQuantity.subscribe(
        data => this.totalQuantity = data
        )
        this.storage.setItem('totalPrice', JSON.stringify(this.totalPrice));
        this.storage.setItem('totalQuantity', JSON.stringify(this.totalQuantity));
  
    // compute cart total price and quantity
    this.cartService.computeCartTotals();
  }

  incrementQuantity(cartItem: CartItem) {
    this.cartService.addToCart(cartItem);
  }

  decrementQuantity(cartItem: CartItem) {
    this.cartService.decrementQuantity(cartItem);
  }

  remove(cartItem: CartItem) {
    this.cartService.remove(cartItem);
  }

  ngOnDestroy() {
    this.subscription.unsubscribe();
    this.subscription2.unsubscribe();
  }
}
