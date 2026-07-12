/* Company Profile address Fax columns + ensure Website exists for Branding/HTML banner.
   Run on ERP_2 after CompanyProfile base schema. */
USE [ERP_2];
GO

IF COL_LENGTH('dbo.CompanyProfile', 'BillToFax') IS NULL
    ALTER TABLE dbo.CompanyProfile ADD BillToFax NVARCHAR(25) NULL;
IF COL_LENGTH('dbo.CompanyProfile', 'ShipToFax') IS NULL
    ALTER TABLE dbo.CompanyProfile ADD ShipToFax NVARCHAR(25) NULL;
IF COL_LENGTH('dbo.CompanyProfile', 'Website') IS NULL
    ALTER TABLE dbo.CompanyProfile ADD Website NVARCHAR(120) NULL;
GO

PRINT 'CompanyProfile BillToFax / ShipToFax / Website ready.';
GO
