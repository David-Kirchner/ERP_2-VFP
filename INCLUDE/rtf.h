#DEFINE ccRTF_CLASS_NAME										'RTF'

*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
*-- Type of RTF node
*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
#DEFINE cnRTF_NODE_TYPE_ROOT     	 							0
#DEFINE cnRTF_NODE_TYPE_KEYWORD    	 							1
#DEFINE cnRTF_NODE_TYPE_CONTROL    	 							2
#DEFINE cnRTF_NODE_TYPE_TEXT    	 							3
#DEFINE cnRTF_NODE_TYPE_GROUP    	 							4
#DEFINE cnRTF_NODE_TYPE_NONE    	 							5

*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
*-- Type of RTF token
*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
#DEFINE cnRTF_TOKEN_TYPE_NONE    	 							0            
#DEFINE cnRTF_TOKEN_TYPE_KEYWORD   	 							1            
#DEFINE cnRTF_TOKEN_TYPE_CONTROL   	 							2            
#DEFINE cnRTF_TOKEN_TYPE_TEXT   	 							3            
#DEFINE cnRTF_TOKEN_TYPE_EOF	   	 							4            
#DEFINE cnRTF_TOKEN_TYPE_GROUPSTART	 							5            
#DEFINE cnRTF_TOKEN_TYPE_GROUPEND	 							6            

*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
*-- Type of RTF group
*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
#DEFINE cnRTF_GROUP_TYPE_NONE    	 							0            
#DEFINE cnRTF_GROUP_TYPE_FONT_TABLE    	 						1
#DEFINE cnRTF_GROUP_TYPE_COLOR_TABLE	 						2
#DEFINE cnRTF_GROUP_TYPE_TEXT									3

***************************************************************************************************************************
*-- RTF text rendering
***************************************************************************************************************************
#DEFINE cnCHRG_ALL   									        -1
#DEFINE cnWM_COPY            									0x0301
#DEFINE cnWM_USER            									0x0400
#DEFINE cnEM_FORMATRANGE     									(cnWM_USER+57)

#DEFINE cnFR_SIZEOF      									    0x0030
#DEFINE cnFR_HDC             									(0x0000 + 1)
#DEFINE cnFR_HDCTARGET       									(0x0004 + 1)
#DEFINE cnFR_RC_LEFT         									(0x0008 + 1)
#DEFINE cnFR_RC_TOP          									(0x000C + 1)
#DEFINE cnFR_RC_RIGHT        									(0x0010 + 1)
#DEFINE cnFR_RC_BOTTOM       									(0x0014 + 1)
#DEFINE cnFR_RCPAGE_LEFT     									(0x0018 + 1)
#DEFINE cnFR_RCPAGE_TOP      									(0x001C + 1)
#DEFINE cnFR_RCPAGE_RIGHT    									(0x0020 + 1)
#DEFINE cnFR_RCPAGE_BOTTOM   									(0x0024 + 1)
#DEFINE cnFR_CHRG_CPMIN      									(0x0028 + 1)
#DEFINE cnFR_CHRG_CPMAX      									(0x002C + 1)

