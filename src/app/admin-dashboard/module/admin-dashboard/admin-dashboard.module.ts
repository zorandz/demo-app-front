import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { DashboardComponent } from '../../admin-dashboard/admin-dashboard.component';



@NgModule({
  declarations: [ 
    DashboardComponent
  ],
  imports: [
    CommonModule
  ],
  exports: [
    DashboardComponent,
    CommonModule
  ]
})
export class AdminDashboardModule { }
