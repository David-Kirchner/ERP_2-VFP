/* ERP_1 — application permission catalog + user grants (future App Permission screen)
   Run on SuperMicro and Server26 after CreateAppUsers.sql / AppSetup exists.
   Idempotent. Does NOT drop dbo.AppSetup — legacy rows remain until migrated. */

USE [ERP_1];
GO

/* ----- Catalog of permission codes (matches HavePermission('Task') strings) ----- */
IF OBJECT_ID('dbo.AppPermission', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.AppPermission (
        PermissionCode NVARCHAR(80)  NOT NULL PRIMARY KEY,
        DisplayName    NVARCHAR(120) NOT NULL,
        Category       NVARCHAR(50)  NOT NULL CONSTRAINT DF_AppPermission_Category DEFAULT 'General',
        Description    NVARCHAR(500) NULL,
        SortOrder      INT           NOT NULL CONSTRAINT DF_AppPermission_Sort DEFAULT 100,
        Active         BIT           NOT NULL CONSTRAINT DF_AppPermission_Active DEFAULT 1
    );
    PRINT 'Created dbo.AppPermission.';
END
GO

/* ----- Per-user grants (target for future maintenance form) ----- */
IF OBJECT_ID('dbo.AppUserGrant', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.AppUserGrant (
        Id             INT           NOT NULL IDENTITY(1,1) PRIMARY KEY,
        UserName       NVARCHAR(100) NOT NULL,  /* same as AppSetup.UN — display name, not DOMAIN\login */
        PermissionCode NVARCHAR(80)  NOT NULL,
        Granted        BIT           NOT NULL CONSTRAINT DF_AppUserGrant_Granted DEFAULT 1,
        ModifiedBy     NVARCHAR(100) NULL,
        ModifiedUtc    DATETIME2(0)  NOT NULL CONSTRAINT DF_AppUserGrant_Mod DEFAULT SYSUTCDATETIME(),
        CONSTRAINT FK_AppUserGrant_Permission FOREIGN KEY (PermissionCode)
            REFERENCES dbo.AppPermission (PermissionCode),
        CONSTRAINT UX_AppUserGrant_UserPerm UNIQUE (UserName, PermissionCode)
    );
    CREATE INDEX IX_AppUserGrant_User ON dbo.AppUserGrant (UserName) INCLUDE (PermissionCode, Granted);
    PRINT 'Created dbo.AppUserGrant.';
END
GO

/* ----- Seed catalog (MERGE = safe to re-run) ----- */
;WITH src (PermissionCode, DisplayName, Category, SortOrder) AS (
    SELECT * FROM (VALUES
        (N'Admin',                  N'Administrator',              N'Admin',       10),
        (N'AdminCancelPO',          N'Cancel PO (admin)',          N'Purchasing',  20),
        (N'AdminCancelSO',          N'Cancel SO (admin)',          N'Sales',       21),
        (N'AdminDeleteCert',        N'Delete certificate',         N'Quality',     30),
        (N'AdminDeletePO',          N'Delete PO (admin)',          N'Purchasing',  22),
        (N'AdminSODelete',          N'Delete sales order',         N'Sales',       23),
        (N'CofC Backup',            N'Certificate of Conformance backup', N'Quality', 31),
        (N'CompleteSO',             N'Complete sales order',       N'Sales',       40),
        (N'DeleteMFGlog',           N'Delete manufacturing log',   N'Production',  50),
        (N'EditCert',               N'Edit certificate',           N'Quality',     60),
        (N'EditPOLate',             N'Edit late PO',               N'Purchasing',  70),
        (N'EditPriceTable',         N'Edit price table',           N'Sales',       80),
        (N'EditSOLate',             N'Edit late SO',               N'Sales',       81),
        (N'EditSpec',               N'Edit specification',         N'Quality',     82),
        (N'EditStockLst',           N'Edit stock list',            N'Inventory',   90),
        (N'EditStockLstCostValue',  N'Edit stock cost/value',      N'Inventory',   91),
        (N'EditStockWants',         N'Edit stock wants',           N'Inventory',   92),
        (N'EditUserInfo',           N'Edit user info',             N'Admin',       11),
        (N'FinalizeMoney',          N'Finalize (money)',           N'Accounting', 100),
        (N'FinalizeQuantity',       N'Finalize (quantity)',        N'Accounting', 101),
        (N'PackingSlip Edit',       N'Edit packing slip',          N'Shipping',   110),
        (N'ReconcilePO',            N'Reconcile PO',               N'Purchasing', 120),
        (N'ReReceiveSTK',           N'Re-receive stock',           N'Receiving',  130),
        (N'RMA_Approval',           N'RMA approval',               N'Sales',       41),
        (N'RMA_Cancel',             N'RMA cancel',                 N'Sales',       42),
        (N'Sign_Cert',               N'Sign certificate',           N'Quality',     83),
        (N'VendorApproval',         N'Vendor approval',            N'Purchasing', 121),
        (N'VendorInactive',         N'Vendor inactive',            N'Purchasing', 122)
    ) AS v(PermissionCode, DisplayName, Category, SortOrder)
)
MERGE dbo.AppPermission AS t
USING src AS s ON t.PermissionCode = s.PermissionCode
WHEN NOT MATCHED BY TARGET THEN
    INSERT (PermissionCode, DisplayName, Category, SortOrder)
    VALUES (s.PermissionCode, s.DisplayName, s.Category, s.SortOrder)
WHEN MATCHED AND (t.DisplayName <> s.DisplayName OR t.Category <> s.Category) THEN
    UPDATE SET DisplayName = s.DisplayName, Category = s.Category, SortOrder = s.SortOrder;
GO

/* ----- Effective permissions: new grants + legacy AppSetup (PRP = YES) ----- */
CREATE OR ALTER VIEW dbo.v_AppUserEffectivePermission
AS
    SELECT g.UserName, g.PermissionCode, N'Grant' AS Source
    FROM dbo.AppUserGrant AS g WITH (NOLOCK)
    WHERE g.Granted = 1
    UNION
    SELECT a.UN AS UserName, a.ANS AS PermissionCode, N'AppSetup' AS Source
    FROM dbo.AppSetup AS a WITH (NOLOCK)
    WHERE UPPER(LTRIM(RTRIM(a.PRP))) = N'YES'
      AND NOT EXISTS (
          SELECT 1 FROM dbo.AppUserGrant AS g WITH (NOLOCK)
          WHERE g.UserName = a.UN AND g.PermissionCode = a.ANS
      );
GO

PRINT 'AppPermission schema ready. Run 05_Migrate_AppSetup_Permissions.sql to copy legacy rows into AppUserGrant.';
GO
