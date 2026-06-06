/* Seed dbo.CompanyProfile — run after 01_CompanyProfile_Schema.sql on ERP_2 */
USE [ERP_2];
GO

IF NOT EXISTS (SELECT 1 FROM dbo.CompanyProfile WHERE CompanyId = 1)
BEGIN
    INSERT INTO dbo.CompanyProfile (
        CompanyId, LegalName, DBAName, ShortName, Tagline,
        SalesEmail, QualityEmail, Website,
        CertHeaderText, CertCertifyText, CertFooterText
    )
    VALUES (
        1,
        N'Space Alloys USA',
        N'Space Alloys USA',
        N'Space Alloys USA',
        N'Manufacturer and Distributor of High Strength Alloys',
        N'sales@spacealloysusa.com',
        N'quality@spacealloysusa.com',
        N'https://www.spacealloysusa.com',
        N'Material Certification Report',
        N'We hereby certify that the material described below was manufactured in accordance with the requirements specified.',
        N'This certification is issued under our ISO 9001:2015 quality management system.'
    );
    PRINT 'Seeded CompanyProfile row CompanyId=1';
END
ELSE
    PRINT 'CompanyProfile row already exists — seed skipped';
GO
