# ERP_2 slow project build — avoid VFP C0000005

Work in **erp_2.pjx** only. Do **not** bulk-copy ERP.PJ2 / all 579 members.

## Why crashes happen

- One of the 118 missing members (or a bad **erp_2.pjt** memo) can trigger C0000005 on BUILD or project save.
- **erp_2.pjt** grew to ~2.67 MB from test builds; the good archive is **2,419,565** bytes.
- After each BUILD, restore the clean PJT — the **PJX** keeps members you successfully added.

## One-time cleanup (optional)

In VFP command window:

```foxpro
DO tools\erp_2_slow_add WITH "RESTORE_PJT"
DO tools\erp_2_slow_add WITH "CLEAN_JUNK"
```

`CLEAN_JUNK` removes 15 rows that are in erp_2 but **not** in ERP-crash (e.g. `forms\erp_certs.scx`, duplicate VCX under `forms\`).

## Daily workflow (visual)

1. Close **erp_2** in Project Manager if open.
2. In VFP command window:

```foxpro
DO tools\erp_2_slow_add WITH "STATUS"
```

3. Add and test **one** queued item:

```foxpro
DO tools\erp_2_slow_add WITH "NEXT"
```

   Or from Windows: `tools\run_erp_2_slow_add_next.bat`

4. **BUILD PASS** — member stays in erp_2.pjx; PJT reset to archive.
5. **BUILD FAIL** — member removed from erp_2.pjx; logged; you fix or exclude that file later.

Skip without testing:

```foxpro
DO tools\erp_2_slow_add WITH "SKIP"
```

Restore PJT only:

```foxpro
DO tools\erp_2_slow_add WITH "RESTORE_PJT"
```

## Queue

**118 items** to add (safest first): `tools\erp_2_add_queue.txt`  
Progress index: `tools\erp_2_slow_add_state.txt`  
Results: `tools\erp_2_slow_add_results.csv`

Order: includes → graphics → PRGs → menus → libs → reports → forms → `scan.exe` last.

## IDE tips

- **Recompile all: OFF** before BUILD EXE.
- If VFP shows a fatal error after BUILD but `erp_2.app` was created, check CSV — may still be PASS.
- Compare anytime: `MEM\ERP2_vs_ERP-crash_files.txt`

## Reference

- Full production list: **ERP-crash** / **ERP.PJ2** (579 members) — use as catalog, not bulk import.
- Current erp_2: **476** members + queue adds one at a time.
