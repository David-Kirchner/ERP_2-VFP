/* Company default billing and ship-to — dbo.CompanyProfile (CompanyId=1).
   dbo.ShipAddr holds customer ship-to addresses; do not use it for company defaults. */
USE [ERP_2];
GO

IF COL_LENGTH('dbo.CompanyProfile', 'BillToCompany') IS NULL
    ALTER TABLE dbo.CompanyProfile ADD BillToCompany NVARCHAR(100) NULL;
IF COL_LENGTH('dbo.CompanyProfile', 'BillToAddr1') IS NULL
    ALTER TABLE dbo.CompanyProfile ADD BillToAddr1 NVARCHAR(80) NULL;
IF COL_LENGTH('dbo.CompanyProfile', 'BillToAddr2') IS NULL
    ALTER TABLE dbo.CompanyProfile ADD BillToAddr2 NVARCHAR(80) NULL;
IF COL_LENGTH('dbo.CompanyProfile', 'BillToCity') IS NULL
    ALTER TABLE dbo.CompanyProfile ADD BillToCity NVARCHAR(60) NULL;
IF COL_LENGTH('dbo.CompanyProfile', 'BillToState') IS NULL
    ALTER TABLE dbo.CompanyProfile ADD BillToState NVARCHAR(50) NULL;
IF COL_LENGTH('dbo.CompanyProfile', 'BillToPostal') IS NULL
    ALTER TABLE dbo.CompanyProfile ADD BillToPostal NVARCHAR(15) NULL;
IF COL_LENGTH('dbo.CompanyProfile', 'BillToCountry') IS NULL
    ALTER TABLE dbo.CompanyProfile ADD BillToCountry NVARCHAR(40) NULL;
IF COL_LENGTH('dbo.CompanyProfile', 'BillToPhone') IS NULL
    ALTER TABLE dbo.CompanyProfile ADD BillToPhone NVARCHAR(25) NULL;

IF COL_LENGTH('dbo.CompanyProfile', 'ShipToCompany') IS NULL
    ALTER TABLE dbo.CompanyProfile ADD ShipToCompany NVARCHAR(100) NULL;
IF COL_LENGTH('dbo.CompanyProfile', 'ShipToAddr1') IS NULL
    ALTER TABLE dbo.CompanyProfile ADD ShipToAddr1 NVARCHAR(80) NULL;
IF COL_LENGTH('dbo.CompanyProfile', 'ShipToAddr2') IS NULL
    ALTER TABLE dbo.CompanyProfile ADD ShipToAddr2 NVARCHAR(80) NULL;
IF COL_LENGTH('dbo.CompanyProfile', 'ShipToCity') IS NULL
    ALTER TABLE dbo.CompanyProfile ADD ShipToCity NVARCHAR(60) NULL;
IF COL_LENGTH('dbo.CompanyProfile', 'ShipToState') IS NULL
    ALTER TABLE dbo.CompanyProfile ADD ShipToState NVARCHAR(50) NULL;
IF COL_LENGTH('dbo.CompanyProfile', 'ShipToPostal') IS NULL
    ALTER TABLE dbo.CompanyProfile ADD ShipToPostal NVARCHAR(15) NULL;
IF COL_LENGTH('dbo.CompanyProfile', 'ShipToCountry') IS NULL
    ALTER TABLE dbo.CompanyProfile ADD ShipToCountry NVARCHAR(40) NULL;
IF COL_LENGTH('dbo.CompanyProfile', 'ShipToPhone') IS NULL
    ALTER TABLE dbo.CompanyProfile ADD ShipToPhone NVARCHAR(25) NULL;
GO

PRINT 'CompanyProfile billing / ship-to address columns ready.';
GO
