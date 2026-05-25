# Dual SQL instances (SuperMicro + Server26)

Run **the same scripts on both** database instances for `ERP_1`:

1. `CompanyProfile_Schema.sql` (+ `CompanyProfile_Schema_Fix01.sql` if needed)
2. `CreateAppUsers.sql` (future role-based permissions; not yet used by VFP `HavePermission`)
3. `MEM\SQL\Security\01_CreateRoles.sql` and `02_GrantWindowsUser.sql` on **master** and **ERP_1**

**Production (SuperMicro, SQL 2017):** OLTP data — no SSRS.  
**Development (Server26\\Server26, SQL 2016):** dev copy of `ERP_1` + SSRS report files.

VFP `ERP_Environment.xml` sets `reportServer` separately from `server` so Production can use SuperMicro for data and Server26 for Report Viewer URLs.

Keep schemas in sync manually (or use backup/restore + post-migration scripts) until you adopt automated deploy.
