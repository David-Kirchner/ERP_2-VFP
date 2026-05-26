# ERP_1 configuration scripts

Run in SSMS against database **ERP_1** on each instance (SuperMicro production, Server26 development).

See **[../RUN-ORDER.md](../RUN-ORDER.md)** for combined Config + Security sequence.

## Order

1. `01_CompanyProfile_Schema.sql` — tables, views, triggers (idempotent)
2. `02_CompanyProfile_Schema_Fix01.sql` — column fixes if needed
3. `03_CreateAppUsers.sql` — `dbo.AppUsers` role table
4. `04_AppPermission_Schema.sql` — permission catalog + `AppUserGrant` (App Permissions screen)
5. `05_AppSqlRole_Schema.sql` — SQL role catalog + `AppSqlRoleGrant` (SQL Database Roles screen; requires `AppUsers`)
6. `06_Migrate_AppSetup_Permissions.sql` — copy legacy AppSetup YES rows
7. `07_Seed_CompanyProfile.sql` — initial company row

## Verify

```sql
SELECT * FROM dbo.CompanyProfile WHERE CompanyId = 1;
SELECT * FROM dbo.AppUsers;
```

Then see `MEM\SQL\Security\` for login/role grants.
