# ERP_1 SQL scripts (ERP_2 repo)

**Database name:** `ERP_1` on SuperMicro (production) and Server26 (development).  
**Source of truth:** this folder in git (`E:\VFP\ERP_2\MEM\SQL\`), not OneDrive alone.

## Folder layout

| Folder | Purpose |
|--------|---------|
| [`../Create ERP_new/`](../Create%20ERP_new/) | **Full database build** — run in order `01` … `09` on a **new empty** `ERP_1` |
| [`Config/`](Config/) | **Incremental** changes after build — scripts `01` … `07` (CompanyProfile, AppUsers, permissions) |
| [`Security/`](Security/) | Roles, Windows login grants — scripts `01` … `08` |
| [`Migrations/`](Migrations/) | **New** one-off changes — copy `00_Migration_TEMPLATE.sql` to `YYYYMMDD_description.sql` |

## When you change the live database

1. **Small change** (new column, new table, fix data):  
   - Add `Migrations\YYYYMMDD_short_description.sql`  
   - Run it on **both** SuperMicro and Server26  
   - Commit via `DO GitCommit` or git

2. **Large / structural change** (many objects):  
   - In SSMS: right-click database → **Tasks → Generate Scripts** (or update `01 Create from HPAlloy.sql`)  
   - Save under `MEM\Create ERP_new\` **or** run `tools\Sync-SQLScriptsFromSSMS.ps1` from your SSMS folder  
   - Commit the updated script(s)

3. **Never** rely only on OneDrive SSMS path — sync into this repo so git and both servers stay aligned.

## New database (empty server)

On **each** instance (SuperMicro, Server26), in SSMS:

```
01 Create from HPAlloy.sql
02 Create from HPAlloy_Archive.sql
03 Create from HPAlloyNR.sql
04 Create Views.sql
06 Create Diagrams.sql      ← note: no 05 in set
07 Copy HPAlloyNR to NR_.sql
08 Fill Standard Data files.sql
09 fill some Quotes.sql
```

Then **Config** ([RUN-ORDER.md](RUN-ORDER.md), [Config/README.md](Config/README.md)) and **Security** ([Security/README.md](Security/README.md)).

`10_CreateAppUsers.sql` in `Create ERP_new` matches `Config\03_CreateAppUsers.sql` — prefer **Config** for updates; re-copy to `Create ERP_new` when refreshing the full build bundle.

## Sync from SSMS default folder

If you edit scripts in:

`C:\Users\talkt\OneDrive\Documents\SQL Server Management Studio 22\Create ERP_new`

Run:

```powershell
powershell -ExecutionPolicy Bypass -File E:\VFP\ERP_2\tools\Sync-SQLScriptsFromSSMS.ps1
```

Then commit.

## Verify after changes

```sql
USE ERP_1;
SELECT name, create_date, modify_date FROM sys.tables ORDER BY modify_date DESC;
-- spot-check your object
```
