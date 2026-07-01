*====================================================================
* REPORTS\cert_report.prg — Cert report UDFs (signature bitmap path)
* FRX picture expression: CertReport_SignatureBmp(Sig_ID)
*====================================================================

*--------------------------------------------------------------------
FUNCTION CertReport_SignatureBmp
	LPARAMETERS tnSig_ID
	IF !"CERT_SIG" $ UPPER(SET("PROCEDURE"))
		IF FILE("PROGS\cert_sig.prg")
			SET PROCEDURE TO PROGS\cert_sig.prg ADDITIVE
		ENDIF
	ENDIF
	RETURN CertSig_ReportBmpPath(tnSig_ID)
