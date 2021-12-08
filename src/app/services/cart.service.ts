import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { CartItem } from '../common/cart-item';

@Injectable({
  providedIn: 'root'
})
export class CartService {

  cartItems: CartItem[];

  totalPrice: BehaviorSubject<number> = new BehaviorSubject<number>(0);
  totalQuantity: BehaviorSubject<number> = new BehaviorSubject<number>(0);

  storage: Storage = sessionStorage;

  constructor() { 
   /* let data = JSON.parse(this.storage.getItem('cartItems'));

    if (data !=null) {
      this.cartItems = data;

      this.computeCartTotals();
    }*/

    this.cartItems = JSON.parse(sessionStorage.getItem('cartItems')) != null ? JSON.parse(sessionStorage.getItem('cartItems')):[];

  }

  addToCart(theCartItem: CartItem) {
    //check if we already have this item in cart
    
    let alreadyExistsInCart: boolean = false;
    let existingCartItem: CartItem = undefined!;

    //find the item in cart based on item id
    if (this.cartItems.length > 0) {

      existingCartItem = this.cartItems.find(item => item.id === theCartItem.id)!
    }

    //check if we found it
    alreadyExistsInCart = (existingCartItem != undefined);

    if (alreadyExistsInCart) {
      //increment the quantity
      existingCartItem.quantity++;
    } 
    else {
      //just add the item to the array
      this.cartItems.push(theCartItem);
    }

    // compute cart total price and total quantity
    this.computeCartTotals();

  }

  //compute cart total price and total quantity.

  computeCartTotals() {

    let totalPriceValue: number = 0;
    let totalQuantityValue: number = 0;

    for (let currentCartItem of this.cartItems) {
      totalPriceValue += currentCartItem.quantity * currentCartItem.unitPrice;
      totalQuantityValue += currentCartItem.quantity;
    }

    // publish the new values ... all subscribers will receive the new data
    this.totalPrice.next(totalPriceValue);
    this.totalQuantity.next(totalQuantityValue);

    // log cart data just for debugging purposes
    //this.logCartData(totalPriceValue, totalQuantityValue);

    this.persistCartItems();
  }

  logCartData(totalPriceValue: number, totalQuantityValue: number) {

    console.log('Contents of the cart');
    for (let tempCartItem of this.cartItems) {
      const subTotalPrice = tempCartItem.quantity * tempCartItem.unitPrice;
      console.log(`name: ${tempCartItem.name}, quantity=${tempCartItem.quantity}, unitPrice=${tempCartItem.unitPrice}, subTotalPrice=${subTotalPrice}`);
    }

    console.log(`totalPrice: ${totalPriceValue.toFixed(2)}, totalQuantity: ${totalQuantityValue}`);
    console.log('----');
  }

  decrementQuantity(cartItem: CartItem) {
    cartItem.quantity --;

    if (cartItem.quantity === 0) {
      this.remove(cartItem);
    } else {
      this.computeCartTotals();
    }
  }

  remove(cartItem: CartItem) {
    const itemIndex = this.cartItems.findIndex(item => item.id === cartItem.id);

    if (itemIndex > -1) {
      this.cartItems.splice(itemIndex, 1);
    }

    this.computeCartTotals();
  }

  persistPrice() {
    this.storage.setItem('cartPrice', JSON.stringify(this.totalPrice)); 
  }

  persistCartItems() {
    this.storage.setItem('cartItems', JSON.stringify(this.cartItems));
  }
}
