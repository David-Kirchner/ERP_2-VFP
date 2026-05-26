-- Template: copy to YYYYMMDD_description.sql when you change live ERP_1
-- Run on BOTH SuperMicro and Server26 (database ERP_1).
-- Keep idempotent where possible (IF NOT EXISTS, etc.).

USE [ERP_1];
GO

-- Example:
-- IF COL_LENGTH('dbo.YourTable', 'NewColumn') IS NULL
--     ALTER TABLE dbo.YourTable ADD NewColumn NVARCHAR(100) NULL;
-- GO

PRINT 'Migration complete: YYYYMMDD_description';
