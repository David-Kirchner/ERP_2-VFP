/* =============================================================================
   Cert_Sig — personal signature registry + Cert.Sig_ID migration
   -----------------------------------------------------------------------------
   Target DB : ERP_2
   Date      : 2026-06-30
   Companion : MEM\CERT_SIGNATURES.md
   -----------------------------------------------------------------------------
   Replaces dbo.Cert.Signature (varchar legacy code) with Sig_ID FK to Cert_Sig.
   CompanyCertSigner (plant header slots) and CompanyCertPdf (PDF archive) unchanged.
   ============================================================================= */

USE [ERP_2];
GO

SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET NOCOUNT ON;
GO

/* =============================================================================
   §1  dbo.Cert_Sig — registered cert signers + signature image blobs
   ============================================================================= */

IF OBJECT_ID('dbo.Cert_Sig', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.Cert_Sig (
        Sig_ID          INT IDENTITY(1,1) NOT NULL
            CONSTRAINT PK_Cert_Sig PRIMARY KEY,
        PersonName      NVARCHAR(80)   NOT NULL,
        AppUserLogin    NVARCHAR(80)   NOT NULL,   -- VFP ID() user segment after '#'
        LegacyCode      NVARCHAR(20)   NULL,        -- rustykirch, DaveMorrow, etc.
        SigImage        VARBINARY(MAX) NULL,
        SigMime         NVARCHAR(40)   NULL
            CONSTRAINT DF_Cert_Sig_Mime DEFAULT 'image/bmp',
        IsActive        BIT            NOT NULL
            CONSTRAINT DF_Cert_Sig_Active DEFAULT 1,
        ModifiedBy      NVARCHAR(80)   NOT NULL
            CONSTRAINT DF_Cert_Sig_ModBy  DEFAULT SUSER_SNAME(),
        ModifiedDate    DATETIME2(0)   NOT NULL
            CONSTRAINT DF_Cert_Sig_ModDt  DEFAULT SYSDATETIME()
    );

    CREATE UNIQUE INDEX UX_Cert_Sig_LegacyCode
        ON dbo.Cert_Sig (LegacyCode)
        WHERE LegacyCode IS NOT NULL;

    CREATE INDEX IX_Cert_Sig_AppUserLogin
        ON dbo.Cert_Sig (AppUserLogin)
        WHERE IsActive = 1;

    PRINT 'Created dbo.Cert_Sig';
END
ELSE
    PRINT 'dbo.Cert_Sig already exists';
GO

/* =============================================================================
   §2  No seed rows — each company adds signers via maintenance when ready.
        Unsigned certs use graphics\sig-Blank.bmp (file on disk, not Cert_Sig).
   ============================================================================= */
GO

/* =============================================================================
   §3  dbo.Cert — add Sig_ID, clear legacy signature state, drop Signature
   ============================================================================= */

IF COL_LENGTH('dbo.Cert', 'Sig_ID') IS NULL
BEGIN
    ALTER TABLE dbo.Cert ADD Sig_ID INT NULL;
    PRINT 'Added dbo.Cert.Sig_ID';
END
GO

IF COL_LENGTH('dbo.Cert', 'Signature') IS NOT NULL
BEGIN
    UPDATE dbo.Cert
       SET Sig_ID = NULL,
           Signed = 0,
           SignUser = '',
           SignDate = NULL;

    PRINT 'Cleared all cert signature state (Sig_ID NULL / unsigned)';
END
GO

IF NOT EXISTS (
    SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_Cert_Cert_Sig'
)
BEGIN
    ALTER TABLE dbo.Cert WITH NOCHECK
        ADD CONSTRAINT FK_Cert_Cert_Sig
        FOREIGN KEY (Sig_ID) REFERENCES dbo.Cert_Sig (Sig_ID);
    ALTER TABLE dbo.Cert CHECK CONSTRAINT FK_Cert_Cert_Sig;
    PRINT 'Added FK_Cert_Cert_Sig';
END
GO

/* Audit history table — keep Signature for old rows; new rows store Sig_ID */
IF OBJECT_ID('dbo.Ar_Cert_History', 'U') IS NOT NULL
   AND COL_LENGTH('dbo.Ar_Cert_History', 'Sig_ID') IS NULL
BEGIN
    ALTER TABLE dbo.Ar_Cert_History ADD Sig_ID INT NULL;
    PRINT 'Added dbo.Ar_Cert_History.Sig_ID';
END
GO

/* Patch Cert audit triggers: Signature column → Sig_ID */
DECLARE @trg SYSNAME, @def NVARCHAR(MAX), @newDef NVARCHAR(MAX);

DECLARE trg_cur CURSOR LOCAL FAST_FORWARD FOR
    SELECT t.name
      FROM sys.triggers AS t
     WHERE t.parent_id = OBJECT_ID(N'dbo.Cert')
       AND t.name IN (N'Cert_Delete', N'Cert_Update');

OPEN trg_cur;
FETCH NEXT FROM trg_cur INTO @trg;

WHILE @@FETCH_STATUS = 0
BEGIN
    SELECT @def = m.definition
      FROM sys.sql_modules AS m
      INNER JOIN sys.triggers AS t ON m.object_id = t.object_id
     WHERE t.name = @trg;

    IF @def IS NOT NULL AND @def LIKE N'%Signature%'
    BEGIN
        SET @newDef = REPLACE(@def, N', [Signature]', N', [Sig_ID]');
        SET @newDef = REPLACE(@newDef, N',[Signature]', N',[Sig_ID]');
        SET @newDef = REPLACE(@newDef, N'deleted.[Signature]', N'deleted.[Sig_ID]');
        SET @newDef = REPLACE(@newDef, N'inserted.[Signature]', N'inserted.[Sig_ID]');
        SET @newDef = REPLACE(@newDef, N'CREATE TRIGGER', N'ALTER TRIGGER');

        BEGIN TRY
            EXEC sys.sp_executesql @newDef;
            PRINT 'Patched trigger ' + @trg;
        END TRY
        BEGIN CATCH
            PRINT 'WARNING: Could not auto-patch ' + @trg + ' — ' + ERROR_MESSAGE();
        END CATCH
    END

    FETCH NEXT FROM trg_cur INTO @trg;
END

CLOSE trg_cur;
DEALLOCATE trg_cur;
GO

IF COL_LENGTH('dbo.Cert', 'Signature') IS NOT NULL
BEGIN
    ALTER TABLE dbo.Cert DROP COLUMN [Signature];
    PRINT 'Dropped dbo.Cert.Signature';
END
GO

PRINT 'Cert_Sig schema migration complete. Cert_Sig is empty; run DO Cert_Sig_EnsureBlankGraphics to create graphics\sig-Blank.bmp.';
GO
