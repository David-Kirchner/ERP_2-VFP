/* ERP_1 — area-scoped database roles (Layer 1 fine-grained)
   Run on SuperMicro and Server26 after 01_CreateRoles.sql.
   Idempotent. Does not grant table/object permissions — use 03 + future securable scripts.

   Pair with MEM\SQL\Config\05_AppSqlRole_Schema.sql for catalog + maintenance screen. */

USE [ERP_2];
GO

SET NOCOUNT ON;

DECLARE @roles TABLE (RoleName SYSNAME NOT NULL PRIMARY KEY);
INSERT INTO @roles (RoleName) VALUES
    (N'ERP_Accounting_Reader'),
    (N'ERP_Accounting_Writer'),
    (N'ERP_AppConfig_Reader'),
    (N'ERP_AppConfig_Writer'),
    (N'ERP_Internal_Reader'),
    (N'ERP_Internal_Writer'),
    (N'ERP_Inventory_Reader'),
    (N'ERP_Inventory_Writer'),
    (N'ERP_Manufacturing_Reader'),
    (N'ERP_Manufacturing_Writer'),
    (N'ERP_MillCerts_Reader'),
    (N'ERP_MillCerts_Writer'),
    (N'ERP_OrderTracking_Reader'),
    (N'ERP_OrderTracking_Writer'),
    (N'ERP_PersonalData_Reader'),
    (N'ERP_PersonalData_Writer'),
    (N'ERP_Pricing_Writer'),
    (N'ERP_PurchaseOrder_Reader'),
    (N'ERP_PurchaseOrder_Writer'),
    (N'ERP_Purchasing_Writer'),
    (N'ERP_QA_Reader'),
    (N'ERP_QA_Writer'),
    (N'ERP_QMS_Reader'),
    (N'ERP_QMS_Writer'),
    (N'ERP_Rma_Reader'),
    (N'ERP_Rma_Writer'),
    (N'ERP_Sales_Reader'),
    (N'ERP_Sales_Writer'),
    (N'ERP_Shipping_Reader'),
    (N'ERP_Shipping_Writer'),
    (N'ERP_Survey_Reader'),
    (N'ERP_Survey_Writer'),
    (N'ERP_Vendor_Reader'),
    (N'ERP_Vendor_Writer'),
    (N'ERP_WorkOrder_Reader'),
    (N'ERP_WorkOrder_Writer');

DECLARE @role SYSNAME;
DECLARE @sql  NVARCHAR(400);
DECLARE @created INT = 0;
DECLARE @exists  INT = 0;

DECLARE role_cur CURSOR LOCAL FAST_FORWARD FOR
    SELECT RoleName FROM @roles ORDER BY RoleName;

OPEN role_cur;
FETCH NEXT FROM role_cur INTO @role;

WHILE @@FETCH_STATUS = 0
BEGIN
    IF DATABASE_PRINCIPAL_ID(@role) IS NULL
    BEGIN
        SET @sql = N'CREATE ROLE ' + QUOTENAME(@role) + N';';
        EXEC (@sql);
        SET @created += 1;
        PRINT CONCAT('Created role ', @role);
    END
    ELSE
    BEGIN
        SET @exists += 1;
    END

    FETCH NEXT FROM role_cur INTO @role;
END

CLOSE role_cur;
DEALLOCATE role_cur;

PRINT CONCAT('02_CreateDB_Roles: ', @created, ' created, ', @exists, ' already existed (36 total).');
PRINT 'Next: 03_GrantArchiveAndNR_Permissions.sql';
PRINT 'Then: Config\03_CreateAppUsers.sql and Config\05_AppSqlRole_Schema.sql';
GO
