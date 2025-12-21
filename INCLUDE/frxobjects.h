***************************************************************************************************************************
*-- Totaling types.
***************************************************************************************************************************
#DEFINE ccTOTAL_NONE                				'N'
#DEFINE ccTOTAL_COUNT               				'C'
#DEFINE ccTOTAL_SUM                 				'S'
#DEFINE ccTOTAL_AVERAGE             				'A'
#DEFINE ccTOTAL_LOWEST              				'L'
#DEFINE ccTOTAL_HIGHEST             				'H'
#DEFINE ccTOTAL_STDDEV              				'D'
#DEFINE ccTOTAL_VARIANCE            				'V'

#DEFINE cnTOTAL_NONE                				0
#DEFINE cnTOTAL_COUNT               				1
#DEFINE cnTOTAL_SUM                 				2
#DEFINE cnTOTAL_AVERAGE             				3
#DEFINE cnTOTAL_LOWEST              				4
#DEFINE cnTOTAL_HIGHEST             				5
#DEFINE cnTOTAL_STDDEV              				6
#DEFINE cnTOTAL_VARIANCE            				7

***************************************************************************************************************************
*-- Object alignment constants.
***************************************************************************************************************************
#DEFINE ccALIGN_LEFT                				'LEFT'
#DEFINE ccALIGN_CENTER              				'CENTER'
#DEFINE ccALIGN_RIGHT               				'RIGHT'
#DEFINE cnALIGN_LEFT                				0
#DEFINE cnALIGN_RIGHT               				1
#DEFINE cnALIGN_CENTER              				2

***************************************************************************************************************************
*-- Report font style constants.
***************************************************************************************************************************
#DEFINE cnSTYLE_NORMAL              				0
#DEFINE cnSTYLE_BOLD                				1
#DEFINE cnSTYLE_ITALIC              				2
#DEFINE cnSTYLE_UNDERLINE           				4
#DEFINE cnSTYLE_STRIKETHRU							128

***************************************************************************************************************************
*-- Report measurement units.
***************************************************************************************************************************
#DEFINE ccUNITS_CHARACTERS          				'C'
#DEFINE ccUNITS_INCHES              				'I'
#DEFINE ccUNITS_CENTIMETERS         				'M'

***************************************************************************************************************************
*-- Report object types.
***************************************************************************************************************************
#DEFINE cnREPOBJ_HEADER             				1
#DEFINE cnREPOBJ_TEXT               				5
#DEFINE cnREPOBJ_LINE               				6
#DEFINE cnREPOBJ_BOX                				7
#DEFINE cnREPOBJ_FIELD              				8
#DEFINE cnREPOBJ_BAND               				9
#DEFINE cnREPOBJ_IMAGE              				17
#DEFINE cnREPOBJ_VARIABLE							18
#DEFINE cnREPOBJ_DE		              				25
#DEFINE cnREPOBJ_DE_OBJ	              				26
#DEFINE cnREPOBJ_RTF	              				97


***************************************************************************************************************************
*-- Report object codes (for bands).
***************************************************************************************************************************
#DEFINE cnBAND_TITLE_REPOBJ_CODE        			0
#DEFINE cnBAND_PAGE_HEADER_REPOBJ_CODE  			1
#DEFINE cnBAND_COL_HEADER_REPOBJ_CODE   			2
#DEFINE cnBAND_GROUP_HEADER_REPOBJ_CODE 			3
#DEFINE cnBAND_DETAIL_REPOBJ_CODE       			4
#DEFINE cnBAND_GROUP_FOOTER_REPOBJ_CODE 			5
#DEFINE cnBAND_COL_FOOTER_REPOBJ_CODE   			6
#DEFINE cnBAND_PAGE_FOOTER_REPOBJ_CODE  			7
#DEFINE cnBAND_SUMMARY_REPOBJ_CODE      			8

***************************************************************************************************************************
*-- Report multy-band object codes 
***************************************************************************************************************************
#DEFINE cnFROM_TITLE_BAND_TO_ANY_BAND				0
#DEFINE cnFROM_TITLE_BAND_TO_ANY_BAND_RSZ  	  		1
#DEFINE cnFROM_PAGE_HEADER_BAND_TO_ANY_BAND    		2
#DEFINE cnFROM_PAGE_HEADER_BAND_TO_ANY_BAND_RSZ		3
#DEFINE cnFROM_ANY_BAND_TO_ANY_BAND					4
#DEFINE cnFROM_GROUP_HEADER_BAND_TO_ANY_BAND		5
#DEFINE cnFROM_GROUP_HEADER_BAND_TO_ANY_BAND_RSZ	6

***************************************************************************************************************************
*-- Report band names (in upper case). Not need any more
***************************************************************************************************************************
*#DEFINE ccBAND_PAGE_HEADER          				'PAGE HEADER'
*#DEFINE ccBAND_PAGE_FOOTER          				'PAGE FOOTER'
*#DEFINE ccBAND_DETAIL               				'DETAIL'
*#DEFINE ccBAND_TITLE                				'TITLE'
*#DEFINE ccBAND_SUMMARY              				'SUMMARY'
*#DEFINE ccBAND_GROUP_HEADER         				'GROUP HEADER'
*#DEFINE ccBAND_GROUP_FOOTER         				'GROUP FOOTER'
*#DEFINE ccBAND_COL_HEADER           				'COLUMN HEADER'
*#DEFINE ccBAND_COL_FOOTER           				'COLUMN FOOTER'

***************************************************************************************************************************
*-- Report band ID
***************************************************************************************************************************
#DEFINE ccBAND_TITLE_ID             				100000
#DEFINE ccBAND_PAGE_HEADER_ID       				200000
#DEFINE ccBAND_GROUP_HEADER_ID      				300000
#DEFINE ccBAND_DETAIL_ID            				400000
#DEFINE ccBAND_GROUP_FOOTER_ID      				500000
#DEFINE ccBAND_SUMMARY_ID           				600000
#DEFINE ccBAND_PAGE_FOOTER_ID       				700000

***************************************************************************************************************************
*-- Report band Caption.
***************************************************************************************************************************
#DEFINE ccBAND_PAGE_HEADER_CAPTION  				'Page Header'
#DEFINE ccBAND_PAGE_FOOTER_CAPTION  				'Page Footer'
#DEFINE ccBAND_DETAIL_CAPTION       				'Detail'
#DEFINE ccBAND_TITLE_CAPTION        				'Title'
#DEFINE ccBAND_SUMMARY_CAPTION      				'Summary'
#DEFINE ccBAND_GROUP_HEADER_CAPTION 				'Group Header'
#DEFINE ccBAND_GROUP_FOOTER_CAPTION 				'Group Footer'
*****#DEFINE ccBAND_GROUP_CAPTION 					'Group'
#DEFINE ccBAND_COLUMN_HEADER_CAPTION 				'Group Header'
#DEFINE ccBAND_COLUMN_FOOTER_CAPTION 				'Group Footer'

***************************************************************************************************************************
*-- Report object's class name.
***************************************************************************************************************************
#DEFINE ccOBJ_FIELD_CLS_NAME        				'ReportTxt'
#DEFINE ccOBJ_TEXT_CLS_NAME         				'ReportLbl'
#DEFINE ccOBJ_HLINE_CLS_NAME        				'ReportHLin'
#DEFINE ccOBJ_VLINE_CLS_NAME        				'ReportVLin'
#DEFINE ccOBJ_IMAGE_CLS_NAME       					'ReportImg'
#DEFINE ccOBJ_BOX_CLS_NAME          				'ReportShp'

#DEFINE ccOBJ_REPORT_FIELD_CLS_NAME    				'ReportField'
#DEFINE ccOBJ_REPORT_TEXT_CLS_NAME     				'ReportText'
#DEFINE ccOBJ_REPORT_LINE_CLS_NAME      			'ReportLine'
#DEFINE ccOBJ_REPORT_IMAGE_CLS_NAME    				'ReportImage'
#DEFINE ccOBJ_REPORT_BOX_CLS_NAME      				'ReportBox'

#DEFINE ccOBJ_REPORT_FILE_CLS_NAME  				'ReportFile'
#DEFINE ccOBJ_REPORT_BAND_CLS_NAME  				'ReportBand'
#DEFINE ccOBJ_REPORT_GROUP_CLS_NAME 				'ReportGroup'
#DEFINE ccOBJ_REPORT_VARIABLE_CLS_NAME  			'ReportVariable'

***************************************************************************************************************************
*-- Report object types (in upper case).
***************************************************************************************************************************
#DEFINE ccOBJECT_FIELD              				'FIELD'
#DEFINE ccOBJECT_TEXT               				'TEXT'
#DEFINE ccOBJECT_LINE               				'LINE'
#DEFINE ccOBJECT_IMAGE              				'IMAGE'
#DEFINE ccOBJECT_BOX                				'BOX'
#DEFINE ccOBJECT_CURSOR                				'CURSOR'
#DEFINE ccOBJECT_RELATION                			'RELATION'

***************************************************************************************************************************
*-- Report line types 
***************************************************************************************************************************
#DEFINE cnREPORT_PEN_PATTERN_NONE		  			0
#DEFINE cnREPORT_PEN_PATTERN_DOTTED		  			1
#DEFINE cnREPORT_PEN_PATTERN_DASHED		  			2
#DEFINE cnREPORT_PEN_PATTERN_DASH_DOT	  			3
#DEFINE cnREPORT_PEN_PATTERN_DASH_DOT_DOT 			4
#DEFINE cnREPORT_PEN_PATTERN_NORMAL 	  			8

***************************************************************************************************************************
*-- Report Fill types 
***************************************************************************************************************************
#DEFINE cnREPORT_FILL_PATTERN_NO_FILL_NO_COLOR		0
#DEFINE cnREPORT_FILL_PATTERN_NO_FILL_ONLY_COLOR	1
#DEFINE cnREPORT_FILL_PATTERN_HORIZONTAL			2
#DEFINE cnREPORT_FILL_PATTERN_VERTICAL			    3
#DEFINE cnREPORT_FILL_PATTERN_DOWNWARD_DIAGONAL		4
#DEFINE cnREPORT_FILL_PATTERN_UPWARD_DIAGONAL		5
#DEFINE cnREPORT_FILL_PATTERN_GRID					6
#DEFINE cnREPORT_FILL_PATTERN_DIAMOND				7

***************************************************************************************************************************
*-- Object positions options.
***************************************************************************************************************************
#DEFINE cnPOSITION_FLOAT            				1
#DEFINE cnPOSITION_TOP              				2
#DEFINE cnPOSITION_BOTTOM           				3

***************************************************************************************************************************
*-- Image scale types
***************************************************************************************************************************
#DEFINE cnIMAGE_SCALE_CLIP                 	        0
#DEFINE cnIMAGE_SCALE_KEEP_SHAPE    				1
#DEFINE cnIMAGE_SCALE_STRETCH       				2

***************************************************************************************************************************
*-- FRX's Page Orientation Constant Group
***************************************************************************************************************************
#DEFINE cnFRX_PAGE_ORIENTATION_PORTRAIT				0
#DEFINE cnFRX_PAGE_ORIENTATION_LANDSCAPE  			1

***************************************************************************************************************************
*-- Other constants.
***************************************************************************************************************************
#DEFINE cnPOINTS_PER_INCH           				72
#DEFINE cnPIXELS_PER_INCH           				96
#DEFINE cnPOINTS_PER_PIXELS           				0.75
#DEFINE cnBITS_PER_PIXEL	           				24
#DEFINE cnTWIPS_PER_POINT                           20
#DEFINE cnTWIPS_PER_PIXEL 							15               

***************************************************************************************************************************
*-- cnVERTICAL_FUDGE is a "fudge factor" used so objects are correctly placed.
***************************************************************************************************************************
#DEFINE cnVERTICAL_FUDGE            				2

***************************************************************************************************************************
*-- cnPEN_RED_FUDGE is a "fudge factor" for the PEN_RED value in an FRX.
***************************************************************************************************************************
#DEFINE cnPEN_RED_FUDGE             				4

***************************************************************************************************************************
*-- cnREPORT_UNITS is the number of report units (a value used for all
*-- measurements inside the FRX) per inch
***************************************************************************************************************************
#DEFINE cnREPORT_UNITS              				10000

***************************************************************************************************************************
*-- cnFACTOR is the number of report units per pixel. It's calculated as report
*-- units per inch (10,000) divided by pixels per inch (96). 10000/96 = 104.166.
***************************************************************************************************************************
#DEFINE cnFACTOR                    				104.166            

***************************************************************************************************************************
*-- cnFACTOR_POINT is the number of report units per point. It's calculated as report
*-- units per inch (10,000) divided by points per inch (72). 10000/72 = 138.889
***************************************************************************************************************************
#DEFINE cnFACTOR_POINT                 				138.889            

***************************************************************************************************************************
*-- cnBAND_HEIGHT is the height of the band separator, which is 20 pixels or
*-- 2083.333 report units.
***************************************************************************************************************************
#DEFINE cnBAND_HEIGHT               				2083.333
#DEFINE cnBAND_HEIGHT_IN_PIXELS        				20

***************************************************************************************************************************
*-- Height of the Spliter
***************************************************************************************************************************
#DEFINE cnSPLITER_HEIGHT							15

***************************************************************************************************************************
*-- cnGROUP_OFFSET is what to add to a group number for group breaks.
***************************************************************************************************************************
#DEFINE cnGROUP_OFFSET              				6

***************************************************************************************************************************
*-- When reset totals 
***************************************************************************************************************************
#DEFINE cnRESET_ON_PAGE              				-3
#DEFINE cnRESET_ON_END_OF_REPORT       				-4
#DEFINE cnRESET_ON_START_OF_REPORT       			-5

***************************************************************************************************************************
*-- Type of Image source 
***************************************************************************************************************************
#DEFINE cnIMAGE_SOURCE_FILE              			0
#DEFINE cnIMAGE_SOURCE_FIELD        			    1
#DEFINE cnIMAGE_SOURCE_EXPRESSION        			2

***************************************************************************************************************************
*-- ccAVG_CHAR is the "average" character in a font used to determine object sizing.
***************************************************************************************************************************
#DEFINE ccAVG_CHAR                  				'N'

***************************************************************************************************************************
*-- ccSPACE_CHAR is the "space" character in a font used to determine object sizing.
***************************************************************************************************************************
#DEFINE ccSPACE_CHAR                  				' '

***************************************************************************************************************************
*-- Error numbers.
***************************************************************************************************************************
*#DEFINE cnERR_USER_DEFINED							1098

***************************************************************************************************************************
*-- User-DEFINEd error
***************************************************************************************************************************
*#DEFINE cnERR_PROPERTY_INVALID      				1560

***************************************************************************************************************************
*-- Property value invalid
***************************************************************************************************************************
*#DEFINE cnERR_PROPERTY_TYPE_INVALID 				1732

*-- Data type invalid for this property
***************************************************************************************************************************
*-- Error messages.
***************************************************************************************************************************
#DEFINE ccERR_NO_REPORT_FILE        				'The name of the report file was not specified'
