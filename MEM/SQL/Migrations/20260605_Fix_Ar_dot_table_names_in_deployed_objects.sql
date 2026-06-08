-- Fix legacy dbo.Ar.TableName references in deployed triggers/procs/functions.
-- ERP_2 archive tables use dbo.Ar_TableName (underscore), not dbo.Ar.TableName.
-- Source scripts in MEM\SQL\Create ERP_new\ are already corrected; this updates live objects.
-- Run on BOTH SuperMicro and Server26. Idempotent (safe to re-run).

USE [ERP_2];
GO

SET NOCOUNT ON;

DECLARE @schema SYSNAME, @name SYSNAME, @type CHAR(2), @typeDesc NVARCHAR(60);
DECLARE @def NVARCHAR(MAX), @new NVARCHAR(MAX);
DECLARE @fixed INT = 0, @failed INT = 0;

PRINT 'Objects with dbo.Ar. before fix:';
SELECT o.type_desc, QUOTENAME(OBJECT_SCHEMA_NAME(o.object_id)) + '.' + QUOTENAME(o.name) AS object_name
FROM sys.sql_modules m
INNER JOIN sys.objects o ON m.object_id = o.object_id
WHERE m.definition LIKE '%dbo.Ar.%'
ORDER BY o.type_desc, o.name;
GO

DECLARE @schema SYSNAME, @name SYSNAME, @type CHAR(2);
DECLARE @def NVARCHAR(MAX), @new NVARCHAR(MAX);
DECLARE @fixed INT = 0, @failed INT = 0;

DECLARE fix_cur CURSOR LOCAL FAST_FORWARD FOR
SELECT OBJECT_SCHEMA_NAME(m.object_id), o.name, o.type, m.definition
FROM sys.sql_modules m
INNER JOIN sys.objects o ON m.object_id = o.object_id
WHERE m.definition LIKE '%dbo.Ar.%'
  AND o.type IN ('TR', 'P', 'FN', 'IF', 'TF', 'V')
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
		IF CHARINDEX('CREATE PROC', @new) > 0 AND CHARINDEX('ALTER PROC', @new) = 0
		BEGIN
			WHILE CHARINDEX('CREATE  ', @new) > 0 AND CHARINDEX('CREATE PROC', @new) > 0 AND CHARINDEX('CREATE PROCEDURE', @new) = 0
				SET @new = REPLACE(@new, 'CREATE  ', 'CREATE ');
			SET @new = REPLACE(@new, 'CREATE PROC', 'ALTER PROC');
		END
	END
	ELSE IF @type IN ('FN', 'IF', 'TF')
	BEGIN
		SET @new = REPLACE(@new, 'CREATE FUNCTION', 'ALTER FUNCTION');
	END
	ELSE IF @type = 'V'
	BEGIN
		SET @new = REPLACE(@new, 'CREATE VIEW', 'ALTER VIEW');
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

PRINT '';
PRINT 'Fixed: ' + CAST(@fixed AS VARCHAR(10)) + ', Failed: ' + CAST(@failed AS VARCHAR(10));
GO

DECLARE @remaining INT;
SELECT @remaining = COUNT(*)
FROM sys.sql_modules m
INNER JOIN sys.objects o ON m.object_id = o.object_id
WHERE m.definition LIKE '%dbo.Ar.%'
  AND o.is_ms_shipped = 0;

IF @remaining = 0
	PRINT 'OK: No dbo.Ar. references remain in user modules.';
ELSE
BEGIN
	PRINT 'WARNING: ' + CAST(@remaining AS VARCHAR(10)) + ' module(s) still contain dbo.Ar.';
	SELECT o.type_desc, QUOTENAME(OBJECT_SCHEMA_NAME(o.object_id)) + '.' + QUOTENAME(o.name) AS object_name
	FROM sys.sql_modules m
	INNER JOIN sys.objects o ON m.object_id = o.object_id
	WHERE m.definition LIKE '%dbo.Ar.%'
	  AND o.is_ms_shipped = 0
	ORDER BY o.type_desc, o.name;
END
GO

PRINT 'Migration complete: 20260605_Fix_Ar_dot_table_names_in_deployed_objects';
GO
