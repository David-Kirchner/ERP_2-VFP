# Cert forms — downsizing and consolidation

## Active cert screen (2026-06-18)

**`Forms\sql_certs.scx`** is the single cert screen. All `DO FORM` launch points and menu items use it.

**Retired** (backed up to `Forms\backup_cert_forms_20260618\`):

- `erp_certs` — was downsized 2026-06-10; PRGs `erp_certs_check_spec.prg`, `erp_certs_addnewcert.prg` removed from `ERP.PJ2`
- `sql_certs21` — duplicate of sql_certs

## sql_certs downsizing (2026-06-18)

VFP 9 limits individual form methods in the `.sct` memo to ~64 KB. Three inline methods in `sql_certs` exceeded that limit and were extracted to PRGs:

| Method | Before | After (wrapper) | Extracted to |
|--------|-------:|----------------:|--------------|
| `addnewcert` | **65 KB** | 81 bytes | `PROGS\sql_certs_addnewcert.prg` |
| `savespacexhardness` | **100 KB** | 97 bytes | `PROGS\sql_certs_savespacexhardness.prg` |
| `frmCheckSpec.cmdCheck.Click` | **98 KB** | 108 bytes | `PROGS\sql_certs_check_spec.prg` |

**Tools**

- Extraction: `tools\extract_sql_certs_oversized.ps1`
- Pre-change backup: `Forms\SQL_certs.sc2.bak_presplit`
- Rebuild `.scx`: `DO tools\rebuild_sql_certs_form`
- Compile test: `tools\run_compile_sql_certs_test.vbs`

**Project entries** (in `ERP.PJ2`, alphabetical):

- `progs\sql_certs_addnewcert.prg`
- `progs\sql_certs_check_spec.prg`
- `progs\sql_certs_savespacexhardness.prg`

---

## Historical: erp_certs downsizing (2026-06-10)

### Root cause (VFP 9)

Individual form methods in the `.sct` memo can exceed ~64 KB, causing Error 1202, C0000005 during `COMPILE FORM` / `BUILD EXE`, or corrupt `ERP.PJT`.

### What was found in `erp_certs` (retired)

| Method | Lines | ~Size | Status |
|--------|------:|------:|--------|
| `frmCheckSpec.cmdCheck.Click` | 2,386 | **95 KB** | Extracted → `PROGS\erp_certs_check_spec.prg` |
| `addnewcert` | 1,991 | **86 KB** | Extracted → `PROGS\erp_certs_addnewcert.prg` |
| `savespacexhardness` | 1,365 | 48 KB | OK in form |

Backup: `Forms\backup_cert_forms_20260618\erp_certs.SC2.bak_presplit`

## Build steps

1. `tools\restore_erp_project.bat` — sets `sql_certs` exclude=F, retired forms exclude=T if still in PJX
2. VFP: open `ERP.PJX` — only `sql_certs` should be the cert form
3. **Build Executable** — **uncheck Recompile all**
4. Test: SQL Certs menu, HPA Certs, cert launch from manufacturing logs

## Techniques (VFP 9)

| Technique | Purpose |
|-----------|---------|
| Move large methods to `.prg` | Stay under 64 KB per compiled form method |
| Exclude huge forms from EXE | Ship `.scx`/`.sct` beside runtime |
| No "Recompile all" | Avoid recompiling oversized forms |
| Split formsets | One `.scx` per form |
