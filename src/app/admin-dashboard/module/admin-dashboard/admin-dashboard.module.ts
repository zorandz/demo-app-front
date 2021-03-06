import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { DashboardComponent } from '../../admin-dashboard/admin-dashboard.component';
import { NgxPaginationModule } from 'ngx-pagination';



@NgModule({
  declarations: [ 
    DashboardComponent
  ],
  imports: [
    CommonModule,
    NgxPaginationModule

  ],
  exports: [
    DashboardComponent,
    CommonModule,
    NgxPaginationModule
  ]
})
export class AdminDashboardModule { }
