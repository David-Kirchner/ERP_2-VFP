/*
  Step 22 - CompanyProfile CUSTOMER TERMS Sage import folder path.
  Empty = fall back to \\{SQL Server}\HPAData\Quotes\ via get_SQL_Path().
*/
USE [ERP_2];
GO

IF COL_LENGTH('dbo.CompanyProfile', 'CustomerTermsImportPath') IS NULL
    ALTER TABLE dbo.CompanyProfile ADD CustomerTermsImportPath NVARCHAR(500) NULL;
GO
