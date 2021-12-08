import { ProductCategory } from "./product-category";

export class Product {
    id!: number;
    sku: string = "";
    name: string = "";
    description: string = "";
    unitPrice: number = 0.00;
    imageUrl: string = "";
    active: boolean = true;
    unitsInStock: number = 150;
    dateCreated: Date = new Date();
    lastUpdated: Date = new Date();
    categoryId: number; 

    constructor() {}

/*
    constructor(product: Product) {

                    this.id = product.id;
                    this.sku = product.sku;
                    this.name = product.name;
                    this.description = product.description;
                    this.unitPrice = product.unitPrice;
                    this.imageUrl = product.imageUrl;
                    this. active = product.active;
                    this.unitsInStock = product.unitsInStock;
                    this.dateCreated = product.dateCreated;
                    this.lastUpdated = product.lastUpdated;
                    this.category = product.category;
                }
                 */
}
