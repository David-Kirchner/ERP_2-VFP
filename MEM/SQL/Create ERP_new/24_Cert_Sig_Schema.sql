/* Step 24 - Cert_Sig registry + Cert.Sig_ID (see MEM\SQL\Config\12_Cert_Sig_Schema.sql) */
/* =============================================================================
   Cert_Sig — personal signature registry + Cert.Sig_ID migration
   -----------------------------------------------------------------------------
   Target DB : ERP_2
   Date      : 2026-06-30
   Companion : MEM\CERT_SIGNATURES.md
   ----------------------------------------------------------------------------- */

USE [ERP_2];
GO

SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET NOCOUNT ON;
GO

IF OBJECT_ID('dbo.Cert_Sig', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.Cert_Sig (
        Sig_ID          INT IDENTITY(1,1) NOT NULL
            CONSTRAINT PK_Cert_Sig PRIMARY KEY,
        PersonName      NVARCHAR(80)   NOT NULL,
        AppUserLogin    NVARCHAR(80)   NOT NULL,
        LegacyCode      NVARCHAR(20)   NULL,
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
GO

/* No seed rows — add signers per company via maintenance when ready. */
GO

IF COL_LENGTH('dbo.Cert', 'Sig_ID') IS NULL
    ALTER TABLE dbo.Cert ADD Sig_ID INT NULL;
GO

IF COL_LENGTH('dbo.Cert', 'Signature') IS NOT NULL
BEGIN
    UPDATE dbo.Cert
       SET Sig_ID = NULL,
           Signed = 0,
           SignUser = '',
           SignDate = NULL;
END
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_Cert_Cert_Sig')
BEGIN
    ALTER TABLE dbo.Cert WITH NOCHECK
        ADD CONSTRAINT FK_Cert_Cert_Sig
        FOREIGN KEY (Sig_ID) REFERENCES dbo.Cert_Sig (Sig_ID);
    ALTER TABLE dbo.Cert CHECK CONSTRAINT FK_Cert_Cert_Sig;
END
GO

IF OBJECT_ID('dbo.Ar_Cert_History', 'U') IS NOT NULL
   AND COL_LENGTH('dbo.Ar_Cert_History', 'Sig_ID') IS NULL
    ALTER TABLE dbo.Ar_Cert_History ADD Sig_ID INT NULL;
GO

DECLARE @trg SYSNAME, @def NVARCHAR(MAX), @newDef NVARCHAR(MAX);
DECLARE trg_cur CURSOR LOCAL FAST_FORWARD FOR
    SELECT t.name FROM sys.triggers AS t
     WHERE t.parent_id = OBJECT_ID(N'dbo.Cert')
       AND t.name IN (N'Cert_Delete', N'Cert_Update');
OPEN trg_cur;
FETCH NEXT FROM trg_cur INTO @trg;
WHILE @@FETCH_STATUS = 0
BEGIN
    SELECT @def = m.definition FROM sys.sql_modules AS m
      INNER JOIN sys.triggers AS t ON m.object_id = t.object_id WHERE t.name = @trg;
    IF @def IS NOT NULL AND @def LIKE N'%Signature%'
    BEGIN
        SET @newDef = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@def,
            N',[Signature]', N',[Sig_ID]'),
            N'deleted.[Signature]', N'deleted.[Sig_ID]'),
            N'inserted.[Signature]', N'inserted.[Sig_ID]'),
            N'CREATE TRIGGER', N'ALTER TRIGGER'), N', [Signature]', N', [Sig_ID]');
        BEGIN TRY
            EXEC sys.sp_executesql @newDef;
        END TRY
        BEGIN CATCH
            PRINT 'WARNING: Could not auto-patch ' + @trg;
        END CATCH
    END
    FETCH NEXT FROM trg_cur INTO @trg;
END
CLOSE trg_cur;
DEALLOCATE trg_cur;
GO

IF COL_LENGTH('dbo.Cert', 'Signature') IS NOT NULL
    ALTER TABLE dbo.Cert DROP COLUMN [Signature];
GO

PRINT 'Step 24 Cert_Sig complete.';
GO
