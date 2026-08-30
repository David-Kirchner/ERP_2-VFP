# ERP_2 — Space Alloys USA VFP ERP

| Name | Value |
|------|--------|
| **Project folder** | `E:\VFP\ERP_2` |
| **GitHub repo** | [David-Kirchner/ERP_2-VFP](https://github.com/David-Kirchner/ERP_2-VFP) |
| **SQL database** | `SAUSA` (same name on SuperMicro and BobWhite) |

Legacy VFP sources: `E:\VFP\ERP_1` (archived; do not use for new work).

## SQL Server

SQL scripts are **not** in this repo. Pointer only: [`MEM\SQL\README.md`](MEM/SQL/README.md). Canonical tree: [David-Kirchner/SQL-ERP_2](https://github.com/David-Kirchner/SQL-ERP_2) (OneDrive `SQL` folder).

| Profile | Data server (OLTP) | Database | Report Server (SSRS) |
|---------|------------------|----------|----------------------|
| **Development** | `SuperMicro` | `SAUSA` | `SuperMicro` |
| **Production** | `BobWhite` | `SAUSA` | `BobWhite` |

Connection: [`ERP_Environment.xml`](ERP_Environment.xml). Per-machine overrides: `ERP_Environment.local.xml` (gitignored).

## Git

Account: **David-Kirchner** · repo: **ERP_2-VFP**

**First time:** create the empty repo on GitHub — see [`docs/Create-GitHub-Repo.md`](docs/Create-GitHub-Repo.md), then:

```text
git push -u origin main
```

Git tracks **text** sources (`.pj2`, `.sc2`, …). `ERP.PJT` / `ERP.pjx` are gitignored (VFP locks them while the project is open).

Commit from VFP (closes projects → FoxBin2Prg → git add → commit → push):

```foxpro
DO GitCommit WITH "your message"
```

Use `RUN /C` for git — **not** `RUN /N` (async; races with FoxBin2Prg).

## Build / run

1. Open `ERP.PJX` in VFP 9.
2. Default directory: `E:\VFP\ERP_2`.
3. Run `main.prg` (project main at repo root; `DO FORM Forms\ERP_Menu`). There is no `PROGS\main.prg`. `erp_main.prg` is a build-test stub only.

## Company logo (personalization)

Logo is stored in `dbo.CompanyProfile` and applied to **forms** (top-right) and **reports** (`MEM\company_logo.*`). Admin: **Maintenance → Company Profile → Logo** tab. Details: [`MEM\COMPANY_BRANDING.md`](MEM/COMPANY_BRANDING.md).
