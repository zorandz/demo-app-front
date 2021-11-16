import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Product } from '../common/product';
import { map } from 'rxjs/operators';
import { ProductCategory } from '../common/product-category';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root',
})
export class ProductService {
  private baseUrl = environment.ApiUrl + '/products';
  private categoryUrl = environment.ApiUrl + '/product-category';

  constructor(private httpClient: HttpClient) {}

  getProductList(categoryId: Number): Observable<Product[]> {
    const searchUrl = `${this.baseUrl}/search/findByCategoryId?id=${categoryId}`;

    return this.httpClient
      .get<GetResponseProducts>(searchUrl)
      .pipe(map((response) => response._embedded.products));
  }

  getProductListPaginate(
    thePage: number,
    thePageSize: number,
    theCategoryId: number
  ): Observable<GetResponseProducts> {
    const searchUrl =
      `${this.baseUrl}/search/findByCategoryId?id=${theCategoryId}` +
      `&page=${thePage}&size=${thePageSize}`;

    return this.httpClient.get<GetResponseProducts>(searchUrl);
  }

  getProductCategories(): Observable<ProductCategory[]> {
    return this.httpClient
      .get<getCategoriesRes>(this.categoryUrl)
      .pipe(map((response) => response._embedded.productCategory));
  }

  searchProducts(theKeyword: string | null): Observable<Product[]> {
    const searchUrl = `${this.baseUrl}/search/findByNameContaining?name=${theKeyword}`;

    return this.httpClient
      .get<SearchByNameResponse>(searchUrl)
      .pipe(map((response) => response._embedded.products));
  }

  searchProducstPaginate(
                          thePage: number,
                          thePageSize: number,
                          theKeyword: string): Observable<GetResponseProducts> {

    //need to build url based on keyword, page and size
    const searchUrl = `${this.baseUrl}/search/findByNameContaining?name=${theKeyword}` +
      `&page=${thePage}&size=${thePageSize}`;

    return this.httpClient.get<GetResponseProducts>(searchUrl);
  }

  getProduct(theId: number): Observable<Product> {
    return this.httpClient.get<Product>(`${this.baseUrl}/${theId}`);
  }
}

interface SearchByNameResponse {
  _embedded: {
    products: Product[];
  }
}

interface getCategoriesRes {
  _embedded: {
    productCategory: ProductCategory[];
  }
}

interface GetResponseProducts {
  _embedded: {
    products: Product[]
  },
  page: {
    size: number,
    totalElements: number,
    totalPages: number,
    number: number
  }
}