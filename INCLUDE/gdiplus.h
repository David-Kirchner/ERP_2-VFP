***************************************************************************************************************************
*-- GDI+ Class library for Visual Foxpro
***************************************************************************************************************************
***************************************************************************************************************************
*-- Throw error if GDI+ not initialised
#DEFINE clGDIPLUS_CHECK_GDIPLUSNOTINIT						.T.	 
***************************************************************************************************************************
***************************************************************************************************************************
*-- Classes instantiated from gdiplus.vcx
***************************************************************************************************************************
#DEFINE ccGDIPLUS_CLASS_LIBRARY								This.ClassLibrary
#DEFINE ccGDIPLUS_CLASS_NAME								'GDIPlus'
#DEFINE ccGDIPLUS_CLASS_GDIPLUS_INIT						'GDIPlusInit'
#DEFINE ccGDIPLUS_CLASS_RECT								'GDIRectangle'
#DEFINE ccGDIPLUS_CLASS_POINT								'GDIPoint'
#DEFINE ccGDIPLUS_CLASS_SIZE								'GDISize'
#DEFINE ccGDIPLUS_CLASS_FONTFAMILY							'GDIFontFamily'
#DEFINE ccGDIPLUS_CLASS_IMAGE								'GDIImage'
#DEFINE ccGDIPLUS_CLASS_BITMAP								'GDIBitmap'
#DEFINE ccGDIPLUS_CLASS_GRAPHICS							'GDIGraphics'
#DEFINE ccGDIPLUS_CLASS_HATCHBRUSH							'GDIHatchBrush'
#DEFINE ccGDIPLUS_CLASS_SOLIDBRUSH							'GDISolidBrush'
#DEFINE ccGDIPLUS_CLASS_LINEARGRADIENTBRUSH					'GDILinearGradientBrush'
#DEFINE ccGDIPLUS_CLASS_PEN									'GDIPen'
#DEFINE ccGDIPLUS_CLASS_COLOR								'GDIColor'
#DEFINE ccGDIPLUS_CLASS_FONT								'GDIFont'
#DEFINE ccGDIPLUS_CLASS_STRINGFORMAT						'GDIStringFormat'
#DEFINE ccGDIPLUS_CLASS_PATH								'GDIPath'
#DEFINE ccGDIPLUS_CLASS_ENCODERPARAMETER					'GDIEncoderParameter'

***************************************************************************************************************************
*-- Status enumeration
***************************************************************************************************************************
#DEFINE cnGDIPLUS_STATUS_OK									0
#DEFINE cnGDIPLUS_STATUS_GenericError  						1
#DEFINE cnGDIPLUS_STATUS_InvalidParameter  					2
#DEFINE cnGDIPLUS_STATUS_OutOfMemory  						3
#DEFINE cnGDIPLUS_STATUS_ObjectBusy  						4
#DEFINE cnGDIPLUS_STATUS_InsufficientBuffer  				5
#DEFINE cnGDIPLUS_STATUS_NotImplemented  					6
#DEFINE cnGDIPLUS_STATUS_Win32Error  						7
#DEFINE cnGDIPLUS_STATUS_WrongState  						8
#DEFINE cnGDIPLUS_STATUS_Aborted  							9
#DEFINE cnGDIPLUS_STATUS_FileNotFound  						10
#DEFINE cnGDIPLUS_STATUS_ValueOverflow  					11
#DEFINE cnGDIPLUS_STATUS_AccessDenied  						12
#DEFINE cnGDIPLUS_STATUS_UnknownImageFormat  				13
#DEFINE cnGDIPLUS_STATUS_FontFamilyNotFound  				14
#DEFINE cnGDIPLUS_STATUS_FontStyleNotFound  				15
#DEFINE cnGDIPLUS_STATUS_NotTrueTypeFont  					16
#DEFINE cnGDIPLUS_STATUS_UnsupportedGdiplusVersion			17
#DEFINE cnGDIPLUS_STATUS_GdiplusNotInitialized  			18
#DEFINE cnGDIPLUS_STATUS_PropertyNotFound  					19
#DEFINE cnGDIPLUS_STATUS_PropertyNotSupported				20

***************************************************************************************************************************
*-- Fill mode (how a closed path is filled)
***************************************************************************************************************************
#DEFINE cnGDIPLUS_FillMode_Alternate						0
#DEFINE cnGDIPLUS_FillMode_Winding							1

***************************************************************************************************************************
*-- Quality mode constants
***************************************************************************************************************************
#DEFINE cnGDIPLUS_QualityMode_Invalid   					-1
#DEFINE cnGDIPLUS_QualityMode_Default   					0
#DEFINE cnGDIPLUS_QualityMode_Low       					1 
#DEFINE cnGDIPLUS_QualityMode_High      					2 

***************************************************************************************************************************
*-- Alpha Compositing mode constants
***************************************************************************************************************************
#DEFINE cnGDIPLUS_CompositingMode_SourceOver				0
#DEFINE cnGDIPLUS_CompositingMode_SourceCopy				1

***************************************************************************************************************************
*-- Alpha Compositing quality constants
***************************************************************************************************************************
#DEFINE cnGDIPLUS_CompositingQuality_Invalid        		cnGDIPLUS_QualityMode_Invalid
#DEFINE cnGDIPLUS_CompositingQuality_Default        		cnGDIPLUS_QualityMode_Default
#DEFINE cnGDIPLUS_CompositingQuality_HighSpeed      		cnGDIPLUS_QualityMode_Low
#DEFINE cnGDIPLUS_CompositingQuality_HighQuality    		cnGDIPLUS_QualityMode_High
#DEFINE cnGDIPLUS_CompositingQuality_GammaCorrected			3
#DEFINE cnGDIPLUS_CompositingQuality_AssumeLinear			4

***************************************************************************************************************************
*-- Units
***************************************************************************************************************************
#DEFINE cnGDIPLUS_Unit_WORLD      							0 && World coordinate (non-physical unit)
#DEFINE cnGDIPLUS_Unit_DISPLAY   							1 && Variable -- for PageTransform only
#DEFINE cnGDIPLUS_Unit_PIXEL      							2 && one device pixel.
#DEFINE cnGDIPLUS_Unit_POINT      							3 && 1/72 inch.
#DEFINE cnGDIPLUS_Unit_INCH       							4 && 1 inch.
#DEFINE cnGDIPLUS_Unit_DOCUMENT   							5 && 1/300 inch.
#DEFINE cnGDIPLUS_Unit_MILLIMETER 							6 && 1 millimeter.

#DEFINE cnGDIPLUS_MetafileFrameUnit_Pixel      				cnGDIPLUS_Unit_Pixel
#DEFINE cnGDIPLUS_MetafileFrameUnit_Point      				cnGDIPLUS_Unit_Point
#DEFINE cnGDIPLUS_MetafileFrameUnit_Inch       				cnGDIPLUS_Unit_Inch
#DEFINE cnGDIPLUS_MetafileFrameUnit_Document   				cnGDIPLUS_Unit_Document
#DEFINE cnGDIPLUS_MetafileFrameUnit_Millimeter 				cnGDIPLUS_Unit_Millimeter
#DEFINE cnGDIPLUS_MetafileFrameUnit_Gdi        				7 && GDI compatible .01 MM units

***************************************************************************************************************************
*-- Coordinate Space
***************************************************************************************************************************
#DEFINE cnGDIPLUS_CoordinateSpace_World      				0
#DEFINE cnGDIPLUS_CoordinateSpace_Page       				1
#DEFINE cnGDIPLUS_CoordinateSpace_Device     				2

***************************************************************************************************************************
*-- Wrap mode for brushes
***************************************************************************************************************************
#DEFINE cnGDIPLUS_WrapMode_Tile								0
#DEFINE cnGDIPLUS_WrapMode_TileFlipX						1
#DEFINE cnGDIPLUS_WrapMode_TileFlipY						2
#DEFINE cnGDIPLUS_WrapMode_TileFlipXY						3
#DEFINE cnGDIPLUS_WrapMode_Clamp							4

***************************************************************************************************************************
*-- HatchBrush styles
***************************************************************************************************************************
#DEFINE cnGDIPLUS_HatchStyle_Horizontal						0
#DEFINE cnGDIPLUS_HatchStyle_Vertical						1
#DEFINE cnGDIPLUS_HatchStyle_ForwardDiagonal				2
#DEFINE cnGDIPLUS_HatchStyle_BackwardDiagonal				3
#DEFINE cnGDIPLUS_HatchStyle_Cross							4
#DEFINE cnGDIPLUS_HatchStyle_DiagonalCross					5
#DEFINE cnGDIPLUS_HatchStyle_05Percent						6
#DEFINE cnGDIPLUS_HatchStyle_10Percent						7
#DEFINE cnGDIPLUS_HatchStyle_20Percent						8
#DEFINE cnGDIPLUS_HatchStyle_25Percent						9
#DEFINE cnGDIPLUS_HatchStyle_30Percent						10
#DEFINE cnGDIPLUS_HatchStyle_40Percent						11
#DEFINE cnGDIPLUS_HatchStyle_50Percent						12
#DEFINE cnGDIPLUS_HatchStyle_60Percent						13
#DEFINE cnGDIPLUS_HatchStyle_70Percent						14
#DEFINE cnGDIPLUS_HatchStyle_75Percent						15
#DEFINE cnGDIPLUS_HatchStyle_80Percent						16
#DEFINE cnGDIPLUS_HatchStyle_90Percent						17
#DEFINE cnGDIPLUS_HatchStyle_LightDownwardDiagonal			18
#DEFINE cnGDIPLUS_HatchStyle_LightUpwardDiagonal			19
#DEFINE cnGDIPLUS_HatchStyle_DarkDownwardDiagonal			20
#DEFINE cnGDIPLUS_HatchStyle_DarkUpwardDiagonal				21
#DEFINE cnGDIPLUS_HatchStyle_WideDownwardDiagonal			22
#DEFINE cnGDIPLUS_HatchStyle_WideUpwardDiagonal				23
#DEFINE cnGDIPLUS_HatchStyle_LightVertical					24
#DEFINE cnGDIPLUS_HatchStyle_LightHorizontal				25
#DEFINE cnGDIPLUS_HatchStyle_NarrowVertical					26
#DEFINE cnGDIPLUS_HatchStyle_NarrowHorizontal				27
#DEFINE cnGDIPLUS_HatchStyle_DarkVertical					28
#DEFINE cnGDIPLUS_HatchStyle_DarkHorizontal					29
#DEFINE cnGDIPLUS_HatchStyle_DashedDownwardDiagonal			30
#DEFINE cnGDIPLUS_HatchStyle_DashedUpwardDiagonal			31
#DEFINE cnGDIPLUS_HatchStyle_DashedHorizontal				32
#DEFINE cnGDIPLUS_HatchStyle_DashedVertical					33
#DEFINE cnGDIPLUS_HatchStyle_SmallConfetti					34
#DEFINE cnGDIPLUS_HatchStyle_LargeConfetti					35
#DEFINE cnGDIPLUS_HatchStyle_ZigZag							36
#DEFINE cnGDIPLUS_HatchStyle_Wave							37
#DEFINE cnGDIPLUS_HatchStyle_DiagonalBrick					38
#DEFINE cnGDIPLUS_HatchStyle_HorizontalBrick				39
#DEFINE cnGDIPLUS_HatchStyle_Weave							40
#DEFINE cnGDIPLUS_HatchStyle_Plaid							41
#DEFINE cnGDIPLUS_HatchStyle_Divot							42
#DEFINE cnGDIPLUS_HatchStyle_DottedGrid						43
#DEFINE cnGDIPLUS_HatchStyle_DottedDiamond					44
#DEFINE cnGDIPLUS_HatchStyle_Shingle						45
#DEFINE cnGDIPLUS_HatchStyle_Trellis						46
#DEFINE cnGDIPLUS_HatchStyle_Sphere							47
#DEFINE cnGDIPLUS_HatchStyle_SmallGrid						48
#DEFINE cnGDIPLUS_HatchStyle_SmallCheckerBoard				49
#DEFINE cnGDIPLUS_HatchStyle_LargeCheckerBoard				50
#DEFINE cnGDIPLUS_HatchStyle_OutlinedDiamond				51
#DEFINE cnGDIPLUS_HatchStyle_SolidDiamond					52
#DEFINE cnGDIPLUS_FILL_PATTERN_NO_FILL_ONLY_COLOR			53
#DEFINE cnGDIPLUS_FILL_PATTERN_NO_FILL_NO_COLOR				54


***************************************************************************************************************************
*-- Dash style constants
***************************************************************************************************************************
#DEFINE cnGDIPLUS_DASHSTYLE_NONE							-1
#DEFINE cnGDIPLUS_DASHSTYLE_SOLID							0
#DEFINE cnGDIPLUS_DASHSTYLE_DASH							1
#DEFINE cnGDIPLUS_DASHSTYLE_DOT								2
#DEFINE cnGDIPLUS_DASHSTYLE_DASHDOT							3
#DEFINE cnGDIPLUS_DASHSTYLE_DASHDOTDOT						4
#DEFINE cnGDIPLUS_DASHSTYLE_CUSTOM          				5

***************************************************************************************************************************
*-- Dash cap constants
***************************************************************************************************************************
#DEFINE cnGDIPLUS_DashCap_Flat             					0
#DEFINE cnGDIPLUS_DashCap_Round            					2
#DEFINE cnGDIPLUS_DashCap_Triangle         					3

***************************************************************************************************************************
*-- LineCap
***************************************************************************************************************************
#DEFINE cnGDIPLUS_LineCap_Flat             					0
#DEFINE cnGDIPLUS_LineCap_Square           					1
#DEFINE cnGDIPLUS_LineCap_Round            					2
#DEFINE cnGDIPLUS_LineCap_Triangle         					3
#DEFINE cnGDIPLUS_LineCap_NoAnchor         					0x10 && corresponds to flat cap
#DEFINE cnGDIPLUS_LineCap_SquareAnchor     					0x11 && corresponds to square cap
#DEFINE cnGDIPLUS_LineCap_RoundAnchor      					0x12 && corresponds to round cap
#DEFINE cnGDIPLUS_LineCap_DiamondAnchor    					0x13 && corresponds to triangle cap
#DEFINE cnGDIPLUS_LineCap_ArrowAnchor      					0x14 && no correspondence
#DEFINE cnGDIPLUS_LineCap_Custom           					0xff && custom cap
#DEFINE cnGDIPLUS_LineCap_AnchorMask       					0xf0 && mask to check for anchor or not.

***************************************************************************************************************************
*-- Custom Line cap type constants
***************************************************************************************************************************
#DEFINE cnGDIPLUS_CustomLineCapType_Default        			0
#DEFINE cnGDIPLUS_CustomLineCapType_AdjustableArrow			1

***************************************************************************************************************************
*-- Line join constants
***************************************************************************************************************************
#DEFINE cnGDIPLUS_LineJoin_Miter        					0
#DEFINE cnGDIPLUS_LineJoin_Bevel        					1
#DEFINE cnGDIPLUS_LineJoin_Round        					2
#DEFINE cnGDIPLUS_LineJoin_MiterClipped 					3

***************************************************************************************************************************
*-- Path point types (only the lowest 8 bits are used.)
*-- The lowest 3 bits are interpreted as point type
*-- The higher 5 bits are reserved for flags.
***************************************************************************************************************************
#DEFINE cnGDIPLUS_PathPointType_Start          	 			0    && move
#DEFINE cnGDIPLUS_PathPointType_Line            			1    && line
#DEFINE cnGDIPLUS_PathPointType_Bezier          			3    && default Bezier (= cubic Bezier)
#DEFINE cnGDIPLUS_PathPointType_PathTypeMask    			0x07 && type mask (lowest 3 bits).
#DEFINE cnGDIPLUS_PathPointType_DashMode        			0x10 && currently in dash mode.
#DEFINE cnGDIPLUS_PathPointType_PathMarker      			0x20 && a marker for the path.
#DEFINE cnGDIPLUS_PathPointType_CloseSubpath    			0x80 && closed flag
#DEFINE cnGDIPLUS_PathPointType_Bezier3    					3    && cubic Bezier

***************************************************************************************************************************
*-- WarpMode constants
***************************************************************************************************************************
#DEFINE cnGDIPLUS_WarpMode_Perspective						0
#DEFINE cnGDIPLUS_WarpMode_Bilinear    						1

***************************************************************************************************************************
*-- LinearGradient Mode
***************************************************************************************************************************
#DEFINE cnGDIPLUS_LinearGradientMode_Horizontal				0
#DEFINE cnGDIPLUS_LinearGradientMode_Vertical				1
#DEFINE cnGDIPLUS_LinearGradientMode_ForwardDiagonal		2
#DEFINE cnGDIPLUS_LinearGradientMode_BackwardDiagonal 		3

***************************************************************************************************************************
*-- CombineMode (for regions)
***************************************************************************************************************************
#DEFINE cnGDIPLUS_CombineMode_Replace						0
#DEFINE cnGDIPLUS_CombineMode_Intersect						1
#DEFINE cnGDIPLUS_CombineMode_Union							2
#DEFINE cnGDIPLUS_CombineMode_Xor							3
#DEFINE cnGDIPLUS_CombineMode_Exclude						4
#DEFINE cnGDIPLUS_CombineMode_Complement   					5

***************************************************************************************************************************
*-- Image types
***************************************************************************************************************************
#DEFINE cnGDIPLUS_ImageType_Unknown							0
#DEFINE cnGDIPLUS_ImageType_Bitmap							1
#DEFINE cnGDIPLUS_ImageType_Metafile   						2

***************************************************************************************************************************
*-- StringAlignment enumeration
*-- Applies to GpStringFormat::Alignment, GpStringFormat::LineAlignment
***************************************************************************************************************************
#DEFINE cnGDIPLUS_STRINGALIGNMENT_NEAR						0	&& in Left-To-Right locale, this is Left
#DEFINE cnGDIPLUS_STRINGALIGNMENT_CENTER					1
#DEFINE cnGDIPLUS_STRINGALIGNMENT_FAR						2	&& in Left-To-Right locale, this is Right

***************************************************************************************************************************
*-- StringFormatFlags enumeration
*-- applies to GDIStringFormat::FormatFlags
***************************************************************************************************************************
#DEFINE cnGDIPLUS_STRINGFORMATFLAGS_DirectionRightToLeft	1 
#DEFINE cnGDIPLUS_STRINGFORMATFLAGS_DirectionVertical 		2 
#DEFINE cnGDIPLUS_STRINGFORMATFLAGS_NoFitBlackBox 			4 
#DEFINE cnGDIPLUS_STRINGFORMATFLAGS_DisplayFormatControl 	32 
#DEFINE cnGDIPLUS_STRINGFORMATFLAGS_NoFontFallback 			1024 
#DEFINE cnGDIPLUS_STRINGFORMATFLAGS_MeasureTrailingSpaces 	2048 
#DEFINE cnGDIPLUS_STRINGFORMATFLAGS_NoWrap 					4096 
#DEFINE cnGDIPLUS_STRINGFORMATFLAGS_LineLimit 				8192 
#DEFINE cnGDIPLUS_STRINGFORMATFLAGS_NoClip 					16384 

***************************************************************************************************************************
*-- StringTrimming enumeration
***************************************************************************************************************************
#DEFINE cnGDIPLUS_STRINGTRIMMING_None 						0	&& no trimming. 
#DEFINE cnGDIPLUS_STRINGTRIMMING_Character 					1	&& nearest character. 
#DEFINE cnGDIPLUS_STRINGTRIMMING_Word						2	&& nearest wor 
#DEFINE cnGDIPLUS_STRINGTRIMMING_EllipsisCharacter 			3	&& nearest character, ellipsis at end
#DEFINE cnGDIPLUS_STRINGTRIMMING_EllipsisWord 				4	&& nearest word, ellipsis at end
#DEFINE cnGDIPLUS_STRINGTRIMMING_EllipsisPath 				5	&& ellipsis in center, favouring last slash-delimited
																&& segment
																
***************************************************************************************************************************
*-- StringDigitSubstitute
***************************************************************************************************************************
#DEFINE cnGDIPLUS_STRINGDIGITSUBSTITUTE_User 				0
#DEFINE cnGDIPLUS_STRINGDIGITSUBSTITUTE_None 				1
#DEFINE cnGDIPLUS_STRINGDIGITSUBSTITUTE_National			2
#DEFINE cnGDIPLUS_STRINGDIGITSUBSTITUTE_Traditional 		3

***************************************************************************************************************************
*-- HotkeyPrefix enumeration
***************************************************************************************************************************
#DEFINE cnGDIPLUS_HOTKEYPREFIX_None 						0	&& No hot-key prefix. 
#DEFINE cnGDIPLUS_HOTKEYPREFIX_Show 						1	&& display hot-key prefix
#DEFINE cnGDIPLUS_HOTKEYPREFIX_Hide 						2	&& Do not display the hot-key prefix. 

***************************************************************************************************************************
*-- FontStyle: face types and common styles
***************************************************************************************************************************
#DEFINE cnGDIPLUS_FONTSTYLE_REGULAR     					0
#DEFINE cnGDIPLUS_FONTSTYLE_BOLD        					1
#DEFINE cnGDIPLUS_FONTSTYLE_ITALIC      					2
#DEFINE cnGDIPLUS_FONTSTYLE_BOLDITALIC  					3
#DEFINE cnGDIPLUS_FONTSTYLE_UNDERLINE   					4
#DEFINE cnGDIPLUS_FONTSTYLE_STRIKEOUT   					8

#DEFINE cnGDIPLUS_InterpolationMode_Invalid          		GDIPLUS_QualityMode_Invalid
#DEFINE cnGDIPLUS_InterpolationMode_Default          		GDIPLUS_QualityMode_Default
#DEFINE cnGDIPLUS_InterpolationMode_LowQuality       		GDIPLUS_QualityMode_Low
#DEFINE cnGDIPLUS_InterpolationMode_HighQuality      		GDIPLUS_QualityMode_High
#DEFINE cnGDIPLUS_InterpolationMode_Bilinear				3
#DEFINE cnGDIPLUS_InterpolationMode_Bicubic					4
#DEFINE cnGDIPLUS_InterpolationMode_NearestNeighbor			5
#DEFINE cnGDIPLUS_InterpolationMode_HighQualityBilinear		6
#DEFINE cnGDIPLUS_InterpolationMode_HighQualityBicubic		7

#DEFINE cnGDIPLUS_PenAlignment_Center       				0
#DEFINE cnGDIPLUS_PenAlignment_Inset        				1

***************************************************************************************************************************
*-- Brush types
***************************************************************************************************************************
#DEFINE cnGDIPLUS_BRUSHTYPE_SOLIDCOLOR       				0
#DEFINE cnGDIPLUS_BRUSHTYPE_HATCHFILL        				1
#DEFINE cnGDIPLUS_BRUSHTYPE_TEXTUREFILL      				2
#DEFINE cnGDIPLUS_BRUSHTYPE_PATHGRADINT     				3
#DEFINE cnGDIPLUS_BRUSHTYPE_LINEARGRADIENT   				4

***************************************************************************************************************************
*-- Pen's Fill types
***************************************************************************************************************************
#DEFINE cnGDIPLUS_PenType_SolidColor       					GDIPLUS_BrushType_SolidColor
#DEFINE cnGDIPLUS_PenType_HatchFill        					GDIPLUS_BrushType_HatchFill
#DEFINE cnGDIPLUS_PenType_TextureFill      					GDIPLUS_BrushType_TextureFill
#DEFINE cnGDIPLUS_PenType_PathGradient     					GDIPLUS_BrushType_PathGradient
#DEFINE cnGDIPLUS_PenType_LinearGradient   					GDIPLUS_BrushType_LinearGradient
#DEFINE cnGDIPLUS_PenType_Unknown          					-1

***************************************************************************************************************************
*-- Matrix Order
***************************************************************************************************************************
#DEFINE cnGDIPLUS_MatrixOrder_Prepend    					0
#DEFINE cnGDIPLUS_MatrixOrder_Append     					1

***************************************************************************************************************************
*-- SmoothingMode
***************************************************************************************************************************
#DEFINE cnGDIPLUS_SmoothingMode_Invalid     				GDIPLUS_QualityMode_Invalid
#DEFINE cnGDIPLUS_SmoothingMode_Default     				GDIPLUS_QualityMode_Default
#DEFINE cnGDIPLUS_SmoothingMode_HighSpeed   				GDIPLUS_QualityMode_Low,
#DEFINE cnGDIPLUS_SmoothingMode_HighQuality 				GDIPLUS_QualityMode_High
#DEFINE cnGDIPLUS_SmoothingMode_None						3
#DEFINE cnGDIPLUS_SmoothingMode_AntiAlias					4

***************************************************************************************************************************
*-- PixelOffsetMode
***************************************************************************************************************************
#DEFINE cnGDIPLUS_PixelOffsetMode_Invalid					GDIPLUS_QualityMode_Invalid
#DEFINE cnGDIPLUS_PixelOffsetMode_Default					GDIPLUS_QualityMode_Default
#DEFINE cnGDIPLUS_PixelOffsetMode_HighSpeed					GDIPLUS_QualityMode_Low
#DEFINE cnGDIPLUS_PixelOffsetMode_HighQuality				GDIPLUS_QualityMode_High
#DEFINE cnGDIPLUS_PixelOffsetMode_None						3
#DEFINE cnGDIPLUS_PixelOffsetMode_Half						4

***************************************************************************************************************************
*-- GpGraphics::Flush() modes
***************************************************************************************************************************
#DEFINE cnGDIPLUS_FlushIntention_Flush						0
#DEFINE cnGDIPLUS_FlushIntention_Sync						1


****************************************************************************************************************************-- Image file format identifiers (GUIDs)
***************************************************************************************************************************
#DEFINE cnGDIPLUS_IMAGEFORMAT_Undefined						0hA93C6BB92807D3119D7B0000F81EF32E
#DEFINE cnGDIPLUS_IMAGEFORMAT_MemoryBMP						0hAA3C6BB92807D3119D7B0000F81EF32E
#DEFINE cnGDIPLUS_IMAGEFORMAT_BMP							0hAB3C6BB92807D3119D7B0000F81EF32E
#DEFINE cnGDIPLUS_IMAGEFORMAT_EMF							0hAC3C6BB92807D3119D7B0000F81EF32E
#DEFINE cnGDIPLUS_IMAGEFORMAT_WMF							0hAD3C6BB92807D3119D7B0000F81EF32E
#DEFINE cnGDIPLUS_IMAGEFORMAT_JPEG							0hAE3C6BB92807D3119D7B0000F81EF32E
#DEFINE cnGDIPLUS_IMAGEFORMAT_PNG							0hAF3C6BB92807D3119D7B0000F81EF32E
#DEFINE cnGDIPLUS_IMAGEFORMAT_GIF							0hB03C6BB92807D3119D7B0000F81EF32E
#DEFINE cnGDIPLUS_IMAGEFORMAT_TIFF							0hB13C6BB92807D3119D7B0000F81EF32E
#DEFINE cnGDIPLUS_IMAGEFORMAT_EXIF							0hB23C6BB92807D3119D7B0000F81EF32E
#DEFINE cnGDIPLUS_IMAGEFORMAT_Icon							0hB53C6BB92807D3119D7B0000F81EF32E


#DEFINE ccEncoder_Bitmap 									"{557cf400-1a04-11d3-9a73-0000f81ef32e}"
#DEFINE ccEncoder_Jpeg   									"{557CF401-1A04-11D3-9A73-0000F81EF32E}"
#DEFINE ccEncoder_Gif    									"{557cf402-1a04-11d3-9a73-0000f81ef32e}"
#DEFINE ccEncoder_Tiff   									"{557cf405-1a04-11d3-9a73-0000f81ef32e}"
#DEFINE ccEncoder_Png    									"{557cf406-1a04-11d3-9a73-0000f81ef32e}"

***************************************************************************************************************************
*-- Pixel formats
***************************************************************************************************************************
#DEFINE cnGDIPLUS_PIXELFORMAT_Indexed      					0x00010000 && Indexes into a palette
#DEFINE cnGDIPLUS_PIXELFORMAT_GDI          					0x00020000 && Is a GDI-supported format
#DEFINE cnGDIPLUS_PIXELFORMAT_Alpha        					0x00040000 && Has an alpha component
#DEFINE cnGDIPLUS_PIXELFORMAT_PAlpha       					0x00080000 && Pre-multiplied alpha
#DEFINE cnGDIPLUS_PIXELFORMAT_Extended     					0x00100000 && Extended color 16 bits/channel
#DEFINE cnGDIPLUS_PIXELFORMAT_Canonical    					0x00200000 
#DEFINE cnGDIPLUS_PIXELFORMAT_Undefined       				0
#DEFINE cnGDIPLUS_PIXELFORMAT_DontCare        				0

#DEFINE cnGDIPLUS_PIXELFORMAT_1bppIndexed     				0x00030101
#DEFINE cnGDIPLUS_PIXELFORMAT_4bppIndexed     				0x00030402
#DEFINE cnGDIPLUS_PIXELFORMAT_8bppIndexed     				0x00030803
#DEFINE cnGDIPLUS_PIXELFORMAT_16bppGrayScale  				0x00101004
#DEFINE cnGDIPLUS_PIXELFORMAT_16bppRGB555     				0x00021005
#DEFINE cnGDIPLUS_PIXELFORMAT_16bppRGB565     				0x00021006
#DEFINE cnGDIPLUS_PIXELFORMAT_16bppARGB1555   				0x00061007
#DEFINE cnGDIPLUS_PIXELFORMAT_24bppRGB        				0x00021808
#DEFINE cnGDIPLUS_PIXELFORMAT_32bppRGB        				0x00022009
#DEFINE cnGDIPLUS_PIXELFORMAT_32bppARGB       				0x0026200A
#DEFINE cnGDIPLUS_PIXELFORMAT_32bppPARGB      				0x000E200B
#DEFINE cnGDIPLUS_PIXELFORMAT_48bppRGB        				0x0010300C
#DEFINE cnGDIPLUS_PIXELFORMAT_64bppPARGB      				0x001C400E

****************************************************************************************************************************-- Encoder parameter type
***************************************************************************************************************************
#DEFINE cnGDIPLUS_ValueDataType_Byte						1	&& 8-bit unsigned
#DEFINE cnGDIPLUS_ValueDataType_ASCII						2	&& character string
#DEFINE cnGDIPLUS_ValueDataType_Short						3	&& 16-bit unsigned
#DEFINE cnGDIPLUS_ValueDataType_Long						4	&& 32-bit unsigned
#DEFINE cnGDIPLUS_ValueDataType_Rational					5	&& fraction ulong/ulong
#DEFINE cnGDIPLUS_ValueDataType_LongRange					6	&& Two ulongs (min,max)
#DEFINE cnGDIPLUS_ValueDataType_Undefined					7	&& array of bytes
#DEFINE cnGDIPLUS_ValueDataType_RationalRange				8	&& four ulongs
#DEFINE cnGDIPLUS_ValueDataType_Pointer						9	&& pointer

#DEFINE cnGDIPLUS_ENCODER_Compression						0h9D739DE0D4CCEE448EBA3FBF8BE4FC58
#DEFINE cnGDIPLUS_ENCODER_ColorDepth						0h5570086666AD7C4C9A1838A2310B8337
#DEFINE cnGDIPLUS_ENCODER_ScanMethod						0h61264E3A0931564E853642C156E7DCFA
#DEFINE cnGDIPLUS_ENCODER_Version							0h768CD1244A81A441BF531C219CCCF797
#DEFINE cnGDIPLUS_ENCODER_RenderMethod						0h3AC5426D9A2225488BB75C99E2B9A8B8
#DEFINE cnGDIPLUS_ENCODER_Quality							0hB5E45B1D4AFA2D459CDD5DB35105E7EB
#DEFINE cnGDIPLUS_ENCODER_Transformation					0hD1B20E8D8EA5A84EAA14108074B7B6F9
#DEFINE cnGDIPLUS_ENCODER_LuminanceTable					0hCE3BB3ED6602774AB90427216099E717
#DEFINE cnGDIPLUS_ENCODER_ChrominanceTable					0hDC55E4F2B30916438260676ADA32481C
#DEFINE cnGDIPLUS_ENCODER_SaveFlag							0hFC66222940ACBF478CFCA85B89A655DE

***************************************************************************************************************************
*-- Error messages
***************************************************************************************************************************
#DEFINE ccGDIPLUS_GDIPLUSNOTINIT_LOC						'GDI+ not initialized'
#DEFINE ccGDIPLUS_NOGDIPOBJECT_LOC							'GDI+ object not created or associated'
#DEFINE ccGDIPLUS_GDIPNOTOWNED_LOC							'GDI+ object not owned by VFP object'
#DEFINE ccGDIPLUS_INTERNALBUFTOOSMALL_LOC					'Internal error: buffer too small'
#DEFINE ccGDIPLUS_STRINGTOGUID_LOC							'StringToGUID error code ' + ALLTRIM(STR(lnResult))
#DEFINE ccGDIPLUS_MALLOCFAIL_LOC							'Memory allocation failed'
#DEFINE ccGDIPLUS_BADPROPERTYTAGTYPE_LOC					'Unknown or invalid property tag type'
#DEFINE ccGDIPLUS_BADENCODERPARAMSTRING_LOC					'Invalid encoder parameter string'
#DEFINE ccGDIPLUS_BADENCODERPARAMNAME_LOC					'Invalid encoder parameter name "'+ lcName +'"'
#DEFINE ccGDIPLUS_BADENCODERPARAMNAMETYPE_LOC				'Invalid data type for encoder parameter name'
#DEFINE ccGDIPLUS_BADENCODERPARAMVALUE_LOC					'Invalid encoder parameter value'

***************************************************************************************************************************
*-- Error handler
***************************************************************************************************************************
#DEFINE ccGDIPLUS_ERRNOLABEL_LOC							"Error:	"
#DEFINE ccGDIPLUS_ERRPROCLABEL_LOC							"Method:"
#DEFINE ccGDIPLUS_ERRLINELABEL_LOC							"Line:	"


#DEFINE cnGDIPLUS_GDIPLUSNOTINIT_LOC						1

****************************************************************************************************************************-- Encoder Values
***************************************************************************************************************************
#DEFINE cnEncoderValueCompressionLZW						2
#DEFINE cnEncoderValueCompressionCCITT3						3
#DEFINE cnEncoderValueCompressionCCITT4						4
#DEFINE cnEncoderValueCompressionRle						5
#DEFINE cnEncoderValueCompressionNone						6
#DEFINE cnEncoderValueTransformRotate90						13
#DEFINE cnEncoderValueTransformRotate180					14
#DEFINE cnEncoderValueTransformRotate270					15
#DEFINE cnEncoderValueTransformFlipHorizontal				16
#DEFINE cnEncoderValueTransformFlipVertical					17
#DEFINE cnEncoderValueMultiFrame							18
#DEFINE cnEncoderValueFrameDimensionTime					21
#DEFINE cnEncoderValueFrameDimensionPage					23

***************************************************************************************************************************
*-- Encoder parameter sets
***************************************************************************************************************************
#DEFINE cnGUID_Compress										"{e09d739d-ccd4-44ee-8eba-3fbf8be4fc58}"
#DEFINE cnGUID_ColorDepth									"{66087055-ad66-4c7c-9a18-38a2310b8337}"
#DEFINE cnGUID_Quality										"{1d5be4b5-fa4a-452d-9cdd-5db35105e7eb}"
#DEFINE cnGUID_Transform									"{8d0eb2d1-a58e-4ea8-aa14-108074b7b6f9}"
#DEFINE cnGUID_SaveFlag										"{292266fc-ac40-47bf-8cfc-a85b89a655de}"

***************************************************************************************************************************
*--CopyImage API flags 
***************************************************************************************************************************
#DEFINE cnCOPYIMAGE_Flag_DefaultColor					    0x0000
#DEFINE cnCOPYIMAGE_Flag_Monochrome						    0x0001
#DEFINE cnCOPYIMAGE_Flag_Color            					0x0002
#DEFINE cnCOPYIMAGE_Flag_Copyreturnorg   					0x0004
#DEFINE cnCOPYIMAGE_Flag_Copydeleteorg   					0x0008
#DEFINE cnCOPYIMAGE_Flag_Loadfromfile    					0x0010
#DEFINE cnCOPYIMAGE_Flag_Loadtransparent 					0x0020
#DEFINE cnCOPYIMAGE_Flag_Defaultsize     					0x0040
#DEFINE cnCOPYIMAGE_Flag_Vgacolor        					0x0080
#DEFINE cnCOPYIMAGE_Flag_Loadmap3dcolors 					0x1000
#DEFINE cnCOPYIMAGE_Flag_Createdibsection					0x2000
#DEFINE cnCOPYIMAGE_Flag_Copyfromresource					0x4000
#DEFINE cnCOPYIMAGE_Flag_Shared          					0x8000
