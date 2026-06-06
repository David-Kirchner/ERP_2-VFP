-- Template: copy to YYYYMMDD_description.sql when you change live ERP_2
-- Run on BOTH SuperMicro and Server26 (database ERP_2).
-- Keep idempotent where possible (IF NOT EXISTS, etc.).

USE [ERP_2];
GO

-- Example:
-- IF COL_LENGTH('dbo.YourTable', 'NewColumn') IS NULL
--     ALTER TABLE dbo.YourTable ADD NewColumn NVARCHAR(100) NULL;
-- GO

PRINT 'Migration complete: YYYYMMDD_description';
