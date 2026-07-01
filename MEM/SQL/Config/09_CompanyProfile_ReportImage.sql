/* Report header BMP for FRX picture expressions (CompanyReport_Logo) */
USE [ERP_2];
GO

IF COL_LENGTH('dbo.CompanyProfile','ReportImage') IS NULL
    ALTER TABLE dbo.CompanyProfile ADD ReportImage VARBINARY(MAX) NULL;
IF COL_LENGTH('dbo.CompanyProfile','ReportMime') IS NULL
    ALTER TABLE dbo.CompanyProfile ADD ReportMime NVARCHAR(40) NULL;
GO

PRINT 'CompanyProfile ReportImage/ReportMime ready. Cached at MEM\Company_Rpt_Logo.bmp on upload.';
GO
