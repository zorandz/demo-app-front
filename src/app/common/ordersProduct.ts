export class OrdersProduct {
    productId: number;
    imageURL: string;
    productName: string;

    constructor(productId: number, imageURL: string, productName: string) {
        this.productId = productId;
        this.imageURL = imageURL;
        this.productName = productName;
    }

}