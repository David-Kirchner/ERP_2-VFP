---
name: equipment-quote-to-po
description: >-
  Convert a vendor equipment quote (PDF, image, email, or details given in
  chat) into an Equipment Purchase Order in the ERP SQL Server database
  (dbo.PurchaseOrder with Equipment=1). Use when the user asks to create a PO
  from an equipment quote, enter an equipment purchase, or turn a vendor quote
  into a purchase order.
---

# Equipment Quote to Purchase Order

Creates an Equipment PO in SQL Server so it prints correctly on
`REPORTS\purchaseorder14.frx`. An "Equipment PO" is a normal
`dbo.PurchaseOrder` row with `Equipment = 1`: the metal fields (Alloy, Form,
CC, CL, sizes) stay blank, the printed description comes from `Misc_Purch`,
and pricing is per-piece or per-lot.

## Connection

Target: `SuperMicro` server, `ERP_2` database, Windows auth.

```
sqlcmd -S SuperMicro -d ERP_2 -E -W -s "|" -Q "..."
```

If `ERP_Environment.local.xml` in the project root points at a different
server/database, confirm with the user before writing anywhere else.

## Workflow

Track progress with this checklist:

```
- [ ] 1. Parse the quote
- [ ] 2. Resolve vendor and contact (STOP and ask if not found)
- [ ] 3. Resolve ship-to / bill-to from Company Profile
- [ ] 4. Allocate the PO number
- [ ] 5. Insert PurchaseOrder line(s)
- [ ] 6. Verify PO_No header + set Est_Frght
- [ ] 7. Print-readiness check and report
```

### 1. Parse the quote

Read the quote file (Read tool handles PDF/images) or take details from chat.
Extract:

- Vendor company name, address, contact person, phone, fax, email
- Line items: description (model, part number, options), quantity, unit price
- Whether each price is per piece or a lot price
- Payment terms, FOB point, freight/surcharge adders, promised ship date or
  lead time, quote/reference number

Ask the user for anything material that is missing (at minimum: vendor,
description, quantity, price).

### 2. Resolve vendor and contact

```sql
SELECT VendCode, Company, Contact FROM dbo.Vendor
WHERE Company LIKE '%<name fragment>%' AND ISNULL(Inactive,0) = 0;

SELECT ContactID, Contact, Phone, Email FROM dbo.VendorContact
WHERE VendCode = <VendCode> AND ISNULL(Inactive,0) = 0;
```

**If no vendor matches, STOP and ask the user** whether to create a new
Vendor/VendorContact or pick an existing one. Never create vendor rows
without explicit approval. When approved, insert `dbo.Vendor` (Company,
Addr1, Addr2, City, ST, Zip, Country, telephone, email) — `VendCode` is an
identity column, capture it with `SCOPE_IDENTITY()`. Then insert
`dbo.VendorContact` (VendCode, Contact, Phone, Fax, Email, Addr1, City, ST,
Zip) and capture its identity `ContactID` the same way. The contact address
is what prints on the PO, so populate VendorContact address fields even if
they duplicate the Vendor.

### 3. Resolve ship-to / bill-to from Company Profile

Print PO refuses to run when `POShipAddr` is 0/empty
(`MESSAGEBOX: Please Enter a 'Ship To Address'`). Plant locations use reserved
`dbo.ShipAddr` / `dbo.SoldAddr` codes that mirror Company Profile defaults:

| ShipWhere | Radio | POShipAddr | POpayaddr |
|---|---|---|---|
| 1 | ERP_Loc1 | `ShipAddr` **1** | `SoldAddr` **1** |
| 5 | ERP_Loc2 | `ShipAddr` **2** | `SoldAddr` **2** |
| 2 / 3 | Direct / Blind | customer `ShipAddr.ShipCode` | Bill-to as needed |

1. Confirm Company Profile ship/bill text exists:

```sql
SELECT ShipToCompany, ShipToAddr1, ShipToCity, ShipToState, ShipToPostal,
       BillToCompany, BillToAddr1, BillToCity, BillToState, BillToPostal
FROM dbo.CompanyProfile WHERE CompanyId = 1;
```

2. Ensure plant codes 1 and 2 exist (seed script
   `MEM\SQL\Create ERP_new\26_Seed_Plant_ShipBill_Addresses.sql` upserts them
   from Company Profile). If missing, run that script or INSERT/UPDATE
   `ShipAddr`/`SoldAddr` 1–2 from the profile columns before inserting the PO.

3. Default equipment plant: **ShipWhere = 5** (ERP_Loc2 / Windfall) when the
   quote ships to the company ShipTo; use **1** only when the user asks for
   Loc1. Set `@poshipaddr` / `@popayaddr` from the table above — **never leave
   `POshipaddr = 0` for plant ShipWhere 1 or 5.**

### 4. Allocate the PO number

```sql
SELECT ISNULL(MAX(HPApo),0) + 1 AS NextPO FROM dbo.PurchaseOrder;
```

- `HPApo` = that number (the VFP form rejects anything > MAX+20)
- One `PurchaseOrder` row per quote line; `ItemPO` = 1, 2, 3...
- `POitem` = `dbo.f_ProperPOitem('<HPApo>-<ItemPO>')` — char(12), 9-char
  right-aligned number + dash + 2-digit item (e.g. `   512128-01`)
- **If the table is empty (NextPO = 1), STOP and ask the user for a starting
  PO number.** `f_ProperPOitem` special-cases tiny values (`'1-01'` collapses
  to `0-00`), so a fresh database must be seeded with a realistic number
  (production was around 512128 when this skill was written).

### 5. Insert PurchaseOrder line(s)

One row per quote line. See [reference.md](reference.md) for the full column
mapping and lookup code tables. This exact statement was dry-run verified
against ERP_2 (in a rolled-back transaction); the `PurchaseOrder_Insert`
trigger fires and auto-creates the `dbo.PO_No` header row.

```sql
INSERT INTO dbo.PurchaseOrder
 (HPApo, POitem, ItemPO, SalesNum, SOitem, Item, SalesP, Cover, OrderDate,
  Company, Alloy, Form, CC, CL, Pieces, Thck, Sz2, Sz3,
  p_lb, p_pc, p_ft, lotp,
  OtherFld, OtherP, Order_QTY, StockLst_QTY, StockLst_P, StockLst_PU,
  Order_P, Order_PU, Pounds, Delivered, POSalesP, ShipVia, JobNumber,
  Due_Min, Due_Max, HPA_Due_Min, HPA_Due_Max, First_Due_Max,
  Cond_Spec, Misc_Purch, Services, ConvServ, Equipment, Stock, Sheet_pk,
  ShipWhere, POshipaddr, POpayaddr, DispAlloy, Amendment, VendCode, ContactID,
  Terms, FOB, WO, WO_Detail, WhoInsert,
  Cert, Cmplt, Cancelled, Randlen, OddCut, Metric, Printed,
  Reconciled, ReconcileTotal, BMScheck, VendorPOConf, IntP)
VALUES
 (@hpapo, dbo.f_ProperPOitem(CAST(@hpapo AS varchar) + '-' + CAST(@line AS varchar)),
  @line, 0, 'Equipment', 0, @salesp, '', GETDATE(),
  @company,            -- varchar(100); matches Vendor.Company
  '', '', '', '', @pieces, 0, 0, 0,
  -- Unit-price buckets: only the column matching Order_PU gets Order_P; others 0
  CASE WHEN @pu = 1 THEN @unitprice ELSE 0 END,  -- p_lb  $/Lb
  CASE WHEN @pu = 3 THEN @unitprice ELSE 0 END,  -- p_pc  $/Pc
  CASE WHEN @pu = 2 THEN @unitprice ELSE 0 END,  -- p_ft  $/Ft
  CASE WHEN @pu = 4 THEN @unitprice ELSE 0 END,  -- lotp  $Lot
  @otherfld, @otherp,    -- OtherP = per-line Other Price only (cut/box/skid/pack). NEVER freight
  @qty, @qty, @unitprice, @pu,  -- StockLst_QTY/P/PU mirror Order_* for Equipment (No Stock)
  @unitprice, @pu,       -- @pu: 1=$/Lb 2=$/Ft 3=$/PC 4=$Lot
  0, 0, @contact_name, @shipvia, @jobnumber,
  @due_min, @due_max,    -- vendor promised ship window
  @hpa_due_min, @hpa_due_max, @hpa_due_min,  -- HPA receive-by (see rules)
  '', @description,      -- Misc_Purch prints as the item body text
  0, 0, 1,               -- Equipment = 1
  'No Stock', 0,
  @shipwhere, @poshipaddr, @popayaddr,  -- plant: 5/2/2 (Loc2) or 1/1/1 (Loc1)
  '', 0, @vendcode, @contactid,
  @terms, @fob, 0, 0, SYSTEM_USER,
  0, 0, 0, 0, 0, 0, 0,   -- NOT NULL bits without defaults in ERP_2
  0, 0, 0, 0, 0)
```


Before the INSERT, derive dates and unit-price buckets:

```sql
-- Vendor ship window from quote lead time (NULL/NULL = ASAP on print)
-- HPA_Due_*: expected receive-by at HPA (form: latest of Due_Min/Due_Max when auto-filled)
SET @hpa_due_min = COALESCE(@due_max, @due_min, CAST(GETDATE() AS date));
SET @hpa_due_max = COALESCE(@due_max, @due_min);  -- NULL ok if only ASAP
```

Rules:

- **`SOitem = 'Equipment'`** when `Equipment = 1` and there is no real sales-order
  link (`SalesNum = 0`). Matches the PO form save CASE (LabService /
  ConvertSVC / Equipment / Service / STOCK). Do not leave `SOitem` blank.
- **`SalesP`** = HPA salesperson initial (ask the user if unknown; e.g. `D`)
- **`POSalesP`** = vendor contact / "Buy from name" (e.g. Heather Hogan) — not
  the HPA SP
- **`Due_Min` / `Due_Max`** = vendor promised ship window from the quote
- **`HPA_Due_Min` / `HPA_Due_Max`** = when HPA expects to *receive* the goods.
  If the quote has a ship window, set `HPA_Due_Min` = later of Due_Min/Due_Max
  (same as the form’s auto-fill) and `HPA_Due_Max` = that same date (or a
  short receive buffer if the quote states one). If no dates (ASAP), set
  `HPA_Due_Min` = order date and leave `HPA_Due_Max` NULL. Also set
  `First_Due_Max` = `HPA_Due_Max` if present else `HPA_Due_Min`.
- **`p_lb` / `p_pc` / `p_ft` / `lotp`** = mirror `Order_P` into the column that
  matches `Order_PU`; set the other three to 0:
  | Order_PU | Unit | Fill |
  |---|---|---|
  | 1 | $/Lb | `p_lb = Order_P` |
  | 2 | $/Ft | `p_ft = Order_P` |
  | 3 | $/Pc | `p_pc = Order_P` |
  | 4 | $Lot | `lotp = Order_P` |
- **`OtherP` / `OtherFld`** = per-line **Other Price** only (Cutting, box, skid,
  packaging, and similar fees on that PO item). Never put the unit price here.
  Printed line total = `Order_QTY * Order_P + OtherP`.
- **Quoted Freight** does **not** go in `OtherP`. Put it on the PO header:
  `dbo.PO_No.Est_Frght` (see step 6). The Ship to Addr tab shows it as
  `txtEst_Frght`.
- Never include `StockLst_Total` or `DescriptID` — computed columns
- `Pieces` >= 1 (the form forces 1 for equipment)
- `$Lot` (`Order_PU=4`): `Order_QTY = 1`, `Order_P` = lot total;
  `StockLst_QTY = 1`, `StockLst_P = Order_P`, `StockLst_PU = 4`
- `$/PC` (`Order_PU=3`): `Order_QTY` = piece count, `Order_P` = each price;
  **`StockLst_QTY = Order_QTY`, `StockLst_P = Order_P`, `StockLst_PU = Order_PU`**
  (same for any Order_PU when Equipment / No Stock — do **not** hardcode
  StockLst_QTY=1 or force $Lot)
- **Ship / bill addressing (required for Print):** default `@shipwhere = 5`,
  `@poshipaddr = 2`, `@popayaddr = 2` (Company Profile ShipTo / BillTo via
  plant codes). Loc1: `1 / 1 / 1`. Direct: `ShipWhere` 2 or 3 and a real
  customer `ShipAddr` code — never plant 1/2 for Direct.
- Escape single quotes in all text (`''`), keep within column widths
  (Company 100, ShipVia 20, JobNumber 20, Terms/FOB 50, SOitem 10, OtherFld 10)

### 6. Verify PO_No header + set Est_Frght

The `PurchaseOrder_Insert` trigger auto-creates the header. Confirm:

```sql
SELECT HPAPO, PO_Rev, Printed, Cancelled, Est_Frght
FROM dbo.PO_No WHERE HPAPO = @hpapo;
```

If missing (trigger disabled), insert:
`INSERT INTO dbo.PO_No (HPAPO, PO_Rev, Changing, Printed, Cancelled, Est_Frght) VALUES (@hpapo, 0, 0, 0, 0, @est_frght)`.

**Estimated freight** from the quote → header only:

```sql
UPDATE dbo.PO_No
SET Est_Frght = @est_frght   -- money; 0 or NULL if quote has no freight
WHERE HPAPO = @hpapo;
```

Do **not** invent a PurchaseOrder line for freight, and do **not** store
freight in `OtherP`/`OtherFld`.

### 7. Print-readiness check and report

Re-select the inserted rows and verify every field the report prints is
populated or intentionally blank — the full list with suppression conditions
is in [reference.md](reference.md). Minimum: Company + VendCode + ContactID
resolve to real Vendor/VendorContact rows, `Misc_Purch` non-empty,
`Order_QTY * Order_P + OtherP > 0`, `Pieces >= 1`, valid `ShipWhere`,
**`POShipAddr > 0`** with a matching `dbo.ShipAddr` row (Print PO hard-stop).

Report back to the user: PO number, each `POitem` with description and total,
vendor and contact used, ship/bill codes used, **Est_Frght**, and anything left
blank (terms, FOB, due date) that they may want to fill before printing from the
ERP (PurchaseOrder screen > Print, which runs `purchaseorder14.frx`).
