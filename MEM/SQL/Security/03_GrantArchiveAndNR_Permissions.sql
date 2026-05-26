/* ERP_1 — Archive (AR.*) and No-Replication (NR_*) table permissions.
   Run on SuperMicro and Server26 after 01_CreateRoles.sql and 02_CreateDB_Roles.sql.

   Policy:
     [AR.*]  Archive history — SELECT for all app roles; INSERT for all app roles
             (INSERT triggers on live tables run as the calling user).
     [NR_*]  No replication   — SELECT for all app roles.
     [NR_UserTrack]           — SELECT + INSERT for all app roles (VFP TrackMess + triggers).

   Idempotent — safe to re-run after new AR./NR_ tables are added. */

USE [ERP_1];
GO

SET NOCOUNT ON;

DECLARE @roles TABLE (RoleName sysname NOT NULL PRIMARY KEY);

/* Coarse app roles (database-wide grants from 01) */
INSERT INTO @roles (RoleName) VALUES
    (N'ERP_AppRead'),
    (N'ERP_AppWrite'),
    (N'ERP_AppAdmin');

/* Area roles from catalog when deployed; else static list from 02_CreateDB_Roles.sql */
IF OBJECT_ID(N'dbo.AppSqlRole', N'U') IS NOT NULL
BEGIN
    INSERT INTO @roles (RoleName)
    SELECT r.RoleName
    FROM dbo.AppSqlRole AS r
    WHERE r.Active = 1 AND r.IncludeInArchiveGrants = 1
      AND DATABASE_PRINCIPAL_ID(r.RoleName) IS NOT NULL
      AND NOT EXISTS (SELECT 1 FROM @roles AS x WHERE x.RoleName = r.RoleName);
END
ELSE
BEGIN
    INSERT INTO @roles (RoleName)
    SELECT v.RoleName
    FROM (VALUES
        (N'ERP_Accounting_Reader'), (N'ERP_Accounting_Writer'),
        (N'ERP_AppConfig_Reader'), (N'ERP_AppConfig_Writer'),
        (N'ERP_Internal_Reader'), (N'ERP_Internal_Writer'),
        (N'ERP_Inventory_Reader'), (N'ERP_Inventory_Writer'),
        (N'ERP_Manufacturing_Reader'), (N'ERP_Manufacturing_Writer'),
        (N'ERP_MillCerts_Reader'), (N'ERP_MillCerts_Writer'),
        (N'ERP_OrderTracking_Reader'), (N'ERP_OrderTracking_Writer'),
        (N'ERP_PersonalData_Reader'), (N'ERP_PersonalData_Writer'),
        (N'ERP_Pricing_Writer'),
        (N'ERP_PurchaseOrder_Reader'), (N'ERP_PurchaseOrder_Writer'),
        (N'ERP_Purchasing_Writer'),
        (N'ERP_QA_Reader'), (N'ERP_QA_Writer'),
        (N'ERP_QMS_Reader'), (N'ERP_QMS_Writer'),
        (N'ERP_Rma_Reader'), (N'ERP_Rma_Writer'),
        (N'ERP_Sales_Reader'), (N'ERP_Sales_Writer'),
        (N'ERP_Shipping_Reader'), (N'ERP_Shipping_Writer'),
        (N'ERP_Survey_Reader'), (N'ERP_Survey_Writer'),
        (N'ERP_Vendor_Reader'), (N'ERP_Vendor_Writer'),
        (N'ERP_WorkOrder_Reader'), (N'ERP_WorkOrder_Writer')
    ) AS v(RoleName)
    WHERE DATABASE_PRINCIPAL_ID(v.RoleName) IS NOT NULL
      AND NOT EXISTS (SELECT 1 FROM @roles AS x WHERE x.RoleName = v.RoleName);
END

DECLARE @role     sysname;
DECLARE @obj      nvarchar(517);
DECLARE @sql      nvarchar(max);
DECLARE @nArSel   int = 0;
DECLARE @nArIns   int = 0;
DECLARE @nNrSel   int = 0;
DECLARE @nTrack   int = 0;

PRINT '=== ERP_1 AR.* / NR_* permissions ===';

/* ----- AR.* archive tables (name starts with AR. — case-insensitive) ----- */
DECLARE ar_cur CURSOR LOCAL FAST_FORWARD FOR
    SELECT QUOTENAME(OBJECT_SCHEMA_NAME(t.object_id)) + N'.' + QUOTENAME(t.name)
    FROM sys.tables AS t
    WHERE t.type = N'U'
      AND t.name LIKE N'AR.%' ESCAPE N'\';  /* CI collation: matches Ar., AR., etc. */

OPEN ar_cur;
FETCH NEXT FROM ar_cur INTO @obj;

WHILE @@FETCH_STATUS = 0
BEGIN
    DECLARE role_ar CURSOR LOCAL FAST_FORWARD FOR
        SELECT RoleName FROM @roles;

    OPEN role_ar;
    FETCH NEXT FROM role_ar INTO @role;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @sql = N'GRANT SELECT ON ' + @obj + N' TO ' + QUOTENAME(@role);
        EXEC (@sql);
        SET @nArSel += 1;

        SET @sql = N'GRANT INSERT ON ' + @obj + N' TO ' + QUOTENAME(@role);
        EXEC (@sql);
        SET @nArIns += 1;

        FETCH NEXT FROM role_ar INTO @role;
    END

    CLOSE role_ar;
    DEALLOCATE role_ar;

    FETCH NEXT FROM ar_cur INTO @obj;
END

CLOSE ar_cur;
DEALLOCATE ar_cur;

/* ----- NR_* tables — SELECT only (not NR_UserTrack INSERT yet) ----- */
DECLARE nr_cur CURSOR LOCAL FAST_FORWARD FOR
    SELECT QUOTENAME(OBJECT_SCHEMA_NAME(t.object_id)) + N'.' + QUOTENAME(t.name)
    FROM sys.tables AS t
    WHERE t.type = N'U'
      AND t.name LIKE N'NR[_]%' ESCAPE N'\';

OPEN nr_cur;
FETCH NEXT FROM nr_cur INTO @obj;

WHILE @@FETCH_STATUS = 0
BEGIN
    DECLARE role_nr CURSOR LOCAL FAST_FORWARD FOR
        SELECT RoleName FROM @roles;

    OPEN role_nr;
    FETCH NEXT FROM role_nr INTO @role;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @sql = N'GRANT SELECT ON ' + @obj + N' TO ' + QUOTENAME(@role);
        EXEC (@sql);
        SET @nNrSel += 1;

        FETCH NEXT FROM role_nr INTO @role;
    END

    CLOSE role_nr;
    DEALLOCATE role_nr;

    FETCH NEXT FROM nr_cur INTO @obj;
END

CLOSE nr_cur;
DEALLOCATE nr_cur;

/* ----- NR_UserTrack — INSERT for every app user ----- */
IF OBJECT_ID(N'dbo.NR_UserTrack', N'U') IS NOT NULL
BEGIN
    DECLARE role_ut CURSOR LOCAL FAST_FORWARD FOR
        SELECT RoleName FROM @roles;

    OPEN role_ut;
    FETCH NEXT FROM role_ut INTO @role;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @sql = N'GRANT INSERT ON dbo.NR_UserTrack TO ' + QUOTENAME(@role);
        EXEC (@sql);
        SET @nTrack += 1;

        FETCH NEXT FROM role_ut INTO @role;
    END

    CLOSE role_ut;
    DEALLOCATE role_ut;
END
ELSE
    PRINT 'WARNING: dbo.NR_UserTrack not found — skip INSERT grants.';

PRINT CONCAT('AR.*  SELECT grants: ', @nArSel, '  INSERT grants: ', @nArIns);
PRINT CONCAT('NR_*  SELECT grants: ', @nNrSel);
PRINT CONCAT('NR_UserTrack INSERT grants: ', @nTrack);
PRINT 'Done.';
PRINT 'Next: Config\03_CreateAppUsers.sql, Config\05_AppSqlRole_Schema.sql';
PRINT 'Login grants: 05_GrantCurrentUser_Admin.sql (or 06 / 07 as needed).';
GO

/* ----- Inventory (run manually to verify) ----- */
/*
SELECT name AS ArchiveTable
FROM sys.tables
WHERE name LIKE N'AR.%'
ORDER BY name;

SELECT name AS NR_Table
FROM sys.tables
WHERE name LIKE N'NR[_]%' ESCAPE N'\'
ORDER BY name;

SELECT OBJECT_NAME(major_id) AS Obj, dp.name AS Grantee, permission_name, state_desc
FROM sys.database_permissions AS p
JOIN sys.database_principals AS dp ON p.grantee_principal_id = dp.principal_id
WHERE OBJECT_NAME(major_id) LIKE N'AR.%'
   OR OBJECT_NAME(major_id) LIKE N'NR[_]%' ESCAPE N'\'
ORDER BY Obj, Grantee, permission_name;
*/
