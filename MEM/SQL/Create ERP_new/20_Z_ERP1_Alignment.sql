/* Align selected ERP_2 objects with approved ERP_1 / HPAlloy sources.
   Run after 20_SeedAppUsers.sql and before 21_CurrentSupportTables.sql. */
USE [ERP_2];
GO

/* PriceTable: HPAlloy is the seed source. The live table name is PriceTable. */
IF OBJECT_ID(N'HPAlloy.dbo.PriceTable', N'U') IS NULL
    THROW 50001, 'HPAlloy.dbo.PriceTable was not found.', 1;

DISABLE TRIGGER ALL ON dbo.PriceTable;
DELETE FROM dbo.PriceTable;

SET IDENTITY_INSERT dbo.PriceTable ON;
INSERT INTO dbo.PriceTable
(
    pt_id, Alloy, Form, CC, CL, Thk, Size, Size2, Size3,
    w0, w5, w10, w25, w50, w100, w200, w500, w1000, w2000, wBASE,
    activepric, lastedit, username, zalloy, costCurr,
    h0, h5, h10, h25, h50, h100, h200, h500, h1000, h2000, hbase,
    hist, commspec
)
SELECT
    pt_id, Alloy, Form, CC, CL, Thk, Size, Size2, Size3,
    w0, w5, w10, w25, w50, w100, w200, w500, w1000, w2000, wBASE,
    activepric, lastedit, username, zalloy, costCurr,
    h0, h5, h10, h25, h50, h100, h200, h500, h1000, h2000, hbase,
    hist, commspec
FROM HPAlloy.dbo.PriceTable;
SET IDENTITY_INSERT dbo.PriceTable OFF;

ENABLE TRIGGER ALL ON dbo.PriceTable;
GO

/* StockLst_Master_50CC is intentionally excluded from ERP_2. */
IF OBJECT_ID(N'dbo.StockLst_Master_50CC', N'U') IS NOT NULL
    DROP TABLE dbo.StockLst_Master_50CC;
GO

/* AllQuotes.DescriptID: match ERP_1 computed definition/length. */
IF COL_LENGTH(N'dbo.AllQuotes', N'DescriptID') IS NOT NULL
BEGIN
    IF EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID(N'dbo.AllQuotes') AND name = N'IX_AllQuotes_DescriptID')
        DROP INDEX IX_AllQuotes_DescriptID ON dbo.AllQuotes;

    ALTER TABLE dbo.AllQuotes DROP COLUMN DescriptID;
    ALTER TABLE dbo.AllQuotes ADD DescriptID AS
        ((((ISNULL([Alloy],'            ')+ISNULL([Form],'  '))+ISNULL([CC],' '))+ISNULL([CL],' '))+CONVERT([varchar](12),CONVERT([decimal](9,3),[StandardSize]))) PERSISTED;

    CREATE NONCLUSTERED INDEX IX_AllQuotes_DescriptID ON dbo.AllQuotes (DescriptID ASC)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
              DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON,
              ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF)
        ON [PRIMARY];
END
GO

/* CompanyProfile: recreate with ERP_1 column order/types/defaults. */
IF OBJECT_ID(N'dbo.trg_CompanyProfile_Audit', N'TR') IS NOT NULL DROP TRIGGER dbo.trg_CompanyProfile_Audit;
IF OBJECT_ID(N'dbo.trg_CompanyProfile_History', N'TR') IS NOT NULL DROP TRIGGER dbo.trg_CompanyProfile_History;
IF OBJECT_ID(N'dbo.CompanyProfile_ERP1Shape', N'U') IS NOT NULL DROP TABLE dbo.CompanyProfile_ERP1Shape;
GO

CREATE TABLE dbo.CompanyProfile_ERP1Shape
(
    CompanyId int NOT NULL,
    LegalName nvarchar(120) NOT NULL,
    DBAName nvarchar(120) NULL,
    ShortName nvarchar(40) NOT NULL,
    Tagline nvarchar(200) NULL,
    Addr1 nvarchar(80) NULL,
    Addr2 nvarchar(80) NULL,
    City nvarchar(60) NULL,
    StateCode char(2) NULL,
    PostalCode nvarchar(15) NULL,
    Country nvarchar(40) NULL CONSTRAINT DF_CompanyProfile_Country_New DEFAULT ('USA'),
    Phone nvarchar(25) NULL,
    Fax nvarchar(25) NULL,
    SalesEmail nvarchar(120) NULL,
    QualityEmail nvarchar(120) NULL,
    Website nvarchar(120) NULL,
    CageCode nvarchar(10) NULL,
    DunsNumber nvarchar(15) NULL,
    UeiNumber nvarchar(15) NULL,
    EinNumber nvarchar(15) NULL,
    NaicsCode nvarchar(10) NULL,
    ItarRegNumber nvarchar(30) NULL,
    Iso9001CertNo nvarchar(40) NULL,
    Iso9001Registrar nvarchar(80) NULL,
    Iso9001ExpDate date NULL,
    As9100CertNo nvarchar(40) NULL,
    As9100ExpDate date NULL,
    LogoPath nvarchar(260) NULL,
    LogoImage varbinary(max) NULL,
    IconPath nvarchar(260) NULL,
    WatermarkPath nvarchar(260) NULL,
    QMName nvarchar(80) NULL,
    QMTitle nvarchar(80) NULL CONSTRAINT DF_CompanyProfile_QMTitle_New DEFAULT ('Quality Manager'),
    QMSigPath nvarchar(260) NULL,
    QMSigImage varbinary(max) NULL,
    PMName nvarchar(80) NULL,
    PMTitle nvarchar(80) NULL CONSTRAINT DF_CompanyProfile_PMTitle_New DEFAULT ('Production Manager'),
    PMSigPath nvarchar(260) NULL,
    PMSigImage varbinary(max) NULL,
    OwnerName nvarchar(80) NULL,
    OwnerTitle nvarchar(80) NULL CONSTRAINT DF_CompanyProfile_OwnerTitle_New DEFAULT ('Owner'),
    OwnerSigPath nvarchar(260) NULL,
    OwnerSigImage varbinary(max) NULL,
    CertHeaderText nvarchar(max) NULL,
    CertCertifyText nvarchar(max) NULL,
    CertFooterText nvarchar(max) NULL,
    CertDisclaimerText nvarchar(max) NULL,
    PlantPrimaryName nvarchar(60) NULL,
    PlantSecondaryName nvarchar(60) NULL,
    ModifiedBy nvarchar(80) NOT NULL CONSTRAINT DF_CompanyProfile_ModBy_New DEFAULT (suser_sname()),
    ModifiedDate datetime2(7) NOT NULL CONSTRAINT DF_CompanyProfile_ModDate_New DEFAULT (sysdatetime()),
    As9100Registrar nvarchar(80) NULL,
    LogoMime nvarchar(40) NULL,
    IconImage varbinary(max) NULL,
    IconMime nvarchar(40) NULL,
    WatermarkImage varbinary(max) NULL,
    WatermarkMime nvarchar(40) NULL,
    CONSTRAINT PK_CompanyProfile_New PRIMARY KEY (CompanyId),
    CONSTRAINT CK_CompanyProfile_SingleRow_New CHECK (CompanyId = 1)
);
GO

INSERT INTO dbo.CompanyProfile_ERP1Shape
(
    CompanyId, LegalName, DBAName, ShortName, Tagline, Addr1, Addr2, City, StateCode, PostalCode,
    Country, Phone, Fax, SalesEmail, QualityEmail, Website, CageCode, DunsNumber, UeiNumber,
    EinNumber, NaicsCode, ItarRegNumber, Iso9001CertNo, Iso9001Registrar, Iso9001ExpDate,
    As9100CertNo, As9100ExpDate, LogoPath, LogoImage, IconPath, WatermarkPath, QMName, QMTitle,
    QMSigPath, QMSigImage, PMName, PMTitle, PMSigPath, PMSigImage, OwnerName, OwnerTitle,
    OwnerSigPath, OwnerSigImage, CertHeaderText, CertCertifyText, CertFooterText, CertDisclaimerText,
    PlantPrimaryName, PlantSecondaryName, ModifiedBy, ModifiedDate, As9100Registrar, LogoMime,
    IconImage, IconMime, WatermarkImage, WatermarkMime
)
SELECT
    CompanyId, LegalName, DBAName, ShortName, Tagline,
    NULL, NULL, NULL, NULL, NULL, 'USA', NULL, NULL,
    SalesEmail, QualityEmail, Website, CageCode, DunsNumber, UeiNumber, EinNumber, NaicsCode,
    ItarRegNumber, Iso9001CertNo, Iso9001Registrar, Iso9001ExpDate, As9100CertNo, As9100ExpDate,
    NULL, LogoImage, NULL, NULL, NULL, 'Quality Manager', NULL, NULL, NULL, 'Production Manager',
    NULL, NULL, NULL, 'Owner', NULL, NULL, CertHeaderText, CertCertifyText, CertFooterText,
    CertDisclaimerText, NULL, NULL, ModifiedBy, ModifiedDate, As9100Registrar, LogoMime,
    IconImage, IconMime, WatermarkImage, WatermarkMime
FROM dbo.CompanyProfile;
GO

DROP TABLE dbo.CompanyProfile;
EXEC sp_rename N'dbo.CompanyProfile_ERP1Shape', N'CompanyProfile';
EXEC sp_rename N'dbo.PK_CompanyProfile_New', N'PK_CompanyProfile', N'OBJECT';
EXEC sp_rename N'dbo.CK_CompanyProfile_SingleRow_New', N'CK_CompanyProfile_SingleRow', N'OBJECT';
EXEC sp_rename N'dbo.DF_CompanyProfile_Country_New', N'DF_CompanyProfile_Country', N'OBJECT';
EXEC sp_rename N'dbo.DF_CompanyProfile_QMTitle_New', N'DF_CompanyProfile_QMTitle', N'OBJECT';
EXEC sp_rename N'dbo.DF_CompanyProfile_PMTitle_New', N'DF_CompanyProfile_PMTitle', N'OBJECT';
EXEC sp_rename N'dbo.DF_CompanyProfile_OwnerTitle_New', N'DF_CompanyProfile_OwnerTitle', N'OBJECT';
EXEC sp_rename N'dbo.DF_CompanyProfile_ModBy_New', N'DF_CompanyProfile_ModBy', N'OBJECT';
EXEC sp_rename N'dbo.DF_CompanyProfile_ModDate_New', N'DF_CompanyProfile_ModDate', N'OBJECT';
GO
