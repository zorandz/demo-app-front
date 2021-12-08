import { OrdersProduct } from "./ordersProduct";

export class OrdersMassaged {
    orderId: number;
    orderDate: Date;
    price: number;
    products: OrdersProduct[];

    constructor(orderId: number, orderDate: Date, price: number, products: OrdersProduct[]) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.price = price;
        this.products = products;
    }
/*    
    constructor() {
        this.orderId = 0;
        this.orderDate = new Date();
        this.price = 0;
        this.products = [];
    };
    */
}

