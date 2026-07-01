# Cert Signatures Architecture (ERP_2)

Three SQL objects serve different roles on material certs. Do not merge them.

## dbo.Cert_Sig — personal signature registry

**Purpose:** Who may sign a cert in the **Sign_Cert** flow and which bitmap prints on the report footer.

| Column | Role |
|--------|------|
| `Sig_ID` | PK; stored on `dbo.Cert.Sig_ID` when signed |
| `PersonName` | Display name (combo / reports) |
| `AppUserLogin` | User segment from VFP `ID()` after `#` |
| `LegacyCode` | Optional short code for imports |
| `SigImage` / `SigMime` | Signature stored in SQL |
| `IsActive` | Inactive rows hidden from signer combo |

**New company / post-migration:** `Cert_Sig` starts **empty**. Add signer rows (and upload each person's scan) via future maintenance or SQL. Until then, no one can sign certs (`Sign_Cert` requires a matching `Cert_Sig` row).

**VFP**

- `PROGS\cert_sig.prg` — cache signer blobs to `graphics\sig-{Sig_ID}.bmp`
- `CertReport_SignatureBmp(Sig_ID)` in `REPORTS\cert_report.prg` — FRX picture expression
- `NULL` / unsigned cert → `graphics\sig-Blank.bmp` (file on disk, **not** a `Cert_Sig` row)
- `Sign_Cert` / `Cert_Registered_Signature` in `PROGS\proc_sql.prg`
- Permission still from `dbo.AppSetup` (`Sign Cert` = YES); combo lists active `Cert_Sig` rows for permitted users

**After SQL migration:** `DO Cert_Sig_EnsureBlankGraphics` (creates `graphics\sig-Blank.bmp` only).

**Maintenance UI:** Optional Form Designer screen (`Cert_Sig_Maint`) not yet built.

---

## dbo.CompanyCertSigner — plant letterhead slots

**Purpose:** Fixed **header** roles on cert templates per plant (not the per-cert sign action).

| SlotCode | Typical label |
|----------|----------------|
| `LAB_TECH` | Tested by |
| `INSPECTOR` | Inspected by |
| `QM` | Approved by |

Configured in Company Profile maintenance. Uses its own `SigImage` blob for template letterhead — independent of `Cert_Sig`.

See `MEM\SQL\Config\01_CompanyProfile_Schema.sql`.

---

## dbo.CompanyCertPdf — immutable PDF archive

**Purpose:** Store the exact PDF bytes sent to the customer plus JSON snapshots of company/plant/signer data at render time. Used for re-download and audit. **Unchanged** by Cert_Sig migration.

---

## Migration summary

1. Run `MEM\SQL\Config\12_Cert_Sig_Schema.sql` (or `Create ERP_new\24_Cert_Sig_Schema.sql`).
   - Creates empty `Cert_Sig`
   - Adds `Cert.Sig_ID`, clears all certs to unsigned, drops `Cert.Signature`
2. `DO Cert_Sig_EnsureBlankGraphics` from VFP (unsigned placeholder BMP only).
3. Add `Cert_Sig` rows per signer when ready; deploy reports using `CertReport_SignatureBmp(Sig_ID)`.
