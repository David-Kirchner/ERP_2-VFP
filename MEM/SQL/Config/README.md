# ERP_1 configuration scripts

Run in SSMS against database **ERP_1** on each instance (SuperMicro production, Server26 development).

## Order

1. `CompanyProfile_Schema.sql` — tables, views, triggers (idempotent)
2. `CompanyProfile_Schema_Fix01.sql` — column fixes if needed
3. `CreateAppUsers.sql` — `dbo.AppUsers` role table
4. `AppPermission_Schema.sql` — permission catalog + `AppUserGrant` (for App Permission screen)
5. `05_Migrate_AppSetup_Permissions.sql` — copy legacy AppSetup YES rows
6. `Seed_CompanyProfile.sql` — initial company row

## Verify

```sql
SELECT * FROM dbo.CompanyProfile WHERE CompanyId = 1;
SELECT * FROM dbo.AppUsers;
```

Then see `MEM\SQL\Security\` for login/role grants.
