# ERP_1 Fresh Build Bundle

Run these scripts in SSMS while connected to the target SQL Server instance.

## Order

1. `00_AuditDB_setup.sql`
2. `01 Create from HPAlloy.sql`
3. `02 Create from HPAlloy_Archive.sql`
4. `03 Create from HPAlloyNR.sql`
5. `04 Create Views.sql`
6. `06 Create Diagrams.sql`
7. `07 Copy HPAlloyNR to NR_.sql`
8. `08 Fill Standard Data files.sql`
9. `09 fill some Quotes.sql`
10. `10_CreateAppUsers.sql`
11. `11_CompanyProfile_Schema.sql`
12. `12_CompanyProfile_Schema_Fix01.sql`
13. `13_AppPermission_Schema.sql`
14. `14_AppSqlRole_Schema.sql`
15. `15_Migrate_AppSetup_Permissions.sql`
16. `16_Seed_CompanyProfile.sql`
17. `17_CreateRoles.sql`
18. `18_CreateDB_Roles.sql`
19. `19_GrantArchiveAndNR_Permissions.sql`
20. `20_SeedAppUsers.sql`

## Current Rules

- Archive tables are created as `dbo.Ar_*`, matching the `NR_` prefix style.
- `AuditDB.dbo.ErrorLog` and `AuditDB.dbo.DDLEvents` are the audit tables.
- `ERP_1.dbo.ErrorLog` and `ERP_1.dbo.DDLEvents` are not part of a fresh build.
- The deleted external databases `FileStreamFTS`, `Messenger`, and `TimeClockPlus` are not recreated.
- `dbo.p_FileStream_ins`, `dbo.p_NR_TimeClockPunches`, and `dbo.f_Get_EmailService_User_ClockedIn` are not recreated.
- One-off/scratch legacy tables such as `CREDITREF`, `WindfallSTK_2025`, and `HPAcertPdf` are not part of the fresh build.
