# Plan: Remove SQL columns marked Depricate / Deprecated

Status: **plan only** (2026-08-02)  
Source of truth: SuperMicro `SAUSA` → `sys.extended_properties` (`MS_Description` containing `depricat` / `deprecat`)  
Product: SAUSA-ERP (VFP + SQL-ERP_2)

## Goal

Drop every table column whose SSMS **Column Properties → Description** (`MS_Description`) marks it as deprecated / “depricate”, after proving nothing live still needs it.

## Inventory (live SuperMicro)

**75 columns** across **25 tables** (description match is case-insensitive `depricat%` / `deprecat%`).

| Table | # | Columns (replacement note from description) |
|-------|---|-----------------------------------------------|
| `Sales` | 18 | `Heat`, `QShipped`, `QBackOrder`, `PT_*`, `StkPaid`, `Selected_QTY`, `Shipped_QTY`, `conver*`, `IntP` — several note Report Server still needed |
| `Sales_Stock` | 9 | `StockLst_Qty/P/Total/PU/PC/Dim1/Dim2/Dim3/LBS` |
| `StockLst_Process` | 7 | `PWeight`, `PPc`, `PFT`, `QTY_Due`, `Prc_QTY`, `Prc_Q_QTY`, `Prc_Q_PU` |
| `Vendor` | 7 | `Contact`, `custId`, `email`, `fax_number`, `telephone`, `vend_type`, `Vendor_ID` |
| `BrokerLst_Process` | 3 | `PWeight`, `QTY_Due`, `Prc_QTY` |
| `PurchaseOrder` | 4 | `p_lb`, `p_pc`, `p_ft`, `lotp` → use `Order_P` |
| `StockLst_Detail` | 3 | `CostValue` → `S_P`; `Length`; `Unit` → `S_PU` |
| `WIPLst_Detail` | 3 | `CostValue`, `Length`, `Unit` |
| `Cert_Conf_No` | 3 | `CoC`, `LLMA`, `FFF` |
| `VendorContact` | 3 | survey date fields |
| `Receiving` | 2 | `RejectPC`, `form` |
| `PriceTable` | 2 | `h0`, `hist` |
| `UPSshiproute` | 2 | `shiproute`, `upsstand` → `UPSStdShipRoute` |
| `Sales_PS` | 1 | `Acct_P` |
| `PackingSlip` | 1 | `PackedWeight` |
| `Stocklst_Master` | 1 | `Num` |
| `StockLst_Process_Grab` / `BrokerLst_*` / `WIPLst_*` / `Ar_BrokerLst_*` | 1 each | mostly `PWeight` / `QTY_Due` |
| `Vendor_Invoice_Detail` | 1 | `PU` |
| `WorkOrder_Stock` | 1 | `TBL` |

Full query (re-run anytime):

```sql
SELECT OBJECT_NAME(ep.major_id) AS tbl,
       COL_NAME(ep.major_id, ep.minor_id) AS col,
       CAST(ep.value AS nvarchar(400)) AS descr
FROM sys.extended_properties ep
WHERE ep.class = 1 AND ep.minor_id > 0 AND ep.name = N'MS_Description'
  AND (CAST(ep.value AS nvarchar(400)) LIKE N'%depricat%'
    OR CAST(ep.value AS nvarchar(400)) LIKE N'%deprecat%')
ORDER BY tbl, col;
```

### Explicitly **not** in this list (handle separately if desired)

WO material work already targets these, but they may lack a “depricate” description:

- `WorkOrder_Detail.fSOitem` (replaced by `WorkOrder_Detail_SO`)
- Any column only marked deprecated in comments/code, not `MS_Description`

Do **not** drop those under this plan unless they get a description tag or a separate ticket.

---

## Principles

1. **Description alone is not a drop warrant.** Many tags are aspirational; VFP / views / Report Server still bind them.
2. **Never drop on BobWhite first.** SuperMicro → domain test → Production.
3. **One wave per risk tier.** Fail a dependency check → stay in that wave; do not bulk-drop.
4. **Archive tables (`Ar_*`)** follow live tables only after live is clean (or drop in same script if unused).
5. **Create path** (`01_02` / `01_05` extended props) must stop creating dropped columns so new builds match.

---

## Phases

### Phase 0 — Catalog + dependency matrix (1–2 days)

For each of the 75 columns, record:

| Check | How |
|-------|-----|
| Nullability / default / identity | `sys.columns` |
| Indexes / keys / FKs / stats | `sys.index_columns`, `sys.foreign_keys` |
| Views / procs / triggers / functions | `sys.sql_modules` search `Table.Col` + `referenced_entities` |
| VFP bind | ripgrep `Forms\`, `PROGS\`, `REPORTS\`, `LIBS\` |
| Report Server | note Sales `conver*` descriptions; inventory SSRS if available |
| Data still populated? | `% non-null` / last-write sample |

Deliverable: spreadsheet or SQL table `dbo._DeprecateColumnAudit` with columns  
`TableName, ColumnName, Descr, VfpHits, SqlHits, Risk (L/M/H), Wave, Replacement, DropReady bit`.

Script home: `SQL\Config\3x_Deprecate_Column_Audit.sql` (read-only inventory).

### Phase 1 — Stop writing (app + SQL) before drop

For each “DropReady” column:

- VFP: stop SELECT/INSERT/UPDATE of the column (prefer replacement).
- SQL: stop triggers/procs writing it; dual-read from replacement where needed.
- Leave column in place (nullable) until Wave drop.

Priority stop-writes already in flight:

| Column | Replacement | Status |
|--------|-------------|--------|
| `StockLst_Detail.CostValue` / WIP twin | `S_P` / `S_QTY` / `S_Total` | New UI done; old paths remain |
| `WorkOrder_Detail.fSOitem` | `WorkOrder_Detail_SO` | Outside this description list — parallel track |

### Phase 2 — Drop waves (Config scripts)

Each wave = Config script + Create mirror + Migration stamp + RUN-ORDER entry.  
Pattern: `Config\32_Drop_Deprecated_<Wave>.sql`.

Suggested waves (adjust after Phase 0):

| Wave | Scope | Why first / later |
|------|--------|-------------------|
| **W1 – Safe-ish process leftovers** | `StockLst_Process.QTY_Due` (desc: purged VFP 12/2023), matching Broker `QTY_Due` / Ar history if unused | Already claimed unused |
| **W2 – Process weight/qty aliases** | `PWeight`, `PPc`, `PFT`, `Prc_QTY`, `Prc_Q_*` on Stock/Broker/WIP process + grab | High VFP risk — audit hard |
| **W3 – Stock detail legacy** | `StockLst_Detail` / `WIPLst_Detail`: `CostValue`, `Length`, `Unit` | Core inventory; many reports |
| **W4 – Sales_Stock denorm** | `Sales_Stock.StockLst_*` | Likely still filled at choose-stock |
| **W5 – Sales buckets** | `Selected_QTY`, `Shipped_QTY`, `StkPaid`, `PT_*`, `Heat`, `QShipped`, `QBackOrder`, `IntP` | Functions/reports |
| **W6 – Sales conversion Report Server** | `converpo`, `converter`, `conversion`, `converfrt`, `conversent`, `converretu` | Descriptions say Report Server needs them — **block until SSRS cleared** |
| **W7 – PO price crumbs** | `PurchaseOrder.p_lb/p_pc/p_ft/lotp` | Confirm `Order_P` everywhere |
| **W8 – Vendor contact crumbs** | `Vendor.*`, `VendorContact` survey dates, `Vendor_Invoice_Detail.PU` | Confirm Vendor maint uses new tables |
| **W9 – Misc** | `Receiving.form/RejectPC`, `PackingSlip.PackedWeight`, `PriceTable.h0/hist`, `Cert_Conf_No.*`, `UPSshiproute.*`, `WorkOrder_Stock.TBL`, `Stocklst_Master.Num`, `Sales_PS.Acct_P` | One-offs |

Per-column drop recipe:

```sql
-- after dependency clear
ALTER TABLE dbo.<T> DROP CONSTRAINT <default_if_any>;  -- if named default
ALTER TABLE dbo.<T> DROP COLUMN <C>;
```

If drop fails (index/view): fix dependency in same wave, re-run.

### Phase 3 — Create / mirror hygiene

- Remove columns from `Create ERP_new\01_02 … tables …`
- Remove `MS_Description` from `01_05 … extended properties …`
- Update views in `04 Create new ERP Views.sql` that still project them
- Triggers in `01_04` that UPDATE those columns
- Archive fill scripts if they INSERT into dropped columns

### Phase 4 — Verify

| Env | Check |
|-----|--------|
| SuperMicro | Config wave applied; ERP smoke (Stock, Sales, PO, Receive, WO) |
| Domain test (optional) | Same Config on SA-WS-DK-26 |
| BobWhite | Config wave only after SuperMicro green; no Create rebuild |

Also: build EXE after VFP stop-write changes; GPO MSI only if user-facing.

---

## Risk notes (do not ignore)

1. **`Sales.conver*`** — description explicitly says Report Server may still need them. Hold Wave 6 until SSRS inventory is empty.
2. **`CostValue` / `Unit` / `Length`** — still referenced in VFP (`proc_sql`, quotes, receipts) and SQL functions (`f_CalcStkCost`, etc.). Wave 3 is large.
3. **`Vendor` contact columns** — may still be UI-bound even if “Depricated”; confirm Vendor form uses `VendorContact` / phones tables.
4. **`PurchaseOrder.p_*`** — equipment/legacy PO UI may still show them; confirm `Order_P` path.
5. **History / archive** — dropping live without Ar_* leaves odd schema drift; prefer paired drops.

---

## Recommended first concrete step

1. Run Phase 0 audit script on SuperMicro → produce `_DeprecateColumnAudit` with VfpHits/SqlHits.
2. Pick **Wave 1** candidates where both hit counts = 0 (likely `QTY_Due` family).
3. Stop-write + drop Wave 1 on SuperMicro only; watch Errors table for a week.
4. Only then schedule Wave 2+.

## Out of scope for this plan

- Renaming misspelled “depricate” → “deprecated” in descriptions (optional cleanup).
- Dropping entire unused tables.
- Chatter / burden / WO ledger work.

## Decision needed from you

1. **Include Report Server columns (`Sales.conver*`)** in scope, or permanently exclude until SSRS is retired?
2. **Archive `Ar_*` columns**: drop with live wave, or leave forever?
3. **Also tag/drop `WorkOrder_Detail.fSOitem`** under a parallel WO cleanup wave?

When you answer those three, Phase 0 audit script can be written next.
