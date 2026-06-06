USE [ERP_2]
GO
/****** Object:  Table [dbo].[Roll_log]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Roll_log]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Roll_log](
	[alloyname] [char](12) NULL,
	[heat] [char](50) NULL,
	[lot] [int] NOT NULL,
	[date] [datetime] NULL,
	[form] [char](2) NULL,
	[spiece] [decimal](5, 1) NULL,
	[ssize] [decimal](9, 3) NULL,
	[swidth] [decimal](9, 3) NULL,
	[slength] [decimal](9, 3) NULL,
	[sweight] [decimal](8, 1) NULL,
	[rollsize] [decimal](9, 3) NULL,
	[fpiece] [decimal](5, 0) NULL,
	[fsize] [decimal](9, 3) NULL,
	[fwidth] [decimal](9, 3) NULL,
	[flength] [decimal](9, 3) NULL,
	[condition] [char](10) NULL,
	[htreat] [char](16) NULL,
	[coldwork] [decimal](3, 3) NULL,
	[salesnum] [int] NULL,
	[itemSO] [decimal](2, 0) NULL,
	[soitem] [char](10) NULL,
	[spec] [varchar](50) NULL,
	[po] [char](50) NULL,
	[oventemp] [decimal](4, 0) NULL,
	[notes] [varchar](max) NULL,
	[tensile] [decimal](6, 0) NULL,
	[yield] [decimal](6, 0) NULL,
	[elongation] [decimal](4, 1) NULL,
	[red_area] [decimal](4, 1) NULL,
	[rockwell] [char](4) NULL,
	[bhn] [decimal](3, 0) NULL,
	[Tensile2] [decimal](6, 0) NULL,
	[Yield2] [decimal](6, 0) NULL,
	[Elongation2] [decimal](4, 1) NULL,
	[Red_Area2] [decimal](4, 1) NULL,
	[Rockwell2] [char](4) NULL,
	[BHN2] [decimal](3, 0) NULL,
	[Tensile3] [decimal](6, 0) NULL,
	[Yield3] [decimal](6, 0) NULL,
	[Elongation3] [decimal](4, 1) NULL,
	[Red_Area3] [decimal](4, 1) NULL,
	[Rockwell3] [char](4) NULL,
	[BHN3] [decimal](3, 0) NULL,
	[testpo] [int] NULL,
	[testPoItem] [char](12) NULL,
	[testItemPO] [decimal](2, 0) NULL,
	[testsent] [datetime] NULL,
	[lab] [char](12) NULL,
	[passed] [bit] NULL,
	[CustomerMat] [bit] NULL,
	[chart] [bit] NULL,
	[minutes] [decimal](4, 0) NULL,
	[laborp] [decimal](8, 2) NULL,
	[ovenp] [decimal](8, 2) NULL,
	[cgp] [decimal](8, 2) NULL,
	[HTrockwell] [char](4) NULL,
	[HTBHN] [decimal](3, 0) NULL,
	[ChartData] [bit] NULL,
	[SrvcPO] [int] NULL,
	[LMA_Practice] [varchar](7) NULL,
	[LMA_Procedure] [varchar](12) NULL,
	[GrainSize] [varchar](10) NULL,
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[WO] [int] NULL,
	[WO_Detail] [int] NULL,
	[Machine] [char](1) NULL,
	[Oper] [varchar](10) NULL,
	[ProjID] [int] NULL,
	[AC_ID] [int] NULL,
	[AC_cmplt] [bit] NULL,
	[R] [bit] NULL,
	[WhoInsert] [varchar](254) NULL,
 CONSTRAINT [PK_roll_log] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Wire_log]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Wire_log]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Wire_log](
	[alloyname] [char](12) NULL,
	[heat] [char](50) NULL,
	[lot] [int] NOT NULL,
	[date] [datetime] NULL,
	[form] [char](2) NULL,
	[sPiece] [decimal](5, 1) NULL,
	[sSize] [decimal](9, 3) NULL,
	[sWeight] [decimal](8, 1) NULL,
	[DrawSize] [decimal](9, 3) NULL,
	[fPiece] [decimal](5, 0) NULL,
	[fSize] [decimal](9, 3) NULL,
	[fWeight] [decimal](8, 1) NULL,
	[Condition] [char](10) NULL,
	[htreat] [char](16) NULL,
	[coldwork] [decimal](3, 3) NULL,
	[salesnum] [int] NULL,
	[itemSO] [decimal](2, 0) NULL,
	[SOitem] [char](10) NULL,
	[spec] [varchar](50) NULL,
	[PO] [varchar](50) NULL,
	[OvenTemp] [smallint] NULL,
	[notes] [varchar](max) NULL,
	[Tensile] [decimal](6, 0) NULL,
	[Yield] [decimal](6, 0) NULL,
	[Elongation] [decimal](4, 1) NULL,
	[Red_Area] [decimal](4, 1) NULL,
	[Rockwell] [char](4) NULL,
	[BHN] [decimal](3, 0) NULL,
	[Tensile2] [decimal](6, 0) NULL,
	[Yield2] [decimal](6, 0) NULL,
	[Elongation2] [decimal](4, 1) NULL,
	[Red_Area2] [decimal](4, 1) NULL,
	[Rockwell2] [char](4) NULL,
	[BHN2] [decimal](3, 0) NULL,
	[Tensile3] [decimal](6, 0) NULL,
	[Yield3] [decimal](6, 0) NULL,
	[Elongation3] [decimal](4, 1) NULL,
	[Red_Area3] [decimal](4, 1) NULL,
	[Rockwell3] [char](4) NULL,
	[BHN3] [decimal](3, 0) NULL,
	[testpo] [int] NULL,
	[testPoItem] [char](12) NULL,
	[testItemPO] [decimal](2, 0) NULL,
	[testsent] [datetime] NULL,
	[lab] [char](12) NULL,
	[passed] [bit] NULL,
	[CustomerMat] [bit] NULL,
	[minutes] [decimal](4, 0) NULL,
	[laborp] [decimal](8, 2) NULL,
	[HTrockwell] [char](4) NULL,
	[HTBHN] [decimal](3, 0) NULL,
	[ChartData] [bit] NULL,
	[SrvcPO] [int] NULL,
	[LMA_Practice] [varchar](7) NULL,
	[LMA_Procedure] [varchar](12) NULL,
	[GrainSize] [varchar](10) NULL,
	[ID] [int] IDENTITY(1000,1) NOT FOR REPLICATION NOT NULL,
	[WO] [int] NULL,
	[WO_Detail] [int] NULL,
	[Machine] [char](1) NULL,
	[Oper] [varchar](10) NULL,
	[Sched] [int] NULL,
	[ProjID] [int] NULL,
	[AC_ID] [int] NULL,
	[AC_cmplt] [bit] NULL,
	[R] [bit] NULL,
	[WhoInsert] [varchar](254) NULL,
 CONSTRAINT [PK_Wire_log] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Swage_Log]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Swage_Log]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Swage_Log](
	[AlloyName] [char](12) NULL,
	[Heat] [char](50) NULL,
	[Lot] [int] NOT NULL,
	[Date] [datetime] NULL,
	[sPiece] [decimal](5, 1) NULL,
	[sSize] [decimal](9, 3) NULL,
	[sLength] [decimal](9, 3) NULL,
	[sWeight] [decimal](8, 1) NULL,
	[SwageSize] [decimal](9, 3) NULL,
	[fPiece] [decimal](5, 0) NULL,
	[fSize] [decimal](9, 3) NULL,
	[fLength] [decimal](9, 3) NULL,
	[Condition] [char](10) NULL,
	[HTreat] [char](16) NULL,
	[ColdWork] [decimal](3, 3) NULL,
	[SalesNum] [int] NULL,
	[ItemSO] [decimal](2, 0) NULL,
	[SOitem] [char](10) NULL,
	[Spec] [varchar](50) NULL,
	[PO] [varchar](50) NULL,
	[OvenTemp] [decimal](4, 0) NULL,
	[Notes] [varchar](max) NULL,
	[Tensile] [decimal](6, 0) NULL,
	[Yield] [decimal](6, 0) NULL,
	[Elongation] [decimal](4, 1) NULL,
	[Red_Area] [decimal](4, 1) NULL,
	[tLoc] [char](1) NULL,
	[Rockwell] [char](4) NULL,
	[BHN] [decimal](3, 0) NULL,
	[Tensile2] [decimal](6, 0) NULL,
	[Yield2] [decimal](6, 0) NULL,
	[Elongation2] [decimal](4, 1) NULL,
	[Red_Area2] [decimal](4, 1) NULL,
	[tLoc2] [char](1) NULL,
	[Rockwell2] [char](4) NULL,
	[BHN2] [decimal](3, 0) NULL,
	[Tensile3] [decimal](6, 0) NULL,
	[Yield3] [decimal](6, 0) NULL,
	[Elongation3] [decimal](4, 1) NULL,
	[red_area3] [decimal](4, 1) NULL,
	[tLoc3] [char](1) NULL,
	[Rockwell3] [char](4) NULL,
	[BHN3] [decimal](3, 0) NULL,
	[Tensile4] [decimal](6, 0) NULL,
	[Yield4] [decimal](6, 0) NULL,
	[Elongation4] [decimal](4, 1) NULL,
	[Red_Area4] [decimal](4, 1) NULL,
	[tLoc4] [char](1) NULL,
	[Rockwell4] [char](4) NULL,
	[BHN4] [decimal](3, 0) NULL,
	[Tensile5] [decimal](6, 0) NULL,
	[Yield5] [decimal](6, 0) NULL,
	[Elongation5] [decimal](4, 1) NULL,
	[Red_Area5] [decimal](4, 1) NULL,
	[tLoc5] [char](1) NULL,
	[Rockwell5] [char](4) NULL,
	[BHN5] [decimal](3, 0) NULL,
	[Tensile6] [decimal](6, 0) NULL,
	[Yield6] [decimal](6, 0) NULL,
	[Elongation6] [decimal](4, 1) NULL,
	[Red_Area6] [decimal](4, 1) NULL,
	[tLoc6] [char](1) NULL,
	[Tensile7] [decimal](6, 0) NULL,
	[Yield7] [decimal](6, 0) NULL,
	[Elongation7] [decimal](4, 1) NULL,
	[Red_Area7] [decimal](4, 1) NULL,
	[tLoc7] [char](1) NULL,
	[TestPO] [int] NULL,
	[TestPOitem] [char](12) NULL,
	[TestItemPO] [decimal](2, 0) NULL,
	[TestSent] [datetime] NULL,
	[Lab] [char](12) NULL,
	[Passed] [bit] NULL,
	[TestPO2] [int] NULL,
	[TestPOitem2] [char](12) NULL,
	[TestSent2] [date] NULL,
	[Lab2] [char](12) NULL,
	[Passed2] [bit] NULL,
	[CustomerMat] [bit] NULL,
	[Chart] [bit] NULL,
	[Minutes] [decimal](4, 0) NULL,
	[GFMp] [decimal](8, 2) NULL,
	[Ovenp] [decimal](8, 2) NULL,
	[cgp] [decimal](8, 2) NULL,
	[HTrockwell] [char](4) NULL,
	[HTBHN] [decimal](3, 0) NULL,
	[ChartData] [bit] NULL,
	[SrvcPO] [int] NULL,
	[LMA_Practice] [varchar](7) NULL,
	[LMA_Procedure] [varchar](12) NULL,
	[SpaceX] [bit] NULL,
	[GrainSize] [varchar](10) NULL,
	[ID] [int] IDENTITY(1001,1) NOT FOR REPLICATION NOT NULL,
	[WO] [int] NOT NULL,
	[WO_Detail] [int] NOT NULL,
	[Machine] [char](1) NULL,
	[Oper] [varchar](10) NULL,
	[Sched] [int] NULL,
	[ProjID] [int] NULL,
	[AC_ID] [int] NULL,
	[AC_cmplt] [bit] NULL,
	[R] [bit] NULL,
	[WhoInsert] [varchar](254) NULL,
 CONSTRAINT [PK_Swage_Log] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Draw_log]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Draw_log]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Draw_log](
	[AlloyName] [char](12) NULL,
	[Heat] [char](50) NULL,
	[Lot] [int] NOT NULL,
	[Date] [datetime] NULL,
	[sPiece] [decimal](5, 1) NULL,
	[sSize] [decimal](9, 3) NULL,
	[sLength] [decimal](9, 3) NULL,
	[sWeight] [decimal](8, 1) NULL,
	[DrawSize] [decimal](9, 3) NULL,
	[fPiece] [decimal](5, 0) NULL,
	[fSize] [decimal](9, 3) NULL,
	[fLength] [decimal](9, 3) NULL,
	[Condition] [char](10) NULL,
	[HTreat] [char](16) NULL,
	[ColdWork] [decimal](3, 3) NULL,
	[SalesNum] [int] NULL,
	[ItemSO] [decimal](2, 0) NULL,
	[SOitem] [char](10) NULL,
	[Spec] [varchar](50) NULL,
	[PO] [varchar](50) NULL,
	[OvenTemp] [decimal](4, 0) NULL,
	[Notes] [varchar](max) NULL,
	[Tensile] [decimal](6, 0) NULL,
	[Yield] [decimal](6, 0) NULL,
	[Elongation] [decimal](4, 1) NULL,
	[Red_Area] [decimal](4, 1) NULL,
	[tLoc] [char](1) NULL,
	[Rockwell] [char](4) NULL,
	[BHN] [decimal](3, 0) NULL,
	[Tensile2] [decimal](6, 0) NULL,
	[Yield2] [decimal](6, 0) NULL,
	[Elongation2] [decimal](4, 1) NULL,
	[Red_Area2] [decimal](4, 1) NULL,
	[tLoc2] [char](1) NULL,
	[Rockwell2] [char](4) NULL,
	[BHN2] [decimal](3, 0) NULL,
	[Tensile3] [decimal](6, 0) NULL,
	[Yield3] [decimal](6, 0) NULL,
	[Elongation3] [decimal](4, 1) NULL,
	[red_area3] [decimal](4, 1) NULL,
	[tLoc3] [char](1) NULL,
	[Rockwell3] [char](4) NULL,
	[BHN3] [decimal](3, 0) NULL,
	[Tensile4] [decimal](6, 0) NULL,
	[Yield4] [decimal](6, 0) NULL,
	[Elongation4] [decimal](4, 1) NULL,
	[Red_Area4] [decimal](4, 1) NULL,
	[tLoc4] [char](1) NULL,
	[Rockwell4] [char](4) NULL,
	[BHN4] [decimal](3, 0) NULL,
	[Tensile5] [decimal](6, 0) NULL,
	[Yield5] [decimal](6, 0) NULL,
	[Elongation5] [decimal](4, 1) NULL,
	[Red_Area5] [decimal](4, 1) NULL,
	[tLoc5] [char](1) NULL,
	[Rockwell5] [char](4) NULL,
	[BHN5] [decimal](3, 0) NULL,
	[Tensile6] [decimal](6, 0) NULL,
	[Yield6] [decimal](6, 0) NULL,
	[Elongation6] [decimal](4, 1) NULL,
	[Red_Area6] [decimal](4, 1) NULL,
	[tLoc6] [char](1) NULL,
	[Tensile7] [decimal](6, 0) NULL,
	[Yield7] [decimal](6, 0) NULL,
	[Elongation7] [decimal](4, 1) NULL,
	[Red_Area7] [decimal](4, 1) NULL,
	[tLoc7] [char](1) NULL,
	[TestPO] [int] NULL,
	[TestPOitem] [char](12) NULL,
	[TestItemPO] [decimal](2, 0) NULL,
	[TestSent] [datetime] NULL,
	[Lab] [char](12) NULL,
	[Passed] [bit] NULL,
	[TestPO2] [int] NULL,
	[TestPOitem2] [char](12) NULL,
	[TestSent2] [date] NULL,
	[Lab2] [char](12) NULL,
	[Passed2] [bit] NULL,
	[CustomerMat] [bit] NULL,
	[Chart] [bit] NULL,
	[Minutes] [decimal](4, 0) NULL,
	[HTrockwell] [char](4) NULL,
	[HTBHN] [decimal](3, 0) NULL,
	[ChartData] [bit] NULL,
	[SrvcPO] [int] NULL,
	[LMA_Practice] [varchar](7) NULL,
	[LMA_Procedure] [varchar](12) NULL,
	[SpaceX] [bit] NULL,
	[GrainSize] [varchar](10) NULL,
	[ID] [int] IDENTITY(1000,1) NOT FOR REPLICATION NOT NULL,
	[WO] [int] NOT NULL,
	[WO_Detail] [int] NOT NULL,
	[Machine] [char](1) NULL,
	[Oper] [varchar](10) NULL,
	[Sched] [int] NULL,
	[ProjID] [int] NULL,
	[AC_ID] [int] NULL,
	[AC_cmplt] [bit] NULL,
	[R] [bit] NULL,
	[WhoInsert] [varchar](254) NULL,
 CONSTRAINT [PK_Draw_log] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LakeErie_log]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LakeErie_log]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LakeErie_log](
	[alloyname] [char](12) NULL,
	[heat] [char](50) NULL,
	[lot] [int] NOT NULL,
	[date] [datetime] NULL,
	[form] [char](2) NULL,
	[spiece] [decimal](5, 1) NULL,
	[ssize] [decimal](9, 3) NULL,
	[swidth] [decimal](9, 3) NULL,
	[slength] [decimal](9, 3) NULL,
	[sweight] [decimal](8, 1) NULL,
	[rollsize] [decimal](9, 3) NULL,
	[fpiece] [decimal](5, 0) NULL,
	[fsize] [decimal](9, 3) NULL,
	[fwidth] [decimal](9, 3) NULL,
	[flength] [decimal](9, 3) NULL,
	[condition] [char](10) NULL,
	[htreat] [char](16) NULL,
	[coldwork] [decimal](3, 3) NULL,
	[salesnum] [int] NULL,
	[itemSO] [decimal](2, 0) NULL,
	[soitem] [char](10) NULL,
	[spec] [varchar](50) NULL,
	[po] [char](50) NULL,
	[oventemp] [decimal](4, 0) NULL,
	[notes] [varchar](max) NULL,
	[tensile] [decimal](6, 0) NULL,
	[yield] [decimal](6, 0) NULL,
	[elongation] [decimal](4, 1) NULL,
	[red_area] [decimal](4, 1) NULL,
	[rockwell] [char](4) NULL,
	[bhn] [decimal](3, 0) NULL,
	[Tensile2] [decimal](6, 0) NULL,
	[Yield2] [decimal](6, 0) NULL,
	[Elongation2] [decimal](4, 1) NULL,
	[Red_Area2] [decimal](4, 1) NULL,
	[Rockwell2] [char](4) NULL,
	[BHN2] [decimal](3, 0) NULL,
	[Tensile3] [decimal](6, 0) NULL,
	[Yield3] [decimal](6, 0) NULL,
	[Elongation3] [decimal](4, 1) NULL,
	[Red_Area3] [decimal](4, 1) NULL,
	[Rockwell3] [char](4) NULL,
	[BHN3] [decimal](3, 0) NULL,
	[testpo] [int] NULL,
	[testPoItem] [char](12) NULL,
	[testItemPO] [decimal](2, 0) NULL,
	[testsent] [datetime] NULL,
	[lab] [char](12) NULL,
	[passed] [bit] NULL,
	[CustomerMat] [bit] NULL,
	[chart] [bit] NULL,
	[minutes] [decimal](4, 0) NULL,
	[laborp] [decimal](8, 2) NULL,
	[ovenp] [decimal](8, 2) NULL,
	[cgp] [decimal](8, 2) NULL,
	[HTrockwell] [char](4) NULL,
	[HTBHN] [decimal](3, 0) NULL,
	[ChartData] [bit] NULL,
	[SrvcPO] [int] NULL,
	[GrainSize] [varchar](10) NULL,
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[WO] [int] NULL,
	[WO_Detail] [int] NULL,
	[Machine] [char](1) NULL,
	[Oper] [varchar](10) NULL,
	[ProjID] [int] NULL,
	[AC_ID] [int] NULL,
	[AC_cmplt] [bit] NULL,
	[WhoInsert] [varchar](254) NULL,
 CONSTRAINT [PK_LakeErie_log] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_LakeErie_log] UNIQUE CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[HT_log]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HT_log]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HT_log](
	[alloyname] [char](12) NULL,
	[heat] [varchar](50) NULL,
	[lot] [int] NOT NULL,
	[date] [datetime] NULL,
	[spiece] [decimal](5, 1) NULL,
	[form] [char](2) NULL,
	[ssize] [decimal](9, 3) NULL,
	[swidth] [decimal](9, 3) NULL,
	[slength] [decimal](9, 3) NULL,
	[sweight] [decimal](8, 1) NULL,
	[rollsize] [decimal](9, 3) NULL,
	[condition] [char](10) NULL,
	[htreat] [char](16) NULL,
	[salesnum] [int] NULL,
	[itemSO] [decimal](2, 0) NULL,
	[soitem] [char](10) NULL,
	[spec] [varchar](50) NULL,
	[po] [char](15) NULL,
	[oventemp] [decimal](4, 0) NULL,
	[notes] [varchar](max) NULL,
	[tensile] [decimal](6, 0) NULL,
	[yield] [decimal](6, 0) NULL,
	[elongation] [decimal](4, 1) NULL,
	[red_area] [decimal](4, 1) NULL,
	[rockwell] [char](4) NULL,
	[bhn] [decimal](3, 0) NULL,
	[testpo] [decimal](9, 0) NULL,
	[testPoItem] [char](12) NULL,
	[testItemPO] [decimal](2, 0) NULL,
	[testsent] [datetime] NULL,
	[lab] [char](12) NULL,
	[passed] [bit] NULL,
	[CustomerMat] [bit] NULL,
	[chart] [bit] NULL,
	[minutes] [decimal](4, 0) NULL,
	[laborp] [decimal](8, 2) NULL,
	[ovenp] [decimal](8, 2) NULL,
	[HTrockwell] [char](4) NULL,
	[HTBHN] [decimal](3, 0) NULL,
	[ChartData] [bit] NULL,
	[SrvcPO] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[WO] [int] NULL,
	[WO_Detail] [int] NULL,
	[Machine] [char](1) NULL,
	[ProjID] [int] NULL,
	[AC_ID] [int] NULL,
	[AC_cmplt] [bit] NULL,
	[WhoInsert] [varchar](254) NULL,
 CONSTRAINT [PK_HT_log] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_HT_log] UNIQUE CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[GFMlog]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GFMlog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GFMlog](
	[AlloyName] [char](12) NULL,
	[Heat] [char](50) NULL,
	[Lot] [int] NOT NULL,
	[Date] [datetime] NULL,
	[sPiece] [decimal](5, 1) NULL,
	[sSize] [decimal](9, 3) NULL,
	[sLength] [decimal](9, 3) NULL,
	[sWeight] [decimal](8, 1) NULL,
	[GfmSize] [decimal](9, 3) NULL,
	[fPiece] [decimal](5, 0) NULL,
	[fSize] [decimal](9, 3) NULL,
	[fLength] [decimal](9, 3) NULL,
	[Condition] [char](10) NULL,
	[HTreat] [char](16) NULL,
	[ColdWork] [decimal](3, 3) NULL,
	[SalesNum] [int] NULL,
	[ItemSO] [decimal](2, 0) NULL,
	[SOitem] [char](10) NULL,
	[Spec] [char](50) NULL,
	[PO] [varchar](50) NULL,
	[OvenTemp] [decimal](4, 0) NULL,
	[Notes] [varchar](max) NULL,
	[Tensile] [decimal](6, 0) NULL,
	[Yield] [decimal](6, 0) NULL,
	[Elongation] [decimal](4, 1) NULL,
	[Red_Area] [decimal](4, 1) NULL,
	[tLoc] [char](1) NULL,
	[Rockwell] [char](4) NULL,
	[BHN] [decimal](3, 0) NULL,
	[Tensile2] [decimal](6, 0) NULL,
	[Yield2] [decimal](6, 0) NULL,
	[Elongation2] [decimal](4, 1) NULL,
	[Red_Area2] [decimal](4, 1) NULL,
	[tLoc2] [char](1) NULL,
	[Rockwell2] [char](4) NULL,
	[BHN2] [decimal](3, 0) NULL,
	[Tensile3] [decimal](6, 0) NULL,
	[Yield3] [decimal](6, 0) NULL,
	[Elongation3] [decimal](4, 1) NULL,
	[red_area3] [decimal](4, 1) NULL,
	[tLoc3] [char](1) NULL,
	[Rockwell3] [char](4) NULL,
	[BHN3] [decimal](3, 0) NULL,
	[Tensile4] [decimal](6, 0) NULL,
	[Yield4] [decimal](6, 0) NULL,
	[Elongation4] [decimal](4, 1) NULL,
	[Red_Area4] [decimal](4, 1) NULL,
	[tLoc4] [char](1) NULL,
	[Rockwell4] [char](4) NULL,
	[BHN4] [decimal](3, 0) NULL,
	[Tensile5] [decimal](6, 0) NULL,
	[Yield5] [decimal](6, 0) NULL,
	[Elongation5] [decimal](4, 1) NULL,
	[Red_Area5] [decimal](4, 1) NULL,
	[tLoc5] [char](1) NULL,
	[Rockwell5] [char](4) NULL,
	[BHN5] [decimal](3, 0) NULL,
	[Tensile6] [decimal](6, 0) NULL,
	[Yield6] [decimal](6, 0) NULL,
	[Elongation6] [decimal](4, 1) NULL,
	[Red_Area6] [decimal](4, 1) NULL,
	[tLoc6] [char](1) NULL,
	[Tensile7] [decimal](6, 0) NULL,
	[Yield7] [decimal](6, 0) NULL,
	[Elongation7] [decimal](4, 1) NULL,
	[Red_Area7] [decimal](4, 1) NULL,
	[tLoc7] [char](1) NULL,
	[TestPO] [int] NULL,
	[TestPOitem] [char](12) NULL,
	[TestItemPO] [decimal](2, 0) NULL,
	[TestSent] [datetime] NULL,
	[Lab] [char](12) NULL,
	[Passed] [bit] NULL,
	[TestPO2] [int] NULL,
	[TestPOitem2] [char](12) NULL,
	[TestSent2] [date] NULL,
	[Lab2] [char](12) NULL,
	[Passed2] [bit] NULL,
	[CustomerMat] [bit] NULL,
	[Chart] [bit] NULL,
	[Minutes] [decimal](4, 0) NULL,
	[GFMp] [decimal](8, 2) NULL,
	[Ovenp] [decimal](8, 2) NULL,
	[cgp] [decimal](8, 2) NULL,
	[HTrockwell] [char](4) NULL,
	[HTBHN] [decimal](3, 0) NULL,
	[ChartData] [bit] NULL,
	[SrvcPO] [int] NULL,
	[LMA_Practice] [varchar](7) NULL,
	[LMA_Procedure] [varchar](12) NULL,
	[SpaceX] [bit] NULL,
	[GrainSize] [varchar](10) NULL,
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[WO] [int] NOT NULL,
	[WO_Detail] [int] NOT NULL,
	[Machine] [char](1) NULL,
	[Oper] [varchar](10) NULL,
	[ProjID] [int] NULL,
	[AC_ID] [int] NULL,
	[AC_cmplt] [bit] NULL,
	[Report] [bit] NULL,
	[R] [char](1) NULL,
	[WhoInsert] [varchar](254) NULL,
 CONSTRAINT [PK_gfmlog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[vMFG_Log]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  Table [dbo].[Stocklst_Master]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Stocklst_Master]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Stocklst_Master](
	[Alloy] [char](12) NOT NULL,
	[Form] [char](2) NOT NULL,
	[CC] [char](1) NULL,
	[CL] [char](1) NULL,
	[Size] [decimal](9, 3) NOT NULL,
	[Cond] [varchar](50) NULL,
	[MWeight] [decimal](18, 8) NULL,
	[Specs] [varchar](160) NULL,
	[Heat] [varchar](50) NOT NULL,
	[Lot] [char](10) NULL,
	[Paid] [money] NULL,
	[PO_item] [char](12) NULL,
	[PoDueDate] [smalldatetime] NULL,
	[Mill] [char](10) NULL,
	[StkDate] [smalldatetime] NULL,
	[History] [char](20) NULL,
	[Num] [decimal](8, 0) NULL,
	[POStatus] [char](1) NULL,
	[BrandName] [char](20) NULL,
	[FROM_ID] [int] NULL,
	[Melt] [varchar](7) NULL,
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[mS_QTY] [money] NULL,
	[WO_Detail] [int] NULL,
	[ProjID] [int] NULL,
	[MillTrace] [bit] NULL,
	[DescriptID]  AS ((((isnull([Alloy],'            ')+isnull([Form],'  '))+isnull([CC],' '))+isnull([CL],' '))+str(round([Size],(9),(3)),(9),(3))) PERSISTED,
 CONSTRAINT [PK_stocklst_master] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[StockLst_Detail]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Detail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StockLst_Detail](
	[Size_H] [decimal](9, 4) NULL,
	[Size_L] [decimal](9, 4) NULL,
	[PC] [int] NULL,
	[Dim1] [decimal](18, 4) NOT NULL,
	[Dim2] [decimal](18, 4) NULL,
	[Dim3] [decimal](18, 4) NULL,
	[Length] [char](160) NULL,
	[Weight] [decimal](18, 4) NOT NULL,
	[CostValue] [money] NULL,
	[Descript] [varchar](20) NULL,
	[Location] [char](10) NULL,
	[FloorStatus] [char](1) NULL,
	[Class] [char](1) NULL,
	[Unit] [char](6) NULL,
	[RandLen] [bit] NOT NULL,
	[InvCheck] [datetime] NULL,
	[ID] [int] NOT NULL,
	[ID_Detail] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ReceivingID] [int] NULL,
	[InvoiceValue] [money] NOT NULL,
	[LiveCheck] [bit] NOT NULL,
	[AccountingCheck] [bit] NOT NULL,
	[Quarantine] [bit] NOT NULL,
	[S_QTY] [money] NOT NULL,
	[S_P] [money] NOT NULL,
	[S_Total] [money] NOT NULL,
	[S_PU] [tinyint] NULL,
	[Prime] [bit] NOT NULL,
	[WO] [int] NOT NULL,
 CONSTRAINT [PK_stocklst_detail] PRIMARY KEY CLUSTERED 
(
	[ID_Detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Object:  Table [dbo].[Sales]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sales]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sales](
	[SOitem] [char](10) NOT NULL,
	[SalesNum] [int] NOT NULL,
	[Item] [decimal](2, 0) NULL,
	[OrderSpec] [char](60) NULL,
	[S_Instrct] [varchar](max) NULL,
	[Inv] [bit] NULL,
	[BRK] [bit] NULL,
	[GFM] [bit] NULL,
	[Draw] [bit] NULL,
	[Roll] [bit] NULL,
	[Press] [bit] NULL,
	[Mach] [bit] NULL,
	[CG] [bit] NULL,
	[Plasma] [bit] NULL,
	[WJet] [bit] NULL,
	[ColdSaw] [bit] NULL,
	[Cert] [decimal](1, 0) NULL,
	[ItemTot] [decimal](2, 0) NULL,
	[ShipDue] [datetime] NULL,
	[Shipped] [datetime] NULL,
	[MatlWt] [decimal](9, 1) NULL,
	[cncld] [bit] NULL,
	[cmplt] [bit] NULL,
	[PartNo] [varchar](100) NULL,
	[ItemCost] [decimal](9, 2) NULL,
	[ItemSale] [decimal](9, 2) NULL,
	[StkCost] [decimal](9, 2) NULL,
	[POCost] [decimal](9, 2) NULL,
	[gs_cost] [decimal](9, 2) NULL,
	[gs_sale] [decimal](9, 2) NULL,
	[gs_cmplt] [bit] NULL,
	[RMA_No] [int] NULL,
	[RMA_Detail] [int] NULL,
	[QA] [bit] NULL,
	[CofC] [bit] NULL,
	[Merc] [bit] NULL,
	[pPo] [bit] NULL,
	[pPn] [bit] NULL,
	[pHeat] [bit] NULL,
	[pSpec] [bit] NULL,
	[pDesc] [bit] NULL,
	[pOther] [bit] NULL,
	[Other] [varchar](50) NULL,
	[prcp] [bit] NULL,
	[prcd] [bit] NULL,
	[pckd] [bit] NULL,
	[Urgent] [char](1) NULL,
	[ShipOn] [bit] NULL,
	[Tol] [varchar](20) NULL,
	[JobHours] [decimal](4, 1) NULL,
	[ProcLoc] [char](1) NULL,
	[Quoted_QTY] [money] NULL,
	[Quoted_P] [money] NULL,
	[Quoted_Total] [money] NULL,
	[Quoted_DollarTotal] [money] NULL,
	[Quoted_CutsP] [decimal](9, 2) NULL,
	[Quoted_OtherP] [decimal](9, 2) NULL,
	[Quoted_PU] [tinyint] NULL,
	[S_QTY] [money] NULL,
	[S_PU] [tinyint] NULL,
	[S_P] [money] NULL,
	[S_Total] [money] NULL,
	[Acct_Total]  AS (([S_Total]+isnull([Quoted_CutsP],(0)))+isnull([Quoted_OtherP],(0))) PERSISTED,
	[dShip] [bit] NULL,
	[Typ] [char](1) NULL,
	[WO] [int] NULL,
	[WO_Detail] [int] NULL,
	[ProductionWO] [bit] NULL,
	[IntP] [bit] NULL,
	[Export] [bit] NULL,
	[RcvdE] [bit] NULL,
	[RMA_E] [bit] NULL,
	[InqNumP] [char](9) NULL,
	[Hold] [bit] NULL,
	[ID_AllQuotes] [bigint] NULL,
	[DateAdded] [datetime] NULL,
	[RVW_Stock] [bit] NULL,
	[RVW_Prod] [bit] NULL,
	[Review_Date] [smalldatetime] NULL,
	[Review] [bit] NULL,
	[BAD_itemSale] [money] NULL,
	[Heat] [char](50) NULL,
	[QShipped] [int] NULL,
	[QBackOrder] [int] NULL,
	[PT_P] [money] NULL,
	[PT_PU] [tinyint] NULL,
	[PT_CutsP] [money] NULL,
	[PT_OtherP] [money] NULL,
	[PT_Total] [money] NULL,
	[StkPaid] [decimal](9, 2) NULL,
	[Selected_QTY] [int] NULL,
	[Shipped_QTY] [int] NULL,
	[converpo] [char](1) NULL,
	[converter] [char](1) NULL,
	[conversion] [char](1) NULL,
	[converfrt] [tinyint] NULL,
	[conversent] [date] NULL,
	[converretu] [date] NULL,
 CONSTRAINT [PK_sales_SOitem] PRIMARY KEY CLUSTERED 
(
	[SOitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AllQuotes]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AllQuotes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AllQuotes](
	[Company] [char](30) NULL,
	[Name] [char](25) NULL,
	[Phone] [char](10) NULL,
	[Phone_Ext] [char](6) NULL,
	[Fax] [char](10) NULL,
	[Email] [varchar](60) NULL,
	[PO_num] [varchar](20) NULL,
	[Alloy] [char](12) NULL,
	[Form] [char](2) NULL,
	[CC] [char](1) NULL,
	[CL] [char](1) NULL,
	[Pieces] [int] NULL,
	[Thck] [float] NULL,
	[Sz2] [float] NULL,
	[Sz3] [float] NULL,
	[Weight] [float] NULL,
	[Descript] [varchar](50) NULL,
	[p_lb] [float] NULL,
	[p_pc] [float] NULL,
	[p_ft] [float] NULL,
	[Cuts] [float] NULL,
	[OtherFld] [char](10) NULL,
	[OtherP] [float] NULL,
	[LotP] [float] NULL,
	[LotCost] [float] NULL,
	[LeadTime] [varchar](15) NULL,
	[cWeight] [float] NULL,
	[cP_lb] [float] NULL,
	[cP_pc] [float] NULL,
	[cP_pcc] [float] NULL,
	[cthk] [char](10) NULL,
	[cLotP] [float] NULL,
	[cLotcP] [float] NULL,
	[cCut] [float] NULL,
	[cCutM] [float] NULL,
	[cKerfD] [decimal](10, 2) NULL,
	[InqDate] [datetime] NOT NULL,
	[InqNum] [int] NOT NULL,
	[InqNumP] [char](9) NOT NULL,
	[SalesP] [char](1) NOT NULL,
	[SalesNum] [int] NULL,
	[SOitem] [char](10) NULL,
	[item] [tinyint] NULL,
	[HPApo] [int] NULL,
	[POitem] [char](12) NULL,
	[SaleDate] [datetime] NULL,
	[ShipDate] [datetime] NULL,
	[Buyfrom] [varchar](15) NULL,
	[BuyCost] [float] NULL,
	[BuyFrom2] [varchar](15) NULL,
	[HPApo2] [int] NULL,
	[open_] [bit] NOT NULL,
	[Bracket] [tinyint] NULL,
	[CustID] [char](20) NULL,
	[QuoteMemo] [varchar](max) NULL,
	[Comments] [varchar](max) NULL,
	[CountryC] [varchar](10) NULL,
	[Country] [varchar](20) NULL,
	[Services] [bit] NULL,
	[RandLen] [bit] NULL,
	[Metric] [bit] NULL,
	[StartStock] [bit] NULL,
	[TN] [bit] NULL,
	[sz1orig] [varchar](20) NULL,
	[sz2orig] [varchar](20) NULL,
	[sz3orig] [varchar](20) NULL,
	[QuoteDate] [datetime] NULL,
	[Cover] [char](1) NULL,
	[Cut] [char](4) NULL,
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Line1] [char](60) NULL,
	[WO] [int] NULL,
	[CutOptions] [varchar](75) NULL,
	[Surcharge] [money] NULL,
	[Regret] [bit] NULL,
	[NoNoiseName] [char](30) NULL,
	[CutHr] [smallint] NULL,
	[Q_P] [money] NULL,
	[Q_QTY] [money] NULL,
	[Q_PU] [tinyint] NULL,
	[Q_Total] [money] NULL,
	[S_QTY] [money] NULL,
	[S_P] [money] NULL,
	[S_PU] [tinyint] NULL,
	[S_Total] [money] NULL,
	[StandardSize] [decimal](9, 3) NULL,
	[CustDisc] [decimal](3, 2) NULL,
	[DescriptID]  AS ((((isnull([Alloy],'            ')+isnull([Form],'  '))+isnull([CC],' '))+isnull([CL],' '))+CONVERT([varchar](12),CONVERT([decimal](9,3),[StandardSize]))) PERSISTED,
 CONSTRAINT [PK_allquotes] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_InqNumP] UNIQUE NONCLUSTERED 
(
	[InqNumP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ShipAddr]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShipAddr]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ShipAddr](
	[shipcode] [decimal](10, 0) NOT NULL,
	[company] [varchar](100) NULL,
	[addr1] [varchar](100) NULL,
	[addr2] [varchar](100) NULL,
	[city] [varchar](100) NULL,
	[st] [varchar](50) NULL,
	[zip] [varchar](50) NULL,
	[country] [varchar](50) NULL,
	[contact] [varchar](101) NULL,
	[telephone] [varchar](50) NULL,
	[fax_number] [char](12) NULL,
	[email] [varchar](60) NULL,
	[customer] [char](20) NULL,
	[lastedit] [datetime] NULL,
	[shippay] [char](12) NULL,
	[paytype] [char](10) NULL,
	[shiproute] [varchar](50) NULL,
	[instrct] [varchar](100) NULL,
	[inactive] [bit] NULL,
	[blind] [bit] NULL,
	[NoNoiseName] [varchar](100) NULL,
	[WhoAdd] [varchar](255) NULL,
	[WhenAdd] [datetime] NULL,
 CONSTRAINT [PK_shipaddr] PRIMARY KEY NONCLUSTERED 
(
	[shipcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Index [IX_ShipAddr_SHIPCODE]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ShipAddr]') AND name = N'IX_ShipAddr_SHIPCODE')
CREATE CLUSTERED INDEX [IX_ShipAddr_SHIPCODE] ON [dbo].[ShipAddr]
(
	[shipcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Forms]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Forms]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Forms](
	[FormNumber] [char](2) NOT NULL,
	[FormDescription] [char](11) NOT NULL,
	[Thickness_Min] [numeric](9, 4) NOT NULL,
	[Thickness_Max] [numeric](9, 4) NOT NULL,
	[txt1] [char](10) NOT NULL,
	[txt2] [char](10) NOT NULL,
	[txt3] [char](10) NOT NULL,
	[txt4] [char](10) NOT NULL,
	[Cap2] [char](10) NOT NULL,
	[Cap3] [char](10) NOT NULL,
	[lblSz2Vis] [bit] NOT NULL,
	[useDim2] [bit] NOT NULL,
	[lblSz3Vis] [bit] NOT NULL,
	[use3rdDim] [bit] NOT NULL,
	[Sz3Enable] [bit] NOT NULL,
	[lblSz4Vis] [bit] NOT NULL,
	[Price] [char](2) NOT NULL,
	[PU] [tinyint] NOT NULL,
	[Unit] [char](4) NOT NULL,
	[LBSonSZ2] [bit] NOT NULL,
	[LBSonSZ3] [bit] NOT NULL,
	[FormSort] [tinyint] NOT NULL,
	[StockBySZ2] [bit] NOT NULL,
	[SigDim] [tinyint] NOT NULL,
	[Branch] [char](1) NOT NULL,
	[Shape] [char](8) NOT NULL,
	[Tol] [bit] NOT NULL,
 CONSTRAINT [PK_Forms] PRIMARY KEY CLUSTERED 
(
	[FormNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Sales_No]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sales_No]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sales_No](
	[salesnum] [int] NOT NULL,
	[salesrep] [char](20) NULL,
	[instrct] [char](100) NULL,
	[itemtot] [decimal](2, 0) NULL,
	[psoldaddr] [decimal](10, 0) NULL,
	[pshipaddr] [decimal](10, 0) NULL,
	[shiproute] [char](20) NULL,
	[shippay] [char](12) NULL,
	[paytype] [char](10) NULL,
	[CustID] [char](20) NULL,
	[paper_po] [bit] NOT NULL,
	[cncld] [bit] NULL,
	[cmplt] [bit] NULL,
	[blind] [bit] NOT NULL,
	[faxconf] [bit] NOT NULL,
	[emailconf] [bit] NOT NULL,
	[freightest] [decimal](9, 2) NOT NULL,
	[EverPrint] [bit] NOT NULL,
	[printedso] [bit] NOT NULL,
	[emailedps] [bit] NOT NULL,
	[faxedps] [bit] NOT NULL,
	[addr_ref] [char](40) NULL,
	[trt_lumber] [bit] NOT NULL,
	[tarfbill] [char](10) NULL,
	[usa] [bit] NOT NULL,
	[ECPC] [bit] NOT NULL,
	[amendment] [decimal](2, 0) NOT NULL,
	[ShopRecv] [bit] NOT NULL,
	[Changing] [bit] NOT NULL,
	[webnum] [bigint] NULL,
	[DPAS] [bit] NOT NULL,
	[FCI] [bit] NOT NULL,
	[GOV] [bit] NOT NULL,
	[BillInstrct] [varchar](255) NULL,
	[CreateDate] [smalldatetime] NULL,
	[CreateUser] [varchar](255) NULL,
 CONSTRAINT [PK_sales_no] PRIMARY KEY NONCLUSTERED 
(
	[salesnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Index [IX_Sales_No_SALENUM]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales_No]') AND name = N'IX_Sales_No_SALENUM')
CREATE CLUSTERED INDEX [IX_Sales_No_SALENUM] ON [dbo].[Sales_No]
(
	[salesnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[ConditionLevel]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConditionLevel]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ConditionLevel](
	[CC] [char](1) NOT NULL,
	[CL] [char](1) NOT NULL,
	[CCCL] [char](2) NOT NULL,
	[text] [char](15) NOT NULL,
	[isPriceTable] [bit] NOT NULL,
	[Adjust] [smallmoney] NOT NULL,
	[Adjust_Code] [char](1) NOT NULL,
	[Common_Code] [char](2) NULL,
	[MinUTS] [int] NULL,
	[MaxUTS] [int] NULL,
	[MinYLD] [int] NULL,
	[MaxYld] [int] NULL,
	[MinEl] [tinyint] NULL,
	[MaxEl] [tinyint] NULL,
	[MinRA] [tinyint] NULL,
	[MaxRA] [tinyint] NULL,
	[Cmax] [char](3) NULL,
	[Spec] [varchar](50) NULL,
	[MinDia] [decimal](9, 3) NULL,
	[MaxDia] [decimal](9, 3) NULL,
	[HPA_Spec] [varchar](30) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ConditionLevel]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ConditionLevel]') AND name = N'IX_ConditionLevel')
CREATE UNIQUE CLUSTERED INDEX [IX_ConditionLevel] ON [dbo].[ConditionLevel]
(
	[CC] ASC,
	[CL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[StockLst_Process]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Process]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StockLst_Process](
	[SOitem] [char](10) NULL,
	[PO_item] [char](12) NULL,
	[SalesPerson] [char](20) NULL,
	[StartDate] [datetime] NOT NULL,
	[DueDate] [datetime] NULL,
	[Comment] [varchar](100) NOT NULL,
	[Process_ID] [char](10) NOT NULL,
	[Processor] [char](20) NULL,
	[AllowSub] [char](1) NULL,
	[PWeight] [numeric](18, 4) NULL,
	[PPc] [int] NULL,
	[PFT] [float] NULL,
	[PU] [tinyint] NULL,
	[QTY] [money] NULL,
	[Ordered_QTY] [money] NULL,
	[Ordered_P] [money] NULL,
	[Pounds] [decimal](9, 1) NULL,
	[ID_Detail] [int] NOT NULL,
	[ID_Detail_Process] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ReceivingID] [int] NOT NULL,
	[WO] [int] NULL,
	[WO_Detail] [int] NULL,
	[InqNumP] [char](9) NULL,
	[QTY_Due] [money] NULL,
	[Prc_QTY] [money] NULL,
	[Prc_Form] [char](2) NULL,
	[Prc_PCs] [int] NULL,
	[Prc_Dim1] [numeric](10, 4) NULL,
	[Prc_Dim2] [money] NULL,
	[Prc_Dim3] [money] NULL,
	[Prc_Q_QTY] [money] NULL,
	[Prc_Q_PU] [tinyint] NULL,
	[FoundStk] [smalldatetime] NULL,
 CONSTRAINT [PK_stockLst_process] PRIMARY KEY CLUSTERED 
(
	[ID_Detail_Process] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OT]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OT]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OT](
	[TrackID] [int] IDENTITY(1,1) NOT NULL,
	[OrderNumber] [varchar](15) NOT NULL,
	[JobID] [int] NOT NULL,
	[OrderTypeID] [int] NOT NULL,
	[OType_Num]  AS ([dbo].[f_rtr_OType_Num_OrderTypeID]([OrderTypeID],[OrderNumber])),
	[RouterId] [bigint] NULL,
	[DetailId] [int] NULL,
 CONSTRAINT [PK_OT] PRIMARY KEY CLUSTERED 
(
	[TrackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OT_OrderType]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OT_OrderType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OT_OrderType](
	[OrderTypeId] [int]  NOT NULL,
	[TypeName] [varchar](50) NOT NULL,
	[TypeAbr] [varchar](4) NOT NULL,
	[Type] [varchar](20) NOT NULL,
	[Proper] [varchar](100) NULL,
	[Notes] [varchar](max) NULL,
 CONSTRAINT [PK_OT_OrderType2] PRIMARY KEY CLUSTERED 
(
	[OrderTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OT_Job]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OT_Job]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OT_Job](
	[JobId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[ClassId] [int] NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[Sched_Type] [tinyint] NULL,
	[IsMachine] [bit] NOT NULL,
	[Oper_ID] [int] NULL,
 CONSTRAINT [PK_OT_Job] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OT_Times_Status]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OT_Times_Status]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OT_Times_Status](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](15) NOT NULL,
 CONSTRAINT [PK_OT_Times_Status] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OT_Times]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OT_Times]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OT_Times](
	[TimeId] [int] IDENTITY(1,1) NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[Start_StatusId] [int] NOT NULL,
	[StopTime] [datetime] NULL,
	[Stop_StatusId] [int] NULL,
	[TrackId] [int] NOT NULL,
 CONSTRAINT [PK_OT_Times] PRIMARY KEY CLUSTERED 
(
	[TimeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PackingSlip]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PackingSlip]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PackingSlip](
	[Packingsli] [int] NOT NULL,
	[PCs] [decimal](10, 0) NULL,
	[Descript] [varchar](80) NULL,
	[SOitem] [char](10) NULL,
	[PackedWeight] [decimal](6, 1) NULL,
	[PO_Num] [char](20) NULL,
	[Heat] [varchar](50) NULL,
	[Lot] [char](10) NULL,
	[Weight] [decimal](7, 1) NULL,
	[Kg] [bit] NULL,
	[Alloy] [char](12) NULL,
	[PartNo] [varchar](100) NULL,
	[Id] [int] NULL,
	[Peach] [bit] NULL,
	[Cancld] [bit] NULL,
	[SOitem_cmplt] [bit] NULL,
	[Reconciled] [bit] NULL,
	[Sales_Detail_ID] [int] NULL,
	[ID_PackingSlip] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[WhenAdd] [datetime] NULL,
	[First_RSO] [smalldatetime] NULL,
	[PT_QTY] [money] NULL,
	[PT_P] [money] NULL,
	[SO_QTY] [money] NULL,
	[PickedUp] [bit] NOT NULL,
 CONSTRAINT [PK_packingslip] PRIMARY KEY NONCLUSTERED 
(
	[ID_PackingSlip] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Index [IX_packingslip]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PackingSlip]') AND name = N'IX_packingslip')
CREATE CLUSTERED INDEX [IX_packingslip] ON [dbo].[PackingSlip]
(
	[Packingsli] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PackingSlip_No]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PackingSlip_No]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PackingSlip_No](
	[packingsli] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ps_date] [datetime] NULL,
	[shipcode] [int] NULL,
	[soldcode] [int] NULL,
	[bill3code] [int] NULL,
	[packedby] [char](10) NULL,
	[checkedby] [char](10) NULL,
	[carton] [char](10) NULL,
	[totalweight] [char](10) NULL,
	[Kg] [bit] NULL,
	[shippedvia] [char](20) NULL,
	[ShipFrom] [varchar](20) NULL,
	[all_po] [nvarchar](max) NULL,
	[all_so] [nvarchar](max) NULL,
	[tracking] [varchar](50) NULL,
	[freightcharge] [decimal](1, 0) NULL,
	[dutytax] [decimal](1, 0) NULL,
	[cod] [bit] NULL,
	[codcheck] [decimal](1, 0) NULL,
	[codfreightfee] [decimal](1, 0) NULL,
	[box_size] [char](60) NULL,
	[packedweight] [int] NULL,
	[RSO_Date] [datetime] NULL,
	[PickUpDate] [date] NULL,
	[PickedUp] [bit] NULL,
	[PW_ready] [bit] NULL,
	[PW_verified] [bit] NULL,
	[WHO] [varchar](255) NULL,
 CONSTRAINT [PK_packingslip_no] PRIMARY KEY CLUSTERED 
(
	[packingsli] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SO_ProcessNotes]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SO_ProcessNotes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SO_ProcessNotes](
	[SOitem] [char](10) NOT NULL,
	[Notes] [varchar](max) NOT NULL,
	[WhoAdd] [varchar](255) NOT NULL,
	[WhenAdd] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_SO_ProcessNotes] PRIMARY KEY CLUSTERED 
(
	[SOitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO

/****** Object:  Table [dbo].[TC_Replacement_Employees]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TC_Replacement_Employees]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TC_Replacement_Employees](
	[EmployeeId] [bigint] NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Pin] [nvarchar](8) NULL,
	[Position] [nvarchar](50) NULL,
	[DateLeft] [datetime] NULL,
	[IsSuspended] [bit] NULL,
	[No_PayCor] [bit] NOT NULL,
	[Status] [smallint] NOT NULL,
	[LastModified] [timestamp] NOT NULL,
 CONSTRAINT [PK_TC_Replacement_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[BrokerLst_Detail]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Detail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BrokerLst_Detail](
	[Size_H] [decimal](9, 4) NULL,
	[Size_L] [decimal](9, 4) NULL,
	[PC] [int] NULL,
	[Dim1] [decimal](18, 4) NOT NULL,
	[Dim2] [decimal](18, 4) NULL,
	[Dim3] [decimal](18, 4) NULL,
	[Length] [char](160) NULL,
	[Weight] [decimal](18, 4) NOT NULL,
	[CostValue] [money] NULL,
	[Descript] [char](20) NULL,
	[Location] [char](10) NULL,
	[FloorStatus] [char](1) NULL,
	[Class] [char](1) NULL,
	[Unit] [char](6) NULL,
	[RandLen] [bit] NOT NULL,
	[InvCheck] [datetime] NULL,
	[ID] [int] NOT NULL,
	[ID_Detail] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ReceivingID] [int] NULL,
	[LiveCheck] [bit] NULL,
	[AccountingCheck] [bit] NULL,
	[InvoiceValue] [money] NOT NULL,
	[Quarantine] [bit] NOT NULL,
	[S_QTY] [money] NULL,
	[S_P] [money] NULL,
	[S_Total] [money] NULL,
	[S_PU] [tinyint] NULL,
	[Prime] [bit] NULL,
	[WO] [int] NULL,
 CONSTRAINT [PK_BrokerLst_detail] PRIMARY KEY CLUSTERED 
(
	[ID_Detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ConditionCode]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConditionCode]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ConditionCode](
	[CC] [char](1) NOT NULL,
	[text] [char](13) NOT NULL,
	[CCSortValue] [tinyint] NOT NULL,
	[CCSortDefault] [bit] NOT NULL,
	[CCSort] [char](1) NOT NULL,
	[inActive] [bit] NOT NULL,
	[useText] [bit] NOT NULL,
	[newCCCL] [char](2) NOT NULL,
	[C2] [char](1) NOT NULL,
	[HPA_MFG] [bit] NOT NULL,
 CONSTRAINT [PK_ConditionCode] PRIMARY KEY CLUSTERED 
(
	[CC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[BrokerLst_Master]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Master]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BrokerLst_Master](
	[Alloy] [char](12) NOT NULL,
	[Form] [char](2) NOT NULL,
	[CC] [char](1) NULL,
	[CL] [char](1) NULL,
	[Size] [decimal](9, 3) NOT NULL,
	[Cond] [varchar](50) NULL,
	[MWeight] [decimal](18, 8) NULL,
	[Specs] [varchar](160) NULL,
	[Heat] [varchar](50) NOT NULL,
	[Lot] [char](10) NULL,
	[Paid] [money] NULL,
	[PO_item] [char](12) NULL,
	[PoDueDate] [smalldatetime] NULL,
	[Mill] [char](10) NULL,
	[StkDate] [smalldatetime] NULL,
	[History] [char](20) NULL,
	[Num] [decimal](8, 0) NULL,
	[POStatus] [char](1) NULL,
	[BrandName] [char](20) NULL,
	[FROM_ID] [int] NULL,
	[Melt] [varchar](7) NULL,
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[mS_QTY] [money] NULL,
	[WO_Detail] [int] NULL,
	[ProjID] [int] NULL,
	[MillTrace] [bit] NULL,
	[DescriptID]  AS ((((isnull([Alloy],'            ')+isnull([Form],'  '))+isnull([CC],' '))+isnull([CL],' '))+str(round([Size],(9),(3)),(9),(3))) PERSISTED,
 CONSTRAINT [PK_BrokerLst_master] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[BrokerLst_Process]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Process]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BrokerLst_Process](
	[SOitem] [char](10) NULL,
	[PO_item] [char](12) NULL,
	[SalesPerson] [char](20) NULL,
	[StartDate] [datetime] NOT NULL,
	[DueDate] [datetime] NULL,
	[Comment] [varchar](100) NOT NULL,
	[Process_ID] [char](10) NOT NULL,
	[Processor] [char](20) NULL,
	[AllowSub] [char](1) NULL,
	[PWeight] [numeric](18, 4) NULL,
	[PPc] [int] NULL,
	[PFT] [float] NULL,
	[PU] [tinyint] NULL,
	[QTY] [money] NULL,
	[Ordered_QTY] [money] NULL,
	[Ordered_P] [money] NULL,
	[Pounds] [decimal](9, 1) NULL,
	[ID_Detail] [int] NOT NULL,
	[ID_Detail_Process] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ReceivingID] [int] NOT NULL,
	[WO] [int] NULL,
	[WO_Detail] [int] NULL,
	[InqNumP] [char](9) NULL,
	[QTY_Due] [money] NULL,
	[Prc_QTY] [money] NULL,
	[Prc_Form] [char](2) NULL,
	[Prc_PCs] [int] NULL,
	[Prc_Dim1] [numeric](10, 4) NULL,
	[Prc_Dim2] [money] NULL,
	[Prc_Dim3] [money] NULL,
	[Prc_Q_QTY] [money] NULL,
	[Prc_Q_PU] [tinyint] NULL,
	[FoundSTK] [smalldatetime] NULL,
 CONSTRAINT [PK_BrokerLst_process_1] PRIMARY KEY NONCLUSTERED 
(
	[ID_Detail_Process] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Index [PK_BrokerLst_process]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Process]') AND name = N'PK_BrokerLst_process')
CREATE UNIQUE CLUSTERED INDEX [PK_BrokerLst_process] ON [dbo].[BrokerLst_Process]
(
	[ID_Detail_Process] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[OT_Times_Employees]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OT_Times_Employees]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OT_Times_Employees](
	[EmployeeTimeId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[TimeId] [int] NOT NULL,
	[TrackId] [int] NOT NULL,
	[EmployeeIdTxt] [varchar](100) NULL,
 CONSTRAINT [PK_OT_Times_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeTimeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Object:  Table [dbo].[VendorConflictMineralsFree]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VendorConflictMineralsFree]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[VendorConflictMineralsFree](
	[VendCode] [int] NOT NULL,
	[HasSpecialMats] [bit] NULL,
	[FromBadPlace] [bit] NULL,
	[RecycledSource] [bit] NULL,
	[SignedName] [nvarchar](75) NULL,
	[SignedTitle] [nvarchar](75) NULL,
	[SignedDate] [datetime] NULL,
	[SignedEmail] [nvarchar](75) NULL,
	[CertifyInfo] [bit] NULL,
	[Approved] [bit] NULL,
	[ApprovedDate] [datetime] NULL,
	[RequestSentAttempt1] [datetime] NULL,
	[RequestSentAttempt2] [datetime] NULL,
 CONSTRAINT [PK_VendorDRCConflictFree] PRIMARY KEY CLUSTERED 
(
	[VendCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[VendorQualitySurvey]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VendorQualitySurvey]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[VendorQualitySurvey](
	[VendCode] [int] NOT NULL,
	[ProductServices] [nvarchar](150) NULL,
	[RegisteredISO9001] [bit] NULL,
	[ISOExpDate] [datetime] NULL,
	[RegisteredAS9100] [bit] NULL,
	[ASExpDate] [datetime] NULL,
	[RegisteredNADCAP] [bit] NULL,
	[NADCAPExpDate] [datetime] NULL,
	[RegisteredOther] [bit] NULL,
	[OtherExpDate] [datetime] NULL,
	[Registered] [bit] NULL,
	[RegisteredPlans] [bit] NULL,
	[RegisteredPlansDate] [nvarchar](100) NULL,
	[CustomerApprovals] [nchar](300) NULL,
	[QManual] [bit] NULL,
	[QManualCopy] [bit] NULL,
	[QPolicy] [bit] NULL,
	[QA3] [smallint] NULL,
	[QA4] [smallint] NULL,
	[QB1] [smallint] NULL,
	[QB2] [smallint] NULL,
	[QC1] [smallint] NULL,
	[QC2] [smallint] NULL,
	[QD1] [smallint] NULL,
	[QD2] [smallint] NULL,
	[QD3] [smallint] NULL,
	[QD4] [smallint] NULL,
	[QD5] [smallint] NULL,
	[QD6] [smallint] NULL,
	[QD7] [smallint] NULL,
	[QD8] [smallint] NULL,
	[QD9] [smallint] NULL,
	[QD10] [smallint] NULL,
	[QD11] [smallint] NULL,
	[QD12] [smallint] NULL,
	[QE1] [smallint] NULL,
	[QE2] [smallint] NULL,
	[QE3] [smallint] NULL,
	[QE4] [smallint] NULL,
	[Comments] [nvarchar](300) NULL,
	[SignedName] [nvarchar](75) NULL,
	[SignedTitle] [nvarchar](75) NULL,
	[SignedDate] [datetime] NULL,
	[SignedEmail] [nvarchar](75) NULL,
	[CertifyInfo] [bit] NOT NULL,
	[lastUsedDate] [datetime] NOT NULL,
	[Approved] [bit] NULL,
	[ApprovedDate] [datetime] NULL,
 CONSTRAINT [PK_VendorQualitySurvey] PRIMARY KEY CLUSTERED 
(
	[VendCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PurchaseOrder]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseOrder]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PurchaseOrder](
	[POitem] [char](12) NOT NULL,
	[HPApo] [int] NOT NULL,
	[ItemPO] [decimal](2, 0) NOT NULL,
	[SOitem] [char](10) NULL,
	[SalesNum] [int] NULL,
	[Item] [decimal](2, 0) NULL,
	[SalesP] [char](1) NULL,
	[Company] [varchar](30) NULL,
	[Alloy] [char](12) NULL,
	[Form] [char](2) NULL,
	[CC] [char](1) NULL,
	[CL] [char](1) NULL,
	[Order_QTY] [decimal](11, 3) NULL,
	[Pieces] [decimal](6, 0) NULL,
	[Thck] [decimal](10, 4) NULL,
	[Sz2] [decimal](10, 3) NULL,
	[Sz3] [decimal](10, 3) NULL,
	[p_lb] [decimal](10, 2) NULL,
	[p_pc] [decimal](10, 2) NULL,
	[p_ft] [decimal](10, 2) NULL,
	[lotp] [decimal](10, 2) NULL,
	[OtherP] [decimal](10, 2) NULL,
	[OtherFld] [varchar](10) NULL,
	[OrderDate] [datetime] NULL,
	[Due_Min] [datetime] NULL,
	[Due_Max] [datetime] NULL,
	[Received] [datetime] NULL,
	[Cond_Spec] [varchar](max) NULL,
	[Misc_Purch] [varchar](max) NULL,
	[Heat] [varchar](50) NULL,
	[Cert] [bit] NOT NULL,
	[ReceivedBy] [varchar](10) NULL,
	[Receipt] [varchar](max) NULL,
	[Delivered] [bit] NOT NULL,
	[Cmplt] [bit] NOT NULL,
	[Cancelled] [bit] NOT NULL,
	[POSalesP] [varchar](20) NULL,
	[ShipVia] [varchar](20) NULL,
	[JobNumber] [varchar](20) NULL,
	[Services] [bit] NOT NULL,
	[ConvServ] [bit] NULL,
	[Equipment] [bit] NULL,
	[Stock] [varchar](13) NULL,
	[Sheet_pk] [bit] NOT NULL,
	[ShipWhere] [decimal](1, 0) NULL,
	[POshipaddr] [int] NULL,
	[POpayaddr] [int] NULL,
	[Randlen] [bit] NOT NULL,
	[OddCut] [bit] NOT NULL,
	[Metric] [bit] NOT NULL,
	[Sz1Orig] [varchar](20) NULL,
	[Sz2Orig] [varchar](20) NULL,
	[Sz3Orig] [varchar](20) NULL,
	[DispAlloy] [char](20) NULL,
	[StandSize] [decimal](10, 4) NULL,
	[Amendment] [decimal](2, 0) NOT NULL,
	[Printed] [bit] NOT NULL,
	[VendCode] [int] NOT NULL,
	[ContactID] [int] NOT NULL,
	[Terms] [varchar](50) NULL,
	[FOB] [varchar](50) NULL,
	[HPA_Due_Min] [datetime] NULL,
	[HPA_Due_Max] [datetime] NULL,
	[First_Due_Max] [datetime] NULL,
	[Reconciled] [bit] NOT NULL,
	[ReconcileTotal] [money] NOT NULL,
	[StockLst_PU] [tinyint] NULL,
	[StockLst_QTY] [money] NULL,
	[StockLst_P] [money] NULL,
	[StockLst_Total]  AS (isnull([StockLst_QTY]*[StockLst_P],(0))) PERSISTED NOT NULL,
	[Order_P] [money] NULL,
	[Order_PU] [tinyint] NULL,
	[Pounds] [decimal](9, 1) NULL,
	[BMScheck] [bit] NOT NULL,
	[ShipLocation] [varchar](10) NULL,
	[VendorPOConf] [bit] NOT NULL,
	[Melt] [varchar](7) NULL,
	[Cover] [char](1) NULL,
	[HPA_Lot] [char](10) NULL,
	[WO] [int] NULL,
	[WO_Detail] [int] NULL,
	[IntP] [bit] NOT NULL,
	[RcvdE] [bit] NULL,
	[DLAE] [bit] NULL,
	[TBL] [char](1) NULL,
	[ID_Detail_Process] [int] NULL,
	[DescriptID]  AS ((((isnull([Alloy],'            ')+isnull([Form],'  '))+isnull([CC],' '))+isnull([CL],' '))+str(round([Thck],(9),(3)),(9),(3))) PERSISTED,
	[Hold] [bit] NULL,
	[WhoInsert] [varchar](254) NULL,
 CONSTRAINT [PK_purchaseorders] PRIMARY KEY NONCLUSTERED 
(
	[POitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_purchaseorders_POitem] UNIQUE CLUSTERED 
(
	[POitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vendor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Vendor](
	[VendCode] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Company] [varchar](100) NOT NULL,
	[Addr1] [varchar](100) NULL,
	[Addr2] [varchar](100) NULL,
	[AddrPOB] [varchar](30) NULL,
	[City] [varchar](50) NULL,
	[ST] [varchar](50) NULL,
	[Zip] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[Website] [varchar](50) NULL,
	[vendor_type] [int] NOT NULL,
	[Vend_Notes] [varchar](max) NULL,
	[Vend_Print] [varchar](max) NULL,
	[PeachID] [varchar](20) NULL,
	[QAApproved] [smallint] NOT NULL,
	[QAApprovalNotes] [nvarchar](150) NULL,
	[QASurveyContactID] [int] NULL,
	[QASurveyDate] [datetime] NULL,
	[lastSurveySent] [datetime] NULL,
	[lastSurveySentAttempt2] [datetime] NULL,
	[QAType] [bigint] NOT NULL,
	[QATypeOther] [nvarchar](50) NULL,
	[Inactive] [bit] NOT NULL,
	[Metal] [bit] NOT NULL,
	[LastEdit] [datetime] NOT NULL,
	[DRC_Free] [bit] NULL,
	[DLA_BMS] [bit] NULL,
	[Contact] [varchar](20) NULL,
	[telephone] [char](12) NULL,
	[fax_number] [char](12) NULL,
	[email] [char](60) NULL,
	[Ind_Type] [int] NULL,
	[vend_type] [char](11) NULL,
	[custId] [char](20) NULL,
	[Vendor_ID] [char](20) NULL,
	[subsidiary of] [int] NULL,
	[ManualApprovalNotes] [text] NULL,
	[Use_Parent_Files] [bit] NULL,
	[VQS_NotRequired] [bit] NOT NULL,
 CONSTRAINT [PK_vendor] PRIMARY KEY NONCLUSTERED 
(
	[VendCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Index [IX_vendor]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Vendor]') AND name = N'IX_vendor')
CREATE UNIQUE CLUSTERED INDEX [IX_vendor] ON [dbo].[Vendor]
(
	[VendCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO


/****** Object:  UserDefinedFunction [dbo].[f_AreCertsValid]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_AreCertsValid]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		 
-- Create date: 2015 08 04
-- Description:	Checks to see if all vendor documents are valid
-- =============================================
CREATE FUNCTION [dbo].[f_AreCertsValid] 
(
	-- Add the parameters for the function here
	@vendCode int
)
RETURNS bit
AS
BEGIN
	-- Declare the return variable here
	DECLARE @expirationDate datetime
		,@filesOK bit = 1

	-- Add the T-SQL statements to compute the return value here
	declare MyCursor cursor STATIC for 
		SELECT TOP 1000 [VendorFileExpirationDate]
			FROM [dbo].[NR_VendorFile] vf
			WHERE vf.VendCode = @vendCode
	open MyCursor
	FETCH NEXT FROM MyCursor INTO @expirationDate
	
	-- Added 03/29/2017 (Brandon van de Venter) - This should set the value to 0 if the Vendor does not have any files. Files should not be considered OK if there are none, as stated by Dave Morrow. 
	if (@@FETCH_STATUS = -1) 
	BEGIN
		SET @filesOK = 0;
	END

	while @@FETCH_STATUS = 0 
	begin
		if (CONVERT(date,@expirationDate) <= CONVERT(date,GETDATE()))--step 2
		BEGIN
			SET @filesOK = 0;
			break;
		END
		FETCH NEXT FROM MyCursor INTO @expirationDate
	end
	close MyCursor
	DEALLOCATE MyCursor

	--SELECT @filesOK as ''Files OK?''
	-- Return the result of the function
	RETURN @filesOK

END
' 
END
GO

/****** Object:  UserDefinedFunction [dbo].[f_HasConflictMineralsFile]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_HasConflictMineralsFile]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		 
-- Create date: 2015 8 4
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_HasConflictMineralsFile] 
(
	-- Add the parameters for the function here
	@vendCode int
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @hasCMFile bit = 0

	-- Add the T-SQL statements to compute the return value here
	IF(@vendCode IN (
	SELECT TOP 1000 VendCode
	  FROM [dbo].[NR_VendorFile] vf
	  WHERE VendorFileCategory = ''Conflict Mineral''
	  AND vf.VendCode = @vendCode
	)
	)
	BEGIN
		SET @hasCMFile = 1
	END

	-- Return the result of the function
	RETURN @hasCMFile

END
' 
END
GO
/****** Object:  Table [dbo].[VendorContact]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VendorContact]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[VendorContact](
	[ContactID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[VendCode] [int] NOT NULL,
	[Contact] [varchar](100) NULL,
	[Phone] [varchar](50) NULL,
	[CellPhone] [varchar](20) NULL,
	[Fax] [varchar](20) NULL,
	[Email] [varchar](60) NULL,
	[Addr1] [varchar](100) NULL,
	[Addr2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[ST] [varchar](50) NULL,
	[Zip] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[Quality] [bit] NOT NULL,
	[lastSurveySent] [smalldatetime] NULL,
	[lastSurveySentAttempt2] [smalldatetime] NULL,
	[lastSurveyReceived] [smalldatetime] NULL,
	[JobTitle] [varchar](50) NULL,
	[SurveyPriority] [int] NULL,
	[Inactive] [bit] NOT NULL,
	[Branch] [varchar](30) NULL,
	[Notes] [nvarchar](300) NULL,
 CONSTRAINT [PK_VendorContact] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[v_ExpiringOrExpiredVendorFiles]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO











/****** Object:  Table [dbo].[Cert_RC_profile]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cert_RC_profile]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Cert_RC_profile](
	[Inch] [numeric](5, 3) NOT NULL,
	[RockC] [numeric](4, 1) NOT NULL,
	[CertID] [int] NOT NULL,
	[ID] [int] IDENTITY(1000,1) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  UserDefinedFunction [dbo].[TVF_CertSPX_ID]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TVF_CertSPX_ID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[TVF_CertSPX_ID] (
	@nID INT 
)
RETURNS TABLE
AS
RETURN

--SELECT * FROM dbo.TVF_CertSPX_ID(8868)

SELECT 
-- ISNULL([-3.875],0) AS N3875,ISNULL([-3.750],0) AS N3750,ISNULL([-3.625],0) AS N3625,ISNULL([-3.500],0) AS N3500
--,ISNULL([-3.375],0) AS N3375,ISNULL([-3.250],0) AS N3250,ISNULL([-3.125],0) AS N3125,ISNULL([-3.000],0) AS N3000
--,ISNULL([-2.875],0) AS N2875,ISNULL([-2.750],0) AS N2750,ISNULL([-2.625],0) AS N2625,ISNULL([-2.500],0) AS N2500
--,ISNULL([-2.375],0) AS N2375,ISNULL([-2.250],0) AS N2250,ISNULL([-2.125],0) AS N2125,ISNULL([-2.000],0) AS N2000
--,ISNULL([-1.875],0) AS N1875,ISNULL([-1.750],0) AS N1750,ISNULL([-1.625],0) AS N1625,ISNULL([-1.500],0) AS N1500
--,ISNULL([-1.375],0) AS N1375,ISNULL([-1.250],0) AS N1250,ISNULL([-1.125],0) AS N1125,ISNULL([-1.000],0) AS N1000
--,ISNULL([-0.875],0) AS N0875,ISNULL([-0.750],0) AS N0750,ISNULL([-0.625],0) AS N0625,ISNULL([-0.500],0) AS N0500
--,ISNULL([-0.375],0) AS N0375,ISNULL([-0.250],0) AS N0250,ISNULL([-0.125],0) AS N0125,
ISNULL( [0.000],0) AS P0000
,ISNULL([0.125],0) AS P0125,ISNULL([0.250],0) AS P0250,ISNULL([0.375],0) AS P0375
,ISNULL([0.500],0) AS P0500,ISNULL([0.625],0) AS P0625,ISNULL([0.750],0) AS P0750,ISNULL([0.875],0) AS P0875
,ISNULL([1.000],0) AS P1000,ISNULL([1.125],0) AS P1125,ISNULL([1.250],0) AS P1250,ISNULL([1.375],0) AS P1375
,ISNULL([1.500],0) AS P1500,ISNULL([1.625],0) AS P1625,ISNULL([1.750],0) AS P1750,ISNULL([1.875],0) AS P1875
,ISNULL([2.000],0) AS P2000,ISNULL([2.125],0) AS P2125,ISNULL([2.250],0) AS P2250,ISNULL([2.375],0) AS P2375
,ISNULL([2.500],0) AS P2500,ISNULL([2.625],0) AS P2625,ISNULL([2.750],0) AS P2750,ISNULL([2.875],0) AS P2875
,ISNULL([3.000],0) AS P3000,ISNULL([3.125],0) AS P3125,ISNULL([3.250],0) AS P3250,ISNULL([3.375],0) AS P3375
,ISNULL([3.500],0) AS P3500,ISNULL([3.625],0) AS P3625,ISNULL([3.750],0) AS P3750,ISNULL([3.875],0) AS P3875

FROM 
( SELECT Inch,RockC 
	FROM dbo.Cert_RC_profile WHERE CertID= @nID) AS p 
 PIVOT 
(MAX(RockC) FOR Inch IN 
(
-- [-3.875],[-3.750],[-3.625],[-3.500],[-3.375],[-3.250],[-3.125],[-3.000]
--,[-2.875],[-2.750],[-2.625],[-2.500],[-2.375],[-2.250],[-2.125],[-2.000]
--,[-1.875],[-1.750],[-1.625],[-1.500],[-1.375],[-1.250],[-1.125],[-1.000]
--,[-0.875],[-0.750],[-0.625],[-0.500],[-0.375],[-0.250],[-0.125]
--,
[0.000],[0.125],[0.250],[0.375],[0.500],[0.625],[0.750],[0.875]
,[1.000],[1.125],[1.250],[1.375],[1.500],[1.625],[1.750],[1.875]
,[2.000],[2.125],[2.250],[2.375],[2.500],[2.625],[2.750],[2.875]
,[3.000],[3.125],[3.250],[3.375],[3.500],[3.625],[3.750],[3.875]
)
) AS pvt; 


' 
END
GO
/****** Object:  Table [dbo].[ForecastStock]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ForecastStock]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ForecastStock](
	[Customer] [varchar](50) NULL,
	[Alloy] [char](12) NULL,
	[CC] [char](1) NULL,
	[CL] [char](1) NULL,
	[Dia] [numeric](9, 4) NULL,
	[Inches] [int] NULL,
	[Pounds] [int] NULL,
	[Period] [char](10) NULL,
	[MinPounds] [int] NULL,
	[UT] [bit] NULL,
	[Sdate] [date] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ForecastStock]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ForecastStock]') AND name = N'IX_ForecastStock')
CREATE UNIQUE CLUSTERED INDEX [IX_ForecastStock] ON [dbo].[ForecastStock]
(
	[Customer] ASC,
	[Alloy] ASC,
	[CC] ASC,
	[CL] ASC,
	[Dia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RMA_Detail]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RMA_Detail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RMA_Detail](
	[rma_no] [int] NOT NULL,
	[so_item] [char](10) NULL,
	[returned] [datetime] NULL,
	[itemsale] [money] NULL,
	[refunded] [money] NULL,
	[reason] [varchar](max) NULL,
	[inspect] [varchar](max) NULL,
	[CncSO_item] [bit] NULL,
	[cancelled] [bit] NULL,
	[RMA_Detail_ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Packingsli] [int] NULL,
	[SalesP] [char](1) NULL,
	[SP_fault] [tinyint] NULL,
	[ReceivingID] [int] NULL,
	[RMA_E] [bit] NULL,
	[ReturnTo] [char](1) NULL,
	[Descrip] [varchar](140) NULL,
	[RMA_QTY] [numeric](8, 1) NULL,
 CONSTRAINT [PK_rma_detail] PRIMARY KEY CLUSTERED 
(
	[RMA_Detail_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[GFM_Die_Repair]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GFM_Die_Repair]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GFM_Die_Repair](
	[RepairID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[RepairDate] [datetime] NOT NULL,
	[DieID] [uniqueidentifier] NOT NULL,
	[DieHeight] [decimal](5, 3) NOT NULL,
	[PreGrindTime] [int] NOT NULL,
	[WeldTime] [int] NOT NULL,
	[FinishGrindTime] [int] NOT NULL,
	[TotalTime] [int] NOT NULL,
	[EstWeldRodWeight] [float] NULL,
	[Welder] [varchar](50) NOT NULL,
	[When] [datetime] NOT NULL,
	[Who] [varchar](50) NOT NULL,
	[SO] [char](10) NULL,
	[Notes] [text] NOT NULL,
	[ChangeLog] [text] NULL,
 CONSTRAINT [PK_GFM_Die_Repair] PRIMARY KEY CLUSTERED 
(
	[RepairID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[GFM_Die_Inventory]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GFM_Die_Inventory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GFM_Die_Inventory](
	[DieID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Die Set] [varchar](20) NOT NULL,
	[GFM] [varchar](1) NOT NULL,
	[Who] [varchar](50) NOT NULL,
	[When] [datetime] NOT NULL,
	[DieAlloy] [char](12) NOT NULL,
	[DieStamp] [varchar](20) NOT NULL,
	[RangeMin] [float] NOT NULL,
	[RangeMax] [float] NOT NULL,
	[Condition] [tinyint] NOT NULL,
	[Inactive] [bit] NOT NULL,
	[LastInspection] [datetime] NULL,
	[ChangeLog] [text] NULL,
	[Hot] [bit] NULL,
	[Cold] [bit] NULL,
	[LandingSize] [decimal](5, 3) NULL,
	[OriginalPurchaseOrder] [char](12) NULL,
	[DieHeight] [decimal](5, 3) NULL,
 CONSTRAINT [PK_GFM_Die_Inventory] PRIMARY KEY CLUSTERED 
(
	[DieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PriceTable]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PriceTable]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PriceTable](
	[pt_id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Alloy] [char](12) NOT NULL,
	[Form] [char](2) NOT NULL,
	[CC] [char](1) NULL,
	[CL] [char](1) NULL,
	[Thk] [char](5) NOT NULL,
	[Size] [numeric](8, 3) NOT NULL,
	[Size2] [numeric](8, 3) NOT NULL,
	[Size3] [numeric](8, 3) NOT NULL,
	[w0] [numeric](7, 2) NOT NULL,
	[w5] [numeric](7, 2) NOT NULL,
	[w10] [numeric](7, 2) NOT NULL,
	[w25] [numeric](7, 2) NOT NULL,
	[w50] [numeric](7, 2) NOT NULL,
	[w100] [numeric](7, 2) NOT NULL,
	[w200] [numeric](7, 2) NOT NULL,
	[w500] [numeric](7, 2) NOT NULL,
	[w1000] [numeric](7, 2) NOT NULL,
	[w2000] [numeric](7, 2) NOT NULL,
	[wBASE] [numeric](7, 2) NOT NULL,
	[activepric] [bit] NULL,
	[lastedit] [smalldatetime] NULL,
	[username] [char](20) NULL,
	[zalloy] [char](19) NULL,
	[costCurr] [money] NULL,
	[h0] [decimal](9, 6) NULL,
	[h5] [decimal](9, 6) NULL,
	[h10] [decimal](9, 6) NULL,
	[h25] [decimal](9, 6) NULL,
	[h50] [decimal](9, 6) NULL,
	[h100] [decimal](9, 6) NULL,
	[h200] [decimal](9, 6) NULL,
	[h500] [decimal](9, 6) NULL,
	[h1000] [decimal](9, 6) NULL,
	[h2000] [decimal](9, 6) NULL,
	[hbase] [decimal](9, 6) NULL,
	[hist] [datetime] NULL,
	[commspec] [char](20) NULL,
	
 CONSTRAINT [PK_PriceTable] PRIMARY KEY NONCLUSTERED 
(
	[pt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PriceTable-AFCLTSS]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PriceTable]') AND name = N'IX_PriceTable-AFCLTSS')
CREATE UNIQUE CLUSTERED INDEX [IX_PriceTable-AFCLTSS] ON [dbo].[PriceTable]
(
	[Alloy] ASC,
	[Form] ASC,
	[CC] ASC,
	[CL] ASC,
	[Size] ASC,
	[Size2] ASC,
	[Size3] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkOrder_Detail]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkOrder_Detail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WorkOrder_Detail](
	[WO] [int] NOT NULL,
	[WO_Detail] [int] IDENTITY(1000,1) NOT FOR REPLICATION NOT NULL,
	[fStartDate] [date] NULL,
	[fDueDate] [date] NULL,
	[fFinishDate] [date] NULL,
	[fDescript] [varchar](100) NULL,
	[fInqNumP] [char](9) NULL,
	[fSOitem] [char](10) NULL,
	[fPOitem] [char](12) NULL,
	[fPieces] [int] NULL,
	[fAlloy] [char](12) NULL,
	[fForm] [char](2) NULL,
	[fCC] [char](1) NULL,
	[fCL] [char](1) NULL,
	[fThck] [numeric](10, 4) NULL,
	[fSz2] [numeric](9, 3) NULL,
	[fSz3] [numeric](9, 3) NULL,
	[fWeight] [numeric](9, 1) NULL,
	[pinFWeight] [bit] NULL,
	[TotFinishW] [numeric](9, 1) NULL,
	[LostWeight] [numeric](9, 1) NULL,
	[fTBL] [char](1) NULL,
	[fID_Detail] [int] NULL,
	[fID_Detail_Process] [int] NULL,
	[fReceivingID] [int] NULL,
	[fCmplt] [bit] NULL,
	[fIntP] [bit] NULL,
	[fNotes] [varchar](max) NULL,
	[fCondLevel] [varchar](30) NULL,
	[fCncld] [bit] NULL,
	[fPrint] [bit] NULL,
	[fPRecv] [bit] NULL,
	[fMod] [bit] NULL,
	[fRev] [tinyint] NULL,
	[stkListed] [bit] NULL,
	[Stock_Projected_ID] [int] NULL,
	[FollowM] [varchar](20) NULL,
	[FollowLot] [int] NULL,
	[FinishM] [varchar](20) NULL,
	[FinishLot] [int] NULL,
	[StartSize] [numeric](9, 3) NULL,
	[CW] [tinyint] NULL,
	[RoughSize] [numeric](9, 3) NULL,
	[OverSize] [numeric](5, 3) NULL,
	[FSpec] [varchar](50) NULL,
	[TestPO] [char](12) NULL,
	[PassTest] [bit] NULL,
	[RcvdE] [bit] NULL,
	[DescriptID]  AS ((((isnull([fAlloy],'            ')+isnull([fForm],'  '))+isnull([fCC],' '))+isnull([fCL],' '))+str(round([fThck],(9),(3)),(9),(3))) PERSISTED,
	[fReconciled] [bit] NULL,
	[fHeat] [varchar](50) NULL,
	[fLot] [char](10) NULL,
	[NextCode] [char](3) NULL,
	[NextNumber] [char](10) NULL,
 CONSTRAINT [PK_WorkOrder_Detail] PRIMARY KEY CLUSTERED 
(
	[WO_Detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WorkOrder]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkOrder]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WorkOrder](
	[WO] [int] IDENTITY(1000,1) NOT FOR REPLICATION NOT NULL,
	[EnterDate] [date] NOT NULL,
	[SalesRep] [char](20) NULL,
	[StartDate] [date] NULL,
	[DueDate] [date] NULL,
	[FinishDate] [date] NULL,
	[Descript] [varchar](100) NULL,
	[SOitem] [char](10) NULL,
	[POitem] [char](12) NULL,
	[sPieces] [int] NULL,
	[sAlloy] [char](12) NULL,
	[sForm] [char](2) NULL,
	[sCC] [char](1) NULL,
	[sCL] [char](1) NULL,
	[sThck] [numeric](10, 4) NULL,
	[sSz2] [numeric](9, 3) NULL,
	[sSz3] [numeric](9, 3) NULL,
	[sWeight] [numeric](9, 1) NULL,
	[pinSWeight] [bit] NULL,
	[TBL] [char](1) NULL,
	[sID_Detail] [int] NULL,
	[sID_Detail_Process] [int] NULL,
	[sReceivingID] [int] NULL,
	[IntP] [bit] NULL,
	[RE] [bit] NULL,
	[Notes] [varchar](max) NULL,
	[Cncld] [bit] NULL,
	[Cmplt] [bit] NULL,
	[lPrc_Stock] [bit] NULL,
	[ItemCost] [money] NULL,
	[StkCost] [money] NULL,
	[StkConsumed] [bit] NULL,
	[Who] [varchar](50) NULL,
	[Changing] [bit] NULL,
	[ShopRecv] [bit] NULL,
	[Amendment] [tinyint] NULL,
	[RcvdE] [bit] NULL,
	[PrintedWO] [bit] NULL,
	[OutSource] [bit] NULL,
	[MO] [varchar](50) NULL,
	[sReconciled] [bit] NULL,
	[sHeat] [varchar](50) NULL,
	[sLot] [char](10) NULL,
 CONSTRAINT [PK_WorkOrder_1] PRIMARY KEY CLUSTERED 
(
	[WO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[StockLst_Master_Inserted]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Master_Inserted]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StockLst_Master_Inserted](
	[ID] [int] IDENTITY(1000,1) NOT FOR REPLICATION NOT NULL,
	[Master_ID] [int] NOT NULL,
	[Who] [varchar](255) NOT NULL,
	[When] [datetime] NOT NULL,
	[Verified] [bit] NULL,
	[VerifiedBy] [varchar](255) NULL,
 CONSTRAINT [PK_StockLst_Master_Inserted] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WIPLst_Master]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WIPLst_Master]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WIPLst_Master](
	[Alloy] [char](12) NOT NULL,
	[Form] [char](2) NOT NULL,
	[CC] [char](1) NULL,
	[CL] [char](1) NULL,
	[Size] [decimal](9, 3) NOT NULL,
	[Cond] [varchar](50) NULL,
	[MWeight] [decimal](18, 8) NULL,
	[Specs] [varchar](160) NULL,
	[Heat] [varchar](50) NOT NULL,
	[Lot] [char](10) NULL,
	[Paid] [money] NULL,
	[PO_item] [char](12) NULL,
	[PoDueDate] [smalldatetime] NULL,
	[Mill] [char](10) NULL,
	[StkDate] [smalldatetime] NULL,
	[History] [char](20) NULL,
	[Num] [decimal](8, 0) NULL,
	[POStatus] [char](1) NULL,
	[BrandName] [char](20) NULL,
	[FROM_ID] [int] NULL,
	[Melt] [varchar](7) NULL,
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[mS_QTY] [money] NULL,
	[WO_Detail] [int] NULL,
	[ProjID] [int] NULL,
	[MillTrace] [bit] NULL,
	[DescriptID]  AS ((((isnull([Alloy],'            ')+isnull([Form],'  '))+isnull([CC],' '))+isnull([CL],' '))+str(round([Size],(9),(3)),(9),(3))) PERSISTED,
 CONSTRAINT [PK_WIPLst_master] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[StockLst_Process_Grab]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Process_Grab]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StockLst_Process_Grab](
	[SOitem] [char](10) NULL,
	[PO_item] [char](12) NULL,
	[SalesPerson] [char](20) NULL,
	[StartDate] [datetime] NOT NULL,
	[DueDate] [datetime] NULL,
	[Comment] [varchar](100) NOT NULL,
	[Process_ID] [char](10) NOT NULL,
	[Processor] [char](20) NULL,
	[AllowSub] [char](1) NULL,
	[PWeight] [numeric](18, 4) NULL,
	[PU] [tinyint] NULL,
	[QTY] [money] NULL,
	[S_P] [money] NULL,
	[Ordered_QTY] [money] NULL,
	[Ordered_P] [money] NULL,
	[Pounds] [decimal](9, 1) NULL,
	[ID_Master] [int] NULL,
	[ID_Detail] [int] NOT NULL,
	[ID_Detail_Process] [int] NOT NULL,
	[ReceivingID] [int] NOT NULL,
	[WO] [int] NULL,
	[WO_Detail] [int] NULL,
	[InqNumP] [char](9) NULL,
	[Prc_Form] [char](2) NULL,
	[Prc_PCs] [int] NULL,
	[Prc_Dim1] [numeric](10, 4) NULL,
	[Prc_Dim2] [money] NULL,
	[Prc_Dim3] [money] NULL,
	[Descript] [varchar](100) NULL,
	[FoundStk] [smalldatetime] NOT NULL,
	[Gone] [bit] NOT NULL,
	[MS4O] [bit] NULL,
 CONSTRAINT [PK_stockLst_process_Grab] PRIMARY KEY CLUSTERED 
(
	[ID_Detail_Process] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[BrokerLst_Process_Grab]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Process_Grab]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BrokerLst_Process_Grab](
	[SOitem] [char](10) NULL,
	[PO_item] [char](12) NULL,
	[SalesPerson] [char](20) NULL,
	[StartDate] [datetime] NOT NULL,
	[DueDate] [datetime] NULL,
	[Comment] [varchar](100) NOT NULL,
	[Process_ID] [char](10) NOT NULL,
	[Processor] [char](20) NULL,
	[AllowSub] [char](1) NULL,
	[PWeight] [numeric](18, 4) NULL,
	[PU] [tinyint] NULL,
	[QTY] [money] NULL,
	[S_P] [money] NULL,
	[Ordered_QTY] [money] NULL,
	[Ordered_P] [money] NULL,
	[Pounds] [decimal](9, 1) NULL,
	[ID_Master] [int] NULL,
	[ID_Detail] [int] NOT NULL,
	[ID_Detail_Process] [int] NOT NULL,
	[ReceivingID] [int] NOT NULL,
	[WO] [int] NULL,
	[WO_Detail] [int] NULL,
	[InqNumP] [char](9) NULL,
	[Prc_Form] [char](2) NULL,
	[Prc_PCs] [int] NULL,
	[Prc_Dim1] [numeric](10, 4) NULL,
	[Prc_Dim2] [money] NULL,
	[Prc_Dim3] [money] NULL,
	[Descript] [varchar](100) NULL,
	[FoundStk] [smalldatetime] NOT NULL,
	[Gone] [bit] NOT NULL,
	[MS4O] [bit] NULL,
 CONSTRAINT [PK_BrokerLst_Process_Grab] PRIMARY KEY CLUSTERED 
(
	[ID_Detail_Process] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WIPLst_Process_Grab]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WIPLst_Process_Grab]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WIPLst_Process_Grab](
	[SOitem] [char](10) NULL,
	[PO_item] [char](12) NULL,
	[SalesPerson] [char](20) NULL,
	[StartDate] [datetime] NOT NULL,
	[DueDate] [datetime] NULL,
	[Comment] [varchar](100) NOT NULL,
	[Process_ID] [char](10) NOT NULL,
	[Processor] [char](20) NULL,
	[AllowSub] [char](1) NULL,
	[PWeight] [numeric](18, 4) NULL,
	[PU] [tinyint] NULL,
	[QTY] [money] NULL,
	[S_P] [money] NULL,
	[Ordered_QTY] [money] NULL,
	[Ordered_P] [money] NULL,
	[Pounds] [decimal](9, 1) NULL,
	[ID_Master] [int] NULL,
	[ID_Detail] [int] NOT NULL,
	[ID_Detail_Process] [int] NOT NULL,
	[ReceivingID] [int] NOT NULL,
	[WO] [int] NULL,
	[WO_Detail] [int] NULL,
	[InqNumP] [char](9) NULL,
	[Prc_Form] [char](2) NULL,
	[Prc_PCs] [int] NULL,
	[Prc_Dim1] [numeric](10, 4) NULL,
	[Prc_Dim2] [money] NULL,
	[Prc_Dim3] [money] NULL,
	[Descript] [varchar](100) NULL,
	[FoundStk] [smalldatetime] NOT NULL,
	[Gone] [bit] NOT NULL,
	[MS4O] [bit] NULL,
 CONSTRAINT [PK_WIPLst_Process_Grab] PRIMARY KEY CLUSTERED 
(
	[ID_Detail_Process] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AppSetup]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AppSetup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AppSetup](
	[un] [char](20) NOT NULL,
	[prp] [char](20) NOT NULL,
	[ans] [char](50) NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
 CONSTRAINT [PK_AppSetup_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Alloy]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Alloy]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Alloy](
	[alloy] [char](12) NOT NULL,
	[BrandName] [char](20) NULL,
	[UName] [char](20) NULL,
	[density] [numeric](5, 3) NULL,
	[Inventory] [char](1) NULL,
	[Co] [decimal](9, 6) NULL,
	[Cr] [decimal](9, 6) NULL,
	[Cu] [decimal](9, 6) NULL,
	[Fe] [decimal](9, 6) NULL,
	[Mo] [decimal](9, 6) NULL,
	[Mn] [decimal](9, 6) NULL,
	[Nb] [decimal](9, 6) NULL,
	[Ni] [decimal](9, 6) NULL,
	[Ti] [decimal](9, 6) NULL,
	[V] [decimal](9, 6) NULL,
	[W] [decimal](9, 6) NULL,
	[UNS] [char](6) NULL,
	[CertName] [char](20) NULL,
	[HPAcore] [bit] NULL,
	[HPAStock] [bit] NULL,
	[Surcharge] [bit] NULL,
	[PriceName] [char](12) NULL,
	[MTR_UNS] [varchar](30) NULL,
	[GL] [int] NULL,
 CONSTRAINT [PK_alloy] PRIMARY KEY NONCLUSTERED 
(
	[alloy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [AlloyAlloy]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Alloy]') AND name = N'AlloyAlloy')
CREATE CLUSTERED INDEX [AlloyAlloy] ON [dbo].[Alloy]
(
	[alloy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SoldAddr]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SoldAddr]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SoldAddr](
	[soldcode] [decimal](10, 0) NOT NULL,
	[company] [varchar](100) NULL,
	[addr1] [varchar](100) NULL,
	[addr2] [varchar](100) NULL,
	[city] [varchar](100) NULL,
	[st] [varchar](50) NULL,
	[zip] [varchar](50) NULL,
	[country] [varchar](50) NULL,
	[contact] [varchar](101) NULL,
	[telephone] [varchar](50) NULL,
	[fax_number] [char](12) NULL,
	[email] [varchar](60) NULL,
	[customer] [char](20) NULL,
	[lastedit] [datetime] NULL,
	[inactive] [bit] NULL,
	[IND_Type] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[NoNoiseName] [varchar](100) NULL,
	[EIN] [varchar](50) NULL,
	[StTax] [varchar](50) NULL,
	[FromCode] [int] NULL,
	[Marketing] [varchar](100) NULL,
	[Added] [datetime] NULL,
	[WhoAdd] [varchar](255) NULL,
	[WhenAdd] [datetime] NULL,
 CONSTRAINT [PK_soldaddr] PRIMARY KEY CLUSTERED 
(
	[soldcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO


/****** Object:  Table [dbo].[StockLst_Wants]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Wants]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StockLst_Wants](
	[Alloy] [char](12) NOT NULL,
	[Form] [char](2) NOT NULL,
	[CC] [char](1) NOT NULL,
	[CL] [char](1) NULL,
	[Size] [decimal](9, 3) NOT NULL,
	[Cond] [varchar](50) NOT NULL,
	[MWeight] [decimal](18, 8) NOT NULL,
	[Specs] [varchar](160) NOT NULL,
	[Heat] [varchar](50) NOT NULL,
	[BrandName] [char](20) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Pc] [int] NOT NULL,
	[Dim1] [decimal](18, 4) NOT NULL,
	[Dim2] [decimal](18, 4) NOT NULL,
	[Dim3] [decimal](18, 4) NOT NULL,
	[Descript] [varchar](20) NOT NULL,
	[CCSortValue] [tinyint] NOT NULL,
	[FormSort] [tinyint] NOT NULL,
	[AddDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_StockLst_Wants] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[StockLst_Vendor]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Vendor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StockLst_Vendor](
	[Alloy] [char](12) NOT NULL,
	[Form] [char](2) NOT NULL,
	[CC] [char](1) NOT NULL,
	[CL] [char](1) NULL,
	[Size] [decimal](9, 3) NOT NULL,
	[Cond] [varchar](50) NOT NULL,
	[MWeight] [decimal](18, 8) NOT NULL,
	[mS_QTY] [money] NOT NULL,
	[Specs] [varchar](160) NOT NULL,
	[Heat] [varchar](50) NOT NULL,
	[BrandName] [char](20) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Pc] [int] NOT NULL,
	[Dim1] [decimal](18, 4) NOT NULL,
	[Dim2] [decimal](18, 4) NOT NULL,
	[Dim3] [decimal](18, 4) NOT NULL,
	[Descript] [varchar](20) NOT NULL,
	[CCSortValue] [tinyint] NOT NULL,
	[FormSort] [tinyint] NOT NULL,
	[Mill] [char](10) NOT NULL,
	[Vendor] [varchar](30) NOT NULL,
	[AddDate] [smalldatetime] NOT NULL,
	[RemoveDate] [smalldatetime] NOT NULL,
	[Melt] [varchar](7) NULL,
 CONSTRAINT [PK_StockLst_Vendor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Object:  Table [dbo].[Survey_Assignment_ContactInfos]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Survey_Assignment_ContactInfos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Survey_Assignment_ContactInfos](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[PhoneNumber] [varchar](15) NULL,
	[Email] [varchar](254) NULL,
	[CompanyName] [varchar](100) NULL,
	[ContactName] [varchar](100) NULL,
	[SalesOrder] [varchar](15) NULL,
	[Quote] [varchar](15) NULL,
	[NoQuote] [bit] NOT NULL,
	[DoNotContact] [bit] NOT NULL,
	[LastModified] [timestamp] NOT NULL,
 CONSTRAINT [PK_Survey_Assignment_ContactInfos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Survey_Assignments]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Survey_Assignments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Survey_Assignments](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[SurveyID] [uniqueidentifier] NOT NULL,
	[DateAssigned] [datetime] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[AssignmentType] [smallint] NOT NULL,
	[TargetIdentifier] [varchar](50) NULL,
	[Anonymous] [bit] NOT NULL,
	[RequestedByUser] [bit] NOT NULL,
	[Survey_Assignment_ContactInfoID] [uniqueidentifier] NULL,
	[DateSubmitted] [datetime] NULL,
	[LastModified] [timestamp] NOT NULL,
 CONSTRAINT [PK_Survey_Assignments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Object:  Table [dbo].[WIPLst_Detail]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WIPLst_Detail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WIPLst_Detail](
	[Size_H] [decimal](9, 4) NULL,
	[Size_L] [decimal](9, 4) NULL,
	[PC] [int] NULL,
	[Dim1] [decimal](18, 4) NOT NULL,
	[Dim2] [decimal](18, 4) NULL,
	[Dim3] [decimal](18, 4) NULL,
	[Length] [char](160) NULL,
	[Weight] [decimal](18, 4) NOT NULL,
	[CostValue] [money] NULL,
	[Descript] [varchar](20) NULL,
	[Location] [char](10) NULL,
	[FloorStatus] [char](1) NULL,
	[Class] [char](1) NULL,
	[Unit] [char](6) NULL,
	[RandLen] [bit] NOT NULL,
	[InvCheck] [datetime] NULL,
	[ID] [int] NOT NULL,
	[ID_Detail] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ReceivingID] [int] NULL,
	[InvoiceValue] [money] NOT NULL,
	[LiveCheck] [bit] NOT NULL,
	[AccountingCheck] [bit] NOT NULL,
	[Quarantine] [bit] NOT NULL,
	[S_QTY] [money] NULL,
	[S_P] [money] NULL,
	[S_Total] [money] NULL,
	[S_PU] [tinyint] NULL,
	[Prime] [bit] NULL,
	[WO] [int] NULL,
	[sStockLst_ID_Detail] [int] NULL,
	[fStockLst_ID_Detail] [int] NULL,
 CONSTRAINT [PK_WIPLst_detail] PRIMARY KEY CLUSTERED 
(
	[ID_Detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Object:  Table [dbo].[Cert_co]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cert_co]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Cert_co](
	[CO_ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ID] [int] NULL,
	[Company] [varchar](50) NOT NULL,
	[PoNum] [varchar](50) NOT NULL,
	[PartNo] [varchar](50) NOT NULL,
	[pcs] [int] NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[SalesNum] [int] NOT NULL,
	[SOitem] [char](10) NOT NULL,
 CONSTRAINT [PK_Cert_co] PRIMARY KEY CLUSTERED 
(
	[CO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Cert]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cert]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Cert](
	[Reference] [varchar](10) NULL,
	[DateCert] [datetime] NULL,
	[DateProd] [datetime] NULL,
	[Heat] [varchar](50) NOT NULL,
	[Lot] [decimal](5, 0) NULL,
	[Alloy] [varchar](35) NOT NULL,
	[Alloy_HPA] [char](12) NULL,
	[Size] [varchar](10) NULL,
	[Spec] [varchar](max) NULL,
	[Cond_Fin] [varchar](50) NULL,
	[SpecLMA] [varchar](40) NULL,
	[Spec2] [varchar](50) NULL,
	[SpecSpaceX] [varchar](80) NULL,
	[UNS] [varchar](10) NULL,
	[Al] [char](7) NULL,
	[B] [char](7) NULL,
	[Be] [char](7) NULL,
	[C] [char](7) NULL,
	[Ca] [char](7) NULL,
	[Cb] [char](7) NULL,
	[Cd] [char](7) NULL,
	[Cl] [char](7) NULL,
	[Co] [char](7) NULL,
	[Cr] [char](7) NULL,
	[Cu] [char](7) NULL,
	[Fe] [char](7) NULL,
	[H] [char](7) NULL,
	[Hf] [char](7) NULL,
	[Mg] [char](7) NULL,
	[Mn] [char](7) NULL,
	[Mo] [char](7) NULL,
	[N] [char](7) NULL,
	[Na] [char](7) NULL,
	[Ni] [char](7) NULL,
	[O] [char](7) NULL,
	[P] [char](7) NULL,
	[Pb] [char](7) NULL,
	[S] [char](7) NULL,
	[Si] [char](7) NULL,
	[Sn] [char](7) NULL,
	[Ta] [char](7) NULL,
	[Ti] [char](7) NULL,
	[U] [char](7) NULL,
	[V] [char](7) NULL,
	[W] [char](7) NULL,
	[Y] [char](7) NULL,
	[Zr] [char](7) NULL,
	[CbandTa] [varchar](50) NULL,
	[NiandCo] [varchar](50) NULL,
	[Other] [varchar](50) NULL,
	[Ult1] [decimal](10, 0) NULL,
	[Yield1] [decimal](10, 0) NULL,
	[Elong1] [decimal](4, 1) NULL,
	[ElonInches] [char](5) NULL,
	[RA1] [decimal](4, 1) NULL,
	[tLoc1] [char](1) NULL,
	[Hardness] [varchar](10) NULL,
	[BHN] [smallint] NULL,
	[Ult2] [decimal](10, 0) NULL,
	[Yield2] [decimal](10, 0) NULL,
	[Elong2] [decimal](4, 1) NULL,
	[ElonInches2] [varchar](50) NULL,
	[RA2] [decimal](4, 1) NULL,
	[tLoc2] [char](1) NULL,
	[Hardness2] [varchar](10) NULL,
	[BHN2] [smallint] NULL,
	[Ult3] [decimal](10, 0) NULL,
	[Yield3] [decimal](10, 0) NULL,
	[Elong3] [decimal](4, 1) NULL,
	[ElonInches3] [char](5) NULL,
	[RA3] [decimal](4, 1) NULL,
	[tLoc3] [char](1) NULL,
	[Hardness3] [varchar](10) NULL,
	[BHN3] [smallint] NULL,
	[Ult4] [decimal](10, 0) NULL,
	[Yield4] [decimal](10, 0) NULL,
	[Elong4] [decimal](4, 1) NULL,
	[ElonInches4] [varchar](5) NULL,
	[RA4] [decimal](4, 1) NULL,
	[tLoc4] [char](1) NULL,
	[Hardness4] [varchar](10) NULL,
	[BHN4] [smallint] NULL,
	[Ult5] [decimal](10, 0) NULL,
	[Yield5] [decimal](10, 0) NULL,
	[Elong5] [decimal](4, 1) NULL,
	[ElonInches5] [varchar](5) NULL,
	[RA5] [decimal](4, 1) NULL,
	[tLoc5] [char](1) NULL,
	[Hardness5] [varchar](10) NULL,
	[BHN5] [smallint] NULL,
	[Ult6] [int] NULL,
	[Yield6] [int] NULL,
	[Elong6] [decimal](4, 1) NULL,
	[ElonInches6] [varchar](5) NULL,
	[RA6] [decimal](4, 1) NULL,
	[tLoc6] [char](1) NULL,
	[Ult7] [int] NULL,
	[Yield7] [int] NULL,
	[Elong7] [decimal](4, 1) NULL,
	[ElonInches7] [varchar](5) NULL,
	[RA7] [decimal](4, 1) NULL,
	[tLoc7] [char](1) NULL,
	[Temp2] [decimal](10, 0) NULL,
	[STen2] [decimal](10, 0) NULL,
	[Time2] [decimal](9, 1) NULL,
	[Temp3] [decimal](10, 0) NULL,
	[STen3] [decimal](10, 0) NULL,
	[Time3] [decimal](9, 1) NULL,
	[HeatTreat] [varchar](200) NULL,
	[CorrosionR] [varchar](60) NULL,
	[GrainSize] [varchar](10) NULL,
	[TestPO] [varchar](12) NULL,
	[LabUsed] [varchar](12) NOT NULL,
	[TestPO2] [varchar](12) NULL,
	[LabUsed2] [varchar](12) NULL,
	[Signed] [bit] NULL,
	[Machine] [tinyint] NULL,
	[Signature] [varchar](10) NULL,
	[SignUser] [varchar](50) NULL,
	[SignDate] [datetime] NULL,
	[XtraInfo] [varchar](max) NULL,
	[QA] [bit] NULL,
	[QArev] [varchar](20) NULL,
	[MercFree] [bit] NULL,
	[NoWeld] [bit] NULL,
	[DFARS] [bit] NULL,
	[SRHours] [decimal](4, 1) NULL,
	[SRTemp] [varchar](50) NULL,
	[SRStress] [decimal](10, 0) NULL,
	[SRRA] [decimal](4, 1) NULL,
	[SRElong] [decimal](4, 1) NULL,
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[StockLst_ID] [int] NULL,
	[AC_ID] [int] NULL,
	[AC_cmplt] [bit] NULL,
	[WhoInsert] [varchar](254) NULL,
	[Alnita] [bit] NULL,
	[Sean] [bit] NULL,
 CONSTRAINT [PK_Cert] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO

/****** Object:  Table [dbo].[rtr]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[rtr]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[rtr](
	[ID] [bigint] IDENTITY(10000,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[SOitem] [char](10) NULL,
	[WO] [int] NULL,
	[WO_Detail] [int] NULL,
	[Quote_ID] [int] NULL,
	[Started] [bit] NULL,
	[Finished] [bit] NULL,
	[MinD] [int] NULL,
	[MaxD] [int] NULL,
	[Last_Started] [int] NULL,
	[Last_Finished] [int] NULL,
	[Next_Detail_Start] [int] NULL,
	[Next_Detail_Finish] [int] NULL,
	[Next_Rely_On_Start] [int] NULL,
	[OType_Num] [char](17) NULL,
	[OldID] [bigint] NULL,
	[cncld] [bit] NULL,
	[CreateUser] [varchar](100) NOT NULL,
 CONSTRAINT [PK_rtr] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[rtr_Detail]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[rtr_Detail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[rtr_Detail](
	[rtr_ID] [bigint] NOT NULL,
	[Detail] [int] NOT NULL,
	[EstStart] [date] NOT NULL,
	[Started] [bit] NOT NULL,
	[StartDate] [datetime] NULL,
	[EstFinish] [date] NULL,
	[Finished] [bit] NOT NULL,
	[FinishDate] [datetime] NULL,
	[Oper_ID] [int] NULL,
	[Oper_Note] [varchar](max) NULL,
	[POitem] [char](12) NULL,
	[Cncld] [bit] NOT NULL,
	[CnclDate] [datetime] NULL,
	[ReqSched] [bit] NOT NULL,
	[EstTime] [int] NOT NULL,
	[ActTime] [int] NOT NULL,
	[Rely_On] [int] NULL,
	[Next_Up] [int] NULL,
	[Synchro] [int] NULL,
	[TBL] [char](1) NULL,
	[ID_Detail_Process] [int] NULL,
	[CreateUser] [varchar](100) NULL,
 CONSTRAINT [IX_rtr_ID_Detail] UNIQUE CLUSTERED 
(
	[rtr_ID] DESC,
	[Detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO

/****** Object:  Table [dbo].[GFM_Die_Daily]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GFM_Die_Daily]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GFM_Die_Daily](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[DieID] [uniqueidentifier] NOT NULL,
	[Lot] [int] NULL,
	[Date] [datetime] NOT NULL,
	[Who] [varchar](50) NOT NULL,
	[TimeIN] [datetime] NOT NULL,
	[TimeOUT] [datetime] NULL,
	[RunTime] [int] NULL,
	[SO] [char](10) NULL,
	[WO] [int] NULL,
	[Hot_Cold] [char](1) NOT NULL,
	[WorkLevel] [char](1) NOT NULL,
	[Notes] [text] NOT NULL,
	[OldCondition] [tinyint] NULL,
	[NewCondition] [tinyint] NULL,
	[ChangeLog] [text] NULL,
 CONSTRAINT [PK_GFM_Die_Daily] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[GFM_Die_On_OT]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GFM_Die_On_OT]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GFM_Die_On_OT](
	[RowID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[OTJob] [uniqueidentifier] NOT NULL,
	[DieDailyID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_GFM_Die_On_OT] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Object:  Table [dbo].[WIPLst_Process]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WIPLst_Process]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WIPLst_Process](
	[SOitem] [char](10) NULL,
	[PO_item] [char](12) NULL,
	[SalesPerson] [char](20) NULL,
	[StartDate] [datetime] NOT NULL,
	[DueDate] [datetime] NULL,
	[Comment] [varchar](100) NOT NULL,
	[Process_ID] [char](10) NOT NULL,
	[Processor] [char](20) NULL,
	[AllowSub] [char](1) NULL,
	[PWeight] [numeric](18, 4) NULL,
	[PPc] [int] NULL,
	[PFT] [float] NULL,
	[PU] [tinyint] NULL,
	[QTY] [money] NULL,
	[Ordered_QTY] [money] NULL,
	[Ordered_P] [money] NULL,
	[Pounds] [decimal](9, 1) NULL,
	[ID_Detail] [int] NOT NULL,
	[ID_Detail_Process] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ReceivingID] [int] NOT NULL,
	[WO] [int] NULL,
	[WO_Detail] [int] NULL,
	[InqNumP] [char](9) NULL,
	[QTY_Due] [money] NULL,
	[Prc_Qty] [money] NULL,
	[Prc_Form] [char](2) NULL,
	[Prc_PCs] [int] NULL,
	[Prc_Dim1] [numeric](10, 4) NULL,
	[Prc_Dim2] [money] NULL,
	[Prc_Dim3] [money] NULL,
	[Prc_Q_QTY] [money] NULL,
	[Prc_Q_PU] [tinyint] NULL,
	[FoundStk] [smalldatetime] NULL,
 CONSTRAINT [PK_WIPLst_process] PRIMARY KEY CLUSTERED 
(
	[ID_Detail_Process] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Object:  Table [dbo].[GFM_Die_Condition]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GFM_Die_Condition]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GFM_Die_Condition](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[DieID] [uniqueidentifier] NOT NULL,
	[Condition] [tinyint] NOT NULL,
	[When] [datetime] NOT NULL,
	[Who] [varchar](50) NOT NULL,
 CONSTRAINT [PK_GFM_Die_Condition] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[GFM_Die_Range]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GFM_Die_Range]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GFM_Die_Range](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[DieID] [uniqueidentifier] NOT NULL,
	[RangeMin] [float] NOT NULL,
	[RangeMax] [float] NOT NULL,
	[When] [datetime] NOT NULL,
	[Who] [varchar](50) NOT NULL,
 CONSTRAINT [PK_GFM_Die_Range] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[GFM_Die_Inspection]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GFM_Die_Inspection]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GFM_Die_Inspection](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[DieID] [uniqueidentifier] NOT NULL,
	[InspectionDate] [datetime] NOT NULL,
	[When] [datetime] NOT NULL,
	[Who] [varchar](50) NOT NULL,
	[ConditionID] [uniqueidentifier] NULL,
	[HeightID] [uniqueidentifier] NULL,
	[RangeID] [uniqueidentifier] NULL,
	[LandingID] [uniqueidentifier] NULL,
	[Notes] [text] NULL,
	[Employees] [text] NULL,
	[ChangeLog] [text] NULL,
 CONSTRAINT [PK_GFM_Die_Inspection] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[GFM_Die_Landing]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GFM_Die_Landing]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GFM_Die_Landing](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[DieID] [uniqueidentifier] NOT NULL,
	[LandingSize] [decimal](5, 3) NOT NULL,
	[When] [datetime] NOT NULL,
	[Who] [varchar](50) NOT NULL,
 CONSTRAINT [PK_GFM_Die_Landing] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[GFM_Die_Height]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GFM_Die_Height]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GFM_Die_Height](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[DieID] [uniqueidentifier] NOT NULL,
	[DieHeight] [decimal](5, 3) NOT NULL,
	[When] [datetime] NOT NULL,
	[Who] [varchar](50) NOT NULL,
 CONSTRAINT [PK_GFM_Die_Height] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Object:  Table [dbo].[AcctCost_SOitem]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AcctCost_SOitem]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AcctCost_SOitem](
	[AC_ID] [int] NOT NULL,
	[SOitem] [char](10) NOT NULL
) ON [PRIMARY]
END
GO

/****** Object:  UserDefinedFunction [dbo].[f_StockView]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_StockView]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_StockView]
( 
	@Alloy CHAR(12)
	,@Form CHAR(2) 
)
RETURNS TABLE
AS

--SELECT [Year],alloy,form,cc,Size,MWeight,TotalCost FROM dbo.f_StockView(''HPA N60'',''10'')
--SELECT * FROM dbo.f_StockView(''HPA N60'',''10'')

 --Due in, Partial receive, Waiting for bill, Accounted
 
RETURN
 SELECT     
  CASE Stocklst_Master.POStatus 
   WHEN ''D'' THEN YEAR(GETDATE()) + 2
   WHEN ''P'' THEN YEAR(GETDATE()) + 2
   WHEN ''W'' THEN YEAR(GETDATE()) + 1 
   WHEN ''A'' THEN YEAR(GETDATE()) + 1 
   ELSE YEAR(GETDATE()) + 1  END AS [Year]
  ,Stocklst_Master.alloy 
  ,Stocklst_Master.form 
  ,Stocklst_Master.cc 
  ,dbo.f_SizeStandard( Stocklst_Master.size ) AS Size
   ,(weight) AS MWeight, (weight * costvalue) AS TotalCost
 FROM dbo.Stocklst_Master INNER JOIN
  dbo.Stocklst_Detail ON Stocklst_Detail.id = Stocklst_Master.id
 WHERE alloy = @Alloy AND form = @form
' 
END
GO

/****** Object:  Table [dbo].[Sales_Hold_Status]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Hold_Status]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sales_Hold_Status](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SOitem] [char](10) NOT NULL,
	[SalesNum] [int] NOT NULL,
	[POitem] [char](12) NULL,
	[Hold_Type] [char](10) NOT NULL,
	[Hold_Value] [bit] NOT NULL,
	[Who] [varchar](255) NOT NULL,
	[What] [varchar](20) NOT NULL,
	[When] [datetime] NOT NULL,
	[Comment] [varchar](255) NULL,
 CONSTRAINT [PK_Sales_Hold_Status] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Object:  Table [dbo].[AcctCost_POitem]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AcctCost_POitem]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AcctCost_POitem](
	[AC_ID] [int] NOT NULL,
	[POitem] [char](12) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AcctCost_WOD]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AcctCost_WOD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AcctCost_WOD](
	[AC_ID] [int] NOT NULL,
	[WO_Detail] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TC_Replacement_Employees_Times_ActivityDefinition]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TC_Replacement_Employees_Times_ActivityDefinition]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TC_Replacement_Employees_Times_ActivityDefinition](
	[ActivityId] [smallint] NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Billable] [bit] NOT NULL,
 CONSTRAINT [PK_TC_Replacement_Employees_Times_ActivityDefinition] PRIMARY KEY CLUSTERED 
(
	[ActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TC_Replacement_Employees_Times]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TC_Replacement_Employees_Times]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TC_Replacement_Employees_Times](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [bigint] NOT NULL,
	[TimeIn] [datetime] NULL,
	[InActivityType] [smallint] NULL,
	[TimeOut] [datetime] NULL,
	[OutActivityType] [smallint] NULL,
	[InAutoStatus] [bit] NULL,
	[TimeInMissed] [bit] NULL,
	[OutAutoStatus] [bit] NULL,
	[TimeOutMissed] [bit] NULL,
	[LastModified] [timestamp] NOT NULL,
 CONSTRAINT [PK_TC_Replacement_Employees_Times] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Object:  Table [dbo].[rtr_Operation]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[rtr_Operation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[rtr_Operation](
	[Oper_ID] [int] IDENTITY(549,1) NOT NULL,
	[Operation] [varchar](20) NOT NULL,
	[jobClassID] [tinyint] NULL,
	[jobClass]  AS ([dbo].[f_OT_JobClassID]([JobClassID])),
	[jobType] [varchar](50) NOT NULL,
	[StdDetail] [int] NULL,
	[Better_ID] [int] NULL,
	[CreateUser] [varchar](100) NULL,
 CONSTRAINT [PK_rtr_Operation] PRIMARY KEY NONCLUSTERED 
(
	[Oper_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Object:  Table [dbo].[Employee]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1000,1) NOT FOR REPLICATION NOT NULL,
	[TC_ID] [int] NULL,
	[Login] [nchar](30) NOT NULL,
	[FName] [nvarchar](30) NOT NULL,
	[LName] [nvarchar](30) NOT NULL,
	[LNSuffix] [nvarchar](10) NULL,
	[SalesP] [nchar](1) NULL,
	[Position] [nvarchar](20) NOT NULL,
	[HireDate] [datetime] NULL,
	[FireDate] [datetime] NULL,
	[HomePhone] [nchar](10) NULL,
	[CellPhone] [nchar](10) NULL,
	[hourly] [bit] NOT NULL,
	[Location] [nchar](1) NOT NULL,
	[BirthDate] [datetime] NULL,
	[PensionDate] [datetime] NULL,
	[VacationDays] [tinyint] NULL,
	[SickDays] [tinyint] NULL,
	[PersonalDays] [tinyint] NULL,
	[Active] [bit] NOT NULL,
	[ScanName] [nchar](10) NULL,
	[ShopEmployee] [bit] NOT NULL,
	[HPA_Email] [nvarchar](70) NULL,
	[ALT_Email] [nvarchar](70) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Object:  Table [dbo].[Stock_Projected]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Stock_Projected]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Stock_Projected](
	[ID] [int] IDENTITY(10,1) NOT NULL,
	[Company] [varchar](30) NOT NULL,
	[Alloy] [char](12) NOT NULL,
	[Form] [char](2) NOT NULL,
	[CC] [char](1) NOT NULL,
	[CL] [char](1) NOT NULL,
	[Thck] [numeric](9, 3) NOT NULL,
	[Spec_CC] [char](1) NOT NULL,
	[Spec_CL] [char](1) NOT NULL,
	[YearInches] [int] NOT NULL,
	[YearPounds] [int] NOT NULL,
	[MinPounds] [int] NOT NULL,
	[OverSize] [numeric](5, 3) NOT NULL,
	[SThck] [numeric](9, 3) NOT NULL,
	[SNomThck] [numeric](9, 3) NOT NULL,
	[CW] [tinyint] NOT NULL,
	[Sdate] [date] NOT NULL,
	[PoundsTaken] [int] NOT NULL,
	[UT] [bit] NOT NULL,
	[FollowM] [varchar](20) NOT NULL,
	[FollowLot] [int] NOT NULL,
	[LastEdit] [date] NOT NULL,
	[cncld] [bit] NOT NULL
) ON [PRIMARY]
END
GO

/****** Object:  Table [dbo].[UPSStdShiproute]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UPSStdShiproute]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UPSStdShiproute](
	[shiproute] [varchar](20) NOT NULL,
	[upsstand] [varchar](20) NOT NULL,
 CONSTRAINT [PK_UPSStdShiproute] PRIMARY KEY CLUSTERED 
(
	[shiproute] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PO_No]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PO_No]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PO_No](
	[ID] [int] IDENTITY(1000,1) NOT FOR REPLICATION NOT NULL,
	[HPAPO] [int] NOT NULL,
	[EoPage] [varchar](max) NULL,
	[PO_Rev] [tinyint] NOT NULL,
	[Cancelled] [bit] NOT NULL,
	[Reconciled] [bit] NOT NULL,
	[Rec_Date] [datetime] NULL,
	[Rec_Who] [varchar](255) NULL,
	[Changing] [bit] NOT NULL,
	[Printed] [bit] NOT NULL,
	[SentUnAproved] [bit] NOT NULL,
	[SentCondAprv] [bit] NOT NULL,
	[Who] [varchar](255) NULL,
	[When] [datetime] NULL,
 CONSTRAINT [PK_PO_No] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO

/****** Object:  Table [dbo].[SOitem_Hrs]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SOitem_Hrs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SOitem_Hrs](
	[SOitem] [char](10) NOT NULL,
	[Cncld] [bit] NOT NULL,
	[Cmplt] [bit] NOT NULL,
	[INV] [smallint] NOT NULL,
	[aINV] [smallint] NOT NULL,
	[xINV] [tinyint] NOT NULL,
	[Recv] [smallint] NOT NULL,
	[aRecv] [smallint] NOT NULL,
	[xRecv] [tinyint] NOT NULL,
	[Mach] [smallint] NOT NULL,
	[aMach] [smallint] NOT NULL,
	[xMach] [tinyint] NOT NULL,
	[CG] [smallint] NOT NULL,
	[aCG] [smallint] NOT NULL,
	[xCG] [tinyint] NOT NULL,
	[Pack] [smallint] NOT NULL,
	[aPack] [smallint] NOT NULL,
	[xPack] [tinyint] NOT NULL,
	[GFM] [smallint] NOT NULL,
	[aGFM] [smallint] NOT NULL,
	[xGFM] [tinyint] NOT NULL,
	[Draw] [smallint] NOT NULL,
	[aDraw] [smallint] NOT NULL,
	[xDraw] [tinyint] NOT NULL,
	[Roll] [smallint] NOT NULL,
	[aRoll] [smallint] NOT NULL,
	[xRoll] [tinyint] NOT NULL,
	[Press] [smallint] NOT NULL,
	[aPress] [smallint] NOT NULL,
	[xPress] [tinyint] NOT NULL,
	[Heat] [smallint] NOT NULL,
	[aHeat] [smallint] NOT NULL,
	[xHeat] [tinyint] NOT NULL,
	[Test] [smallint] NOT NULL,
	[aTest] [smallint] NOT NULL,
	[xTest] [tinyint] NOT NULL,
	[Abrsv] [smallint] NOT NULL,
	[aAbrsv] [smallint] NOT NULL,
	[xAbrsv] [tinyint] NOT NULL,
	[BSaw] [smallint] NOT NULL,
	[aBSaw] [smallint] NOT NULL,
	[xBSaw] [tinyint] NOT NULL,
	[Shear] [smallint] NOT NULL,
	[aShear] [smallint] NOT NULL,
	[xShear] [tinyint] NOT NULL,
	[Plasma] [smallint] NOT NULL,
	[aPlasma] [smallint] NOT NULL,
	[xPlasma] [tinyint] NOT NULL,
	[WJet] [smallint] NOT NULL,
	[aWjet] [smallint] NOT NULL,
	[xWjet] [tinyint] NOT NULL,
	[Hrs] [int] NOT NULL,
	[aHrs] [int] NOT NULL,
	[xHrs] [tinyint] NOT NULL,
	[SalesNum] [int] NULL,
	[DateEst] [date] NULL,
	[DateAct] [date] NULL,
 CONSTRAINT [PK_SOitem_Hrs] PRIMARY KEY CLUSTERED 
(
	[SOitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Object:  Table [dbo].[Conversion_log]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Conversion_log]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Conversion_log](
	[alloyname] [char](12) NULL,
	[heat] [char](30) NULL,
	[lot] [int] NOT NULL,
	[date] [datetime] NULL,
	[form] [char](2) NULL,
	[spiece] [decimal](5, 1) NULL,
	[ssize] [decimal](9, 3) NULL,
	[swidth] [decimal](9, 3) NULL,
	[slength] [decimal](9, 3) NULL,
	[sweight] [decimal](5, 1) NULL,
	[oversize] [decimal](9, 3) NULL,
	[fpiece] [decimal](5, 0) NULL,
	[fsize] [decimal](9, 3) NULL,
	[fwidth] [decimal](9, 3) NULL,
	[flength] [decimal](9, 3) NULL,
	[condition] [char](10) NULL,
	[htreat] [char](16) NULL,
	[coldwork] [decimal](3, 3) NULL,
	[salesnum] [int] NULL,
	[itemSO] [decimal](2, 0) NULL,
	[soitem] [char](10) NULL,
	[spec] [varchar](50) NULL,
	[po] [char](15) NULL,
	[oventemp] [decimal](4, 0) NULL,
	[notes] [text] NULL,
	[tensile] [decimal](6, 0) NULL,
	[yield] [decimal](6, 0) NULL,
	[elongation] [decimal](4, 1) NULL,
	[red_area] [decimal](4, 1) NULL,
	[rockwell] [char](4) NULL,
	[bhn] [decimal](3, 0) NULL,
	[Tensile2] [decimal](6, 0) NULL,
	[Yield2] [decimal](6, 0) NULL,
	[Elongation2] [decimal](4, 1) NULL,
	[Red_Area2] [decimal](4, 1) NULL,
	[Rockwell2] [char](4) NULL,
	[BHN2] [decimal](3, 0) NULL,
	[Tensile3] [decimal](6, 0) NULL,
	[Yield3] [decimal](6, 0) NULL,
	[Elongation3] [decimal](4, 1) NULL,
	[Red_Area3] [decimal](4, 1) NULL,
	[Rockwell3] [char](4) NULL,
	[BHN3] [decimal](3, 0) NULL,
	[testpo] [decimal](9, 0) NULL,
	[testPoItem] [char](12) NULL,
	[testItemPO] [decimal](2, 0) NULL,
	[testsent] [datetime] NULL,
	[lab] [char](12) NULL,
	[passed] [bit] NULL,
	[CustomerMat] [bit] NULL,
	[chart] [bit] NULL,
	[minutes] [decimal](4, 0) NULL,
	[laborp] [decimal](8, 2) NULL,
	[ovenp] [decimal](8, 2) NULL,
	[cgp] [decimal](8, 2) NULL,
	[HTrockwell] [char](4) NULL,
	[HTBHN] [decimal](3, 0) NULL,
	[ChartData] [bit] NULL,
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[WO] [int] NULL,
	[WO_Detail] [int] NULL,
	[AC_ID] [int] NULL,
 CONSTRAINT [PK_Conversion_log] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Conversion_log] UNIQUE CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AcctCost_Cert]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AcctCost_Cert]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AcctCost_Cert](
	[AC_ID] [int] NOT NULL,
	[ID] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AcctCost_Mach]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AcctCost_Mach]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AcctCost_Mach](
	[AC_ID] [int] NOT NULL,
	[Machine] [char](10) NOT NULL,
	[Lot] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AcctCost_WO]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AcctCost_WO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AcctCost_WO](
	[AC_ID] [int] NOT NULL,
	[WO] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AcctCosting]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AcctCosting]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AcctCosting](
	[AC_ID] [int] IDENTITY(1000,1) NOT NULL,
	[dtCreated] [datetime] NOT NULL,
	[complete] [bit] NOT NULL,
	[cancelled] [bit] NOT NULL,
	[dtComplete] [datetime] NULL,
 CONSTRAINT [PK_AcctCosting] PRIMARY KEY CLUSTERED 
(
	[AC_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ActionRequest]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ActionRequest]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ActionRequest](
	[AR_No] [int] NULL,
	[RMA] [int] NOT NULL,
	[salesnum] [int] NULL,
	[POnum] [decimal](10, 0) NULL,
	[customer] [varchar](30) NULL,
	[ARdate] [datetime] NOT NULL,
	[source] [char](1) NULL,
	[risk] [char](1) NULL,
	[duedate] [datetime] NULL,
	[to_] [varchar](10) NULL,
	[problem] [varchar](max) NULL,
	[disposition] [varchar](10) NULL,
	[arperson] [varchar](20) NULL,
	[instruction] [varchar](max) NULL,
	[rework_by] [varchar](20) NULL,
	[rework_date] [datetime] NULL,
	[car] [bit] NULL,
	[detercause] [varchar](max) NULL,
	[causeprob] [varchar](max) NULL,
	[solution] [varchar](max) NULL,
	[solby] [varchar](20) NULL,
	[soldate] [datetime] NULL,
	[verifysol] [varchar](max) NULL,
	[veriby] [varchar](20) NULL,
	[veridate] [datetime] NULL,
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
 CONSTRAINT [PK_actionrequest] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Alloy_AlloyCategory]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Alloy_AlloyCategory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Alloy_AlloyCategory](
	[alloy] [char](12) NOT NULL,
	[AlloyCategoryID] [int] NOT NULL,
 CONSTRAINT [PK_Alloy_AlloyCategory] PRIMARY KEY CLUSTERED 
(
	[alloy] ASC,
	[AlloyCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Alloy_GL]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Alloy_GL]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Alloy_GL](
	[Alloy] [char](12) NOT NULL,
	[GL_Sales] [int] NOT NULL,
	[Machine_I] [char](1) NOT NULL,
	[GL_Inv] [int] NOT NULL,
	[GL_COGS] [int] NOT NULL,
 CONSTRAINT [PK_Alloy_GL-Alloy-Mach] PRIMARY KEY CLUSTERED 
(
	[Alloy] ASC,
	[Machine_I] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Alloy_Spec]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Alloy_Spec]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Alloy_Spec](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Alloy] [char](12) NOT NULL,
	[Forms] [varchar](25) NOT NULL,
	[MinThk] [decimal](7, 3) NOT NULL,
	[MaxThk] [decimal](7, 3) NOT NULL,
	[Group] [char](10) NOT NULL,
	[Spec] [char](30) NOT NULL,
	[Rev] [char](10) NULL,
	[Title] [varchar](255) NOT NULL,
	[Scope] [varchar](max) NOT NULL,
	[InActive] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AlloyCategory]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AlloyCategory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AlloyCategory](
	[AlloyCategoryID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[AlloyCategoryName] [varchar](25) NOT NULL,
 CONSTRAINT [PK_Table_1_1] PRIMARY KEY CLUSTERED 
(
	[AlloyCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Alloys]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Alloys]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Alloys](
	[alloy] [char](12) NOT NULL,
	[alloys] [char](12) NOT NULL,
 CONSTRAINT [PK_alloys] PRIMARY KEY NONCLUSTERED 
(
	[alloys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [AlloysAlloys]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Alloys]') AND name = N'AlloysAlloys')
CREATE CLUSTERED INDEX [AlloysAlloys] ON [dbo].[Alloys]
(
	[alloys] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlloySurcharge]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AlloySurcharge]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AlloySurcharge](
	[Co_Base] [decimal](9, 6) NOT NULL,
	[Co_Now] [decimal](9, 6) NOT NULL,
	[Co]  AS ([Co_Now]-[Co_Base]),
	[Cr_Base] [decimal](9, 6) NOT NULL,
	[Cr_Now] [decimal](9, 6) NOT NULL,
	[Cr]  AS ([Cr_Now]-[Cr_Base]),
	[Cu_Base] [decimal](9, 6) NOT NULL,
	[Cu_Now] [decimal](9, 6) NOT NULL,
	[Cu]  AS ([Cu_Now]-[Cu_Base]),
	[Fe_Base] [decimal](9, 6) NOT NULL,
	[Fe_Now] [decimal](9, 6) NOT NULL,
	[Fe]  AS ([Fe_Now]-[Fe_Base]),
	[Ni_Base] [decimal](9, 6) NOT NULL,
	[Ni_Now] [decimal](9, 6) NOT NULL,
	[Ni]  AS ([Ni_Now]-[Ni_Base]),
	[Mo_Base] [decimal](9, 6) NOT NULL,
	[Mo_Now] [decimal](9, 6) NOT NULL,
	[Mo]  AS ([Mo_Now]-[Mo_Base]),
	[Ti_Base] [decimal](9, 6) NOT NULL,
	[Ti_Now] [decimal](9, 6) NOT NULL,
	[Ti]  AS ([Ti_Now]-[Ti_Base]),
	[ID] [tinyint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
 CONSTRAINT [PK_AlloySurcharge] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AllQuotes_test]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AllQuotes_test]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AllQuotes_test](
	[Company] [char](30) NULL,
	[Name] [char](25) NULL,
	[Phone] [char](10) NULL,
	[Phone_Ext] [char](6) NULL,
	[Fax] [char](10) NULL,
	[Email] [varchar](60) NULL,
	[PO_num] [varchar](20) NULL,
	[Alloy] [char](12) NULL,
	[Form] [char](2) NULL,
	[CC] [char](1) NULL,
	[CL] [char](1) NULL,
	[Pieces] [int] NULL,
	[Thck] [float] NULL,
	[Sz2] [float] NULL,
	[Sz3] [float] NULL,
	[Weight] [float] NULL,
	[Descript] [varchar](50) NULL,
	[p_lb] [float] NULL,
	[p_pc] [float] NULL,
	[p_ft] [float] NULL,
	[Cuts] [float] NULL,
	[OtherFld] [char](10) NULL,
	[OtherP] [float] NULL,
	[LotP] [float] NULL,
	[LotCost] [float] NULL,
	[LeadTime] [varchar](15) NULL,
	[cWeight] [float] NULL,
	[cP_lb] [float] NULL,
	[cP_pc] [float] NULL,
	[cP_pcc] [float] NULL,
	[cthk] [char](10) NULL,
	[cLotP] [float] NULL,
	[cLotcP] [float] NULL,
	[cCut] [float] NULL,
	[cCutM] [float] NULL,
	[cKerfD] [decimal](10, 2) NULL,
	[InqDate] [datetime] NOT NULL,
	[InqNum] [int] NOT NULL,
	[InqNumP] [char](9) NOT NULL,
	[SalesP] [char](1) NOT NULL,
	[SalesNum] [int] NULL,
	[SOitem] [char](10) NULL,
	[item] [tinyint] NULL,
	[HPApo] [int] NULL,
	[POitem] [char](12) NULL,
	[SaleDate] [datetime] NULL,
	[ShipDate] [datetime] NULL,
	[Buyfrom] [varchar](15) NULL,
	[BuyCost] [float] NULL,
	[BuyFrom2] [varchar](15) NULL,
	[HPApo2] [int] NULL,
	[open_] [bit] NOT NULL,
	[Bracket] [tinyint] NULL,
	[CustID] [char](20) NULL,
	[QuoteMemo] [varchar](max) NULL,
	[Comments] [varchar](max) NULL,
	[CountryC] [varchar](10) NULL,
	[Country] [varchar](20) NULL,
	[Services] [bit] NULL,
	[RandLen] [bit] NULL,
	[Metric] [bit] NULL,
	[StartStock] [bit] NULL,
	[TN] [bit] NULL,
	[sz1orig] [varchar](20) NULL,
	[sz2orig] [varchar](20) NULL,
	[sz3orig] [varchar](20) NULL,
	[QuoteDate] [datetime] NULL,
	[Cover] [char](1) NULL,
	[Cut] [char](4) NULL,
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Line1] [char](60) NULL,
	[WO] [int] NULL,
	[CutOptions] [varchar](75) NULL,
	[Surcharge] [money] NULL,
	[Regret] [bit] NULL,
	[NoNoiseName] [char](30) NULL,
	[CutHr] [smallint] NULL,
	[Q_P] [money] NULL,
	[Q_QTY] [money] NULL,
	[Q_PU] [tinyint] NULL,
	[Q_Total] [money] NULL,
	[S_QTY] [money] NULL,
	[S_P] [money] NULL,
	[S_PU] [tinyint] NULL,
	[S_Total] [money] NULL,
	[StandardSize] [decimal](9, 3) NULL,
	[CustDisc] [decimal](3, 2) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Board_Full]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Board_Full]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Board_Full](
	[ID] [int] IDENTITY(1000,1) NOT NULL,
	[Who] [varchar](255) NOT NULL,
	[When] [smalldatetime] NOT NULL,
	[Reason] [nvarchar](max) NULL,
	[Active] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[BrokerLst_Detail_Inserted]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Detail_Inserted]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BrokerLst_Detail_Inserted](
	[ID] [int] IDENTITY(1000,1) NOT FOR REPLICATION NOT NULL,
	[Master_ID] [int] NOT NULL,
	[ID_Detail] [int] NOT NULL,
	[Who] [varchar](255) NOT NULL,
	[When] [datetime] NOT NULL,
	[OrderType] [char](10) NULL,
	[OrderNum] [char](13) NULL,
	[Verified] [bit] NULL,
	[VerifiedBy] [varchar](255) NULL,
 CONSTRAINT [PK_BrokerLst_Detail_Inserted] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[BrokerLst_Master_Inserted]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Master_Inserted]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BrokerLst_Master_Inserted](
	[ID] [int] IDENTITY(1000,1) NOT FOR REPLICATION NOT NULL,
	[Master_ID] [int] NOT NULL,
	[Who] [varchar](255) NOT NULL,
	[When] [datetime] NOT NULL,
	[Verified] [bit] NULL,
	[VerifiedBy] [varchar](255) NULL,
 CONSTRAINT [PK_BrokerLst_Master_Inserted] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[BrokerLst_Process_Detail]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Process_Detail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BrokerLst_Process_Detail](
	[Who] [nvarchar](256) NOT NULL,
	[What] [char](10) NULL,
	[When] [datetime] NOT NULL,
	[ID] [int] NOT NULL,
	[ID_Detail] [int] NULL,
	[ID_Detail_Process] [int] NULL,
	[ID_BrokerLst_Process_Detail] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[WO] [int] NULL,
	[SOitem] [char](10) NULL,
 CONSTRAINT [PK_BrokerLst_Process_Detail] PRIMARY KEY NONCLUSTERED 
(
	[ID_BrokerLst_Process_Detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Index [IX_BrokerLst_Process_Detail]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Process_Detail]') AND name = N'IX_BrokerLst_Process_Detail')
CREATE CLUSTERED INDEX [IX_BrokerLst_Process_Detail] ON [dbo].[BrokerLst_Process_Detail]
(
	[ID_Detail_Process] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BrokerLst_Process_Orig]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Process_Orig]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BrokerLst_Process_Orig](
	[SOitem] [char](10) NULL,
	[PO_item] [char](12) NULL,
	[SalesPerson] [char](20) NULL,
	[StartDate] [datetime] NOT NULL,
	[DueDate] [datetime] NULL,
	[Comment] [varchar](100) NOT NULL,
	[Process_ID] [char](10) NOT NULL,
	[Processor] [char](20) NULL,
	[AllowSub] [char](1) NULL,
	[PPc] [int] NULL,
	[PFT] [float] NULL,
	[PU] [tinyint] NULL,
	[QTY] [money] NULL,
	[Pounds] [decimal](9, 1) NULL,
	[ID_Detail] [int] NOT NULL,
	[ID_Detail_Process] [int] NOT NULL,
	[ReceivingID] [int] NOT NULL,
	[WO] [int] NULL,
	[QTY_Due] [money] NULL,
 CONSTRAINT [PK_BrokerLst_process_Orig_1] PRIMARY KEY NONCLUSTERED 
(
	[ID_Detail_Process] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[BrokerLst_Process_Recvd]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Process_Recvd]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BrokerLst_Process_Recvd](
	[PO_item] [char](12) NULL,
	[SalesPerson] [char](20) NULL,
	[StartDate] [datetime] NOT NULL,
	[DueDate] [datetime] NULL,
	[RecvDate] [datetime] NULL,
	[Comment] [varchar](100) NOT NULL,
	[Process_ID] [char](10) NOT NULL,
	[Processor] [char](20) NULL,
	[PU] [tinyint] NULL,
	[QTY] [money] NULL,
	[Ordered_QTY] [money] NULL,
	[Ordered_P] [money] NULL,
	[Pounds] [decimal](9, 1) NULL,
	[ID_Detail] [int] NOT NULL,
	[ID_Detail_Process] [int] NOT NULL,
	[ReceivingID] [int] NOT NULL,
	[WO_Detail] [int] NULL,
	[Prc_Form] [char](2) NULL,
	[Prc_PCs] [int] NULL,
	[Prc_Dim1] [numeric](10, 4) NULL,
	[Prc_Dim2] [money] NULL,
	[Prc_Dim3] [money] NULL,
 CONSTRAINT [PK_BrokerLst_Process_recvd] PRIMARY KEY CLUSTERED 
(
	[ID_Detail_Process] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Cert_Conf]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cert_Conf]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Cert_Conf](
	[Cert_Conf_No_ID] [int] NOT NULL,
	[SOitem] [char](10) NULL,
	[PO_Num] [char](20) NULL,
	[Alloy] [char](12) NULL,
	[Heat] [varchar](50) NULL,
	[Descript] [varchar](80) NULL,
	[Spec] [varchar](80) NULL,
	[PartNo] [varchar](100) NULL,
	[ID_Cert_Conf] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
 CONSTRAINT [PK_Cert_Conf] PRIMARY KEY CLUSTERED 
(
	[ID_Cert_Conf] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Cert_Conf_No]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cert_Conf_No]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Cert_Conf_No](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[company] [char](30) NULL,
	[addr1] [char](30) NULL,
	[addr2] [char](30) NULL,
	[city] [char](20) NULL,
	[st] [char](2) NULL,
	[zip] [char](12) NULL,
	[country] [char](15) NULL,
	[CoC] [bit] NULL,
	[MFC] [bit] NULL,
	[NWR] [bit] NULL,
	[LLMA] [bit] NULL,
	[FFF] [bit] NULL,
	[DFARS] [bit] NULL,
	[MISC] [varchar](8000) NULL,
	[Who] [varchar](255) NOT NULL,
	[When] [datetime] NOT NULL,
	[Signed] [bit] NULL,
	[Signature] [varchar](10) NULL,
	[SignUser] [varchar](50) NULL,
	[SignDate] [datetime] NULL,
 CONSTRAINT [PK_Cert_Conf_No] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ConditionCodeAdjust]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConditionCodeAdjust]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ConditionCodeAdjust](
	[A] [smallmoney] NOT NULL,
	[B] [smallmoney] NOT NULL,
	[C] [smallmoney] NOT NULL,
	[D] [smallmoney] NOT NULL,
	[E] [smallmoney] NOT NULL,
	[F] [smallmoney] NOT NULL,
	[S] [smallmoney] NOT NULL,
	[T] [smallmoney] NOT NULL,
	[U] [smallmoney] NOT NULL,
	[V] [smallmoney] NOT NULL,
	[W] [smallmoney] NOT NULL,
	[X] [smallmoney] NOT NULL,
	[Y] [smallmoney] NOT NULL,
	[ID] [tinyint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
 CONSTRAINT [PK_ConditionCodeAdjust] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Countries]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Countries](
	[CountryCode] [char](2) NOT NULL,
	[CountryDesc] [varchar](60) NOT NULL,
	[Restricted] [bit] NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[CountryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CreditCd]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreditCd]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CreditCd](
	[salesnum] [int] NOT NULL,
	[holdername] [varchar](50) NOT NULL,
	[cardtype] [varchar](10) NOT NULL,
	[CardNo1] [numeric](4, 0) NULL,
	[CardNo4] [numeric](4, 0) NULL,
	[CCV] [numeric](4, 0) NULL,
	[ExpireDD] [numeric](2, 0) NULL,
	[ExpireMM] [numeric](2, 0) NULL,
	[ExpireYYYY] [numeric](4, 0) NULL,
	[soldcode] [decimal](10, 0) NULL,
	[sale] [smallmoney] NULL,
	[shipins] [smallmoney] NULL,
	[totalamt] [smallmoney] NULL,
	[notes] [varchar](100) NULL,
	[authno] [char](20) NULL,
	[authdate] [datetime] NULL,
	[Printed] [tinyint] NULL,
	[WhoPrinted] [varchar](256) NULL,
	[WhoAdded] [varchar](256) NULL,
 CONSTRAINT [PK_CreditCd] PRIMARY KEY CLUSTERED 
(
	[salesnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Object:  Table [dbo].[Customer_Discount]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer_Discount]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Customer_Discount](
	[CustomerID] [char](20) NOT NULL,
	[Company] [varchar](50) NULL,
	[IND_CODES] [varchar](50) NULL,
	[Max] [float] NULL,
	[Expect] [float] NULL,
	[2016 Est] [float] NULL,
	[2016 (down)] [float] NULL,
	[Pct dwn] [float] NULL,
	[Disc%] [float] NULL,
	[DISC$] [float] NULL,
	[Revenue$] [float] NULL,
	[Average] [int] NULL,
	[2016 Est-1] [int] NULL,
	[16 Chg] [float] NULL,
	[Last order] [smallint] NULL,
	[LastUpdate] [date] NULL,
 CONSTRAINT [PK_Customer_Discount] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CUSTOMER_LIST]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CUSTOMER_LIST]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CUSTOMER_LIST](
	[CustomerID] [char](20) NULL,
	[Sage50ID] [char](20) NULL,
	[CustomerName] [varchar](100) NULL,
	[Inactive] [bit] NULL,
	[Contact] [varchar](100) NULL,
	[Addr1] [varchar](100) NULL,
	[Addr2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[St] [varchar](50) NULL,
	[Zip] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[Type] [char](1) NULL,
	[Telephone] [varchar](255) NULL,
	[Fax] [varchar](255) NULL,
	[PricingLevel] [int] NULL,
	[StandTerms] [bit] NULL,
	[CODTerms] [bit] NULL,
	[Prepaid] [bit] NULL,
	[TermsType] [varchar](10) NULL,
	[DueDays] [smallint] NULL,
	[CreditLimit] [money] NULL,
	[CREDIT_INFO] [varchar](255) NULL,
	[MISC_INFO] [varchar](255) NULL,
	[CustomerSince] [datetime] NOT NULL,
	[LastInvoice] [datetime] NULL,
	[CurrentBalance] [money] NULL,
	[CreditStatus] [nchar](10) NULL,
	[Resales_tax] [varchar](50) NULL,
	[NoNoiseName] [varchar](100) NULL,
	[dtDATE] [smalldatetime] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Customer_List_call]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer_List_call]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Customer_List_call](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CustomerID] [char](20) NOT NULL,
	[Date] [smalldatetime] NOT NULL,
	[Who] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Customer_List_call] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Customer_List_Notes]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer_List_Notes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Customer_List_Notes](
	[CustomerID] [char](20) NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[IND_type] [int] NULL,
 CONSTRAINT [PK_Customer_List_Notes] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DDLEvents]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DDLEvents]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DDLEvents](
	[EventDate] [datetime] NOT NULL,
	[EventType] [nvarchar](64) NULL,
	[EventDDL] [nvarchar](max) NULL,
	[EventXML] [xml] NULL,
	[DatabaseName] [nvarchar](255) NULL,
	[SchemaName] [nvarchar](255) NULL,
	[ObjectName] [nvarchar](255) NULL,
	[HostName] [varchar](64) NULL,
	[IPAddress] [varchar](32) NULL,
	[ProgramName] [nvarchar](255) NULL,
	[LoginName] [nvarchar](255) NULL,
	[ServerName] [nvarchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[District]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[District]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[District](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[District] [nchar](1) NOT NULL,
	[State] [nchar](2) NOT NULL,
 CONSTRAINT [PK_District] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_District-State] UNIQUE CLUSTERED 
(
	[State] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[District_SalesP]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[District_SalesP]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[District_SalesP](
	[ST] [nchar](2) NOT NULL,
	[SalesP] [nchar](1) NOT NULL,
 CONSTRAINT [PK_District_SalesP] PRIMARY KEY CLUSTERED 
(
	[ST] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[District_St]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[District_St]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[District_St](
	[District] [char](1) NOT NULL,
	[State] [char](2) NOT NULL,
 CONSTRAINT [PK_District_St] PRIMARY KEY NONCLUSTERED 
(
	[State] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Draw_Dies]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Draw_Dies]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Draw_Dies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Dia] [decimal](5, 4) NOT NULL,
	[Angle] [tinyint] NULL,
	[NIB] [nchar](10) NULL,
	[CaseDia] [decimal](4, 3) NULL,
	[Height] [decimal](4, 3) NULL,
	[Descr] [varchar](max) NULL,
	[active] [bit] NULL,
	[worn] [bit] NULL,
	[POitem] [char](12) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Index [IX_Draw_Dies]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Draw_Dies]') AND name = N'IX_Draw_Dies')
CREATE CLUSTERED INDEX [IX_Draw_Dies] ON [dbo].[Draw_Dies]
(
	[Dia] ASC,
	[Angle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Draw_log_Detail]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Draw_log_Detail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Draw_log_Detail](
	[ID] [int] NOT NULL,
	[Label] [varchar](25) NOT NULL,
	[Data] [int] NOT NULL,
	[POitem] [char](12) NULL,
	[ID2] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
 CONSTRAINT [PK_Draw_log_Detail] PRIMARY KEY CLUSTERED 
(
	[ID2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Draw_log_old]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Draw_log_old]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Draw_log_old](
	[alloyname] [char](12) NULL,
	[heat] [char](50) NULL,
	[lot] [int] NOT NULL,
	[date] [datetime] NULL,
	[form] [char](2) NULL,
	[sPiece] [decimal](5, 1) NULL,
	[sSize] [decimal](9, 3) NULL,
	[sWeight] [decimal](8, 1) NULL,
	[DrawSize] [decimal](9, 3) NULL,
	[fPiece] [decimal](5, 0) NULL,
	[fSize] [decimal](9, 3) NULL,
	[fWeight] [decimal](8, 1) NULL,
	[Condition] [char](10) NULL,
	[htreat] [char](16) NULL,
	[coldwork] [decimal](3, 3) NULL,
	[salesnum] [int] NULL,
	[itemSO] [decimal](2, 0) NULL,
	[SOitem] [char](10) NULL,
	[spec] [char](50) NULL,
	[PO] [varchar](50) NULL,
	[OvenTemp] [smallint] NULL,
	[notes] [varchar](max) NULL,
	[Tensile] [decimal](6, 0) NULL,
	[Yield] [decimal](6, 0) NULL,
	[Elongation] [decimal](4, 1) NULL,
	[Red_Area] [decimal](4, 1) NULL,
	[Rockwell] [char](4) NULL,
	[BHN] [decimal](3, 0) NULL,
	[Tensile2] [decimal](6, 0) NULL,
	[Yield2] [decimal](6, 0) NULL,
	[Elongation2] [decimal](4, 1) NULL,
	[Red_Area2] [decimal](4, 1) NULL,
	[Rockwell2] [char](4) NULL,
	[BHN2] [decimal](3, 0) NULL,
	[Tensile3] [decimal](6, 0) NULL,
	[Yield3] [decimal](6, 0) NULL,
	[Elongation3] [decimal](4, 1) NULL,
	[Red_Area3] [decimal](4, 1) NULL,
	[Rockwell3] [char](4) NULL,
	[BHN3] [decimal](3, 0) NULL,
	[testpo] [int] NULL,
	[testPoItem] [char](12) NULL,
	[testItemPO] [decimal](2, 0) NULL,
	[testsent] [datetime] NULL,
	[lab] [char](12) NULL,
	[passed] [bit] NULL,
	[CustomerMat] [bit] NULL,
	[minutes] [decimal](4, 0) NULL,
	[laborp] [decimal](8, 2) NULL,
	[HTrockwell] [char](4) NULL,
	[HTBHN] [decimal](3, 0) NULL,
	[ChartData] [bit] NULL,
	[SrvcPO] [int] NULL,
	[LMA_Practice] [varchar](7) NULL,
	[LMA_Procedure] [varchar](12) NULL,
	[ID] [int] IDENTITY(1000,1) NOT FOR REPLICATION NOT NULL,
	[WO] [int] NULL,
	[WO_Detail] [int] NULL,
	[Machine] [char](1) NULL,
	[Oper] [varchar](10) NULL,
	[ProjID] [int] NULL,
	[AC_ID] [int] NULL,
	[AC_cmplt] [bit] NULL,
	[WhoInsert] [varchar](254) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Draw_Sched]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Draw_Sched]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Draw_Sched](
	[ID] [int] IDENTITY(1000,1) NOT NULL,
	[Machine] [nchar](10) NULL,
	[Lot] [int] NULL,
	[StartDia] [decimal](6, 3) NULL,
	[Dia1] [decimal](6, 3) NULL,
	[CW1] [decimal](3, 1) NULL,
	[Ann1] [bit] NOT NULL,
	[Ang1] [tinyint] NULL,
	[Dia2] [decimal](6, 3) NULL,
	[CW2] [decimal](3, 1) NULL,
	[Ann2] [bit] NOT NULL,
	[Ang2] [tinyint] NULL,
	[Dia3] [decimal](6, 3) NULL,
	[CW3] [decimal](3, 1) NULL,
	[Ann3] [bit] NOT NULL,
	[Ang3] [tinyint] NULL,
	[Dia4] [decimal](6, 3) NULL,
	[CW4] [decimal](3, 1) NULL,
	[Ann4] [bit] NOT NULL,
	[Ang4] [tinyint] NULL,
	[Dia5] [decimal](6, 3) NULL,
	[CW5] [decimal](3, 1) NULL,
	[Ann5] [bit] NOT NULL,
	[Ang5] [tinyint] NULL,
	[Dia6] [decimal](6, 3) NULL,
	[CW6] [decimal](3, 1) NULL,
	[Ann6] [bit] NOT NULL,
	[Ang6] [tinyint] NULL,
	[Dia7] [decimal](6, 3) NULL,
	[CW7] [decimal](3, 1) NULL,
	[Ann7] [bit] NOT NULL,
	[Ang7] [tinyint] NULL,
	[Dia8] [decimal](6, 3) NULL,
	[CW8] [decimal](3, 1) NULL,
	[Ann8] [bit] NOT NULL,
	[Ang8] [tinyint] NULL,
	[Dia9] [decimal](6, 3) NULL,
	[CW9] [decimal](3, 1) NULL,
	[Ann9] [bit] NOT NULL,
	[Ang9] [tinyint] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[EmailService_Credentials]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmailService_Credentials]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EmailService_Credentials](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](254) NOT NULL,
	[Password] [varchar](max) NOT NULL,
	[ReceiveMailServer] [varchar](254) NOT NULL,
	[SendMailServer] [varchar](254) NOT NULL,
	[ServiceTypeId] [int] NOT NULL,
	[Port] [int] NOT NULL,
	[SSL] [bit] NOT NULL,
	[CheckFolder] [varchar](50) NOT NULL,
	[ProcessedFolder] [varchar](50) NOT NULL,
	[Default Config] [bit] NOT NULL,
	[SendPort] [int] NOT NULL,
	[SendSSL] [bit] NOT NULL,
	[SendAuthenticate] [bit] NOT NULL,
 CONSTRAINT [PK_EmailService_Credential] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[EmailService_Email]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmailService_Email]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EmailService_Email](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[EmailId] [varchar](max) NOT NULL,
	[EmailFrom] [varchar](max) NULL,
	[EmailTo] [varchar](max) NULL,
	[Subject] [varchar](max) NULL,
	[EmailBody] [varchar](max) NULL,
	[ReceivedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_EmailService_Email] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[EmailService_Email_Log]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmailService_Email_Log]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EmailService_Email_Log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[EmailId] [varchar](max) NOT NULL,
	[EmailFrom] [varchar](254) NOT NULL,
	[ForwardToId] [int] NOT NULL,
	[ForwardTime] [datetime] NOT NULL,
	[EmailAddressedTo] [varchar](max) NOT NULL,
	[RepeatEmailSender] [bit] NOT NULL,
 CONSTRAINT [PK_EmailService_Email_Log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[EmailService_EmailMatchExceptions]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmailService_EmailMatchExceptions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EmailService_EmailMatchExceptions](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[GlobalDomain] [bit] NOT NULL,
	[Email] [varchar](254) NULL,
	[Domain] [varchar](254) NULL,
 CONSTRAINT [PK_EmailService_EmailMatchExceptions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[EmailService_SalesUsers]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmailService_SalesUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EmailService_SalesUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Firstname] [varchar](25) NOT NULL,
	[Lastname] [varchar](25) NOT NULL,
	[EmailAddress] [varchar](254) NOT NULL,
	[MarkAbsent] [bit] NOT NULL,
	[Note] [varchar](max) NULL,
	[SP_Initial] [varchar](30) NOT NULL,
	[IsActiveSales] [bit] NOT NULL,
	[EmailService_SalesUsers_Schedule] [int] NOT NULL,
	[ManualSettings] [bit] NOT NULL,
	[EmailWeight] [smallint] NOT NULL,
	[ClockedIn]  AS ([dbo].[f_Get_EmailService_User_ClockedIn]([Firstname],[Lastname])),
 CONSTRAINT [PK_EmailService_SalesUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[EmailService_SalesUsers_Schedule]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmailService_SalesUsers_Schedule]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EmailService_SalesUsers_Schedule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Schedule Description] [varchar](50) NOT NULL,
	[WorkDay Open] [time](7) NOT NULL,
	[WorkDay Close] [time](7) NOT NULL,
 CONSTRAINT [PK_EmailService_SalesUsers_Schedule1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[EmailService_Type]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmailService_Type]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EmailService_Type](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ServiceType] [varchar](10) NOT NULL,
 CONSTRAINT [PK_EmailService_Type] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[EquipmentMachinePartAssociation]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EquipmentMachinePartAssociation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EquipmentMachinePartAssociation](
	[Part] [nvarchar](50) NOT NULL,
	[Machine] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EquipmentMachinePartAssociation] PRIMARY KEY CLUSTERED 
(
	[Part] ASC,
	[Machine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[EquipmentMachineType]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EquipmentMachineType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EquipmentMachineType](
	[Machine] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EquipmentMachineType] PRIMARY KEY CLUSTERED 
(
	[Machine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[EquipmentPartHours]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EquipmentPartHours]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EquipmentPartHours](
	[Part] [nvarchar](50) NOT NULL,
	[Identifier] [int] NOT NULL,
	[Machine] [nvarchar](50) NOT NULL,
	[MIdentifier] [int] NOT NULL,
 CONSTRAINT [PK_EquipmentPartHours] PRIMARY KEY CLUSTERED 
(
	[Part] ASC,
	[Identifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[EquipmentPartItems]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EquipmentPartItems]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EquipmentPartItems](
	[Part] [nvarchar](50) NOT NULL,
	[Identifier] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Cost] [money] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_WaterJetFilterItems] PRIMARY KEY CLUSTERED 
(
	[Part] ASC,
	[Identifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[EquipmentParts]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EquipmentParts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EquipmentParts](
	[Part] [nvarchar](50) NOT NULL,
	[PartNumber] [nvarchar](50) NOT NULL,
	[MachineAssociated] [bit] NOT NULL,
	[Swapable] [bit] NOT NULL,
 CONSTRAINT [PK_WaterJetFilters_1] PRIMARY KEY CLUSTERED 
(
	[Part] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[EquipmentPartSwapDates]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EquipmentPartSwapDates]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EquipmentPartSwapDates](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Part] [nvarchar](50) NOT NULL,
	[Identifier] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_EquipmentPartSwapDates_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ErrorLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ErrorLog](
	[ErrorNumber] [int] NULL,
	[ErrorSeverity] [int] NULL,
	[ErrorState] [int] NULL,
	[ErrorProcedure] [nvarchar](128) NULL,
	[ErrorLine] [int] NULL,
	[ErrorMessage] [varchar](max) NULL,
	[EventID] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[EventDate] [smalldatetime] NULL,
 CONSTRAINT [PK__ErrorLog__097532CF] PRIMARY KEY CLUSTERED 
(
	[EventID] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Errors]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Errors]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Errors](
	[nError] [int] NULL,
	[mess1] [varchar](254) NOT NULL,
	[cprogram] [varchar](254) NULL,
	[nlineno] [int] NULL,
	[ErrorDate] [datetime] NOT NULL,
	[MACHINE] [varchar](254) NULL,
	[Revision] [varchar](254) NULL,
	[Memo1] [varchar](max) NULL,
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
 CONSTRAINT [PK_Errors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[GFM_DieSets]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GFM_DieSets]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GFM_DieSets](
	[DieID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[DieStamp] [varchar](50) NOT NULL,
	[Who] [varchar](50) NOT NULL,
	[When] [datetime] NOT NULL,
	[DieAlloy] [varchar](50) NOT NULL,
	[Decommissioned] [bit] NOT NULL,
	[OriginalPurchaseOrder] [char](12) NULL,
	[Die Set]  AS ((CONVERT([varchar],datepart(year,[When]))+'-')+[DieAlloy]),
	[DieHeight]  AS ([dbo].[f_Get_GFM_DieHeight]([DieID])),
	[MinimumDiameter]  AS ([dbo].[f_Calc_GFM_MinDiameter]([DieID])),
	[MaximumDiameter]  AS ([dbo].[f_Calc_GFM_MaxDiameter]([dbo].[f_Calc_GFM_MinDiameter]([DieID]))),
 CONSTRAINT [PK_GFM_DieSets] PRIMARY KEY CLUSTERED 
(
	[DieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[GFM_DieSets_Condition]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_Condition]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GFM_DieSets_Condition](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[DieID] [uniqueidentifier] NOT NULL,
	[When] [datetime] NOT NULL,
	[Condition] [tinyint] NOT NULL,
	[Who] [varchar](50) NOT NULL,
 CONSTRAINT [PK_GFM_DieSets_Condition_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[GFM_DieSets_Condition_Definition]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_Condition_Definition]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GFM_DieSets_Condition_Definition](
	[ConditionCode] [tinyint] IDENTITY(0,1) NOT NULL,
	[Definition] [varchar](50) NOT NULL,
 CONSTRAINT [PK_GFM_DieSets_Condition_Definition] PRIMARY KEY CLUSTERED 
(
	[ConditionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[GFM_DieSets_Height]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_Height]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GFM_DieSets_Height](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[DieID] [uniqueidentifier] NOT NULL,
	[When] [datetime] NOT NULL,
	[DieHeight] [decimal](5, 3) NOT NULL,
	[Who] [varchar](50) NOT NULL,
 CONSTRAINT [PK_GFM_DieSets_Height_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[GFM_DieSets_Inspection]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_Inspection]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GFM_DieSets_Inspection](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[DieID] [uniqueidentifier] NOT NULL,
	[InspectionDate] [datetime] NOT NULL,
	[When] [datetime] NOT NULL,
	[Who] [varchar](50) NOT NULL,
	[ConditionID] [uniqueidentifier] NOT NULL,
	[HeightID] [uniqueidentifier] NOT NULL,
	[LandingID] [uniqueidentifier] NOT NULL,
	[Notes] [text] NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_GFM_DieSets_Inspection] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[GFM_DieSets_Inspection_Employees]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_Inspection_Employees]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GFM_DieSets_Inspection_Employees](
	[InspectionId] [uniqueidentifier] NOT NULL,
	[EmployeeId] [varchar](20) NOT NULL,
 CONSTRAINT [PK_GFM_DieSets_Inspection_Employees] PRIMARY KEY CLUSTERED 
(
	[InspectionId] ASC,
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[GFM_DieSets_LandingSize]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_LandingSize]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GFM_DieSets_LandingSize](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[DieID] [uniqueidentifier] NOT NULL,
	[When] [datetime] NOT NULL,
	[LandingSize] [decimal](5, 3) NOT NULL,
	[Who] [varchar](50) NOT NULL,
 CONSTRAINT [PK_GFM_DieSets_LandingSize_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[GFM_DieSets_Machine_Type_Map]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_Machine_Type_Map]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GFM_DieSets_Machine_Type_Map](
	[DieID] [uniqueidentifier] NOT NULL,
	[MTypeId] [uniqueidentifier] NOT NULL,
	[When] [datetime] NOT NULL,
	[Who] [varchar](50) NOT NULL,
	[deleted] [bit] NOT NULL,
 CONSTRAINT [PK_GFM_DieSet_Machine_Type_Map] PRIMARY KEY CLUSTERED 
(
	[DieID] ASC,
	[MTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[GFM_DieSets_Repair]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_Repair]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GFM_DieSets_Repair](
	[RepairID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[RepairDate] [datetime] NOT NULL,
	[DieID] [uniqueidentifier] NOT NULL,
	[DieHeight] [uniqueidentifier] NOT NULL,
	[LandingSize] [uniqueidentifier] NOT NULL,
	[PreGrindTime] [int] NOT NULL,
	[WeldTime] [int] NOT NULL,
	[FinishGrindTime] [int] NOT NULL,
	[EstWeldRodWeight] [float] NULL,
	[Welder] [varchar](50) NOT NULL,
	[When] [datetime] NOT NULL,
	[Who] [varchar](50) NOT NULL,
	[SO] [char](10) NULL,
	[Notes] [text] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[TotalTime]  AS (([PreGrindTime]+[WeldTime])+[FinishGrindTime]),
 CONSTRAINT [PK_GFM_DieSets_Repair] PRIMARY KEY CLUSTERED 
(
	[RepairID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[GFM_DieSets_RunTimeLogs]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_RunTimeLogs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GFM_DieSets_RunTimeLogs](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[DieID] [uniqueidentifier] NOT NULL,
	[Lot] [int] NULL,
	[Date] [datetime] NOT NULL,
	[Who] [varchar](50) NOT NULL,
	[TimeIN] [datetime] NOT NULL,
	[TimeOUT] [datetime] NULL,
	[SO] [char](10) NULL,
	[WO] [int] NULL,
	[Type] [smallint] NOT NULL,
	[WorkLevel] [smallint] NOT NULL,
	[Notes] [text] NOT NULL,
	[StartingCondition] [uniqueidentifier] NOT NULL,
	[EndingCondition] [uniqueidentifier] NULL,
	[OTTrackID] [int] NULL,
	[RunTime]  AS (isnull(datediff(minute,[TimeIN],[TimeOUT]),(0))),
	[OTTimeID] [int] NULL,
 CONSTRAINT [PK_GFM_DieSets_RunTimeLogs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[GFM_DieSets_Types]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_Types]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GFM_DieSets_Types](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Abreviation] [varchar](3) NOT NULL,
	[Description] [varchar](25) NOT NULL,
 CONSTRAINT [PK_GFM_DieSets_Types] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[GFM_DieSets_WorkLevel]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_WorkLevel]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GFM_DieSets_WorkLevel](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Abreviation] [char](3) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_GFM_DieSets_WorkLevel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[GFM_Hard_CMS]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GFM_Hard_CMS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GFM_Hard_CMS](
	[GFM_ID] [int] NOT NULL,
	[Hard1C] [char](10) NULL,
	[Hard1M] [char](10) NULL,
	[Hard1S] [char](10) NULL,
	[Hard2C] [char](10) NULL,
	[Hard2M] [char](10) NULL,
	[Hard2S] [char](10) NULL,
	[Hard3C] [char](10) NULL,
	[Hard3M] [char](10) NULL,
	[Hard3S] [char](10) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[GFM_Machines]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GFM_Machines]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GFM_Machines](
	[GFMId] [smallint] IDENTITY(1,1) NOT NULL,
	[GFM] [varchar](1) NOT NULL,
	[OpeningHeight] [decimal](6, 4) NOT NULL,
 CONSTRAINT [PK_GFM_Machines] PRIMARY KEY CLUSTERED 
(
	[GFMId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[GFM_Machines_Operational_CalcValues]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GFM_Machines_Operational_CalcValues]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GFM_Machines_Operational_CalcValues](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Operational_Min_Size] [decimal](6, 4) NOT NULL,
	[Operational_Max_Size] [decimal](6, 4) NOT NULL,
	[Operational_Range] [decimal](6, 4) NOT NULL,
 CONSTRAINT [PK_GFM_Machines_Operational_CalcValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[GFM_Machines_Type_Map]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GFM_Machines_Type_Map]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GFM_Machines_Type_Map](
	[MTMapID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[GFMId] [smallint] NOT NULL,
	[GFM_DieSets_TypeId] [smallint] NOT NULL,
	[Disabled] [bit] NOT NULL,
 CONSTRAINT [PK_GFM_Machines_Type_Map] PRIMARY KEY CLUSTERED 
(
	[MTMapID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[GFMlog_Detail]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GFMlog_Detail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GFMlog_Detail](
	[ID] [int] NOT NULL,
	[Label] [varchar](25) NOT NULL,
	[Data] [int] NOT NULL,
	[POitem] [char](12) NULL,
	[ID2] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
 CONSTRAINT [PK_GFMLog_Detail] PRIMARY KEY CLUSTERED 
(
	[ID2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[GFMlog_Stats]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GFMlog_Stats]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GFMlog_Stats](
	[ID] [int] NOT NULL,
	[Lot] [int] NULL,
	[Date] [date] NULL,
	[sSize] [decimal](8, 3) NULL,
	[WorkSize] [decimal](8, 3) NULL,
	[fSize] [decimal](8, 3) NULL,
	[Tensile] [int] NULL,
	[Tensile2] [int] NULL,
	[Tensile3] [int] NULL,
	[Tensile4] [int] NULL,
	[UTS_Min] [int] NULL,
	[UTS_Max] [int] NULL,
	[UTS_Spread] [int] NULL,
	[UTS_Avg] [int] NULL,
	[UTS_STDV] [int] NULL,
	[UTS_VAR] [int] NULL,
	[Yield] [int] NULL,
	[Yield2] [int] NULL,
	[Yield3] [int] NULL,
	[Yeild4] [int] NULL,
	[YLD_Min] [int] NULL,
	[YLD_Max] [int] NULL,
	[YLD_Spread] [int] NULL,
	[YLD_Avg] [int] NULL,
	[YLD_STDV] [int] NULL,
	[YLD_VAR] [int] NULL,
	[Elongation] [tinyint] NULL,
	[Elongation2] [tinyint] NULL,
	[Elongation3] [tinyint] NULL,
	[Elongation4] [tinyint] NULL,
	[EL_Min] [tinyint] NULL,
	[EL_Max] [tinyint] NULL,
	[EL_Spread] [tinyint] NULL,
	[ELAvg] [tinyint] NULL,
	[EL_STDV] [tinyint] NULL,
	[EL_VAR] [tinyint] NULL,
	[Red_Area] [tinyint] NULL,
	[Red_Area2] [tinyint] NULL,
	[Red_Area3] [tinyint] NULL,
	[Red_Area4] [tinyint] NULL,
	[RA_Min] [tinyint] NULL,
	[RA_Max] [tinyint] NULL,
	[RA_Spread] [tinyint] NULL,
	[RA_AVG] [tinyint] NULL,
	[RA_STDV] [tinyint] NULL,
	[RA_VAR] [tinyint] NULL,
	[SOitem] [char](10) NULL,
 CONSTRAINT [PK_GFMlog_Stats] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Hardness]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hardness]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hardness](
	[ID] [int] NOT NULL,
	[rc] [numeric](2, 0) NOT NULL,
	[rb] [numeric](2, 0) NOT NULL,
	[ra] [numeric](4, 1) NOT NULL,
	[rd] [numeric](4, 1) NOT NULL,
	[vickers] [numeric](3, 0) NOT NULL,
	[knoop] [numeric](3, 0) NOT NULL,
	[brinell] [numeric](3, 0) NOT NULL,
	[tensile] [numeric](3, 0) NOT NULL,
 CONSTRAINT [PK_hardness] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Hardwood]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hardwood]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hardwood](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[country] [char](15) NOT NULL,
	[abv] [char](2) NOT NULL,
	[summary] [varchar](max) NOT NULL,
	[webpage] [char](250) NOT NULL,
	[printout] [varchar](max) NOT NULL,
	[inactive] [bit] NOT NULL,
 CONSTRAINT [PK_hardwood] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[HubSpot]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HubSpot]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HubSpot](
	[Domain] [nvarchar](50) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[city] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[Industry] [nvarchar](50) NULL,
	[phonenumber] [nvarchar](50) NULL,
	[zipcode] [nvarchar](50) NULL,
	[state] [nvarchar](50) NULL,
	[address] [nvarchar](150) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[IND_Type]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IND_Type]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IND_Type](
	[Number] [int] NOT NULL,
	[Industry] [char](20) NOT NULL,
 CONSTRAINT [PK_IND_Type] PRIMARY KEY CLUSTERED 
(
	[Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Invoice_DEL]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Invoice_DEL]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Invoice_DEL](
	[ID] [int] IDENTITY(1000,1) NOT FOR REPLICATION NOT NULL,
	[Invoice] [int] NOT NULL,
	[InvoiceDate] [smalldatetime] NULL,
	[SOitem] [char](10) NOT NULL,
	[CustomerID] [varchar](20) NOT NULL,
	[CustomerName] [varchar](50) NULL,
	[Customer_PO] [varchar](50) NULL,
	[Ship_Via] [varchar](50) NULL,
	[Disc_Amount] [money] NULL,
	[Sales_Rep] [varchar](50) NULL,
	[AR_Amount] [money] NULL,
	[Invoice_Note] [varchar](50) NULL,
	[Amount] [money] NULL,
	[ItemTot] [tinyint] NULL,
	[Item] [tinyint] NULL,
	[Quantity] [int] NULL,
	[GL_Account] [int] NULL,
	[UnitPrice] [money] NULL,
	[Trans_Period] [tinyint] NULL,
	[Trans_No] [smallint] NULL,
	[ReturnAuth] [varchar](50) NULL,
	[Description] [varchar](max) NULL,
	[Ship_Date] [smalldatetime] NULL,
	[Date_Due] [smalldatetime] NULL,
	[Reconciled] [bit] NULL,
	[Sales_Detail_ID] [int] NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[JobPasses]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[JobPasses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[JobPasses](
	[PassId] [int] IDENTITY(1,1) NOT NULL,
	[MachineId] [int] NOT NULL,
	[OperatorPrincipleName] [varchar](255) NOT NULL,
	[StartingMaterialOuterDiameter] [numeric](5, 3) NOT NULL,
	[FinishedMaterialOuterDiameter] [numeric](5, 3) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[FinishDate] [datetime] NOT NULL,
	[propertiesJSON] [varchar](255) NULL,
 CONSTRAINT [PK_JobPasses] PRIMARY KEY CLUSTERED 
(
	[PassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Jobs]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Jobs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Jobs](
	[JobId] [int] IDENTITY(1,1) NOT NULL,
	[WorkOrderDetailId] [int] NOT NULL,
	[RouterId] [int] NOT NULL,
	[StartingMaterialOuterDiameter] [numeric](5, 3) NOT NULL,
	[GoalMaterialOuterDiameter] [numeric](5, 3) NOT NULL,
	[StartingMaterialHeat] [varchar](50) NOT NULL,
	[StartingMaterialLot] [int] NOT NULL,
 CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Lading]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Lading]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Lading](
	[packingsli] [decimal](10, 0) NOT NULL,
	[pieces] [decimal](10, 0) NULL,
	[descript] [char](80) NULL,
	[Box_Size] [char](40) NULL,
	[nmfc] [decimal](15, 0) NULL,
	[classrate] [char](4) NULL,
	[weight] [decimal](9, 1) NULL,
	[Kg] [bit] NULL,
	[decvalue] [decimal](9, 2) NULL,
	[bil3code] [decimal](10, 0) NULL,
	[frtcharges] [char](10) NULL,
	[dutytax] [char](11) NULL,
	[cod] [bit] NULL,
	[codfrtcoll] [bit] NULL,
	[codcertchk] [bit] NULL,
	[ID_Lading] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
 CONSTRAINT [PK_lading] PRIMARY KEY CLUSTERED 
(
	[ID_Lading] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LMA_Log]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LMA_Log]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LMA_Log](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Lot_Type] [char](1) NOT NULL,
	[Lot] [int] NOT NULL,
	[LotID] [int] NOT NULL,
	[LMA_Practice] [varchar](7) NULL,
	[LMA_Procedure] [varchar](12) NULL,
	[ESR] [bit] NOT NULL,
	[Pounds] [int] NOT NULL,
	[AddTesting] [money] NOT NULL,
	[MicroTest] [char](10) NULL,
 CONSTRAINT [PK_LMA_Log] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Log_Charts]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Log_Charts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Log_Charts](
	[ID_Log_Charts] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[WO_Detail] [int] NULL,
	[GFMlog_ID] [int] NULL,
	[Draw_log_ID] [int] NULL,
	[LakeErie_log_ID] [int] NULL,
	[Roll_log_ID] [int] NULL,
	[Swage_Log_ID] [int] NULL,
	[Wire_log_ID] [int] NULL,
	[File_Name] [varchar](254) NULL,
	[Upload_DateTime] [datetime] NULL,
	[Uploaded_By] [varchar](254) NULL,
	[Version] [varchar](254) NULL,
	[Archived] [bit] NULL,
	[Archive_Reason] [varchar](254) NULL,
 CONSTRAINT [PK_Log_Charts] PRIMARY KEY CLUSTERED 
(
	[ID_Log_Charts] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Mach_Detail]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mach_Detail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Mach_Detail](
	[ID_Detail] [int] IDENTITY(1000,1) NOT FOR REPLICATION NOT NULL,
	[Mach_Shop_ID] [int] NOT NULL,
	[SOitem] [char](10) NOT NULL,
	[SalesNum] [int] NULL,
	[ProcNum] [smallint] NOT NULL,
	[Machine] [char](10) NULL,
	[ScanName] [char](10) NULL,
	[Start] [bit] NULL,
	[Start_Form] [char](2) NULL,
	[Start_PC] [int] NULL,
	[Start_Sz1] [money] NULL,
	[Start_Sz2] [money] NULL,
	[Start_Sz3] [money] NULL,
	[Start_Pounds] [decimal](7, 1) NULL,
	[Start_Date] [datetime] NULL,
	[Start_Who] [varchar](255) NULL,
	[Finish] [bit] NULL,
	[Finish_CC] [char](1) NULL,
	[Finish_Form] [char](2) NULL,
	[Finish_PC] [int] NULL,
	[Finish_Sz1] [money] NULL,
	[Finish_Sz2] [money] NULL,
	[Finish_Sz3] [money] NULL,
	[Finish_Pounds] [decimal](7, 1) NULL,
 CONSTRAINT [PK_Mach_Detail] PRIMARY KEY CLUSTERED 
(
	[ID_Detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Mach_Shop]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mach_Shop]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Mach_Shop](
	[ID] [int] IDENTITY(1000,1) NOT FOR REPLICATION NOT NULL,
	[SOitem] [char](10) NOT NULL,
	[SalesNum] [int] NULL,
	[HPAlot] [char](11) NULL,
	[Heat] [varchar](50) NULL,
	[Alloy] [char](12) NULL,
	[AllQuotes_ID] [int] NULL,
	[Start_CC] [char](1) NULL,
	[Start_Form] [char](2) NULL,
	[Start_PC] [int] NULL,
	[Start_Sz1] [money] NULL,
	[Start_Sz2] [money] NULL,
	[Start_Sz3] [money] NULL,
	[Start_Pounds] [decimal](7, 1) NULL,
	[Finish_CC] [char](1) NULL,
	[Finish_Form] [char](2) NULL,
	[Finish_PC] [int] NULL,
	[Finish_Sz1] [money] NULL,
	[Finish_Sz2] [money] NULL,
	[Finish_Sz3] [money] NULL,
	[Finish_Pounds] [decimal](7, 1) NULL,
	[Start] [bit] NOT NULL,
	[Complete] [bit] NOT NULL,
	[Cancelled] [bit] NOT NULL,
 CONSTRAINT [PK_Mach_Shop] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Mach_Type]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mach_Type]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Mach_Type](
	[ID] [tinyint] IDENTITY(100,1) NOT FOR REPLICATION NOT NULL,
	[Mach_Type] [char](5) NULL,
	[Machine] [varchar](50) NULL,
 CONSTRAINT [PK_Mach_Type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[McMaster_CrossTab]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[McMaster_CrossTab]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[McMaster_CrossTab](
	[ID] [int] IDENTITY(1000,1) NOT NULL,
	[Alloy] [char](12) NOT NULL,
	[Form] [char](2) NOT NULL,
	[CC] [char](1) NULL,
	[ThicknessMin] [numeric](7, 4) NULL,
	[ThicknessMax] [numeric](7, 4) NULL,
	[Width] [numeric](8, 3) NULL,
	[Length] [numeric](8, 3) NULL,
	[DiameterMin] [numeric](7, 4) NULL,
	[DiameterMax] [numeric](7, 4) NULL,
	[TradeName] [varchar](30) NOT NULL,
	[Price_UoM] [varchar](20) NULL,
	[FB_LeadTime] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_McMaster_CrossTab_Alloy_Form]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[McMaster_CrossTab]') AND name = N'IX_McMaster_CrossTab_Alloy_Form')
CREATE CLUSTERED INDEX [IX_McMaster_CrossTab_Alloy_Form] ON [dbo].[McMaster_CrossTab]
(
	[Alloy] ASC,
	[Form] ASC,
	[Length] ASC,
	[Width] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[McMaster_Inquire]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[McMaster_Inquire]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[McMaster_Inquire](
	[Alloy] [char](12) NOT NULL,
	[Form] [char](2) NOT NULL,
	[CC] [char](1) NULL,
	[Thck] [numeric](7, 3) NOT NULL,
	[Quote] [bit] NULL,
	[PI_Thck] [numeric](7, 3) NULL,
	[PI_Width] [numeric](8, 3) NOT NULL,
	[PI_Length] [numeric](8, 3) NOT NULL,
	[McMaster] [varchar](100) NULL,
	[TradeName] [varchar](30) NOT NULL,
	[Price_UoM] [varchar](20) NULL,
	[FB_LeadTime] [varchar](50) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_McMaster_Inquire]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[McMaster_Inquire]') AND name = N'IX_McMaster_Inquire')
CREATE CLUSTERED INDEX [IX_McMaster_Inquire] ON [dbo].[McMaster_Inquire]
(
	[Alloy] ASC,
	[Form] ASC,
	[CC] ASC,
	[Thck] ASC,
	[PI_Width] ASC,
	[PI_Length] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[McMaster_Quotes]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[McMaster_Quotes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[McMaster_Quotes](
	[ID] [int] IDENTITY(1000,1) NOT NULL,
	[Period] [smalldatetime] NOT NULL,
	[Alloy] [char](12) NOT NULL,
	[Form] [char](2) NOT NULL,
	[CC] [char](1) NOT NULL,
	[Pieces] [int] NULL,
	[Thck] [numeric](7, 3) NULL,
	[Sz2] [numeric](8, 3) NULL,
	[Sz3] [numeric](8, 3) NULL,
	[StkWeight] [numeric](10, 1) NULL,
	[Weight_PC] [numeric](18, 8) NULL,
	[Quote_LBS] [numeric](18, 8) NULL,
	[Descript] [varchar](50) NULL,
	[P_Lb] [numeric](8, 2) NULL,
	[P_Pc] [numeric](8, 2) NULL,
	[McM_Desc] [varchar](100) NULL,
	[Price_Net] [numeric](10, 2) NULL,
	[Price_UoM] [varchar](20) NULL,
	[FB_LeadTime] [varchar](50) NULL,
	[FB_Min_PC] [int] NULL,
	[PI_Thck] [numeric](7, 3) NULL,
	[PI_Width] [numeric](8, 3) NULL,
	[PI_Length] [numeric](8, 3) NULL,
	[PI_Diameter] [numeric](7, 3) NULL,
	[CutLossLbs] [numeric](10, 8) NULL,
	[TradeName] [varchar](30) NULL,
	[P_Bracket] [tinyint] NULL,
	[PriceBreak] [tinyint] NULL,
	[Bracket_Lbs] [int] NULL,
	[Bracket_Min_PC] [int] NULL,
	[PF] [numeric](3, 2) NULL,
	[McMaster_ID] [char](31) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_McMaster_Quotes]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[McMaster_Quotes]') AND name = N'IX_McMaster_Quotes')
CREATE CLUSTERED INDEX [IX_McMaster_Quotes] ON [dbo].[McMaster_Quotes]
(
	[Period] ASC,
	[Alloy] ASC,
	[Form] ASC,
	[CC] ASC,
	[Thck] ASC,
	[PI_Width] ASC,
	[PI_Length] ASC,
	[Pieces] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[McMaster_Stock]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[McMaster_Stock]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[McMaster_Stock](
	[ID] [int] IDENTITY(1000,1) NOT NULL,
	[Period] [smalldatetime] NOT NULL,
	[Alloy] [char](12) NOT NULL,
	[Form] [char](2) NOT NULL,
	[CC] [char](1) NOT NULL,
	[Thck] [numeric](7, 3) NOT NULL,
	[StkWeight] [numeric](10, 1) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[McMaster_WL]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[McMaster_WL]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[McMaster_WL](
	[ID] [int] IDENTITY(1000,1) NOT NULL,
	[Alloy] [char](12) NOT NULL,
	[Form] [char](2) NOT NULL,
	[CC] [char](1) NULL,
	[Thck] [numeric](8, 3) NULL,
	[Width] [numeric](8, 3) NULL,
	[Length] [numeric](8, 3) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_McMaster_WL]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[McMaster_WL]') AND name = N'IX_McMaster_WL')
CREATE CLUSTERED INDEX [IX_McMaster_WL] ON [dbo].[McMaster_WL]
(
	[Alloy] ASC,
	[Form] ASC,
	[CC] ASC,
	[Width] ASC,
	[Length] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Melt_Type]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Melt_Type]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Melt_Type](
	[ID] [tinyint] NOT NULL,
	[Type] [varchar](7) NOT NULL,
	[decription] [varchar](255) NULL,
 CONSTRAINT [PK_Melt_Type] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Index [IX_Melt_type]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Melt_Type]') AND name = N'IX_Melt_type')
CREATE UNIQUE CLUSTERED INDEX [IX_Melt_type] ON [dbo].[Melt_Type]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MTR_Loc]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MTR_Loc]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MTR_Loc](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Alloy] [char](12) NOT NULL,
	[Form] [char](10) NOT NULL,
	[Size] [decimal](5, 3) NOT NULL,
	[Heat] [varchar](50) NOT NULL,
	[Lot] [varchar](16) NULL,
	[UNS] [varchar](6) NULL,
	[Location] [varchar](255) NULL,
	[FileName] [varchar](255) NULL,
	[StoreDate] [datetime] NOT NULL,
	[StockLst_ID] [int] NOT NULL,
	[Cert_ID] [int] NOT NULL,
 CONSTRAINT [PK_MTR_Loc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OT_Job_Class]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OT_Job_Class]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OT_Job_Class](
	[ClassId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_OT_Job_Class] PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OT_Job_Sched]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OT_Job_Sched]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OT_Job_Sched](
	[Sched_Type] [tinyint] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_OT_Job_Sched] PRIMARY KEY CLUSTERED 
(
	[Sched_Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OT_Total]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OT_Total]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OT_Total](
	[TotalId] [int] IDENTITY(1,1) NOT NULL,
	[TrackId] [int] NOT NULL,
	[OrderNumber] [varchar](15) NOT NULL,
	[StatusId] [int] NOT NULL,
	[JobDescription] [varchar](50) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[TotalMinutesOnJob] [int] NOT NULL,
	[JobEndTime] [datetime] NOT NULL,
	[Total Job Time] [int] NOT NULL,
 CONSTRAINT [PK_OT_Total] PRIMARY KEY CLUSTERED 
(
	[TotalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PMI]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PMI]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PMI](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Pc] [tinyint] NOT NULL,
	[In_Report] [money] NOT NULL,
	[Co_Report] [money] NOT NULL,
 CONSTRAINT [PK_PMI] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PO_Item_Notes]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PO_Item_Notes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PO_Item_Notes](
	[POitem] [char](12) NOT NULL,
	[Notes] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PO_ProcessNotes]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PO_ProcessNotes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PO_ProcessNotes](
	[POitem] [char](12) NOT NULL,
	[Notes] [varchar](max) NOT NULL,
 CONSTRAINT [PK_PO_ProcessNotes] PRIMARY KEY CLUSTERED 
(
	[POitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PO_SOdist]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PO_SOdist]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PO_SOdist](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[POitem] [char](12) NOT NULL,
	[SOitem] [char](10) NOT NULL,
	[QTY] [money] NOT NULL,
	[P] [money] NOT NULL,
	[Total] [money] NOT NULL,
	[PU] [tinyint] NULL,
	[PO_P] [money] NULL,
	[PO_QTY] [money] NULL,
	[PO_PU] [tinyint] NULL,
	[PO_Total] [money] NULL,
	[SO_P] [money] NULL,
	[SO_QTY] [money] NULL,
	[SO_PU] [tinyint] NULL,
	[SO_Total] [money] NULL,
	[ReconcileTotal] [money] NOT NULL,
	[who] [varchar](255) NOT NULL,
	[WO] [int] NOT NULL,
 CONSTRAINT [IX_PO_SOdist-ID] UNIQUE CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_PO_SOdist_Unique] UNIQUE NONCLUSTERED 
(
	[SOitem] ASC,
	[POitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PO_StockLst_Def]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PO_StockLst_Def]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PO_StockLst_Def](
	[TBL] [char](1) NOT NULL,
	[Stock] [varchar](13) NOT NULL,
	[ShipWhere] [decimal](1, 0) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PO_Testing]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PO_Testing]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PO_Testing](
	[POitem] [char](12) NOT NULL,
	[HPApo] [int] NULL,
	[itemPO] [decimal](2, 0) NULL,
	[SOitem] [char](10) NULL,
	[Salesnum] [int] NULL,
	[itemSO] [decimal](2, 0) NULL,
	[Alloy] [char](12) NULL,
	[Heat] [varchar](50) NULL,
	[Lot] [nchar](10) NULL,
	[Form] [char](2) NULL,
	[Size] [decimal](9, 3) NULL,
	[Quantity] [smallint] NULL,
	[TestType] [char](1) NULL,
	[TestPackage] [char](1) NULL,
	[SpeciDia] [varchar](50) NULL,
	[SpeciLoc] [char](1) NULL,
	[TensileTest] [varchar](30) NULL,
	[TensileConf] [varchar](30) NULL,
	[TensileTemp] [varchar](30) NULL,
	[HardTest] [varchar](30) NULL,
	[HardConf] [varchar](30) NULL,
	[HardProf] [char](1) NULL,
	[StressTest] [varchar](30) NULL,
	[CharpyTest] [varchar](30) NULL,
	[CharpyTemp] [varchar](30) NULL,
	[USonicTest] [varchar](30) NULL,
	[USonicType] [char](1) NULL,
	[IGCorrTest] [varchar](30) NULL,
	[DelivService] [char](1) NULL,
	[ReturnSamples] [char](1) NULL,
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
 CONSTRAINT [PK_PO_Testing] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[POstatusDef]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POstatusDef]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[POstatusDef](
	[code] [char](1) NOT NULL,
	[caption] [char](20) NOT NULL,
 CONSTRAINT [PK_postatusdef] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[prc_Equipment]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[prc_Equipment]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[prc_Equipment](
	[ID] [int] NOT NULL,
	[Machine] [varchar](50) NOT NULL,
	[Description] [varchar](30) NULL,
	[Manufacturer] [varchar](30) NOT NULL,
	[Model] [varchar](30) NULL,
	[Serial] [varchar](30) NULL,
	[Location] [char](1) NOT NULL,
	[ScanName] [char](10) NULL,
	[BarcodesLocation] [char](1) NOT NULL,
 CONSTRAINT [PK_prc_Equipment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[prc_Equipment_Extra_Barcodes]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[prc_Equipment_Extra_Barcodes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[prc_Equipment_Extra_Barcodes](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Description] [varchar](30) NOT NULL,
	[Location] [char](1) NOT NULL,
	[ScanName] [char](10) NOT NULL,
 CONSTRAINT [PK_prc_Equipment_Extra_Barcodes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[prc_ScanName]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[prc_ScanName]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[prc_ScanName](
	[ScanName] [char](10) NOT NULL,
 CONSTRAINT [PK_prc_ScanName] PRIMARY KEY CLUSTERED 
(
	[ScanName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PriceTable_Change]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PriceTable_Change]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PriceTable_Change](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Date] [datetime] NOT NULL,
	[Who] [varchar](255) NOT NULL,
	[Text] [varchar](max) NOT NULL,
 CONSTRAINT [PK_PriceTable_Change] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO

/****** Object:  Table [dbo].[Production]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Production]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Production](
	[ID] [int] IDENTITY(1000,1) NOT NULL,
	[Position] [tinyint] NULL,
	[Oper_ID] [int] NULL,
	[WO_Detail] [int] NULL,
	[SOitem] [char](10) NULL,
	[POitem] [char](12) NULL,
	[OnBoard] [bit] NULL,
	[InQue] [bit] NULL,
	[Closed] [bit] NULL,
	[OType_Num]  AS (CONVERT([char](15),case when isnull([WO_Detail],(0))>(0) then 'WD'+CONVERT([char](10),[WO_Detail]) when len(isnull([SOitem],''))>(4) then 'SI'+[SOitem] when len(isnull([POitem],''))>(4) then 'PI'+[POitem] else '' end)) PERSISTED,
	[Sched_Type] [tinyint] NULL,
	[rtr_ID] [bigint] NULL,
	[rtr_Detail] [int] NULL,
	[LastTouch] [smalldatetime] NULL,
	[dateOnBoard] [smalldatetime] NULL,
	[dateInQue] [smalldatetime] NULL,
	[dateClosed] [smalldatetime] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Production_RunTime_Categories]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Production_RunTime_Categories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Production_RunTime_Categories](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[DisplayName] [varchar](50) NOT NULL,
	[IsProductionTime] [bit] NOT NULL,
	[OverrideRequirements] [bit] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Production_RunTime_Log_Settings]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Production_RunTime_Log_Settings]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Production_RunTime_Log_Settings](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[LogId] [uniqueidentifier] NOT NULL,
	[Setting] [varchar](50) NOT NULL,
	[Kilowatts] [decimal](12, 3) NULL,
	[BarTemperatureFahrenheit] [decimal](12, 3) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Production_RunTime_Logs]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Production_RunTime_Logs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Production_RunTime_Logs](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[RunTimeId] [uniqueidentifier] NOT NULL,
	[EmployeeId] [varchar](50) NOT NULL,
	[StartDateTime] [datetime] NOT NULL,
	[FinishDateTime] [datetime] NULL,
	[StageId] [smallint] NULL,
	[Notes] [varchar](max) NULL,
	[NumberOfPieces] [decimal](12, 3) NULL,
	[StartDiameter] [decimal](12, 3) NULL,
	[EndDiameter] [decimal](12, 3) NULL,
	[CategoryId] [smallint] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
	[LastUpdatedBy] [varchar](50) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Production_RunTime_Stages]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Production_RunTime_Stages]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Production_RunTime_Stages](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[DisplayName] [varchar](50) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Production_RunTimes]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Production_RunTimes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Production_RunTimes](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[DrawLogId] [int] NULL,
	[GFMLogId] [int] NULL,
	[LakeErieLogId] [int] NULL,
	[RollLogId] [int] NULL,
	[SwageLogId] [int] NULL,
	[WireLogId] [int] NULL,
	[EstimatedJobTimeInHours] [decimal](12, 3) NOT NULL,
	[MachineId] [int] NOT NULL,
	[FinalWeight] [decimal](12, 3) NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
	[LastUpdatedBy] [varchar](50) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Profile_Names]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Profile_Names]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Profile_Names](
	[Profile_Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Profile_Names_1] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PU]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PU]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PU](
	[PU] [tinyint] NOT NULL,
	[Unit] [char](4) NOT NULL,
	[Label] [char](7) NOT NULL,
	[UOM] [char](4) NOT NULL,
	[Max_P] [money] NOT NULL,
	[QisS] [bit] NULL,
 CONSTRAINT [PK_PU] PRIMARY KEY CLUSTERED 
(
	[PU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[QA_Control_of_Documents]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QA_Control_of_Documents]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QA_Control_of_Documents](
	[QA_COD_ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[QA_COD_Description] [nvarchar](600) NOT NULL,
	[QA_COD_StartDateTime] [date] NOT NULL,
	[QA_COD_EndDateTime] [date] NULL,
 CONSTRAINT [PK_QA_Control_of_Documents] PRIMARY KEY CLUSTERED 
(
	[QA_COD_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[QA_Control_of_Records]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QA_Control_of_Records]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QA_Control_of_Records](
	[QA_COR_ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[QA_COR_Date] [date] NOT NULL,
	[QA_COR_Description] [nvarchar](600) NOT NULL,
 CONSTRAINT [PK_QA_Control_of_Records] PRIMARY KEY CLUSTERED 
(
	[QA_COR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[QA_CP_Action]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QA_CP_Action]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QA_CP_Action](
	[ActionID] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Action_Type] [nvarchar](1) NOT NULL,
	[Date_Initiated] [date] NOT NULL,
	[Problem_Description] [nvarchar](1000) NOT NULL,
	[Abridged_Problem_Description] [nvarchar](1000) NOT NULL,
	[Root_Cause] [nvarchar](1000) NOT NULL,
	[Disposition] [nvarchar](1000) NOT NULL,
	[Prevention] [nvarchar](1000) NOT NULL,
	[Interim_Date] [date] NULL,
	[Filed_Date] [date] NULL,
	[Closed_Date] [date] NULL,
	[Contact_Name] [nvarchar](50) NULL,
	[Contact_Type] [nvarchar](1) NULL,
 CONSTRAINT [PK_QA_CP_Action] PRIMARY KEY CLUSTERED 
(
	[ActionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[QA_CP_Action_Disposition_Type]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QA_CP_Action_Disposition_Type]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QA_CP_Action_Disposition_Type](
	[ActionID] [bigint] NOT NULL,
	[DispositionID] [int] NOT NULL,
 CONSTRAINT [PK_QA_CP_Action_Disposition_Type] PRIMARY KEY CLUSTERED 
(
	[ActionID] ASC,
	[DispositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[QA_CP_Action_PO_Items]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QA_CP_Action_PO_Items]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QA_CP_Action_PO_Items](
	[ActionID] [bigint] NOT NULL,
	[POItem] [char](12) NOT NULL,
 CONSTRAINT [PK_QA_Action_PO_Items] PRIMARY KEY CLUSTERED 
(
	[ActionID] ASC,
	[POItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[QA_CP_Action_Prevention_Type]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QA_CP_Action_Prevention_Type]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QA_CP_Action_Prevention_Type](
	[ActionID] [bigint] NOT NULL,
	[PreventionID] [int] NOT NULL,
 CONSTRAINT [PK_QA_CP_Action_Prevention_Type] PRIMARY KEY CLUSTERED 
(
	[ActionID] ASC,
	[PreventionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[QA_CP_Action_Reporting_Source]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QA_CP_Action_Reporting_Source]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QA_CP_Action_Reporting_Source](
	[ActionID] [bigint] NOT NULL,
	[ReportingSourceID] [int] NOT NULL,
	[Reporting_Source_Description] [nvarchar](300) NULL,
 CONSTRAINT [PK_QA_CP_Action_Reporting_Source] PRIMARY KEY CLUSTERED 
(
	[ActionID] ASC,
	[ReportingSourceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[QA_CP_Action_RootCauseSource_OrgDept]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QA_CP_Action_RootCauseSource_OrgDept]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QA_CP_Action_RootCauseSource_OrgDept](
	[ActionID] [bigint] NOT NULL,
	[RootCauseID] [int] NOT NULL,
	[DeptID] [int] NOT NULL,
 CONSTRAINT [PK_QA_CP_Action_RootCause_Source] PRIMARY KEY CLUSTERED 
(
	[ActionID] ASC,
	[RootCauseID] ASC,
	[DeptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[QA_CP_Action_SO_Items]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QA_CP_Action_SO_Items]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QA_CP_Action_SO_Items](
	[ActionID] [bigint] NOT NULL,
	[SOItem] [char](10) NOT NULL,
 CONSTRAINT [PK_QA_Action_SO_Items] PRIMARY KEY CLUSTERED 
(
	[ActionID] ASC,
	[SOItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[QA_Disposition_Types]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QA_Disposition_Types]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QA_Disposition_Types](
	[DispositionID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Disposition_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_QA_Disposition_Types] PRIMARY KEY CLUSTERED 
(
	[DispositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[QA_Equip_Cal_Maint]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QA_Equip_Cal_Maint]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QA_Equip_Cal_Maint](
	[QA_ECM_ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[QA_ECM_Date] [date] NOT NULL,
	[QA_ECM_Qty_Calibrated] [smallint] NOT NULL,
	[QA_ECM_Description] [nvarchar](600) NOT NULL,
 CONSTRAINT [PK_QA_Equip_Cal_Maint] PRIMARY KEY CLUSTERED 
(
	[QA_ECM_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[QA_Inspection_Statistical_Sampling]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QA_Inspection_Statistical_Sampling]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QA_Inspection_Statistical_Sampling](
	[QA_ISS_ID] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SOItem] [char](10) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Time] [date] NOT NULL,
	[Notes] [nvarchar](1000) NULL,
 CONSTRAINT [PK_QA_Inspection_Statistical_Sampling] PRIMARY KEY CLUSTERED 
(
	[QA_ISS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[QA_Internal_Audit]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QA_Internal_Audit]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QA_Internal_Audit](
	[AuditID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Audit_Completion_Date] [date] NOT NULL,
	[Audit_Report_Completion_Date] [date] NULL,
 CONSTRAINT [PK_QA_Internal_Audit] PRIMARY KEY CLUSTERED 
(
	[AuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[QA_Management_Review]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QA_Management_Review]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QA_Management_Review](
	[QA_MR_ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[QA_MR_ActionDescription] [nvarchar](600) NOT NULL,
	[QA_MR_IssueDate] [date] NOT NULL,
	[QA_MR_TargetCompletionDate] [date] NOT NULL,
	[QA_MR_CompletionDate] [date] NULL,
 CONSTRAINT [PK_QA_Management_Review] PRIMARY KEY CLUSTERED 
(
	[QA_MR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[QA_Management_Review_Employee]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QA_Management_Review_Employee]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QA_Management_Review_Employee](
	[QA_MR_ID] [int] NOT NULL,
	[EmpID] [int] NOT NULL,
 CONSTRAINT [PK_QA_Management_Review_Employee] PRIMARY KEY CLUSTERED 
(
	[QA_MR_ID] ASC,
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[QA_Management_Review_Process]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QA_Management_Review_Process]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QA_Management_Review_Process](
	[QA_MR_ID] [int] NOT NULL,
	[QA_ProcessID] [nvarchar](10) NOT NULL,
	[QA_MRP_Description] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_QA_Management_Review_Process] PRIMARY KEY CLUSTERED 
(
	[QA_MR_ID] ASC,
	[QA_ProcessID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[QA_Material_Testing_Certification]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QA_Material_Testing_Certification]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QA_Material_Testing_Certification](
	[QA_MTC_ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[QA_MTC_Date] [date] NOT NULL,
	[QA_MTC_Description] [nvarchar](600) NOT NULL,
 CONSTRAINT [PK_QA_Material_Testing_Certification] PRIMARY KEY CLUSTERED 
(
	[QA_MTC_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[QA_Org_Dept]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QA_Org_Dept]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QA_Org_Dept](
	[DeptID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Dept_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_QA_Org_Dept] PRIMARY KEY CLUSTERED 
(
	[DeptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[QA_Packaging_Shipping]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QA_Packaging_Shipping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QA_Packaging_Shipping](
	[QA_PS_ID] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[QA_PS_Description] [nvarchar](600) NOT NULL,
	[QA_PS_HoldDate] [date] NOT NULL,
	[QA_PS_DateReleased] [date] NULL,
 CONSTRAINT [PK_QA_Packaging_Shipping] PRIMARY KEY CLUSTERED 
(
	[QA_PS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[QA_Packaging_Shipping_SOItem]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QA_Packaging_Shipping_SOItem]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QA_Packaging_Shipping_SOItem](
	[soitem] [char](10) NOT NULL,
	[QA_PS_ID] [bigint] NOT NULL,
 CONSTRAINT [PK_Packaging_Shipping_SOItem] PRIMARY KEY CLUSTERED 
(
	[soitem] ASC,
	[QA_PS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[QA_Prevention_Types]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QA_Prevention_Types]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QA_Prevention_Types](
	[PreventionID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Prevention_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_QA_Prevention_Types] PRIMARY KEY CLUSTERED 
(
	[PreventionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[QA_Process]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QA_Process]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QA_Process](
	[QA_ProcessID] [nvarchar](10) NOT NULL,
	[QA_Process_Description] [nvarchar](100) NOT NULL,
	[QA_Process_Parameter] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_QA_Process] PRIMARY KEY CLUSTERED 
(
	[QA_ProcessID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[QA_ProcessHistory]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QA_ProcessHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QA_ProcessHistory](
	[QA_ProcessHistory_ID] [varchar](20) NOT NULL,
	[QA_ProcessHistory_Process] [nvarchar](10) NOT NULL,
	[QA_ProcessHistory_Value] [decimal](18, 0) NOT NULL,
	[QA_ProcessHistory_Description] [varchar](30) NOT NULL,
	[QA_ProcessHistory_Color] [varchar](15) NOT NULL,
	[QA_ProcessHistory_Order] [int] NOT NULL,
 CONSTRAINT [PK_QA_ProcessHistory] PRIMARY KEY CLUSTERED 
(
	[QA_ProcessHistory_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[QA_Reporting_Source]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QA_Reporting_Source]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QA_Reporting_Source](
	[ReportingSourceID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ReportingSourceName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[ReportingSourceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[QA_RootCause_Source]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QA_RootCause_Source]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QA_RootCause_Source](
	[RootCauseID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[RootCause_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_QA_RootCause_Source] PRIMARY KEY CLUSTERED 
(
	[RootCauseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[QuickCompany]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QuickCompany]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QuickCompany](
	[customer] [char](20) NULL,
	[company] [varchar](30) NOT NULL,
	[name] [varchar](25) NULL,
	[countryc] [varchar](10) NULL,
	[phone] [varchar](10) NULL,
	[phone_ext] [varchar](6) NULL,
	[fax] [varchar](10) NULL,
	[email] [varchar](60) NULL,
	[xcomp] [char](14) NULL,
	[xCompName] [char](18) NULL,
	[status] [varchar](10) NULL,
	[home] [varchar](10) NULL,
	[car] [varchar](10) NULL,
	[notes] [text] NULL,
	[PU] [tinyint] NULL,
	[LastEdit] [smalldatetime] NULL,
	[NoNoiseName] [char](30) NULL,
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
 CONSTRAINT [PK_QuickCompany] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Quote_No]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Quote_No]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Quote_No](
	[id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Inqnum] [int] NOT NULL,
	[InqNumP] [char](9) NOT NULL,
	[SalesP] [char](1) NOT NULL,
	[revision] [smallint] NOT NULL,
	[InitDate] [datetime] NOT NULL,
	[ExpireDate] [datetime] NULL,
	[ProdReqDefine] [bit] NULL,
	[DiffResolved] [bit] NULL,
	[HPAcapable] [bit] NULL,
	[Comments] [varchar](100) NULL,
	[Contents] [varchar](max) NULL,
	[AllInqNum] [varchar](max) NULL,
	[LastEdit] [datetime] NOT NULL,
	[AllQuotes_IDs] [varchar](max) NULL,
 CONSTRAINT [PK_Quote_No] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Quote_No-InqNumP]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Quote_No]') AND name = N'IX_Quote_No-InqNumP')
CREATE CLUSTERED INDEX [IX_Quote_No-InqNumP] ON [dbo].[Quote_No]
(
	[InqNumP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quote_No_addr]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Quote_No_addr]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Quote_No_addr](
	[Quote_No_ID] [int] NOT NULL,
	[Name] [varchar](25) NULL,
	[Company] [varchar](30) NULL,
	[CountryC] [varchar](10) NULL,
	[PHONE] [varchar](50) NULL,
	[Phone_Ext] [varchar](6) NULL,
	[fax] [varchar](10) NULL,
	[email] [varchar](40) NULL,
	[SalesRep] [varchar](20) NULL,
	[ID_Quote_No_Addr] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
 CONSTRAINT [PK_Quote_No_addr] PRIMARY KEY CLUSTERED 
(
	[ID_Quote_No_Addr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Quote_No_AQID]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Quote_No_AQID]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Quote_No_AQID](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Quote_No_id] [int] NOT NULL,
	[AllQuotes_ID] [int] NOT NULL,
 CONSTRAINT [PK_Quote_No_AQID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Quote_Services]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Quote_Services]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Quote_Services](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Quote_ID] [int] NOT NULL,
	[Oper_ID] [int] NOT NULL,
	[jobClassID] [tinyint] NOT NULL,
	[WO] [int] NULL,
	[WO_Detail] [int] NULL,
	[SOitem] [nchar](10) NULL,
 CONSTRAINT [PK_Quote_Services] PRIMARY KEY CLUSTERED 
(
	[Quote_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Quote_temp]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Quote_temp]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Quote_temp](
	[ID] [int] NULL,
	[Alt_ID] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Quotes_PMI]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Quotes_PMI]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Quotes_PMI](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[AQ_ID_Orig] [int] NOT NULL,
	[AQ_ID_Curr] [int] NOT NULL,
	[Gp] [char](1) NOT NULL,
	[PMIi] [int] NOT NULL,
	[PMIc] [int] NOT NULL,
	[price] [money] NOT NULL,
 CONSTRAINT [PK_Quotes_PMI] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[QuoteSheet]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QuoteSheet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QuoteSheet](
	[alloy] [char](12) NULL,
	[form] [char](2) NULL,
	[cc] [char](1) NULL,
	[pieces] [int] NULL,
	[thck] [float] NULL,
	[sz2] [float] NULL,
	[sz3] [float] NULL,
	[weight] [float] NULL,
	[p_lb] [float] NULL,
	[cp_lb] [float] NULL,
	[Inqdate] [datetime] NOT NULL,
	[InqNumP] [char](9) NOT NULL,
	[SOitem] [char](10) NULL,
	[Saledate] [datetime] NULL,
	[Shipdate] [datetime] NULL,
	[Services] [bit] NULL,
	[RandLen] [bit] NULL,
	[Metric] [bit] NULL,
	[Regret] [bit] NULL,
 CONSTRAINT [PK_QuoteSheet] PRIMARY KEY CLUSTERED 
(
	[InqNumP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Receiving]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Receiving]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Receiving](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Received] [smalldatetime] NOT NULL,
	[POitem] [char](12) NULL,
	[SOitem] [char](10) NULL,
	[WO] [int] NULL,
	[WO_Detail] [int] NULL,
	[Alloy] [char](12) NULL,
	[Heat] [varchar](50) NULL,
	[lot] [char](10) NULL,
	[Cert] [bit] NULL,
	[CofC] [bit] NULL,
	[Pieces] [decimal](10, 0) NULL,
	[Description] [varchar](max) NOT NULL,
	[Specs] [varchar](max) NULL,
	[Comments] [varchar](max) NULL,
	[Init] [char](10) NULL,
	[Date] [smalldatetime] NULL,
	[Pass] [bit] NULL,
	[GoodPapers] [bit] NULL,
	[ActualW] [decimal](9, 1) NULL,
	[BillW] [decimal](9, 1) NULL,
	[Vendor] [char](30) NULL,
	[Cancelled] [bit] NULL,
	[WhoAdd] [varchar](255) NULL,
	[WhenAdd] [smalldatetime] NULL,
	[ID_Master] [int] NULL,
	[ID_Detail] [int] NULL,
	[ID_Detail_Process] [int] NULL,
	[StockTable] [char](1) NULL,
	[RejectReason] [varchar](255) NULL,
	[RMA_No] [int] NULL,
	[RMA_Detail] [int] NULL,
	[VeriRecv] [bit] NULL,
	[AcctNotify] [bit] NULL,
	[AcctFinish] [bit] NULL,
	[VI_ID_Detail] [int] NULL,
	[R_QTY] [money] NULL,
	[R_P] [money] NULL,
	[R_Total]  AS ([R_QTY]*[R_P]) PERSISTED,
	[R_PU] [tinyint] NULL,
	[R_AP_P] [money] NULL,
	[R_AP_Total]  AS ([R_QTY]*[R_AP_P]) PERSISTED,
	[hold] [bit] NULL,
	[PO_QTY] [money] NULL,
	[PO_P] [money] NULL,
	[PO_Total]  AS ([PO_QTY]*[PO_P]) PERSISTED,
	[PO_PU] [tinyint] NULL,
	[Services] [bit] NULL,
	[ConvServ] [bit] NULL,
	[Equipment] [bit] NULL,
	[CertID] [varchar](50) NULL,
	[MillTrace] [bit] NULL,
	[Stock_Recv_ID] [int] NULL,
	[SnapShot_ID] [int] NULL,
	[RejectPC] [int] NULL,
	[form] [char](2) NULL,
 CONSTRAINT [PK_receiving] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Index [IX_receiving_ID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Receiving]') AND name = N'IX_receiving_ID')
CREATE CLUSTERED INDEX [IX_receiving_ID] ON [dbo].[Receiving]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recollect_Cert_Loc]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Recollect_Cert_Loc]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Recollect_Cert_Loc](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Alloy] [char](12) NOT NULL,
	[Form] [numeric](2, 0) NOT NULL,
	[Size] [decimal](5, 3) NOT NULL,
	[Heat] [varchar](50) NOT NULL,
	[Lot] [varchar](16) NULL,
	[UNS] [varchar](6) NOT NULL,
	[Location] [varchar](255) NOT NULL,
	[StoreDate] [datetime] NOT NULL,
	[StockLst_ID] [int] NOT NULL,
 CONSTRAINT [PK_Recollect_Cert_Loc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[RMA]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RMA]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RMA](
	[rma_no] [int] IDENTITY(1001,1) NOT FOR REPLICATION NOT NULL,
	[notified] [datetime] NULL,
	[company] [varchar](30) NULL,
	[contact] [varchar](20) NULL,
	[Email] [varchar](100) NULL,
	[phone] [varchar](20) NULL,
	[fax] [varchar](20) NULL,
	[money] [varchar](max) NULL,
	[aprv_by] [varchar](20) NULL,
	[aprv_date] [datetime] NULL,
	[auth_by] [varchar](20) NULL,
	[corraction] [int] NULL,
	[cancelled] [bit] NULL,
	[WhoAdd] [varchar](255) NULL,
 CONSTRAINT [PK_rma] PRIMARY KEY CLUSTERED 
(
	[rma_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[RMA_Receive]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RMA_Receive]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RMA_Receive](
	[RMA_RCV_ID] [int] IDENTITY(1000,1) NOT NULL,
	[RMA_Detail_ID] [int] NOT NULL,
	[ReceivingID] [int] NOT NULL,
	[SOitem] [char](10) NOT NULL,
	[Stk_ID_Detail] [int] NOT NULL,
	[Who] [nvarchar](255) NOT NULL,
	[WHEN] [datetime] NOT NULL,
	[Sales_Detail_ID] [int] NOT NULL,
	[Descrip] [varchar](100) NOT NULL,
	[DoNotUse] [bit] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[rtr_Detail_OT]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[rtr_Detail_OT]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[rtr_Detail_OT](
	[rtr_ID] [bigint] NOT NULL,
	[Detail] [int] NOT NULL,
	[EstStart] [date] NOT NULL,
	[Started] [bit] NOT NULL,
	[StartDate] [datetime] NULL,
	[EstFinish] [date] NULL,
	[Finished] [bit] NOT NULL,
	[FinishDate] [datetime] NULL,
	[Operation] [varchar](20) NULL,
	[Oper_ID] [int] NULL,
	[Oper_Note] [varchar](max) NULL,
	[EstTime] [int] NOT NULL,
	[ActTime] [int] NOT NULL,
	[TimeID] [int] NULL,
	[StartTime] [datetime] NULL,
	[Start_StatusID] [tinyint] NULL,
	[StopTime] [datetime] NULL,
	[Stop_StatusID] [tinyint] NULL,
	[TrackID] [int] NULL,
	[JobID] [int] NULL,
	[OrderTypeID] [int] NULL,
	[OType_Num] [char](15) NULL,
	[CreateUser] [varchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[rtr_Machine]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[rtr_Machine]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[rtr_Machine](
	[Mach_ID] [int] IDENTITY(1000,1) NOT NULL,
	[Oper_ID] [int] NULL,
	[Asset_No] [nchar](50) NULL,
	[Serial_No] [nchar](50) NULL,
	[Model] [nchar](100) NULL,
	[Location] [nchar](100) NULL,
	[IEQ_Code] [int] NULL,
	[EQ_Code] [nchar](30) NULL,
	[EQ_Short_Description] [nchar](100) NULL,
	[EQ_Long_Description] [nchar](500) NULL,
	[Tag_Date] [datetime] NULL,
	[Year_made] [tinyint] NULL,
	[New_Cost] [int] NULL,
	[Value] [int] NULL,
	[Replacement_Cost] [int] NULL,
	[Date_Installed] [smalldatetime] NULL,
	[Date_Retired] [smalldatetime] NULL,
	[CreateUser] [varchar](100) NULL,
 CONSTRAINT [PK_rtr_Machine] PRIMARY KEY CLUSTERED 
(
	[Mach_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[rtr_Production-test]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[rtr_Production-test]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[rtr_Production-test](
	[ID] [bigint] IDENTITY(10000,1) NOT NULL,
	[Machine] [nvarchar](50) NULL,
	[Oper_ID] [int] NULL,
	[Customer] [nvarchar](255) NULL,
	[ProdDateSched] [date] NULL,
	[SP_inits] [nvarchar](255) NULL,
	[WO_Detail] [int] NULL,
	[WO] [int] NULL,
	[OrderNums] [nvarchar](255) NULL,
	[DueDate] [date] NULL,
	[DiaTolerance] [nvarchar](255) NULL,
	[Alloy] [nchar](12) NULL,
	[Heat] [nvarchar](50) NULL,
	[Lot] [nchar](10) NULL,
	[End_Mat] [nvarchar](255) NULL,
	[Mat_Need] [nvarchar](255) NULL,
	[Start_Mat_Info] [nvarchar](255) NULL,
	[Start_Weight] [int] NULL,
	[TestingTXT] [nvarchar](255) NULL,
	[Properties] [nvarchar](255) NULL,
	[StartDia] [float] NULL,
	[Target_Dia] [float] NULL,
	[Finish_Dia] [float] NULL,
	[CW_RA] [tinyint] NULL,
	[Pieces] [int] NULL,
	[BarLength] [int] NULL,
	[MachineHrs] [smallint] NULL,
	[CGHrs] [smallint] NULL,
 CONSTRAINT [PK_rtr_Production] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[rtr_Schedule]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[rtr_Schedule]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[rtr_Schedule](
	[ID] [int] IDENTITY(1000,1) NOT NULL,
	[Position] [tinyint] NULL,
	[Oper_ID] [int] NULL,
	[WO_Detail] [int] NULL,
	[SOitem] [char](10) NULL,
	[POitem] [char](12) NULL,
	[OnBoard] [bit] NULL,
	[InQue] [bit] NULL,
	[Closed] [bit] NULL,
	[OType_Num]  AS (CONVERT([char](15),case when isnull([WO_Detail],(0))>(0) then 'WD'+CONVERT([char](10),[WO_Detail]) when len(isnull([SOitem],''))>(4) then 'SI'+[SOitem] when len(isnull([POitem],''))>(4) then 'PI'+[POitem] else '' end)) PERSISTED,
	[Sched_Type] [tinyint] NULL,
	[rtr_ID] [bigint] NULL,
	[rtr_Detail] [int] NULL,
	[LastTouch] [smalldatetime] NULL,
	[dateOnBoard] [smalldatetime] NULL,
	[dateInQue] [smalldatetime] NULL,
	[dateClosed] [smalldatetime] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SageIntacct_Invoices]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SageIntacct_Invoices]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SageIntacct_Invoices](
	[RECORDNO] [int] NOT NULL,
	[RECORDTYPE] [varchar](10) NULL,
	[RECORDID] [varchar](20) NULL,
	[STATE] [varchar](20) NULL,
	[CUSTOMERID] [varchar](20) NULL,
	[DOCNUMBER] [varchar](50) NULL,
	[DESCRIPTION2] [varchar](50) NULL,
	[WHENPOSTED] [date] NULL,
	[WHENDUE] [date] NULL,
	[WHENPAID] [date] NULL,
	[CURRENCY] [varchar](20) NULL,
	[TOTALDUE] [decimal](12, 2) NULL,
	[TOTALENTERED] [decimal](12, 2) NULL,
	[TOTALPAID] [decimal](12, 2) NULL,
	[AUWHENCREATED] [datetime] NULL,
	[WHENMODIFIED] [datetime] NULL,
 CONSTRAINT [PK_SageIntacct_Invoices] PRIMARY KEY CLUSTERED 
(
	[RECORDNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Sales_Detail]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Detail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sales_Detail](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SOitem] [char](10) NOT NULL,
	[SalesNum] [int] NULL,
	[Invoice] [int] NULL,
	[WO] [int] NULL,
	[Sale_QTY] [money] NULL,
	[Sale_PC] [int] NULL,
	[Descript] [varchar](254) NULL,
	[Sale_LBS] [float] NULL,
	[Quoted_QTY] [money] NULL,
	[Quoted_P] [money] NULL,
	[Quoted_Total] [money] NULL,
	[Quoted_PU] [tinyint] NULL,
	[Quoted_PC] [int] NULL,
	[Quoted_Dim1] [decimal](10, 4) NULL,
	[Quoted_Dim2] [decimal](8, 3) NULL,
	[Quoted_Dim3] [decimal](8, 3) NULL,
	[Quoted_LBS] [decimal](9, 1) NULL,
	[Prev_QTY] [money] NULL,
	[StockLst_Qty] [money] NULL,
	[StockLst_P] [money] NULL,
	[StockLst_Total] [money] NULL,
	[StockLst_PU] [tinyint] NULL,
	[StockLst_PC] [int] NULL,
	[StockLst_Dim1] [decimal](10, 4) NULL,
	[StockLst_Dim2] [decimal](9, 3) NULL,
	[StockLst_Dim3] [decimal](9, 3) NULL,
	[StockLst_LBS] [float] NULL,
	[Removed_PC] [int] NULL,
	[Removed_Dim1] [decimal](9, 4) NULL,
	[Removed_Dim2] [decimal](9, 3) NULL,
	[Removed_Dim3] [decimal](9, 3) NULL,
	[Removed_LBS] [decimal](9, 1) NULL,
	[Removed_QTY] [money] NULL,
	[Removed_P] [money] NULL,
	[Removed_Paid_Total] [money] NULL,
	[Removed_Total] [money] NULL,
	[Alloy] [varchar](12) NULL,
	[Form] [char](2) NULL,
	[CC] [char](1) NULL,
	[CL] [char](1) NULL,
	[Heat] [varchar](50) NULL,
	[Lot] [varchar](10) NULL,
	[TBL] [char](1) NULL,
	[StockLst_ID] [int] NULL,
	[StockLst_ID_Detail] [int] NULL,
	[ID_Detail_Process] [int] NULL,
	[ID_Sales_Stock] [int] NULL,
	[ID_Packing] [int] NULL,
	[StockEdit] [datetime] NULL,
	[Shipped] [date] NULL,
	[InvoiceDate] [date] NULL,
	[Invoice_QTY] [money] NULL,
	[Invoice_P] [money] NULL,
	[Invoice_Total] [money] NULL,
	[ProfitMargin] [money] NULL,
	[Disc_Allowed] [money] NULL,
	[ReconDiff] [money] NULL,
	[Freight] [money] NULL,
	[FreightTotal] [money] NULL,
	[RecDate] [datetime] NOT NULL,
	[Reconciled] [bit] NOT NULL,
	[PackingSli] [int] NOT NULL,
	[StkPaid_P] [money] NULL,
	[StkPaid_Total] [money] NULL,
	[Returned] [bit] NULL,
	[RMA_Detail_ID] [int] NULL,
	[WhoAdd] [varchar](255) NULL,
	[WhenAdd] [datetime] NULL,
	[DoNotCopy] [bit] NULL,
	[Cancelled] [bit] NULL,
	[UserEdit] [varchar](max) NULL,
 CONSTRAINT [PK_Sales_Detail-ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Sales_Detail_PackingSlip]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Detail_PackingSlip]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sales_Detail_PackingSlip](
	[ID] [int] IDENTITY(100,1) NOT NULL,
	[ID_Packing] [int] NOT NULL,
	[PackingSli] [int] NOT NULL,
	[SOitem] [char](10) NOT NULL,
	[SalesNum] [int] NOT NULL,
	[Descript] [varchar](100) NOT NULL,
	[QTY] [money] NOT NULL,
	[Pieces] [int] NOT NULL,
	[Pounds] [int] NOT NULL,
	[Heat] [varchar](50) NOT NULL,
	[When] [datetime] NOT NULL,
	[SOitemBad] [nchar](10) NULL,
	[itemBad] [int] NULL,
	[SObad] [int] NULL,
	[dShip] [bit] NULL,
 CONSTRAINT [PK_Sales_Detail_PackingSlip] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Sales_Detail_Sum]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Detail_Sum]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sales_Detail_Sum](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SOitem] [char](10) NOT NULL,
	[SalesNum] [int] NULL,
	[Invoice] [int] NULL,
	[Sale_QTY] [money] NULL,
	[Sale_PC] [int] NULL,
	[Descript] [varchar](254) NULL,
	[Sale_LBS] [float] NULL,
	[Quote_ID] [int] NULL,
	[Q_QTY] [money] NULL,
	[Q_P] [money] NULL,
	[Q_Total] [money] NULL,
	[Q_PU] [tinyint] NULL,
	[StockLst_Qty] [money] NULL,
	[StockLst_P] [money] NULL,
	[StockLst_Total] [money] NULL,
	[StockLst_PU] [tinyint] NULL,
	[StockLst_PC] [int] NULL,
	[StockLst_Dim1] [decimal](10, 4) NULL,
	[StockLst_LBS] [float] NULL,
	[TBL] [char](1) NULL,
	[StockLst_ID] [int] NULL,
	[Edited] [datetime] NULL,
	[Shipped] [date] NULL,
	[PackingSli] [int] NOT NULL,
	[StkPaid_P] [money] NULL,
	[StkPaid_Total] [money] NULL,
	[WhoAdd] [varchar](255) NULL,
	[WhenAdd] [datetime] NULL,
 CONSTRAINT [PK_Sales_Detail_Sum] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Sales_Invoice]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Invoice]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sales_Invoice](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Invoice] [int] NOT NULL,
	[InvoiceDate] [smalldatetime] NULL,
	[SOitem] [char](10) NOT NULL,
	[SalesNum] [int] NULL,
	[CustomerID] [varchar](20) NOT NULL,
	[CustomerName] [varchar](50) NULL,
	[Customer_PO] [varchar](50) NULL,
	[Ship_Via] [varchar](50) NULL,
	[Disc_Amount] [money] NULL,
	[Sales_Rep] [varchar](50) NULL,
	[AR_Amount] [money] NULL,
	[Invoice_Note] [varchar](50) NULL,
	[Amount] [money] NOT NULL,
	[ItemTot] [tinyint] NULL,
	[Item] [tinyint] NULL,
	[Quantity] [int] NOT NULL,
	[GL_Account] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Trans_Period] [tinyint] NULL,
	[Trans_No] [smallint] NULL,
	[ReturnAuth] [varchar](50) NULL,
	[Description] [varchar](max) NULL,
	[Heat] [varchar](50) NULL,
	[Ship_Date] [smalldatetime] NULL,
	[Date_Due] [smalldatetime] NULL,
	[Reconciled] [bit] NOT NULL,
	[Sales_Detail_ID] [int] NOT NULL,
	[Paid] [money] NOT NULL,
	[Cancelled] [bit] NULL,
	[RMA_Detail] [int] NULL,
	[When] [datetime] NOT NULL,
 CONSTRAINT [PK_Sales_Invoice] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Sales_Item_Detail]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Item_Detail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sales_Item_Detail](
	[SID_ID] [int] IDENTITY(10000,1) NOT NULL,
	[SOitem] [char](10) NULL,
	[WO] [int] NULL,
	[PCS] [int] NOT NULL,
	[Form] [char](2) NULL,
	[Dim1] [numeric](10, 4) NOT NULL,
	[Dim2] [numeric](9, 3) NOT NULL,
	[Dim3] [numeric](9, 3) NOT NULL,
	[QTY] [money] NOT NULL,
	[Weight] [numeric](9, 1) NOT NULL,
	[PackingSlip] [int] NOT NULL,
	[Invoice] [int] NOT NULL,
	[Est_P] [money] NOT NULL,
	[Act_P] [money] NOT NULL,
	[Total] [money] NOT NULL,
	[RMA_Detail_ID] [int] NULL,
	[Reconciled] [bit] NOT NULL,
	[When] [datetime] NOT NULL,
	[Sales_Detail_ID] [int] NOT NULL,
	[Heat] [varchar](50) NULL,
	[ID_Master] [int] NULL,
	[ID_Detail] [int] NULL,
	[ID_Detail_Process] [int] NULL,
	[TBL] [char](1) NULL,
 CONSTRAINT [PK_Sales_Item_Detail] PRIMARY KEY CLUSTERED 
(
	[SID_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Sales_No_Chng]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sales_No_Chng]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sales_No_Chng](
	[Body] [varchar](max) NOT NULL,
	[SalesNum] [int] NOT NULL,
	[ShopRecv] [bit] NOT NULL,
	[BadTerms] [bit] NOT NULL,
	[Ver] [tinyint] NOT NULL,
	[Server] [varchar](255) NOT NULL,
	[UserName] [varchar](255) NOT NULL,
	[When] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Index [IX_Sales_No_Chng-When]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales_No_Chng]') AND name = N'IX_Sales_No_Chng-When')
CREATE CLUSTERED INDEX [IX_Sales_No_Chng-When] ON [dbo].[Sales_No_Chng]
(
	[When] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales_No_Rev]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sales_No_Rev]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sales_No_Rev](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SalesNum] [int] NOT NULL,
	[when] [datetime] NOT NULL,
	[VER] [tinyint] NOT NULL,
	[Comment] [varchar](max) NULL,
 CONSTRAINT [PK_Sales_No_Rev] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Sales_PS]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sales_PS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sales_PS](
	[ID_Packing] [int] NOT NULL,
	[PackingSli] [int] NOT NULL,
	[SOitem] [char](10) NOT NULL,
	[SalesNum] [int] NOT NULL,
	[Acct_PU] [tinyint] NULL,
	[Acct_QTY] [money] NULL,
	[Acct_P] [money] NULL,
	[Acct_Total]  AS ([Acct_QTY]*[dbo].[f_get_S_P_SOitem]([SOitem])),
	[Pounds] [numeric](9, 1) NULL,
	[Cust_PU] [tinyint] NULL,
	[Cust_QTY] [money] NULL,
	[Cust_P] [money] NULL,
	[Cust_Total]  AS ([Cust_QTY]*[Cust_P]) PERSISTED,
	[Cmplt] [bit] NOT NULL,
	[Reconciled] [bit] NOT NULL,
	[Cncld] [bit] NOT NULL,
	[Needed_QTY] [money] NOT NULL,
	[TBL] [char](1) NOT NULL,
	[SL_ID] [int] NULL,
	[ID_Detail] [int] NOT NULL,
	[SL_P] [money] NULL,
	[Alloy] [char](12) NULL,
	[Form] [char](2) NULL,
	[CC] [char](1) NULL,
	[CL] [char](1) NULL,
	[PCs] [int] NULL,
	[Heat] [varchar](50) NOT NULL,
	[Lot] [char](10) NULL,
	[Sales_Stock_ID] [int] NULL,
	[Sales_Detail_ID] [int] NULL,
	[Book_P] [decimal](7, 2) NULL,
	[PS_Date] [datetime] NOT NULL,
	[PickedUP] [bit] NULL,
	[PaperWork] [bit] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Sales_Status]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Status]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sales_Status](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SOitem] [char](10) NOT NULL,
	[SalesNum] [int] NOT NULL,
	[Who] [varchar](255) NOT NULL,
	[What] [varchar](20) NOT NULL,
	[When] [datetime] NOT NULL,
	[Comment] [varchar](255) NULL,
 CONSTRAINT [PK_Sales_Status] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Sales_Stock]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Stock]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sales_Stock](
	[ID] [int] IDENTITY(1000,1) NOT FOR REPLICATION NOT NULL,
	[SOitem] [char](10) NULL,
	[SalesNum] [int] NULL,
	[Invoice] [int] NULL,
	[Invoice_item] [tinyint] NULL,
	[StockLst_Qty] [money] NULL,
	[StockLst_P] [money] NULL,
	[StockLst_Total] [money] NULL,
	[StockLst_PU] [tinyint] NULL,
	[StockLst_PC] [int] NULL,
	[StockLst_Dim1] [numeric](10, 4) NULL,
	[StockLst_Dim2] [numeric](9, 3) NULL,
	[StockLst_Dim3] [numeric](9, 3) NULL,
	[StockLst_LBS] [numeric](9, 1) NULL,
	[StockLst_POitem] [char](12) NULL,
	[Pick_P] [money] NULL,
	[Pick_Total] [money] NULL,
	[Pick_PU] [tinyint] NULL,
	[Pick_PC] [int] NULL,
	[Pick_Dim1] [numeric](10, 4) NULL,
	[Pick_Dim2] [numeric](9, 3) NULL,
	[Pick_Dim3] [numeric](9, 3) NULL,
	[Pick_LBS] [numeric](9, 1) NULL,
	[Pick_QTY] [money] NULL,
	[Edited] [bit] NOT NULL,
	[Added] [bit] NOT NULL,
	[Consumed] [bit] NOT NULL,
	[StkBack] [bit] NOT NULL,
	[Scrap] [bit] NOT NULL,
	[StockEdit] [datetime] NULL,
	[RecDate] [datetime] NOT NULL,
	[TBL] [char](1) NULL,
	[StockLst_ID] [int] NULL,
	[StockLst_ID_Detail] [int] NULL,
	[ID_Detail_Process] [int] NULL,
	[ReceivingID] [int] NULL,
	[Removed_PC] [int] NULL,
	[Removed_Dim1] [decimal](10, 4) NULL,
	[Removed_Dim2] [decimal](9, 3) NULL,
	[Removed_Dim3] [decimal](9, 3) NULL,
	[Removed_QTY] [money] NULL,
	[Removed_LBS] [decimal](9, 1) NULL,
	[Removed_P] [money] NULL,
	[Removed_Paid_Total] [money] NULL,
	[Removed_Total] [money] NULL,
	[Alloy] [varchar](12) NULL,
	[Form] [char](2) NULL,
	[Heat] [varchar](50) NULL,
	[Lot] [varchar](10) NULL,
	[CC] [char](1) NULL,
	[CL] [char](1) NULL,
	[RandLen] [bit] NOT NULL,
	[Shipped] [date] NULL,
	[InvoiceDate] [date] NULL,
	[Invoice_QTY] [money] NULL,
	[Invoice_P] [money] NULL,
	[Invoice_Total] [money] NULL,
	[ProfitMargin] [money] NULL,
	[Disc_Allowed] [money] NULL,
	[ReconDiff] [money] NULL,
	[Freight] [money] NULL,
	[Orig_PC] [int] NULL,
	[Orig_Dim1] [numeric](10, 4) NULL,
	[Orig_Dim2] [numeric](9, 3) NULL,
	[Orig_Dim3] [numeric](9, 3) NULL,
	[Orig_LBS] [numeric](9, 1) NULL,
	[Orig_QTY] [money] NULL,
	[Orig_P] [money] NULL,
	[Orig_PU] [tinyint] NULL,
	[Orig_Total]  AS ([Orig_QTY]*[Orig_P]) PERSISTED,
	[Reconciled] [bit] NOT NULL,
	[Sales_Detail_ID] [int] NULL,
	[Process_Grab_ID] [int] NULL,
	[StkPaid_P] [money] NULL,
	[StkPaid_Total] [money] NULL,
	[canc_SOitem] [bit] NULL,
	[ID_Packing] [int] NULL,
	[PackingSli] [int] NULL,
	[PS_PC] [int] NULL,
	[PS_Form] [char](2) NULL,
	[PS_Dim1] [numeric](10, 4) NULL,
	[PS_Dim2] [numeric](9, 3) NULL,
	[PS_Dim3] [numeric](9, 3) NULL,
	[PS_LBS] [numeric](9, 1) NULL,
	[PS_QTY] [money] NULL,
	[PS_HPA_QTY] [money] NULL,
	[PS_Cncl] [bit] NULL,
	[Left_PC] [int] NULL,
	[Left_Dim1] [numeric](10, 4) NULL,
	[Left_Dim2] [numeric](9, 3) NULL,
	[Left_Dim3] [numeric](9, 3) NULL,
	[Left_LBS] [numeric](9, 1) NULL,
	[Left_QTY] [money] NULL,
	[WO] [int] NOT NULL,
	[WO_Detail] [int] NOT NULL,
	[UserEdit] [varchar](max) NULL,
	[Returned] [date] NULL,
	[RMA_Detail_ID] [int] NULL,
	[Return_ID_Master] [int] NULL,
	[Return_ID_Detail] [int] NULL,
	[Who_Rec] [varchar](255) NULL,
	[Who_Add] [varchar](255) NOT NULL,
	[When_Add] [datetime] NOT NULL,
 CONSTRAINT [PK_Sales_Stock_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SalesP_Customer]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SalesP_Customer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SalesP_Customer](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SoldCode] [int] NULL,
	[SalesP] [char](1) NOT NULL,
	[NoNoiseName] [char](30) NOT NULL,
	[Customer] [char](30) NULL,
	[CustID] [char](20) NULL,
 CONSTRAINT [PK_SalesP_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Scan_Code]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Scan_Code]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Scan_Code](
	[ID] [int] IDENTITY(10,1) NOT NULL,
	[Code] [char](2) NOT NULL,
	[Descript] [varchar](30) NOT NULL,
	[Min] [int] NOT NULL,
	[Max] [int] NOT NULL,
	[Base] [char](2) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ship]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ship]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ship](
	[SalesNum] [int] NOT NULL,
	[SalesP] [char](1) NULL,
	[Orderdate] [datetime] NULL,
	[Company] [varchar](30) NULL,
	[PO_num] [varchar](20) NULL,
	[Alloy] [char](12) NULL,
	[DueDate] [datetime] NULL,
	[ShipDate] [datetime] NULL,
	[ShipVia] [varchar](20) NULL,
	[SOitem] [char](10) NULL,
	[Item] [decimal](2, 0) NULL,
	[Cncld] [bit] NULL,
	[QShipped] [int] NULL,
	[Brokered] [bit] NULL,
	[Complete] [bit] NULL,
	[RMA_No] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Who] [varchar](255) NOT NULL,
	[When] [datetime] NOT NULL,
	[Program] [varchar](50) NULL,
 CONSTRAINT [PK_ship] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ShipAddrCode]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShipAddrCode]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ShipAddrCode](
	[shipcode] [decimal](10, 0) NOT NULL,
	[customer] [char](20) NULL,
	[oldcode] [decimal](10, 0) NULL,
 CONSTRAINT [PK_shipaddrcode] PRIMARY KEY CLUSTERED 
(
	[shipcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ShippingList]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingList]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ShippingList](
	[PackageID] [int] IDENTITY(1,1) NOT NULL,
	[WhoEntered] [varchar](50) NOT NULL,
	[PackageWeight] [decimal](8, 3) NOT NULL,
	[BoxLength] [decimal](6, 2) NOT NULL,
	[BoxWidth] [decimal](6, 2) NOT NULL,
	[BoxHeight] [decimal](6, 2) NOT NULL,
	[PackageNumber] [int] NOT NULL,
	[TotalPackages] [int] NOT NULL,
	[Customer] [varchar](50) NOT NULL,
	[DateReady] [datetime] NOT NULL,
	[DateDue] [datetime] NOT NULL,
	[Carrier] [varchar](50) NOT NULL,
	[Freight] [bit] NOT NULL,
	[Export] [bit] NOT NULL,
	[Tipton] [bit] NOT NULL,
	[Windfall] [bit] NOT NULL,
	[Complete_PackingSlip] [bit] NOT NULL,
	[Complete_Cert] [bit] NOT NULL,
	[Complete_Label] [bit] NOT NULL,
	[Complete_BOL] [bit] NOT NULL,
	[HasBeenPickedUP] [bit] NOT NULL,
	[PickedUpCheckDate] [datetime] NULL,
	[WhoCheckedPickup] [varchar](50) NULL,
	[UPS_FedEX_PS_SignOff_Time] [datetime] NULL,
	[Who_Took_Pouch] [varchar](50) NULL,
	[Who_Entered_Pouch_SignOff] [varchar](50) NULL,
	[WhoLoadedTruck] [varchar](50) NULL,
	[TruckLoadedDate] [datetime] NULL,
	[TrackingCode] [varchar](50) NULL,
	[Canceled] [bit] NULL,
	[CancelReason] [varchar](50) NULL,
	[HoldId] [int] NULL,
 CONSTRAINT [PK_ShippingList3] PRIMARY KEY CLUSTERED 
(
	[PackageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ShippingList_Archive]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingList_Archive]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ShippingList_Archive](
	[ArchiveID] [int] IDENTITY(1,1) NOT NULL,
	[ArchiveDate] [datetime] NOT NULL,
	[PackageID] [int] NOT NULL,
	[WhoEntered] [varchar](50) NOT NULL,
	[PackageWeight] [decimal](8, 3) NOT NULL,
	[BoxLength] [decimal](6, 2) NOT NULL,
	[BoxWidth] [decimal](6, 2) NOT NULL,
	[BoxHeight] [decimal](6, 2) NOT NULL,
	[PackageNumber] [int] NOT NULL,
	[TotalPackages] [int] NOT NULL,
	[Customer] [varchar](50) NOT NULL,
	[DateReady] [datetime] NOT NULL,
	[DateDue] [datetime] NOT NULL,
	[Carrier] [varchar](50) NOT NULL,
	[Freight] [bit] NOT NULL,
	[Export] [bit] NOT NULL,
	[Tipton] [bit] NOT NULL,
	[Windfall] [bit] NOT NULL,
	[Complete_PackingSlip] [bit] NOT NULL,
	[Complete_Cert] [bit] NOT NULL,
	[Complete_Label] [bit] NOT NULL,
	[Complete_BOL] [bit] NOT NULL,
	[HasBeenPickedUP] [bit] NOT NULL,
	[PickedUpCheckDate] [datetime] NULL,
	[WhoCheckedPickup] [varchar](50) NULL,
	[UPS_FedEX_PS_SignOff_Time] [datetime] NULL,
	[Who_Took_Pouch] [varchar](50) NULL,
	[Who_Entered_Pouch_SignOff] [varchar](50) NULL,
	[WhoLoadedTruck] [varchar](50) NULL,
	[TruckLoadedDate] [datetime] NULL,
	[TrackingCode] [varchar](50) NULL,
	[Canceled] [bit] NULL,
	[CancelReason] [varchar](50) NULL,
	[HoldId] [int] NULL,
 CONSTRAINT [PK_ShippingList_Archive2_1] PRIMARY KEY CLUSTERED 
(
	[PackageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ShippingList_Holds]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingList_Holds]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ShippingList_Holds](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Hold_Date] [datetime] NOT NULL,
	[Hold_Release_Date] [datetime] NULL,
	[Hold_Reason] [varchar](50) NOT NULL,
	[Who_Held] [varchar](50) NOT NULL,
	[Who_Released] [varchar](50) NULL,
 CONSTRAINT [PK_ShippingList_Holds2] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ShippingList_Items]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingList_Items]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ShippingList_Items](
	[ItemID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[PackageID] [int] NOT NULL,
	[SO] [int] NOT NULL,
	[SOitem] [tinyint] NOT NULL,
	[ItemCount] [int] NOT NULL,
	[ItemTotal] [int] NOT NULL,
	[Customer] [varchar](50) NOT NULL,
	[DateDue] [datetime] NOT NULL,
	[Carrier] [varchar](50) NOT NULL,
	[Export] [bit] NOT NULL,
 CONSTRAINT [PK_ShippingList_Items] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ShippingList_Items_Archive]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingList_Items_Archive]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ShippingList_Items_Archive](
	[ItemID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[PackageArchiveID] [int] NOT NULL,
	[SO] [int] NOT NULL,
	[SOitem] [tinyint] NOT NULL,
	[ItemCount] [int] NOT NULL,
	[ItemTotal] [int] NOT NULL,
	[Customer] [varchar](50) NOT NULL,
	[DateDue] [datetime] NOT NULL,
	[Carrier] [varchar](50) NOT NULL,
	[Export] [bit] NOT NULL,
 CONSTRAINT [PK_ShippingList_Item_Archive] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SO_BoilerPlate]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SO_BoilerPlate]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SO_BoilerPlate](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Company] [varchar](30) NULL,
	[Alloy] [char](12) NULL,
	[Form] [char](2) NULL,
	[CC] [char](1) NULL,
	[Thck_Min] [decimal](10, 4) NULL,
	[Thck_Max] [decimal](10, 4) NULL,
	[Sz2_Min] [decimal](10, 3) NULL,
	[Sz2_Max] [decimal](10, 3) NULL,
	[Description] [varchar](max) NULL,
	[EoPage] [varchar](max) NULL,
	[Spec] [varchar](max) NULL,
	[Binary] [int] NOT NULL,
 CONSTRAINT [PK_SO_BoilerPlate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SOitem_X]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SOitem_X]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SOitem_X](
	[x] [tinyint] NOT NULL,
	[Descript] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SOitem_X] PRIMARY KEY CLUSTERED 
(
	[x] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Sold_Ship]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sold_Ship]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sold_Ship](
	[soldcode] [decimal](10, 0) NOT NULL,
	[shipcode] [decimal](10, 0) NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
 CONSTRAINT [PK_sold_ship] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SoldAddrCode]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SoldAddrCode]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SoldAddrCode](
	[soldcode] [decimal](10, 0) NOT NULL,
	[customer] [char](20) NULL,
	[oldcode] [decimal](10, 0) NULL,
 CONSTRAINT [PK_soldaddrcode] PRIMARY KEY CLUSTERED 
(
	[soldcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SOmax]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SOmax]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SOmax](
	[SalesNum] [int] NOT NULL,
	[Locked] [bit] NULL,
 CONSTRAINT [PK_SOmax] PRIMARY KEY CLUSTERED 
(
	[SalesNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SourcePH]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SourcePH]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SourcePH](
	[company] [varchar](30) NULL,
	[phone] [char](10) NULL,
	[fax] [char](10) NULL,
	[person] [varchar](15) NULL,
	[email] [varchar](60) NULL,
	[email2] [varchar](60) NULL,
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[InActive] [bit] NULL,
	[VendCode] [int] NULL,
	[ContactID] [int] NULL,
 CONSTRAINT [PK_sourceph_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Sources]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sources]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sources](
	[Company] [varchar](30) NULL,
	[Alloy_AKA] [char](12) NULL,
	[Alloy] [char](12) NULL,
	[alloy_num] [char](12) NULL,
	[UNS] [char](6) NULL,
	[Spec] [varchar](50) NULL,
	[f10] [bit] NULL,
	[f20] [bit] NULL,
	[f30] [bit] NULL,
	[f40] [bit] NULL,
	[f60] [bit] NULL,
	[f65] [bit] NULL,
	[f70] [bit] NULL,
	[f75] [bit] NULL,
	[Notes] [varchar](max) NULL,
	[Stk] [bit] NULL,
	[MK] [bit] NULL,
	[ID] [int] NULL,
	[ID_Sources] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[VendCode] [int] NULL,
 CONSTRAINT [PK_Sources_1] PRIMARY KEY CLUSTERED 
(
	[ID_Sources] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Spec_Check]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Spec_Check]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Spec_Check](
	[alloy] [char](20) NOT NULL,
	[group] [char](10) NOT NULL,
	[CC] [char](1) NULL,
	[CL] [char](1) NULL,
	[spec] [char](30) NOT NULL,
	[rev] [char](10) NOT NULL,
	[description] [char](60) NOT NULL,
	[diamax] [decimal](7, 3) NULL,
	[diamin] [decimal](7, 3) NULL,
	[utsmax] [decimal](10, 0) NULL,
	[utsmin] [decimal](10, 0) NULL,
	[yldmax] [decimal](10, 0) NULL,
	[yldmin] [decimal](10, 0) NULL,
	[elmin] [decimal](10, 0) NULL,
	[ramin] [decimal](10, 0) NULL,
	[bhnmax] [decimal](3, 0) NULL,
	[bhnmin] [decimal](3, 0) NULL,
	[rcmax] [decimal](3, 0) NULL,
	[rcmin] [decimal](3, 0) NULL,
	[rbmax] [decimal](3, 0) NULL,
	[rbmin] [decimal](3, 0) NULL,
	[grainmax] [char](10) NULL,
	[grainmin] [char](10) NULL,
	[almax] [decimal](8, 5) NULL,
	[almin] [decimal](8, 5) NULL,
	[alrem] [bit] NULL,
	[bmax] [decimal](8, 5) NULL,
	[bmin] [decimal](8, 5) NULL,
	[bemax] [decimal](8, 5) NULL,
	[bemin] [decimal](8, 5) NULL,
	[cmax] [decimal](8, 5) NULL,
	[cmin] [decimal](8, 5) NULL,
	[cbmax] [decimal](8, 5) NULL,
	[cbmin] [decimal](8, 5) NULL,
	[comax] [decimal](8, 5) NULL,
	[comin] [decimal](8, 5) NULL,
	[corem] [bit] NULL,
	[crmax] [decimal](8, 5) NULL,
	[crmin] [decimal](8, 5) NULL,
	[cumax] [decimal](8, 5) NULL,
	[cumin] [decimal](8, 5) NULL,
	[curem] [bit] NULL,
	[femax] [decimal](8, 5) NULL,
	[femin] [decimal](8, 5) NULL,
	[ferem] [bit] NULL,
	[hmax] [decimal](8, 5) NULL,
	[hmin] [decimal](8, 5) NULL,
	[mgmax] [decimal](8, 5) NULL,
	[mgmin] [decimal](8, 5) NULL,
	[mgrem] [bit] NULL,
	[mnmax] [decimal](8, 5) NULL,
	[mnmin] [decimal](8, 5) NULL,
	[momax] [decimal](8, 5) NULL,
	[momin] [decimal](8, 5) NULL,
	[morem] [bit] NULL,
	[nmax] [decimal](8, 5) NULL,
	[nmin] [decimal](8, 5) NULL,
	[namax] [decimal](8, 5) NULL,
	[namin] [decimal](8, 5) NULL,
	[nbmax] [decimal](8, 5) NULL,
	[nbmin] [decimal](8, 5) NULL,
	[nimax] [decimal](8, 5) NULL,
	[nimin] [decimal](8, 5) NULL,
	[nirem] [bit] NULL,
	[omin] [decimal](8, 5) NULL,
	[omax] [decimal](8, 5) NULL,
	[pmax] [decimal](8, 5) NULL,
	[pmin] [decimal](8, 5) NULL,
	[pbmax] [decimal](8, 5) NULL,
	[pbmin] [decimal](8, 5) NULL,
	[pbrem] [bit] NULL,
	[smax] [decimal](8, 5) NULL,
	[smin] [decimal](8, 5) NULL,
	[simax] [decimal](8, 5) NULL,
	[simin] [decimal](8, 5) NULL,
	[tamax] [decimal](8, 5) NULL,
	[tamin] [decimal](8, 5) NULL,
	[timax] [decimal](8, 5) NULL,
	[timin] [decimal](8, 5) NULL,
	[tirem] [bit] NULL,
	[vmax] [decimal](8, 5) NULL,
	[vmin] [decimal](8, 5) NULL,
	[wmax] [decimal](8, 5) NULL,
	[wmin] [decimal](8, 5) NULL,
	[wrem] [bit] NULL,
	[ymax] [decimal](8, 5) NULL,
	[ymin] [decimal](8, 5) NULL,
	[cbtamax] [decimal](8, 5) NULL,
	[cbtamin] [decimal](8, 5) NULL,
	[nicomax] [decimal](8, 5) NULL,
	[nicomin] [decimal](8, 5) NULL,
	[fecrnimax] [decimal](8, 5) NULL,
	[fecrnimin] [decimal](8, 5) NULL,
	[stabilize] [char](20) NULL,
	[stabilize2] [char](20) NULL,
	[memo] [varchar](max) NULL,
	[exception] [varchar](max) NULL,
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Who] [varchar](255) NULL,
	[When] [datetime] NULL,
 CONSTRAINT [PK_Spec_Check] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Spec_Check] UNIQUE NONCLUSTERED 
(
	[alloy] ASC,
	[group] ASC,
	[spec] ASC,
	[rev] ASC,
	[description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Spec_tol]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Spec_tol]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Spec_tol](
	[uns] [varchar](6) NOT NULL,
	[form] [char](2) NOT NULL,
	[spec] [varchar](14) NOT NULL,
	[rev] [varchar](9) NOT NULL,
	[revy] [char](4) NOT NULL,
	[toltable] [varchar](30) NOT NULL,
	[condition] [varchar](27) NOT NULL,
	[finish] [varchar](40) NOT NULL,
	[size1] [decimal](9, 4) NOT NULL,
	[size2] [decimal](9, 4) NOT NULL,
	[width1] [decimal](5, 3) NOT NULL,
	[width2] [decimal](5, 3) NOT NULL,
	[plus] [decimal](9, 6) NOT NULL,
	[minus] [decimal](9, 6) NOT NULL,
	[ooround] [decimal](9, 6) NOT NULL,
	[straight] [varchar](11) NOT NULL,
	[straightnum] [decimal](9, 6) NOT NULL,
	[flat] [varchar](14) NOT NULL,
	[flatnum] [decimal](9, 6) NOT NULL,
	[camber] [varchar](11) NOT NULL,
	[cambernum] [decimal](9, 6) NOT NULL,
	[cut_p] [varchar](11) NOT NULL,
	[cut_pnum] [decimal](9, 6) NOT NULL,
	[cut_m] [varchar](11) NOT NULL,
	[cut_mnum] [decimal](9, 6) NOT NULL,
	[len_p] [varchar](11) NOT NULL,
	[len_pnum] [decimal](9, 6) NOT NULL,
	[len_m] [varchar](11) NULL,
	[len_mnum] [decimal](9, 6) NOT NULL,
	[abrasive_p] [decimal](9, 6) NOT NULL,
	[abrasive_m] [decimal](9, 6) NOT NULL,
	[plasma_p] [decimal](9, 6) NOT NULL,
	[plasma_m] [decimal](9, 6) NOT NULL,
	[comment] [varchar](254) NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
 CONSTRAINT [PK_Spec_tol] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[StandardSize]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StandardSize]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StandardSize](
	[Thck] [decimal](9, 3) NOT NULL,
	[Note] [varchar](10) NULL,
 CONSTRAINT [PK_StandardSize] PRIMARY KEY NONCLUSTERED 
(
	[Thck] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_StandardSize] UNIQUE CLUSTERED 
(
	[Thck] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[STAR_DatePeriod]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[STAR_DatePeriod]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[STAR_DatePeriod](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[DatePeriod] [varchar](25) NOT NULL,
 CONSTRAINT [PK_STAR_DatePeriod] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[STAR_Inventory]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[STAR_Inventory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[STAR_Inventory](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Tier] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Location] [smallint] NOT NULL,
	[Stock] [int] NOT NULL,
	[LowInventoryThreshold] [smallint] NOT NULL,
	[EmailForInventory] [varchar](255) NOT NULL,
	[WhoCreated] [varchar](100) NOT NULL,
	[LastModified] [timestamp] NOT NULL,
 CONSTRAINT [PK_STAR_Inventory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[STAR_Inventory_StockChanges]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[STAR_Inventory_StockChanges]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[STAR_Inventory_StockChanges](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[InventoryID] [uniqueidentifier] NOT NULL,
	[StockChange] [int] NOT NULL,
	[WhoChanged] [varchar](100) NOT NULL,
	[Date] [datetime] NOT NULL,
	[LastModified] [timestamp] NOT NULL,
 CONSTRAINT [PK_STAR_Inventory_StockChanges] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[STAR_Locations]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[STAR_Locations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[STAR_Locations](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Location] [varchar](50) NOT NULL,
	[Abbreviation] [varchar](10) NOT NULL,
 CONSTRAINT [PK_STAR_Locations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[STAR_Rewards]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[STAR_Rewards]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[STAR_Rewards](
	[RewardID] [uniqueidentifier] NOT NULL,
	[EmployeeID] [bigint] NOT NULL,
	[DateReceived] [datetime] NOT NULL,
	[Action] [varchar](250) NOT NULL,
	[InventoryItemReceived] [uniqueidentifier] NOT NULL,
	[ItemsReceived] [smallint] NOT NULL,
	[InitiatedBy] [varchar](100) NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedReason] [varchar](250) NULL,
	[DeletedBy] [varchar](100) NULL,
	[LastModified] [timestamp] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[STAR_Tiers]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[STAR_Tiers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[STAR_Tiers](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Monetary] [bit] NOT NULL,
	[TimeRestricted] [bit] NOT NULL,
	[DatePeriod] [smallint] NULL,
	[NumberOfDatePeriods] [int] NULL,
	[RewardsPerTimeRestriction] [int] NULL,
	[Disabled] [bit] NOT NULL,
	[WhoCreated] [varchar](100) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Amount] [money] NOT NULL,
	[LastModified] [timestamp] NOT NULL,
 CONSTRAINT [PK_STAR_Tiers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[STAR_User_Location]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[STAR_User_Location]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[STAR_User_Location](
	[SID] [varchar](100) NOT NULL,
	[MyLocation] [smallint] NOT NULL,
	[LastModified] [timestamp] NOT NULL,
 CONSTRAINT [PK_STAR_User_Location] PRIMARY KEY CLUSTERED 
(
	[SID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[StartingStock]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StartingStock]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StartingStock](
	[Alloy] [char](12) NULL,
	[Form] [char](2) NULL,
	[CC] [char](1) NULL,
	[CL] [char](1) NULL,
	[Pieces] [int] NULL,
	[Thck] [numeric](10, 4) NULL,
	[Sz2] [numeric](9, 3) NULL,
	[Sz3] [numeric](9, 3) NULL,
	[Weight] [numeric](18, 8) NULL,
	[Descript] [varchar](50) NULL,
	[Comment] [varchar](max) NULL,
	[InqNumP] [char](9) NOT NULL,
	[SOitem] [char](10) NULL,
	[POitem] [char](12) NULL,
	[RandLen] [bit] NULL,
	[Metric] [bit] NULL,
	[AllQuotes_ID] [int] NOT NULL,
 CONSTRAINT [PK_Starting_Stock] PRIMARY KEY CLUSTERED 
(
	[AllQuotes_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Stock_Receiving]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Stock_Receiving]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Stock_Receiving](
	[TBL] [char](1) NOT NULL,
	[Alloy] [char](12) NULL,
	[Form] [char](2) NULL,
	[CC] [char](1) NULL,
	[CL] [char](1) NULL,
	[Size] [decimal](9, 3) NULL,
	[Cond] [varchar](50) NULL,
	[MWeight] [decimal](18, 8) NULL,
	[Specs] [varchar](160) NULL,
	[Heat] [varchar](50) NULL,
	[Lot] [char](10) NULL,
	[Paid] [money] NULL,
	[PO_item] [char](12) NULL,
	[PoDueDate] [smalldatetime] NULL,
	[Mill] [char](10) NULL,
	[StkDate] [smalldatetime] NULL,
	[History] [char](20) NULL,
	[Num] [decimal](8, 0) NULL,
	[POStatus] [char](1) NULL,
	[BrandName] [char](20) NULL,
	[FROM_ID] [int] NULL,
	[Melt] [varchar](7) NULL,
	[ID] [int] NOT NULL,
	[mS_QTY] [money] NULL,
	[WO_Detail] [int] NULL,
	[ProjID] [int] NULL,
	[MillTrace] [bit] NULL,
	[DescriptID]  AS ((((isnull([Alloy],'            ')+isnull([Form],'  '))+isnull([CC],' '))+isnull([CL],' '))+str(round([Size],(9),(3)),(9),(3))) PERSISTED,
	[Size_H] [decimal](9, 4) NULL,
	[Size_L] [decimal](9, 4) NULL,
	[PC] [int] NULL,
	[Dim1] [decimal](18, 4) NULL,
	[Dim2] [decimal](18, 4) NULL,
	[Dim3] [decimal](18, 4) NULL,
	[Length] [char](160) NULL,
	[Weight] [decimal](18, 4) NULL,
	[CostValue] [money] NULL,
	[Descript] [varchar](20) NULL,
	[Location] [char](10) NULL,
	[FloorStatus] [char](1) NULL,
	[Class] [char](1) NULL,
	[Unit] [char](6) NULL,
	[RandLen] [bit] NULL,
	[InvCheck] [datetime] NULL,
	[ID_Detail] [int] NOT NULL,
	[ReceivingID] [int] NULL,
	[InvoiceValue] [money] NULL,
	[LiveCheck] [bit] NULL,
	[AccountingCheck] [bit] NULL,
	[Quarantine] [bit] NULL,
	[S_QTY] [money] NULL,
	[S_P] [money] NULL,
	[S_Total] [money] NULL,
	[S_PU] [tinyint] NULL,
	[Prime] [bit] NULL,
	[WO] [int] NULL,
	[SaveDate] [smalldatetime] NULL,
	[SnapShot_ID] [int] IDENTITY(1000,1) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Stock_Recv_Process]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Stock_Recv_Process]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Stock_Recv_Process](
	[SnapShot_ID] [int] NOT NULL,
	[TBL] [char](1) NULL,
	[SOitem] [char](10) NULL,
	[PO_item] [char](12) NULL,
	[SalesPerson] [char](20) NULL,
	[StartDate] [datetime] NOT NULL,
	[DueDate] [datetime] NULL,
	[Comment] [varchar](100) NOT NULL,
	[Process_ID] [char](10) NOT NULL,
	[Processor] [char](20) NULL,
	[AllowSub] [char](1) NULL,
	[PU] [tinyint] NULL,
	[QTY] [money] NULL,
	[Ordered_QTY] [money] NULL,
	[Ordered_P] [money] NULL,
	[Pounds] [decimal](9, 1) NULL,
	[ID_Detail] [int] NOT NULL,
	[ID_Detail_Process] [int] NOT NULL,
	[ReceivingID] [int] NULL,
	[WO] [int] NULL,
	[WO_Detail] [int] NULL,
	[InqNumP] [char](9) NULL,
	[Prc_Form] [char](2) NULL,
	[Prc_PCs] [int] NULL,
	[Prc_Dim1] [numeric](10, 4) NULL,
	[Prc_Dim2] [money] NULL,
	[Prc_Dim3] [money] NULL,
	[FoundStk] [smalldatetime] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Stock_SELE_Process]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Stock_SELE_Process]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Stock_SELE_Process](
	[SnapShot_ID] [int] NOT NULL,
	[TBL] [char](1) NULL,
	[SOitem] [char](10) NULL,
	[PO_item] [char](12) NULL,
	[AllowSub] [char](1) NULL,
	[PU] [tinyint] NULL,
	[QTY] [money] NULL,
	[Ordered_QTY] [money] NULL,
	[Ordered_P] [money] NULL,
	[Pounds] [decimal](9, 1) NULL,
	[ID_Detail] [int] NOT NULL,
	[ID_Detail_Process] [int] NOT NULL,
	[ReceivingID] [int] NULL,
	[WO] [int] NULL,
	[WO_Detail] [int] NULL,
	[Prc_Form] [char](2) NULL,
	[Prc_PCs] [int] NULL,
	[Prc_Dim1] [numeric](10, 4) NULL,
	[Prc_Dim2] [money] NULL,
	[Prc_Dim3] [money] NULL,
	[When] [datetime] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[StockLst_Definition]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Definition]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StockLst_Definition](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Table] [varchar](50) NOT NULL,
	[Column] [varchar](50) NOT NULL,
	[data_type] [varchar](50) NOT NULL,
	[Value] [varchar](50) NOT NULL,
	[Definition] [varchar](100) NOT NULL,
	[Color] [nchar](11) NULL,
 CONSTRAINT [PK_StockLst_Definition] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[StockLst_Detail_Inserted]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Detail_Inserted]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StockLst_Detail_Inserted](
	[ID] [int] IDENTITY(1000,1) NOT FOR REPLICATION NOT NULL,
	[Master_ID] [int] NOT NULL,
	[ID_Detail] [int] NOT NULL,
	[Who] [varchar](255) NOT NULL,
	[When] [datetime] NOT NULL,
	[OrderType] [char](10) NULL,
	[OrderNum] [char](13) NULL,
	[Verified] [bit] NULL,
	[VerifiedBy] [varchar](255) NULL,
 CONSTRAINT [PK_StockLst_Detail_Inserted] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[StockLst_Location]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Location]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StockLst_Location](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Location] [char](10) NOT NULL,
	[Description] [varchar](100) NULL,
	[RemoteStock] [bit] NOT NULL,
	[MaxLBS] [int] NULL,
 CONSTRAINT [PK_StockLst_Location] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_StockLst_Location] UNIQUE CLUSTERED 
(
	[Location] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[StockLst_Mins]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Mins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StockLst_Mins](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Alloy] [char](12) NOT NULL,
	[Form] [char](2) NOT NULL,
	[CC] [char](1) NOT NULL,
	[CL] [char](1) NULL,
	[Thck] [float] NOT NULL,
	[Sz2] [float] NOT NULL,
	[SafeLevel] [int] NOT NULL,
	[MillWeeks] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[Crutial] [bit] NOT NULL,
	[QUsage] [int] NOT NULL,
	[PrevQUsage] [int] NOT NULL,
	[YUsage] [int] NOT NULL,
	[PrevYUsage] [int] NOT NULL,
	[LastEdit] [date] NOT NULL,
	[SafeLevelDate] [date] NOT NULL,
	[DescriptID]  AS ((((isnull([Alloy],'            ')+isnull([Form],'  '))+isnull([CC],' '))+isnull([CL],' '))+str(round([Thck],(9),(3)),(9),(3))) PERSISTED,
 CONSTRAINT [PK_Stock_List_Mins] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[StockLst_Process_Detail]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Process_Detail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StockLst_Process_Detail](
	[Who] [varchar](255) NOT NULL,
	[What] [char](10) NULL,
	[When] [datetime] NOT NULL,
	[ID] [int] NOT NULL,
	[ID_Detail] [int] NULL,
	[ID_Detail_Process] [int] NULL,
	[ID_StockLst_Process_Detail] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[WO] [int] NULL,
	[SOitem] [char](10) NULL,
 CONSTRAINT [PK_StockLst_Process_Detail] PRIMARY KEY NONCLUSTERED 
(
	[ID_StockLst_Process_Detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Index [IX_StockLst_Process_Detail]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Process_Detail]') AND name = N'IX_StockLst_Process_Detail')
CREATE CLUSTERED INDEX [IX_StockLst_Process_Detail] ON [dbo].[StockLst_Process_Detail]
(
	[ID_Detail_Process] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockLst_Process_ID_def]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Process_ID_def]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StockLst_Process_ID_def](
	[text] [nchar](10) NULL,
	[definition] [nvarchar](100) NULL,
	[comment] [nvarchar](200) NULL,
	[inUse] [bit] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[StockLst_Process_Recvd]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Process_Recvd]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StockLst_Process_Recvd](
	[PO_item] [char](12) NULL,
	[SalesPerson] [char](20) NULL,
	[StartDate] [datetime] NOT NULL,
	[DueDate] [datetime] NULL,
	[RecvDate] [datetime] NULL,
	[Comment] [varchar](100) NOT NULL,
	[Process_ID] [char](10) NOT NULL,
	[Processor] [char](20) NULL,
	[PU] [tinyint] NULL,
	[QTY] [money] NULL,
	[Ordered_QTY] [money] NULL,
	[Ordered_P] [money] NULL,
	[Pounds] [decimal](9, 1) NULL,
	[ID_Detail] [int] NOT NULL,
	[ID_Detail_Process] [int] NOT NULL,
	[ReceivingID] [int] NOT NULL,
	[WO_Detail] [int] NULL,
	[Prc_Form] [char](2) NULL,
	[Prc_PCs] [int] NULL,
	[Prc_Dim1] [numeric](10, 4) NULL,
	[Prc_Dim2] [money] NULL,
	[Prc_Dim3] [money] NULL,
 CONSTRAINT [PK_stockLst_process_recvd] PRIMARY KEY CLUSTERED 
(
	[ID_Detail_Process] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[StockLst_Value]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Value]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StockLst_Value](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ID_Detail] [int] NOT NULL,
	[TBL] [char](1) NOT NULL,
	[ID_Detail_Process] [int] NULL,
	[InvoiceValue] [money] NOT NULL,
	[CurrUnitPrice] [money] NOT NULL,
	[CurrUnits] [money] NOT NULL,
	[CurrTotal] [money] NOT NULL,
	[InvoiceDate] [datetime] NOT NULL,
	[POitem] [char](12) NULL,
	[LastEdit] [datetime] NOT NULL,
	[VI_ID_Detail] [int] NOT NULL,
	[calcTotal]  AS (isnull([CurrUnits]*[CurrUnitPrice],(0))),
 CONSTRAINT [PK_StockLst_Value] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_StockLst_Value-ID_Detail-TBL]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Value]') AND name = N'IX_StockLst_Value-ID_Detail-TBL')
CREATE UNIQUE CLUSTERED INDEX [IX_StockLst_Value-ID_Detail-TBL] ON [dbo].[StockLst_Value]
(
	[ID_Detail] ASC,
	[TBL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockLst_Writeoff]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Writeoff]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StockLst_Writeoff](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[alloy] [char](12) NOT NULL,
	[form] [char](2) NOT NULL,
	[thck] [decimal](9, 4) NOT NULL,
	[stocked] [bit] NOT NULL,
 CONSTRAINT [PK_StockLst_Writeoff] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SupplierQuotes]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SupplierQuotes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SupplierQuotes](
	[supplier] [varchar](30) NOT NULL,
	[contact] [varchar](30) NOT NULL,
	[unitprice] [money] NULL,
	[quantity] [decimal](9, 1) NULL,
	[PcPrice] [money] NULL,
	[duedate] [date] NULL,
	[savedate] [date] NOT NULL,
	[inqnump] [char](9) NOT NULL,
	[alloy] [char](12) NOT NULL,
	[form] [char](2) NOT NULL,
	[CC] [char](1) NULL,
	[CL] [char](1) NULL,
	[thck] [decimal](10, 4) NOT NULL,
	[sz2] [decimal](9, 3) NULL,
	[sz3] [decimal](9, 3) NULL,
	[Notes] [varchar](30) NULL,
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
 CONSTRAINT [PK_SupplierQuotes] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SupplierQuotes]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SupplierQuotes]') AND name = N'IX_SupplierQuotes')
CREATE CLUSTERED INDEX [IX_SupplierQuotes] ON [dbo].[SupplierQuotes]
(
	[alloy] ASC,
	[form] ASC,
	[thck] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Survey]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Survey]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Survey](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[SurveyType] [smallint] NOT NULL,
	[IsConfidential] [bit] NOT NULL,
 CONSTRAINT [PK_Survey] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Survey_Assignment_CorrectiveAction_ActionStatus_Def]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Survey_Assignment_CorrectiveAction_ActionStatus_Def]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Survey_Assignment_CorrectiveAction_ActionStatus_Def](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[ClosedStatus] [bit] NOT NULL,
 CONSTRAINT [PK_Survey_Assignment_CorrectiveAction_ActionStatus_Def] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Survey_Assignment_CorrectiveAction_Communications]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Survey_Assignment_CorrectiveAction_Communications]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Survey_Assignment_CorrectiveAction_Communications](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Survey_Assignment_CorrectiveActionID] [uniqueidentifier] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[WhoCommunicated] [varchar](100) NOT NULL,
	[ByEmail] [bit] NOT NULL,
	[ByPhone] [bit] NOT NULL,
	[IsSurveyUser] [bit] NOT NULL,
	[IsConfidential] [bit] NOT NULL,
	[LastModified] [timestamp] NOT NULL,
	[CommunicationSummary] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Survey_Assignment_CorrectiveAction_Communications] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Survey_Assignment_CorrectiveActions]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Survey_Assignment_CorrectiveActions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Survey_Assignment_CorrectiveActions](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Survey_AssignmentID] [uniqueidentifier] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[AssignedTo] [varchar](100) NOT NULL,
	[ActionStatus] [smallint] NOT NULL,
	[LastStatusChange] [datetime] NOT NULL,
	[Result] [varchar](max) NULL,
	[EndDate] [datetime] NULL,
	[LastModified] [timestamp] NOT NULL,
 CONSTRAINT [PK_Survey_Assignment_CorrectiveActions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Survey_Assignment_Type_Def]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Survey_Assignment_Type_Def]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Survey_Assignment_Type_Def](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Survey_Assignment_Type_Def] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Survey_Question_Options]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Survey_Question_Options]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Survey_Question_Options](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Survey_QuestionID] [uniqueidentifier] NOT NULL,
	[order] [smallint] NOT NULL,
	[Header] [varchar](25) NOT NULL,
	[Value] [varchar](max) NOT NULL,
	[Created] [datetime] NOT NULL,
	[LastModified] [timestamp] NOT NULL,
 CONSTRAINT [PK_Survey_Question_Options] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Survey_Question_Responses]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Survey_Question_Responses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Survey_Question_Responses](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Survey_QuestionID] [uniqueidentifier] NOT NULL,
	[Survey_AssignmentID] [uniqueidentifier] NOT NULL,
	[Value] [varchar](max) NOT NULL,
	[ResponseDate] [datetime] NOT NULL,
	[LastModified] [timestamp] NOT NULL,
 CONSTRAINT [PK_Survey_Question_Responses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Survey_Question_Type_Def]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Survey_Question_Type_Def]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Survey_Question_Type_Def](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Survey_Question_Type_Def] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Survey_Questions]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Survey_Questions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Survey_Questions](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[SurveyID] [uniqueidentifier] NOT NULL,
	[order] [smallint] NOT NULL,
	[Title] [varchar](500) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[QuestionType] [smallint] NOT NULL,
	[Required] [bit] NOT NULL,
	[RequiresCorrectiveActionResponse] [bit] NOT NULL,
	[CorrectiveActionThresholdValue] [varchar](max) NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_Survey_Questions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Swage_Log_Detail]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Swage_Log_Detail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Swage_Log_Detail](
	[ID] [int] NOT NULL,
	[Label] [varchar](25) NOT NULL,
	[Data] [int] NOT NULL,
	[POitem] [char](12) NULL,
	[ID2] [int] IDENTITY(1001,1) NOT FOR REPLICATION NOT NULL,
 CONSTRAINT [PK_Swage_Log_Detail] PRIMARY KEY CLUSTERED 
(
	[ID2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TC_Replacement_Employees_Status]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TC_Replacement_Employees_Status]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TC_Replacement_Employees_Status](
	[ID] [smallint] IDENTITY(0,1) NOT NULL,
	[Status] [varchar](25) NOT NULL,
 CONSTRAINT [PK_TC_Replacement_Employees_Status] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Testing_log]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Testing_log]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Testing_log](
	[alloyname] [char](12) NULL,
	[heat] [char](50) NULL,
	[date] [datetime] NULL,
	[form] [char](2) NULL,
	[sPiece] [decimal](5, 1) NULL,
	[sSize] [decimal](9, 3) NULL,
	[sWeight] [decimal](8, 1) NULL,
	[Machine] [char](1) NULL,
	[lot] [int] NOT NULL,
	[M_Oper] [varchar](10) NULL,
	[WO] [int] NULL,
	[WO_Detail] [int] NULL,
	[ProjID] [int] NULL,
	[SOitem] [char](10) NULL,
	[HTreat] [char](16) NULL,
	[OvenTemp] [smallint] NULL,
	[ColdWork] [decimal](3, 3) NULL,
	[Spec] [varchar](50) NULL,
	[Condition] [char](10) NULL,
	[Notes] [varchar](max) NULL,
	[T_Oper] [varchar](10) NULL,
	[passed] [bit] NULL,
	[AC_ID] [int] NULL,
	[AC_cmplt] [bit] NULL,
	[CustomerMat] [bit] NULL,
	[Tensile] [decimal](6, 0) NULL,
	[Yield] [decimal](6, 0) NULL,
	[Elongation] [decimal](4, 1) NULL,
	[Red_Area] [decimal](4, 1) NULL,
	[Rockwell] [char](4) NULL,
	[BHN] [decimal](3, 0) NULL,
	[ID] [int] IDENTITY(1000,1) NOT FOR REPLICATION NOT NULL,
	[WhoInsert] [varchar](254) NULL,
 CONSTRAINT [PK_Test_log] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ThermalCoupleName]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ThermalCoupleName]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ThermalCoupleName](
	[HPAName] [varchar](50) NOT NULL,
	[Serial] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ThermalCoupleName] PRIMARY KEY CLUSTERED 
(
	[HPAName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ThermalCoupleUse]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ThermalCoupleUse]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ThermalCoupleUse](
	[UseID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[HPAName] [varchar](50) NOT NULL,
	[Used] [datetime] NOT NULL,
	[Temp] [smallint] NOT NULL,
	[Hours] [tinyint] NOT NULL,
	[Log] [char](1) NULL,
	[LogID] [int] NULL,
	[Lot] [int] NULL,
	[LotID] [tinyint] NULL,
 CONSTRAINT [PK_ThermalCoupleUse] PRIMARY KEY NONCLUSTERED 
(
	[UseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_ThermalCoupleUse] UNIQUE CLUSTERED 
(
	[UseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TimeTable]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TimeTable]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TimeTable](
	[ID] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[SOItem] [char](10) NOT NULL,
	[Process] [char](10) NOT NULL,
	[ClockStart] [datetime] NOT NULL,
	[ClockStop] [datetime] NULL,
	[Minutes] [smallint] NULL,
	[BandsawCuts] [int] NULL,
 CONSTRAINT [PK_TimeTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TimeTableMaster]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TimeTableMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TimeTableMaster](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[EquipmentID] [char](10) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Minutes] [int] NULL,
	[Date] [datetime] NULL,
	[soitem] [char](10) NOT NULL,
 CONSTRAINT [PK_TimeTableMaste_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TimeTableNotes]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TimeTableNotes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TimeTableNotes](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TimeTableID] [bigint] NOT NULL,
	[Category] [varchar](25) NOT NULL,
	[Note] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_TimeTableNotes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UPSshiproute]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UPSshiproute]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UPSshiproute](
	[shiproute] [char](20) NOT NULL,
	[upsstand] [char](20) NOT NULL,
 CONSTRAINT [PK_upsshiproute] PRIMARY KEY CLUSTERED 
(
	[shiproute] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UPSTracking]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UPSTracking]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UPSTracking](
	[void] [char](1) NULL,
	[TrackID] [char](18) NULL,
	[Packages] [varchar](10) NULL,
	[ShipDate] [datetime] NULL,
	[PackingSli] [numeric](18, 0) NULL,
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
 CONSTRAINT [PK_UPSTracking] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserTrack]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserTrack]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserTrack](
	[mess1] [char](254) NULL,
	[cprogram] [char](60) NULL,
	[errordate] [datetime] NOT NULL,
	[machine] [char](40) NULL,
	[ID] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ServerName] [varchar](50) NULL,
 CONSTRAINT [IX_UserTrack-ID] UNIQUE CLUSTERED 
(
	[ID] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UTlog]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UTlog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UTlog](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[LogType] [varchar](20) NOT NULL,
	[LogID] [int] NOT NULL,
	[UTPass] [bit] NULL,
	[Operator] [varchar](20) NULL,
	[comment] [varchar](max) NULL,
	[Who] [varchar](255) NOT NULL,
	[When] [datetime] NOT NULL,
	[AC_ID] [int] NULL,
 CONSTRAINT [PK_UTlog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Vendor_AuditLog]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vendor_AuditLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Vendor_AuditLog](
	[ID] [uniqueidentifier] NOT NULL,
	[VendCode] [int] NOT NULL,
	[When] [datetime] NOT NULL,
	[AuditJSON] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Vendor_AuditLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Vendor_Invoice]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vendor_Invoice]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Vendor_Invoice](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Vendor_Invoice] [nvarchar](50) NULL,
	[HPAPO] [int] NULL,
	[InvoiceDate] [datetime] NOT NULL,
	[Subtotal] [money] NULL,
	[Freight] [money] NULL,
	[TotalAmount] [money] NULL,
	[Who] [varchar](255) NULL,
 CONSTRAINT [PK_Vendor_Invoice] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Vendor_Invoice_Detail]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vendor_Invoice_Detail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Vendor_Invoice_Detail](
	[ID_Detail] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Vendor_Invoice_ID] [int] NOT NULL,
	[Recv_Qty] [decimal](11, 3) NOT NULL,
	[Recv_P] [money] NULL,
	[Recv_PU] [tinyint] NULL,
	[Recv_OtherP] [numeric](10, 2) NULL,
	[Recv_Total]  AS ([Recv_QTY]*[Recv_P]) PERSISTED,
	[PU] [tinyint] NULL,
	[Order_QTY] [money] NULL,
	[Order_P] [money] NULL,
	[Order_PU] [tinyint] NULL,
	[Order_OtherP] [numeric](10, 2) NULL,
	[OtherFld] [char](10) NULL,
	[ItemTotal] [money] NOT NULL,
	[POitem] [char](12) NOT NULL,
	[Reconciled] [bit] NOT NULL,
	[When] [datetime] NULL,
 CONSTRAINT [PK_Vendor_Invoice_Detail] PRIMARY KEY CLUSTERED 
(
	[ID_Detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Vendor_Invoice_POitem]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vendor_Invoice_POitem]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Vendor_Invoice_POitem](
	[VI_POi_ID] [int] IDENTITY(1000,1) NOT FOR REPLICATION NOT NULL,
	[Vendor_Invoice_ID] [int] NOT NULL,
	[POitem] [char](12) NOT NULL,
	[When] [datetime] NULL,
 CONSTRAINT [PK_Vendor_Invoice_POitem] PRIMARY KEY CLUSTERED 
(
	[VI_POi_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Vendor_Invoice_Receive]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vendor_Invoice_Receive]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Vendor_Invoice_Receive](
	[VI_Receive_ID] [int] IDENTITY(1000,1) NOT NULL,
	[VI_POi_ID] [int] NOT NULL,
	[Receiving_ID] [int] NULL,
	[POitem] [char](12) NOT NULL,
	[S_QTY] [money] NULL,
	[S_P] [money] NULL,
	[S_PU] [tinyint] NULL,
	[S_Recv_Tot]  AS ([S_QTY]*[S_P]) PERSISTED,
	[INV_QTY] [money] NULL,
	[INV_P] [money] NULL,
	[INV_PU] [tinyint] NULL,
	[INV_OtherP] [numeric](10, 2) NULL,
	[INV_OtherFld] [char](10) NULL,
	[INV_Total] [money] NOT NULL,
	[INV_Reconciled] [bit] NOT NULL,
	[INV_When] [datetime] NULL,
 CONSTRAINT [PK_Vendor_Invoice_Receive] PRIMARY KEY CLUSTERED 
(
	[VI_Receive_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Vendor_Invoice_Receive] UNIQUE NONCLUSTERED 
(
	[VI_Receive_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WaterJet]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WaterJet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WaterJet](
	[Thick] [money] NOT NULL,
	[Inch20] [money] NULL,
	[Min20] [float] NULL,
	[M20] [money] NULL,
	[Inch40] [money] NULL,
	[Min40] [float] NULL,
	[m40] [money] NULL,
	[Inch60] [money] NULL,
	[Min60] [float] NULL,
	[M60] [money] NULL,
	[Inch80] [money] NULL,
	[Min80] [float] NULL,
	[M80] [money] NULL,
	[Inch100] [money] NULL,
	[Min100] [float] NULL,
	[m100] [money] NULL,
 CONSTRAINT [PK_WaterJet] PRIMARY KEY CLUSTERED 
(
	[Thick] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WaterJetCostingFormData]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WaterJetCostingFormData]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WaterJetCostingFormData](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SalesNum] [int] NOT NULL,
	[item] [int] NOT NULL,
	[DateReceived] [datetime] NOT NULL,
	[DateComplete] [datetime] NULL,
	[cutAmount] [decimal](9, 2) NULL,
	[cutTime] [int] NULL,
	[ResearchEmpID] [smallint] NULL,
	[ResearchTime] [int] NULL,
	[InputDrawingEmpID] [smallint] NULL,
	[InputDrawingTime] [int] NULL,
	[ToolingPO] [varchar](12) NULL,
	[ToolingCost] [decimal](9, 2) NULL,
	[ToolingEmpID] [smallint] NULL,
	[ToolingTime] [int] NULL,
	[LocateLoadEmpID] [smallint] NULL,
	[LocateLoadTime] [int] NULL,
	[CutFirstArticlePartEmpID] [smallint] NULL,
	[CutFirstArticlePartTime] [int] NULL,
	[MachineCutFirstPartID] [varchar](20) NULL,
	[MachineCutFirstPartTime] [int] NULL,
	[FirstInspectFirstArticleEmpID] [smallint] NULL,
	[FirstInspectFirstArticleTime] [int] NULL,
	[CutBalanceEmpID] [smallint] NULL,
	[CutBalanceTime] [int] NULL,
	[SecondInspectFirstArticleEmpID] [smallint] NULL,
	[SecondInspectFirstArticleTime] [int] NULL,
	[MachineCutBalanceID] [varchar](20) NULL,
	[MachineCutBalanceTime] [int] NULL,
	[MachineDowntimeID] [varchar](20) NULL,
	[MachineDowntimeTime] [int] NULL,
	[WeightInspectReturnToStockEmpID] [smallint] NULL,
	[WeightInspectReturnToStockTime] [int] NULL,
	[PackPartsEmpID] [smallint] NULL,
	[PackPartsTime] [int] NULL,
	[MaterialStartWeight] [decimal](7, 2) NULL,
	[DropsScrapCutoff] [decimal](7, 2) NULL,
	[MaterialReturnedToStock] [decimal](7, 2) NULL,
	[MaterialWeightUsed] [decimal](7, 2) NULL,
	[TotalBilledForItem] [decimal](9, 2) NULL,
 CONSTRAINT [PK_WaterJetCostingForm] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WaterJetMachineHours]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WaterJetMachineHours]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WaterJetMachineHours](
	[ID] [int] NOT NULL,
	[Machine] [nvarchar](50) NOT NULL,
	[Identifier] [int] NOT NULL,
	[Hours] [float] NOT NULL,
 CONSTRAINT [PK_WaterJetMachineHours_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WaterJetMachineHours_Detail]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WaterJetMachineHours_Detail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WaterJetMachineHours_Detail](
	[DetailID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Start] [float] NOT NULL,
	[End] [float] NOT NULL,
	[ID] [int] NOT NULL,
 CONSTRAINT [PK_WaterJetMachineHours_Detail] PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WaterJetMachines]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WaterJetMachines]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WaterJetMachines](
	[Machine] [nvarchar](50) NOT NULL,
	[MIdentifier] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ScanName] [char](10) NOT NULL,
	[Location] [nchar](1) NOT NULL,
 CONSTRAINT [PK_WaterJetMachines] PRIMARY KEY CLUSTERED 
(
	[Machine] ASC,
	[MIdentifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Weight_Flanges]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Weight_Flanges]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Weight_Flanges](
	[type] [char](10) NOT NULL,
	[LB] [smallint] NOT NULL,
	[Size] [float] NOT NULL,
	[lbs] [float] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
 CONSTRAINT [PK_Weight_Flanges] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Weight_Flanges]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Weight_Flanges]') AND name = N'IX_Weight_Flanges')
CREATE UNIQUE CLUSTERED INDEX [IX_Weight_Flanges] ON [dbo].[Weight_Flanges]
(
	[type] ASC,
	[LB] ASC,
	[Size] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[WIPLst_D_Ext]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WIPLst_D_Ext]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WIPLst_D_Ext](
	[WIP_M_ID] [int] NOT NULL,
	[WIP_ID_Detail] [int] NOT NULL,
	[sTBL] [nchar](1) NULL,
	[sID_Detail] [int] NOT NULL,
	[WO] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WIPLst_Detail_Inserted]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WIPLst_Detail_Inserted]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WIPLst_Detail_Inserted](
	[ID] [int] IDENTITY(1000,1) NOT FOR REPLICATION NOT NULL,
	[Master_ID] [int] NOT NULL,
	[ID_Detail] [int] NOT NULL,
	[Who] [varchar](255) NOT NULL,
	[When] [datetime] NOT NULL,
	[OrderType] [char](10) NULL,
	[OrderNum] [char](13) NULL,
	[Verified] [bit] NULL,
	[VerifiedBy] [varchar](255) NULL,
 CONSTRAINT [PK_WIPLst_Detail_Inserted] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WIPLst_M_Ext]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WIPLst_M_Ext]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WIPLst_M_Ext](
	[WIP_M_ID] [int] NOT NULL,
	[sTBL] [nchar](1) NULL,
	[sID] [int] NULL,
	[fID] [int] NULL,
	[WO] [int] NULL,
 CONSTRAINT [PK_WIPLst_M_Ext] PRIMARY KEY CLUSTERED 
(
	[WIP_M_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WIPLst_Master_Inserted]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WIPLst_Master_Inserted]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WIPLst_Master_Inserted](
	[ID] [int] IDENTITY(1000,1) NOT FOR REPLICATION NOT NULL,
	[Master_ID] [int] NOT NULL,
	[Who] [varchar](255) NOT NULL,
	[When] [datetime] NOT NULL,
	[Verified] [bit] NULL,
	[VerifiedBy] [varchar](255) NULL,
 CONSTRAINT [PK_WIPLst_Master_Inserted] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WIPLst_Process_Detail]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WIPLst_Process_Detail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WIPLst_Process_Detail](
	[Who] [varchar](255) NOT NULL,
	[What] [char](10) NULL,
	[When] [datetime] NOT NULL,
	[ID] [int] NOT NULL,
	[ID_Detail] [int] NULL,
	[ID_Detail_Process] [int] NULL,
	[ID_WIPLst_Process_Detail] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[WO] [int] NULL,
	[SOitem] [char](10) NULL,
 CONSTRAINT [PK_WIPLst_Process_Detail] PRIMARY KEY NONCLUSTERED 
(
	[ID_WIPLst_Process_Detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WIPLst_Process_Orig]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WIPLst_Process_Orig]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WIPLst_Process_Orig](
	[SOitem] [char](10) NULL,
	[PO_item] [char](12) NULL,
	[SalesPerson] [char](20) NULL,
	[StartDate] [datetime] NOT NULL,
	[DueDate] [datetime] NULL,
	[Comment] [varchar](100) NOT NULL,
	[Process_ID] [char](10) NOT NULL,
	[Processor] [char](20) NULL,
	[AllowSub] [char](1) NULL,
	[PPc] [int] NULL,
	[PFT] [float] NULL,
	[PU] [tinyint] NULL,
	[QTY] [money] NULL,
	[Pounds] [decimal](9, 1) NULL,
	[ID_Detail] [int] NOT NULL,
	[ID_Detail_Process] [int] NOT NULL,
	[ReceivingID] [int] NOT NULL,
	[WO] [int] NULL,
	[QTY_Due] [money] NULL,
 CONSTRAINT [PK_WIPLst_process_Orig_1] PRIMARY KEY NONCLUSTERED 
(
	[ID_Detail_Process] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WIPLst_Process_Recvd]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WIPLst_Process_Recvd]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WIPLst_Process_Recvd](
	[PO_item] [char](12) NULL,
	[SalesPerson] [char](20) NULL,
	[StartDate] [datetime] NOT NULL,
	[DueDate] [datetime] NULL,
	[RecvDate] [datetime] NULL,
	[Comment] [varchar](100) NOT NULL,
	[Process_ID] [char](10) NOT NULL,
	[Processor] [char](20) NULL,
	[PU] [tinyint] NULL,
	[QTY] [money] NULL,
	[Ordered_QTY] [money] NULL,
	[Ordered_P] [money] NULL,
	[Pounds] [decimal](9, 1) NULL,
	[ID_Detail] [int] NOT NULL,
	[ID_Detail_Process] [int] NOT NULL,
	[ReceivingID] [int] NOT NULL,
	[WO_Detail] [int] NULL,
	[Prc_Form] [char](2) NULL,
	[Prc_PCs] [int] NULL,
	[Prc_Dim1] [numeric](10, 4) NULL,
	[Prc_Dim2] [money] NULL,
	[Prc_Dim3] [money] NULL,
 CONSTRAINT [PK_WIPLst_Process_recvd] PRIMARY KEY CLUSTERED 
(
	[ID_Detail_Process] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Wire_Dies]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Wire_Dies]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Wire_Dies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Dia] [decimal](5, 4) NOT NULL,
	[Angle] [tinyint] NULL,
	[NIB] [nchar](10) NULL,
	[CaseDia] [decimal](4, 3) NOT NULL,
	[Height] [decimal](4, 3) NOT NULL,
	[Descr] [varchar](max) NOT NULL,
	[active] [bit] NOT NULL,
	[worn] [bit] NOT NULL,
	[POitem] [char](12) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Index [IX_Wire_Dies]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Wire_Dies]') AND name = N'IX_Wire_Dies')
CREATE CLUSTERED INDEX [IX_Wire_Dies] ON [dbo].[Wire_Dies]
(
	[active] ASC,
	[Dia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WireTransfers]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WireTransfers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WireTransfers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Sender - Customer] [varchar](100) NOT NULL,
	[Wire Amount] [decimal](12, 2) NULL,
	[ACH Amount] [decimal](12, 2) NULL,
	[Country] [varchar](50) NULL,
	[HP Bank ID] [varchar](50) NULL,
	[ID Number] [varchar](50) NULL,
	[When] [datetime] NOT NULL,
	[Who] [varchar](50) NOT NULL,
	[Notes] [varchar](250) NULL,
 CONSTRAINT [PK_WireTransfers2] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WO_OutSource]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WO_OutSource]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WO_OutSource](
	[ID] [int] IDENTITY(1000,1) NOT NULL,
	[WO] [int] NOT NULL,
	[SOitem] [char](10) NULL,
	[Converter] [varchar](30) NULL,
	[ConvertPOi] [char](12) NULL,
	[ConvertSent] [datetime] NULL,
	[Stock_TBL] [char](1) NULL,
	[Stock_ID] [int] NULL,
	[Stock_ID_D] [int] NULL,
	[Stock_ID_D_P] [int] NULL,
	[Stock_QTY] [int] NULL,
	[Stock_PU] [tinyint] NULL,
	[StockEdit] [datetime] NULL,
	[ReceiveID] [int] NULL,
	[Sales_Detail_ID] [int] NULL,
	[Sales_Stock_ID] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WOD_Orders]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WOD_Orders]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WOD_Orders](
	[ID] [int] IDENTITY(1000,1) NOT NULL,
	[WO_Detail] [int] NOT NULL,
	[SOitem] [char](10) NULL,
	[QTY] [money] NOT NULL,
	[DPAS] [bit] NULL,
	[ID_Detail_Process] [int] NOT NULL,
	[canc] [bit] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WOD_POitem]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WOD_POitem]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WOD_POitem](
	[ID] [int] IDENTITY(1000,1) NOT NULL,
	[WO_Detail] [int] NOT NULL,
	[POitem] [char](12) NOT NULL,
	[Vendor] [varchar](30) NOT NULL,
	[Notes] [nvarchar](max) NOT NULL,
	[Testing] [bit] NOT NULL,
	[DueDate] [smalldatetime] NULL,
	[Received] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WorkOrder_Notes]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkOrder_Notes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WorkOrder_Notes](
	[ID] [int] IDENTITY(1000,1) NOT NULL,
	[WO] [int] NULL,
	[WO_Detail] [int] NULL,
	[Notes] [varchar](max) NULL,
	[DateAdded] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WorkOrder_Stock]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkOrder_Stock]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WorkOrder_Stock](
	[WO] [int] NOT NULL,
	[TBL] [char](1) NOT NULL,
	[sTBL] [char](1) NOT NULL,
	[sMaster_ID] [int] NOT NULL,
	[sID_Detail] [int] NOT NULL,
	[sID_Detail_Process] [int] NOT NULL,
	[sReceivingID] [int] NOT NULL,
	[S_QTY] [money] NOT NULL,
	[S_P] [money] NOT NULL,
	[S_Total] [money] NOT NULL,
	[stkConsumed] [bit] NOT NULL,
	[who] [varchar](50) NOT NULL,
	[what] [varchar](10) NOT NULL,
	[When] [datetime] NOT NULL,
	[sStockLst_ID] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[wPipe]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[wPipe]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[wPipe](
	[pipesize] [char](7) NOT NULL,
	[schedule] [char](3) NOT NULL,
	[lbs_in] [numeric](9, 6) NOT NULL,
	[nPipeSize] [numeric](9, 4) NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
 CONSTRAINT [PK_wpipe] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AcctCost_Mach]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AcctCost_Mach]') AND name = N'IX_AcctCost_Mach')
CREATE NONCLUSTERED INDEX [IX_AcctCost_Mach] ON [dbo].[AcctCost_Mach]
(
	[Machine] ASC,
	[Lot] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AcctCost_Mach_AC_ID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AcctCost_Mach]') AND name = N'IX_AcctCost_Mach_AC_ID')
CREATE NONCLUSTERED INDEX [IX_AcctCost_Mach_AC_ID] ON [dbo].[AcctCost_Mach]
(
	[AC_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AcctCost_POitem]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AcctCost_POitem]') AND name = N'IX_AcctCost_POitem')
CREATE NONCLUSTERED INDEX [IX_AcctCost_POitem] ON [dbo].[AcctCost_POitem]
(
	[POitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AcctCost_POitem_AC_ID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AcctCost_POitem]') AND name = N'IX_AcctCost_POitem_AC_ID')
CREATE NONCLUSTERED INDEX [IX_AcctCost_POitem_AC_ID] ON [dbo].[AcctCost_POitem]
(
	[AC_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AcctCost_SOitem]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AcctCost_SOitem]') AND name = N'IX_AcctCost_SOitem')
CREATE NONCLUSTERED INDEX [IX_AcctCost_SOitem] ON [dbo].[AcctCost_SOitem]
(
	[SOitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AcctCost_SOitem_AC_ID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AcctCost_SOitem]') AND name = N'IX_AcctCost_SOitem_AC_ID')
CREATE NONCLUSTERED INDEX [IX_AcctCost_SOitem_AC_ID] ON [dbo].[AcctCost_SOitem]
(
	[AC_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AcctCost_WO]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AcctCost_WO]') AND name = N'IX_AcctCost_WO')
CREATE NONCLUSTERED INDEX [IX_AcctCost_WO] ON [dbo].[AcctCost_WO]
(
	[WO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AcctCost_WO_AC_ID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AcctCost_WO]') AND name = N'IX_AcctCost_WO_AC_ID')
CREATE NONCLUSTERED INDEX [IX_AcctCost_WO_AC_ID] ON [dbo].[AcctCost_WO]
(
	[AC_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AcctCost_WOD]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AcctCost_WOD]') AND name = N'IX_AcctCost_WOD')
CREATE NONCLUSTERED INDEX [IX_AcctCost_WOD] ON [dbo].[AcctCost_WOD]
(
	[WO_Detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AcctCost_WOD_AC_ID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AcctCost_WOD]') AND name = N'IX_AcctCost_WOD_AC_ID')
CREATE NONCLUSTERED INDEX [IX_AcctCost_WOD_AC_ID] ON [dbo].[AcctCost_WOD]
(
	[AC_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_actionrequest_RMA]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ActionRequest]') AND name = N'IX_actionrequest_RMA')
CREATE NONCLUSTERED INDEX [IX_actionrequest_RMA] ON [dbo].[ActionRequest]
(
	[RMA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Alloy_GL-GL_Inv]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Alloy_GL]') AND name = N'IX_Alloy_GL-GL_Inv')
CREATE NONCLUSTERED INDEX [IX_Alloy_GL-GL_Inv] ON [dbo].[Alloy_GL]
(
	[GL_Inv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Alloy_GL-GL_Sales]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Alloy_GL]') AND name = N'IX_Alloy_GL-GL_Sales')
CREATE NONCLUSTERED INDEX [IX_Alloy_GL-GL_Sales] ON [dbo].[Alloy_GL]
(
	[GL_Sales] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [AlloysAlloy]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Alloys]') AND name = N'AlloysAlloy')
CREATE NONCLUSTERED INDEX [AlloysAlloy] ON [dbo].[Alloys]
(
	[alloy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Allquotes_afci]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AllQuotes]') AND name = N'Allquotes_afci')
CREATE NONCLUSTERED INDEX [Allquotes_afci] ON [dbo].[AllQuotes]
(
	[Alloy] ASC,
	[Form] ASC,
	[CC] ASC,
	[InqDate] ASC
)
INCLUDE([Thck],[Weight]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Allquotes_afcti]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AllQuotes]') AND name = N'Allquotes_afcti')
CREATE NONCLUSTERED INDEX [Allquotes_afcti] ON [dbo].[AllQuotes]
(
	[Alloy] ASC,
	[Form] ASC,
	[CC] ASC,
	[Thck] ASC,
	[InqDate] ASC
)
INCLUDE([Weight]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [AllQuotes_InqNumP]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AllQuotes]') AND name = N'AllQuotes_InqNumP')
CREATE NONCLUSTERED INDEX [AllQuotes_InqNumP] ON [dbo].[AllQuotes]
(
	[InqNumP] ASC
)
INCLUDE([InqNum]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [AllQuotes_SalesPcompany]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AllQuotes]') AND name = N'AllQuotes_SalesPcompany')
CREATE NONCLUSTERED INDEX [AllQuotes_SalesPcompany] ON [dbo].[AllQuotes]
(
	[SalesP] ASC,
	[Company] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [AllQuotes_SalesPInqDate]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AllQuotes]') AND name = N'AllQuotes_SalesPInqDate')
CREATE NONCLUSTERED INDEX [AllQuotes_SalesPInqDate] ON [dbo].[AllQuotes]
(
	[SalesP] ASC,
	[InqDate] ASC
)
INCLUDE([Company],[Name],[Phone],[Phone_Ext],[OtherP],[cP_pc],[Thck],[p_pc],[Sz3],[Cuts],[Descript],[InqNum],[Email],[LotCost],[Alloy],[cWeight],[CC],[SaleDate],[Fax],[cthk],[PO_num],[cLotcP],[Form],[open_],[Pieces],[SalesNum],[Sz2],[item],[Weight],[RandLen],[p_lb],[Buyfrom],[p_ft],[BuyFrom2],[OtherFld],[sz3orig],[LotP],[CustID],[LeadTime],[Country],[cP_lb],[ID],[cP_pcc],[StartStock],[cLotP],[sz1orig],[cCut],[Metric],[InqNumP],[TN],[SOitem],[sz2orig],[HPApo],[Bracket],[ShipDate],[CountryC],[BuyCost],[Services],[HPApo2]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AllQuotes_AFCTS]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AllQuotes]') AND name = N'IX_AllQuotes_AFCTS')
CREATE NONCLUSTERED INDEX [IX_AllQuotes_AFCTS] ON [dbo].[AllQuotes]
(
	[Alloy] ASC,
	[Form] ASC,
	[CC] ASC,
	[Thck] ASC,
	[SaleDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_AllQuotes_DescriptID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AllQuotes]') AND name = N'IX_AllQuotes_DescriptID')
CREATE NONCLUSTERED INDEX [IX_AllQuotes_DescriptID] ON [dbo].[AllQuotes]
(
	[DescriptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AllQuotes_InqDate]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AllQuotes]') AND name = N'IX_AllQuotes_InqDate')
CREATE NONCLUSTERED INDEX [IX_AllQuotes_InqDate] ON [dbo].[AllQuotes]
(
	[InqDate] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AllQuotes_NoNoiseName]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AllQuotes]') AND name = N'IX_AllQuotes_NoNoiseName')
CREATE NONCLUSTERED INDEX [IX_AllQuotes_NoNoiseName] ON [dbo].[AllQuotes]
(
	[NoNoiseName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_allquotes_PO_Num]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AllQuotes]') AND name = N'IX_allquotes_PO_Num')
CREATE NONCLUSTERED INDEX [IX_allquotes_PO_Num] ON [dbo].[AllQuotes]
(
	[PO_num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AllQuotes_SaleDate]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AllQuotes]') AND name = N'IX_AllQuotes_SaleDate')
CREATE NONCLUSTERED INDEX [IX_AllQuotes_SaleDate] ON [dbo].[AllQuotes]
(
	[SaleDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_allquotes_SalesNum]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AllQuotes]') AND name = N'IX_allquotes_SalesNum')
CREATE NONCLUSTERED INDEX [IX_allquotes_SalesNum] ON [dbo].[AllQuotes]
(
	[SalesNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_allquotes_SOitem]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AllQuotes]') AND name = N'IX_allquotes_SOitem')
CREATE NONCLUSTERED INDEX [IX_allquotes_SOitem] ON [dbo].[AllQuotes]
(
	[SOitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AllQuotes-AFCT]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AllQuotes]') AND name = N'IX_AllQuotes-AFCT')
CREATE NONCLUSTERED INDEX [IX_AllQuotes-AFCT] ON [dbo].[AllQuotes]
(
	[Alloy] ASC,
	[Form] ASC,
	[CC] ASC,
	[Thck] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BrokerLst_detail_ID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Detail]') AND name = N'IX_BrokerLst_detail_ID')
CREATE NONCLUSTERED INDEX [IX_BrokerLst_detail_ID] ON [dbo].[BrokerLst_Detail]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BrokerLst_detail_ReceivingID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Detail]') AND name = N'IX_BrokerLst_detail_ReceivingID')
CREATE NONCLUSTERED INDEX [IX_BrokerLst_detail_ReceivingID] ON [dbo].[BrokerLst_Detail]
(
	[ReceivingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [BrokerLst_Master_POStatus]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Master]') AND name = N'BrokerLst_Master_POStatus')
CREATE NONCLUSTERED INDEX [BrokerLst_Master_POStatus] ON [dbo].[BrokerLst_Master]
(
	[POStatus] ASC
)
INCLUDE([PO_item]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_BrokerLst_master_AFCSH]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Master]') AND name = N'IX_BrokerLst_master_AFCSH')
CREATE NONCLUSTERED INDEX [IX_BrokerLst_master_AFCSH] ON [dbo].[BrokerLst_Master]
(
	[Alloy] ASC,
	[Form] ASC,
	[Cond] ASC,
	[Size] ASC,
	[Heat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_BrokerLst_master_PO]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Master]') AND name = N'IX_BrokerLst_master_PO')
CREATE NONCLUSTERED INDEX [IX_BrokerLst_master_PO] ON [dbo].[BrokerLst_Master]
(
	[PO_item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_BrokerLst_Master-DescriptID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Master]') AND name = N'IX_BrokerLst_Master-DescriptID')
CREATE NONCLUSTERED INDEX [IX_BrokerLst_Master-DescriptID] ON [dbo].[BrokerLst_Master]
(
	[DescriptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BrokerLst_process_ID_Detail]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Process]') AND name = N'IX_BrokerLst_process_ID_Detail')
CREATE NONCLUSTERED INDEX [IX_BrokerLst_process_ID_Detail] ON [dbo].[BrokerLst_Process]
(
	[ID_Detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_BrokerLst_process_PO]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Process]') AND name = N'IX_BrokerLst_process_PO')
CREATE NONCLUSTERED INDEX [IX_BrokerLst_process_PO] ON [dbo].[BrokerLst_Process]
(
	[PO_item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_BrokerLst_process_SO]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Process]') AND name = N'IX_BrokerLst_process_SO')
CREATE NONCLUSTERED INDEX [IX_BrokerLst_process_SO] ON [dbo].[BrokerLst_Process]
(
	[SOitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Cert-heat-lot]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Cert]') AND name = N'IX_Cert-heat-lot')
CREATE NONCLUSTERED INDEX [IX_Cert-heat-lot] ON [dbo].[Cert]
(
	[Heat] ASC,
	[Lot] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cert_RC_profile-CertID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Cert_RC_profile]') AND name = N'IX_Cert_RC_profile-CertID')
CREATE NONCLUSTERED INDEX [IX_Cert_RC_profile-CertID] ON [dbo].[Cert_RC_profile]
(
	[CertID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CUSTOMER_LIST-CustID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CUSTOMER_LIST]') AND name = N'IX_CUSTOMER_LIST-CustID')
CREATE NONCLUSTERED INDEX [IX_CUSTOMER_LIST-CustID] ON [dbo].[CUSTOMER_LIST]
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Customer_List_call_CustomerID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Customer_List_call]') AND name = N'IX_Customer_List_call_CustomerID')
CREATE NONCLUSTERED INDEX [IX_Customer_List_call_CustomerID] ON [dbo].[Customer_List_call]
(
	[CustomerID] ASC,
	[Date] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Customer_List_call_Date]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Customer_List_call]') AND name = N'IX_Customer_List_call_Date')
CREATE NONCLUSTERED INDEX [IX_Customer_List_call_Date] ON [dbo].[Customer_List_call]
(
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmailService_Email_Log_ForwardTime]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[EmailService_Email_Log]') AND name = N'IX_EmailService_Email_Log_ForwardTime')
CREATE NONCLUSTERED INDEX [IX_EmailService_Email_Log_ForwardTime] ON [dbo].[EmailService_Email_Log]
(
	[ForwardTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_EmailService_Email_Log_From]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[EmailService_Email_Log]') AND name = N'IX_EmailService_Email_Log_From')
CREATE NONCLUSTERED INDEX [IX_EmailService_Email_Log_From] ON [dbo].[EmailService_Email_Log]
(
	[EmailFrom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmailService_Email_Log_SalesUser]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[EmailService_Email_Log]') AND name = N'IX_EmailService_Email_Log_SalesUser')
CREATE NONCLUSTERED INDEX [IX_EmailService_Email_Log_SalesUser] ON [dbo].[EmailService_Email_Log]
(
	[ForwardToId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_GFM_DieSets_RunTimeLogs_OT]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_RunTimeLogs]') AND name = N'IX_GFM_DieSets_RunTimeLogs_OT')
CREATE NONCLUSTERED INDEX [IX_GFM_DieSets_RunTimeLogs_OT] ON [dbo].[GFM_DieSets_RunTimeLogs]
(
	[OTTrackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_GFM_DieSets_RunTimeLogs_OT_Times]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_RunTimeLogs]') AND name = N'IX_GFM_DieSets_RunTimeLogs_OT_Times')
CREATE NONCLUSTERED INDEX [IX_GFM_DieSets_RunTimeLogs_OT_Times] ON [dbo].[GFM_DieSets_RunTimeLogs]
(
	[OTTimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_gfmlog_Heat]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[GFMlog]') AND name = N'IX_gfmlog_Heat')
CREATE NONCLUSTERED INDEX [IX_gfmlog_Heat] ON [dbo].[GFMlog]
(
	[Heat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_gfmlog_Lot]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[GFMlog]') AND name = N'IX_gfmlog_Lot')
CREATE NONCLUSTERED INDEX [IX_gfmlog_Lot] ON [dbo].[GFMlog]
(
	[Lot] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_gfmlog_Ssize]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[GFMlog]') AND name = N'IX_gfmlog_Ssize')
CREATE NONCLUSTERED INDEX [IX_gfmlog_Ssize] ON [dbo].[GFMlog]
(
	[sSize] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_GFMLog_Detail-ID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[GFMlog_Detail]') AND name = N'IX_GFMLog_Detail-ID')
CREATE NONCLUSTERED INDEX [IX_GFMLog_Detail-ID] ON [dbo].[GFMlog_Detail]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Invoice-Invoice]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Invoice_DEL]') AND name = N'IX_Invoice-Invoice')
CREATE NONCLUSTERED INDEX [IX_Invoice-Invoice] ON [dbo].[Invoice_DEL]
(
	[Invoice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Invoice-Sales_Detail_ID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Invoice_DEL]') AND name = N'IX_Invoice-Sales_Detail_ID')
CREATE NONCLUSTERED INDEX [IX_Invoice-Sales_Detail_ID] ON [dbo].[Invoice_DEL]
(
	[Sales_Detail_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Invoice-SOitem]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Invoice_DEL]') AND name = N'IX_Invoice-SOitem')
CREATE NONCLUSTERED INDEX [IX_Invoice-SOitem] ON [dbo].[Invoice_DEL]
(
	[SOitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_lading]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Lading]') AND name = N'IX_lading')
CREATE NONCLUSTERED INDEX [IX_lading] ON [dbo].[Lading]
(
	[packingsli] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Mach_Shop-AQID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Mach_Shop]') AND name = N'IX_Mach_Shop-AQID')
CREATE NONCLUSTERED INDEX [IX_Mach_Shop-AQID] ON [dbo].[Mach_Shop]
(
	[AllQuotes_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Mach_Shop-SOitem]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Mach_Shop]') AND name = N'IX_Mach_Shop-SOitem')
CREATE NONCLUSTERED INDEX [IX_Mach_Shop-SOitem] ON [dbo].[Mach_Shop]
(
	[SOitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Mach_Type]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Mach_Type]') AND name = N'IX_Mach_Type')
CREATE NONCLUSTERED INDEX [IX_Mach_Type] ON [dbo].[Mach_Type]
(
	[Mach_Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_McMaster_Stock]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[McMaster_Stock]') AND name = N'IX_McMaster_Stock')
CREATE NONCLUSTERED INDEX [IX_McMaster_Stock] ON [dbo].[McMaster_Stock]
(
	[Period] DESC,
	[Alloy] ASC,
	[Form] ASC,
	[CC] ASC,
	[Thck] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Melt_Type-Type]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Melt_Type]') AND name = N'IX_Melt_Type-Type')
CREATE NONCLUSTERED INDEX [IX_Melt_Type-Type] ON [dbo].[Melt_Type]
(
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OT_JobID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[OT]') AND name = N'IX_OT_JobID')
CREATE NONCLUSTERED INDEX [IX_OT_JobID] ON [dbo].[OT]
(
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OT_OrderTypeID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[OT]') AND name = N'IX_OT_OrderTypeID')
CREATE NONCLUSTERED INDEX [IX_OT_OrderTypeID] ON [dbo].[OT]
(
	[OrderTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OT_Job_ClassId]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[OT_Job]') AND name = N'IX_OT_Job_ClassId')
CREATE NONCLUSTERED INDEX [IX_OT_Job_ClassId] ON [dbo].[OT_Job]
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OT_Job_Sched_Type]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[OT_Job]') AND name = N'IX_OT_Job_Sched_Type')
CREATE NONCLUSTERED INDEX [IX_OT_Job_Sched_Type] ON [dbo].[OT_Job]
(
	[Sched_Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OT_Job-Oper_ID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[OT_Job]') AND name = N'IX_OT_Job-Oper_ID')
CREATE NONCLUSTERED INDEX [IX_OT_Job-Oper_ID] ON [dbo].[OT_Job]
(
	[Oper_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OT_Times_StatusId_Start]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[OT_Times]') AND name = N'IX_OT_Times_StatusId_Start')
CREATE NONCLUSTERED INDEX [IX_OT_Times_StatusId_Start] ON [dbo].[OT_Times]
(
	[Start_StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OT_Times_StatusId_Stop]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[OT_Times]') AND name = N'IX_OT_Times_StatusId_Stop')
CREATE NONCLUSTERED INDEX [IX_OT_Times_StatusId_Stop] ON [dbo].[OT_Times]
(
	[Stop_StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OT_Times_TrackId]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[OT_Times]') AND name = N'IX_OT_Times_TrackId')
CREATE NONCLUSTERED INDEX [IX_OT_Times_TrackId] ON [dbo].[OT_Times]
(
	[TrackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OT_Times_Employees_TimeId]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[OT_Times_Employees]') AND name = N'IX_OT_Times_Employees_TimeId')
CREATE NONCLUSTERED INDEX [IX_OT_Times_Employees_TimeId] ON [dbo].[OT_Times_Employees]
(
	[TimeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OT_Times_Employees_TrackId]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[OT_Times_Employees]') AND name = N'IX_OT_Times_Employees_TrackId')
CREATE NONCLUSTERED INDEX [IX_OT_Times_Employees_TrackId] ON [dbo].[OT_Times_Employees]
(
	[TrackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OT_Total_StatusId]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[OT_Total]') AND name = N'IX_OT_Total_StatusId')
CREATE NONCLUSTERED INDEX [IX_OT_Total_StatusId] ON [dbo].[OT_Total]
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OT_Total_TrackId]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[OT_Total]') AND name = N'IX_OT_Total_TrackId')
CREATE NONCLUSTERED INDEX [IX_OT_Total_TrackId] ON [dbo].[OT_Total]
(
	[TrackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PackingSlip_HEAT]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PackingSlip]') AND name = N'IX_PackingSlip_HEAT')
CREATE NONCLUSTERED INDEX [IX_PackingSlip_HEAT] ON [dbo].[PackingSlip]
(
	[Heat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_packingslip_Soitem]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PackingSlip]') AND name = N'IX_packingslip_Soitem')
CREATE NONCLUSTERED INDEX [IX_packingslip_Soitem] ON [dbo].[PackingSlip]
(
	[SOitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PackingSlip-Sales_Detail_ID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PackingSlip]') AND name = N'IX_PackingSlip-Sales_Detail_ID')
CREATE NONCLUSTERED INDEX [IX_PackingSlip-Sales_Detail_ID] ON [dbo].[PackingSlip]
(
	[Sales_Detail_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PO_Item_Notes]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PO_Item_Notes]') AND name = N'IX_PO_Item_Notes')
CREATE NONCLUSTERED INDEX [IX_PO_Item_Notes] ON [dbo].[PO_Item_Notes]
(
	[POitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PO_Item_Notes-POitem]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PO_Item_Notes]') AND name = N'IX_PO_Item_Notes-POitem')
CREATE NONCLUSTERED INDEX [IX_PO_Item_Notes-POitem] ON [dbo].[PO_Item_Notes]
(
	[POitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PO_No-HPAPO]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PO_No]') AND name = N'IX_PO_No-HPAPO')
CREATE UNIQUE NONCLUSTERED INDEX [IX_PO_No-HPAPO] ON [dbo].[PO_No]
(
	[HPAPO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PO_SOdist-POitem]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PO_SOdist]') AND name = N'IX_PO_SOdist-POitem')
CREATE NONCLUSTERED INDEX [IX_PO_SOdist-POitem] ON [dbo].[PO_SOdist]
(
	[POitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PO_SOdist-SOtem]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PO_SOdist]') AND name = N'IX_PO_SOdist-SOtem')
CREATE NONCLUSTERED INDEX [IX_PO_SOdist-SOtem] ON [dbo].[PO_SOdist]
(
	[SOitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PO_Testing_POitem]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PO_Testing]') AND name = N'IX_PO_Testing_POitem')
CREATE NONCLUSTERED INDEX [IX_PO_Testing_POitem] ON [dbo].[PO_Testing]
(
	[POitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PO_Testing_SOitem]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PO_Testing]') AND name = N'IX_PO_Testing_SOitem')
CREATE NONCLUSTERED INDEX [IX_PO_Testing_SOitem] ON [dbo].[PO_Testing]
(
	[SOitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_postatusdef]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[POstatusDef]') AND name = N'IX_postatusdef')
CREATE NONCLUSTERED INDEX [IX_postatusdef] ON [dbo].[POstatusDef]
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_prc_Equipment-ScanName]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[prc_Equipment]') AND name = N'IX_prc_Equipment-ScanName')
CREATE NONCLUSTERED INDEX [IX_prc_Equipment-ScanName] ON [dbo].[prc_Equipment]
(
	[ScanName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_pricetable-ID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PriceTable]') AND name = N'IX_pricetable-ID')
CREATE UNIQUE NONCLUSTERED INDEX [IX_pricetable-ID] ON [dbo].[PriceTable]
(
	[pt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Production-InQue]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Production]') AND name = N'IX_Production-InQue')
CREATE NONCLUSTERED INDEX [IX_Production-InQue] ON [dbo].[Production]
(
	[InQue] ASC,
	[dateInQue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Production-OperID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Production]') AND name = N'IX_Production-OperID')
CREATE NONCLUSTERED INDEX [IX_Production-OperID] ON [dbo].[Production]
(
	[Oper_ID] ASC,
	[Position] ASC,
	[OnBoard] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_Production-OType_Num]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Production]') AND name = N'IX_Production-OType_Num')
CREATE NONCLUSTERED INDEX [IX_Production-OType_Num] ON [dbo].[Production]
(
	[OType_Num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Production-POitem]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Production]') AND name = N'IX_Production-POitem')
CREATE NONCLUSTERED INDEX [IX_Production-POitem] ON [dbo].[Production]
(
	[POitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Production-SOitem]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Production]') AND name = N'IX_Production-SOitem')
CREATE NONCLUSTERED INDEX [IX_Production-SOitem] ON [dbo].[Production]
(
	[SOitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Production-WO_Detail]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Production]') AND name = N'IX_Production-WO_Detail')
CREATE NONCLUSTERED INDEX [IX_Production-WO_Detail] ON [dbo].[Production]
(
	[WO_Detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PurchaseOrder_AFST]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseOrder]') AND name = N'IX_PurchaseOrder_AFST')
CREATE NONCLUSTERED INDEX [IX_PurchaseOrder_AFST] ON [dbo].[PurchaseOrder]
(
	[Alloy] ASC,
	[Form] ASC,
	[Services] ASC,
	[Thck] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PurchaseOrder_HPAPO]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseOrder]') AND name = N'IX_PurchaseOrder_HPAPO')
CREATE NONCLUSTERED INDEX [IX_PurchaseOrder_HPAPO] ON [dbo].[PurchaseOrder]
(
	[HPApo] DESC,
	[Item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PurchaseOrder_SOitem]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseOrder]') AND name = N'IX_PurchaseOrder_SOitem')
CREATE NONCLUSTERED INDEX [IX_PurchaseOrder_SOitem] ON [dbo].[PurchaseOrder]
(
	[SOitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_PurchaseOrder-DescriptID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseOrder]') AND name = N'IX_PurchaseOrder-DescriptID')
CREATE NONCLUSTERED INDEX [IX_PurchaseOrder-DescriptID] ON [dbo].[PurchaseOrder]
(
	[DescriptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_purchaseorders_SalesNum]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseOrder]') AND name = N'IX_purchaseorders_SalesNum')
CREATE NONCLUSTERED INDEX [IX_purchaseorders_SalesNum] ON [dbo].[PurchaseOrder]
(
	[SalesNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_QuickCompany_Company]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[QuickCompany]') AND name = N'IX_QuickCompany_Company')
CREATE NONCLUSTERED INDEX [IX_QuickCompany_Company] ON [dbo].[QuickCompany]
(
	[company] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_QuickCompany_Customer]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[QuickCompany]') AND name = N'IX_QuickCompany_Customer')
CREATE NONCLUSTERED INDEX [IX_QuickCompany_Customer] ON [dbo].[QuickCompany]
(
	[customer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_QuickCompany_ID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[QuickCompany]') AND name = N'IX_QuickCompany_ID')
CREATE NONCLUSTERED INDEX [IX_QuickCompany_ID] ON [dbo].[QuickCompany]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_QuickCompany_Name]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[QuickCompany]') AND name = N'IX_QuickCompany_Name')
CREATE NONCLUSTERED INDEX [IX_QuickCompany_Name] ON [dbo].[QuickCompany]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_QuickCompany_Xcomp]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[QuickCompany]') AND name = N'IX_QuickCompany_Xcomp')
CREATE NONCLUSTERED INDEX [IX_QuickCompany_Xcomp] ON [dbo].[QuickCompany]
(
	[xcomp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_QuickCompany-NoNoiseName]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[QuickCompany]') AND name = N'IX_QuickCompany-NoNoiseName')
CREATE NONCLUSTERED INDEX [IX_QuickCompany-NoNoiseName] ON [dbo].[QuickCompany]
(
	[NoNoiseName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Quote_No_AQID-AllQuotes_ID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Quote_No_AQID]') AND name = N'IX_Quote_No_AQID-AllQuotes_ID')
CREATE NONCLUSTERED INDEX [IX_Quote_No_AQID-AllQuotes_ID] ON [dbo].[Quote_No_AQID]
(
	[AllQuotes_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Quote_temp_Alt_ID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Quote_temp]') AND name = N'IX_Quote_temp_Alt_ID')
CREATE NONCLUSTERED INDEX [IX_Quote_temp_Alt_ID] ON [dbo].[Quote_temp]
(
	[Alt_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Quote_temp_ID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Quote_temp]') AND name = N'IX_Quote_temp_ID')
CREATE NONCLUSTERED INDEX [IX_Quote_temp_ID] ON [dbo].[Quote_temp]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Quotes_PMI-Curr]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Quotes_PMI]') AND name = N'IX_Quotes_PMI-Curr')
CREATE NONCLUSTERED INDEX [IX_Quotes_PMI-Curr] ON [dbo].[Quotes_PMI]
(
	[AQ_ID_Curr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_receiving_Heat]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Receiving]') AND name = N'IX_receiving_Heat')
CREATE NONCLUSTERED INDEX [IX_receiving_Heat] ON [dbo].[Receiving]
(
	[Heat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Receiving_Lot]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Receiving]') AND name = N'IX_Receiving_Lot')
CREATE NONCLUSTERED INDEX [IX_Receiving_Lot] ON [dbo].[Receiving]
(
	[lot] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Receiving_POITEM]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Receiving]') AND name = N'IX_Receiving_POITEM')
CREATE NONCLUSTERED INDEX [IX_Receiving_POITEM] ON [dbo].[Receiving]
(
	[POitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Receiving_SOITEM]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Receiving]') AND name = N'IX_Receiving_SOITEM')
CREATE NONCLUSTERED INDEX [IX_Receiving_SOITEM] ON [dbo].[Receiving]
(
	[SOitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Recollect_Cert_Loc]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Recollect_Cert_Loc]') AND name = N'IX_Recollect_Cert_Loc')
CREATE UNIQUE NONCLUSTERED INDEX [IX_Recollect_Cert_Loc] ON [dbo].[Recollect_Cert_Loc]
(
	[UNS] ASC,
	[Form] ASC,
	[Size] ASC,
	[Heat] ASC,
	[Lot] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Recollect_Cert_Loc_NOLOT]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Recollect_Cert_Loc]') AND name = N'IX_Recollect_Cert_Loc_NOLOT')
CREATE NONCLUSTERED INDEX [IX_Recollect_Cert_Loc_NOLOT] ON [dbo].[Recollect_Cert_Loc]
(
	[UNS] ASC,
	[Form] ASC,
	[Size] ASC,
	[Heat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_rma_detail-RMA_No]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[RMA_Detail]') AND name = N'IX_rma_detail-RMA_No')
CREATE NONCLUSTERED INDEX [IX_rma_detail-RMA_No] ON [dbo].[RMA_Detail]
(
	[rma_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_rma_detail-SO_Item]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[RMA_Detail]') AND name = N'IX_rma_detail-SO_Item')
CREATE NONCLUSTERED INDEX [IX_rma_detail-SO_Item] ON [dbo].[RMA_Detail]
(
	[so_item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_sales_CncldShipped]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales]') AND name = N'IX_sales_CncldShipped')
CREATE NONCLUSTERED INDEX [IX_sales_CncldShipped] ON [dbo].[Sales]
(
	[cncld] ASC,
	[Shipped] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_sales_SalesNum]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales]') AND name = N'IX_sales_SalesNum')
CREATE NONCLUSTERED INDEX [IX_sales_SalesNum] ON [dbo].[Sales]
(
	[SalesNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sales_ShipDue]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales]') AND name = N'IX_Sales_ShipDue')
CREATE NONCLUSTERED INDEX [IX_Sales_ShipDue] ON [dbo].[Sales]
(
	[ShipDue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sales_Shipped_SalesNum]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales]') AND name = N'IX_Sales_Shipped_SalesNum')
CREATE NONCLUSTERED INDEX [IX_Sales_Shipped_SalesNum] ON [dbo].[Sales]
(
	[SalesNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sales_Shipped_ShipDue]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales]') AND name = N'IX_Sales_Shipped_ShipDue')
CREATE NONCLUSTERED INDEX [IX_Sales_Shipped_ShipDue] ON [dbo].[Sales]
(
	[ShipDue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Sales_Cncld]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales]') AND name = N'Sales_Cncld')
CREATE NONCLUSTERED INDEX [Sales_Cncld] ON [dbo].[Sales]
(
	[cncld] ASC
)
INCLUDE([SOitem],[Shipped],[ItemCost],[ItemSale]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Sales_RMA_No]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales]') AND name = N'Sales_RMA_No')
CREATE NONCLUSTERED INDEX [Sales_RMA_No] ON [dbo].[Sales]
(
	[RMA_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sales_Detail-Invoice]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Detail]') AND name = N'IX_Sales_Detail-Invoice')
CREATE NONCLUSTERED INDEX [IX_Sales_Detail-Invoice] ON [dbo].[Sales_Detail]
(
	[Invoice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Sales_Detail-Lot]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Detail]') AND name = N'IX_Sales_Detail-Lot')
CREATE NONCLUSTERED INDEX [IX_Sales_Detail-Lot] ON [dbo].[Sales_Detail]
(
	[Lot] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sales_Detail-PackingSli]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Detail]') AND name = N'IX_Sales_Detail-PackingSli')
CREATE NONCLUSTERED INDEX [IX_Sales_Detail-PackingSli] ON [dbo].[Sales_Detail]
(
	[PackingSli] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sales_Detail-RMA_Detail_ID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Detail]') AND name = N'IX_Sales_Detail-RMA_Detail_ID')
CREATE NONCLUSTERED INDEX [IX_Sales_Detail-RMA_Detail_ID] ON [dbo].[Sales_Detail]
(
	[RMA_Detail_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Sales_Detail-SOitem]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Detail]') AND name = N'IX_Sales_Detail-SOitem')
CREATE NONCLUSTERED INDEX [IX_Sales_Detail-SOitem] ON [dbo].[Sales_Detail]
(
	[SOitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Sales_Hold_Status_HoldType]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Hold_Status]') AND name = N'IX_Sales_Hold_Status_HoldType')
CREATE NONCLUSTERED INDEX [IX_Sales_Hold_Status_HoldType] ON [dbo].[Sales_Hold_Status]
(
	[Hold_Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Sales_Hold_Status_POitem]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Hold_Status]') AND name = N'IX_Sales_Hold_Status_POitem')
CREATE NONCLUSTERED INDEX [IX_Sales_Hold_Status_POitem] ON [dbo].[Sales_Hold_Status]
(
	[POitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sales_Hold_Status_SalesNum]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Hold_Status]') AND name = N'IX_Sales_Hold_Status_SalesNum')
CREATE NONCLUSTERED INDEX [IX_Sales_Hold_Status_SalesNum] ON [dbo].[Sales_Hold_Status]
(
	[SalesNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Sales_Hold_Status_SOitem]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Hold_Status]') AND name = N'IX_Sales_Hold_Status_SOitem')
CREATE NONCLUSTERED INDEX [IX_Sales_Hold_Status_SOitem] ON [dbo].[Sales_Hold_Status]
(
	[SOitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sales_Invoice-Invoice]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Invoice]') AND name = N'IX_Sales_Invoice-Invoice')
CREATE NONCLUSTERED INDEX [IX_Sales_Invoice-Invoice] ON [dbo].[Sales_Invoice]
(
	[Invoice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sales_Invoice-Sales_Detail_ID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Invoice]') AND name = N'IX_Sales_Invoice-Sales_Detail_ID')
CREATE NONCLUSTERED INDEX [IX_Sales_Invoice-Sales_Detail_ID] ON [dbo].[Sales_Invoice]
(
	[Sales_Detail_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sales_Invoice-SalesNum]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Invoice]') AND name = N'IX_Sales_Invoice-SalesNum')
CREATE NONCLUSTERED INDEX [IX_Sales_Invoice-SalesNum] ON [dbo].[Sales_Invoice]
(
	[SalesNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Sales_Invoice-SOitem]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Invoice]') AND name = N'IX_Sales_Invoice-SOitem')
CREATE NONCLUSTERED INDEX [IX_Sales_Invoice-SOitem] ON [dbo].[Sales_Invoice]
(
	[SOitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Sales_Item_Detail-SOitem]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Item_Detail]') AND name = N'IX_Sales_Item_Detail-SOitem')
CREATE NONCLUSTERED INDEX [IX_Sales_Item_Detail-SOitem] ON [dbo].[Sales_Item_Detail]
(
	[SOitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Sales_Item_Detail-TBL-ID_Master]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Item_Detail]') AND name = N'IX_Sales_Item_Detail-TBL-ID_Master')
CREATE NONCLUSTERED INDEX [IX_Sales_Item_Detail-TBL-ID_Master] ON [dbo].[Sales_Item_Detail]
(
	[TBL] ASC,
	[ID_Master] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Sales_No_SalesRep]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales_No]') AND name = N'IX_Sales_No_SalesRep')
CREATE NONCLUSTERED INDEX [IX_Sales_No_SalesRep] ON [dbo].[Sales_No]
(
	[salesrep] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sales_No_ShipAddr]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales_No]') AND name = N'IX_Sales_No_ShipAddr')
CREATE NONCLUSTERED INDEX [IX_Sales_No_ShipAddr] ON [dbo].[Sales_No]
(
	[pshipaddr] ASC,
	[cncld] ASC,
	[cmplt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sales_No_SoldAddr]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales_No]') AND name = N'IX_Sales_No_SoldAddr')
CREATE NONCLUSTERED INDEX [IX_Sales_No_SoldAddr] ON [dbo].[Sales_No]
(
	[psoldaddr] ASC,
	[cncld] ASC,
	[cmplt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Sales_No_SalesRep]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales_No]') AND name = N'Sales_No_SalesRep')
CREATE NONCLUSTERED INDEX [Sales_No_SalesRep] ON [dbo].[Sales_No]
(
	[salesrep] ASC
)
INCLUDE([salesnum],[cncld],[cmplt],[printedso],[amendment],[ShopRecv],[Changing]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sales_No_Chng-SalesNum]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales_No_Chng]') AND name = N'IX_Sales_No_Chng-SalesNum')
CREATE NONCLUSTERED INDEX [IX_Sales_No_Chng-SalesNum] ON [dbo].[Sales_No_Chng]
(
	[SalesNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sales_PS_PackingSli]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales_PS]') AND name = N'IX_Sales_PS_PackingSli')
CREATE NONCLUSTERED INDEX [IX_Sales_PS_PackingSli] ON [dbo].[Sales_PS]
(
	[PackingSli] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sales_PS_PS_Date]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales_PS]') AND name = N'IX_Sales_PS_PS_Date')
CREATE NONCLUSTERED INDEX [IX_Sales_PS_PS_Date] ON [dbo].[Sales_PS]
(
	[PS_Date] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Sales_PS_SOitem]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales_PS]') AND name = N'IX_Sales_PS_SOitem')
CREATE NONCLUSTERED INDEX [IX_Sales_PS_SOitem] ON [dbo].[Sales_PS]
(
	[SOitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sales_Status_SalesNum]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Status]') AND name = N'IX_Sales_Status_SalesNum')
CREATE NONCLUSTERED INDEX [IX_Sales_Status_SalesNum] ON [dbo].[Sales_Status]
(
	[SalesNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Sales_Status_SOitem]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Status]') AND name = N'IX_Sales_Status_SOitem')
CREATE NONCLUSTERED INDEX [IX_Sales_Status_SOitem] ON [dbo].[Sales_Status]
(
	[SOitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SS_PackingSli]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Stock]') AND name = N'IX_SS_PackingSli')
CREATE NONCLUSTERED INDEX [IX_SS_PackingSli] ON [dbo].[Sales_Stock]
(
	[PackingSli] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SS_Sales_Detail_ID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Stock]') AND name = N'IX_SS_Sales_Detail_ID')
CREATE NONCLUSTERED INDEX [IX_SS_Sales_Detail_ID] ON [dbo].[Sales_Stock]
(
	[Sales_Detail_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SS_SOitem]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Stock]') AND name = N'IX_SS_SOitem')
CREATE NONCLUSTERED INDEX [IX_SS_SOitem] ON [dbo].[Sales_Stock]
(
	[SOitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SS_StockLst_ID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Stock]') AND name = N'IX_SS_StockLst_ID')
CREATE NONCLUSTERED INDEX [IX_SS_StockLst_ID] ON [dbo].[Sales_Stock]
(
	[StockLst_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SS_StockLst_ID_Detail]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Stock]') AND name = N'IX_SS_StockLst_ID_Detail')
CREATE NONCLUSTERED INDEX [IX_SS_StockLst_ID_Detail] ON [dbo].[Sales_Stock]
(
	[StockLst_ID_Detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SS_WO_Detail]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Stock]') AND name = N'IX_SS_WO_Detail')
CREATE NONCLUSTERED INDEX [IX_SS_WO_Detail] ON [dbo].[Sales_Stock]
(
	[WO_Detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SalesP_Customer-CustID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SalesP_Customer]') AND name = N'IX_SalesP_Customer-CustID')
CREATE NONCLUSTERED INDEX [IX_SalesP_Customer-CustID] ON [dbo].[SalesP_Customer]
(
	[CustID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SalesP_Customer-Customer]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SalesP_Customer]') AND name = N'IX_SalesP_Customer-Customer')
CREATE NONCLUSTERED INDEX [IX_SalesP_Customer-Customer] ON [dbo].[SalesP_Customer]
(
	[Customer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SalesP_Customer-NoNoise]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SalesP_Customer]') AND name = N'IX_SalesP_Customer-NoNoise')
CREATE NONCLUSTERED INDEX [IX_SalesP_Customer-NoNoise] ON [dbo].[SalesP_Customer]
(
	[NoNoiseName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SalesP_Customer-SoldCode]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SalesP_Customer]') AND name = N'IX_SalesP_Customer-SoldCode')
CREATE NONCLUSTERED INDEX [IX_SalesP_Customer-SoldCode] ON [dbo].[SalesP_Customer]
(
	[SoldCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ship_Salesnum]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ship]') AND name = N'IX_ship_Salesnum')
CREATE NONCLUSTERED INDEX [IX_ship_Salesnum] ON [dbo].[Ship]
(
	[SalesNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ship_SOitem]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ship]') AND name = N'IX_ship_SOitem')
CREATE NONCLUSTERED INDEX [IX_ship_SOitem] ON [dbo].[Ship]
(
	[SOitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Ship_Complete]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ship]') AND name = N'Ship_Complete')
CREATE NONCLUSTERED INDEX [Ship_Complete] ON [dbo].[Ship]
(
	[Complete] ASC
)
INCLUDE([SOitem]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ShipAddr_NoNoiseName]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ShipAddr]') AND name = N'IX_ShipAddr_NoNoiseName')
CREATE NONCLUSTERED INDEX [IX_ShipAddr_NoNoiseName] ON [dbo].[ShipAddr]
(
	[NoNoiseName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ShipAddr_company]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ShipAddr]') AND name = N'ShipAddr_company')
CREATE NONCLUSTERED INDEX [ShipAddr_company] ON [dbo].[ShipAddr]
(
	[company] ASC
)
INCLUDE([shipcode],[addr1],[addr2],[city],[st],[shippay],[paytype],[contact],[telephone],[inactive],[blind],[customer],[lastedit],[fax_number],[email],[shiproute],[instrct],[zip],[country]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SO_BoilerPlate-Alloy]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SO_BoilerPlate]') AND name = N'IX_SO_BoilerPlate-Alloy')
CREATE NONCLUSTERED INDEX [IX_SO_BoilerPlate-Alloy] ON [dbo].[SO_BoilerPlate]
(
	[Alloy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ShipCode]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sold_Ship]') AND name = N'ShipCode')
CREATE NONCLUSTERED INDEX [ShipCode] ON [dbo].[Sold_Ship]
(
	[shipcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [SoldCode]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sold_Ship]') AND name = N'SoldCode')
CREATE NONCLUSTERED INDEX [SoldCode] ON [dbo].[Sold_Ship]
(
	[soldcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SoldAddr_NoNoiseName]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SoldAddr]') AND name = N'IX_SoldAddr_NoNoiseName')
CREATE NONCLUSTERED INDEX [IX_SoldAddr_NoNoiseName] ON [dbo].[SoldAddr]
(
	[NoNoiseName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [SoldAddr_company]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SoldAddr]') AND name = N'SoldAddr_company')
CREATE NONCLUSTERED INDEX [SoldAddr_company] ON [dbo].[SoldAddr]
(
	[company] ASC
)
INCLUDE([soldcode],[addr1],[addr2],[city],[st],[telephone],[fax_number],[email],[customer],[lastedit],[inactive],[zip],[country],[contact]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_spec_check-Alloy]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Spec_Check]') AND name = N'IX_spec_check-Alloy')
CREATE NONCLUSTERED INDEX [IX_spec_check-Alloy] ON [dbo].[Spec_Check]
(
	[alloy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Starting_Stock]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[StartingStock]') AND name = N'IX_Starting_Stock')
CREATE UNIQUE NONCLUSTERED INDEX [IX_Starting_Stock] ON [dbo].[StartingStock]
(
	[AllQuotes_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Stock_SnapShot-ID_Detail]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Stock_Receiving]') AND name = N'IX_Stock_SnapShot-ID_Detail')
CREATE NONCLUSTERED INDEX [IX_Stock_SnapShot-ID_Detail] ON [dbo].[Stock_Receiving]
(
	[ID_Detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Stock_SnapShot-TBL_ID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Stock_Receiving]') AND name = N'IX_Stock_SnapShot-TBL_ID')
CREATE NONCLUSTERED INDEX [IX_Stock_SnapShot-TBL_ID] ON [dbo].[Stock_Receiving]
(
	[TBL] ASC,
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_stocklst_detail_ID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Detail]') AND name = N'IX_stocklst_detail_ID')
CREATE NONCLUSTERED INDEX [IX_stocklst_detail_ID] ON [dbo].[StockLst_Detail]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_stocklst_detail_ID_ReceivindID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Detail]') AND name = N'IX_stocklst_detail_ID_ReceivindID')
CREATE NONCLUSTERED INDEX [IX_stocklst_detail_ID_ReceivindID] ON [dbo].[StockLst_Detail]
(
	[ReceivingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_stocklst_master_AFCSH]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Stocklst_Master]') AND name = N'IX_stocklst_master_AFCSH')
CREATE NONCLUSTERED INDEX [IX_stocklst_master_AFCSH] ON [dbo].[Stocklst_Master]
(
	[Alloy] ASC,
	[Form] ASC,
	[Cond] ASC,
	[MWeight] ASC,
	[Heat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Stocklst_Master_AFS]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Stocklst_Master]') AND name = N'IX_Stocklst_Master_AFS')
CREATE NONCLUSTERED INDEX [IX_Stocklst_Master_AFS] ON [dbo].[Stocklst_Master]
(
	[Alloy] ASC,
	[Form] ASC,
	[Size] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_Stocklst_Master_DescriptID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Stocklst_Master]') AND name = N'IX_Stocklst_Master_DescriptID')
CREATE NONCLUSTERED INDEX [IX_Stocklst_Master_DescriptID] ON [dbo].[Stocklst_Master]
(
	[DescriptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_stocklst_master_PO]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Stocklst_Master]') AND name = N'IX_stocklst_master_PO')
CREATE NONCLUSTERED INDEX [IX_stocklst_master_PO] ON [dbo].[Stocklst_Master]
(
	[PO_item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [StockLst_Master_num]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Stocklst_Master]') AND name = N'StockLst_Master_num')
CREATE NONCLUSTERED INDEX [StockLst_Master_num] ON [dbo].[Stocklst_Master]
(
	[Num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_stockLst_process_ID_Detail]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Process]') AND name = N'IX_stockLst_process_ID_Detail')
CREATE NONCLUSTERED INDEX [IX_stockLst_process_ID_Detail] ON [dbo].[StockLst_Process]
(
	[ID_Detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_stockLst_process_PO]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Process]') AND name = N'IX_stockLst_process_PO')
CREATE NONCLUSTERED INDEX [IX_stockLst_process_PO] ON [dbo].[StockLst_Process]
(
	[PO_item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_stockLst_process_SO]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Process]') AND name = N'IX_stockLst_process_SO')
CREATE NONCLUSTERED INDEX [IX_stockLst_process_SO] ON [dbo].[StockLst_Process]
(
	[SOitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StockLst_Process_Grab_WO]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Process_Grab]') AND name = N'IX_StockLst_Process_Grab_WO')
CREATE NONCLUSTERED INDEX [IX_StockLst_Process_Grab_WO] ON [dbo].[StockLst_Process_Grab]
(
	[WO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StockLst_Process_Grab-ID_Detail]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Process_Grab]') AND name = N'IX_StockLst_Process_Grab-ID_Detail')
CREATE NONCLUSTERED INDEX [IX_StockLst_Process_Grab-ID_Detail] ON [dbo].[StockLst_Process_Grab]
(
	[ID_Detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_StockLst_Process_Grab-SOitem]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Process_Grab]') AND name = N'IX_StockLst_Process_Grab-SOitem')
CREATE NONCLUSTERED INDEX [IX_StockLst_Process_Grab-SOitem] ON [dbo].[StockLst_Process_Grab]
(
	[SOitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StockLst_Process_Recvd_ID_Detail]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Process_Recvd]') AND name = N'IX_StockLst_Process_Recvd_ID_Detail')
CREATE NONCLUSTERED INDEX [IX_StockLst_Process_Recvd_ID_Detail] ON [dbo].[StockLst_Process_Recvd]
(
	[ID_Detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_StockLst_Process_Recvd_PO_item]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Process_Recvd]') AND name = N'IX_StockLst_Process_Recvd_PO_item')
CREATE NONCLUSTERED INDEX [IX_StockLst_Process_Recvd_PO_item] ON [dbo].[StockLst_Process_Recvd]
(
	[PO_item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StockLst_Process_Recvd_ReceiveID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Process_Recvd]') AND name = N'IX_StockLst_Process_Recvd_ReceiveID')
CREATE NONCLUSTERED INDEX [IX_StockLst_Process_Recvd_ReceiveID] ON [dbo].[StockLst_Process_Recvd]
(
	[ReceivingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StockLst_Process_Recvd_WO_Detail]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Process_Recvd]') AND name = N'IX_StockLst_Process_Recvd_WO_Detail')
CREATE NONCLUSTERED INDEX [IX_StockLst_Process_Recvd_WO_Detail] ON [dbo].[StockLst_Process_Recvd]
(
	[WO_Detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SupplierQuotes_ID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SupplierQuotes]') AND name = N'IX_SupplierQuotes_ID')
CREATE NONCLUSTERED INDEX [IX_SupplierQuotes_ID] ON [dbo].[SupplierQuotes]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SupplierQuotes_InqnumP]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SupplierQuotes]') AND name = N'IX_SupplierQuotes_InqnumP')
CREATE NONCLUSTERED INDEX [IX_SupplierQuotes_InqnumP] ON [dbo].[SupplierQuotes]
(
	[inqnump] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Survey]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Survey]') AND name = N'IX_Survey')
CREATE NONCLUSTERED INDEX [IX_Survey] ON [dbo].[Survey]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Survey_Assignments]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Survey_Assignments]') AND name = N'IX_Survey_Assignments')
CREATE NONCLUSTERED INDEX [IX_Survey_Assignments] ON [dbo].[Survey_Assignments]
(
	[SurveyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ThermalCoupleName]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ThermalCoupleName]') AND name = N'IX_ThermalCoupleName')
CREATE NONCLUSTERED INDEX [IX_ThermalCoupleName] ON [dbo].[ThermalCoupleName]
(
	[HPAName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserTrack-ErrorDate]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserTrack]') AND name = N'IX_UserTrack-ErrorDate')
CREATE NONCLUSTERED INDEX [IX_UserTrack-ErrorDate] ON [dbo].[UserTrack]
(
	[errordate] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UTlog-LogID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UTlog]') AND name = N'IX_UTlog-LogID')
CREATE NONCLUSTERED INDEX [IX_UTlog-LogID] ON [dbo].[UTlog]
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Vendor_Invoice]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Vendor_Invoice]') AND name = N'IX_Vendor_Invoice')
CREATE NONCLUSTERED INDEX [IX_Vendor_Invoice] ON [dbo].[Vendor_Invoice]
(
	[Vendor_Invoice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Vendor_Invoice_HPAPO]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Vendor_Invoice]') AND name = N'IX_Vendor_Invoice_HPAPO')
CREATE NONCLUSTERED INDEX [IX_Vendor_Invoice_HPAPO] ON [dbo].[Vendor_Invoice]
(
	[HPAPO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Vendor_Invoice_Detail]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Vendor_Invoice_Detail]') AND name = N'IX_Vendor_Invoice_Detail')
CREATE NONCLUSTERED INDEX [IX_Vendor_Invoice_Detail] ON [dbo].[Vendor_Invoice_Detail]
(
	[Vendor_Invoice_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Vendor_Invoice_Receive-Poitem]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Vendor_Invoice_Receive]') AND name = N'IX_Vendor_Invoice_Receive-Poitem')
CREATE NONCLUSTERED INDEX [IX_Vendor_Invoice_Receive-Poitem] ON [dbo].[Vendor_Invoice_Receive]
(
	[POitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Vendor_Invoice_Receive-RID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Vendor_Invoice_Receive]') AND name = N'IX_Vendor_Invoice_Receive-RID')
CREATE NONCLUSTERED INDEX [IX_Vendor_Invoice_Receive-RID] ON [dbo].[Vendor_Invoice_Receive]
(
	[Receiving_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [VendorContact_VendCode]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[VendorContact]') AND name = N'VendorContact_VendCode')
CREATE NONCLUSTERED INDEX [VendorContact_VendCode] ON [dbo].[VendorContact]
(
	[VendCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_WaterJetMachines]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[WaterJetMachines]') AND name = N'IX_WaterJetMachines')
CREATE UNIQUE NONCLUSTERED INDEX [IX_WaterJetMachines] ON [dbo].[WaterJetMachines]
(
	[ScanName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_WIPLst_D_Ext_M_ID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[WIPLst_D_Ext]') AND name = N'IX_WIPLst_D_Ext_M_ID')
CREATE NONCLUSTERED INDEX [IX_WIPLst_D_Ext_M_ID] ON [dbo].[WIPLst_D_Ext]
(
	[WIP_M_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_WIPLst_D_Ext_sTBL-sID_Detail]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[WIPLst_D_Ext]') AND name = N'IX_WIPLst_D_Ext_sTBL-sID_Detail')
CREATE NONCLUSTERED INDEX [IX_WIPLst_D_Ext_sTBL-sID_Detail] ON [dbo].[WIPLst_D_Ext]
(
	[sTBL] ASC,
	[sID_Detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_WIPLst_D_Ext_WO]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[WIPLst_D_Ext]') AND name = N'IX_WIPLst_D_Ext_WO')
CREATE NONCLUSTERED INDEX [IX_WIPLst_D_Ext_WO] ON [dbo].[WIPLst_D_Ext]
(
	[WO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_WIPLst_M_Ext_sTBL-sID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[WIPLst_M_Ext]') AND name = N'IX_WIPLst_M_Ext_sTBL-sID')
CREATE NONCLUSTERED INDEX [IX_WIPLst_M_Ext_sTBL-sID] ON [dbo].[WIPLst_M_Ext]
(
	[sTBL] ASC,
	[sID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_WIPLst_M_Ext_WO]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[WIPLst_M_Ext]') AND name = N'IX_WIPLst_M_Ext_WO')
CREATE NONCLUSTERED INDEX [IX_WIPLst_M_Ext_WO] ON [dbo].[WIPLst_M_Ext]
(
	[WO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Wire_log_Lot]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Wire_log]') AND name = N'IX_Wire_log_Lot')
CREATE NONCLUSTERED INDEX [IX_Wire_log_Lot] ON [dbo].[Wire_log]
(
	[lot] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_WOD_Orders_SOitem]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[WOD_Orders]') AND name = N'IX_WOD_Orders_SOitem')
CREATE NONCLUSTERED INDEX [IX_WOD_Orders_SOitem] ON [dbo].[WOD_Orders]
(
	[SOitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_WOD_Orders_WO_Detail]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[WOD_Orders]') AND name = N'IX_WOD_Orders_WO_Detail')
CREATE NONCLUSTERED INDEX [IX_WOD_Orders_WO_Detail] ON [dbo].[WOD_Orders]
(
	[WO_Detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_WorkOrder_Detail-DescriptID]    Script Date: 12/26/2025 5:48:52 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[WorkOrder_Detail]') AND name = N'IX_WorkOrder_Detail-DescriptID')
CREATE NONCLUSTERED INDEX [IX_WorkOrder_Detail-DescriptID] ON [dbo].[WorkOrder_Detail]
(
	[DescriptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Table_1_Created]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AcctCosting] ADD  CONSTRAINT [DF_Table_1_Created]  DEFAULT (getdate()) FOR [dtCreated]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AcctCosting_complete]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AcctCosting] ADD  CONSTRAINT [DF_AcctCosting_complete]  DEFAULT ((0)) FOR [complete]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AcctCosting_cancelled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AcctCosting] ADD  CONSTRAINT [DF_AcctCosting_cancelled]  DEFAULT ((0)) FOR [cancelled]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_alloy_Co]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Alloy] ADD  CONSTRAINT [DF_alloy_Co]  DEFAULT ((0)) FOR [Co]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_alloy_Cr]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Alloy] ADD  CONSTRAINT [DF_alloy_Cr]  DEFAULT ((0)) FOR [Cr]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_alloy_Cu]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Alloy] ADD  CONSTRAINT [DF_alloy_Cu]  DEFAULT ((0)) FOR [Cu]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Alloy__Fe__4740887A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Alloy] ADD  CONSTRAINT [DF__Alloy__Fe__4740887A]  DEFAULT ((0)) FOR [Fe]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Alloy__Mo__464C6441]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Alloy] ADD  CONSTRAINT [DF__Alloy__Mo__464C6441]  DEFAULT ((0)) FOR [Mo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_alloy_Ni]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Alloy] ADD  CONSTRAINT [DF_alloy_Ni]  DEFAULT ((0)) FOR [Ni]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Alloy__Ti__4834ACB3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Alloy] ADD  CONSTRAINT [DF__Alloy__Ti__4834ACB3]  DEFAULT ((0)) FOR [Ti]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Alloy_GL_Machine_I]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Alloy_GL] ADD  CONSTRAINT [DF_Alloy_GL_Machine_I]  DEFAULT ('') FOR [Machine_I]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Alloy_GL_GL_Sales]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Alloy_GL] ADD  CONSTRAINT [DF_Alloy_GL_GL_Sales]  DEFAULT ((0)) FOR [GL_Inv]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Alloy_GL_GL_COGS]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Alloy_GL] ADD  CONSTRAINT [DF_Alloy_GL_GL_COGS]  DEFAULT ((0)) FOR [GL_COGS]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Alloy_Spec_comment]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Alloy_Spec] ADD  CONSTRAINT [DF_Alloy_Spec_comment]  DEFAULT ('') FOR [Title]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Alloy_Spec_Scope]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Alloy_Spec] ADD  CONSTRAINT [DF_Alloy_Spec_Scope]  DEFAULT ('') FOR [Scope]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Alloy_Spec_InActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Alloy_Spec] ADD  CONSTRAINT [DF_Alloy_Spec_InActive]  DEFAULT ((0)) FOR [InActive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_allquotes_cc]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AllQuotes] ADD  CONSTRAINT [DF_allquotes_cc]  DEFAULT ('1') FOR [CC]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AllQuotes_CL]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AllQuotes] ADD  CONSTRAINT [DF_AllQuotes_CL]  DEFAULT ('') FOR [CL]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_allquotes_inqdate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AllQuotes] ADD  CONSTRAINT [DF_allquotes_inqdate]  DEFAULT (getdate()) FOR [InqDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_allquotes_open_]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AllQuotes] ADD  CONSTRAINT [DF_allquotes_open_]  DEFAULT ((1)) FOR [open_]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AllQuotes_QuoteDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AllQuotes] ADD  CONSTRAINT [DF_AllQuotes_QuoteDate]  DEFAULT (getdate()) FOR [QuoteDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_allquotes_Cover]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AllQuotes] ADD  CONSTRAINT [DF_allquotes_Cover]  DEFAULT (' ') FOR [Cover]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Board_Full_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Board_Full] ADD  CONSTRAINT [DF_Board_Full_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Board_Full_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Board_Full] ADD  CONSTRAINT [DF_Board_Full_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BrokerLst_Detail_floorstatus]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BrokerLst_Detail] ADD  CONSTRAINT [DF_BrokerLst_Detail_floorstatus]  DEFAULT ('') FOR [FloorStatus]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BrokerLst_Detail_class]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BrokerLst_Detail] ADD  CONSTRAINT [DF_BrokerLst_Detail_class]  DEFAULT ('') FOR [Class]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BrokerLst_Detail_Inserted_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BrokerLst_Detail_Inserted] ADD  CONSTRAINT [DF_BrokerLst_Detail_Inserted_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BrokerLst_Detail_Inserted_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BrokerLst_Detail_Inserted] ADD  CONSTRAINT [DF_BrokerLst_Detail_Inserted_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BrokerLst_Detail_Inserted_Verified]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BrokerLst_Detail_Inserted] ADD  CONSTRAINT [DF_BrokerLst_Detail_Inserted_Verified]  DEFAULT ((0)) FOR [Verified]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BrokerLst_Detail_Inserted_VerifiedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BrokerLst_Detail_Inserted] ADD  CONSTRAINT [DF_BrokerLst_Detail_Inserted_VerifiedBy]  DEFAULT ('') FOR [VerifiedBy]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BrokerLst_master_cc]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BrokerLst_Master] ADD  CONSTRAINT [DF_BrokerLst_master_cc]  DEFAULT ('1') FOR [CC]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BrokerLst_Master_CL]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BrokerLst_Master] ADD  CONSTRAINT [DF_BrokerLst_Master_CL]  DEFAULT ('') FOR [CL]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BrokerLst_Master_Melt]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BrokerLst_Master] ADD  CONSTRAINT [DF_BrokerLst_Master_Melt]  DEFAULT ('-') FOR [Melt]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BrokerLst_Master_Inserted_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BrokerLst_Master_Inserted] ADD  CONSTRAINT [DF_BrokerLst_Master_Inserted_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BrokerLst_Master_Inserted_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BrokerLst_Master_Inserted] ADD  CONSTRAINT [DF_BrokerLst_Master_Inserted_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BrokerLst_Master_Inserted_VerifiedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BrokerLst_Master_Inserted] ADD  CONSTRAINT [DF_BrokerLst_Master_Inserted_VerifiedBy]  DEFAULT ('') FOR [VerifiedBy]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BrokerLst_Process_SOitem]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BrokerLst_Process] ADD  CONSTRAINT [DF_BrokerLst_Process_SOitem]  DEFAULT ([dbo].[f_ProperSOitem]('')) FOR [SOitem]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BrokerLst_Process_startdate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BrokerLst_Process] ADD  CONSTRAINT [DF_BrokerLst_Process_startdate]  DEFAULT (getdate()) FOR [StartDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BrokerLst_Process_Prc_QTY]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BrokerLst_Process] ADD  CONSTRAINT [DF_BrokerLst_Process_Prc_QTY]  DEFAULT ((0)) FOR [Prc_QTY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BrokerLst_Process_Detail_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BrokerLst_Process_Detail] ADD  CONSTRAINT [DF_BrokerLst_Process_Detail_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BrokerLst_Process_Detail_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BrokerLst_Process_Detail] ADD  CONSTRAINT [DF_BrokerLst_Process_Detail_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BrokerLst_Process_Detail_SOitem]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BrokerLst_Process_Detail] ADD  CONSTRAINT [DF_BrokerLst_Process_Detail_SOitem]  DEFAULT ([dbo].[f_ProperSOitem]('')) FOR [SOitem]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BrokerLst_Process_SOitem_Grab]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BrokerLst_Process_Grab] ADD  CONSTRAINT [DF_BrokerLst_Process_SOitem_Grab]  DEFAULT ([dbo].[f_ProperSOitem]('')) FOR [SOitem]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BrokerLst_Process_Grab_FoundStk]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BrokerLst_Process_Grab] ADD  CONSTRAINT [DF_BrokerLst_Process_Grab_FoundStk]  DEFAULT (getdate()) FOR [FoundStk]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BrokerLst_Process_Grab_Gone]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BrokerLst_Process_Grab] ADD  CONSTRAINT [DF_BrokerLst_Process_Grab_Gone]  DEFAULT ((0)) FOR [Gone]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Cert_WhoInsert]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Cert] ADD  CONSTRAINT [DF_Cert_WhoInsert]  DEFAULT (suser_sname()) FOR [WhoInsert]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Cert_Conf_No_Who_1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Cert_Conf_No] ADD  CONSTRAINT [DF_Cert_Conf_No_Who_1]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Cert_Conf_No_When_1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Cert_Conf_No] ADD  CONSTRAINT [DF_Cert_Conf_No_When_1]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ConditionLevel_Adjust_Code]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ConditionLevel] ADD  CONSTRAINT [DF_ConditionLevel_Adjust_Code]  DEFAULT ('') FOR [Adjust_Code]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ConditionLevel_MinUTS]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ConditionLevel] ADD  CONSTRAINT [DF_ConditionLevel_MinUTS]  DEFAULT ((0)) FOR [MinUTS]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ConditionLevel_MaxUTS]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ConditionLevel] ADD  CONSTRAINT [DF_ConditionLevel_MaxUTS]  DEFAULT ((2147483646)) FOR [MaxUTS]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ConditionLevel_MinYLD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ConditionLevel] ADD  CONSTRAINT [DF_ConditionLevel_MinYLD]  DEFAULT ((0)) FOR [MinYLD]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ConditionLevel_MaxYld]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ConditionLevel] ADD  CONSTRAINT [DF_ConditionLevel_MaxYld]  DEFAULT ((2147483646)) FOR [MaxYld]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ConditionLevel_MinEl]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ConditionLevel] ADD  CONSTRAINT [DF_ConditionLevel_MinEl]  DEFAULT ((0)) FOR [MinEl]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ConditionLevel_MaxEl]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ConditionLevel] ADD  CONSTRAINT [DF_ConditionLevel_MaxEl]  DEFAULT ((255)) FOR [MaxEl]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ConditionLevel_MinRA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ConditionLevel] ADD  CONSTRAINT [DF_ConditionLevel_MinRA]  DEFAULT ((0)) FOR [MinRA]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ConditionLevel_MaxRA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ConditionLevel] ADD  CONSTRAINT [DF_ConditionLevel_MaxRA]  DEFAULT ((255)) FOR [MaxRA]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ConditionLevel_Cmax]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ConditionLevel] ADD  CONSTRAINT [DF_ConditionLevel_Cmax]  DEFAULT ('') FOR [Cmax]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ConditionLevel_Spec]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ConditionLevel] ADD  CONSTRAINT [DF_ConditionLevel_Spec]  DEFAULT ('') FOR [Spec]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CreditCd_Printed]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CreditCd] ADD  CONSTRAINT [DF_CreditCd_Printed]  DEFAULT ((0)) FOR [Printed]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CreditCd_WhoAdded]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CreditCd] ADD  CONSTRAINT [DF_CreditCd_WhoAdded]  DEFAULT (suser_sname()) FOR [WhoAdded]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Customer_Discount_LastUpdate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Customer_Discount] ADD  CONSTRAINT [DF_Customer_Discount_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CUSTOMER_LIST_ldDATE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CUSTOMER_LIST] ADD  CONSTRAINT [DF_CUSTOMER_LIST_ldDATE]  DEFAULT (getdate()) FOR [dtDATE]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Customer_List_call_Date]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Customer_List_call] ADD  CONSTRAINT [DF_Customer_List_call_Date]  DEFAULT (getdate()) FOR [Date]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Customer_List_call_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Customer_List_call] ADD  CONSTRAINT [DF_Customer_List_call_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_DDLEvents]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DDLEvents] ADD CONSTRAINT [DF_DDLEvents]  DEFAULT (getdate()) FOR [EventDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_DDLEvents_ServerName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DDLEvents] ADD  CONSTRAINT [DF_DDLEvents_ServerName]  DEFAULT (@@servername) FOR [ServerName]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_Dies_active]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_Dies] ADD  CONSTRAINT [DF_Draw_Dies_active]  DEFAULT ((1)) FOR [active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_Dies_worn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_Dies] ADD  CONSTRAINT [DF_Draw_Dies_worn]  DEFAULT ((0)) FOR [worn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_HTreat]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_HTreat]  DEFAULT ('') FOR [HTreat]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_PO]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_PO]  DEFAULT ('') FOR [PO]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_OvenTemp]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_OvenTemp]  DEFAULT ((0)) FOR [OvenTemp]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_Tensile]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_Tensile]  DEFAULT ((0)) FOR [Tensile]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_Yield]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_Yield]  DEFAULT ((0)) FOR [Yield]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_Elongation]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_Elongation]  DEFAULT ((0)) FOR [Elongation]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_Red_Area]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_Red_Area]  DEFAULT ((0)) FOR [Red_Area]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_tLoc]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_tLoc]  DEFAULT ('') FOR [tLoc]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_Rockwell]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_Rockwell]  DEFAULT ('') FOR [Rockwell]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_BHN]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_BHN]  DEFAULT ((0)) FOR [BHN]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_Tensile2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_Tensile2]  DEFAULT ((0)) FOR [Tensile2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_Yield2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_Yield2]  DEFAULT ((0)) FOR [Yield2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_Elongation2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_Elongation2]  DEFAULT ((0)) FOR [Elongation2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_Red_Area2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_Red_Area2]  DEFAULT ((0)) FOR [Red_Area2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_tLoc2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_tLoc2]  DEFAULT ('') FOR [tLoc2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_Rockwell2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_Rockwell2]  DEFAULT ('') FOR [Rockwell2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_BHN2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_BHN2]  DEFAULT ((0)) FOR [BHN2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_Tensile3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_Tensile3]  DEFAULT ((0)) FOR [Tensile3]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_Yield3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_Yield3]  DEFAULT ((0)) FOR [Yield3]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_Elongation3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_Elongation3]  DEFAULT ((0)) FOR [Elongation3]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_red_area3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_red_area3]  DEFAULT ((0)) FOR [red_area3]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_tLoc3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_tLoc3]  DEFAULT ('') FOR [tLoc3]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_Rockwell3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_Rockwell3]  DEFAULT ('') FOR [Rockwell3]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_BHN3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_BHN3]  DEFAULT ((0)) FOR [BHN3]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_Tensile4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_Tensile4]  DEFAULT ((0)) FOR [Tensile4]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_Yield4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_Yield4]  DEFAULT ((0)) FOR [Yield4]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_Elongation4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_Elongation4]  DEFAULT ((0)) FOR [Elongation4]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_Red_Area4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_Red_Area4]  DEFAULT ((0)) FOR [Red_Area4]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_tLoc4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_tLoc4]  DEFAULT ('') FOR [tLoc4]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_Rockwell4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_Rockwell4]  DEFAULT ('') FOR [Rockwell4]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_BHN4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_BHN4]  DEFAULT ((0)) FOR [BHN4]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_Tensile5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_Tensile5]  DEFAULT ((0)) FOR [Tensile5]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_Yield5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_Yield5]  DEFAULT ((0)) FOR [Yield5]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_Elongation5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_Elongation5]  DEFAULT ((0)) FOR [Elongation5]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_Red_Area5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_Red_Area5]  DEFAULT ((0)) FOR [Red_Area5]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_tLoc5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_tLoc5]  DEFAULT ('') FOR [tLoc5]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_Rockwell5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_Rockwell5]  DEFAULT ('') FOR [Rockwell5]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_BHN5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_BHN5]  DEFAULT ((0)) FOR [BHN5]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_Tensile6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_Tensile6]  DEFAULT ((0)) FOR [Tensile6]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_Yield6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_Yield6]  DEFAULT ((0)) FOR [Yield6]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_Elongation6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_Elongation6]  DEFAULT ((0)) FOR [Elongation6]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_Red_Area6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_Red_Area6]  DEFAULT ((0)) FOR [Red_Area6]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_tLoc6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_tLoc6]  DEFAULT ('') FOR [tLoc6]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_Tensile7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_Tensile7]  DEFAULT ((0)) FOR [Tensile7]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_Yield7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_Yield7]  DEFAULT ((0)) FOR [Yield7]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_Elongation7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_Elongation7]  DEFAULT ((0)) FOR [Elongation7]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_Red_Area7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_Red_Area7]  DEFAULT ((0)) FOR [Red_Area7]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_tLoc7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_tLoc7]  DEFAULT ('') FOR [tLoc7]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_TestPO]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_TestPO]  DEFAULT ((0)) FOR [TestPO]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_TestPOitem]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_TestPOitem]  DEFAULT ('') FOR [TestPOitem]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_TestItemPO]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_TestItemPO]  DEFAULT ((0)) FOR [TestItemPO]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_Lab]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_Lab]  DEFAULT ('') FOR [Lab]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_TestPO2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_TestPO2]  DEFAULT ((0)) FOR [TestPO2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_TestPOitem2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_TestPOitem2]  DEFAULT ('') FOR [TestPOitem2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_Minutes]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_Minutes]  DEFAULT ((0)) FOR [Minutes]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_HTrockwell]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_HTrockwell]  DEFAULT ('') FOR [HTrockwell]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_HTBHN]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_HTBHN]  DEFAULT ((0)) FOR [HTBHN]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_LMA_Practice]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_LMA_Practice]  DEFAULT ('') FOR [LMA_Practice]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_LMA_Procedure]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_LMA_Procedure]  DEFAULT ('') FOR [LMA_Procedure]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_WO]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_WO]  DEFAULT ((0)) FOR [WO]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_WO_Detail]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_WO_Detail]  DEFAULT ((0)) FOR [WO_Detail]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_Machine]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_Machine]  DEFAULT ('') FOR [Machine]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_Oper]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_Oper]  DEFAULT ('') FOR [Oper]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_ProjID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_ProjID]  DEFAULT ((0)) FOR [ProjID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_log_WhoInsert]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_log] ADD  CONSTRAINT [DF_Draw_log_WhoInsert]  DEFAULT (suser_sname()) FOR [WhoInsert]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_Sched_Ann1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_Sched] ADD  CONSTRAINT [DF_Draw_Sched_Ann1]  DEFAULT ((0)) FOR [Ann1]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_Sched_Ann2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_Sched] ADD  CONSTRAINT [DF_Draw_Sched_Ann2]  DEFAULT ((0)) FOR [Ann2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_Sched_Ann3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_Sched] ADD  CONSTRAINT [DF_Draw_Sched_Ann3]  DEFAULT ((0)) FOR [Ann3]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_Sched_Ann4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_Sched] ADD  CONSTRAINT [DF_Draw_Sched_Ann4]  DEFAULT ((0)) FOR [Ann4]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_Sched_Ann5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_Sched] ADD  CONSTRAINT [DF_Draw_Sched_Ann5]  DEFAULT ((0)) FOR [Ann5]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_Sched_Ann6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_Sched] ADD  CONSTRAINT [DF_Draw_Sched_Ann6]  DEFAULT ((0)) FOR [Ann6]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_Sched_Ann7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_Sched] ADD  CONSTRAINT [DF_Draw_Sched_Ann7]  DEFAULT ((0)) FOR [Ann7]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_Sched_Ann8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_Sched] ADD  CONSTRAINT [DF_Draw_Sched_Ann8]  DEFAULT ((0)) FOR [Ann8]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Draw_Sched_Ann9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Draw_Sched] ADD  CONSTRAINT [DF_Draw_Sched_Ann9]  DEFAULT ((0)) FOR [Ann9]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Table_1_MailServer]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EmailService_Credentials] ADD  CONSTRAINT [DF_Table_1_MailServer]  DEFAULT ('imap.gmail.com') FOR [ReceiveMailServer]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_EmailService_Credential_ServiceTypeId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EmailService_Credentials] ADD  CONSTRAINT [DF_EmailService_Credential_ServiceTypeId]  DEFAULT ((1)) FOR [ServiceTypeId]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_EmailService_Credential_Port]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EmailService_Credentials] ADD  CONSTRAINT [DF_EmailService_Credential_Port]  DEFAULT ((993)) FOR [Port]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_EmailService_Credential_SSL]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EmailService_Credentials] ADD  CONSTRAINT [DF_EmailService_Credential_SSL]  DEFAULT ((1)) FOR [SSL]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_EmailService_Credential_CheckFolder]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EmailService_Credentials] ADD  CONSTRAINT [DF_EmailService_Credential_CheckFolder]  DEFAULT ('Inbox') FOR [CheckFolder]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_EmailService_Credential_ProcessedFolder]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EmailService_Credentials] ADD  CONSTRAINT [DF_EmailService_Credential_ProcessedFolder]  DEFAULT ('Processed') FOR [ProcessedFolder]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_EmailService_Credential_Default Config]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EmailService_Credentials] ADD  CONSTRAINT [DF_EmailService_Credential_Default Config]  DEFAULT ((0)) FOR [Default Config]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_EmailService_Credentials_SendPort]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EmailService_Credentials] ADD  CONSTRAINT [DF_EmailService_Credentials_SendPort]  DEFAULT ((465)) FOR [SendPort]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_EmailService_Credentials_SendSSL]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EmailService_Credentials] ADD  CONSTRAINT [DF_EmailService_Credentials_SendSSL]  DEFAULT ((1)) FOR [SendSSL]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_EmailService_Credentials_SendAuthenticate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EmailService_Credentials] ADD  CONSTRAINT [DF_EmailService_Credentials_SendAuthenticate]  DEFAULT ((1)) FOR [SendAuthenticate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_EmailService_Email_Id]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EmailService_Email] ADD  CONSTRAINT [DF_EmailService_Email_Id]  DEFAULT (newid()) FOR [Id]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_EmailService_Email_ReceivedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EmailService_Email] ADD  CONSTRAINT [DF_EmailService_Email_ReceivedDate]  DEFAULT (getdate()) FOR [ReceivedDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Table_1_TimeStamp]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EmailService_Email_Log] ADD  CONSTRAINT [DF_Table_1_TimeStamp]  DEFAULT (getdate()) FOR [ForwardTime]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_EmailService_Email_Log_EmailAddressedTo]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EmailService_Email_Log] ADD  CONSTRAINT [DF_EmailService_Email_Log_EmailAddressedTo]  DEFAULT ('quotes@ERP_1s.com') FOR [EmailAddressedTo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_EmailService_Email_Log_RepeatEmail]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EmailService_Email_Log] ADD  CONSTRAINT [DF_EmailService_Email_Log_RepeatEmail]  DEFAULT ((0)) FOR [RepeatEmailSender]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_EmailService_EmailMatchExceptions_Id]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EmailService_EmailMatchExceptions] ADD  CONSTRAINT [DF_EmailService_EmailMatchExceptions_Id]  DEFAULT (newid()) FOR [Id]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_EmailService_EmailMatchExceptions_GlobalDomain]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EmailService_EmailMatchExceptions] ADD  CONSTRAINT [DF_EmailService_EmailMatchExceptions_GlobalDomain]  DEFAULT ((1)) FOR [GlobalDomain]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_EmailService_SalesUsers_Active]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EmailService_SalesUsers] ADD  CONSTRAINT [DF_EmailService_SalesUsers_Active]  DEFAULT ((0)) FOR [MarkAbsent]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_EmailService_SalesUsers_SP_Initial]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EmailService_SalesUsers] ADD  CONSTRAINT [DF_EmailService_SalesUsers_SP_Initial]  DEFAULT ('') FOR [SP_Initial]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_EmailService_SalesUsers_IsActiveSales]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EmailService_SalesUsers] ADD  CONSTRAINT [DF_EmailService_SalesUsers_IsActiveSales]  DEFAULT ((1)) FOR [IsActiveSales]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_EmailService_SalesUsers_EmailService_SalesUsers_Schedule]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EmailService_SalesUsers] ADD  CONSTRAINT [DF_EmailService_SalesUsers_EmailService_SalesUsers_Schedule]  DEFAULT ((1)) FOR [EmailService_SalesUsers_Schedule]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_EmailService_SalesUsers_ManualSettings]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EmailService_SalesUsers] ADD  CONSTRAINT [DF_EmailService_SalesUsers_ManualSettings]  DEFAULT ((0)) FOR [ManualSettings]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_EmailService_SalesUsers_EmailWeight]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EmailService_SalesUsers] ADD  CONSTRAINT [DF_EmailService_SalesUsers_EmailWeight]  DEFAULT ((1)) FOR [EmailWeight]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_EmailService_SalesUsers_Schedule1_WorkDay Open]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EmailService_SalesUsers_Schedule] ADD  CONSTRAINT [DF_EmailService_SalesUsers_Schedule1_WorkDay Open]  DEFAULT ('08:00:00.0000000') FOR [WorkDay Open]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_EmailService_SalesUsers_Schedule1_WorkDay Close]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EmailService_SalesUsers_Schedule] ADD  CONSTRAINT [DF_EmailService_SalesUsers_Schedule1_WorkDay Close]  DEFAULT ('17:00:00.0000000') FOR [WorkDay Close]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Employee_ShopEmployee]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_ShopEmployee]  DEFAULT ((0)) FOR [ShopEmployee]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WaterJetFilterItems_Cost]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EquipmentPartItems] ADD  CONSTRAINT [DF_WaterJetFilterItems_Cost]  DEFAULT ((0)) FOR [Cost]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_EquipmentParts_MachineAssociated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EquipmentParts] ADD  CONSTRAINT [DF_EquipmentParts_MachineAssociated]  DEFAULT ((0)) FOR [MachineAssociated]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_EquipmentParts_Swapable]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EquipmentParts] ADD  CONSTRAINT [DF_EquipmentParts_Swapable]  DEFAULT ((0)) FOR [Swapable]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_EquipmentPartSwapDates_StartDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EquipmentPartSwapDates] ADD  CONSTRAINT [DF_EquipmentPartSwapDates_StartDate]  DEFAULT (getdate()) FOR [StartDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ErrorLog_EventDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ErrorLog] ADD  CONSTRAINT [DF_ErrorLog_EventDate]  DEFAULT (getdate()) FOR [EventDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Errors_errordate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Errors] ADD  CONSTRAINT [DF_Errors_errordate]  DEFAULT (getdate()) FOR [ErrorDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Errors_MACHINE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Errors] ADD  CONSTRAINT [DF_Errors_MACHINE]  DEFAULT (suser_sname()) FOR [MACHINE]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ForecastStock_CL]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ForecastStock] ADD  CONSTRAINT [DF_ForecastStock_CL]  DEFAULT ('') FOR [CL]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forms_useDim2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forms] ADD  CONSTRAINT [DF_Forms_useDim2]  DEFAULT ((1)) FOR [useDim2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forms_Price]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forms] ADD  CONSTRAINT [DF_Forms_Price]  DEFAULT ('LB') FOR [Price]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forms_Branch]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forms] ADD  CONSTRAINT [DF_Forms_Branch]  DEFAULT (' ') FOR [Branch]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Forms_Tol]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forms] ADD  CONSTRAINT [DF_Forms_Tol]  DEFAULT ((1)) FOR [Tol]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_Die_Condition_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_Die_Condition] ADD  CONSTRAINT [DF_GFM_Die_Condition_ID]  DEFAULT (newid()) FOR [ID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_Die_Condition_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_Die_Condition] ADD  CONSTRAINT [DF_GFM_Die_Condition_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_Die_Condition_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_Die_Condition] ADD  CONSTRAINT [DF_GFM_Die_Condition_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_Die_Daily_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_Die_Daily] ADD  CONSTRAINT [DF_GFM_Die_Daily_ID]  DEFAULT (newid()) FOR [ID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_Die_Daily_DieID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_Die_Daily] ADD  CONSTRAINT [DF_GFM_Die_Daily_DieID]  DEFAULT (newid()) FOR [DieID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_Die_Daily_Date]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_Die_Daily] ADD  CONSTRAINT [DF_GFM_Die_Daily_Date]  DEFAULT (getdate()) FOR [Date]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_Die_Daily_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_Die_Daily] ADD  CONSTRAINT [DF_GFM_Die_Daily_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_Die_Height_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_Die_Height] ADD  CONSTRAINT [DF_GFM_Die_Height_ID]  DEFAULT (newid()) FOR [ID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_Die_Height_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_Die_Height] ADD  CONSTRAINT [DF_GFM_Die_Height_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_Die_Height_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_Die_Height] ADD  CONSTRAINT [DF_GFM_Die_Height_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_Die_Inspection_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_Die_Inspection] ADD  CONSTRAINT [DF_GFM_Die_Inspection_ID]  DEFAULT (newid()) FOR [ID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_Die_Inspection_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_Die_Inspection] ADD  CONSTRAINT [DF_GFM_Die_Inspection_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_Die_Inspection_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_Die_Inspection] ADD  CONSTRAINT [DF_GFM_Die_Inspection_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_Die_Inventory_DieID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_Die_Inventory] ADD  CONSTRAINT [DF_GFM_Die_Inventory_DieID]  DEFAULT (newid()) FOR [DieID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_Die_Inventory_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_Die_Inventory] ADD  CONSTRAINT [DF_GFM_Die_Inventory_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_Die_Inventory_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_Die_Inventory] ADD  CONSTRAINT [DF_GFM_Die_Inventory_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_Die_Landing_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_Die_Landing] ADD  CONSTRAINT [DF_GFM_Die_Landing_ID]  DEFAULT (newid()) FOR [ID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_Die_Landing_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_Die_Landing] ADD  CONSTRAINT [DF_GFM_Die_Landing_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_Die_Landing_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_Die_Landing] ADD  CONSTRAINT [DF_GFM_Die_Landing_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_Die_On_OT_RowID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_Die_On_OT] ADD  CONSTRAINT [DF_GFM_Die_On_OT_RowID]  DEFAULT (newid()) FOR [RowID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_Die_Range_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_Die_Range] ADD  CONSTRAINT [DF_GFM_Die_Range_ID]  DEFAULT (newid()) FOR [ID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_Die_Range_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_Die_Range] ADD  CONSTRAINT [DF_GFM_Die_Range_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_Die_Range_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_Die_Range] ADD  CONSTRAINT [DF_GFM_Die_Range_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_Die_Repair_RepairID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_Die_Repair] ADD  CONSTRAINT [DF_GFM_Die_Repair_RepairID]  DEFAULT (newid()) FOR [RepairID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_Die_Repair_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_Die_Repair] ADD  CONSTRAINT [DF_GFM_Die_Repair_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_Die_Repair_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_Die_Repair] ADD  CONSTRAINT [DF_GFM_Die_Repair_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_DieSets_DieID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_DieSets] ADD  CONSTRAINT [DF_GFM_DieSets_DieID]  DEFAULT (newid()) FOR [DieID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_DieSets_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_DieSets] ADD  CONSTRAINT [DF_GFM_DieSets_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_DieSets_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_DieSets] ADD  CONSTRAINT [DF_GFM_DieSets_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_DieSets_Condition_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_DieSets_Condition] ADD  CONSTRAINT [DF_GFM_DieSets_Condition_ID]  DEFAULT (newid()) FOR [ID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_DieSets_Condition_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_DieSets_Condition] ADD  CONSTRAINT [DF_GFM_DieSets_Condition_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_DieSets_Condition_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_DieSets_Condition] ADD  CONSTRAINT [DF_GFM_DieSets_Condition_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_DieSets_Height_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_DieSets_Height] ADD  CONSTRAINT [DF_GFM_DieSets_Height_ID]  DEFAULT (newid()) FOR [ID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_DieSets_Height_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_DieSets_Height] ADD  CONSTRAINT [DF_GFM_DieSets_Height_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_DieSets_Height_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_DieSets_Height] ADD  CONSTRAINT [DF_GFM_DieSets_Height_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_DieSets_Inspection_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_DieSets_Inspection] ADD  CONSTRAINT [DF_GFM_DieSets_Inspection_ID]  DEFAULT (newid()) FOR [ID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_DieSets_Inspection_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_DieSets_Inspection] ADD  CONSTRAINT [DF_GFM_DieSets_Inspection_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_DieSets_Inspection_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_DieSets_Inspection] ADD  CONSTRAINT [DF_GFM_DieSets_Inspection_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_DieSets_Inspection_Deleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_DieSets_Inspection] ADD  CONSTRAINT [DF_GFM_DieSets_Inspection_Deleted]  DEFAULT ((0)) FOR [Deleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_DieSets_LandingSize_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_DieSets_LandingSize] ADD  CONSTRAINT [DF_GFM_DieSets_LandingSize_ID]  DEFAULT (newid()) FOR [ID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_DieSets_LandingSize_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_DieSets_LandingSize] ADD  CONSTRAINT [DF_GFM_DieSets_LandingSize_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_DieSets_LandingSize_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_DieSets_LandingSize] ADD  CONSTRAINT [DF_GFM_DieSets_LandingSize_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_DieSet_Machine_Type_Map_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_DieSets_Machine_Type_Map] ADD  CONSTRAINT [DF_GFM_DieSet_Machine_Type_Map_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_DieSet_Machine_Type_Map_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_DieSets_Machine_Type_Map] ADD  CONSTRAINT [DF_GFM_DieSet_Machine_Type_Map_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_DieSet_Machine_Type_Map_deleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_DieSets_Machine_Type_Map] ADD  CONSTRAINT [DF_GFM_DieSet_Machine_Type_Map_deleted]  DEFAULT ((0)) FOR [deleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_DieSets_Repair_RepairID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_DieSets_Repair] ADD  CONSTRAINT [DF_GFM_DieSets_Repair_RepairID]  DEFAULT (newid()) FOR [RepairID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_DieSets_Repair_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_DieSets_Repair] ADD  CONSTRAINT [DF_GFM_DieSets_Repair_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_DieSets_Repair_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_DieSets_Repair] ADD  CONSTRAINT [DF_GFM_DieSets_Repair_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_DieSets_Repair_Deleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_DieSets_Repair] ADD  CONSTRAINT [DF_GFM_DieSets_Repair_Deleted]  DEFAULT ((0)) FOR [Deleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_DieSets_RunTimeLogs_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_DieSets_RunTimeLogs] ADD  CONSTRAINT [DF_GFM_DieSets_RunTimeLogs_ID]  DEFAULT (newid()) FOR [ID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_DieSets_RunTimeLogs_DieID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_DieSets_RunTimeLogs] ADD  CONSTRAINT [DF_GFM_DieSets_RunTimeLogs_DieID]  DEFAULT (newid()) FOR [DieID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_DieSets_RunTimeLogs_Date]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_DieSets_RunTimeLogs] ADD  CONSTRAINT [DF_GFM_DieSets_RunTimeLogs_Date]  DEFAULT (getdate()) FOR [Date]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_DieSets_RunTimeLogs_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_DieSets_RunTimeLogs] ADD  CONSTRAINT [DF_GFM_DieSets_RunTimeLogs_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_Machines_OpeningHeight]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_Machines] ADD  CONSTRAINT [DF_GFM_Machines_OpeningHeight]  DEFAULT ((0)) FOR [OpeningHeight]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_Machines_Type_Map_MTMapID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_Machines_Type_Map] ADD  CONSTRAINT [DF_GFM_Machines_Type_Map_MTMapID]  DEFAULT (newid()) FOR [MTMapID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFM_Machines_Type_Map_Disabled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFM_Machines_Type_Map] ADD  CONSTRAINT [DF_GFM_Machines_Type_Map_Disabled]  DEFAULT ((0)) FOR [Disabled]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_HTreat]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_HTreat]  DEFAULT ('') FOR [HTreat]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_PO]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_PO]  DEFAULT ('') FOR [PO]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_OvenTemp]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_OvenTemp]  DEFAULT ((0)) FOR [OvenTemp]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_Tensile]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_Tensile]  DEFAULT ((0)) FOR [Tensile]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_Yield]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_Yield]  DEFAULT ((0)) FOR [Yield]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_Elongation]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_Elongation]  DEFAULT ((0)) FOR [Elongation]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_Red_Area]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_Red_Area]  DEFAULT ((0)) FOR [Red_Area]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_tLoc]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_tLoc]  DEFAULT ('') FOR [tLoc]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_Rockwell]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_Rockwell]  DEFAULT ('') FOR [Rockwell]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_BHN]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_BHN]  DEFAULT ((0)) FOR [BHN]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_Tensile2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_Tensile2]  DEFAULT ((0)) FOR [Tensile2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_Yield2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_Yield2]  DEFAULT ((0)) FOR [Yield2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_Elongation2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_Elongation2]  DEFAULT ((0)) FOR [Elongation2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_Red_Area2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_Red_Area2]  DEFAULT ((0)) FOR [Red_Area2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_tLoc2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_tLoc2]  DEFAULT ('') FOR [tLoc2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_Rockwell2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_Rockwell2]  DEFAULT ('') FOR [Rockwell2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_BHN2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_BHN2]  DEFAULT ((0)) FOR [BHN2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_Tensile3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_Tensile3]  DEFAULT ((0)) FOR [Tensile3]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_Yield3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_Yield3]  DEFAULT ((0)) FOR [Yield3]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_Elongation3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_Elongation3]  DEFAULT ((0)) FOR [Elongation3]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_red_area3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_red_area3]  DEFAULT ((0)) FOR [red_area3]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_tLoc3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_tLoc3]  DEFAULT ('') FOR [tLoc3]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_Rockwell3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_Rockwell3]  DEFAULT ('') FOR [Rockwell3]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_BHN3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_BHN3]  DEFAULT ((0)) FOR [BHN3]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_Tensile4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_Tensile4]  DEFAULT ((0)) FOR [Tensile4]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_Yield4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_Yield4]  DEFAULT ((0)) FOR [Yield4]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_Elongation4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_Elongation4]  DEFAULT ((0)) FOR [Elongation4]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_Red_Area4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_Red_Area4]  DEFAULT ((0)) FOR [Red_Area4]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_tLoc4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_tLoc4]  DEFAULT ('') FOR [tLoc4]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_Rockwell4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_Rockwell4]  DEFAULT ('') FOR [Rockwell4]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_BHN4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_BHN4]  DEFAULT ((0)) FOR [BHN4]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_Tensile5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_Tensile5]  DEFAULT ((0)) FOR [Tensile5]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_Yield5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_Yield5]  DEFAULT ((0)) FOR [Yield5]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_Elongation5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_Elongation5]  DEFAULT ((0)) FOR [Elongation5]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_Red_Area5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_Red_Area5]  DEFAULT ((0)) FOR [Red_Area5]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_tLoc5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_tLoc5]  DEFAULT ('') FOR [tLoc5]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_Rockwell5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_Rockwell5]  DEFAULT ('') FOR [Rockwell5]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_BHN5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_BHN5]  DEFAULT ((0)) FOR [BHN5]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_Tensile6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_Tensile6]  DEFAULT ((0)) FOR [Tensile6]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_Yield6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_Yield6]  DEFAULT ((0)) FOR [Yield6]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_Elongation6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_Elongation6]  DEFAULT ((0)) FOR [Elongation6]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_Red_Area6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_Red_Area6]  DEFAULT ((0)) FOR [Red_Area6]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_tLoc6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_tLoc6]  DEFAULT ('') FOR [tLoc6]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_Tensile7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_Tensile7]  DEFAULT ((0)) FOR [Tensile7]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_Yield7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_Yield7]  DEFAULT ((0)) FOR [Yield7]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_Elongation7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_Elongation7]  DEFAULT ((0)) FOR [Elongation7]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_Red_Area7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_Red_Area7]  DEFAULT ((0)) FOR [Red_Area7]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_tLoc7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_tLoc7]  DEFAULT ('') FOR [tLoc7]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_TestPO]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_TestPO]  DEFAULT ((0)) FOR [TestPO]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_TestPOitem]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_TestPOitem]  DEFAULT ('') FOR [TestPOitem]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_TestItemPO]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_TestItemPO]  DEFAULT ((0)) FOR [TestItemPO]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_Lab]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_Lab]  DEFAULT ('') FOR [Lab]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_TestPO2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_TestPO2]  DEFAULT ((0)) FOR [TestPO2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_TestPOitem2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_TestPOitem2]  DEFAULT ('') FOR [TestPOitem2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_Minutes]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_Minutes]  DEFAULT ((0)) FOR [Minutes]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_HTrockwell]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_HTrockwell]  DEFAULT ('') FOR [HTrockwell]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_HTBHN]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_HTBHN]  DEFAULT ((0)) FOR [HTBHN]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_LMA_Practice]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_LMA_Practice]  DEFAULT ('') FOR [LMA_Practice]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_LMA_Procedure]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_LMA_Procedure]  DEFAULT ('') FOR [LMA_Procedure]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_WO]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_WO]  DEFAULT ((0)) FOR [WO]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_WO_Detail]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_WO_Detail]  DEFAULT ((0)) FOR [WO_Detail]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_Machine]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_Machine]  DEFAULT ('') FOR [Machine]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_Oper]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_Oper]  DEFAULT ('') FOR [Oper]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_ProjID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_ProjID]  DEFAULT ((0)) FOR [ProjID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GFMlog_WhoInsert]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GFMlog] ADD  CONSTRAINT [DF_GFMlog_WhoInsert]  DEFAULT (suser_sname()) FOR [WhoInsert]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_HT_log_WhoInsert]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HT_log] ADD  CONSTRAINT [DF_HT_log_WhoInsert]  DEFAULT (suser_sname()) FOR [WhoInsert]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_LakeErie_log_WhoInsert]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LakeErie_log] ADD  CONSTRAINT [DF_LakeErie_log_WhoInsert]  DEFAULT (suser_sname()) FOR [WhoInsert]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Mach_Detail_Start_Date]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Mach_Detail] ADD  CONSTRAINT [DF_Mach_Detail_Start_Date]  DEFAULT (getdate()) FOR [Start_Date]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Mach_Detail_Start_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Mach_Detail] ADD  CONSTRAINT [DF_Mach_Detail_Start_Who]  DEFAULT (suser_sname()) FOR [Start_Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_McMaster_CrossTab_TradeName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[McMaster_CrossTab] ADD  CONSTRAINT [DF_McMaster_CrossTab_TradeName]  DEFAULT ('') FOR [TradeName]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_McMaster_Inquire_SaveThis]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[McMaster_Inquire] ADD  CONSTRAINT [DF_McMaster_Inquire_SaveThis]  DEFAULT ((0)) FOR [Quote]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_McMaster_Inquire_PI_Width]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[McMaster_Inquire] ADD  CONSTRAINT [DF_McMaster_Inquire_PI_Width]  DEFAULT ((0)) FOR [PI_Width]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_McMaster_Inquire_PI_Length]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[McMaster_Inquire] ADD  CONSTRAINT [DF_McMaster_Inquire_PI_Length]  DEFAULT ((0)) FOR [PI_Length]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_McMaster_InquireTab_TradeName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[McMaster_Inquire] ADD  CONSTRAINT [DF_McMaster_InquireTab_TradeName]  DEFAULT ('') FOR [TradeName]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_McMaster_Quotes_PF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[McMaster_Quotes] ADD  CONSTRAINT [DF_McMaster_Quotes_PF]  DEFAULT ((0)) FOR [PF]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MTR_Loc_StoreDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MTR_Loc] ADD  CONSTRAINT [DF_MTR_Loc_StoreDate]  DEFAULT (getdate()) FOR [StoreDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_OT_Job_IsMachine]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[OT_Job] ADD  CONSTRAINT [DF_OT_Job_IsMachine]  DEFAULT ((0)) FOR [IsMachine]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_OT_Times_StartTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[OT_Times] ADD  CONSTRAINT [DF_OT_Times_StartTime]  DEFAULT (getdate()) FOR [StartTime]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_OT_Total_Total Job Time]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[OT_Total] ADD  CONSTRAINT [DF_OT_Total_Total Job Time]  DEFAULT ((0)) FOR [Total Job Time]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PackingSlip_WhenAdd]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PackingSlip] ADD  CONSTRAINT [DF_PackingSlip_WhenAdd]  DEFAULT (getdate()) FOR [WhenAdd]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PackingSlip_First_RSO]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PackingSlip] ADD  CONSTRAINT [DF_PackingSlip_First_RSO]  DEFAULT (getdate()) FOR [First_RSO]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PackingSlip_PickedUp]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PackingSlip] ADD  CONSTRAINT [DF_PackingSlip_PickedUp]  DEFAULT ((0)) FOR [PickedUp]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PackingSlip_No_RSO_Date]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PackingSlip_No] ADD  CONSTRAINT [DF_PackingSlip_No_RSO_Date]  DEFAULT (getdate()) FOR [RSO_Date]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PackingSlip_No_who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PackingSlip_No] ADD  CONSTRAINT [DF_PackingSlip_No_who]  DEFAULT (suser_sname()) FOR [WHO]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PO_No_PO_Rev]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PO_No] ADD  CONSTRAINT [DF_PO_No_PO_Rev]  DEFAULT ((0)) FOR [PO_Rev]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PO_No_Cancelled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PO_No] ADD  CONSTRAINT [DF_PO_No_Cancelled]  DEFAULT ((0)) FOR [Cancelled]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PO_No_Reconciled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PO_No] ADD  CONSTRAINT [DF_PO_No_Reconciled]  DEFAULT ((0)) FOR [Reconciled]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PO_No_Changing]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PO_No] ADD  CONSTRAINT [DF_PO_No_Changing]  DEFAULT ((0)) FOR [Changing]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PO_No_Printed]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PO_No] ADD  CONSTRAINT [DF_PO_No_Printed]  DEFAULT ((0)) FOR [Printed]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PO_No_SentUnAproved]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PO_No] ADD  CONSTRAINT [DF_PO_No_SentUnAproved]  DEFAULT ((0)) FOR [SentUnAproved]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PO_No_SentCondAprv]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PO_No] ADD  CONSTRAINT [DF_PO_No_SentCondAprv]  DEFAULT ((0)) FOR [SentCondAprv]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PO_No_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PO_No] ADD  CONSTRAINT [DF_PO_No_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PO_No_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PO_No] ADD  CONSTRAINT [DF_PO_No_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PO_SOdist_ReconcileTotal]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PO_SOdist] ADD  CONSTRAINT [DF_PO_SOdist_ReconcileTotal]  DEFAULT ((0)) FOR [ReconcileTotal]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PO_SOdist_who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PO_SOdist] ADD  CONSTRAINT [DF_PO_SOdist_who]  DEFAULT (suser_sname()) FOR [who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PriceTable_CL]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PriceTable] ADD  CONSTRAINT [DF_PriceTable_CL]  DEFAULT ('') FOR [CL]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PriceTable_w0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PriceTable] ADD  CONSTRAINT [DF_PriceTable_w0]  DEFAULT ((0)) FOR [w0]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PriceTable_w5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PriceTable] ADD  CONSTRAINT [DF_PriceTable_w5]  DEFAULT ((0)) FOR [w5]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PriceTable_w10]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PriceTable] ADD  CONSTRAINT [DF_PriceTable_w10]  DEFAULT ((0)) FOR [w10]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PriceTable_w25]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PriceTable] ADD  CONSTRAINT [DF_PriceTable_w25]  DEFAULT ((0)) FOR [w25]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PriceTable_w50]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PriceTable] ADD  CONSTRAINT [DF_PriceTable_w50]  DEFAULT ((0)) FOR [w50]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PriceTable_w100]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PriceTable] ADD  CONSTRAINT [DF_PriceTable_w100]  DEFAULT ((0)) FOR [w100]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PriceTable_w200]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PriceTable] ADD  CONSTRAINT [DF_PriceTable_w200]  DEFAULT ((0)) FOR [w200]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PriceTable_w500]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PriceTable] ADD  CONSTRAINT [DF_PriceTable_w500]  DEFAULT ((0)) FOR [w500]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PriceTable_w1000]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PriceTable] ADD  CONSTRAINT [DF_PriceTable_w1000]  DEFAULT ((0)) FOR [w1000]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PriceTable_w2000]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PriceTable] ADD  CONSTRAINT [DF_PriceTable_w2000]  DEFAULT ((0)) FOR [w2000]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PriceTable_wBASE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PriceTable] ADD  CONSTRAINT [DF_PriceTable_wBASE]  DEFAULT ((0)) FOR [wBASE]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PriceTable_lastedit]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PriceTable] ADD  CONSTRAINT [DF_PriceTable_lastedit]  DEFAULT (getdate()) FOR [lastedit]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PriceTable_username]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PriceTable] ADD  CONSTRAINT [DF_PriceTable_username]  DEFAULT (left(suser_sname(),(20))) FOR [username]
END
GO
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PriceTable_h0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PriceTable] ADD  CONSTRAINT [DF_PriceTable_h0]  DEFAULT ((0)) FOR [h0]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PriceTable_h5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PriceTable] ADD  CONSTRAINT [DF_PriceTable_h5]  DEFAULT ((0)) FOR [h5]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PriceTable_h10]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PriceTable] ADD  CONSTRAINT [DF_PriceTable_h10]  DEFAULT ((0)) FOR [h10]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PriceTable_h25]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PriceTable] ADD  CONSTRAINT [DF_PriceTable_h25]  DEFAULT ((0)) FOR [h25]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PriceTable_h50]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PriceTable] ADD  CONSTRAINT [DF_PriceTable_h50]  DEFAULT ((0)) FOR [h50]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PriceTable_h100]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PriceTable] ADD  CONSTRAINT [DF_PriceTable_h100]  DEFAULT ((0)) FOR [h100]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PriceTable_h200]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PriceTable] ADD  CONSTRAINT [DF_PriceTable_h200]  DEFAULT ((0)) FOR [h200]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PriceTable_h500]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PriceTable] ADD  CONSTRAINT [DF_PriceTable_h500]  DEFAULT ((0)) FOR [h500]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PriceTable_h1000]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PriceTable] ADD  CONSTRAINT [DF_PriceTable_h1000]  DEFAULT ((0)) FOR [h1000]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PriceTable_h2000]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PriceTable] ADD  CONSTRAINT [DF_PriceTable_h2000]  DEFAULT ((0)) FOR [h2000]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PriceTable_hbase]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PriceTable] ADD  CONSTRAINT [DF_PriceTable_hbase]  DEFAULT ((0)) FOR [hbase]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PriceTable_hist]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PriceTable] ADD  CONSTRAINT [DF_PriceTable_hist]  DEFAULT (getdate()) FOR [hist]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PriceTable_Change_Date]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PriceTable_Change] ADD  CONSTRAINT [DF_PriceTable_Change_Date]  DEFAULT (getdate()) FOR [Date]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PriceTable_Change_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PriceTable_Change] ADD  CONSTRAINT [DF_PriceTable_Change_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Production_Oper_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Production] ADD  CONSTRAINT [DF_Production_Oper_ID]  DEFAULT ((0)) FOR [Oper_ID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WorkOrder_Production_LastTouch]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Production] ADD  CONSTRAINT [DF_WorkOrder_Production_LastTouch]  DEFAULT (getdate()) FOR [LastTouch]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Production_RunTime_Categories_OverrideRequirements]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Production_RunTime_Categories] ADD  CONSTRAINT [DF_Production_RunTime_Categories_OverrideRequirements]  DEFAULT ((0)) FOR [OverrideRequirements]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Production_RunTime_Log_Settings_Id]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Production_RunTime_Log_Settings] ADD  CONSTRAINT [DF_Production_RunTime_Log_Settings_Id]  DEFAULT (newid()) FOR [Id]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Production_RunTime_Logs_Id]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Production_RunTime_Logs] ADD  CONSTRAINT [DF_Production_RunTime_Logs_Id]  DEFAULT (newid()) FOR [Id]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Production_RunTime_Logs_LastUpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Production_RunTime_Logs] ADD  CONSTRAINT [DF_Production_RunTime_Logs_LastUpdatedDate]  DEFAULT (getdate()) FOR [LastUpdatedDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Production_RunTimes_Id]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Production_RunTimes] ADD  CONSTRAINT [DF_Production_RunTimes_Id]  DEFAULT (newid()) FOR [Id]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Production_RunTimes_LastUpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Production_RunTimes] ADD  CONSTRAINT [DF_Production_RunTimes_LastUpdatedDate]  DEFAULT (getdate()) FOR [LastUpdatedDate]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PurchaseOrder_CC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_CC]  DEFAULT ('1') FOR [CC]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PurchaseOrder_CL]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_CL]  DEFAULT ('') FOR [CL]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PurchaseOrder_delivered]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_delivered]  DEFAULT ((0)) FOR [Delivered]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PurchaseOrder_cancelled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_cancelled]  DEFAULT ((0)) FOR [Cancelled]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PurchaseOrder_Equipment]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_Equipment]  DEFAULT ((0)) FOR [Equipment]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PurchaseOrder_Melt_Type]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_Melt_Type]  DEFAULT ('-') FOR [Melt]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PurchaseOrder_WhoInsert]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_WhoInsert]  DEFAULT (suser_sname()) FOR [WhoInsert]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_QA_Equip_Cal_Maint_QA_ECM_Date]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[QA_Equip_Cal_Maint] ADD  CONSTRAINT [DF_QA_Equip_Cal_Maint_QA_ECM_Date]  DEFAULT (getdate()) FOR [QA_ECM_Date]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_QA_Inspection_Statistical_Sampling_Time]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[QA_Inspection_Statistical_Sampling] ADD  CONSTRAINT [DF_QA_Inspection_Statistical_Sampling_Time]  DEFAULT (getdate()) FOR [Time]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_QuickCompany_LastEdit]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[QuickCompany] ADD  CONSTRAINT [DF_QuickCompany_LastEdit]  DEFAULT (getdate()) FOR [LastEdit]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Quote_No_InitDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Quote_No] ADD  CONSTRAINT [DF_Quote_No_InitDate]  DEFAULT (getdate()) FOR [InitDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Quote_No_LastEdit]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Quote_No] ADD  CONSTRAINT [DF_Quote_No_LastEdit]  DEFAULT (getdate()) FOR [LastEdit]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Quote_Services_Oper_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Quote_Services] ADD  CONSTRAINT [DF_Quote_Services_Oper_ID]  DEFAULT ((0)) FOR [Oper_ID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Quote_Services_jobClassID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Quote_Services] ADD  CONSTRAINT [DF_Quote_Services_jobClassID]  DEFAULT ((0)) FOR [jobClassID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_receiving_cert]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Receiving] ADD  CONSTRAINT [DF_receiving_cert]  DEFAULT ((0)) FOR [Cert]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Receiving_CofC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Receiving] ADD  CONSTRAINT [DF_Receiving_CofC]  DEFAULT ((0)) FOR [CofC]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_receiving_pass]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Receiving] ADD  CONSTRAINT [DF_receiving_pass]  DEFAULT ((0)) FOR [Pass]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_receiving_cancelled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Receiving] ADD  CONSTRAINT [DF_receiving_cancelled]  DEFAULT ((0)) FOR [Cancelled]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_receiving_who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Receiving] ADD  CONSTRAINT [DF_receiving_who]  DEFAULT (suser_sname()) FOR [WhoAdd]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_receiving_when]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Receiving] ADD  CONSTRAINT [DF_receiving_when]  DEFAULT (getdate()) FOR [WhenAdd]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_receiving_StockLst]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Receiving] ADD  CONSTRAINT [DF_receiving_StockLst]  DEFAULT ('N') FOR [StockTable]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Receiving_VeriRecv]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Receiving] ADD  CONSTRAINT [DF_Receiving_VeriRecv]  DEFAULT ((0)) FOR [VeriRecv]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Receiving_AcctNotify]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Receiving] ADD  CONSTRAINT [DF_Receiving_AcctNotify]  DEFAULT ((0)) FOR [AcctNotify]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Receiving_AcctFinish]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Receiving] ADD  CONSTRAINT [DF_Receiving_AcctFinish]  DEFAULT ((0)) FOR [AcctFinish]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Recollect_Cert_Loc_StoreDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Recollect_Cert_Loc] ADD  CONSTRAINT [DF_Recollect_Cert_Loc_StoreDate]  DEFAULT (getdate()) FOR [StoreDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_RMA_WhoAdd]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RMA] ADD  CONSTRAINT [DF_RMA_WhoAdd]  DEFAULT (suser_sname()) FOR [WhoAdd]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_RMA_Receive_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RMA_Receive] ADD  CONSTRAINT [DF_RMA_Receive_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_RMA_Receive_WHEN]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RMA_Receive] ADD  CONSTRAINT [DF_RMA_Receive_WHEN]  DEFAULT (getdate()) FOR [WHEN]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_RMA_Receive_Sales_Detail_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RMA_Receive] ADD  CONSTRAINT [DF_RMA_Receive_Sales_Detail_ID]  DEFAULT ((0)) FOR [Sales_Detail_ID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_RMA_Receive_Descrip]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RMA_Receive] ADD  CONSTRAINT [DF_RMA_Receive_Descrip]  DEFAULT ('') FOR [Descrip]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_RMA_Receive_DoNotUse]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RMA_Receive] ADD  CONSTRAINT [DF_RMA_Receive_DoNotUse]  DEFAULT ((0)) FOR [DoNotUse]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Roll_log_WhoInsert]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Roll_log] ADD  CONSTRAINT [DF_Roll_log_WhoInsert]  DEFAULT (suser_sname()) FOR [WhoInsert]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_rtr_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[rtr] ADD  CONSTRAINT [DF_rtr_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_rtr_Quote_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[rtr] ADD  CONSTRAINT [DF_rtr_Quote_ID]  DEFAULT ((0)) FOR [Quote_ID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_rtr_cncld]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[rtr] ADD  CONSTRAINT [DF_rtr_cncld]  DEFAULT ((0)) FOR [cncld]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_rtr_UpdateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[rtr] ADD  CONSTRAINT [DF_rtr_UpdateDate]  DEFAULT (suser_name()) FOR [CreateUser]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_rtr_Detail_EstStart]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[rtr_Detail] ADD  CONSTRAINT [DF_rtr_Detail_EstStart]  DEFAULT (getdate()) FOR [EstStart]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_rtr_Detail_Start]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[rtr_Detail] ADD  CONSTRAINT [DF_rtr_Detail_Start]  DEFAULT ((0)) FOR [Started]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_rtr_Detail_Finish]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[rtr_Detail] ADD  CONSTRAINT [DF_rtr_Detail_Finish]  DEFAULT ((0)) FOR [Finished]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_rtr_Detail_POitem]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[rtr_Detail] ADD  CONSTRAINT [DF_rtr_Detail_POitem]  DEFAULT ('') FOR [POitem]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_rtr_Detail_Cncld]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[rtr_Detail] ADD  CONSTRAINT [DF_rtr_Detail_Cncld]  DEFAULT ((0)) FOR [Cncld]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_rtr_Detail_ReqSched]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[rtr_Detail] ADD  CONSTRAINT [DF_rtr_Detail_ReqSched]  DEFAULT ((0)) FOR [ReqSched]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_rtr_Detail_EstTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[rtr_Detail] ADD  CONSTRAINT [DF_rtr_Detail_EstTime]  DEFAULT ((0)) FOR [EstTime]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_rtr_Detail_ActTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[rtr_Detail] ADD  CONSTRAINT [DF_rtr_Detail_ActTime]  DEFAULT ((0)) FOR [ActTime]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_rtr_Detail_CreateUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[rtr_Detail] ADD  CONSTRAINT [DF_rtr_Detail_CreateUser]  DEFAULT (suser_name()) FOR [CreateUser]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_rtr_Detail_OT_EstStart]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[rtr_Detail_OT] ADD  CONSTRAINT [DF_rtr_Detail_OT_EstStart]  DEFAULT (getdate()) FOR [EstStart]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_rtr_Detail_OT_Start]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[rtr_Detail_OT] ADD  CONSTRAINT [DF_rtr_Detail_OT_Start]  DEFAULT ((0)) FOR [Started]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_rtr_Detail_OT_Finish]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[rtr_Detail_OT] ADD  CONSTRAINT [DF_rtr_Detail_OT_Finish]  DEFAULT ((0)) FOR [Finished]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_rtr_Detail_OT_EstTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[rtr_Detail_OT] ADD  CONSTRAINT [DF_rtr_Detail_OT_EstTime]  DEFAULT ((0)) FOR [EstTime]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_rtr_Detail_OT_ActTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[rtr_Detail_OT] ADD  CONSTRAINT [DF_rtr_Detail_OT_ActTime]  DEFAULT ((0)) FOR [ActTime]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_rtr_Detail_OT_CreateUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[rtr_Detail_OT] ADD  CONSTRAINT [DF_rtr_Detail_OT_CreateUser]  DEFAULT (suser_name()) FOR [CreateUser]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_rtr_Machine_CreateUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[rtr_Machine] ADD  CONSTRAINT [DF_rtr_Machine_CreateUser]  DEFAULT (suser_name()) FOR [CreateUser]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_rtr_Operation_CreateUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[rtr_Operation] ADD  CONSTRAINT [DF_rtr_Operation_CreateUser]  DEFAULT (suser_name()) FOR [CreateUser]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_DateAdd]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sales] ADD  CONSTRAINT [DF_Sales_DateAdd]  DEFAULT (getdate()) FOR [DateAdded]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_Review]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sales] ADD  CONSTRAINT [DF_Sales_Review]  DEFAULT ((0)) FOR [RVW_Stock]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_Detail_StockLst_PU]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sales_Detail] ADD  CONSTRAINT [DF_Sales_Detail_StockLst_PU]  DEFAULT ((1)) FOR [StockLst_PU]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_Detail_CL]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sales_Detail] ADD  CONSTRAINT [DF_Sales_Detail_CL]  DEFAULT ('') FOR [CL]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_Detail_RecDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sales_Detail] ADD  CONSTRAINT [DF_Sales_Detail_RecDate]  DEFAULT (getdate()) FOR [RecDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_Detail_WhoAdd]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sales_Detail] ADD  CONSTRAINT [DF_Sales_Detail_WhoAdd]  DEFAULT (suser_sname()) FOR [WhoAdd]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_Detail_WhenAdd]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sales_Detail] ADD  CONSTRAINT [DF_Sales_Detail_WhenAdd]  DEFAULT (getdate()) FOR [WhenAdd]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_Detail_PackingSlip_WHEN]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sales_Detail_PackingSlip] ADD  CONSTRAINT [DF_Sales_Detail_PackingSlip_WHEN]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_Detail_Sum_StockLst_PU]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sales_Detail_Sum] ADD  CONSTRAINT [DF_Sales_Detail_Sum_StockLst_PU]  DEFAULT ((1)) FOR [StockLst_PU]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_Detail_Sum_WhoAdd]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sales_Detail_Sum] ADD  CONSTRAINT [DF_Sales_Detail_Sum_WhoAdd]  DEFAULT (suser_sname()) FOR [WhoAdd]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_Detail_Sum_WhenAdd]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sales_Detail_Sum] ADD  CONSTRAINT [DF_Sales_Detail_Sum_WhenAdd]  DEFAULT (getdate()) FOR [WhenAdd]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_Hold_Status_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sales_Hold_Status] ADD  CONSTRAINT [DF_Sales_Hold_Status_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_Hold_Status_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sales_Hold_Status] ADD  CONSTRAINT [DF_Sales_Hold_Status_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_Invoice_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sales_Invoice] ADD  CONSTRAINT [DF_Sales_Invoice_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_Item_Detail_Form]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sales_Item_Detail] ADD  CONSTRAINT [DF_Sales_Item_Detail_Form]  DEFAULT ('') FOR [Form]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_Item_Detail_WHEN]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sales_Item_Detail] ADD  CONSTRAINT [DF_Sales_Item_Detail_WHEN]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_Item_Detail_TBL]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sales_Item_Detail] ADD  CONSTRAINT [DF_Sales_Item_Detail_TBL]  DEFAULT (' ') FOR [TBL]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_No_DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sales_No] ADD  CONSTRAINT [DF_Sales_No_DateCreated]  DEFAULT (getdate()) FOR [CreateDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_No_UserCreated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sales_No] ADD  CONSTRAINT [DF_Sales_No_UserCreated]  DEFAULT (suser_sname()) FOR [CreateUser]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_No_Chng_Number]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sales_No_Chng] ADD  CONSTRAINT [DF_Sales_No_Chng_Number]  DEFAULT ((0)) FOR [SalesNum]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_No_Chng_ShopRecv]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sales_No_Chng] ADD  CONSTRAINT [DF_Sales_No_Chng_ShopRecv]  DEFAULT ((0)) FOR [ShopRecv]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_No_Chng_Ver]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sales_No_Chng] ADD  CONSTRAINT [DF_Sales_No_Chng_Ver]  DEFAULT ((0)) FOR [Ver]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_No_Chng_Server]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sales_No_Chng] ADD  CONSTRAINT [DF_Sales_No_Chng_Server]  DEFAULT (@@servername) FOR [Server]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_No_Chng_UserName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sales_No_Chng] ADD  CONSTRAINT [DF_Sales_No_Chng_UserName]  DEFAULT (suser_sname()) FOR [UserName]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_No_Chng_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sales_No_Chng] ADD  CONSTRAINT [DF_Sales_No_Chng_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_No_Rev_when]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sales_No_Rev] ADD  CONSTRAINT [DF_Sales_No_Rev_when]  DEFAULT (getdate()) FOR [when]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_PS_ID_Packing]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sales_PS] ADD  CONSTRAINT [DF_Sales_PS_ID_Packing]  DEFAULT ((0)) FOR [ID_Packing]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_PS_TBL]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sales_PS] ADD  CONSTRAINT [DF_Sales_PS_TBL]  DEFAULT ('') FOR [TBL]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_PS_PS_Date]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sales_PS] ADD  CONSTRAINT [DF_Sales_PS_PS_Date]  DEFAULT (getdate()) FOR [PS_Date]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_Status_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sales_Status] ADD  CONSTRAINT [DF_Sales_Status_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_Status_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sales_Status] ADD  CONSTRAINT [DF_Sales_Status_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_Stock_StockLst_Unit]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sales_Stock] ADD  CONSTRAINT [DF_Sales_Stock_StockLst_Unit]  DEFAULT ((1)) FOR [StockLst_PU]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_Stock_RecDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sales_Stock] ADD  CONSTRAINT [DF_Sales_Stock_RecDate]  DEFAULT (getdate()) FOR [RecDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_Stock_CL]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sales_Stock] ADD  CONSTRAINT [DF_Sales_Stock_CL]  DEFAULT ('') FOR [CL]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_Stock_canc_SOitem]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sales_Stock] ADD  CONSTRAINT [DF_Sales_Stock_canc_SOitem]  DEFAULT ((0)) FOR [canc_SOitem]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_Stock_Who_Add]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sales_Stock] ADD  CONSTRAINT [DF_Sales_Stock_Who_Add]  DEFAULT (suser_sname()) FOR [Who_Add]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_Stock_When_Add]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sales_Stock] ADD  CONSTRAINT [DF_Sales_Stock_When_Add]  DEFAULT (getdate()) FOR [When_Add]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ship_History_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ship] ADD  CONSTRAINT [DF_Ship_History_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ship_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ship] ADD  CONSTRAINT [DF_Ship_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShipAddr_lastedit]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShipAddr] ADD  CONSTRAINT [DF_ShipAddr_lastedit]  DEFAULT (getdate()) FOR [lastedit]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShipAddr_WhoAdd]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShipAddr] ADD  CONSTRAINT [DF_ShipAddr_WhoAdd]  DEFAULT (suser_sname()) FOR [WhoAdd]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShipAddr_WhenAdd]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShipAddr] ADD  CONSTRAINT [DF_ShipAddr_WhenAdd]  DEFAULT (getdate()) FOR [WhenAdd]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList3_PackageWeight]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList] ADD  CONSTRAINT [DF_ShippingList3_PackageWeight]  DEFAULT ((0)) FOR [PackageWeight]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList3_BoxLength]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList] ADD  CONSTRAINT [DF_ShippingList3_BoxLength]  DEFAULT ((0)) FOR [BoxLength]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList3_BoxWidth]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList] ADD  CONSTRAINT [DF_ShippingList3_BoxWidth]  DEFAULT ((0)) FOR [BoxWidth]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList3_BoxHeight]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList] ADD  CONSTRAINT [DF_ShippingList3_BoxHeight]  DEFAULT ((0)) FOR [BoxHeight]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList3_PackageNumber]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList] ADD  CONSTRAINT [DF_ShippingList3_PackageNumber]  DEFAULT ((1)) FOR [PackageNumber]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList3_TotalPackages]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList] ADD  CONSTRAINT [DF_ShippingList3_TotalPackages]  DEFAULT ((1)) FOR [TotalPackages]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList3_DateReady]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList] ADD  CONSTRAINT [DF_ShippingList3_DateReady]  DEFAULT (getdate()) FOR [DateReady]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList3_Freight]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList] ADD  CONSTRAINT [DF_ShippingList3_Freight]  DEFAULT ((0)) FOR [Freight]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList3_Export]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList] ADD  CONSTRAINT [DF_ShippingList3_Export]  DEFAULT ((0)) FOR [Export]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList3_Tipton]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList] ADD  CONSTRAINT [DF_ShippingList3_Tipton]  DEFAULT ((0)) FOR [Tipton]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList3_Windfall]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList] ADD  CONSTRAINT [DF_ShippingList3_Windfall]  DEFAULT ((0)) FOR [Windfall]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList3_Complete_PackingSlip]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList] ADD  CONSTRAINT [DF_ShippingList3_Complete_PackingSlip]  DEFAULT ((0)) FOR [Complete_PackingSlip]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList3_Complete_Cert]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList] ADD  CONSTRAINT [DF_ShippingList3_Complete_Cert]  DEFAULT ((0)) FOR [Complete_Cert]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList3_Complete_Label]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList] ADD  CONSTRAINT [DF_ShippingList3_Complete_Label]  DEFAULT ((0)) FOR [Complete_Label]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList3_Complete_BOL]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList] ADD  CONSTRAINT [DF_ShippingList3_Complete_BOL]  DEFAULT ((0)) FOR [Complete_BOL]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList3_HasBeenPickedUP]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList] ADD  CONSTRAINT [DF_ShippingList3_HasBeenPickedUP]  DEFAULT ((0)) FOR [HasBeenPickedUP]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList_Canceled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList] ADD  CONSTRAINT [DF_ShippingList_Canceled]  DEFAULT ((0)) FOR [Canceled]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList_Hold]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList] ADD  CONSTRAINT [DF_ShippingList_Hold]  DEFAULT (NULL) FOR [HoldId]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList_Archive2_ArchiveDate_1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList_Archive] ADD  CONSTRAINT [DF_ShippingList_Archive2_ArchiveDate_1]  DEFAULT (getdate()) FOR [ArchiveDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList_Archive2_PackageWeight_1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList_Archive] ADD  CONSTRAINT [DF_ShippingList_Archive2_PackageWeight_1]  DEFAULT ((0)) FOR [PackageWeight]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList_Archive2_BoxLength_1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList_Archive] ADD  CONSTRAINT [DF_ShippingList_Archive2_BoxLength_1]  DEFAULT ((0)) FOR [BoxLength]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList_Archive2_BoxWidth_1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList_Archive] ADD  CONSTRAINT [DF_ShippingList_Archive2_BoxWidth_1]  DEFAULT ((0)) FOR [BoxWidth]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList_Archive2_BoxHeight_1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList_Archive] ADD  CONSTRAINT [DF_ShippingList_Archive2_BoxHeight_1]  DEFAULT ((0)) FOR [BoxHeight]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList_Archive2_PackageNumber_1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList_Archive] ADD  CONSTRAINT [DF_ShippingList_Archive2_PackageNumber_1]  DEFAULT ((1)) FOR [PackageNumber]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList_Archive2_TotalPackages_1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList_Archive] ADD  CONSTRAINT [DF_ShippingList_Archive2_TotalPackages_1]  DEFAULT ((1)) FOR [TotalPackages]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList_Archive2_DateReady_1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList_Archive] ADD  CONSTRAINT [DF_ShippingList_Archive2_DateReady_1]  DEFAULT (getdate()) FOR [DateReady]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList_Archive2_Freight_1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList_Archive] ADD  CONSTRAINT [DF_ShippingList_Archive2_Freight_1]  DEFAULT ((0)) FOR [Freight]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList_Archive2_Export_1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList_Archive] ADD  CONSTRAINT [DF_ShippingList_Archive2_Export_1]  DEFAULT ((0)) FOR [Export]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList_Archive2_Tipton_1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList_Archive] ADD  CONSTRAINT [DF_ShippingList_Archive2_Tipton_1]  DEFAULT ((0)) FOR [Tipton]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList_Archive2_Windfall_1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList_Archive] ADD  CONSTRAINT [DF_ShippingList_Archive2_Windfall_1]  DEFAULT ((0)) FOR [Windfall]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList_Archive2_Complete_PackingSlip_1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList_Archive] ADD  CONSTRAINT [DF_ShippingList_Archive2_Complete_PackingSlip_1]  DEFAULT ((0)) FOR [Complete_PackingSlip]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList_Archive2_Complete_Cert_1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList_Archive] ADD  CONSTRAINT [DF_ShippingList_Archive2_Complete_Cert_1]  DEFAULT ((0)) FOR [Complete_Cert]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList_Archive2_Complete_Label_1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList_Archive] ADD  CONSTRAINT [DF_ShippingList_Archive2_Complete_Label_1]  DEFAULT ((0)) FOR [Complete_Label]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList_Archive2_Complete_BOL_1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList_Archive] ADD  CONSTRAINT [DF_ShippingList_Archive2_Complete_BOL_1]  DEFAULT ((0)) FOR [Complete_BOL]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList_Archive2_HasBeenPickedUP_1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList_Archive] ADD  CONSTRAINT [DF_ShippingList_Archive2_HasBeenPickedUP_1]  DEFAULT ((0)) FOR [HasBeenPickedUP]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList_Archive_Canceled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList_Archive] ADD  CONSTRAINT [DF_ShippingList_Archive_Canceled]  DEFAULT ((0)) FOR [Canceled]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList_Archive_HoldId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList_Archive] ADD  CONSTRAINT [DF_ShippingList_Archive_HoldId]  DEFAULT (NULL) FOR [HoldId]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList_Holds2_Hold_Date]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList_Holds] ADD  CONSTRAINT [DF_ShippingList_Holds2_Hold_Date]  DEFAULT (getdate()) FOR [Hold_Date]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Table_1_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList_Items] ADD  CONSTRAINT [DF_Table_1_ID]  DEFAULT (newid()) FOR [ItemID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList_Items_SOitem]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList_Items] ADD  CONSTRAINT [DF_ShippingList_Items_SOitem]  DEFAULT ((1)) FOR [SOitem]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList_Items_Export]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList_Items] ADD  CONSTRAINT [DF_ShippingList_Items_Export]  DEFAULT ((0)) FOR [Export]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList_Item_Archive_SOitem]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList_Items_Archive] ADD  CONSTRAINT [DF_ShippingList_Item_Archive_SOitem]  DEFAULT ((1)) FOR [SOitem]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ShippingList_Item_Archive_Export]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ShippingList_Items_Archive] ADD  CONSTRAINT [DF_ShippingList_Item_Archive_Export]  DEFAULT ((0)) FOR [Export]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SO_ProcessNotes_WhoAdd]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SO_ProcessNotes] ADD  CONSTRAINT [DF_SO_ProcessNotes_WhoAdd]  DEFAULT (suser_sname()) FOR [WhoAdd]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SO_ProcessNotes_WhenAdd]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SO_ProcessNotes] ADD  CONSTRAINT [DF_SO_ProcessNotes_WhenAdd]  DEFAULT (getdate()) FOR [WhenAdd]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_soldaddr_lastedit]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SoldAddr] ADD  CONSTRAINT [DF_soldaddr_lastedit]  DEFAULT (getdate()) FOR [lastedit]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SoldAddr_Marketing]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SoldAddr] ADD  CONSTRAINT [DF_SoldAddr_Marketing]  DEFAULT ('') FOR [Marketing]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SoldAddr_Added]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SoldAddr] ADD  CONSTRAINT [DF_SoldAddr_Added]  DEFAULT (getdate()) FOR [Added]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SoldAddr_WhoAdd]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SoldAddr] ADD  CONSTRAINT [DF_SoldAddr_WhoAdd]  DEFAULT (suser_sname()) FOR [WhoAdd]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SoldAddr_WhenAdd]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SoldAddr] ADD  CONSTRAINT [DF_SoldAddr_WhenAdd]  DEFAULT (getdate()) FOR [WhenAdd]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Spec_Check_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Spec_Check] ADD  CONSTRAINT [DF_Spec_Check_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Spec_Check_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Spec_Check] ADD  CONSTRAINT [DF_Spec_Check_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_STAR_Inventory_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[STAR_Inventory] ADD  CONSTRAINT [DF_STAR_Inventory_ID]  DEFAULT (newid()) FOR [ID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_STAR_Inventory_Location]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[STAR_Inventory] ADD  CONSTRAINT [DF_STAR_Inventory_Location]  DEFAULT ((1)) FOR [Location]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_STAR_Inventory_Stock]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[STAR_Inventory] ADD  CONSTRAINT [DF_STAR_Inventory_Stock]  DEFAULT ((0)) FOR [Stock]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_STAR_Inventory_LowInventoryThreshold]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[STAR_Inventory] ADD  CONSTRAINT [DF_STAR_Inventory_LowInventoryThreshold]  DEFAULT ((5)) FOR [LowInventoryThreshold]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_STAR_Inventory_EmailForInventory]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[STAR_Inventory] ADD  CONSTRAINT [DF_STAR_Inventory_EmailForInventory]  DEFAULT ('Star@ERP_1s.com') FOR [EmailForInventory]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_STAR_Inventory_StockChanges_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[STAR_Inventory_StockChanges] ADD  CONSTRAINT [DF_STAR_Inventory_StockChanges_ID]  DEFAULT (newid()) FOR [ID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_STAR_Inventory_StockChanges_StockChange]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[STAR_Inventory_StockChanges] ADD  CONSTRAINT [DF_STAR_Inventory_StockChanges_StockChange]  DEFAULT ((0)) FOR [StockChange]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_STAR_Inventory_StockChanges_Date]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[STAR_Inventory_StockChanges] ADD  CONSTRAINT [DF_STAR_Inventory_StockChanges_Date]  DEFAULT (getdate()) FOR [Date]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_STAR_Rewards_DateReceived]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[STAR_Rewards] ADD  CONSTRAINT [DF_STAR_Rewards_DateReceived]  DEFAULT (getdate()) FOR [DateReceived]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Table_1_NumberReceived]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[STAR_Rewards] ADD  CONSTRAINT [DF_Table_1_NumberReceived]  DEFAULT ((1)) FOR [ItemsReceived]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_STAR_Rewards_Deleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[STAR_Rewards] ADD  CONSTRAINT [DF_STAR_Rewards_Deleted]  DEFAULT ((0)) FOR [Deleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_STAR_Tiers_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[STAR_Tiers] ADD  CONSTRAINT [DF_STAR_Tiers_ID]  DEFAULT (newid()) FOR [ID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_STAR_Tiers_Monetary]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[STAR_Tiers] ADD  CONSTRAINT [DF_STAR_Tiers_Monetary]  DEFAULT ((1)) FOR [Monetary]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_STAR_Tiers_TimeRestricted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[STAR_Tiers] ADD  CONSTRAINT [DF_STAR_Tiers_TimeRestricted]  DEFAULT ((0)) FOR [TimeRestricted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_STAR_Tiers_Disabled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[STAR_Tiers] ADD  CONSTRAINT [DF_STAR_Tiers_Disabled]  DEFAULT ((0)) FOR [Disabled]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_STAR_Tiers_WhoCreated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[STAR_Tiers] ADD  CONSTRAINT [DF_STAR_Tiers_WhoCreated]  DEFAULT ('') FOR [WhoCreated]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_STAR_Tiers_Created]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[STAR_Tiers] ADD  CONSTRAINT [DF_STAR_Tiers_Created]  DEFAULT (getdate()) FOR [Created]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_STAR_Tiers_Amount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[STAR_Tiers] ADD  CONSTRAINT [DF_STAR_Tiers_Amount]  DEFAULT ((0)) FOR [Amount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StartingStock_CL]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StartingStock] ADD  CONSTRAINT [DF_StartingStock_CL]  DEFAULT ('') FOR [CL]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Stock_Projected_Form]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Stock_Projected] ADD  CONSTRAINT [DF_Stock_Projected_Form]  DEFAULT ('10') FOR [Form]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Stock_Projected_CL]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Stock_Projected] ADD  CONSTRAINT [DF_Stock_Projected_CL]  DEFAULT ('') FOR [CL]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Stock_Projected_Spec]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Stock_Projected] ADD  CONSTRAINT [DF_Stock_Projected_Spec]  DEFAULT ('') FOR [Spec_CC]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Stock_Projected_Cpec_CL]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Stock_Projected] ADD  CONSTRAINT [DF_Stock_Projected_Cpec_CL]  DEFAULT ('') FOR [Spec_CL]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Stock_Projected_YearInches]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Stock_Projected] ADD  CONSTRAINT [DF_Stock_Projected_YearInches]  DEFAULT ((0)) FOR [YearInches]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Stock_Projected_OverSize]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Stock_Projected] ADD  CONSTRAINT [DF_Stock_Projected_OverSize]  DEFAULT ((0.060)) FOR [OverSize]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Stock_Projected_Sdate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Stock_Projected] ADD  CONSTRAINT [DF_Stock_Projected_Sdate]  DEFAULT (getdate()) FOR [Sdate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Stock_Projected_FollowM]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Stock_Projected] ADD  CONSTRAINT [DF_Stock_Projected_FollowM]  DEFAULT ('') FOR [FollowM]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Stock_Projected_FollowLot]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Stock_Projected] ADD  CONSTRAINT [DF_Stock_Projected_FollowLot]  DEFAULT ((0)) FOR [FollowLot]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Stock_Projected_LastEdit]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Stock_Projected] ADD  CONSTRAINT [DF_Stock_Projected_LastEdit]  DEFAULT (getdate()) FOR [LastEdit]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Stock_SnapShot_SaveDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Stock_Receiving] ADD  CONSTRAINT [DF_Stock_SnapShot_SaveDate]  DEFAULT (getdate()) FOR [SaveDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Stock_SELE_Process_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Stock_SELE_Process] ADD  CONSTRAINT [DF_Stock_SELE_Process_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Stocklst_Detail_floorstatus]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Detail] ADD  CONSTRAINT [DF_Stocklst_Detail_floorstatus]  DEFAULT ('') FOR [FloorStatus]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Stocklst_Detail_class]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Detail] ADD  CONSTRAINT [DF_Stocklst_Detail_class]  DEFAULT ('') FOR [Class]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockLst_Detail_S_QTY]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Detail] ADD  CONSTRAINT [DF_StockLst_Detail_S_QTY]  DEFAULT ((0)) FOR [S_QTY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockLst_Detail_S_P]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Detail] ADD  CONSTRAINT [DF_StockLst_Detail_S_P]  DEFAULT ((0)) FOR [S_P]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockLst_Detail_S_Total]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Detail] ADD  CONSTRAINT [DF_StockLst_Detail_S_Total]  DEFAULT ((0)) FOR [S_Total]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockLst_Detail_Inserted_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Detail_Inserted] ADD  CONSTRAINT [DF_StockLst_Detail_Inserted_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockLst_Detail_Inserted_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Detail_Inserted] ADD  CONSTRAINT [DF_StockLst_Detail_Inserted_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockLst_Detail_Inserted_Verified]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Detail_Inserted] ADD  CONSTRAINT [DF_StockLst_Detail_Inserted_Verified]  DEFAULT ((0)) FOR [Verified]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockLst_Detail_Inserted_VerifiedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Detail_Inserted] ADD  CONSTRAINT [DF_StockLst_Detail_Inserted_VerifiedBy]  DEFAULT ('') FOR [VerifiedBy]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_stocklst_master_cc]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Stocklst_Master] ADD  CONSTRAINT [DF_stocklst_master_cc]  DEFAULT ('1') FOR [CC]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Stocklst_Master_CL]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Stocklst_Master] ADD  CONSTRAINT [DF_Stocklst_Master_CL]  DEFAULT ('') FOR [CL]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_stocklst_master_mweight]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Stocklst_Master] ADD  CONSTRAINT [DF_stocklst_master_mweight]  DEFAULT ((0)) FOR [MWeight]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Stocklst_Master_Melt]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Stocklst_Master] ADD  CONSTRAINT [DF_Stocklst_Master_Melt]  DEFAULT ('-') FOR [Melt]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockLst_Master_Inserted_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Master_Inserted] ADD  CONSTRAINT [DF_StockLst_Master_Inserted_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockLst_Master_Inserted_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Master_Inserted] ADD  CONSTRAINT [DF_StockLst_Master_Inserted_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockLst_Master_Inserted_VerifiedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Master_Inserted] ADD  CONSTRAINT [DF_StockLst_Master_Inserted_VerifiedBy]  DEFAULT ('') FOR [VerifiedBy]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_stock_List_Mins_form]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Mins] ADD  CONSTRAINT [DF_stock_List_Mins_form]  DEFAULT ((10)) FOR [Form]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_stock_List_Mins_cc]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Mins] ADD  CONSTRAINT [DF_stock_List_Mins_cc]  DEFAULT ((1)) FOR [CC]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_stock_List_Mins_safety stock]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Mins] ADD  CONSTRAINT [DF_stock_List_Mins_safety stock]  DEFAULT ((15)) FOR [SafeLevel]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_stock_List_Mins_lead]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Mins] ADD  CONSTRAINT [DF_stock_List_Mins_lead]  DEFAULT ((18)) FOR [MillWeeks]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Stock_List_Mins_active]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Mins] ADD  CONSTRAINT [DF_Stock_List_Mins_active]  DEFAULT ((0)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockLst_Mins_Crutial]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Mins] ADD  CONSTRAINT [DF_StockLst_Mins_Crutial]  DEFAULT ((0)) FOR [Crutial]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockLst_Mins_LastEdit]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Mins] ADD  CONSTRAINT [DF_StockLst_Mins_LastEdit]  DEFAULT (getdate()) FOR [LastEdit]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockLst_Mins_SafeLevelDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Mins] ADD  CONSTRAINT [DF_StockLst_Mins_SafeLevelDate]  DEFAULT (getdate()) FOR [SafeLevelDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockLst_Process_SOitem]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Process] ADD  CONSTRAINT [DF_StockLst_Process_SOitem]  DEFAULT ([dbo].[f_ProperSOitem]('')) FOR [SOitem]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockLst_Process_startdate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Process] ADD  CONSTRAINT [DF_StockLst_Process_startdate]  DEFAULT (getdate()) FOR [StartDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockLst_Process_Detail_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Process_Detail] ADD  CONSTRAINT [DF_StockLst_Process_Detail_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockLst_Process_Detail_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Process_Detail] ADD  CONSTRAINT [DF_StockLst_Process_Detail_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockLst_Process_Detail_SOitem]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Process_Detail] ADD  CONSTRAINT [DF_StockLst_Process_Detail_SOitem]  DEFAULT ([dbo].[f_ProperSOitem]('')) FOR [SOitem]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockLst_Process_SOitem_Grab]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Process_Grab] ADD  CONSTRAINT [DF_StockLst_Process_SOitem_Grab]  DEFAULT ([dbo].[f_ProperSOitem]('')) FOR [SOitem]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockLst_Process_Grab_Descript]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Process_Grab] ADD  CONSTRAINT [DF_StockLst_Process_Grab_Descript]  DEFAULT ('dbo.f_DescriptCL(SM.Alloy,SM.CC,SM.CL,SM.Form,SP.[Prc_Dim1],SP.[Prc_Dim2],SP.[Prc_Dim3],SP.[PWeight],SD.RandLen) AS Descript') FOR [Descript]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockLst_Process_Grab_FoundStk]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Process_Grab] ADD  CONSTRAINT [DF_StockLst_Process_Grab_FoundStk]  DEFAULT (getdate()) FOR [FoundStk]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockLst_Process_Grab_Gone]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Process_Grab] ADD  CONSTRAINT [DF_StockLst_Process_Grab_Gone]  DEFAULT ((0)) FOR [Gone]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockLst_Process_ID_def_definition]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Process_ID_def] ADD  CONSTRAINT [DF_StockLst_Process_ID_def_definition]  DEFAULT ('') FOR [definition]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockLst_Process_ID_def_comment]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Process_ID_def] ADD  CONSTRAINT [DF_StockLst_Process_ID_def_comment]  DEFAULT ('') FOR [comment]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockLst_Process_ID_def_inUse]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Process_ID_def] ADD  CONSTRAINT [DF_StockLst_Process_ID_def_inUse]  DEFAULT ((0)) FOR [inUse]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockLst_Value_InvoiceDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Value] ADD  CONSTRAINT [DF_StockLst_Value_InvoiceDate]  DEFAULT (getdate()) FOR [InvoiceDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockLst_Value_LastEdit]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Value] ADD  CONSTRAINT [DF_StockLst_Value_LastEdit]  DEFAULT (getdate()) FOR [LastEdit]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Stocklst_Vendor_cc]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Vendor] ADD  CONSTRAINT [DF_Stocklst_Vendor_cc]  DEFAULT ('1') FOR [CC]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockLst_Vendor_CL]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Vendor] ADD  CONSTRAINT [DF_StockLst_Vendor_CL]  DEFAULT ('') FOR [CL]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockLst_Vendor_Mill]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Vendor] ADD  CONSTRAINT [DF_StockLst_Vendor_Mill]  DEFAULT ('') FOR [Mill]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Stocklst_Vendor_AddDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Vendor] ADD  CONSTRAINT [DF_Stocklst_Vendor_AddDate]  DEFAULT (getdate()) FOR [AddDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockLst_Vendor_RemoveDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Vendor] ADD  CONSTRAINT [DF_StockLst_Vendor_RemoveDate]  DEFAULT (getdate()+(30)) FOR [RemoveDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockLst_Vendor_Melt]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Vendor] ADD  CONSTRAINT [DF_StockLst_Vendor_Melt]  DEFAULT ('') FOR [Melt]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Stocklst_Wants_cc]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Wants] ADD  CONSTRAINT [DF_Stocklst_Wants_cc]  DEFAULT ('1') FOR [CC]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_StockLst_Wants_CL]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Wants] ADD  CONSTRAINT [DF_StockLst_Wants_CL]  DEFAULT ('') FOR [CL]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Stocklst_Wants_AddDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StockLst_Wants] ADD  CONSTRAINT [DF_Stocklst_Wants_AddDate]  DEFAULT (getdate()) FOR [AddDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SupplierQuotes_unitprice]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SupplierQuotes] ADD  CONSTRAINT [DF_SupplierQuotes_unitprice]  DEFAULT ((0)) FOR [unitprice]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SupplierQuotes_quantity]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SupplierQuotes] ADD  CONSTRAINT [DF_SupplierQuotes_quantity]  DEFAULT ((0)) FOR [quantity]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SupplierQuotes_PcPrice]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SupplierQuotes] ADD  CONSTRAINT [DF_SupplierQuotes_PcPrice]  DEFAULT ((0)) FOR [PcPrice]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SupplierQuotes_duedate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SupplierQuotes] ADD  CONSTRAINT [DF_SupplierQuotes_duedate]  DEFAULT (getdate()) FOR [duedate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SupplierQuotes_savedate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SupplierQuotes] ADD  CONSTRAINT [DF_SupplierQuotes_savedate]  DEFAULT (getdate()) FOR [savedate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SupplierQuotes_CL]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SupplierQuotes] ADD  CONSTRAINT [DF_SupplierQuotes_CL]  DEFAULT ('') FOR [CL]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Survey_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Survey] ADD  CONSTRAINT [DF_Survey_ID]  DEFAULT (newsequentialid()) FOR [ID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Survey_Enabled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Survey] ADD  CONSTRAINT [DF_Survey_Enabled]  DEFAULT ((1)) FOR [Enabled]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Survey_SurveyType]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Survey] ADD  CONSTRAINT [DF_Survey_SurveyType]  DEFAULT ((1)) FOR [SurveyType]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Survey_IsConfidential]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Survey] ADD  CONSTRAINT [DF_Survey_IsConfidential]  DEFAULT ((0)) FOR [IsConfidential]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Survey_Assignment_ContactInfos_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Survey_Assignment_ContactInfos] ADD  CONSTRAINT [DF_Survey_Assignment_ContactInfos_ID]  DEFAULT (newsequentialid()) FOR [ID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Table_1_DateAssigned]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Survey_Assignment_ContactInfos] ADD  CONSTRAINT [DF_Table_1_DateAssigned]  DEFAULT (getdate()) FOR [DateCreated]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Survey_Assignment_ContactInfos_NoQuote]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Survey_Assignment_ContactInfos] ADD  CONSTRAINT [DF_Survey_Assignment_ContactInfos_NoQuote]  DEFAULT ((0)) FOR [NoQuote]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Table_1_Anonymous]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Survey_Assignment_ContactInfos] ADD  CONSTRAINT [DF_Table_1_Anonymous]  DEFAULT ((0)) FOR [DoNotContact]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Table_1_ByEmail]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Survey_Assignment_CorrectiveAction_ActionStatus_Def] ADD  CONSTRAINT [DF_Table_1_ByEmail]  DEFAULT ((0)) FOR [ClosedStatus]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Survey_Assignment_CorrectiveAction_Communications_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Survey_Assignment_CorrectiveAction_Communications] ADD  CONSTRAINT [DF_Survey_Assignment_CorrectiveAction_Communications_ID]  DEFAULT (newsequentialid()) FOR [ID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Survey_Assignment_CorrectiveAction_Communications_DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Survey_Assignment_CorrectiveAction_Communications] ADD  CONSTRAINT [DF_Survey_Assignment_CorrectiveAction_Communications_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Table_1_ActionStatus]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Survey_Assignment_CorrectiveAction_Communications] ADD  CONSTRAINT [DF_Table_1_ActionStatus]  DEFAULT ((0)) FOR [ByEmail]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Table_1_ByEmail1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Survey_Assignment_CorrectiveAction_Communications] ADD  CONSTRAINT [DF_Table_1_ByEmail1]  DEFAULT ((0)) FOR [ByPhone]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Table_1_ByEmail1_1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Survey_Assignment_CorrectiveAction_Communications] ADD  CONSTRAINT [DF_Table_1_ByEmail1_1]  DEFAULT ((0)) FOR [IsSurveyUser]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Table_1_ByEmail1_2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Survey_Assignment_CorrectiveAction_Communications] ADD  CONSTRAINT [DF_Table_1_ByEmail1_2]  DEFAULT ((0)) FOR [IsConfidential]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Survey_Assignment_CorrectiveAction_Communications_CommunicationSummary]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Survey_Assignment_CorrectiveAction_Communications] ADD  CONSTRAINT [DF_Survey_Assignment_CorrectiveAction_Communications_CommunicationSummary]  DEFAULT ('') FOR [CommunicationSummary]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Survey_Assignment_CorrectiveActions_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Survey_Assignment_CorrectiveActions] ADD  CONSTRAINT [DF_Survey_Assignment_CorrectiveActions_ID]  DEFAULT (newsequentialid()) FOR [ID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Survey_Assignment_CorrectiveActions_DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Survey_Assignment_CorrectiveActions] ADD  CONSTRAINT [DF_Survey_Assignment_CorrectiveActions_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Table_1_Email]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Survey_Assignment_CorrectiveActions] ADD  CONSTRAINT [DF_Table_1_Email]  DEFAULT ((1)) FOR [ActionStatus]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Survey_Assignment_CorrectiveActions_LastStatusChange]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Survey_Assignment_CorrectiveActions] ADD  CONSTRAINT [DF_Survey_Assignment_CorrectiveActions_LastStatusChange]  DEFAULT (getdate()) FOR [LastStatusChange]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Survey_Assignments_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Survey_Assignments] ADD  CONSTRAINT [DF_Survey_Assignments_ID]  DEFAULT (newsequentialid()) FOR [ID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Table_1_Created_2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Survey_Assignments] ADD  CONSTRAINT [DF_Table_1_Created_2]  DEFAULT (getdate()) FOR [DateAssigned]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Survey_Assignments_Enabled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Survey_Assignments] ADD  CONSTRAINT [DF_Survey_Assignments_Enabled]  DEFAULT ((1)) FOR [Enabled]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Survey_Assignments_AssignmentType]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Survey_Assignments] ADD  CONSTRAINT [DF_Survey_Assignments_AssignmentType]  DEFAULT ((2)) FOR [AssignmentType]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Survey_Assignments_Anonymous]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Survey_Assignments] ADD  CONSTRAINT [DF_Survey_Assignments_Anonymous]  DEFAULT ((0)) FOR [Anonymous]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Survey_Assignments_RequestedByUser]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Survey_Assignments] ADD  CONSTRAINT [DF_Survey_Assignments_RequestedByUser]  DEFAULT ((0)) FOR [RequestedByUser]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Survey_Question_Options_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Survey_Question_Options] ADD  CONSTRAINT [DF_Survey_Question_Options_ID]  DEFAULT (newsequentialid()) FOR [ID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Survey_Question_Options_order]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Survey_Question_Options] ADD  CONSTRAINT [DF_Survey_Question_Options_order]  DEFAULT ((0)) FOR [order]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Survey_Question_Options_Created]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Survey_Question_Options] ADD  CONSTRAINT [DF_Survey_Question_Options_Created]  DEFAULT (getdate()) FOR [Created]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Survey_Question_Responses_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Survey_Question_Responses] ADD  CONSTRAINT [DF_Survey_Question_Responses_ID]  DEFAULT (newsequentialid()) FOR [ID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Table_1_Created_1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Survey_Question_Responses] ADD  CONSTRAINT [DF_Table_1_Created_1]  DEFAULT (getdate()) FOR [ResponseDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Survey_Questions_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Survey_Questions] ADD  CONSTRAINT [DF_Survey_Questions_ID]  DEFAULT (newsequentialid()) FOR [ID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Survey_Questions_Required]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Survey_Questions] ADD  CONSTRAINT [DF_Survey_Questions_Required]  DEFAULT ((0)) FOR [Required]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Survey_Questions_RequiresCorrectiveActionResponse]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Survey_Questions] ADD  CONSTRAINT [DF_Survey_Questions_RequiresCorrectiveActionResponse]  DEFAULT ((0)) FOR [RequiresCorrectiveActionResponse]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Survey_Questions_Created]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Survey_Questions] ADD  CONSTRAINT [DF_Survey_Questions_Created]  DEFAULT (getdate()) FOR [Created]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_HTreat]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_HTreat]  DEFAULT ('') FOR [HTreat]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_PO]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_PO]  DEFAULT ('') FOR [PO]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_OvenTemp]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_OvenTemp]  DEFAULT ((0)) FOR [OvenTemp]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_Tensile]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_Tensile]  DEFAULT ((0)) FOR [Tensile]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_Yield]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_Yield]  DEFAULT ((0)) FOR [Yield]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_Elongation]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_Elongation]  DEFAULT ((0)) FOR [Elongation]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_Red_Area]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_Red_Area]  DEFAULT ((0)) FOR [Red_Area]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_tLoc]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_tLoc]  DEFAULT ('') FOR [tLoc]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_Rockwell]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_Rockwell]  DEFAULT ('') FOR [Rockwell]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_BHN]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_BHN]  DEFAULT ((0)) FOR [BHN]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_Tensile2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_Tensile2]  DEFAULT ((0)) FOR [Tensile2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_Yield2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_Yield2]  DEFAULT ((0)) FOR [Yield2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_Elongation2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_Elongation2]  DEFAULT ((0)) FOR [Elongation2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_Red_Area2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_Red_Area2]  DEFAULT ((0)) FOR [Red_Area2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_tLoc2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_tLoc2]  DEFAULT ('') FOR [tLoc2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_Rockwell2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_Rockwell2]  DEFAULT ('') FOR [Rockwell2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_BHN2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_BHN2]  DEFAULT ((0)) FOR [BHN2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_Tensile3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_Tensile3]  DEFAULT ((0)) FOR [Tensile3]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_Yield3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_Yield3]  DEFAULT ((0)) FOR [Yield3]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_Elongation3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_Elongation3]  DEFAULT ((0)) FOR [Elongation3]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_red_area3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_red_area3]  DEFAULT ((0)) FOR [red_area3]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_tLoc3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_tLoc3]  DEFAULT ('') FOR [tLoc3]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_Rockwell3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_Rockwell3]  DEFAULT ('') FOR [Rockwell3]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_BHN3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_BHN3]  DEFAULT ((0)) FOR [BHN3]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_Tensile4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_Tensile4]  DEFAULT ((0)) FOR [Tensile4]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_Yield4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_Yield4]  DEFAULT ((0)) FOR [Yield4]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_Elongation4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_Elongation4]  DEFAULT ((0)) FOR [Elongation4]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_Red_Area4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_Red_Area4]  DEFAULT ((0)) FOR [Red_Area4]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_tLoc4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_tLoc4]  DEFAULT ('') FOR [tLoc4]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_Rockwell4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_Rockwell4]  DEFAULT ('') FOR [Rockwell4]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_BHN4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_BHN4]  DEFAULT ((0)) FOR [BHN4]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_Tensile5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_Tensile5]  DEFAULT ((0)) FOR [Tensile5]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_Yield5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_Yield5]  DEFAULT ((0)) FOR [Yield5]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_Elongation5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_Elongation5]  DEFAULT ((0)) FOR [Elongation5]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_Red_Area5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_Red_Area5]  DEFAULT ((0)) FOR [Red_Area5]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_tLoc5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_tLoc5]  DEFAULT ('') FOR [tLoc5]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_Rockwell5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_Rockwell5]  DEFAULT ('') FOR [Rockwell5]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_BHN5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_BHN5]  DEFAULT ((0)) FOR [BHN5]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_Tensile6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_Tensile6]  DEFAULT ((0)) FOR [Tensile6]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_Yield6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_Yield6]  DEFAULT ((0)) FOR [Yield6]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_Elongation6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_Elongation6]  DEFAULT ((0)) FOR [Elongation6]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_Red_Area6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_Red_Area6]  DEFAULT ((0)) FOR [Red_Area6]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_tLoc6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_tLoc6]  DEFAULT ('') FOR [tLoc6]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_Tensile7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_Tensile7]  DEFAULT ((0)) FOR [Tensile7]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_Yield7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_Yield7]  DEFAULT ((0)) FOR [Yield7]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_Elongation7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_Elongation7]  DEFAULT ((0)) FOR [Elongation7]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_Red_Area7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_Red_Area7]  DEFAULT ((0)) FOR [Red_Area7]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_tLoc7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_tLoc7]  DEFAULT ('') FOR [tLoc7]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_TestPO]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_TestPO]  DEFAULT ((0)) FOR [TestPO]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_TestPOitem]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_TestPOitem]  DEFAULT ('') FOR [TestPOitem]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_TestItemPO]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_TestItemPO]  DEFAULT ((0)) FOR [TestItemPO]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_Lab]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_Lab]  DEFAULT ('') FOR [Lab]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_TestPO2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_TestPO2]  DEFAULT ((0)) FOR [TestPO2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_TestPOitem2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_TestPOitem2]  DEFAULT ('') FOR [TestPOitem2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_Minutes]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_Minutes]  DEFAULT ((0)) FOR [Minutes]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_HTrockwell]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_HTrockwell]  DEFAULT ('') FOR [HTrockwell]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_HTBHN]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_HTBHN]  DEFAULT ((0)) FOR [HTBHN]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_LMA_Practice]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_LMA_Practice]  DEFAULT ('') FOR [LMA_Practice]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_LMA_Procedure]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_LMA_Procedure]  DEFAULT ('') FOR [LMA_Procedure]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_WO]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_WO]  DEFAULT ((0)) FOR [WO]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_WO_Detail]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_WO_Detail]  DEFAULT ((0)) FOR [WO_Detail]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_Machine]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_Machine]  DEFAULT ('') FOR [Machine]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_Oper]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_Oper]  DEFAULT ('') FOR [Oper]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_ProjID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_ProjID]  DEFAULT ((0)) FOR [ProjID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Swage_Log_WhoInsert]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Swage_Log] ADD  CONSTRAINT [DF_Swage_Log_WhoInsert]  DEFAULT (suser_sname()) FOR [WhoInsert]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TC_Replacement_Employees_Position]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TC_Replacement_Employees] ADD  CONSTRAINT [DF_TC_Replacement_Employees_Position]  DEFAULT ('Shop') FOR [Position]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TC_Replacement_Employees_IsSuspended]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TC_Replacement_Employees] ADD  CONSTRAINT [DF_TC_Replacement_Employees_IsSuspended]  DEFAULT ((0)) FOR [IsSuspended]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TC_Replacement_Employees_No_PayCor]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TC_Replacement_Employees] ADD  CONSTRAINT [DF_TC_Replacement_Employees_No_PayCor]  DEFAULT ((0)) FOR [No_PayCor]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TC_Replacement_Employees_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TC_Replacement_Employees] ADD  CONSTRAINT [DF_TC_Replacement_Employees_Status]  DEFAULT ((1)) FOR [Status]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TC_Replacement_Employees_Times_InAutoStatus]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TC_Replacement_Employees_Times] ADD  CONSTRAINT [DF_TC_Replacement_Employees_Times_InAutoStatus]  DEFAULT ((0)) FOR [InAutoStatus]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TC_Replacement_Employees_Times_TimeInCalculated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TC_Replacement_Employees_Times] ADD  CONSTRAINT [DF_TC_Replacement_Employees_Times_TimeInCalculated]  DEFAULT ((0)) FOR [TimeInMissed]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TC_Replacement_Employees_Times_OutAutoStatus]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TC_Replacement_Employees_Times] ADD  CONSTRAINT [DF_TC_Replacement_Employees_Times_OutAutoStatus]  DEFAULT ((0)) FOR [OutAutoStatus]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TC_Replacement_Employees_Times_TimeOutMissed]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TC_Replacement_Employees_Times] ADD  CONSTRAINT [DF_TC_Replacement_Employees_Times_TimeOutMissed]  DEFAULT ((0)) FOR [TimeOutMissed]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Test_Log_WhoInsert]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Testing_log] ADD  CONSTRAINT [DF_Test_Log_WhoInsert]  DEFAULT (suser_sname()) FOR [WhoInsert]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TimeTable_Clock]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TimeTable] ADD  CONSTRAINT [DF_TimeTable_Clock]  DEFAULT (getdate()) FOR [ClockStart]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_prc_History_Date]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TimeTableMaster] ADD  CONSTRAINT [DF_prc_History_Date]  DEFAULT (getdate()) FOR [Date]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_UPSTracking_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[UPSTracking] ADD  CONSTRAINT [DF_UPSTracking_void]  DEFAULT ('N') FOR [void]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_UPSTracking_Packages]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[UPSTracking] ADD  CONSTRAINT [DF_UPSTracking_Packages]  DEFAULT ('1') FOR [Packages]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_UPSTracking_ShipDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[UPSTracking] ADD  CONSTRAINT [DF_UPSTracking_ShipDate]  DEFAULT (getdate()) FOR [ShipDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_usertrack_errordate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[UserTrack] ADD  CONSTRAINT [DF_usertrack_errordate]  DEFAULT (getdate()) FOR [errordate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_UserTrack_machine]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[UserTrack] ADD  CONSTRAINT [DF_UserTrack_machine]  DEFAULT (left(suser_sname(),(40))) FOR [machine]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_UserTrack_ServerName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[UserTrack] ADD  CONSTRAINT [DF_UserTrack_ServerName]  DEFAULT (@@servername) FOR [ServerName]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_UTlog_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[UTlog] ADD  CONSTRAINT [DF_UTlog_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_UTlog_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[UTlog] ADD  CONSTRAINT [DF_UTlog_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_vendor_company]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Vendor] ADD  CONSTRAINT [DF_vendor_company]  DEFAULT (' ') FOR [Company]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_vendor_addr1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Vendor] ADD  CONSTRAINT [DF_vendor_addr1]  DEFAULT (' ') FOR [Addr1]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_vendor_addr2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Vendor] ADD  CONSTRAINT [DF_vendor_addr2]  DEFAULT (' ') FOR [Addr2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_vendor_city]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Vendor] ADD  CONSTRAINT [DF_vendor_city]  DEFAULT (' ') FOR [City]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_vendor_st]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Vendor] ADD  CONSTRAINT [DF_vendor_st]  DEFAULT ('  ') FOR [ST]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_vendor_zip]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Vendor] ADD  CONSTRAINT [DF_vendor_zip]  DEFAULT (' ') FOR [Zip]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_vendor_country]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Vendor] ADD  CONSTRAINT [DF_vendor_country]  DEFAULT (' ') FOR [Country]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_vendor_vendor_id]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Vendor] ADD  CONSTRAINT [DF_vendor_vendor_id]  DEFAULT ('') FOR [PeachID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Vendor_QAType]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Vendor] ADD  CONSTRAINT [DF_Vendor_QAType]  DEFAULT ((0)) FOR [QAType]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_vendor_lastedit]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Vendor] ADD  CONSTRAINT [DF_vendor_lastedit]  DEFAULT (getdate()) FOR [LastEdit]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Vendor_VQS_NotRequired]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Vendor] ADD  CONSTRAINT [DF_Vendor_VQS_NotRequired]  DEFAULT ((0)) FOR [VQS_NotRequired]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Vendor_AuditLog_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Vendor_AuditLog] ADD  CONSTRAINT [DF_Vendor_AuditLog_ID]  DEFAULT (newsequentialid()) FOR [ID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Vendor_Invoice_InvoiceDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Vendor_Invoice] ADD  CONSTRAINT [DF_Vendor_Invoice_InvoiceDate]  DEFAULT (getdate()) FOR [InvoiceDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Vendor_Invoice_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Vendor_Invoice] ADD  CONSTRAINT [DF_Vendor_Invoice_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Vendor_Invoice_Detail_POitem]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Vendor_Invoice_Detail] ADD  CONSTRAINT [DF_Vendor_Invoice_Detail_POitem]  DEFAULT (' ') FOR [POitem]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Vendor_Invoice_Detail_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Vendor_Invoice_Detail] ADD  CONSTRAINT [DF_Vendor_Invoice_Detail_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Vendor_Invoice_POitem_POitem]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Vendor_Invoice_POitem] ADD  CONSTRAINT [DF_Vendor_Invoice_POitem_POitem]  DEFAULT ([dbo].[f_ProperPOitem](' ')) FOR [POitem]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Vendor_Invoice_POitem_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Vendor_Invoice_POitem] ADD  CONSTRAINT [DF_Vendor_Invoice_POitem_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Vendor_Invoice_Receive_POitem]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Vendor_Invoice_Receive] ADD  CONSTRAINT [DF_Vendor_Invoice_Receive_POitem]  DEFAULT (' ') FOR [POitem]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Vendor_Invoice_Receive_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Vendor_Invoice_Receive] ADD  CONSTRAINT [DF_Vendor_Invoice_Receive_When]  DEFAULT (getdate()) FOR [INV_When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_VendorQualitySurvey_lastUsedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VendorQualitySurvey] ADD  CONSTRAINT [DF_VendorQualitySurvey_lastUsedDate]  DEFAULT (getdate()) FOR [lastUsedDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WaterJetMachineHours_Hours]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WaterJetMachineHours] ADD  CONSTRAINT [DF_WaterJetMachineHours_Hours]  DEFAULT ((0)) FOR [Hours]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WIPLst_Detail_floorstatus]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WIPLst_Detail] ADD  CONSTRAINT [DF_WIPLst_Detail_floorstatus]  DEFAULT ('') FOR [FloorStatus]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WIPLst_Detail_class]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WIPLst_Detail] ADD  CONSTRAINT [DF_WIPLst_Detail_class]  DEFAULT ('') FOR [Class]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WIPLst_Detail_Inserted_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WIPLst_Detail_Inserted] ADD  CONSTRAINT [DF_WIPLst_Detail_Inserted_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WIPLst_Detail_Inserted_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WIPLst_Detail_Inserted] ADD  CONSTRAINT [DF_WIPLst_Detail_Inserted_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WIPLst_Detail_Inserted_Verified]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WIPLst_Detail_Inserted] ADD  CONSTRAINT [DF_WIPLst_Detail_Inserted_Verified]  DEFAULT ((0)) FOR [Verified]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WIPLst_Detail_Inserted_VerifiedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WIPLst_Detail_Inserted] ADD  CONSTRAINT [DF_WIPLst_Detail_Inserted_VerifiedBy]  DEFAULT ('') FOR [VerifiedBy]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WIPLst_master_cc]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WIPLst_Master] ADD  CONSTRAINT [DF_WIPLst_master_cc]  DEFAULT ('1') FOR [CC]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WIPLst_master_mweight]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WIPLst_Master] ADD  CONSTRAINT [DF_WIPLst_master_mweight]  DEFAULT ((0)) FOR [MWeight]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WIPLst_Master_Melt]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WIPLst_Master] ADD  CONSTRAINT [DF_WIPLst_Master_Melt]  DEFAULT ('-') FOR [Melt]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WIPLst_Master_Inserted_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WIPLst_Master_Inserted] ADD  CONSTRAINT [DF_WIPLst_Master_Inserted_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WIPLst_Master_Inserted_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WIPLst_Master_Inserted] ADD  CONSTRAINT [DF_WIPLst_Master_Inserted_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WIPLst_Master_Inserted_VerifiedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WIPLst_Master_Inserted] ADD  CONSTRAINT [DF_WIPLst_Master_Inserted_VerifiedBy]  DEFAULT (suser_sname()) FOR [VerifiedBy]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WIPLst_Process_SOitem]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WIPLst_Process] ADD  CONSTRAINT [DF_WIPLst_Process_SOitem]  DEFAULT ([dbo].[f_ProperSOitem]('')) FOR [SOitem]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WIPLst_Process_startdate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WIPLst_Process] ADD  CONSTRAINT [DF_WIPLst_Process_startdate]  DEFAULT (getdate()) FOR [StartDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WIPLst_Process_Detail_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WIPLst_Process_Detail] ADD  CONSTRAINT [DF_WIPLst_Process_Detail_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WIPLst_Process_Detail_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WIPLst_Process_Detail] ADD  CONSTRAINT [DF_WIPLst_Process_Detail_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WIPLst_Process_Detail_SOitem]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WIPLst_Process_Detail] ADD  CONSTRAINT [DF_WIPLst_Process_Detail_SOitem]  DEFAULT ([dbo].[f_ProperSOitem]('')) FOR [SOitem]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WIPLst_Process_SOitem_Grab]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WIPLst_Process_Grab] ADD  CONSTRAINT [DF_WIPLst_Process_SOitem_Grab]  DEFAULT ([dbo].[f_ProperSOitem]('')) FOR [SOitem]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WIPLst_Process_Grab_FoundStk]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WIPLst_Process_Grab] ADD  CONSTRAINT [DF_WIPLst_Process_Grab_FoundStk]  DEFAULT (getdate()) FOR [FoundStk]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WIPLst_Process_Grab_Gone]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WIPLst_Process_Grab] ADD  CONSTRAINT [DF_WIPLst_Process_Grab_Gone]  DEFAULT ((0)) FOR [Gone]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Wire_Dies_active]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Wire_Dies] ADD  CONSTRAINT [DF_Wire_Dies_active]  DEFAULT ((1)) FOR [active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Wire_Dies_worn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Wire_Dies] ADD  CONSTRAINT [DF_Wire_Dies_worn]  DEFAULT ((0)) FOR [worn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Wire_log_WhoInsert]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Wire_log] ADD  CONSTRAINT [DF_Wire_log_WhoInsert]  DEFAULT (suser_sname()) FOR [WhoInsert]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WireTransfers2_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WireTransfers] ADD  CONSTRAINT [DF_WireTransfers2_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WireTransfers2_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WireTransfers] ADD  CONSTRAINT [DF_WireTransfers2_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WO_Orders_QTY]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WOD_Orders] ADD  CONSTRAINT [DF_WO_Orders_QTY]  DEFAULT ((0)) FOR [QTY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WOD_POitem_Notes]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WOD_POitem] ADD  CONSTRAINT [DF_WOD_POitem_Notes]  DEFAULT ('') FOR [Notes]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WOD_POitem_Testing]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WOD_POitem] ADD  CONSTRAINT [DF_WOD_POitem_Testing]  DEFAULT ((0)) FOR [Testing]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WOD_POitem_Received]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WOD_POitem] ADD  CONSTRAINT [DF_WOD_POitem_Received]  DEFAULT ((0)) FOR [Received]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WorkOrder_EnterDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WorkOrder] ADD  CONSTRAINT [DF_WorkOrder_EnterDate]  DEFAULT (getdate()) FOR [EnterDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WorkOrder_Descript]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WorkOrder] ADD  CONSTRAINT [DF_WorkOrder_Descript]  DEFAULT ('') FOR [Descript]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WorkOrder_SOitem]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WorkOrder] ADD  CONSTRAINT [DF_WorkOrder_SOitem]  DEFAULT ('') FOR [SOitem]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WorkOrder_POitem]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WorkOrder] ADD  CONSTRAINT [DF_WorkOrder_POitem]  DEFAULT ('') FOR [POitem]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WorkOrder_sAlloy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WorkOrder] ADD  CONSTRAINT [DF_WorkOrder_sAlloy]  DEFAULT ('') FOR [sAlloy]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WorkOrder_sForm]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WorkOrder] ADD  CONSTRAINT [DF_WorkOrder_sForm]  DEFAULT ('') FOR [sForm]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WorkOrder_sCC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WorkOrder] ADD  CONSTRAINT [DF_WorkOrder_sCC]  DEFAULT ('') FOR [sCC]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WorkOrder_sCL]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WorkOrder] ADD  CONSTRAINT [DF_WorkOrder_sCL]  DEFAULT ('') FOR [sCL]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WorkOrder_TBL]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WorkOrder] ADD  CONSTRAINT [DF_WorkOrder_TBL]  DEFAULT ('') FOR [TBL]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WorkOrder_Notes]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WorkOrder] ADD  CONSTRAINT [DF_WorkOrder_Notes]  DEFAULT ('') FOR [Notes]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WorkOrder_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WorkOrder] ADD  CONSTRAINT [DF_WorkOrder_Who]  DEFAULT (left(suser_sname(),(50))) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WorkOrder_Detail_fDescript]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WorkOrder_Detail] ADD  CONSTRAINT [DF_WorkOrder_Detail_fDescript]  DEFAULT ('') FOR [fDescript]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WorkOrder_Detail_fInqNumP]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WorkOrder_Detail] ADD  CONSTRAINT [DF_WorkOrder_Detail_fInqNumP]  DEFAULT ('') FOR [fInqNumP]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WorkOrder_Detail_fSOitem]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WorkOrder_Detail] ADD  CONSTRAINT [DF_WorkOrder_Detail_fSOitem]  DEFAULT ('') FOR [fSOitem]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WorkOrder_Detail_fPOitem]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WorkOrder_Detail] ADD  CONSTRAINT [DF_WorkOrder_Detail_fPOitem]  DEFAULT ('') FOR [fPOitem]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WorkOrder_Detail_fAlloy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WorkOrder_Detail] ADD  CONSTRAINT [DF_WorkOrder_Detail_fAlloy]  DEFAULT ('') FOR [fAlloy]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WorkOrder_Detail_fForm]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WorkOrder_Detail] ADD  CONSTRAINT [DF_WorkOrder_Detail_fForm]  DEFAULT ('') FOR [fForm]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WorkOrder_Detail_fCC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WorkOrder_Detail] ADD  CONSTRAINT [DF_WorkOrder_Detail_fCC]  DEFAULT ('') FOR [fCC]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WorkOrder_Detail_fCL]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WorkOrder_Detail] ADD  CONSTRAINT [DF_WorkOrder_Detail_fCL]  DEFAULT ('') FOR [fCL]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WorkOrder_Detail_fNotes]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WorkOrder_Detail] ADD  CONSTRAINT [DF_WorkOrder_Detail_fNotes]  DEFAULT ('') FOR [fNotes]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WorkOrder_Detail_fCondLevel]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WorkOrder_Detail] ADD  CONSTRAINT [DF_WorkOrder_Detail_fCondLevel]  DEFAULT ('') FOR [fCondLevel]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WorkOrder_Detail_FollowM]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WorkOrder_Detail] ADD  CONSTRAINT [DF_WorkOrder_Detail_FollowM]  DEFAULT ('') FOR [FollowM]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WorkOrder_Detail_FinishM]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WorkOrder_Detail] ADD  CONSTRAINT [DF_WorkOrder_Detail_FinishM]  DEFAULT ('') FOR [FinishM]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WorkOrder_Detail_FSpec]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WorkOrder_Detail] ADD  CONSTRAINT [DF_WorkOrder_Detail_FSpec]  DEFAULT ('') FOR [FSpec]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WorkOrder_Detail_TestPO]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WorkOrder_Detail] ADD  CONSTRAINT [DF_WorkOrder_Detail_TestPO]  DEFAULT ('') FOR [TestPO]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WorkOrder_Notes_DateAdded]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WorkOrder_Notes] ADD  CONSTRAINT [DF_WorkOrder_Notes_DateAdded]  DEFAULT (getdate()) FOR [DateAdded]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WorkOrder_Stock_TBL]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WorkOrder_Stock] ADD  CONSTRAINT [DF_WorkOrder_Stock_TBL]  DEFAULT ('') FOR [TBL]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WorkOrder_Stock_sTBL]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WorkOrder_Stock] ADD  CONSTRAINT [DF_WorkOrder_Stock_sTBL]  DEFAULT ('') FOR [sTBL]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WorkOrder_Stock_sMaster_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WorkOrder_Stock] ADD  CONSTRAINT [DF_WorkOrder_Stock_sMaster_ID]  DEFAULT ((0)) FOR [sMaster_ID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WorkOrder_Stock_who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WorkOrder_Stock] ADD  CONSTRAINT [DF_WorkOrder_Stock_who]  DEFAULT (left(suser_sname(),(50))) FOR [who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WorkOrder_Stock_what]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WorkOrder_Stock] ADD  CONSTRAINT [DF_WorkOrder_Stock_what]  DEFAULT ('') FOR [what]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WorkOrder_Stock_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WorkOrder_Stock] ADD  CONSTRAINT [DF_WorkOrder_Stock_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WorkOrder_Stock_sStockLst_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WorkOrder_Stock] ADD  CONSTRAINT [DF_WorkOrder_Stock_sStockLst_ID]  DEFAULT ((0)) FOR [sStockLst_ID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AcctCost_Cert_AcctCosting]') AND parent_object_id = OBJECT_ID(N'[dbo].[AcctCost_Cert]'))
ALTER TABLE [dbo].[AcctCost_Cert]  WITH CHECK ADD  CONSTRAINT [FK_AcctCost_Cert_AcctCosting] FOREIGN KEY([AC_ID])
REFERENCES [dbo].[AcctCosting] ([AC_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AcctCost_Cert_AcctCosting]') AND parent_object_id = OBJECT_ID(N'[dbo].[AcctCost_Cert]'))
ALTER TABLE [dbo].[AcctCost_Cert] CHECK CONSTRAINT [FK_AcctCost_Cert_AcctCosting]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AcctCost_Mach_AcctCosting]') AND parent_object_id = OBJECT_ID(N'[dbo].[AcctCost_Mach]'))
ALTER TABLE [dbo].[AcctCost_Mach]  WITH CHECK ADD  CONSTRAINT [FK_AcctCost_Mach_AcctCosting] FOREIGN KEY([AC_ID])
REFERENCES [dbo].[AcctCosting] ([AC_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AcctCost_Mach_AcctCosting]') AND parent_object_id = OBJECT_ID(N'[dbo].[AcctCost_Mach]'))
ALTER TABLE [dbo].[AcctCost_Mach] CHECK CONSTRAINT [FK_AcctCost_Mach_AcctCosting]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AcctCost_POitem_AcctCosting]') AND parent_object_id = OBJECT_ID(N'[dbo].[AcctCost_POitem]'))
ALTER TABLE [dbo].[AcctCost_POitem]  WITH CHECK ADD  CONSTRAINT [FK_AcctCost_POitem_AcctCosting] FOREIGN KEY([AC_ID])
REFERENCES [dbo].[AcctCosting] ([AC_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AcctCost_POitem_AcctCosting]') AND parent_object_id = OBJECT_ID(N'[dbo].[AcctCost_POitem]'))
ALTER TABLE [dbo].[AcctCost_POitem] CHECK CONSTRAINT [FK_AcctCost_POitem_AcctCosting]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AcctCost_SOitem_AcctCosting]') AND parent_object_id = OBJECT_ID(N'[dbo].[AcctCost_SOitem]'))
ALTER TABLE [dbo].[AcctCost_SOitem]  WITH CHECK ADD  CONSTRAINT [FK_AcctCost_SOitem_AcctCosting] FOREIGN KEY([AC_ID])
REFERENCES [dbo].[AcctCosting] ([AC_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AcctCost_SOitem_AcctCosting]') AND parent_object_id = OBJECT_ID(N'[dbo].[AcctCost_SOitem]'))
ALTER TABLE [dbo].[AcctCost_SOitem] CHECK CONSTRAINT [FK_AcctCost_SOitem_AcctCosting]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AcctCost_WO_AcctCosting]') AND parent_object_id = OBJECT_ID(N'[dbo].[AcctCost_WO]'))
ALTER TABLE [dbo].[AcctCost_WO]  WITH CHECK ADD  CONSTRAINT [FK_AcctCost_WO_AcctCosting] FOREIGN KEY([AC_ID])
REFERENCES [dbo].[AcctCosting] ([AC_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AcctCost_WO_AcctCosting]') AND parent_object_id = OBJECT_ID(N'[dbo].[AcctCost_WO]'))
ALTER TABLE [dbo].[AcctCost_WO] CHECK CONSTRAINT [FK_AcctCost_WO_AcctCosting]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AcctCost_WOD_AcctCosting]') AND parent_object_id = OBJECT_ID(N'[dbo].[AcctCost_WOD]'))
ALTER TABLE [dbo].[AcctCost_WOD]  WITH CHECK ADD  CONSTRAINT [FK_AcctCost_WOD_AcctCosting] FOREIGN KEY([AC_ID])
REFERENCES [dbo].[AcctCosting] ([AC_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AcctCost_WOD_AcctCosting]') AND parent_object_id = OBJECT_ID(N'[dbo].[AcctCost_WOD]'))
ALTER TABLE [dbo].[AcctCost_WOD] CHECK CONSTRAINT [FK_AcctCost_WOD_AcctCosting]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Alloy_AlloyCategory_Alloy]') AND parent_object_id = OBJECT_ID(N'[dbo].[Alloy_AlloyCategory]'))
ALTER TABLE [dbo].[Alloy_AlloyCategory]  WITH CHECK ADD  CONSTRAINT [FK_Alloy_AlloyCategory_Alloy] FOREIGN KEY([alloy])
REFERENCES [dbo].[Alloy] ([alloy])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Alloy_AlloyCategory_Alloy]') AND parent_object_id = OBJECT_ID(N'[dbo].[Alloy_AlloyCategory]'))
ALTER TABLE [dbo].[Alloy_AlloyCategory] CHECK CONSTRAINT [FK_Alloy_AlloyCategory_Alloy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Alloy_AlloyCategory_AlloyCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Alloy_AlloyCategory]'))
ALTER TABLE [dbo].[Alloy_AlloyCategory]  WITH CHECK ADD  CONSTRAINT [FK_Alloy_AlloyCategory_AlloyCategory] FOREIGN KEY([AlloyCategoryID])
REFERENCES [dbo].[AlloyCategory] ([AlloyCategoryID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Alloy_AlloyCategory_AlloyCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Alloy_AlloyCategory]'))
ALTER TABLE [dbo].[Alloy_AlloyCategory] CHECK CONSTRAINT [FK_Alloy_AlloyCategory_AlloyCategory]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BrokerLst_Detail_BrokerLst_Master-IDl]') AND parent_object_id = OBJECT_ID(N'[dbo].[BrokerLst_Detail]'))
ALTER TABLE [dbo].[BrokerLst_Detail]  WITH CHECK ADD  CONSTRAINT [FK_BrokerLst_Detail_BrokerLst_Master-IDl] FOREIGN KEY([ID])
REFERENCES [dbo].[BrokerLst_Master] ([ID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BrokerLst_Detail_BrokerLst_Master-IDl]') AND parent_object_id = OBJECT_ID(N'[dbo].[BrokerLst_Detail]'))
ALTER TABLE [dbo].[BrokerLst_Detail] CHECK CONSTRAINT [FK_BrokerLst_Detail_BrokerLst_Master-IDl]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BrokerLst_Process_Grab_Sales]') AND parent_object_id = OBJECT_ID(N'[dbo].[BrokerLst_Process_Grab]'))
ALTER TABLE [dbo].[BrokerLst_Process_Grab]  WITH NOCHECK ADD  CONSTRAINT [FK_BrokerLst_Process_Grab_Sales] FOREIGN KEY([SOitem])
REFERENCES [dbo].[Sales] ([SOitem])
NOT FOR REPLICATION 
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BrokerLst_Process_Grab_Sales]') AND parent_object_id = OBJECT_ID(N'[dbo].[BrokerLst_Process_Grab]'))
ALTER TABLE [dbo].[BrokerLst_Process_Grab] NOCHECK CONSTRAINT [FK_BrokerLst_Process_Grab_Sales]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EmailService_Credentials_EmailService_Type]') AND parent_object_id = OBJECT_ID(N'[dbo].[EmailService_Credentials]'))
ALTER TABLE [dbo].[EmailService_Credentials]  WITH CHECK ADD  CONSTRAINT [FK_EmailService_Credentials_EmailService_Type] FOREIGN KEY([ServiceTypeId])
REFERENCES [dbo].[EmailService_Type] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EmailService_Credentials_EmailService_Type]') AND parent_object_id = OBJECT_ID(N'[dbo].[EmailService_Credentials]'))
ALTER TABLE [dbo].[EmailService_Credentials] CHECK CONSTRAINT [FK_EmailService_Credentials_EmailService_Type]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EmailService_Email_Log_EmailService_SalesUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[EmailService_Email_Log]'))
ALTER TABLE [dbo].[EmailService_Email_Log]  WITH CHECK ADD  CONSTRAINT [FK_EmailService_Email_Log_EmailService_SalesUsers] FOREIGN KEY([ForwardToId])
REFERENCES [dbo].[EmailService_SalesUsers] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EmailService_Email_Log_EmailService_SalesUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[EmailService_Email_Log]'))
ALTER TABLE [dbo].[EmailService_Email_Log] CHECK CONSTRAINT [FK_EmailService_Email_Log_EmailService_SalesUsers]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EmailService_SalesUsers_EmailService_SalesUsers_Schedule]') AND parent_object_id = OBJECT_ID(N'[dbo].[EmailService_SalesUsers]'))
ALTER TABLE [dbo].[EmailService_SalesUsers]  WITH CHECK ADD  CONSTRAINT [FK_EmailService_SalesUsers_EmailService_SalesUsers_Schedule] FOREIGN KEY([EmailService_SalesUsers_Schedule])
REFERENCES [dbo].[EmailService_SalesUsers_Schedule] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EmailService_SalesUsers_EmailService_SalesUsers_Schedule]') AND parent_object_id = OBJECT_ID(N'[dbo].[EmailService_SalesUsers]'))
ALTER TABLE [dbo].[EmailService_SalesUsers] CHECK CONSTRAINT [FK_EmailService_SalesUsers_EmailService_SalesUsers_Schedule]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EquipmentMachinePartAssociation_EquipmentMachineType]') AND parent_object_id = OBJECT_ID(N'[dbo].[EquipmentMachinePartAssociation]'))
ALTER TABLE [dbo].[EquipmentMachinePartAssociation]  WITH CHECK ADD  CONSTRAINT [FK_EquipmentMachinePartAssociation_EquipmentMachineType] FOREIGN KEY([Machine])
REFERENCES [dbo].[EquipmentMachineType] ([Machine])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EquipmentMachinePartAssociation_EquipmentMachineType]') AND parent_object_id = OBJECT_ID(N'[dbo].[EquipmentMachinePartAssociation]'))
ALTER TABLE [dbo].[EquipmentMachinePartAssociation] CHECK CONSTRAINT [FK_EquipmentMachinePartAssociation_EquipmentMachineType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EquipmentMachinePartAssociation_EquipmentParts]') AND parent_object_id = OBJECT_ID(N'[dbo].[EquipmentMachinePartAssociation]'))
ALTER TABLE [dbo].[EquipmentMachinePartAssociation]  WITH CHECK ADD  CONSTRAINT [FK_EquipmentMachinePartAssociation_EquipmentParts] FOREIGN KEY([Part])
REFERENCES [dbo].[EquipmentParts] ([Part])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EquipmentMachinePartAssociation_EquipmentParts]') AND parent_object_id = OBJECT_ID(N'[dbo].[EquipmentMachinePartAssociation]'))
ALTER TABLE [dbo].[EquipmentMachinePartAssociation] CHECK CONSTRAINT [FK_EquipmentMachinePartAssociation_EquipmentParts]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EquipmentPartHours_EquipmentPartItems1]') AND parent_object_id = OBJECT_ID(N'[dbo].[EquipmentPartHours]'))
ALTER TABLE [dbo].[EquipmentPartHours]  WITH CHECK ADD  CONSTRAINT [FK_EquipmentPartHours_EquipmentPartItems1] FOREIGN KEY([Part], [Identifier])
REFERENCES [dbo].[EquipmentPartItems] ([Part], [Identifier])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EquipmentPartHours_EquipmentPartItems1]') AND parent_object_id = OBJECT_ID(N'[dbo].[EquipmentPartHours]'))
ALTER TABLE [dbo].[EquipmentPartHours] CHECK CONSTRAINT [FK_EquipmentPartHours_EquipmentPartItems1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EquipmentPartHours_WaterJetMachines]') AND parent_object_id = OBJECT_ID(N'[dbo].[EquipmentPartHours]'))
ALTER TABLE [dbo].[EquipmentPartHours]  WITH CHECK ADD  CONSTRAINT [FK_EquipmentPartHours_WaterJetMachines] FOREIGN KEY([Machine], [MIdentifier])
REFERENCES [dbo].[WaterJetMachines] ([Machine], [MIdentifier])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EquipmentPartHours_WaterJetMachines]') AND parent_object_id = OBJECT_ID(N'[dbo].[EquipmentPartHours]'))
ALTER TABLE [dbo].[EquipmentPartHours] CHECK CONSTRAINT [FK_EquipmentPartHours_WaterJetMachines]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EquipmentPartItems_EquipmentParts]') AND parent_object_id = OBJECT_ID(N'[dbo].[EquipmentPartItems]'))
ALTER TABLE [dbo].[EquipmentPartItems]  WITH CHECK ADD  CONSTRAINT [FK_EquipmentPartItems_EquipmentParts] FOREIGN KEY([Part])
REFERENCES [dbo].[EquipmentParts] ([Part])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EquipmentPartItems_EquipmentParts]') AND parent_object_id = OBJECT_ID(N'[dbo].[EquipmentPartItems]'))
ALTER TABLE [dbo].[EquipmentPartItems] CHECK CONSTRAINT [FK_EquipmentPartItems_EquipmentParts]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EquipmentPartSwapDates_EquipmentPartItems]') AND parent_object_id = OBJECT_ID(N'[dbo].[EquipmentPartSwapDates]'))
ALTER TABLE [dbo].[EquipmentPartSwapDates]  WITH CHECK ADD  CONSTRAINT [FK_EquipmentPartSwapDates_EquipmentPartItems] FOREIGN KEY([Part], [Identifier])
REFERENCES [dbo].[EquipmentPartItems] ([Part], [Identifier])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EquipmentPartSwapDates_EquipmentPartItems]') AND parent_object_id = OBJECT_ID(N'[dbo].[EquipmentPartSwapDates]'))
ALTER TABLE [dbo].[EquipmentPartSwapDates] CHECK CONSTRAINT [FK_EquipmentPartSwapDates_EquipmentPartItems]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_Die_Condition_GFM_Die_Inventory]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_Die_Condition]'))
ALTER TABLE [dbo].[GFM_Die_Condition]  WITH CHECK ADD  CONSTRAINT [FK_GFM_Die_Condition_GFM_Die_Inventory] FOREIGN KEY([DieID])
REFERENCES [dbo].[GFM_Die_Inventory] ([DieID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_Die_Condition_GFM_Die_Inventory]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_Die_Condition]'))
ALTER TABLE [dbo].[GFM_Die_Condition] CHECK CONSTRAINT [FK_GFM_Die_Condition_GFM_Die_Inventory]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_Die_Daily_GFM_Die_Inventory]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_Die_Daily]'))
ALTER TABLE [dbo].[GFM_Die_Daily]  WITH CHECK ADD  CONSTRAINT [FK_GFM_Die_Daily_GFM_Die_Inventory] FOREIGN KEY([DieID])
REFERENCES [dbo].[GFM_Die_Inventory] ([DieID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_Die_Daily_GFM_Die_Inventory]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_Die_Daily]'))
ALTER TABLE [dbo].[GFM_Die_Daily] CHECK CONSTRAINT [FK_GFM_Die_Daily_GFM_Die_Inventory]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_Die_Height_GFM_Die_Inventory]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_Die_Height]'))
ALTER TABLE [dbo].[GFM_Die_Height]  WITH CHECK ADD  CONSTRAINT [FK_GFM_Die_Height_GFM_Die_Inventory] FOREIGN KEY([DieID])
REFERENCES [dbo].[GFM_Die_Inventory] ([DieID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_Die_Height_GFM_Die_Inventory]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_Die_Height]'))
ALTER TABLE [dbo].[GFM_Die_Height] CHECK CONSTRAINT [FK_GFM_Die_Height_GFM_Die_Inventory]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_Die_Inspection_GFM_Die_Condition]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_Die_Inspection]'))
ALTER TABLE [dbo].[GFM_Die_Inspection]  WITH CHECK ADD  CONSTRAINT [FK_GFM_Die_Inspection_GFM_Die_Condition] FOREIGN KEY([ConditionID])
REFERENCES [dbo].[GFM_Die_Condition] ([ID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_Die_Inspection_GFM_Die_Condition]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_Die_Inspection]'))
ALTER TABLE [dbo].[GFM_Die_Inspection] CHECK CONSTRAINT [FK_GFM_Die_Inspection_GFM_Die_Condition]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_Die_Inspection_GFM_Die_Height]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_Die_Inspection]'))
ALTER TABLE [dbo].[GFM_Die_Inspection]  WITH CHECK ADD  CONSTRAINT [FK_GFM_Die_Inspection_GFM_Die_Height] FOREIGN KEY([HeightID])
REFERENCES [dbo].[GFM_Die_Height] ([ID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_Die_Inspection_GFM_Die_Height]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_Die_Inspection]'))
ALTER TABLE [dbo].[GFM_Die_Inspection] CHECK CONSTRAINT [FK_GFM_Die_Inspection_GFM_Die_Height]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_Die_Inspection_GFM_Die_Inventory]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_Die_Inspection]'))
ALTER TABLE [dbo].[GFM_Die_Inspection]  WITH CHECK ADD  CONSTRAINT [FK_GFM_Die_Inspection_GFM_Die_Inventory] FOREIGN KEY([DieID])
REFERENCES [dbo].[GFM_Die_Inventory] ([DieID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_Die_Inspection_GFM_Die_Inventory]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_Die_Inspection]'))
ALTER TABLE [dbo].[GFM_Die_Inspection] CHECK CONSTRAINT [FK_GFM_Die_Inspection_GFM_Die_Inventory]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_Die_Inspection_GFM_Die_Range]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_Die_Inspection]'))
ALTER TABLE [dbo].[GFM_Die_Inspection]  WITH CHECK ADD  CONSTRAINT [FK_GFM_Die_Inspection_GFM_Die_Range] FOREIGN KEY([RangeID])
REFERENCES [dbo].[GFM_Die_Range] ([ID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_Die_Inspection_GFM_Die_Range]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_Die_Inspection]'))
ALTER TABLE [dbo].[GFM_Die_Inspection] CHECK CONSTRAINT [FK_GFM_Die_Inspection_GFM_Die_Range]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_Die_Landing_GFM_Die_Landing]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_Die_Landing]'))
ALTER TABLE [dbo].[GFM_Die_Landing]  WITH CHECK ADD  CONSTRAINT [FK_GFM_Die_Landing_GFM_Die_Landing] FOREIGN KEY([ID])
REFERENCES [dbo].[GFM_Die_Landing] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_Die_Landing_GFM_Die_Landing]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_Die_Landing]'))
ALTER TABLE [dbo].[GFM_Die_Landing] CHECK CONSTRAINT [FK_GFM_Die_Landing_GFM_Die_Landing]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_Die_On_OT_GFM_Die_Daily]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_Die_On_OT]'))
ALTER TABLE [dbo].[GFM_Die_On_OT]  WITH CHECK ADD  CONSTRAINT [FK_GFM_Die_On_OT_GFM_Die_Daily] FOREIGN KEY([DieDailyID])
REFERENCES [dbo].[GFM_Die_Daily] ([ID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_Die_On_OT_GFM_Die_Daily]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_Die_On_OT]'))
ALTER TABLE [dbo].[GFM_Die_On_OT] CHECK CONSTRAINT [FK_GFM_Die_On_OT_GFM_Die_Daily]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_Die_Repair_GFM_Die_Inventory]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_Die_Repair]'))
ALTER TABLE [dbo].[GFM_Die_Repair]  WITH CHECK ADD  CONSTRAINT [FK_GFM_Die_Repair_GFM_Die_Inventory] FOREIGN KEY([DieID])
REFERENCES [dbo].[GFM_Die_Inventory] ([DieID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_Die_Repair_GFM_Die_Inventory]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_Die_Repair]'))
ALTER TABLE [dbo].[GFM_Die_Repair] CHECK CONSTRAINT [FK_GFM_Die_Repair_GFM_Die_Inventory]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_Condition_GFM_DieSets]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_Condition]'))
ALTER TABLE [dbo].[GFM_DieSets_Condition]  WITH CHECK ADD  CONSTRAINT [FK_GFM_DieSets_Condition_GFM_DieSets] FOREIGN KEY([DieID])
REFERENCES [dbo].[GFM_DieSets] ([DieID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_Condition_GFM_DieSets]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_Condition]'))
ALTER TABLE [dbo].[GFM_DieSets_Condition] CHECK CONSTRAINT [FK_GFM_DieSets_Condition_GFM_DieSets]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_Condition_GFM_DieSets_Condition_Definition]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_Condition]'))
ALTER TABLE [dbo].[GFM_DieSets_Condition]  WITH CHECK ADD  CONSTRAINT [FK_GFM_DieSets_Condition_GFM_DieSets_Condition_Definition] FOREIGN KEY([Condition])
REFERENCES [dbo].[GFM_DieSets_Condition_Definition] ([ConditionCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_Condition_GFM_DieSets_Condition_Definition]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_Condition]'))
ALTER TABLE [dbo].[GFM_DieSets_Condition] CHECK CONSTRAINT [FK_GFM_DieSets_Condition_GFM_DieSets_Condition_Definition]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_Height_GFM_DieSets]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_Height]'))
ALTER TABLE [dbo].[GFM_DieSets_Height]  WITH CHECK ADD  CONSTRAINT [FK_GFM_DieSets_Height_GFM_DieSets] FOREIGN KEY([DieID])
REFERENCES [dbo].[GFM_DieSets] ([DieID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_Height_GFM_DieSets]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_Height]'))
ALTER TABLE [dbo].[GFM_DieSets_Height] CHECK CONSTRAINT [FK_GFM_DieSets_Height_GFM_DieSets]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_Inspection_GFM_DieSets]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_Inspection]'))
ALTER TABLE [dbo].[GFM_DieSets_Inspection]  WITH CHECK ADD  CONSTRAINT [FK_GFM_DieSets_Inspection_GFM_DieSets] FOREIGN KEY([DieID])
REFERENCES [dbo].[GFM_DieSets] ([DieID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_Inspection_GFM_DieSets]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_Inspection]'))
ALTER TABLE [dbo].[GFM_DieSets_Inspection] CHECK CONSTRAINT [FK_GFM_DieSets_Inspection_GFM_DieSets]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_Inspection_GFM_DieSets_Condition]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_Inspection]'))
ALTER TABLE [dbo].[GFM_DieSets_Inspection]  WITH CHECK ADD  CONSTRAINT [FK_GFM_DieSets_Inspection_GFM_DieSets_Condition] FOREIGN KEY([ConditionID])
REFERENCES [dbo].[GFM_DieSets_Condition] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_Inspection_GFM_DieSets_Condition]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_Inspection]'))
ALTER TABLE [dbo].[GFM_DieSets_Inspection] CHECK CONSTRAINT [FK_GFM_DieSets_Inspection_GFM_DieSets_Condition]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_Inspection_GFM_DieSets_Height]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_Inspection]'))
ALTER TABLE [dbo].[GFM_DieSets_Inspection]  WITH CHECK ADD  CONSTRAINT [FK_GFM_DieSets_Inspection_GFM_DieSets_Height] FOREIGN KEY([HeightID])
REFERENCES [dbo].[GFM_DieSets_Height] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_Inspection_GFM_DieSets_Height]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_Inspection]'))
ALTER TABLE [dbo].[GFM_DieSets_Inspection] CHECK CONSTRAINT [FK_GFM_DieSets_Inspection_GFM_DieSets_Height]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_Inspection_GFM_DieSets_LandingSize]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_Inspection]'))
ALTER TABLE [dbo].[GFM_DieSets_Inspection]  WITH CHECK ADD  CONSTRAINT [FK_GFM_DieSets_Inspection_GFM_DieSets_LandingSize] FOREIGN KEY([LandingID])
REFERENCES [dbo].[GFM_DieSets_LandingSize] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_Inspection_GFM_DieSets_LandingSize]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_Inspection]'))
ALTER TABLE [dbo].[GFM_DieSets_Inspection] CHECK CONSTRAINT [FK_GFM_DieSets_Inspection_GFM_DieSets_LandingSize]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_Inspection_Employees_GFM_DieSets_Inspection]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_Inspection_Employees]'))
ALTER TABLE [dbo].[GFM_DieSets_Inspection_Employees]  WITH CHECK ADD  CONSTRAINT [FK_GFM_DieSets_Inspection_Employees_GFM_DieSets_Inspection] FOREIGN KEY([InspectionId])
REFERENCES [dbo].[GFM_DieSets_Inspection] ([ID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_Inspection_Employees_GFM_DieSets_Inspection]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_Inspection_Employees]'))
ALTER TABLE [dbo].[GFM_DieSets_Inspection_Employees] CHECK CONSTRAINT [FK_GFM_DieSets_Inspection_Employees_GFM_DieSets_Inspection]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_LandingSize_GFM_DieSets]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_LandingSize]'))
ALTER TABLE [dbo].[GFM_DieSets_LandingSize]  WITH CHECK ADD  CONSTRAINT [FK_GFM_DieSets_LandingSize_GFM_DieSets] FOREIGN KEY([DieID])
REFERENCES [dbo].[GFM_DieSets] ([DieID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_LandingSize_GFM_DieSets]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_LandingSize]'))
ALTER TABLE [dbo].[GFM_DieSets_LandingSize] CHECK CONSTRAINT [FK_GFM_DieSets_LandingSize_GFM_DieSets]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSet_Machine_Type_Map_GFM_DieSets]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_Machine_Type_Map]'))
ALTER TABLE [dbo].[GFM_DieSets_Machine_Type_Map]  WITH CHECK ADD  CONSTRAINT [FK_GFM_DieSet_Machine_Type_Map_GFM_DieSets] FOREIGN KEY([DieID])
REFERENCES [dbo].[GFM_DieSets] ([DieID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSet_Machine_Type_Map_GFM_DieSets]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_Machine_Type_Map]'))
ALTER TABLE [dbo].[GFM_DieSets_Machine_Type_Map] CHECK CONSTRAINT [FK_GFM_DieSet_Machine_Type_Map_GFM_DieSets]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSet_Machine_Type_Map_GFM_Machines_Type_Map]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_Machine_Type_Map]'))
ALTER TABLE [dbo].[GFM_DieSets_Machine_Type_Map]  WITH CHECK ADD  CONSTRAINT [FK_GFM_DieSet_Machine_Type_Map_GFM_Machines_Type_Map] FOREIGN KEY([MTypeId])
REFERENCES [dbo].[GFM_Machines_Type_Map] ([MTMapID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSet_Machine_Type_Map_GFM_Machines_Type_Map]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_Machine_Type_Map]'))
ALTER TABLE [dbo].[GFM_DieSets_Machine_Type_Map] CHECK CONSTRAINT [FK_GFM_DieSet_Machine_Type_Map_GFM_Machines_Type_Map]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_Repair_GFM_DieSets]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_Repair]'))
ALTER TABLE [dbo].[GFM_DieSets_Repair]  WITH CHECK ADD  CONSTRAINT [FK_GFM_DieSets_Repair_GFM_DieSets] FOREIGN KEY([DieID])
REFERENCES [dbo].[GFM_DieSets] ([DieID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_Repair_GFM_DieSets]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_Repair]'))
ALTER TABLE [dbo].[GFM_DieSets_Repair] CHECK CONSTRAINT [FK_GFM_DieSets_Repair_GFM_DieSets]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_Repair_GFM_DieSets_Height]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_Repair]'))
ALTER TABLE [dbo].[GFM_DieSets_Repair]  WITH CHECK ADD  CONSTRAINT [FK_GFM_DieSets_Repair_GFM_DieSets_Height] FOREIGN KEY([DieHeight])
REFERENCES [dbo].[GFM_DieSets_Height] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_Repair_GFM_DieSets_Height]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_Repair]'))
ALTER TABLE [dbo].[GFM_DieSets_Repair] CHECK CONSTRAINT [FK_GFM_DieSets_Repair_GFM_DieSets_Height]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_Repair_GFM_DieSets_LandingSize]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_Repair]'))
ALTER TABLE [dbo].[GFM_DieSets_Repair]  WITH CHECK ADD  CONSTRAINT [FK_GFM_DieSets_Repair_GFM_DieSets_LandingSize] FOREIGN KEY([LandingSize])
REFERENCES [dbo].[GFM_DieSets_LandingSize] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_Repair_GFM_DieSets_LandingSize]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_Repair]'))
ALTER TABLE [dbo].[GFM_DieSets_Repair] CHECK CONSTRAINT [FK_GFM_DieSets_Repair_GFM_DieSets_LandingSize]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_RunTimeLogs_GFM_DieSets]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_RunTimeLogs]'))
ALTER TABLE [dbo].[GFM_DieSets_RunTimeLogs]  WITH CHECK ADD  CONSTRAINT [FK_GFM_DieSets_RunTimeLogs_GFM_DieSets] FOREIGN KEY([DieID])
REFERENCES [dbo].[GFM_DieSets] ([DieID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_RunTimeLogs_GFM_DieSets]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_RunTimeLogs]'))
ALTER TABLE [dbo].[GFM_DieSets_RunTimeLogs] CHECK CONSTRAINT [FK_GFM_DieSets_RunTimeLogs_GFM_DieSets]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_RunTimeLogs_GFM_DieSets_Condition]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_RunTimeLogs]'))
ALTER TABLE [dbo].[GFM_DieSets_RunTimeLogs]  WITH CHECK ADD  CONSTRAINT [FK_GFM_DieSets_RunTimeLogs_GFM_DieSets_Condition] FOREIGN KEY([StartingCondition])
REFERENCES [dbo].[GFM_DieSets_Condition] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_RunTimeLogs_GFM_DieSets_Condition]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_RunTimeLogs]'))
ALTER TABLE [dbo].[GFM_DieSets_RunTimeLogs] CHECK CONSTRAINT [FK_GFM_DieSets_RunTimeLogs_GFM_DieSets_Condition]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_RunTimeLogs_GFM_DieSets_Condition1]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_RunTimeLogs]'))
ALTER TABLE [dbo].[GFM_DieSets_RunTimeLogs]  WITH CHECK ADD  CONSTRAINT [FK_GFM_DieSets_RunTimeLogs_GFM_DieSets_Condition1] FOREIGN KEY([EndingCondition])
REFERENCES [dbo].[GFM_DieSets_Condition] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_RunTimeLogs_GFM_DieSets_Condition1]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_RunTimeLogs]'))
ALTER TABLE [dbo].[GFM_DieSets_RunTimeLogs] CHECK CONSTRAINT [FK_GFM_DieSets_RunTimeLogs_GFM_DieSets_Condition1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_RunTimeLogs_GFM_DieSets_Types]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_RunTimeLogs]'))
ALTER TABLE [dbo].[GFM_DieSets_RunTimeLogs]  WITH CHECK ADD  CONSTRAINT [FK_GFM_DieSets_RunTimeLogs_GFM_DieSets_Types] FOREIGN KEY([Type])
REFERENCES [dbo].[GFM_DieSets_Types] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_RunTimeLogs_GFM_DieSets_Types]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_RunTimeLogs]'))
ALTER TABLE [dbo].[GFM_DieSets_RunTimeLogs] CHECK CONSTRAINT [FK_GFM_DieSets_RunTimeLogs_GFM_DieSets_Types]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_RunTimeLogs_GFM_DieSets_WorkLevel]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_RunTimeLogs]'))
ALTER TABLE [dbo].[GFM_DieSets_RunTimeLogs]  WITH CHECK ADD  CONSTRAINT [FK_GFM_DieSets_RunTimeLogs_GFM_DieSets_WorkLevel] FOREIGN KEY([WorkLevel])
REFERENCES [dbo].[GFM_DieSets_WorkLevel] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_RunTimeLogs_GFM_DieSets_WorkLevel]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_RunTimeLogs]'))
ALTER TABLE [dbo].[GFM_DieSets_RunTimeLogs] CHECK CONSTRAINT [FK_GFM_DieSets_RunTimeLogs_GFM_DieSets_WorkLevel]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_RunTimeLogs_OT]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_RunTimeLogs]'))
ALTER TABLE [dbo].[GFM_DieSets_RunTimeLogs]  WITH CHECK ADD  CONSTRAINT [FK_GFM_DieSets_RunTimeLogs_OT] FOREIGN KEY([OTTrackID])
REFERENCES [dbo].[OT] ([TrackID])
ON DELETE SET NULL
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_RunTimeLogs_OT]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_RunTimeLogs]'))
ALTER TABLE [dbo].[GFM_DieSets_RunTimeLogs] CHECK CONSTRAINT [FK_GFM_DieSets_RunTimeLogs_OT]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_RunTimeLogs_OT_Times]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_RunTimeLogs]'))
ALTER TABLE [dbo].[GFM_DieSets_RunTimeLogs]  WITH CHECK ADD  CONSTRAINT [FK_GFM_DieSets_RunTimeLogs_OT_Times] FOREIGN KEY([OTTimeID])
REFERENCES [dbo].[OT_Times] ([TimeId])
ON DELETE SET NULL
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_DieSets_RunTimeLogs_OT_Times]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_DieSets_RunTimeLogs]'))
ALTER TABLE [dbo].[GFM_DieSets_RunTimeLogs] CHECK CONSTRAINT [FK_GFM_DieSets_RunTimeLogs_OT_Times]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_Machines_Type_Map_GFM_DieSets_Types]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_Machines_Type_Map]'))
ALTER TABLE [dbo].[GFM_Machines_Type_Map]  WITH CHECK ADD  CONSTRAINT [FK_GFM_Machines_Type_Map_GFM_DieSets_Types] FOREIGN KEY([GFM_DieSets_TypeId])
REFERENCES [dbo].[GFM_DieSets_Types] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_Machines_Type_Map_GFM_DieSets_Types]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_Machines_Type_Map]'))
ALTER TABLE [dbo].[GFM_Machines_Type_Map] CHECK CONSTRAINT [FK_GFM_Machines_Type_Map_GFM_DieSets_Types]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_Machines_Type_Map_GFM_Machines]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_Machines_Type_Map]'))
ALTER TABLE [dbo].[GFM_Machines_Type_Map]  WITH CHECK ADD  CONSTRAINT [FK_GFM_Machines_Type_Map_GFM_Machines] FOREIGN KEY([GFMId])
REFERENCES [dbo].[GFM_Machines] ([GFMId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFM_Machines_Type_Map_GFM_Machines]') AND parent_object_id = OBJECT_ID(N'[dbo].[GFM_Machines_Type_Map]'))
ALTER TABLE [dbo].[GFM_Machines_Type_Map] CHECK CONSTRAINT [FK_GFM_Machines_Type_Map_GFM_Machines]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Draw_log_ID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Log_Charts]'))
ALTER TABLE [dbo].[Log_Charts]  WITH CHECK ADD  CONSTRAINT [FK_Draw_log_ID] FOREIGN KEY([Draw_log_ID])
REFERENCES [dbo].[Draw_log] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Draw_log_ID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Log_Charts]'))
ALTER TABLE [dbo].[Log_Charts] CHECK CONSTRAINT [FK_Draw_log_ID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFMlog_ID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Log_Charts]'))
ALTER TABLE [dbo].[Log_Charts]  WITH CHECK ADD  CONSTRAINT [FK_GFMlog_ID] FOREIGN KEY([GFMlog_ID])
REFERENCES [dbo].[GFMlog] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GFMlog_ID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Log_Charts]'))
ALTER TABLE [dbo].[Log_Charts] CHECK CONSTRAINT [FK_GFMlog_ID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LakeErie_log_ID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Log_Charts]'))
ALTER TABLE [dbo].[Log_Charts]  WITH CHECK ADD  CONSTRAINT [FK_LakeErie_log_ID] FOREIGN KEY([LakeErie_log_ID])
REFERENCES [dbo].[LakeErie_log] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LakeErie_log_ID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Log_Charts]'))
ALTER TABLE [dbo].[Log_Charts] CHECK CONSTRAINT [FK_LakeErie_log_ID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Roll_log_ID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Log_Charts]'))
ALTER TABLE [dbo].[Log_Charts]  WITH CHECK ADD  CONSTRAINT [FK_Roll_log_ID] FOREIGN KEY([Roll_log_ID])
REFERENCES [dbo].[Roll_log] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Roll_log_ID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Log_Charts]'))
ALTER TABLE [dbo].[Log_Charts] CHECK CONSTRAINT [FK_Roll_log_ID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Swage_Log_ID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Log_Charts]'))
ALTER TABLE [dbo].[Log_Charts]  WITH CHECK ADD  CONSTRAINT [FK_Swage_Log_ID] FOREIGN KEY([Swage_Log_ID])
REFERENCES [dbo].[Swage_Log] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Swage_Log_ID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Log_Charts]'))
ALTER TABLE [dbo].[Log_Charts] CHECK CONSTRAINT [FK_Swage_Log_ID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Wire_log_ID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Log_Charts]'))
ALTER TABLE [dbo].[Log_Charts]  WITH CHECK ADD  CONSTRAINT [FK_Wire_log_ID] FOREIGN KEY([Wire_log_ID])
REFERENCES [dbo].[Wire_log] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Wire_log_ID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Log_Charts]'))
ALTER TABLE [dbo].[Log_Charts] CHECK CONSTRAINT [FK_Wire_log_ID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WO_Detail]') AND parent_object_id = OBJECT_ID(N'[dbo].[Log_Charts]'))
ALTER TABLE [dbo].[Log_Charts]  WITH CHECK ADD  CONSTRAINT [FK_WO_Detail] FOREIGN KEY([WO_Detail])
REFERENCES [dbo].[WorkOrder_Detail] ([WO_Detail])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WO_Detail]') AND parent_object_id = OBJECT_ID(N'[dbo].[Log_Charts]'))
ALTER TABLE [dbo].[Log_Charts] CHECK CONSTRAINT [FK_WO_Detail]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OT_OT_Job]') AND parent_object_id = OBJECT_ID(N'[dbo].[OT]'))
ALTER TABLE [dbo].[OT]  WITH CHECK ADD  CONSTRAINT [FK_OT_OT_Job] FOREIGN KEY([JobID])
REFERENCES [dbo].[OT_Job] ([JobId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OT_OT_Job]') AND parent_object_id = OBJECT_ID(N'[dbo].[OT]'))
ALTER TABLE [dbo].[OT] CHECK CONSTRAINT [FK_OT_OT_Job]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OT_OT_OrderType]') AND parent_object_id = OBJECT_ID(N'[dbo].[OT]'))
ALTER TABLE [dbo].[OT]  WITH CHECK ADD  CONSTRAINT [FK_OT_OT_OrderType] FOREIGN KEY([OrderTypeID])
REFERENCES [dbo].[OT_OrderType] ([OrderTypeId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OT_OT_OrderType]') AND parent_object_id = OBJECT_ID(N'[dbo].[OT]'))
ALTER TABLE [dbo].[OT] CHECK CONSTRAINT [FK_OT_OT_OrderType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OT_Job_OT_Job_Class]') AND parent_object_id = OBJECT_ID(N'[dbo].[OT_Job]'))
ALTER TABLE [dbo].[OT_Job]  WITH CHECK ADD  CONSTRAINT [FK_OT_Job_OT_Job_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[OT_Job_Class] ([ClassId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OT_Job_OT_Job_Class]') AND parent_object_id = OBJECT_ID(N'[dbo].[OT_Job]'))
ALTER TABLE [dbo].[OT_Job] CHECK CONSTRAINT [FK_OT_Job_OT_Job_Class]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OT_Job_OT_Job_Sched]') AND parent_object_id = OBJECT_ID(N'[dbo].[OT_Job]'))
ALTER TABLE [dbo].[OT_Job]  WITH CHECK ADD  CONSTRAINT [FK_OT_Job_OT_Job_Sched] FOREIGN KEY([Sched_Type])
REFERENCES [dbo].[OT_Job_Sched] ([Sched_Type])
ON DELETE SET NULL
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OT_Job_OT_Job_Sched]') AND parent_object_id = OBJECT_ID(N'[dbo].[OT_Job]'))
ALTER TABLE [dbo].[OT_Job] CHECK CONSTRAINT [FK_OT_Job_OT_Job_Sched]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OT_Times_OT]') AND parent_object_id = OBJECT_ID(N'[dbo].[OT_Times]'))
ALTER TABLE [dbo].[OT_Times]  WITH CHECK ADD  CONSTRAINT [FK_OT_Times_OT] FOREIGN KEY([TrackId])
REFERENCES [dbo].[OT] ([TrackID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OT_Times_OT]') AND parent_object_id = OBJECT_ID(N'[dbo].[OT_Times]'))
ALTER TABLE [dbo].[OT_Times] CHECK CONSTRAINT [FK_OT_Times_OT]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OT_Times_OT_Times_Status]') AND parent_object_id = OBJECT_ID(N'[dbo].[OT_Times]'))
ALTER TABLE [dbo].[OT_Times]  WITH CHECK ADD  CONSTRAINT [FK_OT_Times_OT_Times_Status] FOREIGN KEY([Start_StatusId])
REFERENCES [dbo].[OT_Times_Status] ([StatusId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OT_Times_OT_Times_Status]') AND parent_object_id = OBJECT_ID(N'[dbo].[OT_Times]'))
ALTER TABLE [dbo].[OT_Times] CHECK CONSTRAINT [FK_OT_Times_OT_Times_Status]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OT_Times_OT_Times_Status1]') AND parent_object_id = OBJECT_ID(N'[dbo].[OT_Times]'))
ALTER TABLE [dbo].[OT_Times]  WITH CHECK ADD  CONSTRAINT [FK_OT_Times_OT_Times_Status1] FOREIGN KEY([Stop_StatusId])
REFERENCES [dbo].[OT_Times_Status] ([StatusId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OT_Times_OT_Times_Status1]') AND parent_object_id = OBJECT_ID(N'[dbo].[OT_Times]'))
ALTER TABLE [dbo].[OT_Times] CHECK CONSTRAINT [FK_OT_Times_OT_Times_Status1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OT_Times_Employees_OT]') AND parent_object_id = OBJECT_ID(N'[dbo].[OT_Times_Employees]'))
ALTER TABLE [dbo].[OT_Times_Employees]  WITH CHECK ADD  CONSTRAINT [FK_OT_Times_Employees_OT] FOREIGN KEY([TrackId])
REFERENCES [dbo].[OT] ([TrackID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OT_Times_Employees_OT]') AND parent_object_id = OBJECT_ID(N'[dbo].[OT_Times_Employees]'))
ALTER TABLE [dbo].[OT_Times_Employees] CHECK CONSTRAINT [FK_OT_Times_Employees_OT]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OT_Times_Employees_OT_Times]') AND parent_object_id = OBJECT_ID(N'[dbo].[OT_Times_Employees]'))
ALTER TABLE [dbo].[OT_Times_Employees]  WITH CHECK ADD  CONSTRAINT [FK_OT_Times_Employees_OT_Times] FOREIGN KEY([TimeId])
REFERENCES [dbo].[OT_Times] ([TimeId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OT_Times_Employees_OT_Times]') AND parent_object_id = OBJECT_ID(N'[dbo].[OT_Times_Employees]'))
ALTER TABLE [dbo].[OT_Times_Employees] CHECK CONSTRAINT [FK_OT_Times_Employees_OT_Times]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OT_Total_OT]') AND parent_object_id = OBJECT_ID(N'[dbo].[OT_Total]'))
ALTER TABLE [dbo].[OT_Total]  WITH CHECK ADD  CONSTRAINT [FK_OT_Total_OT] FOREIGN KEY([TrackId])
REFERENCES [dbo].[OT] ([TrackID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OT_Total_OT]') AND parent_object_id = OBJECT_ID(N'[dbo].[OT_Total]'))
ALTER TABLE [dbo].[OT_Total] CHECK CONSTRAINT [FK_OT_Total_OT]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OT_Total_OT_Times_Status]') AND parent_object_id = OBJECT_ID(N'[dbo].[OT_Total]'))
ALTER TABLE [dbo].[OT_Total]  WITH CHECK ADD  CONSTRAINT [FK_OT_Total_OT_Times_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[OT_Times_Status] ([StatusId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OT_Total_OT_Times_Status]') AND parent_object_id = OBJECT_ID(N'[dbo].[OT_Total]'))
ALTER TABLE [dbo].[OT_Total] CHECK CONSTRAINT [FK_OT_Total_OT_Times_Status]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PackingSlip_PackingSlip_No1]') AND parent_object_id = OBJECT_ID(N'[dbo].[PackingSlip]'))
ALTER TABLE [dbo].[PackingSlip]  WITH NOCHECK ADD  CONSTRAINT [FK_PackingSlip_PackingSlip_No1] FOREIGN KEY([Packingsli])
REFERENCES [dbo].[PackingSlip_No] ([packingsli])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PackingSlip_PackingSlip_No1]') AND parent_object_id = OBJECT_ID(N'[dbo].[PackingSlip]'))
ALTER TABLE [dbo].[PackingSlip] NOCHECK CONSTRAINT [FK_PackingSlip_PackingSlip_No1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PO_ProcessNotes_PO_ProcessNotes]') AND parent_object_id = OBJECT_ID(N'[dbo].[PO_ProcessNotes]'))
ALTER TABLE [dbo].[PO_ProcessNotes]  WITH CHECK ADD  CONSTRAINT [FK_PO_ProcessNotes_PO_ProcessNotes] FOREIGN KEY([POitem])
REFERENCES [dbo].[PurchaseOrder] ([POitem])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PO_ProcessNotes_PO_ProcessNotes]') AND parent_object_id = OBJECT_ID(N'[dbo].[PO_ProcessNotes]'))
ALTER TABLE [dbo].[PO_ProcessNotes] CHECK CONSTRAINT [FK_PO_ProcessNotes_PO_ProcessNotes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_CP_Action_Disposition_Type_QA_CP_Action]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_CP_Action_Disposition_Type]'))
ALTER TABLE [dbo].[QA_CP_Action_Disposition_Type]  WITH CHECK ADD  CONSTRAINT [FK_QA_CP_Action_Disposition_Type_QA_CP_Action] FOREIGN KEY([ActionID])
REFERENCES [dbo].[QA_CP_Action] ([ActionID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_CP_Action_Disposition_Type_QA_CP_Action]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_CP_Action_Disposition_Type]'))
ALTER TABLE [dbo].[QA_CP_Action_Disposition_Type] CHECK CONSTRAINT [FK_QA_CP_Action_Disposition_Type_QA_CP_Action]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_CP_Action_Disposition_Type_QA_Disposition_Types]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_CP_Action_Disposition_Type]'))
ALTER TABLE [dbo].[QA_CP_Action_Disposition_Type]  WITH CHECK ADD  CONSTRAINT [FK_QA_CP_Action_Disposition_Type_QA_Disposition_Types] FOREIGN KEY([DispositionID])
REFERENCES [dbo].[QA_Disposition_Types] ([DispositionID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_CP_Action_Disposition_Type_QA_Disposition_Types]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_CP_Action_Disposition_Type]'))
ALTER TABLE [dbo].[QA_CP_Action_Disposition_Type] CHECK CONSTRAINT [FK_QA_CP_Action_Disposition_Type_QA_Disposition_Types]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_CP_Action_PO_Items_PurchaseOrder]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_CP_Action_PO_Items]'))
ALTER TABLE [dbo].[QA_CP_Action_PO_Items]  WITH CHECK ADD  CONSTRAINT [FK_QA_CP_Action_PO_Items_PurchaseOrder] FOREIGN KEY([POItem])
REFERENCES [dbo].[PurchaseOrder] ([POitem])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_CP_Action_PO_Items_PurchaseOrder]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_CP_Action_PO_Items]'))
ALTER TABLE [dbo].[QA_CP_Action_PO_Items] CHECK CONSTRAINT [FK_QA_CP_Action_PO_Items_PurchaseOrder]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_CP_Action_PO_Items_QA_CP_Action]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_CP_Action_PO_Items]'))
ALTER TABLE [dbo].[QA_CP_Action_PO_Items]  WITH CHECK ADD  CONSTRAINT [FK_QA_CP_Action_PO_Items_QA_CP_Action] FOREIGN KEY([ActionID])
REFERENCES [dbo].[QA_CP_Action] ([ActionID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_CP_Action_PO_Items_QA_CP_Action]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_CP_Action_PO_Items]'))
ALTER TABLE [dbo].[QA_CP_Action_PO_Items] CHECK CONSTRAINT [FK_QA_CP_Action_PO_Items_QA_CP_Action]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_CP_Action_Prevention_Type_QA_CP_Action]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_CP_Action_Prevention_Type]'))
ALTER TABLE [dbo].[QA_CP_Action_Prevention_Type]  WITH CHECK ADD  CONSTRAINT [FK_QA_CP_Action_Prevention_Type_QA_CP_Action] FOREIGN KEY([ActionID])
REFERENCES [dbo].[QA_CP_Action] ([ActionID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_CP_Action_Prevention_Type_QA_CP_Action]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_CP_Action_Prevention_Type]'))
ALTER TABLE [dbo].[QA_CP_Action_Prevention_Type] CHECK CONSTRAINT [FK_QA_CP_Action_Prevention_Type_QA_CP_Action]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_CP_Action_Prevention_Type_QA_Prevention_Types]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_CP_Action_Prevention_Type]'))
ALTER TABLE [dbo].[QA_CP_Action_Prevention_Type]  WITH CHECK ADD  CONSTRAINT [FK_QA_CP_Action_Prevention_Type_QA_Prevention_Types] FOREIGN KEY([PreventionID])
REFERENCES [dbo].[QA_Prevention_Types] ([PreventionID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_CP_Action_Prevention_Type_QA_Prevention_Types]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_CP_Action_Prevention_Type]'))
ALTER TABLE [dbo].[QA_CP_Action_Prevention_Type] CHECK CONSTRAINT [FK_QA_CP_Action_Prevention_Type_QA_Prevention_Types]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_CP_Action_Reporting_Source_QA_CP_Action]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_CP_Action_Reporting_Source]'))
ALTER TABLE [dbo].[QA_CP_Action_Reporting_Source]  WITH CHECK ADD  CONSTRAINT [FK_QA_CP_Action_Reporting_Source_QA_CP_Action] FOREIGN KEY([ActionID])
REFERENCES [dbo].[QA_CP_Action] ([ActionID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_CP_Action_Reporting_Source_QA_CP_Action]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_CP_Action_Reporting_Source]'))
ALTER TABLE [dbo].[QA_CP_Action_Reporting_Source] CHECK CONSTRAINT [FK_QA_CP_Action_Reporting_Source_QA_CP_Action]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_CP_Action_Reporting_Source_QA_Reporting_Source]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_CP_Action_Reporting_Source]'))
ALTER TABLE [dbo].[QA_CP_Action_Reporting_Source]  WITH CHECK ADD  CONSTRAINT [FK_QA_CP_Action_Reporting_Source_QA_Reporting_Source] FOREIGN KEY([ReportingSourceID])
REFERENCES [dbo].[QA_Reporting_Source] ([ReportingSourceID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_CP_Action_Reporting_Source_QA_Reporting_Source]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_CP_Action_Reporting_Source]'))
ALTER TABLE [dbo].[QA_CP_Action_Reporting_Source] CHECK CONSTRAINT [FK_QA_CP_Action_Reporting_Source_QA_Reporting_Source]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_CP_Action_RootCause_Source_QA_CP_Action]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_CP_Action_RootCauseSource_OrgDept]'))
ALTER TABLE [dbo].[QA_CP_Action_RootCauseSource_OrgDept]  WITH CHECK ADD  CONSTRAINT [FK_QA_CP_Action_RootCause_Source_QA_CP_Action] FOREIGN KEY([ActionID])
REFERENCES [dbo].[QA_CP_Action] ([ActionID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_CP_Action_RootCause_Source_QA_CP_Action]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_CP_Action_RootCauseSource_OrgDept]'))
ALTER TABLE [dbo].[QA_CP_Action_RootCauseSource_OrgDept] CHECK CONSTRAINT [FK_QA_CP_Action_RootCause_Source_QA_CP_Action]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_CP_Action_RootCause_Source_QA_RootCause_Source]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_CP_Action_RootCauseSource_OrgDept]'))
ALTER TABLE [dbo].[QA_CP_Action_RootCauseSource_OrgDept]  WITH CHECK ADD  CONSTRAINT [FK_QA_CP_Action_RootCause_Source_QA_RootCause_Source] FOREIGN KEY([RootCauseID])
REFERENCES [dbo].[QA_RootCause_Source] ([RootCauseID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_CP_Action_RootCause_Source_QA_RootCause_Source]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_CP_Action_RootCauseSource_OrgDept]'))
ALTER TABLE [dbo].[QA_CP_Action_RootCauseSource_OrgDept] CHECK CONSTRAINT [FK_QA_CP_Action_RootCause_Source_QA_RootCause_Source]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_CP_Action_RootCauseSource_OrgDept_QA_Org_Dept]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_CP_Action_RootCauseSource_OrgDept]'))
ALTER TABLE [dbo].[QA_CP_Action_RootCauseSource_OrgDept]  WITH CHECK ADD  CONSTRAINT [FK_QA_CP_Action_RootCauseSource_OrgDept_QA_Org_Dept] FOREIGN KEY([DeptID])
REFERENCES [dbo].[QA_Org_Dept] ([DeptID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_CP_Action_RootCauseSource_OrgDept_QA_Org_Dept]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_CP_Action_RootCauseSource_OrgDept]'))
ALTER TABLE [dbo].[QA_CP_Action_RootCauseSource_OrgDept] CHECK CONSTRAINT [FK_QA_CP_Action_RootCauseSource_OrgDept_QA_Org_Dept]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_CP_Action_SO_Items_QA_CP_Action]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_CP_Action_SO_Items]'))
ALTER TABLE [dbo].[QA_CP_Action_SO_Items]  WITH CHECK ADD  CONSTRAINT [FK_QA_CP_Action_SO_Items_QA_CP_Action] FOREIGN KEY([ActionID])
REFERENCES [dbo].[QA_CP_Action] ([ActionID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_CP_Action_SO_Items_QA_CP_Action]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_CP_Action_SO_Items]'))
ALTER TABLE [dbo].[QA_CP_Action_SO_Items] CHECK CONSTRAINT [FK_QA_CP_Action_SO_Items_QA_CP_Action]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_CP_Action_SO_Items_Sales]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_CP_Action_SO_Items]'))
ALTER TABLE [dbo].[QA_CP_Action_SO_Items]  WITH CHECK ADD  CONSTRAINT [FK_QA_CP_Action_SO_Items_Sales] FOREIGN KEY([SOItem])
REFERENCES [dbo].[Sales] ([SOitem])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_CP_Action_SO_Items_Sales]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_CP_Action_SO_Items]'))
ALTER TABLE [dbo].[QA_CP_Action_SO_Items] CHECK CONSTRAINT [FK_QA_CP_Action_SO_Items_Sales]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_Inspection_Statistical_Sampling_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_Inspection_Statistical_Sampling]'))
ALTER TABLE [dbo].[QA_Inspection_Statistical_Sampling]  WITH CHECK ADD  CONSTRAINT [FK_QA_Inspection_Statistical_Sampling_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_Inspection_Statistical_Sampling_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_Inspection_Statistical_Sampling]'))
ALTER TABLE [dbo].[QA_Inspection_Statistical_Sampling] CHECK CONSTRAINT [FK_QA_Inspection_Statistical_Sampling_Employee]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_Inspection_Statistical_Sampling_Sales]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_Inspection_Statistical_Sampling]'))
ALTER TABLE [dbo].[QA_Inspection_Statistical_Sampling]  WITH CHECK ADD  CONSTRAINT [FK_QA_Inspection_Statistical_Sampling_Sales] FOREIGN KEY([SOItem])
REFERENCES [dbo].[Sales] ([SOitem])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_Inspection_Statistical_Sampling_Sales]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_Inspection_Statistical_Sampling]'))
ALTER TABLE [dbo].[QA_Inspection_Statistical_Sampling] CHECK CONSTRAINT [FK_QA_Inspection_Statistical_Sampling_Sales]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_Management_Review_Employee_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_Management_Review_Employee]'))
ALTER TABLE [dbo].[QA_Management_Review_Employee]  WITH CHECK ADD  CONSTRAINT [FK_QA_Management_Review_Employee_Employee] FOREIGN KEY([EmpID])
REFERENCES [dbo].[Employee] ([ID])
ON UPDATE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_Management_Review_Employee_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_Management_Review_Employee]'))
ALTER TABLE [dbo].[QA_Management_Review_Employee] CHECK CONSTRAINT [FK_QA_Management_Review_Employee_Employee]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_Management_Review_Employee_QA_Management_Review]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_Management_Review_Employee]'))
ALTER TABLE [dbo].[QA_Management_Review_Employee]  WITH CHECK ADD  CONSTRAINT [FK_QA_Management_Review_Employee_QA_Management_Review] FOREIGN KEY([QA_MR_ID])
REFERENCES [dbo].[QA_Management_Review] ([QA_MR_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_Management_Review_Employee_QA_Management_Review]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_Management_Review_Employee]'))
ALTER TABLE [dbo].[QA_Management_Review_Employee] CHECK CONSTRAINT [FK_QA_Management_Review_Employee_QA_Management_Review]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_Management_Review_Process_QA_Management_Review]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_Management_Review_Process]'))
ALTER TABLE [dbo].[QA_Management_Review_Process]  WITH CHECK ADD  CONSTRAINT [FK_QA_Management_Review_Process_QA_Management_Review] FOREIGN KEY([QA_MR_ID])
REFERENCES [dbo].[QA_Management_Review] ([QA_MR_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_Management_Review_Process_QA_Management_Review]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_Management_Review_Process]'))
ALTER TABLE [dbo].[QA_Management_Review_Process] CHECK CONSTRAINT [FK_QA_Management_Review_Process_QA_Management_Review]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_Management_Review_Process_QA_Process]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_Management_Review_Process]'))
ALTER TABLE [dbo].[QA_Management_Review_Process]  WITH CHECK ADD  CONSTRAINT [FK_QA_Management_Review_Process_QA_Process] FOREIGN KEY([QA_ProcessID])
REFERENCES [dbo].[QA_Process] ([QA_ProcessID])
ON UPDATE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_Management_Review_Process_QA_Process]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_Management_Review_Process]'))
ALTER TABLE [dbo].[QA_Management_Review_Process] CHECK CONSTRAINT [FK_QA_Management_Review_Process_QA_Process]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_Packaging_Shipping_SOItem_QA_Packaging_Shipping]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_Packaging_Shipping_SOItem]'))
ALTER TABLE [dbo].[QA_Packaging_Shipping_SOItem]  WITH CHECK ADD  CONSTRAINT [FK_QA_Packaging_Shipping_SOItem_QA_Packaging_Shipping] FOREIGN KEY([QA_PS_ID])
REFERENCES [dbo].[QA_Packaging_Shipping] ([QA_PS_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_Packaging_Shipping_SOItem_QA_Packaging_Shipping]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_Packaging_Shipping_SOItem]'))
ALTER TABLE [dbo].[QA_Packaging_Shipping_SOItem] CHECK CONSTRAINT [FK_QA_Packaging_Shipping_SOItem_QA_Packaging_Shipping]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_Packaging_Shipping_SOItem_Sales]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_Packaging_Shipping_SOItem]'))
ALTER TABLE [dbo].[QA_Packaging_Shipping_SOItem]  WITH CHECK ADD  CONSTRAINT [FK_QA_Packaging_Shipping_SOItem_Sales] FOREIGN KEY([soitem])
REFERENCES [dbo].[Sales] ([SOitem])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_Packaging_Shipping_SOItem_Sales]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_Packaging_Shipping_SOItem]'))
ALTER TABLE [dbo].[QA_Packaging_Shipping_SOItem] CHECK CONSTRAINT [FK_QA_Packaging_Shipping_SOItem_Sales]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_ProcessHistory_QA_Process]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_ProcessHistory]'))
ALTER TABLE [dbo].[QA_ProcessHistory]  WITH CHECK ADD  CONSTRAINT [FK_QA_ProcessHistory_QA_Process] FOREIGN KEY([QA_ProcessHistory_Process])
REFERENCES [dbo].[QA_Process] ([QA_ProcessID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QA_ProcessHistory_QA_Process]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_ProcessHistory]'))
ALTER TABLE [dbo].[QA_ProcessHistory] CHECK CONSTRAINT [FK_QA_ProcessHistory_QA_Process]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Quote_Services_allquotes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Quote_Services]'))
ALTER TABLE [dbo].[Quote_Services]  WITH CHECK ADD  CONSTRAINT [FK_Quote_Services_allquotes] FOREIGN KEY([Quote_ID])
REFERENCES [dbo].[AllQuotes] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Quote_Services_allquotes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Quote_Services]'))
ALTER TABLE [dbo].[Quote_Services] CHECK CONSTRAINT [FK_Quote_Services_allquotes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderDetail_Order]') AND parent_object_id = OBJECT_ID(N'[dbo].[Quotes_PMI]'))
ALTER TABLE [dbo].[Quotes_PMI]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([AQ_ID_Curr])
REFERENCES [dbo].[AllQuotes] ([ID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderDetail_Order]') AND parent_object_id = OBJECT_ID(N'[dbo].[Quotes_PMI]'))
ALTER TABLE [dbo].[Quotes_PMI] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_rtr_Detail_rtr]') AND parent_object_id = OBJECT_ID(N'[dbo].[rtr_Detail]'))
ALTER TABLE [dbo].[rtr_Detail]  WITH CHECK ADD  CONSTRAINT [FK_rtr_Detail_rtr] FOREIGN KEY([rtr_ID])
REFERENCES [dbo].[rtr] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_rtr_Detail_rtr]') AND parent_object_id = OBJECT_ID(N'[dbo].[rtr_Detail]'))
ALTER TABLE [dbo].[rtr_Detail] CHECK CONSTRAINT [FK_rtr_Detail_rtr]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_rtr_Detail_rtr_Operation]') AND parent_object_id = OBJECT_ID(N'[dbo].[rtr_Detail]'))
ALTER TABLE [dbo].[rtr_Detail]  WITH CHECK ADD  CONSTRAINT [FK_rtr_Detail_rtr_Operation] FOREIGN KEY([Oper_ID])
REFERENCES [dbo].[rtr_Operation] ([Oper_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_rtr_Detail_rtr_Operation]') AND parent_object_id = OBJECT_ID(N'[dbo].[rtr_Detail]'))
ALTER TABLE [dbo].[rtr_Detail] CHECK CONSTRAINT [FK_rtr_Detail_rtr_Operation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_rtr_Machine_rtr_Operation]') AND parent_object_id = OBJECT_ID(N'[dbo].[rtr_Machine]'))
ALTER TABLE [dbo].[rtr_Machine]  WITH CHECK ADD  CONSTRAINT [FK_rtr_Machine_rtr_Operation] FOREIGN KEY([Oper_ID])
REFERENCES [dbo].[rtr_Operation] ([Oper_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_rtr_Machine_rtr_Operation]') AND parent_object_id = OBJECT_ID(N'[dbo].[rtr_Machine]'))
ALTER TABLE [dbo].[rtr_Machine] CHECK CONSTRAINT [FK_rtr_Machine_rtr_Operation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sales_Sales_No]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sales]'))
ALTER TABLE [dbo].[Sales]  WITH NOCHECK ADD  CONSTRAINT [FK_Sales_Sales_No] FOREIGN KEY([SalesNum])
REFERENCES [dbo].[Sales_No] ([salesnum])
NOT FOR REPLICATION 
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sales_Sales_No]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sales]'))
ALTER TABLE [dbo].[Sales] NOCHECK CONSTRAINT [FK_Sales_Sales_No]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sales_Detail_PackingSlip_sales]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sales_Detail_PackingSlip]'))
ALTER TABLE [dbo].[Sales_Detail_PackingSlip]  WITH NOCHECK ADD  CONSTRAINT [FK_Sales_Detail_PackingSlip_sales] FOREIGN KEY([SOitem])
REFERENCES [dbo].[Sales] ([SOitem])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sales_Detail_PackingSlip_sales]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sales_Detail_PackingSlip]'))
ALTER TABLE [dbo].[Sales_Detail_PackingSlip] CHECK CONSTRAINT [FK_Sales_Detail_PackingSlip_sales]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sales_PS_PackingSlip_No]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sales_PS]'))
ALTER TABLE [dbo].[Sales_PS]  WITH NOCHECK ADD  CONSTRAINT [FK_Sales_PS_PackingSlip_No] FOREIGN KEY([PackingSli])
REFERENCES [dbo].[PackingSlip_No] ([packingsli])
NOT FOR REPLICATION 
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sales_PS_PackingSlip_No]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sales_PS]'))
ALTER TABLE [dbo].[Sales_PS] NOCHECK CONSTRAINT [FK_Sales_PS_PackingSlip_No]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sales_PS_sales]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sales_PS]'))
ALTER TABLE [dbo].[Sales_PS]  WITH NOCHECK ADD  CONSTRAINT [FK_Sales_PS_sales] FOREIGN KEY([SOitem])
REFERENCES [dbo].[Sales] ([SOitem])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sales_PS_sales]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sales_PS]'))
ALTER TABLE [dbo].[Sales_PS] CHECK CONSTRAINT [FK_Sales_PS_sales]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Ship_Sales]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ship]'))
ALTER TABLE [dbo].[Ship]  WITH NOCHECK ADD  CONSTRAINT [FK_Ship_Sales] FOREIGN KEY([SOitem])
REFERENCES [dbo].[Sales] ([SOitem])
NOT FOR REPLICATION 
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Ship_Sales]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ship]'))
ALTER TABLE [dbo].[Ship] NOCHECK CONSTRAINT [FK_Ship_Sales]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ShippingList_ShippingList_Holds]') AND parent_object_id = OBJECT_ID(N'[dbo].[ShippingList]'))
ALTER TABLE [dbo].[ShippingList]  WITH CHECK ADD  CONSTRAINT [FK_ShippingList_ShippingList_Holds] FOREIGN KEY([HoldId])
REFERENCES [dbo].[ShippingList_Holds] ([ID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ShippingList_ShippingList_Holds]') AND parent_object_id = OBJECT_ID(N'[dbo].[ShippingList]'))
ALTER TABLE [dbo].[ShippingList] CHECK CONSTRAINT [FK_ShippingList_ShippingList_Holds]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ShippingList_Archive_ShippingList_Holds]') AND parent_object_id = OBJECT_ID(N'[dbo].[ShippingList_Archive]'))
ALTER TABLE [dbo].[ShippingList_Archive]  WITH CHECK ADD  CONSTRAINT [FK_ShippingList_Archive_ShippingList_Holds] FOREIGN KEY([HoldId])
REFERENCES [dbo].[ShippingList_Holds] ([ID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ShippingList_Archive_ShippingList_Holds]') AND parent_object_id = OBJECT_ID(N'[dbo].[ShippingList_Archive]'))
ALTER TABLE [dbo].[ShippingList_Archive] CHECK CONSTRAINT [FK_ShippingList_Archive_ShippingList_Holds]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ShippingList_Items_ShippingList]') AND parent_object_id = OBJECT_ID(N'[dbo].[ShippingList_Items]'))
ALTER TABLE [dbo].[ShippingList_Items]  WITH CHECK ADD  CONSTRAINT [FK_ShippingList_Items_ShippingList] FOREIGN KEY([PackageID])
REFERENCES [dbo].[ShippingList] ([PackageID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ShippingList_Items_ShippingList]') AND parent_object_id = OBJECT_ID(N'[dbo].[ShippingList_Items]'))
ALTER TABLE [dbo].[ShippingList_Items] CHECK CONSTRAINT [FK_ShippingList_Items_ShippingList]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ShippingList_Items_Archive_ShippingList_Archive]') AND parent_object_id = OBJECT_ID(N'[dbo].[ShippingList_Items_Archive]'))
ALTER TABLE [dbo].[ShippingList_Items_Archive]  WITH CHECK ADD  CONSTRAINT [FK_ShippingList_Items_Archive_ShippingList_Archive] FOREIGN KEY([PackageArchiveID])
REFERENCES [dbo].[ShippingList_Archive] ([PackageID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ShippingList_Items_Archive_ShippingList_Archive]') AND parent_object_id = OBJECT_ID(N'[dbo].[ShippingList_Items_Archive]'))
ALTER TABLE [dbo].[ShippingList_Items_Archive] CHECK CONSTRAINT [FK_ShippingList_Items_Archive_ShippingList_Archive]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SO_ProcessNotes_sales-SOitem]') AND parent_object_id = OBJECT_ID(N'[dbo].[SO_ProcessNotes]'))
ALTER TABLE [dbo].[SO_ProcessNotes]  WITH CHECK ADD  CONSTRAINT [FK_SO_ProcessNotes_sales-SOitem] FOREIGN KEY([SOitem])
REFERENCES [dbo].[Sales] ([SOitem])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SO_ProcessNotes_sales-SOitem]') AND parent_object_id = OBJECT_ID(N'[dbo].[SO_ProcessNotes]'))
ALTER TABLE [dbo].[SO_ProcessNotes] CHECK CONSTRAINT [FK_SO_ProcessNotes_sales-SOitem]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SOitem_Hrs_SOitem_Hrs]') AND parent_object_id = OBJECT_ID(N'[dbo].[SOitem_Hrs]'))
ALTER TABLE [dbo].[SOitem_Hrs]  WITH CHECK ADD  CONSTRAINT [FK_SOitem_Hrs_SOitem_Hrs] FOREIGN KEY([SOitem])
REFERENCES [dbo].[SOitem_Hrs] ([SOitem])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SOitem_Hrs_SOitem_Hrs]') AND parent_object_id = OBJECT_ID(N'[dbo].[SOitem_Hrs]'))
ALTER TABLE [dbo].[SOitem_Hrs] CHECK CONSTRAINT [FK_SOitem_Hrs_SOitem_Hrs]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_STAR_Inventory_STAR_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[STAR_Inventory]'))
ALTER TABLE [dbo].[STAR_Inventory]  WITH CHECK ADD  CONSTRAINT [FK_STAR_Inventory_STAR_Locations] FOREIGN KEY([Location])
REFERENCES [dbo].[STAR_Locations] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_STAR_Inventory_STAR_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[STAR_Inventory]'))
ALTER TABLE [dbo].[STAR_Inventory] CHECK CONSTRAINT [FK_STAR_Inventory_STAR_Locations]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_STAR_Inventory_STAR_Tiers]') AND parent_object_id = OBJECT_ID(N'[dbo].[STAR_Inventory]'))
ALTER TABLE [dbo].[STAR_Inventory]  WITH CHECK ADD  CONSTRAINT [FK_STAR_Inventory_STAR_Tiers] FOREIGN KEY([Tier])
REFERENCES [dbo].[STAR_Tiers] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_STAR_Inventory_STAR_Tiers]') AND parent_object_id = OBJECT_ID(N'[dbo].[STAR_Inventory]'))
ALTER TABLE [dbo].[STAR_Inventory] CHECK CONSTRAINT [FK_STAR_Inventory_STAR_Tiers]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_STAR_Inventory_StockChanges_STAR_Inventory]') AND parent_object_id = OBJECT_ID(N'[dbo].[STAR_Inventory_StockChanges]'))
ALTER TABLE [dbo].[STAR_Inventory_StockChanges]  WITH CHECK ADD  CONSTRAINT [FK_STAR_Inventory_StockChanges_STAR_Inventory] FOREIGN KEY([InventoryID])
REFERENCES [dbo].[STAR_Inventory] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_STAR_Inventory_StockChanges_STAR_Inventory]') AND parent_object_id = OBJECT_ID(N'[dbo].[STAR_Inventory_StockChanges]'))
ALTER TABLE [dbo].[STAR_Inventory_StockChanges] CHECK CONSTRAINT [FK_STAR_Inventory_StockChanges_STAR_Inventory]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_STAR_Rewards_TC_Replacement_Employees]') AND parent_object_id = OBJECT_ID(N'[dbo].[STAR_Rewards]'))
ALTER TABLE [dbo].[STAR_Rewards]  WITH CHECK ADD  CONSTRAINT [FK_STAR_Rewards_TC_Replacement_Employees] FOREIGN KEY([InventoryItemReceived])
REFERENCES [dbo].[STAR_Inventory] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_STAR_Rewards_TC_Replacement_Employees]') AND parent_object_id = OBJECT_ID(N'[dbo].[STAR_Rewards]'))
ALTER TABLE [dbo].[STAR_Rewards] CHECK CONSTRAINT [FK_STAR_Rewards_TC_Replacement_Employees]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_STAR_Rewards_TC_Replacement_Employees1]') AND parent_object_id = OBJECT_ID(N'[dbo].[STAR_Rewards]'))
ALTER TABLE [dbo].[STAR_Rewards]  WITH CHECK ADD  CONSTRAINT [FK_STAR_Rewards_TC_Replacement_Employees1] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[TC_Replacement_Employees] ([EmployeeId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_STAR_Rewards_TC_Replacement_Employees1]') AND parent_object_id = OBJECT_ID(N'[dbo].[STAR_Rewards]'))
ALTER TABLE [dbo].[STAR_Rewards] CHECK CONSTRAINT [FK_STAR_Rewards_TC_Replacement_Employees1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_STAR_Tiers_STAR_DatePeriod]') AND parent_object_id = OBJECT_ID(N'[dbo].[STAR_Tiers]'))
ALTER TABLE [dbo].[STAR_Tiers]  WITH CHECK ADD  CONSTRAINT [FK_STAR_Tiers_STAR_DatePeriod] FOREIGN KEY([DatePeriod])
REFERENCES [dbo].[STAR_DatePeriod] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_STAR_Tiers_STAR_DatePeriod]') AND parent_object_id = OBJECT_ID(N'[dbo].[STAR_Tiers]'))
ALTER TABLE [dbo].[STAR_Tiers] CHECK CONSTRAINT [FK_STAR_Tiers_STAR_DatePeriod]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_STAR_User_Location_STAR_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[STAR_User_Location]'))
ALTER TABLE [dbo].[STAR_User_Location]  WITH CHECK ADD  CONSTRAINT [FK_STAR_User_Location_STAR_Locations] FOREIGN KEY([MyLocation])
REFERENCES [dbo].[STAR_Locations] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_STAR_User_Location_STAR_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[STAR_User_Location]'))
ALTER TABLE [dbo].[STAR_User_Location] CHECK CONSTRAINT [FK_STAR_User_Location_STAR_Locations]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StartingStock_allquotes]') AND parent_object_id = OBJECT_ID(N'[dbo].[StartingStock]'))
ALTER TABLE [dbo].[StartingStock]  WITH CHECK ADD  CONSTRAINT [FK_StartingStock_allquotes] FOREIGN KEY([AllQuotes_ID])
REFERENCES [dbo].[AllQuotes] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StartingStock_allquotes]') AND parent_object_id = OBJECT_ID(N'[dbo].[StartingStock]'))
ALTER TABLE [dbo].[StartingStock] CHECK CONSTRAINT [FK_StartingStock_allquotes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StockLst_Process_Grab_Sales]') AND parent_object_id = OBJECT_ID(N'[dbo].[StockLst_Process_Grab]'))
ALTER TABLE [dbo].[StockLst_Process_Grab]  WITH NOCHECK ADD  CONSTRAINT [FK_StockLst_Process_Grab_Sales] FOREIGN KEY([SOitem])
REFERENCES [dbo].[Sales] ([SOitem])
NOT FOR REPLICATION 
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StockLst_Process_Grab_Sales]') AND parent_object_id = OBJECT_ID(N'[dbo].[StockLst_Process_Grab]'))
ALTER TABLE [dbo].[StockLst_Process_Grab] NOCHECK CONSTRAINT [FK_StockLst_Process_Grab_Sales]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Survey_Assignment_CorrectiveAction_Communications_Survey_Assignment_CorrectiveActions]') AND parent_object_id = OBJECT_ID(N'[dbo].[Survey_Assignment_CorrectiveAction_Communications]'))
ALTER TABLE [dbo].[Survey_Assignment_CorrectiveAction_Communications]  WITH CHECK ADD  CONSTRAINT [FK_Survey_Assignment_CorrectiveAction_Communications_Survey_Assignment_CorrectiveActions] FOREIGN KEY([Survey_Assignment_CorrectiveActionID])
REFERENCES [dbo].[Survey_Assignment_CorrectiveActions] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Survey_Assignment_CorrectiveAction_Communications_Survey_Assignment_CorrectiveActions]') AND parent_object_id = OBJECT_ID(N'[dbo].[Survey_Assignment_CorrectiveAction_Communications]'))
ALTER TABLE [dbo].[Survey_Assignment_CorrectiveAction_Communications] CHECK CONSTRAINT [FK_Survey_Assignment_CorrectiveAction_Communications_Survey_Assignment_CorrectiveActions]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Survey_Assignment_CorrectiveActions_Survey_Assignment_CorrectiveAction_ActionStatus_Def]') AND parent_object_id = OBJECT_ID(N'[dbo].[Survey_Assignment_CorrectiveActions]'))
ALTER TABLE [dbo].[Survey_Assignment_CorrectiveActions]  WITH CHECK ADD  CONSTRAINT [FK_Survey_Assignment_CorrectiveActions_Survey_Assignment_CorrectiveAction_ActionStatus_Def] FOREIGN KEY([ActionStatus])
REFERENCES [dbo].[Survey_Assignment_CorrectiveAction_ActionStatus_Def] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Survey_Assignment_CorrectiveActions_Survey_Assignment_CorrectiveAction_ActionStatus_Def]') AND parent_object_id = OBJECT_ID(N'[dbo].[Survey_Assignment_CorrectiveActions]'))
ALTER TABLE [dbo].[Survey_Assignment_CorrectiveActions] CHECK CONSTRAINT [FK_Survey_Assignment_CorrectiveActions_Survey_Assignment_CorrectiveAction_ActionStatus_Def]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Survey_Assignment_CorrectiveActions_Survey_Assignments]') AND parent_object_id = OBJECT_ID(N'[dbo].[Survey_Assignment_CorrectiveActions]'))
ALTER TABLE [dbo].[Survey_Assignment_CorrectiveActions]  WITH CHECK ADD  CONSTRAINT [FK_Survey_Assignment_CorrectiveActions_Survey_Assignments] FOREIGN KEY([Survey_AssignmentID])
REFERENCES [dbo].[Survey_Assignments] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Survey_Assignment_CorrectiveActions_Survey_Assignments]') AND parent_object_id = OBJECT_ID(N'[dbo].[Survey_Assignment_CorrectiveActions]'))
ALTER TABLE [dbo].[Survey_Assignment_CorrectiveActions] CHECK CONSTRAINT [FK_Survey_Assignment_CorrectiveActions_Survey_Assignments]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Survey_Assignments_Survey]') AND parent_object_id = OBJECT_ID(N'[dbo].[Survey_Assignments]'))
ALTER TABLE [dbo].[Survey_Assignments]  WITH CHECK ADD  CONSTRAINT [FK_Survey_Assignments_Survey] FOREIGN KEY([SurveyID])
REFERENCES [dbo].[Survey] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Survey_Assignments_Survey]') AND parent_object_id = OBJECT_ID(N'[dbo].[Survey_Assignments]'))
ALTER TABLE [dbo].[Survey_Assignments] CHECK CONSTRAINT [FK_Survey_Assignments_Survey]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Survey_Assignments_Survey_Assignment_ContactInfos]') AND parent_object_id = OBJECT_ID(N'[dbo].[Survey_Assignments]'))
ALTER TABLE [dbo].[Survey_Assignments]  WITH CHECK ADD  CONSTRAINT [FK_Survey_Assignments_Survey_Assignment_ContactInfos] FOREIGN KEY([Survey_Assignment_ContactInfoID])
REFERENCES [dbo].[Survey_Assignment_ContactInfos] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Survey_Assignments_Survey_Assignment_ContactInfos]') AND parent_object_id = OBJECT_ID(N'[dbo].[Survey_Assignments]'))
ALTER TABLE [dbo].[Survey_Assignments] CHECK CONSTRAINT [FK_Survey_Assignments_Survey_Assignment_ContactInfos]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Survey_Assignments_Survey_Assignment_Type_Def]') AND parent_object_id = OBJECT_ID(N'[dbo].[Survey_Assignments]'))
ALTER TABLE [dbo].[Survey_Assignments]  WITH CHECK ADD  CONSTRAINT [FK_Survey_Assignments_Survey_Assignment_Type_Def] FOREIGN KEY([AssignmentType])
REFERENCES [dbo].[Survey_Assignment_Type_Def] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Survey_Assignments_Survey_Assignment_Type_Def]') AND parent_object_id = OBJECT_ID(N'[dbo].[Survey_Assignments]'))
ALTER TABLE [dbo].[Survey_Assignments] CHECK CONSTRAINT [FK_Survey_Assignments_Survey_Assignment_Type_Def]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Survey_Question_Options_Survey_Questions]') AND parent_object_id = OBJECT_ID(N'[dbo].[Survey_Question_Options]'))
ALTER TABLE [dbo].[Survey_Question_Options]  WITH CHECK ADD  CONSTRAINT [FK_Survey_Question_Options_Survey_Questions] FOREIGN KEY([Survey_QuestionID])
REFERENCES [dbo].[Survey_Questions] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Survey_Question_Options_Survey_Questions]') AND parent_object_id = OBJECT_ID(N'[dbo].[Survey_Question_Options]'))
ALTER TABLE [dbo].[Survey_Question_Options] CHECK CONSTRAINT [FK_Survey_Question_Options_Survey_Questions]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Survey_Question_Responses_Survey_Assignments]') AND parent_object_id = OBJECT_ID(N'[dbo].[Survey_Question_Responses]'))
ALTER TABLE [dbo].[Survey_Question_Responses]  WITH CHECK ADD  CONSTRAINT [FK_Survey_Question_Responses_Survey_Assignments] FOREIGN KEY([Survey_AssignmentID])
REFERENCES [dbo].[Survey_Assignments] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Survey_Question_Responses_Survey_Assignments]') AND parent_object_id = OBJECT_ID(N'[dbo].[Survey_Question_Responses]'))
ALTER TABLE [dbo].[Survey_Question_Responses] CHECK CONSTRAINT [FK_Survey_Question_Responses_Survey_Assignments]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Survey_Question_Responses_Survey_Questions]') AND parent_object_id = OBJECT_ID(N'[dbo].[Survey_Question_Responses]'))
ALTER TABLE [dbo].[Survey_Question_Responses]  WITH CHECK ADD  CONSTRAINT [FK_Survey_Question_Responses_Survey_Questions] FOREIGN KEY([Survey_QuestionID])
REFERENCES [dbo].[Survey_Questions] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Survey_Question_Responses_Survey_Questions]') AND parent_object_id = OBJECT_ID(N'[dbo].[Survey_Question_Responses]'))
ALTER TABLE [dbo].[Survey_Question_Responses] CHECK CONSTRAINT [FK_Survey_Question_Responses_Survey_Questions]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Survey_Questions_Survey]') AND parent_object_id = OBJECT_ID(N'[dbo].[Survey_Questions]'))
ALTER TABLE [dbo].[Survey_Questions]  WITH CHECK ADD  CONSTRAINT [FK_Survey_Questions_Survey] FOREIGN KEY([SurveyID])
REFERENCES [dbo].[Survey] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Survey_Questions_Survey]') AND parent_object_id = OBJECT_ID(N'[dbo].[Survey_Questions]'))
ALTER TABLE [dbo].[Survey_Questions] CHECK CONSTRAINT [FK_Survey_Questions_Survey]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Survey_Questions_Survey_Question_Type_Def]') AND parent_object_id = OBJECT_ID(N'[dbo].[Survey_Questions]'))
ALTER TABLE [dbo].[Survey_Questions]  WITH CHECK ADD  CONSTRAINT [FK_Survey_Questions_Survey_Question_Type_Def] FOREIGN KEY([QuestionType])
REFERENCES [dbo].[Survey_Question_Type_Def] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Survey_Questions_Survey_Question_Type_Def]') AND parent_object_id = OBJECT_ID(N'[dbo].[Survey_Questions]'))
ALTER TABLE [dbo].[Survey_Questions] CHECK CONSTRAINT [FK_Survey_Questions_Survey_Question_Type_Def]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TC_Replacement_Employees_TC_Replacement_Employees]') AND parent_object_id = OBJECT_ID(N'[dbo].[TC_Replacement_Employees]'))
ALTER TABLE [dbo].[TC_Replacement_Employees]  WITH CHECK ADD  CONSTRAINT [FK_TC_Replacement_Employees_TC_Replacement_Employees] FOREIGN KEY([Status])
REFERENCES [dbo].[TC_Replacement_Employees_Status] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TC_Replacement_Employees_TC_Replacement_Employees]') AND parent_object_id = OBJECT_ID(N'[dbo].[TC_Replacement_Employees]'))
ALTER TABLE [dbo].[TC_Replacement_Employees] CHECK CONSTRAINT [FK_TC_Replacement_Employees_TC_Replacement_Employees]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TC_Replacement_Employees_Times_TC_Replacement_Employees_Times_ActivityDefinition]') AND parent_object_id = OBJECT_ID(N'[dbo].[TC_Replacement_Employees_Times]'))
ALTER TABLE [dbo].[TC_Replacement_Employees_Times]  WITH CHECK ADD  CONSTRAINT [FK_TC_Replacement_Employees_Times_TC_Replacement_Employees_Times_ActivityDefinition] FOREIGN KEY([InActivityType])
REFERENCES [dbo].[TC_Replacement_Employees_Times_ActivityDefinition] ([ActivityId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TC_Replacement_Employees_Times_TC_Replacement_Employees_Times_ActivityDefinition]') AND parent_object_id = OBJECT_ID(N'[dbo].[TC_Replacement_Employees_Times]'))
ALTER TABLE [dbo].[TC_Replacement_Employees_Times] CHECK CONSTRAINT [FK_TC_Replacement_Employees_Times_TC_Replacement_Employees_Times_ActivityDefinition]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TC_Replacement_Employees_Times_TC_Replacement_Employees_Times_ActivityDefinition1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TC_Replacement_Employees_Times]'))
ALTER TABLE [dbo].[TC_Replacement_Employees_Times]  WITH CHECK ADD  CONSTRAINT [FK_TC_Replacement_Employees_Times_TC_Replacement_Employees_Times_ActivityDefinition1] FOREIGN KEY([OutActivityType])
REFERENCES [dbo].[TC_Replacement_Employees_Times_ActivityDefinition] ([ActivityId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TC_Replacement_Employees_Times_TC_Replacement_Employees_Times_ActivityDefinition1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TC_Replacement_Employees_Times]'))
ALTER TABLE [dbo].[TC_Replacement_Employees_Times] CHECK CONSTRAINT [FK_TC_Replacement_Employees_Times_TC_Replacement_Employees_Times_ActivityDefinition1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TimeTable_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[TimeTable]'))
ALTER TABLE [dbo].[TimeTable]  WITH CHECK ADD  CONSTRAINT [FK_TimeTable_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TimeTable_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[TimeTable]'))
ALTER TABLE [dbo].[TimeTable] CHECK CONSTRAINT [FK_TimeTable_Employee]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_prc_History_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[TimeTableMaster]'))
ALTER TABLE [dbo].[TimeTableMaster]  WITH CHECK ADD  CONSTRAINT [FK_prc_History_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_prc_History_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[TimeTableMaster]'))
ALTER TABLE [dbo].[TimeTableMaster] CHECK CONSTRAINT [FK_prc_History_Employee]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TimeTableNotes_TimeTable]') AND parent_object_id = OBJECT_ID(N'[dbo].[TimeTableNotes]'))
ALTER TABLE [dbo].[TimeTableNotes]  WITH CHECK ADD  CONSTRAINT [FK_TimeTableNotes_TimeTable] FOREIGN KEY([TimeTableID])
REFERENCES [dbo].[TimeTable] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TimeTableNotes_TimeTable]') AND parent_object_id = OBJECT_ID(N'[dbo].[TimeTableNotes]'))
ALTER TABLE [dbo].[TimeTableNotes] CHECK CONSTRAINT [FK_TimeTableNotes_TimeTable]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vendor_Vendor]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vendor]'))
ALTER TABLE [dbo].[Vendor]  WITH CHECK ADD  CONSTRAINT [FK_Vendor_Vendor] FOREIGN KEY([subsidiary of])
REFERENCES [dbo].[Vendor] ([VendCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vendor_Vendor]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vendor]'))
ALTER TABLE [dbo].[Vendor] CHECK CONSTRAINT [FK_Vendor_Vendor]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vendor_VendorContact]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vendor]'))
ALTER TABLE [dbo].[Vendor]  WITH NOCHECK ADD  CONSTRAINT [FK_Vendor_VendorContact] FOREIGN KEY([QASurveyContactID])
REFERENCES [dbo].[VendorContact] ([ContactID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vendor_VendorContact]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vendor]'))
ALTER TABLE [dbo].[Vendor] NOCHECK CONSTRAINT [FK_Vendor_VendorContact]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vendor_Invoice_POitem_Vendor_Invoice]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vendor_Invoice_POitem]'))
ALTER TABLE [dbo].[Vendor_Invoice_POitem]  WITH CHECK ADD  CONSTRAINT [FK_Vendor_Invoice_POitem_Vendor_Invoice] FOREIGN KEY([Vendor_Invoice_ID])
REFERENCES [dbo].[Vendor_Invoice] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vendor_Invoice_POitem_Vendor_Invoice]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vendor_Invoice_POitem]'))
ALTER TABLE [dbo].[Vendor_Invoice_POitem] CHECK CONSTRAINT [FK_Vendor_Invoice_POitem_Vendor_Invoice]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vendor_Invoice_Receive_Vendor_Invoice_POitem]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vendor_Invoice_Receive]'))
ALTER TABLE [dbo].[Vendor_Invoice_Receive]  WITH CHECK ADD  CONSTRAINT [FK_Vendor_Invoice_Receive_Vendor_Invoice_POitem] FOREIGN KEY([VI_POi_ID])
REFERENCES [dbo].[Vendor_Invoice_POitem] ([VI_POi_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vendor_Invoice_Receive_Vendor_Invoice_POitem]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vendor_Invoice_Receive]'))
ALTER TABLE [dbo].[Vendor_Invoice_Receive] CHECK CONSTRAINT [FK_Vendor_Invoice_Receive_Vendor_Invoice_POitem]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VendorConflictMineralsFree_Vendor]') AND parent_object_id = OBJECT_ID(N'[dbo].[VendorConflictMineralsFree]'))
ALTER TABLE [dbo].[VendorConflictMineralsFree]  WITH CHECK ADD  CONSTRAINT [FK_VendorConflictMineralsFree_Vendor] FOREIGN KEY([VendCode])
REFERENCES [dbo].[Vendor] ([VendCode])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VendorConflictMineralsFree_Vendor]') AND parent_object_id = OBJECT_ID(N'[dbo].[VendorConflictMineralsFree]'))
ALTER TABLE [dbo].[VendorConflictMineralsFree] CHECK CONSTRAINT [FK_VendorConflictMineralsFree_Vendor]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VendorContact_Vendor]') AND parent_object_id = OBJECT_ID(N'[dbo].[VendorContact]'))
ALTER TABLE [dbo].[VendorContact]  WITH CHECK ADD  CONSTRAINT [FK_VendorContact_Vendor] FOREIGN KEY([VendCode])
REFERENCES [dbo].[Vendor] ([VendCode])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VendorContact_Vendor]') AND parent_object_id = OBJECT_ID(N'[dbo].[VendorContact]'))
ALTER TABLE [dbo].[VendorContact] CHECK CONSTRAINT [FK_VendorContact_Vendor]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VendorQualitySurvey_Vendor]') AND parent_object_id = OBJECT_ID(N'[dbo].[VendorQualitySurvey]'))
ALTER TABLE [dbo].[VendorQualitySurvey]  WITH CHECK ADD  CONSTRAINT [FK_VendorQualitySurvey_Vendor] FOREIGN KEY([VendCode])
REFERENCES [dbo].[Vendor] ([VendCode])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VendorQualitySurvey_Vendor]') AND parent_object_id = OBJECT_ID(N'[dbo].[VendorQualitySurvey]'))
ALTER TABLE [dbo].[VendorQualitySurvey] CHECK CONSTRAINT [FK_VendorQualitySurvey_Vendor]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WaterJetMachineHours_TimeTableMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[WaterJetMachineHours]'))
ALTER TABLE [dbo].[WaterJetMachineHours]  WITH CHECK ADD  CONSTRAINT [FK_WaterJetMachineHours_TimeTableMaster] FOREIGN KEY([ID])
REFERENCES [dbo].[TimeTableMaster] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WaterJetMachineHours_TimeTableMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[WaterJetMachineHours]'))
ALTER TABLE [dbo].[WaterJetMachineHours] CHECK CONSTRAINT [FK_WaterJetMachineHours_TimeTableMaster]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WaterJetMachineHours_WaterJetMachines]') AND parent_object_id = OBJECT_ID(N'[dbo].[WaterJetMachineHours]'))
ALTER TABLE [dbo].[WaterJetMachineHours]  WITH CHECK ADD  CONSTRAINT [FK_WaterJetMachineHours_WaterJetMachines] FOREIGN KEY([Machine], [Identifier])
REFERENCES [dbo].[WaterJetMachines] ([Machine], [MIdentifier])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WaterJetMachineHours_WaterJetMachines]') AND parent_object_id = OBJECT_ID(N'[dbo].[WaterJetMachineHours]'))
ALTER TABLE [dbo].[WaterJetMachineHours] CHECK CONSTRAINT [FK_WaterJetMachineHours_WaterJetMachines]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WaterJetMachineHours_Detail_WaterJetMachineHours]') AND parent_object_id = OBJECT_ID(N'[dbo].[WaterJetMachineHours_Detail]'))
ALTER TABLE [dbo].[WaterJetMachineHours_Detail]  WITH CHECK ADD  CONSTRAINT [FK_WaterJetMachineHours_Detail_WaterJetMachineHours] FOREIGN KEY([ID])
REFERENCES [dbo].[WaterJetMachineHours] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WaterJetMachineHours_Detail_WaterJetMachineHours]') AND parent_object_id = OBJECT_ID(N'[dbo].[WaterJetMachineHours_Detail]'))
ALTER TABLE [dbo].[WaterJetMachineHours_Detail] CHECK CONSTRAINT [FK_WaterJetMachineHours_Detail_WaterJetMachineHours]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WaterJetMachines_EquipmentMachineType]') AND parent_object_id = OBJECT_ID(N'[dbo].[WaterJetMachines]'))
ALTER TABLE [dbo].[WaterJetMachines]  WITH CHECK ADD  CONSTRAINT [FK_WaterJetMachines_EquipmentMachineType] FOREIGN KEY([Machine])
REFERENCES [dbo].[EquipmentMachineType] ([Machine])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WaterJetMachines_EquipmentMachineType]') AND parent_object_id = OBJECT_ID(N'[dbo].[WaterJetMachines]'))
ALTER TABLE [dbo].[WaterJetMachines] CHECK CONSTRAINT [FK_WaterJetMachines_EquipmentMachineType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkOrder_Detail_WorkOrder]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkOrder_Detail]'))
ALTER TABLE [dbo].[WorkOrder_Detail]  WITH CHECK ADD  CONSTRAINT [FK_WorkOrder_Detail_WorkOrder] FOREIGN KEY([WO])
REFERENCES [dbo].[WorkOrder] ([WO])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkOrder_Detail_WorkOrder]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkOrder_Detail]'))
ALTER TABLE [dbo].[WorkOrder_Detail] CHECK CONSTRAINT [FK_WorkOrder_Detail_WorkOrder]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[Contraint_Location]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employee]'))
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [Contraint_Location] CHECK  (([location]='X' OR [location]='W' OR [location]='T'))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[Contraint_Location]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employee]'))
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [Contraint_Location]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[Contraint_Action_Type]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_CP_Action]'))
ALTER TABLE [dbo].[QA_CP_Action]  WITH CHECK ADD  CONSTRAINT [Contraint_Action_Type] CHECK  (([Action_Type]='P' OR [Action_Type]='C'))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[Contraint_Action_Type]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_CP_Action]'))
ALTER TABLE [dbo].[QA_CP_Action] CHECK CONSTRAINT [Contraint_Action_Type]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[Contraint_Contact_Type]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_CP_Action]'))
ALTER TABLE [dbo].[QA_CP_Action]  WITH CHECK ADD  CONSTRAINT [Contraint_Contact_Type] CHECK  (([Contact_Type]='V' OR [Contact_Type]='C'))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[Contraint_Contact_Type]') AND parent_object_id = OBJECT_ID(N'[dbo].[QA_CP_Action]'))
ALTER TABLE [dbo].[QA_CP_Action] CHECK CONSTRAINT [Contraint_Contact_Type]
GO
