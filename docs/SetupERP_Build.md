# SetupERP — why Rebuild pulls extra files (and how to stop it)

## What you are seeing

A **new** `SetupERP.pjx` with only `SetupERP.scx` is correct to start. VFP still **asks for more files** during Rebuild because:

1. **The form references paths at compile time** (Icon, Load code, menus).
2. **VFP prompts** “Cannot find X — locate file?” — if you browse and OK, that file is **added to the project** and the list grows.
3. **`proc_setup.prg` is large** (~7,000 lines) but is still **one file**; it does not by itself add hundreds of forms. The bloat comes from **accepting locate prompts** for unrelated ERP files.
4. **Wrong main program** (`main.prg` instead of `SetupERP_main.prg`) would build the whole ERP entry point — always set main explicitly.

Rebuild ≠ “only what I listed.” Rebuild **recompiles** everything in the project and **stops to ask** when a referenced asset is missing.

## What SetupERP.scx actually touches

| Reference | Purpose |
|-----------|---------|
| `Icon = ..\ico\ERP_Company.ico` | Form icon — add to project |
| `_SCREEN.Icon = GRAPHICS\ERP_Company.ico` | Load event |
| `SET PROCEDURE TO proc_setup.prg` | SQL + AppSetup (required) |
| `load_ERP_Environment.prg`, `ERP_Environment_UI.prg` | Server profile |
| `DO SETUP_ERP.mpr` | Menu (File/Edit/Help only) |
| `DO FORM SetServer.scx` | Change server (legacy path) |
| `DO FORM UserInfo.scx`, `Show_User_Permission.scx` | Buttons on form — **only if you use those buttons** |

You do **not** need the full ERP form/report list for setup.

## Minimal project list (~12 files)

Add these manually (or run `SetupERP.pj2` in VFP):

```
PROGS\SetupERP_main.prg          ← Main program (NOT main.prg)
PROGS\load_ERP_Environment.prg
PROGS\ERP_Environment_UI.prg
PROGS\proc_setup.prg
PROGS\RecordError.prg
Forms\SetupERP.scx
Forms\SetServer.scx              ← optional but used by Change Server
ICO\ERP_Company.ico
GRAPHICS\ERP_Company.ico
MENUS\SETUP_ERP.mpr
ERP_Environment.xml              ← optional (Other), runtime config
```

**Project → Project Info → Main** = `PROGS\SetupERP_main.prg`  
**Home directory** = `E:\VFP\ERP_2`

## Safe build steps in VFP

1. Close ERP.pjx; open **SetupERP.pjx** only.
2. Add the files above; do **not** use Add All.
3. Set main to `SetupERP_main.prg`.
4. **Project → Build** → choose **Build Application** (or Build SetupERP.app), **not** “Recompile all files in directory.”
5. When prompted for a file **not in the list above** → **Cancel** or **Ignore All** (never **Locate** — browsing adds the file to the project and the list grows again).
6. If Icon/Graphics prompts appear once → add those two ICO files to the project, then rebuild.

**Common mistake:** `Unable to find Form R_SQL_EMAIL` means `checkemailstatus.scx`, `erp_menu.scx`, or another ERP form was added to the project (usually after clicking **Locate** on an earlier prompt). It is **not** required for SetupERP. Run `DO tools\Clean_SetupERP_Project.prg` and use **Ignore All** on any repeat prompts.

Verify contents before building:

```foxpro
DO tools\List_SetupERP_Project.prg
```

## Remove stray forms (e.g. StockLst_Detail_Cost.scx)

Cancelling later prompts does **not** remove files already added. Close SetupERP in Project Manager, then:

```foxpro
CD E:\VFP\ERP_2
DO tools\Clean_SetupERP_Project.prg
```

Or select each unwanted entry in Project Manager → **Remove** (files stay on disk; only removed from the project).

## Regenerate slim .pjx from script

FoxBin2Prg expects each `.ADD()` line in `SetupERP.pj2` to include a `FileMetadata` comment (same format as `ERP.pj2`).

In VFP command window (with ERP_2 as default):

```foxpro
CD E:\VFP\ERP_2
DO tools\FoxBin2Prg.prg WITH "SetupERP.pj2", "PRG2PJX"
```

**Alternative** (runs the rebuild script directly, no FoxBin2Prg):

```foxpro
DO SetupERP.pj2 WITH "E:\VFP\ERP_2"
```

If FoxBin2Prg reports **props_all.txt does not exist**, run once from PowerShell:

```powershell
powershell -ExecutionPolicy Bypass -File E:\VFP\ERP_2\tools\Install-FoxBin2PrgProps.ps1
```

Then open `SetupERP.pjx` and verify ~12 files before building.

## Optional: even smaller setup

To avoid `SetServer`, `UserInfo`, and permission forms entirely:

- Use only **Change server** via `ERP_Environment_UI` (already in `cmdChangeServer` when those PRGs exist).
- Hide or disable **User Info** / **User Permission** buttons in the form designer if you never use them in the setup app.

## Two projects, two builds

| Project | Main | Output |
|---------|------|--------|
| **ERP.pjx** | `PROGS\main.prg` | `erp.app` — full system |
| **SetupERP.pjx** | `PROGS\SetupERP_main.prg` | `SetupERP.app` — setup utility only |

Never point SetupERP at `main.prg`.
