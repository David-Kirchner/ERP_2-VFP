/* Step 28 - CompanyProfile Confirm PO web URL for HTML PO confirmation. */
USE [ERP_2];
GO

IF COL_LENGTH('dbo.CompanyProfile', 'ConfirmPOUrl') IS NULL
    ALTER TABLE dbo.CompanyProfile ADD ConfirmPOUrl NVARCHAR(250) NULL;
GO

PRINT 'CompanyProfile ConfirmPOUrl ready.';
GO
