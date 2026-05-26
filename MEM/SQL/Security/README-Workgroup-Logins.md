# SQL logins — workgroup (no domain)

You are **not on a domain**. Do **not** use `SPACEALLOYS\...` unless that domain exists later.

## Login name format

| Where | Example login |
|-------|----------------|
| PC **SuperMicro**, user **talkt** | `SuperMicro\talkt` |
| PC **Server26**, admin account | **`Server26\Admin`** (dev SQL / SSRS server) |
| PC **Server26**, other user | `Server26\WindowsUsername` |

Find the name on any PC:

```cmd
whoami
```

In SSMS on that SQL instance:

```sql
SELECT SYSTEM_USER AS LoginName, USER_NAME() AS DbUser;
SELECT name, type_desc FROM sys.server_principals WHERE type IN ('U','G') ORDER BY name;
```

## Who runs what

| Person / machine | Script |
|------------------|--------|
| **You on SuperMicro** (built ERP_1) | Already **`dbo`** — skip grants; full access |
| **You on Server26** (dev SQL) | Grant **`Server26\Admin`** — run `05` as that login, or set `@login = N'Server26\Admin'` in `06` |
| **Same Windows user, standard access** | `07_GrantCurrentUser_AppWrite.sql` on that server |
| **Another Windows account** | Edit `@login` in `06_GrantUser_AppWrite.sql` → e.g. `N'SuperMicro\ShopUser'` |

Each SQL Server only knows **local** (or previously created) logins.  
`Server26\Jane` must be created on **Server26’s** SQL; it is not automatic from SuperMicro.

## Trusted connection from VFP

ERP uses `Trusted_Connection=yes` — the Windows user **running VFP** must have a login on the **target** SQL instance (SuperMicro or Server26 per `ERP_Environment.xml`).

## Domain later

When you join a domain, add new scripts or change logins to `DOMAIN\user`. Existing `Computer\user` logins can remain until migrated.
