/* Company Profile Confirm PO web URL (PO HTML email confirm link).
   Run on ERP_2 after CompanyProfile base schema. */
USE [ERP_2];
GO

IF COL_LENGTH('dbo.CompanyProfile', 'ConfirmPOUrl') IS NULL
    ALTER TABLE dbo.CompanyProfile ADD ConfirmPOUrl NVARCHAR(250) NULL;
GO

PRINT 'CompanyProfile ConfirmPOUrl ready.';
GO
