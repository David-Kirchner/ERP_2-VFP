-- Run once against ERP_2 database to create the application user / role table.
-- AppUser maps a Windows login (DOMAIN\username) to an ERP role.
-- Valid roles: Admin | Sales | Production | Quality | ReadOnly

USE [ERP_2];
GO

IF NOT EXISTS (
    SELECT 1 FROM sys.tables WHERE name = 'AppUsers' AND schema_id = SCHEMA_ID('dbo')
)
BEGIN
    CREATE TABLE dbo.AppUsers (
        Id           INT           NOT NULL IDENTITY(1,1) PRIMARY KEY,
        WindowsLogin NVARCHAR(200) NOT NULL,
        AppRole      NVARCHAR(50)  NOT NULL CONSTRAINT DF_AppUsers_AppRole DEFAULT 'ReadOnly',
        Active       BIT           NOT NULL CONSTRAINT DF_AppUsers_Active  DEFAULT 1,
        DisplayName  NVARCHAR(200) NULL
    );

    CREATE UNIQUE INDEX UX_AppUsers_Login ON dbo.AppUsers (WindowsLogin);

    PRINT 'AppUsers table created.';
END
ELSE
    PRINT 'AppUsers table already exists — skipped.';

-- Seed: add yourself as Admin so you can reach the /admin/users page
-- Adjust the login to match your Windows identity (run SELECT SYSTEM_USER to check).
-- INSERT INTO dbo.AppUsers (WindowsLogin, AppRole, DisplayName)
-- VALUES ('DOMAIN\yourlogin', 'Admin', 'Your Name');
