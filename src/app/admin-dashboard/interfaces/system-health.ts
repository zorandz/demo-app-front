export interface SystemHealth {
    status: string;
    components: {
      databaseService: {
        status: string,
        details: {
          databaseService: string,
        }
      },
      db: {
        status: string,
        details: {
          database: number,
          validationQuery: string,
        }
      }
      diskSpace: {
        status: string,
        details: {
          total: string,
          free: string,
          threshold: number,
          exists: true
        }
      }
      ping: {
        status: string
      }
    };

}
