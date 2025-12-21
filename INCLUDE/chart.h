***************************************************************************************************************************
*-- Classes instantiated from chart.vcx
***************************************************************************************************************************
#DEFINE ccCHART_CLASS_LIBRARY										This.ClassLibrary
#DEFINE ccCHART_CLASS_NAME											'Chart'
#DEFINE ccCHART_CLASS_CHARTFILE									    'ChartFile'
#DEFINE ccCHART_CLASS_CHARTPANEL									'ChartPanel'
#DEFINE ccCHART_CLASS_XAXIS 										'ChartXAxis'
#DEFINE ccCHART_CLASS_YAXIS 										'ChartYAxis'
#DEFINE ccCHART_CLASS_Y2AXIS 										'ChartY2Axis'
#DEFINE ccCHART_CLASS_LEGEND										'ChartLegend'
#DEFINE ccCHART_CLASS_FONTSPEC										'ChartFontSpec'
#DEFINE ccCHART_CLASS_FILL											'ChartFill'
#DEFINE ccCHART_CLASS_CURVELIST										'ChartCurveList'
#DEFINE ccCHART_CLASS_TEXTITEM										'ChartTextItem'
#DEFINE ccCHART_CLASS_ARROWITEM										'ChartArrowItem'	
#DEFINE ccCHART_CLASS_CURVEITEM										'ChartCurveItem'	
#DEFINE ccCHART_CLASS_XDATE											'ChartXDate'
#DEFINE ccCHART_CLASS_POINTPAIRLIST 								'ChartPointPairList'
#DEFINE ccCHART_CLASS_LINE 											'ChartLine'
#DEFINE ccCHART_CLASS_LINEITEM										'ChartLineItem'
#DEFINE ccCHART_CLASS_SYMBOL 										'ChartSymbol'
#DEFINE ccCHART_CLASS_BAR											'ChartBar'
#DEFINE ccCHART_CLASS_BARITEM										'ChartBarItem'
#DEFINE ccCHART_CLASS_POINTPAIR										'ChartPointPair'
#DEFINE ccCHART_CLASS_COLORSYMBOLROTATOR							'ChartColorSymbolRotator'
#DEFINE ccCHART_CLASS_LOCATION										'ChartLocation'	
#DEFINE ccCHART_CLASS_BAR_VALUE_HANDLER								'ChartBarValueHandler'
#DEFINE ccCHART_CLASS_ERRORBAR										'ChartErrorBar'
#DEFINE ccCHART_CLASS_ERRORBARITEM									'ChartErrorBarItem'
#DEFINE ccCHART_CLASS_BORDER										'ChartBorder'
#DEFINE ccCHART_CLASS_CHARTITEMLIST									'ChartItemList'	
#DEFINE ccCHART_CLASS_PIEITEM										'ChartPieItem'
#DEFINE ccCHART_CLASS_BOXITEM										'ChartBoxItem'
***************************************************************************************************************************
*-- Enumeration type for the various axis types that are available
***************************************************************************************************************************
*-- An ordinary, cartesian axis
#DEFINE cnCHART_AXIS_TYPE_LINERAL									0

*-- A base 10 log axis
#DEFINE cnCHART_AXIS_TYPE_LOG										1

*-- A cartesian axis with calendar dates or times
#DEFINE cnCHART_AXIS_TYPE_DATE										2

*-- An ordinal axis with user-defined text labels. An ordinal axis means that
*-- all data points are evenly spaced at integral values, and the actual coordinate values
*-- for points corresponding to that axis are ignored.  That is, if the X axis is an
*-- ordinal type, then all X values associated with the curves are ignored. 
#DEFINE cnCHART_AXIS_TYPE_TEXT										3

*-- An ordinal axis with regular numeric labels.  An ordinal axis means that
*-- all data points are evenly spaced at integral values, and the actual coordinate values
*-- for points corresponding to that axis are ignored.  That is, if the X axis is an
*-- ordinal type, then all X values associated with the curves are ignored.
#DEFINE cnCHART_AXIS_TYPE_ORDINAL									4


***************************************************************************************************************************
*-- Enumeration type for the various types of fills that can be used with charts.
***************************************************************************************************************************
*-- No fill
#DEFINE cnCHART_NO_FILL												0

*--	Use a solid fill 
#DEFINE cnCHART_SOLID_FILL											1

*-- Use a custom fill 
#DEFINE cnCHART_CUSTOM_FILL											2


***************************************************************************************************************************
*--	Enumeration type for the various axis date and time unit types that are available
***************************************************************************************************************************
*-- Yearly units 
#DEFINE cnCHART_DATE_UNIT_YEAR										0

*-- Monthly units 
#DEFINE cnCHART_DATE_UNIT_MONTH										1

*-- Daily units 
#DEFINE cnCHART_DATE_UNIT_DAY										2

*-- Hourly units 
#DEFINE cnCHART_DATE_UNIT_HOUR										3		
		
*-- Minute units 
#DEFINE cnCHART_DATE_UNIT_MINUTE									4				
		
*-- Second units 
#DEFINE cnCHART_DATE_UNIT_SECOND									5				


***************************************************************************************************************************
*-- Enumeration type for the various symbol shapes that are available
***************************************************************************************************************************
*-- Square-shaped 
#DEFINE cnCHART_SYMBOL_TYPE_SQUARE									0						
		
*-- Rombus-shaped
#DEFINE cnCHART_SYMBOL_TYPE_DIAMOND									1						
		
*-- Equilateral triangle
#DEFINE cnCHART_SYMBOL_TYPE_TRIANGLE								2						
		
*-- Uniform circle
#DEFINE cnCHART_SYMBOL_TYPE_CIRCLE									3						
		
*-- "X" shaped. This symbol cannot	be filled since it has no outline.
#DEFINE cnCHART_SYMBOL_TYPE_XCROSS									4						
		
*-- "+" shaped. This symbol cannot	be filled since it has no outline.
#DEFINE cnCHART_SYMBOL_TYPE_PLUS									5						
		
*-- Asterisk-shaped. This symbol cannot	be filled since it has no outline.
#DEFINE cnCHART_SYMBOL_TYPE_STAR									6						

*-- Unilateral triangle, pointing down.
#DEFINE cnCHART_SYMBOL_TYPE_TRIANGLE_DOWN							7						

*-- Horizontal dash.  This symbol cannot be filled since it has no outline.
#DEFINE cnCHART_SYMBOL_TYPE_HDASH									8								
		
*-- Vertical dash.  This symbol cannot be filled since it has no outline.
#DEFINE cnCHART_SYMBOL_TYPE_VDASH									9								

*-- A Default symbol type.
#DEFINE cnCHART_SYMBOL_TYPE_EMPTY									10						

***************************************************************************************************************************
*-- Enumeration type that defines the possible legend locations
***************************************************************************************************************************
*-- Locate the Legend above the AxisRect
#DEFINE cnCHART_LEGEND_POSITION_TOP									0								
		
*-- Locate the Legend on the left side of the AxisRect
#DEFINE cnCHART_LEGEND_POSITION_LEFT								1								

*-- Locate the Legend on the right side of the AxisRect
#DEFINE cnCHART_LEGEND_POSITION_RIGHT								2								

*-- Locate the Legend below the AxisRect
#DEFINE cnCHART_LEGEND_POSITION_BOTTOM								3								
		
*-- Locate the Legend inside the AxisRect in the top-left corner
#DEFINE cnCHART_LEGEND_POSITION_INSIDE_TOP_LEFT						4								
		
*-- Locate the Legend inside the AxisRect in the top-right corner
#DEFINE cnCHART_LEGEND_POSITION_INSIDE_TOP_RIGHT					5										
		
*-- Locate the Legend inside the AxisRect in the bottom-left corner
#DEFINE cnCHART_LEGEND_POSITION_INSIDE_BOTTOM_LEFT					6												
		
*-- Locate the Legend inside the AxisRect in the bottom-right corner
#DEFINE cnCHART_LEGEND_POSITION_INSIDE_BOTTOM_RIGHT					7												

#DEFINE cnCHART_LEGEND_POSITION_FLOAT								8												

*-- Locate the Legend centered above the Axis Rectangle
#DEFINE cnCHART_LEGEND_POSITION_INSIDE_TOP_CENTER					9

*-- Locate the Legend centered below the Axis Rectangle
#DEFINE cnCHART_LEGEND_POSITION_INSIDE_BOTTOM_CENTER				10


***************************************************************************************************************************
*-- Enumeration type for the different horizontal text alignment options
***************************************************************************************************************************
*-- Position the text so that its left edge is aligned with the specified X,Y location.  
#DEFINE cnCHART_HORIZONTAL_TEXT_ALIGNMENT_LEFT						0														
		
*-- Position the text so that its center is aligned (horizontally) with the specified X,Y location.
#DEFINE cnCHART_HORIZONTAL_TEXT_ALIGNMENT_CENTER					1																
		
*-- Position the text so that its right edge is aligned with the specified X,Y location.
#DEFINE cnCHART_HORIZONTAL_TEXT_ALIGNMENT_RIGHT						2																		
		

***************************************************************************************************************************
*-- Enumeration type for the different vertical text alignment options specified X,Y location.
***************************************************************************************************************************
*-- Position the text so that its top edge is aligned with the specified X,Y location. 
#DEFINE cnCHART_VERTICAL_TEXT_ALIGNMENT_TOP							0														
		
*-- Position the text so that its center is aligned (vertically) with the specified X,Y location.
#DEFINE cnCHART_VERTICAL_TEXT_ALIGNMENT_CENTER						1														
		
*-- Position the text so that its bottom edge is aligned with the specified X,Y location.		
#DEFINE cnCHART_VERTICAL_TEXT_ALIGNMENT_BOTTOM						2																


***************************************************************************************************************************
*-- Enumeration type for the user-defined coordinate types available.
***************************************************************************************************************************
*-- Coordinates are specified as a fraction of the Axis Rectangle.  That is, for the X coordinate, 0.0
*-- is at the left edge of the Axis Rectangle and 1.0 is at the right edge of the Axis Rectangle. 
*-- A value less than zero is left of the Axis Rectangle and a value greater than 1.0 is right of the Axis Rectangle.  
*-- For the Y coordinate, 0.0 is the bottom and 1.0 is the top.
#DEFINE cnCHART_COORDINATE_TYPE_AXIS_FRACTION						0																		
		
*-- Coordinates are specified as a fraction of the Panel Rectangle.  That is, for the X coordinate, 0.0
*-- is at the left edge of the Panel Rectangle and 1.0 is at the right edge of the Panel Rectangle. A value less
*-- than zero is left of the Panel Rectangle and a value greater than 1.0 is right of the Panel Rectangle.  
*-- For the Y coordinate, 0.0 is the bottom and 1.0 is the top.  
*-- Note that any value less than zero or greater than 1.0 will be outside
*-- the Panel Rectangle, and therefore clipped.
#DEFINE cnCHART_COORDINATE_TYPE_PANEL_FRACTION						1																				
		
*-- Coordinates are specified according to the user axis scales for the XAxis and YAxis.
#DEFINE cnCHART_COORDINATE_TYPE_AXIS_XY_SCALE						2																						
		
*-- Coordinates are specified according to the user axis scales for the XAxis and Y2Axis.
#DEFINE cnCHART_COORDINATE_TYPE_AXIS_XY2_SCALE						3																						
		
		
***************************************************************************************************************************
*-- Enumeration type that defines how a curve is drawn.  Curves can be drawn
*-- as ordinary lines by connecting the points directly, or in a stair-step
*-- fashion as a series of discrete, constant values.  In a stair step plot,
*-- all lines segments are either horizontal or vertical.  In a non-step (line)
*-- plot, the lines can be any angle.
***************************************************************************************************************************
*-- Draw the line as a stair-step in which each point defines the
*-- beginning (left side) of a new stair.  This implies the points are
*-- defined at the beginning of an "event."
#DEFINE cnCHART_LINE_STEP_TYPE_FORWARD								0																						

*-- Draw the line as a stair-step in which each point defines the end (right side) of a new stair.  This implies
*-- the points are defined at the end of an "event."
#DEFINE cnCHART_LINE_STEP_TYPE_REARWARD								1																								
		
*-- Draw the line as an ordinary line, in which the points are connected directly by line segments.
#DEFINE cnCHART_LINE_STEP_TYPE_NONE									2																								


***************************************************************************************************************************
*-- Enumeration type that defines the base axis from which "Bar" graphs are displayed. The bars can be drawn on any of 
*-- the three axes.
***************************************************************************************************************************
*-- Draw the "Bar" chart based from the "XAxis".
#DEFINE cnCHART_BAR_BASE_AXIS_X										0																								

*-- Draw the "Bar" chart based from the "YAxis".
#DEFINE cnCHART_BAR_BASE_AXIS_Y										1																								

*-- Draw the "Bar" chart based from the "Y2Axis".
#DEFINE cnCHART_BAR_BASE_AXIS_Y2									2																								


***************************************************************************************************************************
*-- Nearest tolerance
***************************************************************************************************************************
*-- The tolerance that is applied to the ChartPanel.FindNearestPoint routine.
*-- If a given curve point is within this many pixels of the MousePt, the curve
*-- point is considered to be close enough for selection as a nearest point candidate.

#DEFINE cnCHART_NEAREST_TOLERANCE									7																								


***************************************************************************************************************************
*-- Enumeration type that defines the type of axis class
***************************************************************************************************************************
#DEFINE cnCHART_AXIS_BASE_CLASS_X									0																								
#DEFINE cnCHART_AXIS_BASE_CLASS_Y									1																								
#DEFINE cnCHART_AXIS_BASE_CLASS_Y2									2																								
***************************************************************************************************************************
*
***************************************************************************************************************************
*-- The number of months in a year
#DEFINE cnCHART_MONTHS_PER_YEAR 									12

*-- The number of hours in a day
#DEFINE cnCHART_HOURS_PER_DAY										24

*-- The number of minutes in an hour
#DEFINE cnCHART_MINUTES_PER_HOUR 									60
		
*-- The number of seconds in a minute
#DEFINE cnCHART_SECONDS_PER_MINUTE									60

*-- The number of minutes in a day
#DEFINE cnCHART_MINUTES_PER_DAY 									1440
		
*-- The number of seconds in a day
#DEFINE cnCHART_SECONDS_PER_DAY 									86400

*-- The default format string to be used in ToString when no format is provided
#DEFINE cnCHART_DEFAULT_FORMAT_STR									"&d-&mmm-&yy &hh:&nn"


***************************************************************************************************************************
*-- Enumeration type that defines the available types of BarItem
***************************************************************************************************************************
*-- Draw each BarItem side by side in clusters
#DEFINE cnCHART_BAR_TYPE_CLUSTER									0																								
*-- Draw the BarItem bars one on top of the other.  The bars will be drawn such that the last bar in the CurveList will be 
*-- behind all other bars.  Note that the bar values are not summed up for the overlay mode
#DEFINE cnCHART_BAR_TYPE_OVERLAY									1																								
*-- Draw the BarItem bars one on top of the other.  The bars will be drawn such that the bars are sorted according to the 
*-- maximum value, with the tallest bar at each point at the back and the shortest bar at the front.
#DEFINE cnCHART_BAR_TYPE_SORTEDOVERLAY								2																										
*-- Draw the BarItem bars in an additive format so that they stack on top of one another.  The value of the last bar drawn 
*-- will be the sum of the values of all prior bars.
#DEFINE cnCHART_BAR_TYPE_STACK										3																										
*-- Draw the BarItem bars in a format whereby the height of each represents the percentage of the total each one represents.  
*--Negative values are displayed below the zero line as percentages of the absolute total of all values. 
#DEFINE cnCHART_BAR_TYPE_PERCENTSTACK								4																										

***************************************************************************************************************************
*-- Enumeration type that defines the available types of CurveItem
***************************************************************************************************************************
#DEFINE cnCHART_CURVEITEM_TYPE_LINE									0
#DEFINE cnCHART_CURVEITEM_TYPE_BAR									1
#DEFINE cnCHART_CURVEITEM_TYPE_ERRORBAR								2
#DEFINE cnCHART_CURVEITEM_TYPE_HILOWBAR								3
#DEFINE cnCHART_CURVEITEM_TYPE_PIE									4

***************************************************************************************************************************
*-- Represented missing values
***************************************************************************************************************************
#DEFINE cnCHART_MISSING_VALUE										10^305

***************************************************************************************************************************
*-- Enumeration that specifies a Z-Order position for ChartItem objects
***************************************************************************************************************************
*-- The order of the chart elements is normally (front to back):

*-- Specifies that the ChartItem will be behind all other objects (including the Axis rectangle fill).
#DEFINE cnCHART_ZORDER_TYPE_BehindAll								0

*-- Specifies that the ChartItem will be behind the AxisRect background Fill.
#DEFINE cnCHART_ZORDER_TYPE_BehindAxisFill							1

*-- Specifies that the ChartItem will be behind the Axis objects.
#DEFINE cnCHART_ZORDER_TYPE_BehindAxis								2

*-- Specifies that the ChartItem will be behind the CurveItem objects.
#DEFINE cnCHART_ZORDER_TYPE_BehindCurves 							3

*-- Specifies that the ChartItem will be behind the Axis border.
#DEFINE cnCHART_ZORDER_TYPE_BehindAxisBorder						4

*-- Specifies that the ChartItem will be behind the Legend object.
#DEFINE cnCHART_ZORDER_TYPE_BehindLegend							5

*-- Specifies that the ChartItem will be in front of all other objects, except for the other ChartItem
*-- objects that have the same ZOrder and are before this object in the ChartItemList.
#DEFINE cnCHART_ZORDER_TYPE_InFront									6

***************************************************************************************************************************
*-- Enumeration type that defines which set of data points - X or Y - is used to perform the sort. 
***************************************************************************************************************************	
*-- Use the Y values to sort the list.
#DEFINE cnCHART_SORT_TYPE_YVALUS									0
*-- Use the X values to sort the list.
#DEFINE cnCHART_SORT_TYPE_XVALUS									1

***************************************************************************************************************************
*-- Enumeration type for the different proximal alignment options
***************************************************************************************************************************	
*-- Position the text so that its "inside" edge (the edge that is nearest to the alignment reference point or object) 
*-- is aligned. Used by the Axis.nScaleAlign property to align text to the axis.
#DEFINE cnCHART_PROXIMAL_TEXT_ALIGNMENT_INSIDE						0														

*-- Position the text so that its center is aligned with the reference object or point.
*-- Used by the Axis.nScaleAlign property to align text to the axis.
#DEFINE cnCHART_PROXIMAL_TEXT_ALIGNMENT_CENTER						1																
*-- Position the text so that its right edge (the edge that is farthest from the alignment reference point or object) 
*-- is aligned. Used by the Axis.nScaleAlign property to align text to the axis.
#DEFINE cnCHART_PROXIMAL_TEXT_ALIGNMENT_OUTSIDE						2																

***************************************************************************************************************************
*-- Enumeration that determines the type of label that is displayed for each pie slice
***************************************************************************************************************************
*-- Displays Label and Value for a slice in a Pie Chart.
#DEFINE cnCHART_PIE_LABEL_TYPE_NAME_VALUE							0

*-- Displays Label and Value (as % of total) for a slice in a Pie Chart.
#DEFINE cnCHART_PIE_LABEL_TYPE_NAME_PERCENT							1

*-- Displays a Label containing the Value both as an absolute number and as percentage of the total.
#DEFINE cnCHART_PIE_LABEL_TYPE_NAME_VALUE_PERCENT					2

*-- Displays Value for a slice in a Pie Chart.
#DEFINE cnCHART_PIE_LABEL_TYPE_VALUE								3

*-- Displays Value (as % of total) for a slice in a Pie Chart.
#DEFINE cnCHART_PIE_LABEL_TYPE_PERCENT								4

*-- Displays Label for a slice in a Pie Chart.
#DEFINE cnCHART_PIE_LABEL_TYPE_NAME									5

*-- No label displayed. 
#DEFINE cnCHART_PIE_LABEL_TYPE_NONE									6





