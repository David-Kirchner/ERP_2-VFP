/* Grant the Windows login running this script ERP_AppAdmin on ERP_2.
   Run in SSMS on EACH instance (SuperMicro, Server26). Uses SYSTEM_USER.

   If your login is already dbo (built the database), you already have full access —
   no CREATE USER or role assignment is required. */

USE [master];
GO

SET NOCOUNT ON;

DECLARE @login  sysname = SYSTEM_USER;
DECLARE @dbUser sysname = NULL;
DECLARE @sql    nvarchar(max);

IF @login LIKE N'NT AUTHORITY\%' OR @login LIKE N'NT SERVICE\%'
BEGIN
    RAISERROR('Run this script interactively as your domain user, not as a service account.', 16, 1);
    RETURN;
END

PRINT CONCAT('Granting ERP access to: ', @login);

IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = @login)
BEGIN
    SET @sql = N'CREATE LOGIN ' + QUOTENAME(@login) + N' FROM WINDOWS';
    EXEC (@sql);
    PRINT 'Created server login.';
END
ELSE
    PRINT 'Server login already exists.';

USE [ERP_2];

/* Map login → database principal (may be dbo, not the login name) */
SELECT @dbUser = dp.name
FROM sys.database_principals AS dp
INNER JOIN sys.server_principals AS sp ON dp.sid = sp.sid
WHERE sp.name = @login;

IF @dbUser = N'dbo'
BEGIN
    PRINT 'Login maps to dbo (database owner). Full access on ERP_2 — ERP_AppAdmin not required.';
    PRINT CONCAT('Done. ', @login, ' is dbo on ERP_2.');
    RETURN;
END

IF @dbUser IS NULL
BEGIN
    BEGIN TRY
        SET @sql = N'CREATE USER ' + QUOTENAME(@login) + N' FOR LOGIN ' + QUOTENAME(@login);
        EXEC (@sql);
        SET @dbUser = @login;
        PRINT 'Created database user.';
    END TRY
    BEGIN CATCH
        PRINT 'CREATE USER failed: ' + ERROR_MESSAGE();
        RETURN;
    END CATCH
END
ELSE
    PRINT CONCAT('Database user already exists: ', @dbUser);

IF NOT EXISTS (
    SELECT 1
    FROM sys.database_role_members AS m
    INNER JOIN sys.database_principals AS r ON m.role_principal_id = r.principal_id
    INNER JOIN sys.database_principals AS u ON m.member_principal_id = u.principal_id
    WHERE r.name = N'ERP_AppAdmin' AND u.name = @dbUser
)
BEGIN
    BEGIN TRY
        SET @sql = N'ALTER ROLE [ERP_AppAdmin] ADD MEMBER ' + QUOTENAME(@dbUser);
        EXEC (@sql);
        PRINT CONCAT('Added ', @dbUser, ' to ERP_AppAdmin.');
    END TRY
    BEGIN CATCH
        PRINT 'ALTER ROLE failed: ' + ERROR_MESSAGE();
        RETURN;
    END CATCH
END
ELSE
    PRINT CONCAT(@dbUser, ' is already in ERP_AppAdmin.');

PRINT CONCAT('Done. ', @login, ' (', @dbUser, ') has ERP_AppAdmin on ERP_2.');
GO
