# ERP_1 script run order

Run on **both** SuperMicro and Server26 unless noted. Idempotent scripts are safe to re-run.

## Full build (empty database)

Use [`Create ERP_new/`](Create%20ERP_new/) scripts in filename order, including the split `01_*` files and `20_Z_ERP1_Alignment.sql` before `21_CurrentSupportTables.sql`.

## Config (`MEM\SQL\Config\`)

| # | File |
|---|------|
| 01 | `01_CompanyProfile_Schema.sql` |
| 02 | `02_CompanyProfile_Schema_Fix01.sql` (if needed) |
| 03 | `03_CreateAppUsers.sql` |
| 04 | `04_AppPermission_Schema.sql` |
| 05 | `05_AppSqlRole_Schema.sql` |
| 06 | `06_Migrate_AppSetup_Permissions.sql` |
| 07 | `07_Seed_CompanyProfile.sql` |
| 08 | `08_CompanyPlant_CertReport.sql` (plant lines / CAGE for certs11 header) |
| 09 | `09_CompanyProfile_ReportImage.sql` (report header BMP for `CompanyReport_Logo()`) |

## Security (`MEM\SQL\Security\`)

| # | File |
|---|------|
| 01 | `01_CreateRoles.sql` — `ERP_AppRead` / `Write` / `Admin` |
| 02 | `02_CreateDB_Roles.sql` — area `ERP_*` roles (36) |
| 03 | `03_GrantArchiveAndNR_Permissions.sql` — Ar_* / NR_* (re-run after new roles or tables) |
| 04 | `04_GrantWindowsUser.sql` — template (manual) |
| 05 | `05_GrantCurrentUser_Admin.sql` — run as admin |
| 06 | `06_GrantUser_AppWrite.sql` — edit `@login` for another user |
| 07 | `07_GrantCurrentUser_AppWrite.sql` — standard write for current login |
| 08 | `08_SeedAppUsers.sql` — optional AppUsers seed |

Each script’s `PRINT 'Next: …'` lines match this numbering within its folder.

## Typical order on existing ERP_1

```
Security\01_CreateRoles.sql
Security\02_CreateDB_Roles.sql
Security\03_GrantArchiveAndNR_Permissions.sql
Config\03_CreateAppUsers.sql
Config\04_AppPermission_Schema.sql
Config\05_AppSqlRole_Schema.sql
Config\06_Migrate_AppSetup_Permissions.sql
Security\03_GrantArchiveAndNR_Permissions.sql   (re-run after 05)
Security\05_GrantCurrentUser_Admin.sql          (each admin, each server)
Security\08_SeedAppUsers.sql                    (optional)
Config\01_CompanyProfile_Schema.sql             (if not already deployed)
Config\07_Seed_CompanyProfile.sql
```

## Migrations

Copy `Migrations\00_Migration_TEMPLATE.sql` to `YYYYMMDD_description.sql`.
