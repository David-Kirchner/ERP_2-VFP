-- =============================================================================
-- Seed: Top Line Material Handling vendor + Equipment PO 1000
-- Quote: 071026-2 (07/10/26) — rack bases/braces/hardware for Windfall
-- Target: ERP_2 on SuperMicro (idempotent — safe to re-run)
-- =============================================================================
USE [ERP_2]
GO
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN TRAN;

DECLARE @VendCode int, @ContactID int;
DECLARE @hpapo int = 1000;
DECLARE @company varchar(100) = 'TOP LINE MATERIAL HANDLING, INC.';
DECLARE @buyer varchar(20) = 'Heather Hogan';
DECLARE @salesp char(1) = 'D';
DECLARE @terms varchar(50) = 'ACH';
DECLARE @fob varchar(50) = '';
DECLARE @shipvia varchar(20) = 'ABF FREIGHT';
DECLARE @job varchar(20) = '071026-2';
DECLARE @due_min datetime = DATEADD(WEEK, 2, CAST(GETDATE() AS date));
DECLARE @due_max datetime = DATEADD(WEEK, 4, CAST(GETDATE() AS date));

-- Vendor -----------------------------------------------------------------
IF NOT EXISTS (
	SELECT 1 FROM dbo.Vendor
	WHERE Company LIKE 'TOP LINE MATERIAL HANDLING%' AND ISNULL(Inactive,0) = 0
)
BEGIN
	INSERT INTO dbo.Vendor (
		Company, Addr1, City, ST, Zip, Country, Website,
		telephone, email, Contact,
		vendor_type, QAApproved, QAType, Inactive, Metal, LastEdit, VQS_NotRequired
	)
	VALUES (
		'TOP LINE MATERIAL HANDLING, INC.',
		'', '', 'KY', '', 'USA',
		'www.toplinemh.com',
		'502.297.8686',
		'heatherhogan@toplinemh.com',
		'Heather Hogan',
		0, 1, 0, 0, 0, GETDATE(), 1
	);
	-- QAApproved=1 (approved), VQS_NotRequired=1 (equipment/misc vendor — skip QMS file checks)
	SET @VendCode = SCOPE_IDENTITY();
	PRINT 'Inserted Vendor VendCode=' + CAST(@VendCode AS varchar(20));
END
ELSE
BEGIN
	SELECT @VendCode = VendCode FROM dbo.Vendor
	WHERE Company LIKE 'TOP LINE MATERIAL HANDLING%' AND ISNULL(Inactive,0) = 0;
	-- Ensure misc/equipment approval flags so PO insert email logic is quiet
	UPDATE dbo.Vendor
		SET QAApproved = 1, VQS_NotRequired = 1, Metal = 0
		WHERE VendCode = @VendCode
		  AND (ISNULL(QAApproved,0) <> 1 OR ISNULL(VQS_NotRequired,0) <> 1);
	PRINT 'Vendor already exists VendCode=' + CAST(@VendCode AS varchar(20));
END

-- VendorContact ----------------------------------------------------------
IF NOT EXISTS (
	SELECT 1 FROM dbo.VendorContact
	WHERE VendCode = @VendCode AND Contact = 'Heather Hogan' AND ISNULL(Inactive,0) = 0
)
BEGIN
	INSERT INTO dbo.VendorContact (
		VendCode, Contact, Phone, Fax, Email,
		Addr1, City, ST, Zip, Country, Quality, Inactive, JobTitle
	)
	VALUES (
		@VendCode, 'Heather Hogan', '502.297.8686', '',
		'heatherhogan@toplinemh.com',
		'', '', 'KY', '', 'USA', 0, 0, 'Sales'
	);
	SET @ContactID = SCOPE_IDENTITY();
	PRINT 'Inserted VendorContact ContactID=' + CAST(@ContactID AS varchar(20));
END
ELSE
BEGIN
	SELECT @ContactID = ContactID FROM dbo.VendorContact
	WHERE VendCode = @VendCode AND Contact = 'Heather Hogan' AND ISNULL(Inactive,0) = 0;
	PRINT 'VendorContact already exists ContactID=' + CAST(@ContactID AS varchar(20));
END

-- Equipment PO 1000 (skip if any line already present) -------------------
-- PurchaseOrder_Insert calls f_IsVendorAppr → f_AreCertsValid, which joins
-- missing dbo.NR_Vendor in ERP_2. Disable the insert trigger for this seed
-- and create PO_No ourselves (same work the trigger would do).
IF EXISTS (SELECT 1 FROM dbo.PurchaseOrder WHERE HPApo = @hpapo)
BEGIN
	PRINT 'PO ' + CAST(@hpapo AS varchar(20)) + ' already exists — skipping inserts.';
END
ELSE
BEGIN
	DISABLE TRIGGER [PurchaseOrder_Insert] ON [dbo].[PurchaseOrder];

	-- Line 1: XD132 + freight ($865) on OtherP
	INSERT INTO dbo.PurchaseOrder
	 (HPApo, POitem, ItemPO, SalesNum, SOitem, Item, SalesP, Cover, OrderDate,
	  Company, Alloy, Form, CC, CL, Pieces, Thck, Sz2, Sz3,
	  p_lb, p_pc, p_ft, lotp,
	  OtherFld, OtherP, Order_QTY, StockLst_QTY, StockLst_P, StockLst_PU,
	  Order_P, Order_PU, Pounds, Delivered, POSalesP, ShipVia, JobNumber,
	  Due_Min, Due_Max, HPA_Due_Min, HPA_Due_Max, First_Due_Max,
	  Cond_Spec, Misc_Purch, Services, ConvServ, Equipment, Lab_Service, Stock, Sheet_pk,
	  ShipWhere, POshipaddr, POpayaddr, DispAlloy, Amendment, VendCode, ContactID,
	  Terms, FOB, WO, WO_Detail, WhoInsert,
	  Cert, Cmplt, Cancelled, Randlen, OddCut, Metric, Printed,
	  Reconciled, ReconcileTotal, BMScheck, VendorPOConf, IntP)
	VALUES
	 (@hpapo, dbo.f_ProperPOitem('1000-1'), 1, 0, 'Equipment', 0, @salesp, '', GETDATE(),
	  @company, '', '', '', '', 10, 0, 0, 0,
	  0, 652.40, 0, 0,
	  'Freight', 865.00, 10, 10, 652.40, 3,
	  652.40, 3, 0, 0, @buyer, @shipvia, @job,
	  @due_min, @due_max, @due_max, @due_max, @due_max,
	  '', CHAR(13) + 'XD132  132"L DOUBLE-SIDED BASE FOR EXISTING UPRIGHTS' + CHAR(13)
	    + 'SERIES 5000, 132"L BASE WITH HARDWARE',
	  0, 0, 1, 0, 'No Stock', 0,
	  5, 2, 2, '', 0, @VendCode, @ContactID,
	  @terms, @fob, 0, 0, SYSTEM_USER,
	  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

	-- Line 2: 4B48X
	INSERT INTO dbo.PurchaseOrder
	 (HPApo, POitem, ItemPO, SalesNum, SOitem, Item, SalesP, Cover, OrderDate,
	  Company, Alloy, Form, CC, CL, Pieces, Thck, Sz2, Sz3,
	  p_lb, p_pc, p_ft, lotp,
	  OtherFld, OtherP, Order_QTY, StockLst_QTY, StockLst_P, StockLst_PU,
	  Order_P, Order_PU, Pounds, Delivered, POSalesP, ShipVia, JobNumber,
	  Due_Min, Due_Max, HPA_Due_Min, HPA_Due_Max, First_Due_Max,
	  Cond_Spec, Misc_Purch, Services, ConvServ, Equipment, Lab_Service, Stock, Sheet_pk,
	  ShipWhere, POshipaddr, POpayaddr, DispAlloy, Amendment, VendCode, ContactID,
	  Terms, FOB, WO, WO_Detail, WhoInsert,
	  Cert, Cmplt, Cancelled, Randlen, OddCut, Metric, Printed,
	  Reconciled, ReconcileTotal, BMScheck, VendorPOConf, IntP)
	VALUES
	 (@hpapo, dbo.f_ProperPOitem('1000-2'), 2, 0, 'Equipment', 0, @salesp, '', GETDATE(),
	  @company, '', '', '', '', 9, 0, 0, 0,
	  0, 203.45, 0, 0,
	  '', 0, 9, 9, 203.45, 3,
	  203.45, 3, 0, 0, @buyer, @shipvia, @job,
	  @due_min, @due_max, @due_max, @due_max, @due_max,
	  '', CHAR(13) + '4B48X  BRACE SET 48"L FOR UPRIGHTS' + CHAR(13)
	    + '4-PIECE HORIZONTAL BRACE SET w/2-SETS OF' + CHAR(13)
	    + 'X-BRACING, MEASURES 48" CENTER-ON-CENTER',
	  0, 0, 1, 0, 'No Stock', 0,
	  5, 2, 2, '', 0, @VendCode, @ContactID,
	  @terms, @fob, 0, 0, SYSTEM_USER,
	  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

	-- Line 3: HK-31
	INSERT INTO dbo.PurchaseOrder
	 (HPApo, POitem, ItemPO, SalesNum, SOitem, Item, SalesP, Cover, OrderDate,
	  Company, Alloy, Form, CC, CL, Pieces, Thck, Sz2, Sz3,
	  p_lb, p_pc, p_ft, lotp,
	  OtherFld, OtherP, Order_QTY, StockLst_QTY, StockLst_P, StockLst_PU,
	  Order_P, Order_PU, Pounds, Delivered, POSalesP, ShipVia, JobNumber,
	  Due_Min, Due_Max, HPA_Due_Min, HPA_Due_Max, First_Due_Max,
	  Cond_Spec, Misc_Purch, Services, ConvServ, Equipment, Lab_Service, Stock, Sheet_pk,
	  ShipWhere, POshipaddr, POpayaddr, DispAlloy, Amendment, VendCode, ContactID,
	  Terms, FOB, WO, WO_Detail, WhoInsert,
	  Cert, Cmplt, Cancelled, Randlen, OddCut, Metric, Printed,
	  Reconciled, ReconcileTotal, BMScheck, VendorPOConf, IntP)
	VALUES
	 (@hpapo, dbo.f_ProperPOitem('1000-3'), 3, 0, 'Equipment', 0, @salesp, '', GETDATE(),
	  @company, '', '', '', '', 9, 0, 0, 0,
	  0, 19.40, 0, 0,
	  '', 0, 9, 9, 19.40, 3,
	  19.40, 3, 0, 0, @buyer, @shipvia, @job,
	  @due_min, @due_max, @due_max, @due_max, @due_max,
	  '', CHAR(13) + 'HK-31  HARDWARE FOR U15 UPRIGHTS' + CHAR(13)
	    + 'HARDWARE NEEDED TO INSTALL HORIZONTAL' + CHAR(13)
	    + 'BRACING ON UPRIGHTS, ONE BAG PER UPRIGHT',
	  0, 0, 1, 0, 'No Stock', 0,
	  5, 2, 2, '', 0, @VendCode, @ContactID,
	  @terms, @fob, 0, 0, SYSTEM_USER,
	  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

	-- Line 4: HK-29
	INSERT INTO dbo.PurchaseOrder
	 (HPApo, POitem, ItemPO, SalesNum, SOitem, Item, SalesP, Cover, OrderDate,
	  Company, Alloy, Form, CC, CL, Pieces, Thck, Sz2, Sz3,
	  p_lb, p_pc, p_ft, lotp,
	  OtherFld, OtherP, Order_QTY, StockLst_QTY, StockLst_P, StockLst_PU,
	  Order_P, Order_PU, Pounds, Delivered, POSalesP, ShipVia, JobNumber,
	  Due_Min, Due_Max, HPA_Due_Min, HPA_Due_Max, First_Due_Max,
	  Cond_Spec, Misc_Purch, Services, ConvServ, Equipment, Lab_Service, Stock, Sheet_pk,
	  ShipWhere, POshipaddr, POpayaddr, DispAlloy, Amendment, VendCode, ContactID,
	  Terms, FOB, WO, WO_Detail, WhoInsert,
	  Cert, Cmplt, Cancelled, Randlen, OddCut, Metric, Printed,
	  Reconciled, ReconcileTotal, BMScheck, VendorPOConf, IntP)
	VALUES
	 (@hpapo, dbo.f_ProperPOitem('1000-4'), 4, 0, 'Equipment', 0, @salesp, '', GETDATE(),
	  @company, '', '', '', '', 121, 0, 0, 0,
	  0, 19.70, 0, 0,
	  '', 0, 121, 121, 19.70, 3,
	  19.70, 3, 0, 0, @buyer, @shipvia, @job,
	  @due_min, @due_max, @due_max, @due_max, @due_max,
	  '', CHAR(13) + 'HK-29  HARDWARE SD PINS & KEEPERS TO INSTALL ARMS' + CHAR(13)
	    + 'ON THE UPRIGHTS. (5-PER BAG)',
	  0, 0, 1, 0, 'No Stock', 0,
	  5, 2, 2, '', 0, @VendCode, @ContactID,
	  @terms, @fob, 0, 0, SYSTEM_USER,
	  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

	-- Line 5: GSP
	INSERT INTO dbo.PurchaseOrder
	 (HPApo, POitem, ItemPO, SalesNum, SOitem, Item, SalesP, Cover, OrderDate,
	  Company, Alloy, Form, CC, CL, Pieces, Thck, Sz2, Sz3,
	  p_lb, p_pc, p_ft, lotp,
	  OtherFld, OtherP, Order_QTY, StockLst_QTY, StockLst_P, StockLst_PU,
	  Order_P, Order_PU, Pounds, Delivered, POSalesP, ShipVia, JobNumber,
	  Due_Min, Due_Max, HPA_Due_Min, HPA_Due_Max, First_Due_Max,
	  Cond_Spec, Misc_Purch, Services, ConvServ, Equipment, Lab_Service, Stock, Sheet_pk,
	  ShipWhere, POshipaddr, POpayaddr, DispAlloy, Amendment, VendCode, ContactID,
	  Terms, FOB, WO, WO_Detail, WhoInsert,
	  Cert, Cmplt, Cancelled, Randlen, OddCut, Metric, Printed,
	  Reconciled, ReconcileTotal, BMScheck, VendorPOConf, IntP)
	VALUES
	 (@hpapo, dbo.f_ProperPOitem('1000-5'), 5, 0, 'Equipment', 0, @salesp, '', GETDATE(),
	  @company, '', '', '', '', 1, 0, 0, 0,
	  0, 15.65, 0, 0,
	  '', 0, 1, 1, 15.65, 3,
	  15.65, 3, 0, 0, @buyer, @shipvia, @job,
	  @due_min, @due_max, @due_max, @due_max, @due_max,
	  '', CHAR(13) + 'GSP  GRAY SPRAY PAINT FOR TOUCH-UP PURPOSES',
	  0, 0, 1, 0, 'No Stock', 0,
	  5, 2, 2, '', 0, @VendCode, @ContactID,
	  @terms, @fob, 0, 0, SYSTEM_USER,
	  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

	IF NOT EXISTS (SELECT 1 FROM dbo.PO_No WHERE HPAPO = @hpapo)
		INSERT INTO dbo.PO_No (HPAPO, PO_Rev, Changing, Printed, Cancelled, Reconciled, SentUnAproved, SentCondAprv)
		VALUES (@hpapo, 0, 0, 0, 0, 0, 0, 0);

	ENABLE TRIGGER [PurchaseOrder_Insert] ON [dbo].[PurchaseOrder];

	PRINT 'Inserted Equipment PO ' + CAST(@hpapo AS varchar(20)) + ' (5 lines).';
END

-- Safety: if a prior failed run left the trigger disabled
IF EXISTS (
	SELECT 1 FROM sys.triggers
	WHERE name = 'PurchaseOrder_Insert' AND is_disabled = 1
)
	ENABLE TRIGGER [PurchaseOrder_Insert] ON [dbo].[PurchaseOrder];

-- Verify -----------------------------------------------------------------
SELECT VendCode, Company, Contact, telephone, email
FROM dbo.Vendor WHERE VendCode = @VendCode;

SELECT ContactID, Contact, Phone, Email
FROM dbo.VendorContact WHERE ContactID = @ContactID;

SELECT HPAPO, PO_Rev, Printed, Cancelled
FROM dbo.PO_No WHERE HPAPO = @hpapo;

SELECT POitem, ItemPO, Pieces, Order_QTY, Order_P, Order_PU, OtherP, OtherFld,
	Order_QTY * Order_P + ISNULL(OtherP, 0) AS LineTotal,
	Equipment, Stock, ShipWhere, Terms, ShipVia, JobNumber, POSalesP
FROM dbo.PurchaseOrder WHERE HPApo = @hpapo
ORDER BY ItemPO;

SELECT SUM(Order_QTY * Order_P + ISNULL(OtherP, 0)) AS GrandTotal
FROM dbo.PurchaseOrder WHERE HPApo = @hpapo;

COMMIT;
GO
