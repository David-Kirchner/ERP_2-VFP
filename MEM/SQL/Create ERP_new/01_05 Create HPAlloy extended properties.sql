USE [ERP_2]
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AcctCost_Cert', N'COLUMN',N'AC_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'related to dbo.AcctCosting ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AcctCost_Cert', @level2type=N'COLUMN',@level2name=N'AC_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AcctCost_Mach', N'COLUMN',N'AC_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'related to dbo.AcctCosting ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AcctCost_Mach', @level2type=N'COLUMN',@level2name=N'AC_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AcctCost_SOitem', N'COLUMN',N'AC_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'related to dbo.AcctCosting ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AcctCost_SOitem', @level2type=N'COLUMN',@level2name=N'AC_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AcctCost_WO', N'COLUMN',N'AC_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'related to dbo.AcctCosting AC_ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AcctCost_WO', @level2type=N'COLUMN',@level2name=N'AC_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AcctCost_WO', N'COLUMN',N'WO'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'related to dbo.WorkOrder WO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AcctCost_WO', @level2type=N'COLUMN',@level2name=N'WO'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AcctCost_WOD', N'COLUMN',N'AC_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'related to dbo.AcctCosting AC_ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AcctCost_WOD', @level2type=N'COLUMN',@level2name=N'AC_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AcctCost_WOD', N'COLUMN',N'WO_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'related to dbo.WorkOrder_Detail WO_Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AcctCost_WOD', @level2type=N'COLUMN',@level2name=N'WO_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Alloy', N'COLUMN',N'BrandName'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'BrandName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alloy', @level2type=N'COLUMN',@level2name=N'BrandName'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Alloy', N'COLUMN',N'UName'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unified Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alloy', @level2type=N'COLUMN',@level2name=N'UName'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Alloy', N'COLUMN',N'Inventory'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'''Y'' or Null  --deptricated, use HPA Stock BIT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alloy', @level2type=N'COLUMN',@level2name=N'Inventory'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Alloy', N'COLUMN',N'Co'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cobalt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alloy', @level2type=N'COLUMN',@level2name=N'Co'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Alloy', N'COLUMN',N'Cr'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chrome' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alloy', @level2type=N'COLUMN',@level2name=N'Cr'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Alloy', N'COLUMN',N'Cu'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Copper' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alloy', @level2type=N'COLUMN',@level2name=N'Cu'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Alloy', N'COLUMN',N'Fe'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Iron' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alloy', @level2type=N'COLUMN',@level2name=N'Fe'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Alloy', N'COLUMN',N'Mo'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Moly' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alloy', @level2type=N'COLUMN',@level2name=N'Mo'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Alloy', N'COLUMN',N'Mn'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Manganese' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alloy', @level2type=N'COLUMN',@level2name=N'Mn'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Alloy', N'COLUMN',N'Nb'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Niobium' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alloy', @level2type=N'COLUMN',@level2name=N'Nb'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Alloy', N'COLUMN',N'Ni'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nickel' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alloy', @level2type=N'COLUMN',@level2name=N'Ni'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Alloy', N'COLUMN',N'Ti'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Titanium' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alloy', @level2type=N'COLUMN',@level2name=N'Ti'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Alloy', N'COLUMN',N'V'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Vanadium' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alloy', @level2type=N'COLUMN',@level2name=N'V'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Alloy', N'COLUMN',N'W'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tungsten' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alloy', @level2type=N'COLUMN',@level2name=N'W'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Alloy', N'COLUMN',N'UNS'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unified Number System' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alloy', @level2type=N'COLUMN',@level2name=N'UNS'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Alloy', N'COLUMN',N'CertName'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Name used in Reccollect' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alloy', @level2type=N'COLUMN',@level2name=N'CertName'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Alloy', N'COLUMN',N'HPAcore'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Core business Alloy, used in reports' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alloy', @level2type=N'COLUMN',@level2name=N'HPAcore'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Alloy', N'COLUMN',N'HPAStock'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An Alloy HPA has a stocking program for.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alloy', @level2type=N'COLUMN',@level2name=N'HPAStock'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Alloy', N'COLUMN',N'Surcharge'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Use surcharge when quoting' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alloy', @level2type=N'COLUMN',@level2name=N'Surcharge'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Alloy', N'COLUMN',N'MTR_UNS'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Folder Name, Sometimes UNS and Alloy' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alloy', @level2type=N'COLUMN',@level2name=N'MTR_UNS'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Alloy', N'COLUMN',N'GL'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Accountin GL 2024' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alloy', @level2type=N'COLUMN',@level2name=N'GL'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Alloy_GL', N'COLUMN',N'GL_Sales'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sage 2024 Sales' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alloy_GL', @level2type=N'COLUMN',@level2name=N'GL_Sales'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Alloy_GL', N'COLUMN',N'GL_Inv'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sage 2024 Inventory' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alloy_GL', @level2type=N'COLUMN',@level2name=N'GL_Inv'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Alloy_GL', N'COLUMN',N'GL_COGS'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sage 2024 Cost of Goods sold' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alloy_GL', @level2type=N'COLUMN',@level2name=N'GL_COGS'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AlloySurcharge', N'CONSTRAINT',N'PK_AlloySurcharge'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Alloy Surcharge' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AlloySurcharge', @level2type=N'CONSTRAINT',@level2name=N'PK_AlloySurcharge'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'Name'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customers name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'Name'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'PO_num'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customers PO number to HPA.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'PO_num'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'CC'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Condition Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'CC'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'Thck'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Inches' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'Thck'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'Sz2'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Inches' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'Sz2'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'Sz3'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Inches' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'Sz3'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'Weight'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Pounds' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'Weight'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'Descript'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Spec and Tol Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'Descript'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'p_lb'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quoted Price per LB' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'p_lb'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'p_pc'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quoted Price per PC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'p_pc'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'p_ft'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quoted Price per FT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'p_ft'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'Cuts'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quoted Price for cutting' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'Cuts'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'OtherFld'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quoted other field like Testing' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'OtherFld'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'OtherP'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quoted other field like Testing Price' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'OtherP'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'LotP'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quoted Lot Price, See S_P for Acct Price/Unit' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'LotP'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'LeadTime'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Days of in house processing to be shipped' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'LeadTime'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'cWeight'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Computer calculated weight' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'cWeight'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'cP_lb'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Computer calculated Price per LB' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'cP_lb'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'cP_pc'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Computer calculated Price per PC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'cP_pc'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'cP_pcc'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Computer calculated Price per PC + Cut' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'cP_pcc'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'cthk'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Computer calculated Thickness used.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'cthk'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'cLotP'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Computer calculated Lot Price' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'cLotP'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'cLotcP'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Computer calculated Cut Lot Price' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'cLotcP'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'cCut'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Computer calculated cut price (cCutM + cKerfD)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'cCut'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'cCutM'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cut Machine Total Charge' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'cCutM'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'cKerfD'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Calculated metal Cutting and Tolerance loss' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'cKerfD'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'InqDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'DateTime when Inquire was created' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'InqDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'InqNum'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SalesPersons Inqnum' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'InqNum'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'InqNumP'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'8 digits of InqNum + SalesP char' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'InqNumP'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'SalesP'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The initial set to the SalesPerson. W is web.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'SalesP'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'SalesNum'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sales Order Number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'SalesNum'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'SOitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SO item, 7 digit SO, ''-'', and 2 digit item number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'SOitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'item'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Up to 99 items per SO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'item'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'POitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'9-2 Used by WorkOrder' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'POitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'SaleDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'DateTime when Quote converted to Order' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'SaleDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'ShipDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date Packing Slip completes item' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'ShipDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'Buyfrom'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Vendor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'Buyfrom'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'open_'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default is 1, item is Open, customer needs a Quote still.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'open_'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'Bracket'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Pricing bracket used' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'Bracket'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'CustID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PeachTree ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'CustID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'QuoteMemo'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'quote details like email address used and when emailed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'QuoteMemo'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'Comments'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Item Comment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'Comments'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'CountryC'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Country Code for phone number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'CountryC'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'RandLen'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quote is for Randem Length pieces' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'RandLen'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'Metric'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quote has been converted from Metric' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'Metric'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'StartStock'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Has related Starting Stock to convert from' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'StartStock'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'TN'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Use TradeName material' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'TN'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'sz1orig'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'used if convereted from Metric' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'sz1orig'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'sz2orig'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'used if convereted from Metric' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'sz2orig'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'sz3orig'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'used if convereted from Metric' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'sz3orig'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'QuoteDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Updated to last date Quote was Sent.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'QuoteDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'Cover'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SalesPerson that the quote should belong to, but was covered by this SalesP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'Cover'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'Cut'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'N-not specified, A-Abrasive, B-Band Saw, S-Shear, P-Plasma, W-Waterjet, C-Cold Saw (Option)(Speed)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'Cut'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'WO'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'WorkOrder' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'WO'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'CutOptions'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mostly WaterJet cutting specific' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'CutOptions'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'Surcharge'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Surcharge at time of quote' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'Surcharge'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'NoNoiseName'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.f_NoNoiseName(Company)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'NoNoiseName'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'CutHr'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estimated Cutting Hours, used when scheduling' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'CutHr'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'Q_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quoted Price per Unit that customer wants to see' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'Q_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'Q_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quantity for how Quoted PU and Form' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'Q_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'Q_PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Pricing Unit choosen by the SalesRep, not default for Form' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'Q_PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'Q_Total'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Q_Total   Includes Cut and OtherP:  S_Total does NOT include +Cut +OtherP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'Q_Total'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'S_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Acct Stnd, QTY based on Form PU, not by how it was Quoted.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'S_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'S_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct Price ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'S_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'S_PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct PriceUnit ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'S_PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'S_Total'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'S_Total = nQ_Total  Does not Includes Cut and OtherP:  Q_Total is (Q_P*Q_QTY) does' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'S_Total'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'StandardSize'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Uses dbo.f_SizeStandard(Thck)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'StandardSize'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'CustDisc'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.f_Customer_Discount(CustID)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'CustDisc'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'COLUMN',N'DescriptID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'DescriptID or ProductID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'COLUMN',@level2name=N'DescriptID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'INDEX',N'IX_AllQuotes_DescriptID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'DescriptID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'INDEX',@level2name=N'IX_AllQuotes_DescriptID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'INDEX',N'IX_AllQuotes_SaleDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sales Date of Order' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'INDEX',@level2name=N'IX_AllQuotes_SaleDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AllQuotes', N'INDEX',N'IX_allquotes_SOitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ProperSO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllQuotes', @level2type=N'INDEX',@level2name=N'IX_allquotes_SOitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Detail', N'COLUMN',N'Weight'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Detail Weight in Pounds or PCs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Detail', @level2type=N'COLUMN',@level2name=N'Weight'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Detail', N'COLUMN',N'CostValue'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Price per Unit' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Detail', @level2type=N'COLUMN',@level2name=N'CostValue'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Detail', N'COLUMN',N'Location'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SELECT * FROM dbo.StockLst_Location' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Detail', @level2type=N'COLUMN',@level2name=N'Location'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Detail', N'COLUMN',N'InvoiceValue'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Invoice Price per Unit' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Detail', @level2type=N'COLUMN',@level2name=N'InvoiceValue'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Detail', N'COLUMN',N'Prime'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Prime Stock Size' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Detail', @level2type=N'COLUMN',@level2name=N'Prime'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Detail', N'INDEX',N'IX_BrokerLst_detail_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Master-ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Detail', @level2type=N'INDEX',@level2name=N'IX_BrokerLst_detail_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Detail_Inserted', N'COLUMN',N'ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Not related to any other table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Detail_Inserted', @level2type=N'COLUMN',@level2name=N'ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Detail_Inserted', N'COLUMN',N'Master_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'related to BrokerLst_Master.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Detail_Inserted', @level2type=N'COLUMN',@level2name=N'Master_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Detail_Inserted', N'COLUMN',N'ID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the new BrokerLst_Detail ID_Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Detail_Inserted', @level2type=N'COLUMN',@level2name=N'ID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Detail_Inserted', N'COLUMN',N'Who'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'User who created the insert' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Detail_Inserted', @level2type=N'COLUMN',@level2name=N'Who'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Detail_Inserted', N'COLUMN',N'When'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When this Detail was INSERTed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Detail_Inserted', @level2type=N'COLUMN',@level2name=N'When'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Detail_Inserted', N'COLUMN',N'OrderType'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SOitem, POitem, WO, WODetail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Detail_Inserted', @level2type=N'COLUMN',@level2name=N'OrderType'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Detail_Inserted', N'COLUMN',N'OrderNum'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'String is needed for SO or PO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Detail_Inserted', @level2type=N'COLUMN',@level2name=N'OrderNum'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Detail_Inserted', N'COLUMN',N'Verified'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Insert has been verified' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Detail_Inserted', @level2type=N'COLUMN',@level2name=N'Verified'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Detail_Inserted', N'COLUMN',N'VerifiedBy'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Who verified this Insert' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Detail_Inserted', @level2type=N'COLUMN',@level2name=N'VerifiedBy'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Master', N'COLUMN',N'Alloy'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standard Alloy Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Master', @level2type=N'COLUMN',@level2name=N'Alloy'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Master', N'COLUMN',N'Form'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'2 digit form code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Master', @level2type=N'COLUMN',@level2name=N'Form'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Master', N'COLUMN',N'CC'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Condition Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Master', @level2type=N'COLUMN',@level2name=N'CC'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Master', N'COLUMN',N'CL'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Condition Level' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Master', @level2type=N'COLUMN',@level2name=N'CL'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Master', N'COLUMN',N'Size'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'3 decimal size standard, PriceTable Size' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Master', @level2type=N'COLUMN',@level2name=N'Size'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Master', N'COLUMN',N'Cond'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Full Condition' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Master', @level2type=N'COLUMN',@level2name=N'Cond'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Master', N'COLUMN',N'MWeight'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Master weight, SP calcs details' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Master', @level2type=N'COLUMN',@level2name=N'MWeight'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Master', N'COLUMN',N'Specs'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Specifications' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Master', @level2type=N'COLUMN',@level2name=N'Specs'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Master', N'COLUMN',N'Heat'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Heat' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Master', @level2type=N'COLUMN',@level2name=N'Heat'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Master', N'COLUMN',N'Lot'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'heat lot' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Master', @level2type=N'COLUMN',@level2name=N'Lot'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Master', N'COLUMN',N'Paid'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Price paid in per Unit' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Master', @level2type=N'COLUMN',@level2name=N'Paid'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Master', N'COLUMN',N'PO_item'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PO item 9-2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Master', @level2type=N'COLUMN',@level2name=N'PO_item'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Master', N'COLUMN',N'PoDueDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When PO says due, empty for received' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Master', @level2type=N'COLUMN',@level2name=N'PoDueDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Master', N'COLUMN',N'Mill'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mill producer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Master', @level2type=N'COLUMN',@level2name=N'Mill'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Master', N'COLUMN',N'StkDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date Received' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Master', @level2type=N'COLUMN',@level2name=N'StkDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Master', N'COLUMN',N'History'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'OLD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Master', @level2type=N'COLUMN',@level2name=N'History'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Master', N'COLUMN',N'Num'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'OLD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Master', @level2type=N'COLUMN',@level2name=N'Num'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Master', N'COLUMN',N'POStatus'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Due in, Partial receive, Waiting for bill, Accounted' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Master', @level2type=N'COLUMN',@level2name=N'POStatus'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Master', N'COLUMN',N'FROM_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Where this ID came from' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Master', @level2type=N'COLUMN',@level2name=N'FROM_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Master', N'COLUMN',N'ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Master', @level2type=N'COLUMN',@level2name=N'ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Master', N'COLUMN',N'mS_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Master_QTY' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Master', @level2type=N'COLUMN',@level2name=N'mS_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Master', N'COLUMN',N'ProjID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.Stock_Projected.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Master', @level2type=N'COLUMN',@level2name=N'ProjID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Master', N'COLUMN',N'MillTrace'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Can the Cert be traced back to the Mill.  Sometimes over stock from a brokered item will lose traceability.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Master', @level2type=N'COLUMN',@level2name=N'MillTrace'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Master_Inserted', N'COLUMN',N'ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Not related to any other table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Master_Inserted', @level2type=N'COLUMN',@level2name=N'ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Master_Inserted', N'COLUMN',N'Master_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'new ID of BrokerLst_Master' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Master_Inserted', @level2type=N'COLUMN',@level2name=N'Master_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Master_Inserted', N'COLUMN',N'Who'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'User who created the insert' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Master_Inserted', @level2type=N'COLUMN',@level2name=N'Who'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Master_Inserted', N'COLUMN',N'When'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When this Insert happened' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Master_Inserted', @level2type=N'COLUMN',@level2name=N'When'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Master_Inserted', N'COLUMN',N'Verified'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Has this insert been verified' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Master_Inserted', @level2type=N'COLUMN',@level2name=N'Verified'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Master_Inserted', N'COLUMN',N'VerifiedBy'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Who Verified this Insert' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Master_Inserted', @level2type=N'COLUMN',@level2name=N'VerifiedBy'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process', N'COLUMN',N'SOitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SO item 7-2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process', @level2type=N'COLUMN',@level2name=N'SOitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process', N'COLUMN',N'PO_item'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PO item 9-2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process', @level2type=N'COLUMN',@level2name=N'PO_item'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process', N'COLUMN',N'Process_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CANCELLED,CORRECTION,INCOMING,PARTSELECT ,RECEIVED,SELECTED,NOT2HPA,Sell Stock,Shipped,SUBED,Receiving,PARTRECV' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process', @level2type=N'COLUMN',@level2name=N'Process_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process', N'COLUMN',N'Processor'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Person' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process', @level2type=N'COLUMN',@level2name=N'Processor'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process', N'COLUMN',N'AllowSub'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Y or N' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process', @level2type=N'COLUMN',@level2name=N'AllowSub'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process', N'COLUMN',N'PWeight'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Process Weight - Depricate, use Pounds' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process', @level2type=N'COLUMN',@level2name=N'PWeight'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process', N'COLUMN',N'PPc'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Process Pieces, HPA Acct' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process', @level2type=N'COLUMN',@level2name=N'PPc'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process', N'COLUMN',N'PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct, PriceUnit 1=$/#, 2= $/FT, 3= $/PC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process', @level2type=N'COLUMN',@level2name=N'PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process', N'COLUMN',N'QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct, Use to hold QTY needed for Process.  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process', @level2type=N'COLUMN',@level2name=N'QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process', N'COLUMN',N'Ordered_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct, Use to hold Total QTY needed Order.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process', @level2type=N'COLUMN',@level2name=N'Ordered_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process', N'COLUMN',N'Ordered_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Price when ordered' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process', @level2type=N'COLUMN',@level2name=N'Ordered_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process', N'COLUMN',N'Pounds'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'LBS needed, SO Pounds should always be Lbs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process', @level2type=N'COLUMN',@level2name=N'Pounds'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process', N'COLUMN',N'ID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relate to Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process', @level2type=N'COLUMN',@level2name=N'ID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process', N'COLUMN',N'InqNumP'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'8 digit Quote then SP init' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process', @level2type=N'COLUMN',@level2name=N'InqNumP'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process', N'COLUMN',N'QTY_Due'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depricated' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process', @level2type=N'COLUMN',@level2name=N'QTY_Due'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process', N'COLUMN',N'Prc_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depricated' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process', @level2type=N'COLUMN',@level2name=N'Prc_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process', N'COLUMN',N'Prc_Form'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SO Form,This can be different from Stock Form' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process', @level2type=N'COLUMN',@level2name=N'Prc_Form'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process', N'COLUMN',N'Prc_PCs'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Number of Pieces this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process', @level2type=N'COLUMN',@level2name=N'Prc_PCs'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process', N'COLUMN',N'Prc_Dim1'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dim1 this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process', @level2type=N'COLUMN',@level2name=N'Prc_Dim1'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process', N'COLUMN',N'Prc_Dim2'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dim2 this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process', @level2type=N'COLUMN',@level2name=N'Prc_Dim2'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process', N'COLUMN',N'Prc_Dim3'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dim3 this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process', @level2type=N'COLUMN',@level2name=N'Prc_Dim3'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process', N'COLUMN',N'Prc_Q_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer Quoted Qty Total -not Acct Stnd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process', @level2type=N'COLUMN',@level2name=N'Prc_Q_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process', N'COLUMN',N'Prc_Q_PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer Quoted PU' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process', @level2type=N'COLUMN',@level2name=N'Prc_Q_PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process', N'COLUMN',N'FoundSTK'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When the Shop marks Found on INCOMING process  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process', @level2type=N'COLUMN',@level2name=N'FoundSTK'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Detail', N'COLUMN',N'Who'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Login name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Detail', @level2type=N'COLUMN',@level2name=N'Who'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Detail', N'COLUMN',N'When'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'System Date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Detail', @level2type=N'COLUMN',@level2name=N'When'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Detail', N'COLUMN',N'ID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID_Detail is filled in from p_BrokerLst_Detail_ins' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Detail', @level2type=N'COLUMN',@level2name=N'ID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Grab', N'COLUMN',N'SOitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SO item 7-2; used as SELECTED' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'SOitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Grab', N'COLUMN',N'PO_item'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PO item 9-2; Used as INCOMING' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'PO_item'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Grab', N'COLUMN',N'SalesPerson'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sales Rep of SO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'SalesPerson'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Grab', N'COLUMN',N'StartDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Initial date stamp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'StartDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Grab', N'COLUMN',N'Process_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'see dbo.BrokerLst_Process_ID_def  CANCELLED,CORRECTION,INCOMING,PARTSELECT ,RECEIVED,SELECTED,NOT2HPA,Sell Stock,Shipped,SUBED,Receiving,PARTRECV,IN_Process,
Quoted' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'Process_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Grab', N'COLUMN',N'Processor'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Person adding Process' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'Processor'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Grab', N'COLUMN',N'AllowSub'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Y  or N' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'AllowSub'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Grab', N'COLUMN',N'PWeight'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Process Weight - Depricate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'PWeight'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Grab', N'COLUMN',N'PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct, PriceUnit 1=$/#, 2= $/FT, 3= $/PC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Grab', N'COLUMN',N'QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'QTY needed from ID_Detail. HPA Acct Stnadard. Think as Prc_QTY' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Grab', N'COLUMN',N'Ordered_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct, Use to hold Total QTY needed Order, for historical reference' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'Ordered_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Grab', N'COLUMN',N'Ordered_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Price when ordered, for historical reference' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'Ordered_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Grab', N'COLUMN',N'Pounds'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'LBS needed from ID_Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'Pounds'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Grab', N'COLUMN',N'ID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relate to Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'ID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Grab', N'COLUMN',N'ReceivingID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relates back to dbo.Receiving before the INCOMING process is removed.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'ReceivingID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Grab', N'COLUMN',N'WO'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'WO can SELECT Stock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'WO'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Grab', N'COLUMN',N'WO_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'WO_Detail can list as INCOMING' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'WO_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Grab', N'COLUMN',N'InqNumP'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'8 digit Quote then SP init, Used for Process_ID QUOTED' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'InqNumP'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Grab', N'COLUMN',N'Prc_Form'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ordered Form, This can be different from Stock Form' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'Prc_Form'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Grab', N'COLUMN',N'Prc_PCs'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Number of Pieces this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'Prc_PCs'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Grab', N'COLUMN',N'Prc_Dim1'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dim1 this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'Prc_Dim1'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Grab', N'COLUMN',N'Prc_Dim2'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dim2 this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'Prc_Dim2'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Grab', N'COLUMN',N'Prc_Dim3'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dim3 this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'Prc_Dim3'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Grab', N'COLUMN',N'FoundStk'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When the Shop marks Found on INCOMING process  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'FoundStk'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Grab', N'COLUMN',N'MS4O'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Modify Stock 4 Order complete' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'MS4O'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Orig', N'COLUMN',N'Process_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SELECTED, INCOMING, RECEIVED, Shipped, CORRECTION, SUBED' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Orig', @level2type=N'COLUMN',@level2name=N'Process_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Orig', N'COLUMN',N'Processor'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Person' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Orig', @level2type=N'COLUMN',@level2name=N'Processor'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Orig', N'COLUMN',N'AllowSub'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Y or N' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Orig', @level2type=N'COLUMN',@level2name=N'AllowSub'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Orig', N'COLUMN',N'PPc'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Process Pieces' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Orig', @level2type=N'COLUMN',@level2name=N'PPc'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Orig', N'COLUMN',N'PFT'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Process Feet' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Orig', @level2type=N'COLUMN',@level2name=N'PFT'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Orig', N'COLUMN',N'PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PriceUnit 1=$/#, 2= $/FT, 3= $/PC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Orig', @level2type=N'COLUMN',@level2name=N'PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Orig', N'COLUMN',N'Pounds'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Pounds' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Orig', @level2type=N'COLUMN',@level2name=N'Pounds'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Orig', N'COLUMN',N'ID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relate to Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Orig', @level2type=N'COLUMN',@level2name=N'ID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Recvd', N'COLUMN',N'PO_item'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PO item 9-2; Used as INCOMING' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'PO_item'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Recvd', N'COLUMN',N'SalesPerson'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sales Rep of SO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'SalesPerson'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Recvd', N'COLUMN',N'StartDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Initial date stamp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'StartDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Recvd', N'COLUMN',N'RecvDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When triggered as Received in BrokerLst_Process' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'RecvDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Recvd', N'COLUMN',N'Process_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RECEIVED' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'Process_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Recvd', N'COLUMN',N'Processor'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Person adding Process' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'Processor'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Recvd', N'COLUMN',N'Ordered_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Price when ordered, for historical reference' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'Ordered_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Recvd', N'COLUMN',N'Pounds'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'LBS needed from ID_Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'Pounds'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Recvd', N'COLUMN',N'ID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relate to Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'ID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Recvd', N'COLUMN',N'ReceivingID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relates back to dbo.Receiving before the INCOMING process is removed.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'ReceivingID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Recvd', N'COLUMN',N'WO_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'WO_Detail can list as INCOMING' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'WO_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Recvd', N'COLUMN',N'Prc_Form'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ordered Form, This can be different from Stock Form' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'Prc_Form'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Recvd', N'COLUMN',N'Prc_PCs'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Number of Pieces this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'Prc_PCs'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Recvd', N'COLUMN',N'Prc_Dim1'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dim1 this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'Prc_Dim1'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Recvd', N'COLUMN',N'Prc_Dim2'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dim2 this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'Prc_Dim2'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BrokerLst_Process_Recvd', N'COLUMN',N'Prc_Dim3'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dim3 this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BrokerLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'Prc_Dim3'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Cert', N'COLUMN',N'Cond_Fin'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Material condition and Finish' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cert', @level2type=N'COLUMN',@level2name=N'Cond_Fin'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Cert', N'COLUMN',N'tLoc1'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Test Location: Center, MidRadius, Outer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cert', @level2type=N'COLUMN',@level2name=N'tLoc1'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Cert', N'COLUMN',N'tLoc2'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Test Location: Center, MidRadius, Outer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cert', @level2type=N'COLUMN',@level2name=N'tLoc2'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Cert', N'COLUMN',N'tLoc3'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Test Location: Center, MidRadius, Outer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cert', @level2type=N'COLUMN',@level2name=N'tLoc3'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Cert', N'COLUMN',N'tLoc4'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Test Location: Center, MidRadius, Outer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cert', @level2type=N'COLUMN',@level2name=N'tLoc4'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Cert', N'COLUMN',N'CorrosionR'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Include Corr test spec' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cert', @level2type=N'COLUMN',@level2name=N'CorrosionR'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Cert', N'COLUMN',N'Machine'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Machine 1= stnd ,2 GFM, 3 Roll, 4 Lake Erie Press, 5 Wire, 6 Swage, 7 Draw Bench  dbo.f_Cert_Machine_Name()' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cert', @level2type=N'COLUMN',@level2name=N'Machine'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Cert', N'COLUMN',N'SRHours'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hours to fail stress rupture test.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cert', @level2type=N'COLUMN',@level2name=N'SRHours'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Cert', N'COLUMN',N'AC_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Related to dbo.AcctCosting.ID -presensce shows Accounting know to work on' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cert', @level2type=N'COLUMN',@level2name=N'AC_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Cert', N'COLUMN',N'AC_cmplt'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Accounting Costing completed.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cert', @level2type=N'COLUMN',@level2name=N'AC_cmplt'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Cert', N'COLUMN',N'Alnita'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'True means Alnita Signed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cert', @level2type=N'COLUMN',@level2name=N'Alnita'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Cert', N'COLUMN',N'Sean'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'True means from Sean table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cert', @level2type=N'COLUMN',@level2name=N'Sean'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Cert_co', N'COLUMN',N'ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'from dbo.Cert' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cert_co', @level2type=N'COLUMN',@level2name=N'ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Cert_Conf_No', N'COLUMN',N'CoC'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depricated' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cert_Conf_No', @level2type=N'COLUMN',@level2name=N'CoC'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Cert_Conf_No', N'COLUMN',N'MFC'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mercury Free Cert' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cert_Conf_No', @level2type=N'COLUMN',@level2name=N'MFC'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Cert_Conf_No', N'COLUMN',N'NWR'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'No Weld Repair' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cert_Conf_No', @level2type=N'COLUMN',@level2name=N'NWR'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Cert_Conf_No', N'COLUMN',N'LLMA'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depricated' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cert_Conf_No', @level2type=N'COLUMN',@level2name=N'LLMA'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Cert_Conf_No', N'COLUMN',N'FFF'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depricated' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cert_Conf_No', @level2type=N'COLUMN',@level2name=N'FFF'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Cert_Conf_No', N'COLUMN',N'DFARS'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'DFARS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cert_Conf_No', @level2type=N'COLUMN',@level2name=N'DFARS'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Cert_RC_profile', N'COLUMN',N'CertID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Related to table field [Cert.ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cert_RC_profile', @level2type=N'COLUMN',@level2name=N'CertID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ConditionCode', N'COLUMN',N'C2'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'All High Strength is C2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConditionCode', @level2type=N'COLUMN',@level2name=N'C2'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ConditionCode', N'COLUMN',N'HPA_MFG'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CC that HPA would manufacture' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConditionCode', @level2type=N'COLUMN',@level2name=N'HPA_MFG'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ConditionCodeAdjust', N'COLUMN',N'A'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Price Adjustment for A work' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConditionCodeAdjust', @level2type=N'COLUMN',@level2name=N'A'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ConditionLevel', N'COLUMN',N'CL'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Condition Level' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConditionLevel', @level2type=N'COLUMN',@level2name=N'CL'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ConditionLevel', N'COLUMN',N'isPriceTable'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Has a PriceTable listing,  Do not need Code Adjust.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConditionLevel', @level2type=N'COLUMN',@level2name=N'isPriceTable'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ConditionLevel', N'COLUMN',N'Adjust'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Replaces ConditionCodeAdjust Table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConditionLevel', @level2type=N'COLUMN',@level2name=N'Adjust'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ConditionLevel', N'COLUMN',N'Adjust_Code'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'look up this CC on the Pricing Table and then Adjust' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConditionLevel', @level2type=N'COLUMN',@level2name=N'Adjust_Code'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ConditionLevel', N'COLUMN',N'Common_Code'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'combination of CC and CL into a Common standard' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConditionLevel', @level2type=N'COLUMN',@level2name=N'Common_Code'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'CreditCd', N'COLUMN',N'notes'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'changed from 30' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CreditCd', @level2type=N'COLUMN',@level2name=N'notes'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'CreditCd', N'COLUMN',N'Printed'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Times Printed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CreditCd', @level2type=N'COLUMN',@level2name=N'Printed'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'CreditCd', N'COLUMN',N'WhoPrinted'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Added by the CreditCard Print program' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CreditCd', @level2type=N'COLUMN',@level2name=N'WhoPrinted'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'CreditCd', N'COLUMN',N'WhoAdded'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Who inserted the CC record' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CreditCd', @level2type=N'COLUMN',@level2name=N'WhoAdded'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'CUSTOMER_LIST', N'COLUMN',N'CreditStatus'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Remove this' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER_LIST', @level2type=N'COLUMN',@level2name=N'CreditStatus'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'CUSTOMER_LIST', N'COLUMN',N'NoNoiseName'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.f_NoNoiseName(CustomerName)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER_LIST', @level2type=N'COLUMN',@level2name=N'NoNoiseName'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Customer_List_Notes', N'COLUMN',N'IND_type'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SELECT dbo.f_IND_Type(IND_type) AS Industry' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer_List_Notes', @level2type=N'COLUMN',@level2name=N'IND_type'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Draw_Dies', N'COLUMN',N'Dia'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The estimated diameter the die can produce.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Draw_Dies', @level2type=N'COLUMN',@level2name=N'Dia'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Draw_Dies', N'COLUMN',N'Angle'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Die Angle' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Draw_Dies', @level2type=N'COLUMN',@level2name=N'Angle'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Draw_Dies', N'COLUMN',N'NIB'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Carbide NIB designating' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Draw_Dies', @level2type=N'COLUMN',@level2name=N'NIB'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Draw_Dies', N'COLUMN',N'CaseDia'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Outside Diameter of Die Case' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Draw_Dies', @level2type=N'COLUMN',@level2name=N'CaseDia'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Draw_Dies', N'COLUMN',N'Height'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Length of Die case, called Height by industry' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Draw_Dies', @level2type=N'COLUMN',@level2name=N'Height'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Draw_log', N'COLUMN',N'PO'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer PO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Draw_log', @level2type=N'COLUMN',@level2name=N'PO'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Draw_log', N'COLUMN',N'tLoc'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Test Location: Center, MidRadius, Outer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Draw_log', @level2type=N'COLUMN',@level2name=N'tLoc'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Draw_log', N'COLUMN',N'tLoc2'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Test Location: Center, MidRadius, Outer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Draw_log', @level2type=N'COLUMN',@level2name=N'tLoc2'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Draw_log', N'COLUMN',N'tLoc3'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Test Location: Center, MidRadius, Outer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Draw_log', @level2type=N'COLUMN',@level2name=N'tLoc3'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Draw_log', N'COLUMN',N'tLoc4'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Test Location: Center, MidRadius, Outer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Draw_log', @level2type=N'COLUMN',@level2name=N'tLoc4'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Draw_log', N'COLUMN',N'tLoc5'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Test Location: Center, MidRadius, Outer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Draw_log', @level2type=N'COLUMN',@level2name=N'tLoc5'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Draw_log', N'COLUMN',N'SrvcPO'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Conversion or Service HPA PO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Draw_log', @level2type=N'COLUMN',@level2name=N'SrvcPO'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Draw_log', N'COLUMN',N'SpaceX'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tested for SpaceX' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Draw_log', @level2type=N'COLUMN',@level2name=N'SpaceX'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Draw_log', N'COLUMN',N'Sched'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.Draw_Sched.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Draw_log', @level2type=N'COLUMN',@level2name=N'Sched'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Draw_log', N'COLUMN',N'ProjID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'From dbo.Stock_Projected' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Draw_log', @level2type=N'COLUMN',@level2name=N'ProjID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Draw_log', N'COLUMN',N'AC_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Related to dbo.AcctCosting.ID -presensce shows Accounting know to work on' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Draw_log', @level2type=N'COLUMN',@level2name=N'AC_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Draw_log', N'COLUMN',N'AC_cmplt'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Accounting Costing completed.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Draw_log', @level2type=N'COLUMN',@level2name=N'AC_cmplt'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Draw_log', N'COLUMN',N'R'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Report Quality' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Draw_log', @level2type=N'COLUMN',@level2name=N'R'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Draw_log_Detail', N'COLUMN',N'ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Draw_log ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Draw_log_Detail', @level2type=N'COLUMN',@level2name=N'ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Draw_log_Detail', N'COLUMN',N'Label'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HT_Log, Testing PO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Draw_log_Detail', @level2type=N'COLUMN',@level2name=N'Label'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Draw_log_Detail', N'COLUMN',N'Data'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Log Number, PO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Draw_log_Detail', @level2type=N'COLUMN',@level2name=N'Data'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Draw_log_Detail', N'COLUMN',N'POitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'POitem' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Draw_log_Detail', @level2type=N'COLUMN',@level2name=N'POitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Draw_log_Detail', N'COLUMN',N'ID2'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identity' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Draw_log_Detail', @level2type=N'COLUMN',@level2name=N'ID2'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Draw_log_old', N'COLUMN',N'PO'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer PO_Num' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Draw_log_old', @level2type=N'COLUMN',@level2name=N'PO'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Draw_log_old', N'COLUMN',N'OvenTemp'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fahrenheit ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Draw_log_old', @level2type=N'COLUMN',@level2name=N'OvenTemp'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Draw_log_old', N'COLUMN',N'SrvcPO'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Conversion or Service HPA PO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Draw_log_old', @level2type=N'COLUMN',@level2name=N'SrvcPO'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Draw_log_old', N'COLUMN',N'AC_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Related to dbo.AcctCosting.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Draw_log_old', @level2type=N'COLUMN',@level2name=N'AC_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Draw_log_old', N'COLUMN',N'AC_cmplt'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Accounting Costing completed.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Draw_log_old', @level2type=N'COLUMN',@level2name=N'AC_cmplt'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Draw_Sched', N'COLUMN',N'Machine'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SELECT dbo.f_GetMachine_LogList()' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Draw_Sched', @level2type=N'COLUMN',@level2name=N'Machine'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Draw_Sched', N'COLUMN',N'Lot'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lot number for Machine' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Draw_Sched', @level2type=N'COLUMN',@level2name=N'Lot'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'EmailService_Credentials', N'COLUMN',N'Username'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This field is used to authenticate with the POP/IMAP server' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailService_Credentials', @level2type=N'COLUMN',@level2name=N'Username'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'EmailService_Credentials', N'COLUMN',N'Password'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This field is used to authenticate with the POP/IMAP server' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailService_Credentials', @level2type=N'COLUMN',@level2name=N'Password'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'EmailService_Credentials', N'COLUMN',N'ReceiveMailServer'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'POP/IMAP server' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailService_Credentials', @level2type=N'COLUMN',@level2name=N'ReceiveMailServer'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'EmailService_Credentials', N'COLUMN',N'SendMailServer'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SMTP Server' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailService_Credentials', @level2type=N'COLUMN',@level2name=N'SendMailServer'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'EmailService_Credentials', N'COLUMN',N'ServiceTypeId'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 = IMAP, 2 = POP, See EmailService_Type table for complete details' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailService_Credentials', @level2type=N'COLUMN',@level2name=N'ServiceTypeId'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'EmailService_Credentials', N'COLUMN',N'CheckFolder'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'usually "Inbox"' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailService_Credentials', @level2type=N'COLUMN',@level2name=N'CheckFolder'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'EmailService_Credentials', N'COLUMN',N'ProcessedFolder'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Make sure this folder has been created on the email account.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailService_Credentials', @level2type=N'COLUMN',@level2name=N'ProcessedFolder'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'EmailService_Credentials', N'COLUMN',N'Default Config'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The service will use the first account which has been flagged as Default Config = true' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailService_Credentials', @level2type=N'COLUMN',@level2name=N'Default Config'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'EmailService_Credentials', N'COLUMN',N'SendAuthenticate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This will use the Username and Password fields to authenticate with the SMTP server' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailService_Credentials', @level2type=N'COLUMN',@level2name=N'SendAuthenticate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'EmailService_Email_Log', N'COLUMN',N'EmailAddressedTo'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Stores the previous email recipient as the email may have been forwarded from an alias.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailService_Email_Log', @level2type=N'COLUMN',@level2name=N'EmailAddressedTo'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'EmailService_EmailMatchExceptions', N'COLUMN',N'GlobalDomain'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default is 1 (true). When true, only exact email users will be matched, not the domain. (Example @gmail.com should not match any to send to a specific sales person). When false, the specified email address will not be sent to the same sales person, but will instead be added to round robin distribution.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailService_EmailMatchExceptions', @level2type=N'COLUMN',@level2name=N'GlobalDomain'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'EmailService_SalesUsers', N'COLUMN',N'Firstname'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This field is synchronized from the AppSetup table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailService_SalesUsers', @level2type=N'COLUMN',@level2name=N'Firstname'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'EmailService_SalesUsers', N'COLUMN',N'Lastname'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This field is synchronized from the AppSetup table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailService_SalesUsers', @level2type=N'COLUMN',@level2name=N'Lastname'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'EmailService_SalesUsers', N'COLUMN',N'EmailAddress'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This field is synchronized from the AppSetup table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailService_SalesUsers', @level2type=N'COLUMN',@level2name=N'EmailAddress'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'EmailService_SalesUsers', N'COLUMN',N'MarkAbsent'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'If a sales person is out/absent, the service will consider the sales person inactive for new emails.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailService_SalesUsers', @level2type=N'COLUMN',@level2name=N'MarkAbsent'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'EmailService_SalesUsers', N'COLUMN',N'SP_Initial'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This field is synchronized from the AppSetup table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailService_SalesUsers', @level2type=N'COLUMN',@level2name=N'SP_Initial'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'EmailService_SalesUsers', N'COLUMN',N'IsActiveSales'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This field is synchronized from the AppSetup table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailService_SalesUsers', @level2type=N'COLUMN',@level2name=N'IsActiveSales'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'EmailService_SalesUsers', N'COLUMN',N'EmailWeight'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 = No emails, 1 = 1 email per round robin, 2 = 1 email every 2 round robin cycles, 3 = 1 email every 3 round robin cycles, etc.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailService_SalesUsers', @level2type=N'COLUMN',@level2name=N'EmailWeight'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'EmailService_SalesUsers_Schedule', N'COLUMN',N'WorkDay Open'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Time is based on the local server timezone.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailService_SalesUsers_Schedule', @level2type=N'COLUMN',@level2name=N'WorkDay Open'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'EmailService_SalesUsers_Schedule', N'COLUMN',N'WorkDay Close'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Time is based on the local server timezone.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailService_SalesUsers_Schedule', @level2type=N'COLUMN',@level2name=N'WorkDay Close'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Employee', N'COLUMN',N'TC_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TimeClock Employee ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'TC_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Employee', N'COLUMN',N'SalesP'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sales Person Initial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'SalesP'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Employee', N'COLUMN',N'HPA_Email'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ends with ERP_1.com' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'HPA_Email'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Employee', N'COLUMN',N'ALT_Email'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Personal account like yahoo.com' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'ALT_Email'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Errors', N'COLUMN',N'mess1'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Short Decription' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Errors', @level2type=N'COLUMN',@level2name=N'mess1'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Errors', N'COLUMN',N'Memo1'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Long Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Errors', @level2type=N'COLUMN',@level2name=N'Memo1'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ForecastStock', N'COLUMN',N'Inches'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Some list as Inches, convert as save to the pounds' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ForecastStock', @level2type=N'COLUMN',@level2name=N'Inches'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ForecastStock', N'COLUMN',N'Pounds'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Pounds for Period forecast   dbo.f_Get_Weight(1,Alloy,''10'','''', Dia, Inches,0,0)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ForecastStock', @level2type=N'COLUMN',@level2name=N'Pounds'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ForecastStock', N'COLUMN',N'Period'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'''Time period for Pounds''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ForecastStock', @level2type=N'COLUMN',@level2name=N'Period'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ForecastStock', N'COLUMN',N'MinPounds'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Min Pounds allowed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ForecastStock', @level2type=N'COLUMN',@level2name=N'MinPounds'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ForecastStock', N'COLUMN',N'UT'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Needs UT scan' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ForecastStock', @level2type=N'COLUMN',@level2name=N'UT'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ForecastStock', N'COLUMN',N'Sdate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Start Date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ForecastStock', @level2type=N'COLUMN',@level2name=N'Sdate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forms', N'COLUMN',N'Cap2'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Alternative Caption 2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forms', @level2type=N'COLUMN',@level2name=N'Cap2'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forms', N'COLUMN',N'Cap3'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Alternative Caption 3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forms', @level2type=N'COLUMN',@level2name=N'Cap3'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forms', N'COLUMN',N'Price'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'LB,FT,PC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forms', @level2type=N'COLUMN',@level2name=N'Price'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forms', N'COLUMN',N'PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=LB, 2=FT, 3=PC, 4=Lot, 5=Inch dbo.f_GetPU_Unit(PU) ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forms', @level2type=N'COLUMN',@level2name=N'PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forms', N'COLUMN',N'Unit'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=$/LB, 2= $/FT, 3= $/PC, 4=$LOT, 5=$/Inch  dbo.f_GetPU_Unit(PU)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forms', @level2type=N'COLUMN',@level2name=N'Unit'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forms', N'COLUMN',N'LBSonSZ2'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fiels SZ2 hold LBS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forms', @level2type=N'COLUMN',@level2name=N'LBSonSZ2'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forms', N'COLUMN',N'LBSonSZ3'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fiels SZ3 hold LBS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forms', @level2type=N'COLUMN',@level2name=N'LBSonSZ3'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forms', N'COLUMN',N'StockBySZ2'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sz2 is essential to identify for Stock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forms', @level2type=N'COLUMN',@level2name=N'StockBySZ2'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forms', N'COLUMN',N'SigDim'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 Pc, 1 QTY, 2 Dim2, 3 Dim3, 4-,5-, 6 dim2*3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forms', @level2type=N'COLUMN',@level2name=N'SigDim'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Forms', N'COLUMN',N'Branch'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Windfall Tipton' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forms', @level2type=N'COLUMN',@level2name=N'Branch'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_Die_Condition', N'COLUMN',N'When'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'System Date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_Die_Condition', @level2type=N'COLUMN',@level2name=N'When'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_Die_Condition', N'COLUMN',N'Who'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Login Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_Die_Condition', @level2type=N'COLUMN',@level2name=N'Who'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_Die_Daily', N'COLUMN',N'Date'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'System Date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_Die_Daily', @level2type=N'COLUMN',@level2name=N'Date'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_Die_Daily', N'COLUMN',N'Who'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Login Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_Die_Daily', @level2type=N'COLUMN',@level2name=N'Who'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_Die_Daily', N'COLUMN',N'RunTime'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Runtime in Minutes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_Die_Daily', @level2type=N'COLUMN',@level2name=N'RunTime'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_Die_Daily', N'COLUMN',N'Hot_Cold'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'H/C' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_Die_Daily', @level2type=N'COLUMN',@level2name=N'Hot_Cold'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_Die_Daily', N'COLUMN',N'WorkLevel'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'E(Easy)/N(Normal)/H(Hard)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_Die_Daily', @level2type=N'COLUMN',@level2name=N'WorkLevel'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_Die_Height', N'COLUMN',N'When'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'System Date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_Die_Height', @level2type=N'COLUMN',@level2name=N'When'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_Die_Height', N'COLUMN',N'Who'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Login Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_Die_Height', @level2type=N'COLUMN',@level2name=N'Who'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_Die_Inspection', N'COLUMN',N'When'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'System Date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_Die_Inspection', @level2type=N'COLUMN',@level2name=N'When'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_Die_Inspection', N'COLUMN',N'Who'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Login Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_Die_Inspection', @level2type=N'COLUMN',@level2name=N'Who'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_Die_Inventory', N'COLUMN',N'Who'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Login Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_Die_Inventory', @level2type=N'COLUMN',@level2name=N'Who'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_Die_Inventory', N'COLUMN',N'When'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'System Date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_Die_Inventory', @level2type=N'COLUMN',@level2name=N'When'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_Die_Inventory', N'COLUMN',N'Hot'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'If Die can be used for Hot Work' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_Die_Inventory', @level2type=N'COLUMN',@level2name=N'Hot'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_Die_Inventory', N'COLUMN',N'Cold'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'If Die can be used for Cold Work' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_Die_Inventory', @level2type=N'COLUMN',@level2name=N'Cold'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_Die_Inventory', N'COLUMN',N'LandingSize'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Length of landing in Inches' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_Die_Inventory', @level2type=N'COLUMN',@level2name=N'LandingSize'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_Die_Landing', N'COLUMN',N'LandingSize'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Length of landing in Inches' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_Die_Landing', @level2type=N'COLUMN',@level2name=N'LandingSize'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_Die_Landing', N'COLUMN',N'When'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'System Date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_Die_Landing', @level2type=N'COLUMN',@level2name=N'When'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_Die_Landing', N'COLUMN',N'Who'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Login Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_Die_Landing', @level2type=N'COLUMN',@level2name=N'Who'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_Die_Range', N'COLUMN',N'When'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'System Date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_Die_Range', @level2type=N'COLUMN',@level2name=N'When'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_Die_Range', N'COLUMN',N'Who'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Login Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_Die_Range', @level2type=N'COLUMN',@level2name=N'Who'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_Die_Repair', N'COLUMN',N'When'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'System Date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_Die_Repair', @level2type=N'COLUMN',@level2name=N'When'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_Die_Repair', N'COLUMN',N'Who'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Login Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_Die_Repair', @level2type=N'COLUMN',@level2name=N'Who'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_DieSets', N'COLUMN',N'Who'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Login Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_DieSets', @level2type=N'COLUMN',@level2name=N'Who'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_DieSets', N'COLUMN',N'When'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'System Date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_DieSets', @level2type=N'COLUMN',@level2name=N'When'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_DieSets_Condition', N'COLUMN',N'When'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'System Date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_DieSets_Condition', @level2type=N'COLUMN',@level2name=N'When'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_DieSets_Condition', N'COLUMN',N'Who'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Login Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_DieSets_Condition', @level2type=N'COLUMN',@level2name=N'Who'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_DieSets_Height', N'COLUMN',N'When'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'System Date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_DieSets_Height', @level2type=N'COLUMN',@level2name=N'When'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_DieSets_Height', N'COLUMN',N'Who'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Login Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_DieSets_Height', @level2type=N'COLUMN',@level2name=N'Who'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_DieSets_Inspection', N'COLUMN',N'When'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'System Date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_DieSets_Inspection', @level2type=N'COLUMN',@level2name=N'When'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_DieSets_Inspection', N'COLUMN',N'Who'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Login Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_DieSets_Inspection', @level2type=N'COLUMN',@level2name=N'Who'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_DieSets_LandingSize', N'COLUMN',N'When'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'System Date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_DieSets_LandingSize', @level2type=N'COLUMN',@level2name=N'When'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_DieSets_LandingSize', N'COLUMN',N'LandingSize'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Length of landing in Inches' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_DieSets_LandingSize', @level2type=N'COLUMN',@level2name=N'LandingSize'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_DieSets_LandingSize', N'COLUMN',N'Who'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Login Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_DieSets_LandingSize', @level2type=N'COLUMN',@level2name=N'Who'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_DieSets_Machine_Type_Map', N'COLUMN',N'When'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'System Date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_DieSets_Machine_Type_Map', @level2type=N'COLUMN',@level2name=N'When'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_DieSets_Machine_Type_Map', N'COLUMN',N'Who'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Login Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_DieSets_Machine_Type_Map', @level2type=N'COLUMN',@level2name=N'Who'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_DieSets_Repair', N'COLUMN',N'When'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'System Date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_DieSets_Repair', @level2type=N'COLUMN',@level2name=N'When'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_DieSets_Repair', N'COLUMN',N'Who'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Login Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_DieSets_Repair', @level2type=N'COLUMN',@level2name=N'Who'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_DieSets_RunTimeLogs', N'COLUMN',N'Date'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'System Date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_DieSets_RunTimeLogs', @level2type=N'COLUMN',@level2name=N'Date'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_DieSets_RunTimeLogs', N'COLUMN',N'Who'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Login Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_DieSets_RunTimeLogs', @level2type=N'COLUMN',@level2name=N'Who'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_DieSets_RunTimeLogs', N'COLUMN',N'Type'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'H/C' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_DieSets_RunTimeLogs', @level2type=N'COLUMN',@level2name=N'Type'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_DieSets_RunTimeLogs', N'COLUMN',N'WorkLevel'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'E(Easy)/N(Normal)/H(Hard)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_DieSets_RunTimeLogs', @level2type=N'COLUMN',@level2name=N'WorkLevel'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_DieSets_RunTimeLogs', N'COLUMN',N'OTTrackID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Order Tracking TrackID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_DieSets_RunTimeLogs', @level2type=N'COLUMN',@level2name=N'OTTrackID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFM_DieSets_RunTimeLogs', N'COLUMN',N'OTTimeID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Order Tracking TimeID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFM_DieSets_RunTimeLogs', @level2type=N'COLUMN',@level2name=N'OTTimeID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFMlog', N'COLUMN',N'PO'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer PO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFMlog', @level2type=N'COLUMN',@level2name=N'PO'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFMlog', N'COLUMN',N'tLoc'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Test Location: Center, MidRadius, Outer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFMlog', @level2type=N'COLUMN',@level2name=N'tLoc'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFMlog', N'COLUMN',N'tLoc2'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Test Location: Center, MidRadius, Outer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFMlog', @level2type=N'COLUMN',@level2name=N'tLoc2'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFMlog', N'COLUMN',N'tLoc3'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Test Location: Center, MidRadius, Outer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFMlog', @level2type=N'COLUMN',@level2name=N'tLoc3'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFMlog', N'COLUMN',N'tLoc4'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Test Location: Center, MidRadius, Outer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFMlog', @level2type=N'COLUMN',@level2name=N'tLoc4'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFMlog', N'COLUMN',N'tLoc5'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Test Location: Center, MidRadius, Outer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFMlog', @level2type=N'COLUMN',@level2name=N'tLoc5'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFMlog', N'COLUMN',N'GFMp'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GFM Price' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFMlog', @level2type=N'COLUMN',@level2name=N'GFMp'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFMlog', N'COLUMN',N'Ovenp'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Oven Price' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFMlog', @level2type=N'COLUMN',@level2name=N'Ovenp'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFMlog', N'COLUMN',N'SrvcPO'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Conversion or Service HPA PO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFMlog', @level2type=N'COLUMN',@level2name=N'SrvcPO'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFMlog', N'COLUMN',N'SpaceX'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tested for SpaceX' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFMlog', @level2type=N'COLUMN',@level2name=N'SpaceX'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFMlog', N'COLUMN',N'GrainSize'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'LMA requires grain size to listed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFMlog', @level2type=N'COLUMN',@level2name=N'GrainSize'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFMlog', N'COLUMN',N'ProjID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'From dbo.Stock_Projected' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFMlog', @level2type=N'COLUMN',@level2name=N'ProjID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFMlog', N'COLUMN',N'AC_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Related to dbo.AcctCosting.ID -presensce shows Accounting know to work on' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFMlog', @level2type=N'COLUMN',@level2name=N'AC_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFMlog', N'COLUMN',N'AC_cmplt'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Accounting Costing completed.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFMlog', @level2type=N'COLUMN',@level2name=N'AC_cmplt'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFMlog', N'COLUMN',N'Report'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Good data for Reports' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFMlog', @level2type=N'COLUMN',@level2name=N'Report'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFMlog', N'COLUMN',N'R'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Report Quality' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFMlog', @level2type=N'COLUMN',@level2name=N'R'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFMlog', N'INDEX',N'IX_gfmlog_Heat'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Heat' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFMlog', @level2type=N'INDEX',@level2name=N'IX_gfmlog_Heat'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFMlog_Detail', N'COLUMN',N'ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GFMLog ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFMlog_Detail', @level2type=N'COLUMN',@level2name=N'ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFMlog_Detail', N'COLUMN',N'Label'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HT_Log, Testing PO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFMlog_Detail', @level2type=N'COLUMN',@level2name=N'Label'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFMlog_Detail', N'COLUMN',N'Data'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Log Number, PO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFMlog_Detail', @level2type=N'COLUMN',@level2name=N'Data'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFMlog_Detail', N'COLUMN',N'POitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'POitem' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFMlog_Detail', @level2type=N'COLUMN',@level2name=N'POitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GFMlog_Detail', N'COLUMN',N'ID2'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identity' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GFMlog_Detail', @level2type=N'COLUMN',@level2name=N'ID2'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'HT_log', N'COLUMN',N'AC_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Related to dbo.AcctCosting.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HT_log', @level2type=N'COLUMN',@level2name=N'AC_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'HT_log', N'COLUMN',N'AC_cmplt'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Accounting Costing completed.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HT_log', @level2type=N'COLUMN',@level2name=N'AC_cmplt'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'IND_Type', N'COLUMN',N'Number'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Used by f_IND_Type' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IND_Type', @level2type=N'COLUMN',@level2name=N'Number'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Invoice_DEL', N'COLUMN',N'Invoice'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sage Invoice' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Invoice_DEL', @level2type=N'COLUMN',@level2name=N'Invoice'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Invoice_DEL', N'COLUMN',N'SOitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SO item, 7 digit SO, ''-'', and 2 digit item number ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Invoice_DEL', @level2type=N'COLUMN',@level2name=N'SOitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Invoice_DEL', N'COLUMN',N'AR_Amount'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Use this AR_Amount, does not have freight.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Invoice_DEL', @level2type=N'COLUMN',@level2name=N'AR_Amount'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Invoice_DEL', N'COLUMN',N'Amount'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Amount still owed- Out of date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Invoice_DEL', @level2type=N'COLUMN',@level2name=N'Amount'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Lading', N'COLUMN',N'Kg'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default if LBS if true then Kg' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Lading', @level2type=N'COLUMN',@level2name=N'Kg'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'LakeErie_log', N'COLUMN',N'SrvcPO'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Conversion or Service HPA PO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LakeErie_log', @level2type=N'COLUMN',@level2name=N'SrvcPO'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'LakeErie_log', N'COLUMN',N'AC_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Related to dbo.AcctCosting.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LakeErie_log', @level2type=N'COLUMN',@level2name=N'AC_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'LakeErie_log', N'COLUMN',N'AC_cmplt'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Accounting Costing completed.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LakeErie_log', @level2type=N'COLUMN',@level2name=N'AC_cmplt'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'LMA_Log', N'COLUMN',N'Lot_Type'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'G,R,L,H Log' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LMA_Log', @level2type=N'COLUMN',@level2name=N'Lot_Type'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'LMA_Log', N'COLUMN',N'Lot'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lot number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LMA_Log', @level2type=N'COLUMN',@level2name=N'Lot'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'LMA_Log', N'COLUMN',N'LotID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID from Lot_Type Log' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LMA_Log', @level2type=N'COLUMN',@level2name=N'LotID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'LMA_Log', N'COLUMN',N'LMA_Practice'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Practice' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LMA_Log', @level2type=N'COLUMN',@level2name=N'LMA_Practice'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'LMA_Log', N'COLUMN',N'LMA_Procedure'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Procedure' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LMA_Log', @level2type=N'COLUMN',@level2name=N'LMA_Procedure'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'LMA_Log', N'COLUMN',N'ESR'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ESR or Not' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LMA_Log', @level2type=N'COLUMN',@level2name=N'ESR'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'LMA_Log', N'COLUMN',N'Pounds'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Size of Lot, to base testing price.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LMA_Log', @level2type=N'COLUMN',@level2name=N'Pounds'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'LMA_Log', N'COLUMN',N'AddTesting'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Money Left to charge customer for Test' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LMA_Log', @level2type=N'COLUMN',@level2name=N'AddTesting'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'LMA_Log', N'COLUMN',N'MicroTest'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'YYYYMM-A-9  A is alphabet of month, 9 is 0-9 current count' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LMA_Log', @level2type=N'COLUMN',@level2name=N'MicroTest'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Mach_Detail', N'COLUMN',N'ID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Detail to dbo.Mach_Shop' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mach_Detail', @level2type=N'COLUMN',@level2name=N'ID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Mach_Detail', N'COLUMN',N'SOitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SO item, 7 digit SO, ''-'', and 2 digit item number  dbo.f_ProperPOitem()' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mach_Detail', @level2type=N'COLUMN',@level2name=N'SOitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Mach_Shop', N'COLUMN',N'SOitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SO item, 7 digit SO, ''-'', and 2 digit item number  dbo.f_ProperPOitem()' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mach_Shop', @level2type=N'COLUMN',@level2name=N'SOitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Mach_Shop', N'COLUMN',N'HPAlot'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mach_Shop', @level2type=N'COLUMN',@level2name=N'HPAlot'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Mach_Shop', N'COLUMN',N'AllQuotes_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Found AS AllQuotes.ID and StartingStock.AllQuotes_ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mach_Shop', @level2type=N'COLUMN',@level2name=N'AllQuotes_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Mach_Shop', N'INDEX',N'IX_Mach_Shop-AQID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'AllQuotes_ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mach_Shop', @level2type=N'INDEX',@level2name=N'IX_Mach_Shop-AQID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'McMaster_Inquire', N'COLUMN',N'McMaster'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descriptio from McMaster' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'McMaster_Inquire', @level2type=N'COLUMN',@level2name=N'McMaster'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'McMaster_Quotes', N'COLUMN',N'StkWeight'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Current Stock in Pounds for Period' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'McMaster_Quotes', @level2type=N'COLUMN',@level2name=N'StkWeight'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'McMaster_Quotes', N'COLUMN',N'Quote_LBS'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quoted Pounds' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'McMaster_Quotes', @level2type=N'COLUMN',@level2name=N'Quote_LBS'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'McMaster_Quotes', N'COLUMN',N'CutLossLbs'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Calulated on PriceBreak 0 and copied to next PriceBreak' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'McMaster_Quotes', @level2type=N'COLUMN',@level2name=N'CutLossLbs'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'McMaster_Quotes', N'COLUMN',N'P_Bracket'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Price Bracket used' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'McMaster_Quotes', @level2type=N'COLUMN',@level2name=N'P_Bracket'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'McMaster_Quotes', N'COLUMN',N'PriceBreak'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Represents what iteration price is based.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'McMaster_Quotes', @level2type=N'COLUMN',@level2name=N'PriceBreak'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'McMaster_Stock', N'COLUMN',N'StkWeight'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Calculated Stock Weight in Pounds for Period' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'McMaster_Stock', @level2type=N'COLUMN',@level2name=N'StkWeight'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'OT', N'COLUMN',N'OrderNumber'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'defined by OrderTypeID in OT_OrderType' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OT', @level2type=N'COLUMN',@level2name=N'OrderNumber'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'OT', N'COLUMN',N'JobID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'defined in OT_Job_Class' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OT', @level2type=N'COLUMN',@level2name=N'JobID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'OT', N'COLUMN',N'OrderTypeID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'defined in OT_OrderType' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OT', @level2type=N'COLUMN',@level2name=N'OrderTypeID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'OT', N'COLUMN',N'RouterId'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'rtr Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OT', @level2type=N'COLUMN',@level2name=N'RouterId'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'OT', N'COLUMN',N'DetailId'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'rtr_Detail detail id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OT', @level2type=N'COLUMN',@level2name=N'DetailId'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'OT_Job', N'COLUMN',N'Description'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Some times a task, Some time a specific machine task' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OT_Job', @level2type=N'COLUMN',@level2name=N'Description'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'OT_Job', N'COLUMN',N'ClassId'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relates to OT_Job_Class.ClassId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OT_Job', @level2type=N'COLUMN',@level2name=N'ClassId'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'OT_Job', N'COLUMN',N'IsMachine'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Is this one Specific Machine' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OT_Job', @level2type=N'COLUMN',@level2name=N'IsMachine'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'OT_Job', N'COLUMN',N'Oper_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'relates to Router.rtr_Operation.Oper_ID  machine generic, not machine specific' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OT_Job', @level2type=N'COLUMN',@level2name=N'Oper_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'OT_Job_Sched', N'COLUMN',N'Sched_Type'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Production Board Schedule groupings' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OT_Job_Sched', @level2type=N'COLUMN',@level2name=N'Sched_Type'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'OT_Job_Sched', N'COLUMN',N'Name'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'name for Grouping' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OT_Job_Sched', @level2type=N'COLUMN',@level2name=N'Name'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'OT_Total', N'COLUMN',N'OrderNumber'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'defined in dbo.OT_OrderType' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OT_Total', @level2type=N'COLUMN',@level2name=N'OrderNumber'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PackingSlip', N'COLUMN',N'Packingsli'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Releated to key in PackingSlip_No' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PackingSlip', @level2type=N'COLUMN',@level2name=N'Packingsli'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PackingSlip', N'COLUMN',N'PCs'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Pieces of this Heat' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PackingSlip', @level2type=N'COLUMN',@level2name=N'PCs'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PackingSlip', N'COLUMN',N'PackedWeight'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depricated' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PackingSlip', @level2type=N'COLUMN',@level2name=N'PackedWeight'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PackingSlip', N'COLUMN',N'PO_Num'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer PO_Num' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PackingSlip', @level2type=N'COLUMN',@level2name=N'PO_Num'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PackingSlip', N'COLUMN',N'Heat'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Includes Lot' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PackingSlip', @level2type=N'COLUMN',@level2name=N'Heat'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PackingSlip', N'COLUMN',N'Weight'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'weight for Heat in Package -not SOitem' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PackingSlip', @level2type=N'COLUMN',@level2name=N'Weight'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PackingSlip', N'COLUMN',N'Kg'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data is in LBS, 1 is Kg -Calculate Weight in Kg on report' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PackingSlip', @level2type=N'COLUMN',@level2name=N'Kg'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PackingSlip', N'COLUMN',N'PartNo'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ParNo or Part Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PackingSlip', @level2type=N'COLUMN',@level2name=N'PartNo'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PackingSlip', N'COLUMN',N'Id'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Do not use' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PackingSlip', @level2type=N'COLUMN',@level2name=N'Id'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PackingSlip', N'COLUMN',N'SOitem_cmplt'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Records if SO-item is complete by Packing Slip person' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PackingSlip', @level2type=N'COLUMN',@level2name=N'SOitem_cmplt'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PackingSlip', N'COLUMN',N'Reconciled'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'not implemented' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PackingSlip', @level2type=N'COLUMN',@level2name=N'Reconciled'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PackingSlip', N'COLUMN',N'Sales_Detail_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'inner join dbo.Sales_Detail SD ON PS.Packingsli = SD.PackingSli AND PS.SOitem = SD.SOitem AND PS.Heat = SD.Heat' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PackingSlip', @level2type=N'COLUMN',@level2name=N'Sales_Detail_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PackingSlip', N'COLUMN',N'ID_PackingSlip'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Each individual reocord inside the PackingSli number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PackingSlip', @level2type=N'COLUMN',@level2name=N'ID_PackingSlip'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PackingSlip', N'COLUMN',N'First_RSO'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Printed and Ready to Ship Out (RSO). ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PackingSlip', @level2type=N'COLUMN',@level2name=N'First_RSO'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PackingSlip', N'COLUMN',N'PT_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Acct QTY on this packingSlip item' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PackingSlip', @level2type=N'COLUMN',@level2name=N'PT_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PackingSlip', N'COLUMN',N'PT_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Updated when Reconciled.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PackingSlip', @level2type=N'COLUMN',@level2name=N'PT_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PackingSlip', N'COLUMN',N'SO_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer QTY on full SOitem' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PackingSlip', @level2type=N'COLUMN',@level2name=N'SO_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PackingSlip', N'COLUMN',N'PickedUp'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PackingSli has beed picked up, marked after a morning walk thru' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PackingSlip', @level2type=N'COLUMN',@level2name=N'PickedUp'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PackingSlip', N'INDEX',N'IX_packingslip_Soitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SOitem' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PackingSlip', @level2type=N'INDEX',@level2name=N'IX_packingslip_Soitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PackingSlip_No', N'COLUMN',N'packingsli'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PackingSlip_No', @level2type=N'COLUMN',@level2name=N'packingsli'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PackingSlip_No', N'COLUMN',N'totalweight'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Packed Weight Entered as text - Redundant to PackedWeight INT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PackingSlip_No', @level2type=N'COLUMN',@level2name=N'totalweight'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PackingSlip_No', N'COLUMN',N'Kg'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kilogram TotalWeight Packed in (display as Kg)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PackingSlip_No', @level2type=N'COLUMN',@level2name=N'Kg'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PackingSlip_No', N'COLUMN',N'ShipFrom'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'What HPA Plant package is shipped from' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PackingSlip_No', @level2type=N'COLUMN',@level2name=N'ShipFrom'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PackingSlip_No', N'COLUMN',N'packedweight'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'was PackedWeig' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PackingSlip_No', @level2type=N'COLUMN',@level2name=N'packedweight'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PackingSlip_No', N'COLUMN',N'RSO_Date'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Printed, package is Ready To Ship Out scan date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PackingSlip_No', @level2type=N'COLUMN',@level2name=N'RSO_Date'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PackingSlip_No', N'COLUMN',N'PickUpDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date of first scan where PackinSli was NOT in RSO.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PackingSlip_No', @level2type=N'COLUMN',@level2name=N'PickUpDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PackingSlip_No', N'COLUMN',N'PickedUp'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PackingSli has beed picked up, marked after a morning walk thru' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PackingSlip_No', @level2type=N'COLUMN',@level2name=N'PickedUp'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PackingSlip_No', N'COLUMN',N'PW_ready'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Paper Work has been gathered' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PackingSlip_No', @level2type=N'COLUMN',@level2name=N'PW_ready'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PackingSlip_No', N'COLUMN',N'PW_verified'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'All Paper Work involved with the Packing has been collected.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PackingSlip_No', @level2type=N'COLUMN',@level2name=N'PW_verified'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PackingSlip_No', N'COLUMN',N'WHO'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'packingsli create user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PackingSlip_No', @level2type=N'COLUMN',@level2name=N'WHO'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PMI', N'COLUMN',N'In_Report'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Individual Reports' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PMI', @level2type=N'COLUMN',@level2name=N'In_Report'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PMI', N'COLUMN',N'Co_Report'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Combined on same Report' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PMI', @level2type=N'COLUMN',@level2name=N'Co_Report'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PO_No', N'COLUMN',N'EoPage'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'End of Page boiler plate text.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PO_No', @level2type=N'COLUMN',@level2name=N'EoPage'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PO_No', N'COLUMN',N'Cancelled'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cancelled' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PO_No', @level2type=N'COLUMN',@level2name=N'Cancelled'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PO_No', N'COLUMN',N'Reconciled'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Reconciled' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PO_No', @level2type=N'COLUMN',@level2name=N'Reconciled'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PO_No', N'COLUMN',N'Rec_Date'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Filled by PurchaseOrder_Update trigger' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PO_No', @level2type=N'COLUMN',@level2name=N'Rec_Date'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PO_No', N'COLUMN',N'Rec_Who'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Filled by PurchaseOrder_Update trigger' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PO_No', @level2type=N'COLUMN',@level2name=N'Rec_Who'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PO_No', N'COLUMN',N'Changing'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'True when the PO has been created, then opened again and not saved yet with a new Rev.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PO_No', @level2type=N'COLUMN',@level2name=N'Changing'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PO_No', N'COLUMN',N'Printed'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PO Printed or Sent to Vendor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PO_No', @level2type=N'COLUMN',@level2name=N'Printed'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PO_No', N'COLUMN',N'Who'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Who inserted this SO.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PO_No', @level2type=N'COLUMN',@level2name=N'Who'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PO_ProcessNotes', N'COLUMN',N'Notes'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Status notes of PO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PO_ProcessNotes', @level2type=N'COLUMN',@level2name=N'Notes'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PO_SOdist', N'COLUMN',N'QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct QTY distibuted to SO, The rest for Stock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PO_SOdist', @level2type=N'COLUMN',@level2name=N'QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PO_SOdist', N'COLUMN',N'P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct P' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PO_SOdist', @level2type=N'COLUMN',@level2name=N'P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PO_SOdist', N'COLUMN',N'Total'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct Total Dollar distibuted to SO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PO_SOdist', @level2type=N'COLUMN',@level2name=N'Total'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PO_SOdist', N'COLUMN',N'PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Vender PU' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PO_SOdist', @level2type=N'COLUMN',@level2name=N'PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PO_SOdist', N'COLUMN',N'PO_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Vender P' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PO_SOdist', @level2type=N'COLUMN',@level2name=N'PO_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PO_SOdist', N'COLUMN',N'PO_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Vender QTY order, fos SO and Stock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PO_SOdist', @level2type=N'COLUMN',@level2name=N'PO_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PO_SOdist', N'COLUMN',N'PO_PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Vender P' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PO_SOdist', @level2type=N'COLUMN',@level2name=N'PO_PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PO_SOdist', N'COLUMN',N'PO_Total'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Vender Total dolar, for SO and Stock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PO_SOdist', @level2type=N'COLUMN',@level2name=N'PO_Total'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PO_SOdist', N'COLUMN',N'SO_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer P' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PO_SOdist', @level2type=N'COLUMN',@level2name=N'SO_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PO_SOdist', N'COLUMN',N'SO_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer Qty needed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PO_SOdist', @level2type=N'COLUMN',@level2name=N'SO_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PO_SOdist', N'COLUMN',N'SO_PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer PU' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PO_SOdist', @level2type=N'COLUMN',@level2name=N'SO_PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PO_SOdist', N'COLUMN',N'SO_Total'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer Total dolar in sale' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PO_SOdist', @level2type=N'COLUMN',@level2name=N'SO_Total'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PO_SOdist', N'COLUMN',N'ReconcileTotal'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Standard that was created in Invoice Reconcile.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PO_SOdist', @level2type=N'COLUMN',@level2name=N'ReconcileTotal'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PO_SOdist', N'CONSTRAINT',N'IX_PO_SOdist_Unique'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SOi and POi Unique' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PO_SOdist', @level2type=N'CONSTRAINT',@level2name=N'IX_PO_SOdist_Unique'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'POstatusDef', N'COLUMN',N'code'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Status Code is used by StockLst' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'POstatusDef', @level2type=N'COLUMN',@level2name=N'code'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'POstatusDef', N'COLUMN',N'caption'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The text' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'POstatusDef', @level2type=N'COLUMN',@level2name=N'caption'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'prc_Equipment', N'COLUMN',N'ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'NewID function will increament ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'prc_Equipment', @level2type=N'COLUMN',@level2name=N'ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'prc_Equipment', N'INDEX',N'IX_prc_Equipment-ScanName'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ScanName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'prc_Equipment', @level2type=N'INDEX',@level2name=N'IX_prc_Equipment-ScanName'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PriceTable', N'COLUMN',N'CL'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Condition Level' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceTable', @level2type=N'COLUMN',@level2name=N'CL'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PriceTable', N'COLUMN',N'Size'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.f_SizeStandard(Size)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceTable', @level2type=N'COLUMN',@level2name=N'Size'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PriceTable', N'COLUMN',N'w0'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 price bracket' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceTable', @level2type=N'COLUMN',@level2name=N'w0'
GO
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PriceTable', N'COLUMN',N'costCurr'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Current Cost to use.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceTable', @level2type=N'COLUMN',@level2name=N'costCurr'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PriceTable', N'COLUMN',N'h0'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depricate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceTable', @level2type=N'COLUMN',@level2name=N'h0'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PriceTable', N'COLUMN',N'hist'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depricate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceTable', @level2type=N'COLUMN',@level2name=N'hist'
GO

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Production', N'COLUMN',N'Oper_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Oper_ID in Router.dbo.rtr_Operation or OT_Job (use Oper_ID to group like 525  Rotary Forge)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Production', @level2type=N'COLUMN',@level2name=N'Oper_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Production', N'COLUMN',N'SOitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SO item, 7 digit SO, ''-'', and 2 digit item number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Production', @level2type=N'COLUMN',@level2name=N'SOitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Production', N'COLUMN',N'POitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hold for Outsourced items' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Production', @level2type=N'COLUMN',@level2name=N'POitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Production', N'COLUMN',N'OnBoard'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hanging on the Board' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Production', @level2type=N'COLUMN',@level2name=N'OnBoard'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Production', N'COLUMN',N'InQue'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'In Que waiting to be placed OnBoard with a position' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Production', @level2type=N'COLUMN',@level2name=N'InQue'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Production', N'COLUMN',N'Closed'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Taken off the board.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Production', @level2type=N'COLUMN',@level2name=N'Closed'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Production', N'COLUMN',N'Sched_Type'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Production Schedule grouping from dbo.OT_Job_Sched' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Production', @level2type=N'COLUMN',@level2name=N'Sched_Type'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Production', N'COLUMN',N'rtr_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'rtr_ID from Router.dbo.rtr, Have rtr ID before schedule production.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Production', @level2type=N'COLUMN',@level2name=N'rtr_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Production', N'COLUMN',N'rtr_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Detail to rtr_ID found in Router.dbo.rtr_Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Production', @level2type=N'COLUMN',@level2name=N'rtr_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Production', N'COLUMN',N'LastTouch'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Record of Last Touch' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Production', @level2type=N'COLUMN',@level2name=N'LastTouch'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Production', N'COLUMN',N'dateInQue'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date order was placed InQue' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Production', @level2type=N'COLUMN',@level2name=N'dateInQue'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Production', N'INDEX',N'IX_Production-OperID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'OnBoard' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Production', @level2type=N'INDEX',@level2name=N'IX_Production-OperID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PU', N'COLUMN',N'PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=LB, 2=FT, 3=PC, 4=LOT, 5=Inch' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PU', @level2type=N'COLUMN',@level2name=N'PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PU', N'COLUMN',N'Unit'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=$/LB, 2=$/FT, 3=$/PC, 4=$Lot, 5=$/Inch' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PU', @level2type=N'COLUMN',@level2name=N'Unit'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PU', N'COLUMN',N'Label'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Label for Unit- Pounds' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PU', @level2type=N'COLUMN',@level2name=N'Label'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'POitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.f_ProperPOitem(9-2)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'POitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'SOitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'7-2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'SOitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'SalesP'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA salesP initial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'SalesP'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'Company'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Vendor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'Company'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'CC'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Condition Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'CC'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'Order_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Vendor Priced quantity like PC,FT, or LB' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'Order_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'Pieces'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Full Pieces, different than priced quantity' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'Pieces'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'p_lb'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depricated. replace by Order_P' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'p_lb'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'p_pc'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depricated. replace by Order_P' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'p_pc'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'p_ft'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depricated. replace by Order_P' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'p_ft'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'lotp'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depricated. replace by Order_P' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'lotp'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'OrderDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date Ordered' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'OrderDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'Due_Min'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'MIN Due to ship to HPA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'Due_Min'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'Due_Max'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'MAX Due to ship to HPA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'Due_Max'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'Received'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date at HPA, filled from HPA App receiving save.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'Received'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'Cert'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Delivery included the Cert' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'Cert'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'Delivered'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Delivered (first metal Received In or no metal to be Received)  -not necessarily complete' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'Delivered'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'Cmplt'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When all receives are done, then it is complete.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'Cmplt'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'POSalesP'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Vendor person name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'POSalesP'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'JobNumber'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Another HPA SO or PO associated with this PO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'JobNumber'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'Services'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Order for Service/Lab test, may not receive material with PO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'Services'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'ConvServ'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Conversion Service' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'ConvServ'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'Equipment'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Supplies, Processing machines, Tools and Construction' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'Equipment'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'Stock'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'All for Stock,Mostly Stock,Some Stock,No Stock,DO NOT Stock!,Custom Stock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'Stock'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'Sheet_pk'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Print Sheet packing instructions' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'Sheet_pk'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'ShipWhere'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'before POShipAddr, holds ship to of 1=Tipton, 2=DIRECT 3=Blind 4=Service 5=Windfall 6=RemoteStock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'ShipWhere'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'POshipaddr'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ShipCode in ShipAddr table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'POshipaddr'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'POpayaddr'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depretiated, Use VendCode' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'POpayaddr'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'Randlen'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Item is not specific length but random' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'Randlen'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'Metric'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Flag to show inch back to metric' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'Metric'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'Sz1Orig'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds Metric Size1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'Sz1Orig'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'Sz2Orig'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds Metric Size2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'Sz2Orig'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'Sz3Orig'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds Metric Size3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'Sz3Orig'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'DispAlloy'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'What the Vendor calles the Alloy' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'DispAlloy'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'StandSize'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standard Size- used when importing to Stock.  Needs Standard size for PriceTable.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'StandSize'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'VendCode'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'VendCode from Vendor, Presence shows to use full address.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'VendCode'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'HPA_Due_Min'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Min Due at HPA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'HPA_Due_Min'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'HPA_Due_Max'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Max due at HPA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'HPA_Due_Max'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'First_Due_Max'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Equal to HPA_Due_Max or HPA_Due_Min if HPA_Due_Max is empty. - Should have used function!' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'First_Due_Max'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'Reconciled'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Accounting Reconcile' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'Reconciled'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'StockLst_PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct: Used in StockLst PricingUnit' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'StockLst_PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'StockLst_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct: Used in StockLst, Quantity based on form.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'StockLst_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'StockLst_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Used by StockLst, Price per unit (QTY), Uses proper unit for form.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'StockLst_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'StockLst_Total'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'StockLst_QTY * StockLst_P' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'StockLst_Total'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'Order_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Vendor Price per unit (QTY)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'Order_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'Order_PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Store PU (Pricing Units) that Vendor needs.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'Order_PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'Pounds'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Use only Pounds here!' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'Pounds'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'BMScheck'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'DLA Bulk Metal Supplier QC Approved' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'BMScheck'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'ShipLocation'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Location as defined in StockLst_Location RemoteStock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'ShipLocation'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'VendorPOConf'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Vendor Confirms Receipt of PO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'VendorPOConf'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'Melt'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SELECT [Type] FROM dbo.Melt_Type' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'Melt'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'HPA_Lot'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds HPA Lot when being tested  -do not inclue HPA, just G1234' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'HPA_Lot'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'IntP'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Internal Production- do not report as Purchase' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'IntP'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'RcvdE'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'True if ''Hey, good news''  Recieved Email has been sent.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'RcvdE'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'DLAE'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'True if  DLA Email has been sent to QA.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'DLAE'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'TBL'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Table for INCOMING process SBW StockLst, BrokerLst, WIPLst' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'TBL'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'ID_Detail_Process'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID_Detail_Process of INCOMING process' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'ID_Detail_Process'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PurchaseOrder', N'COLUMN',N'Hold'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hold Status' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseOrder', @level2type=N'COLUMN',@level2name=N'Hold'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'QuickCompany', N'COLUMN',N'customer'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Peachtree Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QuickCompany', @level2type=N'COLUMN',@level2name=N'customer'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'QuickCompany', N'COLUMN',N'xcomp'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dead!' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QuickCompany', @level2type=N'COLUMN',@level2name=N'xcomp'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'QuickCompany', N'COLUMN',N'xCompName'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SELECT dbo.f_GetxCompName( Phone+SOUNDEX(Company)+SOUNDEX(name) )' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QuickCompany', @level2type=N'COLUMN',@level2name=N'xCompName'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'QuickCompany', N'COLUMN',N'PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Preferred Price Unit, See dbo.Forms.PU' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QuickCompany', @level2type=N'COLUMN',@level2name=N'PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'QuickCompany', N'COLUMN',N'NoNoiseName'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N' NoNoiseName = dbo.f_NoNoiseName(inserted.Company) ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QuickCompany', @level2type=N'COLUMN',@level2name=N'NoNoiseName'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'QuickCompany', N'INDEX',N'IX_QuickCompany-NoNoiseName'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'NoNoiseName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QuickCompany', @level2type=N'INDEX',@level2name=N'IX_QuickCompany-NoNoiseName'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Quote_No', N'COLUMN',N'Inqnum'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'First InqNum is Quote#' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quote_No', @level2type=N'COLUMN',@level2name=N'Inqnum'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Quote_No', N'COLUMN',N'InqNumP'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'InqNum with SalesP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quote_No', @level2type=N'COLUMN',@level2name=N'InqNumP'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Quote_No', N'COLUMN',N'SalesP'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sales Rep Initial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quote_No', @level2type=N'COLUMN',@level2name=N'SalesP'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Quote_No', N'COLUMN',N'AllInqNum'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'All IDs listed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quote_No', @level2type=N'COLUMN',@level2name=N'AllInqNum'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Quote_No', N'INDEX',N'IX_Quote_No-InqNumP'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'InqNump - Revision' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quote_No', @level2type=N'INDEX',@level2name=N'IX_Quote_No-InqNumP'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'Quote_No', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'QA Quotes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quote_No'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Quote_No_AQID', N'COLUMN',N'Quote_No_id'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID Field in Quote_No table, not the Quote Number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quote_No_AQID', @level2type=N'COLUMN',@level2name=N'Quote_No_id'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Quote_No_AQID', N'COLUMN',N'AllQuotes_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'from AllQuotes.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quote_No_AQID', @level2type=N'COLUMN',@level2name=N'AllQuotes_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'Quote_No_AQID', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Ties QA Quotes to the AllQuotes table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quote_No_AQID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Quote_Services', N'COLUMN',N'SOitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SO item, 7 digit SO, ''-'', and 2 digit item number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quote_Services', @level2type=N'COLUMN',@level2name=N'SOitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Quotes_PMI', N'COLUMN',N'PMIi'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Number of PMI per Group, Individual' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quotes_PMI', @level2type=N'COLUMN',@level2name=N'PMIi'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Quotes_PMI', N'COLUMN',N'PMIc'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Number of PMI per Group, Combine' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Quotes_PMI', @level2type=N'COLUMN',@level2name=N'PMIc'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Receiving ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'Received'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date Entered' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'Received'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'POitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.f_ProperPOitem(9-2)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'POitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'SOitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.f_ProperSOitem(7-2)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'SOitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'lot'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'WO_Detail produce the Lot number to track' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'lot'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'Cert'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Material came with Cert' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'Cert'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'Init'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Worker Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'Init'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'Date'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date arrived at HPA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'Date'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'Pass'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Material is in good shape.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'Pass'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'GoodPapers'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Legible, For QA to track Vendor problems.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'GoodPapers'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'ActualW'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA scale weight' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'ActualW'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'BillW'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Billed, Invoiced Weight' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'BillW'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'Vendor'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Suppliers name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'Vendor'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'Cancelled'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data has been removed from PurchaseOrders and StockLst' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'Cancelled'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'WhenAdd'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date and Time saved to table on Insert.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'WhenAdd'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'ID_Master'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'StockLst Master ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'ID_Master'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'StockTable'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'S stock, B broker, N NA like Service' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'StockTable'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'RejectReason'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Discrepancy Notes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'RejectReason'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'RMA_No'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Receipt back of RMA material.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'RMA_No'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'RMA_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Detail of Returned material' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'RMA_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'VeriRecv'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This receive has been Verified' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'VeriRecv'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'AcctNotify'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Accounting has been notified of Receive' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'AcctNotify'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'AcctFinish'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Accounting has (finished) reconciled' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'AcctFinish'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'VI_ID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'related to dbo.Vendor_Invoice_Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'VI_ID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'R_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Acct Stnd QTY' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'R_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'R_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Acct Stnd Price, filled by Vendor_Invoice App' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'R_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'R_Total'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Acct Stnd (R_QTY * R_P)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'R_Total'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'R_PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Acct Stnd PU' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'R_PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'R_AP_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Account Payable adjusted Price' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'R_AP_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'R_AP_Total'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Account Payable adjusted Price Total -(R_QTY * R_AP_P)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'R_AP_Total'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'hold'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Material has issues, Placed On Hold' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'hold'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'PO_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Vendors QTY' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'PO_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'PO_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Vendors Price / Unit, from PurchaseOrder, corrected by Vendor_Invoice' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'PO_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'PO_Total'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Vendors Pricing' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'PO_Total'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'PO_PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Vendors PU' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'PO_PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'Services'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Order for Service/Lab test, may not receive material with PO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'Services'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'ConvServ'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Conversion Service' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'ConvServ'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'Equipment'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Supplies, Processing machines, Tools and Construction' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'Equipment'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'CertID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cert ID of Mill Cert' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'CertID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'MillTrace'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cert is tracable to Mill' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'MillTrace'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'Stock_Recv_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Entered by frmRecv_Stock  Stock_Receiving.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'Stock_Recv_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'SnapShot_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.Stock_Receiving.SnapShot_ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'SnapShot_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'RejectPC'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'depricated' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'RejectPC'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Receiving', N'COLUMN',N'form'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'depricated' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receiving', @level2type=N'COLUMN',@level2name=N'form'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Recollect_Cert_Loc', N'INDEX',N'IX_Recollect_Cert_Loc'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'UNS Form Size Heat Lot' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Recollect_Cert_Loc', @level2type=N'INDEX',@level2name=N'IX_Recollect_Cert_Loc'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Recollect_Cert_Loc', N'INDEX',N'IX_Recollect_Cert_Loc_NOLOT'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'UNS Form Size Heat' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Recollect_Cert_Loc', @level2type=N'INDEX',@level2name=N'IX_Recollect_Cert_Loc_NOLOT'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'RMA', N'COLUMN',N'corraction'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Corrective Action' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMA', @level2type=N'COLUMN',@level2name=N'corraction'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'RMA', N'COLUMN',N'WhoAdd'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Must be fully reviewed if Initiated by a SalesRep before Approved' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMA', @level2type=N'COLUMN',@level2name=N'WhoAdd'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'RMA_Detail', N'COLUMN',N'CncSO_item'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Also mark SOitem as Cancelled. Sometimes this RMA is for rework and sometimes a new rework SO is not used.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMA_Detail', @level2type=N'COLUMN',@level2name=N'CncSO_item'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'RMA_Detail', N'COLUMN',N'SP_fault'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Percent of blame on SalesP, 0 to 100.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMA_Detail', @level2type=N'COLUMN',@level2name=N'SP_fault'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'RMA_Detail', N'COLUMN',N'ReceivingID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.Receiving.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMA_Detail', @level2type=N'COLUMN',@level2name=N'ReceivingID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'RMA_Detail', N'COLUMN',N'RMA_E'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'True if ''Hey, good news''  Email has been sent.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMA_Detail', @level2type=N'COLUMN',@level2name=N'RMA_E'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'RMA_Detail', N'COLUMN',N'Descrip'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Description of Return' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMA_Detail', @level2type=N'COLUMN',@level2name=N'Descrip'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'RMA_Receive', N'COLUMN',N'RMA_RCV_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This Identity' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMA_Receive', @level2type=N'COLUMN',@level2name=N'RMA_RCV_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'RMA_Receive', N'COLUMN',N'RMA_Detail_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'From RAM_Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMA_Receive', @level2type=N'COLUMN',@level2name=N'RMA_Detail_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'RMA_Receive', N'COLUMN',N'ReceivingID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'From Receiving' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMA_Receive', @level2type=N'COLUMN',@level2name=N'ReceivingID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'RMA_Receive', N'COLUMN',N'Stk_ID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the Stock ID_Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMA_Receive', @level2type=N'COLUMN',@level2name=N'Stk_ID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'RMA_Receive', N'COLUMN',N'Sales_Detail_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'table dbo.Sales_Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMA_Receive', @level2type=N'COLUMN',@level2name=N'Sales_Detail_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Roll_log', N'COLUMN',N'SrvcPO'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Conversion or Service HPA PO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Roll_log', @level2type=N'COLUMN',@level2name=N'SrvcPO'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Roll_log', N'COLUMN',N'AC_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Related to dbo.AcctCosting.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Roll_log', @level2type=N'COLUMN',@level2name=N'AC_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Roll_log', N'COLUMN',N'AC_cmplt'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Accounting Costing completed.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Roll_log', @level2type=N'COLUMN',@level2name=N'AC_cmplt'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Roll_log', N'COLUMN',N'R'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Report Quality' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Roll_log', @level2type=N'COLUMN',@level2name=N'R'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr', N'COLUMN',N'SOitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'OT_OrderType.OrderTypeId =4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr', @level2type=N'COLUMN',@level2name=N'SOitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr', N'COLUMN',N'WO'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'OT_OrderType.OrderTypeId =1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr', @level2type=N'COLUMN',@level2name=N'WO'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr', N'COLUMN',N'WO_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'OT_OrderType.OrderTypeId =5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr', @level2type=N'COLUMN',@level2name=N'WO_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr', N'COLUMN',N'Quote_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'from AllQuotes.ID NO OrderType' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr', @level2type=N'COLUMN',@level2name=N'Quote_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr', N'COLUMN',N'Started'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.f_rtr_Min_Started (ID,MIN(rtrD.Detail))' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr', @level2type=N'COLUMN',@level2name=N'Started'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr', N'COLUMN',N'Finished'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.f_rtr_Max_Finished (ID,Max(rtrD.Detail))' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr', @level2type=N'COLUMN',@level2name=N'Finished'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr', N'COLUMN',N'MinD'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'MIN(rtrD.Detail)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr', @level2type=N'COLUMN',@level2name=N'MinD'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr', N'COLUMN',N'MaxD'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Max(rtrD.Detail) AS MaxD ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr', @level2type=N'COLUMN',@level2name=N'MaxD'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr', N'COLUMN',N'Last_Started'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.f_rtr_Last_Started(ID)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr', @level2type=N'COLUMN',@level2name=N'Last_Started'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr', N'COLUMN',N'Last_Finished'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.f_rtr_Last_Finished(ID)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr', @level2type=N'COLUMN',@level2name=N'Last_Finished'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr', N'COLUMN',N'Next_Detail_Start'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.f_rtr_Next_Detail_Start(ID, dbo.f_rtr_Last_Started(ID) )' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr', @level2type=N'COLUMN',@level2name=N'Next_Detail_Start'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr', N'COLUMN',N'Next_Detail_Finish'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.f_rtr_Next_Detail_Finish(ID, dbo.f_rtr_Last_Finished(ID) )' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr', @level2type=N'COLUMN',@level2name=N'Next_Detail_Finish'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr', N'COLUMN',N'Next_Rely_On_Start'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.f_rtr_RelyOn_Start(ID, dbo.f_rtr_Last_Finished(ID) )' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr', @level2type=N'COLUMN',@level2name=N'Next_Rely_On_Start'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr', N'COLUMN',N'OType_Num'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.f_rtr_OType_Num(''SI'','' 112123-01'') or dbo.f_rtr_OType_Num_OrderTypeID(4,'' 112123-01'')' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr', @level2type=N'COLUMN',@level2name=N'OType_Num'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr', N'COLUMN',N'OldID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID Used in ERP_2.dbo.rtr' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr', @level2type=N'COLUMN',@level2name=N'OldID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr', N'COLUMN',N'cncld'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cancelled' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr', @level2type=N'COLUMN',@level2name=N'cncld'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Detail', N'COLUMN',N'rtr_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'related to dbo.rtr.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Detail', @level2type=N'COLUMN',@level2name=N'rtr_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Detail', N'COLUMN',N'Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A collection of same rtr_ID seperated by 100 in order of execution.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Detail', @level2type=N'COLUMN',@level2name=N'Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Detail', N'COLUMN',N'Started'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'True when started' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Detail', @level2type=N'COLUMN',@level2name=N'Started'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Detail', N'COLUMN',N'StartDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Actual Start Date Time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Detail', @level2type=N'COLUMN',@level2name=N'StartDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Detail', N'COLUMN',N'Finished'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'True when Finished' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Detail', @level2type=N'COLUMN',@level2name=N'Finished'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Detail', N'COLUMN',N'FinishDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Actual Finish Date Time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Detail', @level2type=N'COLUMN',@level2name=N'FinishDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Detail', N'COLUMN',N'Oper_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Operation ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Detail', @level2type=N'COLUMN',@level2name=N'Oper_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Detail', N'COLUMN',N'POitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.f_ProperPOitem()' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Detail', @level2type=N'COLUMN',@level2name=N'POitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Detail', N'COLUMN',N'Cncld'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'True when Cancelled' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Detail', @level2type=N'COLUMN',@level2name=N'Cncld'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Detail', N'COLUMN',N'CnclDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Time stamp of Cancel --send GetDate with the Cncld [p_rtr_Oper_Cancel]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Detail', @level2type=N'COLUMN',@level2name=N'CnclDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Detail', N'COLUMN',N'ReqSched'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Requires a dbo.Production Schedule (Some details do not require)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Detail', @level2type=N'COLUMN',@level2name=N'ReqSched'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Detail', N'COLUMN',N'EstTime'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estimated time in Minutes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Detail', @level2type=N'COLUMN',@level2name=N'EstTime'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Detail', N'COLUMN',N'ActTime'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Actual time in minutes.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Detail', @level2type=N'COLUMN',@level2name=N'ActTime'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Detail', N'COLUMN',N'Rely_On'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relys on a Detail to be done first.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Detail', @level2type=N'COLUMN',@level2name=N'Rely_On'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Detail', N'COLUMN',N'Next_Up'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Next Detail to trigger on Finish' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Detail', @level2type=N'COLUMN',@level2name=N'Next_Up'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Detail', N'COLUMN',N'Synchro'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Detail to be Synchronized to' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Detail', @level2type=N'COLUMN',@level2name=N'Synchro'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Detail', N'CONSTRAINT',N'IX_rtr_ID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID Detail primary unique key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Detail', @level2type=N'CONSTRAINT',@level2name=N'IX_rtr_ID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Detail_OT', N'COLUMN',N'rtr_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'related to dbo.rtr.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Detail_OT', @level2type=N'COLUMN',@level2name=N'rtr_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Detail_OT', N'COLUMN',N'Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A collection of same rtr_ID seperated by 100 in order of execution.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Detail_OT', @level2type=N'COLUMN',@level2name=N'Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Detail_OT', N'COLUMN',N'Started'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'True when started' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Detail_OT', @level2type=N'COLUMN',@level2name=N'Started'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Detail_OT', N'COLUMN',N'StartDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Actual Start Date Time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Detail_OT', @level2type=N'COLUMN',@level2name=N'StartDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Detail_OT', N'COLUMN',N'Finished'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'True when Finished' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Detail_OT', @level2type=N'COLUMN',@level2name=N'Finished'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Detail_OT', N'COLUMN',N'FinishDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Actual Finish Date Time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Detail_OT', @level2type=N'COLUMN',@level2name=N'FinishDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Detail_OT', N'COLUMN',N'Operation'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Description of Operation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Detail_OT', @level2type=N'COLUMN',@level2name=N'Operation'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Detail_OT', N'COLUMN',N'Oper_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Operation ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Detail_OT', @level2type=N'COLUMN',@level2name=N'Oper_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Detail_OT', N'COLUMN',N'EstTime'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estimated time in Minutes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Detail_OT', @level2type=N'COLUMN',@level2name=N'EstTime'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Detail_OT', N'COLUMN',N'ActTime'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Actual time in minutes.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Detail_OT', @level2type=N'COLUMN',@level2name=N'ActTime'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Detail_OT', N'COLUMN',N'TimeID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'from dbo.OT_Times' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Detail_OT', @level2type=N'COLUMN',@level2name=N'TimeID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Detail_OT', N'COLUMN',N'StartTime'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'from dbo.OT_Times' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Detail_OT', @level2type=N'COLUMN',@level2name=N'StartTime'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Detail_OT', N'COLUMN',N'Start_StatusID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'from dbo.OT_Times' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Detail_OT', @level2type=N'COLUMN',@level2name=N'Start_StatusID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Detail_OT', N'COLUMN',N'StopTime'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'from dbo.OT_Times' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Detail_OT', @level2type=N'COLUMN',@level2name=N'StopTime'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Detail_OT', N'COLUMN',N'Stop_StatusID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'from dbo.OT_Times' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Detail_OT', @level2type=N'COLUMN',@level2name=N'Stop_StatusID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Detail_OT', N'COLUMN',N'TrackID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'from dbo.OT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Detail_OT', @level2type=N'COLUMN',@level2name=N'TrackID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Detail_OT', N'COLUMN',N'JobID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'from OT_Job' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Detail_OT', @level2type=N'COLUMN',@level2name=N'JobID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Detail_OT', N'COLUMN',N'OrderTypeID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'from dbo.OT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Detail_OT', @level2type=N'COLUMN',@level2name=N'OrderTypeID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Detail_OT', N'COLUMN',N'OType_Num'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'from dbo.OT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Detail_OT', @level2type=N'COLUMN',@level2name=N'OType_Num'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Machine', N'COLUMN',N'Oper_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Base 500 values' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Machine', @level2type=N'COLUMN',@level2name=N'Oper_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Machine', N'COLUMN',N'Asset_No'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'From Mainimizer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Machine', @level2type=N'COLUMN',@level2name=N'Asset_No'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Machine', N'COLUMN',N'IEQ_Code'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'From Mainimizer, Inventory Equipment Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Machine', @level2type=N'COLUMN',@level2name=N'IEQ_Code'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Machine', N'COLUMN',N'EQ_Code'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'From Mainimizer, Equipment Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Machine', @level2type=N'COLUMN',@level2name=N'EQ_Code'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Machine', N'COLUMN',N'EQ_Short_Description'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'From Mainimizer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Machine', @level2type=N'COLUMN',@level2name=N'EQ_Short_Description'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Machine', N'COLUMN',N'EQ_Long_Description'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'From Mainimizer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Machine', @level2type=N'COLUMN',@level2name=N'EQ_Long_Description'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Machine', N'COLUMN',N'Tag_Date'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'From Mainimizer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Machine', @level2type=N'COLUMN',@level2name=N'Tag_Date'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Operation', N'COLUMN',N'Oper_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Base 500 values' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Operation', @level2type=N'COLUMN',@level2name=N'Oper_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Operation', N'COLUMN',N'Operation'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'English text of Operation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Operation', @level2type=N'COLUMN',@level2name=N'Operation'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Operation', N'COLUMN',N'jobClassID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'from OT_Job_Class' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Operation', @level2type=N'COLUMN',@level2name=N'jobClassID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Operation', N'COLUMN',N'jobClass'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'General grouping found in [OT_Job_Class]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Operation', @level2type=N'COLUMN',@level2name=N'jobClass'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Operation', N'COLUMN',N'jobType'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Specific machine of Class' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Operation', @level2type=N'COLUMN',@level2name=N'jobType'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Operation', N'COLUMN',N'StdDetail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The rtr_Detail that relates to this operation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Operation', @level2type=N'COLUMN',@level2name=N'StdDetail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Operation', N'COLUMN',N'Better_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A mix of JobClassID and order of operation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Operation', @level2type=N'COLUMN',@level2name=N'Better_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Production-test', N'COLUMN',N'Machine'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'exa GFM B' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Production-test', @level2type=N'COLUMN',@level2name=N'Machine'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Production-test', N'COLUMN',N'Customer'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Company char(30)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Production-test', @level2type=N'COLUMN',@level2name=N'Customer'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Production-test', N'COLUMN',N'OrderNums'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SO item is 7 digit SO, ''-'', and 2 digit item number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Production-test', @level2type=N'COLUMN',@level2name=N'OrderNums'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Production-test', N'COLUMN',N'StartDia'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.f_ProperThk(Data)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Production-test', @level2type=N'COLUMN',@level2name=N'StartDia'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Production-test', N'COLUMN',N'Target_Dia'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.f_ProperThk(Data)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Production-test', @level2type=N'COLUMN',@level2name=N'Target_Dia'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Production-test', N'COLUMN',N'Finish_Dia'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.f_ProperThk(Data)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Production-test', @level2type=N'COLUMN',@level2name=N'Finish_Dia'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Production-test', N'COLUMN',N'CW_RA'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The % off RA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Production-test', @level2type=N'COLUMN',@level2name=N'CW_RA'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Schedule', N'COLUMN',N'Oper_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Oper_ID in rtr_Operation  like 525  Rotary Forge' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Schedule', @level2type=N'COLUMN',@level2name=N'Oper_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Schedule', N'COLUMN',N'SOitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SO item, 7 digit SO, ''-'', and 2 digit item number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Schedule', @level2type=N'COLUMN',@level2name=N'SOitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Schedule', N'COLUMN',N'POitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hold for Outsourced items' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Schedule', @level2type=N'COLUMN',@level2name=N'POitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Schedule', N'COLUMN',N'OnBoard'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hanging on the Board' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Schedule', @level2type=N'COLUMN',@level2name=N'OnBoard'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Schedule', N'COLUMN',N'InQue'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'In Que waiting to be placed OnBoard with a position' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Schedule', @level2type=N'COLUMN',@level2name=N'InQue'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Schedule', N'COLUMN',N'Closed'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Taken off the board.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Schedule', @level2type=N'COLUMN',@level2name=N'Closed'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Schedule', N'COLUMN',N'Sched_Type'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Production Schedule grouping from dbo.OT_Job_Sched' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Schedule', @level2type=N'COLUMN',@level2name=N'Sched_Type'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Schedule', N'COLUMN',N'rtr_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'rtr_ID from dbo.rtr, Have rtr ID before schedule production.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Schedule', @level2type=N'COLUMN',@level2name=N'rtr_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Schedule', N'COLUMN',N'rtr_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Detail to rtr_ID found in dbo.rtr_Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Schedule', @level2type=N'COLUMN',@level2name=N'rtr_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Schedule', N'COLUMN',N'LastTouch'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Record of Last Touch' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Schedule', @level2type=N'COLUMN',@level2name=N'LastTouch'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'rtr_Schedule', N'COLUMN',N'dateInQue'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date order was placed InQue' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rtr_Schedule', @level2type=N'COLUMN',@level2name=N'dateInQue'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'SOitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SO item, 7 digit SO, ''-'', and 2 digit item number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'SOitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'SalesNum'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SO Number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'SalesNum'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'Item'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Item - Detail of SalesNum' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'Item'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'S_Instrct'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Instruction for HPA Shippers' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'S_Instrct'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'Inv'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Inventory/Stock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'Inv'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'BRK'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Broker' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'BRK'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'GFM'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Needs GFM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'GFM'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'Draw'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Needs Draw Bench or Wire Draw' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'Draw'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'Roll'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Needs Rolling' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'Roll'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'Press'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'needs Lake Erie Press' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'Press'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'Mach'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Needs Machining' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'Mach'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'CG'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Needs CG' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'CG'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'Plasma'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Needs Plasma Cut' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'Plasma'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'WJet'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Needs Water Jet cut' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'WJet'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'ColdSaw'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Needs Cold Saw Cut' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'ColdSaw'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'Cert'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Send Cert' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'Cert'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'ItemTot'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'total number of items in SO. Also in Sales_No' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'ItemTot'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'ShipDue'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date SOitem is to ship' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'ShipDue'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'Shipped'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Last Shipment date from PackingSlip.  use Sales_PS for fact' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'Shipped'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'MatlWt'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Material Weight in Pounds from the Quote' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'MatlWt'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'cncld'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cancelled SOitem, update trigger sets Sales_No' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'cncld'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'cmplt'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Completed SOitem, update trigger sets Sales_No' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'cmplt'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'PartNo'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customers Part Number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'PartNo'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'ItemCost'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'bucket from Sales_PS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'ItemCost'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'ItemSale'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estimated Total based on Quoted_Total +CutsP + OtherP in AllQuotes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'ItemSale'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'StkCost'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bucket filled from Sales_PS  -details in to Process_Grab' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'StkCost'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'POCost'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bucket filled from PO edits. try dbo.Receiving. See WO for Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'POCost'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'gs_cost'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Accounting Approved Cost -used when importing from Sage' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'gs_cost'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'gs_sale'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Accounting Approved Sale -used when importing from Sage' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'gs_sale'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'gs_cmplt'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Accounting Approval Complete -used when importing from Sage' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'gs_cmplt'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'RMA_No'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Return Material Authorizion number- holds first record, use RMA for more' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'RMA_No'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'RMA_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'- holds first record, use dbo.RMA_Detail for more' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'RMA_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'QA'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Needs Special QA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'QA'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'CofC'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Needs CofC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'CofC'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'Merc'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Needs Merc free statment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'Merc'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'pPo'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mark customers PO on material' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'pPo'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'pPn'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mark customers Part Number on material.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'pPn'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'pHeat'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mark heat on material.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'pHeat'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'pSpec'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mark customers Spec on material.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'pSpec'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'pDesc'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mark Customers description on material.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'pDesc'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'pOther'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mark on the material' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'pOther'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'Other'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Other field to mark on material' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'Other'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'prcp'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Process in Progress -should check rtr' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'prcp'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'prcd'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Processing Done -should check rtr' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'prcd'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'pckd'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Item has been Packaged - From dbo.PackingSlip trigger' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'pckd'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'Urgent'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Place Ahead of other Orders, 1 thru 9  (1 is highest priority) ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'Urgent'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'ShipOn'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Do not Ship before, Ship on DueDate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'ShipOn'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'Tol'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tolerence text' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'Tol'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'JobHours'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Process time calculated by Order Tracking' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'JobHours'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'ProcLoc'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Work or Processing  Location; T Tipton, W Windfall, B Both  USE Forms.Branch for OLD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'ProcLoc'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'Quoted_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'How Customer wants to see QTY' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'Quoted_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'Quoted_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'How customers wants to see as Price, material cost in per unit. Quoted_PU' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'Quoted_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'Quoted_Total'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total of P*QTY   -not CutsP or OtherP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'Quoted_Total'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'Quoted_DollarTotal'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total of P*QTY +CutsP+OtherP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'Quoted_DollarTotal'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'Quoted_CutsP'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quoted_CutsP  comes from Quote' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'Quoted_CutsP'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'Quoted_OtherP'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quoted_OtherP comes from Quote' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'Quoted_OtherP'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'Quoted_PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customers PriceUnit 1=$/#, 2= $/FT, 3= $/PC they want to see on invoice.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'Quoted_PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'S_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Copied from AllQuotes. Identifies what was expected to ship' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'S_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'S_PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customers PriceUnit 1=$/#, 2= $/FT, 3= $/PC they want to see on invoice.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'S_PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'S_Total'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(Q_P * Q_QTY) ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'S_Total'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'Acct_Total'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'S_Total  +Cuts +OtherP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'Acct_Total'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'dShip'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Direct shipment from Vendor to Customer, True Brokered.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'dShip'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'Typ'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sales Order Type; Inventory, Broker, Mill, Production, Service,Conversion.  dbo.f_Sales_TYP()' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'Typ'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'WO'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'First WO number recorded' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'WO'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'WO_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Just for Ref -do not use' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'WO_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'ProductionWO'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'WO has been created to produce this SOitem' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'ProductionWO'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'IntP'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Internal Production, not for Sales report!   DEPRICATED' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'IntP'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'Export'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Intended for Export, DISC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'Export'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'RcvdE'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'True if ''Hey, good news''  Email has been sent.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'RcvdE'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'RMA_E'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'email the RMA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'RMA_E'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'InqNumP'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'8 digits of InqNum + SalesP char  -ID_AllQuotes is more direct' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'InqNumP'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'Hold'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See dbo.Sales_Hold_Status' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'Hold'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'ID_AllQuotes'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Stores the dbo.AllQuotes ID for forensics' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'ID_AllQuotes'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'DateAdded'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When the recorded was added/made' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'DateAdded'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'RVW_Stock'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Stock manager has reviewed for Stock sale, reset on admendment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'RVW_Stock'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'RVW_Prod'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Shop manager has reviewed for Production sale, reset on admendment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'RVW_Prod'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'Review_Date'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date review started' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'Review_Date'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'Review'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This SOitem has been blessed to proceed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'Review'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'BAD_itemSale'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ItemSale is same as Neighbor item' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'BAD_itemSale'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'Heat'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'-depricate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'Heat'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'QShipped'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'-depricate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'QShipped'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'QBackOrder'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'-depricate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'QBackOrder'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'PT_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'-depricate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'PT_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'PT_PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'-depricate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'PT_PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'PT_CutsP'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'-depricate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'PT_CutsP'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'PT_OtherP'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'-depricate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'PT_OtherP'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'PT_Total'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'-depricate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'PT_Total'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'StkPaid'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depricate -use Sales_PS.  Bucket filled when Stock is choosen (Sale QTY * Paid price) from _Process_Grab' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'StkPaid'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'Selected_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bucket for currect QTY Selected Process  _Process  Acct QTY  -depricate -use function' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'Selected_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'Shipped_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bucket for QTY that was Shipped _Process_Grab Acct QTY  -depricate -use Function' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'Shipped_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'converpo'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'-depricate, moslty out of HPA App, Report Server need' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'converpo'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'converter'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'-depricate, moslty out of HPA App, Report Server need' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'converter'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'conversion'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'-depricate, moslty out of HPA App, Report Server need' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'conversion'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'converfrt'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'-depricate, moslty out of HPA App, Report Server need' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'converfrt'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'conversent'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'-depricate, moslty out of HPA App, Report Server need' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'conversent'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales', N'COLUMN',N'converretu'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'-depricate, moslty out of HPA App, Report Server need' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'converretu'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'COLUMN',N'SOitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'7-2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'COLUMN',@level2name=N'SOitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'COLUMN',N'SalesNum'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N' dbo.f_SalesNum_SOitem(SOitem)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'COLUMN',@level2name=N'SalesNum'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'COLUMN',N'Invoice'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Invoice num generated by Sage' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'COLUMN',@level2name=N'Invoice'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'COLUMN',N'Sale_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'from PackingSlip program' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'COLUMN',@level2name=N'Sale_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'COLUMN',N'Sale_PC'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'from PackingSlip program' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'COLUMN',@level2name=N'Sale_PC'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'COLUMN',N'Sale_LBS'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'from PackingSlip program' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'COLUMN',@level2name=N'Sale_LBS'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'COLUMN',N'Quoted_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer Units Quoted Quantity' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'COLUMN',@level2name=N'Quoted_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'COLUMN',N'Quoted_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customers Units Quoted cost in per unit.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'COLUMN',@level2name=N'Quoted_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'COLUMN',N'Quoted_PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customers Number to identify Pricing Unit' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'COLUMN',@level2name=N'Quoted_PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'COLUMN',N'Quoted_PC'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quoted Pieces' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'COLUMN',@level2name=N'Quoted_PC'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'COLUMN',N'StockLst_Qty'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Acct Stnd, from Shop_StockLst_Edit program trigger' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'COLUMN',@level2name=N'StockLst_Qty'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'COLUMN',N'StockLst_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Acct Stnd, Price, material cost in per unit.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'COLUMN',@level2name=N'StockLst_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'COLUMN',N'StockLst_Total'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct Stnd, StockLst_QTY * StockLst_P' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'COLUMN',@level2name=N'StockLst_Total'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'COLUMN',N'StockLst_PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Acct Stnd, PriceUnit 1=$/#, 2= $/FT, 3= $/PC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'COLUMN',@level2name=N'StockLst_PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'COLUMN',N'StockLst_PC'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Stock that was cut for the customer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'COLUMN',@level2name=N'StockLst_PC'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'COLUMN',N'StockLst_Dim1'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Stock that was cut for the customer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'COLUMN',@level2name=N'StockLst_Dim1'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'COLUMN',N'StockLst_Dim2'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Stock that was cut for the customer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'COLUMN',@level2name=N'StockLst_Dim2'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'COLUMN',N'StockLst_Dim3'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Stock that was cut for the customer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'COLUMN',@level2name=N'StockLst_Dim3'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'COLUMN',N'StockLst_LBS'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'LBS not for pricing!' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'COLUMN',@level2name=N'StockLst_LBS'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'COLUMN',N'Removed_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Acct Stnd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'COLUMN',@level2name=N'Removed_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'COLUMN',N'Removed_Total'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct Stnd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'COLUMN',@level2name=N'Removed_Total'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'COLUMN',N'ID_Packing'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'from PackingSlip.ID_PackingSlip' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'COLUMN',@level2name=N'ID_Packing'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'COLUMN',N'StockEdit'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When Shop removed from StockLst' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'COLUMN',@level2name=N'StockEdit'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'COLUMN',N'Shipped'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When PackingSlip was run' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'COLUMN',@level2name=N'Shipped'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'COLUMN',N'Invoice_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customers Units QTY' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'COLUMN',@level2name=N'Invoice_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'COLUMN',N'Invoice_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer Units Pricing' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'COLUMN',@level2name=N'Invoice_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'COLUMN',N'Invoice_Total'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Pricing used for Customer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'COLUMN',@level2name=N'Invoice_Total'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'COLUMN',N'ProfitMargin'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sale_Total - StockLst_Total' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'COLUMN',@level2name=N'ProfitMargin'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'COLUMN',N'Disc_Allowed'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Discount allowed - from sage.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'COLUMN',@level2name=N'Disc_Allowed'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'COLUMN',N'ReconDiff'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Reconcile Difference, Invoice - Actual Paid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'COLUMN',@level2name=N'ReconDiff'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'COLUMN',N'Freight'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Freight, May be total for Invoice, but displayed on one SO item.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'COLUMN',@level2name=N'Freight'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'COLUMN',N'RecDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Reconciled Date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'COLUMN',@level2name=N'RecDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'COLUMN',N'Reconciled'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Set to 1 by the Sales_Detail_Edit App -Receipts-' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'COLUMN',@level2name=N'Reconciled'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'COLUMN',N'StkPaid_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct Stnd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'COLUMN',@level2name=N'StkPaid_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'COLUMN',N'StkPaid_Total'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct Stnd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'COLUMN',@level2name=N'StkPaid_Total'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'COLUMN',N'UserEdit'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'track what was changed in Modify Stock screen' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'COLUMN',@level2name=N'UserEdit'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'INDEX',N'IX_Sales_Detail-PackingSli'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PackingSli' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'INDEX',@level2name=N'IX_Sales_Detail-PackingSli'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail', N'INDEX',N'IX_Sales_Detail-RMA_Detail_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RMA_Detail_ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail', @level2type=N'INDEX',@level2name=N'IX_Sales_Detail-RMA_Detail_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail_PackingSlip', N'COLUMN',N'ID_Packing'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'from PackingSlip.ID_PackingSlip' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail_PackingSlip', @level2type=N'COLUMN',@level2name=N'ID_Packing'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail_PackingSlip', N'COLUMN',N'dShip'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Direct Ship.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail_PackingSlip', @level2type=N'COLUMN',@level2name=N'dShip'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail_Sum', N'COLUMN',N'SOitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'7-2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail_Sum', @level2type=N'COLUMN',@level2name=N'SOitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail_Sum', N'COLUMN',N'Invoice'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Invoice num generated by Sage' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail_Sum', @level2type=N'COLUMN',@level2name=N'Invoice'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail_Sum', N'COLUMN',N'Sale_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'from PackingSlip program' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail_Sum', @level2type=N'COLUMN',@level2name=N'Sale_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail_Sum', N'COLUMN',N'Sale_PC'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'from PackingSlip program' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail_Sum', @level2type=N'COLUMN',@level2name=N'Sale_PC'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail_Sum', N'COLUMN',N'Sale_LBS'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'from PackingSlip program' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail_Sum', @level2type=N'COLUMN',@level2name=N'Sale_LBS'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail_Sum', N'COLUMN',N'Q_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quoted Quantity' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail_Sum', @level2type=N'COLUMN',@level2name=N'Q_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail_Sum', N'COLUMN',N'Q_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quoted cost in per unit.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail_Sum', @level2type=N'COLUMN',@level2name=N'Q_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail_Sum', N'COLUMN',N'Q_PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Number to identify Pricing Unit' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail_Sum', @level2type=N'COLUMN',@level2name=N'Q_PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail_Sum', N'COLUMN',N'StockLst_Qty'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'from Shop_StockLst_Edit program trigger' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail_Sum', @level2type=N'COLUMN',@level2name=N'StockLst_Qty'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail_Sum', N'COLUMN',N'StockLst_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Price, material cost in per unit.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail_Sum', @level2type=N'COLUMN',@level2name=N'StockLst_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail_Sum', N'COLUMN',N'StockLst_Total'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'StockLst_QTY * StockLst_P' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail_Sum', @level2type=N'COLUMN',@level2name=N'StockLst_Total'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail_Sum', N'COLUMN',N'StockLst_PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PriceUnit 1=$/#, 2= $/FT, 3= $/PC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail_Sum', @level2type=N'COLUMN',@level2name=N'StockLst_PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail_Sum', N'COLUMN',N'StockLst_PC'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Stock that was cut for the customer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail_Sum', @level2type=N'COLUMN',@level2name=N'StockLst_PC'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail_Sum', N'COLUMN',N'StockLst_Dim1'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Stock that was cut for the customer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail_Sum', @level2type=N'COLUMN',@level2name=N'StockLst_Dim1'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail_Sum', N'COLUMN',N'StockLst_LBS'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'LBS not for pricing!' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail_Sum', @level2type=N'COLUMN',@level2name=N'StockLst_LBS'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail_Sum', N'COLUMN',N'Edited'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When Shop removed from StockLst' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail_Sum', @level2type=N'COLUMN',@level2name=N'Edited'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Detail_Sum', N'COLUMN',N'Shipped'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When PackingSlip was run' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Detail_Sum', @level2type=N'COLUMN',@level2name=N'Shipped'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Hold_Status', N'COLUMN',N'SOitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SOitem' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Hold_Status', @level2type=N'COLUMN',@level2name=N'SOitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Hold_Status', N'COLUMN',N'SalesNum'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Sales Number, not PO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Hold_Status', @level2type=N'COLUMN',@level2name=N'SalesNum'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Hold_Status', N'COLUMN',N'POitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PO Item' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Hold_Status', @level2type=N'COLUMN',@level2name=N'POitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Hold_Status', N'COLUMN',N'Hold_Type'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'EQP, INV, AR, QA, PO, CSTR, RCV,Proforma' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Hold_Status', @level2type=N'COLUMN',@level2name=N'Hold_Type'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Hold_Status', N'COLUMN',N'Who'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'User Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Hold_Status', @level2type=N'COLUMN',@level2name=N'Who'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Invoice', N'COLUMN',N'Invoice'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sage Invoice' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Invoice', @level2type=N'COLUMN',@level2name=N'Invoice'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Invoice', N'COLUMN',N'SOitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SO item, 7 digit SO, ''-'', and 2 digit item number ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Invoice', @level2type=N'COLUMN',@level2name=N'SOitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Item_Detail', N'COLUMN',N'SOitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SO item, 7 digit SO, ''-'', and 2 digit item number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Item_Detail', @level2type=N'COLUMN',@level2name=N'SOitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No', N'COLUMN',N'salesnum'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sales Number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No', @level2type=N'COLUMN',@level2name=N'salesnum'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No', N'COLUMN',N'salesrep'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Salesman Name   dbo.f_Get_Email_Profile_Name(''David Kirchner'')' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No', @level2type=N'COLUMN',@level2name=N'salesrep'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No', N'COLUMN',N'instrct'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Order Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No', @level2type=N'COLUMN',@level2name=N'instrct'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No', N'COLUMN',N'itemtot'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total Items in SO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No', @level2type=N'COLUMN',@level2name=N'itemtot'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No', N'COLUMN',N'psoldaddr'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sold Addr Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No', @level2type=N'COLUMN',@level2name=N'psoldaddr'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No', N'COLUMN',N'pshipaddr'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ship Addr Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No', @level2type=N'COLUMN',@level2name=N'pshipaddr'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No', N'COLUMN',N'shiproute'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ship Route like what truck line.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No', @level2type=N'COLUMN',@level2name=N'shiproute'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No', N'COLUMN',N'shippay'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'How the Shipper get paid like ''FRT COLLECT''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No', @level2type=N'COLUMN',@level2name=N'shippay'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No', N'COLUMN',N'paytype'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'How HPA gets paid, like StdTerms' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No', @level2type=N'COLUMN',@level2name=N'paytype'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No', N'COLUMN',N'CustID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Accounting ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No', @level2type=N'COLUMN',@level2name=N'CustID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No', N'COLUMN',N'paper_po'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Have a paper PO from customer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No', @level2type=N'COLUMN',@level2name=N'paper_po'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No', N'COLUMN',N'cncld'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sales Order cancelled --must program for dbo.sales cncld' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No', @level2type=N'COLUMN',@level2name=N'cncld'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No', N'COLUMN',N'cmplt'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sales Order Complete --must program for dbo.sales cmplt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No', @level2type=N'COLUMN',@level2name=N'cmplt'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No', N'COLUMN',N'blind'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Package for blind shipment- no HPA labels.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No', @level2type=N'COLUMN',@level2name=N'blind'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No', N'COLUMN',N'faxconf'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Salesman has confirmed SO by fax' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No', @level2type=N'COLUMN',@level2name=N'faxconf'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No', N'COLUMN',N'emailconf'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Salesman has confirmed SO by email' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No', @level2type=N'COLUMN',@level2name=N'emailconf'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No', N'COLUMN',N'freightest'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Freight cost estimate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No', @level2type=N'COLUMN',@level2name=N'freightest'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No', N'COLUMN',N'printedso'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Salesman has initated the print of SO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No', @level2type=N'COLUMN',@level2name=N'printedso'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No', N'COLUMN',N'emailedps'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email Packing Slip when PS is ready' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No', @level2type=N'COLUMN',@level2name=N'emailedps'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No', N'COLUMN',N'faxedps'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fax Packingslip when PS is ready' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No', @level2type=N'COLUMN',@level2name=N'faxedps'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No', N'COLUMN',N'addr_ref'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Reference field in Address space' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No', @level2type=N'COLUMN',@level2name=N'addr_ref'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No', N'COLUMN',N'trt_lumber'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Print the Treated Lumber statement with SO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No', @level2type=N'COLUMN',@level2name=N'trt_lumber'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No', N'COLUMN',N'tarfbill'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tarriff bill to like ''RECEPIENT''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No', @level2type=N'COLUMN',@level2name=N'tarfbill'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No', N'COLUMN',N'usa'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SO is for USA customer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No', @level2type=N'COLUMN',@level2name=N'usa'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No', N'COLUMN',N'ECPC'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'print Export Control Purchasing Clause' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No', @level2type=N'COLUMN',@level2name=N'ECPC'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No', N'COLUMN',N'amendment'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Amendments from Original' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No', @level2type=N'COLUMN',@level2name=N'amendment'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No', N'COLUMN',N'ShopRecv'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Shop Received printout' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No', @level2type=N'COLUMN',@level2name=N'ShopRecv'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No', N'COLUMN',N'Changing'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defaults to 0. Is 1 when edited after a print. Reset to 0 after a Print. Can be sign that a printed version exists.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No', @level2type=N'COLUMN',@level2name=N'Changing'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No', N'COLUMN',N'DPAS'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'DoD Rated, keep details like DO-A1, DX-A3 in Comments Field' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No', @level2type=N'COLUMN',@level2name=N'DPAS'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No', N'COLUMN',N'FCI'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CMMC Federal Contract Info' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No', @level2type=N'COLUMN',@level2name=N'FCI'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No', N'COLUMN',N'GOV'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'USA Government Order' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No', @level2type=N'COLUMN',@level2name=N'GOV'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No', N'COLUMN',N'BillInstrct'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Billing Instructions' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No', @level2type=N'COLUMN',@level2name=N'BillInstrct'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No', N'COLUMN',N'CreateUser'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'UserName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No', @level2type=N'COLUMN',@level2name=N'CreateUser'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No_Chng', N'COLUMN',N'BadTerms'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PayType  was bad and an Alert was sent.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No_Chng', @level2type=N'COLUMN',@level2name=N'BadTerms'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No_Chng', N'INDEX',N'IX_Sales_No_Chng-When'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No_Chng', @level2type=N'INDEX',@level2name=N'IX_Sales_No_Chng-When'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No_Chng', N'INDEX',N'IX_Sales_No_Chng-SalesNum'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SalesNum' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No_Chng', @level2type=N'INDEX',@level2name=N'IX_Sales_No_Chng-SalesNum'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No_Rev', N'COLUMN',N'VER'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SO Version when change comment was saved.  Could be used to time stamp Versions.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No_Rev', @level2type=N'COLUMN',@level2name=N'VER'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_No_Rev', N'COLUMN',N'Comment'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Only used if the sales Number has a version change AND has a Comment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_No_Rev', @level2type=N'COLUMN',@level2name=N'Comment'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_PS', N'COLUMN',N'ID_Packing'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'from PackingSlip.ID_PackingSlip' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_PS', @level2type=N'COLUMN',@level2name=N'ID_Packing'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_PS', N'COLUMN',N'PackingSli'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Packing Slip number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_PS', @level2type=N'COLUMN',@level2name=N'PackingSli'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_PS', N'COLUMN',N'SOitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Related to dbo.Sales.SOitem' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_PS', @level2type=N'COLUMN',@level2name=N'SOitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_PS', N'COLUMN',N'SalesNum'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'redundant' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_PS', @level2type=N'COLUMN',@level2name=N'SalesNum'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_PS', N'COLUMN',N'Acct_PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct Stnd by Form' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_PS', @level2type=N'COLUMN',@level2name=N'Acct_PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_PS', N'COLUMN',N'Acct_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Qty on this Packing Slip line' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_PS', @level2type=N'COLUMN',@level2name=N'Acct_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_PS', N'COLUMN',N'Acct_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'-Depricate use AllQuote.S_P ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_PS', @level2type=N'COLUMN',@level2name=N'Acct_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_PS', N'COLUMN',N'Acct_Total'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total for PS line item' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_PS', @level2type=N'COLUMN',@level2name=N'Acct_Total'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_PS', N'COLUMN',N'Pounds'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'per PS line  item' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_PS', @level2type=N'COLUMN',@level2name=N'Pounds'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_PS', N'COLUMN',N'Cust_PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'How the Customer Ordered' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_PS', @level2type=N'COLUMN',@level2name=N'Cust_PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_PS', N'COLUMN',N'Cust_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'For the Whole SOitem' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_PS', @level2type=N'COLUMN',@level2name=N'Cust_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_PS', N'COLUMN',N'Cust_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'from the SOitem' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_PS', @level2type=N'COLUMN',@level2name=N'Cust_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_PS', N'COLUMN',N'Cust_Total'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total for SOitem' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_PS', @level2type=N'COLUMN',@level2name=N'Cust_Total'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_PS', N'COLUMN',N'Cmplt'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Completed HPA Acct QTY, Including this record.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_PS', @level2type=N'COLUMN',@level2name=N'Cmplt'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_PS', N'COLUMN',N'Cncld'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Packing Slip or SO was Cancelled' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_PS', @level2type=N'COLUMN',@level2name=N'Cncld'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_PS', N'COLUMN',N'Needed_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Balance of HPA Acct QTY Still Needed for SOitem' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_PS', @level2type=N'COLUMN',@level2name=N'Needed_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_PS', N'COLUMN',N'TBL'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Used with ID_Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_PS', @level2type=N'COLUMN',@level2name=N'TBL'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_PS', N'COLUMN',N'SL_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'StockLst ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_PS', @level2type=N'COLUMN',@level2name=N'SL_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_PS', N'COLUMN',N'ID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Stocklst ID_Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_PS', @level2type=N'COLUMN',@level2name=N'ID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_PS', N'COLUMN',N'SL_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'StockLst Price or Value at time of sale' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_PS', @level2type=N'COLUMN',@level2name=N'SL_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_PS', N'COLUMN',N'Sales_Stock_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'related to Sales_Stock_ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_PS', @level2type=N'COLUMN',@level2name=N'Sales_Stock_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_PS', N'COLUMN',N'Book_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Recorded the day the Order item is packed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_PS', @level2type=N'COLUMN',@level2name=N'Book_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_PS', N'COLUMN',N'PS_Date'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date Time PS Record was created.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_PS', @level2type=N'COLUMN',@level2name=N'PS_Date'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_PS', N'COLUMN',N'PickedUP'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'mark as 1 when not on shipping floor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_PS', @level2type=N'COLUMN',@level2name=N'PickedUP'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_PS', N'COLUMN',N'PaperWork'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'True when the Certs PaperWork is done' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_PS', @level2type=N'COLUMN',@level2name=N'PaperWork'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Status', N'COLUMN',N'SOitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SOitem' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Status', @level2type=N'COLUMN',@level2name=N'SOitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Status', N'COLUMN',N'SalesNum'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Sales Number, not PO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Status', @level2type=N'COLUMN',@level2name=N'SalesNum'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Status', N'COLUMN',N'Who'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'User Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Status', @level2type=N'COLUMN',@level2name=N'Who'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'SOitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sales num and Item,7-2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'SOitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'StockLst_Qty'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depricate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'StockLst_Qty'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'StockLst_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depricate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'StockLst_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'StockLst_Total'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depricate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'StockLst_Total'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'StockLst_PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depricate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'StockLst_PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'StockLst_PC'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depricate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'StockLst_PC'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'StockLst_Dim1'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depricate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'StockLst_Dim1'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'StockLst_Dim2'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depricate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'StockLst_Dim2'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'StockLst_Dim3'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depricate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'StockLst_Dim3'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'StockLst_LBS'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depricate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'StockLst_LBS'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'StockLst_POitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'9-2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'StockLst_POitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'Pick_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct Stnd, material Price in Per Unit, not total' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'Pick_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'Pick_Total'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Pick_QTY * Pick_P' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'Pick_Total'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'Pick_PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct Stnd, PriceUnit 1=$/#, 2= $/FT, 3= $/PC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'Pick_PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'Pick_PC'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Pieces, Same as QTY for some forms' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'Pick_PC'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'Pick_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct Stnd, tmpStkSum.QTY  --What stock was used!' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'Pick_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'Consumed'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Last of this Stock Detail was consumed. Yes, No, or Null' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'Consumed'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'StkBack'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Apply CostValue to SOitem, Added drop back to StockLst with 0 CostValue- written off drop' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'StkBack'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'Scrap'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Drop has weight, Cost to SOitem that scrap came from.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'Scrap'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'StockEdit'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When Shop removed from StockLst' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'StockEdit'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'RecDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Record Date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'RecDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'TBL'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'S-StockLst, B-BrokerLst' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'TBL'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'StockLst_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'from dbo Lst_Master' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'StockLst_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'StockLst_ID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'from dbo Lst_Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'StockLst_ID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'ID_Detail_Process'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'from dbo Lst_Process' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'ID_Detail_Process'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'ReceivingID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ReceivingID of Stock from dbo.Receiving.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'ReceivingID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'Removed_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct Stnd,' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'Removed_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'Removed_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct Stnd,' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'Removed_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'Removed_Total'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct Stnd, change from: QTY * current StockLst_P (price/Qty)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'Removed_Total'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'Heat'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Heat' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'Heat'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'Lot'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lot' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'Lot'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'Invoice_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer QTY' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'Invoice_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'Invoice_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer_P' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'Invoice_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'Invoice_Total'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'Invoice_Total'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'Orig_PC'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Before ShopStockLstEdit remove' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'Orig_PC'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'Orig_Dim1'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Before ShopStockLstEdit remove' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'Orig_Dim1'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'Orig_Dim2'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Before ShopStockLstEdit remove' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'Orig_Dim2'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'Orig_Dim3'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Before ShopStockLstEdit remove' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'Orig_Dim3'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'Orig_LBS'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Before ShopStockLstEdit remove' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'Orig_LBS'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'Orig_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct Stnd, What the StockLst looked like before the Edit.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'Orig_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'Orig_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct Stnd,' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'Orig_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'Orig_PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct Stnd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'Orig_PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'Orig_Total'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Acct Stnd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'Orig_Total'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'Sales_Detail_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'from dbo.Sales_Detail.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'Sales_Detail_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'Process_Grab_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'from dbo  Lst_Process_Grab' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'Process_Grab_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'StkPaid_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Orig Paid P' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'StkPaid_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'StkPaid_Total'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Orig Paid P*QTY' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'StkPaid_Total'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'ID_Packing'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'from PackingSlip.ID_PackingSlip' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'ID_Packing'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'PS_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer, What the Packing Slip said was shipped.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'PS_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'PS_HPA_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Acct Stnd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'PS_HPA_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'PS_Cncl'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'when the PackingSlip is Cancelled.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'PS_Cncl'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'Left_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct Stnd, What the StockLst looked like After the Edit.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'Left_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'UserEdit'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'track what was changed in Modify Stock screen' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'UserEdit'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'RMA_Detail_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RMA_Detail number for a Return.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'RMA_Detail_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'Return_ID_Master'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Stock ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'Return_ID_Master'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'COLUMN',N'Who_Rec'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Who Reconciled' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'COLUMN',@level2name=N'Who_Rec'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sales_Stock', N'INDEX',N'IX_SS_SOitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SalesOrder Item' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales_Stock', @level2type=N'INDEX',@level2name=N'IX_SS_SOitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SalesP_Customer', N'COLUMN',N'NoNoiseName'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.f_NoNoiseName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesP_Customer', @level2type=N'COLUMN',@level2name=N'NoNoiseName'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Scan_Code', N'COLUMN',N'Code'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'see Proc_HPA:getScanStandard()  SO SI PO PI EM PR PS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Scan_Code', @level2type=N'COLUMN',@level2name=N'Code'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Scan_Code', N'COLUMN',N'Min'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Minimum number allowed for Code Type' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Scan_Code', @level2type=N'COLUMN',@level2name=N'Min'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Scan_Code', N'COLUMN',N'Max'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Maximum number allowed for Code Type' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Scan_Code', @level2type=N'COLUMN',@level2name=N'Max'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ship', N'COLUMN',N'QShipped'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Keeps Qty of Partial ships' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ship', @level2type=N'COLUMN',@level2name=N'QShipped'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ship', N'COLUMN',N'Brokered'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A true Brokered Sale is never touched by HPA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ship', @level2type=N'COLUMN',@level2name=N'Brokered'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Ship', N'COLUMN',N'Program'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Program or Code reason' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ship', @level2type=N'COLUMN',@level2name=N'Program'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ShipAddr', N'COLUMN',N'shipcode'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=Tipton 2=Windfall' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipAddr', @level2type=N'COLUMN',@level2name=N'shipcode'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ShipAddr', N'COLUMN',N'customer'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Accounting Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipAddr', @level2type=N'COLUMN',@level2name=N'customer'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ShipAddr', N'COLUMN',N'NoNoiseName'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.f_NoNoiseName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipAddr', @level2type=N'COLUMN',@level2name=N'NoNoiseName'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ShipAddrCode', N'COLUMN',N'customer'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Peachtree Customer ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipAddrCode', @level2type=N'COLUMN',@level2name=N'customer'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SO_BoilerPlate', N'COLUMN',N'Company'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'AKA Vendor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SO_BoilerPlate', @level2type=N'COLUMN',@level2name=N'Company'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SO_BoilerPlate', N'COLUMN',N'Binary'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Company=1, Alloy = 2, Form=4, CC=8, Thck_Min=16, Thck_Max =32, Sz2_Min=64, Sz2_Max = 128' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SO_BoilerPlate', @level2type=N'COLUMN',@level2name=N'Binary'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SOitem_Hrs', N'COLUMN',N'SOitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sales num and Item,7-2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SOitem_Hrs', @level2type=N'COLUMN',@level2name=N'SOitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SOitem_Hrs', N'COLUMN',N'Cncld'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cancelled' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SOitem_Hrs', @level2type=N'COLUMN',@level2name=N'Cncld'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SOitem_Hrs', N'COLUMN',N'Cmplt'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Complete' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SOitem_Hrs', @level2type=N'COLUMN',@level2name=N'Cmplt'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SOitem_Hrs', N'COLUMN',N'INV'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Select Stock and QA when from INV' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SOitem_Hrs', @level2type=N'COLUMN',@level2name=N'INV'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SOitem_Hrs', N'COLUMN',N'Recv'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PO needs Receveing QA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SOitem_Hrs', @level2type=N'COLUMN',@level2name=N'Recv'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SOitem_Hrs', N'COLUMN',N'Mach'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'MachineShop' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SOitem_Hrs', @level2type=N'COLUMN',@level2name=N'Mach'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SOitem_Hrs', N'COLUMN',N'CG'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CenterlessGrind' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SOitem_Hrs', @level2type=N'COLUMN',@level2name=N'CG'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SOitem_Hrs', N'COLUMN',N'Pack'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Packing' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SOitem_Hrs', @level2type=N'COLUMN',@level2name=N'Pack'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SOitem_Hrs', N'COLUMN',N'GFM'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GFM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SOitem_Hrs', @level2type=N'COLUMN',@level2name=N'GFM'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SOitem_Hrs', N'COLUMN',N'Roll'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Roll' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SOitem_Hrs', @level2type=N'COLUMN',@level2name=N'Roll'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SOitem_Hrs', N'COLUMN',N'Press'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Press' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SOitem_Hrs', @level2type=N'COLUMN',@level2name=N'Press'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SOitem_Hrs', N'COLUMN',N'Heat'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Heat treat and cool' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SOitem_Hrs', @level2type=N'COLUMN',@level2name=N'Heat'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SOitem_Hrs', N'COLUMN',N'Test'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lab testing report with travel time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SOitem_Hrs', @level2type=N'COLUMN',@level2name=N'Test'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SOitem_Hrs', N'COLUMN',N'Abrsv'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Abrasive Cut' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SOitem_Hrs', @level2type=N'COLUMN',@level2name=N'Abrsv'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SOitem_Hrs', N'COLUMN',N'BSaw'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Band Saw Cut' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SOitem_Hrs', @level2type=N'COLUMN',@level2name=N'BSaw'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SOitem_Hrs', N'COLUMN',N'Shear'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Shear Cut' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SOitem_Hrs', @level2type=N'COLUMN',@level2name=N'Shear'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SOitem_Hrs', N'COLUMN',N'Plasma'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Plasma Cut' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SOitem_Hrs', @level2type=N'COLUMN',@level2name=N'Plasma'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SOitem_Hrs', N'COLUMN',N'WJet'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'waterjet' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SOitem_Hrs', @level2type=N'COLUMN',@level2name=N'WJet'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SOitem_Hrs', N'COLUMN',N'Hrs'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total Hrs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SOitem_Hrs', @level2type=N'COLUMN',@level2name=N'Hrs'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SOitem_Hrs', N'COLUMN',N'DateEst'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Earliest Due or Estimated date of Sale.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SOitem_Hrs', @level2type=N'COLUMN',@level2name=N'DateEst'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SOitem_Hrs', N'COLUMN',N'DateAct'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date Completed or Cancelled' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SOitem_Hrs', @level2type=N'COLUMN',@level2name=N'DateAct'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SoldAddr', N'COLUMN',N'customer'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PeachID Sage' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SoldAddr', @level2type=N'COLUMN',@level2name=N'customer'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SoldAddr', N'COLUMN',N'IND_Type'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'EXEC dbo.p_IND_Type 0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SoldAddr', @level2type=N'COLUMN',@level2name=N'IND_Type'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SoldAddr', N'COLUMN',N'NoNoiseName'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.f_NoNoiseName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SoldAddr', @level2type=N'COLUMN',@level2name=N'NoNoiseName'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SoldAddr', N'COLUMN',N'EIN'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Federal Tax Identification Number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SoldAddr', @level2type=N'COLUMN',@level2name=N'EIN'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SoldAddr', N'COLUMN',N'StTax'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'State Tax number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SoldAddr', @level2type=N'COLUMN',@level2name=N'StTax'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SoldAddr', N'COLUMN',N'FromCode'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Copied from this SoldCode' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SoldAddr', @level2type=N'COLUMN',@level2name=N'FromCode'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SoldAddr', N'COLUMN',N'Marketing'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Marketing data, How did they find HPA?' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SoldAddr', @level2type=N'COLUMN',@level2name=N'Marketing'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SoldAddr', N'COLUMN',N'Added'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'First Added' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SoldAddr', @level2type=N'COLUMN',@level2name=N'Added'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sources', N'COLUMN',N'ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Related to SourcePH by ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sources', @level2type=N'COLUMN',@level2name=N'ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sources', N'COLUMN',N'ID_Sources'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identity' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sources', @level2type=N'COLUMN',@level2name=N'ID_Sources'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sources', N'COLUMN',N'VendCode'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Related to Vendor by VendCode' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sources', @level2type=N'COLUMN',@level2name=N'VendCode'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Spec_Check', N'COLUMN',N'CC'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Condition Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spec_Check', @level2type=N'COLUMN',@level2name=N'CC'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Spec_Check', N'COLUMN',N'CL'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Condition Level' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spec_Check', @level2type=N'COLUMN',@level2name=N'CL'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StartingStock', N'COLUMN',N'SOitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'STR(SalesNum,7,0)+"-"+IIF(itemSO<10,"0"+STR(itemSO,1,0),STR(itemSO,2,0))' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StartingStock', @level2type=N'COLUMN',@level2name=N'SOitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StartingStock', N'COLUMN',N'POitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N' STR(HpaPO,9,0)+"-"+IIF(itemPO<10,"0"+STR(itemPO,1,0),STR(itemPO,2,0))' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StartingStock', @level2type=N'COLUMN',@level2name=N'POitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Projected', N'COLUMN',N'Spec_CC'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Latest Version is in dbo.ConditionLevel.Spec' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Projected', @level2type=N'COLUMN',@level2name=N'Spec_CC'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Projected', N'COLUMN',N'YearInches'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Inches expected in 12 Months, Use Year Pounds' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Projected', @level2type=N'COLUMN',@level2name=N'YearInches'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Projected', N'COLUMN',N'YearPounds'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Pounds expected in 12 Months' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Projected', @level2type=N'COLUMN',@level2name=N'YearPounds'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Projected', N'COLUMN',N'MinPounds'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Min Pounds on Floor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Projected', @level2type=N'COLUMN',@level2name=N'MinPounds'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Projected', N'COLUMN',N'OverSize'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Amount left to CG' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Projected', @level2type=N'COLUMN',@level2name=N'OverSize'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Projected', N'COLUMN',N'SThck'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cold work Start Dia; ,(Thck+OverSize)/SQRT(1-(CAST(CW AS Numeric(4,2))/100))' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Projected', @level2type=N'COLUMN',@level2name=N'SThck'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Projected', N'COLUMN',N'SNomThck'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Next stock size above StartDia' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Projected', @level2type=N'COLUMN',@level2name=N'SNomThck'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Projected', N'COLUMN',N'CW'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cold Work' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Projected', @level2type=N'COLUMN',@level2name=N'CW'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Projected', N'COLUMN',N'Sdate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sart Date for Year Pounds' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Projected', @level2type=N'COLUMN',@level2name=N'Sdate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Projected', N'COLUMN',N'PoundsTaken'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Pounds shipped during Sdate 12 Moth Period.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Projected', @level2type=N'COLUMN',@level2name=N'PoundsTaken'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Projected', N'COLUMN',N'UT'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Requires a UT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Projected', @level2type=N'COLUMN',@level2name=N'UT'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Projected', N'COLUMN',N'FollowM'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Machine Name for lot' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Projected', @level2type=N'COLUMN',@level2name=N'FollowM'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Projected', N'COLUMN',N'FollowLot'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Log Lot umber to Follow' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Projected', @level2type=N'COLUMN',@level2name=N'FollowLot'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Projected', N'COLUMN',N'cncld'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cancel if the Project cannot meet spec' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Projected', @level2type=N'COLUMN',@level2name=N'cncld'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Recv_Process', N'COLUMN',N'SOitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SO item 7-2; used when SELECTED' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Recv_Process', @level2type=N'COLUMN',@level2name=N'SOitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Recv_Process', N'COLUMN',N'PO_item'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PO item 9-2; Used as INCOMING' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Recv_Process', @level2type=N'COLUMN',@level2name=N'PO_item'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Recv_Process', N'COLUMN',N'SalesPerson'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sales Rep of SO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Recv_Process', @level2type=N'COLUMN',@level2name=N'SalesPerson'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Recv_Process', N'COLUMN',N'StartDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Initial date stamp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Recv_Process', @level2type=N'COLUMN',@level2name=N'StartDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Recv_Process', N'COLUMN',N'DueDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'from dbo.Sales_No' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Recv_Process', @level2type=N'COLUMN',@level2name=N'DueDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Recv_Process', N'COLUMN',N'Comment'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'description with PC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Recv_Process', @level2type=N'COLUMN',@level2name=N'Comment'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Recv_Process', N'COLUMN',N'Process_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'see dbo.Stock_Recv_Process_ID_def  CANCELLED,CORRECTION,INCOMING,PARTSELECT ,RECEIVED,SELECTED,NOT2HPA,Sell Stock,Shipped,SUBED,Receiving,PARTRECV,IN_Process,
Quoted' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Recv_Process', @level2type=N'COLUMN',@level2name=N'Process_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Recv_Process', N'COLUMN',N'Processor'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Person adding Process' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Recv_Process', @level2type=N'COLUMN',@level2name=N'Processor'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Recv_Process', N'COLUMN',N'AllowSub'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Y  or N' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Recv_Process', @level2type=N'COLUMN',@level2name=N'AllowSub'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Recv_Process', N'COLUMN',N'PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct, PriceUnit 1=$/#, 2= $/FT, 3= $/PC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Recv_Process', @level2type=N'COLUMN',@level2name=N'PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Recv_Process', N'COLUMN',N'QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'QTY needed from ID_Detail. HPA Acct Stnadard. Think as Prc_QTY' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Recv_Process', @level2type=N'COLUMN',@level2name=N'QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Recv_Process', N'COLUMN',N'Ordered_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct, Use to hold Total QTY needed Order, for historical reference' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Recv_Process', @level2type=N'COLUMN',@level2name=N'Ordered_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Recv_Process', N'COLUMN',N'Ordered_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Price when ordered, for historical reference' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Recv_Process', @level2type=N'COLUMN',@level2name=N'Ordered_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Recv_Process', N'COLUMN',N'Pounds'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'LBS needed from ID_Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Recv_Process', @level2type=N'COLUMN',@level2name=N'Pounds'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Recv_Process', N'COLUMN',N'ID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relate to Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Recv_Process', @level2type=N'COLUMN',@level2name=N'ID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Recv_Process', N'COLUMN',N'ReceivingID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relates back to dbo.Receiving before the INCOMING process is removed.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Recv_Process', @level2type=N'COLUMN',@level2name=N'ReceivingID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Recv_Process', N'COLUMN',N'WO'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'WO can SELECT Stock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Recv_Process', @level2type=N'COLUMN',@level2name=N'WO'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Recv_Process', N'COLUMN',N'WO_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'WO_Detail can list as INCOMING' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Recv_Process', @level2type=N'COLUMN',@level2name=N'WO_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Recv_Process', N'COLUMN',N'InqNumP'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'8 digit Quote then SP init, Used for Process_ID QUOTED' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Recv_Process', @level2type=N'COLUMN',@level2name=N'InqNumP'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Recv_Process', N'COLUMN',N'Prc_Form'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ordered Form, This can be different from Stock Form' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Recv_Process', @level2type=N'COLUMN',@level2name=N'Prc_Form'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Recv_Process', N'COLUMN',N'Prc_PCs'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Number of Pieces this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Recv_Process', @level2type=N'COLUMN',@level2name=N'Prc_PCs'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Recv_Process', N'COLUMN',N'Prc_Dim1'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dim1 this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Recv_Process', @level2type=N'COLUMN',@level2name=N'Prc_Dim1'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Recv_Process', N'COLUMN',N'Prc_Dim2'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dim2 this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Recv_Process', @level2type=N'COLUMN',@level2name=N'Prc_Dim2'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Recv_Process', N'COLUMN',N'Prc_Dim3'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dim3 this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Recv_Process', @level2type=N'COLUMN',@level2name=N'Prc_Dim3'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_Recv_Process', N'COLUMN',N'FoundStk'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When the Shop marks Found on INCOMING process  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_Recv_Process', @level2type=N'COLUMN',@level2name=N'FoundStk'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_SELE_Process', N'COLUMN',N'SOitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SO item 7-2; used when SELECTED' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_SELE_Process', @level2type=N'COLUMN',@level2name=N'SOitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_SELE_Process', N'COLUMN',N'PO_item'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PO item 9-2; Used as INCOMING' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_SELE_Process', @level2type=N'COLUMN',@level2name=N'PO_item'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_SELE_Process', N'COLUMN',N'AllowSub'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Y  or N' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_SELE_Process', @level2type=N'COLUMN',@level2name=N'AllowSub'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_SELE_Process', N'COLUMN',N'PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct, PriceUnit 1=$/#, 2= $/FT, 3= $/PC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_SELE_Process', @level2type=N'COLUMN',@level2name=N'PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_SELE_Process', N'COLUMN',N'QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'QTY needed from ID_Detail. HPA Acct Stnadard. Think as Prc_QTY' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_SELE_Process', @level2type=N'COLUMN',@level2name=N'QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_SELE_Process', N'COLUMN',N'Ordered_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct, Use to hold Total QTY needed Order, for historical reference' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_SELE_Process', @level2type=N'COLUMN',@level2name=N'Ordered_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_SELE_Process', N'COLUMN',N'Ordered_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Price when ordered, for historical reference' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_SELE_Process', @level2type=N'COLUMN',@level2name=N'Ordered_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_SELE_Process', N'COLUMN',N'Pounds'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'LBS needed from ID_Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_SELE_Process', @level2type=N'COLUMN',@level2name=N'Pounds'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_SELE_Process', N'COLUMN',N'ID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relate to Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_SELE_Process', @level2type=N'COLUMN',@level2name=N'ID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_SELE_Process', N'COLUMN',N'ReceivingID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relates back to dbo.Receiving before the INCOMING process is removed.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_SELE_Process', @level2type=N'COLUMN',@level2name=N'ReceivingID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_SELE_Process', N'COLUMN',N'WO'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'WO can SELECT Stock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_SELE_Process', @level2type=N'COLUMN',@level2name=N'WO'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_SELE_Process', N'COLUMN',N'WO_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'WO_Detail can list as INCOMING' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_SELE_Process', @level2type=N'COLUMN',@level2name=N'WO_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_SELE_Process', N'COLUMN',N'Prc_Form'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ordered Form, This can be different from Stock Form' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_SELE_Process', @level2type=N'COLUMN',@level2name=N'Prc_Form'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_SELE_Process', N'COLUMN',N'Prc_PCs'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Number of Pieces this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_SELE_Process', @level2type=N'COLUMN',@level2name=N'Prc_PCs'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_SELE_Process', N'COLUMN',N'Prc_Dim1'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dim1 this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_SELE_Process', @level2type=N'COLUMN',@level2name=N'Prc_Dim1'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_SELE_Process', N'COLUMN',N'Prc_Dim2'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dim2 this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_SELE_Process', @level2type=N'COLUMN',@level2name=N'Prc_Dim2'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stock_SELE_Process', N'COLUMN',N'Prc_Dim3'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dim3 this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock_SELE_Process', @level2type=N'COLUMN',@level2name=N'Prc_Dim3'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Definition', N'COLUMN',N'Color'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RGB set of 3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Definition', @level2type=N'COLUMN',@level2name=N'Color'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Detail', N'COLUMN',N'Size_H'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'High Tol' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Detail', @level2type=N'COLUMN',@level2name=N'Size_H'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Detail', N'COLUMN',N'Size_L'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Low Tol' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Detail', @level2type=N'COLUMN',@level2name=N'Size_L'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Detail', N'COLUMN',N'PC'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Pieces' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Detail', @level2type=N'COLUMN',@level2name=N'PC'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Detail', N'COLUMN',N'Dim1'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Thick/Dia' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Detail', @level2type=N'COLUMN',@level2name=N'Dim1'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Detail', N'COLUMN',N'Dim2'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Width/Length' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Detail', @level2type=N'COLUMN',@level2name=N'Dim2'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Detail', N'COLUMN',N'Dim3'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Length' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Detail', @level2type=N'COLUMN',@level2name=N'Dim3'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Detail', N'COLUMN',N'Length'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depricated  Old Length' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Detail', @level2type=N'COLUMN',@level2name=N'Length'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Detail', N'COLUMN',N'Weight'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'moving to be Pounds, no matter what form' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Detail', @level2type=N'COLUMN',@level2name=N'Weight'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Detail', N'COLUMN',N'CostValue'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'current Price per unit  -depricated, use S_P' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Detail', @level2type=N'COLUMN',@level2name=N'CostValue'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Detail', N'COLUMN',N'Descript'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descript' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Detail', @level2type=N'COLUMN',@level2name=N'Descript'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Detail', N'COLUMN',N'Location'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Where to find stock. SELECT * FROM dbo.StockLst_Location' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Detail', @level2type=N'COLUMN',@level2name=N'Location'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Detail', N'COLUMN',N'FloorStatus'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.StockLst_Definition: X=eXcess,   U=No UT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Detail', @level2type=N'COLUMN',@level2name=N'FloorStatus'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Detail', N'COLUMN',N'Class'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.StockLst_Definition: H=Hold, C=Consumed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Detail', @level2type=N'COLUMN',@level2name=N'Class'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Detail', N'COLUMN',N'Unit'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'$/#, $/FT, $/PC   -depricated, Fill with cPU of S_PU' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Detail', @level2type=N'COLUMN',@level2name=N'Unit'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Detail', N'COLUMN',N'RandLen'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Random Lenght' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Detail', @level2type=N'COLUMN',@level2name=N'RandLen'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Detail', N'COLUMN',N'InvCheck'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Last time detail was processed or cut or InvCheck' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Detail', @level2type=N'COLUMN',@level2name=N'InvCheck'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Detail', N'COLUMN',N'ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Master ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Detail', @level2type=N'COLUMN',@level2name=N'ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Detail', N'COLUMN',N'ID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Detail', @level2type=N'COLUMN',@level2name=N'ID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Detail', N'COLUMN',N'ReceivingID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Receiving.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Detail', @level2type=N'COLUMN',@level2name=N'ReceivingID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Detail', N'COLUMN',N'InvoiceValue'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Per Unit Paid or Invoiced. --Old, filled from PO, use S_P' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Detail', @level2type=N'COLUMN',@level2name=N'InvoiceValue'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Detail', N'COLUMN',N'LiveCheck'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Live Stock Check is in process' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Detail', @level2type=N'COLUMN',@level2name=N'LiveCheck'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Detail', N'COLUMN',N'AccountingCheck'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Yearly Accounting Check- Reset to 0 before starting yearly check' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Detail', @level2type=N'COLUMN',@level2name=N'AccountingCheck'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Detail', N'COLUMN',N'S_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quantity by the Form Standard Units' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Detail', @level2type=N'COLUMN',@level2name=N'S_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Detail', N'COLUMN',N'S_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Current Stock Price per Quantity - Accounting changes current price.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Detail', @level2type=N'COLUMN',@level2name=N'S_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Detail', N'COLUMN',N'S_Total'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Current Cost Total for Accounting Value of Cost' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Detail', @level2type=N'COLUMN',@level2name=N'S_Total'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Detail', N'COLUMN',N'S_PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=$/#, 2= $/FT, 3= $/PC  Form Standard Pricing Units  dbo.f_Get_Unit_nPU(S_PU)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Detail', @level2type=N'COLUMN',@level2name=N'S_PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Detail', N'COLUMN',N'Prime'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Prime Stock Size' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Detail', @level2type=N'COLUMN',@level2name=N'Prime'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Detail_Inserted', N'COLUMN',N'ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Not related to any other table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Detail_Inserted', @level2type=N'COLUMN',@level2name=N'ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Detail_Inserted', N'COLUMN',N'Master_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'related to StockLst_Master.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Detail_Inserted', @level2type=N'COLUMN',@level2name=N'Master_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Detail_Inserted', N'COLUMN',N'ID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the new StockLst_Detail ID_Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Detail_Inserted', @level2type=N'COLUMN',@level2name=N'ID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Detail_Inserted', N'COLUMN',N'Who'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'User who created the insert' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Detail_Inserted', @level2type=N'COLUMN',@level2name=N'Who'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Detail_Inserted', N'COLUMN',N'When'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When this Detail was INSERTed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Detail_Inserted', @level2type=N'COLUMN',@level2name=N'When'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Detail_Inserted', N'COLUMN',N'OrderType'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SOitem, POitem, WO, WODetail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Detail_Inserted', @level2type=N'COLUMN',@level2name=N'OrderType'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Detail_Inserted', N'COLUMN',N'OrderNum'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'String is needed for SO or PO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Detail_Inserted', @level2type=N'COLUMN',@level2name=N'OrderNum'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Detail_Inserted', N'COLUMN',N'Verified'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Insert has been verified' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Detail_Inserted', @level2type=N'COLUMN',@level2name=N'Verified'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Detail_Inserted', N'COLUMN',N'VerifiedBy'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Who verified this Insert' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Detail_Inserted', @level2type=N'COLUMN',@level2name=N'VerifiedBy'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Location', N'COLUMN',N'MaxLBS'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Max Weight' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Location', @level2type=N'COLUMN',@level2name=N'MaxLBS'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stocklst_Master', N'COLUMN',N'Alloy'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standard Alloy Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stocklst_Master', @level2type=N'COLUMN',@level2name=N'Alloy'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stocklst_Master', N'COLUMN',N'Form'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'2 digit form code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stocklst_Master', @level2type=N'COLUMN',@level2name=N'Form'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stocklst_Master', N'COLUMN',N'CC'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Condition Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stocklst_Master', @level2type=N'COLUMN',@level2name=N'CC'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stocklst_Master', N'COLUMN',N'CL'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Condition Level' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stocklst_Master', @level2type=N'COLUMN',@level2name=N'CL'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stocklst_Master', N'COLUMN',N'Size'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'3 decimal size standard' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stocklst_Master', @level2type=N'COLUMN',@level2name=N'Size'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stocklst_Master', N'COLUMN',N'Cond'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Full Condition' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stocklst_Master', @level2type=N'COLUMN',@level2name=N'Cond'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stocklst_Master', N'COLUMN',N'MWeight'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Master weight bucket, SP calcs details' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stocklst_Master', @level2type=N'COLUMN',@level2name=N'MWeight'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stocklst_Master', N'COLUMN',N'Specs'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Specifications' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stocklst_Master', @level2type=N'COLUMN',@level2name=N'Specs'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stocklst_Master', N'COLUMN',N'Heat'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Heat' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stocklst_Master', @level2type=N'COLUMN',@level2name=N'Heat'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stocklst_Master', N'COLUMN',N'Lot'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'heat lot' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stocklst_Master', @level2type=N'COLUMN',@level2name=N'Lot'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stocklst_Master', N'COLUMN',N'Paid'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Price paid in per Unit -Historical' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stocklst_Master', @level2type=N'COLUMN',@level2name=N'Paid'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stocklst_Master', N'COLUMN',N'PO_item'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PO item 9-2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stocklst_Master', @level2type=N'COLUMN',@level2name=N'PO_item'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stocklst_Master', N'COLUMN',N'PoDueDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When PO says due, empty for received' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stocklst_Master', @level2type=N'COLUMN',@level2name=N'PoDueDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stocklst_Master', N'COLUMN',N'Mill'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mill producer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stocklst_Master', @level2type=N'COLUMN',@level2name=N'Mill'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stocklst_Master', N'COLUMN',N'StkDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date entered with receiving program.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stocklst_Master', @level2type=N'COLUMN',@level2name=N'StkDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stocklst_Master', N'COLUMN',N'History'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Where metal was bought' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stocklst_Master', @level2type=N'COLUMN',@level2name=N'History'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stocklst_Master', N'COLUMN',N'Num'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'OLD depricate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stocklst_Master', @level2type=N'COLUMN',@level2name=N'Num'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stocklst_Master', N'COLUMN',N'POStatus'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Due in, Partial receive, Waiting for bill, Accounted' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stocklst_Master', @level2type=N'COLUMN',@level2name=N'POStatus'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stocklst_Master', N'COLUMN',N'FROM_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Where this ID came from' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stocklst_Master', @level2type=N'COLUMN',@level2name=N'FROM_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stocklst_Master', N'COLUMN',N'Melt'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'AOD, ESR, VIM, VIM VAR,-' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stocklst_Master', @level2type=N'COLUMN',@level2name=N'Melt'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stocklst_Master', N'COLUMN',N'ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stocklst_Master', @level2type=N'COLUMN',@level2name=N'ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stocklst_Master', N'COLUMN',N'mS_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Master QTY' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stocklst_Master', @level2type=N'COLUMN',@level2name=N'mS_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stocklst_Master', N'COLUMN',N'ProjID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.Stock_Projected.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stocklst_Master', @level2type=N'COLUMN',@level2name=N'ProjID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stocklst_Master', N'COLUMN',N'MillTrace'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Full mill Tracabilty.  Cert is not marked as Exact Mill Duplicate.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stocklst_Master', @level2type=N'COLUMN',@level2name=N'MillTrace'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stocklst_Master', N'COLUMN',N'DescriptID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'DescriptID or ProductID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stocklst_Master', @level2type=N'COLUMN',@level2name=N'DescriptID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stocklst_Master', N'INDEX',N'IX_Stocklst_Master_AFS'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Alloy, Form,Size' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stocklst_Master', @level2type=N'INDEX',@level2name=N'IX_Stocklst_Master_AFS'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Stocklst_Master', N'INDEX',N'IX_Stocklst_Master_DescriptID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'DescriptID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stocklst_Master', @level2type=N'INDEX',@level2name=N'IX_Stocklst_Master_DescriptID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Master_Inserted', N'COLUMN',N'ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Not related to any other table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Master_Inserted', @level2type=N'COLUMN',@level2name=N'ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Master_Inserted', N'COLUMN',N'Master_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'new ID of StockLst_Master' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Master_Inserted', @level2type=N'COLUMN',@level2name=N'Master_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Master_Inserted', N'COLUMN',N'Who'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'User who created the insert' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Master_Inserted', @level2type=N'COLUMN',@level2name=N'Who'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Master_Inserted', N'COLUMN',N'When'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When this Insert happened' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Master_Inserted', @level2type=N'COLUMN',@level2name=N'When'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Master_Inserted', N'COLUMN',N'Verified'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Has this insert been verified' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Master_Inserted', @level2type=N'COLUMN',@level2name=N'Verified'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Master_Inserted', N'COLUMN',N'VerifiedBy'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Who Verified this Insert' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Master_Inserted', @level2type=N'COLUMN',@level2name=N'VerifiedBy'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Mins', N'COLUMN',N'SafeLevel'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Pounds that trigger reorder' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Mins', @level2type=N'COLUMN',@level2name=N'SafeLevel'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Mins', N'COLUMN',N'MillWeeks'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Weeks for Mill deliver' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Mins', @level2type=N'COLUMN',@level2name=N'MillWeeks'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Mins', N'COLUMN',N'Active'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Items can be deactivated' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Mins', @level2type=N'COLUMN',@level2name=N'Active'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Mins', N'COLUMN',N'QUsage'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quarterly Pounds Used for last complete Quarter' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Mins', @level2type=N'COLUMN',@level2name=N'QUsage'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Mins', N'COLUMN',N'PrevQUsage'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quarterly Pounds Used for the Quarter before the last complete Quarter' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Mins', @level2type=N'COLUMN',@level2name=N'PrevQUsage'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Mins', N'COLUMN',N'YUsage'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Yearly pounds used for Last complete Year' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Mins', @level2type=N'COLUMN',@level2name=N'YUsage'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Mins', N'COLUMN',N'PrevYUsage'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Yearly pounds used for the Year before the Last complete Year' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Mins', @level2type=N'COLUMN',@level2name=N'PrevYUsage'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Mins', N'COLUMN',N'SafeLevelDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date Safe Levels was last edited.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Mins', @level2type=N'COLUMN',@level2name=N'SafeLevelDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Mins', N'COLUMN',N'DescriptID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'DescriptID ProductID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Mins', @level2type=N'COLUMN',@level2name=N'DescriptID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process', N'COLUMN',N'SOitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SO item 7-2; used when SELECTED' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process', @level2type=N'COLUMN',@level2name=N'SOitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process', N'COLUMN',N'PO_item'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PO item 9-2; Used as INCOMING' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process', @level2type=N'COLUMN',@level2name=N'PO_item'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process', N'COLUMN',N'SalesPerson'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sales Rep of SO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process', @level2type=N'COLUMN',@level2name=N'SalesPerson'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process', N'COLUMN',N'StartDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Initial date stamp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process', @level2type=N'COLUMN',@level2name=N'StartDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process', N'COLUMN',N'DueDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'from dbo.Sales_No' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process', @level2type=N'COLUMN',@level2name=N'DueDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process', N'COLUMN',N'Comment'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'description with PC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process', @level2type=N'COLUMN',@level2name=N'Comment'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process', N'COLUMN',N'Process_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'see dbo.StockLst_Process_ID_def  CANCELLED,CORRECTION,INCOMING,PARTSELECT ,RECEIVED,SELECTED,NOT2HPA,Sell Stock,Shipped,SUBED,Receiving,PARTRECV,IN_Process,
Quoted' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process', @level2type=N'COLUMN',@level2name=N'Process_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process', N'COLUMN',N'Processor'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Person adding Process' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process', @level2type=N'COLUMN',@level2name=N'Processor'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process', N'COLUMN',N'AllowSub'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Y  or N' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process', @level2type=N'COLUMN',@level2name=N'AllowSub'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process', N'COLUMN',N'PWeight'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Process Weight - Depricate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process', @level2type=N'COLUMN',@level2name=N'PWeight'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process', N'COLUMN',N'PPc'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Process Pieces, depricated' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process', @level2type=N'COLUMN',@level2name=N'PPc'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process', N'COLUMN',N'PFT'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'depricate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process', @level2type=N'COLUMN',@level2name=N'PFT'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process', N'COLUMN',N'PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct, PriceUnit 1=$/#, 2= $/FT, 3= $/PC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process', @level2type=N'COLUMN',@level2name=N'PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process', N'COLUMN',N'QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'QTY needed from ID_Detail. HPA Acct Stnadard. Think as Prc_QTY' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process', @level2type=N'COLUMN',@level2name=N'QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process', N'COLUMN',N'Ordered_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct, Use to hold Total QTY needed Order, for historical reference' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process', @level2type=N'COLUMN',@level2name=N'Ordered_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process', N'COLUMN',N'Ordered_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Price when ordered, for historical reference' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process', @level2type=N'COLUMN',@level2name=N'Ordered_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process', N'COLUMN',N'Pounds'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'LBS needed from ID_Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process', @level2type=N'COLUMN',@level2name=N'Pounds'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process', N'COLUMN',N'ID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relate to Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process', @level2type=N'COLUMN',@level2name=N'ID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process', N'COLUMN',N'ReceivingID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relates back to dbo.Receiving before the INCOMING process is removed.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process', @level2type=N'COLUMN',@level2name=N'ReceivingID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process', N'COLUMN',N'WO'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'WO can SELECT Stock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process', @level2type=N'COLUMN',@level2name=N'WO'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process', N'COLUMN',N'WO_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'WO_Detail can list as INCOMING' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process', @level2type=N'COLUMN',@level2name=N'WO_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process', N'COLUMN',N'InqNumP'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'8 digit Quote then SP init, Used for Process_ID QUOTED' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process', @level2type=N'COLUMN',@level2name=N'InqNumP'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process', N'COLUMN',N'QTY_Due'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depricated -has been purges from VFP 12/2023' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process', @level2type=N'COLUMN',@level2name=N'QTY_Due'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process', N'COLUMN',N'Prc_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'QTY this Process uses -same as QTY.  Depricate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process', @level2type=N'COLUMN',@level2name=N'Prc_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process', N'COLUMN',N'Prc_Form'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ordered Form, This can be different from Stock Form' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process', @level2type=N'COLUMN',@level2name=N'Prc_Form'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process', N'COLUMN',N'Prc_PCs'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Number of Pieces this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process', @level2type=N'COLUMN',@level2name=N'Prc_PCs'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process', N'COLUMN',N'Prc_Dim1'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dim1 this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process', @level2type=N'COLUMN',@level2name=N'Prc_Dim1'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process', N'COLUMN',N'Prc_Dim2'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dim2 this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process', @level2type=N'COLUMN',@level2name=N'Prc_Dim2'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process', N'COLUMN',N'Prc_Dim3'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dim3 this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process', @level2type=N'COLUMN',@level2name=N'Prc_Dim3'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process', N'COLUMN',N'Prc_Q_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer Quoted Qty Total -not Acct Stnd  -depricate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process', @level2type=N'COLUMN',@level2name=N'Prc_Q_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process', N'COLUMN',N'Prc_Q_PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer Quoted PU -depricate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process', @level2type=N'COLUMN',@level2name=N'Prc_Q_PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process', N'COLUMN',N'FoundStk'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When the Shop marks Found on INCOMING process  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process', @level2type=N'COLUMN',@level2name=N'FoundStk'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Detail', N'COLUMN',N'Who'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Login name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Detail', @level2type=N'COLUMN',@level2name=N'Who'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Detail', N'COLUMN',N'When'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'System Date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Detail', @level2type=N'COLUMN',@level2name=N'When'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Detail', N'COLUMN',N'ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'StockLst ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Detail', @level2type=N'COLUMN',@level2name=N'ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Detail', N'COLUMN',N'ID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID_Detail is filled in from p_StockLst_Detail_ins' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Detail', @level2type=N'COLUMN',@level2name=N'ID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Grab', N'COLUMN',N'SOitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SO item 7-2; used as SELECTED' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'SOitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Grab', N'COLUMN',N'PO_item'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PO item 9-2; Used as INCOMING' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'PO_item'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Grab', N'COLUMN',N'SalesPerson'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sales Rep of SO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'SalesPerson'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Grab', N'COLUMN',N'StartDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Initial date stamp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'StartDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Grab', N'COLUMN',N'Process_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'see dbo.StockLst_Process_ID_def  CANCELLED,CORRECTION,INCOMING,PARTSELECT ,RECEIVED,SELECTED,NOT2HPA,Sell Stock,Shipped,SUBED,Receiving,PARTRECV,IN_Process,
Quoted' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'Process_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Grab', N'COLUMN',N'Processor'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Person adding Process' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'Processor'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Grab', N'COLUMN',N'AllowSub'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Y  or N' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'AllowSub'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Grab', N'COLUMN',N'PWeight'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Process Weight - Depricate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'PWeight'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Grab', N'COLUMN',N'PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct, PriceUnit 1=$/#, 2= $/FT, 3= $/PC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Grab', N'COLUMN',N'QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'QTY needed from ID_Detail. HPA Acct Stnadard. Think as Prc_QTY' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Grab', N'COLUMN',N'S_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'from StockLst_Detail.S_P' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'S_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Grab', N'COLUMN',N'Ordered_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct, Use to hold Total QTY needed Order, for historical reference' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'Ordered_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Grab', N'COLUMN',N'Ordered_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Price when ordered, for historical reference' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'Ordered_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Grab', N'COLUMN',N'Pounds'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'LBS needed from ID_Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'Pounds'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Grab', N'COLUMN',N'ID_Master'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'from StockLst_Master.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'ID_Master'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Grab', N'COLUMN',N'ID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'from StockLst_Detail.ID_Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'ID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Grab', N'COLUMN',N'ID_Detail_Process'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'from StockLst_Process.ID_Detail_Process' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'ID_Detail_Process'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Grab', N'COLUMN',N'ReceivingID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relates back to dbo.Receiving before the INCOMING process is removed.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'ReceivingID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Grab', N'COLUMN',N'WO'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'WO can SELECT Stock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'WO'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Grab', N'COLUMN',N'WO_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'WO_Detail can list as INCOMING' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'WO_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Grab', N'COLUMN',N'InqNumP'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'8 digit Quote then SP init, Used for Process_ID QUOTED' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'InqNumP'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Grab', N'COLUMN',N'Prc_Form'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ordered Form, This can be different from Stock Form' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'Prc_Form'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Grab', N'COLUMN',N'Prc_PCs'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Number of Pieces this Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'Prc_PCs'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Grab', N'COLUMN',N'Prc_Dim1'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dim1 this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'Prc_Dim1'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Grab', N'COLUMN',N'Prc_Dim2'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dim2 this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'Prc_Dim2'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Grab', N'COLUMN',N'Prc_Dim3'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dim3 this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'Prc_Dim3'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Grab', N'COLUMN',N'FoundStk'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When the Shop marks Found on INCOMING process  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'FoundStk'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Grab', N'COLUMN',N'Gone'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Updated at shipping' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'Gone'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Grab', N'COLUMN',N'MS4O'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Modify Stock 4 Order complete' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'MS4O'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Recvd', N'COLUMN',N'PO_item'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PO item 9-2; Used as INCOMING' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'PO_item'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Recvd', N'COLUMN',N'SalesPerson'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sales Rep of SO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'SalesPerson'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Recvd', N'COLUMN',N'StartDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Initial date stamp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'StartDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Recvd', N'COLUMN',N'RecvDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When triggered as Received in StockLst_Process' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'RecvDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Recvd', N'COLUMN',N'Process_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RECEIVED' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'Process_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Recvd', N'COLUMN',N'Processor'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Person adding Process' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'Processor'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Recvd', N'COLUMN',N'Ordered_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Price when ordered, for historical reference' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'Ordered_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Recvd', N'COLUMN',N'Pounds'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'LBS needed from ID_Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'Pounds'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Recvd', N'COLUMN',N'ID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relate to Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'ID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Recvd', N'COLUMN',N'ReceivingID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relates back to dbo.Receiving before the INCOMING process is removed.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'ReceivingID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Recvd', N'COLUMN',N'WO_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'WO_Detail can list as INCOMING' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'WO_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Recvd', N'COLUMN',N'Prc_Form'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ordered Form, This can be different from Stock Form' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'Prc_Form'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Recvd', N'COLUMN',N'Prc_PCs'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Number of Pieces this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'Prc_PCs'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Recvd', N'COLUMN',N'Prc_Dim1'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dim1 this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'Prc_Dim1'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Recvd', N'COLUMN',N'Prc_Dim2'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dim2 this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'Prc_Dim2'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Process_Recvd', N'COLUMN',N'Prc_Dim3'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dim3 this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'Prc_Dim3'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Value', N'COLUMN',N'ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identity' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Value', @level2type=N'COLUMN',@level2name=N'ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Value', N'COLUMN',N'ID_Detail_Process'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID for Detail Process if known.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Value', @level2type=N'COLUMN',@level2name=N'ID_Detail_Process'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Value', N'COLUMN',N'InvoiceValue'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Per Unit' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Value', @level2type=N'COLUMN',@level2name=N'InvoiceValue'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Value', N'COLUMN',N'CurrUnitPrice'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Per Unit' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Value', @level2type=N'COLUMN',@level2name=N'CurrUnitPrice'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Value', N'COLUMN',N'CurrUnits'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Units' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Value', @level2type=N'COLUMN',@level2name=N'CurrUnits'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Value', N'COLUMN',N'CurrTotal'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'UnitPrice X Units. Calculated by trigger.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Value', @level2type=N'COLUMN',@level2name=N'CurrTotal'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Value', N'COLUMN',N'VI_ID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Vendor_Invoice ID_Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Value', @level2type=N'COLUMN',@level2name=N'VI_ID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Vendor', N'COLUMN',N'CCSortValue'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.f_GetCCSortValue(CC)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Vendor', @level2type=N'COLUMN',@level2name=N'CCSortValue'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Vendor', N'COLUMN',N'FormSort'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.f_FormSort(Form)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Vendor', @level2type=N'COLUMN',@level2name=N'FormSort'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Wants', N'COLUMN',N'CCSortValue'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.f_GetCCSortValue(Form)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Wants', @level2type=N'COLUMN',@level2name=N'CCSortValue'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StockLst_Wants', N'COLUMN',N'FormSort'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.f_FormSort(Form)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockLst_Wants', @level2type=N'COLUMN',@level2name=N'FormSort'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SupplierQuotes', N'COLUMN',N'CC'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Condition Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierQuotes', @level2type=N'COLUMN',@level2name=N'CC'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SupplierQuotes', N'COLUMN',N'Notes'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ComputerAd is used as default' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierQuotes', @level2type=N'COLUMN',@level2name=N'Notes'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SupplierQuotes', N'INDEX',N'IX_SupplierQuotes'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Alloy Form Thck' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierQuotes', @level2type=N'INDEX',@level2name=N'IX_SupplierQuotes'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Survey', N'COLUMN',N'SurveyType'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 = Customer, 2 = Employee' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Survey', @level2type=N'COLUMN',@level2name=N'SurveyType'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Survey', N'COLUMN',N'IsConfidential'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'If True, do not display on a Dashboard screen, maybe require viewer to be a manger' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Survey', @level2type=N'COLUMN',@level2name=N'IsConfidential'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Survey_Assignment_ContactInfos', N'COLUMN',N'Quote'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Survey_Assignment_ContactInfos', @level2type=N'COLUMN',@level2name=N'Quote'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Survey_Assignment_ContactInfos', N'COLUMN',N'NoQuote'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When a customer requests a quote, but does not receive a response. Customer requests a survey with "NoQuote" selected.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Survey_Assignment_ContactInfos', @level2type=N'COLUMN',@level2name=N'NoQuote'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Survey_Assignment_ContactInfos', N'COLUMN',N'DoNotContact'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'If the person requests this, no one will contact the user about the experience' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Survey_Assignment_ContactInfos', @level2type=N'COLUMN',@level2name=N'DoNotContact'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Survey_Assignment_CorrectiveAction_ActionStatus_Def', N'COLUMN',N'ClosedStatus'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Survey_Assignment_CorrectiveAction_ActionStatus_Def', @level2type=N'COLUMN',@level2name=N'ClosedStatus'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Survey_Assignment_CorrectiveAction_Communications', N'COLUMN',N'ByEmail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Survey_Assignment_CorrectiveAction_Communications', @level2type=N'COLUMN',@level2name=N'ByEmail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Survey_Assignment_CorrectiveAction_Communications', N'COLUMN',N'ByPhone'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Survey_Assignment_CorrectiveAction_Communications', @level2type=N'COLUMN',@level2name=N'ByPhone'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Survey_Assignment_CorrectiveAction_Communications', N'COLUMN',N'IsSurveyUser'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(User=Person who completed Survey, HPA=Person Assigned from HPA to follow up)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Survey_Assignment_CorrectiveAction_Communications', @level2type=N'COLUMN',@level2name=N'IsSurveyUser'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Survey_Assignment_CorrectiveAction_Communications', N'COLUMN',N'IsConfidential'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'If True, do not display on a Dashboard screen, maybe require viewer to be a manger or person assigned to Corrective Action' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Survey_Assignment_CorrectiveAction_Communications', @level2type=N'COLUMN',@level2name=N'IsConfidential'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Survey_Assignment_CorrectiveActions', N'COLUMN',N'ActionStatus'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(User=Person who completed Survey, HPA=Person Assigned from HPA to follow up)1: Assigned To HPA, 2: HPA Responded, 3: User Responded, 4: HPA Unresponsive, 5: User Unresponsive, 6: Resolved, 7: Unresolved, 8: Closed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Survey_Assignment_CorrectiveActions', @level2type=N'COLUMN',@level2name=N'ActionStatus'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Survey_Assignment_CorrectiveActions', N'COLUMN',N'EndDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'when the actionstatus was marked closed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Survey_Assignment_CorrectiveActions', @level2type=N'COLUMN',@level2name=N'EndDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Survey_Assignment_Type_Def', N'COLUMN',N'Description'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Type of Survey Assignment, 1: Employee, 2: Quote, 3: Sales Order, 4: Purchase Order, 5: General Customer Survey' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Survey_Assignment_Type_Def', @level2type=N'COLUMN',@level2name=N'Description'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Survey_Assignments', N'COLUMN',N'AssignmentType'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: Employee, 2: Quote, 3: Sales Order, 4: Purchase Order, 5: General Customer Survey' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Survey_Assignments', @level2type=N'COLUMN',@level2name=N'AssignmentType'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Survey_Assignments', N'COLUMN',N'TargetIdentifier'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Could be EmployeeID, SOitem, POitem, Quote, etc.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Survey_Assignments', @level2type=N'COLUMN',@level2name=N'TargetIdentifier'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Survey_Assignments', N'COLUMN',N'Anonymous'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'If anonymous, do not connect to a user/person/company' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Survey_Assignments', @level2type=N'COLUMN',@level2name=N'Anonymous'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Survey_Question_Options', N'COLUMN',N'Header'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the group the value is assigned to ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Survey_Question_Options', @level2type=N'COLUMN',@level2name=N'Header'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Survey_Questions', N'COLUMN',N'QuestionType'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: Short Answer, 2: Paragraph, 3: Multiple Choice, 4: Checkboxes, 5: Dropdown, 5: Linear Scale, 7: Multiple Choice Grid, 8: Checkbox Grid, 9: Date, 10: Time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Survey_Questions', @level2type=N'COLUMN',@level2name=N'QuestionType'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Swage_Log', N'COLUMN',N'PO'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer PO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Swage_Log', @level2type=N'COLUMN',@level2name=N'PO'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Swage_Log', N'COLUMN',N'tLoc'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Test Location: Center, MidRadius, Outer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Swage_Log', @level2type=N'COLUMN',@level2name=N'tLoc'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Swage_Log', N'COLUMN',N'tLoc2'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Test Location: Center, MidRadius, Outer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Swage_Log', @level2type=N'COLUMN',@level2name=N'tLoc2'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Swage_Log', N'COLUMN',N'tLoc3'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Test Location: Center, MidRadius, Outer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Swage_Log', @level2type=N'COLUMN',@level2name=N'tLoc3'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Swage_Log', N'COLUMN',N'tLoc4'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Test Location: Center, MidRadius, Outer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Swage_Log', @level2type=N'COLUMN',@level2name=N'tLoc4'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Swage_Log', N'COLUMN',N'tLoc5'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Test Location: Center, MidRadius, Outer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Swage_Log', @level2type=N'COLUMN',@level2name=N'tLoc5'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Swage_Log', N'COLUMN',N'GFMp'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GFM Price' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Swage_Log', @level2type=N'COLUMN',@level2name=N'GFMp'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Swage_Log', N'COLUMN',N'Ovenp'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Oven Price' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Swage_Log', @level2type=N'COLUMN',@level2name=N'Ovenp'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Swage_Log', N'COLUMN',N'SrvcPO'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Conversion or Service HPA PO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Swage_Log', @level2type=N'COLUMN',@level2name=N'SrvcPO'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Swage_Log', N'COLUMN',N'SpaceX'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tested for SpaceX' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Swage_Log', @level2type=N'COLUMN',@level2name=N'SpaceX'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Swage_Log', N'COLUMN',N'ProjID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'From dbo.Stock_Projected' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Swage_Log', @level2type=N'COLUMN',@level2name=N'ProjID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Swage_Log', N'COLUMN',N'AC_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Related to dbo.AcctCosting.ID -presensce shows Accounting know to work on' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Swage_Log', @level2type=N'COLUMN',@level2name=N'AC_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Swage_Log', N'COLUMN',N'AC_cmplt'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Accounting Costing completed.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Swage_Log', @level2type=N'COLUMN',@level2name=N'AC_cmplt'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Swage_Log', N'COLUMN',N'R'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Report Quality' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Swage_Log', @level2type=N'COLUMN',@level2name=N'R'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Swage_Log_Detail', N'COLUMN',N'ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Swage_Log ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Swage_Log_Detail', @level2type=N'COLUMN',@level2name=N'ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Swage_Log_Detail', N'COLUMN',N'Label'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HT_Log, Testing PO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Swage_Log_Detail', @level2type=N'COLUMN',@level2name=N'Label'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Swage_Log_Detail', N'COLUMN',N'Data'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Log Number, PO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Swage_Log_Detail', @level2type=N'COLUMN',@level2name=N'Data'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Swage_Log_Detail', N'COLUMN',N'POitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'POitem' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Swage_Log_Detail', @level2type=N'COLUMN',@level2name=N'POitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Swage_Log_Detail', N'COLUMN',N'ID2'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identity' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Swage_Log_Detail', @level2type=N'COLUMN',@level2name=N'ID2'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'TC_Replacement_Employees', N'COLUMN',N'Status'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 = Not Employed, 1 = Full-Time, 2 = Part-Time, 3 = Temp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TC_Replacement_Employees', @level2type=N'COLUMN',@level2name=N'Status'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Testing_log', N'COLUMN',N'OvenTemp'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fahrenheit ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Testing_log', @level2type=N'COLUMN',@level2name=N'OvenTemp'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Testing_log', N'COLUMN',N'T_Oper'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Testing Machine Operator' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Testing_log', @level2type=N'COLUMN',@level2name=N'T_Oper'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Testing_log', N'COLUMN',N'AC_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Related to dbo.AcctCosting.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Testing_log', @level2type=N'COLUMN',@level2name=N'AC_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Testing_log', N'COLUMN',N'AC_cmplt'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Accounting Costing completed.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Testing_log', @level2type=N'COLUMN',@level2name=N'AC_cmplt'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ThermalCoupleUse', N'COLUMN',N'Log'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'G GFM, R Roll, E Erie' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ThermalCoupleUse', @level2type=N'COLUMN',@level2name=N'Log'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ThermalCoupleUse', N'COLUMN',N'LogID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID in GFMLog' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ThermalCoupleUse', @level2type=N'COLUMN',@level2name=N'LogID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ThermalCoupleUse', N'COLUMN',N'Lot'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lot in GFMLog' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ThermalCoupleUse', @level2type=N'COLUMN',@level2name=N'Lot'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ThermalCoupleUse', N'COLUMN',N'LotID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Which lot in GFMlog' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ThermalCoupleUse', @level2type=N'COLUMN',@level2name=N'LotID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'TimeTableMaster', N'CONSTRAINT',N'PK_TimeTableMaste_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TimeTableMaster', @level2type=N'CONSTRAINT',@level2name=N'PK_TimeTableMaste_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'UPSshiproute', N'COLUMN',N'shiproute'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'depricated use UPSStdShipRoute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPSshiproute', @level2type=N'COLUMN',@level2name=N'shiproute'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'UPSshiproute', N'COLUMN',N'upsstand'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'depricated- use dbo.UPSStdShipRoute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPSshiproute', @level2type=N'COLUMN',@level2name=N'upsstand'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'UPSTracking', N'COLUMN',N'ShipDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPSTracking', @level2type=N'COLUMN',@level2name=N'ShipDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'UserTrack', N'COLUMN',N'ServerName'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'@@SERVERNAME' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserTrack', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'UTlog', N'COLUMN',N'AC_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Related to dbo.AcctCosting.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UTlog', @level2type=N'COLUMN',@level2name=N'AC_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor', N'COLUMN',N'VendCode'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SQL Identity from 10000 up' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'COLUMN',@level2name=N'VendCode'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor', N'COLUMN',N'AddrPOB'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PO Box' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'COLUMN',@level2name=N'AddrPOB'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor', N'COLUMN',N'vendor_type'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Type of Vendor ''EXEC dbo.p_IND_Type 0''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'COLUMN',@level2name=N'vendor_type'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor', N'COLUMN',N'Vend_Notes'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Pop up when writting PO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'COLUMN',@level2name=N'Vend_Notes'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor', N'COLUMN',N'Vend_Print'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Print out on Purchase Order' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'COLUMN',@level2name=N'Vend_Print'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor', N'COLUMN',N'PeachID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'From PeachTree' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'COLUMN',@level2name=N'PeachID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor', N'COLUMN',N'QAApproved'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0=UnAppr 1=Appr 2=CondAppr ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'COLUMN',@level2name=N'QAApproved'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor', N'COLUMN',N'QASurveyContactID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ContactId from VendorContacts table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'COLUMN',@level2name=N'QASurveyContactID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor', N'COLUMN',N'QAType'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.f_Vendor_QAType_ ???  --QAType 20 is used by HPA App to tell if Vendor is used for Testing Service' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'COLUMN',@level2name=N'QAType'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor', N'COLUMN',N'Inactive'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Used by QA to state whether used in last year' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'COLUMN',@level2name=N'Inactive'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor', N'COLUMN',N'Metal'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'a Metals Vendor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'COLUMN',@level2name=N'Metal'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor', N'COLUMN',N'DRC_Free'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Congo Conflict Free Mineral' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'COLUMN',@level2name=N'DRC_Free'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor', N'COLUMN',N'DLA_BMS'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'DLA Bulk Metal Supplier' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'COLUMN',@level2name=N'DLA_BMS'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor', N'COLUMN',N'Contact'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depricated' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'COLUMN',@level2name=N'Contact'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor', N'COLUMN',N'telephone'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depricated' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'COLUMN',@level2name=N'telephone'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor', N'COLUMN',N'fax_number'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depricated' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'COLUMN',@level2name=N'fax_number'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor', N'COLUMN',N'email'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depricated' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'COLUMN',@level2name=N'email'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor', N'COLUMN',N'vend_type'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depricated' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'COLUMN',@level2name=N'vend_type'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor', N'COLUMN',N'custId'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depricated' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'COLUMN',@level2name=N'custId'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor', N'COLUMN',N'Vendor_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depricated' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'COLUMN',@level2name=N'Vendor_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice', N'COLUMN',N'Vendor_Invoice'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Invoice number of Accounting Program' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice', @level2type=N'COLUMN',@level2name=N'Vendor_Invoice'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice', N'COLUMN',N'InvoiceDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date Invoice was entered in table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice', @level2type=N'COLUMN',@level2name=N'InvoiceDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice_Detail', N'COLUMN',N'ID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Detail to Vendor_Invoice.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice_Detail', @level2type=N'COLUMN',@level2name=N'ID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice_Detail', N'COLUMN',N'Vendor_Invoice_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Vendor_Invoice.ID Master' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice_Detail', @level2type=N'COLUMN',@level2name=N'Vendor_Invoice_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice_Detail', N'COLUMN',N'Recv_Qty'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Invoice Received QTY to HPA Accounting standard' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice_Detail', @level2type=N'COLUMN',@level2name=N'Recv_Qty'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice_Detail', N'COLUMN',N'Recv_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Invoice Received Price to HPA Acct' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice_Detail', @level2type=N'COLUMN',@level2name=N'Recv_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice_Detail', N'COLUMN',N'Recv_PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PU to HPA Accounting standard 1=$/#, 2= $/FT, 3= $/PC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice_Detail', @level2type=N'COLUMN',@level2name=N'Recv_PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice_Detail', N'COLUMN',N'Recv_OtherP'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Invoice Other Price value' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice_Detail', @level2type=N'COLUMN',@level2name=N'Recv_OtherP'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice_Detail', N'COLUMN',N'Recv_Total'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Acct Total with Recv_QTY, without Other_P' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice_Detail', @level2type=N'COLUMN',@level2name=N'Recv_Total'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice_Detail', N'COLUMN',N'PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depricated. 2019-9 HPA 3.2.27' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice_Detail', @level2type=N'COLUMN',@level2name=N'PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice_Detail', N'COLUMN',N'Order_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'QTY as Ordered   -Vendor QTY' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice_Detail', @level2type=N'COLUMN',@level2name=N'Order_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice_Detail', N'COLUMN',N'Order_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Price as Ordered   -Vender Price' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice_Detail', @level2type=N'COLUMN',@level2name=N'Order_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice_Detail', N'COLUMN',N'Order_PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PU as Ordered. 1=$/#, 2= $/FT, 3= $/PC   -Vendor PU' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice_Detail', @level2type=N'COLUMN',@level2name=N'Order_PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice_Detail', N'COLUMN',N'Order_OtherP'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Other Price listed on POrder for Vendor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice_Detail', @level2type=N'COLUMN',@level2name=N'Order_OtherP'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice_Detail', N'COLUMN',N'OtherFld'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Description of OtherP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice_Detail', @level2type=N'COLUMN',@level2name=N'OtherFld'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice_Detail', N'COLUMN',N'ItemTotal'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Received QTY * Recv_P, not Order  -HPA Acct' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice_Detail', @level2type=N'COLUMN',@level2name=N'ItemTotal'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice_Detail', N'COLUMN',N'POitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'9-2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice_Detail', @level2type=N'COLUMN',@level2name=N'POitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice_Detail', N'COLUMN',N'Reconciled'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A partial invoice can be saved without reconcile.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice_Detail', @level2type=N'COLUMN',@level2name=N'Reconciled'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice_Detail', N'COLUMN',N'When'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date Inserted' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice_Detail', @level2type=N'COLUMN',@level2name=N'When'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice_POitem', N'COLUMN',N'VI_POi_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'POitem Detail to Vendor_Invoice.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice_POitem', @level2type=N'COLUMN',@level2name=N'VI_POi_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice_POitem', N'COLUMN',N'Vendor_Invoice_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Vendor_Invoice.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice_POitem', @level2type=N'COLUMN',@level2name=N'Vendor_Invoice_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice_POitem', N'COLUMN',N'POitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'9-2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice_POitem', @level2type=N'COLUMN',@level2name=N'POitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice_POitem', N'COLUMN',N'When'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date Inserted' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice_POitem', @level2type=N'COLUMN',@level2name=N'When'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice_Receive', N'COLUMN',N'VI_POi_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'related to Vendor_Invoice_POitem' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice_Receive', @level2type=N'COLUMN',@level2name=N'VI_POi_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice_Receive', N'COLUMN',N'Receiving_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Related to Receiving.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice_Receive', @level2type=N'COLUMN',@level2name=N'Receiving_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice_Receive', N'COLUMN',N'POitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'9-2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice_Receive', @level2type=N'COLUMN',@level2name=N'POitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice_Receive', N'COLUMN',N'S_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'StockLst Acct QTY' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice_Receive', @level2type=N'COLUMN',@level2name=N'S_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice_Receive', N'COLUMN',N'S_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'StockLst Acct P' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice_Receive', @level2type=N'COLUMN',@level2name=N'S_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice_Receive', N'COLUMN',N'S_PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'StockLst Acct PU' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice_Receive', @level2type=N'COLUMN',@level2name=N'S_PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice_Receive', N'COLUMN',N'S_Recv_Tot'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'StockLst Acct Total' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice_Receive', @level2type=N'COLUMN',@level2name=N'S_Recv_Tot'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice_Receive', N'COLUMN',N'INV_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'QTY as Ordered' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice_Receive', @level2type=N'COLUMN',@level2name=N'INV_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice_Receive', N'COLUMN',N'INV_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Price as Ordered' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice_Receive', @level2type=N'COLUMN',@level2name=N'INV_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice_Receive', N'COLUMN',N'INV_PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PU as Ordered. 1=$/#, 2= $/FT, 3= $/PC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice_Receive', @level2type=N'COLUMN',@level2name=N'INV_PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice_Receive', N'COLUMN',N'INV_OtherP'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Other Price listed on POrder' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice_Receive', @level2type=N'COLUMN',@level2name=N'INV_OtherP'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice_Receive', N'COLUMN',N'INV_OtherFld'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Description of OtherP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice_Receive', @level2type=N'COLUMN',@level2name=N'INV_OtherFld'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice_Receive', N'COLUMN',N'INV_Total'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Received QTY * P, not Ordered' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice_Receive', @level2type=N'COLUMN',@level2name=N'INV_Total'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice_Receive', N'COLUMN',N'INV_Reconciled'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A partial invoice can be saved without reconcile.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice_Receive', @level2type=N'COLUMN',@level2name=N'INV_Reconciled'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Vendor_Invoice_Receive', N'COLUMN',N'INV_When'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date Inserted' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor_Invoice_Receive', @level2type=N'COLUMN',@level2name=N'INV_When'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'VendorContact', N'COLUMN',N'VendCode'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'VendCode as from Vendor table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VendorContact', @level2type=N'COLUMN',@level2name=N'VendCode'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'VendorContact', N'COLUMN',N'Quality'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'used to identify a quality or sales contact' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VendorContact', @level2type=N'COLUMN',@level2name=N'Quality'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'VendorContact', N'COLUMN',N'lastSurveySent'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depricated' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VendorContact', @level2type=N'COLUMN',@level2name=N'lastSurveySent'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'VendorContact', N'COLUMN',N'lastSurveySentAttempt2'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depricated' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VendorContact', @level2type=N'COLUMN',@level2name=N'lastSurveySentAttempt2'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'VendorContact', N'COLUMN',N'lastSurveyReceived'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depricated' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VendorContact', @level2type=N'COLUMN',@level2name=N'lastSurveyReceived'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'VendorContact', N'COLUMN',N'Branch'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Specific brach of Vendor, only enter if Vendor Company is to be overwritten with branch.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VendorContact', @level2type=N'COLUMN',@level2name=N'Branch'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WaterJet', N'COLUMN',N'Inch20'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dollar per Inch' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WaterJet', @level2type=N'COLUMN',@level2name=N'Inch20'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WaterJet', N'COLUMN',N'Min20'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Minutes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WaterJet', @level2type=N'COLUMN',@level2name=N'Min20'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WaterJet', N'COLUMN',N'M20'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WaterJet', @level2type=N'COLUMN',@level2name=N'M20'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WaterJet', N'COLUMN',N'Inch40'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dollar per Inch' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WaterJet', @level2type=N'COLUMN',@level2name=N'Inch40'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WaterJet', N'COLUMN',N'Min40'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Minutes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WaterJet', @level2type=N'COLUMN',@level2name=N'Min40'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WaterJet', N'COLUMN',N'm40'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WaterJet', @level2type=N'COLUMN',@level2name=N'm40'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WaterJet', N'COLUMN',N'Inch60'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dollar per Inch' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WaterJet', @level2type=N'COLUMN',@level2name=N'Inch60'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WaterJet', N'COLUMN',N'Min60'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Minutes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WaterJet', @level2type=N'COLUMN',@level2name=N'Min60'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WaterJet', N'COLUMN',N'M60'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WaterJet', @level2type=N'COLUMN',@level2name=N'M60'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WaterJet', N'COLUMN',N'Inch80'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dollar per Inch' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WaterJet', @level2type=N'COLUMN',@level2name=N'Inch80'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WaterJet', N'COLUMN',N'Min80'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Minutes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WaterJet', @level2type=N'COLUMN',@level2name=N'Min80'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WaterJet', N'COLUMN',N'M80'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WaterJet', @level2type=N'COLUMN',@level2name=N'M80'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WaterJet', N'COLUMN',N'Inch100'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dollar per Inch' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WaterJet', @level2type=N'COLUMN',@level2name=N'Inch100'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WaterJet', N'COLUMN',N'Min100'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Inches per Minute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WaterJet', @level2type=N'COLUMN',@level2name=N'Min100'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WaterJet', N'COLUMN',N'm100'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Minutes per Inch' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WaterJet', @level2type=N'COLUMN',@level2name=N'm100'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Weight_Flanges', N'COLUMN',N'type'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'''Weld Neck,''Slip On'',''Blind''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Weight_Flanges', @level2type=N'COLUMN',@level2name=N'type'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Weight_Flanges', N'COLUMN',N'LB'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Flange Strength' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Weight_Flanges', @level2type=N'COLUMN',@level2name=N'LB'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Weight_Flanges', N'COLUMN',N'lbs'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Multiply by Alloy Density to get Weight' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Weight_Flanges', @level2type=N'COLUMN',@level2name=N'lbs'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Detail', N'COLUMN',N'Size_H'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'High Tol' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Detail', @level2type=N'COLUMN',@level2name=N'Size_H'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Detail', N'COLUMN',N'Size_L'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Low Tol' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Detail', @level2type=N'COLUMN',@level2name=N'Size_L'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Detail', N'COLUMN',N'PC'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Pieces' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Detail', @level2type=N'COLUMN',@level2name=N'PC'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Detail', N'COLUMN',N'Dim1'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Thick/Dia' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Detail', @level2type=N'COLUMN',@level2name=N'Dim1'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Detail', N'COLUMN',N'Dim2'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Width/Length' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Detail', @level2type=N'COLUMN',@level2name=N'Dim2'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Detail', N'COLUMN',N'Dim3'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Length' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Detail', @level2type=N'COLUMN',@level2name=N'Dim3'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Detail', N'COLUMN',N'Length'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depricated  Old Length' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Detail', @level2type=N'COLUMN',@level2name=N'Length'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Detail', N'COLUMN',N'Weight'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'moving to be Pounds, no matter what form' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Detail', @level2type=N'COLUMN',@level2name=N'Weight'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Detail', N'COLUMN',N'CostValue'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'current Price per unit  -depricated, use S_P' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Detail', @level2type=N'COLUMN',@level2name=N'CostValue'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Detail', N'COLUMN',N'Descript'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descript' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Detail', @level2type=N'COLUMN',@level2name=N'Descript'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Detail', N'COLUMN',N'Location'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Where to find stock WIPLst_Location' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Detail', @level2type=N'COLUMN',@level2name=N'Location'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Detail', N'COLUMN',N'Unit'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'$/#, $/FT, $/PC   -depricated' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Detail', @level2type=N'COLUMN',@level2name=N'Unit'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Detail', N'COLUMN',N'RandLen'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Random Lenght' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Detail', @level2type=N'COLUMN',@level2name=N'RandLen'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Detail', N'COLUMN',N'InvCheck'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Last time detail was processed or cut or InvCheck' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Detail', @level2type=N'COLUMN',@level2name=N'InvCheck'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Detail', N'COLUMN',N'ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Master ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Detail', @level2type=N'COLUMN',@level2name=N'ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Detail', N'COLUMN',N'ID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Detail', @level2type=N'COLUMN',@level2name=N'ID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Detail', N'COLUMN',N'ReceivingID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Receiving.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Detail', @level2type=N'COLUMN',@level2name=N'ReceivingID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Detail', N'COLUMN',N'InvoiceValue'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Per Unit Paid or Invoiced.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Detail', @level2type=N'COLUMN',@level2name=N'InvoiceValue'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Detail', N'COLUMN',N'LiveCheck'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Live Stock Check is in process' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Detail', @level2type=N'COLUMN',@level2name=N'LiveCheck'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Detail', N'COLUMN',N'AccountingCheck'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Yearly Accounting Check- Reset to 0 before starting yearly check' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Detail', @level2type=N'COLUMN',@level2name=N'AccountingCheck'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Detail', N'COLUMN',N'S_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quantity by form' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Detail', @level2type=N'COLUMN',@level2name=N'S_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Detail', N'COLUMN',N'S_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Current Price per Quantity' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Detail', @level2type=N'COLUMN',@level2name=N'S_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Detail', N'COLUMN',N'S_Total'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Current Cost Total' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Detail', @level2type=N'COLUMN',@level2name=N'S_Total'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Detail', N'COLUMN',N'S_PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=$/#, 2= $/FT, 3= $/PC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Detail', @level2type=N'COLUMN',@level2name=N'S_PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Detail', N'COLUMN',N'Prime'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Prime Stock Size' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Detail', @level2type=N'COLUMN',@level2name=N'Prime'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Detail', N'COLUMN',N'sStockLst_ID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The StockLst.ID_Detail it started as' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Detail', @level2type=N'COLUMN',@level2name=N'sStockLst_ID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Detail', N'COLUMN',N'fStockLst_ID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The StockLst.ID_Detail it finished as' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Detail', @level2type=N'COLUMN',@level2name=N'fStockLst_ID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Detail_Inserted', N'COLUMN',N'ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Not related to any other table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Detail_Inserted', @level2type=N'COLUMN',@level2name=N'ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Detail_Inserted', N'COLUMN',N'Master_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'related to WIPLst_Master.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Detail_Inserted', @level2type=N'COLUMN',@level2name=N'Master_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Detail_Inserted', N'COLUMN',N'ID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the new WIPLst_Detail ID_Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Detail_Inserted', @level2type=N'COLUMN',@level2name=N'ID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Detail_Inserted', N'COLUMN',N'Who'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'User who created the insert' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Detail_Inserted', @level2type=N'COLUMN',@level2name=N'Who'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Detail_Inserted', N'COLUMN',N'When'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When this Detail was INSERTed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Detail_Inserted', @level2type=N'COLUMN',@level2name=N'When'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Detail_Inserted', N'COLUMN',N'OrderType'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SOitem, POitem, WO, WODetail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Detail_Inserted', @level2type=N'COLUMN',@level2name=N'OrderType'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Detail_Inserted', N'COLUMN',N'OrderNum'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'String is needed for SO or PO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Detail_Inserted', @level2type=N'COLUMN',@level2name=N'OrderNum'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Detail_Inserted', N'COLUMN',N'Verified'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Insert has been verified' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Detail_Inserted', @level2type=N'COLUMN',@level2name=N'Verified'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Detail_Inserted', N'COLUMN',N'VerifiedBy'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Who verified this Insert' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Detail_Inserted', @level2type=N'COLUMN',@level2name=N'VerifiedBy'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_M_Ext', N'COLUMN',N'WIP_M_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Must match WIPLst_Master ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_M_Ext', @level2type=N'COLUMN',@level2name=N'WIP_M_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Master', N'COLUMN',N'Alloy'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standard Alloy Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Master', @level2type=N'COLUMN',@level2name=N'Alloy'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Master', N'COLUMN',N'Form'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'2 digit form code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Master', @level2type=N'COLUMN',@level2name=N'Form'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Master', N'COLUMN',N'CC'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Condition Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Master', @level2type=N'COLUMN',@level2name=N'CC'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Master', N'COLUMN',N'CL'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Condition Level' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Master', @level2type=N'COLUMN',@level2name=N'CL'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Master', N'COLUMN',N'Size'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'3 decimal size standard' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Master', @level2type=N'COLUMN',@level2name=N'Size'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Master', N'COLUMN',N'Cond'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Full Condition' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Master', @level2type=N'COLUMN',@level2name=N'Cond'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Master', N'COLUMN',N'MWeight'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Master weight bucket, SP calcs details' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Master', @level2type=N'COLUMN',@level2name=N'MWeight'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Master', N'COLUMN',N'Specs'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Specifications' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Master', @level2type=N'COLUMN',@level2name=N'Specs'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Master', N'COLUMN',N'Heat'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Heat' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Master', @level2type=N'COLUMN',@level2name=N'Heat'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Master', N'COLUMN',N'Lot'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'heat lot' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Master', @level2type=N'COLUMN',@level2name=N'Lot'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Master', N'COLUMN',N'Paid'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Price paid in per Unit' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Master', @level2type=N'COLUMN',@level2name=N'Paid'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Master', N'COLUMN',N'PO_item'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PO item 9-2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Master', @level2type=N'COLUMN',@level2name=N'PO_item'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Master', N'COLUMN',N'PoDueDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When PO says due, empty for received' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Master', @level2type=N'COLUMN',@level2name=N'PoDueDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Master', N'COLUMN',N'Mill'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mill producer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Master', @level2type=N'COLUMN',@level2name=N'Mill'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Master', N'COLUMN',N'StkDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date entered with receiving program.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Master', @level2type=N'COLUMN',@level2name=N'StkDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Master', N'COLUMN',N'History'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'OLD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Master', @level2type=N'COLUMN',@level2name=N'History'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Master', N'COLUMN',N'Num'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'OLD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Master', @level2type=N'COLUMN',@level2name=N'Num'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Master', N'COLUMN',N'POStatus'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Due in, Partial receive, Waiting for bill, Accounted' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Master', @level2type=N'COLUMN',@level2name=N'POStatus'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Master', N'COLUMN',N'FROM_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Where this ID came from' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Master', @level2type=N'COLUMN',@level2name=N'FROM_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Master', N'COLUMN',N'Melt'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'AOD, ESR, VIM, VIM VAR,-' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Master', @level2type=N'COLUMN',@level2name=N'Melt'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Master', N'COLUMN',N'ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Master', @level2type=N'COLUMN',@level2name=N'ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Master', N'COLUMN',N'mS_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Master QTY' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Master', @level2type=N'COLUMN',@level2name=N'mS_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Master', N'COLUMN',N'ProjID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.Stock_Projected.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Master', @level2type=N'COLUMN',@level2name=N'ProjID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Master', N'COLUMN',N'MillTrace'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Full mill Tracabilty.  Cert is not marked as Exact Mill Duplicate.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Master', @level2type=N'COLUMN',@level2name=N'MillTrace'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Master', N'COLUMN',N'DescriptID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'DescriptID or ProductID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Master', @level2type=N'COLUMN',@level2name=N'DescriptID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Master_Inserted', N'COLUMN',N'ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Not related to any other table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Master_Inserted', @level2type=N'COLUMN',@level2name=N'ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Master_Inserted', N'COLUMN',N'Master_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'new ID of WIPLst_Master' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Master_Inserted', @level2type=N'COLUMN',@level2name=N'Master_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Master_Inserted', N'COLUMN',N'Who'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'User who created the insert' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Master_Inserted', @level2type=N'COLUMN',@level2name=N'Who'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Master_Inserted', N'COLUMN',N'When'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When this Insert happened' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Master_Inserted', @level2type=N'COLUMN',@level2name=N'When'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Master_Inserted', N'COLUMN',N'Verified'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Has this insert been verified' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Master_Inserted', @level2type=N'COLUMN',@level2name=N'Verified'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Master_Inserted', N'COLUMN',N'VerifiedBy'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Who Verified this Insert' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Master_Inserted', @level2type=N'COLUMN',@level2name=N'VerifiedBy'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process', N'COLUMN',N'SOitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SO item 7-2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process', @level2type=N'COLUMN',@level2name=N'SOitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process', N'COLUMN',N'PO_item'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PO item 9-2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process', @level2type=N'COLUMN',@level2name=N'PO_item'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process', N'COLUMN',N'Process_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CANCELLED,CORRECTION,INCOMING,PARTSELECT ,RECEIVED,SELECTED,NOT2HPA,Sell Stock,Shipped,SUBED,Receiving,PARTRECV' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process', @level2type=N'COLUMN',@level2name=N'Process_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process', N'COLUMN',N'Processor'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Person' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process', @level2type=N'COLUMN',@level2name=N'Processor'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process', N'COLUMN',N'AllowSub'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Y  or N' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process', @level2type=N'COLUMN',@level2name=N'AllowSub'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process', N'COLUMN',N'PWeight'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Process Weight - Depricate, use QTY or Pounds' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process', @level2type=N'COLUMN',@level2name=N'PWeight'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process', N'COLUMN',N'PPc'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Process Pieces' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process', @level2type=N'COLUMN',@level2name=N'PPc'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process', N'COLUMN',N'PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct, PriceUnit 1=$/#, 2= $/FT, 3= $/PC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process', @level2type=N'COLUMN',@level2name=N'PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process', N'COLUMN',N'QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct,Use to hold QTY needed for process.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process', @level2type=N'COLUMN',@level2name=N'QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process', N'COLUMN',N'Ordered_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct, Use to hold Total QTY needed Order.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process', @level2type=N'COLUMN',@level2name=N'Ordered_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process', N'COLUMN',N'Ordered_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Price when ordered' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process', @level2type=N'COLUMN',@level2name=N'Ordered_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process', N'COLUMN',N'Pounds'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Prc_LBS, SO Pounds should always be Lbs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process', @level2type=N'COLUMN',@level2name=N'Pounds'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process', N'COLUMN',N'ID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relate to Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process', @level2type=N'COLUMN',@level2name=N'ID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process', N'COLUMN',N'InqNumP'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'8 digit Quote then SP init' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process', @level2type=N'COLUMN',@level2name=N'InqNumP'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process', N'COLUMN',N'Prc_Form'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SO Form,This can be different from Stock Form' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process', @level2type=N'COLUMN',@level2name=N'Prc_Form'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process', N'COLUMN',N'Prc_PCs'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Number of Pieces this Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process', @level2type=N'COLUMN',@level2name=N'Prc_PCs'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process', N'COLUMN',N'Prc_Dim1'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dim1 this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process', @level2type=N'COLUMN',@level2name=N'Prc_Dim1'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process', N'COLUMN',N'Prc_Dim2'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dim2 this Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process', @level2type=N'COLUMN',@level2name=N'Prc_Dim2'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process', N'COLUMN',N'Prc_Dim3'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dim3 this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process', @level2type=N'COLUMN',@level2name=N'Prc_Dim3'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process', N'COLUMN',N'Prc_Q_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer Quoted Qty Total -not Acct Stnd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process', @level2type=N'COLUMN',@level2name=N'Prc_Q_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process', N'COLUMN',N'Prc_Q_PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer Quoted PU' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process', @level2type=N'COLUMN',@level2name=N'Prc_Q_PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process', N'COLUMN',N'FoundStk'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When the Shop marks Found on INCOMING process  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process', @level2type=N'COLUMN',@level2name=N'FoundStk'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Detail', N'COLUMN',N'Who'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Login name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Detail', @level2type=N'COLUMN',@level2name=N'Who'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Detail', N'COLUMN',N'When'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'System Date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Detail', @level2type=N'COLUMN',@level2name=N'When'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Detail', N'COLUMN',N'ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'StockLst ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Detail', @level2type=N'COLUMN',@level2name=N'ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Detail', N'COLUMN',N'ID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID_Detail is filled in from p_WIPLst_Detail_ins' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Detail', @level2type=N'COLUMN',@level2name=N'ID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Grab', N'COLUMN',N'SOitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SO item 7-2; used as SELECTED' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'SOitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Grab', N'COLUMN',N'PO_item'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PO item 9-2; Used as INCOMING' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'PO_item'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Grab', N'COLUMN',N'SalesPerson'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sales Rep of SO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'SalesPerson'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Grab', N'COLUMN',N'StartDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Initial date stamp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'StartDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Grab', N'COLUMN',N'Process_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'see dbo.WIPLst_Process_ID_def  CANCELLED,CORRECTION,INCOMING,PARTSELECT ,RECEIVED,SELECTED,NOT2HPA,Sell Stock,Shipped,SUBED,Receiving,PARTRECV,IN_Process,
Quoted' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'Process_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Grab', N'COLUMN',N'Processor'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Person adding Process' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'Processor'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Grab', N'COLUMN',N'AllowSub'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Y  or N' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'AllowSub'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Grab', N'COLUMN',N'PWeight'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Process Weight - Depricate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'PWeight'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Grab', N'COLUMN',N'PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct, PriceUnit 1=$/#, 2= $/FT, 3= $/PC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Grab', N'COLUMN',N'QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'QTY needed from ID_Detail. HPA Acct Stnadard. Think as Prc_QTY' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Grab', N'COLUMN',N'Ordered_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HPA Acct, Use to hold Total QTY needed Order, for historical reference' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'Ordered_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Grab', N'COLUMN',N'Ordered_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Price when ordered, for historical reference' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'Ordered_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Grab', N'COLUMN',N'Pounds'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'LBS needed from ID_Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'Pounds'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Grab', N'COLUMN',N'ID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relate to Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'ID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Grab', N'COLUMN',N'ReceivingID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relates back to dbo.Receiving before the INCOMING process is removed.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'ReceivingID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Grab', N'COLUMN',N'WO'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'WO can SELECT Stock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'WO'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Grab', N'COLUMN',N'WO_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'WO_Detail can list as INCOMING' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'WO_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Grab', N'COLUMN',N'InqNumP'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'8 digit Quote then SP init, Used for Process_ID QUOTED' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'InqNumP'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Grab', N'COLUMN',N'Prc_Form'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ordered Form, This can be different from Stock Form' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'Prc_Form'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Grab', N'COLUMN',N'Prc_PCs'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Number of Pieces this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'Prc_PCs'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Grab', N'COLUMN',N'Prc_Dim1'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dim1 this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'Prc_Dim1'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Grab', N'COLUMN',N'Prc_Dim2'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dim2 this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'Prc_Dim2'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Grab', N'COLUMN',N'Prc_Dim3'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dim3 this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'Prc_Dim3'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Grab', N'COLUMN',N'FoundStk'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When the Shop marks Found on INCOMING process  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'FoundStk'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Grab', N'COLUMN',N'MS4O'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Modify Stock 4 Order complete' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Grab', @level2type=N'COLUMN',@level2name=N'MS4O'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Orig', N'COLUMN',N'Process_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SELECTED, INCOMING, RECEIVED, Shipped, CORRECTION, SUBED' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Orig', @level2type=N'COLUMN',@level2name=N'Process_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Orig', N'COLUMN',N'Processor'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Person' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Orig', @level2type=N'COLUMN',@level2name=N'Processor'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Orig', N'COLUMN',N'AllowSub'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Y or N' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Orig', @level2type=N'COLUMN',@level2name=N'AllowSub'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Orig', N'COLUMN',N'PPc'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Process Pieces' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Orig', @level2type=N'COLUMN',@level2name=N'PPc'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Orig', N'COLUMN',N'PFT'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Process Feet' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Orig', @level2type=N'COLUMN',@level2name=N'PFT'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Orig', N'COLUMN',N'PU'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PriceUnit 1=$/#, 2= $/FT, 3= $/PC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Orig', @level2type=N'COLUMN',@level2name=N'PU'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Orig', N'COLUMN',N'Pounds'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Pounds' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Orig', @level2type=N'COLUMN',@level2name=N'Pounds'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Orig', N'COLUMN',N'ID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relate to Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Orig', @level2type=N'COLUMN',@level2name=N'ID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Recvd', N'COLUMN',N'PO_item'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PO item 9-2; Used as INCOMING' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'PO_item'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Recvd', N'COLUMN',N'SalesPerson'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sales Rep of SO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'SalesPerson'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Recvd', N'COLUMN',N'StartDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Initial date stamp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'StartDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Recvd', N'COLUMN',N'RecvDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When triggered as Received in WIPLst_Process' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'RecvDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Recvd', N'COLUMN',N'Process_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RECEIVED' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'Process_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Recvd', N'COLUMN',N'Processor'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Person adding Process' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'Processor'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Recvd', N'COLUMN',N'Ordered_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Price when ordered, for historical reference' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'Ordered_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Recvd', N'COLUMN',N'Pounds'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'LBS needed from ID_Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'Pounds'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Recvd', N'COLUMN',N'ID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relate to Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'ID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Recvd', N'COLUMN',N'ReceivingID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relates back to dbo.Receiving before the INCOMING process is removed.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'ReceivingID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Recvd', N'COLUMN',N'WO_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'WO_Detail can list as INCOMING' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'WO_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Recvd', N'COLUMN',N'Prc_Form'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ordered Form, This can be different from Stock Form' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'Prc_Form'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Recvd', N'COLUMN',N'Prc_PCs'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Number of Pieces this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'Prc_PCs'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Recvd', N'COLUMN',N'Prc_Dim1'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dim1 this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'Prc_Dim1'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Recvd', N'COLUMN',N'Prc_Dim2'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dim2 this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'Prc_Dim2'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WIPLst_Process_Recvd', N'COLUMN',N'Prc_Dim3'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dim3 this SO Process uses' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WIPLst_Process_Recvd', @level2type=N'COLUMN',@level2name=N'Prc_Dim3'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Wire_Dies', N'COLUMN',N'Dia'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The first NoGo reading of die diameter' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Wire_Dies', @level2type=N'COLUMN',@level2name=N'Dia'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Wire_Dies', N'COLUMN',N'Angle'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Die Angle' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Wire_Dies', @level2type=N'COLUMN',@level2name=N'Angle'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Wire_Dies', N'COLUMN',N'NIB'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Carbide NIB designating' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Wire_Dies', @level2type=N'COLUMN',@level2name=N'NIB'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Wire_Dies', N'COLUMN',N'CaseDia'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Outside Diameter of Die Case' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Wire_Dies', @level2type=N'COLUMN',@level2name=N'CaseDia'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Wire_Dies', N'COLUMN',N'Height'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Length of Die case, called Height by industry' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Wire_Dies', @level2type=N'COLUMN',@level2name=N'Height'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Wire_log', N'COLUMN',N'PO'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer PO_Num' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Wire_log', @level2type=N'COLUMN',@level2name=N'PO'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Wire_log', N'COLUMN',N'OvenTemp'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fahrenheit ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Wire_log', @level2type=N'COLUMN',@level2name=N'OvenTemp'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Wire_log', N'COLUMN',N'SrvcPO'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Conversion or Service HPA PO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Wire_log', @level2type=N'COLUMN',@level2name=N'SrvcPO'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Wire_log', N'COLUMN',N'Sched'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.Draw_Sched.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Wire_log', @level2type=N'COLUMN',@level2name=N'Sched'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Wire_log', N'COLUMN',N'AC_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Related to dbo.AcctCosting.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Wire_log', @level2type=N'COLUMN',@level2name=N'AC_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Wire_log', N'COLUMN',N'AC_cmplt'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Accounting Costing completed.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Wire_log', @level2type=N'COLUMN',@level2name=N'AC_cmplt'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Wire_log', N'COLUMN',N'R'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Report Quality' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Wire_log', @level2type=N'COLUMN',@level2name=N'R'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Wire_log', N'INDEX',N'IX_Wire_log_Lot'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lot number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Wire_log', @level2type=N'INDEX',@level2name=N'IX_Wire_log_Lot'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WireTransfers', N'COLUMN',N'When'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'System Date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WireTransfers', @level2type=N'COLUMN',@level2name=N'When'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WireTransfers', N'COLUMN',N'Who'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Login Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WireTransfers', @level2type=N'COLUMN',@level2name=N'Who'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WO_OutSource', N'COLUMN',N'WO'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'WorkOrder' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WO_OutSource', @level2type=N'COLUMN',@level2name=N'WO'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WO_OutSource', N'COLUMN',N'Stock_ID_D'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID_Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WO_OutSource', @level2type=N'COLUMN',@level2name=N'Stock_ID_D'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WO_OutSource', N'COLUMN',N'Stock_ID_D_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Process' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WO_OutSource', @level2type=N'COLUMN',@level2name=N'Stock_ID_D_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WO_OutSource', N'COLUMN',N'Sales_Detail_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.Sales_Detail ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WO_OutSource', @level2type=N'COLUMN',@level2name=N'Sales_Detail_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WO_OutSource', N'COLUMN',N'Sales_Stock_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.Sales_Stock ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WO_OutSource', @level2type=N'COLUMN',@level2name=N'Sales_Stock_ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WOD_Orders', N'INDEX',N'IX_WOD_Orders_SOitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SOitem' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WOD_Orders', @level2type=N'INDEX',@level2name=N'IX_WOD_Orders_SOitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WOD_Orders', N'INDEX',N'IX_WOD_Orders_WO_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'WO_Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WOD_Orders', @level2type=N'INDEX',@level2name=N'IX_WOD_Orders_WO_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder', N'COLUMN',N'EnterDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When First Saved' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder', @level2type=N'COLUMN',@level2name=N'EnterDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder', N'COLUMN',N'SalesRep'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'''Could use (left(replace(suser_sname(),''''WINDFALL\'''',''''),(20)))''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder', @level2type=N'COLUMN',@level2name=N'SalesRep'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder', N'COLUMN',N'StartDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When Stock was removed from StockLst' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder', @level2type=N'COLUMN',@level2name=N'StartDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder', N'COLUMN',N'FinishDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When Stock was finished or returned to StockLst' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder', @level2type=N'COLUMN',@level2name=N'FinishDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder', N'COLUMN',N'Descript'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder', @level2type=N'COLUMN',@level2name=N'Descript'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder', N'COLUMN',N'SOitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SO item if used' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder', @level2type=N'COLUMN',@level2name=N'SOitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder', N'COLUMN',N'POitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PO item if used' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder', @level2type=N'COLUMN',@level2name=N'POitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder', N'COLUMN',N'sWeight'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'use as HPA Acct QTY' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder', @level2type=N'COLUMN',@level2name=N'sWeight'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder', N'COLUMN',N'pinSWeight'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Pin the current Weight so Dim changes does not change weight' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder', @level2type=N'COLUMN',@level2name=N'pinSWeight'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder', N'COLUMN',N'TBL'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'''S'' StockLst or ''B'' BrokerLst' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder', @level2type=N'COLUMN',@level2name=N'TBL'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder', N'COLUMN',N'sID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'One ID_Detail to start with' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder', @level2type=N'COLUMN',@level2name=N'sID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder', N'COLUMN',N'sID_Detail_Process'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Process that removed Stock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder', @level2type=N'COLUMN',@level2name=N'sID_Detail_Process'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder', N'COLUMN',N'sReceivingID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tie in the Receiving Record' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder', @level2type=N'COLUMN',@level2name=N'sReceivingID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder', N'COLUMN',N'IntP'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Internal Production, use RE instead' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder', @level2type=N'COLUMN',@level2name=N'IntP'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder', N'COLUMN',N'RE'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Research and Experimental for Taxes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder', @level2type=N'COLUMN',@level2name=N'RE'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder', N'COLUMN',N'Cncld'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cancelled' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder', @level2type=N'COLUMN',@level2name=N'Cncld'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder', N'COLUMN',N'Cmplt'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Complete' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder', @level2type=N'COLUMN',@level2name=N'Cmplt'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder', N'COLUMN',N'lPrc_Stock'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Starting Stock has been Selected' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder', @level2type=N'COLUMN',@level2name=N'lPrc_Stock'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder', N'COLUMN',N'ItemCost'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Like StkCost, Inserted from Modify StockLst Detail as Consumed.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder', @level2type=N'COLUMN',@level2name=N'ItemCost'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder', N'COLUMN',N'StkConsumed'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Selected stock has been take off stockLst.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder', @level2type=N'COLUMN',@level2name=N'StkConsumed'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder', N'COLUMN',N'Changing'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'WO is Changing' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder', @level2type=N'COLUMN',@level2name=N'Changing'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder', N'COLUMN',N'ShopRecv'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'WO Print Received by Shop.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder', @level2type=N'COLUMN',@level2name=N'ShopRecv'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder', N'COLUMN',N'RcvdE'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'True if ''Hey, good news''  Email has been sent.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder', @level2type=N'COLUMN',@level2name=N'RcvdE'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder', N'COLUMN',N'PrintedWO'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Latest Amendment has been Printed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder', @level2type=N'COLUMN',@level2name=N'PrintedWO'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder', N'COLUMN',N'OutSource'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Needs OutSourced Work' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder', @level2type=N'COLUMN',@level2name=N'OutSource'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder', N'COLUMN',N'MO'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Vendors internal Material Order Number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder', @level2type=N'COLUMN',@level2name=N'MO'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder', N'COLUMN',N'sReconciled'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Acctoing has reconciled' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder', @level2type=N'COLUMN',@level2name=N'sReconciled'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder', N'COLUMN',N'sHeat'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Starting Heat' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder', @level2type=N'COLUMN',@level2name=N'sHeat'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'WO_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Related to WO, WO_Detail is individual ID column' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'WO_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'fStartDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When Stock was removed from StockLst' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'fStartDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'fFinishDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When WO_Detail was finished or returned to StockLst by Receiving department' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'fFinishDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'fDescript'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'fDescript'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'fInqNumP'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'link to AllQuotes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'fInqNumP'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'fSOitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'top 1 SO item if used to create the WO_Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'fSOitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'fPOitem'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'top 1 PO item ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'fPOitem'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'fAlloy'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Alloy' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'fAlloy'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'fForm'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Form' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'fForm'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'fCC'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Condition Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'fCC'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'fCL'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Condition Level' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'fCL'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'fWeight'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Finished Weight to Sell, HPA Acct QTY' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'fWeight'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'pinFWeight'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Pin the current Weight so Dim changes does not change weight' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'pinFWeight'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'TotFinishW'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'What material is left for sale.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'TotFinishW'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'LostWeight'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'How much weight was lost in Forging, Grinding and Testing.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'LostWeight'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'fTBL'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'StockLst or BrokerLst' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'fTBL'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'fID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID_Detail of new Stock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'fID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'fID_Detail_Process'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Process that Added Stock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'fID_Detail_Process'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'fReceivingID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Finished stock Receiiving ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'fReceivingID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'fCmplt'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'WO_Detail is Complete' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'fCmplt'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'fIntP'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Internal Production' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'fIntP'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'fNotes'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Finish Notes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'fNotes'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'fCondLevel'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Finish Condition Level' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'fCondLevel'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'fCncld'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Detail is Cancelled' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'fCncld'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'fPrint'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Detail has been printed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'fPrint'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'fPRecv'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Detail print has been received by Shop' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'fPRecv'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'fMod'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Detail is being Edited after a print. Changing' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'fMod'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'fRev'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Detail Version ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'fRev'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'FollowM'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SELECT ANS,UN FROM dbo.AppSetup WITH(NOLOCK) WHERE PRP = ''Production Machine''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'FollowM'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'FinishM'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SELECT ANS,UN FROM dbo.AppSetup WITH(NOLOCK) WHERE PRP = ''Production Machine''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'FinishM'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'CW'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Percent Cold Worked' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'CW'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'OverSize'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'OverSize = RoughSize - fThck' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'OverSize'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'FSpec'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'From dbo.ConditionLever.Spec by SpecCC and SpecCL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'FSpec'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'TestPO'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Test PO Item' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'TestPO'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'PassTest'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Passed ProjID Testing' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'PassTest'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'RcvdE'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'True if ''Hey, good news''  Email has been sent.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'RcvdE'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'fReconciled'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Accounting has Reconciled' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'fReconciled'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'fHeat'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Finishing Heat' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'fHeat'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'NextCode'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'What happens after this WO_Detail: WO,WOD,SOi,STK (ID_Detail)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'NextCode'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Detail', N'COLUMN',N'NextNumber'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'as text. Would be INT but SOitem requires char(10)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Detail', @level2type=N'COLUMN',@level2name=N'NextNumber'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Stock', N'COLUMN',N'TBL'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'depricated' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Stock', @level2type=N'COLUMN',@level2name=N'TBL'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Stock', N'COLUMN',N'sTBL'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Start Table initial, S,B,W' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Stock', @level2type=N'COLUMN',@level2name=N'sTBL'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Stock', N'COLUMN',N'sID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID_Detail number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Stock', @level2type=N'COLUMN',@level2name=N'sID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Stock', N'COLUMN',N'sID_Detail_Process'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Process number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Stock', @level2type=N'COLUMN',@level2name=N'sID_Detail_Process'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WorkOrder_Stock', N'COLUMN',N'S_Total'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'S_QTY * S_P = S_Total' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder_Stock', @level2type=N'COLUMN',@level2name=N'S_Total'
GO



USE [master];
GO

IF DB_ID(N'AuditDB') IS NULL
BEGIN
    PRINT 'Creating AuditDB';
    CREATE DATABASE [AuditDB];
END
ELSE
BEGIN
    PRINT 'AuditDB already exists';
END
GO

USE [AuditDB];
GO

IF OBJECT_ID(N'dbo.ErrorLog', N'U') IS NULL
BEGIN
    PRINT 'Creating AuditDB.dbo.ErrorLog';
    CREATE TABLE dbo.ErrorLog
    (
        EventID bigint IDENTITY(1,1) NOT NULL
            CONSTRAINT PK_ErrorLog PRIMARY KEY CLUSTERED,
        ErrorNumber int NULL,
        ErrorSeverity int NULL,
        ErrorState int NULL,
        ErrorProcedure nvarchar(128) NULL,
        ErrorLine int NULL,
        ErrorMessage varchar(max) NULL,
        EventDate smalldatetime NOT NULL
            CONSTRAINT DF_ErrorLog_EventDate DEFAULT (GETDATE())
    );
END
ELSE
BEGIN
    PRINT 'AuditDB.dbo.ErrorLog already exists';
END
GO




GO
USE [master]
GO
ALTER DATABASE [ERP_2] SET  READ_WRITE 
GO
PRINT '[ERP_2] Ready'
