/* ERP_1 — Archive (AR.*) and No-Replication (NR_*) table permissions.
   Run on SuperMicro and Server26 after 01_CreateRoles.sql (and after schema build).

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
INSERT INTO @roles (RoleName) VALUES
    (N'ERP_AppRead'),
    (N'ERP_AppWrite'),
    (N'ERP_AppAdmin');

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
