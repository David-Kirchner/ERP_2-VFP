/* Sage CUSTOMER TERMS CSV import folder — maintained in Company Profile */
USE [ERP_2];
GO

IF COL_LENGTH('dbo.CompanyProfile', 'CustomerTermsImportPath') IS NULL
    ALTER TABLE dbo.CompanyProfile ADD CustomerTermsImportPath NVARCHAR(500) NULL;
GO

PRINT 'CompanyProfile.CustomerTermsImportPath ready. Set in Company Profile maintenance.';
GO
