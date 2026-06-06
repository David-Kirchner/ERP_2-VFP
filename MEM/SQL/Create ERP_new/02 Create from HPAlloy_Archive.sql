--02 Create from HPAlloy_Archive to AR
USE [ERP_2]


/****** Object:  Default [UW_ZeroDefault]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UW_ZeroDefault]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[UW_ZeroDefault] AS 0'
GO

/****** Object:  Table [dbo].[Ar_AlloySurcharge_History]    Script Date: 12/26/2025 5:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ar_AlloySurcharge_History]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ar_AlloySurcharge_History](
	[Ni] [decimal](9, 6) NOT NULL,
	[Co] [decimal](9, 6) NOT NULL,
	[Cr] [decimal](9, 6) NOT NULL,
	[Cu] [decimal](9, 6) NOT NULL,
	[Mo] [decimal](9, 6) NOT NULL,
	[Fe] [decimal](9, 6) NOT NULL,
	[Ti] [decimal](9, 6) NOT NULL,
	[ID] [tinyint] NULL,
	[Who] [varchar](255) NOT NULL,
	[What] [char](10) NOT NULL,
	[When] [datetime] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ar_AllQuotes_History]    Script Date: 12/26/2025 5:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ar_AllQuotes_History]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ar_AllQuotes_History](
	[Who] [varchar](255) NOT NULL,
	[What] [char](10) NOT NULL,
	[When] [datetime] NOT NULL,
	[Company] [varchar](30) NULL,
	[name] [varchar](25) NULL,
	[phone] [varchar](10) NULL,
	[phone_ext] [varchar](6) NULL,
	[fax] [varchar](10) NULL,
	[email] [varchar](60) NULL,
	[po_num] [varchar](20) NULL,
	[alloy] [char](12) NULL,
	[form] [char](2) NULL,
	[cc] [char](1) NULL,
	[CL] [char](1) NULL,
	[pieces] [int] NULL,
	[thck] [float] NULL,
	[sz2] [float] NULL,
	[sz3] [float] NULL,
	[weight] [float] NULL,
	[descript] [varchar](50) NULL,
	[p_lb] [float] NULL,
	[p_pc] [float] NULL,
	[p_ft] [float] NULL,
	[cuts] [float] NULL,
	[otherfld] [varchar](10) NULL,
	[otherp] [float] NULL,
	[lotp] [float] NULL,
	[lotcost] [float] NULL,
	[leadtime] [varchar](15) NULL,
	[cweight] [float] NULL,
	[cp_lb] [float] NULL,
	[cp_pc] [float] NULL,
	[cp_pcc] [float] NULL,
	[cthk] [char](10) NULL,
	[clotp] [float] NULL,
	[clotcp] [float] NULL,
	[ccut] [float] NULL,
	[cCutM] [float] NULL,
	[cKerfD] [float] NULL,
	[Inqdate] [datetime] NOT NULL,
	[Inqnum] [int] NOT NULL,
	[InqNumP] [char](9) NOT NULL,
	[SalesP] [char](1) NOT NULL,
	[SalesNum] [int] NULL,
	[SOitem] [char](10) NULL,
	[item] [tinyint] NULL,
	[HPApo] [int] NULL,
	[POitem] [char](12) NULL,
	[saledate] [datetime] NULL,
	[shipdate] [datetime] NULL,
	[buyfrom] [varchar](15) NULL,
	[buycost] [float] NULL,
	[buyfrom2] [varchar](15) NULL,
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
	[ID] [int] NOT NULL,
	[line1] [varchar](60) NULL,
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
	[S_PU] [money] NULL,
	[StandardSize] [decimal](9, 3) NULL,
	[CustDisc] [decimal](3, 2) NULL,
	[DescriptID]  AS ((((isnull([Alloy],'            ')+isnull([Form],'  '))+isnull([CC],' '))+isnull([CL],' '))+str(round([Thck],(9),(3)),(9),(3))) PERSISTED,
	[ID_Hist] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ar_AllQuotes_Old]    Script Date: 12/26/2025 5:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ar_AllQuotes_Old]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ar_AllQuotes_Old](
	[Company] [char](30) NULL,
	[name] [char](25) NULL,
	[phone] [char](10) NULL,
	[phone_ext] [char](6) NULL,
	[fax] [char](10) NULL,
	[email] [varchar](60) NULL,
	[po_num] [varchar](17) NULL,
	[alloy] [char](12) NULL,
	[form] [char](2) NULL,
	[cc] [char](1) NULL,
	[CL] [char](1) NULL,
	[pieces] [int] NULL,
	[thck] [float] NULL,
	[sz2] [float] NULL,
	[sz3] [float] NULL,
	[weight] [float] NULL,
	[descript] [varchar](50) NULL,
	[p_lb] [float] NULL,
	[p_pc] [float] NULL,
	[p_ft] [float] NULL,
	[cuts] [float] NULL,
	[otherfld] [char](10) NULL,
	[otherp] [float] NULL,
	[lotp] [float] NULL,
	[lotcost] [float] NULL,
	[leadtime] [varchar](15) NULL,
	[cweight] [float] NULL,
	[cp_lb] [float] NULL,
	[cp_pc] [float] NULL,
	[cp_pcc] [float] NULL,
	[cthk] [char](9) NULL,
	[clotp] [float] NULL,
	[clotcp] [float] NULL,
	[ccut] [float] NULL,
	[Inqdate] [datetime] NOT NULL,
	[Inqnum] [int] NOT NULL,
	[InqNumP] [char](9) NOT NULL,
	[SalesP] [char](1) NOT NULL,
	[SalesNum] [int] NULL,
	[SOitem] [char](10) NULL,
	[item] [tinyint] NULL,
	[HPApo] [int] NULL,
	[POitem] [char](12) NULL,
	[saledate] [datetime] NULL,
	[shipdate] [datetime] NULL,
	[buyfrom] [varchar](15) NULL,
	[buycost] [float] NULL,
	[buyfrom2] [varchar](15) NULL,
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
	[Cut] [char](1) NULL,
	[ID] [int] NOT NULL,
	[line1] [char](60) NULL,
	[WO] [int] NULL,
	[CutOptions] [varchar](50) NULL,
	[Surcharge] [money] NULL,
	[Regret] [bit] NULL,
	[NoNoiseName] [char](30) NULL,
	[CutHR] [smallint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ar_BrokerLst_Detail_History]    Script Date: 12/26/2025 5:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ar_BrokerLst_Detail_History]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ar_BrokerLst_Detail_History](
	[ID_Detail_Process] [int] NULL,
	[Who] [varchar](255) NOT NULL,
	[What] [char](10) NULL,
	[When] [datetime] NOT NULL,
	[ProcessValue] [money] NULL,
	[size_h] [numeric](9, 4) NULL,
	[size_l] [numeric](9, 4) NULL,
	[pc] [int] NULL,
	[dim1] [money] NOT NULL,
	[dim2] [money] NULL,
	[dim3] [money] NULL,
	[length] [char](160) NULL,
	[weight] [money] NOT NULL,
	[costvalue] [money] NULL,
	[descript] [char](20) NULL,
	[location] [char](10) NULL,
	[floorstatus] [char](1) NULL,
	[class] [char](1) NULL,
	[unit] [char](6) NULL,
	[randlen] [bit] NULL,
	[InvCheck] [datetime] NULL,
	[id] [int] NOT NULL,
	[id_detail] [int] NOT NULL,
	[ID_Detail_History] [bigint] IDENTITY(1,1) NOT NULL,
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
 CONSTRAINT [PK_BrokerLst_Detail_History] PRIMARY KEY CLUSTERED 
(
	[ID_Detail_History] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ar_BrokerLst_Master_history]    Script Date: 12/26/2025 5:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ar_BrokerLst_Master_history]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ar_BrokerLst_Master_history](
	[Who] [varchar](255) NOT NULL,
	[what] [char](10) NULL,
	[when] [datetime] NOT NULL,
	[alloy] [char](12) NOT NULL,
	[form] [char](2) NOT NULL,
	[cc] [char](1) NULL,
	[cl] [char](1) NULL,
	[size] [money] NOT NULL,
	[cond] [varchar](50) NULL,
	[mweight] [numeric](18, 8) NULL,
	[specs] [varchar](160) NULL,
	[heat] [varchar](50) NOT NULL,
	[lot] [char](10) NULL,
	[Paid] [money] NULL,
	[po_item] [char](12) NULL,
	[poduedate] [smalldatetime] NULL,
	[mill] [char](10) NULL,
	[stkdate] [smalldatetime] NULL,
	[history] [varchar](20) NULL,
	[num] [numeric](8, 0) NULL,
	[POStatus] [char](1) NULL,
	[BrandName] [varchar](20) NULL,
	[FROM_ID] [int] NULL,
	[Melt] [varchar](7) NULL,
	[id] [int] NOT NULL,
	[ID_History] [int] IDENTITY(1,1) NOT NULL,
	[mS_QTY] [money] NULL,
	[WO_Detail] [int] NULL,
	[ProjID] [int] NULL,
	[MillTrace] [bit] NULL
) ON [PRIMARY]
END
GO



/****** Object:  Table [dbo].[Ar_BrokerLst_Process_Detail_History]    Script Date: 12/26/2025 5:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ar_BrokerLst_Process_Detail_History]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ar_BrokerLst_Process_Detail_History](
	[Who] [varchar](255) NOT NULL,
	[What] [char](10) NULL,
	[When] [datetime] NULL,
	[ID] [int] NOT NULL,
	[ID_Detail] [int] NULL,
	[ID_Detail_Process] [int] NULL,
	[WO] [int] NULL,
	[SOitem] [char](10) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ar_BrokerLst_Process_GS_History]    Script Date: 12/26/2025 5:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ar_BrokerLst_Process_GS_History]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ar_BrokerLst_Process_GS_History](
	[who] [varchar](255) NOT NULL,
	[what] [char](10) NULL,
	[when] [datetime] NOT NULL,
	[SOitem] [char](10) NULL,
	[POitem] [char](12) NULL,
	[comment] [varchar](100) NOT NULL,
	[process_id] [char](10) NOT NULL,
	[PWeight] [money] NULL,
	[PPc] [int] NULL,
	[InvoiceValue] [money] NULL,
	[id_detail] [int] NOT NULL,
	[id_detail_process] [int] NULL,
	[Validated] [bit] NOT NULL,
	[Valid_When] [datetime] NULL,
	[S_QTY] [money] NULL,
	[S_P] [money] NULL,
	[S_PU] [tinyint] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ar_BrokerLst_Process_History]    Script Date: 12/26/2025 5:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ar_BrokerLst_Process_History]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ar_BrokerLst_Process_History](
	[who] [varchar](255) NOT NULL,
	[what] [char](10) NULL,
	[when] [datetime] NOT NULL,
	[SOitem] [char](10) NULL,
	[PO_item] [char](12) NULL,
	[SalesPerson] [char](20) NULL,
	[StartDate] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[Comment] [varchar](100) NOT NULL,
	[Process_ID] [char](10) NULL,
	[Processor] [char](20) NULL,
	[AllowSub] [char](1) NULL,
	[PWeight] [money] NULL,
	[PPc] [int] NULL,
	[PFt] [float] NULL,
	[PU] [tinyint] NULL,
	[QTY] [money] NULL,
	[Ordered_QTY] [money] NULL,
	[Ordered_P] [money] NULL,
	[Pounds] [decimal](9, 1) NULL,
	[ID_Detail] [int] NOT NULL,
	[ID_Detail_Process] [bigint] NULL,
	[Removed] [datetime] NULL,
	[Validated] [char](1) NULL,
	[Valid_When] [datetime] NULL,
	[ID_Process_History] [bigint] IDENTITY(1,1) NOT NULL,
	[ReceivingID] [int] NOT NULL,
	[WO] [int] NULL,
	[WO_Detail] [int] NULL,
	[InqNumP] [char](9) NULL,
	[QTY_Due] [money] NULL,
	[Prc_Qty] [money] NULL,
	[Prc_Form] [char](2) NULL,
	[Prc_PCs] [int] NULL,
	[Prc_Dim1] [money] NULL,
	[Prc_Dim2] [money] NULL,
	[Prc_Dim3] [money] NULL,
	[FoundSTK] [smalldatetime] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ar_Cert_History]    Script Date: 12/26/2025 5:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ar_Cert_History]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ar_Cert_History](
	[Who] [varchar](255) NULL,
	[What] [char](10) NULL,
	[When] [datetime] NULL,
	[Reference] [varchar](50) NULL,
	[DateCert] [datetime] NULL,
	[DateProd] [datetime] NULL,
	[Heat] [varchar](50) NULL,
	[Lot] [decimal](5, 0) NULL,
	[Alloy] [varchar](50) NULL,
	[Size] [varchar](50) NULL,
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
	[ElonInches] [varchar](5) NULL,
	[RA1] [decimal](4, 1) NULL,
	[tLoc1] [char](1) NULL,
	[Hardness] [varchar](10) NULL,
	[BHN] [smallint] NULL,
	[Ult2] [decimal](10, 0) NULL,
	[Yield2] [decimal](10, 0) NULL,
	[Elong2] [decimal](4, 1) NULL,
	[ElonInches2] [varchar](50) NULL,
	[RA2] [decimal](4, 1) NULL,
	[tLoc2] [varchar](10) NULL,
	[Hardness2] [varchar](10) NULL,
	[BHN2] [smallint] NULL,
	[Ult3] [decimal](10, 0) NULL,
	[Yield3] [decimal](10, 0) NULL,
	[Elong3] [decimal](4, 1) NULL,
	[ElonInches3] [varchar](5) NULL,
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
	[LabUsed] [varchar](50) NOT NULL,
	[TestPO2] [varchar](12) NULL,
	[LabUsed2] [varchar](12) NULL,
	[Signed] [bit] NULL,
	[Machine] [decimal](1, 0) NULL,
	[Signature] [varchar](50) NULL,
	[SignUser] [varchar](50) NULL,
	[SignDate] [datetime] NULL,
	[XtraInfo] [varchar](max) NULL,
	[QA] [bit] NULL,
	[QArev] [varchar](50) NULL,
	[MercFree] [bit] NULL,
	[NoWeld] [bit] NULL,
	[DFARS] [bit] NULL,
	[SRHours] [decimal](4, 1) NULL,
	[SRTemp] [varchar](50) NULL,
	[SRStress] [decimal](10, 0) NULL,
	[SRRA] [decimal](4, 1) NULL,
	[SRElong] [decimal](4, 1) NULL,
	[ID] [int] NOT NULL,
	[StockLst_ID] [int] NULL,
	[AC_ID] [int] NULL,
	[AC_cmplt] [bit] NULL,
	[WhoInsert] [varchar](254) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ar_GFMlog_hist]    Script Date: 12/26/2025 5:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ar_GFMlog_hist]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ar_GFMlog_hist](
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
	[ID] [int] NOT NULL,
	[WO] [int] NULL,
	[WO_Detail] [int] NULL,
	[Machine] [char](1) NULL,
	[Oper] [varchar](10) NULL,
	[ProjID] [int] NULL,
	[Who] [varchar](255) NULL,
	[What] [varchar](255) NULL,
	[When] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ar_LakeErie_log_hist]    Script Date: 12/26/2025 5:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ar_LakeErie_log_hist]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ar_LakeErie_log_hist](
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
	[spec] [char](50) NULL,
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
	[ID] [int] NOT NULL,
	[WO] [int] NULL,
	[WO_Detail] [int] NULL,
	[Who] [varchar](254) NOT NULL,
	[What] [varchar](254) NOT NULL,
	[When] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ar_PackingSlip]    Script Date: 12/26/2025 5:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ar_PackingSlip]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ar_PackingSlip](
	[WHO2] [varchar](255) NULL,
	[What] [varchar](255) NULL,
	[When] [varchar](255) NULL,
	[Packingsli] [decimal](10, 0) NOT NULL,
	[PCs] [decimal](10, 0) NULL,
	[Descript] [varchar](80) NULL,
	[SOitem] [char](10) NULL,
	[PackedWeight] [decimal](6, 1) NULL,
	[PO_Num] [char](20) NULL,
	[Heat] [varchar](50) NULL,
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
	[ID_PackingSlip] [int] NOT NULL,
	[WhenAdd] [datetime] NULL,
	[First_RSO] [smalldatetime] NULL,
	[PT_QTY] [money] NULL,
	[SO_QTY] [money] NULL,
	[PT_P] [money] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ar_PackingSlip_No]    Script Date: 12/26/2025 5:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ar_PackingSlip_No]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ar_PackingSlip_No](
	[Who2] [varchar](255) NULL,
	[what] [varchar](255) NULL,
	[When] [datetime] NULL,
	[packingsli] [int] NOT NULL,
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
	[HoldReason] [varchar](50) NULL,
	[WHO] [varchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ar_PriceTable_hist]    Script Date: 12/26/2025 5:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ar_PriceTable_hist]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ar_PriceTable_hist](
	[pt_id] [bigint] NULL,
	[alloy] [char](12) NULL,
	[form] [char](2) NULL,
	[cc] [char](1) NULL,
	[thk] [char](5) NULL,
	[size] [numeric](9, 4) NULL,
	[size2] [numeric](8, 3) NULL,
	[size3] [numeric](8, 3) NULL,
	[w0] [numeric](7, 2) NULL,
	[w5] [numeric](7, 2) NULL,
	[w10] [numeric](7, 2) NULL,
	[w25] [numeric](7, 2) NULL,
	[w50] [numeric](7, 2) NULL,
	[w100] [numeric](7, 2) NULL,
	[w200] [numeric](7, 2) NULL,
	[w500] [numeric](7, 2) NULL,
	[w1000] [numeric](7, 2) NULL,
	[w2000] [numeric](7, 2) NULL,
	[wBASE] [numeric](7, 2) NULL,
	[activepric] [bit] NULL,
	[lastedit] [smalldatetime] NULL,
	[username] [char](20) NULL,
	[zalloy] [char](19) NULL,
	[item_code] [char](13) NULL,
	[code] [char](4) NULL,
	[density] [numeric](9, 8) NULL,
	[zform] [char](4) NULL,
	[condition] [char](14) NULL,
	[over_size] [numeric](9, 7) NULL,
	[under_size] [numeric](9, 7) NULL,
	[standard] [char](19) NULL,
	[conditio2] [char](13) NULL,
	[bar_lbs_in] [numeric](18, 16) NULL,
	[pref_ven] [char](8) NULL,
	[wt_pc] [numeric](18, 13) NULL,
	[web0] [char](18) NULL,
	[web5] [char](19) NULL,
	[web10] [char](17) NULL,
	[web25] [char](17) NULL,
	[web50] [char](17) NULL,
	[web100] [char](17) NULL,
	[web200] [char](17) NULL,
	[web500] [char](17) NULL,
	[web1000] [char](17) NULL,
	[web2000] [char](17) NULL,
	[webbase] [numeric](18, 0) NULL,
	[webactual] [char](6) NULL,
	[alloy_type] [char](10) NULL,
	[cost1999] [money] NULL,
	[cost2000] [money] NULL,
	[cost2001] [money] NULL,
	[cost2002] [money] NULL,
	[cost2005] [money] NULL,
	[cost2006] [money] NULL,
	[cost2007] [money] NULL,
	[cost2013] [money] NULL,
	[cost2018] [money] NULL,
	[costcurr] [money] NULL,
	[h0] [numeric](9, 6) NULL,
	[h5] [numeric](9, 6) NULL,
	[h10] [numeric](9, 6) NULL,
	[h25] [numeric](9, 6) NULL,
	[h50] [numeric](9, 6) NULL,
	[h100] [numeric](9, 6) NULL,
	[h200] [numeric](9, 6) NULL,
	[h500] [numeric](9, 6) NULL,
	[h1000] [numeric](9, 6) NULL,
	[h2000] [numeric](9, 6) NULL,
	[hbase] [numeric](9, 6) NULL,
	[a0] [numeric](9, 6) NULL,
	[a5] [numeric](9, 6) NULL,
	[a10] [numeric](9, 6) NULL,
	[a25] [numeric](9, 6) NULL,
	[a50] [numeric](9, 6) NULL,
	[a100] [numeric](9, 6) NULL,
	[a200] [numeric](9, 6) NULL,
	[a500] [numeric](9, 6) NULL,
	[a1000] [numeric](9, 6) NULL,
	[a2000] [numeric](9, 6) NULL,
	[abase] [numeric](9, 6) NULL,
	[hist] [datetime] NULL,
	[commspec] [char](20) NULL,
	[Who] [varchar](255) NULL,
	[What] [char](10) NULL,
	[When] [datetime] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ar_PurchaseOrder_hist]    Script Date: 12/26/2025 5:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ar_PurchaseOrder_hist]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ar_PurchaseOrder_hist](
	[poitem] [char](12) NOT NULL,
	[hpapo] [int] NOT NULL,
	[itempo] [decimal](2, 0) NOT NULL,
	[soitem] [char](10) NULL,
	[salesnum] [int] NULL,
	[item] [decimal](2, 0) NULL,
	[salesp] [char](1) NULL,
	[company] [varchar](30) NULL,
	[alloy] [char](12) NULL,
	[form] [char](2) NULL,
	[cc] [char](1) NULL,
	[CL] [char](1) NULL,
	[order_qty] [decimal](11, 3) NULL,
	[pieces] [decimal](6, 0) NULL,
	[thck] [money] NULL,
	[sz2] [money] NULL,
	[sz3] [money] NULL,
	[p_lb] [decimal](10, 2) NULL,
	[p_pc] [decimal](10, 2) NULL,
	[p_ft] [decimal](10, 2) NULL,
	[lotp] [decimal](10, 2) NULL,
	[otherp] [decimal](10, 2) NULL,
	[otherfld] [varchar](10) NULL,
	[orderdate] [datetime] NULL,
	[due_min] [datetime] NULL,
	[due_max] [datetime] NULL,
	[received] [datetime] NULL,
	[cond_spec] [varchar](max) NULL,
	[misc_purch] [varchar](max) NULL,
	[heat] [varchar](50) NULL,
	[cert] [bit] NULL,
	[receivedby] [varchar](10) NULL,
	[receipt] [varchar](max) NULL,
	[delivered] [bit] NULL,
	[cmplt] [bit] NULL,
	[cancelled] [bit] NULL,
	[posalesp] [varchar](20) NULL,
	[shipvia] [varchar](20) NULL,
	[jobnumber] [varchar](20) NULL,
	[Services] [bit] NULL,
	[ConvServ] [bit] NULL,
	[Equipment] [bit] NULL,
	[Stock] [varchar](13) NULL,
	[sheet_pk] [bit] NULL,
	[ShipWhere] [decimal](1, 0) NULL,
	[POshipaddr] [int] NULL,
	[POpayaddr] [int] NULL,
	[Randlen] [bit] NULL,
	[OddCut] [bit] NULL,
	[Metric] [bit] NULL,
	[Sz1Orig] [varchar](20) NULL,
	[Sz2Orig] [varchar](20) NULL,
	[Sz3Orig] [varchar](20) NULL,
	[dispalloy] [char](20) NULL,
	[StandSize] [decimal](10, 4) NULL,
	[Amendment] [numeric](2, 0) NULL,
	[Printed] [bit] NULL,
	[VendCode] [int] NULL,
	[ContactID] [int] NULL,
	[Terms] [varchar](50) NULL,
	[FOB] [varchar](50) NULL,
	[HPA_Due_Min] [datetime] NULL,
	[HPA_Due_Max] [datetime] NULL,
	[First_Due_Max] [datetime] NULL,
	[reconciled] [bit] NULL,
	[reconcileTotal] [money] NULL,
	[StockLst_QTY] [money] NULL,
	[StockLst_P] [money] NULL,
	[StockLst_PU] [tinyint] NULL,
	[Order_P] [money] NULL,
	[Order_PU] [tinyint] NULL,
	[Pounds] [decimal](9, 1) NULL,
	[BMScheck] [bit] NULL,
	[ShipLocation] [varchar](10) NULL,
	[VendorPOConf] [bit] NOT NULL,
	[Melt] [varchar](7) NOT NULL,
	[Who] [varchar](255) NULL,
	[WHAT] [char](10) NULL,
	[WHEN] [datetime] NULL,
	[WO] [int] NULL,
	[Cover] [char](1) NULL,
	[WO_Detail] [int] NULL,
	[IntP] [bit] NULL,
	[RcvdE] [bit] NULL,
	[DLAE] [bit] NULL,
	[TBL] [char](1) NULL,
	[DescriptID]  AS ((((isnull([Alloy],'            ')+isnull([Form],'  '))+isnull([CC],' '))+isnull([CL],' '))+str(round([Thck],(9),(3)),(9),(3))),
	[Hold] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ar_Receiving_Hist]    Script Date: 12/26/2025 5:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ar_Receiving_Hist]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ar_Receiving_Hist](
	[ID] [int] NOT NULL,
	[Received] [smalldatetime] NOT NULL,
	[POitem] [char](12) NULL,
	[SOitem] [char](10) NULL,
	[WO] [int] NULL,
	[WO_Detail] [int] NULL,
	[Alloy] [char](12) NULL,
	[Form] [char](2) NULL,
	[Heat] [char](50) NULL,
	[Cert] [bit] NULL,
	[Pieces] [int] NULL,
	[Description] [varchar](max) NULL,
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
	[StockTable] [char](1) NULL,
	[RejectPC] [int] NULL,
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
	[PO_Qty] [money] NULL,
	[PO_P] [money] NULL,
	[PO_Total]  AS ([PO_QTY]*[PO_P]),
	[PO_PU] [tinyint] NULL,
	[Services] [bit] NULL,
	[ConvServ] [bit] NULL,
	[Equipment] [bit] NULL,
	[CertID] [varchar](50) NULL,
	[Who] [varchar](255) NULL,
	[What] [char](10) NULL,
	[When] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ar_Roll_log_hist]    Script Date: 12/26/2025 5:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ar_Roll_log_hist]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ar_Roll_log_hist](
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
	[spec] [char](50) NULL,
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
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[WO] [int] NULL,
	[WO_Detail] [int] NULL,
	[Who] [varchar](254) NOT NULL,
	[What] [varchar](254) NOT NULL,
	[When] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ar_Sales_History]    Script Date: 12/26/2025 5:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ar_Sales_History]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ar_Sales_History](
	[Who] [varchar](255) NOT NULL,
	[what] [char](10) NULL,
	[when] [datetime] NOT NULL,
	[soitem] [char](10) NOT NULL,
	[salesnum] [int] NOT NULL,
	[item] [decimal](2, 0) NULL,
	[orderspec] [char](60) NULL,
	[s_instrct] [text] NULL,
	[inv] [bit] NULL,
	[gfm] [bit] NULL,
	[draw] [bit] NULL,
	[roll] [bit] NULL,
	[press] [bit] NULL,
	[mach] [bit] NULL,
	[cg] [bit] NULL,
	[plasma] [bit] NULL,
	[WJet] [bit] NULL,
	[ColdSaw] [bit] NULL,
	[cert] [decimal](1, 0) NULL,
	[itemtot] [decimal](2, 0) NULL,
	[shipdue] [datetime] NULL,
	[shipped] [datetime] NULL,
	[matlwt] [decimal](9, 1) NULL,
	[cncld] [bit] NULL,
	[cmplt] [bit] NULL,
	[partno] [varchar](100) NULL,
	[itemcost] [decimal](9, 2) NULL,
	[itemsale] [decimal](9, 2) NULL,
	[StkCost] [decimal](9, 2) NULL,
	[POCost] [decimal](9, 2) NULL,
	[gs_cost] [decimal](9, 2) NULL,
	[gs_sale] [decimal](9, 2) NULL,
	[gs_cmplt] [bit] NULL,
	[rma_no] [decimal](10, 0) NULL,
	[RMA_Detail] [int] NULL,
	[qa] [bit] NULL,
	[cofc] [bit] NULL,
	[merc] [bit] NULL,
	[ppo] [bit] NULL,
	[ppn] [bit] NULL,
	[pheat] [bit] NULL,
	[pspec] [bit] NULL,
	[pdesc] [bit] NULL,
	[pother] [bit] NULL,
	[other] [varchar](50) NULL,
	[prcp] [bit] NULL,
	[prcd] [bit] NULL,
	[pckd] [bit] NULL,
	[urgent] [char](1) NULL,
	[shipon] [bit] NULL,
	[Tol] [varchar](20) NULL,
	[JobHours] [decimal](4, 1) NULL,
	[ProcLoc] [char](1) NULL,
	[S_QTY] [int] NULL,
	[Quoted_QTY] [money] NULL,
	[Quoted_P] [money] NULL,
	[Quoted_Total] [money] NULL,
	[Quoted_CutsP] [decimal](9, 2) NULL,
	[Quoted_OtherP] [decimal](9, 2) NULL,
	[Quoted_PU] [tinyint] NULL,
	[dShip] [bit] NULL,
	[Typ] [char](1) NULL,
	[WO] [int] NULL,
	[StkPaid] [decimal](9, 2) NULL,
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
	[ID_Hist] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ar_Sales_No_History]    Script Date: 12/26/2025 5:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ar_Sales_No_History]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ar_Sales_No_History](
	[Who] [varchar](255) NULL,
	[what] [char](10) NULL,
	[when] [datetime] NOT NULL,
	[salesnum] [int] NOT NULL,
	[salesrep] [varchar](20) NULL,
	[instrct] [varchar](100) NULL,
	[itemtot] [decimal](2, 0) NULL,
	[psoldaddr] [int] NULL,
	[pshipaddr] [int] NULL,
	[shiproute] [varchar](20) NULL,
	[shippay] [char](12) NULL,
	[paytype] [char](10) NULL,
	[CustID] [char](20) NULL,
	[paper_po] [bit] NULL,
	[cncld] [bit] NULL,
	[cmplt] [bit] NULL,
	[blind] [bit] NULL,
	[faxconf] [bit] NULL,
	[emailconf] [bit] NULL,
	[freightest] [money] NULL,
	[printedso] [bit] NULL,
	[emailedps] [bit] NULL,
	[faxedps] [bit] NULL,
	[addr_ref] [varchar](40) NULL,
	[trt_lumber] [bit] NULL,
	[tarfbill] [varchar](10) NULL,
	[usa] [bit] NULL,
	[ECPC] [bit] NULL,
	[amendment] [decimal](2, 0) NULL,
	[ShopRecv] [bit] NULL,
	[Changing] [bit] NULL,
	[BillInstrct] [varchar](255) NULL,
	[dShip] [bit] NULL,
	[DPAS] [bit] NULL,
	[FCI] [bit] NULL,
	[GOV] [bit] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ar_SalesP_Customer_History]    Script Date: 12/26/2025 5:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ar_SalesP_Customer_History]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ar_SalesP_Customer_History](
	[ID] [int] NOT NULL,
	[SoldCode] [int] NULL,
	[SalesP] [char](1) NOT NULL,
	[NoNoiseName] [char](30) NULL,
	[Customer] [varchar](30) NULL,
	[CustID] [char](20) NULL,
	[Who] [varchar](255) NOT NULL,
	[What] [char](10) NOT NULL,
	[When] [datetime] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ar_ShipAddr_History]    Script Date: 12/26/2025 5:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ar_ShipAddr_History]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ar_ShipAddr_History](
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
 CONSTRAINT [PK_ShipAddr_History] PRIMARY KEY NONCLUSTERED 
(
	[shipcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ar_Stocklst_Detail_History]    Script Date: 12/26/2025 5:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ar_Stocklst_Detail_History]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ar_Stocklst_Detail_History](
	[ID_Detail_Process] [int] NULL,
	[Who] [varchar](255) NOT NULL,
	[What] [char](10) NULL,
	[When] [datetime] NOT NULL,
	[ProcessValue] [money] NULL,
	[size_h] [numeric](9, 4) NULL,
	[size_l] [numeric](9, 4) NULL,
	[pc] [int] NULL,
	[dim1] [money] NOT NULL,
	[dim2] [money] NULL,
	[dim3] [money] NULL,
	[length] [char](160) NULL,
	[weight] [money] NOT NULL,
	[costvalue] [money] NULL,
	[descript] [varchar](20) NULL,
	[location] [char](10) NULL,
	[floorstatus] [char](1) NULL,
	[class] [char](1) NULL,
	[unit] [char](6) NULL,
	[RandLen] [bit] NULL,
	[InvCheck] [datetime] NULL,
	[id] [int] NOT NULL,
	[id_detail] [int] NOT NULL,
	[ID_Detail_History] [bigint] IDENTITY(1,1) NOT NULL,
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
 CONSTRAINT [PK_Stocklst_Detail_History] PRIMARY KEY CLUSTERED 
(
	[ID_Detail_History] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ar_Stocklst_Master_History]    Script Date: 12/26/2025 5:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ar_Stocklst_Master_History]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ar_Stocklst_Master_History](
	[Who] [varchar](255) NOT NULL,
	[what] [char](10) NULL,
	[when] [datetime] NOT NULL,
	[alloy] [char](12) NOT NULL,
	[form] [char](2) NOT NULL,
	[cc] [char](1) NULL,
	[cl] [char](1) NULL,
	[size] [money] NOT NULL,
	[cond] [varchar](50) NULL,
	[mweight] [money] NULL,
	[specs] [varchar](160) NULL,
	[heat] [varchar](50) NOT NULL,
	[lot] [varchar](10) NULL,
	[Paid] [money] NULL,
	[po_item] [char](12) NULL,
	[poduedate] [smalldatetime] NULL,
	[mill] [varchar](10) NULL,
	[stkdate] [smalldatetime] NULL,
	[history] [varchar](20) NULL,
	[num] [int] NULL,
	[POStatus] [char](1) NULL,
	[BrandName] [varchar](20) NULL,
	[FROM_ID] [int] NULL,
	[Melt] [varchar](7) NULL,
	[id] [int] NOT NULL,
	[ID_History] [int] IDENTITY(1,1) NOT NULL,
	[mS_QTY] [money] NULL,
	[WO_Detail] [int] NULL,
	[ProjID] [int] NULL,
	[MillTrace] [bit] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ar_StockLst_Process_Detail_History]    Script Date: 12/26/2025 5:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ar_StockLst_Process_Detail_History]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ar_StockLst_Process_Detail_History](
	[Who] [varchar](255) NOT NULL,
	[What] [char](10) NULL,
	[When] [datetime] NOT NULL,
	[ID] [int] NOT NULL,
	[ID_Detail] [int] NULL,
	[ID_Detail_Process] [int] NULL,
	[WO] [int] NULL,
	[SOitem] [char](10) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ar_StockLst_Process_GS_History]    Script Date: 12/26/2025 5:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ar_StockLst_Process_GS_History]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ar_StockLst_Process_GS_History](
	[who] [varchar](255) NOT NULL,
	[what] [char](10) NULL,
	[when] [datetime] NOT NULL,
	[SOitem] [char](10) NULL,
	[POitem] [char](12) NULL,
	[comment] [varchar](100) NOT NULL,
	[process_id] [char](10) NOT NULL,
	[PWeight] [money] NULL,
	[PPc] [int] NULL,
	[InvoiceValue] [money] NULL,
	[id_detail] [int] NOT NULL,
	[id_detail_process] [int] NULL,
	[Validated] [bit] NOT NULL,
	[Valid_When] [datetime] NULL,
	[S_QTY] [money] NULL,
	[S_P] [money] NULL,
	[S_PU] [tinyint] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ar_StockLst_Process_History]    Script Date: 12/26/2025 5:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ar_StockLst_Process_History]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ar_StockLst_Process_History](
	[who] [varchar](255) NOT NULL,
	[what] [char](10) NULL,
	[when] [datetime] NOT NULL,
	[SOitem] [char](10) NULL,
	[PO_item] [char](12) NULL,
	[SalesPerson] [varchar](20) NULL,
	[StartDate] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[Comment] [varchar](100) NOT NULL,
	[Process_ID] [char](10) NOT NULL,
	[Processor] [varchar](20) NULL,
	[AllowSub] [char](1) NULL,
	[PWeight] [money] NULL,
	[PPc] [int] NULL,
	[PFt] [float] NULL,
	[PU] [tinyint] NULL,
	[QTY] [money] NULL,
	[Ordered_QTY] [money] NULL,
	[Ordered_P] [money] NULL,
	[Pounds] [decimal](9, 1) NULL,
	[ID_Detail] [int] NOT NULL,
	[ID_Detail_Process] [bigint] NULL,
	[Removed] [datetime] NULL,
	[Validated] [char](1) NULL,
	[Valid_When] [datetime] NULL,
	[ID_Process_History] [bigint] IDENTITY(1,1) NOT NULL,
	[ReceivingID] [int] NOT NULL,
	[WO] [int] NULL,
	[WO_Detail] [int] NULL,
	[InqNumP] [char](9) NULL,
	[QTY_Due] [money] NULL,
	[Prc_QTY] [money] NULL,
	[Prc_Form] [char](2) NULL,
	[Prc_PCs] [int] NULL,
	[Prc_Dim1] [money] NULL,
	[Prc_Dim2] [money] NULL,
	[Prc_Dim3] [money] NULL,
	[FoundSTK] [smalldatetime] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ar_TimeTable_Hist]    Script Date: 12/26/2025 5:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ar_TimeTable_Hist]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ar_TimeTable_Hist](
	[IDHist] [bigint] NOT NULL,
	[ID] [bigint] NOT NULL,
	[EmployeeID] [nchar](10) NOT NULL,
	[SOItem] [char](10) NOT NULL,
	[Process] [char](10) NOT NULL,
	[ClockStart] [datetime] NOT NULL,
	[ClockStop] [datetime] NULL,
	[Minutes] [smallint] NULL,
	[BandsawCuts] [int] NULL,
	[Who] [nvarchar](250) NOT NULL,
	[What] [nvarchar](50) NOT NULL,
	[When] [datetime] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ar_UserTrack_History]    Script Date: 12/26/2025 5:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ar_UserTrack_History]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ar_UserTrack_History](
	[mess1] [varchar](254) NULL,
	[cprogram] [varchar](60) NULL,
	[errordate] [datetime] NOT NULL,
	[machine] [varchar](40) NULL,
	[ID] [bigint] NOT NULL,
	[ServerName] [varchar](50) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ar_UserTrack_Old]    Script Date: 12/26/2025 5:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ar_UserTrack_Old]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ar_UserTrack_Old](
	[mess1] [varchar](254) NULL,
	[cprogram] [varchar](60) NULL,
	[errordate] [datetime] NOT NULL,
	[machine] [varchar](40) NULL,
	[ID] [bigint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ar_WIPlst_Detail_History]    Script Date: 12/26/2025 5:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ar_WIPlst_Detail_History]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ar_WIPlst_Detail_History](
	[ID_Detail_Process] [int] NULL,
	[Who] [varchar](255) NOT NULL,
	[What] [char](10) NULL,
	[When] [datetime] NOT NULL,
	[ProcessValue] [money] NULL,
	[size_h] [numeric](9, 4) NULL,
	[size_l] [numeric](9, 4) NULL,
	[pc] [int] NULL,
	[dim1] [money] NOT NULL,
	[dim2] [money] NULL,
	[dim3] [money] NULL,
	[length] [char](160) NULL,
	[weight] [money] NOT NULL,
	[costvalue] [money] NULL,
	[descript] [varchar](20) NULL,
	[location] [char](10) NULL,
	[floorstatus] [char](1) NULL,
	[class] [char](1) NULL,
	[unit] [char](6) NULL,
	[RandLen] [bit] NULL,
	[InvCheck] [datetime] NULL,
	[id] [int] NOT NULL,
	[id_detail] [int] NOT NULL,
	[ID_Detail_History] [bigint] IDENTITY(1,1) NOT NULL,
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
	[sStockLst_ID_Detail] [int] NULL,
	[fStockLst_ID_Detail] [int] NULL,
 CONSTRAINT [PK_WIPLst_Detail_History] PRIMARY KEY CLUSTERED 
(
	[ID_Detail_History] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ar_WIPLst_Master_History]    Script Date: 12/26/2025 5:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ar_WIPLst_Master_History]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ar_WIPLst_Master_History](
	[Who] [varchar](255) NOT NULL,
	[what] [char](10) NULL,
	[when] [datetime] NOT NULL,
	[alloy] [char](12) NOT NULL,
	[form] [char](2) NOT NULL,
	[cc] [char](1) NULL,
	[cl] [char](1) NULL,
	[size] [money] NOT NULL,
	[cond] [varchar](50) NULL,
	[mweight] [money] NULL,
	[specs] [varchar](160) NULL,
	[heat] [varchar](50) NOT NULL,
	[lot] [varchar](10) NULL,
	[Paid] [money] NULL,
	[po_item] [char](12) NULL,
	[poduedate] [smalldatetime] NULL,
	[mill] [varchar](10) NULL,
	[stkdate] [smalldatetime] NULL,
	[history] [varchar](20) NULL,
	[num] [int] NULL,
	[POStatus] [char](1) NULL,
	[BrandName] [varchar](20) NULL,
	[FROM_ID] [int] NULL,
	[Melt] [varchar](7) NULL,
	[id] [int] NOT NULL,
	[ID_History] [int] IDENTITY(1,1) NOT NULL,
	[mS_QTY] [money] NULL,
	[WO_Detail] [int] NULL,
	[ProjID] [int] NULL,
	[MillTrace] [bit] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ar_WIPLst_Process_Detail_History]    Script Date: 12/26/2025 5:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ar_WIPLst_Process_Detail_History]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ar_WIPLst_Process_Detail_History](
	[Who] [varchar](255) NOT NULL,
	[What] [char](10) NULL,
	[When] [datetime] NOT NULL,
	[ID] [int] NOT NULL,
	[ID_Detail] [int] NULL,
	[ID_Detail_Process] [int] NULL,
	[WO] [int] NULL,
	[SOitem] [char](10) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ar_WIPLst_Process_GS_History]    Script Date: 12/26/2025 5:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ar_WIPLst_Process_GS_History]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ar_WIPLst_Process_GS_History](
	[who] [varchar](255) NOT NULL,
	[what] [char](10) NULL,
	[when] [datetime] NOT NULL,
	[SOitem] [char](10) NULL,
	[POitem] [char](12) NULL,
	[comment] [varchar](100) NOT NULL,
	[process_id] [char](10) NOT NULL,
	[PWeight] [money] NULL,
	[PPc] [int] NULL,
	[InvoiceValue] [money] NULL,
	[id_detail] [int] NOT NULL,
	[id_detail_process] [int] NULL,
	[Validated] [bit] NOT NULL,
	[Valid_When] [datetime] NULL,
	[S_QTY] [money] NULL,
	[S_P] [money] NULL,
	[S_PU] [tinyint] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ar_WIPLst_Process_History]    Script Date: 12/26/2025 5:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ar_WIPLst_Process_History]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ar_WIPLst_Process_History](
	[who] [varchar](255) NOT NULL,
	[what] [char](10) NULL,
	[when] [datetime] NOT NULL,
	[SOitem] [char](10) NULL,
	[PO_item] [char](12) NULL,
	[SalesPerson] [varchar](20) NULL,
	[StartDate] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[Comment] [varchar](100) NOT NULL,
	[Process_ID] [char](10) NOT NULL,
	[Processor] [varchar](20) NULL,
	[AllowSub] [char](1) NULL,
	[PWeight] [money] NULL,
	[PPc] [int] NULL,
	[PFt] [float] NULL,
	[PU] [tinyint] NULL,
	[QTY] [money] NULL,
	[Ordered_QTY] [money] NULL,
	[Ordered_P] [money] NULL,
	[Pounds] [decimal](9, 1) NULL,
	[ID_Detail] [int] NOT NULL,
	[ID_Detail_Process] [bigint] NULL,
	[Removed] [datetime] NULL,
	[Validated] [char](1) NOT NULL,
	[Valid_When] [datetime] NULL,
	[ReceivingID] [int] NOT NULL,
	[ID_Process_History] [bigint] IDENTITY(1,1) NOT NULL,
	[WO] [int] NULL,
	[WO_Detail] [int] NULL,
	[InqNumP] [char](9) NULL,
	[QTY_Due] [money] NULL,
	[Prc_QTY] [money] NULL,
	[Prc_Form] [char](2) NULL,
	[Prc_PCS] [int] NULL,
	[Prc_Dim1] [money] NULL,
	[Prc_Dim2] [money] NULL,
	[Prc_Dim3] [money] NULL,
	[FoundSTK] [smalldatetime] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AllQuotes_History-NoNoiseName]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_AllQuotes_History]') AND name = N'IX_Ar_AllQuotes_History-NoNoiseName')
CREATE NONCLUSTERED INDEX [IX_Ar_AllQuotes_History-NoNoiseName] ON [dbo].[Ar_AllQuotes_History]
(
	[NoNoiseName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AllQuotes_History-SalesNum]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_AllQuotes_History]') AND name = N'IX_Ar_AllQuotes_History-SalesNum')
CREATE NONCLUSTERED INDEX [IX_Ar_AllQuotes_History-SalesNum] ON [dbo].[Ar_AllQuotes_History]
(
	[SalesNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AllQuotes_History-SOitem]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_AllQuotes_History]') AND name = N'IX_Ar_AllQuotes_History-SOitem')
CREATE NONCLUSTERED INDEX [IX_Ar_AllQuotes_History-SOitem] ON [dbo].[Ar_AllQuotes_History]
(
	[SOitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AllQuotes_Old-NoNoiseName]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_AllQuotes_Old]') AND name = N'IX_Ar_AllQuotes_Old-NoNoiseName')
CREATE NONCLUSTERED INDEX [IX_Ar_AllQuotes_Old-NoNoiseName] ON [dbo].[Ar_AllQuotes_Old]
(
	[NoNoiseName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AllQuotes_Old-SalesNum]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_AllQuotes_Old]') AND name = N'IX_Ar_AllQuotes_Old-SalesNum')
CREATE NONCLUSTERED INDEX [IX_Ar_AllQuotes_Old-SalesNum] ON [dbo].[Ar_AllQuotes_Old]
(
	[SalesNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BrokerLst_Detail_History]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_BrokerLst_Detail_History]') AND name = N'IX_Ar_BrokerLst_Detail_History')
CREATE NONCLUSTERED INDEX [IX_Ar_BrokerLst_Detail_History] ON [dbo].[Ar_BrokerLst_Detail_History]
(
	[ID_Detail_Process] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BrokerLst_Detail_History-ID_Detail]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_BrokerLst_Detail_History]') AND name = N'IX_Ar_BrokerLst_Detail_History-ID_Detail')
CREATE NONCLUSTERED INDEX [IX_Ar_BrokerLst_Detail_History-ID_Detail] ON [dbo].[Ar_BrokerLst_Detail_History]
(
	[id_detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BrokerLst_Detail_History-ID_Detail_Process]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_BrokerLst_Detail_History]') AND name = N'IX_Ar_BrokerLst_Detail_History-ID_Detail_Process')
CREATE NONCLUSTERED INDEX [IX_Ar_BrokerLst_Detail_History-ID_Detail_Process] ON [dbo].[Ar_BrokerLst_Detail_History]
(
	[ID_Detail_Process] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BrokerLst_Master_history-ID]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_BrokerLst_Master_history]') AND name = N'IX_Ar_BrokerLst_Master_history-ID')
CREATE NONCLUSTERED INDEX [IX_Ar_BrokerLst_Master_history-ID] ON [dbo].[Ar_BrokerLst_Master_history]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_BrokerLst_Master_history-PO_Item]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_BrokerLst_Master_history]') AND name = N'IX_Ar_BrokerLst_Master_history-PO_Item')
CREATE NONCLUSTERED INDEX [IX_Ar_BrokerLst_Master_history-PO_Item] ON [dbo].[Ar_BrokerLst_Master_history]
(
	[po_item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BrokerLst_Process_Detail_History-ID_Detail]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_BrokerLst_Process_Detail_History]') AND name = N'IX_Ar_BrokerLst_Process_Detail_History-ID_Detail')
CREATE NONCLUSTERED INDEX [IX_Ar_BrokerLst_Process_Detail_History-ID_Detail] ON [dbo].[Ar_BrokerLst_Process_Detail_History]
(
	[ID_Detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BrokerLst_Process_Detail_History-ID_Detail_Process]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_BrokerLst_Process_Detail_History]') AND name = N'IX_Ar_BrokerLst_Process_Detail_History-ID_Detail_Process')
CREATE NONCLUSTERED INDEX [IX_Ar_BrokerLst_Process_Detail_History-ID_Detail_Process] ON [dbo].[Ar_BrokerLst_Process_Detail_History]
(
	[ID_Detail_Process] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BrokerLst_Process_History-ID_Detail]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_BrokerLst_Process_History]') AND name = N'IX_Ar_BrokerLst_Process_History-ID_Detail')
CREATE NONCLUSTERED INDEX [IX_Ar_BrokerLst_Process_History-ID_Detail] ON [dbo].[Ar_BrokerLst_Process_History]
(
	[ID_Detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_BrokerLst_Process_History-PO_item]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_BrokerLst_Process_History]') AND name = N'IX_Ar_BrokerLst_Process_History-PO_item')
CREATE NONCLUSTERED INDEX [IX_Ar_BrokerLst_Process_History-PO_item] ON [dbo].[Ar_BrokerLst_Process_History]
(
	[PO_item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_BrokerLst_Process_History-SOitem]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_BrokerLst_Process_History]') AND name = N'IX_Ar_BrokerLst_Process_History-SOitem')
CREATE NONCLUSTERED INDEX [IX_Ar_BrokerLst_Process_History-SOitem] ON [dbo].[Ar_BrokerLst_Process_History]
(
	[SOitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PurchaseOrder_hist-HPAPO]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_PurchaseOrder_hist]') AND name = N'IX_Ar_PurchaseOrder_hist-HPAPO')
CREATE NONCLUSTERED INDEX [IX_Ar_PurchaseOrder_hist-HPAPO] ON [dbo].[Ar_PurchaseOrder_hist]
(
	[hpapo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PurchaseOrder_hist-POitem]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_PurchaseOrder_hist]') AND name = N'IX_Ar_PurchaseOrder_hist-POitem')
CREATE NONCLUSTERED INDEX [IX_Ar_PurchaseOrder_hist-POitem] ON [dbo].[Ar_PurchaseOrder_hist]
(
	[poitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sales_History-SalesNum]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_Sales_History]') AND name = N'IX_Ar_Sales_History-SalesNum')
CREATE NONCLUSTERED INDEX [IX_Ar_Sales_History-SalesNum] ON [dbo].[Ar_Sales_History]
(
	[salesnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sales_No_History-SalesNum]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_Sales_No_History]') AND name = N'IX_Ar_Sales_No_History-SalesNum')
CREATE NONCLUSTERED INDEX [IX_Ar_Sales_No_History-SalesNum] ON [dbo].[Ar_Sales_No_History]
(
	[salesnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SalesP_Customer_History-Customer]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_SalesP_Customer_History]') AND name = N'IX_Ar_SalesP_Customer_History-Customer')
CREATE NONCLUSTERED INDEX [IX_Ar_SalesP_Customer_History-Customer] ON [dbo].[Ar_SalesP_Customer_History]
(
	[Customer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SalesP_Customer_History-NoNoiseName]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_SalesP_Customer_History]') AND name = N'IX_Ar_SalesP_Customer_History-NoNoiseName')
CREATE NONCLUSTERED INDEX [IX_Ar_SalesP_Customer_History-NoNoiseName] ON [dbo].[Ar_SalesP_Customer_History]
(
	[NoNoiseName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SalesP_Customer_History-SoldCode]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_SalesP_Customer_History]') AND name = N'IX_Ar_SalesP_Customer_History-SoldCode')
CREATE NONCLUSTERED INDEX [IX_Ar_SalesP_Customer_History-SoldCode] ON [dbo].[Ar_SalesP_Customer_History]
(
	[SoldCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Stocklst_Detail_History]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_Stocklst_Detail_History]') AND name = N'IX_Ar_Stocklst_Detail_History')
CREATE NONCLUSTERED INDEX [IX_Ar_Stocklst_Detail_History] ON [dbo].[Ar_Stocklst_Detail_History]
(
	[ID_Detail_Process] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Stocklst_Detail_History-ID_Detail]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_Stocklst_Detail_History]') AND name = N'IX_Ar_Stocklst_Detail_History-ID_Detail')
CREATE NONCLUSTERED INDEX [IX_Ar_Stocklst_Detail_History-ID_Detail] ON [dbo].[Ar_Stocklst_Detail_History]
(
	[id_detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Stocklst_Detail_History-ID_Detail_Process]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_Stocklst_Detail_History]') AND name = N'IX_Ar_Stocklst_Detail_History-ID_Detail_Process')
CREATE NONCLUSTERED INDEX [IX_Ar_Stocklst_Detail_History-ID_Detail_Process] ON [dbo].[Ar_Stocklst_Detail_History]
(
	[ID_Detail_Process] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Stocklst_Master_History-Heat]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_Stocklst_Master_History]') AND name = N'IX_Ar_Stocklst_Master_History-Heat')
CREATE NONCLUSTERED INDEX [IX_Ar_Stocklst_Master_History-Heat] ON [dbo].[Ar_Stocklst_Master_History]
(
	[heat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Stocklst_Master_History-ID]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_Stocklst_Master_History]') AND name = N'IX_Ar_Stocklst_Master_History-ID')
CREATE NONCLUSTERED INDEX [IX_Ar_Stocklst_Master_History-ID] ON [dbo].[Ar_Stocklst_Master_History]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Stocklst_Master_History-PO_Item]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_Stocklst_Master_History]') AND name = N'IX_Ar_Stocklst_Master_History-PO_Item')
CREATE NONCLUSTERED INDEX [IX_Ar_Stocklst_Master_History-PO_Item] ON [dbo].[Ar_Stocklst_Master_History]
(
	[po_item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StockLst_Process_Detail_History-ID_Detail]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_StockLst_Process_Detail_History]') AND name = N'IX_Ar_StockLst_Process_Detail_History-ID_Detail')
CREATE NONCLUSTERED INDEX [IX_Ar_StockLst_Process_Detail_History-ID_Detail] ON [dbo].[Ar_StockLst_Process_Detail_History]
(
	[ID_Detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StockLst_Process_Detail_History-ID_Detail_Process]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_StockLst_Process_Detail_History]') AND name = N'IX_Ar_StockLst_Process_Detail_History-ID_Detail_Process')
CREATE NONCLUSTERED INDEX [IX_Ar_StockLst_Process_Detail_History-ID_Detail_Process] ON [dbo].[Ar_StockLst_Process_Detail_History]
(
	[ID_Detail_Process] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_StockLst_Process_Detail_History-SOitem]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_StockLst_Process_Detail_History]') AND name = N'IX_Ar_StockLst_Process_Detail_History-SOitem')
CREATE NONCLUSTERED INDEX [IX_Ar_StockLst_Process_Detail_History-SOitem] ON [dbo].[Ar_StockLst_Process_Detail_History]
(
	[SOitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StockLst_Process_History-ID_Detail]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_StockLst_Process_History]') AND name = N'IX_Ar_StockLst_Process_History-ID_Detail')
CREATE NONCLUSTERED INDEX [IX_Ar_StockLst_Process_History-ID_Detail] ON [dbo].[Ar_StockLst_Process_History]
(
	[ID_Detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StockLst_Process_History-ID_Detail_Process]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_StockLst_Process_History]') AND name = N'IX_Ar_StockLst_Process_History-ID_Detail_Process')
CREATE NONCLUSTERED INDEX [IX_Ar_StockLst_Process_History-ID_Detail_Process] ON [dbo].[Ar_StockLst_Process_History]
(
	[ID_Detail_Process] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_StockLst_Process_History-PO_item]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_StockLst_Process_History]') AND name = N'IX_Ar_StockLst_Process_History-PO_item')
CREATE NONCLUSTERED INDEX [IX_Ar_StockLst_Process_History-PO_item] ON [dbo].[Ar_StockLst_Process_History]
(
	[PO_item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StockLst_Process_History-ReceivingID]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_StockLst_Process_History]') AND name = N'IX_Ar_StockLst_Process_History-ReceivingID')
CREATE NONCLUSTERED INDEX [IX_Ar_StockLst_Process_History-ReceivingID] ON [dbo].[Ar_StockLst_Process_History]
(
	[ReceivingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_StockLst_Process_History-SOitem]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_StockLst_Process_History]') AND name = N'IX_Ar_StockLst_Process_History-SOitem')
CREATE NONCLUSTERED INDEX [IX_Ar_StockLst_Process_History-SOitem] ON [dbo].[Ar_StockLst_Process_History]
(
	[SOitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserTrack_History-ErrorDate]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_UserTrack_History]') AND name = N'IX_Ar_UserTrack_History-ErrorDate')
CREATE NONCLUSTERED INDEX [IX_Ar_UserTrack_History-ErrorDate] ON [dbo].[Ar_UserTrack_History]
(
	[errordate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_WIPLst_Master_History-ID]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_WIPLst_Master_History]') AND name = N'IX_Ar_WIPLst_Master_History-ID')
CREATE NONCLUSTERED INDEX [IX_Ar_WIPLst_Master_History-ID] ON [dbo].[Ar_WIPLst_Master_History]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_WIPLst_Master_History-PO_Item]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_WIPLst_Master_History]') AND name = N'IX_Ar_WIPLst_Master_History-PO_Item')
CREATE NONCLUSTERED INDEX [IX_Ar_WIPLst_Master_History-PO_Item] ON [dbo].[Ar_WIPLst_Master_History]
(
	[po_item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_WIPLst_Process_History-PO_item]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_WIPLst_Process_History]') AND name = N'IX_Ar_WIPLst_Process_History-PO_item')
CREATE NONCLUSTERED INDEX [IX_Ar_WIPLst_Process_History-PO_item] ON [dbo].[Ar_WIPLst_Process_History]
(
	[PO_item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_WIPLst_Process_History-WO_Detail]    Script Date: 12/26/2025 5:28:42 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ar_WIPLst_Process_History]') AND name = N'IX_Ar_WIPLst_Process_History-WO_Detail')
CREATE NONCLUSTERED INDEX [IX_Ar_WIPLst_Process_History-WO_Detail] ON [dbo].[Ar_WIPLst_Process_History]
(
	[WO_Detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_AlloySurcharge_history_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_AlloySurcharge_History] ADD  CONSTRAINT [DF_Ar_AlloySurcharge_history_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_AlloySurcharge_history_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_AlloySurcharge_History] ADD  CONSTRAINT [DF_Ar_AlloySurcharge_history_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_AllQuotes_History_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_AllQuotes_History] ADD  CONSTRAINT [DF_Ar_AllQuotes_History_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_AllQuotes_History_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_AllQuotes_History] ADD  CONSTRAINT [DF_Ar_AllQuotes_History_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_AllQuotes_Old_CL]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_AllQuotes_Old] ADD  CONSTRAINT [DF_Ar_AllQuotes_Old_CL]  DEFAULT ('') FOR [CL]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_BrokerLst_Detail_History_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_BrokerLst_Detail_History] ADD  CONSTRAINT [DF_Ar_BrokerLst_Detail_History_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_BrokerLst_Detail_History_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_BrokerLst_Detail_History] ADD  CONSTRAINT [DF_Ar_BrokerLst_Detail_History_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_BrokerLst_Master_history_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_BrokerLst_Master_history] ADD  CONSTRAINT [DF_Ar_BrokerLst_Master_history_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_BrokerLst_Master_history_when]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_BrokerLst_Master_history] ADD  CONSTRAINT [DF_Ar_BrokerLst_Master_history_when]  DEFAULT (getdate()) FOR [when]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_BrokerLst_Master_history_Melt]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_BrokerLst_Master_history] ADD  CONSTRAINT [DF_Ar_BrokerLst_Master_history_Melt]  DEFAULT (' ') FOR [Melt]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_BrokerLst_Process_Detail_History_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_BrokerLst_Process_Detail_History] ADD  CONSTRAINT [DF_Ar_BrokerLst_Process_Detail_History_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_BrokerLst_Process_Detail_History_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_BrokerLst_Process_Detail_History] ADD  CONSTRAINT [DF_Ar_BrokerLst_Process_Detail_History_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_BrokerLst_Process_GS_History_who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_BrokerLst_Process_GS_History] ADD  CONSTRAINT [DF_Ar_BrokerLst_Process_GS_History_who]  DEFAULT (suser_sname()) FOR [who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_BrokerLst_Process_GS_History_when]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_BrokerLst_Process_GS_History] ADD  CONSTRAINT [DF_Ar_BrokerLst_Process_GS_History_when]  DEFAULT (getdate()) FOR [when]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_BrokerLst_Process_History_who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_BrokerLst_Process_History] ADD  CONSTRAINT [DF_Ar_BrokerLst_Process_History_who]  DEFAULT (suser_sname()) FOR [who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_BrokerLst_Process_History_when]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_BrokerLst_Process_History] ADD  CONSTRAINT [DF_Ar_BrokerLst_Process_History_when]  DEFAULT (getdate()) FOR [when]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_BrokerLst_Process_History_Removed]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_BrokerLst_Process_History] ADD  CONSTRAINT [DF_Ar_BrokerLst_Process_History_Removed]  DEFAULT (getdate()) FOR [Removed]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_Cert_History_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_Cert_History] ADD  CONSTRAINT [DF_Ar_Cert_History_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_Cert_History_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_Cert_History] ADD  CONSTRAINT [DF_Ar_Cert_History_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_GFMlog_Machine]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_GFMlog_hist] ADD  CONSTRAINT [DF_Ar_GFMlog_Machine]  DEFAULT ('') FOR [Machine]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_GFMlog_Oper]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_GFMlog_hist] ADD  CONSTRAINT [DF_Ar_GFMlog_Oper]  DEFAULT ('') FOR [Oper]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_GFMlog_hist_ProjID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_GFMlog_hist] ADD  CONSTRAINT [DF_Ar_GFMlog_hist_ProjID]  DEFAULT ((0)) FOR [ProjID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_GFMlog_hist_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_GFMlog_hist] ADD  CONSTRAINT [DF_Ar_GFMlog_hist_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_GFMlog_hist_What]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_GFMlog_hist] ADD  CONSTRAINT [DF_Ar_GFMlog_hist_What]  DEFAULT ('Delete') FOR [What]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_GFMlog_hist_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_GFMlog_hist] ADD  CONSTRAINT [DF_Ar_GFMlog_hist_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_LakeErie_log_history_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_LakeErie_log_hist] ADD  CONSTRAINT [DF_Ar_LakeErie_log_history_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_LakeErie_log_history_What]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_LakeErie_log_hist] ADD  CONSTRAINT [DF_Ar_LakeErie_log_history_What]  DEFAULT ('Delete') FOR [What]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_LakeErie_log_history_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_LakeErie_log_hist] ADD  CONSTRAINT [DF_Ar_LakeErie_log_history_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_PackingSlip_No_who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_PackingSlip_No] ADD  CONSTRAINT [DF_Ar_PackingSlip_No_who]  DEFAULT (suser_sname()) FOR [WHO]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_PriceTable_hist_cost2018]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_PriceTable_hist] ADD  CONSTRAINT [DF_Ar_PriceTable_hist_cost2018]  DEFAULT ((0)) FOR [cost2018]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_PriceTable_hist_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_PriceTable_hist] ADD  CONSTRAINT [DF_Ar_PriceTable_hist_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_PriceTable_hist_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_PriceTable_hist] ADD  CONSTRAINT [DF_Ar_PriceTable_hist_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_PurchaseOrder_hist_cmplt]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_PurchaseOrder_hist] ADD  CONSTRAINT [DF_Ar_PurchaseOrder_hist_cmplt]  DEFAULT ((0)) FOR [cmplt]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_PurchaseOrder_hist_Metric]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_PurchaseOrder_hist] ADD  CONSTRAINT [DF_Ar_PurchaseOrder_hist_Metric]  DEFAULT ((0)) FOR [Metric]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_PurchaseOrder_hist_Melt_type]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_PurchaseOrder_hist] ADD  CONSTRAINT [DF_Ar_PurchaseOrder_hist_Melt_type]  DEFAULT ('-') FOR [Melt]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_PurchaseOrder_hist_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_PurchaseOrder_hist] ADD  CONSTRAINT [DF_Ar_PurchaseOrder_hist_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_PurchaseOrder_hist_WHEN]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_PurchaseOrder_hist] ADD  CONSTRAINT [DF_Ar_PurchaseOrder_hist_WHEN]  DEFAULT (getdate()) FOR [WHEN]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_Roll_log_hist_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_Roll_log_hist] ADD  CONSTRAINT [DF_Ar_Roll_log_hist_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_Roll_log_hist_What]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_Roll_log_hist] ADD  CONSTRAINT [DF_Ar_Roll_log_hist_What]  DEFAULT ('Delete') FOR [What]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_Roll_log_hist_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_Roll_log_hist] ADD  CONSTRAINT [DF_Ar_Roll_log_hist_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_Sales_History_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_Sales_History] ADD  CONSTRAINT [DF_Ar_Sales_History_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_Sales_History_when]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_Sales_History] ADD  CONSTRAINT [DF_Ar_Sales_History_when]  DEFAULT (getdate()) FOR [when]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_Sales_History_Review]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_Sales_History] ADD  CONSTRAINT [DF_Ar_Sales_History_Review]  DEFAULT ((0)) FOR [RVW_Stock]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_Sales_History_RVW_Prod]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_Sales_History] ADD  CONSTRAINT [DF_Ar_Sales_History_RVW_Prod]  DEFAULT ((0)) FOR [RVW_Prod]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_Sales_No_History_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_Sales_No_History] ADD  CONSTRAINT [DF_Ar_Sales_No_History_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_Sales_No_History_when]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_Sales_No_History] ADD  CONSTRAINT [DF_Ar_Sales_No_History_when]  DEFAULT (getdate()) FOR [when]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_SalesP_Customer_History_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_SalesP_Customer_History] ADD  CONSTRAINT [DF_Ar_SalesP_Customer_History_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_SalesP_Customer_History_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_SalesP_Customer_History] ADD  CONSTRAINT [DF_Ar_SalesP_Customer_History_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_ShipAddr_History_lastedit]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_ShipAddr_History] ADD  CONSTRAINT [DF_Ar_ShipAddr_History_lastedit]  DEFAULT (getdate()) FOR [lastedit]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_ShipAddr_History_WhoAdd]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_ShipAddr_History] ADD  CONSTRAINT [DF_Ar_ShipAddr_History_WhoAdd]  DEFAULT (suser_sname()) FOR [WhoAdd]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_Stocklst_Detail_History_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_Stocklst_Detail_History] ADD  CONSTRAINT [DF_Ar_Stocklst_Detail_History_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_Stocklst_Detail_History_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_Stocklst_Detail_History] ADD  CONSTRAINT [DF_Ar_Stocklst_Detail_History_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_Stocklst_Master_History_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_Stocklst_Master_History] ADD  CONSTRAINT [DF_Ar_Stocklst_Master_History_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_Stocklst_Master_History_when]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_Stocklst_Master_History] ADD  CONSTRAINT [DF_Ar_Stocklst_Master_History_when]  DEFAULT (getdate()) FOR [when]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_Stocklst_Master_History_Melt]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_Stocklst_Master_History] ADD  CONSTRAINT [DF_Ar_Stocklst_Master_History_Melt]  DEFAULT (' ') FOR [Melt]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_StockLst_Process_Detail_History_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_StockLst_Process_Detail_History] ADD  CONSTRAINT [DF_Ar_StockLst_Process_Detail_History_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_StockLst_Process_Detail_History_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_StockLst_Process_Detail_History] ADD  CONSTRAINT [DF_Ar_StockLst_Process_Detail_History_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_StockLst_Process_GS_History_who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_StockLst_Process_GS_History] ADD  CONSTRAINT [DF_Ar_StockLst_Process_GS_History_who]  DEFAULT (suser_sname()) FOR [who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_StockLst_Process_GS_History_when]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_StockLst_Process_GS_History] ADD  CONSTRAINT [DF_Ar_StockLst_Process_GS_History_when]  DEFAULT (getdate()) FOR [when]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_StockLst_Process_History_who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_StockLst_Process_History] ADD  CONSTRAINT [DF_Ar_StockLst_Process_History_who]  DEFAULT (suser_sname()) FOR [who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_StockLst_Process_History_when]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_StockLst_Process_History] ADD  CONSTRAINT [DF_Ar_StockLst_Process_History_when]  DEFAULT (getdate()) FOR [when]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_StockLst_Process_History_Valid_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_StockLst_Process_History] ADD  CONSTRAINT [DF_Ar_StockLst_Process_History_Valid_When]  DEFAULT (getdate()) FOR [Valid_When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_TimeTable_Hist_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_TimeTable_Hist] ADD  CONSTRAINT [DF_Ar_TimeTable_Hist_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_TimeTable_Hist_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_TimeTable_Hist] ADD  CONSTRAINT [DF_Ar_TimeTable_Hist_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_WIPlst_Detail_History_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_WIPlst_Detail_History] ADD  CONSTRAINT [DF_Ar_WIPlst_Detail_History_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_WIPlst_Detail_History_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_WIPlst_Detail_History] ADD  CONSTRAINT [DF_Ar_WIPlst_Detail_History_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_WIPLst_Master_History_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_WIPLst_Master_History] ADD  CONSTRAINT [DF_Ar_WIPLst_Master_History_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_WIPLst_Master_History_when]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_WIPLst_Master_History] ADD  CONSTRAINT [DF_Ar_WIPLst_Master_History_when]  DEFAULT (getdate()) FOR [when]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_WIPLst_Master_History_Melt]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_WIPLst_Master_History] ADD  CONSTRAINT [DF_Ar_WIPLst_Master_History_Melt]  DEFAULT (' ') FOR [Melt]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_WIPLst_Process_Detail_History_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_WIPLst_Process_Detail_History] ADD  CONSTRAINT [DF_Ar_WIPLst_Process_Detail_History_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_WIPLst_Process_Detail_History_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_WIPLst_Process_Detail_History] ADD  CONSTRAINT [DF_Ar_WIPLst_Process_Detail_History_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_WIPLst_Process_GS_History_who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_WIPLst_Process_GS_History] ADD  CONSTRAINT [DF_Ar_WIPLst_Process_GS_History_who]  DEFAULT (suser_sname()) FOR [who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_WIPLst_Process_GS_History_when]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_WIPLst_Process_GS_History] ADD  CONSTRAINT [DF_Ar_WIPLst_Process_GS_History_when]  DEFAULT (getdate()) FOR [when]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_WIPLst_Process_History_who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_WIPLst_Process_History] ADD  CONSTRAINT [DF_Ar_WIPLst_Process_History_who]  DEFAULT (suser_sname()) FOR [who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Ar_WIPLst_Process_History_when]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Ar_WIPLst_Process_History] ADD  CONSTRAINT [DF_Ar_WIPLst_Process_History_when]  DEFAULT (getdate()) FOR [when]
END
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.AllQuotes_History', N'COLUMN',N'Surcharge'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Surcharge at time of quote' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_AllQuotes_History', @level2type=N'COLUMN',@level2name=N'Surcharge'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.AllQuotes_History', N'COLUMN',N'NoNoiseName'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.NoNoiseName()' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_AllQuotes_History', @level2type=N'COLUMN',@level2name=N'NoNoiseName'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.AllQuotes_History', N'COLUMN',N'CustDisc'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.f_Customer_Discount(CustID)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_AllQuotes_History', @level2type=N'COLUMN',@level2name=N'CustDisc'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.AllQuotes_History', N'COLUMN',N'DescriptID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'DescriptID or ProductID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_AllQuotes_History', @level2type=N'COLUMN',@level2name=N'DescriptID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.AllQuotes_Old', N'COLUMN',N'Surcharge'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Surcharge at time of quote' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_AllQuotes_Old', @level2type=N'COLUMN',@level2name=N'Surcharge'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.AllQuotes_Old', N'COLUMN',N'NoNoiseName'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.NoNoiseName()' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_AllQuotes_Old', @level2type=N'COLUMN',@level2name=N'NoNoiseName'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.BrokerLst_Detail_History', N'COLUMN',N'LiveCheck'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Added so UNION with Stock works' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_BrokerLst_Detail_History', @level2type=N'COLUMN',@level2name=N'LiveCheck'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.BrokerLst_Detail_History', N'COLUMN',N'AccountingCheck'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Added so UNION with Stock works' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_BrokerLst_Detail_History', @level2type=N'COLUMN',@level2name=N'AccountingCheck'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.BrokerLst_Detail_History', N'COLUMN',N'Prime'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Prime Stock Size' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_BrokerLst_Detail_History', @level2type=N'COLUMN',@level2name=N'Prime'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.BrokerLst_Master_history', N'COLUMN',N'cl'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'''Condition Level''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_BrokerLst_Master_history', @level2type=N'COLUMN',@level2name=N'cl'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.BrokerLst_Master_history', N'COLUMN',N'mS_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Master QTY' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_BrokerLst_Master_history', @level2type=N'COLUMN',@level2name=N'mS_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.BrokerLst_Master_history', N'COLUMN',N'MillTrace'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Full mill Tracabilty.  Cert is not marked as Exact Mill Duplicate.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_BrokerLst_Master_history', @level2type=N'COLUMN',@level2name=N'MillTrace'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.BrokerLst_Process_GS_History', N'COLUMN',N'S_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Stock QTY' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_BrokerLst_Process_GS_History', @level2type=N'COLUMN',@level2name=N'S_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.BrokerLst_Process_GS_History', N'COLUMN',N'S_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Stock Price' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_BrokerLst_Process_GS_History', @level2type=N'COLUMN',@level2name=N'S_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.BrokerLst_Process_GS_History', N'COLUMN',N'S_PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Stock PriceUnit 1=$/#, 2= $/FT, 3= $/PC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_BrokerLst_Process_GS_History', @level2type=N'COLUMN',@level2name=N'S_PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.BrokerLst_Process_History', N'COLUMN',N'who'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Process_QTY' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_BrokerLst_Process_History', @level2type=N'COLUMN',@level2name=N'who'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.BrokerLst_Process_History', N'COLUMN',N'PPc'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Process PCs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_BrokerLst_Process_History', @level2type=N'COLUMN',@level2name=N'PPc'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.BrokerLst_Process_History', N'COLUMN',N'PFt'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Process Feet' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_BrokerLst_Process_History', @level2type=N'COLUMN',@level2name=N'PFt'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.BrokerLst_Process_History', N'COLUMN',N'PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PriceUnit 1=$/#, 2= $/FT, 3= $/PC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_BrokerLst_Process_History', @level2type=N'COLUMN',@level2name=N'PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.BrokerLst_Process_History', N'COLUMN',N'Ordered_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Price Sold at' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_BrokerLst_Process_History', @level2type=N'COLUMN',@level2name=N'Ordered_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.BrokerLst_Process_History', N'COLUMN',N'InqNumP'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'8 digit Quote then SP init' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_BrokerLst_Process_History', @level2type=N'COLUMN',@level2name=N'InqNumP'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.BrokerLst_Process_History', N'COLUMN',N'QTY_Due'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'depricated, use Prc_QTY' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_BrokerLst_Process_History', @level2type=N'COLUMN',@level2name=N'QTY_Due'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.BrokerLst_Process_History', N'COLUMN',N'Prc_Qty'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Process Qty' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_BrokerLst_Process_History', @level2type=N'COLUMN',@level2name=N'Prc_Qty'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.BrokerLst_Process_History', N'COLUMN',N'FoundSTK'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When the Shop marks Found on INCOMING process  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_BrokerLst_Process_History', @level2type=N'COLUMN',@level2name=N'FoundSTK'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.Cert_History', N'COLUMN',N'Cond_Fin'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Material condition and Finish' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_Cert_History', @level2type=N'COLUMN',@level2name=N'Cond_Fin'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.GFMlog_hist', N'COLUMN',N'PO'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer PO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_GFMlog_hist', @level2type=N'COLUMN',@level2name=N'PO'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.GFMlog_hist', N'COLUMN',N'tLoc'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Test Location: Center, MidRadius, Outer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_GFMlog_hist', @level2type=N'COLUMN',@level2name=N'tLoc'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.GFMlog_hist', N'COLUMN',N'tLoc2'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Test Location: Center, MidRadius, Outer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_GFMlog_hist', @level2type=N'COLUMN',@level2name=N'tLoc2'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.GFMlog_hist', N'COLUMN',N'tLoc3'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Test Location: Center, MidRadius, Outer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_GFMlog_hist', @level2type=N'COLUMN',@level2name=N'tLoc3'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.GFMlog_hist', N'COLUMN',N'tLoc4'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Test Location: Center, MidRadius, Outer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_GFMlog_hist', @level2type=N'COLUMN',@level2name=N'tLoc4'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.GFMlog_hist', N'COLUMN',N'tLoc5'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Test Location: Center, MidRadius, Outer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_GFMlog_hist', @level2type=N'COLUMN',@level2name=N'tLoc5'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.GFMlog_hist', N'COLUMN',N'GFMp'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GFM Price' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_GFMlog_hist', @level2type=N'COLUMN',@level2name=N'GFMp'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.GFMlog_hist', N'COLUMN',N'Ovenp'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Oven Price' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_GFMlog_hist', @level2type=N'COLUMN',@level2name=N'Ovenp'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.GFMlog_hist', N'COLUMN',N'SrvcPO'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Conversion or Service HPA PO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_GFMlog_hist', @level2type=N'COLUMN',@level2name=N'SrvcPO'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.GFMlog_hist', N'COLUMN',N'SpaceX'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tested for SpaceX' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_GFMlog_hist', @level2type=N'COLUMN',@level2name=N'SpaceX'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.GFMlog_hist', N'COLUMN',N'ProjID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'From dbo.Stock_Projected' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_GFMlog_hist', @level2type=N'COLUMN',@level2name=N'ProjID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.LakeErie_log_hist', N'COLUMN',N'SrvcPO'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Conversion or Service HPA PO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_LakeErie_log_hist', @level2type=N'COLUMN',@level2name=N'SrvcPO'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.PackingSlip_No', N'COLUMN',N'packingsli'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_PackingSlip_No', @level2type=N'COLUMN',@level2name=N'packingsli'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.PackingSlip_No', N'COLUMN',N'totalweight'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Packed Weight Entered as text - Redundant to PackedWeight INT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_PackingSlip_No', @level2type=N'COLUMN',@level2name=N'totalweight'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.PackingSlip_No', N'COLUMN',N'Kg'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kilogram TotalWeight Packed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_PackingSlip_No', @level2type=N'COLUMN',@level2name=N'Kg'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.PackingSlip_No', N'COLUMN',N'packedweight'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'was PackedWeig' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_PackingSlip_No', @level2type=N'COLUMN',@level2name=N'packedweight'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.PackingSlip_No', N'COLUMN',N'RSO_Date'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'package is Ready to Ship Out scan date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_PackingSlip_No', @level2type=N'COLUMN',@level2name=N'RSO_Date'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.PackingSlip_No', N'COLUMN',N'PickUpDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date of first scan where PackinSli was NOT in RSO.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_PackingSlip_No', @level2type=N'COLUMN',@level2name=N'PickUpDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.PackingSlip_No', N'COLUMN',N'HoldReason'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Reason package is on hold.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_PackingSlip_No', @level2type=N'COLUMN',@level2name=N'HoldReason'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.PackingSlip_No', N'COLUMN',N'WHO'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'packingsli create user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_PackingSlip_No', @level2type=N'COLUMN',@level2name=N'WHO'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.PurchaseOrder_hist', N'COLUMN',N'ShipLocation'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Location as defined in StockLst_Location RemoteStock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_PurchaseOrder_hist', @level2type=N'COLUMN',@level2name=N'ShipLocation'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.PurchaseOrder_hist', N'COLUMN',N'VendorPOConf'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Vendor Confirms receipt of PO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_PurchaseOrder_hist', @level2type=N'COLUMN',@level2name=N'VendorPOConf'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.PurchaseOrder_hist', N'COLUMN',N'Melt'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SELECT [Type] FROM dbo.Melt_Type' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_PurchaseOrder_hist', @level2type=N'COLUMN',@level2name=N'Melt'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.PurchaseOrder_hist', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Used to hold Deleted PO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_PurchaseOrder_hist'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.Receiving_Hist', N'COLUMN',N'ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Receiving ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_Receiving_Hist', @level2type=N'COLUMN',@level2name=N'ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.Receiving_Hist', N'COLUMN',N'Received'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date Entered' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_Receiving_Hist', @level2type=N'COLUMN',@level2name=N'Received'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.Receiving_Hist', N'COLUMN',N'POitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'9-2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_Receiving_Hist', @level2type=N'COLUMN',@level2name=N'POitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.Receiving_Hist', N'COLUMN',N'SOitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'7-2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_Receiving_Hist', @level2type=N'COLUMN',@level2name=N'SOitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.Receiving_Hist', N'COLUMN',N'Cert'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Material came with Cert' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_Receiving_Hist', @level2type=N'COLUMN',@level2name=N'Cert'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.Receiving_Hist', N'COLUMN',N'Init'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Worker Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_Receiving_Hist', @level2type=N'COLUMN',@level2name=N'Init'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.Receiving_Hist', N'COLUMN',N'Date'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date arrived at HPA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_Receiving_Hist', @level2type=N'COLUMN',@level2name=N'Date'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.Receiving_Hist', N'COLUMN',N'GoodPapers'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'For QA to track Vendor problems.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_Receiving_Hist', @level2type=N'COLUMN',@level2name=N'GoodPapers'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.Receiving_Hist', N'COLUMN',N'ActualW'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA scale weight' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_Receiving_Hist', @level2type=N'COLUMN',@level2name=N'ActualW'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.Receiving_Hist', N'COLUMN',N'BillW'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Billed Weight' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_Receiving_Hist', @level2type=N'COLUMN',@level2name=N'BillW'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.Receiving_Hist', N'COLUMN',N'Vendor'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Suppliers name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_Receiving_Hist', @level2type=N'COLUMN',@level2name=N'Vendor'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.Receiving_Hist', N'COLUMN',N'Cancelled'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data has been removed from PurchaseOrders and StockLst' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_Receiving_Hist', @level2type=N'COLUMN',@level2name=N'Cancelled'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.Receiving_Hist', N'COLUMN',N'WhenAdd'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date and Time saved to table on Insert.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_Receiving_Hist', @level2type=N'COLUMN',@level2name=N'WhenAdd'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.Receiving_Hist', N'COLUMN',N'ID_Master'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'StockLst Master ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_Receiving_Hist', @level2type=N'COLUMN',@level2name=N'ID_Master'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.Receiving_Hist', N'COLUMN',N'StockTable'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'S stock, B broker, N NA like Service' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_Receiving_Hist', @level2type=N'COLUMN',@level2name=N'StockTable'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.Receiving_Hist', N'COLUMN',N'RMA_No'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Receipt back of RMA material.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_Receiving_Hist', @level2type=N'COLUMN',@level2name=N'RMA_No'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.Receiving_Hist', N'COLUMN',N'R_Total'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Acct Stnd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_Receiving_Hist', @level2type=N'COLUMN',@level2name=N'R_Total'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.Receiving_Hist', N'COLUMN',N'PO_Total'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Vendor Price' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_Receiving_Hist', @level2type=N'COLUMN',@level2name=N'PO_Total'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.Receiving_Hist', N'COLUMN',N'Who'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cert ID of Mill Cert' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_Receiving_Hist', @level2type=N'COLUMN',@level2name=N'Who'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.Roll_log_hist', N'COLUMN',N'SrvcPO'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Conversion or Service HPA PO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_Roll_log_hist', @level2type=N'COLUMN',@level2name=N'SrvcPO'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.Sales_History', N'COLUMN',N'Typ'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'I Inv, B Broker, M Mill, P Production, S Service' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_Sales_History', @level2type=N'COLUMN',@level2name=N'Typ'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.Sales_History', N'COLUMN',N'InqNumP'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'8 digits of InqNum + SalesP char' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_Sales_History', @level2type=N'COLUMN',@level2name=N'InqNumP'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.Sales_History', N'COLUMN',N'ID_AllQuotes'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Stores the AllQuotes ID for forensics' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_Sales_History', @level2type=N'COLUMN',@level2name=N'ID_AllQuotes'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.Sales_History', N'COLUMN',N'Review_Date'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date review started' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_Sales_History', @level2type=N'COLUMN',@level2name=N'Review_Date'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.Sales_No_History', N'COLUMN',N'CustID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Accounting ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_Sales_No_History', @level2type=N'COLUMN',@level2name=N'CustID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.Sales_No_History', N'COLUMN',N'dShip'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Direct shipment from Vendor to Customer, True Brokered.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_Sales_No_History', @level2type=N'COLUMN',@level2name=N'dShip'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.Sales_No_History', N'COLUMN',N'DPAS'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'DoD Rated, keep details like DO-A1, DX-A3 in Comments Field' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_Sales_No_History', @level2type=N'COLUMN',@level2name=N'DPAS'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.Sales_No_History', N'COLUMN',N'FCI'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CMMC Federal Contract Info' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_Sales_No_History', @level2type=N'COLUMN',@level2name=N'FCI'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.ShipAddr_History', N'COLUMN',N'shipcode'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=Tipton 2=Windfall' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_ShipAddr_History', @level2type=N'COLUMN',@level2name=N'shipcode'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.ShipAddr_History', N'COLUMN',N'customer'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Accounting Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_ShipAddr_History', @level2type=N'COLUMN',@level2name=N'customer'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.ShipAddr_History', N'COLUMN',N'NoNoiseName'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.f_NoNoiseName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_ShipAddr_History', @level2type=N'COLUMN',@level2name=N'NoNoiseName'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.Stocklst_Detail_History', N'COLUMN',N'Prime'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Prime Stock Size' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_Stocklst_Detail_History', @level2type=N'COLUMN',@level2name=N'Prime'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.Stocklst_Master_History', N'COLUMN',N'cl'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Condition Level' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_Stocklst_Master_History', @level2type=N'COLUMN',@level2name=N'cl'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.Stocklst_Master_History', N'COLUMN',N'mS_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Master QTY' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_Stocklst_Master_History', @level2type=N'COLUMN',@level2name=N'mS_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.Stocklst_Master_History', N'COLUMN',N'MillTrace'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Full mill Tracabilty.  Cert is not marked as Exact Mill Duplicate.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_Stocklst_Master_History', @level2type=N'COLUMN',@level2name=N'MillTrace'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.StockLst_Process_GS_History', N'COLUMN',N'S_PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PriceUnit 1=$/#, 2= $/FT, 3= $/PC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_StockLst_Process_GS_History', @level2type=N'COLUMN',@level2name=N'S_PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.StockLst_Process_History', N'COLUMN',N'PWeight'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Process Weight' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_StockLst_Process_History', @level2type=N'COLUMN',@level2name=N'PWeight'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.StockLst_Process_History', N'COLUMN',N'PPc'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Process PCs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_StockLst_Process_History', @level2type=N'COLUMN',@level2name=N'PPc'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.StockLst_Process_History', N'COLUMN',N'PFt'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Process Feet' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_StockLst_Process_History', @level2type=N'COLUMN',@level2name=N'PFt'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.StockLst_Process_History', N'COLUMN',N'PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PriceUnit 1=$/#, 2= $/FT, 3= $/PC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_StockLst_Process_History', @level2type=N'COLUMN',@level2name=N'PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.StockLst_Process_History', N'COLUMN',N'Ordered_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Price Sold at' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_StockLst_Process_History', @level2type=N'COLUMN',@level2name=N'Ordered_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.StockLst_Process_History', N'COLUMN',N'InqNumP'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'8 digit Quote then SP init' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_StockLst_Process_History', @level2type=N'COLUMN',@level2name=N'InqNumP'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.StockLst_Process_History', N'COLUMN',N'Prc_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Process QTY' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_StockLst_Process_History', @level2type=N'COLUMN',@level2name=N'Prc_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.StockLst_Process_History', N'COLUMN',N'FoundSTK'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When the Shop marks Found on INCOMING process  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_StockLst_Process_History', @level2type=N'COLUMN',@level2name=N'FoundSTK'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.WIPlst_Detail_History', N'COLUMN',N'Prime'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Prime Stock Size' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_WIPlst_Detail_History', @level2type=N'COLUMN',@level2name=N'Prime'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.WIPlst_Detail_History', N'COLUMN',N'sStockLst_ID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The StockLst.ID_Detail it started as' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_WIPlst_Detail_History', @level2type=N'COLUMN',@level2name=N'sStockLst_ID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.WIPlst_Detail_History', N'COLUMN',N'fStockLst_ID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The StockLst.ID_Detail it finished as' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_WIPlst_Detail_History', @level2type=N'COLUMN',@level2name=N'fStockLst_ID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.WIPLst_Master_History', N'COLUMN',N'cl'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Condition Level' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_WIPLst_Master_History', @level2type=N'COLUMN',@level2name=N'cl'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.WIPLst_Master_History', N'COLUMN',N'mS_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Master QTY' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_WIPLst_Master_History', @level2type=N'COLUMN',@level2name=N'mS_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.WIPLst_Master_History', N'COLUMN',N'MillTrace'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Full mill Tracabilty.  Cert is not marked as Exact Mill Duplicate.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_WIPLst_Master_History', @level2type=N'COLUMN',@level2name=N'MillTrace'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.WIPLst_Process_GS_History', N'COLUMN',N'S_PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PriceUnit 1=$/#, 2= $/FT, 3= $/PC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_WIPLst_Process_GS_History', @level2type=N'COLUMN',@level2name=N'S_PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.WIPLst_Process_History', N'COLUMN',N'PWeight'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Process Weight' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_WIPLst_Process_History', @level2type=N'COLUMN',@level2name=N'PWeight'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.WIPLst_Process_History', N'COLUMN',N'PPc'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Process PCs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_WIPLst_Process_History', @level2type=N'COLUMN',@level2name=N'PPc'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.WIPLst_Process_History', N'COLUMN',N'PFt'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Process Feet' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_WIPLst_Process_History', @level2type=N'COLUMN',@level2name=N'PFt'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.WIPLst_Process_History', N'COLUMN',N'PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PriceUnit 1=$/#, 2= $/FT, 3= $/PC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_WIPLst_Process_History', @level2type=N'COLUMN',@level2name=N'PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.WIPLst_Process_History', N'COLUMN',N'Ordered_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Price Sold at' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_WIPLst_Process_History', @level2type=N'COLUMN',@level2name=N'Ordered_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.WIPLst_Process_History', N'COLUMN',N'InqNumP'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'8 digit Quote then SP init' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_WIPLst_Process_History', @level2type=N'COLUMN',@level2name=N'InqNumP'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.WIPLst_Process_History', N'COLUMN',N'Prc_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Process QTY' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_WIPLst_Process_History', @level2type=N'COLUMN',@level2name=N'Prc_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ar.WIPLst_Process_History', N'COLUMN',N'FoundSTK'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When the Shop marks Found on INCOMING process  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ar_WIPLst_Process_History', @level2type=N'COLUMN',@level2name=N'FoundSTK'
GO

