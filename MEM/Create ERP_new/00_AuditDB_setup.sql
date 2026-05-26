/*
00 AuditDB setup for a fresh ERP_1 build.

Creates only the shared audit database/tables. ERP_1-local DDLEvents and
ErrorLog are intentionally not recreated.
*/

-- Connect this SSMS query window to the target SQL Server before running.

USE [master];
GO

IF DB_ID(N'AuditDB') IS NULL
BEGIN
    PRINT 'Creating AuditDB';
    CREATE DATABASE [AuditDB];
END
ELSE
BEGIN
    PRINT 'AuditDB already exists';
END
GO

USE [AuditDB];
GO

IF OBJECT_ID(N'dbo.ErrorLog', N'U') IS NULL
BEGIN
    PRINT 'Creating AuditDB.dbo.ErrorLog';
    CREATE TABLE dbo.ErrorLog
    (
        ErrorNumber int NULL,
        ErrorSeverity int NULL,
        ErrorState int NULL,
        ErrorProcedure nvarchar(128) NULL,
        ErrorLine int NULL,
        ErrorMessage varchar(max) NULL,
        EventID bigint IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
        EventDate smalldatetime NULL
            CONSTRAINT DF_ErrorLog_EventDate DEFAULT (GETDATE()),
        CONSTRAINT PK_ErrorLog PRIMARY KEY CLUSTERED (EventID DESC)
    ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
END
ELSE
BEGIN
    PRINT 'AuditDB.dbo.ErrorLog already exists';
END
GO

IF OBJECT_ID(N'dbo.DDLEvents', N'U') IS NULL
BEGIN
    PRINT 'Creating AuditDB.dbo.DDLEvents';
    CREATE TABLE dbo.DDLEvents
    (
        EventDate datetime NOT NULL
            CONSTRAINT DF_DDLEvents DEFAULT (GETDATE()),
        EventType nvarchar(64) NULL,
        EventDDL nvarchar(max) NULL,
        EventXML xml NULL,
        DatabaseName nvarchar(255) NULL,
        SchemaName nvarchar(255) NULL,
        ObjectName nvarchar(255) NULL,
        HostName varchar(64) NULL,
        IPAddress varchar(32) NULL,
        ProgramName nvarchar(255) NULL,
        LoginName nvarchar(255) NULL,
        ServerName nvarchar(255) NOT NULL
            CONSTRAINT DF_DDLEvents_ServerName DEFAULT (@@SERVERNAME)
    );
END
ELSE
BEGIN
    PRINT 'AuditDB.dbo.DDLEvents already exists';
END
GO

SELECT name, type_desc, create_date, modify_date
FROM sys.objects
WHERE name IN (N'ErrorLog', N'DDLEvents')
ORDER BY name;
GO
