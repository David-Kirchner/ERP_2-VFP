# ERP_Test build experiment - results tracker
# VFP 9.2 | Project: ERP_Test.pjx | Method: add one form, COMPILE FORM, BUILD EXE
# User builds screens via Form Designer (drag-drop) only - this harness automates testing.

## How to run

```bat
REM Fast scan - COMPILE FORM every screen (~minutes)
E:\VFP\ERP_2\tools\run_erp_test_compile_all.bat

REM Incremental EXE build - one screen at a time (hours; resumable)
E:\VFP\ERP_2\tools\run_erp_test_build.bat

REM Resume from last form (state in tools\erp_test_state.txt)
E:\VFP\ERP_2\tools\run_erp_test_build.bat

REM Test only next 10 forms
E:\VFP\ERP_2\tools\run_erp_test_build.bat 10
```

## Output files

| File | Purpose |
|------|---------|
| `tools\erp_test_results.csv` | Machine-readable pass/fail per form |
| `tools\erp_test_harness.log` | Detailed log |
| `tools\erp_test_state.txt` | Last form tested (resume) |
| `tools\erp_test_form_list.txt` | 239 forms from ERP.PJ2 |

## Result codes

| Phase | Meaning |
|-------|---------|
| COMPILE_PASS | `COMPILE FORM` OK |
| COMPILE_FAIL | Form has compile error / oversized method |
| EXE_PASS | Added to ERP_Test + `BUILD EXE` produced fresh ERP_Test.app |
| EXE_FAIL | Build error (see detail column) |
| EXE_CRASH | VFP process died (likely C0000005) |
| MISSING | .scx not found on disk |

## Notes

- `Company_Icon.ico`: harness copies `ICO\earth-globe.ico` to `MEM\Company_Icon.ico` if missing.
- ERP-test base = all ERP.PJX files **except** forms; forms added one at a time.
- Missing dependency files are auto-added from ERP.PJX when `ERP_Test.err` mentions them.
- Retired `erp_certs` / `sql_certs21` excluded from base project.
- Project files: `erp_test.pjx` / `erp_test.pjt` (VFP writes lowercase; display name **ERP_Test** — underscore, no hyphen).

## Summary (updated by harness)

**Last compile-all scan:** 2026-06-18 (239 forms in `tools\erp_test_form_list.txt`)

| Result | Count |
|--------|------:|
| COMPILE_PASS | 239 |
| COMPILE_FAIL | 0 |
| MISSING | 0 |

### COMPILE_FAIL detail

| Form | sct_bytes | Error |
|------|----------:|-------|
| sql_certs.scx | 466557 | Rebuilt from `SQL_certs.sc2` 2026-06-18 — **COMPILE PASS** (was invalid 973KB SCT). |

Full log: `tools\erp_test_results.csv` | harness log: `tools\erp_test_harness.log` (`COMPILE_ALL DONE rows=239`)