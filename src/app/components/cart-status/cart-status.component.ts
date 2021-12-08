import { Component, OnDestroy, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';
import { CartItem } from 'src/app/common/cart-item';
import { CartService } from 'src/app/services/cart.service';

@Component({
  selector: 'app-cart-status',
  templateUrl: './cart-status.component.html',
  styleUrls: ['./cart-status.component.css']
})
export class CartStatusComponent implements OnInit, OnDestroy {

  subscription1!: Subscription;
  subscription2!: Subscription;

  totalPrice: number = 0.00;
  totalQuantity: number = 0;
  storage: Storage = sessionStorage;

  constructor(private cartService: CartService) { }

  ngOnInit(): void {
      this.updateCartStatus();
  //    this.totalPrice = JSON.parse(this.storage.getItem('totalPrice'))
  } 

  onPriceChange() {
    this.storage.setItem("totalPrice", JSON.stringify(this.totalPrice));

  }

  updateCartStatus() {

    // subscribe to the cart totalPrice
    this.subscription1 = this.cartService.totalPrice.subscribe(
      data => {
        this.totalPrice = data
      } 
    )
      
      this.subscription2 = this.cartService.totalQuantity.subscribe(
        
        data => {
          this.totalQuantity = data
          this.storage.setItem("totalQuantity", JSON.stringify(this.totalQuantity));
        }
      )
    }

    uponRefreshLoadPrice() {
      
    }


    ngOnDestroy() {
    this.subscription1.unsubscribe();
    this.subscription2.unsubscribe();
  }
}
