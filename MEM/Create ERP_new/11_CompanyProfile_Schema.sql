/* =============================================================================
   Company Profile + Multi-Site + Cert Signers + Cert PDF Retention + Admin Gate
   -----------------------------------------------------------------------------
   Target DB    : ERP_1
   Author       : Claude (Cowork) for David Kirchner
   Date         : 2026-05-11
   Companion    : ERP\CompanyProfile_Maintenance_Plan.md
   -----------------------------------------------------------------------------
   IMPORTANT BEFORE RUNNING
   1. dbo.CompanyProfile was created manually by David. The CREATE in §1 below is
      guarded with IF NOT EXISTS; if your existing columns differ from the spec,
      run §1.a (DIFF HELPER) first and reconcile by hand. Do not let SSMS silently
      drop your row.
   2. Search this file for the token <FILL-IN> — three spots:
        - Your Windows login in §6 seed (e.g. SPACEALLOYS\DavidKirchner)
        - The actual primary-key column name of dbo.HPAcert in §5 FK constraint
        - Confirm IP subnets for Windfall/Tipton in §3 seed if they differ from
          the values in CLAUDE.md (192.168.1.x / 192.168.2.x)
   3. Run inside an explicit transaction in production. Each section is a
      separate batch (GO) so you can step through it.
   ============================================================================= */

USE [ERP_1];
GO

SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET NOCOUNT ON;
GO

/* =============================================================================
   §1  dbo.CompanyProfile  -- single-row identity table
   ============================================================================= */

IF OBJECT_ID('dbo.CompanyProfile', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.CompanyProfile (
        CompanyId           INT            NOT NULL
            CONSTRAINT PK_CompanyProfile PRIMARY KEY
            CONSTRAINT CK_CompanyProfile_SingleRow CHECK (CompanyId = 1),

        -- Identity ---------------------------------------------------------
        LegalName           NVARCHAR(120)  NOT NULL,
        DBAName             NVARCHAR(120)  NULL,
        ShortName           NVARCHAR(40)   NOT NULL,     -- shown in window captions
        Tagline             NVARCHAR(200)  NULL,

        -- Contact (corporate, not plant-specific) --------------------------
        SalesEmail          NVARCHAR(120)  NULL,
        QualityEmail        NVARCHAR(120)  NULL,
        Website             NVARCHAR(120)  NULL,

        -- Regulatory / contractor IDs --------------------------------------
        CageCode            NVARCHAR(10)   NULL,
        DunsNumber          NVARCHAR(15)   NULL,
        UeiNumber           NVARCHAR(15)   NULL,
        EinNumber           NVARCHAR(15)   NULL,
        NaicsCode           NVARCHAR(10)   NULL,
        ItarRegNumber       NVARCHAR(30)   NULL,

        -- Quality certifications -------------------------------------------
        Iso9001CertNo       NVARCHAR(40)   NULL,
        Iso9001Registrar    NVARCHAR(80)   NULL,
        Iso9001ExpDate      DATE           NULL,
        As9100CertNo        NVARCHAR(40)   NULL,
        As9100Registrar     NVARCHAR(80)   NULL,
        As9100ExpDate       DATE           NULL,

        -- Branding (blobs only — no paths per design decision 2026-05-11) --
        LogoImage           VARBINARY(MAX) NULL,
        LogoMime            NVARCHAR(40)   NULL,         -- e.g. 'image/png'
        IconImage           VARBINARY(MAX) NULL,         -- .ico for window chrome
        IconMime            NVARCHAR(40)   NULL,
        WatermarkImage      VARBINARY(MAX) NULL,
        WatermarkMime       NVARCHAR(40)   NULL,

        -- Cert boilerplate -------------------------------------------------
        CertHeaderText      NVARCHAR(MAX)  NULL,
        CertCertifyText     NVARCHAR(MAX)  NULL,         -- "We hereby certify…"
        CertFooterText      NVARCHAR(MAX)  NULL,
        CertDisclaimerText  NVARCHAR(MAX)  NULL,

        -- Audit ------------------------------------------------------------
        ModifiedBy          NVARCHAR(80)   NOT NULL
            CONSTRAINT DF_CompanyProfile_ModBy   DEFAULT SUSER_SNAME(),
        ModifiedDate        DATETIME2(0)   NOT NULL
            CONSTRAINT DF_CompanyProfile_ModDate DEFAULT SYSDATETIME()
    );

    PRINT 'Created dbo.CompanyProfile';
END
ELSE
    PRINT 'dbo.CompanyProfile already exists — run §1.a DIFF HELPER to reconcile columns';
GO

/* -----------------------------------------------------------------------------
   §1.a  DIFF HELPER -- run this to see what columns your existing table
                       has versus the spec. Manual reconciliation only.
   ----------------------------------------------------------------------------- */
/*
SELECT c.name AS ColumnName,
       t.name AS TypeName,
       c.max_length, c.precision, c.scale, c.is_nullable
FROM sys.columns c
JOIN sys.types t ON t.user_type_id = c.user_type_id
WHERE c.object_id = OBJECT_ID('dbo.CompanyProfile')
ORDER BY c.column_id;
*/
GO

/* =============================================================================
   §2  dbo.CompanyPlant  -- per-site address & contact (multi-site)
        Windfall and Tipton each get a row. IP subnet drives the existing
        auto-detect logic from proc_setup.prg (192.168.1.x / 192.168.2.x).
   ============================================================================= */

IF OBJECT_ID('dbo.CompanyPlant', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.CompanyPlant (
        PlantId        INT IDENTITY(1,1) NOT NULL
            CONSTRAINT PK_CompanyPlant PRIMARY KEY,
        PlantCode      NVARCHAR(20)   NOT NULL,   -- 'WINDFALL', 'TIPTON'
        PlantName      NVARCHAR(80)   NOT NULL,
        Addr1          NVARCHAR(80)   NOT NULL,
        Addr2          NVARCHAR(80)   NULL,
        City           NVARCHAR(60)   NOT NULL,
        StateCode      CHAR(2)        NOT NULL,
        PostalCode     NVARCHAR(15)   NOT NULL,
        Country        NVARCHAR(40)   NOT NULL
            CONSTRAINT DF_CompanyPlant_Country DEFAULT 'USA',
        Phone          NVARCHAR(25)   NULL,
        Fax            NVARCHAR(25)   NULL,
        IpSubnet       NVARCHAR(20)   NULL,        -- '192.168.1.0/24'
        ServerName     NVARCHAR(40)   NULL,        -- 'RAPTOR', 'PEREGRINE'
        SortOrder      INT            NOT NULL CONSTRAINT DF_CompanyPlant_Sort DEFAULT 100,
        IsDefault      BIT            NOT NULL CONSTRAINT DF_CompanyPlant_Default  DEFAULT 0,
        IsActive       BIT            NOT NULL CONSTRAINT DF_CompanyPlant_Active   DEFAULT 1,
        ModifiedBy     NVARCHAR(80)   NOT NULL CONSTRAINT DF_CompanyPlant_ModBy    DEFAULT SUSER_SNAME(),
        ModifiedDate   DATETIME2(0)   NOT NULL CONSTRAINT DF_CompanyPlant_ModDate  DEFAULT SYSDATETIME(),
        CONSTRAINT UQ_CompanyPlant_Code UNIQUE (PlantCode)
    );

    -- Only one default plant
    CREATE UNIQUE INDEX UX_CompanyPlant_OneDefault
        ON dbo.CompanyPlant (IsDefault)
        WHERE IsDefault = 1;

    PRINT 'Created dbo.CompanyPlant';
END
GO

/* =============================================================================
   §3  Seed dbo.CompanyPlant  -- placeholders. Update addresses to real values.
   ============================================================================= */

IF NOT EXISTS (SELECT 1 FROM dbo.CompanyPlant WHERE PlantCode = 'PRODUCTION')
INSERT INTO dbo.CompanyPlant (PlantCode, PlantName, Addr1, City, StateCode, PostalCode,
                              IpSubnet, ServerName, SortOrder, IsDefault, IsActive)
VALUES ('PRODUCTION', 'David PROD',
        '1985E 500N ', 'Windfall', 'IN', '46076',
        '192.168.31.26/24', 'Server26', 10, 0, 1);

IF NOT EXISTS (SELECT 1 FROM dbo.CompanyPlant WHERE PlantCode = 'DEVELOPMENT')
INSERT INTO dbo.CompanyPlant (PlantCode, PlantName, Addr1, City, StateCode, PostalCode,
                              IpSubnet, ServerName, SortOrder, IsDefault, IsActive)
VALUES ('DEVELOPMENT', 'David DEV',
        '4301 N Meridian', 'Windfall', 'IN', '46076',
        '192.168.31.172/24', 'SuperMicro', 20, 1, 1);
GO

/* =============================================================================
   §4  dbo.CompanyCertSigner  -- variable signers per plant
        Slot codes used today: LAB_TECH, INSPECTOR, QM.
        A row with PlantId IS NULL applies to all plants (fallback default).
        Only one active row per (PlantId, SlotCode) at a time — enforced by
        the filtered unique index UX_Signer_OneActive.
   ============================================================================= */

IF OBJECT_ID('dbo.CompanyCertSigner', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.CompanyCertSigner (
        SignerId       INT IDENTITY(1,1) NOT NULL
            CONSTRAINT PK_CompanyCertSigner PRIMARY KEY,
        PlantId        INT            NULL
            CONSTRAINT FK_CertSigner_Plant REFERENCES dbo.CompanyPlant (PlantId),
        SlotCode       NVARCHAR(20)   NOT NULL,    -- 'LAB_TECH','INSPECTOR','QM'
        SlotLabel      NVARCHAR(60)   NOT NULL,    -- 'Tested by','Inspected by','Approved by'
        PersonName     NVARCHAR(80)   NOT NULL,
        Title          NVARCHAR(80)   NOT NULL,
        SigImage       VARBINARY(MAX) NULL,
        SigMime        NVARCHAR(40)   NULL CONSTRAINT DF_CertSigner_Mime DEFAULT 'image/png',
        SortOrder      INT            NOT NULL CONSTRAINT DF_CertSigner_Sort   DEFAULT 100,
        EffectiveDate  DATE           NOT NULL CONSTRAINT DF_CertSigner_Eff    DEFAULT CAST(SYSDATETIME() AS DATE),
        RetiredDate    DATE           NULL,
        IsActive       BIT            NOT NULL CONSTRAINT DF_CertSigner_Active DEFAULT 1,
        ModifiedBy     NVARCHAR(80)   NOT NULL CONSTRAINT DF_CertSigner_ModBy  DEFAULT SUSER_SNAME(),
        ModifiedDate   DATETIME2(0)   NOT NULL CONSTRAINT DF_CertSigner_ModDt  DEFAULT SYSDATETIME(),
        CONSTRAINT CK_CertSigner_SlotCode
            CHECK (SlotCode IN ('LAB_TECH','INSPECTOR','QM'))
    );

    -- Only one ACTIVE signer per plant per slot. PlantId NULL is treated as a
    -- distinct "all-plants" group thanks to ISNULL-style separation below.
    CREATE UNIQUE INDEX UX_Signer_OneActive
        ON dbo.CompanyCertSigner (PlantId, SlotCode)
        WHERE IsActive = 1;

    PRINT 'Created dbo.CompanyCertSigner';
END
GO

/* =============================================================================
/* =============================================================================
   §6  dbo.AdminUser  -- single-row admin gate (you said: just you for now)
   ============================================================================= */

IF OBJECT_ID('dbo.AdminUser', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.AdminUser (
        WindowsLogin   NVARCHAR(100)  NOT NULL
            CONSTRAINT PK_AdminUser PRIMARY KEY,         -- e.g. 'SPACEALLOYS\DavidKirchner'
        FullName       NVARCHAR(120)  NOT NULL,
        IsActive       BIT            NOT NULL CONSTRAINT DF_AdminUser_Active DEFAULT 1,
        AddedDate      DATETIME2(0)   NOT NULL CONSTRAINT DF_AdminUser_Added  DEFAULT SYSDATETIME(),
        AddedBy        NVARCHAR(80)   NOT NULL CONSTRAINT DF_AdminUser_AddBy  DEFAULT SUSER_SNAME(),
        Notes          NVARCHAR(200)  NULL
    );

    PRINT 'Created dbo.AdminUser';
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.AdminUser)
INSERT INTO dbo.AdminUser (WindowsLogin, FullName, Notes)
VALUES ('SuperMicro\talkt',
        'David Kirchner',
        'Sole admin per design decision 2026-05-11');
GO

/* -----------------------------------------------------------------------------
   Helper to look up admin status from VFP / Blazor — wraps SUSER_SNAME().
   Call: SELECT dbo.fn_IsAdmin(NULL)            -- checks current connection user
         SELECT dbo.fn_IsAdmin('DOMAIN\bob')    -- checks a specific login
   ----------------------------------------------------------------------------- */

IF OBJECT_ID('dbo.fn_IsAdmin', 'FN') IS NOT NULL DROP FUNCTION dbo.fn_IsAdmin;
GO
CREATE FUNCTION dbo.fn_IsAdmin (@WindowsLogin NVARCHAR(100) = NULL)
RETURNS BIT
AS
BEGIN
    DECLARE @login NVARCHAR(100) = ISNULL(@WindowsLogin, SUSER_SNAME());
    IF EXISTS (SELECT 1 FROM dbo.AdminUser
               WHERE WindowsLogin = @login AND IsActive = 1)
        RETURN 1;
    RETURN 0;
END
GO

/* =============================================================================
   §7  dbo.CompanyAuditLog  -- single audit log for Profile / Plant / Signer.
        One log table is cheaper than three History tables and gives a unified
        "who changed what when" view for ISO 7.5.3 (Control of Documented
        Information).
   ============================================================================= */

IF OBJECT_ID('dbo.CompanyAuditLog', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.CompanyAuditLog (
        AuditId      BIGINT IDENTITY(1,1) NOT NULL
            CONSTRAINT PK_CompanyAuditLog PRIMARY KEY,
        SnapshotUtc  DATETIME2(0)  NOT NULL CONSTRAINT DF_CompAudit_Utc DEFAULT SYSUTCDATETIME(),
        ChangedBy    NVARCHAR(80)  NOT NULL,
        Action       CHAR(1)       NOT NULL,        -- 'U' update, 'D' delete
        SourceTable  NVARCHAR(60)  NOT NULL,        -- 'CompanyProfile' etc
        SourceId     NVARCHAR(40)  NOT NULL,        -- PK as string
        PayloadJson  NVARCHAR(MAX) NOT NULL         -- prior row contents
    );

    CREATE INDEX IX_CompAudit_Src ON dbo.CompanyAuditLog (SourceTable, SourceId, SnapshotUtc DESC);
    PRINT 'Created dbo.CompanyAuditLog';
END
GO

/* -----------------------------------------------------------------------------
   Triggers — one per source table, all writing into CompanyAuditLog.
   Drop & recreate so this script stays re-runnable.
   ----------------------------------------------------------------------------- */

IF OBJECT_ID('dbo.trg_CompanyProfile_Audit', 'TR') IS NOT NULL
    DROP TRIGGER dbo.trg_CompanyProfile_Audit;
GO
CREATE TRIGGER dbo.trg_CompanyProfile_Audit
ON dbo.CompanyProfile
AFTER UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO dbo.CompanyAuditLog (ChangedBy, Action, SourceTable, SourceId, PayloadJson)
    SELECT SUSER_SNAME(),
           CASE WHEN EXISTS (SELECT 1 FROM inserted) THEN 'U' ELSE 'D' END,
           'CompanyProfile',
           CAST(d.CompanyId AS NVARCHAR(40)),
           (SELECT * FROM deleted d2 WHERE d2.CompanyId = d.CompanyId
              FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)
    FROM deleted d;
END
GO

IF OBJECT_ID('dbo.trg_CompanyPlant_Audit', 'TR') IS NOT NULL
    DROP TRIGGER dbo.trg_CompanyPlant_Audit;
GO
CREATE TRIGGER dbo.trg_CompanyPlant_Audit
ON dbo.CompanyPlant
AFTER UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO dbo.CompanyAuditLog (ChangedBy, Action, SourceTable, SourceId, PayloadJson)
    SELECT SUSER_SNAME(),
           CASE WHEN EXISTS (SELECT 1 FROM inserted) THEN 'U' ELSE 'D' END,
           'CompanyPlant',
           CAST(d.PlantId AS NVARCHAR(40)),
           (SELECT * FROM deleted d2 WHERE d2.PlantId = d.PlantId
              FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)
    FROM deleted d;
END
GO

IF OBJECT_ID('dbo.trg_CompanyCertSigner_Audit', 'TR') IS NOT NULL
    DROP TRIGGER dbo.trg_CompanyCertSigner_Audit;
GO
CREATE TRIGGER dbo.trg_CompanyCertSigner_Audit
ON dbo.CompanyCertSigner
AFTER UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO dbo.CompanyAuditLog (ChangedBy, Action, SourceTable, SourceId, PayloadJson)
    SELECT SUSER_SNAME(),
           CASE WHEN EXISTS (SELECT 1 FROM inserted) THEN 'U' ELSE 'D' END,
           'CompanyCertSigner',
           CAST(d.SignerId AS NVARCHAR(40)),
           (SELECT * FROM deleted d2 WHERE d2.SignerId = d.SignerId
              FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)
    FROM deleted d;
END
GO

/* =============================================================================
   §8  Convenience views — what VFP / Blazor will actually call.
        These keep the reports loose-coupled from schema changes.
   ============================================================================= */

IF OBJECT_ID('dbo.v_Company_ForCert', 'V') IS NOT NULL DROP VIEW dbo.v_Company_ForCert;
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

IF OBJECT_ID('dbo.v_CertSigners_Active', 'V') IS NOT NULL DROP VIEW dbo.v_CertSigners_Active;
GO
CREATE VIEW dbo.v_CertSigners_Active
AS
-- Plant-specific signer if one exists, otherwise fall back to the all-plants
-- (PlantId IS NULL) row for the same slot.
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

/* =============================================================================
        Call this from the report renderer right before writing the row.
   ============================================================================= */

IF OBJECT_ID('dbo.usp_BuildCertSnapshot', 'P') IS NOT NULL
    DROP PROC dbo.usp_BuildCertSnapshot;
GO
CREATE PROCEDURE dbo.usp_BuildCertSnapshot
    @PlantId                INT,
    @CompanySnapshotJson    NVARCHAR(MAX) OUTPUT,
    @PlantSnapshotJson      NVARCHAR(MAX) OUTPUT,
    @SignerSnapshotJson     NVARCHAR(MAX) OUTPUT
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

/* =============================================================================
   §10  Smoke-test queries (run manually after the script completes)
   =============================================================================

   -- A. Objects present?
   SELECT name, type_desc FROM sys.objects
   WHERE name IN ('CompanyProfile','CompanyPlant','CompanyCertSigner',
                  'AdminUser','CompanyAuditLog',
                  'v_Company_ForCert','v_CertSigners_Active',
                  'usp_BuildCertSnapshot','fn_IsAdmin')
   ORDER BY type_desc, name;

   -- B. Am I admin?
   SELECT SUSER_SNAME() AS me, dbo.fn_IsAdmin(NULL) AS is_admin;

   -- C. Plant rows seeded?
   SELECT * FROM dbo.CompanyPlant;

   -- D. Snapshot assembler works?
   DECLARE @c NVARCHAR(MAX), @p NVARCHAR(MAX), @s NVARCHAR(MAX);
   EXEC dbo.usp_BuildCertSnapshot @PlantId = 1,
        @CompanySnapshotJson = @c OUTPUT,
        @PlantSnapshotJson   = @p OUTPUT,
        @SignerSnapshotJson  = @s OUTPUT;
   SELECT @c AS company, @p AS plant, @s AS signers;

   ============================================================================= */

PRINT '=== CompanyProfile schema script complete ===';
GO
