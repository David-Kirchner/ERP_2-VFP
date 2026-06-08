-- Drop legacy PriceTable CW/StartDia columns if a prior 20260607 add was applied.
-- CW values are computed via dbo.f_CC_CL_* functions, not stored on PriceTable.

USE [ERP_2];
GO

IF COL_LENGTH('dbo.PriceTable', 'CWCnt') IS NOT NULL
    ALTER TABLE dbo.PriceTable DROP COLUMN CWCnt;
IF COL_LENGTH('dbo.PriceTable', 'CWMin') IS NOT NULL
    ALTER TABLE dbo.PriceTable DROP COLUMN CWMin;
IF COL_LENGTH('dbo.PriceTable', 'CWAvg') IS NOT NULL
    ALTER TABLE dbo.PriceTable DROP COLUMN CWAvg;
IF COL_LENGTH('dbo.PriceTable', 'CWMedian') IS NOT NULL
    ALTER TABLE dbo.PriceTable DROP COLUMN CWMedian;
IF COL_LENGTH('dbo.PriceTable', 'CWMax') IS NOT NULL
    ALTER TABLE dbo.PriceTable DROP COLUMN CWMax;
IF COL_LENGTH('dbo.PriceTable', 'StartDia') IS NOT NULL
    ALTER TABLE dbo.PriceTable DROP COLUMN StartDia;
IF COL_LENGTH('dbo.PriceTable', 'DiaMax') IS NOT NULL
    ALTER TABLE dbo.PriceTable DROP COLUMN DiaMax;
GO

PRINT 'Migration complete: 20260607_Drop_PriceTable_CW_columns';
GO
