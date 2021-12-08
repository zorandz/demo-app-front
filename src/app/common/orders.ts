export class Orders {
    imageURL: string;
    orderDate: Date;
    orderId: number;
    price: number;
    productId: number;
    productName: string;

    constructor(imageURL: string, orderDate: Date, orderId: number,
            price: number, productId: number, productName: string) {
                this.imageURL = imageURL;
                this.orderDate = orderDate;
                this.orderId = orderId;
                this.price = price;
                this.productId = productId;
                this.productName = productName
            }
}