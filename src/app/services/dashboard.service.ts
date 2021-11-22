import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { SystemHealth } from '../admin-dashboard/interfaces/system-health';
import { SystemCpu } from '../admin-dashboard/interfaces/system-cpu';
import { environment } from 'src/environments/environment';

@Injectable({providedIn: 'root'})
export class DashboardService {
  private SERVER_URL = environment.ApiUrl;

  constructor(private http: HttpClient) {}

  public getHttpTraces(): Observable<any> {
    return this.http.get<any>(`${this.SERVER_URL}/actuator/httptrace`);
  }

  public getSystemHealth(): Observable<SystemHealth> {
    return this.http.get<SystemHealth>(`${this.SERVER_URL}/actuator/health`);
  }

  public getSystemCpu(): Observable<SystemCpu> {
    return this.http.get<SystemCpu>(`${this.SERVER_URL}/actuator/metrics/system.cpu.count`);
  }

  public getProcessUptime(): Observable<any> {
    return this.http.get<any>(`${this.SERVER_URL}/actuator/metrics/process.uptime`);
  }

}
