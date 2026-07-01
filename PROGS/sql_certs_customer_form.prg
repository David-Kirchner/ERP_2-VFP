* sql_certs_customer_form.prg - runtime frmCustomer launcher

FUNCTION SqlCerts_GetFrmCustomer
	LPARAMETERS toFormSet
	LOCAL loFrm
	IF VARTYPE(toFormSet.oFrmCustomer) = "O" AND !ISNULL(toFormSet.oFrmCustomer)
		IF TYPE("toFormSet.oFrmCustomer.Name") = "C"
			IF toFormSet.oFrmCustomer.DataSessionID = toFormSet.DataSessionID
				RETURN toFormSet.oFrmCustomer
			ENDIF
			toFormSet.oFrmCustomer.Release
			toFormSet.oFrmCustomer = .NULL.
		ENDIF
	ENDIF
	DO FORM Forms\sql_certs_frmCustomer WITH toFormSet NAME loFrm LINK NOSHOW
	toFormSet.oFrmCustomer = loFrm
	RETURN loFrm
ENDFUNC

PROCEDURE SqlCerts_ShowFrmCustomer
	LPARAMETERS toFormSet
	LOCAL loFrm
	loFrm = SqlCerts_GetFrmCustomer(toFormSet)
	loFrm.Visible = .T.
	loFrm.Show
ENDPROC

PROCEDURE SqlCerts_ReleaseFrmCustomer
	LPARAMETERS toFormSet
	IF VARTYPE(toFormSet.oFrmCustomer) = "O"
		toFormSet.oFrmCustomer.Release
		toFormSet.oFrmCustomer = .NULL.
	ENDIF
ENDPROC
