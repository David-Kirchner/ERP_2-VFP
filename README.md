# ERP_2 — Space Alloys USA VFP ERP

| Name | Value |
|------|--------|
| **Project folder** | `E:\VFP\ERP_2` |
| **GitHub repo** | [David-Kirchner/ERP_2-VFP](https://github.com/David-Kirchner/ERP_2-VFP) |
| **SQL database** | `ERP_1` (same name on SuperMicro and Server26) |

Legacy VFP sources: `E:\VFP\ERP_1` (archived; do not use for new work).

## SQL Server

| Profile | Data server (OLTP) | Database | Report Server (SSRS) |
|---------|------------------|----------|----------------------|
| **Production** | `SuperMicro` | `ERP_1` | `Server26` (SSRS on SQL 2016) |
| **Development** | `Server26\Server26` | `ERP_1` | `Server26\Server26` |
| **Windfall** (legacy) | `RAPTOR` | `ERP_1` | `RAPTOR` |

Apply schema on **both** servers — see [`MEM\SQL\README.md`](MEM/SQL/README.md) (full build in `Create ERP_new`, incremental in `Config` / `Migrations`).

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
3. Run `PROGS\main.prg`.
