/* Company Profile PO footer instruction lines (Identity tab). */
USE [ERP_2];
GO

IF COL_LENGTH('dbo.CompanyProfile', 'InvoiceSendLine') IS NULL
    ALTER TABLE dbo.CompanyProfile ADD InvoiceSendLine NVARCHAR(250) NULL;
IF COL_LENGTH('dbo.CompanyProfile', 'MaterialCertSendLine') IS NULL
    ALTER TABLE dbo.CompanyProfile ADD MaterialCertSendLine NVARCHAR(250) NULL;
GO

UPDATE dbo.CompanyProfile
SET InvoiceSendLine = ISNULL(NULLIF(RTRIM(InvoiceSendLine), ''),
        N'Send invoices to AP@SpaceAlloysUSA.com or mail to POBox 40 Tipton, IN 46072'),
    MaterialCertSendLine = ISNULL(NULLIF(RTRIM(MaterialCertSendLine), ''),
        N'Please send all material certifications to MTR@SpaceAlloysUSA.com'),
    ModifiedDate = SYSDATETIME()
WHERE CompanyId = 1;
GO

PRINT 'CompanyProfile InvoiceSendLine / MaterialCertSendLine ready.';
GO
