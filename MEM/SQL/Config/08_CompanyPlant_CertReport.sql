/* Cert report header — matches Reports\certs11.frx Title band (Windfall header) */
USE [ERP_2];
GO

IF COL_LENGTH('dbo.CompanyPlant', 'CageCode') IS NULL
	ALTER TABLE dbo.CompanyPlant ADD CageCode NVARCHAR(10) NULL;
IF COL_LENGTH('dbo.CompanyPlant', 'CertReportLine') IS NULL
	ALTER TABLE dbo.CompanyPlant ADD CertReportLine NVARCHAR(200) NULL;
GO

IF NOT EXISTS (SELECT 1 FROM dbo.CompanyPlant WHERE PlantCode = 'WINDFALL')
	INSERT INTO dbo.CompanyPlant (PlantCode, PlantName, Addr1, City, StateCode, PostalCode, Phone, Fax, CageCode, CertReportLine, SortOrder, IsActive)
	VALUES ('WINDFALL', 'Windfall Plant', '1985 E 500 N', 'Windfall', 'IN', '46076',
		'(765) 631-9771', NULL, '206N0', '1985 E 500 N, Windfall, IN 46076', 98, 1);
ELSE
	UPDATE dbo.CompanyPlant SET
		PlantName = 'Windfall Plant',
		Addr1 = '1985 E 500 N', City = 'Windfall', StateCode = 'IN', PostalCode = '46076',
		Phone = '(765) 631-9771', CageCode = '206N0',
		CertReportLine = '1985 E 500 N, Windfall, IN 46076', IsActive = 1
	WHERE PlantCode = 'WINDFALL';

IF NOT EXISTS (SELECT 1 FROM dbo.CompanyPlant WHERE PlantCode = 'TIPTON')
	INSERT INTO dbo.CompanyPlant (PlantCode, PlantName, Addr1, City, StateCode, PostalCode, CageCode, CertReportLine, SortOrder, IsActive)
	VALUES ('TIPTON', 'Tipton Plant', '444 Wilson St., P.O. Box 40', 'Tipton', 'IN', '46072',
		'0HKZ1', '444 Wilson St., P.O. Box 40, Tipton, IN 46072', 99, 1);
ELSE
	UPDATE dbo.CompanyPlant SET
		PlantName = 'Tipton Plant',
		Addr1 = '444 Wilson St., P.O. Box 40', City = 'Tipton', StateCode = 'IN', PostalCode = '46072',
		CageCode = '0HKZ1', CertReportLine = '444 Wilson St., P.O. Box 40, Tipton, IN 46072', IsActive = 1
	WHERE PlantCode = 'TIPTON';
GO

UPDATE dbo.CompanyProfile SET
	Tagline = N'Manufacturer and Distributor of High Strength Alloys',
	CageCode = N'206N0',
	CertHeaderText = N'Material Certification Report'
WHERE CompanyId = 1;
GO
