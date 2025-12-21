***************************************************************************************************************************
*-- Paper sizes
***************************************************************************************************************************
#DEFINE cnPRTPAPER_LETTER     		  					1   && Letter 8 1/2 x 11 in
#DEFINE cnPRTPAPER_LETTERSMALL 		  					2   && Letter Small 8 1/2 x 11 in
#DEFINE cnPRTPAPER_TABLOID     		  					3   && Tabloid 11 x 17 in
#DEFINE cnPRTPAPER_LEDGER     		  					4   && Ledger 17 x 11 in
#DEFINE cnPRTPAPER_LEGAL      		  					5   && Legal 8 1/2 x 14 in
#DEFINE cnPRTPAPER_STATEMENT  		  					6   && Statement 5 1/2 x 8 1/2 in
#DEFINE cnPRTPAPER_EXECUTIVE  		  					7   && Executive 7 1/4 x 10 1/2 in
#DEFINE cnPRTPAPER_A3         		  					8   && A3 297 x 420 mm
#DEFINE cnPRTPAPER_A4         		  					9   && A4 210 x 297 mm
#DEFINE cnPRTPAPER_A4SMALL    		  					10  && A4 Small 210 x 297 mm
#DEFINE cnPRTPAPER_A5         		  					11  && A5 148 x 210 mm
#DEFINE cnPRTPAPER_B4          		  					12  && B4 250 x 354
#DEFINE cnPRTPAPER_B5        		  					13  && B5 182 x 257 mm
#DEFINE cnPRTPAPER_FOLIO     		  					14  && Folio 8 1/2 x 13 in
#DEFINE cnPRTPAPER_QUARTO    		  					15  && Quarto 215 x 275 mm
#DEFINE cnPRTPAPER_10X14     		  					16  && 10x14 in
#DEFINE cnPRTPAPER_11X17     		  					17  && 11x17 in
#DEFINE cnPRTPAPER_NOTE      		  					18  && Note 8 1/2 x 11 in
#DEFINE cnPRTPAPER_ENV_9     		  					19  && Envelope #9 3 7/8 x 8 7/8
#DEFINE cnPRTPAPER_ENV_10    		  					20  && Envelope #10 4 1/8 x 9 1/2
#DEFINE cnPRTPAPER_ENV_11     		  					21  && Envelope #11 4 1/2 x 10 3/8
#DEFINE cnPRTPAPER_ENV_12    		  					22  && Envelope #12 4 \276 x 11
#DEFINE cnPRTPAPER_ENV_14    		  					23  && Envelope #14 5 x 11 1/2
#DEFINE cnPRTPAPER_CSHEET     	 	  					24  && C size sheet
#DEFINE cnPRTPAPER_DSHEET    		  					25  && D size sheet
#DEFINE cnPRTPAPER_ESHEET    		  					26  && E size sheet
#DEFINE cnPRTPAPER_ENV_DL    		  					27  && Envelope DL 110 x 220mm
#DEFINE cnPRTPAPER_ENV_C5    		  					28  && Envelope C5 162 x 229 mm
#DEFINE cnPRTPAPER_ENV_C3    		  					29  && Envelope C3  324 x 458 mm
#DEFINE cnPRTPAPER_ENV_C4    		  					30  && Envelope C4  229 x 324 mm
#DEFINE cnPRTPAPER_ENV_C6    		  					31  && Envelope C6  114 x 162 mm
#DEFINE cnPRTPAPER_ENV_C65   		  					32  && Envelope C65 114 x 229 mm
#DEFINE cnPRTPAPER_ENV_B4    		  					33  && Envelope B4  250 x 353 mm
#DEFINE cnPRTPAPER_ENV_B5    		  					34  && Envelope B5  176 x 250 mm
#DEFINE cnPRTPAPER_ENV_B6    		  					35  && Envelope B6  176 x 125 mm
#DEFINE cnPRTPAPER_ENV_ITALY  		  					36  && Envelope 110 x 230 mm
#DEFINE cnPRTPAPER_ENV_MONARCH		  					37  && Envelope Monarch 3.875 x 7.5 in
#DEFINE cnPRTPAPER_ENV_PERSONAL		  					38  && 6 3/4 Envelope 3 5/8 x 6 1/2 in
#DEFINE cnPRTPAPER_FANFOLD_US		  					39  && US Std Fanfold 14 7/8 x 11 in
#DEFINE cnPRTPAPER_FANFOLD_STD_GERMAN 					40  && German Std Fanfold 8 1/2 x 12 in
#DEFINE cnPRTPAPER_FANFOLD_LGL_GERMAN 					41  && German Legal Fanfold 8 1/2 x 13 in
#DEFINE cnPRTPAPER_PAPER_USER							256 && User defined page size

***************************************************************************************************************************
*-- STRCONV() values 
***************************************************************************************************************************
#DEFINE cnSTRCONV_DBCS_UNICODE  						5
#DEFINE cnSTRCONV_UNICODE_DBCS  						6
#DEFINE cnSTRCONV_DBCS_UTF8  							9
#DEFINE cnSTRCONV_UNICODE_UTF8  						10

#DEFINE cnSTRCONV_REGIONTYPE_LOCALE  					0 
#DEFINE cnSTRCONV_REGIONTYPE_CODEPAGE  					1
#DEFINE cnSTRCONV_REGIONTYPE_FONTCHARSET  				2

***************************************************************************************************************************
*-- Export file types
***************************************************************************************************************************
#DEFINE cnWORD 					         				1
#DEFINE cnHTML               			 				2
#DEFINE cnRTF               			 				3
#DEFINE cnEXCEL               			 				4
#DEFINE cnXML               			 				5
#DEFINE cnPREVIEW               			 			6
#DEFINE cnPDF	               			 	    		7
#DEFINE cnIMAGE	               			 	    		8

***************************************************************************************************************************
*-- Report object types.
***************************************************************************************************************************
#DEFINE cnREPOBJ_HEADER             					1
#DEFINE cnREPOBJ_TEXT               					5
#DEFINE cnREPOBJ_LINE               					6
#DEFINE cnREPOBJ_BOX                					7
#DEFINE cnREPOBJ_FIELD              					8
#DEFINE cnREPOBJ_BAND               					9
#DEFINE cnREPOBJ_IMAGE              					17
#DEFINE cnREPOBJ_VARIABLE								18
#DEFINE cnREPOBJ_DE		              					25
#DEFINE cnREPOBJ_DE_OBJ	              					26

***************************************************************************************************************************
*-- Report object codes (for bands).
***************************************************************************************************************************
#DEFINE cnBAND_TITLE_REPOBJ_CODE        				0
#DEFINE cnBAND_PAGE_HEADER_REPOBJ_CODE  				1
#DEFINE cnBAND_COL_HEADER_REPOBJ_CODE   				2
#DEFINE cnBAND_GROUP_HEADER_REPOBJ_CODE 				3
#DEFINE cnBAND_DETAIL_REPOBJ_CODE       				4
#DEFINE cnBAND_GROUP_FOOTER_REPOBJ_CODE 				5
#DEFINE cnBAND_COL_FOOTER_REPOBJ_CODE   				6
#DEFINE cnBAND_PAGE_FOOTER_REPOBJ_CODE  				7
#DEFINE cnBAND_SUMMARY_REPOBJ_CODE      				8

