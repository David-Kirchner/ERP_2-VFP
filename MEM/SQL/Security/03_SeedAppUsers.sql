/* Seed AppUsers — coarse Admin gate (optional; AppSetup still used for tasks) */
USE [ERP_1];
GO

IF OBJECT_ID('dbo.AppUsers', 'U') IS NULL
BEGIN
    RAISERROR('Run MEM\SQL\Config\CreateAppUsers.sql first.', 16, 1);
    RETURN;
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.AppUsers WHERE WindowsLogin = N'<DOMAIN\login>')
    INSERT INTO dbo.AppUsers (WindowsLogin, AppRole, DisplayName, Active)
    VALUES (N'<DOMAIN\login>', N'Admin', N'ERP Administrator', 1);
GO
