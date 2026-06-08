# FoxBin2Prg — Windows Explorer integration

Official VFPx scripts live in this folder. Requires **VFP 9** (`vfp9.exe`). Launchers use `-cNULL` and `foxbin2prg_b2p.prg` / `foxbin2prg_p2b.prg` (no COM / CONFIG.FPW dependency).

## Install (right-click + Send To)

From PowerShell:

```powershell
cd E:\VFP\ERP_2\tools\foxbin2prg
powershell -ExecutionPolicy Bypass -File .\Install-FoxBin2PrgExplorer.ps1
```

This adds:

| Where | Action |
|-------|--------|
| Right-click `.scx`, `.vcx`, `.frx`, `.mnx`, `.pjx`, … | **FoxBin2Prg: Binary → Text** |
| Right-click `.sc2`, `.vc2`, `.fr2`, `.mn2`, `.pj2`, … | **FoxBin2Prg: Text → Binary** |
| Right-click a **folder** | Batch convert all files in tree |
| Right-click file(s) → **Send to** | Two FoxBin2Prg shortcuts |

Uses `foxbin2prg.prg` in this folder (no `.exe` required).

## Uninstall

```powershell
powershell -ExecutionPolicy Bypass -File .\Uninstall-FoxBin2PrgExplorer.ps1
```

## Manual (Send To only — original VFPx docs)

Copy shortcuts to `%APPDATA%\Microsoft\Windows\SendTo` targeting:

- `wscript.exe //Nologo "...\Convert_VFP9_BIN_2_PRG.vbs"`
- `wscript.exe //Nologo "...\Convert_VFP9_PRG_2_BIN.vbs"`

Then select files → right-click → **Send to** → FoxBin2Prg.

## Troubleshooting

- **Nothing happens / VFP stays open:** Close other VFP sessions first. Use `BIN2PRG.bat` or `PRG2BIN.bat` from a command prompt to see console output.
- **CONFIG.FPW bad path:** Launchers pass `-cNULL`; do not use `-q` (VFP treats it as `-q.prg`).
- **Menus missing:** Restart Explorer (`taskkill /f /im explorer.exe & start explorer`) or sign out/in.
- **`props_all.txt` / File does not exist:** FoxBin2Prg needs all `props_*.txt` files in the same folder as `FoxBin2Prg.FXP`. From PowerShell: `powershell -ExecutionPolicy Bypass -File E:\VFP\ERP_2\tools\Install-FoxBin2PrgProps.ps1`
- **Config:** `foxbin2prg.cfg` in this folder; project overrides via `FOXBIN2PRG.CFG.TXT` in repo `tools\`.
