# Reference: Equipment PO field mapping and print requirements

Derived from `LIBS/purchaseorder.VC2` (PO form save/print logic),
`REPORTS/purchaseorder26.fr2` (decompiled report), and live data patterns in
`dbo.PurchaseOrder` (536 historical Equipment POs).

## Column mapping — dbo.PurchaseOrder

### From the quote

| Column | Type | Source |
|---|---|---|
| Company | varchar(100) | Vendor name (matches Vendor.Company) |
| VendCode | int | dbo.Vendor.VendCode (identity) |
| ContactID | int | dbo.VendorContact.ContactID (identity) |
| Misc_Purch | varchar(max) | Line description — the printed body text. Multi-line OK (historical rows start with a CR) |
| Order_QTY | decimal | Quantity ($/PC) or 1 ($Lot) |
| Order_P | money | Unit price ($/PC) or lot total ($Lot) |
| Order_PU | tinyint | 3 = $/PC, 4 = $Lot (see PU table below) |
| Due_Min / Due_Max | datetime | Vendor promised ship window; both NULL prints "ASAP" |
| HPA_Due_Min / HPA_Due_Max | datetime | HPA expected receive-by. Auto: HPA_Due_Min = later of Due_Min/Due_Max (or order date if ASAP); HPA_Due_Max = same or NULL |
| First_Due_Max | datetime | Snapshot of first HPA due (HPA_Due_Max if set else HPA_Due_Min) |
| JobNumber | varchar(20) | Optional quote/reference number |
| ShipVia | varchar(20) | Carrier/routing if quoted |
| p_lb | money | $/Lb — set to Order_P when Order_PU=1; else 0 |
| p_pc | money | $/Pc — set to Order_P when Order_PU=3; else 0 |
| p_ft | money | $/Ft — set to Order_P when Order_PU=2; else 0 |
| lotp | money | $Lot — set to Order_P when Order_PU=4; else 0 |
| OtherP / OtherFld | money / varchar(10) | Per-line **Other Price** only (Cutting, box, skid, packaging). Not unit price. **Not freight.** 0 / '' when none |
| Terms | varchar(50) | Payment terms; blank falls back to printed "Terms: Net 30" |
| FOB | varchar(50) | FOB point; suppressed on print when empty |

### Header — dbo.PO_No (after line insert)

| Column | Type | Source |
|---|---|---|
| Est_Frght | money | Quoted **Estimated Freight**. Header-level only. UI: Ship to Addr → `txtEst_Frght`. Never store freight in `PurchaseOrder.OtherP` |

### Fixed or computed by the skill

| Column | Value | Notes |
|---|---|---|
| Equipment | 1 | Drives the "Equipment or Service" print layout |
| SOitem | `'Equipment'` | Form save when Equipment and SalesNum=0 (also LabService / ConvertSVC / Service / STOCK for other types) |
| Services / ConvServ / IntP | 0 | Equipment excludes Services (form validation blocks the combo) |
| HPApo | MAX(HPApo)+1 | Form rejects > MAX+20 |
| POitem | dbo.f_ProperPOitem('HPApo-line') | char(12): 9-char right-aligned PO + '-' + 2-digit item |
| ItemPO | 1, 2, 3... | Line sequence |
| OrderDate | GETDATE() | Prints via TTOD(OrderDate) |
| Pieces | >= 1 | Form forces 1 when 0 for equipment |
| Stock | 'No Stock' | Equipment never enters the stock list |
| StockLst_QTY / StockLst_P / StockLst_PU | **Same as Order_QTY / Order_P / Order_PU** | Equipment is No Stock — mirror vendor UOM. Never hardcode StockLst_QTY=1 unless Order_PU=$Lot. Metal stock POs still follow Form accounting PU. |
| ShipWhere | 5 | Default Loc2 (Windfall). Use 1 for Loc1. See ShipWhere / plant address section |
| POshipaddr | 2 | Required for Print. Loc1→1, Loc2→5→2, Direct→customer ShipCode |
| POpayaddr | 2 | Bill-to SoldAddr. Loc1→1, Loc2→2 (from CompanyProfile BillTo) |
| POSalesP | varchar(20) | Vendor contact / "Buy from name" (not the HPA SP) |
| SalesP | char(1) | HPA sales-person initial (e.g. D for David) — ask if unknown |
| SalesNum / Item | 0 / 0 | Unless tied to a sales order (then SOitem is a real SO item, not 'Equipment') |
| Alloy, Form, CC, CL, Thck, Sz2, Sz3, DispAlloy, Cond_Spec | '' / 0 | Ignored and suppressed for equipment |
| Amendment, WO, WO_Detail, Pounds, Delivered | 0 | |
| WhoInsert | SYSTEM_USER | Audit |
| Cert, Cmplt, Cancelled, Randlen, OddCut, Metric, Printed, Reconciled, ReconcileTotal, BMScheck, VendorPOConf, IntP | 0 | NOT NULL in ERP_2 with no defaults — must appear in the INSERT |

Never insert into `StockLst_Total` or `DescriptID` — computed columns.

## Lookup codes

### PU (price unit) — dbo.PU

| PU | Unit | Use for equipment |
|---|---|---|
| 3 | $/PC | Per-piece pricing (most common in live data) |
| 4 | $Lot | Lot pricing; Order_QTY = 1 |

(1 = $/Lb, 2 = $/Ft, 5-10 exist but are not used for equipment.)

### ShipWhere

| Code | Meaning | Print / form effect |
|---|---|---|
| 1 | ERP_Loc1 | Form loads `ShipAddr` **1**; Print requires `POShipAddr = 1` |
| 2 | Direct | Prints ShipAddr row from POshipaddr (customer) |
| 3 | Direct blind | ShipAddr + "BLIND SHIP" stamp |
| 4 | Service | |
| 5 | ERP_Loc2 | Form loads `ShipAddr` **2**; Print requires `POShipAddr = 2` |
| 6 | Remote stock | |

Live equipment POs (HPAlloy): most use 1; Windfall uses 5.

### Plant addresses ↔ Company Profile

`dbo.CompanyProfile` (CompanyId=1) stores company BillTo / ShipTo defaults.
Reserved plant codes (not customer ship-tos) are kept in sync by
`MEM\SQL\Create ERP_new\26_Seed_Plant_ShipBill_Addresses.sql`:

| Code | Table | Source |
|---|---|---|
| 1 | ShipAddr | Loc1: CompanyProfile Addr* if set, else ShipTo* |
| 2 | ShipAddr | CompanyProfile ShipTo* |
| 1 | SoldAddr | CompanyProfile BillTo* (POpayaddr for Loc1) |
| 2 | SoldAddr | CompanyProfile BillTo* (POpayaddr for Loc2) |

Print PO (`cmdPrintPO.Click`) aborts if `POShipAddr` is empty — plant
ShipWhere alone is not enough.

## dbo.PO_No header

One row per HPApo, auto-created by the `PurchaseOrder_Insert` trigger.
Columns: `HPAPO`, `PO_Rev` (prints "Ver n" when > 0), `Cancelled`,
`Changing`, `Printed`, `Reconciled`.

## What purchaseorder26.frx prints (per band)

Report cursors required open at print time: `PurchaseOrder` (filtered to the
HPApo), `PO_No`, `ShipAddr`, `Vendor`, `VendorContact` — the ERP's PrintPO
method opens all five before `REPORT FORM`.

| Area | Expression | Suppressed when |
|---|---|---|
| PO number | STR(HpaPo)+'-'+STR(SalesNum)+SalesP; ItemPO per line | never |
| Revision | 'Ver '+STR(PO_No.PO_Rev) | PO_Rev = 0 |
| Vendor block | Company; VendorContact.addr1/addr2/city/st/zip/country; phone/fax/email; Sales Person = POSalesP | per-line when NULL or empty. **Incomplete VendorContact address is a data defect — fix Contact before reprinting.** |
| Vendor Phone/Fax/Cell | Digits only in VendorContact.Phone/Fax/CellPhone (10 US digits). Report masks `(123) 456-7890`. Never store dotted/float phones. | |
| Ship-to Tipton | hard-coded address block | ShipWhere >= 2 |
| Ship-to direct | shipaddr.company/addr1/addr2/city+st+zip+country; BLIND SHIP | ShipWhere <= 1 |
| Order Date | TTOD(OrderDate) | never |
| Ship Date Required | DTOC(Due_Min)-DTOC(Due_Max), 'ASAP' when both empty | never (text varies) |
| Item header | "Equipment or Service" / "Pc" / "Est Cost" captions | NOT (Services OR Equipment OR ConvServ) |
| Description | ALLTRIM(Misc_Purch) | LEN(Misc_Purch) = 0 |
| Type line | 'Type: '+Get_POitem_Type(POitem) | |
| Pieces | Pieces | EMPTY(Pieces) |
| Est Cost | Order_QTY*Order_P + OtherP | total <= 0 |
| Qty/price string | Get_PU_Price_String(Order_PU, Order_QTY, Order_P) | |
| Adder | Remove0(OtherP)+' '+OtherFld | OtherP <= 0 (Other Price fees; not freight) |
| Est Freight | PO_No.Est_Frght | header; Ship to Addr tab |
| Terms / FOB / ShipVia | field values | each when empty |
| Job Number | JobNumber | blank |
| Sales Person | SalesRepfromSO(SalesNum) | SalesNum = 0 |
| WO / WOD | 'WO:'+STR(WO) | WO = 0 / WO_Detail = 0 |
| Buyer | POSalesP over "PURCHASING AGENT" | never |
| MTR/QA clauses 1-5 | DFARS, traceability, mercury-free text | Equipment OR IntP = 1 (skipped for equipment) |
| Cancelled stamp | "ITEM CANCELLED" | not cancelled |

Material block (alloy, form description, dims via Descript()) is fully
suppressed for equipment items, so blank metal fields are safe.
