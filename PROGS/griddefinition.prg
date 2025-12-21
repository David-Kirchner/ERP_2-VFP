#DEFINE cnGRID_HEADER_ACTION_ENTER 								1
#DEFINE cnGRID_HEADER_ACTION_DBLCLICK							2
#DEFINE cnGRID_HEADER_ACTION_CLICK								3
#DEFINE cnGRID_HEADER_ACTION_RIGHTCLICK							4
#DEFINE cnGRID_HEADER_ACTION_MOUSUP								5
#DEFINE cnGRID_CELL_ACTION_ENTER 								1
#DEFINE cnGRID_CELL_ACTION_DBLCLICK								2
#DEFINE cnGRID_CELL_ACTION_CLICK								3
#DEFINE cnGRID_CELL_ACTION_RIGHTCLICK							4
#DEFINE cnGRID_CELL_ACTION_MOUSUP								5
#DEFINE cnGRID_CELL_ACTION_INS									6
#DEFINE cnGRID_CELL_ACTION_DELETE								7
#DEFINE cnKEY_CODE_UP					 						5
#DEFINE cnKEY_CODE_SHIFT_UP				 						56
#DEFINE cnKEY_CODE_DOWN					 						24
#DEFINE cnKEY_CODE_SHIFT_DOWN			 						50
#DEFINE cnKEY_CODE_RIGHT				 						4		
#DEFINE cnKEY_CODE_SHIFT_RIGHT			 						54		
#DEFINE cnKEY_CODE_LEFT					 						19			
#DEFINE cnKEY_CODE_SHIFT_LEFT			 						52		
#DEFINE cnKEY_CODE_PAGE_UP				 						18			
#DEFINE cnKEY_CODE_SHIFT_PAGE_UP		 						57		
#DEFINE cnKEY_CODE_CTRL_PAGE_UP			 						31		
#DEFINE cnKEY_CODE_HOME					 						1		
#DEFINE cnKEY_CODE_PAGE_DOWN			 						3			
#DEFINE cnKEY_CODE_SHIFT_PAGE_DOWN		 						51		
#DEFINE cnKEY_CODE_CTRL_PAGE_DOWN		 						30		
#DEFINE cnKEY_CODE_END					 						6					
#DEFINE cnKEY_CODE_INS					 						22					
#DEFINE cnKEY_CODE_DEL					 						7					
#DEFINE cnKEY_CODE_TAB					 						9					
#DEFINE cnKEY_CODE_SHIFT_TAB					 				15		
#DEFINE cnKEY_CODE_ENTER						 				13		


DEFINE CLASS grdHeader AS HEADER
ENDDEFINE

DEFINE CLASS grdTextBox AS TEXTBOX

	cAttachTo   = '.NULL.'

	BORDERSTYLE = 0

	PROCEDURE KEYPRESS
		LPARAMETERS tnKeyCode, tnShiftAltCtrl

		LOCAL loAttach	
		LOCAL loGrid	
		LOCAL loFoundControl
		
		LOCAL lnSelect		

		loAttach = EVAL(THIS.cAttachTo)
		loGrid   = THIS.PARENT.PARENT

		IF VARTYPE(loAttach)='O' 
			DO CASE
				CASE tnKeyCode = cnKEY_CODE_HOME
				CASE tnKeyCode = cnKEY_CODE_END
				CASE tnKeyCode = cnKEY_CODE_INS AND VARTYPE(loAttach) = 'O' AND PEMSTATUS(loAttach, 'GridCellAction', 5) 
						
					loAttach.GridCellAction(cnGRID_CELL_ACTION_INS, THIS)

				CASE tnKeyCode = cnKEY_CODE_DEL AND VARTYPE(loAttach) = 'O' AND PEMSTATUS(loAttach, 'GridCellAction', 5) 
						
					loAttach.GridCellAction(cnGRID_CELL_ACTION_DELETE,THIS)

				CASE tnKeyCode = cnKEY_CODE_TAB AND loGrid.ACTIVECOLUMN = loGrid.COLUMNCOUNT
					KEYBOARD '{CTRL+TAB}'

				CASE tnKeyCode = cnKEY_CODE_SHIFT_TAB AND loGrid.ACTIVECOLUMN = 1
					KEYBOARD '{CTRL+SHIFT+TAB}'

				CASE tnKeyCode = cnKEY_CODE_ENTER AND VARTYPE(loAttach) = 'O' AND PEMSTATUS(loAttach, 'GridCellAction', 5)

					NODEFAULT
					
					lnSelect = SELECT()
					
					SELECT (loGrid.RECORDSOURCE)
	
					SCATTER MEMO NAME loFoundControl 
					
					SELECT (lnSelect)
					
					loAttach.GridCellAction(cnGRID_CELL_ACTION_ENTER, loFoundControl)
					
			ENDCASE
		ELSE
			IF tnKeyCode = cnKEY_CODE_ENTER
				NODEFAULT
				THIS.DBLCLICK()
			ENDIF
		ENDIF
	ENDPROC

	PROCEDURE DBLCLICK

		KEYBOARD '{ENTER}'				

	ENDPROC


ENDDEFINE


DEFINE CLASS grdEditBox AS EDITBOX

	lViewMemo   = .T.
	cAttachTo   = '.NULL.'

	BORDERSTYLE = 0
	
	ENABLE = .F.	


	PROCEDURE KEYPRESS
		LPARAMETERS tnKeyCode, tnShiftAltCtrl

		LOCAL loAttach	
		LOCAL loGrid	
		LOCAL loFoundControl
		
		LOCAL lnSelect		
		

		loAttach = EVAL(THIS.cAttachTo)
		loGrid   = THIS.PARENT.PARENT

		IF VARTYPE(loAttach) = 'O' 

			DO CASE
				CASE tnKeyCode = cnKEY_CODE_UP	
					KEYBOARD '{CTRL+UPARROW}'				
				
				CASE tnKeyCode = cnKEY_CODE_DOWN
					KEYBOARD '{CTRL+DNARROW}'				

				CASE tnKeyCode = cnKEY_CODE_HOME
				CASE tnKeyCode = cnKEY_CODE_END
				CASE tnKeyCode = cnKEY_CODE_INS AND ;
						VARTYPE(loAttach) = 'O' AND PEMSTATUS(loAttach, 'GridCellAction', 5)
						
					loAttach.GridCellAction(cnGRID_CELL_ACTION_INS, THIS)

				CASE tnKeyCode = cnKEY_CODE_DEL AND ;
						VARTYPE(loAttach) = 'O' AND PEMSTATUS(loAttach, 'GridCellAction', 5)
						
					loAttach.GridCellAction(cnGRID_CELL_ACTION_DELETE,THIS)

				CASE tnKeyCode = cnKEY_CODE_TAB AND loGrid.ACTIVECOLUMN = loGrid.COLUMNCOUNT
					KEYBOARD '{CTRL+TAB}'

				CASE tnKeyCode = cnKEY_CODE_SHIFT_TAB AND loGrid.ACTIVECOLUMN = 1
					KEYBOARD '{CTRL+SHIFT+TAB}'

				CASE tnKeyCode = cnKEY_CODE_ENTER AND;
						VARTYPE(loAttach) = 'O' AND PEMSTATUS(loAttach, 'GridCellAction', 5)

					NODEFAULT

					lnSelect = SELECT()
					
					SELECT (loGrid.RECORDSOURCE)
	
					SCATTER MEMO NAME loFoundControl 
					
					SELECT (lnSelect)
					
					loAttach.GridCellAction(cnGRID_CELL_ACTION_ENTER, loFoundControl)
					
			ENDCASE

		ELSE

			IF tnKeyCode = cnKEY_CODE_ENTER
				NODEFAULT
				THIS.DBLCLICK()
			ENDIF

		ENDIF
	ENDPROC

	PROCEDURE DBLCLICK

		KEYBOARD '{ENTER}'				

	ENDPROC


ENDDEFINE





