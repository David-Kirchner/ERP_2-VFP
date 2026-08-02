# WO / SO Material Accounting — Build Spec

Status: approved design (2026-08-01); **P0 applied on SuperMicro**  
Product: SAUSA-ERP (VFP + `SAUSA` SQL)  
SQL: `Config\24_WorkOrder_Material_Accounting.sql` (BobWhite: run from domain PC when ready)

## Goals

1. **WO Material screen** — enter WO #; see consume → processes → finish; pounds and % loss; Linear vs Split look different.
2. **SO History screen** — enter Sales #; chronology + money page.
3. **Cost truth** — Detail `S_P` / `S_QTY` / `S_Total`; Master `Paid` = landed average; deprecate `CostValue` in new UI.
4. **WO complete → Stock** + **email** SalesP + foreman when linked SOitems can finish.
5. **Many SOitems** per finish Detail (remove reliance on `WorkOrder_Detail.fSOitem`).

---

## Locked business rules

| # | Rule |
|---|------|
| Shape | `L` = Linear (one bar through processes). `S` = Split (fork to multiple finish sizes/Lots). Different UI. |
| Property-changing | GFM, Swage, HT, Draw, Roll, Wire, Lake Erie → **new machine Lot**. |
| Non-property | Cut, CG (centerless), turn, straighten, UT → **same Lot**; ledger rows only (**no** new log tables). Code is **`CG`** (not CLG). |
| Split remnant | Good leftover → **StockLst**, same Heat/Lot. Loss → SCRAP/SPECIMEN allocation. |
| Balance | Split pool: branches + scrap + remnant = grab lb within **± 1 lb** or WO cannot complete. |
| SO link | **Many** SOitems ↔ one `WO_Detail`. Do not use `fSOitem` as the link (deprecate in UI; stop writing). |
| Alerts | **Email now**; Chatter = future. |
| Cost | Inventory: `S_P`×`S_QTY`=`S_Total`. `Paid` = landed (metal+box+freight+surcharge) avg per QTY. `CostValue` deprecated. |
| AcctCosting | Accountant-approved $. Time × $/Hr by process = **future**. |

---

## Schema

### 1. `dbo.WorkOrder` — add

| Column | Type | Notes |
|--------|------|--------|
| `WO_Shape` | `char(1) NOT NULL DEFAULT 'L'` | `L` Linear, `S` Split |
| `GrabLb` | `numeric(9,1) NULL` | Pounds consumed from inventory (authoritative start for %). |
| `GrabHeat` | `varchar(50) NULL` | Copy of consume Heat (also `sHeat`). |
| `GrabLot` | `char(10) NULL` | Consume Lot (also `sLot`). |
| `GrabTBL` | `char(1) NULL` | `S`/`B` source list. |
| `GrabID_Detail` | `int NULL` | Source Detail consumed. |
| `PoolClosed` | `bit NULL` | Split: pool reconciled within ±1 lb. |

Existing: `StkConsumed`, `sWeight`, `sHeat`, `sLot`, `sID_Detail`, `TBL`, `WorkOrder_Stock`. Prefer filling Grab* at consume time; keep legacy columns in sync during transition.

### 2. `dbo.WorkOrder_Detail` — add

| Column | Type | Notes |
|--------|------|--------|
| `DetailRole` | `char(1) NOT NULL DEFAULT 'F'` | `F` Finish product, `R` Remnant (return to stock), `X` Scrap/specimen pool row (optional header scrap detail). |
| `BranchFrom_WO_Detail` | `int NULL` | Parent detail at fork (null = root/linear). |
| `BranchSeq` | `smallint NULL` | Display order under fork. |
| `BranchStartLb` | `numeric(9,1) NULL` | Lb allocated into this branch at split. |
| `CurrentLot` | `char(10) NULL` | Active Lot on this detail (char to match Master.Lot; machine log Lot int stays on Follow/Finish). |

**Deprecate in app (do not drop yet):** `fSOitem` — stop binding; migrate readers to `WorkOrder_Detail_SO`.

Keep: `FinishM`/`FinishLot`, `FollowM`/`FollowLot`, `fHeat`/`fLot`, `fWeight`/`TotFinishW`/`LostWeight`, `stkListed`, `fID_Detail`, `fTBL`, size/form fields.

### 3. NEW `dbo.WorkOrder_Detail_Process` — process ledger

Spine for both shapes. Cut/grind/UT live here only.

| Column | Type | Notes |
|--------|------|--------|
| `ID` | `int IDENTITY PK` | |
| `WO` | `int NOT NULL` | |
| `WO_Detail` | `int NOT NULL` | |
| `Seq` | `smallint NOT NULL` | Order within detail. |
| `ProcessCode` | `varchar(20) NOT NULL` | See catalog below. |
| `ChangesProperties` | `bit NOT NULL` | 1 → new Lot expected. |
| `Machine` | `varchar(20) NULL` | When linked to machine log. |
| `Lot` | `char(10) NULL` | Lot identity after this step. |
| `LotPrior` | `char(10) NULL` | Lot before step (property change). |
| `StartLb` | `numeric(9,1) NOT NULL` | |
| `EndLb` | `numeric(9,1) NOT NULL` | |
| `ScrapLb` | `numeric(9,1) NULL` | Default 0. |
| `SpecimenLb` | `numeric(9,1) NULL` | Default 0. |
| `WhenStart` | `datetime NULL` | |
| `WhenEnd` | `datetime NULL` | |
| `Who` | `varchar(50) NULL` | |
| `LogTable` | `varchar(40) NULL` | e.g. `GFMlog` — null for cut/CLG/UT. |
| `LogKey` | `int NULL` | Lot or log PK. |
| `WIP_ID_Detail` | `int NULL` | WIPLst_Detail during work. |
| `Notes` | `varchar(200) NULL` | |
| **Future** `Minutes` | `numeric(9,1) NULL` | Time at process. |
| **Future** `BurdenRate` | `money NULL` | Snapshot $/Hr. |
| **Future** `BurdenCost` | `money NULL` | Minutes/60 × rate. |

**Computed (view, not stored):**  
`LossLb = StartLb - EndLb` (or StartLb - EndLb - explicit scrap if End already net).  
`PctOfGrab = LossLb / WorkOrder.GrabLb * 100`  
`PctOfStep = LossLb / NULLIF(StartLb,0) * 100`

### 4. NEW `dbo.WorkOrder_ProcessCode` — catalog

| Column | Type | Notes |
|--------|------|--------|
| `ProcessCode` | `varchar(20) PK` | |
| `Caption` | `varchar(40)` | |
| `ChangesProperties` | `bit` | |
| `IsAlloc` | `bit` | Split ALLOC/SCRAP/SPECIMEN/REMNANT |
| `InUse` | `bit` | |
| **Future** `DefaultRateCode` | `varchar(20)` | Link to $/Hr table |

Seed (minimum):

| Code | ChangesProperties | Notes |
|------|-------------------|--------|
| `CONSUME` | 0 | Off Stock/Broker → WIP |
| `GFM` | 1 | Machine log |
| `SWAGE` | 1 | |
| `HT` | 1 | |
| `DRAW` | 1 | |
| `ROLL` | 1 | |
| `WIRE` | 1 | |
| `LAKEERIE` | 1 | |
| `CUT` | 0 | Ledger only |
| `CG` | 0 | Centerless grind |
| `TURN` | 0 | |
| `STRAIGHTEN` | 0 | |
| `UT` | 0 | |
| `ALLOC` | 0 | Split: lb into a branch |
| `SCRAP` | 0 | Cups / grind loss / scrap |
| `SPECIMEN` | 0 | Test piece |
| `REMNANT` | 0 | Return good lb to Stock same Heat/Lot |
| `LIST_STOCK` | 0 | `StockLstAdd_WOD` / INCOMING |
| `RECV_STOCK` | 0 | Shop receive of finish |

### 5. NEW `dbo.WorkOrder_Detail_SO` — many SOitems

| Column | Type | Notes |
|--------|------|--------|
| `WO_Detail` | `int NOT NULL` | |
| `SOitem` | `char(10) NOT NULL` | |
| `LbPlanned` | `numeric(9,1) NULL` | Optional |
| `WhoAdd` | `varchar(50) NULL` | |
| `WhenAdd` | `datetime NULL` | |
| PK | `(WO_Detail, SOitem)` | |

Migration: insert from `WorkOrder_Detail.fSOitem` where non-blank; also from `Sales.WO_Detail` where set.

Stop writing `fSOitem` in new forms; keep column for old reports until cleaned.

### 6. Burden + Chatter (P7/P8)

- `dbo.Process_Burden_Rate` — **done** (`Config\29`)
- Minutes on ledger → `BurdenCost` → `p_WO_Propose_Burden_Acct` → `AcctCosting.ApprovedAmt` — **done**
- Chatter alerts — **stub only** (`Config\30`, `CHATTER_DEFERRED`); no Chatter app yet

### 7. Cost fields — UI policy

| Use | Field |
|-----|--------|
| Inventory unit/total | `StockLst_Detail.S_P`, `S_QTY`, `S_Total` |
| Landed buy context | `StockLst_Master.Paid` (avg per QTY incl. box/freight/surcharge) |
| Accountant approved | `AcctCosting` (existing table/columns as used today) |
| Do not use | `CostValue` (deprecated; hide in new screens) |

---

## Pool math (Split)

At any time:

```
GrabLb
  = SUM(Finish branch BranchStartLb or current EndLb chain)
  + SUM(SCRAP + SPECIMEN lb)
  + RemnantLb
```

**Complete allowed only if** `ABS(GrabLb - accountedLb) <= 1.0`.

Remnant path: `REMNANT` ledger row + list/receive to StockLst with **same** `GrabHeat` / Lot (or CurrentLot if unchanged).  
Finish branches: each `DetailRole='F'` → own FinishLot → own StockLst row.

**Linear → Split:** only via explicit **Split bar…** action: set `WO_Shape='S'`, create child Details + ALLOC rows; lock Linear timeline page.

---

## Screens

### A. WO Material (`Forms\WO_Material.SC2` + thin `PROGS\WO_Material.prg`)

**Entry:** WO number.

**Header (both shapes):** WO, Shape badge (**LINEAR** / **SPLIT** — different color), Grab Heat/Lot/Lb/source ID, Pool balance (Split), StkConsumed, Cmplt.

#### A1. Linear page (`WO_Shape='L'`)

- One vertical grid: Seq | Process | Lot | StartLb | EndLb | LossLb | %Grab | %Step | When | Who  
- Footer: GrabLb, FinishLb, Lost total, listed/received IDs  
- Buttons: open machine log (if LogKey), open WIP/Stock detail, open linked SOitems

#### A2. Split page (`WO_Shape='S'`) — must not reuse Linear layout

- Top: **Pool** bar — GrabLb vs Allocated / Scrap / Remnant / Unaccounted (±1)  
- Tree or stacked cards:
  - Branch Detail # — size/form — FinishLot — BranchStartLb → chain grid (same columns as Linear)
  - Remnant card — Lb → Stock ID when returned
  - Scrap lines
- Complete blocked if `|Unaccounted| > 1`

Launcher: menu under Production / Work Order. Read-only v1 OK; write ledger in v2.

### B. SO History (`Forms\SO_History.SC2` + `PROGS\SO_History.prg`)

**Entry:** Sales number (and optional SOitem filter).

#### Page 1 — Chronology

Union/view ordered by `When`:

| EventType | Sources (initial) |
|-----------|-------------------|
| Quote | `AllQuotes` |
| SO created | `Sales` / `Sales_No` |
| Stock SELECTED | `StockLst_Process` / `Ar_*_Process_History` |
| Stock chosen | `Sales_Stock` |
| WO consume | `WorkOrder_Stock` / ledger `CONSUME` |
| WO process | `WorkOrder_Detail_Process` |
| Listed / received | Stock INCOMING / `Receiving` |
| Packed | `PackingSlip` |
| Invoiced / paid | `Sales_Invoice` |

Grid: When | Event | Heat | Lot | Lb | Ref (WO/Detail/PS/Inv) | Who

#### Page 2 — Money

Per SOitem (and SO total):

| Line | Source |
|------|--------|
| Stock cost | Sum consume `S_P`/`S_QTY`/`S_Total` (not CostValue) |
| Paid context | Master `Paid` note |
| AcctCosting | Approved $ if present; else “not approved” |
| Sales price | `Sales` sell totals |
| QBO billed | `Sales_Invoice.Amount` |
| QBO paid | `Sales_Invoice.Paid` |
| Margin | Sales − (AcctCosting if set else stock cost) |

Future column placeholder: process burden (hidden until rates exist).

### C. Existing WO form changes (later phase)

- Create/edit: choose or default `WO_Shape`; Split bar action.
- Stop writing `fSOitem`; maintain `WorkOrder_Detail_SO`.
- On consume: write Grab* + ledger `CONSUME`.
- On machine lot create: ledger row + Lot change.
- On cut/CLG/UT: force StartLb/EndLb ledger entry — **P6 done** (`cmdLogProcess` on WO form).
- On list/receive finish: `LIST_STOCK` / `RECV_STOCK`; email links.

---

## Email alert (receive finish)

**Trigger:** finish Detail receive (`RECV_STOCK` / existing Receive path when `stkListed` stock gets good Heat/Lot).

**Recipients:** SalesP for each linked SOitem (via `WorkOrder_Detail_SO` → Sales/customer sales rep) + shop foreman (config: CompanyProfile or AppSetup email).

**Body:** WO, WO_Detail, Heat, Lot, Lb, list of SOitems, “material received — order(s) can complete.”

**Dev (SuperMicro):** no send (existing no-mail policy).  
**Prod:** Database Mail when configured.  
**Future:** Chatter copy of same event.

---

## SQL views (suggested)

| View | Purpose |
|------|---------|
| `v_WO_Material_Header` | WO + Grab + shape + pool totals |
| `v_WO_Material_Steps` | Ledger + % of grab/step |
| `v_WO_Pool_Balance` | Split accounted vs GrabLb |
| `v_SO_History_Events` | Chronology union |
| `v_SO_History_Money` | Cost / sale / invoice / paid by SOitem |

Scripts live in OneDrive SQL repo (`SQL-ERP_2`), not under `MEM\SQL`.

---

## Phased build order

| Phase | Deliverable |
|-------|-------------|
| **P0** | SQL: columns, `WorkOrder_Detail_Process`, `WorkOrder_ProcessCode` seed, `WorkOrder_Detail_SO` + migrate `fSOitem` / `Sales.WO_Detail` — **done** as `Config\24_WorkOrder_Material_Accounting.sql` (+ `Create ERP_new\33_…`, `Migrations\20260801_…`) |
| **P1** | Views + **WO Material** read-only (Linear + Split layouts) — **done**: `Forms\WO_Material.SC2`, `PROGS\WO_Material.prg`, menu **WO Material**, `Config\25` header view; SuperMicro demo WO **1000** (LINEAR) / **1001** (SPLIT) |
| **P2** | **SO History** chronology + money — **done**: `Forms\SO_History.SC2`, `PROGS\SO_History.prg`, menu **SO History**, `Config\26` views + `ApprovedAmt`; demo SalesNum **91000** |
| **P3** | Write path — **done**: `Config\27` procs; `proc_wo` helpers (`WO_Ledger_Add`, `WO_SetGrab`, `WO_Pool_CanComplete`, `WO_Split_Alloc`); hooks in `Modify_Stock4Order` (CONSUME/REMNANT) + `workorder` (machine lot, LIST_STOCK, Complete pool gate) |
| **P4** | Receive finish — **done**: `Config\28` (`p_WO_Refresh_Selected_SO`, `p_WO_Recv_Stock_Notify`, `WO_Alert_Log`, `ForemanEmail`); `WO_Recv_Finish` in `proc_wo`; hook `Recv_Stock.SaveAdd` after commit (RECV_STOCK + SELECTED + email; Dev no-op) |
| **P5** | WO form UX — **done**: `lblShape` LINEAR/SPLIT badge + pool hint; `cmdSplitBar` → `WO_Split_Alloc`; hide `fSOitem`; `WO_Detail_SO_Upsert` + dual-write from CONNECT ORDERS / SaveAddDetail |
| **P6** | Cut/CG/UT StartLb/EndLb on WO form - **done**: `cmdLogProcess` → `WO_Log_Lb_Process` / `WO_Ledger_Add` (same Lot; scrap = Start-End); codes CUT/CG/UT/TURN/STRAIGHTEN |
| **P7** | **A – Burden** — **done**: `Process_Burden_Rate` + `@Minutes` on ledger insert; `p_WO_Propose_Burden_Acct`; Minutes prompt on `cmdLogProcess` |
| **P8** | **B – Chatter** — **done (stub)**: `WO_Alert_Log.Channel` + `p_WO_Alert_Chatter_Stub` (`CHATTER_DEFERRED`); called after receive email notify |
| **P9** | **C – Cleanup** — **partial**: `GetWO_SOitem` / `GetWOD_SOitem` prefer `WorkOrder_Detail_SO` (legacy `fSOitem` fallback). CostValue remains in old stock/quote paths until report audit; new screens already use `S_P`/`S_QTY`/`S_Total` |
| **Later** | Full Chatter app; rate maint form; drop `fSOitem`/`CostValue` columns after report audit |

---

## VFP UI conventions

- Visual forms under `Forms\` (`*.SC2`); thin PRG launchers.
- BIN2PRG before edit if SCX newer; PRG2BIN after SC2 edit.
- Pattern: `CompanyProfile_Maint` / `IsoDocument_maint`.

---

## Open implementation notes (non-blocking)

- Machine Lot is often `int` on logs; Master.Lot is `char(10)` — ledger stores char; convert consistently with existing WO FinishLot handling.
- `Sales.WO_Detail` remains a convenience pointer; authoritative many-link is `WorkOrder_Detail_SO`.
- Backfill ledger from GFMlog/HT_log/… where `WO_Detail` is populated — best-effort; gaps OK for historical WOs.
