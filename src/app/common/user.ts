export class User {

    public userId: string;
    public firstName: string;
    public lastName: string;
    public username: string;
    public email: string;
    public lastLoginDate: any;
    public lastLoginDateDisplay: any;
    public joinDate: Date | null;
    public profileImageUrl: string;
    public active: boolean;
    public notLocked: boolean;
    public role: string;
    public authorities: [];
    public orders: [];
  
    constructor() {
      this.userId = '';
      this.firstName = '';
      this.lastName = '';
      this.username = '';
      this.email = '';
      this.lastLoginDate = null;
      this.lastLoginDateDisplay = null;
      this.joinDate = null;
      this.profileImageUrl = '';
      this.active = false;
      this.notLocked = false;
      this.role = '';
      this.authorities = [];
      this.orders = [];
    }
}