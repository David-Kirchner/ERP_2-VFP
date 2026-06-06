/* ERP_1 — SQL database role catalog + Windows login grants (Layer 1 maintenance)
   Uses dbo.AppUsers (Windows login list). Does NOT use AppSetup.
   Run on SuperMicro and Server26 after Config\03_CreateAppUsers.sql and Security\02_CreateDB_Roles.sql. */

USE [ERP_2];
GO

/* ----- Catalog of ERP_* database roles (mirrors sys.database_principals type R) ----- */
IF OBJECT_ID('dbo.AppSqlRole', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.AppSqlRole (
        RoleName              NVARCHAR(128) NOT NULL PRIMARY KEY,
        AreaName              NVARCHAR(80)  NOT NULL,
        AccessLevel           NVARCHAR(10)  NOT NULL CONSTRAINT CK_AppSqlRole_Access
            CHECK (AccessLevel IN (N'Reader', N'Writer')),
        DisplayName           NVARCHAR(120) NOT NULL,
        Description           NVARCHAR(500) NULL,
        SortOrder             INT           NOT NULL CONSTRAINT DF_AppSqlRole_Sort DEFAULT 100,
        Active                BIT           NOT NULL CONSTRAINT DF_AppSqlRole_Active DEFAULT 1,
        IncludeInArchiveGrants BIT          NOT NULL CONSTRAINT DF_AppSqlRole_Archive DEFAULT 1
    );
    PRINT 'Created dbo.AppSqlRole.';
END
GO

/* ----- Per-login role grants (maintenance screen → usp_AppSqlRole_SyncLogin) ----- */
IF OBJECT_ID('dbo.AppSqlRoleGrant', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.AppSqlRoleGrant (
        Id             INT           NOT NULL IDENTITY(1,1) PRIMARY KEY,
        AppUserId      INT           NULL,
        WindowsLogin   NVARCHAR(200) NOT NULL,
        RoleName       NVARCHAR(128) NOT NULL,
        Granted        BIT           NOT NULL CONSTRAINT DF_AppSqlRoleGrant_Granted DEFAULT 1,
        ModifiedBy     NVARCHAR(100) NULL,
        ModifiedUtc    DATETIME2(0)  NOT NULL CONSTRAINT DF_AppSqlRoleGrant_Mod DEFAULT SYSUTCDATETIME(),
        CONSTRAINT FK_AppSqlRoleGrant_Role FOREIGN KEY (RoleName)
            REFERENCES dbo.AppSqlRole (RoleName),
        CONSTRAINT FK_AppSqlRoleGrant_AppUser FOREIGN KEY (AppUserId)
            REFERENCES dbo.AppUsers (Id),
        CONSTRAINT UX_AppSqlRoleGrant_LoginRole UNIQUE (WindowsLogin, RoleName)
    );
    CREATE INDEX IX_AppSqlRoleGrant_Login ON dbo.AppSqlRoleGrant (WindowsLogin) INCLUDE (RoleName, Granted);
    PRINT 'Created dbo.AppSqlRoleGrant.';
END
GO

/* ----- Seed role catalog (MERGE = safe to re-run) ----- */
;WITH src (RoleName, AreaName, AccessLevel, DisplayName, SortOrder) AS (
    SELECT * FROM (VALUES
        (N'ERP_Accounting_Reader',      N'Accounting',      N'Reader', N'Accounting — read',           110),
        (N'ERP_Accounting_Writer',      N'Accounting',      N'Writer', N'Accounting — write',          111),
        (N'ERP_AppConfig_Reader',       N'AppConfig',       N'Reader', N'App config — read',           120),
        (N'ERP_AppConfig_Writer',       N'AppConfig',       N'Writer', N'App config — write',          121),
        (N'ERP_Internal_Reader',        N'Internal',        N'Reader', N'Internal — read',             130),
        (N'ERP_Internal_Writer',        N'Internal',        N'Writer', N'Internal — write',            131),
        (N'ERP_Inventory_Reader',       N'Inventory',       N'Reader', N'Inventory — read',            140),
        (N'ERP_Inventory_Writer',       N'Inventory',       N'Writer', N'Inventory — write',           141),
        (N'ERP_Manufacturing_Reader',   N'Manufacturing',   N'Reader', N'Manufacturing — read',        150),
        (N'ERP_Manufacturing_Writer',   N'Manufacturing',   N'Writer', N'Manufacturing — write',       151),
        (N'ERP_MillCerts_Reader',       N'MillCerts',       N'Reader', N'Mill certs — read',           160),
        (N'ERP_MillCerts_Writer',       N'MillCerts',       N'Writer', N'Mill certs — write',          161),
        (N'ERP_OrderTracking_Reader',   N'OrderTracking',   N'Reader', N'Order tracking — read',       170),
        (N'ERP_OrderTracking_Writer',   N'OrderTracking',   N'Writer', N'Order tracking — write',      171),
        (N'ERP_PersonalData_Reader',    N'PersonalData',    N'Reader', N'Personal data — read',        180),
        (N'ERP_PersonalData_Writer',    N'PersonalData',    N'Writer', N'Personal data — write',       181),
        (N'ERP_Pricing_Writer',         N'Pricing',         N'Writer', N'Pricing — write',             191),
        (N'ERP_PurchaseOrder_Reader',   N'PurchaseOrder',   N'Reader', N'Purchase order — read',       200),
        (N'ERP_PurchaseOrder_Writer',   N'PurchaseOrder',   N'Writer', N'Purchase order — write',      201),
        (N'ERP_Purchasing_Writer',      N'Purchasing',      N'Writer', N'Purchasing — write',          211),
        (N'ERP_QA_Reader',              N'QA',              N'Reader', N'QA — read',                   220),
        (N'ERP_QA_Writer',              N'QA',              N'Writer', N'QA — write',                  221),
        (N'ERP_QMS_Reader',             N'QMS',             N'Reader', N'QMS — read',                  230),
        (N'ERP_QMS_Writer',             N'QMS',             N'Writer', N'QMS — write',                 231),
        (N'ERP_Rma_Reader',             N'Rma',             N'Reader', N'RMA — read',                  240),
        (N'ERP_Rma_Writer',             N'Rma',             N'Writer', N'RMA — write',                 241),
        (N'ERP_Sales_Reader',           N'Sales',           N'Reader', N'Sales — read',                250),
        (N'ERP_Sales_Writer',           N'Sales',           N'Writer', N'Sales — write',               251),
        (N'ERP_Shipping_Reader',        N'Shipping',        N'Reader', N'Shipping — read',             260),
        (N'ERP_Shipping_Writer',        N'Shipping',        N'Writer', N'Shipping — write',            261),
        (N'ERP_Survey_Reader',          N'Survey',          N'Reader', N'Survey — read',               270),
        (N'ERP_Survey_Writer',          N'Survey',          N'Writer', N'Survey — write',              271),
        (N'ERP_Vendor_Reader',          N'Vendor',          N'Reader', N'Vendor — read',               280),
        (N'ERP_Vendor_Writer',          N'Vendor',          N'Writer', N'Vendor — write',              281),
        (N'ERP_WorkOrder_Reader',       N'WorkOrder',       N'Reader', N'Work order — read',           290),
        (N'ERP_WorkOrder_Writer',       N'WorkOrder',       N'Writer', N'Work order — write',          291)
    ) AS v(RoleName, AreaName, AccessLevel, DisplayName, SortOrder)
)
MERGE dbo.AppSqlRole AS t
USING src AS s ON t.RoleName = s.RoleName
WHEN NOT MATCHED BY TARGET THEN
    INSERT (RoleName, AreaName, AccessLevel, DisplayName, SortOrder)
    VALUES (s.RoleName, s.AreaName, s.AccessLevel, s.DisplayName, s.SortOrder)
WHEN MATCHED AND (t.DisplayName <> s.DisplayName OR t.AreaName <> s.AreaName
                  OR t.AccessLevel <> s.AccessLevel OR t.SortOrder <> s.SortOrder) THEN
    UPDATE SET DisplayName = s.DisplayName, AreaName = s.AreaName,
               AccessLevel = s.AccessLevel, SortOrder = s.SortOrder;
GO

CREATE OR ALTER VIEW dbo.v_AppSqlRoleEffectiveGrant
AS
    SELECT g.WindowsLogin, g.AppUserId, g.RoleName, r.AreaName, r.AccessLevel, r.DisplayName
    FROM dbo.AppSqlRoleGrant AS g WITH (NOLOCK)
    INNER JOIN dbo.AppSqlRole AS r WITH (NOLOCK) ON r.RoleName = g.RoleName
    WHERE g.Granted = 1 AND r.Active = 1;
GO

/* Apply AppSqlRoleGrant rows to SQL Server role membership for one Windows login. */
CREATE OR ALTER PROC dbo.usp_AppSqlRole_SyncLogin
    @WindowsLogin NVARCHAR(200),
    @ModifiedBy   NVARCHAR(100) = NULL
AS
SET NOCOUNT ON;

DECLARE @login  NVARCHAR(200) = LTRIM(RTRIM(@WindowsLogin));
DECLARE @dbUser SYSNAME;
DECLARE @role   SYSNAME;
DECLARE @sql    NVARCHAR(MAX);

IF @login = N''
BEGIN
    RAISERROR(N'WindowsLogin is required.', 16, 1);
    RETURN;
END

SELECT @dbUser = dp.name
FROM sys.server_principals AS sp
INNER JOIN sys.database_principals AS dp ON dp.sid = sp.sid
WHERE sp.name = @login;

IF @dbUser IS NULL
BEGIN
    IF EXISTS (SELECT 1 FROM sys.server_principals WHERE name = @login)
    BEGIN
        SET @sql = N'CREATE USER ' + QUOTENAME(@login) + N' FOR LOGIN ' + QUOTENAME(@login) + N';';
        EXEC (@sql);
        SET @dbUser = @login;
    END
    ELSE
    BEGIN
        RAISERROR(N'Server login %s not found on this SQL instance. Create the Windows login first.', 16, 1, @login);
        RETURN;
    END
END

DECLARE @desired TABLE (RoleName SYSNAME NOT NULL PRIMARY KEY);
INSERT INTO @desired (RoleName)
SELECT g.RoleName
FROM dbo.AppSqlRoleGrant AS g
INNER JOIN dbo.AppSqlRole AS r ON r.RoleName = g.RoleName
WHERE g.WindowsLogin = @login AND g.Granted = 1 AND r.Active = 1;

DECLARE add_cur CURSOR LOCAL FAST_FORWARD FOR
    SELECT d.RoleName
    FROM @desired AS d
    WHERE DATABASE_PRINCIPAL_ID(d.RoleName) IS NOT NULL
      AND NOT EXISTS (
          SELECT 1
          FROM sys.database_role_members AS m
          INNER JOIN sys.database_principals AS rp ON m.role_principal_id = rp.principal_id
          INNER JOIN sys.database_principals AS mp ON m.member_principal_id = mp.principal_id
          WHERE rp.name = d.RoleName AND mp.name = @dbUser
      );

OPEN add_cur;
FETCH NEXT FROM add_cur INTO @role;
WHILE @@FETCH_STATUS = 0
BEGIN
    SET @sql = N'ALTER ROLE ' + QUOTENAME(@role) + N' ADD MEMBER ' + QUOTENAME(@dbUser) + N';';
    EXEC (@sql);
    FETCH NEXT FROM add_cur INTO @role;
END
CLOSE add_cur;
DEALLOCATE add_cur;

DECLARE drop_cur CURSOR LOCAL FAST_FORWARD FOR
    SELECT rp.name
    FROM sys.database_role_members AS m
    INNER JOIN sys.database_principals AS rp ON m.role_principal_id = rp.principal_id
    INNER JOIN sys.database_principals AS mp ON m.member_principal_id = mp.principal_id
    INNER JOIN dbo.AppSqlRole AS cat ON cat.RoleName = rp.name AND cat.Active = 1
    WHERE mp.name = @dbUser
      AND NOT EXISTS (SELECT 1 FROM @desired AS d WHERE d.RoleName = rp.name);

OPEN drop_cur;
FETCH NEXT FROM drop_cur INTO @role;
WHILE @@FETCH_STATUS = 0
BEGIN
    SET @sql = N'ALTER ROLE ' + QUOTENAME(@role) + N' DROP MEMBER ' + QUOTENAME(@dbUser) + N';';
    EXEC (@sql);
    FETCH NEXT FROM drop_cur INTO @role;
END
CLOSE drop_cur;
DEALLOCATE drop_cur;

PRINT CONCAT('Synced SQL role membership for ', @login, ' (', @dbUser, ').');
GO

PRINT 'AppSqlRole schema ready. Re-run Security\03_GrantArchiveAndNR_Permissions.sql for AR./NR_* on new roles.';
GO
