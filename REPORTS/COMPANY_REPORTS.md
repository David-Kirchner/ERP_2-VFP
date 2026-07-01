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
| Report Logo (letterhead) | Branding | `CompanyProfile.ReportImage` → `MEM\Company_Rpt_Logo.bmp` |
| Space Alloys USA | Identity → Legal name | `CompanyProfile.LegalName` |
| Tagline under name | Identity → Tagline (reports) | `CompanyProfile.Tagline` |
| CAGE 206N0 | Report sites → Windfall CAGE (or Contact → CAGE) | `CompanyPlant.CageCode` / `CompanyProfile.CageCode` |
| Address line | Report sites → Windfall address line | `CompanyPlant.CertReportLine` |
| PH: … | Report sites → Phone | `CompanyPlant.Phone` |
| Report title (below header, if used) | Cert text → Header | `CompanyProfile.CertHeaderText` |
| Company bill-to / ship-to | Addresses | `CompanyProfile.BillTo*` / `CompanyProfile.ShipTo*` |

Tipton / second CAGE lines are optional on other report variants; certs11 Title uses **Windfall only**.

**Customer ship-to** addresses remain on `dbo.ShipAddr` (not Company Profile).

**Startup:** `InitCompanyBranding` writes `MEM\Company_Rpt_Logo.bmp` from `CompanyProfile.ReportImage` when the on-disk file does not match SQL.

## Report Designer expressions

Set each object’s **Expression** (right-click → Properties). UDF library:

**`REPORTS\company_report.prg`** (loaded from `main.prg` at ERP startup)

| Object | Expression |
|--------|------------|
| Company name | `CompanyReport_Name()` |
| Tagline | `CompanyReport_Tagline()` |
| CAGE line | `CompanyReport_Cage('WINDFALL')` |
| Address line | `CompanyReport_PlantLine('WINDFALL')` |
| Phone line | `CompanyReport_Phone()` |
| Report Logo picture | `"..\MEM\Company_Rpt_Logo.bmp"` or `CompanyReport_Bmp()` |
| Bill-to line 1…6 | `CompanyReport_BillToLine(1)` … `CompanyReport_BillToLine(6)` |
| Company ship-to line 1…6 | `CompanyReport_ShipToLine(1)` … `CompanyReport_ShipToLine(6)` |

Empty address lines are skipped (line numbers are non-blank lines only).

## SQL (once per server)

```
MEM\SQL\Config\07_Seed_CompanyProfile.sql
MEM\SQL\Config\08_CompanyPlant_CertReport.sql
MEM\SQL\Config\11_CompanyProfile_BillShipAddress.sql
```

## After editing a report in Report Designer

1. Save `Reports\yourreport.frx`
2. Export text for git: FoxBin2Prg **BIN2PRG** on `Reports\yourreport.frx`
3. Other machines: **PRG2BIN** on `Reports\yourreport.fr2`

```foxpro
DO tools\foxbin2prg\foxbin2prg.prg WITH FULLPATH("Reports\certs11.frx"), "BIN2PRG"
```
