***************************************************************************************************************************
*-- SYSMETRIC() Valid types to pass
***************************************************************************************************************************
#DEFINE cnSCR_WIDTH		      		  					1
#DEFINE cnSCR_HEIGHT	       		  					2

***************************************************************************************************************************
*-- PRTINFO() Valid types to pass
***************************************************************************************************************************
#DEFINE cnPRT_ORIENTATION         	  					1
#DEFINE cnPRT_PAPERSIZE               					2
#DEFINE cnPRT_PAPERLENGTH             					3
#DEFINE cnPRT_PAPERWIDTH              					4
#DEFINE cnPRT_SCALE                   					5
#DEFINE cnPRT_COPIES                  					6
#DEFINE cnPRT_DEFASOURCE              					7
#DEFINE cnPRT_PRINTQUAL               					8
#DEFINE cnPRT_COLOR                   					9
#DEFINE cnPRT_DUPLEX                  					10
#DEFINE cnPRT_YRESOLUTION             					11
#DEFINE cnPRT_TTOPTION                					12
#DEFINE cnPRT_COLLATE                 					13

***************************************************************************************************************************
*--PRTINFO() Return types
***************************************************************************************************************************
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

#DEFINE cnPRTPAPER_A2         		  					66  && A2 420 x 594 mm
#DEFINE cnPRTPAPER_ISO_A4         		  				149 && ISO A3 210 x 297 mm
#DEFINE cnPRTPAPER_ISO_A3         		  				150 && ISO A3 297 x 420 mm
#DEFINE cnPRTPAPER_ISO_A2         		  				151 && ISO A2 420 x 594 mm
#DEFINE cnPRTPAPER_ISO_A1         		  				152 && ISO A1 594 x 841 mm
#DEFINE cnPRTPAPER_ISO_A0         		  				153 && ISO A0 841 x 1189 mm

#DEFINE cnPRTPAPER_FANFOLD			 					130 && Fanfold 8 1/2 x 12 in
#DEFINE cnPRTPAPER_PAPER_USER							256 && User defined page size

***************************************************************************************************************************
*-- Paper bins
***************************************************************************************************************************
#DEFINE cnPRTBIN_UPPER        		  					1
#DEFINE cnPRTBIN_ONLYONE         	  					1
#DEFINE cnPRTBIN_LOWER            	  					2
#DEFINE cnPRTBIN_MIDDLE               					3
#DEFINE cnPRTBIN_MANUAL       	      					4
#DEFINE cnPRTBIN_ENVELOPE    	      					5
#DEFINE cnPRTBIN_ENVMANUAL  	      					6
#DEFINE cnPRTBIN_AUTO        	      					7
#DEFINE cnPRTBIN_TRACTOR     	      					8
#DEFINE cnPRTBIN_SMALLFMT   	      					9
#DEFINE cnPRTBIN_LARGEFMT   	      					10
#DEFINE cnPRTBIN_LARGECAPACITY	      					11
#DEFINE cnPRTBIN_CASSETTE   	      					14

***************************************************************************************************************************
*-- Print qualities
***************************************************************************************************************************
#DEFINE cnPRTRES_DRAFT 			     					-1
#DEFINE cnPRTRES_LOW 		         					-2
#DEFINE cnPRTRES_MEDIUM              					-3
#DEFINE cnPRTRES_HIGH                					-4

***************************************************************************************************************************
*-- Color printer
***************************************************************************************************************************
#DEFINE cnPRTCOLOR_MONOCHROME         					1
#DEFINE cnPRTCOLOR_COLOR              					2

***************************************************************************************************************************
*-- Duplexing
***************************************************************************************************************************
#DEFINE cnPRTDUP_SIMPLEX              					1
#DEFINE cnPRTDUP_VERTICAL             					2
#DEFINE cnPRTDUP_HORIZONTAL           					3

***************************************************************************************************************************
*-- True Type fonts
***************************************************************************************************************************
#DEFINE cnPRTTT_BITMAP   			  					1  && Print True Type fonts as graphics
#DEFINE cnPRTTT_DOWNLOAD 			  					2  && Download True Type fonts as soft fonts
#DEFINE cnPRTTT_SUBDEV  			  					3  && Substitute device fonts for True Type

***************************************************************************************************************************
*-- Page orientation
***************************************************************************************************************************
#DEFINE cnPRTORT_PORT    			  					0
#DEFINE cnPRTORT_LAND   			  					1

***************************************************************************************************************************
*-- GETDEVICECAPS() Valid types to pass
***************************************************************************************************************************
#DEFINE cnHORZRES  			   		  					8
#DEFINE cnVERTRES 		 			  					10
#DEFINE cnLOGPIXELSX   				  					88
#DEFINE cnLOGPIXELSY   				  					90
#DEFINE cnPHYSICALWIDTH   			  					110
#DEFINE cnPHYSICALHEIGHT  			  					111
#DEFINE cnPHYSICALOFFSETX 			  					112
#DEFINE cnPHYSICALOFFSETY  			  					113

***************************************************************************************************************************
*-- EnumPrinters() Valid types to pass
***************************************************************************************************************************
#DEFINE cnPRINTER_ENUM_DEFAULT      					1
#DEFINE cnPRINTER_ENUM_LOCAL        					2
#DEFINE cnPRINTER_ENUM_CONNECTIONS  					4
#DEFINE cnPRINTER_ENUM_FAVORITE     					4
#DEFINE cnPRINTER_ENUM_NAME         					8
#DEFINE cnPRINTER_ENUM_REMOTE      						16
#DEFINE cnPRINTER_ENUM_SHARED      						32
#DEFINE cnPRINTER_ENUM_NETWORK     						64


***************************************************************************************************************************
*-- Excel Paper sizes
***************************************************************************************************************************
#DEFINE cnEXCEL_PAPER_LETTER							1
#DEFINE cnEXCEL_PAPER_LETTER_SMALL						2
#DEFINE cnEXCEL_PAPER_TABLOID							3
#DEFINE cnEXCEL_PAPER_LEDGER							4
#DEFINE cnEXCEL_PAPER_LEGAL								5
#DEFINE cnEXCEL_PAPER_STATEMENT							6
#DEFINE cnEXCEL_PAPER_EXECUTIVE							7
#DEFINE cnEXCEL_PAPER_A3								8	
#DEFINE cnEXCEL_PAPER_A4								9	
#DEFINE cnEXCEL_PAPER_A4_SMALL							10
#DEFINE cnEXCEL_PAPER_A5								11	
#DEFINE cnEXCEL_PAPER_B4								12
#DEFINE cnEXCEL_PAPER_B5								13
#DEFINE cnEXCEL_PAPER_FOLIO								14
#DEFINE cnEXCEL_PAPER_QUATRO							15
#DEFINE cnEXCEL_PAPER_10_14								16
#DEFINE cnEXCEL_PAPER_11_17								17
#DEFINE cnEXCEL_PAPER_NOTE								18
#DEFINE cnEXCEL_PAPER_ENVELOPE_9						19
#DEFINE cnEXCEL_PAPER_ENVELOPE_10						20
#DEFINE cnEXCEL_PAPER_ENVELOPE_11						21
#DEFINE cnEXCEL_PAPER_ENVELOPE_12						22
#DEFINE cnEXCEL_PAPER_ENVELOPE_14						23
#DEFINE cnEXCEL_PAPER_C_SHEET							24
#DEFINE cnEXCEL_PAPER_D_SHEET							25
#DEFINE cnEXCEL_PAPER_E_SHEET							26
#DEFINE cnEXCEL_PAPER_ENVELOPE_DL						27
#DEFINE cnEXCEL_PAPER_ENVELOPE_C5						28
#DEFINE cnEXCEL_PAPER_ENVELOPE_C3						29
#DEFINE cnEXCEL_PAPER_ENVELOPE_C4						30
#DEFINE cnEXCEL_PAPER_ENVELOPE_C6						31
#DEFINE cnEXCEL_PAPER_ENVELOPE_C65						32
#DEFINE cnEXCEL_PAPER_ENVELOPE_B4						33
#DEFINE cnEXCEL_PAPER_ENVELOPE_B5						34
#DEFINE cnEXCEL_PAPER_ENVELOPE_B6						35
#DEFINE cnEXCEL_PAPER_ENVELOPE_ITALY					36
#DEFINE cnEXCEL_PAPER_ENVELOPE_MONARCH					37
#DEFINE cnEXCEL_PAPER_ENVELOPE_PERSONAL					38
#DEFINE cnEXCEL_PAPER_FANFOLD_US						39
#DEFINE cnEXCEL_PAPER_FANFOLD_STD_GERMAN				40
#DEFINE cnEXCEL_PAPER_FANFOLD_LEGAL_GERMAN				41
#DEFINE cnEXCEL_PAPER_USER								256
