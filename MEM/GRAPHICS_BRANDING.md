# Graphics & branding standards

Company Profile **Branding** tab defines three assets.

| Asset | Purpose | SQL (`dbo.CompanyProfile`) | Local cache | Report FRX picture |
|-------|---------|---------------------------|-------------|-------------------|
| **Company Logo** | On-screen / future UI branding | `LogoImage`, `LogoMime` | `MEM\company_logo.*` | — |
| **Company Icon** | Taskbar, window title bar, form chrome, EXE icon | `IconImage`, `IconMime` | `MEM\Company_Icon.ico` | — |
| **Report Logo** | Printed report letterhead | `ReportImage`, `ReportMime` | `MEM\Company_Rpt_Logo.bmp` | **`graphics\Company_Rpt_Logo.bmp`** |

Configure via `DO PROGS\CompanyProfile_maint` → **Branding** tab.

Report text expressions: **`REPORTS\COMPANY_REPORTS.md`**.

---

## Report Logo file names

| Location | File |
|----------|------|
| SQL blob | `CompanyProfile.ReportImage` |
| MEM cache | `MEM\Company_Rpt_Logo.bmp` |
| ERP graphics | `graphics\Company_Rpt_Logo.bmp` |
| Report Designer | `REPORTS\graphics\Company_Rpt_Logo.bmp` (mirror of root `graphics\`) |

**FRX picture expression** (all letterhead reports):

```foxpro
"graphics\Company_Rpt_Logo.bmp"
```

Do not hard-code absolute paths. On startup, `InitCompanyBranding()` loads SQL blobs into `MEM\` and syncs `graphics\Company_Rpt_Logo.bmp`. Blank placeholder files ship under `graphics\` until real art is uploaded.

## Persistence

| Action | What happens |
|--------|----------------|
| **Choose image / icon / report logo** | Saves blob to SQL immediately (`LogoImage`, `IconImage`, `ReportImage`) and writes `MEM\` cache files |
| **Save** (main button) | Saves text fields only; refreshes branding previews from SQL |
| **App startup** | `InitCompanyBranding()` reloads SQL blobs into `MEM\` and report graphics |

Shipped placeholders: `graphics\company_logo_placeholder.png`, `graphics\Company_Rpt_Logo.bmp`, default `ICO\earth-globe.ico`.

---

## Report Logo vs Company Logo

| | Company Logo | Report Logo |
|---|--------------|-------------|
| Typical shape | Square / compact mark | Wide letterhead strip |
| Formats | JPG, PNG, GIF, BMP | JPG, PNG, GIF, BMP (stored as BMP) |
| Shows on certs/PO print | Only if Report Logo not set yet* | Yes |

\*Uploading **Company Logo** auto-publishes to `Company_Rpt_Logo.bmp` when **Report Logo** is empty.

---

## Paths & mirrors

| Path | Role |
|------|------|
| `graphics\` | Master graphics folder |
| `Forms\graphics\` | Mirror — forms resolve `graphics\` from `Forms\` |
| `REPORTS\graphics\` | Mirror — reports resolve `graphics\` from `REPORTS\` |

Setup: `tools\link_forms_graphics.bat`

Library: `PROGS\company_branding.prg` (`InitCompanyBranding()` from `main.prg`).
