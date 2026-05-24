# ERP_2 — Space Alloys USA VFP ERP

Active development line for the HPA-App (Visual FoxPro 9.2). Legacy sources remain in `E:\VFP\ERP_1` (archived; do not use for new work).

## SQL Server

| Profile | Server | Database |
|---------|--------|----------|
| **Production** | `SuperMicro\SQLEXPRESS` | `ERP_1` |
| **Development** | `Server26` | `ERP_1` |
| **Windfall** (legacy site) | `RAPTOR` | `ERP_1` |

Connection settings: [`ERP_Environment.xml`](ERP_Environment.xml). Per-machine overrides: `ERP_Environment.local.xml` (gitignored).

Authentication: Windows Integrated (`Trusted_Connection=yes`).

## Configuration

- **Environment:** `PROGS\load_ERP_Environment.prg` — loads profile, sets `gGlobalServer`, `gGlobalDatabase`, `gERPProfile`.
- **Company data:** `dbo.CompanyProfile` on SQL Server; maintenance via **Maintenance → Company Profile** in the ERP menu.
- **SQL scripts:** `MEM\SQL\Config\` (schema/seed), `MEM\SQL\Security\` (roles/logins).

## Git

Repository: https://github.com/DavidKirchner68/ERP_2 (private)

Commit helper: `DO GitCommit WITH "your message"` from project root.

## Related docs

Migration and company-profile design: `C:\Users\talkt\OneDrive\Cowork OS\ERP\`

C# Blazor target (separate repo): `E:\Dev\SpaceAlloys.ERP`

## Build / run

1. Open `ERP.PJX` in VFP 9.
2. Set default directory to this folder (`E:\VFP\ERP_2`).
3. Run `PROGS\main.prg`.
4. First run: complete **Setup HPA** if prompted; choose SQL profile (Development vs Production) under server setup.
