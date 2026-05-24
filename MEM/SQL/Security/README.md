# SQL Server security setup (ERP_1)

Apply on **SuperMicro** (production) and **Server26** (development). Windows Authentication only.

## Steps

1. Run `01_CreateRoles.sql` on database `ERP_1`.
2. Edit `02_GrantWindowsUser.sql`: replace `<DOMAIN\login>` with `SELECT SYSTEM_USER` output (e.g. `SPACEALLOYS\DavidKirchner`). Run on **master** + `ERP_1` on each instance.
3. Run `MEM\SQL\Config\CreateAppUsers.sql`, then edit and run `03_SeedAppUsers.sql`.
4. Keep fine-grained VFP permissions in `dbo.AppSetup` (UN / PRP / ANS). `HavePermission()` continues to use AppSetup; `AppUsers` is for future Admin/coarse roles.

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
