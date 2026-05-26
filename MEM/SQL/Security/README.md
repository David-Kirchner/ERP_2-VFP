# SQL Server security setup (ERP_1)

Apply on **SuperMicro** (production) and **Server26** (development). Windows Authentication only.

## Steps

1. Run `01_CreateRoles.sql` on database `ERP_1`.
2. Run `04_GrantArchiveAndNR_Permissions.sql` — **AR.*** archive read/insert, **NR_*** read, **NR_UserTrack** insert for all app roles.
3. Edit `02_GrantWindowsUser.sql` or use `02b` / `02c` / `02d`. See `README-Workgroup-Logins.md`.
4. Run `MEM\SQL\Config\CreateAppUsers.sql`, then edit and run `03_SeedAppUsers.sql`.
5. Keep fine-grained VFP permissions in `dbo.AppUserGrant` / legacy `dbo.AppSetup`. See **[README-Permissions.md](README-Permissions.md)**.

## App permission scripts (Layer 2)

Run on both servers after roles/grants:

1. `MEM\SQL\Config\AppPermission_Schema.sql`
2. `MEM\SQL\Config\05_Migrate_AppSetup_Permissions.sql`

## Verification checklist

```sql
SELECT SYSTEM_USER AS Me;
SELECT TOP 1 * FROM dbo.CompanyProfile;
SELECT TOP 1 * FROM dbo.AllQuotes;
SELECT * FROM dbo.AppUsers WHERE Active = 1;
```

From VFP (ERP_2):

- Confirm `_screen.Caption` shows profile name (e.g. `ERP [Development]`).
- **Setup HPA** → Change server → pick Development vs Production.
- **Set Server** → **Test SQL**.
- **Maintenance → Company Profile** (requires `AppSetup` Admin = YES).

## Role mapping (guidance)

| Role | Typical use |
|------|-------------|
| ERP_AppRead | Reporting, read-only workstations |
| ERP_AppWrite | Standard shop-floor and office users |
| ERP_AppAdmin | DBAs, developers, company-profile editors |
