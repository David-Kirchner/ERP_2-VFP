# Company branding

Cert/report header fields (certs11 template): see **[COMPANY_REPORTS.md](COMPANY_REPORTS.md)**.

## How it works

1. **SQL** — `dbo.CompanyProfile` blobs: `LogoImage`, `IconImage`, `ReportImage`; text: `ShortName`, `LegalName`, `Tagline`, etc.
2. **Cache** — `PROGS\company_branding.prg` writes `MEM\company_logo.*`, `MEM\Company_Icon.ico`, `MEM\Company_BMP.bmp` on startup and after upload.
3. **Window title** — `ShortName` drives `_SCREEN.Caption` via `SetERPAppCaption()` (e.g. `Space Alloys USA [server / ERP_2]`).
4. **Forms** — Design-time icon: `graphics\earth.ico` (compile-safe). Runtime: `_SCREEN.Icon` and `ApplyCompanyIconToForm()` use cached company icon.
5. **Reports** — Text fields use `CompanyReport_*()` UDFs; header BMP uses static `graphics\erphead.bmp` (synced from upload — do not use UDFs in FRX picture expressions).

**No form logo timer** — we do not overlay `imgCompanyLogo` on every form.

## Visual form (Form Designer)

| Form | SC2 source | Launcher |
|------|------------|----------|
| Company Profile (Identity, Cert, **Branding** tab) | `Forms\CompanyProfile_Maint.SC2` | `DO PROGS\CompanyProfile_maint` |

`DO PROGS\CompanyBranding_maint` redirects to Company Profile (legacy entry point).

Rebuild SCX from SC2 via FoxBin2Prg `PRG2BIN` on changed SC2 files.

`PROGS\company_branding.prg` is the **library** (cache, caption, SQL blob helpers).

## Configure (Admin)

**Maintenance → Company Profile**

- **Identity** — Legal name, **Short name (window title)**, tagline, contact
- **Branding** — Logo, Icon (.ico), Company BMP (reports), Short name (same field as Identity)
- **Cert text / Report sites** — see COMPANY_REPORTS.md

## Skip icon branding on a form

```foxpro
This.lSkipCompanyBranding = .T.
```

## Fallback assets

- Logo: `graphics\spacealloysusa-logo-nbhrz.jpg`
- Icon: `ICO\EARTH.ICO` / `graphics\earth.ico`
- Report BMP: `graphics\erphead.bmp`
