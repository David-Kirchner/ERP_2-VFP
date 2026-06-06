/* Seed AppUsers — coarse Admin gate (optional; AppSetup still used for tasks) */
USE [ERP_2];
GO

IF OBJECT_ID('dbo.AppUsers', 'U') IS NULL
BEGIN
    RAISERROR('Run MEM\SQL\Config\03_CreateAppUsers.sql first.', 16, 1);
    RETURN;
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.AppUsers WHERE WindowsLogin = N'SuperMicro\talkt')
    INSERT INTO dbo.AppUsers (WindowsLogin, AppRole, DisplayName, Active)
    VALUES (N'SuperMicro\talkt', N'Admin', N'David Kirchner', 1);
-- Workgroup example: N'SuperMicro\talkt'  — use whoami on that PC
GO
