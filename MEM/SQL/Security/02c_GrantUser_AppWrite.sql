/* Grant ERP_AppWrite to ONE Windows login on this SQL instance.
   Workgroup (no domain): use  ComputerName\WindowsUser
     e.g. SuperMicro\talkt   or   Server26\SomeUser
   Domain (later):         use  DOMAIN\WindowsUser

   *** EDIT @login BELOW, then run on SuperMicro and/or Server26 *** */

USE [master];
GO

SET NOCOUNT ON;

--DECLARE @login sysname = N'SuperMicro\talkt';  /* real name, not MACHINENAME\... */
DECLARE @login sysname = N'Server26\Admin';  /* real name, not MACHINENAME\... */
DECLARE @dbUser sysname = NULL;
DECLARE @sql    nvarchar(max);

IF @login = N'MACHINENAME\WindowsUsername'
BEGIN
    RAISERROR('Edit @login in this script first. Example: N''SuperMicro\talkt''', 16, 1);
    RETURN;
END

IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = @login)
BEGIN
    BEGIN TRY
        SET @sql = N'CREATE LOGIN ' + QUOTENAME(@login) + N' FROM WINDOWS';
        EXEC (@sql);
        PRINT CONCAT('Created server login: ', @login);
    END TRY
    BEGIN CATCH
        PRINT 'CREATE LOGIN failed. Check spelling — use whoami on that PC (Computer\User).';
        PRINT ERROR_MESSAGE();
        RETURN;
    END CATCH
END
ELSE
    PRINT CONCAT('Server login already exists: ', @login);

USE [ERP_1];

SELECT @dbUser = dp.name
FROM sys.database_principals AS dp
INNER JOIN sys.server_principals AS sp ON dp.sid = sp.sid
WHERE sp.name = @login;

IF @dbUser = N'dbo'
BEGIN
    PRINT CONCAT(@login, ' is dbo — already has full access; ERP_AppWrite not needed.');
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
    PRINT CONCAT('Database user: ', @dbUser);

IF NOT EXISTS (
    SELECT 1 FROM sys.database_role_members AS m
    INNER JOIN sys.database_principals AS r ON m.role_principal_id = r.principal_id
    INNER JOIN sys.database_principals AS u ON m.member_principal_id = u.principal_id
    WHERE r.name = N'ERP_AppWrite' AND u.name = @dbUser
)
BEGIN
    BEGIN TRY
        SET @sql = N'ALTER ROLE [ERP_AppWrite] ADD MEMBER ' + QUOTENAME(@dbUser);
        EXEC (@sql);
        PRINT CONCAT('Added ', @dbUser, ' to ERP_AppWrite.');
    END TRY
    BEGIN CATCH
        PRINT 'ALTER ROLE failed: ' + ERROR_MESSAGE();
        RETURN;
    END CATCH
END
ELSE
    PRINT CONCAT(@dbUser, ' already in ERP_AppWrite.');

PRINT CONCAT('Done. ', @login);
GO
