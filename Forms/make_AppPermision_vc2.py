# make_apppermission_vc2.py
# Simple & Clean VC2 generator for AppPermissionMaintForm

import sys
from datetime import datetime

def generate_vc2(output_file="AppPermission.vc2"):
    timestamp = datetime.now().strftime("%Y%m%d%H%M%S")
    
    vc2_content = f"""*====================================================================
* FoxBin2Prg VC2 File - Simple Form Class
* Class: AppPermissionMaintForm
* Generated: {datetime.now().strftime("%m/%d/%Y %H:%M:%S")}
*====================================================================

BEGIN CLASS AppPermissionMaintForm OF Form

    *------------------- Form Properties -------------------
    AutoCenter = .T.
    Caption = "Program Permissions (AppSetup PRP=YES)"
    Height = 520
    Width = 680
    WindowType = 1
    MinHeight = 520
    MinWidth = 680

    *------------------- Controls -------------------
    ADD OBJECT lblUser AS Label WITH ;
        Top = 14, Left = 12, Width = 70, Height = 24, ;
        Caption = "User (UN):"

    ADD OBJECT cboUser AS ComboBox WITH ;
        Top = 12, Left = 82, Width = 320, Height = 24, ;
        Style = 2, BoundColumn = 1, RowSourceType = 0

    ADD OBJECT cmdNewUser AS CommandButton WITH ;
        Top = 12, Left = 410, Height = 24, Width = 100, ;
        Caption = "New user..."

    ADD OBJECT grdPerm AS Grid WITH ;
        Top = 48, Left = 12, Height = 400, Width = 652, ;
        ColumnCount = 3, ScrollBars = 3, DeleteMark = .F., RecordMark = .F.

    ADD OBJECT cmdAll AS CommandButton WITH ;
        Top = 458, Left = 12, Height = 27, Width = 84, ;
        Caption = "Select all"

    ADD OBJECT cmdNone AS CommandButton WITH ;
        Top = 458, Left = 102, Height = 27, Width = 84, ;
        Caption = "Clear all"

    ADD OBJECT cmdReload AS CommandButton WITH ;
        Top = 458, Left = 202, Height = 27, Width = 84, ;
        Caption = "Reload"

    ADD OBJECT cmdSave AS CommandButton WITH ;
        Top = 458, Left = 380, Height = 27, Width = 84, ;
        Caption = "Save"

    ADD OBJECT cmdClose AS CommandButton WITH ;
        Top = 458, Left = 560, Height = 27, Width = 84, ;
        Caption = "Close", Cancel = .T.

    *------------------- Custom Properties -------------------
    nConnHandle = 0
    cSelectedUser = ""
    lHasAppUserGrant = .F.

    *------------------- Methods -------------------
    PROCEDURE Init
        This.EnsurePermCursor()
        This.nConnHandle = get_SQLSTRINGCONNECT()
        This.lHasAppUserGrant = This.TableExists("AppUserGrant")
        This.LoadUserList()
        This.LoadPermissionCatalog()
        This.grdPerm.RecordSource = "csrPerm"
        This.ConfigureGrid()
        IF This.cboUser.ListCount > 0
            This.cboUser.ListIndex = 1
            This.cSelectedUser = ALLTRIM(This.cboUser.Value)
            This.LoadUserGrants()
        ENDIF
    ENDPROC

    PROCEDURE Destroy
        IF USED("csrPerm")
            USE IN csrPerm
        ENDIF
        IF USED("csrUsers")
            USE IN csrUsers
        ENDIF
    ENDPROC

    * Add the rest of your methods here manually in VFP after creating the VCX,
    * or paste them below this line before running FoxBin2Prg.

END CLASS

*====================================================================
Name = "AppPermissionMaintForm"
BaseClass = "form"
ClassLibrary = ""
Timestamp = "{timestamp}"
"""

    with open(output_file, "w", encoding="utf-8") as f:
        f.write(vc2_content)

    print(f"✅ Successfully created: {output_file}")
    print("   → Simple clean class with controls and basic structure")
    print("\nNext step:")
    print(f"   Run: FoxBin2Prg {output_file} AppPermission.vcx")

if __name__ == "__main__":
    generate_vc2()