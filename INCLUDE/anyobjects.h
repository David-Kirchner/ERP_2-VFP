***************************************************************************************************************************
*-- Return values 
***************************************************************************************************************************
#DEFINE cnOK 	     				     			0       && Everything is OK.
#DEFINE cnNO_PARAMETERS    				 			1       && No parameter
#DEFINE cnREP_FILE_NOT_FOUND			 			2       && Report file not found
#DEFINE cnNO_BANDS_DEFINED 				 			3       && No bands defined in FRX file (corrupted?)
#DEFINE cnNO_OPEN_TABLE    				 			4       && No open table and no dataenviroment cursors in FRX file
#DEFINE cnEOF           				 			5       && Main alias at EOF() and no dataenvironment cursors
#DEFINE cnCANNOT_INSTANCE_WORD_APP		 			6       && Cannot instance a Word.Application
#DEFINE cnNO_HEADER_RECORD 				 			7       && No header record in FRX file (corrupted?)
#DEFINE cnNO_ANY_OBJECTS   				 			8       && No labels, fields, or images.
#DEFINE cnERR_CREATING_FILE				 			9  	 	&& Error creating DOC
#DEFINE cnUSER_INTERRUPTED				 			10  	&& User interrupted

#DEFINE cnINVALID_BANDTYPE_PARAMETER	 			11  	 
#DEFINE cnINVALID_ARRAY_REPORT_OBJ_PARAMETER		12
#DEFINE cnINVALID_NUMBER_OF_PARAMETER				13
#DEFINE cnINVALID_TYPE_OF_PARAMETER	 				14  	 
#DEFINE cnINVALID_SPECIFIED_OBJECT_TYPE				15
#DEFINE cnWRONG_EXPORT_FILE_TYPE					16
#DEFINE cnDE_INIT_RETURN_FALSE						17		&& DE Init metod return false 
#DEFINE cnCANNOT_INSTANCE_EXCEL_APP		 			18      && Cannot instance a Excel.Application
#DEFINE cnCANNOT_INSTANCE_PREVIEW_FORM          	19      && Cannot instance a Preview Form
#DEFINE cnCANNOT_INSTANCE_OUTLOOK_APP		 		20      && Cannot instance a Outlook.OutPut
#DEFINE cnCANNOT_INSTANCE_HTML_FILE					21
#DEFINE cnPAGEHEADER_BAND_IS_TOO_LARGE		 		22      && Page Header band is too large to fit on page
#DEFINE cnTITLE_BAND_IS_TOO_LARGE		 	    	23      && Title band is too large to fit on page

#DEFINE cnCANNOT_INSTANCE_IMAGE_FILE				24
#DEFINE cnCANNOT_CREATE_COMPATIBLE_BITMAP			25
#DEFINE cnCOMPATIBLE_BITMAP_SELECTION_FAILED		26
#DEFINE cnFORM_TO_COMPATIBLE_BIT_FAILED				27
#DEFINE cnWRONG_DEVICE_CONTEXT						28
#DEFINE cnBITMAP_FAILED								29
#DEFINE cnCANNOT_FIND_WINDOW						30
#DEFINE cnOUT_OF_PAGES_RANGE						31
#DEFINE cnTHERE_IS_NO_PAGES_TO_PRINT				32
#DEFINE cnCANNOT_CREATE_IMAGE_FILE					33

#DEFINE cnCANNOT_INSTANCE_PDF_FILE					34
#DEFINE cnCANNOT_INSTANCE_XML_FILES					35
#DEFINE cnCANNOT_INSTANCE_GRAPHICS_OBJECT			36

***************************************************************************************************************************
*-- OutPut options
***************************************************************************************************************************
#DEFINE cnOUTPUT_SCREEN			         			1
#DEFINE cnOUTPUT_PRINT			         			2
#DEFINE cnOUTPUT_EMAIL			         			3
#DEFINE cnOUTPUT_FILE		 	         			4

***************************************************************************************************************************
*-- The scope clauses types 
***************************************************************************************************************************
#DEFINE cnSCOPE_CLAUSE_ALL		         			1
#DEFINE cnSCOPE_CLAUSE_NEXT		         			2
#DEFINE cnSCOPE_CLAUSE_RECORD	         			3
#DEFINE cnSCOPE_CLAUSE_REST 	         			4

***************************************************************************************************************************
*-- Export file types
***************************************************************************************************************************
#DEFINE cnWORD 					         			1
#DEFINE cnHTML               			 			2
#DEFINE cnRTF               			 			3
#DEFINE cnEXCEL               			 			4
#DEFINE cnXML               			 			5
#DEFINE cnPREVIEW               			 		6
#DEFINE cnPDF	               			 	    	7
#DEFINE cnIMAGE	               			 	    	8
#DEFINE cnCHART										9
#DEFINE cnRTFEngine									10
***************************************************************************************************************************
*-- Report file extention
***************************************************************************************************************************
#DEFINE ccREPORT_EXT			         			'frx'
#DEFINE ccREPORT_MEMO_EXT			     			'frt'

***************************************************************************************************************************
*-- Export file extention
***************************************************************************************************************************
#DEFINE ccWORD_EXT 				         			'doc'
#DEFINE ccHTML_EXT             			 			'htm'
#DEFINE ccMHT_EXT             			 			'mht'
#DEFINE ccRTF_EXT              			 			'rtf'
#DEFINE ccEXCEL_EXT             			 		'xls'
#DEFINE ccFRX_EXT             			 			'frx'
#DEFINE ccXML_EXT             			 			'xml'
#DEFINE ccPREVIEW_EXT								'prv'
#DEFINE ccPDF_EXT									'pdf'
#DEFINE ccBMP_EXT							    	'bmp'
#DEFINE ccJPG_EXT									'jpg'
#DEFINE ccGIF_EXT									'gif'
#DEFINE ccTIF_EXT									'tif'
#DEFINE ccPNG_EXT									'png'
#DEFINE ccIMG_EXT									'img'

***************************************************************************************************************************
*-- Type of DataSession
***************************************************************************************************************************
#DEFINE cnDATASESSION_DEFAULT						1
#DEFINE cnDATASESSION_PRIVATE						2

***************************************************************************************************************************
*-- Report object's class name for Any.
***************************************************************************************************************************
#DEFINE ccOBJ_ANY_DE_CLS_NAME      		 			'AnyDE'
#DEFINE ccOBJ_ANY_RELATION_CLS_NAME      			'AnyRelation'
#DEFINE ccOBJ_ANY_CURSOR_CLS_NAME        			'AnyCursor'
#DEFINE ccOBJ_ANY_BOX_CLS_NAME      	 			'AnyBox'
#DEFINE ccOBJ_ANY_BAND_CLS_NAME          			'AnyBand'
#DEFINE ccOBJ_ANY_FIELD_CLS_NAME    	 			'AnyField'
#DEFINE ccOBJ_ANY_TEXT_CLS_NAME     	 			'AnyText'
#DEFINE ccOBJ_ANY_LINE_CLS_NAME          			'AnyLine'
#DEFINE ccOBJ_ANY_IMAGE_CLS_NAME    	 			'AnyImage'
#DEFINE ccOBJ_ANY_FILE_CLS_NAME  	     			'AnyFile'
#DEFINE ccOBJ_ANY_VARIABLE_CLS_NAME      			'AnyVariable'
#DEFINE ccOBJ_ANY_GROUP_CLS_NAME         			'AnyGroup'
#DEFINE ccOBJ_ANY_PRINTER_CLS_NAME  	 			'AnyPrinter'

***************************************************************************************************************************
***************************************************************************************************************************
*--Word-defined values 
***************************************************************************************************************************
***************************************************************************************************************************
*-- Word's Constants
***************************************************************************************************************************
#DEFINE cnSAVE_WORD_DOC_AS_WORD  		 			0							
#DEFINE cnSAVE_WORD_DOC_AS_RTF 			 			6							
#DEFINE cnSAVE_WORD_DOC_AS_HTML 		 			8					

***************************************************************************************************************************
*-- Word Window State constants.
***************************************************************************************************************************
#DEFINE cnWORD_WINDOW_NORMAL                        0
#DEFINE cnWORD_WINDOW_MAXIMIZED                     1
#DEFINE cnWORD_WINDOW_MINIMIZED                     2

***************************************************************************************************************************
*-- Word's transparency koefficient
***************************************************************************************************************************
#DEFINE cnWORD_TRANSPARENCY_FACTOR					0.4

***************************************************************************************************************************
*-- Word's ZOrder constant
***************************************************************************************************************************
#DEFINE cnWORD_BRING_TO_FRONT                       0
#DEFINE cnWORD_SEND_TO_BACK                         1
#DEFINE cnWORD_BRING_FORWARD                        2
#DEFINE cnWORD_SEND_BACKWARD                        3
#DEFINE cnWORD_BRING_IN_FRONT_OF_TEXT               4
#DEFINE cnWORD_SEND_BEHIND_TEXT                     5

***************************************************************************************************************************
*-- Word's Line types
***************************************************************************************************************************
#DEFINE cnWORD_PEN_PATTERN_NONE						0
#DEFINE cnWORD_PEN_PATTERN_NORMAL 		 			1
#DEFINE cnWORD_PEN_PATTERN_DOTTED		 			3
#DEFINE cnWORD_PEN_PATTERN_DASH_DOT_DOT	 			6
#DEFINE cnWORD_PEN_PATTERN_DASHED		 			7	 
#DEFINE cnWORD_PEN_PATTERN_DASH_DOT		 			8

***************************************************************************************************************************
*-- Word's Fill types
***************************************************************************************************************************
#DEFINE cnWORD_FILL_PATTERN_NO_FILL_NO_COLOR		0
#DEFINE cnWORD_FILL_PATTERN_NO_FILL_ONLY_COLOR		1
#DEFINE cnWORD_FILL_PATTERN_HORIZONTAL				19
#DEFINE cnWORD_FILL_PATTERN_VERTICAL				20
#DEFINE cnWORD_FILL_PATTERN_DOWNWARD_DIAGONAL		21
#DEFINE cnWORD_FILL_PATTERN_UPWARD_DIAGONAL			22
#DEFINE cnWORD_FILL_PATTERN_GRID					34
#DEFINE cnWORD_FILL_PATTERN_DIAMOND					41

***************************************************************************************************************************
*-- Word's Line measure factor
***************************************************************************************************************************
#DEFINE cnWORD_LINE_MEASURE_FACTOR       			0.30

***************************************************************************************************************************
*-- Word's Step measure factor
***************************************************************************************************************************
#DEFINE cnWORD_STEP_MEASURE_FACTOR       			0.75

***************************************************************************************************************************
*-- Word's Text object width measure factor
***************************************************************************************************************************
#DEFINE cnWORD_TEXT_WIDTH_MEASURE_FACTOR       		1.85

***************************************************************************************************************************
*-- Word object's alignment constants.
***************************************************************************************************************************
#DEFINE cnWORD_ALIGN_LEFT              	 			0
#DEFINE cnWORD_ALIGN_CENTER              			1
#DEFINE cnWORD_ALIGN_RIGHT               			2

***************************************************************************************************************************
*-- Word's Page margin
***************************************************************************************************************************
#DEFINE cnWORD_LR_MARGIN				 			18		&&0.25 * 72	
#DEFINE cnWORD_TB_MARGIN				 			14		&&0.25 * 72	

***************************************************************************************************************************
*-- Report object's class name for Word.
***************************************************************************************************************************
#DEFINE ccOBJ_WORD_FIELD_CLS_NAME    	 			'WordField'
#DEFINE ccOBJ_WORD_TEXT_CLS_NAME     	 			'WordText'
#DEFINE ccOBJ_WORD_LINE_CLS_NAME         			'WordLine'
#DEFINE ccOBJ_WORD_IMAGE_CLS_NAME    	 			'WordImage'
#DEFINE ccOBJ_WORD_BOX_CLS_NAME      	 			'WordBox'

#DEFINE ccOBJ_WORD_FILE_CLS_NAME  	     			'WordFile'
#DEFINE ccOBJ_WORD_BAND_CLS_NAME         			'WordBand'
#DEFINE ccOBJ_WORD_GROUP_CLS_NAME        			'WordGroup'


***************************************************************************************************************************
*-- Word's Page Orientation Constant Group
***************************************************************************************************************************
#DEFINE  cnWORD_PAGE_ORIENTATION_PORTRAIT       	0
#DEFINE  cnWORD_PAGE_ORIENTATION_LANDSCAPE      	1

***************************************************************************************************************************
*-- Word's 97 Color index constant Group
***************************************************************************************************************************
#DEFINE  cnWORD_COLOR_INDEX_AUTO                    0
#DEFINE  cnWORD_COLOR_INDEX_Black                   1
#DEFINE  cnWORD_COLOR_INDEX_Blue                    2
#DEFINE  cnWORD_COLOR_INDEX_Turquoise               3
#DEFINE  cnWORD_COLOR_INDEX_BrightGreen             4
#DEFINE  cnWORD_COLOR_INDEX_Pink                    5
#DEFINE  cnWORD_COLOR_INDEX_Red                     6
#DEFINE  cnWORD_COLOR_INDEX_Yellow                  7
#DEFINE  cnWORD_COLOR_INDEX_White                   8
#DEFINE  cnWORD_COLOR_INDEX_DarkBlue                9
#DEFINE  cnWORD_COLOR_INDEX_Teal                    10
#DEFINE  cnWORD_COLOR_INDEX_Green                   11
#DEFINE  cnWORD_COLOR_INDEX_Violet                  12
#DEFINE  cnWORD_COLOR_INDEX_DarkRed                 13
#DEFINE  cnWORD_COLOR_INDEX_DarkYellow              14
#DEFINE  cnWORD_COLOR_INDEX_Gray50                  15
#DEFINE  cnWORD_COLOR_INDEX_Gray25                  16
#DEFINE  cnWORD_COLOR_INDEX_ByAuthor                -1
#DEFINE  cnWORD_COLOR_INDEX_NoHighlight             0


***************************************************************************************************************************
*-- Report object's class name for RTF.
***************************************************************************************************************************
#DEFINE ccOBJ_RTF_FIELD_CLS_NAME    	 			'RTFField'
#DEFINE ccOBJ_RTF_TEXT_CLS_NAME     	 			'RTFText'
#DEFINE ccOBJ_RTF_LINE_CLS_NAME         			'RTFLine'
#DEFINE ccOBJ_RTF_IMAGE_CLS_NAME    	 			'RTFImage'
#DEFINE ccOBJ_RTF_BOX_CLS_NAME      	 			'RTFBox'

#DEFINE ccOBJ_RTF_FILE_CLS_NAME  	     			'RTFFile'
#DEFINE ccOBJ_RTF_BAND_CLS_NAME         			'RTFBand'
#DEFINE ccOBJ_RTF_GROUP_CLS_NAME        			'RTFGroup'

***************************************************************************************************************************
*-- RTF's Line types
***************************************************************************************************************************
#DEFINE cnRTF_PEN_PATTERN_NONE						0
#DEFINE cnRTF_PEN_PATTERN_NORMAL 		 			1
#DEFINE cnRTF_PEN_PATTERN_DOTTED		 			2
#DEFINE cnRTF_PEN_PATTERN_DASH_DOT		 			9
#DEFINE cnRTF_PEN_PATTERN_DASH_DOT_DOT	 			10
#DEFINE cnRTF_PEN_PATTERN_DASHED		 			7	 


***************************************************************************************************************************
*-- RTF's output types
***************************************************************************************************************************
#DEFINE cnRTF_OUTPUT_OBJECT   	                	1
#DEFINE cnRTF_OUTPUT_PLAIN							2


***************************************************************************************************************************
***************************************************************************************************************************
*-- HTML-defined values 
***************************************************************************************************************************
***************************************************************************************************************************
*-- HTML's Constants
***************************************************************************************************************************
#DEFINE cnSPACE 					     			3

***************************************************************************************************************************
*-- Page's margin (default)
***************************************************************************************************************************
#DEFINE cnHTML_LR_MARGIN				 			23.94	
#DEFINE cnHTML_TB_MARGIN				 			20.00		

***************************************************************************************************************************
*-- HTML's Line types   
***************************************************************************************************************************
#DEFINE cnHTML_PEN_PATTERN_NONE 		 			0
#DEFINE cnHTML_PEN_PATTERN_NORMAL 		 			1
#DEFINE cnHTML_PEN_PATTERN_DOTTED		 			3
#DEFINE cnHTML_PEN_PATTERN_DASHED		 			7	 

***************************************************************************************************************************
*-- HTML's Fill types   
***************************************************************************************************************************
#DEFINE cnHTML_FILL_PATTERN_NO_FILL_NO_COLOR		0
#DEFINE cnHTML_FILL_PATTERN_NO_FILL_ONLY_COLOR		1

***************************************************************************************************************************
*-- HTML's Tags
***************************************************************************************************************************
#DEFINE ccTAG_HTML_LT    	 			 			'&LT'
#DEFINE ccTAG_HTML_GT    	 			 			'&GT'
#DEFINE ccTAG_HTML_BR    	 			 			'<BR>'
#DEFINE ccTAG_HTML_P_START 	 			 			'<P '
#DEFINE ccTAG_HTML_P_END   	 			 			'</P>'

#DEFINE ccTAG_HTML_IMG_START 	 		 			'<IMG '
#DEFINE ccTAG_HTML_IMG_SRC 	 		 	 			'SRC='

#DEFINE ccSTL_POS_ABS    	 			 			'STYLE="Position:absolute;'
#DEFINE ccTOP		    	 			 			'Top:'
#DEFINE ccLEFT							 			'Left:'	
#DEFINE ccWIDTH							 			'Width:'	
#DEFINE ccHEIGHT						 			'Height:'	
#DEFINE ccBORDER						 			'Border:'	
#DEFINE ccFONT							 			'Font:'
#DEFINE ccBACKCOLOR			 			 			'Background-color:'
#DEFINE ccFORECOLOR		 	 			 			'Color:'
#DEFINE ccBORDER_WIDTH					 			'Border-width:'

#DEFINE ccBORDER_LEFT					 			'Border-left:'
#DEFINE ccBORDER_RIGHT					 			'Border-right:' 
#DEFINE ccBORDER_BOTTOM					 			'Border-bottom:'
#DEFINE ccBORDER_TOP					 			'Border-top:'
***************************************************************************************************************************
*-- Report object's class name for HTML.
***************************************************************************************************************************
#DEFINE ccOBJ_HTML_FIELD_CLS_NAME    	 			'HTMLField'
#DEFINE ccOBJ_HTML_TEXT_CLS_NAME     	 			'HTMLText'
#DEFINE ccOBJ_HTML_LINE_CLS_NAME         			'HTMLLine'
#DEFINE ccOBJ_HTML_IMAGE_CLS_NAME    	 			'HTMLImage'
#DEFINE ccOBJ_HTML_BOX_CLS_NAME      	 			'HTMLBox'

#DEFINE ccOBJ_HTML_FILE_CLS_NAME  	     			'HTMLFile'
#DEFINE ccOBJ_HTML_BAND_CLS_NAME         			'HTMLBand'
#DEFINE ccOBJ_HTML_GROUP_CLS_NAME        			'HTMLGroup'

***************************************************************************************************************************
*-- HTML object's alignment constants.
***************************************************************************************************************************
#DEFINE cnHTML_ALIGN_LEFT              	 			0
#DEFINE cnHTML_ALIGN_CENTER              			1
#DEFINE cnHTML_ALIGN_RIGHT               			2

#DEFINE ccHTML_TXT_ALIGN_RIGHT			 			'text-align:right;'
#DEFINE ccHTML_TXT_ALIGN_CENTER          			'text-align:center;'
#DEFINE ccHTML_TXT_ALIGN_LEFT            			'text-align:left;'
#DEFINE ccHTML_TXT_BOLD            		 			'bold'
#DEFINE ccHTML_TXT_ITALIC            	 			'italic'

#DEFINE ccBORDER_STYLE_SOLID			 			'border-style:solid;'
#DEFINE ccBORDER_STYLE_DOTTED			 			'border-style:dotted;'
#DEFINE ccBORDER_STYLE_DASHED			 			'border-style:dashed;'

#DEFINE ccBORDER_LEFT_STYLE_SOLID		 			'border-left-style:solid;'
#DEFINE ccBORDER_LEFT_STYLE_DOTTED		 			'border-left-style:dotted;'
#DEFINE ccBORDER_LEFT_STYLE_DASHED		 			'border-left-style:dashed;'

#DEFINE ccBORDER_RIGHT_STYLE_SOLID		 			'border-right-style:solid;'
#DEFINE ccBORDER_RIGHT_STYLE_DOTTED		 			'border-right-style:dotted;'
#DEFINE ccBORDER_RIGHT_STYLE_DASHED		 			'border-right-style:dashed;'

#DEFINE ccBORDER_TOP_STYLE_SOLID		 			'border-top-style:solid;'
#DEFINE ccBORDER_TOP_STYLE_DOTTED		 			'border-top-style:dotted;'
#DEFINE ccBORDER_TOP_STYLE_DASHED		 			'border-top-style:dashed;'

#DEFINE ccBORDER_BOTTOM_STYLE_SOLID		 			'border-bottom-style:solid;'
#DEFINE ccBORDER_BOTTOM_STYLE_DOTTED	 			'border-bottom-style:dotted;'
#DEFINE ccBORDER_BOTTOM_STYLE_DASHED	 			'border-bottom-style:dashed;'

#DEFINE ccOVERFLOW_HIDDEN				 			'overflow:hidden;'


***************************************************************************************************************************
***************************************************************************************************************************
*--FRX-defined values 
***************************************************************************************************************************
***************************************************************************************************************************
*-- Report object's class name for FRX.
***************************************************************************************************************************
*#DEFINE ccOBJ_F2A_OBJECT_CLS_NAME    	 			'F2AObject'
*#DEFINE ccOBJ_F2A_FILE_CLS_NAME  	     			'F2AFile'
*#DEFINE ccOBJ_F2A_BAND_CLS_NAME          			'F2ABand'
*#DEFINE ccOBJ_F2A_GROUP_CLS_NAME         			'F2AGroup'

#DEFINE ccOBJ_XML_FIELD_CLS_NAME    	 			'XMLFields'
#DEFINE ccOBJ_XML_TEXT_CLS_NAME     	 			'XMLText'
#DEFINE ccOBJ_XML_LINE_CLS_NAME         			'XMLLine'
#DEFINE ccOBJ_XML_IMAGE_CLS_NAME    	 			'XMLImage'
#DEFINE ccOBJ_XML_BOX_CLS_NAME      	 			'XMLBox'

#DEFINE ccOBJ_XML_FILE_CLS_NAME  	     			'XMLFile'
#DEFINE ccOBJ_XML_BAND_CLS_NAME         			'XMLBand'
#DEFINE ccOBJ_XML_GROUP_CLS_NAME        			'XMLGroup'

***************************************************************************************************************************
***************************************************************************************************************************
*--Excel-defined values 
***************************************************************************************************************************
***************************************************************************************************************************
*-- Excel's transparency koefficient
***************************************************************************************************************************
#DEFINE cnEXCEL_TRANSPARENCY_FACTOR					0.4

***************************************************************************************************************************
*-- Excel's ZOrder constant
***************************************************************************************************************************
#DEFINE cnEXCEL_BRING_TO_FRONT                      0
#DEFINE cnEXCEL_SEND_TO_BACK                        1
#DEFINE cnEXCEL_BRING_FORWARD                       2
#DEFINE cnEXCEL_SEND_BACKWARD                       3
#DEFINE cnEXCEL_BRING_IN_FRONT_OF_TEXT              4
#DEFINE cnEXCEL_SEND_BEHIND_TEXT                    5

***************************************************************************************************************************
*-- Excel Window State constants.
***************************************************************************************************************************
#DEFINE cnEXCEL_WINDOW_MAXIMIZED                    -4137
#DEFINE cnEXCEL_WINDOW_MINIMIZED                    -4140
#DEFINE cnEXCEL_WINDOW_NORMAL                       -4143

***************************************************************************************************************************
*-- Excel object's alignment constants.
***************************************************************************************************************************
#DEFINE cnEXCEL_ALIGN_LEFT              	 		-4131
#DEFINE cnEXCEL_ALIGN_CENTER              			-4108
#DEFINE cnEXCEL_ALIGN_RIGHT               			-4152
#DEFINE cnEXCEL_ALIGN_TOP	              	 		-4160
#DEFINE cnEXCEL_ALIGN_BOTTOM              	 		-4107

***************************************************************************************************************************
*-- Excel file's format constants.
***************************************************************************************************************************
#DEFINE cnEXCEL_SAVE_AS_HTML                        44

***************************************************************************************************************************
*-- Excel's Line types
***************************************************************************************************************************
#DEFINE cnEXCEL_PEN_PATTERN_NONE					0
#DEFINE cnEXCEL_PEN_PATTERN_NORMAL 		 			1
#DEFINE cnEXCEL_PEN_PATTERN_DOTTED		 			3
#DEFINE cnEXCEL_PEN_PATTERN_DASH_DOT_DOT	 		6
#DEFINE cnEXCEL_PEN_PATTERN_DASHED		 			7	 
#DEFINE cnEXCEL_PEN_PATTERN_DASH_DOT		 		8

***************************************************************************************************************************
*-- Excel's Fill types
***************************************************************************************************************************
#DEFINE cnEXCEL_FILL_PATTERN_NO_FILL_NO_COLOR		0
#DEFINE cnEXCEL_FILL_PATTERN_NO_FILL_ONLY_COLOR		1
#DEFINE cnEXCEL_FILL_PATTERN_HORIZONTAL				19
#DEFINE cnEXCEL_FILL_PATTERN_VERTICAL				20
#DEFINE cnEXCEL_FILL_PATTERN_DOWNWARD_DIAGONAL		21
#DEFINE cnEXCEL_FILL_PATTERN_UPWARD_DIAGONAL		22
#DEFINE cnEXCEL_FILL_PATTERN_GRID					34
#DEFINE cnEXCEL_FILL_PATTERN_DIAMOND				41

***************************************************************************************************************************
*-- Excel's Pattrn's color types
***************************************************************************************************************************
#DEFINE cnEXCEL_PATTERN_COLOR_SOLID					1
#DEFINE cnEXCEL_PATTERN_COLOR_NO					-4142

***************************************************************************************************************************
*-- Excel's Page margin
***************************************************************************************************************************
#DEFINE cnEXCEL_LR_MARGIN				 			18		&&0.25 * 72	
#DEFINE cnEXCEL_TB_MARGIN				 			14		&&0.25 * 72	

***************************************************************************************************************************
*-- Report object's class name for Excel.
***************************************************************************************************************************
#DEFINE ccOBJ_EXCEL_FIELD_CLS_NAME    	 			'ExcelField'
#DEFINE ccOBJ_EXCEL_TEXT_CLS_NAME     	 			'ExcelText'
#DEFINE ccOBJ_EXCEL_LINE_CLS_NAME         			'ExcelLine'
#DEFINE ccOBJ_EXCEL_IMAGE_CLS_NAME    	 			'ExcelImage'
#DEFINE ccOBJ_EXCEL_BOX_CLS_NAME      	 			'ExcelBox'

#DEFINE ccOBJ_EXCEL_FILE_CLS_NAME  	     			'ExcelFile'
#DEFINE ccOBJ_EXCEL_BAND_CLS_NAME         			'ExcelBand'
#DEFINE ccOBJ_EXCEL_GROUP_CLS_NAME        			'ExcelGroup'

***************************************************************************************************************************
*-- Excel's Page Orientation Constant Group
***************************************************************************************************************************
#DEFINE  cnEXCEL_PAGE_ORIENTATION_PORTRAIT      	1
#DEFINE  cnEXCEL_PAGE_ORIENTATION_LANDSCAPE     	2

***************************************************************************************************************************
*-- Excel's Text object width measure factor
***************************************************************************************************************************
#DEFINE cnEXCEL_TEXT_WIDTH_MEASURE_FACTOR      		1.85

***************************************************************************************************************************
*-- Excel's Save Conflict Resolution Constant Group
***************************************************************************************************************************
#DEFINE cnEXCEL_USER_RESOLUTION           			1
#DEFINE cnEXCEL_LOCAL_SESSION_CHANGES           	2
#DEFINE cnEXCEL_OTHER_SESSION_CHANGES           	3

***************************************************************************************************************************
*-- Excel's Line measure factor
***************************************************************************************************************************
#DEFINE cnEXCEL_LINE_MEASURE_FACTOR       			0.30

***************************************************************************************************************************
*-- Excel's Step measure factor
***************************************************************************************************************************
#DEFINE cnEXCEL_STEP_MEASURE_FACTOR       			0.75

***************************************************************************************************************************
*-- Excel's constant Group: XlPlacement
***************************************************************************************************************************
#DEFINE cnEXCEL_FREE_FLOATING                       3
#DEFINE cnEXCEL_MOVE                                2
#DEFINE cnEXCEL_MOVE_AND_SIZE                       1

***************************************************************************************************************************
*-- Excel's output types
***************************************************************************************************************************
#DEFINE cnEXCEL_OUTPUT_OBJECT                   	1
#DEFINE cnEXCEL_OUTPUT_PLAIN						2
#DEFINE cnEXCEL_OUTPUT_FULL_PLAIN					3
#DEFINE cnEXCEL_OUTPUT_DRAFT						4
#DEFINE cnEXCEL_OUTPUT_XMLSPREADSHEET				5

***************************************************************************************************************************
***************************************************************************************************************************
*--Report Previewer-defined values 
***************************************************************************************************************************
***************************************************************************************************************************
*-- Report object's class name for Preview.
***************************************************************************************************************************
#DEFINE cc_PRINT_PREVIEW_CLS_NAME         	       	'PrintPreview'

#DEFINE ccOBJ_PRINT_PREVIEW_FORM_CLS_NAME         	'PrintPreviewForm'
#DEFINE ccOBJ_PRINT_PREVIEW_PAGE_CLS_NAME         	'PrintPreviewPage'
#DEFINE ccOBJ_PRINT_PREVIEW_TOOL_BAR_CLS_NAME      	'PrintPreviewToolBar'
#DEFINE ccOBJ_PRINT_PREVIEW_FIND_CLS_NAME			'PrintPreviewFind'
#DEFINE ccOBJ_PRINT_PREVIEW_PRINT_CLS_NAME			'PrintPreviewPrint'
#DEFINE ccOBJ_PRINT_PREVIEW_RTF_CLS_NAME         	'PrintPreviewRTF'

#DEFINE ccOBJ_PRINT_PREVIEW_ITEM_PROPERTIES_CLS_NAME	'PrintPreviewItemProperties'
#DEFINE ccOBJ_PRINT_PREVIEW_CONTENTS_TOOL_BAR_CLS_NAME	'ShortcutsBarToolbar'


#DEFINE ccOBJ_PRINT_PREVIEW_IMAGE_CLS_NAME         	'PrintPreviewImage'
#DEFINE ccOBJ_PRINT_PREVIEW_LINE_CLS_NAME         	'PrintPreviewLine'
#DEFINE ccOBJ_PRINT_PREVIEW_BOX_CLS_NAME         	'PrintPreviewShape'
#DEFINE ccOBJ_PRINT_PREVIEW_TEXT_CLS_NAME         	'PrintPreviewTextBox'
#DEFINE ccOBJ_PRINT_PREVIEW_EDIT_CLS_NAME         	'PrintPreviewEditBox'

#DEFINE ccOBJ_PREVIEW_FIELD_CLS_NAME    	 		'PreviewField'
#DEFINE ccOBJ_PREVIEW_TEXT_CLS_NAME     	 		'PreviewText'
#DEFINE ccOBJ_PREVIEW_LINE_CLS_NAME          		'PreviewLine'
#DEFINE ccOBJ_PREVIEW_IMAGE_CLS_NAME    	 		'PreviewImage'
#DEFINE ccOBJ_PREVIEW_BOX_CLS_NAME      	 		'PreviewBox'
#DEFINE ccOBJ_PREVIEW_FILE_CLS_NAME  	     		'PreviewFile'
#DEFINE ccOBJ_PREVIEW_FORM_CLS_NAME  	     		'PreviewForm'
#DEFINE ccOBJ_PREVIEW_BAND_CLS_NAME          		'PreviewBand'
#DEFINE ccOBJ_PREVIEW_GROUP_CLS_NAME         		'PreviewGroup'

#DEFINE ccOBJ_CONTEXTMENU_CLS_NAME					'ContextMenu'
#DEFINE ccOBJ_TEXT_PROPERTIES_CLS_NAME 	 			'TextProperties'

***************************************************************************************************************************
*-- Page's margin (default)
***************************************************************************************************************************
#DEFINE cnPREVIEW_LR_MARGIN				 			23.94	
#DEFINE cnPREVIEW_TB_MARGIN				 			20.00		

***************************************************************************************************************************
*-- Preview object's alignment constants.
***************************************************************************************************************************
#DEFINE cnPREVIEW_ALIGN_LEFT            	 		0
#DEFINE cnPREVIEW_ALIGN_RIGHT               		1
#DEFINE cnPREVIEW_ALIGN_CENTER              		2

***************************************************************************************************************************
*-- Preview's Line types
***************************************************************************************************************************
#DEFINE cnPREVIEW_PEN_PATTERN_NONE					0
#DEFINE cnPREVIEW_PEN_PATTERN_NORMAL 		 		1
#DEFINE cnPREVIEW_PEN_PATTERN_DASHED		 		2 
#DEFINE cnPREVIEW_PEN_PATTERN_DOTTED		 		3
#DEFINE cnPREVIEW_PEN_PATTERN_DASH_DOT		 		4
#DEFINE cnPREVIEW_PEN_PATTERN_DASH_DOT_DOT	 		5

***************************************************************************************************************************
*-- Preview's Fill types
***************************************************************************************************************************
#DEFINE cnPREVIEW_FILL_PATTERN_NO_FILL_ONLY_COLOR 	0
#DEFINE cnPREVIEW_FILL_PATTERN_NO_FILL_NO_COLOR	  	1
#DEFINE cnPREVIEW_FILL_PATTERN_HORIZONTAL		  	2
#DEFINE cnPREVIEW_FILL_PATTERN_VERTICAL			  	3
#DEFINE cnPREVIEW_FILL_PATTERN_UPWARD_DIAGONAL	  	4
#DEFINE cnPREVIEW_FILL_PATTERN_DOWNWARD_DIAGONAL  	5
#DEFINE cnPREVIEW_FILL_PATTERN_GRID				  	6
#DEFINE cnPREVIEW_FILL_PATTERN_DIAMOND			  	7

***************************************************************************************************************************
*-- Preview's Window WindowState types
***************************************************************************************************************************
#DEFINE cnPREVIEW_WINDOW_STATE_NORMAL				0
#DEFINE cnPREVIEW_WINDOW_STATE_MIN					1
#DEFINE cnPREVIEW_WINDOW_STATE_MAX					2

***************************************************************************************************************************
*-- Preview's Window margin
***************************************************************************************************************************
#DEFINE cnPREVIEW_WINDOW_MARGIN           			90			&& In Pixcels
#DEFINE cnPREVIEW_WINDOW_ZOOM_MARGIN           		15			&& In Pixcels
#DEFINE cnPREVIEW_WINDOW_MARGIN_BETWEEN_PAGES		10			&& In Pixcels

***************************************************************************************************************************
*-- Preview's ToolBar Positions
***************************************************************************************************************************
#DEFINE cnPREVIEW_WINDOW_TOOLBAR_NOTDOCKED          -1
#DEFINE cnPREVIEW_WINDOW_TOOLBAR_TOP                0
#DEFINE cnPREVIEW_WINDOW_TOOLBAR_LEFT               1
#DEFINE cnPREVIEW_WINDOW_TOOLBAR_RIGHT              2
#DEFINE cnPREVIEW_WINDOW_TOOLBAR_BOTTOM             3

***************************************************************************************************************************
*-- Preview's KeyCode
***************************************************************************************************************************
#DEFINE cnKEY_CODE_UP								5
#DEFINE cnKEY_CODE_SHIFT_UP							56
#DEFINE cnKEY_CODE_DOWN								24
#DEFINE cnKEY_CODE_SHIFT_DOWN						50
#DEFINE cnKEY_CODE_RIGHT							4		
#DEFINE cnKEY_CODE_SHIFT_RIGHT						54		
#DEFINE cnKEY_CODE_LEFT								19			
#DEFINE cnKEY_CODE_SHIFT_LEFT						52		
#DEFINE cnKEY_CODE_PAGE_UP							18			
#DEFINE cnKEY_CODE_SHIFT_PAGE_UP					57		
#DEFINE cnKEY_CODE_CTRL_PAGE_UP						31		
#DEFINE cnKEY_CODE_HOME								1		
#DEFINE cnKEY_CODE_PAGE_DOWN						3			
#DEFINE cnKEY_CODE_SHIFT_PAGE_DOWN					51		
#DEFINE cnKEY_CODE_CTRL_PAGE_DOWN					30		
#DEFINE cnKEY_CODE_END								6					
			
***************************************************************************************************************************
*-- Report Contents
***************************************************************************************************************************

#DEFINE cnFOLDER_HEADER_HEIGHT							22
#DEFINE cnFOLDER_MIN_HEIGHT								64
#DEFINE cnCNT_MIN_HEIGHT								300

#DEFINE cnSMALL_BUTTON_HEIGHT							22
#DEFINE cnBIG_BUTTON_HEIGHT								64

#DEFINE ccSHORTCUTSBAR_FOLDER_CLASS                 	'ShortCutsBarFolder'
#DEFINE ccSHORTCUTSBAR_BUTTON_CLASS                 	'ShortCutsBarButton'

#DEFINE cnSHORTCUTSBAR_OBJTYPE_FOLDER					0
#DEFINE cnSHORTCUTSBAR_OBJTYPE_BUTTON					1
#DEFINE cnSHORTCUTSBAR_OBJTYPE_HEADER					2

#DEFINE cnSHORTCUTSBAR_OBJCODE_ACTIVETASK_FOLDER		0
#DEFINE cnSHORTCUTSBAR_OBJCODE_FAVORITE_FOLDER			1
#DEFINE cnSHORTCUTSBAR_OBJCODE_CUSTOM_FOLDER			2
			
***************************************************************************************************************************
***************************************************************************************************************************
*--BMP-defined values 
***************************************************************************************************************************
***************************************************************************************************************************
*-- RGB colors
***************************************************************************************************************************
#DEFINE cnRGB256_1   CHR(0)   + CHR(0)   + CHR(0)   + CHR(0)   + CHR(0)   + CHR(0)   + CHR(128) +CHR(0)
#DEFINE cnRGB256_2   CHR(0)   + CHR(128) + CHR(0)   + CHR(0)   + CHR(0)   + CHR(128) + CHR(128) + CHR(0)
#DEFINE cnRGB256_3   CHR(128) + CHR(0)   + CHR(0)   + CHR(0)   + CHR(128) + CHR(0)   + CHR(128) + CHR(0)
#DEFINE cnRGB256_4   CHR(128) + CHR(128) + CHR(0)   + CHR(0)   + CHR(192) + CHR(192) + CHR(192) + CHR(0)
#DEFINE cnRGB256_5   CHR(128) + CHR(128) + CHR(128) + CHR(0)   + CHR(0)   + CHR(0)   + CHR(255) + CHR(0)
#DEFINE cnRGB256_6   CHR(0)   + CHR(255) + CHR(0)   + CHR(0)   + CHR(0)   + CHR(255) + CHR(255) + CHR(0)
#DEFINE cnRGB256_7   CHR(255) + CHR(0)   + CHR(0)   + CHR(0)   + CHR(255) + CHR(0)   + CHR(255) + CHR(0)
#DEFINE cnRGB256_8   CHR(255) + CHR(255) + CHR(0)   + CHR(0)   + CHR(255) + CHR(255) + CHR(255) + CHR(0)
#DEFINE cnRGB256_9   CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_10  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_11  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_12  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_13  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_14  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_15  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_16  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_17  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_18  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_19  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_20  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_21  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_22  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_23  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_24  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_25  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_26  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_27  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_28  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_29  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_30  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_31  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_32  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_33  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_34  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_35  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_36  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_37  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_38  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_39  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_40  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_41  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_42  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_43  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_44  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_45  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_46  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_47  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_48  CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_49  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_50  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_51  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_52  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_53  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_54  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_55  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_56  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_57  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_58  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_59  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_60  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_61  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_62  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_63  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_64  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_65  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_66  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_67  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_68  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_69  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_70  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_71  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_72  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_73  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_74  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_75  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_76  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_77  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_78  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_79  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_80  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_81  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_82  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_83  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_84  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_85  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_86  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_87  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_88  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_89  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_90  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_91  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_92  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_93  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_94  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_95  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_96  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_97  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_98  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_99  CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_100 CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_101 CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_102 CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_103 CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_104 CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_105 CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_106 CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_107 CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_108 CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_109 CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_110 CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_111 CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_112 CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_113 CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_114 CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_115 CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_116 CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_117 CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119)
#DEFINE cnRGB256_118 CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(119) + CHR(112) + CHR(247)
#DEFINE cnRGB256_119 CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_120 CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(119) + CHR(255)
#DEFINE cnRGB256_121 CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_122 CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(119) + CHR(255)
#DEFINE cnRGB256_123 CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_124 CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(247)
#DEFINE cnRGB256_125 CHR(127) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_126 CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_127 CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255)
#DEFINE cnRGB256_128 CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(255) + CHR(119)


***************************************************************************************************************************
***************************************************************************************************************************
*--PDF defined values 
***************************************************************************************************************************
***************************************************************************************************************************
*-- PDF object's class name.
***************************************************************************************************************************
#DEFINE cc_PDF_OBJECTS_CLS_NAME						'PDFObjects'

#DEFINE ccOBJ_PDF_DOC_CLS_NAME         			    'PDFDoc'
#DEFINE ccOBJ_PDF_PAGE_CLS_NAME         			'PDFPage'

***************************************************************************************************************************
*-- PDF's Page Orientation Constant Group
***************************************************************************************************************************
#DEFINE cnPDF_PAGE_ORIENTATION_PORTRAIT				0
#DEFINE cnPDF_PAGE_ORIENTATION_LANDSCAPE  			270

***************************************************************************************************************************
*-- PDF's Page margin
***************************************************************************************************************************
#DEFINE cnPDF_LR_MARGIN				 				18		&&0.25 * 72	
#DEFINE cnPDF_TB_MARGIN				 				14		&&0.25 * 72	

***************************************************************************************************************************
*-- standard page sizes in points 
***************************************************************************************************************************
#DEFINE cnPDF_PAPER_LETTER							'0 0 612 792'
#DEFINE cnPDF_PAPER_LEGAL							'0 0 612 1008'
#DEFINE cnPDF_PAPER_A4								'0 0 595 842'
#DEFINE cnPDF_PAPER_B5								'0 0 499 708'
#DEFINE cnPDF_PAPER_C5								'0 0 459 649'
#DEFINE cnPDF_PAPER_DL								'0 0 312 624'
#DEFINE cnPDF_PAPER_EXECUTIVE						'0 0 522 756'
#DEFINE cnPDF_PAPER_COMM10							'0 0 297 684'
#DEFINE cnPDF_PAPER_MONARCH							'0 0 279 540'
#DEFINE cnPDF_PAPER_FILM35MM						'0 0 528 792'

***************************************************************************************************************************
*-- Report object's class name for PDF.
***************************************************************************************************************************
#DEFINE ccOBJ_PDF_FIELD_CLS_NAME    	 			'PDFField'
#DEFINE ccOBJ_PDF_TEXT_CLS_NAME     	 			'PDFText'
#DEFINE ccOBJ_PDF_LINE_CLS_NAME         			'PDFLine'
#DEFINE ccOBJ_PDF_IMAGE_CLS_NAME    	 			'PDFImage'
#DEFINE ccOBJ_PDF_BOX_CLS_NAME      	 			'PDFBox'

#DEFINE ccOBJ_PDF_FILE_CLS_NAME  	     			'PDFFile'
#DEFINE ccOBJ_PDF_BAND_CLS_NAME         			'PDFBand'
#DEFINE ccOBJ_PDF_GROUP_CLS_NAME        			'PDFGroup'

***************************************************************************************************************************
*-- PDF's Line types
***************************************************************************************************************************
#DEFINE cnPDF_PEN_PATTERN_NONE						0
#DEFINE cnPDF_PEN_PATTERN_NORMAL 		 			1
#DEFINE cnPDF_PEN_PATTERN_DOTTED		 			3
#DEFINE cnPDF_PEN_PATTERN_DASH_DOT_DOT	 			6
#DEFINE cnPDF_PEN_PATTERN_DASHED		 			7	 
#DEFINE cnPDF_PEN_PATTERN_DASH_DOT		 			8

***************************************************************************************************************************
*-- PDF's Fill types
***************************************************************************************************************************
#DEFINE cnPDF_FILL_PATTERN_NO_FILL_NO_COLOR		    0
#DEFINE cnPDF_FILL_PATTERN_NO_FILL_ONLY_COLOR		1
#DEFINE cnPDF_FILL_PATTERN_HORIZONTAL				19
#DEFINE cnPDF_FILL_PATTERN_VERTICAL				    20
#DEFINE cnPDF_FILL_PATTERN_DOWNWARD_DIAGONAL		21
#DEFINE cnPDF_FILL_PATTERN_UPWARD_DIAGONAL		    22
#DEFINE cnPDF_FILL_PATTERN_GRID					    34
#DEFINE cnPDF_FILL_PATTERN_DIAMOND				    41

***************************************************************************************************************************
*-- PDF object's alignment constants.
***************************************************************************************************************************
#DEFINE cnPDF_ALIGN_LEFT              	 			0
#DEFINE cnPDF_ALIGN_CENTER              			1
#DEFINE cnPDF_ALIGN_RIGHT               			2

***************************************************************************************************************************
*-- PDF merging constants.
***************************************************************************************************************************
#DEFINE cnPDF_ADD_TO_THE_END						1
#DEFINE cnPDF_ADD_IN_THE_BEGINING					2

***************************************************************************************************************************
*-- PDF charset constant
***************************************************************************************************************************
#DEFINE cnPDF_CHARSET_ANSI							1
#DEFINE cnPDF_CHARSET_DEFAULT						2
#DEFINE cnPDF_CHARSET_SYMBOL						3
#DEFINE cnPDF_CHARSET_SHIFTJIS						4
#DEFINE cnPDF_CHARSET_HUNGEUL						5
#DEFINE cnPDF_CHARSET_GB2312						6
#DEFINE cnPDF_CHARSET_CHINESEBIG5					7
#DEFINE cnPDF_CHARSET_OEM							8
#DEFINE cnPDF_CHARSET_JOHAB							9
#DEFINE cnPDF_CHARSET_HEBREW						10
#DEFINE cnPDF_CHARSET_ARABIC						11
#DEFINE cnPDF_CHARSET_GREEK							12
#DEFINE cnPDF_CHARSET_TURKISH						13
#DEFINE cnPDF_CHARSET_VIETNAMESE					14	
#DEFINE cnPDF_CHARSET_THAI							15
#DEFINE cnPDF_CHARSET_EASTEUROPE					16
#DEFINE cnPDF_CHARSET_RUSSIAN						17
#DEFINE cnPDF_CHARSET_MAC							18
#DEFINE cnPDF_CHARSET_BALTIC						19




***************************************************************************************************************************
***************************************************************************************************************************
*--Image defined values 
***************************************************************************************************************************
***************************************************************************************************************************
*-- Report object's class name for Image.
***************************************************************************************************************************
#DEFINE ccOBJ_IMAGE_FIELD_CLS_NAME    	 		'ImageField'
#DEFINE ccOBJ_IMAGE_TEXT_CLS_NAME     	 		'ImageText'
#DEFINE ccOBJ_IMAGE_LINE_CLS_NAME         		'ImageLine'
#DEFINE ccOBJ_IMAGE_IMAGE_CLS_NAME    	 		'ImageImage'
#DEFINE ccOBJ_IMAGE_BOX_CLS_NAME      	 		'ImageBox'

#DEFINE ccOBJ_IMAGE_FILE_CLS_NAME  	     		'ImageFile'
#DEFINE ccOBJ_IMAGE_BAND_CLS_NAME         		'ImageBand'
#DEFINE ccOBJ_IMAGE_GROUP_CLS_NAME        		'ImageGroup'

***************************************************************************************************************************
*-- IMAGE object's alignment constants.
***************************************************************************************************************************
#DEFINE cnIMAGE_ALIGN_LEFT         	 			0
#DEFINE cnIMAGE_ALIGN_CENTER           			1
#DEFINE cnIMAGE_ALIGN_RIGHT            			2

***************************************************************************************************************************
*-- IMAGE's output file formats
***************************************************************************************************************************
#DEFINE cnIMAGE_OUTPUT_FILE_FORMAT_BMP          1
#DEFINE cnIMAGE_OUTPUT_FILE_FORMAT_JPG			2
#DEFINE cnIMAGE_OUTPUT_FILE_FORMAT_GIF			3
#DEFINE cnIMAGE_OUTPUT_FILE_FORMAT_TIF			4
#DEFINE cnIMAGE_OUTPUT_FILE_FORMAT_PNG			5

***************************************************************************************************************************
*-- Pixel formats
***************************************************************************************************************************
#DEFINE cnIMAGE_PIXEL_FORMAT_16BPP				1
#DEFINE cnIMAGE_PIXEL_FORMAT_24BPP				2
#DEFINE cnIMAGE_PIXEL_FORMAT_32BPP				3
#DEFINE cnIMAGE_PIXEL_FORMAT_GRAYSCALE			4
#DEFINE cnIMAGE_PIXEL_FORMAT_MONOCHROME			5

***************************************************************************************************************************
***************************************************************************************************************************
*--RTF Engine defined values 
***************************************************************************************************************************
***************************************************************************************************************************
#DEFINE ccOBJ_RTF_HANDLER_CLS_NAME	 	 		'RTFHandler'
#DEFINE ccOBJ_RTF_FORMAT_RANGE_CLS_NAME			'RTFFormatRange'

#DEFINE ccOBJ_RTF_TREE_CLS_NAME					'RtfTree'
#DEFINE ccOBJ_RTF_TREE_NODE_CLS_NAME			'RtfTreeNode'
#DEFINE ccOBJ_RTF_NODE_COLLECTION_CLS_NAME		'RtfNodeCollection'
#DEFINE ccOBJ_RTF_LEX_CLS_NAME					'RtfLex'
#DEFINE ccOBJ_RTF_TOKEN_CLS_NAME				'RtfToken'
#DEFINE ccOBJ_RTF_TEXT_PROPERTIES_CLS_NAME		'RtfTextProperties'
