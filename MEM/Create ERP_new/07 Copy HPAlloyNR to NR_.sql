-- 07 Copy HPAlloyNR to NR_
USE [ERP_1]

INSERT INTO [dbo].[NR_AreaCodes]
SELECT * FROM [HPAlloyNR].[dbo].[NR_AreaCodes]
GO

INSERT INTO [dbo].[NR_Country Data]
SELECT  [Fips]
      ,[Iso2]
      ,[Iso3]
      ,[Un]
      ,[Name]
      ,[Area]
      ,[Pop2005]
      ,[Region]
      ,[Subregion]
      ,[Lon]
      ,[Lat]
      ,[DO NOT SELL] FROM [HPAlloyNR].[dbo].[NR_Country Data]

INSERT INTO [dbo].[NR_CountryCodes]
SELECT * FROM [HPAlloyNR].[dbo].[NR_CountryCodes]
GO

INSERT INTO [dbo].[NR_DateLookup]
SELECT * FROM [HPAlloyNR].[dbo].[NR_DateLookup]

INSERT INTO [dbo].[NR_DimGeography]
SELECT * FROM [HPAlloyNR].[dbo].[NR_DimGeography]

INSERT INTO [dbo].[NR_HPA_Holidays]
SELECT * FROM [HPAlloyNR].[dbo].[NR_HPA_Holidays]

INSERT INTO [dbo].[NR_OT_Job]
SELECT * FROM [HPAlloyNR].[dbo].[NR_OT_Job]

INSERT INTO [dbo].[NR_OT_OrderType]
SELECT * FROM [HPAlloyNR].[dbo].[NR_OT_OrderType]

INSERT INTO [dbo].[NR_PurchaseOrder_Company]
SELECT * FROM [HPAlloyNR].[dbo].[NR_PurchaseOrder_Company]

--INSERT INTO [dbo].[NR_Sales_Summary] SELECT * FROM [HPAlloyNR].[dbo].[NR_Sales_Summary]
--INSERT INTO [dbo].[NR_Sales_YrSum_10Yr] SELECT * FROM [HPAlloyNR].[dbo].[NR_Sales_YrSum_10Yr]

INSERT INTO [dbo].[NR_SalesDistrictStates]
SELECT * FROM [HPAlloyNR].[dbo].[NR_SalesDistrictStates]

INSERT INTO [dbo].[NR_States]
SELECT * FROM [HPAlloyNR].[dbo].[NR_States]

INSERT INTO [dbo].[NR_TC_Replacement_Employees]
SELECT * FROM [HPAlloyNR].[dbo].[NR_TC_Replacement_Employees]

INSERT INTO [dbo].[NR_TimeClock_JobCode]
SELECT * FROM [HPAlloyNR].[dbo].[NR_TimeClock_JobCode]



