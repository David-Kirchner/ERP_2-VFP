/* One-time (idempotent): copy dbo.AppSetup YES rows into dbo.AppUserGrant
   Run after 04_AppPermission_Schema.sql on each ERP_2 instance. */

USE [ERP_2];
GO

IF OBJECT_ID('dbo.AppUserGrant', 'U') IS NULL
BEGIN
    RAISERROR('Run 04_AppPermission_Schema.sql first.', 16, 1);
    RETURN;
END

IF OBJECT_ID('dbo.AppSetup', 'U') IS NULL
BEGIN
    PRINT 'dbo.AppSetup not found; no legacy AppSetup permissions to migrate.';
    RETURN;
END

EXEC(N'
INSERT INTO dbo.AppUserGrant (UserName, PermissionCode, Granted, ModifiedBy, ModifiedUtc)
SELECT DISTINCT
    LTRIM(RTRIM(a.UN)),
    LTRIM(RTRIM(a.ANS)),
    1,
    N''Migrate_AppSetup'',
    SYSUTCDATETIME()
FROM dbo.AppSetup AS a WITH (NOLOCK)
WHERE UPPER(LTRIM(RTRIM(a.PRP))) = N''YES''
  AND LTRIM(RTRIM(a.UN)) <> N''''
  AND LTRIM(RTRIM(a.ANS)) <> N''''
  AND EXISTS (SELECT 1 FROM dbo.AppPermission AS p WHERE p.PermissionCode = LTRIM(RTRIM(a.ANS)))
  AND NOT EXISTS (
      SELECT 1 FROM dbo.AppUserGrant AS g
      WHERE g.UserName = LTRIM(RTRIM(a.UN))
        AND g.PermissionCode = LTRIM(RTRIM(a.ANS))
  );

DECLARE @cnt INT = (SELECT COUNT(*) FROM dbo.AppUserGrant);
PRINT CONCAT(''AppUserGrant rows: '', @cnt);

SELECT DISTINCT LTRIM(RTRIM(a.ANS)) AS OrphanPermissionCode
FROM dbo.AppSetup AS a WITH (NOLOCK)
WHERE UPPER(LTRIM(RTRIM(a.PRP))) = N''YES''
  AND NOT EXISTS (
      SELECT 1 FROM dbo.AppPermission AS p WHERE p.PermissionCode = LTRIM(RTRIM(a.ANS))
  )
ORDER BY 1;
');
GO