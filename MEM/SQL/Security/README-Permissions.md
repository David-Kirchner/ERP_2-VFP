# ERP_1 permissions — SQL + future App Permission screen

Two **separate** layers. Both must work for a user to use the ERP normally.

## Layer 1 — SQL Server (can I connect and run queries?)

| Role | Database rights |
|------|-----------------|
| **ERP_AppRead** | SELECT |
| **ERP_AppWrite** | SELECT, INSERT, UPDATE, DELETE |
| **ERP_AppAdmin** | + EXECUTE (procs, views) — developers, DBAs |

**Area roles** (`ERP_Accounting_Reader`, `ERP_Inventory_Writer`, … — 36 roles from `02_CreateDB_Roles.sql`):

| Table | Purpose |
|-------|---------|
| `dbo.AppSqlRole` | Catalog of area SQL database roles |
| `dbo.AppSqlRoleGrant` | Windows login → role (from `dbo.AppUsers`; not AppSetup) |
| `dbo.usp_AppSqlRole_SyncLogin` | Applies grants to SQL Server `ALTER ROLE` membership |
| `dbo.v_AppSqlRoleEffectiveGrant` | Active grants joined to catalog |

VFP screen: **Maintenance → SQL Database Roles** — `Forms\AppSqlRole_Maint.scx`

**Scripts (run on SuperMicro + Server26):**

1. `01_CreateRoles.sql`
2. **You (admin):** `05_GrantCurrentUser_Admin.sql` — uses `SYSTEM_USER`  
   - On SuperMicro if you are **`dbo`**, script exits — you already have full access.
3. **You (standard write access):** `07_GrantCurrentUser_AppWrite.sql` on each server where needed
4. **Another Windows account:** edit `@login` in `06_GrantUser_AppWrite.sql` — use **`ComputerName\user`** (no domain). See **[README-Workgroup-Logins.md](README-Workgroup-Logins.md)**.
5. Optional template: `04_GrantWindowsUser.sql` (manual)

**No domain yet:** do **not** use `SPACEALLOYS\YourUser` — that placeholder was for a future domain.

**Verify:**

```sql
SELECT SYSTEM_USER AS LoginName, USER_NAME() AS DbUser;

/* Map login → database principal (owner shows as dbo, not login name) */
SELECT sp.name AS LoginName, dp.name AS DbUser
FROM sys.server_principals AS sp
LEFT JOIN sys.database_principals AS dp ON dp.sid = sp.sid
WHERE sp.name = SYSTEM_USER;

/* Role membership (by SID — works when DbUser is dbo) */
SELECT sp.name AS LoginName, dp.name AS DbUser, r.name AS RoleName
FROM sys.server_principals AS sp
INNER JOIN sys.database_principals AS dp ON dp.sid = sp.sid
LEFT JOIN sys.database_role_members AS m ON m.member_principal_id = dp.principal_id
LEFT JOIN sys.database_principals AS r ON m.role_principal_id = r.principal_id
WHERE sp.name = SYSTEM_USER;
```

If **DbUser = `dbo`** and **RoleName is NULL**, that is normal on SuperMicro — you built/restored `ERP_1` as that login, so you already have full access. Roles are for non-owner accounts (`ERP_AppWrite`, etc.).

On **Server26**, expect **`Server26\Admin`** in **`ERP_AppAdmin`** after running `05` or `06`.

Without Layer 1, VFP gets connection errors — no permission screen will help.

### Archive and NR tables (Ar_* / NR_*)

ERP naming (all in schema **`dbo`**, dot is part of the **table name**):

| Pattern | Meaning | Every app user needs |
|---------|---------|----------------------|
| **`Ar_*`** (e.g. `[dbo].Ar_Stocklst_Master_History`) | Archive / history | **SELECT** (read history in reports and screens); **INSERT** (live-table triggers copy rows here under the **caller's** login) |
| **`NR_*`** (e.g. `NR_Vendor`, `NR_Sales_Summary`) | No replication | **SELECT** |
| **`NR_UserTrack`** | Audit / track messages | **SELECT** + **INSERT** (`TrackMess` in VFP; triggers add `ServerName`) |

**Script:** `03_GrantArchiveAndNR_Permissions.sql` — run on **SuperMicro + Server26** after `02_CreateDB_Roles.sql`. Re-run after adding new `Ar_*` or `NR_*` tables.

**Why `04` if `01` already grants database-wide SELECT?**  
`01` gives `ERP_AppRead` only **SELECT** at database scope. Archive **INSERT** from triggers and **`NR_UserTrack`** inserts require explicit **INSERT** on those objects for read-only role members. `04` applies object-level grants to all three app roles.

**Verify:**

```sql
SELECT name FROM sys.tables WHERE name LIKE N'Ar[_]%' ESCAPE N'\' ORDER BY name;
SELECT name FROM sys.tables WHERE name LIKE N'NR[_]%' ESCAPE N'\' ORDER BY name;

SELECT OBJECT_NAME(p.major_id) AS TableName, dp.name AS RoleOrUser, p.permission_name
FROM sys.database_permissions AS p
JOIN sys.database_principals AS dp ON p.grantee_principal_id = dp.principal_id
WHERE dp.name IN (N'ERP_AppRead', N'ERP_AppWrite', N'ERP_AppAdmin')
  AND (OBJECT_NAME(p.major_id) LIKE N'Ar[_]%' ESCAPE N'\' OR OBJECT_NAME(p.major_id) LIKE N'NR[_]%' ESCAPE N'\')
ORDER BY TableName, dp.name, p.permission_name;
```

### Table permissions (SQL Server objects)

**Default for this ERP:** most tables use database-wide grants from `01_CreateRoles.sql`:

| Role | Applies to all user tables |
|------|----------------------------|
| **ERP_AppRead** | `SELECT` |
| **ERP_AppWrite** | `SELECT`, `INSERT`, `UPDATE`, `DELETE` |
| **ERP_AppAdmin** | above + `EXECUTE` on procs/functions |

Users get table access by **membership in a role** (`05`, `06`, `07`), not by naming each table.

**New tables** created later in `ERP_1` inherit those database-level grants automatically.

**Exceptions** (one sensitive table, read-only on one table, etc.):

```sql
USE [ERP_1];
GO

-- Extra read on one table (rare — role may already cover it)
GRANT SELECT ON dbo.SomeReportTable TO [ERP_AppRead];

-- Block deletes on one table for writers (DENY wins over GRANT)
DENY DELETE ON dbo.GL_Journal TO [ERP_AppWrite];

-- Custom role for a subset of tables
CREATE ROLE [ERP_AppPayroll];
GRANT SELECT, INSERT, UPDATE ON dbo.Payroll TO [ERP_AppPayroll];
ALTER ROLE [ERP_AppPayroll] ADD MEMBER [Server26\PayrollClerk];
```

**Inspect what a login can do:**

```sql
SELECT dp.class_desc, OBJECT_SCHEMA_NAME(dp.major_id) AS Sch, OBJECT_NAME(dp.major_id) AS Obj,
       dp.permission_name, dp.state_desc
FROM sys.database_permissions AS dp
JOIN sys.database_principals AS p ON dp.grantee_principal_id = p.principal_id
WHERE p.name = N'Server26\Admin'   -- or ERP_AppWrite
ORDER BY 1, 2, 3;

SELECT * FROM fn_my_permissions(NULL, 'DATABASE');
```

**SSMS GUI:** Database `ERP_1` → Security → Roles → Database Roles → `ERP_AppWrite` → Properties → Securables.

**Not SQL table GRANT:** VFP task checks (`HavePermission('EditStockLst')`) are **Layer 2** — `AppSetup` / `AppUserGrant`. Those control which *screens/actions* run; Layer 1 controls whether SQL accepts the underlying `SELECT`/`UPDATE`.

---

## Layer 2 — Application tasks (can I edit stock, cancel SO, etc.?)

**Today (legacy):** `dbo.AppSetup` — rows where `PRP = 'YES'`, user in `UN`, task in `ANS`.  
**VFP:** `HavePermission('EditStockLst')` in `proc_setup.prg`.

**New (for your future screen):**

| Table | Purpose |
|-------|---------|
| `dbo.AppPermission` | Catalog of task codes (`EditStockLst`, `Admin`, …) |
| `dbo.AppUserGrant` | Who has which task (`UserName` + `PermissionCode`) |
| `dbo.v_AppUserEffectivePermission` | Grants + legacy AppSetup (until fully migrated) |
| `dbo.AppUsers` | Optional coarse role (`Admin`, `Sales`, …) — not wired to `HavePermission` yet |

**Scripts (run on both servers, after `03_CreateAppUsers.sql`):**

1. `MEM\SQL\Config\04_AppPermission_Schema.sql`
2. `MEM\SQL\Config\06_Migrate_AppSetup_Permissions.sql` — copies existing YES rows into `AppUserGrant`
3. `MEM\SQL\Security\08_SeedAppUsers.sql` — your Windows login as coarse Admin (optional)

**Verify:**

```sql
SELECT * FROM dbo.AppPermission ORDER BY Category, SortOrder;
SELECT TOP 20 * FROM dbo.v_AppUserEffectivePermission WHERE UserName = 'talkt';
SELECT * FROM dbo.AppUsers WHERE Active = 1;
```

**Grant yourself Admin in legacy model (if needed for Company Profile):**

```sql
IF NOT EXISTS (SELECT 1 FROM dbo.AppSetup WHERE UN = 'talkt' AND ANS = 'Admin' AND PRP = 'YES')
    INSERT INTO dbo.AppSetup (UN, PRP, ANS) VALUES ('talkt', 'YES', 'Admin');
-- SuperMicro: SYS(0) = 'SUPERMICRO # talkt' → UN is talkt (ALLTRIM after #)
-- Then re-run 06_Migrate or insert into AppUserGrant directly
```

Use the **display name** VFP sees after `#` in `SYS(0)` — same as `HavePermission` uses, not Windows login.

**David on SuperMicro:** `SYS(0) = 'SUPERMICRO # talkt'` → AppSetup.`UN` = **`talkt`**

---

## Legacy (ignore for new work)

- **`Show_User_Permission.scx`** — old Windfall AD groups (`IS_MEMBER('Windfall\HPA')`). Not used on Space Alloys domain.
- **`AppSetup` non-YES rows** — machine, home dir, email, etc. Stay in AppSetup; not part of task permissions.

---

## Roadmap — App Permission screen (later)

1. **Phase A (SQL — now):** Run scripts above; data in `AppUserGrant`.
2. **Phase B (VFP):** Change `HavePermission()` to query `v_AppUserEffectivePermission` instead of raw `AppSetup`.
3. **Phase C (VFP form):** **`PROGS\AppPermission_maint.prg`** — Maintenance → **App Permissions** (Admin only). Edits `AppSetup` PRP='YES' rows and syncs `AppUserGrant`.

Coarse `AppUsers.AppRole` can later map to default permission bundles (e.g. Sales → preset list).

---

## Order on a fresh ERP_1

```
Security\01_CreateRoles.sql
Security\02_CreateDB_Roles.sql
Security\03_GrantArchiveAndNR_Permissions.sql    (re-run after 02 or new Ar_/NR_* tables)
Security\05_GrantCurrentUser_Admin.sql          (each admin, each server)
Config\03_CreateAppUsers.sql
Config\04_AppPermission_Schema.sql
Config\05_AppSqlRole_Schema.sql
Config\06_Migrate_AppSetup_Permissions.sql
Security\08_SeedAppUsers.sql                     (optional)
Config\01_CompanyProfile_Schema.sql              (if not in full build)
Config\07_Seed_CompanyProfile.sql
```

See **[../RUN-ORDER.md](../RUN-ORDER.md)** for the full table.
