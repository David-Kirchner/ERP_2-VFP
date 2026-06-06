/* =============================================================================
   CompanyProfile schema — Fix script #01
   -----------------------------------------------------------------------------
   Target DB    : ERP_1
   Date         : 2026-05-11
   Companion    : 01_CompanyProfile_Schema.sql (main script, partially executed)
   -----------------------------------------------------------------------------
   What this fixes (from David's run on 2026-05-11):
     1. dbo.CompanyProfile pre-existed and is missing columns the views need.
        We ALTER TABLE ADD for every spec column, guarded by COL_LENGTH().
     2. §3 plant seed rows rolled back due to CHAR(2) StateCode getting a
        15-char placeholder. Replaced with 'XX' so the rows land; David edits
        to real values later.
     3. Recreates v_Company_ForCert, v_CertSigners_Active, usp_BuildCertSnapshot
        (they failed to compile against the incomplete CompanyProfile).
     4. Adds a dbo.CompanyCert view aliasing dbo.HPAcert so new code can use
        the renamed identifier without touching the underlying table yet.
   Safe to re-run.
   ============================================================================= */

USE [ERP_2];
GO
SET ANSI_NULLS ON; SET QUOTED_IDENTIFIER ON; SET NOCOUNT ON;
GO

PRINT '--- §A  Reconcile dbo.CompanyProfile columns to spec ---';
GO

-- Identity ------------------------------------------------------------------
IF COL_LENGTH('dbo.CompanyProfile','LegalName')         IS NULL ALTER TABLE dbo.CompanyProfile ADD LegalName         NVARCHAR(120) NULL;
IF COL_LENGTH('dbo.CompanyProfile','DBAName')           IS NULL ALTER TABLE dbo.CompanyProfile ADD DBAName           NVARCHAR(120) NULL;
IF COL_LENGTH('dbo.CompanyProfile','ShortName')         IS NULL ALTER TABLE dbo.CompanyProfile ADD ShortName         NVARCHAR(40)  NULL;
IF COL_LENGTH('dbo.CompanyProfile','Tagline')           IS NULL ALTER TABLE dbo.CompanyProfile ADD Tagline           NVARCHAR(200) NULL;

-- Contact -------------------------------------------------------------------
IF COL_LENGTH('dbo.CompanyProfile','SalesEmail')        IS NULL ALTER TABLE dbo.CompanyProfile ADD SalesEmail        NVARCHAR(120) NULL;
IF COL_LENGTH('dbo.CompanyProfile','QualityEmail')      IS NULL ALTER TABLE dbo.CompanyProfile ADD QualityEmail      NVARCHAR(120) NULL;
IF COL_LENGTH('dbo.CompanyProfile','Website')           IS NULL ALTER TABLE dbo.CompanyProfile ADD Website           NVARCHAR(120) NULL;

-- Regulatory ----------------------------------------------------------------
IF COL_LENGTH('dbo.CompanyProfile','CageCode')          IS NULL ALTER TABLE dbo.CompanyProfile ADD CageCode          NVARCHAR(10)  NULL;
IF COL_LENGTH('dbo.CompanyProfile','DunsNumber')        IS NULL ALTER TABLE dbo.CompanyProfile ADD DunsNumber        NVARCHAR(15)  NULL;
IF COL_LENGTH('dbo.CompanyProfile','UeiNumber')         IS NULL ALTER TABLE dbo.CompanyProfile ADD UeiNumber         NVARCHAR(15)  NULL;
IF COL_LENGTH('dbo.CompanyProfile','EinNumber')         IS NULL ALTER TABLE dbo.CompanyProfile ADD EinNumber         NVARCHAR(15)  NULL;
IF COL_LENGTH('dbo.CompanyProfile','NaicsCode')         IS NULL ALTER TABLE dbo.CompanyProfile ADD NaicsCode         NVARCHAR(10)  NULL;
IF COL_LENGTH('dbo.CompanyProfile','ItarRegNumber')     IS NULL ALTER TABLE dbo.CompanyProfile ADD ItarRegNumber     NVARCHAR(30)  NULL;

-- Quality certifications ----------------------------------------------------
IF COL_LENGTH('dbo.CompanyProfile','Iso9001CertNo')     IS NULL ALTER TABLE dbo.CompanyProfile ADD Iso9001CertNo     NVARCHAR(40)  NULL;
IF COL_LENGTH('dbo.CompanyProfile','Iso9001Registrar')  IS NULL ALTER TABLE dbo.CompanyProfile ADD Iso9001Registrar  NVARCHAR(80)  NULL;
IF COL_LENGTH('dbo.CompanyProfile','Iso9001ExpDate')    IS NULL ALTER TABLE dbo.CompanyProfile ADD Iso9001ExpDate    DATE          NULL;
IF COL_LENGTH('dbo.CompanyProfile','As9100CertNo')      IS NULL ALTER TABLE dbo.CompanyProfile ADD As9100CertNo      NVARCHAR(40)  NULL;
IF COL_LENGTH('dbo.CompanyProfile','As9100Registrar')   IS NULL ALTER TABLE dbo.CompanyProfile ADD As9100Registrar   NVARCHAR(80)  NULL;
IF COL_LENGTH('dbo.CompanyProfile','As9100ExpDate')     IS NULL ALTER TABLE dbo.CompanyProfile ADD As9100ExpDate     DATE          NULL;

-- Branding blobs ------------------------------------------------------------
IF COL_LENGTH('dbo.CompanyProfile','LogoImage')         IS NULL ALTER TABLE dbo.CompanyProfile ADD LogoImage         VARBINARY(MAX) NULL;
IF COL_LENGTH('dbo.CompanyProfile','LogoMime')          IS NULL ALTER TABLE dbo.CompanyProfile ADD LogoMime          NVARCHAR(40)  NULL;
IF COL_LENGTH('dbo.CompanyProfile','IconImage')         IS NULL ALTER TABLE dbo.CompanyProfile ADD IconImage         VARBINARY(MAX) NULL;
IF COL_LENGTH('dbo.CompanyProfile','IconMime')          IS NULL ALTER TABLE dbo.CompanyProfile ADD IconMime          NVARCHAR(40)  NULL;
IF COL_LENGTH('dbo.CompanyProfile','WatermarkImage')    IS NULL ALTER TABLE dbo.CompanyProfile ADD WatermarkImage    VARBINARY(MAX) NULL;
IF COL_LENGTH('dbo.CompanyProfile','WatermarkMime')     IS NULL ALTER TABLE dbo.CompanyProfile ADD WatermarkMime     NVARCHAR(40)  NULL;

-- Cert boilerplate ----------------------------------------------------------
IF COL_LENGTH('dbo.CompanyProfile','CertHeaderText')    IS NULL ALTER TABLE dbo.CompanyProfile ADD CertHeaderText    NVARCHAR(MAX) NULL;
IF COL_LENGTH('dbo.CompanyProfile','CertCertifyText')   IS NULL ALTER TABLE dbo.CompanyProfile ADD CertCertifyText   NVARCHAR(MAX) NULL;
IF COL_LENGTH('dbo.CompanyProfile','CertFooterText')    IS NULL ALTER TABLE dbo.CompanyProfile ADD CertFooterText    NVARCHAR(MAX) NULL;
IF COL_LENGTH('dbo.CompanyProfile','CertDisclaimerText') IS NULL ALTER TABLE dbo.CompanyProfile ADD CertDisclaimerText NVARCHAR(MAX) NULL;

-- Audit ---------------------------------------------------------------------
IF COL_LENGTH('dbo.CompanyProfile','ModifiedBy') IS NULL
    ALTER TABLE dbo.CompanyProfile ADD ModifiedBy NVARCHAR(80) NOT NULL CONSTRAINT DF_CompanyProfile_ModBy DEFAULT SUSER_SNAME();
IF COL_LENGTH('dbo.CompanyProfile','ModifiedDate') IS NULL
    ALTER TABLE dbo.CompanyProfile ADD ModifiedDate DATETIME2(0) NOT NULL CONSTRAINT DF_CompanyProfile_ModDate DEFAULT SYSDATETIME();
GO

-- Make sure a seed row exists so the views have something to join to -------
IF NOT EXISTS (SELECT 1 FROM dbo.CompanyProfile WHERE CompanyId = 1)
BEGIN
    INSERT INTO dbo.CompanyProfile (CompanyId, LegalName, ShortName)
    VALUES (1, 'Space Alloys USA', 'Space Alloys');
    PRINT 'Seeded dbo.CompanyProfile (CompanyId=1)';
END
GO

-- §A diff helper: print the final column list so you can eyeball it --------
SELECT  c.name AS ColumnName,
        t.name + CASE
            WHEN t.name IN ('nvarchar','varchar','char','nchar') THEN '(' + CASE WHEN c.max_length=-1 THEN 'MAX' ELSE CAST(c.max_length/CASE WHEN t.name LIKE 'n%' THEN 2 ELSE 1 END AS VARCHAR) END + ')'
            ELSE ''
        END AS DataType,
        c.is_nullable
FROM sys.columns c
JOIN sys.types t ON t.user_type_id = c.user_type_id
WHERE c.object_id = OBJECT_ID('dbo.CompanyProfile')
ORDER BY c.column_id;
GO

PRINT '--- §B  Reseed dbo.CompanyPlant (rows rolled back in initial run) ---';
GO

IF NOT EXISTS (SELECT 1 FROM dbo.CompanyPlant WHERE PlantCode = 'WINDFALL')
INSERT INTO dbo.CompanyPlant
    (PlantCode, PlantName, Addr1, City, StateCode, PostalCode,
     IpSubnet, ServerName, SortOrder, IsDefault, IsActive)
VALUES
    ('WINDFALL', 'Windfall Plant',
     'TBD - update with real street', 'TBD', 'XX', 'XXXXX',
     '192.168.1.0/24', 'RAPTOR', 98, 0, 1);

IF NOT EXISTS (SELECT 1 FROM dbo.CompanyPlant WHERE PlantCode = 'TIPTON')
INSERT INTO dbo.CompanyPlant
    (PlantCode, PlantName, Addr1, City, StateCode, PostalCode,
     IpSubnet, ServerName, SortOrder, IsDefault, IsActive)
VALUES
    ('TIPTON', 'Tipton Plant',
     'TBD - update with real street', 'TBD', 'XX', 'XXXXX',
     '192.168.2.0/24', 'PEREGRINE', 99, 0, 1);
GO

PRINT '--- §C  Recreate views & proc that failed against incomplete CompanyProfile ---';
GO

IF OBJECT_ID('dbo.v_Company_ForCert','V') IS NOT NULL DROP VIEW dbo.v_Company_ForCert;
GO
CREATE VIEW dbo.v_Company_ForCert
AS
SELECT  p.PlantId,
        p.PlantCode,
        p.PlantName,
        c.LegalName,
        c.DBAName,
        c.ShortName,
        c.Website,
        c.QualityEmail,
        c.CageCode,
        c.DunsNumber,
        c.UeiNumber,
        c.NaicsCode,
        c.Iso9001CertNo,
        c.Iso9001Registrar,
        c.Iso9001ExpDate,
        c.As9100CertNo,
        c.As9100Registrar,
        c.As9100ExpDate,
        c.LogoImage,
        c.WatermarkImage,
        c.CertHeaderText,
        c.CertCertifyText,
        c.CertFooterText,
        c.CertDisclaimerText,
        p.Addr1, p.Addr2, p.City, p.StateCode, p.PostalCode, p.Country,
        p.Phone, p.Fax
FROM dbo.CompanyProfile c
CROSS JOIN dbo.CompanyPlant p
WHERE c.CompanyId = 1 AND p.IsActive = 1;
GO

IF OBJECT_ID('dbo.v_CertSigners_Active','V') IS NOT NULL DROP VIEW dbo.v_CertSigners_Active;
GO
CREATE VIEW dbo.v_CertSigners_Active
AS
WITH ranked AS (
    SELECT  s.*,
            ROW_NUMBER() OVER (
                PARTITION BY ISNULL(s.PlantId, -1), s.SlotCode
                ORDER BY CASE WHEN s.PlantId IS NULL THEN 2 ELSE 1 END,
                         s.EffectiveDate DESC
            ) AS rn
    FROM dbo.CompanyCertSigner s
    WHERE s.IsActive = 1
)
SELECT * FROM ranked WHERE rn = 1;
GO

IF OBJECT_ID('dbo.usp_BuildCertSnapshot','P') IS NOT NULL DROP PROC dbo.usp_BuildCertSnapshot;
GO
CREATE PROCEDURE dbo.usp_BuildCertSnapshot
    @PlantId             INT,
    @CompanySnapshotJson NVARCHAR(MAX) OUTPUT,
    @PlantSnapshotJson   NVARCHAR(MAX) OUTPUT,
    @SignerSnapshotJson  NVARCHAR(MAX) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT @CompanySnapshotJson =
        (SELECT * FROM dbo.CompanyProfile WHERE CompanyId = 1
           FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER);

    SELECT @PlantSnapshotJson =
        (SELECT * FROM dbo.CompanyPlant WHERE PlantId = @PlantId
           FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER);

    SELECT @SignerSnapshotJson =
        (SELECT SignerId, PlantId, SlotCode, SlotLabel, PersonName, Title,
                SortOrder, EffectiveDate
           FROM dbo.v_CertSigners_Active
          WHERE PlantId = @PlantId OR PlantId IS NULL
          ORDER BY SortOrder
            FOR JSON AUTO);
END
GO

PRINT '--- §D  Add dbo.CompanyCert view as a forward-compat alias for dbo.HPAcert ---';
PRINT '       New code can SELECT FROM dbo.CompanyCert. When dbo.HPAcert is';
PRINT '       eventually renamed (during the C#/Blazor port), this view gets';
PRINT '       dropped and consumers are unaffected.';
GO

IF OBJECT_ID('dbo.HPAcert','U') IS NOT NULL
BEGIN
    IF OBJECT_ID('dbo.CompanyCert','V') IS NOT NULL DROP VIEW dbo.CompanyCert;
    EXEC ('CREATE VIEW dbo.CompanyCert AS SELECT * FROM dbo.HPAcert');
    PRINT 'Created view dbo.CompanyCert -> dbo.HPAcert';
END
ELSE
    PRINT 'dbo.HPAcert not found in this database — skipped CompanyCert view';
GO

PRINT '=== Fix script #01 complete ===';
GO

/* -----------------------------------------------------------------------------
   §E  Smoke tests — run after the script finishes
   -----------------------------------------------------------------------------

   -- 1. CompanyProfile columns complete?
   SELECT COUNT(*) AS spec_cols_present
   FROM sys.columns
   WHERE object_id = OBJECT_ID('dbo.CompanyProfile')
     AND name IN ('LegalName','DBAName','ShortName','Tagline','SalesEmail',
                  'QualityEmail','Website','CageCode','DunsNumber','UeiNumber',
                  'EinNumber','NaicsCode','ItarRegNumber','Iso9001CertNo',
                  'Iso9001Registrar','Iso9001ExpDate','As9100CertNo',
                  'As9100Registrar','As9100ExpDate','LogoImage','LogoMime',
                  'IconImage','IconMime','WatermarkImage','WatermarkMime',
                  'CertHeaderText','CertCertifyText','CertFooterText',
                  'CertDisclaimerText','ModifiedBy','ModifiedDate');
   -- expect 31

   -- 2. Both plant rows present?
   SELECT PlantCode, PlantName, StateCode, IpSubnet, ServerName, IsDefault
   FROM dbo.CompanyPlant ORDER BY SortOrder;

   -- 3. View compiles & returns rows?
   SELECT TOP 5 * FROM dbo.v_Company_ForCert;

   -- 4. Snapshot proc returns three non-null payloads?
   DECLARE @c NVARCHAR(MAX), @p NVARCHAR(MAX), @s NVARCHAR(MAX);
   DECLARE @pid INT = (SELECT PlantId FROM dbo.CompanyPlant WHERE PlantCode='WINDFALL');
   EXEC dbo.usp_BuildCertSnapshot @PlantId = @pid,
        @CompanySnapshotJson = @c OUTPUT,
        @PlantSnapshotJson   = @p OUTPUT,
        @SignerSnapshotJson  = @s OUTPUT;
   SELECT @c AS company_json, @p AS plant_json, @s AS signers_json;

   -- 5. CompanyCert alias works?
   SELECT COUNT(*) AS cert_count FROM dbo.CompanyCert;

   ----------------------------------------------------------------------------- */
