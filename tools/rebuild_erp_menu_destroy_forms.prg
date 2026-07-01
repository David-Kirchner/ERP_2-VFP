* PRG2BIN SC2->SCX for forms/reports that received ERP_Menu Destroy restore snippet
LOCAL lcRoot, lcFoxBin, lcLog, laFiles, i, lcSc2, lcScx, lnOk, lnFail
lcRoot = "E:\VFP\ERP_2\"
lcFoxBin = lcRoot + "tools\foxbin2prg\foxbin2prg.prg"
lcLog = lcRoot + "tools\rebuild_erp_menu_destroy_forms.log"
_SCREEN.Visible = .F.
SET TALK OFF
SET DEFAULT TO (lcRoot)
CD (lcRoot)
STRTOFILE("PRG2BIN ERP_Menu Destroy forms " + TTOC(DATETIME()) + CHR(13)+CHR(10), lcLog, .F.)
IF !FILE(lcFoxBin)
	STRTOFILE("FAIL missing foxbin2prg" + CHR(13)+CHR(10), lcLog, 1)
	QUIT
ENDIF
DIMENSION laFiles[58]
laFiles[1]  = "Forms\accountingcosting.sc2"
laFiles[2]  = "Forms\customerterms.sc2"
laFiles[3]  = "Forms\greensheet.sc2"
laFiles[4]  = "Forms\searchquotes.sc2"
laFiles[5]  = "Forms\SourceCompany.sc2"
laFiles[6]  = "Forms\sources.sc2"
laFiles[7]  = "Forms\sourcequotes.sc2"
laFiles[8]  = "Forms\qcompany.sc2"
laFiles[9]  = "Forms\r_salesp.sc2"
laFiles[10] = "Forms\r_SQLblocking.sc2"
laFiles[11] = "Forms\actionrequest.sc2"
laFiles[12] = "Forms\showpo.sc2"
laFiles[13] = "Forms\receive_order_PW.sc2"
laFiles[14] = "Forms\ship.sc2"
laFiles[15] = "Forms\stocklst_inv_check.sc2"
laFiles[16] = "Forms\StockLst_SQL_Browse.sc2"
laFiles[17] = "Forms\stocklst_history.sc2"
laFiles[18] = "Forms\StockLst_Location.sc2"
laFiles[19] = "Forms\MTR.sc2"
laFiles[20] = "Forms\Spec_Edit.sc2"
laFiles[21] = "Forms\accountid.sc2"
laFiles[22] = "Forms\alloystandard.sc2"
laFiles[23] = "Forms\soldaddr.sc2"
laFiles[24] = "Forms\prc_equipment.sc2"
laFiles[25] = "Forms\hardwood.sc2"
laFiles[26] = "Forms\inventorysearch.sc2"
laFiles[27] = "Forms\wpipe.sc2"
laFiles[28] = "Forms\shipaddr.sc2"
laFiles[29] = "Forms\upsstdshiproute.sc2"
laFiles[30] = "Forms\vendor.sc2"
laFiles[31] = "Forms\employeemaint.sc2"
laFiles[32] = "Forms\setupERP.sc2"
laFiles[33] = "Forms\setserver.sc2"
laFiles[34] = "Forms\CompanyProfile_Maint.SC2"
laFiles[35] = "Reports\r_so_status.sc2"
laFiles[36] = "Reports\r_shipments.sc2"
laFiles[37] = "Reports\r_stocklst.sc2"
laFiles[38] = "Reports\r_sql_email.sc2"
laFiles[39] = "Reports\r_shoprecv.sc2"
laFiles[40] = "Reports\r_trackmess.sc2"
laFiles[41] = "Forms\sourceph.sc2"
laFiles[42] = "Forms\r_sales.sc2"
laFiles[43] = "Forms\r_sales_month.sc2"
laFiles[44] = "Forms\Sales_Review.sc2"
laFiles[45] = "Forms\Stock_Projected.sc2"
laFiles[46] = "Forms\Draw_sched.sc2"
laFiles[47] = "Forms\ht_log.sc2"
laFiles[48] = "Forms\lake_erie_log.sc2"
laFiles[49] = "Forms\roll_log.sc2"
laFiles[50] = "Forms\thermalcoupleuse.sc2"
laFiles[51] = "Forms\thermalcouplename.sc2"
laFiles[52] = "Forms\Wire_log.sc2"
laFiles[53] = "Forms\AppSqlRole_Maint.SC2"
laFiles[54] = "Forms\vacationadmin.sc2"
laFiles[55] = "Forms\vacationschedule.sc2"
laFiles[56] = "Forms\show_user_permission.sc2"
laFiles[57] = "Forms\AppPermission_Maint.SC2"
laFiles[58] = "Reports\r_stock_sold.sc2"
lnOk = 0
lnFail = 0
FOR i = 1 TO ALEN(laFiles)
	lcSc2 = lcRoot + laFiles[i]
	IF !FILE(lcSc2)
		lnFail = lnFail + 1
		STRTOFILE("MISSING " + laFiles[i] + CHR(13)+CHR(10), lcLog, 1)
		LOOP
	ENDIF
	lcScx = STRTRAN(lcSc2, ".sc2", ".scx")
	DO (lcFoxBin) WITH lcSc2, "PRG2BIN"
	IF FILE(lcScx)
		lnOk = lnOk + 1
		STRTOFILE("OK " + laFiles[i] + CHR(13)+CHR(10), lcLog, 1)
	ELSE
		lnFail = lnFail + 1
		STRTOFILE("FAIL " + laFiles[i] + CHR(13)+CHR(10), lcLog, 1)
	ENDIF
ENDFOR
STRTOFILE("DONE ok=" + TRANSFORM(lnOk) + " fail=" + TRANSFORM(lnFail) + CHR(13)+CHR(10), lcLog, 1)
QUIT
