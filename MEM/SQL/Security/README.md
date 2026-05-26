# SQL Server security setup (ERP_1)



Apply on **SuperMicro** (production) and **Server26** (development). Windows Authentication only.



See **[../RUN-ORDER.md](../RUN-ORDER.md)** for numbered script list.



## Steps



1. `01_CreateRoles.sql`

2. `02_CreateDB_Roles.sql` — 36 area `ERP_*` roles

3. `03_GrantArchiveAndNR_Permissions.sql` — Ar_* / NR_* (re-run after `05_AppSqlRole_Schema.sql` or new tables)

4. Login grants: `04_GrantWindowsUser.sql` (template) or `05` / `06` / `07` — see `README-Workgroup-Logins.md`

5. `Config\03_CreateAppUsers.sql`, then optional `08_SeedAppUsers.sql`

6. `Config\05_AppSqlRole_Schema.sql` — SQL Database Roles maintenance screen

7. Layer 2 app tasks: `Config\04_AppPermission_Schema.sql`, `Config\06_Migrate_AppSetup_Permissions.sql` — see **[README-Permissions.md](README-Permissions.md)**



## VFP maintenance



**SQL Database Roles:** `DO FORM Forms\AppSqlRole_Maint.scx`  

Uses `AppSqlRole` / `AppSqlRoleGrant` + `AppUsers` (not AppSetup).



## Role mapping (guidance)



| Role | Typical use |

|------|-------------|

| ERP_AppRead | Reporting, read-only workstations |

| ERP_AppWrite | Standard shop-floor and office users |

| ERP_AppAdmin | DBAs, developers, company-profile editors |

