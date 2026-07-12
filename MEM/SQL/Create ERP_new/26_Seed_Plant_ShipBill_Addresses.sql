-- =============================================================================
-- Seed plant ShipAddr / SoldAddr codes 1 (ERP_Loc1) and 2 (ERP_Loc2)
-- from dbo.CompanyProfile CompanyId=1.
--
-- PO Print requires PurchaseOrder.POShipAddr > 0. The PO form maps:
--   ShipWhere 1 (ERP_Loc1) → ShipAddr.ShipCode 1
--   ShipWhere 5 (ERP_Loc2) → ShipAddr.ShipCode 2
-- CompanyProfile holds company bill/ship defaults; these reserved plant codes
-- mirror them so Print PO and ShowPOShipAddr work on a fresh ERP_2.
-- Target: ERP_2 on SuperMicro (idempotent — safe to re-run)
-- =============================================================================
USE [ERP_2];
GO
SET NOCOUNT ON;
SET XACT_ABORT ON;

IF NOT EXISTS (SELECT 1 FROM dbo.CompanyProfile WHERE CompanyId = 1)
BEGIN
	RAISERROR('CompanyProfile CompanyId=1 is required before seeding plant addresses.', 16, 1);
	RETURN;
END

DECLARE
	@LegalName nvarchar(100),
	@ShortName nvarchar(40),
	@Addr1 nvarchar(80), @Addr2 nvarchar(80),
	@City nvarchar(60), @StateCode nvarchar(50), @Postal nvarchar(15),
	@Country nvarchar(40), @Phone nvarchar(25), @Fax nvarchar(25),
	@BillCo nvarchar(100), @Bill1 nvarchar(80), @Bill2 nvarchar(80),
	@BillCity nvarchar(60), @BillST nvarchar(50), @BillPostal nvarchar(15),
	@BillCountry nvarchar(40), @BillPhone nvarchar(25),
	@ShipCo nvarchar(100), @Ship1 nvarchar(80), @Ship2 nvarchar(80),
	@ShipCity nvarchar(60), @ShipST nvarchar(50), @ShipPostal nvarchar(15),
	@ShipCountry nvarchar(40), @ShipPhone nvarchar(25);

SELECT
	@LegalName = LEFT(COALESCE(NULLIF(RTRIM(LegalName), ''), NULLIF(RTRIM(DBAName), ''), 'Company'), 100),
	@ShortName = LEFT(COALESCE(NULLIF(RTRIM(ShortName), ''), 'CO'), 20),
	@Addr1 = NULLIF(RTRIM(Addr1), ''),
	@Addr2 = NULLIF(RTRIM(Addr2), ''),
	@City = NULLIF(RTRIM(City), ''),
	@StateCode = NULLIF(RTRIM(StateCode), ''),
	@Postal = NULLIF(RTRIM(PostalCode), ''),
	@Country = NULLIF(RTRIM(Country), ''),
	@Phone = NULLIF(RTRIM(Phone), ''),
	@Fax = NULLIF(RTRIM(Fax), ''),
	@BillCo = NULLIF(RTRIM(BillToCompany), ''),
	@Bill1 = NULLIF(RTRIM(BillToAddr1), ''),
	@Bill2 = NULLIF(RTRIM(NULLIF(BillToAddr2, '.NULL.')), ''),
	@BillCity = NULLIF(RTRIM(BillToCity), ''),
	@BillST = NULLIF(RTRIM(BillToState), ''),
	@BillPostal = NULLIF(RTRIM(BillToPostal), ''),
	@BillCountry = NULLIF(RTRIM(BillToCountry), ''),
	@BillPhone = NULLIF(RTRIM(BillToPhone), ''),
	@ShipCo = NULLIF(RTRIM(ShipToCompany), ''),
	@Ship1 = NULLIF(RTRIM(ShipToAddr1), ''),
	@Ship2 = NULLIF(RTRIM(NULLIF(ShipToAddr2, '.NULL.')), ''),
	@ShipCity = NULLIF(RTRIM(ShipToCity), ''),
	@ShipST = NULLIF(RTRIM(ShipToState), ''),
	@ShipPostal = NULLIF(RTRIM(ShipToPostal), ''),
	@ShipCountry = NULLIF(RTRIM(ShipToCountry), ''),
	@ShipPhone = NULLIF(RTRIM(ShipToPhone), '')
FROM dbo.CompanyProfile
WHERE CompanyId = 1;

-- Loc2 (code 2) = CompanyProfile ShipTo (required for Windfall / ShipWhere 5)
IF @Ship1 IS NULL OR @ShipCity IS NULL
BEGIN
	RAISERROR('CompanyProfile ShipToAddr1/ShipToCity must be set before seeding plant ShipAddr 2.', 16, 1);
	RETURN;
END

-- Loc1 (code 1) = CompanyProfile primary Addr when present; else same as ShipTo
DECLARE
	@Loc1Co nvarchar(100) = COALESCE(@LegalName, @ShipCo, 'Company'),
	@Loc1A1 nvarchar(80) = COALESCE(@Addr1, @Ship1),
	@Loc1A2 nvarchar(80) = COALESCE(@Addr2, @Ship2),
	@Loc1City nvarchar(60) = COALESCE(@City, @ShipCity),
	@Loc1ST nvarchar(50) = COALESCE(@StateCode, @ShipST),
	@Loc1Zip nvarchar(15) = COALESCE(@Postal, @ShipPostal),
	@Loc1Ctry nvarchar(40) = COALESCE(@Country, @ShipCountry, 'USA'),
	@Loc1Phone nvarchar(25) = COALESCE(@Phone, @ShipPhone),
	@Loc1Fax nvarchar(25) = @Fax,
	@Loc2Co nvarchar(100) = COALESCE(@ShipCo, @LegalName, 'Company'),
	@BillCo2 nvarchar(100) = COALESCE(@BillCo, @LegalName, 'Company'),
	@Bill1u nvarchar(80) = COALESCE(@Bill1, @Ship1),
	@Bill2u nvarchar(80) = COALESCE(@Bill2, @Ship2),
	@BillCityu nvarchar(60) = COALESCE(@BillCity, @ShipCity),
	@BillSTu nvarchar(50) = COALESCE(@BillST, @ShipST),
	@BillPostalu nvarchar(15) = COALESCE(@BillPostal, @ShipPostal),
	@BillCountryu nvarchar(40) = COALESCE(@BillCountry, @ShipCountry, 'USA'),
	@BillPhoneu nvarchar(25) = COALESCE(@BillPhone, @ShipPhone);

BEGIN TRAN;

-- ----- ShipAddr 1 (ERP_Loc1 / ShipWhere 1) ---------------------------------
IF EXISTS (SELECT 1 FROM dbo.ShipAddr WHERE shipcode = 1)
	UPDATE dbo.ShipAddr SET
		company = LEFT(@Loc1Co, 30),
		addr1 = LEFT(@Loc1A1, 30),
		addr2 = LEFT(ISNULL(@Loc1A2, ''), 30),
		city = LEFT(@Loc1City, 20),
		st = LEFT(ISNULL(@Loc1ST, ''), 2),
		zip = LEFT(ISNULL(@Loc1Zip, ''), 12),
		country = LEFT(ISNULL(@Loc1Ctry, ''), 15),
		contact = 'Receiving',
		telephone = LEFT(ISNULL(@Loc1Phone, ''), 12),
		fax_number = LEFT(ISNULL(@Loc1Fax, ''), 12),
		customer = LEFT(@ShortName, 20),
		lastedit = GETDATE(),
		inactive = 0,
		NoNoiseName = dbo.f_NoNoiseName(LEFT(@Loc1Co, 30))
	WHERE shipcode = 1;
ELSE
	INSERT INTO dbo.ShipAddr (
		shipcode, company, addr1, addr2, city, st, zip, country,
		contact, telephone, fax_number, customer, lastedit, inactive, NoNoiseName
	)
	VALUES (
		1, LEFT(@Loc1Co, 30), LEFT(@Loc1A1, 30), LEFT(ISNULL(@Loc1A2, ''), 30),
		LEFT(@Loc1City, 20), LEFT(ISNULL(@Loc1ST, ''), 2), LEFT(ISNULL(@Loc1Zip, ''), 12),
		LEFT(ISNULL(@Loc1Ctry, ''), 15), 'Receiving',
		LEFT(ISNULL(@Loc1Phone, ''), 12), LEFT(ISNULL(@Loc1Fax, ''), 12),
		LEFT(@ShortName, 20), GETDATE(), 0, dbo.f_NoNoiseName(LEFT(@Loc1Co, 30))
	);

-- ----- ShipAddr 2 (ERP_Loc2 / ShipWhere 5) ---------------------------------
IF EXISTS (SELECT 1 FROM dbo.ShipAddr WHERE shipcode = 2)
	UPDATE dbo.ShipAddr SET
		company = LEFT(@Loc2Co, 30),
		addr1 = LEFT(@Ship1, 30),
		addr2 = LEFT(ISNULL(@Ship2, ''), 30),
		city = LEFT(@ShipCity, 20),
		st = LEFT(ISNULL(@ShipST, ''), 2),
		zip = LEFT(ISNULL(@ShipPostal, ''), 12),
		country = LEFT(ISNULL(@ShipCountry, 'USA'), 15),
		contact = 'Receiving',
		telephone = LEFT(ISNULL(@ShipPhone, ''), 12),
		fax_number = '',
		customer = LEFT(@ShortName, 20),
		lastedit = GETDATE(),
		inactive = 0,
		NoNoiseName = dbo.f_NoNoiseName(LEFT(@Loc2Co, 30))
	WHERE shipcode = 2;
ELSE
	INSERT INTO dbo.ShipAddr (
		shipcode, company, addr1, addr2, city, st, zip, country,
		contact, telephone, fax_number, customer, lastedit, inactive, NoNoiseName
	)
	VALUES (
		2, LEFT(@Loc2Co, 30), LEFT(@Ship1, 30), LEFT(ISNULL(@Ship2, ''), 30),
		LEFT(@ShipCity, 20), LEFT(ISNULL(@ShipST, ''), 2), LEFT(ISNULL(@ShipPostal, ''), 12),
		LEFT(ISNULL(@ShipCountry, 'USA'), 15), 'Receiving',
		LEFT(ISNULL(@ShipPhone, ''), 12), '',
		LEFT(@ShortName, 20), GETDATE(), 0, dbo.f_NoNoiseName(LEFT(@Loc2Co, 30))
	);

-- ----- SoldAddr 1 / 2 (bill-to; POpayaddr when used) -------------------------
IF EXISTS (SELECT 1 FROM dbo.SoldAddr WHERE soldcode = 1)
	UPDATE dbo.SoldAddr SET
		company = LEFT(@BillCo2, 30),
		addr1 = LEFT(@Bill1u, 30),
		addr2 = LEFT(ISNULL(@Bill2u, ''), 30),
		city = LEFT(@BillCityu, 20),
		st = LEFT(ISNULL(@BillSTu, ''), 2),
		zip = LEFT(ISNULL(@BillPostalu, ''), 12),
		country = LEFT(ISNULL(@BillCountryu, ''), 15),
		telephone = LEFT(ISNULL(@BillPhoneu, ''), 12),
		customer = LEFT(@ShortName, 20),
		lastedit = GETDATE(),
		inactive = 0,
		IND_Type = 2,
		NoNoiseName = dbo.f_NoNoiseName(LEFT(@BillCo2, 30))
	WHERE soldcode = 1;
ELSE
	INSERT INTO dbo.SoldAddr (
		soldcode, company, addr1, addr2, city, st, zip, country,
		telephone, customer, lastedit, inactive, IND_Type, NoNoiseName
	)
	VALUES (
		1, LEFT(@BillCo2, 30), LEFT(@Bill1u, 30), LEFT(ISNULL(@Bill2u, ''), 30),
		LEFT(@BillCityu, 20), LEFT(ISNULL(@BillSTu, ''), 2), LEFT(ISNULL(@BillPostalu, ''), 12),
		LEFT(ISNULL(@BillCountryu, ''), 15), LEFT(ISNULL(@BillPhoneu, ''), 12),
		LEFT(@ShortName, 20), GETDATE(), 0, 2, dbo.f_NoNoiseName(LEFT(@BillCo2, 30))
	);

IF EXISTS (SELECT 1 FROM dbo.SoldAddr WHERE soldcode = 2)
	UPDATE dbo.SoldAddr SET
		company = LEFT(@BillCo2, 30),
		addr1 = LEFT(@Bill1u, 30),
		addr2 = LEFT(ISNULL(@Bill2u, ''), 30),
		city = LEFT(@BillCityu, 20),
		st = LEFT(ISNULL(@BillSTu, ''), 2),
		zip = LEFT(ISNULL(@BillPostalu, ''), 12),
		country = LEFT(ISNULL(@BillCountryu, ''), 15),
		telephone = LEFT(ISNULL(@BillPhoneu, ''), 12),
		customer = LEFT(@ShortName, 20),
		lastedit = GETDATE(),
		inactive = 0,
		IND_Type = 0,
		NoNoiseName = dbo.f_NoNoiseName(LEFT(@BillCo2, 30))
	WHERE soldcode = 2;
ELSE
	INSERT INTO dbo.SoldAddr (
		soldcode, company, addr1, addr2, city, st, zip, country,
		telephone, customer, lastedit, inactive, IND_Type, NoNoiseName
	)
	VALUES (
		2, LEFT(@BillCo2, 30), LEFT(@Bill1u, 30), LEFT(ISNULL(@Bill2u, ''), 30),
		LEFT(@BillCityu, 20), LEFT(ISNULL(@BillSTu, ''), 2), LEFT(ISNULL(@BillPostalu, ''), 12),
		LEFT(ISNULL(@BillCountryu, ''), 15), LEFT(ISNULL(@BillPhoneu, ''), 12),
		LEFT(@ShortName, 20), GETDATE(), 0, 0, dbo.f_NoNoiseName(LEFT(@BillCo2, 30))
	);

COMMIT TRAN;

SELECT shipcode, company, addr1, city, st, zip FROM dbo.ShipAddr WHERE shipcode IN (1, 2);
SELECT soldcode, company, addr1, city, st, zip FROM dbo.SoldAddr WHERE soldcode IN (1, 2);
PRINT 'Plant ShipAddr/SoldAddr 1 and 2 synced from CompanyProfile.';
GO
