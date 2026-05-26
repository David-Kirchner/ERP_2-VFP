# Dual-server deployment (SuperMicro + Server26)

Run **the same scripts on both** database instances for `ERP_1`:

1. `Config\01_CompanyProfile_Schema.sql` (+ `02_CompanyProfile_Schema_Fix01.sql` if needed)
2. `Config\03_CreateAppUsers.sql` (future role-based permissions; not yet used by VFP `HavePermission`)
3. `Security\01_CreateRoles.sql` and `04_GrantWindowsUser.sql` on **master** and **ERP_1**

See **[RUN-ORDER.md](RUN-ORDER.md)** for the full sequence.

**Production (SuperMicro):** live data + SSRS reports on Server26.

**Development (Server26\\Server26, SQL 2016):** dev copy of `ERP_1` + SSRS report files.

VFP `ERP_Environment.xml` sets `reportServer` separately from `server` so Production can use SuperMicro for data and Server26 for Report Viewer URLs.
