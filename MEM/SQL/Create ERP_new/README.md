# ERP_2 Fresh Build Bundle

Run these scripts in SSMS while connected to the target SQL Server instance.

## Order

1. `00_AuditDB_setup.sql`
2. `01_01 Create HPAlloy database and functions.sql`
3. `01_02 Create HPAlloy tables indexes defaults.sql`
4. `01_03 Create HPAlloy stored procedures.sql`
5. `01_04 Create HPAlloy triggers.sql`
6. `01_05 Create HPAlloy extended properties.sql`
7. `02 Create from HPAlloy_Archive.sql`
8. `03 Create from HPAlloyNR.sql`
9. `04 Create Views.sql`
10. `06 Create Diagrams.sql`
11. `07 Copy HPAlloyNR to NR_.sql`
12. `08 Fill Standard Data files.sql`
13. `09 fill some Quotes.sql`
14. `10_CreateAppUsers.sql`
15. `11_CompanyProfile_Schema.sql`
16. `12_CompanyProfile_Schema_Fix01.sql`
17. `13_AppPermission_Schema.sql`
18. `14_AppSqlRole_Schema.sql`
19. `15_Migrate_AppSetup_Permissions.sql`
20. `16_Seed_CompanyProfile.sql`
21. `17_CreateRoles.sql`
22. `18_CreateDB_Roles.sql`
23. `19_GrantArchiveAndNR_Permissions.sql`
24. `20_SeedAppUsers.sql`
25. `20_Z_ERP1_Alignment.sql`
26. `21_CurrentSupportTables.sql`
27. `22_CompanyProfile_CustomerTermsPath.sql`

## Current Rules

- Archive tables are created as `dbo.Ar_*`, matching the `NR_` prefix style.
- `AuditDB.dbo.ErrorLog` and `AuditDB.dbo.DDLEvents` are the audit tables.
- `ERP_1.dbo.ErrorLog` and `ERP_1.dbo.DDLEvents` are not part of a fresh build.
- `dbo.AppErrorLog`, `dbo.CompanyCertPdf`, `dbo.CompanyProfileHistory`, and `dbo.[CUSTOMER TERMS]` are part of the fresh build.
- The deleted external databases `FileStreamFTS`, `Messenger`, and `TimeClockPlus` are not recreated.
- `dbo.p_FileStream_ins`, `dbo.p_NR_TimeClockPunches`, and `dbo.f_Get_EmailService_User_ClockedIn` are not recreated.
- One-off/scratch legacy tables such as `CREDITREF`, `WindfallSTK_2025`, and `HPAcertPdf` are not part of the fresh build.
- `dbo.StockLst_Master_50CC` is not part of the fresh build.
- `dbo.PriceTable` is seeded from `HPAlloy.dbo.PriceTable`.
- `dbo.AllQuotes.DescriptID` and `dbo.CompanyProfile` are aligned to the live `ERP_1` shape.
