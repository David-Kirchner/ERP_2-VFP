/* Grant ERP_AppWrite to whoever runs this script (standard user role; admin use 05).
   Use when you are NOT dbo but need ERP access on this server.
   Run in SSMS on each instance while logged in as that Windows user. */

USE [master];
GO

SET NOCOUNT ON;

DECLARE @login  sysname = SYSTEM_USER;
DECLARE @dbUser sysname = NULL;
DECLARE @sql    nvarchar(max);

PRINT CONCAT('Granting ERP_AppWrite to: ', @login);

IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = @login)
BEGIN
    SET @sql = N'CREATE LOGIN ' + QUOTENAME(@login) + N' FROM WINDOWS';
    EXEC (@sql);
    PRINT 'Created server login.';
END

USE [ERP_1];

SELECT @dbUser = dp.name
FROM sys.database_principals AS dp
INNER JOIN sys.server_principals AS sp ON dp.sid = sp.sid
WHERE sp.name = @login;

IF @dbUser = N'dbo'
BEGIN
    PRINT 'You are dbo — already have full access.';
    RETURN;
END

IF @dbUser IS NULL
BEGIN
    SET @sql = N'CREATE USER ' + QUOTENAME(@login) + N' FOR LOGIN ' + QUOTENAME(@login);
    EXEC (@sql);
    SET @dbUser = @login;
    PRINT 'Created database user.';
END

IF NOT EXISTS (
    SELECT 1 FROM sys.database_role_members AS m
    INNER JOIN sys.database_principals AS r ON m.role_principal_id = r.principal_id
    INNER JOIN sys.database_principals AS u ON m.member_principal_id = u.principal_id
    WHERE r.name = N'ERP_AppWrite' AND u.name = @dbUser
)
BEGIN
    SET @sql = N'ALTER ROLE [ERP_AppWrite] ADD MEMBER ' + QUOTENAME(@dbUser);
    EXEC (@sql);
    PRINT CONCAT('Added ', @dbUser, ' to ERP_AppWrite.');
END
ELSE
    PRINT 'Already in ERP_AppWrite.';

PRINT CONCAT('Done. ', @login);
GO
