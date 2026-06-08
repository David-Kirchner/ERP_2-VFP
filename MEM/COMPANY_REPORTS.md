# Company data for reports (certs11 template)

**Design reference:** `Reports\certs11.frx` Title band (your layout):

```
[Logo]   Space Alloys USA
         Manufacturer and Distributor of High Strength Alloys

CAGE 206N0
1985 E 500 N, Windfall, IN 46076
PH: (765) 631-9771
────────────────────────────────────
```

Other cert reports should copy this Title band style; wire fields to expressions below (not hard-coded text).

## Where to edit (visual form — not PRG)

`DO PROGS\CompanyProfile_maint` → `Forms\CompanyProfile_Maint.scx`

| certs11 field | Form tab | SQL |
|---------------|----------|-----|
| Logo | Logo | `CompanyProfile.LogoImage` |
| Space Alloys USA | Identity → Legal name | `CompanyProfile.LegalName` |
| Tagline under name | Identity → Tagline (reports) | `CompanyProfile.Tagline` |
| CAGE 206N0 | Report sites → Windfall CAGE (or Contact → CAGE) | `CompanyPlant.CageCode` / `CompanyProfile.CageCode` |
| Address line | Report sites → Windfall address line | `CompanyPlant.CertReportLine` |
| PH: … | Report sites → Phone | `CompanyPlant.Phone` |
| Report title (below header, if used) | Cert text → Header | `CompanyProfile.CertHeaderText` |

Tipton / second CAGE lines are optional on other report variants; certs11 Title uses **Windfall only**.

## Report Designer expressions

Set each object’s **Expression** (right-click → Properties):

| Object | Expression |
|--------|------------|
| Company name | `CompanyReport_Name()` |
| Tagline | `CompanyReport_Tagline()` |
| CAGE line | `CompanyReport_Cage('WINDFALL')` |
| Address line | `CompanyReport_PlantLine('WINDFALL')` |
| Phone line | `CompanyReport_Phone()` |
| Logo picture | `"graphics\erphead.bmp"` (synced from Company Profile BMP upload) |

Library: `PROGS\company_report.prg` (loaded from `main.prg`).

## SQL (once per server)

```
MEM\SQL\Config\07_Seed_CompanyProfile.sql
MEM\SQL\Config\08_CompanyPlant_CertReport.sql
```

## After editing certs11 in Report Designer

1. Save `certs11.frx`
2. Export text for git: FoxBin2Prg **BIN2PRG** on `Reports\certs11.frx`
3. Other machines: **PRG2BIN** on `Reports\certs11.fr2`

```foxpro
DO tools\foxbin2prg\foxbin2prg.prg WITH FULLPATH("Reports\certs11.frx"), "BIN2PRG"
```
