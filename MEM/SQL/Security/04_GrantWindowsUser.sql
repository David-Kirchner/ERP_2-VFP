/* Template: grant a Windows login access to ERP_2
   Run on EACH SQL instance (SuperMicro, Server26).

   Workgroup (no domain):  ComputerName\WindowsUser   e.g. SuperMicro\talkt
   Domain (later):         DOMAIN\WindowsUser

   See README-Workgroup-Logins.md — prefer 06_GrantUser_AppWrite.sql instead.
*/
USE [master];
GO

-- Instance login (skip if login already exists)
IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = N'SuperMicro\talkt')
    CREATE LOGIN [SuperMicro\talkt] FROM WINDOWS;
GO

USE [ERP_2];
GO

IF SUSER_SNAME((SELECT owner_sid FROM sys.databases WHERE name = DB_NAME())) = N'SuperMicro\talkt'
BEGIN
    PRINT 'SuperMicro\talkt owns ERP_2 as dbo; no separate database user or role grant needed.';
END
ELSE
BEGIN
    IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = N'SuperMicro\talkt')
        CREATE USER [SuperMicro\talkt] FOR LOGIN [SuperMicro\talkt];

    ALTER ROLE [ERP_AppWrite] ADD MEMBER [SuperMicro\talkt];
    -- Developers / owners: use ERP_AppAdmin instead
    -- ALTER ROLE [ERP_AppAdmin] ADD MEMBER [SuperMicro\talkt];
END
GO
