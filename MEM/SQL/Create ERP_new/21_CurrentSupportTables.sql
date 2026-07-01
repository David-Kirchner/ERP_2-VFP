/*
  Step 21 - Current ERP_2 support tables.

  These are intentionally part of the fresh ERP_2 build:
    - dbo.AppErrorLog
    - dbo.CompanyCertPdf
    - dbo.CompanyProfileHistory
    - dbo.trg_CompanyProfile_History
    - dbo.[CUSTOMER TERMS]  (Sage import staging; HPAlloy shape, renamed)

  Deleted external systems such as Messenger are not recreated here.
*/
USE [ERP_2];
GO

IF OBJECT_ID(N'dbo.AppErrorLog', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.AppErrorLog
    (
        Id int IDENTITY(1,1) NOT NULL CONSTRAINT PK_AppErrorLog PRIMARY KEY,
        Message nvarchar(max) NULL,
        MessageTemplate nvarchar(max) NULL,
        [Level] nvarchar(32) NULL,
        [TimeStamp] datetime NULL,
        Exception nvarchar(max) NULL,
        Properties nvarchar(max) NULL
    );
END;
GO

IF OBJECT_ID(N'dbo.CompanyProfileHistory', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.CompanyProfileHistory
    (
        HistoryId bigint IDENTITY(1,1) NOT NULL CONSTRAINT PK_CompanyProfileHistory PRIMARY KEY,
        SnapshotUtc datetime2(7) NOT NULL CONSTRAINT DF_CPH_Snapshot DEFAULT (SYSUTCDATETIME()),
        ChangedBy nvarchar(80) NOT NULL,
        PayloadJson nvarchar(max) NOT NULL
    );
END;
GO

IF OBJECT_ID(N'dbo.CompanyCertPdf', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.CompanyCertPdf
    (
        PdfId bigint IDENTITY(1,1) NOT NULL CONSTRAINT PK_CompanyCertPdf PRIMARY KEY,
        HPAcertKey nvarchar(50) NOT NULL,
        PlantId int NOT NULL,
        CertNumber nvarchar(40) NULL,
        WorkOrderNumber nvarchar(40) NULL,
        CustomerName nvarchar(120) NULL,
        PdfBlob varbinary(max) NOT NULL,
        PdfMime nvarchar(40) NOT NULL CONSTRAINT DF_CompanyCertPdf_Mime DEFAULT ('application/pdf'),
        PdfSizeBytes int NOT NULL,
        PdfSha256 binary(32) NOT NULL,
        CompanySnapshotJson nvarchar(max) NOT NULL,
        PlantSnapshotJson nvarchar(max) NOT NULL,
        SignerSnapshotJson nvarchar(max) NOT NULL,
        RenderEngine nvarchar(40) NOT NULL,
        RenderEngineVersion nvarchar(40) NULL,
        RenderedUtc datetime2(0) NOT NULL CONSTRAINT DF_CompanyCertPdf_Rendered DEFAULT (SYSUTCDATETIME()),
        RenderedBy nvarchar(80) NOT NULL CONSTRAINT DF_CompanyCertPdf_RenderBy DEFAULT (SUSER_SNAME()),
        ReprintOfPdfId bigint NULL,
        CONSTRAINT FK_CompanyCertPdf_Plant FOREIGN KEY (PlantId) REFERENCES dbo.CompanyPlant(PlantId),
        CONSTRAINT FK_CompanyCertPdf_Reprint FOREIGN KEY (ReprintOfPdfId) REFERENCES dbo.CompanyCertPdf(PdfId)
    );

    CREATE INDEX IX_CompanyCertPdf_CertKey ON dbo.CompanyCertPdf(HPAcertKey);
    CREATE INDEX IX_CompanyCertPdf_CertNo ON dbo.CompanyCertPdf(CertNumber) WHERE CertNumber IS NOT NULL;
    CREATE INDEX IX_CompanyCertPdf_WO ON dbo.CompanyCertPdf(WorkOrderNumber) WHERE WorkOrderNumber IS NOT NULL;
    CREATE INDEX IX_CompanyCertPdf_Rendered ON dbo.CompanyCertPdf(RenderedUtc DESC);
END;
GO

/*
  Sage accounting export staging table.
  Same column layout as HPAlloy.dbo.[CUSTOMER TERMS and List], renamed for ERP_2.
*/
IF OBJECT_ID(N'dbo.[CUSTOMER TERMS]', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.[CUSTOMER TERMS]
    (
        [Customer ID] nvarchar(50) NULL,
        [Customer Name] nvarchar(50) NULL,
        [Inactive] nvarchar(50) NULL,
        [Contact] nvarchar(50) NULL,
        [Bill to Address-Line One] nvarchar(50) NULL,
        [Bill to Address-Line Two] nvarchar(50) NULL,
        [Bill to City] nvarchar(50) NULL,
        [Bill to State] nvarchar(50) NULL,
        [Bill to Zip] nvarchar(50) NULL,
        [Bill to Country] nvarchar(50) NULL,
        [Customer Type] nvarchar(50) NULL,
        [Telephone 1] nvarchar(50) NULL,
        [Fax Number] nvarchar(50) NULL,
        [Pricing Level] nvarchar(50) NULL,
        [Use Standard Terms] nvarchar(50) NULL,
        [C O D  Terms] nvarchar(50) NULL,
        [Prepaid Terms] nvarchar(50) NULL,
        [Terms Type] nvarchar(50) NULL,
        [Due Days] nvarchar(50) NULL,
        [Credit Limit] nvarchar(50) NULL,
        [CREDIT INFO] nvarchar(50) NULL,
        [MISC  INFO] nvarchar(50) NULL,
        [Customer Since Date] nvarchar(50) NULL,
        [Last Invoice Date] nvarchar(50) NULL,
        [Current Balance] nvarchar(50) NULL,
        [Credit Status] nvarchar(50) NULL,
        [dtDate] datetime NOT NULL CONSTRAINT DF_CUSTOMER_TERMS_dtDate DEFAULT (getdate())
    );
END;
GO

IF OBJECT_ID(N'dbo.trg_CompanyProfile_History', N'TR') IS NOT NULL
    DROP TRIGGER dbo.trg_CompanyProfile_History;
GO

CREATE TRIGGER dbo.trg_CompanyProfile_History
ON dbo.CompanyProfile
AFTER UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.CompanyProfileHistory (ChangedBy, PayloadJson)
    SELECT SUSER_SNAME(),
           (SELECT * FROM deleted FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER);
END;
GO
