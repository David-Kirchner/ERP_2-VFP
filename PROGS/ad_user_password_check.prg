LPARAMETERS m.UserName , m.Password

LOCAL m.adspath, m.domene,m.con,m.com,m.rs,m.RootDSE,m.dom,m.retval
m.retval = .F.
m.adspath = ""
TRY
	m.RootDSE = GETOBJECT("LDAP://RootDSE")
	IF TYPE("rootDSE")="O"  AND  NOT  ISNULL(m.RootDSE)
		m.dom = GETOBJECT("LDAP://" + RootDSE.GET("defaultNamingContext"))
		m.domene = dom.GET("distinguishedName")
		m.con = CREATEOBJECT("ADODB.Connection")
		m.com = CREATEOBJECT("ADODB.Command")
		m.con.Provider = "ADsDSOObject"
		m.con.OPEN( "Active Directory Provider" )
		m.com.ActiveConnection = m.con
		m.com.CommandText = "select SamaccountName,AdsPath from 'LDAP://" + m.domene+  "' WHERE objectCategory='Person' AND objectClass = 'user'"
		m.rs = m.com.Execute
		IF m.rs.recordcount > 0
			DO WHILE NOT m.rs.EOF
				IF UPPER(m.rs.FIELDS("samAccountName").VALUE) == UPPER( m.UserName )
					m.adspath = m.rs.FIELDS("AdsPath").VALUE
					EXIT
				ENDIF
				m.rs.movenext
			ENDDO
		ENDIF
		IF NOT EMPTY( m.adspath )
			LOCAL m.ns,m.oS
			m.ns = GETOBJECT("LDAP:")
			TRY
				*m.oS = m.ns.OpenDSObject( m.adspath , m.domene + "\" + m.UserName ,	m.Password , 1 )
				m.oS = m.ns.OpenDSObject( m.adspath , "WINDFALL" + "\" + m.UserName ,	m.Password , 1 )
				m.retval = .T.
				m.oS = NULL
			CATCH
				m.retval = .F.
			ENDTRY
		ENDIF
	ENDIF
CATCH
	m.retval = .F.
ENDTRY
RETURN m.retval
