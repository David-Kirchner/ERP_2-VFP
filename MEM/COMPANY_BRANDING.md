# Company branding (logo)

Cert/report header fields (certs11 template): see **[COMPANY_REPORTS.md](COMPANY_REPORTS.md)**.

## How it works

1. **SQL** — `dbo.CompanyProfile.LogoImage` / `LogoMime` (see `MEM\SQL\Config\01_CompanyProfile_Schema.sql`).
2. **Cache** — `PROGS\company_branding.prg` writes `MEM\company_logo.<ext>` on startup and after upload.
3. **Forms** — A timer adds `imgCompanyLogo` (top-right) on each visible form.
4. **Reports** — FRX/FR2 picture objects use `..\MEM\company_logo.jpg` (same cached file).

## Visual forms (Form Designer)

| Form | SC2 source | Launcher |
|------|------------|----------|
| Company Profile (identity, cert text, **Logo** tab) | `Forms\CompanyProfile_Maint.SC2` | `DO PROGS\CompanyProfile_maint` |
| Branding preview / enable on forms | `Forms\CompanyBranding_Maint.SC2` | `DO PROGS\CompanyBranding_maint` |

Rebuild SCX from SC2: `DO tools\Rebuild_CompanyProfile_maint`

`PROGS\company_branding.prg` stays a **library** (cache, timer, SQL blob helpers) — no screen.

## Upload logo (Admin)

- Menu: **Maintenance → Company Profile** → **Logo** tab → **Choose image...**
- Or: `DO PROGS\CompanyProfile_maint`

## Skip logo on a form

In the form’s `Load` or class definition:

```foxpro
This.lSkipCompanyBranding = .T.
```

## After changing reports or forms

Rebuild project members from `ERP.PJ2` text, or run FoxBin2Prg on changed files.

## Fallback

If no logo is in SQL and no cache file exists, forms/reports use `graphics\spacealloysusa-logo-nbhrz.jpg` when that file is present.
