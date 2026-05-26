/* Template: grant a Windows login access to ERP_1
   Run on EACH SQL instance (SuperMicro, Server26).

   Workgroup (no domain):  ComputerName\WindowsUser   e.g. SuperMicro\talkt
   Domain (later):         DOMAIN\WindowsUser

   See README-Workgroup-Logins.md — prefer 06_GrantUser_AppWrite.sql instead.
*/
USE [master];
GO

-- Instance login (skip if login already exists)
IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = N'<DOMAIN\login>')
    CREATE LOGIN [<DOMAIN\login>] FROM WINDOWS;
GO

USE [ERP_1];
GO

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = N'<DOMAIN\login>')
    CREATE USER [<DOMAIN\login>] FOR LOGIN [<DOMAIN\login>];
GO

ALTER ROLE [ERP_AppWrite] ADD MEMBER [<DOMAIN\login>];
-- Developers / owners: use ERP_AppAdmin instead
-- ALTER ROLE [ERP_AppAdmin] ADD MEMBER [<DOMAIN\login>];
GO
