# SAUSA-ERP — MSI + Group Policy deploy

**Target SQL:** BobWhite (`192.168.5.3`) / database `SAUSA`  
**Share:** `\\192.168.5.3\Share\SAUSA-ERP\` (same as `\\BobWhite\Share\SAUSA-ERP\` when DNS works)  
**Package:** per-machine MSI → `C:\Program Files (x86)\SAUSA\SAUSA-ERP\`

## 1. Build the MSI (on SuperMicro / this PC)

1. In VFP, build **`SAUSA-ERP.exe`** into `E:\VFP\ERP_2\`.
2. Run:

```powershell
powershell -ExecutionPolicy Bypass -File E:\VFP\ERP_2\installer\Build-SAUSA-ERP-MSI.ps1 -PublishShare
```

Outputs:

- `E:\VFP\ERP_2\installer\out\SAUSA-ERP-<version>.msi`
- `E:\VFP\ERP_2\installer\out\SAUSA-ERP.msi` (always “latest”)
- Copied to `\\192.168.5.3\Share\SAUSA-ERP\` when `-PublishShare` is used

The MSI includes: EXE, VFP9 runtime DLLs, Production `ERP_Environment.xml` (BobWhite), `MEM\` (Users write ACL), Start Menu + Desktop shortcuts.

## 2. Share permissions (BobWhite)

On `\\BobWhite\Share\SAUSA-ERP\`:

| Group | Share | NTFS |
|-------|-------|------|
| Domain Computers / Authenticated Users | Read | Read & execute |
| Domain Admins | Full | Full |

GPO installs run as the computer account — **Domain Computers** (or Authenticated Users) need **read** on the MSI path.

## 3. Create the GPO (on a domain DC / RSAT)

1. **Group Policy Management** → your SAUSA domain.
2. Create GPO e.g. **`SAUSA-ERP Client`** → link to the OU that holds **computer** accounts (not only users).
3. Edit GPO:
   - **Computer Configuration → Policies → Software Settings → Software installation**
   - Right-click → **New → Package…**
   - Browse to: `\\BobWhite\Share\SAUSA-ERP\SAUSA-ERP.msi`  
     (use the **UNC hostname path**, not a mapped drive)
   - Deployment method: **Assigned**
4. Optional: package properties → **Deployment** → check **Uninstall this application when it falls out of the scope of management**.
5. On a client: `gpupdate /force` then **reboot** (Computer Software Installation applies at startup).

## 4. Who gets it

- GPO must apply to **computers** (domain-joined PCs).
- Users sign in as **`SAUSA\username`** so Windows auth to BobWhite SQL works.
- Personal laptops that are **not** domain-joined are **not** covered by this GPO — join them to `SAUSA`, or run the MSI manually while on the LAN/VPN.

## 5. Manual test install (before GPO)

On a domain PC:

```cmd
msiexec /i \\BobWhite\Share\SAUSA-ERP\SAUSA-ERP.msi /qb
```

Confirm:

- Shortcut launches `SAUSA-ERP.exe`
- App connects to **BobWhite / SAUSA** (Production profile)
- `%ProgramFiles(x86)%\SAUSA\SAUSA-ERP\MEM` is writable

Uninstall:

```cmd
msiexec /x \\BobWhite\Share\SAUSA-ERP\SAUSA-ERP.msi /qb
```

## 6. Upgrades

Rebuild EXE → re-run `Build-SAUSA-ERP-MSI.ps1 -PublishShare` → replace `SAUSA-ERP.msi` on the share.  
Same **UpgradeCode** in the WiX project allows MajorUpgrade. For GPO, redeploy/replace the package or bump version and add a new package; simplest ops path: remove old package from GPO, add the new MSI, then `gpupdate` + reboot.

## Notes

- InstallShield is optional; this WiX MSI is what GPO needs.
- Clients need network access to **BobWhite** (SQL 1433 + share for install).
- If SQL login fails, check the PC is domain-joined and the user exists in `dbo.AppUsers` / SQL permissions on `SAUSA`.
