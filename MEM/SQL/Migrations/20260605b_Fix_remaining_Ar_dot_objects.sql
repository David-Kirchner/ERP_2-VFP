-- Fix the 7 modules that failed in 20260605 migration (CREATE with extra spaces).
-- Run on SuperMicro and Server26 after 20260605 script.

USE [ERP_2];
GO

SET NOCOUNT ON;

DECLARE @schema SYSNAME, @name SYSNAME, @type CHAR(2);
DECLARE @def NVARCHAR(MAX), @new NVARCHAR(MAX);
DECLARE @fixed INT = 0, @failed INT = 0;

DECLARE fix_cur CURSOR LOCAL FAST_FORWARD FOR
SELECT OBJECT_SCHEMA_NAME(m.object_id), o.name, o.type, m.definition
FROM sys.sql_modules m
INNER JOIN sys.objects o ON m.object_id = o.object_id
WHERE m.definition LIKE '%dbo.Ar.%'
  AND o.type IN ('TR', 'P')
  AND o.is_ms_shipped = 0;

OPEN fix_cur;
FETCH NEXT FROM fix_cur INTO @schema, @name, @type, @def;

WHILE @@FETCH_STATUS = 0
BEGIN
	SET @new = REPLACE(@def, 'dbo.Ar.', 'dbo.Ar_');

	IF @type = 'TR'
	BEGIN
		WHILE CHARINDEX('CREATE  ', @new) > 0 AND CHARINDEX('CREATE TRIGGER', @new) = 0
			SET @new = REPLACE(@new, 'CREATE  ', 'CREATE ');
		SET @new = REPLACE(@new, 'CREATE TRIGGER', 'ALTER TRIGGER');
	END
	ELSE IF @type = 'P'
	BEGIN
		WHILE CHARINDEX('CREATE  ', @new) > 0 AND CHARINDEX('CREATE PROCEDURE', @new) = 0
			SET @new = REPLACE(@new, 'CREATE  ', 'CREATE ');
		SET @new = REPLACE(@new, 'CREATE PROCEDURE', 'ALTER PROCEDURE');
	END

	BEGIN TRY
		EXEC sys.sp_executesql @new;
		SET @fixed = @fixed + 1;
		PRINT 'Fixed: ' + @schema + '.' + @name;
	END TRY
	BEGIN CATCH
		SET @failed = @failed + 1;
		PRINT 'FAILED: ' + @schema + '.' + @name + ' — ' + ERROR_MESSAGE();
	END CATCH

	FETCH NEXT FROM fix_cur INTO @schema, @name, @type, @def;
END

CLOSE fix_cur;
DEALLOCATE fix_cur;

PRINT 'Fixed: ' + CAST(@fixed AS VARCHAR(10)) + ', Failed: ' + CAST(@failed AS VARCHAR(10));
GO

DECLARE @remaining INT;
SELECT @remaining = COUNT(*)
FROM sys.sql_modules m
INNER JOIN sys.objects o ON m.object_id = o.object_id
WHERE m.definition LIKE '%dbo.Ar.%' AND o.is_ms_shipped = 0;

IF @remaining = 0
	PRINT 'OK: No dbo.Ar. references remain.';
ELSE
	PRINT 'WARNING: ' + CAST(@remaining AS VARCHAR(10)) + ' module(s) still contain dbo.Ar.';
GO
