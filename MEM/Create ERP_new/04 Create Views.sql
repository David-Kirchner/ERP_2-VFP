--** 04 Create Views
USE [ERP_1]

IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vMFG_Log]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vMFG_Log]
AS
SELECT       ''Draw_Log'' AS TableName, AlloyName, Heat, Lot, [Date], sPiece, sSize, sLength, sWeight, DrawSize AS WorkSize, fPiece, fSize, fLength, Condition, ColdWork, SOitem, Spec, Notes, Tensile, Yield, Elongation, Red_Area, tLoc, Rockwell, BHN, Passed, WO,WO_Detail
FROM            dbo.Draw_log AS l
UNION
SELECT        ''GFMLog'' AS TableName,AlloyName, Heat, Lot, [Date], sPiece, sSize, sLength, sWeight, GfmSize AS WorkSize, fPiece, fSize, fLength, Condition, ColdWork, SOitem, Spec, Notes, Tensile, Yield, Elongation, Red_Area, tLoc, Rockwell, BHN, Passed, WO,WO_Detail
FROM            dbo.GFMlog AS l
UNION
SELECT        ''HT_Log'' AS TableName,AlloyName, Heat, Lot, [Date], sPiece, sSize, sLength, sWeight, RollSize AS WorkSize, sPiece AS fPiece, sSize AS fSize, sLength AS fLength, Condition, 0 AS ColdWork, SOitem, Spec, Notes, Tensile, Yield, Elongation, Red_Area, '''' AS tLoc, Rockwell, BHN, Passed, WO,WO_Detail
FROM            dbo.HT_log AS l
UNION
SELECT        ''LakeErie_Log'' AS TableName,AlloyName, Heat, Lot, [Date], sPiece, sSize, sLength, sWeight, RollSize AS WorkSize, fPiece, fSize, fLength, Condition, ColdWork, SOitem, Spec, Notes, Tensile, Yield, Elongation, Red_Area, '''' AS tLoc, Rockwell, BHN, 
                         Passed, WO,WO_Detail
FROM            dbo.LakeErie_log AS l
UNION
SELECT        ''Roll_Log'' AS TableName,AlloyName, Heat, Lot, [Date], sPiece, sSize, sLength, sWeight, RollSize AS WorkSize, fPiece, fSize, fLength, Condition, ColdWork, SOitem, Spec, Notes, Tensile, Yield, Elongation, Red_Area, '''' AS tLoc, Rockwell, BHN, 
                         Passed, WO,WO_Detail
FROM            dbo.Roll_Log AS l
UNION
SELECT        ''Swage_Log'' AS TableName,AlloyName, Heat, Lot, [Date], sPiece, sSize, sLength, sWeight, SwageSize AS WorkSize, fPiece, fSize, fLength, Condition, ColdWork, SOitem, Spec, Notes, Tensile, Yield, Elongation, Red_Area, '''' AS tLoc, Rockwell, BHN, 
                         Passed, WO,WO_Detail
FROM            dbo.Swage_Log AS l
UNION
SELECT        ''Wire_Log'' AS TableName,AlloyName, Heat, Lot, [Date], sPiece, sSize, 0 AS sLength, sWeight, DrawSize AS WorkSize, fPiece, fSize, 0 AS fLength, Condition, ColdWork, SOitem, Spec, Notes, Tensile, Yield, Elongation, Red_Area, '''' AS tLoc, Rockwell, 
                         BHN, Passed, WO,WO_Detail
FROM            dbo.Wire_log AS l
' 
GO
/****** Object:  View [dbo].[StockLst_LBS]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_LBS]'))
EXEC dbo.sp_executesql @statement = N'
/****** Object:  View dbo.StockLst_LBS    Script Date: 5/4/2006 1:28:33 PM ******/
CREATE  VIEW [dbo].[StockLst_LBS]
 
AS
SELECT     TOP 100 PERCENT m.alloy, m.form, m.cc, m.size, SUM(d.weight) AS LBS
FROM         dbo.stocklst_master AS m INNER JOIN
                      dbo.stocklst_detail AS d ON m.id = d.id
GROUP BY m.alloy, m.form, m.cc, m.size
ORDER BY m.alloy, m.form, m.cc, m.size

' 
GO
/****** Object:  View [dbo].[BI_Sales]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[BI_Sales]'))
EXEC dbo.sp_executesql @statement = N'/*ORDER BY S.SalesNum*/
CREATE VIEW [dbo].[BI_Sales]
AS
SELECT        TOP (100) PERCENT S.SOitem, S.SalesNum, S.Item, S.Inv, S.GFM, S.Roll, S.Press, S.Mach, S.CG, S.Plasma, S.WJet, S.ItemTot, S.ShipDue, S.Shipped, S.MatlWt, S.cncld, S.cmplt, S.ItemCost, S.ItemSale, S.StkCost, S.POCost, 
                         S.RMA_No, S.pOther, S.Other, S.ShipOn, S.ProcLoc, S.Quoted_QTY, S.Quoted_P, S.Quoted_Total, S.Quoted_PU, S.dShip, S.Typ, S.WO, S.StkPaid, S.WO_Detail, S.ProductionWO, S.Export, S.InqNumP, AQ.Alloy, AQ.Form, AQ.CC, 
                         AQ.CL, AQ.Thck, AQ.Pieces, AQ.Descript, AQ.SalesP, AQ.POitem, AQ.SaleDate, AQ.ShipDate, AQ.Services, AQ.Cover, AQ.Q_QTY, AQ.Q_Total, AQ.StandardSize, AQ.DescriptID, dbo.f_get_Year_Month(AQ.ShipDate) AS YearMn, 
                         dbo.f_get_Year_Qtr(AQ.ShipDate) AS YearQ, dbo.f_BestDate(S.Shipped, S.ShipDue) AS Ship_Date, CAST(ROUND(CASE WHEN ISNULL(Thck, 0) > 999 THEN 999 ELSE ISNULL(AQ.StandardSize, 0) END, 1) AS Numeric(4, 1)) 
                         AS StdSize, SN.ECPC, SN.DPAS, SN.FCI, SN.GOV, SN.pshipaddr, SN.CustID, SA.st, AQ.Company, SA.zip, SA.country, AQ.Email, SN.usa, SN.blind, S.Draw, S.ColdSaw, AQ.QuoteDate, AQ.S_QTY, AQ.S_Total, AQ.S_P, AQ.S_PU, 
                         dbo.f_CC_CLsort(AQ.CC, AQ.CL) AS NewCCCL, SN.salesrep, AQ.Q_P, AQ.Q_PU, CAST(AQ.SaleDate AS DATE) AS Sales_Date, dbo.f_StandardSize(AQ.Thck) AS StndSize, CASE WHEN AQ.Alloy = ''HPA N60'' AND (Form = ''10'' OR
                         Form = ''20'' OR
                         Form = ''21'' OR
                         Form = ''22'') AND (CC = ''7'' OR
                         CC = ''L'') THEN dbo.f_Calc_CW_Stand_sSize(AQ.Thck, .050, (CASE WHEN (AQ.CL = ''6'') THEN dbo.f_Calc_CW_Level(AQ.Thck + .050, 6) WHEN (AQ.CL = ''5'' OR
                         AQ.CL = ''E'') THEN dbo.f_Calc_CW_Level(AQ.Thck + .050, 5) WHEN (AQ.CL = ''4'' OR
                         AQ.CL = ''D'') THEN dbo.f_Calc_CW_Level(AQ.Thck + .050, 4) WHEN (AQ.CL = ''3'' OR
                         AQ.CL = ''C'') THEN dbo.f_Calc_CW_Level(AQ.Thck + .050, 3) WHEN (AQ.CL = ''2'' OR
                         AQ.CL = ''B'') THEN dbo.f_Calc_CW_Level(AQ.Thck + .050, 2) WHEN (AQ.CL = ''1'' OR
                         AQ.CL = ''A'') THEN dbo.f_Calc_CW_Level(AQ.Thck + .050, 1) ELSE .0 END)) ELSE 0 END AS CW_Start_Size,
                             (SELECT        Shape
                               FROM            dbo.Forms
                               WHERE        (AQ.Form = FormNumber)) AS Shape
FROM            dbo.Sales AS S WITH (NOLOCK) INNER JOIN
                         dbo.AllQuotes AS AQ WITH (NOLOCK) ON S.SOitem = AQ.SOitem INNER JOIN
                         dbo.Sales_No AS SN WITH (NOLOCK) ON S.SalesNum = SN.salesnum LEFT OUTER JOIN
                         dbo.ShipAddr AS SA ON SN.pshipaddr = SA.shipcode
WHERE        (ISNULL(S.cncld, 0) = 0) AND (YEAR(S.ShipDue) >= 2015)
' 
GO
/****** Object:  View [dbo].[BI_Sales_N60HS]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[BI_Sales_N60HS]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[BI_Sales_N60HS]
AS
SELECT        SOitem, SalesNum, Item, Inv, GFM, Roll, Press, Mach, CG, ItemTot, ShipDue, Shipped, MatlWt, cncld, cmplt, ItemCost, ItemSale, StkCost, POCost, RMA_No, pOther, Other, ShipOn, Quoted_QTY, Quoted_P, Quoted_Total, 
                         Quoted_PU, dShip, Typ, WO, StkPaid, WO_Detail, ProductionWO, Export, InqNumP, Alloy, Form, CC, CL, Thck, Pieces, Descript, SalesP, POitem, SaleDate, ShipDate, Services, Cover, Q_QTY, Q_Total, StandardSize, DescriptID, 
                         YearMn, YearQ, Ship_Date, StdSize, ECPC, DPAS, FCI, GOV, pshipaddr, CustID, st, Company, zip, country, Email, usa, blind, Draw, ColdSaw, QuoteDate, S_QTY, S_Total, S_P, S_PU, NewCCCL, salesrep, Q_P, Q_PU, Sales_Date,
                          StndSize, (CASE WHEN CC = ''S'' THEN ''7'' WHEN CC = ''L'' THEN ''7'' ELSE CC END) + (CASE WHEN (CL = ''A'') THEN ''1'' WHEN (CL = ''B'') THEN ''2'' WHEN (CL = ''C'') THEN ''3'' WHEN (CL = ''D'') THEN ''4'' WHEN (CL = ''E'') 
                         THEN ''5'' WHEN (CL = ''G'') THEN ''6'' ELSE CL END) AS CCCL2, dbo.f_CC_CL_Start(Alloy, CC, CL, Thck) AS StartSize, CW_Start_Size
FROM            dbo.BI_Sales
WHERE        (Alloy = ''HPA N60'') AND (Form = ''10'') AND (LEFT(NewCCCL, 1) = ''7'')
' 
GO
/****** Object:  View [dbo].[vMFG_Log_CCCL]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vMFG_Log_CCCL]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vMFG_Log_CCCL]
AS
SELECT        ''Draw'' AS TBL_Log,AlloyName, Heat, Lot, [Date], sPiece, sSize, sLength, sWeight, DrawSize AS WorkSize, fPiece, fSize, fLength, Condition, ColdWork, SOitem, l.Spec, Notes, Tensile, Yield, Elongation, Red_Area, tLoc, Rockwell, BHN, Passed
              ,c.CC, c.CL, c.[text], c.MinUTS, c.MaxUTS, c.MaxYld, c.MinYLD, c.MaxEl, c.MinEl, c.MaxRA, c.MinRA, c.Cmax, c.Spec AS cSpec
			  
FROM            dbo.Draw_log AS l INNER JOIN
                dbo.ConditionLevel AS c ON l.Tensile > c.MinUTS AND l.Tensile < c.MaxUTS AND l.Yield > c.MinYLD AND l.Yield < c.MaxYld AND l.Elongation > c.MinEl AND l.Elongation < c.MaxEl AND l.Red_Area > c.MinRA AND 
                         l.Red_Area < c.MaxRA
WHERE        (ISNULL(l.ColdWork, 0) > 0)
UNION
SELECT        ''GFM'' AS TBL_Log, AlloyName, Heat, Lot, [Date], sPiece, sSize, sLength, sWeight, GfmSize AS WorkSize, fPiece, fSize, fLength, Condition, ColdWork, SOitem, l.Spec, Notes, Tensile, Yield, Elongation, Red_Area, tLoc, Rockwell, BHN, Passed
              ,c.CC, c.CL, c.[text], c.MinUTS, c.MaxUTS, c.MaxYld, c.MinYLD, c.MaxEl, c.MinEl, c.MaxRA, c.MinRA, c.Cmax, c.Spec AS cSpec
FROM            dbo.GFMlog AS l INNER JOIN
                dbo.ConditionLevel AS c ON l.Tensile > c.MinUTS AND l.Tensile < c.MaxUTS AND l.Yield > c.MinYLD AND l.Yield < c.MaxYld AND l.Elongation > c.MinEl AND l.Elongation < c.MaxEl AND l.Red_Area > c.MinRA AND 
                         l.Red_Area < c.MaxRA
WHERE        (ISNULL(l.ColdWork, 0) > 0)
UNION
SELECT        ''LakeErie'' AS TBL_Log, AlloyName, Heat, Lot, [Date], sPiece, sSize, sLength, sWeight, rollsize AS WorkSize, fPiece, fSize, fLength, Condition, ColdWork, SOitem, l.Spec, Notes, Tensile, Yield, Elongation, Red_Area, '' '' AS tLoc, Rockwell, BHN, Passed
              ,c.CC, c.CL, c.[text], c.MinUTS, c.MaxUTS, c.MaxYld, c.MinYLD, c.MaxEl, c.MinEl, c.MaxRA, c.MinRA, c.Cmax, c.Spec AS cSpec
FROM            dbo.LakeErie_log AS l INNER JOIN
                dbo.ConditionLevel AS c ON l.Tensile > c.MinUTS AND l.Tensile < c.MaxUTS AND l.Yield > c.MinYLD AND l.Yield < c.MaxYld AND l.Elongation > c.MinEl AND l.Elongation < c.MaxEl AND l.Red_Area > c.MinRA AND 
                         l.Red_Area < c.MaxRA
WHERE        (ISNULL(l.ColdWork, 0) > 0)
UNION
SELECT        ''Roll'' AS TBL_Log, AlloyName, Heat, Lot, [Date], sPiece, sSize, sLength, sWeight, RollSize AS WorkSize, fPiece, fSize, fLength, Condition, ColdWork, SOitem, l.Spec, Notes, Tensile, Yield, Elongation, Red_Area, '' '' AS tLoc, Rockwell, BHN, Passed
              ,c.CC, c.CL, c.[text], c.MinUTS, c.MaxUTS, c.MaxYld, c.MinYLD, c.MaxEl, c.MinEl, c.MaxRA, c.MinRA, c.Cmax, c.Spec AS cSpec
FROM            dbo.Roll_Log AS l INNER JOIN
                dbo.ConditionLevel AS c ON l.Tensile > c.MinUTS AND l.Tensile < c.MaxUTS AND l.Yield > c.MinYLD AND l.Yield < c.MaxYld AND l.Elongation > c.MinEl AND l.Elongation < c.MaxEl AND l.Red_Area > c.MinRA AND 
                         l.Red_Area < c.MaxRA
UNION
SELECT        ''Swage'' AS TBL_Log, AlloyName, Heat, Lot, [Date], sPiece, sSize, sLength, sWeight, SwageSize AS WorkSize, fPiece, fSize, fLength, Condition, ColdWork, SOitem, l.Spec, Notes, Tensile, Yield, Elongation, Red_Area, tLoc, Rockwell, BHN, Passed
              ,c.CC, c.CL, c.[text], c.MinUTS, c.MaxUTS, c.MaxYld, c.MinYLD, c.MaxEl, c.MinEl, c.MaxRA, c.MinRA, c.Cmax, c.Spec AS cSpec

FROM            dbo.Swage_Log AS l INNER JOIN
                dbo.ConditionLevel AS c ON l.Tensile > c.MinUTS AND l.Tensile < c.MaxUTS AND l.Yield > c.MinYLD AND l.Yield < c.MaxYld AND l.Elongation > c.MinEl AND l.Elongation < c.MaxEl AND l.Red_Area > c.MinRA AND 
                         l.Red_Area < c.MaxRA

UNION
SELECT        ''Wire'' AS TBL_Log, AlloyName, Heat, Lot, [Date], sPiece, sSize, 0 AS sLength, sWeight, DrawSize AS WorkSize, fPiece, fSize, 0 AS fLength, Condition, ColdWork, SOitem, l.Spec, Notes, Tensile, Yield, Elongation, Red_Area, '' '' AS tLoc, Rockwell, BHN, Passed
              ,c.CC, c.CL, c.[text], c.MinUTS, c.MaxUTS, c.MaxYld, c.MinYLD, c.MaxEl, c.MinEl, c.MaxRA, c.MinRA, c.Cmax, c.Spec AS cSpec
FROM            dbo.Wire_log AS l INNER JOIN
                dbo.ConditionLevel AS c ON l.Tensile > c.MinUTS AND l.Tensile < c.MaxUTS AND l.Yield > c.MinYLD AND l.Yield < c.MaxYld AND l.Elongation > c.MinEl AND l.Elongation < c.MaxEl AND l.Red_Area > c.MinRA AND 
                         l.Red_Area < c.MaxRA
' 
GO
/****** Object:  View [dbo].[StockLst_Sum]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Sum]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  View dbo.StockLst_Sum    Script Date: 5/4/2006 1:28:58 PM *****
ORDER BY m.Alloy, m.Form, m.CC, m.Size*/
CREATE VIEW [dbo].[StockLst_Sum]
AS
SELECT        TOP (100) PERCENT m.Alloy, m.Form, m.CC, m.Size, SUM(d.S_QTY) AS LBS,
                             (SELECT        ISNULL(SUM(D2.S_QTY), 0) AS Prime
                               FROM            dbo.Stocklst_Master AS M2 INNER JOIN
                                                         dbo.Stocklst_Detail AS D2 ON M2.ID = D2.ID
                               WHERE        (M2.Alloy = m.Alloy) AND (M2.Form = m.Form) AND (M2.CC = m.CC) AND (M2.Size = m.Size) AND (D2.Prime = 1)) AS Prime,
                             (SELECT        ISNULL(SUM(P2.Prc_QTY), 0) AS SoldLB
                               FROM            dbo.Stocklst_Master AS M2 INNER JOIN
                                                         dbo.Stocklst_Detail AS D2 ON M2.ID = D2.ID INNER JOIN
                                                         dbo.StockLst_Process AS P2 ON D2.ID_Detail = P2.ID_Detail
                               WHERE        (M2.Alloy = m.Alloy) AND (M2.Form = m.Form) AND (M2.CC = m.CC) AND (M2.Size = m.Size) AND (P2.Process_ID = ''SELECTED'')) AS Sold,
                             (SELECT        ISNULL(SUM(P2.QTY), 0) AS DueLB
                               FROM            dbo.Stocklst_Master AS M2 INNER JOIN
                                                         dbo.Stocklst_Detail AS D2 ON M2.ID = D2.ID LEFT OUTER JOIN
                                                         dbo.StockLst_Process AS P2 ON D2.ID_Detail = P2.ID_Detail
                               WHERE        (M2.Alloy = m.Alloy) AND (M2.Form = m.Form) AND (M2.CC = m.CC) AND (M2.Size = m.Size) AND (P2.Process_ID = ''INCOMING'') OR
                                                         (M2.Alloy = m.Alloy) AND (M2.Form = m.Form) AND (M2.CC = m.CC) AND (M2.Size = m.Size) AND (P2.Process_ID = ''PARTRECV'')) AS Due,
                             (SELECT        ISNULL(SUM(Weight), 0) AS QuoteLB
                               FROM            dbo.AllQuotes
                               WHERE        (Alloy = m.Alloy) AND (Form = m.Form) AND (CC = m.CC) AND (Thck = m.Size) AND (InqDate >= GETDATE() - 30)) AS Quote30
FROM            dbo.Stocklst_Master AS m INNER JOIN
                         dbo.Stocklst_Detail AS d ON m.ID = d.ID LEFT OUTER JOIN
                         dbo.StockLst_Process AS p ON d.ID_Detail = p.ID_Detail
GROUP BY m.Alloy, m.Form, m.CC, m.Size
' 
GO

/****** Object:  View [dbo].[StockLst_Sum_Sales]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Sum_Sales]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  View dbo.StockLst_sum_Sales    Script Date: 5/4/2006 1:29:05 PM ******/
CREATE VIEW [dbo].[StockLst_Sum_Sales]
AS
SELECT        TOP (100) PERCENT m.Alloy, m.Form, dbo.f_CCStandard(m.CC) AS CC, m.Size, SUM(d.Weight) AS LBS,
                             (SELECT        ISNULL(SUM(dbo.StockLst_Process.PWeight), 0) AS Expr1
                               FROM            dbo.Stocklst_Master INNER JOIN
                                                         dbo.Stocklst_Detail ON dbo.Stocklst_Master.ID = dbo.Stocklst_Detail.ID LEFT OUTER JOIN
                                                         dbo.StockLst_Process ON dbo.Stocklst_Detail.ID_Detail = dbo.StockLst_Process.ID_Detail
                               WHERE        (dbo.Stocklst_Master.Alloy = m.Alloy) AND (dbo.Stocklst_Master.Form = m.Form) AND (dbo.f_CCStandard(dbo.Stocklst_Master.CC) = dbo.f_CCStandard(m.CC)) AND 
                                                         (dbo.Stocklst_Master.Size = m.Size) AND (dbo.StockLst_Process.Process_ID = ''SELECTED'')) AS Sold,
                             (SELECT        ISNULL(SUM(StockLst_Process_1.PWeight), 0) AS Expr1
                               FROM            dbo.Stocklst_Master AS Stocklst_Master_1 INNER JOIN
                                                         dbo.Stocklst_Detail AS Stocklst_Detail_1 ON Stocklst_Master_1.ID = Stocklst_Detail_1.ID LEFT OUTER JOIN
                                                         dbo.StockLst_Process AS StockLst_Process_1 ON Stocklst_Detail_1.ID_Detail = StockLst_Process_1.ID_Detail
                               WHERE        (Stocklst_Master_1.Alloy = m.Alloy) AND (Stocklst_Master_1.Form = m.Form) AND (dbo.f_CCStandard(Stocklst_Master_1.CC) = dbo.f_CCStandard(m.CC)) AND (Stocklst_Master_1.Size = m.Size) AND 
                                                         (StockLst_Process_1.Process_ID = ''INCOMING'' OR
                                                         StockLst_Process_1.Process_ID = ''PARTRECV'')) AS Due,
                             (SELECT        ISNULL(SUM(dbo.Sales.MatlWt), 0) AS Expr1
                               FROM            dbo.AllQuotes INNER JOIN
                                                         dbo.Sales ON dbo.AllQuotes.SOitem = dbo.Sales.SOitem
                               WHERE        (dbo.AllQuotes.Alloy = m.Alloy) AND (dbo.AllQuotes.Form = m.Form) AND (dbo.AllQuotes.cc = dbo.f_CCStandard(m.CC)) AND (dbo.AllQuotes.Thck = m.Size) AND (dbo.Sales.Shipped >= GETDATE() 
                                                         - 365)) AS ySale,
                             (SELECT        ISNULL(SUM(Sales_3.MatlWt), 0) AS Expr1
                               FROM            dbo.AllQuotes AS AllQuotes_3 INNER JOIN
                                                         dbo.Sales AS Sales_3 ON AllQuotes_3.SOitem = Sales_3.SOitem
                               WHERE        (AllQuotes_3.Alloy = m.Alloy) AND (AllQuotes_3.Form = m.Form) AND (AllQuotes_3.cc = dbo.f_CCStandard(m.CC)) AND (AllQuotes_3.Thck = m.Size) AND (Sales_3.Shipped >= GETDATE() - 730) AND 
                                                         (Sales_3.Shipped <= GETDATE() - 365)) AS y2Sale,
                             (SELECT        ISNULL(SUM(Sales_2.MatlWt), 0) AS Expr1
                               FROM            dbo.AllQuotes AS AllQuotes_2 INNER JOIN
                                                         dbo.Sales AS Sales_2 ON AllQuotes_2.SOitem = Sales_2.SOitem
                               WHERE        (AllQuotes_2.Alloy = m.Alloy) AND (AllQuotes_2.Form = m.Form) AND (AllQuotes_2.cc = dbo.f_CCStandard(m.CC)) AND (AllQuotes_2.Thck = m.Size) AND (Sales_2.Shipped >= GETDATE() - 1095) AND 
                                                         (Sales_2.Shipped <= GETDATE() - 730)) AS y3Sale,
                             (SELECT        ISNULL(SUM(Sales_1.MatlWt), 0) AS Expr1
                               FROM            dbo.AllQuotes AS AllQuotes_1 INNER JOIN
                                                         dbo.Sales AS Sales_1 ON AllQuotes_1.SOitem = Sales_1.SOitem
                               WHERE        (AllQuotes_1.Alloy = m.Alloy) AND (AllQuotes_1.Form = m.Form) AND (AllQuotes_1.cc = dbo.f_CCStandard(m.CC)) AND (AllQuotes_1.Thck = m.Size) AND (Sales_1.Shipped >= GETDATE() - 1460) AND 
                                                         (Sales_1.Shipped <= GETDATE() - 1095)) AS y4Sale
FROM            dbo.Stocklst_Master AS m INNER JOIN
                         dbo.Stocklst_Detail AS d ON m.ID = d.ID
GROUP BY m.Alloy, m.Form, dbo.f_CCStandard(m.CC), m.Size
ORDER BY m.Alloy, m.Form, CC, m.Size
' 
GO
/****** Object:  View [dbo].[BI_Customer]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[BI_Customer]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[BI_Customer]
AS
SELECT        TOP (100) PERCENT CASE WHEN LEN(AQ.CustID) > 0 THEN AQ.CustID ELSE LEFT(AQ.Company, 20) END AS Customer, SA.st, CASE WHEN ISNULL(AQ.Q_Total, 0) > 0 THEN AQ.Q_Total ELSE ItemSale END AS TotalSale, 
                         AQ.ShipDate, dbo.f_get_Year_Month(AQ.ShipDate) AS YearMn, dbo.f_get_Year_Qtr(AQ.ShipDate) AS YearQ, S.S_QTY, S.S_Total
FROM            dbo.Sales AS S WITH (NOLOCK) INNER JOIN
                         dbo.AllQuotes AS AQ WITH (NOLOCK) ON S.SOitem = AQ.SOitem LEFT OUTER JOIN
                         dbo.Sales_No AS SN ON AQ.SalesNum = SN.salesnum LEFT OUTER JOIN
                         dbo.ShipAddr AS SA ON SN.pshipaddr = SA.shipcode
WHERE        (ISNULL(S.cncld, 0) = 0) AND (ISNULL(S.cmplt, 0) = 1) AND (YEAR(S.Shipped) >= 2010)
ORDER BY S.SalesNum
' 
GO
/****** Object:  View [dbo].[v_ShippingListData]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_ShippingListData]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_ShippingListData]
AS
SELECT        S.SalesNum, S.Item, AQ.Company, dbo.f_GetPcsShipped_SOitem(S.SOitem) AS [Pieces Shipped], AQ.Pieces AS TotalPieces, S.ShipDue, SN.shiproute, ISNULL(SN.usa, 0) AS USA, ISNULL(S.Export, 0) AS Export, 
                         ISNULL(SN.cncld, 0) AS cncld, ISNULL(SN.cmplt, 0) AS cmplt
FROM            dbo.AllQuotes AS AQ WITH (NOLOCK) INNER JOIN
                         dbo.Sales AS S WITH (NOLOCK) ON AQ.SOitem = S.SOitem INNER JOIN
                         dbo.Sales_No AS SN WITH (NOLOCK) ON AQ.SalesNum = SN.salesnum
' 
GO
/****** Object:  View [dbo].[v_OT_View]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_OT_View]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_OT_View]
AS
SELECT        TrackID, TypeAbr, OrderNumber, JobID, Description, status, time
FROM            (SELECT        o.TrackID, otot.TypeAbr, o.OrderNumber, o.JobID, otj.Description,
                                                        (SELECT        TOP (1) CASE WHEN ott.Stop_StatusId IS NULL THEN otts1.Status ELSE otts2.Status END AS Expr1
                                                          FROM            dbo.OT_Times AS ott INNER JOIN
                                                                                    dbo.OT_Times_Status AS otts1 ON ott.Start_StatusId = otts1.StatusId LEFT OUTER JOIN
                                                                                    dbo.OT_Times_Status AS otts2 ON ott.Stop_StatusId = otts2.StatusId
                                                          WHERE        (ott.StartTime > GETDATE() - 365) AND (ott.TrackId = o.TrackID)
                                                          ORDER BY ott.TimeId DESC) AS status,
                                                        (SELECT        TOP (1) ISNULL(StopTime, StartTime) AS Expr1
                                                          FROM            dbo.OT_Times AS ott
                                                          WHERE        (StartTime > GETDATE() - 365) AND (TrackId = o.TrackID)
                                                          ORDER BY TimeId DESC) AS time
                          FROM            dbo.OT AS o LEFT OUTER JOIN
                                                    dbo.OT_OrderType AS otot ON o.OrderTypeID = otot.OrderTypeId INNER JOIN
                                                    dbo.OT_Job AS otj ON o.JobID = otj.JobId
                          GROUP BY o.OrderNumber, o.JobID, otj.Description, o.TrackID, otot.TypeAbr) AS query
WHERE        (time > DATEADD(year, - 1, GETDATE()))
' 
GO
/****** Object:  View [dbo].[v_Open Sale Items]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_Open Sale Items]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_Open Sale Items]
AS
SELECT        TOP (100) PERCENT LTRIM(RTRIM(s.SOitem)) AS soitem, s.SalesNum, sn.salesrep, RTRIM(CONVERT(char(30), CONVERT(date, CASE shipdue WHEN ''1900-01-01 00:00:00.000'' THEN NULL ELSE shipdue END))) AS shipdue, 
                         RTRIM(CONVERT(char(30), CONVERT(date, CASE shipped WHEN ''1900-01-01 00:00:00.000'' THEN NULL ELSE shipped END))) AS shipped, ISNULL(s.cncld, 0) AS itemCancelled, s.cmplt AS itemComplete, 
                         sn.cncld AS orderCancelled, sn.cmplt AS orderComplete, pn.packingsli, pn.packedby, pn.shippedvia, pn.tracking, p.Heat
FROM            dbo.Sales AS s WITH (NOLOCK) INNER JOIN
                         dbo.Sales_No AS sn WITH (NOLOCK) ON s.SalesNum = sn.salesnum LEFT OUTER JOIN
                         dbo.PackingSlip AS p WITH (NOLOCK) ON s.SOitem = p.SOitem LEFT OUTER JOIN
                         dbo.PackingSlip_No AS pn WITH (NOLOCK) ON p.Packingsli = pn.packingsli
WHERE        (s.ShipDue > GETDATE() - 365)
ORDER BY s.SOitem DESC, pn.tracking DESC
' 
GO
/****** Object:  View [dbo].[OrderNotes]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[OrderNotes]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[OrderNotes]
AS
SELECT        n.SOitem, n.Notes
FROM            dbo.SO_ProcessNotes AS n INNER JOIN
                         dbo.Sales AS s ON LTRIM(RTRIM(n.SOitem)) = LTRIM(RTRIM(s.SOitem))
WHERE        (ISNULL(s.cmplt, 0) = 0) AND (ISNULL(s.cncld, 0) = 0) AND (s.SalesNum > 50000)
' 
GO
/****** Object:  View [dbo].[v_TimeClockID]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_TimeClockID]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_TimeClockID]
AS
SELECT EmployeeId, FirstName + '' '' + LastName AS Name
FROM     dbo.TC_Replacement_Employees AS tcr
' 
GO

/****** Object:  View [dbo].[BrokerLst_View]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_View]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  View dbo.StockLst_View    Script Date: 5/4/2006 1:29:10 PM *****
***** Object:  View dbo.Shop_Edit_StockLst    Script Date: 2/23/2005 11:26:17 AM *****
*/
CREATE VIEW [dbo].[BrokerLst_View]
AS
SELECT     TOP (100) PERCENT M.Alloy, M.Form, M.CC, M.Size, D.Weight AS dWeight, M.Cond, M.Specs, M.Heat, M.Lot, M.Paid, M.ID, CASE WHEN poduedate = ''01/01/1900'' THEN CONVERT(CHAR(10), '' '', 101) ELSE CONVERT(CHAR(10), PoDueDate, 101) END AS cPODueDate, M.Mill, M.History, 
                  M.Num, M.PO_item, D.PC, D.Size_H, D.Dim1, D.Size_L, D.Dim2, D.Dim3, D.Length, D.Weight, D.CostValue, D.Descript, D.Location, D.FloorStatus, D.Class, D.Unit, D.InvCheck, 0 AS Prc, M.Melt,
                      (SELECT     COUNT(*) AS Expr1
                       FROM        dbo.BrokerLst_Process AS P WITH (NOLOCK)
                       WHERE     (D.ID_Detail = ID_Detail)) AS Bkr, D.ID_Detail, M.POStatus, M.FROM_ID, CASE WHEN stkdate = ''01/01/1900'' THEN CONVERT(CHAR(10), '' '', 101) ELSE CONVERT(CHAR(10), stkdate, 101) END AS cStkDate, D.ReceivingID, D.RandLen, M.BrandName, 0 AS Expr1, 
                  dbo.Forms.FormSort, D.Prime, D.Quarantine, M.MillTrace
FROM        dbo.BrokerLst_Master AS M WITH (NOLOCK) INNER JOIN
                  dbo.BrokerLst_Detail AS D WITH (NOLOCK) ON M.ID = D.ID INNER JOIN
                  dbo.ConditionCode AS C WITH (NOLOCK) ON M.CC = C.CC INNER JOIN
                  dbo.Forms ON M.Form = dbo.Forms.FormNumber
' 
GO
/****** Object:  View [dbo].[v_StockList]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_StockList]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_StockList]
AS
SELECT        TOP (100) PERCENT M.Alloy, M.Form, F.FormDescription AS FormDesc, M.CC, M.CL, dbo.f_CC_CLsort(M.CC, M.CL) AS CCCL, M.Size, D.Weight AS dWeight, M.Cond, M.Specs, M.Heat, M.Lot, M.Paid, M.ID, 
                         CASE WHEN poduedate = ''01/01/1900'' THEN CONVERT(CHAR(10), '' '', 101) ELSE CONVERT(CHAR(10), PoDueDate, 101) END AS cPODueDate, M.Mill, M.History, M.Num, M.PO_item, M.MillTrace, M.MWeight, M.StkDate, D.PC, 
                         D.Size_H, D.Dim1, D.Size_L, D.Dim2, D.Dim3, D.Length, D.Weight, D.CostValue, D.Descript, D.Location, D.FloorStatus, D.Class, D.Unit, D.InvCheck, 0 AS Prc, M.Melt, D.ID_Detail, M.POStatus, M.FROM_ID, 
                         CASE WHEN stkdate = ''01/01/1900'' THEN CONVERT(CHAR(10), '' '', 101) ELSE CONVERT(CHAR(10), stkdate, 101) END AS cStkDate, D.ReceivingID, D.RandLen, M.BrandName, D.LiveCheck, F.FormSort, D.Prime, 
                         D.Quarantine
FROM            dbo.Stocklst_Master AS M WITH (NOLOCK) INNER JOIN
                         dbo.StockLst_Detail AS D WITH (NOLOCK) ON M.ID = D.ID INNER JOIN
                         dbo.Forms AS F WITH (NOLOCK) ON M.Form = F.FormNumber INNER JOIN
                         dbo.StockLst_Process AS P WITH (NOLOCK) ON D.ID_Detail = P.ID_Detail
WHERE        (M.Heat NOT LIKE ''Due In%'')
' 
GO
/****** Object:  View [dbo].[v_OT_Emps]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_OT_Emps]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_OT_Emps]
AS
SELECT        TOP (100) PERCENT ot.OrderNumber, ot.JobID, otj.Description, t.Name
FROM            dbo.OT AS ot WITH (NOLOCK) INNER JOIN
                         dbo.OT_Times_Employees AS ote ON ote.TrackId = ot.TrackID INNER JOIN
                         dbo.v_TimeClockID AS t ON t.EmployeeId = ote.EmployeeId INNER JOIN
                         dbo.OT_Times AS ott ON ot.TrackID = ott.TrackId INNER JOIN
                         dbo.OT_Job AS otj ON ot.JobID = otj.JobId
WHERE        (ott.StartTime > GETDATE() - 365)
GROUP BY ot.TrackID, ot.OrderNumber, ot.JobID, otj.Description, t.Name
' 
GO
/****** Object:  View [dbo].[v_OT_PackingSlip]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_OT_PackingSlip]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_OT_PackingSlip]
AS
Select * 
FROM
(
	SELECT
		--o.TrackID, 
		LTRIM(RTRIM(s.SOitem)) AS soitem, 
		CONVERT(char, CONVERT(date, MAX(pn.ps_date))) AS psDate
	FROM [dbo].[Sales_No] AS sn WITH(NOLOCK)
	INNER JOIN [dbo].[Sales] AS s WITH(NOLOCK) ON sn.salesnum = s.SalesNum
	INNER JOIN [dbo].[PackingSlip] AS p WITH(NOLOCK) ON s.SOitem = p.SOitem 
	INNER JOIN [dbo].[PackingSlip_No] AS pn WITH(NOLOCK) ON p.Packingsli = pn.packingsli
	--INNER JOIN [dbo].[OT] AS o WITH(NOLOCK) ON LTRIM(RTRIM(o.OrderNumber)) = LTRIM(RTRIM(s.SOitem)) 
	--INNER JOIN [dbo].[OT_Times] AS ott WITH(NOLOCK) ON o.TrackID = ott.TrackId 

	WHERE (ISNULL(sn.cncld, 0) = 0) 
		AND (p.SOitem IS NOT NULL) 
		AND (pn.ps_date > DATEADD(day, - 30, GETDATE())) 
		AND (sn.salesnum > 50000) 
		AND (sn.ShopRecv = 1) 
		AND (ISNULL(p.Cancld, 0) = 0) 
		--AND (ott.Stop_StatusId = 4)
	GROUP BY s.SOitem--, o.TrackID
	HAVING (SUM(CONVERT(int, ISNULL(s.cncld, 0))) <> COUNT(s.SOitem))
) sDetails
CROSS APPLY 
(
	SELECT DISTINCT o.TrackID
	FROM [dbo].[OT] AS o WITH(NOLOCK)
	--INNER JOIN [dbo].[OT_Times] AS ott WITH(NOLOCK) ON o.TrackID = ott.TrackId
	WHERE LTRIM(RTRIM(o.OrderNumber)) = LTRIM(RTRIM(sDetails.SOitem))
	--AND (ott.Stop_StatusId = 4)
) as OT
' 
GO

/****** Object:  View [dbo].[v_ApprovedVendorList]    Script Date: 12/26/2025 5:48:52 PM ******/

IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_ApprovedVendorList]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_ApprovedVendorList]
AS
SELECT DISTINCT 
                         CASE ISNULL(v.[subsidiary of], 0) WHEN 0 THEN v.VendCode ELSE ISNULL(V.[subsidiary of], 999999) END AS VendCode, v.Company, v.Addr1, v.Addr2, v.AddrPOB, v.City, v.ST, v.Zip, v.Website, v.Country, v.LastEdit, 
                         dbo.f_Vendor_QAType_Manufacturer(v.QAType) AS Manufacturer, dbo.f_Vendor_QAType_Distibutor(v.QAType) AS Distibutor, dbo.f_Vendor_QAType_Calibration(v.QAType) AS Calibration, 
                         dbo.f_Vendor_QAType_GageEquipment(v.QAType) AS GageEquipment, dbo.f_Vendor_QAType_MaterialTesting(v.QAType) AS MaterialTesting, dbo.f_Vendor_QAType_Service(v.QAType) AS Service, 
                         dbo.f_Vendor_QAType_Other(v.QAType) AS Other, CASE Vend_Notes WHEN ''^*^*^'' THEN '''' ELSE Vend_Notes END AS Vend_Notes,
                             (SELECT        TOP (1) OrderDate
                               FROM            dbo.PurchaseOrder AS po WITH (NOLOCK)
                               WHERE        (VendCode = v.VendCode)
                               ORDER BY POitem DESC) AS [Last Used Date], CASE ERP_1.dbo.f_IsVendorAppr(v.VendCode) WHEN ''1'' THEN ''Approved'' WHEN ''2'' THEN ''Conditional'' ELSE ''Unapproved'' END AS [Calculated Approval], 
                         CASE ISNULL(vqs.Approved, 0) WHEN ''1'' THEN ''VQS Appr'' ELSE ''VQS Unappr'' END AS [VQS Approved], CASE ISNULL(v.DRC_Free, 0) WHEN ''1'' THEN ''CMS Bound'' ELSE '' - '' END AS [Conflict Minerals Bound], 
                         CASE WHEN ISNULL(vcmf.Approved, 0) = ''1'' THEN ''CMS Approved'' WHEN dbo.f_HasConflictMineralsFile(v.VendCode) = ''1'' THEN ''CMS Approved'' ELSE ''CMS Unapproved'' END AS [Conflict Minerals Approval], 
                         CASE WHEN dbo.f_AreCertsValid(v.VendCode) = ''1'' THEN '' - '' ELSE ''Expired'' END AS [Files Valid], CASE ISNULL([QAApproved], 0) 
                         WHEN ''0'' THEN '''' WHEN ''1'' THEN ''Approved'' WHEN ''2'' THEN ''Conditional'' ELSE ''Unapproved'' END AS [Custom Approved], v.QAApprovalNotes AS [Custom Approved Notes], CASE ISNULL([inactive], 0) 
                         WHEN ''0'' THEN ''Active'' ELSE ''Inactive'' END AS inactive, CASE ISNULL(DLA_BMS, 0) WHEN ''0'' THEN '' - '' ELSE ''DLA'' END AS [Defense Logistics Agency Procedure Bound], CASE ISNULL(V.[subsidiary of], 0) 
                         WHEN 0 THEN QASurveyDate ELSE NULL END AS QASurveyDate, v.[subsidiary of]
FROM            dbo.Vendor AS v LEFT OUTER JOIN
                         dbo.VendorQualitySurvey AS vqs ON v.VendCode = vqs.VendCode LEFT OUTER JOIN
                         dbo.VendorConflictMineralsFree AS vcmf ON v.VendCode = vcmf.VendCode
' 
/****** Object:  View [dbo].[v_ApprovedVendors]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v_ApprovedVendorList]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement =N' CREATE VIEW [dbo].[v_ApprovedVendorList]
AS
(
SELECT        TOP (100) PERCENT VendCode, Company, contactName, contactEmail, [Calculated Approval], [VQS Approved], [Conflict Minerals Bound], [Conflict Minerals Approved], HasConflictMineralsFile, FilesOK, [Custom Approved], 
                         [Custom Approved Notes], [subsidiary of], VQS_NotRequired
FROM            (SELECT        TOP (1000) v.VendCode, v.Company, ISNULL(vc.Contact, ''[No default quality contact]'') AS contactName, ISNULL(vc.Email, ''QA@HPAlloys.com'') AS contactEmail, dbo.f_IsVendorAppr(CASE WHEN (v.[subsidiary of] > 0) 
                                                    THEN v.[subsidiary of] ELSE v.VendCode END) AS [Calculated Approval], ISNULL(vqs.Approved, 0) AS [VQS Approved], ISNULL(v.DRC_Free, 0) AS [Conflict Minerals Bound], ISNULL(vcmf.Approved, 0) 
                                                    AS [Conflict Minerals Approved], HPAlloyNR.dbo.f_HasConflictMineralsFile(v.VendCode) AS HasConflictMineralsFile, HPAlloyNR.dbo.f_AreCertsValid(v.VendCode) AS FilesOK, v.QAApproved AS [Custom Approved], 
                                                    v.QAApprovalNotes AS [Custom Approved Notes], v.[subsidiary of], v.VQS_NotRequired
                          FROM            dbo.Vendor AS v LEFT OUTER JOIN
                                                    dbo.VendorQualitySurvey AS vqs ON v.VendCode = vqs.VendCode LEFT OUTER JOIN
                                                    dbo.VendorConflictMineralsFree AS vcmf ON v.VendCode = vcmf.VendCode LEFT OUTER JOIN
                                                    dbo.VendorContact AS vc ON v.QASurveyContactID = vc.ContactID) AS q
WHERE        ([Calculated Approval] = 1) OR
                         ([Calculated Approval] = 2)
ORDER BY Company
)
--RETURNS bit

' 
END
GO

*/




/****** Object:  View [dbo].[v_ApprovedVendorList]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_ApprovedVendorList]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_ApprovedVendorList]
AS
SELECT DISTINCT 
                         CASE ISNULL(v.[subsidiary of], 0) WHEN 0 THEN v.VendCode ELSE ISNULL(V.[subsidiary of], 999999) END AS VendCode, v.Company, v.Addr1, v.Addr2, v.AddrPOB, v.City, v.ST, v.Zip, v.Website, v.Country, v.LastEdit, 
                         dbo.f_Vendor_QAType_Manufacturer(v.QAType) AS Manufacturer, dbo.f_Vendor_QAType_Distibutor(v.QAType) AS Distibutor, dbo.f_Vendor_QAType_Calibration(v.QAType) AS Calibration, 
                         dbo.f_Vendor_QAType_GageEquipment(v.QAType) AS GageEquipment, dbo.f_Vendor_QAType_MaterialTesting(v.QAType) AS MaterialTesting, dbo.f_Vendor_QAType_Service(v.QAType) AS Service, 
                         dbo.f_Vendor_QAType_Other(v.QAType) AS Other, CASE Vend_Notes WHEN ''^*^*^'' THEN '''' ELSE Vend_Notes END AS Vend_Notes,
                             (SELECT        TOP (1) OrderDate
                               FROM            dbo.PurchaseOrder AS po WITH (NOLOCK)
                               WHERE        (VendCode = v.VendCode)
                               ORDER BY POitem DESC) AS [Last Used Date], CASE ERP_1.dbo.f_IsVendorAppr(v.VendCode) WHEN ''1'' THEN ''Approved'' WHEN ''2'' THEN ''Conditional'' ELSE ''Unapproved'' END AS [Calculated Approval], 
                         CASE ISNULL(vqs.Approved, 0) WHEN ''1'' THEN ''VQS Appr'' ELSE ''VQS Unappr'' END AS [VQS Approved], CASE ISNULL(v.DRC_Free, 0) WHEN ''1'' THEN ''CMS Bound'' ELSE '' - '' END AS [Conflict Minerals Bound], 
                         CASE WHEN ISNULL(vcmf.Approved, 0) = ''1'' THEN ''CMS Approved'' WHEN dbo.f_HasConflictMineralsFile(v.VendCode) = ''1'' THEN ''CMS Approved'' ELSE ''CMS Unapproved'' END AS [Conflict Minerals Approval], 
                         CASE WHEN dbo.f_AreCertsValid(v.VendCode) = ''1'' THEN '' - '' ELSE ''Expired'' END AS [Files Valid], CASE ISNULL([QAApproved], 0) 
                         WHEN ''0'' THEN '''' WHEN ''1'' THEN ''Approved'' WHEN ''2'' THEN ''Conditional'' ELSE ''Unapproved'' END AS [Custom Approved], v.QAApprovalNotes AS [Custom Approved Notes], CASE ISNULL([inactive], 0) 
                         WHEN ''0'' THEN ''Active'' ELSE ''Inactive'' END AS inactive, CASE ISNULL(DLA_BMS, 0) WHEN ''0'' THEN '' - '' ELSE ''DLA'' END AS [Defense Logistics Agency Procedure Bound], CASE ISNULL(V.[subsidiary of], 0) 
                         WHEN 0 THEN QASurveyDate ELSE NULL END AS QASurveyDate, v.[subsidiary of]
FROM            dbo.Vendor AS v LEFT OUTER JOIN
                         dbo.VendorQualitySurvey AS vqs ON v.VendCode = vqs.VendCode LEFT OUTER JOIN
                         dbo.VendorConflictMineralsFree AS vcmf ON v.VendCode = vcmf.VendCode
' 
GO
/****** Object:  View [dbo].[v_OT_ShopRecv]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_OT_ShopRecv]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_OT_ShopRecv]
AS
SELECT TOP (100) PERCENT RTRIM(LTRIM(CONVERT(char(7), sn.salesnum))) AS salesnum, RTRIM(CONVERT(char, CONVERT(date, MAX(s.ShipDue)))) AS MaxShipDue
FROM     dbo.Sales_No AS sn WITH (NOLOCK) LEFT OUTER JOIN
                  dbo.Sales AS s WITH (NOLOCK) ON sn.salesnum = s.SalesNum LEFT OUTER JOIN
                  dbo.PackingSlip AS p ON s.SOitem = p.SOitem
WHERE  (ISNULL(sn.cncld, 0) = 0) AND (p.SOitem IS NULL) AND (ISNULL(sn.cmplt, 0) = 0) AND (sn.salesnum > 50000) AND (ISNULL(s.Shipped, ''1900-01-01 00:00:00.000'') = ''1900-01-01 00:00:00.000'') AND (ISNULL(s.cncld, 0) = 0) AND (ISNULL(sn.ShopRecv, 
                  0) = 1)
GROUP BY sn.salesnum
ORDER BY MaxShipDue
' 
GO

/****** Object:  View [dbo].[Forcast]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Forcast]'))
EXEC dbo.sp_executesql @statement = N'/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[Forcast]
AS
SELECT        Customer, Alloy, CC, CL, Dia, Inches, Period, UT, Sdate, CAST(dbo.f_StandardSizePlus((CAST(Dia AS Numeric(9, 3)) + 0.030) * (1 + CAST(CL AS Numeric(9, 3)) / 10)) AS Numeric(9, 3)) AS SNomDia, Pounds, MinPounds,
                             (SELECT        CEILING(SUM(SD.S_QTY)) AS Expr1
                               FROM            dbo.Stocklst_Master AS SM WITH (NOLOCK) INNER JOIN
                                                         dbo.StockLst_Detail AS SD WITH (NOLOCK) ON SM.ID = SD.ID
                               WHERE        (SM.Alloy = F.Alloy) AND (SM.Form = ''10'') AND (SM.CC = ''S'') AND (SM.CL = F.CL) AND (SM.Size = F.Dia)) AS exactStock,
                             (SELECT        CEILING(SUM(SD.S_QTY)) AS Expr1
                               FROM            dbo.Stocklst_Master AS SM WITH (NOLOCK) INNER JOIN
                                                         dbo.StockLst_Detail AS SD WITH (NOLOCK) ON SM.ID = SD.ID
                               WHERE        (SM.Alloy = F.Alloy) AND (SM.Form = ''10'') AND (SM.CC = F.CC) AND (SM.CL = F.CL) AND (SM.Size = F.Dia)) AS nearStock,
                             (SELECT        CEILING(SUM(SD.S_QTY)) AS Expr1
                               FROM            dbo.Stocklst_Master AS SM WITH (NOLOCK) INNER JOIN
                                                         dbo.StockLst_Detail AS SD WITH (NOLOCK) ON SM.ID = SD.ID
                               WHERE        (SM.Alloy = F.Alloy) AND (SM.Form = ''10'') AND (SM.CC = dbo.f_CCCLtoOldCC(F.CC, F.CL)) AND (SM.Size = F.Dia)) AS oldCCStock, dbo.f_CCCLtoOldCC(CC, CL) AS OldCC,
                             (SELECT        CEILING(SUM(SD.S_QTY)) AS Expr1
                               FROM            dbo.Stocklst_Master AS SM WITH (NOLOCK) INNER JOIN
                                                         dbo.StockLst_Detail AS SD WITH (NOLOCK) ON SM.ID = SD.ID
                               WHERE        (SM.Alloy = F.Alloy) AND (SM.Form = ''10'') AND (SM.CC = ''1'') AND (SM.Size = CAST(dbo.f_StandardSizePlus((CAST(F.Dia AS Numeric(9, 3)) + 0.030) * (1 + CAST(F.CL AS Numeric(9, 3)) / 10)) AS Numeric(9, 3)))) 
                         AS PreStock, CEILING(dbo.f_Get_Weight(1, Alloy, ''10'', ''1'', dbo.f_StandardSizePlus((CAST(Dia AS Numeric(9, 3)) + 0.030) * (1 + CAST(CL AS Numeric(9, 3)) / 10)), Inches, 0, 0)) AS StartPounds,
                             (SELECT        CEILING(SUM(CASE WHEN SP.QTY > 0 THEN SP.QTY ELSE SP.Pounds END)) AS QTYSelected
                               FROM            dbo.Stocklst_Master AS SM WITH (NOLOCK) INNER JOIN
                                                         dbo.StockLst_Detail AS SD WITH (NOLOCK) ON SM.ID = SD.ID LEFT OUTER JOIN
                                                         dbo.StockLst_Process AS SP ON SD.ID_Detail = SP.ID_Detail
                               WHERE        (SM.Alloy = F.Alloy) AND (SM.Form = ''10'') AND (SM.CC = ''1'') AND (SM.Size = F.Dia) AND (ISNULL(SP.Process_ID, ''SELECTED'') = ''SELECTED'')) AS QtySeleted
FROM            dbo.ForecastStock AS F WITH (NOLOCK)
' 
GO
/****** Object:  View [dbo].[BI_Vendor]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[BI_Vendor]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[BI_Vendor]
AS
SELECT        TOP (100) PERCENT Company, ISNULL(StockLst_PU, 1) AS StockLst_PU, StockLst_P, StockLst_QTY, StockLst_Total, OrderDate, dbo.f_get_Year_Month(OrderDate) AS YearMn, dbo.f_get_Year_Qtr(OrderDate) AS YearQ, Alloy, 
                         Form, DescriptID,
                             (SELECT        TOP (1) ContactID
                               FROM            dbo.VendorContact AS VC WITH (NOLOCK)
                               WHERE        (VendCode = P.VendCode) AND (ISNULL(Inactive, 0) = 0)) AS ContactID, ReconcileTotal, (CASE WHEN P.ReconcileTotal > 0 THEN P.ReconcileTotal ELSE P.StockLst_Total END) AS Bought
FROM            dbo.PurchaseOrder AS P WITH (NOLOCK)
WHERE        (ISNULL(Cancelled, 0) = 0) AND (ISNULL(Cmplt, 0) = 1) AND (ISNULL(ConvServ, 0) = 0) AND (ISNULL(Equipment, 0) = 0) AND (ISNULL(Services, 0) = 0) AND (YEAR(OrderDate) >= 2012)
' 
GO
/****** Object:  View [dbo].[v_OT_TimeView]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_OT_TimeView]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_OT_TimeView]
AS
SELECT        TOP (100) PERCENT ot.TrackID, ot.OrderNumber, otj.JobId, otj.Description, ott.TimeId, ott.StartTime, otts1.Status AS Start_Status, ott.StopTime, otts2.Status AS Stop_Status
FROM            dbo.OT AS ot WITH (NOLOCK) INNER JOIN
                         dbo.OT_Times AS ott ON ot.TrackID = ott.TrackId INNER JOIN
                         dbo.OT_Job AS otj ON ot.JobID = otj.JobId INNER JOIN
                         dbo.OT_Times_Status AS otts1 ON ott.Start_StatusId = otts1.StatusId LEFT OUTER JOIN
                         dbo.OT_Times_Status AS otts2 ON ott.Stop_StatusId = otts2.StatusId
WHERE        (ott.StartTime > GETDATE() - 365)
ORDER BY ott.StartTime
' 
GO

/****** Object:  View [dbo].[BI_Shipped_Sales]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[BI_Shipped_Sales]'))
EXEC dbo.sp_executesql @statement = N'/*ORDER BY SN.salesnum DESC, S.SOitem*/
CREATE VIEW [dbo].[BI_Shipped_Sales]
AS
SELECT        TOP (100) SN.salesnum, SN.salesrep, SN.psoldaddr, SN.pshipaddr, SN.CustID, SN.usa, SN.DPAS, S.SOitem, S.ShipDue, S.cmplt, S.Quoted_PU, S.Quoted_P, S.Quoted_QTY, S.PT_PU, S.PT_P,
                             (SELECT        SUM(PT_QTY) AS Expr1
                               FROM            dbo.PackingSlip
                               WHERE        (SOitem = S.SOitem) AND (Cancld = 0)) AS Shp_QTY, dbo.f_RMA_QTY_Rcvd(S.SOitem) AS RMA_QTY_Rcvd, S.Quoted_Total, S.PT_Total,
                             (SELECT        SUM(PT_QTY) AS Expr1
                               FROM            dbo.PackingSlip AS PackingSlip_2
                               WHERE        (SOitem = S.SOitem) AND (Cancld = 0)) * S.Quoted_P AS Shp_Total,
                             (SELECT        COUNT(*) AS CNT
                               FROM            dbo.PackingSlip AS PackingSlip_1
                               WHERE        (SOitem = S.SOitem) AND (Cancld = 0)) AS Packings, S.Typ, S.ID_AllQuotes, S.DateAdded, ISNULL
                             ((SELECT        SUM(RMA_QTY) AS Expr1
                                 FROM            dbo.RMA_Detail
                                 WHERE        (so_item = S.SOitem) AND (cancelled = 0)), 0) AS RMA, S.S_QTY, S.S_P, S.S_Total, S.S_PU
FROM            dbo.Sales_No AS SN INNER JOIN
                         dbo.Sales AS S ON SN.salesnum = S.SalesNum
WHERE        (SN.cncld = 0)
' 
GO
/****** Object:  View [dbo].[v_ApprovedVendors]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_ApprovedVendors]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_ApprovedVendors]
AS
SELECT TOP (100) PERCENT VendCode, Company, contactName, contactEmail, [Calculated Approval], [VQS Approved], [Conflict Minerals Bound], [Conflict Minerals Approved], HasConflictMineralsFile, FilesOK, [Custom Approved], 
                  [Custom Approved Notes], [subsidiary of], VQS_NotRequired
FROM     (SELECT TOP (1000) v.VendCode, v.Company, ISNULL(vc.Contact, ''[No default quality contact]'') AS contactName, ISNULL(vc.Email, ''QA@ERP_1s.com'') AS contactEmail, dbo.f_IsVendorAppr(CASE WHEN (v.[subsidiary of] > 0) 
                                    THEN v.[subsidiary of] ELSE v.VendCode END) AS [Calculated Approval], ISNULL(vqs.Approved, 0) AS [VQS Approved], ISNULL(v.DRC_Free, 0) AS [Conflict Minerals Bound], ISNULL(vcmf.Approved, 0) 
                                    AS [Conflict Minerals Approved], dbo.f_HasConflictMineralsFile(v.VendCode) AS HasConflictMineralsFile, dbo.f_AreCertsValid(v.VendCode) AS FilesOK, v.QAApproved AS [Custom Approved], 
                                    v.QAApprovalNotes AS [Custom Approved Notes], v.[subsidiary of], v.VQS_NotRequired
                  FROM      dbo.Vendor AS v LEFT OUTER JOIN
                                    dbo.VendorQualitySurvey AS vqs ON v.VendCode = vqs.VendCode LEFT OUTER JOIN
                                    dbo.VendorConflictMineralsFree AS vcmf ON v.VendCode = vcmf.VendCode LEFT OUTER JOIN
                                    dbo.VendorContact AS vc ON v.QASurveyContactID = vc.ContactID) AS q
WHERE  ([Calculated Approval] = 1) OR
                  ([Calculated Approval] = 2)
ORDER BY Company
' 
GO
/****** Object:  View [dbo].[BI_GFM_Mechs]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[BI_GFM_Mechs]'))
EXEC dbo.sp_executesql @statement = N'/*ORDER BY Lot, RowNum
dbo.f_Calc_CW_Level*/
CREATE VIEW [dbo].[BI_GFM_Mechs]
AS
SELECT        TOP (100) PERCENT Alloy, Heat, Lot, Spec, RowNum, UTS, YLD, EL, RA, tLoc, HR, BHN, CAST(LogDate AS DATE) AS LogDate, sSize, fSize, ColdWork, sWeight, MS_101, MS_102, MS_103, MS_104, MS_105, MS_106
FROM            (SELECT        1 AS RowNum, AlloyName AS Alloy, Heat, Lot, Spec, Tensile AS UTS, Yield AS YLD, Elongation AS EL, Red_Area AS RA, ISNULL(tLoc, '''') AS tLoc, UPPER(ISNULL(Rockwell, '''')) AS HR, ISNULL(BHN, 0) AS BHN, 
                                                    Date AS LogDate, sSize, CASE WHEN GFMSize > 0 THEN GFMSize ELSE fSize END AS fSize, CASE WHEN ColdWork > 0 THEN ColdWork ELSE 0 END AS ColdWork, sWeight, dbo.f_Is_GFMlot_toSpec(Lot, 
                                                    ''HPA-MS-101                    '', '''') AS MS_101, dbo.f_Is_GFMlot_toSpec(Lot, ''HPA-MS-102                    '', '''') AS MS_102, dbo.f_Is_GFMlot_toSpec(Lot, ''HPA-MS-103                    '', '''') AS MS_103, dbo.f_Is_GFMlot_toSpec(Lot, 
                                                    ''HPA-MS-104                    '', '''') AS MS_104, dbo.f_Is_GFMlot_toSpec(Lot, ''HPA-MS-105                    '', '''') AS MS_105, dbo.f_Is_GFMlot_toSpec(Lot, ''HPA-MS-106                    '', '''') AS MS_106
                          FROM            dbo.GFMlog
                          WHERE        (Tensile > 0)
                          UNION
                          SELECT        2 AS RowNum, AlloyName AS Alloy, Heat, Lot, Spec, Tensile2 AS UTS, Yield2 AS YLD, Elongation2 AS EL, Red_Area2 AS RA, ISNULL(tLoc2, '''') AS tLoc, UPPER(ISNULL(Rockwell2, '''')) AS HR, ISNULL(BHN2, 0) AS BHN,
                                                    Date AS LogDate, CASE WHEN GFMSize > 0 THEN GFMSize ELSE fSize END AS fSize, GfmSize, CASE WHEN ColdWork > 0 THEN ColdWork ELSE 0 END AS ColdWork, sWeight, dbo.f_Is_GFMlot_toSpec(Lot, 
                                                   ''HPA-MS-101                    '', '''') AS MS_101, dbo.f_Is_GFMlot_toSpec(Lot, ''HPA-MS-102                    '', '''') AS MS_102, dbo.f_Is_GFMlot_toSpec(Lot, ''HPA-MS-103                    '', '''') AS MS_103, dbo.f_Is_GFMlot_toSpec(Lot, 
                                                   ''HPA-MS-104                    '', '''') AS MS_104, dbo.f_Is_GFMlot_toSpec(Lot, ''HPA-MS-105                    '', '''') AS MS_105, dbo.f_Is_GFMlot_toSpec(Lot, ''HPA-MS-106                    '', '''') AS MS_106
                          FROM            dbo.GFMlog AS GFMlog_2
                          WHERE        (Tensile2 > 0)
                          UNION
                          SELECT        3 AS RowNum, AlloyName AS Alloy, Heat, Lot, Spec, Tensile3 AS UTS, Yield3 AS YLD, Elongation3 AS EL, red_area3 AS RA, ISNULL(tLoc3, '''') AS tLoc, UPPER(ISNULL(Rockwell3, '''')) AS HR, ISNULL(BHN3, 0) AS BHN, 
                                                   Date AS LogDate, CASE WHEN GFMSize > 0 THEN GFMSize ELSE fSize END AS fSize, GfmSize, CASE WHEN ColdWork > 0 THEN ColdWork ELSE 0 END AS ColdWork, sWeight, dbo.f_Is_GFMlot_toSpec(Lot, 
                                                   ''HPA-MS-101                    '', '''') AS MS_101, dbo.f_Is_GFMlot_toSpec(Lot, ''HPA-MS-102                    '', '''') AS MS_102, dbo.f_Is_GFMlot_toSpec(Lot, ''HPA-MS-103                    '', '''') AS MS_103, dbo.f_Is_GFMlot_toSpec(Lot, 
                                                   ''HPA-MS-104                    '', '''') AS MS_104, dbo.f_Is_GFMlot_toSpec(Lot, ''HPA-MS-105                    '', '''') AS MS_105, dbo.f_Is_GFMlot_toSpec(Lot, ''HPA-MS-106                    '', '''') AS MS_106
                          FROM            dbo.GFMlog AS GFMlog_3
                          WHERE        (Tensile3 > 0)
                          UNION
                          SELECT        4 AS RowNum, AlloyName AS Alloy, Heat, Lot, Spec, Tensile4 AS UTS, Yield4 AS YLD, Elongation4 AS EL, Red_Area4 AS RA, ISNULL(tLoc4, '''') AS tLoc, UPPER(ISNULL(Rockwell4, '''')) AS HR, ISNULL(BHN4, 0) AS BHN,
                                                    Date AS LogDate, CASE WHEN GFMSize > 0 THEN GFMSize ELSE fSize END AS fSize, GfmSize, CASE WHEN ColdWork > 0 THEN ColdWork ELSE 0 END AS ColdWork, sWeight, dbo.f_Is_GFMlot_toSpec(Lot, 
                                                   ''HPA-MS-101                    '', '''') AS MS_101, dbo.f_Is_GFMlot_toSpec(Lot, ''HPA-MS-102                    '', '''') AS MS_102, dbo.f_Is_GFMlot_toSpec(Lot, ''HPA-MS-103                    '', '''') AS MS_103, dbo.f_Is_GFMlot_toSpec(Lot, 
                                                   ''HPA-MS-104                    '', '''') AS MS_104, dbo.f_Is_GFMlot_toSpec(Lot, ''HPA-MS-105                    '', '''') AS MS_105, dbo.f_Is_GFMlot_toSpec(Lot, ''HPA-MS-106                    '', '''') AS MS_106
                          FROM            dbo.GFMlog AS GFMlog_4
                          WHERE        (Tensile4 > 0)
                          UNION
                          SELECT        5 AS RowNum, AlloyName AS Alloy, Heat, Lot, Spec, Tensile5 AS UTS, Yield5 AS YLD, Elongation5 AS EL, Red_Area5 AS RA, ISNULL(tLoc5, '''') AS tLoc, UPPER(ISNULL(Rockwell5, '''')) AS HR, ISNULL(BHN5, 0) AS BHN,
                                                    Date AS LogDate, CASE WHEN GFMSize > 0 THEN GFMSize ELSE fSize END AS fSize, GfmSize, CASE WHEN ColdWork > 0 THEN ColdWork ELSE 0 END AS ColdWork, sWeight, dbo.f_Is_GFMlot_toSpec(Lot, 
                                                   ''HPA-MS-101                    '', '''') AS MS_101, dbo.f_Is_GFMlot_toSpec(Lot, ''HPA-MS-102                    '', '''') AS MS_102, dbo.f_Is_GFMlot_toSpec(Lot, ''HPA-MS-103                    '', '''') AS MS_103, dbo.f_Is_GFMlot_toSpec(Lot, 
                                                   ''HPA-MS-104                    '', '''') AS MS_104, dbo.f_Is_GFMlot_toSpec(Lot, ''HPA-MS-105                    '', '''') AS MS_105, dbo.f_Is_GFMlot_toSpec(Lot, ''HPA-MS-106                    '', '''') AS MS_106
                          FROM            dbo.GFMlog AS GFMlog_5
                          WHERE        (Tensile5 > 0)
                          UNION
                          SELECT        6 AS RowNum, AlloyName AS Alloy, Heat, Lot, Spec, Tensile6 AS UTS, Yield6 AS YLD, Elongation6 AS EL, Red_Area6 AS RA, ISNULL(tLoc6, '''') AS tLoc, '''' AS HR, 0 AS BHN, Date AS LogDate, 
                                                   CASE WHEN GFMSize > 0 THEN GFMSize ELSE fSize END AS fSize, GfmSize, CASE WHEN ColdWork > 0 THEN ColdWork ELSE 0 END AS ColdWork, sWeight, dbo.f_Is_GFMlot_toSpec(Lot, 
                                                   ''HPA-MS-101                    '', '''') AS MS_101, dbo.f_Is_GFMlot_toSpec(Lot, ''HPA-MS-102                    '', '''') AS MS_102, dbo.f_Is_GFMlot_toSpec(Lot, ''HPA-MS-103                    '', '''') AS MS_103, dbo.f_Is_GFMlot_toSpec(Lot, 
                                                   ''HPA-MS-104                    '', '''') AS MS_104, dbo.f_Is_GFMlot_toSpec(Lot, ''HPA-MS-105                    '', '''') AS MS_105, dbo.f_Is_GFMlot_toSpec(Lot, ''HPA-MS-106                    '', '''') AS MS_106
                          FROM            dbo.GFMlog AS GFMlog_6
                          WHERE        (Tensile6 > 0)
                          UNION
                          SELECT        7 AS RowNum, AlloyName AS Alloy, Heat, Lot, Spec, Tensile7 AS UTS, Yield7 AS YLD, Elongation7 AS EL, Red_Area7 AS RA, ISNULL(tLoc7, '''') AS tLoc, '''' AS HR, 0 AS BHN, Date AS LogDate, sSize, 
                                                   CASE WHEN GFMSize > 0 THEN GFMSize ELSE fSize END AS fSize, CASE WHEN ColdWork > 0 THEN ColdWork ELSE 0 END AS ColdWork, sWeight, dbo.f_Is_GFMlot_toSpec(Lot, ''HPA-MS-101                    '', '''') 
                                                   AS MS_101, dbo.f_Is_GFMlot_toSpec(Lot, ''HPA-MS-102                    '', '''') AS MS_102, dbo.f_Is_GFMlot_toSpec(Lot, ''HPA-MS-103                    '', '''') AS MS_103, dbo.f_Is_GFMlot_toSpec(Lot, ''HPA-MS-104                    '', '''') 
                                                   AS MS_104, dbo.f_Is_GFMlot_toSpec(Lot, ''HPA-MS-105                    '', '''') AS MS_105, dbo.f_Is_GFMlot_toSpec(Lot, ''HPA-MS-106                    '', '''') AS MS_106
                          FROM            dbo.GFMlog AS GFMlog_7
                          WHERE        (Tensile7 > 0)) AS tmp
' 
GO
/****** Object:  View [dbo].[BI_Quotes_1Year_Mn]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[BI_Quotes_1Year_Mn]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[BI_Quotes_1Year_Mn]
AS
SELECT        TOP (100) PERCENT YEARMN, Alloy, Form, Thck, TotalPoundsQuoted, Counted,
                             (SELECT        COUNT(*) AS Expr1
                               FROM            dbo.AllQuotes AS A2
                               WHERE        (dbo.f_get_Year_Month(QuoteDate) = t.YEARMN) AND (Alloy = t.Alloy) AND (Form = t.Form) AND (Thck = t.Thck) AND (SalesNum > 0)) AS Sold
FROM            (SELECT        dbo.f_get_Year_Month(QuoteDate) AS YEARMN, Alloy, Form, Thck, SUM(Q_QTY) AS TotalPoundsQuoted, COUNT(*) AS Counted
                          FROM            dbo.AllQuotes
                          WHERE        (QuoteDate >= GETDATE() - 365) AND (LEN(Alloy) > 0) AND (Q_QTY > 0)
                          GROUP BY dbo.f_get_Year_Month(QuoteDate), Alloy, Form, Thck) AS t
ORDER BY YEARMN DESC, Alloy, Form, Thck
' 
GO
/****** Object:  View [dbo].[v_VendorApprovals]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_VendorApprovals]'))
EXEC dbo.sp_executesql @statement = N'/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[v_VendorApprovals]
AS
SELECT TOP (100) PERCENT VendCode, Company, contactName, contactEmail, Inactive, [Calculated Approval], [Calculated Approval Note], [VQS Approved], [Survey Last Used Date], [Survey Approved Date], [Conflict Minerals Bound], 
                  [Conflict Minerals Approved], HasConflictMineralsFile, FilesOK, [Custom Approved], [Custom Approved Notes], [subsidiary of]
FROM     (SELECT TOP (1000) v.VendCode, v.Company, ISNULL(vc.Contact, ''[No default quality contact]'') AS contactName, ISNULL(vc.Email, ''QA@ERP_1s.com'') AS contactEmail, v.Inactive, dbo.f_IsVendorAppr(v.VendCode) 
                                    AS [Calculated Approval], dbo.f_VendorApprovalNote(v.VendCode) AS [Calculated Approval Note], ISNULL(vqs.Approved, 0) AS [VQS Approved], vqs.lastUsedDate AS [Survey Last Used Date], 
                                    vqs.ApprovedDate AS [Survey Approved Date], ISNULL(v.DRC_Free, 0) AS [Conflict Minerals Bound], ISNULL(vcmf.Approved, 0) AS [Conflict Minerals Approved], dbo.f_HasConflictMineralsFile(v.VendCode) 
                                    AS HasConflictMineralsFile, dbo.f_AreCertsValid(v.VendCode) AS FilesOK, v.QAApproved AS [Custom Approved], v.QAApprovalNotes AS [Custom Approved Notes], v.[subsidiary of]
                  FROM      dbo.Vendor AS v LEFT OUTER JOIN
                                    dbo.VendorQualitySurvey AS vqs ON v.VendCode = vqs.VendCode LEFT OUTER JOIN
                                    dbo.VendorConflictMineralsFree AS vcmf ON v.VendCode = vcmf.VendCode LEFT OUTER JOIN
                                    dbo.VendorContact AS vc ON v.QASurveyContactID = vc.ContactID) AS q
ORDER BY Company
' 
GO
/****** Object:  View [dbo].[BI_Quotes_90_wk]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[BI_Quotes_90_wk]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[BI_Quotes_90_wk]
AS
SELECT        TOP (100) PERCENT DATEPART(wk, QuoteDate) AS WeekNo, Alloy, Form, Thck, SUM(Q_QTY) AS TotalPoundsQuoted, COUNT(*) AS Counted
FROM            dbo.AllQuotes
WHERE        (QuoteDate >= GETDATE() - 90) AND (LEN(Alloy) > 0)
GROUP BY DATEPART(wk, QuoteDate), Alloy, Form, Thck
ORDER BY WeekNo DESC, Alloy, Form, Thck
' 
GO
/****** Object:  View [dbo].[BI_Sales_Late]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[BI_Sales_Late]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[BI_Sales_Late]
AS
SELECT        TOP (100) PERCENT S.SOitem, S.SalesNum, S.Item, S.Inv, S.GFM, S.Roll, S.Press, S.Mach, S.CG, S.Plasma, S.WJet, S.ItemTot, S.ShipDue, S.Shipped, S.MatlWt, S.cncld, S.cmplt, S.ItemCost, S.ItemSale, S.StkCost, S.POCost, 
                         S.RMA_No, S.pOther, S.Other, S.ShipOn, S.ProcLoc, CAST(S.Quoted_QTY AS Numeric(7, 1)) AS Quoted_QTY, S.Quoted_P, S.Quoted_Total, S.Quoted_PU, S.dShip, S.Typ, S.WO, S.StkPaid, S.WO_Detail, S.ProductionWO, S.Export, 
                         S.InqNumP, AQ.Alloy, AQ.Form, AQ.CC, AQ.CL, AQ.Thck, AQ.Pieces, AQ.Descript, AQ.SalesP, AQ.POitem, AQ.SaleDate, AQ.ShipDate, AQ.Services, AQ.Cover, CAST(AQ.Q_QTY AS Numeric(7, 1)) AS Q_QTY, AQ.Q_Total, 
                         AQ.StandardSize, AQ.DescriptID, dbo.f_get_Year_Month(AQ.ShipDate) AS YearMn, dbo.f_get_Year_Qtr(AQ.ShipDate) AS YearQ, dbo.f_BestDate(S.Shipped, S.ShipDue) AS Ship_Date, CAST(ROUND(CASE WHEN ISNULL(Thck, 0) 
                         > 999 THEN 999 ELSE ISNULL(AQ.StandardSize, 0) END, 1) AS Numeric(4, 1)) AS StdSize, SN.ECPC, SN.DPAS, SN.FCI, SN.GOV, SN.pshipaddr, SN.CustID, SA.st, AQ.Company, SA.zip, SA.country, AQ.Email, SN.usa, SN.blind, 
                         S.Draw, S.ColdSaw, S.Urgent, S.Hold, AQ.RandLen, SN.shiproute, SN.shippay, SN.paytype, SN.freightest, SN.EverPrint, SN.printedso, SN.amendment, SN.ShopRecv, SN.Changing, S.S_QTY, S.S_PU, S.S_P, S.S_Total
FROM            dbo.Sales AS S WITH (NOLOCK) INNER JOIN
                         dbo.AllQuotes AS AQ WITH (NOLOCK) ON S.SOitem = AQ.SOitem INNER JOIN
                         dbo.Sales_No AS SN WITH (NOLOCK) ON S.SalesNum = SN.salesnum LEFT OUTER JOIN
                         dbo.ShipAddr AS SA ON SN.pshipaddr = SA.shipcode
WHERE        (ISNULL(S.cncld, 0) = 0) AND (ISNULL(S.cmplt, 0) = 0) AND (S.ShipDue < GETDATE()) AND (S.ShipOn = 0) OR
                         (ISNULL(S.cncld, 0) = 0) AND (ISNULL(S.cmplt, 0) = 0) AND (S.ShipDue < GETDATE() + 7) AND (S.ShipOn = 1)
ORDER BY S.SalesNum
' 
GO
/****** Object:  View [dbo].[v_GFM_Die_Repair_Log]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_GFM_Die_Repair_Log]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_GFM_Die_Repair_Log]
AS
SELECT        dbo.GFM_Die_Repair.RepairID, dbo.GFM_Die_Repair.RepairDate, dbo.GFM_Die_Repair.DieHeight AS NewDieHeight, dbo.GFM_Die_Repair.PreGrindTime, dbo.GFM_Die_Repair.WeldTime, 
                         dbo.GFM_Die_Repair.FinishGrindTime, dbo.GFM_Die_Repair.TotalTime, dbo.GFM_Die_Repair.EstWeldRodWeight, dbo.GFM_Die_Repair.Welder, dbo.GFM_Die_Repair.[When] AS RepairRecorded, 
                         dbo.GFM_Die_Repair.Who AS RepairRecordedBy, dbo.GFM_Die_Repair.SO, dbo.GFM_Die_Repair.Notes, dbo.GFM_Die_Inventory.DieID, dbo.GFM_Die_Inventory.[Die Set], dbo.GFM_Die_Inventory.GFM, 
                         dbo.GFM_Die_Inventory.Who, dbo.GFM_Die_Inventory.[When], dbo.GFM_Die_Inventory.DieAlloy, dbo.GFM_Die_Inventory.DieStamp, dbo.GFM_Die_Inventory.RangeMin, dbo.GFM_Die_Inventory.RangeMax, 
                         dbo.GFM_Die_Inventory.Condition, dbo.GFM_Die_Inventory.Inactive, dbo.GFM_Die_Inventory.LastInspection, dbo.GFM_Die_Inventory.ChangeLog, dbo.GFM_Die_Inventory.Hot, dbo.GFM_Die_Inventory.Cold, 
                         dbo.GFM_Die_Inventory.LandingSize, dbo.GFM_Die_Inventory.OriginalPurchaseOrder, dbo.GFM_Die_Inventory.DieHeight
FROM            dbo.GFM_Die_Inventory INNER JOIN
                         dbo.GFM_Die_Repair ON dbo.GFM_Die_Inventory.DieID = dbo.GFM_Die_Repair.DieID
' 
GO
/****** Object:  View [dbo].[v_TimeClock_ShopEmployees]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_TimeClock_ShopEmployees]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_TimeClock_ShopEmployees]
AS
SELECT DISTINCT TOP (1000) EmployeeId, FirstName + '' '' + LastName AS FullName, ''7'' AS JobCodeId
FROM     dbo.TC_Replacement_Employees AS tcr
WHERE  (LOWER(RTRIM(Position)) = LOWER(''Shop'')) AND (DateLeft IS NULL) AND (ISNULL(IsSuspended, CONVERT(bit, 0)) = 0)
' 
GO
/****** Object:  View [dbo].[v_OTView_Admin]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_OTView_Admin]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_OTView_Admin]
AS
SELECT        TrackId, TypeAbr, OrderNumber, JobId, Description, status, time
FROM            (SELECT        o.TrackId, otot.TypeAbr, o.OrderNumber, o.JobId, otj.Description,
                                                        (SELECT        TOP (1) CASE WHEN ott.Stop_StatusId IS NULL THEN otts1.Status ELSE otts2.Status END AS Expr1
                                                          FROM            dbo.OT_Times AS ott INNER JOIN
                                                                                    dbo.OT_Times_Status AS otts1 ON ott.Start_StatusId = otts1.StatusId LEFT OUTER JOIN
                                                                                    dbo.OT_Times_Status AS otts2 ON ott.Stop_StatusId = otts2.StatusId
                                                          WHERE        (ott.StartTime > GETDATE() - 365) AND (ott.TrackId = o.TrackId)
                                                          ORDER BY ott.TimeId DESC) AS status,
                                                        (SELECT        TOP (1) ISNULL(StopTime, StartTime) AS Expr1
                                                          FROM            dbo.OT_Times AS ott
                                                          WHERE        (StartTime > GETDATE() - 365) AND (TrackId = o.TrackId)
                                                          ORDER BY TimeId DESC) AS time
                          FROM            dbo.OT AS o LEFT OUTER JOIN
                                                    dbo.OT_OrderType AS otot ON o.OrderTypeId = otot.OrderTypeId INNER JOIN
                                                    dbo.OT_Job AS otj ON o.JobId = otj.JobId
                          GROUP BY o.OrderNumber, o.JobId, otj.Description, o.TrackId, otot.TypeAbr) AS o_1
WHERE        (time > DATEADD(year, - 1, GETDATE()))
' 
GO
/****** Object:  View [dbo].[BI_Sales_SpaceX]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[BI_Sales_SpaceX]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[BI_Sales_SpaceX]
AS
SELECT TOP (100) PERCENT AQ.Alloy, AQ.Form, dbo.f_SPX_Gr(AQ.CC, AQ.CL, AQ.Descript, AQ.Comments) AS SPX, AQ.Thck, AQ.Pieces, AQ.Descript, AQ.SalesP, AQ.SaleDate, AQ.Cover, CAST(AQ.Q_QTY AS Numeric(7, 1)) AS Q_QTY, AQ.Q_Total, AQ.StandardSize, AQ.DescriptID, 
             dbo.f_get_Year_Month(AQ.ShipDate) AS YearMn, dbo.f_get_Year_Qtr(AQ.ShipDate) AS YearQ, CAST(ROUND(CASE WHEN ISNULL(Thck, 0) > 999 THEN 999 ELSE ISNULL(AQ.StandardSize, 0) END, 1) AS Numeric(4, 1)) AS StdSize, AQ.Sz2, AQ.Sz3, AQ.Weight, AQ.SalesNum, AQ.SOitem, 
             YEAR(S.Shipped) AS Year, S.cmplt, S.ShipDue, S.RMA_No
             --, CAST(S.PT_QTY AS Numeric(7, 1)) AS PT_QTY
             , S.Shipped, AQ.CustID, AQ.Company, S.SalesNum AS Expr1
FROM   dbo.AllQuotes AS AQ WITH (NOLOCK) INNER JOIN
             dbo.Sales AS S ON AQ.SOitem = S.SOitem
WHERE (AQ.SalesNum > 0) AND (AQ.Alloy = ''HPA N60     '') AND (dbo.f_SPX_Gr(AQ.CC, AQ.CL, AQ.Descript, AQ.Comments) > 0) AND (S.cncld = 0)
' 
GO
/****** Object:  View [dbo].[vSales_BrokerLst2]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSales_BrokerLst2]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vSales_BrokerLst2]
AS
SELECT     TOP (100) PERCENT M.Alloy, M.Form, M.CC, M.CL, M.Size, CAST(D.Weight AS DECIMAL(9, 0)) AS dWeight, M.Cond, M.Specs, M.Heat, M.Lot, M.Paid, M.ID, CASE WHEN poduedate = ''01/01/1900'' THEN CONVERT(CHAR(10), '' '', 101) ELSE CONVERT(CHAR(10), PoDueDate, 101) 
                  END AS cPODueDate, M.Mill, M.History, M.Num, M.PO_item, D.PC, D.Size_H, D.Dim1, D.Size_L, D.Dim2, D.Dim3, D.Length, CAST(ISNULL(D.Weight, 0) AS DECIMAL(9, 1)) AS weight, D.CostValue, D.Descript, D.Location, D.FloorStatus, D.Class, D.Unit, M.Melt,
                      (SELECT     COUNT(*) AS Expr1
                       FROM        dbo.BrokerLst_Process AS SP WITH (NOLOCK)
                       WHERE     (D.ID_Detail = ID_Detail) AND (Process_ID = ''SELECTED'') AND (SOitem <> ''STOCK'')) AS Prc, 1 AS Bkr, D.ID_Detail, M.POStatus, M.FROM_ID, CASE WHEN stkdate = ''01/01/1900'' THEN CONVERT(CHAR(10), '' '', 101) ELSE CONVERT(CHAR(10), stkdate, 101) END AS cStkDate, 
                  ISNULL(D.ReceivingID, 0) AS ReceivingID, D.RandLen, ISNULL(M.BrandName, '''') AS BrandName, CONVERT(CHAR(10), D.InvCheck, 101) AS cInvCheck, C.CCSortValue, D.Quarantine, dbo.Forms.FormSort, D.InvCheck, 0 AS SelectQTY, dbo.f_CC_CLsort(M.CC, M.CL) AS CCCL, C.CCSort, 
                  M.MillTrace
FROM        dbo.BrokerLst_Master AS M WITH (NOLOCK) INNER JOIN
                  dbo.BrokerLst_Detail AS D WITH (NOLOCK) ON M.ID = D.ID INNER JOIN
                  dbo.ConditionCode AS C WITH (NOLOCK) ON M.CC = C.CC INNER JOIN
                  dbo.Forms WITH (NOLOCK) ON M.Form = dbo.Forms.FormNumber
' 
GO
/****** Object:  View [dbo].[v_Forms_Online]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_Forms_Online]'))
EXEC dbo.sp_executesql @statement = N'/*AND (FormNumber <> 50)*/
CREATE VIEW [dbo].[v_Forms_Online]
AS
SELECT        TOP (1000) FormNumber, FormDescription
FROM            dbo.Forms WITH (NOLOCK)
WHERE        (FormNumber <> 0) AND (FormNumber <> 50) AND (FormNumber <> 23)
' 
GO
/****** Object:  View [dbo].[vPriceTable]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vPriceTable]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vPriceTable]
AS
SELECT        alloy, form, cc, thk, size, size2, w0, w5, w10, w25, w50, w100, w200, w500, w1000, w2000, wBASE, activepric, lastedit
FROM            dbo.PriceTable WITH(NOLOCK) 
UNION
SELECT        alloy, form, ''A'' AS cc, thk, size, size2, w0 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''A''), w5 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''A''), w10 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''A''), w25 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''A''), 
                         w50 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''A''), w100 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''A''), w200 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''A''), w500 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''A''), w1000 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''A''), 
                         w2000 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''A''), wBASE * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''A''), 1 AS Activepric, GetDate() AS lastedit
FROM            dbo.PriceTable WITH(NOLOCK) 
WHERE        alloy = ''HPA N60'' AND Form = ''10'' AND cc = ''2''
UNION
SELECT        alloy, form, ''B'' AS cc, thk, size, size2, w0 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''B''), w5 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''B''), w10 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''B''), w25 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''B''), 
                         w50 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''B''), w100 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''B''), w200 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''B''), w500 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''B''), w1000 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''B''), 
                         w2000 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''B''), wBASE * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''B''), 1 AS Activepric, GetDate() AS lastedit
FROM            dbo.PriceTable WITH(NOLOCK) 
WHERE        alloy = ''HPA N60'' AND Form = ''10'' AND cc = ''2''
UNION
SELECT        alloy, form, ''C'' AS cc, thk, size, size2, w0 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''C''), w5 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''C''), w10 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''C''), w25 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''C''), 
                         w50 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''C''), w100 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''C''), w200 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''C''), w500 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''C''), w1000 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''C''), 
                         w2000 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''C''), wBASE * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''C''), 1 AS Activepric, GetDate() AS lastedit
FROM            dbo.PriceTable WITH(NOLOCK) 
WHERE        alloy = ''HPA N60'' AND Form = ''10'' AND cc = ''2''
UNION
SELECT        alloy, form, ''D'' AS cc, thk, size, size2, w0 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''D''), w5 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''D''), w10 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''D''), w25 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''D''), 
                         w50 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''D''), w100 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''D''), w200 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''D''), w500 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''D''), w1000 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''D''), 
                         w2000 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''D''), wBASE * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''D''), 1 AS Activepric, GetDate() AS lastedit
FROM            dbo.PriceTable WITH(NOLOCK) 
WHERE        alloy = ''HPA N60'' AND Form = ''10'' AND cc = ''2''
UNION
SELECT        alloy, form, ''E'' AS cc, thk, size, size2, w0 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''E''), w5 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''E''), w10 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''E''), w25 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''E''), 
                         w50 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''E''), w100 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''E''), w200 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''E''), w500 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''E''), w1000 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''E''), 
                         w2000 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''E''), wBASE * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''E''), 1 AS Activepric, GetDate() AS lastedit
FROM            dbo.PriceTable WITH(NOLOCK) 
WHERE        alloy = ''HPA N60'' AND Form = ''10'' AND cc = ''2''
UNION
SELECT        alloy, form, ''F'' AS cc, thk, size, size2, w0 * dbo.f_CC_Adjust(''HPA N60'', ''40'', ''F''), w5 * dbo.f_CC_Adjust(''HPA N60'', ''40'', ''F''), w10 * dbo.f_CC_Adjust(''HPA N60'', ''40'', ''F''), w25 * dbo.f_CC_Adjust(''HPA N60'', ''40'', ''F''), 
                         w50 * dbo.f_CC_Adjust(''HPA N60'', ''40'', ''F''), w100 * dbo.f_CC_Adjust(''HPA N60'', ''40'', ''F''), w200 * dbo.f_CC_Adjust(''HPA N60'', ''40'', ''F''), w500 * dbo.f_CC_Adjust(''HPA N60'', ''40'', ''F''), w1000 * dbo.f_CC_Adjust(''HPA N60'', ''40'', ''F''), 
                         w2000 * dbo.f_CC_Adjust(''HPA N60'', ''40'', ''F''), wBASE * dbo.f_CC_Adjust(''HPA N60'', ''40'', ''F''), 1 AS Activepric, GetDate() AS lastedit
FROM            dbo.PriceTable WITH(NOLOCK) 
WHERE        alloy = ''HPA N60'' AND Form = ''40'' AND cc = ''2''
UNION
SELECT        alloy, form, ''S'' AS cc, thk, size, size2, w0 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''S''), w5 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''S''), w10 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''S''), w25 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''S''), 
                         w50 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''S''), w100 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''S''), w200 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''S''), w500 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''S''), w1000 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''S''), 
                         w2000 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''S''), wBASE * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''S''), 1 AS Activepric, GetDate() AS lastedit
FROM            dbo.PriceTable WITH(NOLOCK) 
WHERE        alloy = ''HPA N60'' AND Form = ''10'' AND cc = ''2''
UNION
SELECT        alloy, form, ''T'' AS cc, thk, size, size2, w0 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''T''), w5 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''T''), w10 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''T''), w25 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''T''), 
                         w50 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''T''), w100 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''T''), w200 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''T''), w500 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''T''), w1000 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''T''), 
                         w2000 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''T''), wBASE * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''T''), 1 AS Activepric, GetDate() AS lastedit
FROM            dbo.PriceTable WITH(NOLOCK) 
WHERE        alloy = ''HPA N60'' AND Form = ''10'' AND cc = ''2''
UNION
SELECT        alloy, form, ''U'' AS cc, thk, size, size2, w0 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''U''), w5 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''U''), w10 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''U''), w25 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''U''), 
                         w50 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''U''), w100 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''U''), w200 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''U''), w500 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''U''), w1000 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''U''), 
                         w2000 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''U''), wBASE * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''U''), 1 AS Activepric, GetDate() AS lastedit
FROM            dbo.PriceTable WITH(NOLOCK) 
WHERE        alloy = ''HPA N60'' AND Form = ''10'' AND cc = ''2''
UNION
SELECT        alloy, form, ''V'' AS cc, thk, size, size2, w0 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''V''), w5 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''V''), w10 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''V''), w25 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''V''), 
                         w50 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''V''), w100 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''V''), w200 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''V''), w500 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''V''), w1000 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''V''), 
                         w2000 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''V''), wBASE * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''V''), 1 AS Activepric, GetDate() AS lastedit
FROM            dbo.PriceTable WITH(NOLOCK) 
WHERE        alloy = ''HPA N60'' AND Form = ''10'' AND cc = ''2''
UNION
SELECT        alloy, form, ''W'' AS cc, thk, size, size2, w0 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''W''), w5 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''W''), w10 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''W''), w25 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''W''), 
                         w50 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''W''), w100 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''W''), w200 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''W''), w500 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''W''), w1000 * dbo.f_CC_Adjust(''HPA N60'', ''10'', 
                         ''W''), w2000 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''W''), wBASE * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''W''), 1 AS Activepric, GetDate() AS lastedit
FROM            dbo.PriceTable WITH(NOLOCK) 
WHERE        alloy = ''HPA N60'' AND Form = ''10'' AND cc = ''2''
UNION
SELECT        alloy, form, ''X'' AS cc, thk, size, size2, w0 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''X''), w5 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''X''), w10 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''X''), w25 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''X''), 
                         w50 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''X''), w100 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''X''), w200 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''X''), w500 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''X''), w1000 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''X''), 
                         w2000 * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''X''), wBASE * dbo.f_CC_Adjust(''HPA N60'', ''10'', ''X''), 1 AS Activepric, GetDate() AS lastedit
FROM            dbo.PriceTable WITH(NOLOCK) 
WHERE        alloy = ''HPA N60'' AND Form = ''10'' AND cc = ''2''
UNION
SELECT        alloy, form, ''R'' AS cc, thk, size, size2, w0, w5, w10, w25, w50, w100, w200, w500, w1000, w2000, wBASE, 1 AS Activepric, GetDate() AS lastedit
FROM            dbo.PriceTable WITH(NOLOCK) 
WHERE        alloy = ''HPA N50'' AND Form = ''10'' AND cc = ''1''
UNION
SELECT        alloy, form, ''A'' AS cc, thk, size, size2, w0 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''A''), w5 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''A''), w10 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''A''), w25 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''A''), 
                         w50 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''A''), w100 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''A''), w200 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''A''), w500 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''A''), w1000 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''A''), 
                         w2000 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''A''), wBASE * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''A''), 1 AS Activepric, GetDate() AS lastedit
FROM            dbo.PriceTable WITH(NOLOCK) 
WHERE        alloy = ''HPA N50'' AND Form = ''10'' AND cc = ''2''
UNION
SELECT        alloy, form, ''B'' AS cc, thk, size, size2, w0 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''B''), w5 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''B''), w10 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''B''), w25 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''B''), 
                         w50 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''B''), w100 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''B''), w200 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''B''), w500 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''B''), w1000 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''B''), 
                         w2000 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''B''), wBASE * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''B''), 1 AS Activepric, GetDate() AS lastedit
FROM            dbo.PriceTable WITH(NOLOCK) 
WHERE        alloy = ''HPA N50'' AND Form = ''10'' AND cc = ''2''
UNION
SELECT        alloy, form, ''C'' AS cc, thk, size, size2, w0 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''C''), w5 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''C''), w10 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''C''), w25 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''C''), 
                         w50 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''C''), w100 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''C''), w200 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''C''), w500 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''C''), w1000 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''C''), 
                         w2000 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''C''), wBASE * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''C''), 1 AS Activepric, GetDate() AS lastedit
FROM            dbo.PriceTable WITH(NOLOCK) 
WHERE        alloy = ''HPA N50'' AND Form = ''10'' AND cc = ''2''
UNION
SELECT        alloy, form, ''D'' AS cc, thk, size, size2, w0 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''D''), w5 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''D''), w10 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''D''), w25 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''D''), 
                         w50 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''D''), w100 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''D''), w200 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''D''), w500 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''D''), w1000 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''D''), 
                         w2000 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''D''), wBASE * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''D''), 1 AS Activepric, GetDate() AS lastedit
FROM            dbo.PriceTable WITH(NOLOCK) 
WHERE        alloy = ''HPA N50'' AND Form = ''10'' AND cc = ''2''
UNION
SELECT        alloy, form, ''E'' AS cc, thk, size, size2, w0 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''E''), w5 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''E''), w10 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''E''), w25 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''E''), 
                         w50 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''E''), w100 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''E''), w200 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''E''), w500 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''E''), w1000 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''E''), 
                         w2000 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''E''), wBASE * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''E''), 1 AS Activepric, GetDate() AS lastedit
FROM            dbo.PriceTable WITH(NOLOCK) 
WHERE        alloy = ''HPA N50'' AND Form = ''10'' AND cc = ''2''
UNION
SELECT        alloy, form, ''F'' AS cc, thk, size, size2, w0 * dbo.f_CC_Adjust(''HPA N50'', ''40'', ''F''), w5 * dbo.f_CC_Adjust(''HPA N50'', ''40'', ''F''), w10 * dbo.f_CC_Adjust(''HPA N50'', ''40'', ''F''), w25 * dbo.f_CC_Adjust(''HPA N50'', ''40'', ''F''), 
                         w50 * dbo.f_CC_Adjust(''HPA N50'', ''40'', ''F''), w100 * dbo.f_CC_Adjust(''HPA N50'', ''40'', ''F''), w200 * dbo.f_CC_Adjust(''HPA N50'', ''40'', ''F''), w500 * dbo.f_CC_Adjust(''HPA N50'', ''40'', ''F''), w1000 * dbo.f_CC_Adjust(''HPA N50'', ''40'', ''F''), 
                         w2000 * dbo.f_CC_Adjust(''HPA N50'', ''40'', ''F''), wBASE * dbo.f_CC_Adjust(''HPA N50'', ''40'', ''F''), 1 AS Activepric, GetDate() AS lastedit
FROM            dbo.PriceTable WITH(NOLOCK) 
WHERE        alloy = ''HPA N50'' AND Form = ''40'' AND cc = ''2''
UNION
SELECT        alloy, form, ''S'' AS cc, thk, size, size2, w0 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''S''), w5 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''S''), w10 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''S''), w25 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''S''), 
                         w50 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''S''), w100 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''S''), w200 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''S''), w500 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''S''), w1000 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''S''), 
                         w2000 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''S''), wBASE * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''S''), 1 AS Activepric, GetDate() AS lastedit
FROM            dbo.PriceTable WITH(NOLOCK) 
WHERE        alloy = ''HPA N50'' AND Form = ''10'' AND cc = ''2''
UNION
SELECT        alloy, form, ''T'' AS cc, thk, size, size2, w0 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''T''), w5 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''T''), w10 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''T''), w25 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''T''), 
                         w50 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''T''), w100 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''T''), w200 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''T''), w500 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''T''), w1000 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''T''), 
                         w2000 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''T''), wBASE * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''T''), 1 AS Activepric, GetDate() AS lastedit
FROM            dbo.PriceTable WITH(NOLOCK) 
WHERE        alloy = ''HPA N50'' AND Form = ''10'' AND cc = ''2''
UNION
SELECT        alloy, form, ''U'' AS cc, thk, size, size2, w0 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''U''), w5 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''U''), w10 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''U''), w25 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''U''), 
                         w50 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''U''), w100 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''U''), w200 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''U''), w500 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''U''), w1000 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''U''), 
                         w2000 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''U''), wBASE * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''U''), 1 AS Activepric, GetDate() AS lastedit
FROM            dbo.PriceTable WITH(NOLOCK) 
WHERE        alloy = ''HPA N50'' AND Form = ''10'' AND cc = ''2''
UNION
SELECT        alloy, form, ''V'' AS cc, thk, size, size2, w0 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''V''), w5 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''V''), w10 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''V''), w25 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''V''), 
                         w50 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''V''), w100 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''V''), w200 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''V''), w500 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''V''), w1000 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''V''), 
                         w2000 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''V''), wBASE * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''V''), 1 AS Activepric, GetDate() AS lastedit
FROM            dbo.PriceTable WITH(NOLOCK) 
WHERE        alloy = ''HPA N50'' AND Form = ''10'' AND cc = ''2''
UNION
SELECT        alloy, form, ''W'' AS cc, thk, size, size2, w0 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''W''), w5 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''W''), w10 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''W''), w25 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''W''), 
                         w50 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''W''), w100 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''W''), w200 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''W''), w500 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''W''), w1000 * dbo.f_CC_Adjust(''HPA N50'', ''10'', 
                         ''W''), w2000 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''W''), wBASE * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''W''), 1 AS Activepric, GetDate() AS lastedit
FROM            dbo.PriceTable WITH(NOLOCK) 
WHERE        alloy = ''HPA N50'' AND Form = ''10'' AND cc = ''2''
UNION
SELECT        alloy, form, ''X'' AS cc, thk, size, size2, w0 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''X''), w5 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''X''), w10 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''X''), w25 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''X''), 
                         w50 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''X''), w100 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''X''), w200 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''X''), w500 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''X''), w1000 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''X''), 
                         w2000 * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''X''), wBASE * dbo.f_CC_Adjust(''HPA N50'', ''10'', ''X''), 1 AS Activepric, GetDate() AS lastedit
FROM            dbo.PriceTable WITH(NOLOCK) 
WHERE        alloy = ''HPA N50'' AND Form = ''10'' AND cc = ''2''
' 
GO
/****** Object:  View [dbo].[vWO]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vWO]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vWO]
AS
SELECT   WO.WO, WO.EnterDate, WO.SalesRep, WO.StartDate, WO.DueDate, WO.FinishDate, WO.Descript, WO.SOitem, WO.POitem, WO.sPieces, WO.sAlloy, WO.sForm, WO.sCC, WO.sCL, WO.sThck, 
                         WO.sSz2, WO.sSz3, WO.sWeight, WO.pinSWeight, WO.TBL, WO.sID_Detail, WO.sID_Detail_Process, WO.sReceivingID, WO.IntP, WO.RE, WO.Notes, WO.Cncld, WO.Cmplt, WO.lPrc_Stock, 
                         WO.ItemCost, WO.StkCost, WO.StkConsumed, WO.Who, WO.Changing, WO.ShopRecv, WO.Amendment, WO.RcvdE, WO.PrintedWO, WO.OutSource, WO.MO, WO.sReconciled, WO.sHeat, 
                         WO.sLot, WOD.WO_Detail, WOD.fStartDate, WOD.fDueDate, WOD.fFinishDate, WOD.fDescript, WOD.fInqNumP, WOD.fSOitem, WOD.fPOitem, WOD.fPieces, WOD.fAlloy, WOD.fForm, 
                         WOD.fCC, WOD.fCL, WOD.fThck, WOD.fSz2, WOD.fSz3, WOD.fWeight, WOD.pinFWeight, WOD.TotFinishW, WOD.LostWeight, WOD.fTBL, WOD.fID_Detail, WOD.fID_Detail_Process, 
                         WOD.fReceivingID, WOD.fCmplt, WOD.fIntP, WOD.fNotes, WOD.fCondLevel, WOD.fCncld, WOD.fPrint, WOD.fPRecv, WOD.fMod, WOD.fRev, WOD.stkListed, WOD.Stock_Projected_ID, 
                         WOD.FollowM, WOD.FollowLot, WOD.FinishM, WOD.FinishLot, WOD.StartSize, WOD.CW, WOD.RoughSize, WOD.OverSize, WOD.FSpec, WOD.TestPO, WOD.PassTest, 
                         WOD.RcvdE AS fRcvdE, WOD.DescriptID, WOD.fReconciled, WOD.fHeat, WOD.fLot, WOD.NextCode, WOD.NextNumber
FROM         dbo.WorkOrder AS WO WITH (NOLOCK) INNER JOIN
                         dbo.WorkOrder_Detail AS WOD WITH (NOLOCK) ON WO.WO = WOD.WO
' 
GO
/****** Object:  View [dbo].[v_DRC_Vendors]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_DRC_Vendors]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_DRC_Vendors]
AS
SELECT        vc.ContactID, v.Company + '', '' + vc.Contact + '', '' + vc.Email AS Description, vc.Email, v.Company
FROM            dbo.VendorContact AS vc INNER JOIN
                         dbo.Vendor AS v ON vc.ContactID = v.QASurveyContactID
WHERE        (v.DRC_Free = 1) AND (v.QAApproved = 1) AND (v.Inactive = 0)
' 
GO
/****** Object:  View [dbo].[v_VendorApprovalsNew]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_VendorApprovalsNew]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_VendorApprovalsNew]
AS
SELECT TOP (100) PERCENT VendCode, Company, contactName, contactEmail, Inactive, [Calculated Approval], [Calculated Approval Note], Registered, [VQS Approved], [Survey Last Used Date], [Survey Approved Date], [Conflict Minerals Bound], 
                  [Conflict Minerals Approved], HasConflictMineralsFile, FilesOK, [Custom Approved], [Custom Approved Notes], [subsidiary of], VQS_NotRequired
FROM     (SELECT TOP (1000) v.VendCode, v.Company, ISNULL(vc.Contact, ''[No default quality contact]'') AS contactName, ISNULL(vc.Email, ''QA@ERP_1s.com'') AS contactEmail, v.Inactive, dbo.f_IsVendorAppr(v.VendCode) 
                                    AS [Calculated Approval], dbo.f_VendorApprovalNote(v.VendCode) AS [Calculated Approval Note], ISNULL(vqs.Registered, 1) AS Registered, ISNULL(vqs.Approved, 0) AS [VQS Approved], 
                                    vqs.lastUsedDate AS [Survey Last Used Date], vqs.ApprovedDate AS [Survey Approved Date], ISNULL(v.DRC_Free, 0) AS [Conflict Minerals Bound], ISNULL(vcmf.Approved, 0) AS [Conflict Minerals Approved], 
                                    dbo.f_HasConflictMineralsFile(v.VendCode) AS HasConflictMineralsFile, dbo.f_AreCertsValid(v.VendCode) AS FilesOK, v.QAApproved AS [Custom Approved], 
                                    v.QAApprovalNotes AS [Custom Approved Notes], v.[subsidiary of], v.VQS_NotRequired
                  FROM      dbo.Vendor AS v LEFT OUTER JOIN
                                    dbo.VendorQualitySurvey AS vqs ON v.VendCode = vqs.VendCode LEFT OUTER JOIN
                                    dbo.VendorConflictMineralsFree AS vcmf ON v.VendCode = vcmf.VendCode LEFT OUTER JOIN
                                    dbo.VendorContact AS vc ON v.QASurveyContactID = vc.ContactID) AS q
ORDER BY Company
' 
GO
/****** Object:  View [dbo].[DRC_Vendors]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[DRC_Vendors]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[DRC_Vendors]
AS
SELECT        vc.ContactID, v.Company + '', '' + vc.Contact + '', '' + vc.Email AS Description, vc.Email, v.Company
FROM            dbo.VendorContact AS vc WITH (NOLOCK) INNER JOIN
                         dbo.Vendor AS v WITH (NOLOCK) ON vc.ContactID = v.QASurveyContactID
WHERE        (v.DRC_Free = 1)
' 
GO
/****** Object:  View [dbo].[BI_GFM_LMA_Stats]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[BI_GFM_LMA_Stats]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[BI_GFM_LMA_Stats]
AS
SELECT        ID, Lot, CAST([Date] AS DATE) AS [Date], [sSize]
,[GfmSize]  AS [WorkSize]
,(CASE WHEN [fSize]> 0 THEN [fSize] else [GFMsize] end) AS [fSize]
,[ColdWork]
/*****************************************************/ , Tensile, Tensile2, Tensile3, Tensile4, FLOOR
                             ((SELECT        MIN(val)
                                 FROM            (VALUES ([Tensile]), ([Tensile2]), ([Tensile3]), ([Tensile4])) AS v(val)
WHERE        val IS NOT NULL)) AS UTS_Min, FLOOR
    ((SELECT        MAX(val)
        FROM            (VALUES ([Tensile]), ([Tensile2]), ([Tensile3]), ([Tensile4])) AS v(val)
WHERE        val IS NOT NULL)) AS UTS_Max, FLOOR
    ((SELECT        MAX(val)
        FROM            (VALUES ([Tensile]), ([Tensile2]), ([Tensile3]), ([Tensile4])) AS v(val)
WHERE        val IS NOT NULL)) - FLOOR
    ((SELECT        MIN(val)
        FROM            (VALUES ([Tensile]), ([Tensile2]), ([Tensile3]), ([Tensile4])) AS v(val)
WHERE        val IS NOT NULL)) AS UTS_Spread, FLOOR
    ((SELECT        AVG(val)
        FROM            (VALUES ([Tensile]), ([Tensile2]), ([Tensile3]), ([Tensile4])) AS v(val)
WHERE        val IS NOT NULL)) AS UTS_AVG, FLOOR
    ((SELECT        STDEV(val)
        FROM            (VALUES ([Tensile]), ([Tensile2]), ([Tensile3]), ([Tensile4])) AS v(val)
WHERE        val IS NOT NULL)) AS UTS_STDV, FLOOR
    ((SELECT        VAR(val)
        FROM            (VALUES ([Tensile]), ([Tensile2]), ([Tensile3]), ([Tensile4])) AS v(val)
WHERE        val IS NOT NULL)) AS UTS_VAR
/*****************************************************/ , Yield, Yield2, Yield3, Yield4, FLOOR
    ((SELECT        MIN(val)
        FROM            (VALUES ([Yield]), ([Yield2]), ([Yield3]), ([Yield4])) AS v(val)
WHERE        val IS NOT NULL)) AS YLD_Min, FLOOR
    ((SELECT        MAX(val)
        FROM            (VALUES ([Yield]), ([Yield2]), ([Yield3]), ([Yield4])) AS v(val)
WHERE        val IS NOT NULL)) AS YLD_Max, FLOOR
    ((SELECT        MAX(val)
        FROM            (VALUES ([Yield]), ([Yield2]), ([Yield3]), ([Yield4])) AS v(val)
WHERE        val IS NOT NULL)) - FLOOR
    ((SELECT        MIN(val)
        FROM            (VALUES ([Yield]), ([Yield2]), ([Yield3]), ([Yield4])) AS v(val)
WHERE        val IS NOT NULL)) AS YLD_Spread, FLOOR
    ((SELECT        AVG(val)
        FROM            (VALUES ([Yield]), ([Yield2]), ([Yield3]), ([Yield4])) AS v(val)
WHERE        val IS NOT NULL)) AS YLD_AVG, FLOOR
    ((SELECT        STDEV(val)
        FROM            (VALUES ([Yield]), ([Yield2]), ([Yield3]), ([Yield4])) AS v(val)
WHERE        val IS NOT NULL)) AS YLD_STDV, FLOOR
    ((SELECT        VAR(val)
        FROM            (VALUES ([Yield]), ([Yield2]), ([Yield3]), ([Yield4])) AS v(val)
WHERE        val IS NOT NULL)) AS YLD_VAR
/*--************************************/ , Elongation, Elongation2, Elongation3, Elongation4, FLOOR
    ((SELECT        MIN(val)
        FROM            (VALUES ([Elongation]), ([Elongation2]), ([Elongation3]), ([Elongation4])) AS v(val)
WHERE        val IS NOT NULL)) AS EL_Min, FLOOR
    ((SELECT        MAX(val)
        FROM            (VALUES ([Elongation]), ([Elongation2]), ([Elongation3]), ([Elongation4])) AS v(val)
WHERE        val IS NOT NULL)) AS EL_Max, FLOOR
    ((SELECT        MAX(val)
        FROM            (VALUES ([Elongation]), ([Elongation2]), ([Elongation3]), ([Elongation4])) AS v(val)
WHERE        val IS NOT NULL)) - FLOOR
    ((SELECT        MIN(val)
        FROM            (VALUES ([Elongation]), ([Elongation2]), ([Elongation3]), ([Elongation4])) AS v(val)
WHERE        val IS NOT NULL)) AS EL_Spread, FLOOR
    ((SELECT        AVG(val)
        FROM            (VALUES ([Elongation]), ([Elongation2]), ([Elongation3]), ([Elongation4])) AS v(val)
WHERE        val IS NOT NULL)) AS EL_AVG, FLOOR
    ((SELECT        STDEV(val)
        FROM            (VALUES ([Elongation]), ([Elongation2]), ([Elongation3]), ([Elongation4])) AS v(val)
WHERE        val IS NOT NULL)) AS EL_STDV, FLOOR
    ((SELECT        VAR(val)
        FROM            (VALUES ([Elongation]), ([Elongation2]), ([Elongation3]), ([Elongation4])) AS v(val)
WHERE        val IS NOT NULL)) AS EL_VAR
/*--************************************/ , Red_Area, Red_Area2, Red_Area3, Red_Area4, FLOOR
    ((SELECT        MIN(val)
        FROM            (VALUES ([Red_Area]), ([Red_Area2]), ([Red_Area3]), ([Red_Area4])) AS v(val)
WHERE        val IS NOT NULL)) AS RA_Min, FLOOR
    ((SELECT        MAX(val)
        FROM            (VALUES ([Red_Area]), ([Red_Area2]), ([Red_Area3]), ([Red_Area4])) AS v(val)
WHERE        val IS NOT NULL)) AS RA_Max, FLOOR
    ((SELECT        MAX(val)
        FROM            (VALUES ([Red_Area]), ([Red_Area2]), ([Red_Area3]), ([Red_Area4])) AS v(val)
WHERE        val IS NOT NULL)) - FLOOR
    ((SELECT        MIN(val)
        FROM            (VALUES ([Red_Area]), ([Red_Area2]), ([Red_Area3]), ([Red_Area4])) AS v(val)
WHERE        val IS NOT NULL)) AS RA_Spread, FLOOR
    ((SELECT        AVG(val)
        FROM            (VALUES ([Red_Area]), ([Red_Area2]), ([Red_Area3]), ([Red_Area4])) AS v(val)
WHERE        val IS NOT NULL)) AS RA_AVG, FLOOR
    ((SELECT        STDEV(val)
        FROM            (VALUES ([Red_Area]), ([Red_Area2]), ([Red_Area3]), ([Red_Area4])) AS v(val)
WHERE        val IS NOT NULL)) AS RA_STDV, FLOOR
    ((SELECT        VAR(val)
        FROM            (VALUES ([Red_Area]), ([Red_Area2]), ([Red_Area3]), ([Red_Area4])) AS v(val)
WHERE        val IS NOT NULL)) AS RA_VAR, SOitem
FROM            [dbo].[GFMlog]
WHERE        Tensile > 0 AND Tensile2 > 0 AND Tensile3 > 0 AND Tensile4 > 0 AND ColdWork > 0
' 
GO
/****** Object:  View [dbo].[vLst_Process_Grab]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vLst_Process_Grab]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vLst_Process_Grab]
AS
SELECT        ''S'' AS TBL, dbo.f_ProperSO(G.SOitem) AS SalesNum, G.[SOitem], G.[PO_item], G.[SalesPerson], G.[StartDate], G.[DueDate]
, G.[Comment], G.[Process_ID], G.[Processor], G.[AllowSub]
, G.[PU], G.[QTY], G.[S_P], G.[Ordered_QTY], G.[Ordered_P], G.[Pounds]
, G.[ID_Master], G.[ID_Detail], G.[ID_Detail_Process], G.[ReceivingID], G.[WO], G.[WO_Detail], G.[InqNumP]
, G.[Prc_Form], G.[Prc_PCs], G.[Prc_Dim1], G.[Prc_Dim2], G.[Prc_Dim3], G.[Descript], G.[FoundStk], G.[Gone], G.[MS4O]
, M.Alloy, M.Form, M.Heat, M.Lot, M.CC, M.CL
FROM  dbo.StockLst_Process_Grab G
left outer join dbo.StockLst_Master M WITH(NOLOCK) ON G.ID_Master = M.ID

UNION
SELECT        ''B'' AS TBL, dbo.f_ProperSO(G.SOitem) AS SalesNum, G.[SOitem], G.[PO_item], G.[SalesPerson], G.[StartDate], G.[DueDate]
, G.[Comment], G.[Process_ID], G.[Processor], G.[AllowSub]
, G.[PU], G.[QTY], G.[S_P], G.[Ordered_QTY], G.[Ordered_P], G.[Pounds]
, G.[ID_Master], G.[ID_Detail], G.[ID_Detail_Process], G.[ReceivingID], G.[WO], G.[WO_Detail], G.[InqNumP]
, G.[Prc_Form], G.[Prc_PCs], G.[Prc_Dim1], G.[Prc_Dim2], G.[Prc_Dim3], G.[Descript], G.[FoundStk], G.[Gone], G.[MS4O]
, M.Alloy, M.Form, M.Heat, M.Lot, M.CC, M.CL
FROM  dbo.BrokerLst_Process_Grab G
left outer join dbo.BrokerLst_Master M WITH(NOLOCK) ON G.ID_Master = M.ID

UNION
SELECT        ''W'' AS TBL, dbo.f_ProperSO(G.SOitem) AS SalesNum, G.[SOitem], G.[PO_item], G.[SalesPerson], G.[StartDate], G.[DueDate]
, G.[Comment], G.[Process_ID], G.[Processor], G.[AllowSub]
, G.[PU], G.[QTY], G.[S_P], G.[Ordered_QTY], G.[Ordered_P], G.[Pounds]
, G.[ID_Master], G.[ID_Detail], G.[ID_Detail_Process], G.[ReceivingID], G.[WO], G.[WO_Detail], G.[InqNumP]
, G.[Prc_Form], G.[Prc_PCs], G.[Prc_Dim1], G.[Prc_Dim2], G.[Prc_Dim3], G.[Descript], G.[FoundStk], G.[Gone], G.[MS4O]
, M.Alloy, M.Form, M.Heat, M.Lot, M.CC, M.CL
FROM  dbo.WIPLst_Process_Grab G
left outer join dbo.WIPLst_Master M WITH(NOLOCK) ON G.ID_Master = M.ID

' 
GO
/****** Object:  View [dbo].[BI_SalesRep]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[BI_SalesRep]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[BI_SalesRep]
AS
SELECT        TOP (100) PERCENT un AS SalesRep, ans AS SalesP, ISNULL
                             ((SELECT        1 AS ActiveSales
                                 FROM            dbo.AppSetup AS A2 WITH (NOLOCK)
                                 WHERE        (ans = A.ans) AND (prp = ''ActiveSales'')), 0) AS Active
FROM            dbo.AppSetup AS A WITH (NOLOCK)
WHERE        (prp = ''SalesP  '') AND (ans IN
                             (SELECT DISTINCT ans
                               FROM            dbo.AppSetup AS A3 WITH (NOLOCK)
                               WHERE        (prp = ''SalesP  '')))
ORDER BY Active DESC, SalesP
' 
GO
/****** Object:  View [dbo].[BI_Form]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[BI_Form]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[BI_Form]
AS
SELECT        FormNumber AS Form, FormDescription, Price, PU, Unit, FormSort, Shape
FROM            dbo.Forms WITH (NOLOCK)
' 
GO
/****** Object:  View [dbo].[BI_Alloy]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[BI_Alloy]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[BI_Alloy]
AS
SELECT        alloy, ISNULL(UNS, '''') AS UNS, ISNULL(CertName, '''') AS CertName, ISNULL(PriceName, '''') AS PriceName, ISNULL(HPAcore, 0) AS HPAcore, ISNULL(HPAStock, 0) AS HPAStock
FROM            dbo.Alloy WITH (NOLOCK)
' 
GO
/****** Object:  View [dbo].[SalesOrder]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[SalesOrder]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[SalesOrder]
AS
SELECT        dbo.Sales_No.salesnum, dbo.Sales_No.salesrep, dbo.Sales_No.instrct, dbo.Sales_No.itemtot, dbo.Sales_No.shiproute, dbo.Sales_No.shippay, dbo.Sales_No.paytype, dbo.Sales_No.cmplt, dbo.Sales_No.blind, 
                         dbo.Sales_No.amendment, dbo.Sales.SOitem, dbo.Sales.Item, dbo.Sales.ShipDue, dbo.Sales.Shipped, dbo.Sales.cncld, dbo.Sales.cmplt AS CmpltItem, dbo.Sales.ItemCost, dbo.Sales.ItemSale, 
                         dbo.SoldAddr.company AS SoldComp, dbo.SoldAddr.city AS SoldCity, dbo.SoldAddr.st AS SoldST, dbo.ShipAddr.company AS ShipComp, dbo.ShipAddr.city AS ShipCity, dbo.ShipAddr.st AS ShipST, dbo.AllQuotes.Company, 
                         dbo.AllQuotes.Name, dbo.AllQuotes.Phone, dbo.AllQuotes.Phone_Ext, dbo.AllQuotes.PO_num, dbo.AllQuotes.Alloy, dbo.AllQuotes.Form, dbo.AllQuotes.CC, dbo.AllQuotes.Pieces, dbo.AllQuotes.Thck, dbo.AllQuotes.Sz2, 
                         dbo.AllQuotes.Sz3, dbo.AllQuotes.Weight, dbo.AllQuotes.Descript, dbo.AllQuotes.p_lb, dbo.AllQuotes.p_pc, dbo.AllQuotes.p_ft, dbo.AllQuotes.Cuts, dbo.AllQuotes.OtherFld, dbo.AllQuotes.OtherP, dbo.AllQuotes.LotP, 
                         dbo.AllQuotes.LotCost, dbo.AllQuotes.RandLen, dbo.Sales_No.CustID, dbo.Sales_No.cncld AS Expr1, dbo.Sales_No.ECPC, dbo.Sales_No.DPAS, dbo.Sales_No.FCI, dbo.Sales_No.GOV, dbo.AllQuotes.S_QTY, dbo.AllQuotes.S_P, 
                         dbo.AllQuotes.S_PU, dbo.AllQuotes.S_Total, dbo.AllQuotes.DescriptID
FROM            dbo.Sales_No INNER JOIN
                         dbo.Sales WITH (NOLOCK) ON dbo.Sales_No.salesnum = dbo.Sales.SalesNum INNER JOIN
                         dbo.AllQuotes WITH (NOLOCK) ON dbo.Sales_No.salesnum = dbo.AllQuotes.SalesNum INNER JOIN
                         dbo.SoldAddr WITH (NOLOCK) ON dbo.Sales_No.psoldaddr = dbo.SoldAddr.soldcode INNER JOIN
                         dbo.ShipAddr WITH (NOLOCK) ON dbo.Sales_No.pshipaddr = dbo.ShipAddr.shipcode
' 
GO
/****** Object:  View [dbo].[BI_Purchase]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[BI_Purchase]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[BI_Purchase]
AS
SELECT        POitem, HPApo, ItemPO, SOitem, SalesNum, SalesP, Company, Alloy, Form, CC, CL, OtherP, OtherFld, OrderDate, Due_Min, Due_Max, Received, Receipt, Delivered, Cancelled, POSalesP, Services, ConvServ, Equipment, Stock, 
                         ShipWhere, Metric, StandSize, VendCode, ContactID, HPA_Due_Min, HPA_Due_Max, First_Due_Max, Reconciled, ReconcileTotal, Order_QTY, Order_P, Order_PU, StockLst_QTY, StockLst_P, StockLst_Total, Pounds, WO, Cover, 
                         WO_Detail, CAST(ROUND(CASE WHEN ISNULL(Thck, 0) > 999 THEN 999 ELSE ISNULL(Thck, 0) END, 1) AS Numeric(4, 1)) AS StdSize, dbo.f_BestDate(Received, dbo.f_BestDate(Due_Max, Due_Min)) AS RcvDate, DescriptID, 
                         (CASE WHEN ReconcileTotal > 0 THEN ReconcileTotal ELSE StockLst_Total END) AS Bought,
                             (SELECT        Contact
                               FROM            dbo.VendorContact
                               WHERE        (dbo.PurchaseOrder.ContactID = ContactID)) AS Contact,
                             (SELECT        Phone
                               FROM            dbo.VendorContact AS VendorContact_3
                               WHERE        (dbo.PurchaseOrder.ContactID = ContactID)) AS Phone,
                             (SELECT        Email
                               FROM            dbo.VendorContact AS VendorContact_2
                               WHERE        (dbo.PurchaseOrder.ContactID = ContactID)) AS Email,
                             (SELECT        (CASE WHEN LEN(City) > 0 THEN TRIM(City) + '', '' ELSE '''' END) + TRIM(ST) AS Expr1
                               FROM            dbo.VendorContact AS VendorContact_1
                               WHERE        (dbo.PurchaseOrder.ContactID = ContactID)) AS CityST
FROM            dbo.PurchaseOrder WITH (NOLOCK)
WHERE        (ISNULL(Cancelled, 0) = 0) AND (ISNULL(Equipment, 0) = 0) AND (ISNULL(Services, 0) = 0) AND (ISNULL(ConvServ, 0) = 0) AND (YEAR(OrderDate) >= 2012)
' 
GO
/****** Object:  View [dbo].[BI_Inventory]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[BI_Inventory]'))
EXEC dbo.sp_executesql @statement = N'/*Also see StockLst_Sum*/
CREATE VIEW [dbo].[BI_Inventory]
AS
SELECT        TOP (100) PERCENT m.Alloy, m.Form, m.CC, m.CL, m.Size, SUM(d.S_QTY) AS LBS, SUM(d.S_Total) AS Cost,
                             (SELECT        ISNULL(SUM(D2.S_QTY), 0) AS QTY_Prime
                               FROM            dbo.Stocklst_Master AS M2 WITH (NOLOCK) INNER JOIN
                                                         dbo.StockLst_Detail AS D2 WITH (NOLOCK) ON M2.ID = D2.ID
                               WHERE        (M2.DescriptID = m.DescriptID) AND (D2.Prime = 1)) AS QTY_Prime,
                             (SELECT        ISNULL(SUM(P2.Prc_QTY), 0) AS QTY_Sold
                               FROM            dbo.Stocklst_Master AS M2 WITH (NOLOCK) INNER JOIN
                                                         dbo.StockLst_Detail AS D2 WITH (NOLOCK) ON M2.ID = D2.ID INNER JOIN
                                                         dbo.StockLst_Process AS P2 WITH (NOLOCK) ON D2.ID_Detail = P2.ID_Detail
                               WHERE        (M2.DescriptID = m.DescriptID) AND (P2.Process_ID = ''SELECTED'')) AS QTY_Sold,
                             (SELECT        ISNULL(SUM(P2.QTY), 0) AS QTY_Due
                               FROM            dbo.Stocklst_Master AS M2 WITH (NOLOCK) INNER JOIN
                                                         dbo.StockLst_Detail AS D2 WITH (NOLOCK) ON M2.ID = D2.ID LEFT OUTER JOIN
                                                         dbo.StockLst_Process AS P2 WITH (NOLOCK) ON D2.ID_Detail = P2.ID_Detail
                               WHERE        (M2.DescriptID = m.DescriptID) AND (P2.Process_ID = ''INCOMING'') OR
                                                         (P2.Process_ID = ''PARTRECV'') AND (M2.Alloy = m.Alloy) AND (M2.Form = m.Form) AND (M2.CC = m.CC) AND (M2.Size = m.Size)) AS QTY_Due,
                             (SELECT        ISNULL(SUM(Weight), 0) AS Quoted
                               FROM            dbo.AllQuotes
                               WHERE        (DescriptID = m.DescriptID) AND (InqDate >= GETDATE() - 30)) AS Quoted30, m.DescriptID, CAST(ROUND(CASE WHEN ISNULL(m.Size, 0) > 999 THEN 999 ELSE ISNULL(m.Size, 0) END, 1) AS Numeric(4, 1)) 
                         AS StdSize, m.Heat, d.S_QTY
FROM            dbo.Stocklst_Master AS m WITH (NOLOCK) INNER JOIN
                         dbo.StockLst_Detail AS d WITH (NOLOCK) ON m.ID = d.ID LEFT OUTER JOIN
                         dbo.StockLst_Process AS p WITH (NOLOCK) ON d.ID_Detail = p.ID_Detail
WHERE        (d.Quarantine = 0)
GROUP BY m.Alloy, m.Form, m.CC, m.Size, m.CL, m.DescriptID, m.Heat, d.S_QTY
' 
GO
/****** Object:  View [dbo].[vSales_StockLst2]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSales_StockLst2]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vSales_StockLst2]
AS
SELECT     TOP (100) PERCENT M.alloy, M.form, M.CC, M.CL, M.size, CAST(D .weight AS DECIMAL(9, 0)) AS dWeight, M.cond, M.specs, M.heat, M.lot, M.Paid, M.id, CASE WHEN poduedate = ''01/01/1900'' THEN CONVERT(CHAR(10), '' '', 101) ELSE CONVERT(CHAR(10), PoDueDate, 101) 
                  END AS cPODueDate, M.mill, M.history, M.num, M.po_item, D .pc, D .size_h, D .dim1, D .size_l, D .dim2, D .dim3, D .length, CAST(ISNULL(D .weight, 0) AS DECIMAL(9, 1)) AS weight, D .costvalue, D .descript, D .location, D .floorstatus, D .class, D .unit, M.Melt,
                      (SELECT     COUNT(*) AS Expr1
                       FROM        dbo.StockLst_Process AS SP WITH (NOLOCK)
                       WHERE     (D .id_detail = id_detail) AND (process_id = ''SELECTED'') AND (SOitem != ''STOCK'')) AS Prc, 0 AS Bkr, D .id_detail, M.POStatus, M.FROM_ID, CASE WHEN stkdate = ''01/01/1900'' THEN CONVERT(CHAR(10), '' '', 101) ELSE CONVERT(CHAR(10), stkdate, 101) END AS cStkDate, 
                  ISNULL(D .ReceivingID, 0) AS ReceivingID, D .RandLen, ISNULL(M.BrandName, '''') AS BrandName, CONVERT(CHAR(10), D .InvCheck, 101) AS cInvCheck, C.CCSortValue, D .Quarantine, dbo.Forms.FormSort, D .InvCheck, ISNULL
                      ((SELECT     SUM(SP.QTY)
                        FROM        dbo.StockLst_Process AS SP WITH (NOLOCK)
                        WHERE     (D .id_detail = id_detail) AND (process_id = ''SELECTED'') AND (SOitem != ''STOCK'')), 0) AS SelectQTY, dbo.f_CC_CLsort(M.CC, M.CL) AS CCCL, C.CCSort, M.MillTrace
FROM        dbo.Stocklst_Master AS M WITH (NOLOCK) INNER JOIN
                  dbo.Stocklst_Detail AS D WITH (NOLOCK) ON M.id = D .id INNER JOIN
                  dbo.ConditionCode AS C WITH (NOLOCK) ON M.cc = C.cc INNER JOIN
                  dbo.Forms WITH (NOLOCK) ON M.form = dbo.Forms.FormNumber
UNION
SELECT     W.Alloy, W.Form, W.CC, W.CL, W.Size, CAST(W.MWeight AS DECIMAL(9, 0)) AS dWeight, W.Cond, W.Specs, W.Heat, '''' AS Lot, 0 AS Paid, W.ID, '''' AS cPODueDate, ''Wanted'' AS Mill, ''Item on Want List'' AS History, 0 AS Num, '''' AS PO_item, W.Pc, W.Size AS Size_h, W.Dim1, 
                  W.Size AS Size_l, W.Dim2, W.Dim3, '''' AS [Length], W.MWeight AS [Weight], 0 AS CostValue, W.Descript, ''Wanted'' AS Location, '''' AS FloorStatus, '''' AS Class, '''' AS Unit, '''' AS Melt, 0 AS Prc, 0 AS Bkr, 0 AS ID_Detail, '''' AS POStatus, 0 AS FROM_ID, '''' AS cStkDate, 0 AS ReceivingID, 
                  0 AS RandLen, W.BrandName, CONVERT(CHAR(10), GETDATE() + 1, 101) AS cInvCheck, W.CCSortValue, ''False'' AS Quarantine, W.FormSort, GETDATE() + 1 AS InvCheck, 0 AS SelectQTY, dbo.f_CC_CLsort(W.CC, W.CL) AS CCCL, C.CCSort, 1 AS MillTrace
FROM        dbo.Stocklst_Wants AS W WITH (NOLOCK) INNER JOIN
                  dbo.ConditionCode AS C WITH (NOLOCK) ON W.cc = C.cc
UNION
SELECT     V.Alloy, V.Form, V.CC, V.CL, V.Size, CAST(V.MWeight AS DECIMAL(9, 0)) AS dWeight, V.Cond, V.Specs, V.Heat, '''' AS Lot, 0 AS Paid, V.ID, '''' AS cPODueDate, Mill, ''Item on Mill Stock List'' AS History, 0 AS Num, '''' AS PO_item, V.Pc, V.Size AS Size_h, V.Dim1, V.Size AS Size_l, V.Dim2, V.Dim3, 
                  '''' AS [Length], V.MWeight AS [Weight], 0 AS CostValue, V.Descript, LEFT(V. Vendor, 10) AS Location, '''' AS FloorStatus, '''' AS Class, '''' AS Unit, V.Melt, 0 AS Prc, 0 AS Bkr, 0 AS ID_Detail, '''' AS POStatus, 0 AS FROM_ID, '''' AS cStkDate, 0 AS ReceivingID, 0 AS RandLen, V.BrandName, 
                  CONVERT(CHAR(10), GETDATE() + 2, 101) AS cInvCheck, V.CCSortValue, ''False'' AS Quarantine, V.FormSort, GETDATE() + 2 AS InvCheck, 0 AS SelectQTY, dbo.f_CC_CLsort(V.CC, V.CL) AS CCCL, C.CCSort, 1 AS MillTrace
FROM        dbo.Stocklst_Vendor AS V WITH (NOLOCK) INNER JOIN
                  dbo.ConditionCode AS C WITH (NOLOCK) ON V.cc = C.cc
' 
GO
/****** Object:  View [dbo].[BI_Quote]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[BI_Quote]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[BI_Quote]
AS
SELECT        ISNULL(AQ.Company, '''') AS Company, ISNULL(AQ.Alloy, '''') AS Alloy, ISNULL(AQ.Form, '''') AS Form, ISNULL(AQ.CC, '''') AS CC, ISNULL(AQ.CL, '''') AS CL, ISNULL(AQ.Pieces, 0) AS Pieces, ISNULL(AQ.Thck, 0) AS Thck, ISNULL(AQ.Sz2, 
                         0) AS Sz2, ROUND(CASE WHEN ISNULL(AQ.[Weight], 0) <= 0 THEN 0 ELSE AQ.[Weight] END, 0) AS Weight, ISNULL(AQ.Descript, '''') AS Descript, ISNULL(AQ.p_lb, 0) AS p_lb, ISNULL(AQ.p_pc, 0) AS p_pc, ISNULL(AQ.p_ft, 0) 
                         AS p_ft, ISNULL(AQ.Cuts, 0) AS Cuts, ISNULL(AQ.OtherFld, '''') AS OtherFld, ISNULL(AQ.OtherP, 0) AS OtherP, ISNULL(AQ.LotP, 0) AS LotP, ISNULL(AQ.LotCost, 0) AS LotCost, ISNULL(AQ.cWeight, 0) AS cWeight, ISNULL(AQ.cP_lb, 0) 
                         AS cP_lb, ISNULL(AQ.cP_pc, 0) AS cP_pc, ISNULL(AQ.cthk, '''') AS cthk, ISNULL(AQ.cLotP, 0) AS cLotP, ISNULL(AQ.cCutM, 0) AS cCutM, CONVERT(CHAR(10), AQ.InqDate, 23) AS Inq_Date, AQ.InqDate, ISNULL(AQ.InqNumP, '''') 
                         AS InqNumP, ISNULL(AQ.SalesP, '''') AS SalesP, ISNULL(AQ.SalesNum, 0) AS SalesNum, ISNULL(AQ.SOitem, '''') AS SOitem, ISNULL(AQ.item, 0) AS item, ISNULL(AQ.HPApo, 0) AS HPApo, ISNULL(AQ.POitem, '''') AS POitem, 
                         ISNULL(AQ.SaleDate, '''') AS SaleDate, ISNULL(AQ.ShipDate, '''') AS ShipDate, ISNULL(AQ.Bracket, 0) AS Bracket, ISNULL(AQ.CustID, 0) AS CustID, ISNULL(AQ.Services, 0) AS Services, ISNULL(AQ.QuoteDate, '''') AS QuoteDate, 
                         ISNULL(AQ.Cut, '''') AS Cut, AQ.ID, ISNULL(AQ.WO, 0) AS WO, ISNULL(AQ.CutOptions, '''') AS CutOptions, ISNULL(AQ.Regret, 0) AS Regret, ISNULL(AQ.NoNoiseName, '''') AS NoNoiseName, ISNULL(AQ.Q_P, 0) AS Q_P, 
                         ROUND(ISNULL(AQ.Q_QTY, 0), 1) AS Q_QTY, ISNULL(AQ.Q_PU, 0) AS Q_PU, ISNULL(AQ.Q_Total, 0) AS Q_Total, ISNULL(AQ.StandardSize, 0) AS StandardSize, ISNULL(AQ.CustDisc, 0) AS CustDisc, ISNULL(AQ.DescriptID, '''') 
                         AS DescriptID, CASE WHEN ISNULL(S.cncld, 0) = 1 THEN 0 ELSE ISNULL(S.ItemSale, 0) END AS ItemSale, CASE WHEN ISNULL(S.cncld, 0) = 1 THEN 0 ELSE ISNULL(S.ItemCost, 0) END AS ItemCost, CASE WHEN ISNULL(S.cncld, 
                         0) = 1 THEN 0 ELSE ISNULL(S.POCost, 0) END AS POCost, CASE WHEN ISNULL(S.SalesNum, 0) > 1 AND ISNULL(S.cncld, 0) = 0 THEN 1 ELSE 0 END AS Sold, CAST(ROUND(CASE WHEN ISNULL(AQ.StandardSize, 0) 
                         > 999 THEN 999 ELSE ISNULL(AQ.StandardSize, 0) END, 1) AS Numeric(4, 1)) AS StdSize, AQ.DescriptID AS Expr1, AQ.S_QTY, AQ.S_P, AQ.S_PU, AQ.Regret AS Expr2, AQ.Cover, S.SOitem AS Expr3, S.Inv, S.GFM, S.Draw, S.Roll, 
                         S.Press, S.Mach, S.CG, S.Plasma, S.WJet, S.ColdSaw, S.cmplt, S.cncld, AQ.S_Total
FROM            dbo.AllQuotes AS AQ WITH (NOLOCK) LEFT OUTER JOIN
                         dbo.Sales AS S WITH (NOLOCK) ON AQ.SOitem = S.SOitem
WHERE        (YEAR(AQ.InqDate) >= 2010) AND (LEN(AQ.Company) > 0)
' 
GO
/****** Object:  View [dbo].[vSales_StockLst]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSales_StockLst]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vSales_StockLst]
AS
SELECT     TOP (100) PERCENT M.alloy, M.form, M.CC, M.CL, M.size, CAST(D .weight AS DECIMAL(9, 0)) AS dWeight, M.cond, M.specs, M.heat, M.lot, M.Paid, M.id, CASE WHEN poduedate = ''01/01/1900'' THEN CONVERT(CHAR(10), '' '', 101) ELSE CONVERT(CHAR(10), PoDueDate, 101) 
                  END AS cPODueDate, M.mill, M.history, M.num, M.po_item, D .pc, D .size_h, D .dim1, D .size_l, D .dim2, D .dim3, D .length, CAST(ISNULL(D .weight, 0) AS DECIMAL(9, 1)) AS weight, D .costvalue, D .descript, D .location, D .floorstatus, D .class, D .unit, M.Melt,
                      (SELECT     COUNT(*) AS Prc
                       FROM        dbo.StockLst_Process AS SP WITH (NOLOCK)
                       WHERE     (D .id_detail = id_detail) AND ((process_id = ''SELECTED'' AND SOitem != ''STOCK'') OR
                                         Process_ID = ''QUOTED'')) AS Prc, 0 AS Bkr, D .id_detail, M.POStatus, M.FROM_ID, CASE WHEN stkdate = ''01/01/1900'' THEN CONVERT(CHAR(10), '' '', 101) ELSE CONVERT(CHAR(10), stkdate, 101) END AS cStkDate, ISNULL(D .ReceivingID, 0) AS ReceivingID, D .RandLen, 
                  ISNULL(M.BrandName, '''') AS BrandName, CONVERT(CHAR(10), D .InvCheck, 101) AS cInvCheck, C.CCSortValue, D .Quarantine, dbo.Forms.FormSort, D .InvCheck, ISNULL
                      ((SELECT     SUM(SP.QTY)
                        FROM        dbo.StockLst_Process AS SP WITH (NOLOCK)
                        WHERE     (D .id_detail = id_detail) AND ((process_id = ''SELECTED'' AND SOitem != ''STOCK'') OR
                                          Process_ID = ''QUOTED'')), 0) AS SelectQTY, dbo.f_CC_CLsort(M.CC, M.CL) AS CCCL, C.CCSort, D .S_QTY, D .S_P, D .S_Total, D .S_PU, D .Prime, M.MillTrace,
                      (SELECT     COUNT(*) AS Grab
                       FROM        dbo.StockLst_Process AS SP WITH (NOLOCK)
                       WHERE     (D .id_detail = id_detail) AND (NOT FoundStk IS NULL)) AS Grab, ISNULL(M.WO_Detail, 0) AS WO_Detail
FROM        dbo.Stocklst_Master AS M WITH (NOLOCK) INNER JOIN
                  dbo.Stocklst_Detail AS D WITH (NOLOCK) ON M.id = D .id INNER JOIN
                  dbo.ConditionCode AS C WITH (NOLOCK) ON M.cc = C.cc INNER JOIN
                  dbo.Forms WITH (NOLOCK) ON M.form = dbo.Forms.FormNumber
UNION
SELECT     W.Alloy, W.Form, W.CC, W.CL, W.Size, CAST(W.MWeight AS DECIMAL(9, 0)) AS dWeight, W.Cond, W.Specs, W.Heat, '''' AS Lot, 0 AS Paid, W.ID, '''' AS cPODueDate, ''Wanted'' AS Mill, ''Item on Want List'' AS History, 0 AS Num, '''' AS PO_item, W.Pc, W.Size AS Size_h, W.Dim1, 
                  W.Size AS Size_l, W.Dim2, W.Dim3, '''' AS [Length], W.MWeight AS [Weight], 0 AS CostValue, W.Descript, ''Wanted'' AS Location, '''' AS FloorStatus, '''' AS Class, '''' AS Unit, '''' AS Melt, 0 AS Prc, 0 AS Bkr, 0 AS ID_Detail, '''' AS POStatus, 0 AS FROM_ID, '''' AS cStkDate, 0 AS ReceivingID, 
                  0 AS RandLen, W.BrandName, CONVERT(CHAR(10), GETDATE() + 1, 101) AS cInvCheck, W.CCSortValue, ''False'' AS Quarantine, W.FormSort, GETDATE() + 1 AS InvCheck, 0 AS SelectQTY, dbo.f_CC_CLsort(W.CC, W.CL) AS CCCL, C.CCSort, W.MWeight AS S_QTY, 0 AS S_P, 0 AS S_Total, 
                  1 AS S_PU, ''True'' AS Prime, 1 AS MillTrace, 0 AS Grab, 0 AS WO_Detail
FROM        dbo.Stocklst_Wants AS W WITH (NOLOCK) INNER JOIN
                  dbo.ConditionCode AS C WITH (NOLOCK) ON W.cc = C.cc
UNION
SELECT     V.Alloy, V.Form, V.CC, V.CL, V.Size, CAST(V.MWeight AS DECIMAL(9, 0)) AS dWeight, V.Cond, V.Specs, V.Heat, '''' AS Lot, 0 AS Paid, V.ID, '''' AS cPODueDate, Mill, ''Item on Mill Stock List'' AS History, 0 AS Num, '''' AS PO_item, V.Pc, V.Size AS Size_h, V.Dim1, V.Size AS Size_l, V.Dim2, V.Dim3, 
                  '''' AS [Length], V.MWeight AS [Weight], 0 AS CostValue, V.Descript, LEFT(V. Vendor, 10) AS Location, '''' AS FloorStatus, '''' AS Class, '''' AS Unit, V.Melt, 0 AS Prc, 0 AS Bkr, 0 AS ID_Detail, '''' AS POStatus, 0 AS FROM_ID, '''' AS cStkDate, 0 AS ReceivingID, 0 AS RandLen, V.BrandName, 
                  CONVERT(CHAR(10), GETDATE() + 2, 101) AS cInvCheck, V.CCSortValue, ''False'' AS Quarantine, V.FormSort, GETDATE() + 2 AS InvCheck, 0 AS SelectQTY, dbo.f_CC_CLsort(V.CC, V.CL) AS CCCL, C.CCSort, V.MWeight AS S_QTY, 0 AS S_P, 0 AS S_Total, 1 AS S_PU, ''True'' AS Prime, 
                  1 AS MillTrace, 0 AS Grab, 0 AS WO_Detail
FROM        dbo.Stocklst_Vendor AS V WITH (NOLOCK) INNER JOIN
                  dbo.ConditionCode AS C WITH (NOLOCK) ON V.cc = C.cc
' 
GO
/****** Object:  View [dbo].[v_Survey_Target]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_Survey_Target]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_Survey_Target]
AS
/* SA.[AssignmentType] = 1 (Employee)*/ SELECT SA.[TargetIdentifier], SA.[AssignmentType], SA.[RequestedByUser], EndUser = employee.FirstName + '' '' + employee.LastName, 
                         Email = REPLACE(employee.FirstName + ''.'' + employee.LastName + ''@ERP_1s.com'', '' '', ''''), PhoneNumber = ''7659458230''
FROM            (SELECT        *
                          FROM            [ERP_1].[dbo].[Survey_Assignments] SA
                          WHERE        SA.[AssignmentType] = 1) SA LEFT JOIN
                         [ERP_1].[dbo].[TC_Replacement_Employees] employee ON SA.[TargetIdentifier] = CONVERT(varchar, employee.EmployeeId)
UNION
/* SA.[AssignmentType] = 2 (Quote)*/ SELECT SA.[TargetIdentifier], SA.[AssignmentType], SA.[RequestedByUser], EndUser = RTRIM(ISNULL(quote.Company, ISNULL(general.CompanyName, ''''))), Email = RTRIM(ISNULL(quote.Email, 
                         ISNULL(general.Email, ''''))), PhoneNumber = RTRIM(ISNULL(quote.Phone, ISNULL(general.PhoneNumber, '''')))
FROM            (SELECT        *
                          FROM            [ERP_1].[dbo].[Survey_Assignments] SA
                          WHERE        SA.[AssignmentType] = 2) SA LEFT JOIN
                         [ERP_1].[dbo].[AllQuotes] quote ON SA.[TargetIdentifier] = RTRIM(LTRIM(CONVERT(varchar, quote.InqNumP))) LEFT JOIN
                         [ERP_1].[dbo].[Survey_Assignment_ContactInfos] general ON SA.[TargetIdentifier] = CONVERT(varchar(50), general.ID)
UNION
/* SA.[AssignmentType] = 3 (Sales Order)*/ SELECT SA.[TargetIdentifier], SA.[AssignmentType], SA.[RequestedByUser], EndUser = RTRIM(ISNULL(sales.Company, ISNULL(general.CompanyName, ''''))), Email = RTRIM(ISNULL(sales.Email, 
                         ISNULL(general.Email, ''''))), PhoneNumber = RTRIM(ISNULL(sales.Phone, ISNULL(general.PhoneNumber, '''')))
FROM            (SELECT        *
                          FROM            [ERP_1].[dbo].[Survey_Assignments] SA
                          WHERE        SA.[AssignmentType] = 3) SA LEFT JOIN
                         [ERP_1].[dbo].[AllQuotes] sales ON SA.[TargetIdentifier] = CONVERT(varchar, sales.SalesNum) LEFT JOIN
                         [ERP_1].[dbo].[Survey_Assignment_ContactInfos] general ON SA.[TargetIdentifier] = CONVERT(varchar(50), general.ID)
UNION
/* SA.[AssignmentType] = 4 (Purchase Order)*/ SELECT SA.[TargetIdentifier], SA.[AssignmentType], SA.[RequestedByUser], EndUser = RTRIM(ISNULL(purchaseOrder.Company, ISNULL(general.CompanyName, ''''))), 
                         Email = RTRIM(ISNULL(purchaseOrder.Email, ISNULL(general.Email, ''''))), PhoneNumber = RTRIM(ISNULL(purchaseOrder.Phone, ISNULL(general.PhoneNumber, '''')))
FROM            (SELECT        *
                          FROM            [ERP_1].[dbo].[Survey_Assignments] SA
                          WHERE        SA.[AssignmentType] = 4) SA LEFT JOIN
                         [ERP_1].[dbo].[AllQuotes] purchaseOrder ON SA.[TargetIdentifier] = purchaseOrder.PO_num LEFT JOIN
                         [ERP_1].[dbo].[Survey_Assignment_ContactInfos] general ON SA.[TargetIdentifier] = CONVERT(varchar(50), general.ID)
UNION
/* SA.[AssignmentType] = 5 (General Customer Survey)*/ SELECT SA.[TargetIdentifier], SA.[AssignmentType], SA.[RequestedByUser], EndUser = RTRIM(ISNULL(general.CompanyName, '''')), Email = RTRIM(ISNULL(general.Email, '''')), 
                         PhoneNumber = RTRIM(ISNULL(general.PhoneNumber, ''''))
FROM            (SELECT        *
                          FROM            [ERP_1].[dbo].[Survey_Assignments] SA
                          WHERE        SA.[AssignmentType] = 5) SA LEFT JOIN
                         [ERP_1].[dbo].[Survey_Assignment_ContactInfos] general ON SA.[TargetIdentifier] = CONVERT(varchar(50), general.ID)
' 
GO
/****** Object:  View [dbo].[vSales_BrokerLst]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSales_BrokerLst]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vSales_BrokerLst]
AS
SELECT     TOP (100) PERCENT M.Alloy, M.Form, M.CC, M.CL, M.Size, CAST(D.Weight AS DECIMAL(9, 0)) AS dWeight, M.Cond, M.Specs, M.Heat, M.Lot, M.Paid, M.ID, CASE WHEN poduedate = ''01/01/1900'' THEN CONVERT(CHAR(10), '' '', 101) ELSE CONVERT(CHAR(10), PoDueDate, 101) 
                  END AS cPODueDate, M.Mill, M.History, M.Num, M.PO_item, D.PC, D.Size_H, D.Dim1, D.Size_L, D.Dim2, D.Dim3, D.Length, CAST(ISNULL(D.Weight, 0) AS DECIMAL(9, 1)) AS weight, D.CostValue, D.Descript, D.Location, D.FloorStatus, D.Class, D.Unit, M.Melt,
                      (SELECT     COUNT(*) AS Expr1
                       FROM        dbo.BrokerLst_Process AS SP WITH (NOLOCK)
                       WHERE     (D.ID_Detail = ID_Detail) AND (Process_ID = ''SELECTED'') AND (SOitem <> ''STOCK'')) AS Prc, 1 AS Bkr, D.ID_Detail, M.POStatus, M.FROM_ID, CASE WHEN stkdate = ''01/01/1900'' THEN CONVERT(CHAR(10), '' '', 101) ELSE CONVERT(CHAR(10), stkdate, 101) END AS cStkDate, 
                  ISNULL(D.ReceivingID, 0) AS ReceivingID, D.RandLen, ISNULL(M.BrandName, '''') AS BrandName, CONVERT(CHAR(10), D.InvCheck, 101) AS cInvCheck, C.CCSortValue, D.Quarantine, dbo.Forms.FormSort, D.InvCheck, 0 AS SelectQTY, dbo.f_CC_CLsort(M.CC, M.CL) AS CCCL, C.CCSort, 
                  D.S_QTY, D.S_P, D.S_Total, D.S_PU, D.Prime, M.MillTrace,
                      (SELECT     COUNT(*) AS Expr1
                       FROM        dbo.BrokerLst_Process AS SP WITH (NOLOCK)
                       WHERE     (D.ID_Detail = ID_Detail) AND (NOT (FoundSTK IS NULL))) AS Grab, ISNULL(M.WO_Detail, 0) AS WO_Detail
FROM        dbo.BrokerLst_Master AS M WITH (NOLOCK) INNER JOIN
                  dbo.BrokerLst_Detail AS D WITH (NOLOCK) ON M.ID = D.ID INNER JOIN
                  dbo.ConditionCode AS C WITH (NOLOCK) ON M.CC = C.CC INNER JOIN
                  dbo.Forms WITH (NOLOCK) ON M.Form = dbo.Forms.FormNumber
' 
GO
/****** Object:  View [dbo].[WIPLst_View]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WIPLst_View]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  View dbo.StockLst_View    Script Date: 5/4/2006 1:29:10 PM *****
***** Object:  View dbo.Shop_Edit_StockLst    Script Date: 2/23/2005 11:26:17 AM *****
*/
CREATE VIEW [dbo].[WIPLst_View]
AS
SELECT     TOP (100) PERCENT M.Alloy, M.Form, M.CC, M.Size, D.Weight AS dWeight, M.Cond, M.Specs, M.Heat, M.Lot, M.Paid, M.ID, CASE WHEN poduedate = ''01/01/1900'' THEN CONVERT(CHAR(10), '' '', 101) ELSE CONVERT(CHAR(10), PoDueDate, 101) END AS cPODueDate, M.Mill, M.History, 
                  M.Num, M.PO_item, D.PC, D.Size_H, D.Dim1, D.Size_L, D.Dim2, D.Dim3, D.Length, D.Weight, D.CostValue, D.Descript, D.Location, D.FloorStatus, D.Class, D.Unit, D.InvCheck, 0 AS Prc, M.Melt,
                      (SELECT     COUNT(*) AS Expr1
                       FROM        dbo.BrokerLst_Process AS P WITH (NOLOCK)
                       WHERE     (D.ID_Detail = ID_Detail)) AS Bkr, D.ID_Detail, M.POStatus, M.FROM_ID, CASE WHEN stkdate = ''01/01/1900'' THEN CONVERT(CHAR(10), '' '', 101) ELSE CONVERT(CHAR(10), stkdate, 101) END AS cStkDate, D.ReceivingID, D.RandLen, M.BrandName, 0 AS Expr1, 
                  dbo.Forms.FormSort, D.Prime, D.Quarantine, M.MillTrace
FROM        dbo.WIPLst_Master AS M WITH (NOLOCK) INNER JOIN
                  dbo.WIPLst_Detail AS D WITH (NOLOCK) ON M.ID = D.ID INNER JOIN
                  dbo.ConditionCode AS C WITH (NOLOCK) ON M.CC = C.CC INNER JOIN
                  dbo.Forms ON M.Form = dbo.Forms.FormNumber
' 
GO
/****** Object:  View [dbo].[GFM_BackOrder]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[GFM_BackOrder]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[GFM_BackOrder]
AS
SELECT        Sales.soitem, Sales.salesnum, Sales.itemsale, AllQuotes.saledate, comments, AllQuotes.descript, quotememo, orderspec, cc, gfm, roll, packingslip.heat, Sales.cmplt, AllQuotes.form, shipped, cncld
FROM dbo.AllQuotes WITH(NOLOCK) INNER JOIN
                         /*dbo.gfmlog ON dbo.AllQuotes.id = dbo.gfmlog.ID INNER JOIN*/ Sales ON AllQuotes.soitem = Sales.soitem FULL OUTER JOIN
                    dbo.packingslip WITH(NOLOCK) ON packingslip.soitem = Sales.soitem
WHERE        (comments LIKE ''%cold worked%'' OR
                         comments LIKE ''%CW%'' OR
                         comments LIKE ''%strain hardened%'' OR
                         comments LIKE ''%Cold Drawn%'' OR
                         comments LIKE ''%high strength%'' OR
                         comments LIKE ''%HS%'' OR
                         comments LIKE ''%LMA%'' OR
                         comments LIKE ''%M7060%'' OR
                         comments LIKE ''%Level 1%'' OR
                         comments LIKE ''%LEVEL 2%'' OR
                         comments LIKE ''%LEVEL 3%'' OR
                         comments LIKE ''%LEVEL 4%'' OR
                         comments LIKE ''%LEVEL 5%'' OR
                         AllQuotes.descript LIKE ''%cold worked%'' OR
                         AllQuotes.descript LIKE ''%CW%'' OR
                         AllQuotes.descript LIKE ''%strain hardened%'' OR
                         AllQuotes.descript LIKE ''%Cold Drawn%'' OR
                         AllQuotes.descript LIKE ''%high strength%'' OR
                         AllQuotes.descript LIKE ''%HS%'' OR
                         AllQuotes.descript LIKE ''%LMA%'' OR
                         AllQuotes.descript LIKE ''%M7060%'' OR
                         AllQuotes.descript LIKE ''%Level 1%'' OR
                         AllQuotes.descript LIKE ''%LEVEL 2%'' OR
                         AllQuotes.descript LIKE ''%LEVEL 3%'' OR
                         AllQuotes.descript LIKE ''%LEVEL 4%'' OR
                         AllQuotes.descript LIKE ''%LEVEL 5%'' OR
                         quotememo LIKE ''%cold worked%'' OR
                         quotememo LIKE ''%CW%'' OR
                         quotememo LIKE ''%strain hardened%'' OR
                         quotememo LIKE ''%Cold Drawn%'' OR
                         quotememo LIKE ''%high strength%'' OR
                         quotememo LIKE ''%HS%'' OR
                         quotememo LIKE ''%LMA%'' OR
                         quotememo LIKE ''%M7060%'' OR
                         quotememo LIKE ''%Level 1%'' OR
                         quotememo LIKE ''%LEVEL 2%'' OR
                         quotememo LIKE ''%LEVEL 3%'' OR
                         quotememo LIKE ''%LEVEL 4%'' OR
                         quotememo LIKE ''%LEVEL 5%'' OR
                         orderspec LIKE ''%cold worked%'' OR
                         orderspec LIKE ''%CW%'' OR
                         orderspec LIKE ''%strain hardened%'' OR
                         orderspec LIKE ''%Cold Drawn%'' OR
                         orderspec LIKE ''%high strength%'' OR
                         orderspec LIKE ''%HS%'' OR
                         orderspec LIKE ''%LMA%'' OR
                         orderspec LIKE ''%M7060%'' OR
                         orderspec LIKE ''%Level 1%'' OR
                         orderspec LIKE ''%LEVEL 2%'' OR
                         orderspec LIKE ''%LEVEL 3%'' OR
                         orderspec LIKE ''%LEVEL 4%'' OR
                         orderspec LIKE ''%LEVEL 5%'' OR
                         s_instrct LIKE ''%cold worked%'' OR
                         s_instrct LIKE ''%CW%'' OR
                         s_instrct LIKE ''%strain hardened%'' OR
                         s_instrct LIKE ''%Cold Drawn%'' OR
                         s_instrct LIKE ''%high strength%'' OR
                         s_instrct LIKE ''%HS%'' OR
                         s_instrct LIKE ''%LMA%'' OR
                         s_instrct LIKE ''%M7060%'' OR
                         s_instrct LIKE ''%Level 1%'' OR
                         s_instrct LIKE ''%LEVEL 2%'' OR
                         s_instrct LIKE ''%LEVEL 3%'' OR
                         s_instrct LIKE ''%LEVEL 4%'' OR
                         s_instrct LIKE ''%LEVEL 5%'' OR
                         (cc != ''1'' AND cc != ''0'' AND cc != '''' AND cc != NULL) OR
                         gfm = 1 OR
                         roll = 1 OR
                         packingslip.heat LIKE ''%HPAG%'' OR
                         packingslip.heat LIKE ''%HPA G%'' OR
                         packingslip.heat LIKE ''%HPAr%'' OR
                         packingslip.heat LIKE ''%HPA R%'') AND ISNULL(Sales.cmplt, 0) = 0 AND YEAR(saledate) > YEAR(GETDATE()) - 5 AND AllQuotes.form = 10 AND ISNULL(shipped, ''1990-01-01 00:00:00.000'') < ''1999-01-01 00:00:00.000'' AND 
                         cncld != 1
UNION
SELECT        gfmlog.soitem, gfmlog.salesnum, Sales.itemsale, AllQuotes.saledate, comments, AllQuotes.descript, quotememo, orderspec, cc, gfm, roll, packingslip.heat, Sales.cmplt, AllQuotes.form, shipped, cncld
FROM            dbo.gfmlog WITH(NOLOCK) LEFT OUTER JOIN
                         dbo.Sales WITH(NOLOCK) ON gfmlog.soitem = Sales.soitem INNER JOIN
                         dbo.AllQuotes WITH(NOLOCK) ON Sales.soitem = AllQuotes.soitem FULL OUTER JOIN
                         dbo.packingslip WITH(NOLOCK) ON packingslip.soitem = Sales.soitem
WHERE        ISNULL(Sales.cmplt, 0) = 0 AND YEAR(saledate) > YEAR(GETDATE()) - 5 AND ISNULL(shipped, ''1990-01-01 00:00:00.000'') < ''1999-01-01 00:00:00.000'' AND cncld != 1
' 
GO
/****** Object:  View [dbo].[vSpaceX_RC_Profile]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSpaceX_RC_Profile]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vSpaceX_RC_Profile]
AS
SELECT        (SELECT        TOP (1) AQ.Thck
                          FROM            dbo.Cert_co AS CO INNER JOIN
                                                    dbo.AllQuotes AS AQ ON CO.SOitem = AQ.SOitem
                          WHERE        (CO.ID = dbo.Cert.ID) AND (dbo.f_ProperSOitem(CO.SOitem) <> dbo.f_ProperSOitem('''')) AND (AQ.Thck IS NOT NULL)) AS THCK, CAST(ROUND(Ult1 / 1000, 0) AS INT) AS ULT_K, CAST(ROUND(Yield1 / 1000, 0) AS INT) 
                         AS YLD_K, Alloy_HPA AS Alloy, Heat, Lot, DateCert, Spec, Cond_Fin, SpecLMA, UNS, Ult1, Yield1, Elong1, ElonInches, RA1, tLoc1, Hardness, BHN, Ult2, Yield2, Elong2, ElonInches2, RA2, tLoc2, Hardness2, BHN2, Ult3, Yield3, 
                         Elong3, ElonInches3, RA3, tLoc3, Hardness3, BHN3, Ult4, Yield4, Elong4, ElonInches4, RA4, tLoc4, Hardness4, BHN4, Ult5, Yield5, Elong5, ElonInches5, RA5, tLoc5, Hardness5, BHN5, Ult6, Yield6, Elong6, ElonInches6, RA6, 
                         tLoc6, Ult7, Yield7, Elong7, ElonInches7, RA7, tLoc7, CorrosionR, GrainSize, TestPO, LabUsed, Signature, SignUser, ID, StockLst_ID, dbo.f_RC_Loc(ID, ''P0000'') AS P0000, dbo.f_RC_Loc(ID, ''P0125'') AS P0125, dbo.f_RC_Loc(ID, 
                         ''P0250'') AS P0250, dbo.f_RC_Loc(ID, ''P0375'') AS P0375, dbo.f_RC_Loc(ID, ''P0500'') AS P0500, dbo.f_RC_Loc(ID, ''P0625'') AS P0625, dbo.f_RC_Loc(ID, ''P0750'') AS P0750, dbo.f_RC_Loc(ID, ''P0875'') AS P0875, dbo.f_RC_Loc(ID, 
                         ''P1000'') AS P1000, dbo.f_RC_Loc(ID, ''P1125'') AS P1125, dbo.f_RC_Loc(ID, ''P1250'') AS P1250, dbo.f_RC_Loc(ID, ''P1375'') AS P1375, dbo.f_RC_Loc(ID, ''P1500'') AS P1500, dbo.f_RC_Loc(ID, ''P1625'') AS P1625, dbo.f_RC_Loc(ID, 
                         ''P1750'') AS P1750, dbo.f_RC_Loc(ID, ''P1875'') AS P1875, dbo.f_RC_Loc(ID, ''P2000'') AS P2000, dbo.f_RC_Loc(ID, ''P2125'') AS P2125, dbo.f_RC_Loc(ID, ''P2250'') AS P2250, dbo.f_RC_Loc(ID, ''P2375'') AS P2375, dbo.f_RC_Loc(ID, 
                         ''P2500'') AS P2500, dbo.f_RC_Loc(ID, ''P2625'') AS P2625, dbo.f_RC_Loc(ID, ''P2750'') AS P2750, dbo.f_RC_Loc(ID, ''P2875'') AS P2875, dbo.f_RC_Loc(ID, ''P3000'') AS P3000, dbo.f_RC_Loc(ID, ''P3125'') AS P3125, dbo.f_RC_Loc(ID, 
                         ''P3250'') AS P3250, dbo.f_RC_Loc(ID, ''P3375'') AS P3375, dbo.f_RC_Loc(ID, ''P3500'') AS P3500, dbo.f_RC_Loc(ID, ''P3625'') AS P3625, dbo.f_RC_Loc(ID, ''P3750'') AS P3750, dbo.f_RC_Loc(ID, ''P3875'') AS P3875, SpecSpaceX
FROM            dbo.Cert
WHERE        (Alloy_HPA = ''HPA N60'') AND (LEN(SpecSpaceX) > 1)
' 
GO
/****** Object:  View [dbo].[BI_rtr_Sales]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[BI_rtr_Sales]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[BI_rtr_Sales]
AS
SELECT        dbo.rtr.CreateDate, dbo.rtr.SOitem, dbo.rtr.WO, dbo.rtr.WO_Detail, dbo.rtr.Started, dbo.rtr.Finished, dbo.rtr.MinD, dbo.rtr.MaxD, dbo.rtr.Last_Started, dbo.rtr.Last_Finished, dbo.rtr.Next_Detail_Start, dbo.rtr.Next_Detail_Finish, 
                         dbo.rtr.Next_Rely_On_Start, dbo.rtr.OType_Num, dbo.rtr.OldID, dbo.rtr.cncld, rd.rtr_ID, rd.Detail, rd.EstStart, rd.Started AS Start, rd.StartDate, rd.EstFinish, rd.Finished AS Finish, rd.FinishDate, rd.Oper_ID, rd.Oper_Note, 
                         rd.POitem, rd.Cncld AS Cancel, rd.CnclDate, rd.ReqSched, rd.EstTime, rd.ActTime, rd.Rely_On, rd.Next_Up, rd.Synchro, rd.TBL, rd.ID_Detail_Process
FROM            dbo.rtr INNER JOIN
                         dbo.rtr_Detail AS rd ON dbo.rtr.ID = rd.rtr_ID
WHERE        (NOT (ISNULL(dbo.rtr.WO, 0) > 0 OR
                         ISNULL(dbo.rtr.WO_Detail, 0) > 0)) AND (dbo.rtr.CreateDate > GETDATE() - 180)
' 
GO
/****** Object:  View [dbo].[BI_Purchase_Due]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[BI_Purchase_Due]'))
EXEC dbo.sp_executesql @statement = N'/*AND (P.SOitem = ''STOCK     '') */
CREATE VIEW [dbo].[BI_Purchase_Due]
AS
SELECT        POitem, HPApo, ItemPO, SOitem, SalesNum, Item, SalesP, Company, Alloy, Form, CC, CL, CAST(ROUND(Order_QTY, 0) AS INT) AS Order_QTY, Pieces, Thck, Sz2, Sz3, p_lb, p_pc, p_ft, lotp, OtherP, OtherFld, OrderDate, Due_Min, 
                         Due_Max, Received, Cond_Spec, Misc_Purch, Heat, Cert, ReceivedBy, Receipt, Delivered, Cmplt, Cancelled, POSalesP, ShipVia, JobNumber, Services, ConvServ, Equipment, Stock, Sheet_pk, ShipWhere, POshipaddr, 
                         POpayaddr, Randlen, OddCut, Metric, Sz1Orig, Sz2Orig, Sz3Orig, DispAlloy, StandSize, Amendment, Printed, VendCode, ContactID, Terms, FOB, HPA_Due_Min, HPA_Due_Max, First_Due_Max, Reconciled, 
                         CAST(ROUND(ReconcileTotal, 0) AS INT) AS ReconcileTotal, StockLst_PU, CAST(ROUND(StockLst_QTY, 0) AS INT) AS StockLst_QTY, StockLst_P, StockLst_Total, Order_P, Order_PU, CAST(ROUND(Pounds, 0) AS INT) AS Pounds, 
                         BMScheck, ShipLocation, VendorPOConf, Melt, WO, Cover, WO_Detail, IntP, RcvdE, DLAE, TBL, DescriptID, Hold, WhoInsert, dbo.f_DescriptCL(Alloy, CC, CL, Form, Thck, Sz2, Sz3, Order_QTY, Randlen) AS DescriptCL, 
                         CAST(ROUND(CASE WHEN ISNULL(P.Thck, 0) > 999 THEN 999 ELSE ISNULL(P.Thck, 0) END, 1) AS Numeric(4, 1)) AS StdSize, dbo.f_BestDate(Due_Max, Due_Min) AS DueDate, dbo.f_get_Year_Month(COALESCE (Due_Max, 
                         Due_Min, HPA_Due_Max, HPA_Due_Min)) AS DueYearMn, dbo.f_get_Year_Qtr(COALESCE (Due_Max, Due_Min, HPA_Due_Max, HPA_Due_Min)) AS DueYearQ
FROM            dbo.PurchaseOrder AS P WITH (NOLOCK)
WHERE        (Cancelled = 0) AND (Cmplt = 0) AND (Delivered = 0) AND (SalesP <> ''Q'') AND (Services = 0) AND (ConvServ = 0) AND (Equipment = 0)
' 
GO
/****** Object:  View [dbo].[vSpaceX_RC]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSpaceX_RC]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vSpaceX_RC]
AS
SELECT        (SELECT        TOP (1) AQ.Thck
                          FROM            dbo.Cert_co AS CO INNER JOIN
                                                    dbo.AllQuotes AS AQ ON CO.SOitem = AQ.SOitem
                          WHERE        (CO.ID = dbo.Cert.ID) AND (dbo.f_ProperSOitem(CO.SOitem) <> dbo.f_ProperSOitem('''')) AND (AQ.Thck IS NOT NULL)) AS THCK, CAST(ROUND(dbo.Cert.Ult1 / 1000, 0) AS INT) AS ULT_K, 
                         CAST(ROUND(dbo.Cert.Yield1 / 1000, 0) AS INT) AS YLD_K, dbo.Cert.Alloy_HPA AS Alloy, dbo.Cert.Heat, dbo.Cert.Lot, dbo.Cert.DateCert, dbo.Cert.Spec, dbo.Cert.Cond_Fin, dbo.Cert.SpecLMA, dbo.Cert.UNS, dbo.Cert.Ult1, 
                         dbo.Cert.Yield1, dbo.Cert.Elong1, dbo.Cert.ElonInches, dbo.Cert.RA1, dbo.Cert.tLoc1, dbo.Cert.Hardness, dbo.Cert.BHN, dbo.Cert.TestPO, dbo.Cert.LabUsed, dbo.Cert.Signature, dbo.Cert.SignUser, dbo.Cert.ID, 
                         dbo.Cert.StockLst_ID, dbo.Cert.SpecSpaceX, RC.Inch, RC.RockC
FROM            dbo.Cert INNER JOIN
                         dbo.Cert_RC_profile AS RC ON dbo.Cert.ID = RC.CertID AND RC.Inch >= 0
WHERE        (dbo.Cert.Alloy_HPA = ''HPA N60'') AND (LEN(dbo.Cert.SpecSpaceX) > 1)
' 
GO
/****** Object:  View [dbo].[BI_ColdWork_Bar]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[BI_ColdWork_Bar]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[BI_ColdWork_Bar]
AS
SELECT AQ.Company, AQ.Name, AQ.PO_num, AQ.Alloy, AQ.Form, AQ.CC, AQ.CL, AQ.Pieces, AQ.Thck, AQ.Sz2, AQ.Sz3, AQ.Weight, AQ.Descript, CAST(AQ.InqDate AS DATE) AS InqDate, AQ.InqNum, AQ.SalesP, AQ.SalesNum, AQ.SOitem, 
                  AQ.POitem, AQ.SaleDate, AQ.ShipDate, AQ.CustID, AQ.Cover, AQ.Cut, AQ.ID, AQ.Line1, AQ.WO, AQ.CutOptions, AQ.Surcharge, AQ.Regret, AQ.NoNoiseName, AQ.CutHr, AQ.Q_P, AQ.Q_QTY, AQ.Q_PU, AQ.Q_Total, AQ.S_QTY, AQ.S_P, 
                  AQ.S_PU, AQ.StandardSize, AQ.CustDisc, AQ.DescriptID, S.ShipDue, S.Shipped, S.cmplt, S.ItemCost, S.ItemSale, S.StkCost, S.POCost, S.PT_PU
                  --, S.PT_QTY
                  , S.PT_P, S.PT_Total, S.Typ, SN.salesrep, dbo.f_DescriptCL(AQ.Alloy, AQ.CC, AQ.CL, 
                  AQ.Form, AQ.Thck, AQ.Sz2, AQ.Sz3, AQ.Q_QTY, AQ.RandLen) AS DescriptCL, ISNULL(S.SalesNum, 0) AS Sold, dbo.f_get_Year_Month(AQ.InqDate) AS YearMn, dbo.f_get_Year_Qtr(AQ.InqDate) AS YearQ, YEAR(AQ.InqDate) AS InqYear, 
                  dbo.f_BestDate(S.Shipped, S.ShipDue) AS Ship_Date, dbo.f_CC_CLsort(AQ.CC, AQ.CL) AS NewCCCL
FROM     dbo.AllQuotes AS AQ WITH (NOLOCK) LEFT OUTER JOIN
                  dbo.Sales AS S WITH (NOLOCK) ON AQ.SOitem = S.SOitem LEFT OUTER JOIN
                  dbo.Sales_No AS SN WITH (NOLOCK) ON AQ.SalesNum = SN.salesnum
WHERE  (AQ.Form = ''10'') AND (AQ.CC = ''2'' OR
                  AQ.CC = ''7'') AND (YEAR(AQ.InqDate) > 2015) AND (ISNULL(S.cncld, 0) = 0)
' 
GO
/****** Object:  View [dbo].[AllQuotes_Sales_View]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AllQuotes_Sales_View]'))
EXEC dbo.sp_executesql @statement = N'
/****** Object:  View dbo.AllQuotes_Sales_View    Script Date: 5/4/2006 1:26:26 PM ******/

/****** Object:  View dbo.AllQuotes_Sales_View    Script Date: 4/4/2006 2:20:22 PM ******/
CREATE   VIEW [dbo].[AllQuotes_Sales_View]
 
AS
SELECT     TOP 100 PERCENT dbo.allquotes.alloy, ROUND(dbo.allquotes.form / 10, 1) * 10 AS Form, ROUND(dbo.allquotes.thck, 1) AS Size, dbo.allquotes.weight, 
                     dbo.allquotes.inqnump, dbo.allquotes.SalesP, dbo.allquotes.randlen, dbo.sales.salesnum, dbo.sales.ItemCost, dbo.sales.ItemSale, dbo.sales.gs_Cost, dbo.sales.gs_Sale, dbo.sales.shipped, 
                      YEAR(dbo.sales.shipped) AS Year, YEAR(dbo.sales.shipped) * 100 + MONTH(dbo.sales.shipped) AS Year_Month, MONTH(dbo.sales.shipped) AS Month, YEAR(dbo.sales.shipped) 
                      * 10 + DATEPART(QQ, dbo.sales.shipped) AS Year_Q, dbo.sales.urgent, dbo.sales.gs_cmplt, dbo.sales.cmplt, dbo.sales.cncld
FROM         dbo.allquotes INNER JOIN
                      dbo.sales ON dbo.allquotes.soitem = dbo.sales.soitem
WHERE     (dbo.sales.shipped > ''1984/01/01'')
ORDER BY dbo.sales.shipped


' 
GO
/****** Object:  View [dbo].[vPurch_Elect2024]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vPurch_Elect2024]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vPurch_Elect2024]
AS
SELECT        E.Electra_Order, E.HPApo, E.Item, E.POitem, E.FinishSize, E.Form, E.Product, E.Weight, E.[Due Date], E.[Repromise Date], E.Comments, E.YearMn, COALESCE (E.[Repromise Date], E.[Due Date]) AS NewDueDate, 
                         PO.StockLst_P AS Price, PO.StockLst_P * E.Weight AS Value
FROM            dbo.PurchaseOrder AS PO WITH (NOLOCK) INNER JOIN
                         dbo.Purch_Elect2024 AS E ON PO.POitem = E.POitem
' 
GO
/****** Object:  View [dbo].[vStockLst_Electralloy]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vStockLst_Electralloy]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vStockLst_Electralloy]
AS
SELECT        (CASE WHEN SM.Heat LIKE ''Due in%'' THEN ''Y'' ELSE '''' END) AS Due, (CASE WHEN LEN(dbo.f_GetMachine_Log_Parse(SM.Lot)) > 0 THEN ''Y'' ELSE '''' END) AS HPA, PO.StockLst_P, CAST(ISNULL
                             ((SELECT        SUM(PO2.StockLst_P * SD2.S_QTY) AS Tprice
                                 FROM            dbo.StockLst_Detail AS SD2 LEFT OUTER JOIN
                                                          dbo.PurchaseOrder AS PO2 ON dbo.f_ProperPOitem(SM.PO_item) = PO2.POitem
                                 WHERE        (SM.ID = SD2.ID) AND (SD2.Prime = 1)), SM.MWeight * SM.Paid) AS INT) AS Tprice, PO.POitem, SM.Alloy, SM.Form, SM.CC, SM.CL, SM.Size, SM.Cond, SM.MWeight, SM.Specs, SM.Heat, SM.Lot, SM.Paid, SM.Mill, 
                         SM.StkDate, SM.ID, SM.DescriptID
FROM            dbo.Stocklst_Master AS SM WITH (NOLOCK) LEFT OUTER JOIN
                         dbo.PurchaseOrder AS PO WITH (NOLOCK) ON SM.PO_item = PO.POitem
WHERE        (dbo.f_ProperPOitem(SM.PO_item) <> dbo.f_ProperPOitem('''')) AND (PO.Company LIKE ''%CARLSON%'' OR
                         PO.Company LIKE ''%Electra%'')
' 
GO

/****** Object:  View [dbo].[v_GFMDieToOrderTracking]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_GFMDieToOrderTracking]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_GFMDieToOrderTracking]
AS
SELECT        DOT.DieDailyID, DOT.OTJob, DI.[Die Set], DI.GFM, DI.DieStamp, 
                         DI.RangeMin, DI.RangeMax, DI.Condition, DD.Notes, DD.WorkLevel, DD.Hot_Cold, 
                         DD.WO, DD.SO, DD.RunTime, DD.TimeOUT, DD.TimeIN, DD.Who, DD.Date, 
                         DD.Lot,DI.Inactive, DI.LastInspection, DI.ChangeLog, DI.Hot, DI.Cold, 
                         DI.LandingSize, DI.Who AS InventoryWho, DI.[When], DI.DieAlloy, DI.DieID, 
                         DD.ID AS DailyID, DD.OldCondition, DD.NewCondition, DD.ChangeLog AS DailyLog, DI.OriginalPurchaseOrder
FROM            dbo.GFM_Die_Daily DD INNER JOIN
                         dbo.GFM_Die_Inventory DI ON DD.DieID = DI.DieID INNER JOIN
                         dbo.GFM_Die_On_OT DOT ON DD.ID = DOT.DieDailyID
' 
GO
/****** Object:  View [dbo].[vElectralloy_Purchase_Fact]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vElectralloy_Purchase_Fact]'))
EXEC dbo.sp_executesql @statement = N'/*ORDER BY PO.Thck, PO.Form, PO.Alloy*/
CREATE VIEW [dbo].[vElectralloy_Purchase_Fact]
AS
SELECT DISTINCT PO.Alloy, PO.Form, PO.Thck
FROM            dbo.PurchaseOrder AS PO WITH (NOLOCK) INNER JOIN
                         dbo.Alloy ON PO.Alloy = dbo.Alloy.alloy INNER JOIN
                         dbo.Forms ON PO.Form = dbo.Forms.FormNumber
WHERE        (PO.Company LIKE ''%CARLSON%'' OR
                         PO.Company LIKE ''%Electra%'') AND (LEN(TRIM(PO.Alloy)) > 0) AND (PO.Thck > 0)
' 
GO
/****** Object:  View [dbo].[v_GFMDInventory_OTJ]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_GFMDInventory_OTJ]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_GFMDInventory_OTJ]
AS
SELECT        DieID, [Die Set], ''GFM '' + GFM AS GFM, DieStamp, RangeMin, RangeMax, Condition, DieAlloy, [When], Who, Hot, Cold, LandingSize, ChangeLog, LastInspection, Inactive, OriginalPurchaseOrder
FROM            dbo.GFM_Die_Inventory WITH (NOLOCK)
' 
GO
/****** Object:  View [dbo].[Shop_Edit_WIPLst]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Shop_Edit_WIPLst]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Shop_Edit_WIPLst]
AS
SELECT     TOP (100) PERCENT M.Alloy, M.Form, M.CC, M.Size, CAST(D.Weight AS DECIMAL(9, 0)) AS dWeight, M.Cond, M.Specs, M.Heat, M.Lot, M.Paid, M.ID, CASE WHEN poduedate = ''01/01/1900'' THEN CONVERT(CHAR(10), '' '', 101) ELSE CONVERT(CHAR(10), PoDueDate, 101) END AS cPODueDate, 
                  M.Mill, M.History, M.Num, M.PO_item, D.PC, D.Size_H, D.Dim1, D.Size_L, D.Dim2, D.Dim3, D.Length, CAST(ISNULL(D.Weight, 0) AS DECIMAL(9, 1)) AS weight, D.CostValue, D.Descript, D.Location, D.FloorStatus, D.Class, D.Unit, 0 AS Prc,
                      (SELECT     COUNT(*) AS Expr1
                       FROM        dbo.WIPLst_Process AS BP
                       WHERE     (D.ID_Detail = ID_Detail) AND (Process_ID = ''SELECTED'')) AS Bkr, D.ID_Detail, M.POStatus, M.FROM_ID, CASE WHEN stkdate = ''01/01/1900'' THEN CONVERT(CHAR(10), '' '', 101) ELSE CONVERT(CHAR(10), stkdate, 101) END AS cStkDate, ISNULL(D.ReceivingID, 0) 
                  AS ReceivingID, D.RandLen, ISNULL(M.BrandName, '''') AS BrandName, CONVERT(CHAR(10), D.InvCheck, 101) AS cInvCheck, C.CCSortValue, D.Quarantine, dbo.Forms.FormSort, D.InvCheck, M.Melt, M.CL, M.MillTrace
FROM        dbo.WIPLst_Master AS M WITH (NOLOCK) INNER JOIN
                  dbo.WIPLst_Detail AS D WITH (NOLOCK) ON M.ID = D.ID INNER JOIN
                  dbo.ConditionCode AS C WITH (NOLOCK) ON M.CC = C.CC INNER JOIN
                  dbo.Forms WITH (NOLOCK) ON M.Form = dbo.Forms.FormNumber
' 
GO
/****** Object:  View [dbo].[v_GFM_ActiveDieInventory]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_GFM_ActiveDieInventory]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_GFM_ActiveDieInventory]
AS
SELECT        DieID, [Die Set], GFM, Who, [When], DieAlloy, DieStamp, RangeMin, RangeMax, Condition, Inactive, LastInspection, ChangeLog, Hot, Cold, LandingSize, OriginalPurchaseOrder, DieHeight
FROM            dbo.GFM_Die_Inventory WITH (NOLOCK)
WHERE        (Condition > 0) AND (Inactive <> 1)
' 
GO
/****** Object:  View [dbo].[v_GFM_Die_Inspection_Changes]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_GFM_Die_Inspection_Changes]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_GFM_Die_Inspection_Changes]
AS
SELECT        dbo.GFM_Die_Inventory.DieID, dbo.GFM_Die_Inventory.GFM, dbo.GFM_Die_Inventory.DieStamp, dbo.GFM_Die_Condition.Condition, dbo.GFM_Die_Height.DieHeight, dbo.GFM_Die_Inspection.InspectionDate, 
                         dbo.GFM_Die_Landing.LandingSize, dbo.GFM_Die_Range.RangeMin, dbo.GFM_Die_Range.RangeMax, dbo.GFM_Die_Inspection.Notes, dbo.GFM_Die_Inspection.ID, dbo.GFM_Die_Inspection.Employees
FROM            dbo.GFM_Die_Condition INNER JOIN
                         dbo.GFM_Die_Inspection ON dbo.GFM_Die_Condition.ID = dbo.GFM_Die_Inspection.ConditionID INNER JOIN
                         dbo.GFM_Die_Height ON dbo.GFM_Die_Inspection.HeightID = dbo.GFM_Die_Height.ID INNER JOIN
                         dbo.GFM_Die_Inventory ON dbo.GFM_Die_Condition.DieID = dbo.GFM_Die_Inventory.DieID AND dbo.GFM_Die_Height.DieID = dbo.GFM_Die_Inventory.DieID AND 
                         dbo.GFM_Die_Inspection.DieID = dbo.GFM_Die_Inventory.DieID INNER JOIN
                         dbo.GFM_Die_Landing ON dbo.GFM_Die_Inspection.LandingID = dbo.GFM_Die_Landing.ID AND dbo.GFM_Die_Inventory.DieID = dbo.GFM_Die_Landing.DieID INNER JOIN
                         dbo.GFM_Die_Range ON dbo.GFM_Die_Inspection.RangeID = dbo.GFM_Die_Range.ID AND dbo.GFM_Die_Inventory.DieID = dbo.GFM_Die_Range.DieID
' 
GO
/****** Object:  View [dbo].[vAC_ID-MachLot]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vAC_ID-MachLot]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vAC_ID-MachLot]
AS
SELECT        AC_ID
FROM            dbo.AcctCost_SOitem WITH (NOLOCK)
' 
GO
/****** Object:  View [dbo].[vSales_WIPLst]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSales_WIPLst]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vSales_WIPLst]
AS
SELECT     TOP (100) PERCENT M.Alloy, M.Form, M.CC, M.CL, M.Size, CAST(D.Weight AS DECIMAL(9, 0)) AS dWeight, M.Cond, M.Specs, M.Heat, M.Lot, M.Paid, M.ID, CASE WHEN poduedate = ''01/01/1900'' THEN CONVERT(CHAR(10), '' '', 101) ELSE CONVERT(CHAR(10), PoDueDate, 101) 
                  END AS cPODueDate, M.Mill, M.History, M.Num, M.PO_item, D.PC, D.Size_H, D.Dim1, D.Size_L, D.Dim2, D.Dim3, D.Length, CAST(ISNULL(D.Weight, 0) AS DECIMAL(9, 1)) AS weight, D.CostValue, D.Descript, D.Location, D.FloorStatus, D.Class, D.Unit, M.Melt,
                      (SELECT     COUNT(*) AS Expr1
                       FROM        dbo.WIPLst_Process AS SP WITH (NOLOCK)
                       WHERE     (D.ID_Detail = ID_Detail) AND (Process_ID = ''SELECTED'') AND (SOitem <> ''STOCK'')) AS Prc, 0 AS Bkr, D.ID_Detail, M.POStatus, M.FROM_ID, CASE WHEN stkdate = ''01/01/1900'' THEN CONVERT(CHAR(10), '' '', 101) ELSE CONVERT(CHAR(10), stkdate, 101) END AS cStkDate, 
                  ISNULL(D.ReceivingID, 0) AS ReceivingID, D.RandLen, ISNULL(M.BrandName, '''') AS BrandName, CONVERT(CHAR(10), D.InvCheck, 101) AS cInvCheck, C.CCSortValue, D.Quarantine, dbo.Forms.FormSort, D.InvCheck, ISNULL
                      ((SELECT     SUM(QTY) AS Expr1
                        FROM        dbo.WIPLst_Process AS SP WITH (NOLOCK)
                        WHERE     (D.ID_Detail = ID_Detail) AND (Process_ID = ''SELECTED'') AND (SOitem <> ''STOCK'')), 0) AS SelectQTY, dbo.f_CC_CLsort(M.CC, M.CL) AS CCCL, C.CCSort, D.S_QTY, D.S_P, D.S_Total, D.S_PU, D.Prime, M.MillTrace,
                      (SELECT     COUNT(*) AS Expr1
                       FROM        dbo.WIPLst_Process AS SP WITH (NOLOCK)
                       WHERE     (D.ID_Detail = ID_Detail) AND (NOT (FoundStk IS NULL))) AS Grab, ISNULL(M.WO_Detail, 0) AS WO_Detail
FROM        dbo.WIPLst_Master AS M WITH (NOLOCK) INNER JOIN
                  dbo.WIPLst_Detail AS D WITH (NOLOCK) ON M.ID = D.ID INNER JOIN
                  dbo.ConditionCode AS C WITH (NOLOCK) ON M.CC = C.CC INNER JOIN
                  dbo.Forms WITH (NOLOCK) ON M.Form = dbo.Forms.FormNumber
' 
GO
/****** Object:  UserDefinedFunction [dbo].[TVF_TOP20_Vendors]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TVF_TOP20_Vendors]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,David Kirchner>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[TVF_TOP20_Vendors]
(	@NumYears int )
RETURNS TABLE 
AS
RETURN 
(

--SELECT YearBought, Line, Company, Bought FROM dbo.TVF_TOP20_Vendors(20) ORDER BY YearBought DESC, Line


SELECT TOP 100 Percent YearBought, Line, Company, Bought  FROM ( 

SELECT TOP 20 YearBought, Company, Bought
, ROW_NUMBER() OVER (ORDER BY Bought DESC) AS Line
FROM (
SELECT TOP 20  P.Company
	, CAST( SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) AS Numeric (10,2)) AS Bought
	, YEAR(GetDate()) AS [YearBought]
	FROM [dbo].[PurchaseOrder] p
	Where ISNULL(p.cancelled,0) != 1 AND YEAR(p.orderdate) = YEAR(GetDate())
		AND ISNULL(RTRIM(p.Company),'''') != ''''
	GROUP BY p.Company
	ORDER BY SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) DESC
)a ORDER BY Bought DESC

UNION

SELECT TOP 20 YearBought, Company, Bought
, ROW_NUMBER() OVER (ORDER BY Bought DESC) AS Line
FROM (
SELECT TOP 20  P.Company
	, CAST( SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) AS Numeric (10,2)) AS Bought
	, YEAR(GetDate())-1 AS [YearBought]
	FROM [dbo].[PurchaseOrder] p
	Where ISNULL(p.cancelled,0) != 1 AND YEAR(p.orderdate) = YEAR(GetDate())-1
		AND ISNULL(RTRIM(p.Company),'''') != ''''
	GROUP BY p.Company
	ORDER BY SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) DESC
)a1  ORDER BY Bought DESC

UNION

SELECT TOP 20 YearBought, Company, Bought
, ROW_NUMBER() OVER (ORDER BY Bought DESC) AS Line
FROM (
SELECT TOP 20  P.Company
	, CAST( SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) AS Numeric (10,2)) AS Bought
	, YEAR(GetDate())-2 AS [YearBought]
	FROM [dbo].[PurchaseOrder] p
	Where ISNULL(p.cancelled,0) != 1 AND YEAR(p.orderdate) = YEAR(GetDate())-2
		AND ISNULL(RTRIM(p.Company),'''') != ''''
	GROUP BY p.Company
	ORDER BY SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) DESC
)a2  ORDER BY Bought DESC

UNION

SELECT TOP 20 YearBought, Company, Bought
, ROW_NUMBER() OVER (ORDER BY Bought DESC) AS Line
FROM (
SELECT TOP 20  P.Company
	, CAST( SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) AS Numeric (10,2)) AS Bought
	, YEAR(GetDate())-3 AS [YearBought]
	FROM [dbo].[PurchaseOrder] p
	Where ISNULL(p.cancelled,0) != 1 AND YEAR(p.orderdate) = YEAR(GetDate())-3
		AND ISNULL(RTRIM(p.Company),'''') != ''''
	GROUP BY p.Company
	ORDER BY SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) DESC
)a3  ORDER BY Bought DESC

UNION

SELECT TOP 20 YearBought, Company, Bought
, ROW_NUMBER() OVER (ORDER BY Bought DESC) AS Line
FROM (
SELECT TOP 20  P.Company
	, CAST( SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) AS Numeric (10,2)) AS Bought
	, YEAR(GetDate())-4 AS [YearBought]
	FROM [dbo].[PurchaseOrder] p
	Where ISNULL(p.cancelled,0) != 1 AND YEAR(p.orderdate) = YEAR(GetDate())-4
		AND ISNULL(RTRIM(p.Company),'''') != ''''
	GROUP BY p.Company
	ORDER BY SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) DESC
)a4  ORDER BY Bought DESC

UNION

SELECT TOP 20 YearBought, Company, Bought
, ROW_NUMBER() OVER (ORDER BY Bought DESC) AS Line
FROM (
SELECT TOP 20  P.Company
	, CAST( SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) AS Numeric (10,2)) AS Bought
	, YEAR(GetDate())-5 AS [YearBought]
	FROM [dbo].[PurchaseOrder] p
	Where ISNULL(p.cancelled,0) != 1 AND YEAR(p.orderdate) = YEAR(GetDate())-5
		AND ISNULL(RTRIM(p.Company),'''') != ''''
	GROUP BY p.Company
	ORDER BY SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) DESC
)a5  ORDER BY Bought DESC

UNION

SELECT TOP 20 YearBought, Company, Bought
, ROW_NUMBER() OVER (ORDER BY Bought DESC) AS Line
FROM (
SELECT TOP 20  P.Company
	, CAST( SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) AS Numeric (10,2)) AS Bought
	, YEAR(GetDate())-6 AS [YearBought]
	FROM [dbo].[PurchaseOrder] p
	Where ISNULL(p.cancelled,0) != 1 AND YEAR(p.orderdate) = YEAR(GetDate())-6
		AND ISNULL(RTRIM(p.Company),'''') != ''''
	GROUP BY p.Company
	ORDER BY SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) DESC
)a6  ORDER BY Bought DESC

UNION

SELECT TOP 20 YearBought, Company, Bought
, ROW_NUMBER() OVER (ORDER BY Bought DESC) AS Line
FROM (
SELECT TOP 20  P.Company
	, CAST( SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) AS Numeric (10,2)) AS Bought
	, YEAR(GetDate())-7 AS [YearBought]
	FROM [dbo].[PurchaseOrder] p
	Where ISNULL(p.cancelled,0) != 1 AND YEAR(p.orderdate) = YEAR(GetDate())-7
		AND ISNULL(RTRIM(p.Company),'''') != ''''
	GROUP BY p.Company
	ORDER BY SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) DESC
)a7  ORDER BY Bought DESC

UNION

SELECT TOP 20 YearBought, Company, Bought
, ROW_NUMBER() OVER (ORDER BY Bought DESC) AS Line
FROM (
SELECT TOP 20  P.Company
	, CAST( SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) AS Numeric (10,2)) AS Bought
	, YEAR(GetDate())-8 AS [YearBought]
	FROM [dbo].[PurchaseOrder] p
	Where ISNULL(p.cancelled,0) != 1 AND YEAR(p.orderdate) = YEAR(GetDate())-8
		AND ISNULL(RTRIM(p.Company),'''') != ''''
	GROUP BY p.Company
	ORDER BY SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) DESC
)a8  ORDER BY Bought DESC

UNION

SELECT TOP 20 YearBought, Company, Bought
, ROW_NUMBER() OVER (ORDER BY Bought DESC) AS Line
FROM (
SELECT TOP 20  P.Company
	, CAST( SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) AS Numeric (10,2)) AS Bought
	, YEAR(GetDate())-9 AS [YearBought]
	FROM [dbo].[PurchaseOrder] p
	Where ISNULL(p.cancelled,0) != 1 AND YEAR(p.orderdate) = YEAR(GetDate())-9
		AND ISNULL(RTRIM(p.Company),'''') != ''''
	GROUP BY p.Company
	ORDER BY SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) DESC
)a9  ORDER BY Bought DESC

UNION

SELECT TOP 20 YearBought, Company, Bought
, ROW_NUMBER() OVER (ORDER BY Bought DESC) AS Line
FROM (
SELECT TOP 20  P.Company
	, CAST( SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) AS Numeric (10,2)) AS Bought
	, YEAR(GetDate())-10 AS [YearBought]
	FROM [dbo].[PurchaseOrder] p
	Where ISNULL(p.cancelled,0) != 1 AND YEAR(p.orderdate) = YEAR(GetDate())-10
		AND ISNULL(RTRIM(p.Company),'''') != ''''
	GROUP BY p.Company
	ORDER BY SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) DESC
)a10 ORDER BY Bought DESC

UNION

SELECT TOP 20 YearBought, Company, Bought
, ROW_NUMBER() OVER (ORDER BY Bought DESC) AS Line
FROM (
SELECT TOP 20  P.Company
	, CAST( SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) AS Numeric (10,2)) AS Bought
	, YEAR(GetDate())-11 AS [YearBought]
	FROM [dbo].[PurchaseOrder] p
	Where ISNULL(p.cancelled,0) != 1 AND YEAR(p.orderdate) = YEAR(GetDate())-11
		AND ISNULL(RTRIM(p.Company),'''') != ''''
	GROUP BY p.Company
	ORDER BY SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) DESC
)a11  ORDER BY Bought DESC

UNION

SELECT TOP 20 YearBought, Company, Bought
, ROW_NUMBER() OVER (ORDER BY Bought DESC) AS Line
FROM (
SELECT TOP 20  P.Company
	, CAST( SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) AS Numeric (10,2)) AS Bought
	, YEAR(GetDate())-12 AS [YearBought]
	FROM [dbo].[PurchaseOrder] p
	Where ISNULL(p.cancelled,0) != 1 AND YEAR(p.orderdate) = YEAR(GetDate())-12
		AND ISNULL(RTRIM(p.Company),'''') != ''''
	GROUP BY p.Company
	ORDER BY SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) DESC
)a12  ORDER BY Bought DESC

UNION

SELECT TOP 20 YearBought, Company, Bought
, ROW_NUMBER() OVER (ORDER BY Bought DESC) AS Line
FROM (
SELECT TOP 20  P.Company
	, CAST( SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) AS Numeric (10,2)) AS Bought
	, YEAR(GetDate())-13 AS [YearBought]
	FROM [dbo].[PurchaseOrder] p
	Where ISNULL(p.cancelled,0) != 1 AND YEAR(p.orderdate) = YEAR(GetDate())-13
		AND ISNULL(RTRIM(p.Company),'''') != ''''
	GROUP BY p.Company
	ORDER BY SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) DESC
)a13  ORDER BY Bought DESC

UNION

SELECT TOP 20 YearBought, Company, Bought
, ROW_NUMBER() OVER (ORDER BY Bought DESC) AS Line
FROM (
SELECT TOP 20  P.Company
	, CAST( SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) AS Numeric (10,2)) AS Bought
	, YEAR(GetDate())-14 AS [YearBought]
	FROM [dbo].[PurchaseOrder] p
	Where ISNULL(p.cancelled,0) != 1 AND YEAR(p.orderdate) = YEAR(GetDate())-14
		AND ISNULL(RTRIM(p.Company),'''') != ''''
	GROUP BY p.Company
	ORDER BY SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) DESC
)a14  ORDER BY Bought DESC

UNION

SELECT TOP 20 YearBought, Company, Bought
, ROW_NUMBER() OVER (ORDER BY Bought DESC) AS Line
FROM (
SELECT TOP 20  P.Company
	, CAST( SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) AS Numeric (10,2)) AS Bought
	, YEAR(GetDate())-15 AS [YearBought]
	FROM [dbo].[PurchaseOrder] p
	Where ISNULL(p.cancelled,0) != 1 AND YEAR(p.orderdate) = YEAR(GetDate())-15
		AND ISNULL(RTRIM(p.Company),'''') != ''''
	GROUP BY p.Company
	ORDER BY SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) DESC
)a15  ORDER BY Bought DESC

UNION

SELECT TOP 20 YearBought, Company, Bought
, ROW_NUMBER() OVER (ORDER BY Bought DESC) AS Line
FROM (
SELECT TOP 20  P.Company
	, CAST( SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) AS Numeric (10,2)) AS Bought
	, YEAR(GetDate())-16 AS [YearBought]
	FROM [dbo].[PurchaseOrder] p
	Where ISNULL(p.cancelled,0) != 1 AND YEAR(p.orderdate) = YEAR(GetDate())-16
		AND ISNULL(RTRIM(p.Company),'''') != ''''
	GROUP BY p.Company
	ORDER BY SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) DESC
)a16  ORDER BY Bought DESC

UNION

SELECT TOP 20 YearBought, Company, Bought
, ROW_NUMBER() OVER (ORDER BY Bought DESC) AS Line
FROM (
SELECT TOP 20  P.Company
	, CAST( SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) AS Numeric (10,2)) AS Bought
	, YEAR(GetDate())-17 AS [YearBought]
	FROM [dbo].[PurchaseOrder] p
	Where ISNULL(p.cancelled,0) != 1 AND YEAR(p.orderdate) = YEAR(GetDate())-17
		AND ISNULL(RTRIM(p.Company),'''') != ''''
	GROUP BY p.Company
	ORDER BY SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) DESC
)a17  ORDER BY Bought DESC

UNION

SELECT TOP 20 YearBought, Company, Bought
, ROW_NUMBER() OVER (ORDER BY Bought DESC) AS Line
FROM (
SELECT TOP 20  P.Company
	, CAST( SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) AS Numeric (10,2)) AS Bought
	, YEAR(GetDate())-18 AS [YearBought]
	FROM [dbo].[PurchaseOrder] p
	Where ISNULL(p.cancelled,0) != 1 AND YEAR(p.orderdate) = YEAR(GetDate())-18
		AND ISNULL(RTRIM(p.Company),'''') != ''''
	GROUP BY p.Company
	ORDER BY SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) DESC
)a18  ORDER BY Bought DESC

UNION

SELECT TOP 20 YearBought, Company, Bought
, ROW_NUMBER() OVER (ORDER BY Bought DESC) AS Line
FROM (
SELECT TOP 20  P.Company
	, CAST( SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) AS Numeric (10,2)) AS Bought
	, YEAR(GetDate())-19 AS [YearBought]
	FROM [dbo].[PurchaseOrder] p
	Where ISNULL(p.cancelled,0) != 1 AND YEAR(p.orderdate) = YEAR(GetDate())-19
		AND ISNULL(RTRIM(p.Company),'''') != ''''
	GROUP BY p.Company
	ORDER BY SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) DESC
)a19  ORDER BY Bought DESC

UNION

SELECT TOP 20 YearBought, Company, Bought
, ROW_NUMBER() OVER (ORDER BY Bought DESC) AS Line
FROM (
SELECT TOP 20  P.Company
	, CAST( SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) AS Numeric (10,2)) AS Bought
	, YEAR(GetDate())-20 AS [YearBought]
	FROM [dbo].[PurchaseOrder] p
	Where ISNULL(p.cancelled,0) != 1 AND YEAR(p.orderdate) = YEAR(GetDate())-20
		AND ISNULL(RTRIM(p.Company),'''') != ''''
	GROUP BY p.Company
	ORDER BY SUM( CASE WHEN P.ReconcileTotal > 0 then P.ReconcileTotal else P.StockLst_Total end ) DESC
)a20  ORDER BY Bought DESC

) T
ORDER BY YearBought DESC, Bought


)


' 
END
GO
/****** Object:  View [dbo].[v_TimeClockPlus_EmployeeList]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_TimeClockPlus_EmployeeList]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_TimeClockPlus_EmployeeList]
AS
SELECT EmployeeId, Name
FROM     (SELECT EmployeeId, FirstName + '' '' + LastName AS Name
                  FROM      dbo.TC_Replacement_Employees) AS tcr
' 
GO
/****** Object:  View [dbo].[v_SalesOrders_Due_Detailed]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_SalesOrders_Due_Detailed]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_SalesOrders_Due_Detailed]
AS
SELECT DISTINCT 
	Q.SOitem, 
	Q.SalesRep, 
	Q.Printed, 
	Q.ShipDue, 
	Q.Shipped, 
	Q.PackingSlipCreated, 
	Q.PiecesShipped, 
	Q.PiecesQuoted, 
	Q.POitem, 
	Q.Branch, 
	Q.Completed, 
	CASE Q.Hold 
		WHEN 0 THEN (
			CASE ISNULL(Q.HeldBy, CONVERT(varchar, ''0'')) 
				WHEN ''0'' THEN CONVERT(bit, 0) 
				ELSE CONVERT(bit, 1) 
			END
		) 
		ELSE Q.Hold 
	END AS [Held], 
	Q.HeldBy, 
	vOT.[Description], 
	vOT.[OTStatus], 
	vOT.[OTTime], 
	vOT.[Employees]
FROM 
(
	SELECT DISTINCT 
		s.soitem AS SOitem, 
		RTRIM(sn.salesrep) AS SalesRep, 
		ISNULL(sn.printedso, 0) AS Printed, 
		s.ShipDue, 
		s.Shipped, 
		CASE ISNULL(ps.[Packingsli], 0) 
			WHEN 0 THEN CONVERT(bit, 0) 
			ELSE CONVERT(bit, 1) 
		END AS PackingSlipCreated, 
		[ERP_1].[dbo].f_GetPcsShipped_SOitem(s.SOitem) AS [PiecesShipped], 
		a.pieces AS [PiecesQuoted], 
		LTRIM([ERP_1].[dbo].f_GetTopPOitem_SOitem(a.SOitem)) AS POitem, 
		[ERP_1].[dbo].f_Branch_Form(a.form) AS Branch, 
		ISNULL(s.cmplt, 0) AS Completed, 
		ISNULL(s.Hold, CONVERT(bit, 0)) AS Hold, 
		[ERP_1].[dbo].[f_Who_Held_SOitem](shs.SOitem) AS HeldBy
	FROM 
	(
		SELECT DISTINCT 
			s.soitem AS [SOitem], 
			s.SalesNum AS [SalesNum], 
			s.ShipDue, 
			s.Shipped, 
			s.cmplt, 
			s.Hold
		FROM [ERP_1].[dbo].[Sales] AS s WITH (NOLOCK)
		WHERE (ISNULL(s.cncld, 0) < 1) 
		AND (ISNULL(s.itemtot, 0) > 0) 
		AND 
		(
			(s.shipdue < CONVERT(DATE, GETDATE()) AND (ISNULL(s.cmplt, 0) = 0)) 
			OR s.shipdue = CONVERT(DATE, GETDATE()) 
			OR s.Shipped = CONVERT(DATE, GETDATE()) 
			OR s.Shipped = DATEADD(DAY, - 1, CONVERT(DATE, GETDATE())) 
		    OR s.Hold = 1
        )
		UNION
		SELECT DISTINCT 
			shs.SOitem AS [SOitem], 
			s.SalesNum AS [SalesNum], 
			s.ShipDue, 
			s.Shipped, 
			s.cmplt, 
			s.Hold
		FROM [ERP_1].[dbo].[Sales_Hold_Status] AS shs WITH (NOLOCK) 
		JOIN [ERP_1].[dbo].[Sales] AS s WITH (NOLOCK) ON shs.SOitem = s.SOitem
		WHERE [ERP_1].[dbo].[f_Is_SOitemHeld](shs.SOitem) = 1 
		AND (ISNULL(s.cncld, 0) < 1) 
		AND (ISNULL(s.itemtot, 0) > 0)
    ) AS s 
    LEFT JOIN [ERP_1].[dbo].[PackingSlip] AS ps WITH (NOLOCK) ON s.SOitem = ps.[SOitem] 
    INNER JOIN [ERP_1].[dbo].AllQuotes AS a WITH (NOLOCK) ON s.soitem = a.SOitem 
    INNER JOIN [ERP_1].[dbo].Sales_No AS sn WITH (NOLOCK) ON s.salesnum = sn.salesnum 
    LEFT JOIN [ERP_1].[dbo].[Sales_Hold_Status] AS shs WITH (NOLOCK) ON s.SOitem = shs.SOitem
) AS Q 
OUTER APPLY 
(
    SELECT 
        [Description], 
        CASE [OTStatus] 
            WHEN ''start'' THEN ''active'' 
            WHEN ''resume'' THEN ''active'' 
            ELSE [OTStatus] 
        END AS [OTStatus], 
        [OTTime], 
        [Employees]
    FROM (
        SELECT TOP (1) 
            otj.[Description],
            (
                SELECT TOP (1) CASE WHEN ott.Stop_StatusId IS NULL THEN otts1.Status ELSE otts2.Status END AS Expr1
                FROM [ERP_1].[dbo].[OT_Times] AS ott 
                INNER JOIN [ERP_1].[dbo].[OT_Times_Status] AS otts1 ON ott.Start_StatusId = otts1.StatusId 
                LEFT OUTER JOIN [ERP_1].[dbo].[OT_Times_Status] AS otts2 ON ott.Stop_StatusId = otts2.StatusId
                WHERE (ott.StartTime > GETDATE() - 365) AND (ott.TrackId = o.TrackID)
                ORDER BY ott.TimeId DESC
            ) AS [OTStatus],
            (
                SELECT        TOP (1) ISNULL(StopTime, StartTime) AS Expr1
                FROM            [ERP_1].[dbo].[OT_Times] AS ott
                WHERE        (StartTime > GETDATE() - 365) AND (TrackId = o.TrackID)
                ORDER BY TimeId DESC
            ) AS [OTTime],
            (
                SELECT TOP (1) STRING_AGG(ISNULL(vEmp.[Name], otte.EmployeeId), '','') AS Employees
                FROM [ERP_1].[dbo].[OT_Times] AS ott 
                INNER JOIN [ERP_1].[dbo].[OT_Times_Employees] AS otte ON ott.TimeId = otte.TimeId 
                LEFT OUTER JOIN [ERP_1].[dbo].[v_TimeClockPlus_EmployeeList] vEmp ON otte.EmployeeId = vEmp.EmployeeId
                WHERE (ott.StartTime > GETDATE() - 365) AND (ott.TrackId = o.TrackID)
                GROUP BY ott.TimeId
                ORDER BY ott.TimeId DESC
            ) AS [Employees]
            FROM [ERP_1].[dbo].[OT] AS o 
            LEFT OUTER JOIN [ERP_1].[dbo].[OT_OrderType] AS otot ON o.OrderTypeID = otot.OrderTypeId 
            INNER JOIN [ERP_1].[dbo].[OT_Job] AS otj ON o.JobID = otj.JobId
            WHERE o.OrderNumber = LTRIM(Q.SOitem) AND (TypeAbr = ''SI'' OR TypeAbr = ''SO'')
            GROUP BY o.OrderNumber, o.JobID, otj.Description, o.TrackID, otot.TypeAbr
    ) AS o_1
) AS vOT
' 
GO
/****** Object:  UserDefinedFunction [dbo].[TVF_AC_ID_GFM_Lot]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TVF_AC_ID_GFM_Lot]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'Create FUNCTION [dbo].[TVF_AC_ID_GFM_Lot] (
	@nLot INT 

)
RETURNS TABLE
AS
RETURN

--SELECT * FROM dbo.TVF_AC_ID_GFMLot(1000)


SELECT DISTINCT ISNULL(

(
	SELECT ACsi.AC_ID FROM dbo.AcctCost_SOitem ACSi
	INNER JOIN dbo.GFMLog GFM ON ACsi.SOitem = GFM.SOitem
	WHERE Lot = @nLot
	union
	SELECT ACPi.AC_ID FROM dbo.AcctCost_POitem ACPi
	INNER JOIN dbo.GFMLog GFM ON ACPi.POitem = GFM.TestPOitem
	WHERE Lot = @nLot
	union
	SELECT ACPi.AC_ID FROM dbo.AcctCost_POitem ACPi
	INNER JOIN dbo.GFMLog GFM ON ACPi.POitem = GFM.TestPOitem2
	WHERE Lot = @nLot
	union
	SELECT ACPi.AC_ID FROM dbo.AcctCost_POitem ACPi
	INNER JOIN dbo.GFMLog GFM ON CAST(ACPi.POitem AS INT) = GFM.SrvcPO
	WHERE Lot = @nLot
	union
	SELECT ACWOD.AC_ID FROM dbo.AcctCost_WOD ACWOD
	INNER JOIN dbo.WorkOrder_Detail WOD ON ACWOD.WO_Detail = WOD.WO_Detail
	INNER JOIN dbo.WorkOrder WO ON WOD.WO = WO.WO
	INNER JOIN dbo.GFMLog GFM ON WO.WO = GFM.WO
	WHERE Lot = @nLot
	union
	SELECT ACWOD.AC_ID FROM dbo.AcctCost_WOD ACWOD
	INNER JOIN dbo.GFMLog GFM ON ACWOD.WO_Detail = GFM.WO_Detail
	WHERE Lot = @nLot

),0) AS AC_IDs 


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[TVF_AC_ID_Roll_Lot]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TVF_AC_ID_Roll_Lot]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'Create FUNCTION [dbo].[TVF_AC_ID_Roll_Lot] (
	@nLot INT 

)
RETURNS TABLE
AS
RETURN

--SELECT * FROM dbo.TVF_AC_ID_Roll_Lot(1000)


SELECT DISTINCT ISNULL(

(
	SELECT ACsi.AC_ID FROM dbo.AcctCost_SOitem ACSi
	INNER JOIN dbo.Roll_Log l ON ACsi.SOitem = l.SOitem
	WHERE Lot = @nLot
	union
	SELECT ACPi.AC_ID FROM dbo.AcctCost_POitem ACPi
	INNER JOIN dbo.Roll_Log l ON ACPi.POitem = l.TestPOitem
	WHERE Lot = @nLot
	union
	SELECT ACPi.AC_ID FROM dbo.AcctCost_POitem ACPi
	INNER JOIN dbo.Roll_Log l ON CAST(ACPi.POitem AS INT) = l.SrvcPO
	WHERE Lot = @nLot
	union
	SELECT ACWOD.AC_ID FROM dbo.AcctCost_WOD ACWOD
	INNER JOIN dbo.WorkOrder_Detail WOD ON ACWOD.WO_Detail = WOD.WO_Detail
	INNER JOIN dbo.WorkOrder WO ON WOD.WO = WO.WO
	INNER JOIN dbo.Roll_Log l ON WO.WO = l.WO
	WHERE Lot = @nLot
	union
	SELECT ACWOD.AC_ID FROM dbo.AcctCost_WOD ACWOD
	INNER JOIN dbo.Roll_Log l ON ACWOD.WO_Detail = l.WO_Detail
	WHERE Lot = @nLot

),0) AS AC_IDs 


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[TVF_AC_ID_LakeErie_lot]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TVF_AC_ID_LakeErie_lot]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'Create FUNCTION [dbo].[TVF_AC_ID_LakeErie_lot] (
	@nLot INT 

)
RETURNS TABLE
AS
RETURN

--SELECT * FROM dbo.TVF_AC_ID_Roll_Lot(1000)


SELECT DISTINCT ISNULL(

(
	SELECT ACsi.AC_ID FROM dbo.AcctCost_SOitem ACSi
	INNER JOIN dbo.LakeErie_log l ON ACsi.SOitem = l.SOitem
	WHERE Lot = @nLot
	union
	SELECT ACPi.AC_ID FROM dbo.AcctCost_POitem ACPi
	INNER JOIN dbo.LakeErie_log l ON ACPi.POitem = l.TestPOitem
	WHERE Lot = @nLot
	union
	SELECT ACPi.AC_ID FROM dbo.AcctCost_POitem ACPi
	INNER JOIN dbo.LakeErie_log l ON CAST(ACPi.POitem AS INT) = l.SrvcPO
	WHERE Lot = @nLot
	union
	SELECT ACWOD.AC_ID FROM dbo.AcctCost_WOD ACWOD
	INNER JOIN dbo.WorkOrder_Detail WOD ON ACWOD.WO_Detail = WOD.WO_Detail
	INNER JOIN dbo.WorkOrder WO ON WOD.WO = WO.WO
	INNER JOIN dbo.LakeErie_log l ON WO.WO = l.WO
	WHERE Lot = @nLot
	union
	SELECT ACWOD.AC_ID FROM dbo.AcctCost_WOD ACWOD
	INNER JOIN dbo.LakeErie_log l ON ACWOD.WO_Detail = l.WO_Detail
	WHERE Lot = @nLot

),0) AS AC_IDs 


' 
END
GO
/****** Object:  View [dbo].[BI_MFG_Sales]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[BI_MFG_Sales]'))
EXEC dbo.sp_executesql @statement = N'/*ORDER BY S.SalesNum*/
CREATE VIEW [dbo].[BI_MFG_Sales]
AS
SELECT        TOP (100) PERCENT S.SOitem, S.SalesNum, S.Item, S.Inv, S.GFM, S.Roll, S.Press, S.Mach, S.CG, S.Plasma, S.WJet, S.ItemTot, S.ShipDue, S.Shipped, S.MatlWt, S.cncld, S.cmplt, S.ItemCost, S.ItemSale, S.StkCost, S.POCost, 
                         S.RMA_No, S.pOther, S.Other, S.ShipOn, S.ProcLoc, S.Quoted_QTY, S.Quoted_P, S.Quoted_Total, S.Quoted_PU, S.dShip, S.Typ, S.WO, S.StkPaid, S.WO_Detail, S.ProductionWO, S.Export, S.InqNumP, AQ.Alloy, AQ.Form, AQ.CC, 
                         AQ.CL, AQ.Thck, AQ.Pieces, AQ.Descript, AQ.SalesP, AQ.POitem, AQ.SaleDate, AQ.ShipDate, AQ.Services, AQ.Cover, AQ.Q_QTY, AQ.Q_Total, AQ.StandardSize, AQ.DescriptID, dbo.f_get_Year_Month(AQ.ShipDate) AS YearMn, 
                         dbo.f_get_Year_Qtr(AQ.ShipDate) AS YearQ, dbo.f_BestDate(S.Shipped, S.ShipDue) AS Ship_Date, CAST(ROUND(CASE WHEN ISNULL(Thck, 0) > 999 THEN 999 ELSE ISNULL(AQ.StandardSize, 0) END, 1) AS Numeric(4, 1)) 
                         AS StdSize, dbo.f_ConditionCodeLevelText(AQ.CC, AQ.CL) AS CL_Text, CASE WHEN ISNULL(S.GFM, 0) = 1 THEN 1 WHEN ISNULL(S.Roll, 0) = 1 THEN 1 WHEN ISNULL(S.Press, 0) = 1 THEN 1 WHEN ISNULL(S.typ, '''') 
                         = ''P'' THEN 1 WHEN ISNULL(Descript, '''') LIKE ''%SPX%'' THEN 1 WHEN ISNULL(Descript, '''') LIKE ''%LMA%'' THEN 1 ELSE 0 END AS MFG, dbo.f_Is_HPA_Cert(S.SOitem) AS HPA_Cert,
                             (SELECT        HPA_MFG
                               FROM            dbo.ConditionCode
                               WHERE        (CC = AQ.CC)) AS HPA_MFG, CASE WHEN ISNULL(Descript, '''') LIKE ''%LMA%'' THEN 1 ELSE 0 END AS LMA, SA.st, S.S_QTY, S.S_P, S.S_Total
FROM            dbo.Sales AS S WITH (NOLOCK) INNER JOIN
                         dbo.AllQuotes AS AQ WITH (NOLOCK) ON S.SOitem = AQ.SOitem LEFT OUTER JOIN
                         dbo.Sales_No AS SN ON AQ.SalesNum = SN.salesnum LEFT OUTER JOIN
                         dbo.ShipAddr AS SA ON SN.pshipaddr = SA.shipcode
WHERE        (YEAR(S.ShipDue) >= 2010) AND (ISNULL(S.cncld, 0) = 0) AND (CASE WHEN ISNULL(S.GFM, 0) = 1 THEN 1 WHEN ISNULL(S.Roll, 0) = 1 THEN 1 WHEN ISNULL(S.Press, 0) = 1 THEN 1 WHEN ISNULL(S.typ, '''') 
                         = ''P'' THEN 1 WHEN ISNULL(Descript, '''') LIKE ''%SPX%'' THEN 1 WHEN ISNULL(Descript, '''') LIKE ''%LMA%'' THEN 1 ELSE 0 END > 0) OR
                         (YEAR(S.ShipDue) >= 2010) AND (ISNULL(S.cncld, 0) = 0) AND (dbo.f_Is_HPA_Cert(S.SOitem) > 0) OR
                         (YEAR(S.ShipDue) >= 2010) AND (ISNULL(S.cncld, 0) = 0) AND
                             ((SELECT        HPA_MFG
                                 FROM            dbo.ConditionCode AS ConditionCode_1
                                 WHERE        (CC = AQ.CC)) > 0)
' 
GO
/****** Object:  View [dbo].[v_ScansToday_By_Branch]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_ScansToday_By_Branch]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_ScansToday_By_Branch]
AS
SELECT        COUNT(StartTime) + COUNT(StopTime) AS ScansToday, Branch
FROM            (SELECT        ott.TimeId, ott.StartTime, ott.Start_StatusId, ott.StopTime, ott.Stop_StatusId, ott.TrackId, dbo.f_Branch_Form(a.Form) AS Branch
                          FROM            dbo.OT_Times AS ott INNER JOIN
                                                    dbo.OT AS ot ON ott.TrackId = ot.TrackID LEFT OUTER JOIN
                                                    dbo.AllQuotes AS a ON dbo.f_ProperSOitem(ot.OrderNumber) = a.SOitem
                          WHERE        (CONVERT(Date, ott.StartTime) = CONVERT(Date, GETDATE())) OR
                                                    (ott.StopTime IS NOT NULL) AND (CONVERT(Date, ott.StopTime) = CONVERT(Date, GETDATE()))) AS Qry
GROUP BY Branch
' 
GO
/****** Object:  View [dbo].[BI_Cert_HPA_MS]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[BI_Cert_HPA_MS]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[BI_Cert_HPA_MS]
AS
SELECT        ID AS ID_Cert, dbo.f_Is_GFMlot_toSpec(Lot, ''HPA-MS-101                    '', '''') AS MS_101, dbo.f_Is_GFMlot_toSpec(Lot, ''HPA-MS-102                    '', '''') AS MS_102, dbo.f_Is_GFMlot_toSpec(Lot, ''HPA-MS-103                    '', '''') 
                         AS MS_103, dbo.f_Is_GFMlot_toSpec(Lot, ''HPA-MS-104                    '', '''') AS MS_104, dbo.f_Is_GFMlot_toSpec(Lot, ''HPA-MS-105                    '', '''') AS MS_105, dbo.f_Is_GFMlot_toSpec(Lot, ''HPA-MS-106                    '', '''') 
                         AS MS_106
FROM            dbo.Cert AS C
' 
GO
/****** Object:  View [dbo].[BI_Sales_LMA]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[BI_Sales_LMA]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[BI_Sales_LMA]
AS
SELECT        TOP (100) PERCENT AQ.Alloy, AQ.Form, dbo.f_LMA_Gr(AQ.CC, AQ.CL, AQ.Descript, AQ.Comments) AS LMA, AQ.Thck, AQ.Pieces, AQ.Descript, AQ.SalesP, AQ.SaleDate, AQ.Cover, CAST(AQ.Q_QTY AS Numeric(7, 1)) AS Q_QTY, 
                         AQ.Q_Total, AQ.StandardSize, AQ.DescriptID, dbo.f_get_Year_Month(AQ.ShipDate) AS YearMn, dbo.f_get_Year_Qtr(AQ.ShipDate) AS YearQ, CAST(ROUND(CASE WHEN ISNULL(Thck, 0) 
                         > 999 THEN 999 ELSE ISNULL(AQ.StandardSize, 0) END, 1) AS Numeric(4, 1)) AS StdSize, AQ.Sz2, AQ.Sz3, AQ.Weight, AQ.SalesNum, AQ.SOitem, YEAR(S.Shipped) AS Year, S.cmplt, S.ShipDue, S.RMA_No, S.Shipped, 
                         AQ.Company, AQ.CustID, AQ.CC, AQ.CL, C.SpecLMA, C.Reference, C.Lot, MS.MS_101, MS.MS_102, MS.MS_103, MS.MS_104, MS.MS_105, MS.MS_106, 
                         (CASE WHEN MS.MS_101 = 1 THEN 1 WHEN MS.MS_102 = 1 THEN 2 WHEN MS.MS_103 = 1 THEN 3 WHEN MS.MS_104 = 1 THEN 4 WHEN MS.MS_105 = 1 THEN 5 WHEN MS.MS_106 = 1 THEN 6 ELSE 0 END) AS Low_MS, 
                         Cco.ID, AQ.S_Total, AQ.S_QTY
FROM            dbo.AllQuotes AS AQ WITH (NOLOCK) INNER JOIN
                         dbo.Sales AS S ON AQ.SOitem = S.SOitem AND S.cmplt = 1 AND S.cncld = 0 LEFT OUTER JOIN
                         dbo.Cert_co AS Cco ON AQ.SOitem = Cco.SOitem LEFT OUTER JOIN
                         dbo.Cert AS C ON Cco.ID = C.ID AND C.Reference = ''GFM'' LEFT OUTER JOIN
                         dbo.BI_Cert_HPA_MS AS MS ON MS.ID_Cert = C.ID
WHERE        (AQ.SalesNum > 0) AND (AQ.Alloy = ''HPA N60     '') AND (dbo.f_LMA_Gr(AQ.CC, AQ.CL, AQ.Descript, AQ.Comments) > 0)
' 
GO
/****** Object:  View [dbo].[v_Sales_Completed_By_Branch]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_Sales_Completed_By_Branch]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_Sales_Completed_By_Branch]
AS
SELECT        Branch, YearShipped, MonthShipped, COUNT(SOitem) AS CompletedCount
FROM            (SELECT DISTINCT s.SOitem, DATEPART(YEAR, s.Shipped) AS YearShipped, DATEPART(MONTH, s.Shipped) AS MonthShipped, dbo.f_Branch_Form(a.Form) AS Branch
                          FROM            dbo.Sales AS s WITH (NOLOCK) INNER JOIN
                                                    dbo.AllQuotes AS a WITH (NOLOCK) ON s.SOitem = a.SOitem
                          WHERE        (ISNULL(s.cncld, 0) = 0) AND (ISNULL(s.ItemTot, 0) > 0) AND (s.Shipped >= CONVERT(DATE, CONVERT(varchar, DATEPART(YEAR, GETDATE()) - 1) + ''-01-01 00:00:00.000'')) AND (ISNULL(s.cmplt, 0) = 1) OR
                                                    (ISNULL(s.cncld, 0) = 0) AND (ISNULL(s.ItemTot, 0) > 0) AND (s.Shipped >= CONVERT(DATE, CONVERT(varchar, DATEPART(YEAR, GETDATE()) - 1) + ''-01-01 00:00:00.000'')) AND 
                                                    (dbo.f_GetPcsShipped_SOitem(s.SOitem) >= a.Pieces)) AS Q
GROUP BY Branch, YearShipped, MonthShipped
' 
GO
/****** Object:  View [dbo].[v_SOitemDetail]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_SOitemDetail]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_SOitemDetail]
AS
SELECT        a.SOitem, a.Company AS Customer, sn.salesrep AS SalesPerson
FROM            dbo.AllQuotes AS a WITH (NOLOCK) INNER JOIN
                         dbo.Sales_No AS sn WITH (NOLOCK) ON a.SalesNum = sn.salesnum
' 
GO
/****** Object:  View [dbo].[vSales_WIPLst2]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSales_WIPLst2]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vSales_WIPLst2]
AS
SELECT     TOP (100) PERCENT M.Alloy, M.Form, M.CC, M.CL, M.Size, CAST(D.Weight AS DECIMAL(9, 0)) AS dWeight, M.Cond, M.Specs, M.Heat, M.Lot, M.Paid, M.ID, CASE WHEN poduedate = ''01/01/1900'' THEN CONVERT(CHAR(10), '' '', 101) ELSE CONVERT(CHAR(10), PoDueDate, 101) 
                  END AS cPODueDate, M.Mill, M.History, M.Num, M.PO_item, D.PC, D.Size_H, D.Dim1, D.Size_L, D.Dim2, D.Dim3, D.Length, CAST(ISNULL(D.Weight, 0) AS DECIMAL(9, 1)) AS weight, D.CostValue, D.Descript, D.Location, D.FloorStatus, D.Class, D.Unit, M.Melt,
                      (SELECT     COUNT(*) AS Expr1
                       FROM        dbo.WIPLst_Process AS SP WITH (NOLOCK)
                       WHERE     (D.ID_Detail = ID_Detail) AND (Process_ID = ''SELECTED'') AND (SOitem <> ''STOCK'')) AS Prc, 0 AS Bkr, D.ID_Detail, M.POStatus, M.FROM_ID, CASE WHEN stkdate = ''01/01/1900'' THEN CONVERT(CHAR(10), '' '', 101) ELSE CONVERT(CHAR(10), stkdate, 101) END AS cStkDate, 
                  ISNULL(D.ReceivingID, 0) AS ReceivingID, D.RandLen, ISNULL(M.BrandName, '''') AS BrandName, CONVERT(CHAR(10), D.InvCheck, 101) AS cInvCheck, C.CCSortValue, D.Quarantine, dbo.Forms.FormSort, D.InvCheck, ISNULL
                      ((SELECT     SUM(QTY) AS Expr1
                        FROM        dbo.WIPLst_Process AS SP WITH (NOLOCK)
                        WHERE     (D.ID_Detail = ID_Detail) AND (Process_ID = ''SELECTED'') AND (SOitem <> ''STOCK'')), 0) AS SelectQTY, dbo.f_CC_CLsort(M.CC, M.CL) AS CCCL, C.CCSort, M.MillTrace
FROM        dbo.WIPLst_Master AS M WITH (NOLOCK) INNER JOIN
                  dbo.WIPLst_Detail AS D WITH (NOLOCK) ON M.ID = D.ID INNER JOIN
                  dbo.ConditionCode AS C WITH (NOLOCK) ON M.CC = C.CC INNER JOIN
                  dbo.Forms WITH (NOLOCK) ON M.Form = dbo.Forms.FormNumber
' 
GO
/****** Object:  UserDefinedFunction [dbo].[TVF_AC_ID_HT_lot]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TVF_AC_ID_HT_lot]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'Create FUNCTION [dbo].[TVF_AC_ID_HT_lot] (
	@nLot INT 

)
RETURNS TABLE
AS
RETURN

--SELECT * FROM dbo.TVF_AC_ID_HT_Lot(1000)


SELECT DISTINCT ISNULL(

(
	SELECT ACsi.AC_ID FROM dbo.AcctCost_SOitem ACSi
	INNER JOIN dbo.HT_log l ON ACsi.SOitem = l.SOitem
	WHERE Lot = @nLot
	union
	SELECT ACPi.AC_ID FROM dbo.AcctCost_POitem ACPi
	INNER JOIN dbo.HT_log l ON ACPi.POitem = l.TestPOitem
	WHERE Lot = @nLot
	union
	SELECT ACWOD.AC_ID FROM dbo.AcctCost_WOD ACWOD
	INNER JOIN dbo.WorkOrder_Detail WOD ON ACWOD.WO_Detail = WOD.WO_Detail
	INNER JOIN dbo.WorkOrder WO ON WOD.WO = WO.WO
	INNER JOIN dbo.HT_log l ON WO.WO = l.WO
	WHERE Lot = @nLot
	union
	SELECT ACWOD.AC_ID FROM dbo.AcctCost_WOD ACWOD
	INNER JOIN dbo.HT_log l ON ACWOD.WO_Detail = l.WO_Detail
	WHERE Lot = @nLot

),0) AS AC_IDs 


' 
END
GO
/****** Object:  View [dbo].[v_SOitems_Not_Completed]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_SOitems_Not_Completed]'))
EXEC dbo.sp_executesql @statement = N'/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[v_SOitems_Not_Completed]
AS
SELECT DISTINCT 
                         s.SOitem, RTRIM(sn.salesrep) AS SalesRep, ISNULL(sn.printedso, 0) AS Printed, s.ShipDue, s.Shipped, CASE ISNULL(ps.[Packingsli], 0) WHEN 0 THEN CONVERT(bit, 0) ELSE CONVERT(bit, 1) END AS PackingSlipCreated, 
                         psn.packedby AS PackedBy, psn.WHO AS PSCreatedBy, dbo.f_GetPcsShipped_SOitem(s.SOitem) AS PiecesShipped, a.Pieces AS PiecesQuoted, LTRIM(dbo.f_GetTopPOitem_SOitem(a.SOitem)) AS POitem, 
                         dbo.f_Branch_Form(a.Form) AS Branch, ISNULL(s.cmplt, 0) AS Completed, CASE ISNULL(s.[Hold], 0) WHEN 0 THEN (CASE shs.[SOitem] WHEN NULL THEN CONVERT(bit, 0) ELSE [ERP_1].[dbo].[f_Is_SOitemHeld](shs.[SOitem]) 
                         END) ELSE CONVERT(bit, 0) END AS Held
FROM            dbo.Sales AS s WITH (NOLOCK) LEFT OUTER JOIN
                         dbo.PackingSlip AS ps WITH (NOLOCK) ON s.SOitem = ps.SOitem LEFT OUTER JOIN
                         dbo.PackingSlip_No AS psn WITH (NOLOCK) ON ps.Packingsli = psn.packingsli INNER JOIN
                         dbo.AllQuotes AS a WITH (NOLOCK) ON s.SOitem = a.SOitem INNER JOIN
                         dbo.Sales_No AS sn WITH (NOLOCK) ON s.SalesNum = sn.salesnum LEFT OUTER JOIN
                         dbo.Sales_Hold_Status AS shs WITH (NOLOCK) ON s.SOitem = shs.SOitem
WHERE        (ISNULL(s.cncld, 0) < 1) AND (ISNULL(s.ItemTot, 0) > 0) AND (ISNULL(s.cmplt, 0) = 0) AND (dbo.f_GetPcsShipped_SOitem(s.SOitem) >= a.Pieces * 0.9) AND (s.ShipDue <= CONVERT(DATE, GETDATE())) OR
                         (ISNULL(s.cncld, 0) < 1) AND (ISNULL(s.ItemTot, 0) > 0) AND (ISNULL(s.cmplt, 0) = 0) AND (s.ShipDue <= DATEADD(YEAR, - 1, GETDATE())) AND (s.ShipDue <= CONVERT(DATE, GETDATE()))
' 
GO

/****** Object:  View [dbo].[v_TC_Employees_LastClockStatus]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_TC_Employees_LastClockStatus]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_TC_Employees_LastClockStatus]
AS
SELECT        TOP (100) PERCENT tr.Id, tc.EmployeeId, tc.Name, CASE WHEN ad1.[ActivityId] = 1 OR
                         ad1.[ActivityId] = 2 THEN tr.TimeIn ELSE NULL END AS TimeIn, CASE WHEN ad2.[ActivityId] = 1 OR
                         ad2.[ActivityId] = 2 THEN tr.TimeOut ELSE NULL END AS TimeOut
FROM            dbo.v_TimeClockPlus_EmployeeList AS tc LEFT OUTER JOIN
                             (SELECT        i.EmployeeId, MAX(i.Id) AS Id
                               FROM            dbo.TC_Replacement_Employees_Times AS i LEFT OUTER JOIN
                                                         dbo.TC_Replacement_Employees_Times_ActivityDefinition AS ad1 ON i.InActivityType = ad1.ActivityId LEFT OUTER JOIN
                                                         dbo.TC_Replacement_Employees_Times_ActivityDefinition AS ad2 ON i.OutActivityType = ad2.ActivityId
                               WHERE        (ad1.ActivityId = 1) OR
                                                         (ad1.ActivityId = 2) OR
                                                         (ad2.ActivityId = 1) OR
                                                         (ad2.ActivityId = 2)
                               GROUP BY i.EmployeeId) AS trID ON tc.EmployeeId = trID.EmployeeId LEFT OUTER JOIN
                         dbo.TC_Replacement_Employees_Times AS tr ON trID.Id = tr.Id LEFT OUTER JOIN
                         dbo.TC_Replacement_Employees_Times_ActivityDefinition AS ad1 ON tr.InActivityType = ad1.ActivityId LEFT OUTER JOIN
                         dbo.TC_Replacement_Employees_Times_ActivityDefinition AS ad2 ON tr.OutActivityType = ad2.ActivityId
ORDER BY tc.EmployeeId
' 
GO
/****** Object:  View [dbo].[v_rtr_Detail]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_rtr_Detail]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_rtr_Detail]
AS
SELECT        dbo.rtr.*, dbo.rtr_Operation.Operation, dbo.rtr_Detail.Detail, dbo.rtr_Detail.EstStart, dbo.rtr_Detail.Started AS Expr1, dbo.rtr_Detail.StartDate, dbo.rtr_Detail.EstFinish, dbo.rtr_Detail.Finished AS Expr2, dbo.rtr_Detail.FinishDate, 
                         dbo.rtr_Detail.Oper_ID, dbo.rtr_Detail.Oper_Note, dbo.rtr_Detail.POitem, dbo.rtr_Detail.Cncld AS Expr3, dbo.rtr_Detail.CnclDate, dbo.rtr_Detail.ReqSched, dbo.rtr_Detail.EstTime, dbo.rtr_Detail.ActTime, dbo.rtr_Detail.Rely_On, 
                         dbo.rtr_Detail.Next_Up, dbo.rtr_Detail.Synchro, dbo.rtr_Detail.TBL, dbo.rtr_Detail.ID_Detail_Process
FROM            dbo.rtr INNER JOIN
                         dbo.rtr_Detail ON dbo.rtr.ID = dbo.rtr_Detail.rtr_ID INNER JOIN
                         dbo.rtr_Operation ON dbo.rtr_Detail.Oper_ID = dbo.rtr_Operation.Oper_ID
' 
GO
/****** Object:  View [dbo].[vSalesP_Out_Day]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSalesP_Out_Day]'))
EXEC dbo.sp_executesql @statement = N'/*, JC.Descript
*FROM TimeClockPlus.dbo.EmployeeHours AS H */
CREATE VIEW [dbo].[vSalesP_Out_Day]
AS
SELECT        E.Login, SUM(DATEDIFF(hour, H.TimeIn, H.TimeOut)) AS Hours, '''' AS Descript
FROM            dbo.TC_Replacement_Employees_Times AS H WITH (NOLOCK) INNER JOIN
                         dbo.Employee AS E WITH (NOLOCK) ON E.TC_ID = H.EmployeeId
WHERE        (CAST(H.TimeIn AS date) = CAST(GETDATE() AS date)) AND (YEAR(H.TimeIn) = YEAR(GETDATE()))
GROUP BY E.Login
' 
GO
/****** Object:  View [dbo].[vActiveSalesP]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vActiveSalesP]'))
EXEC dbo.sp_executesql @statement = N'/*SELECT * FROM dbo.AppSetup WHERE [PRP] like ''ActiveSales         ''*/
CREATE VIEW [dbo].[vActiveSalesP]
AS
SELECT DISTINCT TOP (100) PERCENT SalesP, dbo.f_SaleRep_SP(SalesP) AS SalesRep, dbo.f_Get_SalesP_Email(SalesP) AS Email
FROM            dbo.AllQuotes WITH (NOLOCK)
WHERE        (InqDate > GETDATE() - 365) AND (SalesNum > 0)
GROUP BY SalesP
HAVING        (COUNT(SalesP) > 10)
ORDER BY SalesP
' 
GO



/****** Object:  View [dbo].[vSalesP_Out_Week]    Script Date: 12/26/2025 5:48:52 PM ******/
/*SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSalesP_Out_Week]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vSalesP_Out_Week]
AS
SELECT     E.Login, SUM(DATEDIFF(hour, H.TimeIn, H.TimeOut)) AS Hours, JC.Descript, DATEPART(wk, H.TimeIn) AS Week
FROM         TimeClockPlus.dbo.EmployeeHours AS H INNER JOIN
                      dbo.Employee AS E ON E.TC_ID = H.EmployeeId INNER JOIN
                      dbo.vActiveSalesP AS SP ON SP.SalesP = E.SalesP INNER JOIN
                      dbo.NR_TimeClock_JobCode AS JC ON JC.JobCode = H.JobCode
WHERE     (DATEPART(wk, H.TimeIn) = DATEPART(wk, GETDATE())) AND (YEAR(H.TimeIn) = YEAR(GETDATE()))
GROUP BY E.Login, JC.Descript, DATEPART(wk, H.TimeIn)
' 
GO
*/

/****** Object:  View [dbo].[Sales Due to Ship]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Sales Due to Ship]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Sales Due to Ship]
AS
SELECT     TOP (100) PERCENT RTRIM(sa.company) AS Company, RTRIM(sn.salesrep) AS SalesRep, s.soitem, s.shipdue, s.shipped, s.itemsale AS [Item Sale], SUM(ps.PCs) 
                      AS [Pieces Shipped], SUM(a.pieces) AS [Pieces Quoted], CASE WHEN s.shipdue < DATEADD(mm, 0, CONVERT(char(4), YEAR(GETDATE())) + ''/'' + CONVERT(CHAR(2), 
                      MONTH(GETDATE())) + ''/'' + ''01'') THEN ''Prior Months Late'' WHEN s.shipdue >= DATEADD(mm, 1, CONVERT(char(4), YEAR(GETDATE())) + ''/'' + CONVERT(CHAR(2), 
                      MONTH(GETDATE())) + ''/'' + ''01'') THEN ''Future Months Due'' ELSE ''Current Month Due'' END AS Type
FROM         dbo.Sales AS s INNER JOIN
                      dbo.AllQuotes AS a ON s.soitem = a.SOitem INNER JOIN
                      dbo.Sales_No AS sn ON s.salesnum = sn.salesnum INNER JOIN
                      dbo.SoldAddr AS sa ON sa.soldcode = sn.psoldaddr FULL OUTER JOIN
                      dbo.PackingSlip AS ps ON ps.SOitem = s.soitem
WHERE     (ISNULL(s.cncld, 0) < 1) AND (ISNULL(s.itemtot, 0) > 0) AND (s.shipdue < DATEADD(mm, 4, CONVERT(char(4), YEAR(GETDATE())) + ''/'' + CONVERT(CHAR(2), 
                      MONTH(GETDATE())) + ''/'' + ''01'')) AND (sn.salesrep <> ''David Kirchner'') AND (ISNULL(s.cmplt, 0) = 0)
GROUP BY s.soitem, sa.company, sn.salesrep, s.shipdue, s.shipped, s.itemsale, s.cmplt
ORDER BY s.shipdue
' 
GO
/****** Object:  View [dbo].[v_SalesWithTasks]    Script Date: 12/26/2025 5:48:52 PM ******/



/*GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_SalesWithTasks]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_SalesWithTasks]
AS
SELECT DISTINCT 
                         dbo.AllQuotes.SalesP, dbo.Sales.SOitem, dbo.Sales.SalesNum, dbo.Sales.Item, dbo.AllQuotes.SaleDate, dbo.Sales.ShipDue, dbo.Sales.Shipped, dbo.Sales.Urgent, dbo.Sales.cncld, dbo.Sales.cmplt, 
                         dbo.Task_SOi.Location
FROM            dbo.AllQuotes INNER JOIN
                         dbo.Sales ON dbo.AllQuotes.SOitem = dbo.Sales.SOitem INNER JOIN
                         dbo.Task_SOi ON dbo.Sales.SOitem = dbo.Task_SOi.SOitem
' 
GO
*/




/****** Object:  View [dbo].[vFedEx]    Script Date: 12/26/2025 5:48:52 PM ******/
/*

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vFedEx]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vFedEx]
AS
SELECT        dbo.PackingSlip_No.packingsli, dbo.PackingSlip_No.ps_date, dbo.PackingSlip_No.packedby, dbo.PackingSlip_No.checkedby, dbo.PackingSlip_No.carton, dbo.PackingSlip_No.totalweight, dbo.PackingSlip_No.shippedvia, 
                         dbo.PackingSlip_No.all_po, dbo.PackingSlip_No.all_so, dbo.PackingSlip_No.tracking, dbo.PackingSlip_No.freightcharge, dbo.PackingSlip_No.dutytax, dbo.PackingSlip_No.cod, dbo.PackingSlip_No.codcheck, 
                         dbo.PackingSlip_No.codfreightfee, dbo.PackingSlip_No.box_size, dbo.PackingSlip_No.packedweight, dbo.ShipAddr.company, dbo.ShipAddr.addr1, dbo.ShipAddr.addr2, dbo.ShipAddr.city, dbo.ShipAddr.st, dbo.ShipAddr.zip, 
                         dbo.ShipAddr.country, dbo.ShipAddr.contact, dbo.ShipAddr.telephone, dbo.ShipAddr.fax_number, dbo.ShipAddr.email
FROM            dbo.PackingSlip_No WITH (NOLOCK) INNER JOIN
                         dbo.ShipAddr ON dbo.PackingSlip_No.shipcode = dbo.ShipAddr.shipcode
' 
GO

*/





/****** Object:  View [dbo].[v_POWithTasks]    Script Date: 12/26/2025 5:48:52 PM ******/
/*
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_POWithTasks]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_POWithTasks]
AS
SELECT DISTINCT 
                         dbo.PurchaseOrder.POitem, dbo.PurchaseOrder.HPApo, dbo.PurchaseOrder.ItemPO, dbo.PurchaseOrder.SalesP, dbo.PurchaseOrder.Due_Min, dbo.PurchaseOrder.Due_Max, dbo.PurchaseOrder.OrderDate, 
                         dbo.PurchaseOrder.Received, dbo.PurchaseOrder.Delivered, dbo.PurchaseOrder.Cancelled, dbo.PurchaseOrder.HPA_Due_Min, dbo.PurchaseOrder.HPA_Due_Max, dbo.Task_POi.Location
FROM            dbo.PurchaseOrder INNER JOIN
                         dbo.Task_POi ON dbo.PurchaseOrder.POitem = dbo.Task_POi.POitem
' 
GO
*/






/****** Object:  View [dbo].[AllQuote_SalesP_Quotes]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AllQuote_SalesP_Quotes]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[AllQuote_SalesP_Quotes]
AS
SELECT     TOP (100) PERCENT un,
                          (SELECT     COUNT(*) AS Expr1
                            FROM          dbo.allquotes AS AQ
                            WHERE      (salesp = App.ans) AND (inqdate > GETDATE() - 1)) AS Today,
                          (SELECT     COUNT(*) AS Expr1
                            FROM          dbo.allquotes AS AQ
                            WHERE      (salesp = App.ans) AND (inqdate > GETDATE() - 8)) AS Quote7,
                          (SELECT     COUNT(*) AS Expr1
                            FROM          dbo.allquotes AS AQ
                            WHERE      (salesp = App.ans) AND (inqdate > GETDATE() - 8) AND (open_ = 1)) AS Open7,
                          (SELECT     COUNT(*) AS Expr1
                            FROM          dbo.allquotes AS AQ
                            WHERE      (salesp = App.ans) AND (inqdate > GETDATE() - 8) AND (salesnum > 0)) AS Sold7,
                          (SELECT     COUNT(*) AS Expr1
                            FROM          dbo.allquotes AS AQ
                            WHERE      (salesp = App.ans) AND (inqdate > GETDATE() - 32)) AS Quote31,
                          (SELECT     COUNT(*) AS Expr1
                            FROM          dbo.allquotes AS AQ
                            WHERE      (salesp = App.ans) AND (inqdate > GETDATE() - 32) AND (open_ = 1)) AS Open31,
                          (SELECT     COUNT(*) AS Expr1
                            FROM          dbo.allquotes AS AQ
                            WHERE      (salesp = App.ans) AND (inqdate > GETDATE() - 32) AND (salesnum > 0)) AS Sold31,
                          (SELECT     COUNT(*) AS Expr1
                            FROM          dbo.allquotes AS AQ
                            WHERE      (salesp = App.ans) AND (inqdate > GETDATE() - 91)) AS Quote90,
                          (SELECT     COUNT(*) AS Expr1
                            FROM          dbo.allquotes AS AQ
                            WHERE      (salesp = App.ans) AND (inqdate > GETDATE() - 91) AND (open_ = 1)) AS Open90,
                          (SELECT     COUNT(*) AS Expr1
                            FROM          dbo.allquotes AS AQ
                            WHERE      (salesp = App.ans) AND (inqdate > GETDATE() - 91) AND (salesnum > 0)) AS Sold90
FROM         dbo.AppSetup AS App
WHERE     (prp = ''SalesP'') AND (ans <> ''0'') AND
                          ((SELECT     COUNT(*) AS Expr1
                              FROM         dbo.allquotes AS AQ
                              WHERE     (salesp = App.ans) AND (inqdate > GETDATE() - 32)) > 0)
' 
GO
/****** Object:  View [dbo].[vStockProj]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vStockProj]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vStockProj]
AS
SELECT        SP.ID, SP.Company, SP.Alloy, SP.Form, SP.CC, SP.CL, SP.Thck, SP.YearInches, SP.YearPounds, SP.MinPounds, SP.OverSize, SP.SThck, SP.SNomThck, SP.CW, SP.Sdate, SP.PoundsTaken, SP.UT, SP.FollowM, SP.FollowLot, 
                         PT.CWCnt, PT.CWMin, PT.CWAvg, PT.CWMedian, PT.CWMax, PT.StartDia, CL.text AS CLText,
                             (SELECT        ISNULL(SUM(WOD.fWeight), 0) AS Expr1
                               FROM            dbo.WorkOrder AS WO WITH (NOLOCK) INNER JOIN
                                                         dbo.WorkOrder_Detail AS WOD WITH (NOLOCK) ON WO.WO = WOD.WO
                               WHERE        (WOD.Stock_Projected_ID = SP.ID) AND (ISNULL(WOD.fCmplt, 0) = 0) AND (ISNULL(WOD.fCncld, 0) = 0)) AS fWeight, SP.YearPounds -
                             (SELECT        ISNULL(SUM(WOD.fWeight), 0) AS Expr1
                               FROM            dbo.WorkOrder AS WO WITH (NOLOCK) INNER JOIN
                                                         dbo.WorkOrder_Detail AS WOD WITH (NOLOCK) ON WO.WO = WOD.WO
                               WHERE        (WOD.Stock_Projected_ID = SP.ID) AND (ISNULL(WOD.fCmplt, 0) = 0) AND (ISNULL(WOD.fCncld, 0) = 0)) AS LBS_Needed
FROM            dbo.Stock_Projected AS SP WITH (NOLOCK) INNER JOIN
                         dbo.PriceTable AS PT WITH (NOLOCK) ON SP.Alloy = PT.Alloy AND SP.Form = PT.Form AND SP.Thck = PT.Size AND SP.CC = PT.CC AND SP.CL = PT.CL INNER JOIN
                         dbo.ConditionLevel AS CL WITH (NOLOCK) ON SP.CC = CL.CC AND SP.CL = CL.CL
' 
GO
/****** Object:  View [dbo].[SO_SalesP_YearQuarter]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[SO_SalesP_YearQuarter]'))
EXEC dbo.sp_executesql @statement = N'
Create VIEW [dbo].[SO_SalesP_YearQuarter]
 
AS
--SELECT * FROM SO_SalesP_YearQuarter

SELECT TOP 100 PERCENT
dbo.[f_YearQuarter](allquotes.Saledate) AS YearQ
, SalesP
, ''Sales'' = SUM( CASE WHEN allquotes.SalesNum > 0 Then 1 ELSE 0 END )
, ''SalesTotal'' = SUM( Sales.ItemSale )
, ''Broker'' = SUM( CASE WHEN allquotes.SalesNum > 0 AND AllQuotes.HpaPO > 0 Then 1 ELSE 0 END )
, ''BrokerTotal'' = SUM(CASE WHEN allquotes.SalesNum > 0 AND AllQuotes.HpaPO > 0 THEN Sales.ItemSale ELSE 0 END)


FROM dbo.allquotes allquotes LEFT OUTER JOIN dbo.Sales ON allquotes.SOitem = Sales.Soitem
WHERE (allquotes.services=0) AND YEAR(allquotes.Saledate) >= ( YEAR(GetDate()) - 3)
GROUP BY dbo.[f_YearQuarter](allquotes.Saledate)
, SalesP
--HAVING SUM(AllQuotes.Lotp) > 5000

' 
GO
/****** Object:  UserDefinedFunction [dbo].[TVF_StockLst_Year_End_Total]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TVF_StockLst_Year_End_Total]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[TVF_StockLst_Year_End_Total] 
()
RETURNS TABLE
AS
RETURN

--SELECT * FROM dbo.TVF_StockLst_Year_End_Total() ORDER BY GL_Inv, Due, WRK

--use [ERP_1]
SELECT X.GL_INV, dbo.f_Get_Alloy_GL_Inv(X.GL_INV) AS Alloy
, X.Due
, X.WRK
, X.Total
FROM (
SELECT T.GL_Inv
--,dbo.f_Get_Alloy_GL_Inv(T.GL_INV) AS Alloy
,T.Due
,T.WRK
,SUM(T.S_Total) AS Total	
FROM (
SELECT 
dbo.f_Alloy_GL_Inv(M.Alloy) AS GL_Inv
--,dbo.f_Get_Machine_fromLot(M.Lot) AS Mach
--,ISNULL(M.WO_Detail,0) AS WO_D
--,ISNULL((SELECT ''Worked'' AS Worked FROM dbo.PurchaseOrder P WHERE M.PO_item = P.POitem AND (P.Services=1 OR P.ConvServ=1 or P.Equipment = 1) ),'''')  AS Worked
, CASE When LEN(dbo.f_Get_Machine_fromLot(M.Lot)) > 0 
	OR WO_Detail > 0 
	OR LEN(ISNULL((SELECT ''Worked'' AS Worked FROM dbo.PurchaseOrder P WHERE M.PO_item = P.POitem AND (P.Services=1 OR P.ConvServ=1 or P.Equipment = 1) ),'''') ) > 0 Then ''Wrk''
	Else '''' END AS WRK 
,CASE when M.Heat like ''Due In%'' Then ''Due'' ELSE '''' END AS [Due]
,M.ID, M.Alloy, M.MWeight, M.Paid, M.mS_QTY
,D.S_QTY, D.S_P, D.S_Total, D.S_PU, D.Prime
FROM dbo.StockLst_Master M
inner join dbo.StockLst_Detail D ON M.ID=D.ID 
--ORDER BY GL_Inv, Mach
) T
GROUP BY T.GL_Inv, T.Due, T.WRK
) X
--ORDER BY GL_Inv, Due, WRK

/*WRK means: Price needs updated with Costing
Found f_Get_Machine_fromLot(M.Lot)
OR WO_Detail is > 0
OR PO_item IS (Services ConvServ Equipment)

*Due means thier is incoming PO or a WorkOrder Due to produce Stock
*/' 
END
GO
/****** Object:  View [dbo].[StockLst_View]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_View]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[StockLst_View]
AS
SELECT        TOP (100) PERCENT M.Alloy, M.Form, M.CC, M.Size, D.Weight AS dWeight, M.Cond, M.Specs, M.Heat, M.Lot, M.Paid, M.ID, CASE WHEN poduedate = ''01/01/1900'' THEN CONVERT(CHAR(10), '' '', 101) ELSE CONVERT(CHAR(10), 
                         PoDueDate, 101) END AS cPODueDate, M.Mill, M.History, M.Num, M.PO_item, D.PC, D.Size_H, D.Dim1, D.Size_L, D.Dim2, D.Dim3, D.Length, D.Weight, D.CostValue, D.Descript, D.Location, D.FloorStatus, D.Class, D.Unit, 
                         D.InvCheck, 0 AS Prc, M.Melt, 0 AS Bkr, D.ID_Detail, M.POStatus, M.FROM_ID, CASE WHEN stkdate = ''01/01/1900'' THEN CONVERT(CHAR(10), '' '', 101) ELSE CONVERT(CHAR(10), stkdate, 101) END AS cStkDate, D.ReceivingID, 
                         D.RandLen, M.BrandName, D.LiveCheck, dbo.Forms.FormSort, D.Prime, D.Quarantine,
                             (SELECT        ISNULL(SUM(StockLst_Process_1.Prc_QTY), 0) AS SoldLB
                               FROM            dbo.StockLst_Detail AS Stocklst_Detail_1 LEFT OUTER JOIN
                                                         dbo.StockLst_Process AS StockLst_Process_1 ON Stocklst_Detail_1.ID_Detail = StockLst_Process_1.ID_Detail
                               WHERE        (Stocklst_Detail_1.ID_Detail = D.ID_Detail)) AS SoldLB, 0 AS DueLB, M.MillTrace, M.CL
FROM            dbo.Stocklst_Master AS M INNER JOIN
                         dbo.StockLst_Detail AS D ON M.ID = D.ID INNER JOIN
                         dbo.Forms ON M.Form = dbo.Forms.FormNumber
WHERE        (M.Heat NOT LIKE ''%Due In%'')
' 
GO
/****** Object:  View [dbo].[AllQuotes_Monthly_Sales_for_Year]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AllQuotes_Monthly_Sales_for_Year]'))
EXEC dbo.sp_executesql @statement = N'
/****** Object:  View dbo.AllQuotes_Monthly_Sales_for_Year    Script Date: 5/4/2006 1:26:10 PM ******/

/****** Object:  View dbo.AllQuotes_Monthly_Sales_for_Year    Script Date: 9/1/2005 2:36:53 PM ******/

CREATE   VIEW [dbo].[AllQuotes_Monthly_Sales_for_Year]
 
AS

SELECT TOP 100 PERCENT
 MONTH(allquotes.shipdate) AS Month
, allquotes.alloy
, allquotes.Form
, SUM(allquotes.pieces) AS Pcs
, CAST(allquotes.thck*10 AS INT) AS ThckX10
, CAST(SUM(allquotes.weight) AS INT) AS Lbs
, CAST(SUM(allquotes.cweight) AS INT) AS cLbs
FROM dbo.allquotes allquotes
WHERE  (allquotes.shipdate > GETDATE()-256) AND (allquotes.services=0)
GROUP BY MONTH( allquotes.shipdate ), allquotes.Alloy, allquotes.Form, CAST(allquotes.thck*10 AS INT)
ORDER BY MONTH( allquotes.shipdate ), allquotes.Alloy, allquotes.Form, CAST(allquotes.thck*10 AS INT)
--, allquotes.inqnump
--, allquotes.randlen
--, allquotes.metric



' 
GO
/****** Object:  View [dbo].[AllQuotes_Monthly_Bar_Sales_for_Alloy_Year]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AllQuotes_Monthly_Bar_Sales_for_Alloy_Year]'))
EXEC dbo.sp_executesql @statement = N'
/****** Object:  View dbo.AllQuotes_Monthly_Bar_Sales_for_Alloy_Year    Script Date: 5/4/2006 1:25:15 PM ******/

/****** Object:  View dbo.AllQuotes_Monthly_Bar_Sales_for_Alloy_Year    Script Date: 9/1/2005 3:56:54 PM ******/

/****** Object:  View dbo.AllQuotes_Monthly_Bar_Sales_for_Alloy_Year    Script Date: 9/1/2005 10:55:16 AM ******/

CREATE   VIEW [dbo].[AllQuotes_Monthly_Bar_Sales_for_Alloy_Year]
 

AS

SELECT TOP 100 PERCENT
 MONTH(allquotes.shipdate) AS Month
, allquotes.alloy
, SUM(allquotes.pieces) AS Pcs
, CAST(allquotes.thck*10 AS INT) AS ThckX10
, CAST(SUM(allquotes.weight) AS INT) AS Lbs
, CAST(SUM(allquotes.cweight) AS INT) AS cLbs
FROM dbo.allquotes allquotes
WHERE ((allquotes.alloy=''6B'') AND (allquotes.form=''10'') AND (allquotes.shipdate>GETDATE()-256) AND (allquotes.services=0)) 
OR ((allquotes.alloy=''C-276'') AND (allquotes.form=''10'') AND (allquotes.shipdate>GETDATE()-256) AND (allquotes.services=0)) 
OR ((allquotes.alloy=''HPA N50'') AND (allquotes.form=''10'') AND (allquotes.shipdate>GETDATE()-256) AND (allquotes.services=0)) 
OR ((allquotes.alloy=''HPA N60'') AND (allquotes.form=''10'') AND (allquotes.shipdate>GETDATE()-256) AND (allquotes.services=0))

GROUP BY MONTH( allquotes.shipdate ), allquotes.Alloy, CAST(allquotes.thck*10 AS INT)
ORDER BY MONTH( allquotes.shipdate ), allquotes.Alloy, CAST(allquotes.thck*10 AS INT)
--, allquotes.inqnump
--, allquotes.randlen
--, allquotes.metric




' 
GO
/****** Object:  View [dbo].[AllQuotes_Monthly_Sales_for_Alloy_Year]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AllQuotes_Monthly_Sales_for_Alloy_Year]'))
EXEC dbo.sp_executesql @statement = N'
/****** Object:  View dbo.AllQuotes_Monthly_Sales_for_Alloy_Year    Script Date: 5/4/2006 1:25:55 PM ******/

/****** Object:  View dbo.AllQuotes_Monthly_Sales_for_Alloy_Year    Script Date: 9/1/2005 3:56:26 PM ******/

/****** Object:  View dbo.AllQuotes_Monthly_Sales_for_Alloy_Year    Script Date: 9/1/2005 10:55:27 AM ******/

CREATE   VIEW [dbo].[AllQuotes_Monthly_Sales_for_Alloy_Year]
 

AS

SELECT TOP 100 PERCENT
 MONTH(allquotes.shipdate) AS Month
, allquotes.alloy
, allquotes.Form
, SUM(allquotes.pieces) AS Pcs
, CAST(allquotes.thck*10 AS INT) AS ThckX10
, CAST(SUM(allquotes.weight) AS INT) AS Lbs
, CAST(SUM(allquotes.cweight) AS INT) AS cLbs
FROM dbo.allquotes allquotes
WHERE ((allquotes.alloy=''6B'') AND (allquotes.shipdate>GETDATE()-256) AND (allquotes.services=0)) 
OR ((allquotes.alloy=''C-276'') AND (allquotes.shipdate>GETDATE()-256) AND (allquotes.services=0)) 
OR ((allquotes.alloy=''HPA N50'')  AND (allquotes.shipdate>GETDATE()-256) AND (allquotes.services=0)) 
OR ((allquotes.alloy=''HPA N60'')  AND (allquotes.shipdate>GETDATE()-256) AND (allquotes.services=0))

GROUP BY MONTH( allquotes.shipdate ), allquotes.Alloy, allquotes.Form, CAST(allquotes.thck*10 AS INT)
ORDER BY MONTH( allquotes.shipdate ), allquotes.Alloy, allquotes.Form, CAST(allquotes.thck*10 AS INT)
--, allquotes.inqnump
--, allquotes.randlen
--, allquotes.metric




' 
GO
/****** Object:  View [dbo].[vUPS_WorldShip]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vUPS_WorldShip]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vUPS_WorldShip]
AS
SELECT        TOP (100) PERCENT dbo.PackingSlip_No.packingsli, dbo.PackingSlip_No.shipcode, dbo.PackingSlip_No.all_po, dbo.PackingSlip_No.all_so, dbo.PackingSlip_No.cod, dbo.PackingSlip_No.codcheck, 
                         dbo.PackingSlip_No.codfreightfee, dbo.ShipAddr.company, dbo.ShipAddr.addr1, dbo.ShipAddr.addr2, dbo.ShipAddr.city, dbo.ShipAddr.st, dbo.ShipAddr.zip, dbo.ShipAddr.country, dbo.ShipAddr.contact, dbo.ShipAddr.telephone, 
                         dbo.ShipAddr.email, CASE WHEN email LIKE ''%@%'' THEN ''N'' ELSE ''Y'' END AS eMailOpt, ''Answers@ERP_1s.com'' AS Failedemail, '''' AS EmailMemo, dbo.UPSStdShiproute.upsstand
FROM            dbo.PackingSlip_No WITH (NOLOCK) INNER JOIN
                         dbo.ShipAddr ON dbo.PackingSlip_No.shipcode = dbo.ShipAddr.shipcode INNER JOIN
                         dbo.UPSStdShiproute ON dbo.PackingSlip_No.shippedvia = dbo.UPSStdShiproute.shiproute
ORDER BY dbo.PackingSlip_No.packingsli
' 
GO
/****** Object:  View [dbo].[Shop_Edit_StockLst]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Shop_Edit_StockLst]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Shop_Edit_StockLst]
AS
SELECT     TOP (100) PERCENT M.Alloy, M.Form, M.CC, M.Size, CAST(D.Weight AS DECIMAL(9, 0)) AS dWeight, M.Cond, M.Specs, M.Heat, M.Lot, M.Paid, M.ID, CASE WHEN poduedate = ''01/01/1900'' THEN CONVERT(CHAR(10), '' '', 101) ELSE CONVERT(CHAR(10), PoDueDate, 101) END AS cPODueDate, 
                  M.Mill, M.History, M.Num, M.PO_item, D.PC, D.Size_H, D.Dim1, D.Size_L, D.Dim2, D.Dim3, D.Length, CAST(ISNULL(D.Weight, 0) AS DECIMAL(9, 1)) AS weight, D.CostValue, D.Descript, D.Location, D.FloorStatus, D.Class, D.Unit,
                      (SELECT     COUNT(*) AS Expr1
                       FROM        dbo.StockLst_Process AS SP
                       WHERE     (D.ID_Detail = ID_Detail) AND (Process_ID = ''SELECTED'')) AS Prc, 0 AS Bkr, D.ID_Detail, M.POStatus, M.FROM_ID, CASE WHEN stkdate = ''01/01/1900'' THEN CONVERT(CHAR(10), '' '', 101) ELSE CONVERT(CHAR(10), stkdate, 101) END AS cStkDate, ISNULL(D.ReceivingID, 0) 
                  AS ReceivingID, D.RandLen, ISNULL(M.BrandName, '''') AS BrandName, CONVERT(CHAR(10), D.InvCheck, 101) AS cInvCheck, C.CCSortValue, D.Quarantine, dbo.Forms.FormSort, D.InvCheck, M.Melt, D.Prime, M.CL, M.MillTrace
FROM        dbo.Stocklst_Master AS M WITH (NOLOCK) INNER JOIN
                  dbo.StockLst_Detail AS D WITH (NOLOCK) ON M.ID = D.ID INNER JOIN
                  dbo.ConditionCode AS C WITH (NOLOCK) ON M.CC = C.CC INNER JOIN
                  dbo.Forms WITH (NOLOCK) ON M.Form = dbo.Forms.FormNumber
' 
GO
/****** Object:  View [dbo].[DLA_Purchase_Orders]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[DLA_Purchase_Orders]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[DLA_Purchase_Orders]
AS
SELECT        dbo.PurchaseOrder.POitem, dbo.PurchaseOrder.BMScheck AS Approved, dbo.PurchaseOrder.HPApo
FROM            dbo.PurchaseOrder WITH (NOLOCK) INNER JOIN
                         dbo.Vendor WITH (NOLOCK) ON dbo.PurchaseOrder.VendCode = dbo.Vendor.VendCode
WHERE        (dbo.Vendor.DLA_BMS = 1) AND (dbo.PurchaseOrder.OrderDate <= CONVERT(DateTIme, ''2011-12-21'')) AND (ISNULL(dbo.PurchaseOrder.BMScheck, 0) <> 1) AND (ISNULL(dbo.PurchaseOrder.Cancelled, 0) <> 1)
' 
GO
/****** Object:  View [dbo].[StockLst_Quick]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Quick]'))
EXEC dbo.sp_executesql @statement = N'
/****** Object:  View dbo.StockLst_Quick    Script Date: 5/4/2006 1:28:51 PM ******/

CREATE  VIEW [dbo].[StockLst_Quick]
 
AS

SELECT TOP 100 PERCENT
  m.Alloy
, m.Form
, CC
--, CAST( CAST(m.Size*100 AS INT) AS DECIMAL(9,3) ) AS ThckX100
--, CAST(m.Size*100 AS INT) AS ThckX100
--, CAST( m.Size AS DECIMAL(6,3) ) AS ThckX100
--, m.Size AS Size
, ROUND(m.Size,2) AS Size
, SUM( m.mWeight ) AS TotalLbs
FROM dbo.stocklst_master M
GROUP BY Alloy, Form, cc
--, CAST(m.Size*100 AS INT) 
,m.Size
ORDER BY 
--Alloy, Form, cc,m.Size
--, CAST(m.Size*100 AS INT) 
ROUND(m.Size,2)





' 
GO
/****** Object:  View [dbo].[AllQuotes_SalesP_YearQuarter]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AllQuotes_SalesP_YearQuarter]'))
EXEC dbo.sp_executesql @statement = N'/*HAVING SUM(AllQuotes.Lotp) > 5000
ORDER BY dbo.[f_YearQuarter](allquotes.inqdate), SalesP
ORDER BY YearQ DESC, Sales DESC*/
CREATE VIEW [dbo].[AllQuotes_SalesP_YearQuarter]
AS
SELECT     TOP (100) PERCENT dbo.f_YearQuarter(allquotes.inqdate) AS YearQ, allquotes.salesp, SUM(1) AS Quotes, SUM(ISNULL(dbo.f_GetQuotedPriceTotal(allquotes.pieces, 
                      allquotes.sz3, allquotes.p_lb, allquotes.p_pc, allquotes.p_ft, allquotes.cuts, allquotes.otherp, allquotes.lotp, allquotes.weight, allquotes.clotp), 0)) AS QuoteTotal, 
                      SUM(CASE WHEN allquotes.SalesNum > 0 THEN 1 ELSE 0 END) AS Sales, SUM(dbo.sales.itemsale) AS SalesTotal, SUM(CASE WHEN allquotes.SalesNum > 0 AND 
                      AllQuotes.HpaPO > 0 THEN 1 ELSE 0 END) AS Broker, SUM(CASE WHEN allquotes.SalesNum > 0 AND AllQuotes.HpaPO > 0 THEN Sales.ItemSale ELSE 0 END) 
                      AS BrokerTotal
FROM         dbo.allquotes AS allquotes LEFT OUTER JOIN
                      dbo.sales ON allquotes.soitem = dbo.sales.soitem
WHERE     (allquotes.services = 0) AND (YEAR(allquotes.inqdate) >= YEAR(GETDATE()) - 3)
GROUP BY dbo.f_YearQuarter(allquotes.inqdate), allquotes.salesp
' 
GO
/****** Object:  View [dbo].[v_Emp_TC_Email]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_Emp_TC_Email]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_Emp_TC_Email]
AS
SELECT        RTRIM(LTRIM(un)) AS displayName, RTRIM(ans) AS mail
FROM            dbo.AppSetup AS A1 WITH (NOLOCK)
WHERE        (prp = ''E-mail'')
' 
GO
/****** Object:  View [dbo].[StockLst_Export]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Export]'))
EXEC dbo.sp_executesql @statement = N'/*ORDER BY M.Alloy, dbo.Forms.FormSort, M.CC, M.Size
ORDER BY M.Alloy, M.Form, dbo.Forms.FormSort, M.Size*/
CREATE VIEW [dbo].[StockLst_Export]
AS
SELECT        TOP (100) PERCENT M.Alloy, dbo.Forms.FormDescription, dbo.ConditionCode.text, M.Size, CAST(D.Weight AS INT) AS dWeight, D.PC, D.Size_H AS Tol_H, D.Dim1, D.Size_L AS Tol_L, D.Dim2, D.Dim3, D.Length, 
                         CAST(D.S_QTY AS INT) AS mQTY, M.Cond, M.Specs, D.Prime, dbo.Forms.FormSort
FROM            dbo.Stocklst_Master AS M INNER JOIN
                         dbo.Stocklst_Detail AS D ON M.ID = D.ID INNER JOIN
                         dbo.Forms ON M.Form = dbo.Forms.FormNumber INNER JOIN
                         dbo.ConditionCode ON M.CC = dbo.ConditionCode.CC
WHERE        (ISNULL(D.Quarantine, 0) < 1)
' 
GO
/****** Object:  View [dbo].[v_POitemDetail]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_POitemDetail]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_POitemDetail]
AS
SELECT        p.POitem, p.Company AS Customer, REPLACE(ISNULL(pn.Who, ISNULL(AppS.SalesPerson, ''NONE'')), ''WINDFALL\'', '''') AS SalesPerson
FROM            [ERP_1].[dbo].[PurchaseOrder] p WITH(NOLOCK) LEFT OUTER JOIN
                         [ERP_1].[dbo].[PO_NO] pn WITH(NOLOCK) ON p.HPApo = pn.HPAPO OUTER APPLY
                             (SELECT        TOP (1) [un] AS SalesPerson
                               FROM            [ERP_1].[dbo].[AppSetup] WITH(NOLOCK) 
                               WHERE        [prp] = ''SalesP'' AND ans = p.SalesP) AS AppS
' 
GO
/****** Object:  View [dbo].[Sales Due to Ship for Current Month]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Sales Due to Ship for Current Month]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Sales Due to Ship for Current Month]
AS
SELECT     TOP (100) PERCENT RTRIM(sa.company) AS Company, RTRIM(sn.salesrep) AS SalesRep, s.soitem, s.shipdue, s.shipped, s.itemsale AS [Item Sale], SUM(ps.PCs) 
                      AS [Pieces Shipped], SUM(a.pieces) AS [Pieces Quoted]
FROM         dbo.Sales AS s INNER JOIN
                      dbo.AllQuotes AS a ON s.soitem = a.SOitem INNER JOIN
                      dbo.Sales_No AS sn ON s.salesnum = sn.salesnum INNER JOIN
                      dbo.SoldAddr AS sa ON sa.soldcode = sn.psoldaddr FULL OUTER JOIN
                      dbo.PackingSlip AS ps ON ps.SOitem = s.soitem
WHERE     (ISNULL(s.cncld, 0) < 1) AND (ISNULL(s.itemtot, 0) > 0) AND (s.shipdue < DATEADD(mm, 1, CONVERT(char(4), YEAR(GETDATE())) + ''/'' + CONVERT(CHAR(2), 
                      MONTH(GETDATE())) + ''/'' + ''01'')) AND (sn.salesrep <> ''David Kirchner'') AND (ISNULL(s.cmplt, 0) = 0)
GROUP BY s.soitem, sa.company, sn.salesrep, s.shipdue, s.shipped, s.itemsale, s.cmplt
ORDER BY s.shipdue
' 
GO
/****** Object:  View [dbo].[v_PO_Hold_History]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_PO_Hold_History]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_PO_Hold_History]
AS
/*WHERE        Hold = 1 AND shs.ID IS NULL*/ SELECT ISNULL([ID], - 1) AS [ID], ISNULL(p.[SOitem], '''') AS [SOitem], ISNULL(p.[SalesNum], 0) AS [SalesNum], p.[POitem], ''PO'' AS [Hold_Type], p.[Hold] AS [Hold_Value], ISNULL(shs.[Who], 
                         ''Unknown'') AS [Who], ISNULL(shs.[What], ''PO On Hold'') AS [What], ISNULL(shs.[When], GETDATE()) AS [When], ISNULL(shs.[Comment], ''No Hold History. PO is on Hold.'') AS [Comment]
FROM            [ERP_1].[dbo].[PurchaseOrder] p WITH (NOLOCK) OUTER APPLY
                             (SELECT        *
                               FROM            (SELECT        TOP (1) [ID], [Hold_Type], [Hold_Value], [Who], [What], [When], [Comment]
                                                         FROM            [ERP_1].[dbo].[Sales_Hold_Status] shs WITH (NOLOCK)
                                                         WHERE        (upper(LTRIM(RTRIM(shs.Hold_Type))) = ''PO'') AND shs.[POitem] = p.[POitem]
                                                         ORDER BY [When] DESC) AS topOne
                               WHERE        p.Hold = topOne.Hold_Value) AS shs
WHERE        Hold = 1 OR
                         shs.[ID] > 0
UNION
SELECT        [ID], p.[SOitem], p.[SalesNum], shs.[POitem], [Hold_Type], [Hold_Value], [Who], [What], [When], [Comment]
FROM            [ERP_1].[dbo].[Sales_Hold_Status] shs WITH (NOLOCK) JOIN
                         [ERP_1].[dbo].[PurchaseOrder] p WITH (NOLOCK) ON shs.POitem = p.POitem
WHERE 
(
	upper(LTRIM(RTRIM(shs.Hold_Type))) = ''PO''
	OR
	(
		UPPER(LTRIM(RTRIM(shs.Hold_Type))) = ''RCV''
		AND
		shs.POitem IS NOT null
	)
)
' 
GO
/****** Object:  View [dbo].[v_SO_Hold_History]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_SO_Hold_History]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_SO_Hold_History]
AS
SELECT        shs.ID, shs.SOitem, shs.SalesNum, shs.POitem, shs.Hold_Type, shs.Hold_Value, shs.Who, shs.What, shs.[When], shs.Comment
FROM            dbo.Sales_Hold_Status AS shs WITH (NOLOCK) INNER JOIN
                         dbo.Sales AS s WITH (NOLOCK) ON shs.SOitem = s.SOitem
WHERE        (NOT (UPPER(LTRIM(RTRIM(shs.Hold_Type))) = ''PO'')) AND (NOT (UPPER(LTRIM(RTRIM(shs.Hold_Type))) = ''RCV'')) OR
                         (NOT (UPPER(LTRIM(RTRIM(shs.Hold_Type))) = ''PO'')) AND (NOT (shs.POitem <> NULL))
' 
GO
/****** Object:  UserDefinedFunction [dbo].[TVF_Broker_Process_QTY]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TVF_Broker_Process_QTY]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David Kirchner
-- Create date: 01/10/2019
-- Description:	Returns QTY Sumary for ID_Detail
-- =============================================

CREATE FUNCTION [dbo].[TVF_Broker_Process_QTY]
(@ID_Detail	INT)

RETURNS TABLE
AS

--SELECT * FROM dbo.TVF_Broker_Process_QTY(34355);

RETURN

(
	SELECT TOP 1
		ISNULL(MasterQTY,0)		AS MasterQTY
		,ISNULL(DetailQTY,0)	AS DetailQTY
		,ISNULL(DSelectedQTY,0)	AS DSelectedQTY
		,ISNULL(MSelectedQTY,0)	AS MSelectedQTY
		,ISNULL(DNoSubQTY,0)	AS DNoSubQTY
	FROM
	(
		SELECT M.mS_QTY AS MasterQTY 
			,D.S_QTY AS DetailQTY

			,(SELECT SUM(P.QTY) AS SelectedQTY 
				FROM dbo.BrokerLst_Process P 
				WHERE P.ID_Detail = D.ID_Detail  
				AND ( P.Process_ID  = ''SELECTED'' OR P.Process_ID  = ''PARTSELECT'' )
				)  AS DSelectedQTY 

			,(SELECT SUM(P.QTY) AS SelectedQTY 
				FROM dbo.BrokerLst_Detail D2
				INNER JOIN dbo.BrokerLst_Process P ON P.ID_Detail = D2.ID_Detail
				WHERE ( P.Process_ID  = ''SELECTED'' OR P.Process_ID  = ''PARTSELECT'' )
				AND D2.ID = (SELECT D3.ID FROM dbo.BrokerLst_Detail D3 WHERE D3.ID_Detail = D.ID_Detail)
				)  AS MSelectedQTY 

			,(SELECT SUM(P.QTY) AS SelectedQTY 
				FROM dbo.BrokerLst_Process P 
				WHERE P.ID_Detail = D.ID_Detail  
				AND ( P.Process_ID  = ''SELECTED'' OR P.Process_ID  = ''PARTSELECT'' )
				AND AllowSub = ''N''
				)  AS DNoSubQTY 

			FROM dbo.BrokerLst_Master M
			INNER JOIN dbo.BrokerLst_Detail D ON M.ID = D.ID 
			WHERE D.ID_Detail = @ID_Detail
	) tmp
);

--GRANT SELECT ON [dbo].TVF_Broker_Process_QTY TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[TVF_Stock_Process_QTY]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TVF_Stock_Process_QTY]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David Kirchner
-- Create date: 01/10/2019
-- Description:	Returns QTY Sumary for ID_Detail
-- =============================================

CREATE FUNCTION [dbo].[TVF_Stock_Process_QTY]
(@ID_Detail	INT)

RETURNS TABLE
AS

--SELECT * FROM dbo.TVF_Stock_Process_QTY(34355);

RETURN

(
	SELECT TOP 1
		ISNULL(MasterQTY,0)		AS MasterQTY
		,ISNULL(DetailQTY,0)	AS DetailQTY
		,ISNULL(DSelectedQTY,0)	AS DSelectedQTY
		,ISNULL(MSelectedQTY,0)	AS MSelectedQTY
		,ISNULL(DNoSubQTY,0)	AS DNoSubQTY
	FROM
	(
		SELECT M.mS_QTY AS MasterQTY 
			,D.S_QTY AS DetailQTY

			,(SELECT SUM(P.QTY) AS SelectedQTY 
				FROM dbo.StockLst_Process P 
				WHERE P.ID_Detail = D.ID_Detail  
				AND ( P.Process_ID  = ''SELECTED'' OR P.Process_ID  = ''PARTSELECT'' )
				)  AS DSelectedQTY 

			,(SELECT SUM(P.QTY) AS SelectedQTY 
				FROM dbo.Stocklst_Detail D2
				INNER JOIN dbo.StockLst_Process P ON P.ID_Detail = D2.ID_Detail
				WHERE ( P.Process_ID  = ''SELECTED'' OR P.Process_ID  = ''PARTSELECT'' )
				AND D2.ID = (SELECT D3.ID FROM dbo.Stocklst_Detail D3 WHERE D3.ID_Detail = D.ID_Detail)
				)  AS MSelectedQTY 

			,(SELECT SUM(P.QTY) AS SelectedQTY 
				FROM dbo.StockLst_Process P 
				WHERE P.ID_Detail = D.ID_Detail  
				AND ( P.Process_ID  = ''SELECTED'' OR P.Process_ID  = ''PARTSELECT'' )
				AND AllowSub = ''N''
				)  AS DNoSubQTY 

			FROM dbo.StockLst_Master M
			INNER JOIN dbo.Stocklst_Detail D ON M.ID = D.ID 
			WHERE D.ID_Detail = @ID_Detail
	) tmp
);

--GRANT SELECT ON [dbo].TVF_Stock_Process_QTY TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  View [dbo].[AllQuotes_Year_Month_Quotes]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AllQuotes_Year_Month_Quotes]'))
EXEC dbo.sp_executesql @statement = N'
/****** Object:  View dbo.AllQuotes_Year_Month_Quotes    Script Date: 5/4/2006 1:26:36 PM ******/


/****** Object:  View dbo.AllQuotes_Monthly_Sales_for_Year    Script Date: 9/1/2005 2:36:53 PM ******/

CREATE  VIEW [dbo].[AllQuotes_Year_Month_Quotes]
 
AS
SELECT TOP 100 PERCENT
YEAR(allquotes.inqdate) AS Year
, MONTH(allquotes.inqdate) AS Month
, ''Sale'' = CASE WHEN allquotes.SalesNum > 0 Then 1 ELSE 0 END
, allquotes.alloy
, allquotes.Form
--, SUM(allquotes.pieces) AS Pcs
, CAST(allquotes.thck*10 AS INT) AS ThckX10
, CAST(SUM(allquotes.weight) AS INT) AS Lbs
, CAST(SUM(allquotes.cweight) AS INT) AS cLbs
FROM dbo.allquotes allquotes
WHERE (allquotes.services=0) AND YEAR(allquotes.inqdate) > 1900
GROUP BY YEAR(allquotes.inqdate)
, MONTH( allquotes.inqdate )
, CASE WHEN allquotes.SalesNum > 0 Then 1 ELSE 0 END
, allquotes.Alloy
, allquotes.Form
, CAST(allquotes.thck*10 AS INT)
ORDER BY YEAR(allquotes.inqdate)
, MONTH( allquotes.inqdate )
, CASE WHEN allquotes.SalesNum > 0 Then 1 ELSE 0 END
, allquotes.Alloy
, allquotes.Form
, CAST(allquotes.thck*10 AS INT)


' 
GO
/****** Object:  View [dbo].[Sales_StockLst]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Sales_StockLst]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Sales_StockLst]
AS
SELECT     TOP (100) PERCENT M.alloy, M.form, M.cc, M.size, CAST(D .weight AS DECIMAL(9, 0)) AS dWeight, M.cond, M.specs, M.heat, M.lot, M.Paid, M.id, CASE WHEN poduedate = ''01/01/1900'' THEN CONVERT(CHAR(10), '' '', 101) ELSE CONVERT(CHAR(10), PoDueDate, 101) END AS cPODueDate, 
                  M.mill, M.history, M.num, M.po_item, D .pc, D .size_h, D .dim1, D .size_l, D .dim2, D .dim3, D .length, CAST(ISNULL(D .weight, 0) AS DECIMAL(9, 1)) AS weight, D .costvalue, D .descript, D .location, D .floorstatus, D .class, D .unit,
                      (SELECT     COUNT(*) AS Expr1
                       FROM        dbo.StockLst_Process AS SP
                       WHERE     (D .id_detail = id_detail) AND (process_id = ''SELECTED'')) AS Prc, 0 AS Bkr, D .id_detail, M.POStatus, M.FROM_ID, CASE WHEN stkdate = ''01/01/1900'' THEN CONVERT(CHAR(10), '' '', 101) ELSE CONVERT(CHAR(10), stkdate, 101) END AS cStkDate, ISNULL(D .ReceivingID, 0) 
                  AS ReceivingID, D .RandLen, ISNULL(M.BrandName, '''') AS BrandName, CONVERT(CHAR(10), D .InvCheck, 101) AS cInvCheck, C.CCSortValue, D .Quarantine, dbo.Forms.FormSort, D .InvCheck, M.MillTrace
FROM        dbo.Stocklst_Master AS M WITH (NOLOCK) INNER JOIN
                  dbo.Stocklst_Detail AS D WITH (NOLOCK) ON M.id = D .id INNER JOIN
                  dbo.ConditionCode AS C WITH (NOLOCK) ON M.cc = C.cc INNER JOIN
                  dbo.Forms WITH (NOLOCK) ON M.form = dbo.Forms.FormNumber
UNION
SELECT     W.Alloy, W.Form, W.CC, W.Size, CAST(W.MWeight AS DECIMAL(9, 0)) AS dWeight, W.Cond, W.Specs, W.Heat, '''' AS Lot, 0 AS Paid, W.ID, '''' AS cPODueDate, ''Wanted'' AS Mill, ''Item on Want List'' AS History, 0 AS Num, '''' AS PO_item, W.Pc, W.Size AS Size_h, W.Dim1, W.Size AS Size_l, 
                  W.Dim2, W.Dim3, '''' AS [Length], W.MWeight AS [Weight], 0 AS CostValue, W.Descript, ''Wanted'' AS Location, '''' AS FloorStatus, '''' AS Class, '''' AS Unit, 0 AS Prc, 0 AS Bkr, 0 AS ID_Detail, '''' AS POStatus, 0 AS FROM_ID, '''' AS cStkDate, 0 AS ReceivingID, 0 AS RandLen, W.BrandName, 
                  CONVERT(CHAR(10), GETDATE() + 1, 101) AS cInvCheck, W.CCSortValue, ''False'' AS Quarantine, W.FormSort, GETDATE() + 1 AS InvCheck, 1 AS MillTrace
FROM        dbo.Stocklst_Wants AS W WITH (NOLOCK)
UNION
SELECT     V.Alloy, V.Form, V.CC, V.Size, CAST(V.MWeight AS DECIMAL(9, 0)) AS dWeight, V.Cond, V.Specs, V.Heat, '''' AS Lot, 0 AS Paid, V.ID, '''' AS cPODueDate, Mill, ''Item on Mill Stock List'' AS History, 0 AS Num, '''' AS PO_item, V.Pc, V.Size AS Size_h, V.Dim1, V.Size AS Size_l, V.Dim2, V.Dim3, 
                  '''' AS [Length], V.MWeight AS [Weight], 0 AS CostValue, V.Descript, LEFT(V. Vendor, 10) AS Location, '''' AS FloorStatus, '''' AS Class, '''' AS Unit, 0 AS Prc, 0 AS Bkr, 0 AS ID_Detail, '''' AS POStatus, 0 AS FROM_ID, '''' AS cStkDate, 0 AS ReceivingID, 0 AS RandLen, V.BrandName, 
                  CONVERT(CHAR(10), GETDATE() + 2, 101) AS cInvCheck, V.CCSortValue, ''False'' AS Quarantine, V.FormSort, GETDATE() + 2 AS InvCheck, 1 AS MillTrace
FROM        dbo.Stocklst_Vendor AS V WITH (NOLOCK)
' 
GO
/****** Object:  UserDefinedFunction [dbo].[TVF_WIP_Process_QTY]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TVF_WIP_Process_QTY]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David Kirchner
-- Create date: 01/10/2019
-- Description:	Returns QTY Sumary for ID_Detail
-- =============================================

CREATE FUNCTION [dbo].[TVF_WIP_Process_QTY]
(@ID_Detail	INT)

RETURNS TABLE
AS
--Table Value Function
--SELECT * FROM dbo.TVF_WIP_Process_QTY(34355);

RETURN

(
	SELECT TOP 1
		ISNULL(MasterQTY,0)		AS MasterQTY
		,ISNULL(DetailQTY,0)	AS DetailQTY
		,ISNULL(DSelectedQTY,0)	AS DSelectedQTY
		,ISNULL(MSelectedQTY,0)	AS MSelectedQTY
		,ISNULL(DNoSubQTY,0)	AS DNoSubQTY
	FROM
	(
		SELECT M.mS_QTY AS MasterQTY 
			,D.S_QTY AS DetailQTY

			,(SELECT SUM(P.QTY) AS SelectedQTY 
				FROM dbo.WIPLst_Process P 
				WHERE P.ID_Detail = D.ID_Detail  
				AND ( P.Process_ID  = ''SELECTED'' OR P.Process_ID  = ''PARTSELECT'' )
				)  AS DSelectedQTY 

			,(SELECT SUM(P.QTY) AS SelectedQTY 
				FROM dbo.WIPLst_Detail D2
				INNER JOIN dbo.WIPLst_Process P ON P.ID_Detail = D2.ID_Detail
				WHERE ( P.Process_ID  = ''SELECTED'' OR P.Process_ID  = ''PARTSELECT'' )
				AND D2.ID = (SELECT D3.ID FROM dbo.WIPLst_Detail D3 WHERE D3.ID_Detail = D.ID_Detail)
				)  AS MSelectedQTY 

			,(SELECT SUM(P.QTY) AS SelectedQTY 
				FROM dbo.WIPLst_Process P 
				WHERE P.ID_Detail = D.ID_Detail  
				AND ( P.Process_ID  = ''SELECTED'' OR P.Process_ID  = ''PARTSELECT'' )
				AND AllowSub = ''N''
				)  AS DNoSubQTY 

			FROM dbo.WIPLst_Master M
			INNER JOIN dbo.WIPLst_Detail D ON M.ID = D.ID 
			WHERE D.ID_Detail = @ID_Detail
	) tmp
);

--GRANT SELECT ON [dbo].TVF_WIP_Process_QTY TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  View [dbo].[vSOitem_HRS_Total]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSOitem_HRS_Total]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vSOitem_HRS_Total]
AS
SELECT        SUM(dbo.f_Disp_ifNextDay(INV, DateEst)) AS tINV, SUM(dbo.f_Disp_ifNextDay(Recv, DateEst)) AS tRecv, SUM(dbo.f_Disp_ifNextDay(Mach, DateEst)) AS tMACH, SUM(dbo.f_Disp_ifNextDay(CG, DateEst)) AS tCG, 
                         SUM(dbo.f_Disp_ifNextDay(Pack, DateEst)) AS tPack, SUM(GFM) AS tGFM, SUM(Roll) AS tRoll, SUM(Press) AS tPress, SUM(Heat) AS tHeat, SUM(Test) AS tTest, SUM(dbo.f_Disp_ifNextDay(Abrsv, DateEst)) AS tAbrsv, 
                         SUM(dbo.f_Disp_ifNextDay(BSaw, DateEst)) AS tBSaw, SUM(dbo.f_Disp_ifNextDay(Shear, DateEst)) AS tShear, SUM(dbo.f_Disp_ifNextDay(Plasma, DateEst)) AS tPlasma, SUM(dbo.f_Disp_ifNextDay(WJet, DateEst)) 
                         AS tWJet
FROM            dbo.SOitem_Hrs WITH (NOLOCK)
WHERE        (Cncld = 0) AND (Cmplt = 0)
' 
GO
/****** Object:  View [dbo].[AllQuotes_Dist_SalesP]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AllQuotes_Dist_SalesP]'))
EXEC dbo.sp_executesql @statement = N'
/****** Object:  View dbo.AllQuotes_Dist_SalesP    Script Date: 5/4/2006 1:24:39 PM ******/

CREATE  VIEW [dbo].[AllQuotes_Dist_SalesP]
 
AS

SELECT Distinct
allquotes.SalesP
FROM dbo.allquotes 
--ORDER BY SalesP

' 
GO
/****** Object:  View [dbo].[Orders_by_State]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Orders_by_State]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Orders_by_State]
AS
SELECT     TOP (100) PERCENT SN.salesrep, S.soitem, CONVERT(CHAR(12), S.shipped, 101) AS Shipped, Q.alloy, Q.form, Q.thck, Q.sz2, Q.sz3, SA.company, 
                      SA.addr1, SA.addr2, SA.city, SA.zip, SA.contact, SA.telephone
FROM         dbo.sales_no AS SN INNER JOIN
                      dbo.sales AS S ON SN.salesnum = S.salesnum INNER JOIN
                      dbo.allquotes AS Q ON S.soitem = Q.soitem INNER JOIN
                      dbo.shipaddr AS SA ON SN.pshipaddr = SA.shipcode
WHERE     (SA.inactive = 0) AND (SA.st = ''WA'')
ORDER BY S.shipped
' 
GO
/****** Object:  View [dbo].[vSales]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSales]'))
EXEC dbo.sp_executesql @statement = N'/*ORDER BY SalesNum DESC*/
CREATE VIEW [dbo].[vSales]
AS
SELECT        S.SOitem, S.SalesNum, S.Item, S.OrderSpec, S.S_Instrct, S.Inv, S.BRK, S.GFM, S.Draw, S.Roll, S.CG, S.Press, S.Mach, S.Plasma, S.WJet, S.ColdSaw, S.Cert, S.ItemTot, S.ShipDue, S.Shipped, S.MatlWt, S.cncld, S.cmplt, 
                         S.PartNo, S.ItemSale, S.ItemCost, S.StkCost, S.POCost, S.QA, S.CofC, S.Merc, S.pPo, S.pPn, S.pHeat, S.pSpec, S.pOther, S.Other, S.pDesc, S.prcp, S.prcd, S.pckd, S.Urgent, S.ShipOn, S.Tol, S.ProcLoc, AQ.Q_PU, AQ.Q_QTY, 
                         AQ.Q_P, AQ.Q_Total, AQ.S_PU, AQ.S_QTY, AQ.S_P, AQ.S_QTY * AQ.S_P AS S_Total, S.Selected_QTY, S.Shipped_QTY, S.dShip, S.Typ, S.WO, S.StkPaid, S.WO_Detail, S.ProductionWO, S.IntP, S.Export, S.RcvdE, S.RMA_E, 
                         S.InqNumP, S.Hold, S.ID_AllQuotes, S.DateAdded, S.RVW_Stock, S.RVW_Prod, S.Review, AQ.Company AS AQCompany, AQ.Name AS AQName, dbo.fvSales_PS_Total(S.SOitem) AS fPS_total, dbo.fvSales_PS_QTY(S.SOitem) 
                         AS fPS_QTY, dbo.fvSales_RMA_QTY(S.SOitem) AS fRMA_QTY, dbo.fvSales_Grab_QTY(S.SOitem) AS fInv_QTY, dbo.fvSales_Grab_Total(S.SOitem) AS fInv_Cost, AQ.LeadTime AS AQLeadTime, AQ.SalesP AS AQSalesP, 
                         AQ.CustID AS AQCustID, AQ.CutOptions AS AQCutOptions, S.gs_cost, S.gs_sale, S.gs_cmplt, S.RMA_Detail, S.JobHours, AQ.OtherP, AQ.Cuts AS CutsP, S.Quoted_DollarTotal, S.Quoted_CutsP, S.Quoted_OtherP
FROM            dbo.Sales AS S WITH (NOLOCK) INNER JOIN
                         dbo.AllQuotes AS AQ WITH (NOLOCK) ON S.ID_AllQuotes = AQ.ID
' 
GO
/****** Object:  View [dbo].[BrokerLst_View_old]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_View_old]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  View dbo.BrokerLst_View    Script Date: 5/4/2006 1:26:53 PM *****
***** Object:  View dbo.Shop_Edit_StockLst    Script Date: 2/23/2005 11:26:17 AM *****
*/
Create VIEW [dbo].[BrokerLst_View_old]
AS
SELECT     TOP (100) PERCENT M.alloy, M.form, M.cc, M.size, M.mweight, M.cond, M.specs, M.heat, M.lot, M.Paid, M.id, 
                      CASE WHEN poduedate = ''01/01/1900'' THEN CONVERT(CHAR(10), '' '', 101) ELSE CONVERT(CHAR(10), PoDueDate, 101) END AS cPODueDate, M.mill, 
                      CASE WHEN stkdate = ''01/01/1900'' THEN CONVERT(CHAR(10), '' '', 101) ELSE CONVERT(CHAR(10), stkdate, 101) END AS cStkDate, M.history, M.num, 
                      M.po_item, M.POStatus, M.BrandName, D.pc, D.size_h, D.dim1, D.size_l, D.dim2, D.dim3, D.length, D.weight, D.costvalue, D.descript, D.location, 
                      D.floorstatus, D.class, D.unit, D.randlen, D.ReceivingID, D.InvCheck
FROM         dbo.BrokerLst_master AS M INNER JOIN
                      dbo.BrokerLst_detail AS D ON M.id = D.id
INNER JOIN dbo.ConditionCode AS C ON M.CC = C.CC
ORDER BY M.alloy, M.form, C.CCSortValue, M.size, M.heat

' 
GO
/****** Object:  View [dbo].[vProd_Log]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vProd_Log]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vProd_Log]
AS
SELECT ''Conversion_log'' AS TBL, Lot, SOitem, WO, WO_Detail FROM dbo.Conversion_log
UNION
SELECT ''Draw_log'' AS TBL, Lot, SOitem, WO, WO_Detail FROM dbo.Draw_log
UNION
SELECT ''GFMlog'' AS TBL, Lot, SOitem, WO, WO_Detail FROM dbo.GFMlog
UNION
SELECT ''HT_log'' AS TBL, Lot, SOitem, WO, WO_Detail FROM dbo.HT_log
UNION
SELECT ''LakeErie_log'' AS TBL, Lot, SOitem, WO, WO_Detail FROM dbo.Swage_Log 
UNION
SELECT ''Roll_log'' AS TBL, Lot, SOitem, WO, WO_Detail FROM dbo.Roll_log
UNION
SELECT ''Swage_Log'' AS TBL, Lot, SOitem, WO, WO_Detail FROM dbo.Swage_Log
UNION
SELECT ''Wire_log'' AS TBL, Lot, SOitem, WO, WO_Detail FROM dbo.Wire_log
UNION
SELECT ''StockLst_Process'' AS TBL, 0 AS Lot, SOitem, WO, WO_Detail FROM dbo.StockLst_Process
' 
GO
/****** Object:  View [dbo].[Shop_Edit_BrokerLst]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Shop_Edit_BrokerLst]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  View dbo.Shop_Edit_BrokerLst    Script Date: 5/4/2006 1:27:01 PM *****
***** Object:  View dbo.Shop_Edit_BrokerLst    Script Date: 3/3/2005 3:01:28 PM *****
***** Object:  View dbo.Shop_Edit_BrokerLst    Script Date: 2/23/2005 11:26:17 AM *****
*/
CREATE VIEW [dbo].[Shop_Edit_BrokerLst]
AS
SELECT     TOP (100) PERCENT M.Alloy, M.Form, M.CC, M.Size, CAST(D.Weight AS DECIMAL(9, 0)) AS dWeight, M.Cond, M.Specs, M.Heat, M.Lot, M.Paid, M.ID, CASE WHEN poduedate = ''01/01/1900'' THEN CONVERT(CHAR(10), '' '', 101) ELSE CONVERT(CHAR(10), PoDueDate, 101) END AS cPODueDate, 
                  M.Mill, M.History, M.Num, M.PO_item, D.PC, D.Size_H, D.Dim1, D.Size_L, D.Dim2, D.Dim3, D.Length, CAST(ISNULL(D.Weight, 0) AS DECIMAL(9, 1)) AS weight, D.CostValue, D.Descript, D.Location, D.FloorStatus, D.Class, D.Unit, 0 AS Prc,
                      (SELECT     COUNT(*) AS Expr1
                       FROM        dbo.BrokerLst_Process AS BP
                       WHERE     (D.ID_Detail = ID_Detail) AND (Process_ID = ''SELECTED'')) AS Bkr, D.ID_Detail, M.POStatus, M.FROM_ID, CASE WHEN stkdate = ''01/01/1900'' THEN CONVERT(CHAR(10), '' '', 101) ELSE CONVERT(CHAR(10), stkdate, 101) END AS cStkDate, ISNULL(D.ReceivingID, 0) 
                  AS ReceivingID, D.RandLen, ISNULL(M.BrandName, '''') AS BrandName, CONVERT(CHAR(10), D.InvCheck, 101) AS cInvCheck, C.CCSortValue, D.Quarantine, dbo.Forms.FormSort, D.InvCheck, M.Melt, M.CL, M.MillTrace
FROM        dbo.BrokerLst_Master AS M WITH (NOLOCK) INNER JOIN
                  dbo.BrokerLst_Detail AS D WITH (NOLOCK) ON M.ID = D.ID INNER JOIN
                  dbo.ConditionCode AS C WITH (NOLOCK) ON M.CC = C.CC INNER JOIN
                  dbo.Forms WITH (NOLOCK) ON M.Form = dbo.Forms.FormNumber
' 
GO
/****** Object:  UserDefinedFunction [dbo].[TVF_Years]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TVF_Years]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[TVF_Years]
(	@NumYears int 
)
RETURNS TABLE 
AS
RETURN 
(
--SELECT * FROM dbo.TVF_Years(2)

SELECT YEAR(GETDATE()) + 2 as YearNum
UNION	SELECT YEAR(GETDATE()) + 1 as YearNum 
UNION	SELECT YEAR(GETDATE()) as YearNum
UNION	SELECT YEAR(GETDATE()) - 1 as YearNum
UNION	SELECT YEAR(GETDATE()) - 2 as YearNum
UNION	SELECT YEAR(GETDATE()) - 3 as YearNum
UNION	SELECT YEAR(GETDATE()) - 4 as YearNum
UNION	SELECT YEAR(GETDATE()) - 5 as YearNum

UNION	SELECT YEAR(GETDATE()) - 6 as YearNum
UNION	SELECT YEAR(GETDATE()) - 7 as YearNum
UNION	SELECT YEAR(GETDATE()) - 8 as YearNum
UNION	SELECT YEAR(GETDATE()) - 9 as YearNum
UNION	SELECT YEAR(GETDATE()) - 10 as YearNum

UNION	SELECT YEAR(GETDATE()) - 11 as YearNum
UNION	SELECT YEAR(GETDATE()) - 12 as YearNum
UNION	SELECT YEAR(GETDATE()) - 13 as YearNum
UNION	SELECT YEAR(GETDATE()) - 14 as YearNum
UNION 	SELECT YEAR(GETDATE()) - 15 as YearNum 



	
)
' 
END
GO

/****** Object:  View [dbo].[LDAP_Users]    Script Date: 12/26/2025 5:48:52 PM ******/
/*
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[LDAP_Users]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[LDAP_Users]
AS
SELECT     displayName, mail, streetaddress, sn, givenName, telephoneNumber, mobile, physicalDeliveryOfficeName, department, facsimileTelephoneNumber, company, pager, 
                      sAMAccountName, title
FROM         OPENQUERY(ADSI, 
                      ''SELECT title, sAMAccountName
, pager, company, facsimileTelephoneNumber, department, physicalDeliveryOfficeName
,mobile, telephoneNumber, givenName, sn, streetaddress, mail, displayName
FROM ''''LDAP://WINDFALL.HPA.local/ou=HPA,dc=windfall,dc=hpa,dc=local''''
where objectClass = ''''User'''''')
                       AS derivedtbl_1
' 
GO

*/








IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'VIEW',N'Shop_Edit_BrokerLst', N'COLUMN',N'Alloy'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standard Alloy Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Shop_Edit_BrokerLst', @level2type=N'COLUMN',@level2name=N'Alloy'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'VIEW',N'Shop_Edit_BrokerLst', N'COLUMN',N'Form'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'2 digit form code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Shop_Edit_BrokerLst', @level2type=N'COLUMN',@level2name=N'Form'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'VIEW',N'Shop_Edit_BrokerLst', N'COLUMN',N'CC'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Condition Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Shop_Edit_BrokerLst', @level2type=N'COLUMN',@level2name=N'CC'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'VIEW',N'Shop_Edit_BrokerLst', N'COLUMN',N'Size'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'3 decimal size standard, PriceTable Size' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Shop_Edit_BrokerLst', @level2type=N'COLUMN',@level2name=N'Size'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'VIEW',N'Shop_Edit_BrokerLst', N'COLUMN',N'Cond'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Full Condition' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Shop_Edit_BrokerLst', @level2type=N'COLUMN',@level2name=N'Cond'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'VIEW',N'Shop_Edit_BrokerLst', N'COLUMN',N'Specs'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Specifications' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Shop_Edit_BrokerLst', @level2type=N'COLUMN',@level2name=N'Specs'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'VIEW',N'Shop_Edit_BrokerLst', N'COLUMN',N'Heat'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Heat' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Shop_Edit_BrokerLst', @level2type=N'COLUMN',@level2name=N'Heat'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'VIEW',N'Shop_Edit_BrokerLst', N'COLUMN',N'Lot'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'heat lot' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Shop_Edit_BrokerLst', @level2type=N'COLUMN',@level2name=N'Lot'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'VIEW',N'Shop_Edit_BrokerLst', N'COLUMN',N'Paid'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Price paid in per Unit' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Shop_Edit_BrokerLst', @level2type=N'COLUMN',@level2name=N'Paid'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'VIEW',N'Shop_Edit_BrokerLst', N'COLUMN',N'ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Shop_Edit_BrokerLst', @level2type=N'COLUMN',@level2name=N'ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'VIEW',N'Shop_Edit_BrokerLst', N'COLUMN',N'Mill'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mill producer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Shop_Edit_BrokerLst', @level2type=N'COLUMN',@level2name=N'Mill'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'VIEW',N'Shop_Edit_BrokerLst', N'COLUMN',N'History'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'OLD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Shop_Edit_BrokerLst', @level2type=N'COLUMN',@level2name=N'History'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'VIEW',N'Shop_Edit_BrokerLst', N'COLUMN',N'Num'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'OLD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Shop_Edit_BrokerLst', @level2type=N'COLUMN',@level2name=N'Num'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'VIEW',N'Shop_Edit_BrokerLst', N'COLUMN',N'PO_item'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PO item 9-2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Shop_Edit_BrokerLst', @level2type=N'COLUMN',@level2name=N'PO_item'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'VIEW',N'Shop_Edit_BrokerLst', N'COLUMN',N'PC'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Pieces' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Shop_Edit_BrokerLst', @level2type=N'COLUMN',@level2name=N'PC'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'VIEW',N'Shop_Edit_BrokerLst', N'COLUMN',N'Size_H'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'High Tol' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Shop_Edit_BrokerLst', @level2type=N'COLUMN',@level2name=N'Size_H'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'VIEW',N'Shop_Edit_BrokerLst', N'COLUMN',N'Dim1'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Thick/Dia' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Shop_Edit_BrokerLst', @level2type=N'COLUMN',@level2name=N'Dim1'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'VIEW',N'Shop_Edit_BrokerLst', N'COLUMN',N'Size_L'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Low Tol' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Shop_Edit_BrokerLst', @level2type=N'COLUMN',@level2name=N'Size_L'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'VIEW',N'Shop_Edit_BrokerLst', N'COLUMN',N'Dim2'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Width/Length' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Shop_Edit_BrokerLst', @level2type=N'COLUMN',@level2name=N'Dim2'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'VIEW',N'Shop_Edit_BrokerLst', N'COLUMN',N'Dim3'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Length' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Shop_Edit_BrokerLst', @level2type=N'COLUMN',@level2name=N'Dim3'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'VIEW',N'Shop_Edit_BrokerLst', N'COLUMN',N'Length'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Old Length' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Shop_Edit_BrokerLst', @level2type=N'COLUMN',@level2name=N'Length'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'VIEW',N'Shop_Edit_BrokerLst', N'COLUMN',N'CostValue'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'current Price per unit' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Shop_Edit_BrokerLst', @level2type=N'COLUMN',@level2name=N'CostValue'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'VIEW',N'Shop_Edit_BrokerLst', N'COLUMN',N'Descript'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Old Descript' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Shop_Edit_BrokerLst', @level2type=N'COLUMN',@level2name=N'Descript'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'VIEW',N'Shop_Edit_BrokerLst', N'COLUMN',N'Location'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Where to find stock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Shop_Edit_BrokerLst', @level2type=N'COLUMN',@level2name=N'Location'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'VIEW',N'Shop_Edit_BrokerLst', N'COLUMN',N'Unit'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unit, Usually Pounds' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Shop_Edit_BrokerLst', @level2type=N'COLUMN',@level2name=N'Unit'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'VIEW',N'Shop_Edit_BrokerLst', N'COLUMN',N'ID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Shop_Edit_BrokerLst', @level2type=N'COLUMN',@level2name=N'ID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'VIEW',N'Shop_Edit_BrokerLst', N'COLUMN',N'POStatus'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Due in, Partial receive, Waiting for bill, Accounted' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Shop_Edit_BrokerLst', @level2type=N'COLUMN',@level2name=N'POStatus'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'VIEW',N'Shop_Edit_BrokerLst', N'COLUMN',N'FROM_ID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Where this ID came from' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Shop_Edit_BrokerLst', @level2type=N'COLUMN',@level2name=N'FROM_ID'
GO

/****** Object:  View [dbo].[BrokerLst_Master_Union]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Master_Union]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[BrokerLst_Master_Union]
AS
SELECT        TOP (100) PERCENT ''*'' AS [Who], ''AAA Current'' AS [What], GETDATE() AS [MWhen], alloy, form, cc, size, cond, mweight, specs, heat, lot, Paid
, po_item, poduedate, mill, stkdate, history, num, POStatus, BrandName, FROM_ID, id, 
                         0 AS ID_History, [Melt], [mS_QTY], [WO_Detail], [ProjID]
FROM            dbo.[BrokerLst_Master] WITH (NOLOCK)
UNION
SELECT        TOP (100) PERCENT LEFT(Who, 20) AS [Who], [What], MH.[When] AS [MWhen], alloy, form, cc, size, cond, mweight, specs, heat, lot, Paid
, po_item, poduedate, mill, stkdate, history, num, POStatus, BrandName, FROM_ID, id, ID_History, [Melt], 
                         [mS_QTY], [WO_Detail], [ProjID]
FROM			dbo.[Ar.BrokerLst_Master_history] MH WITH (NOLOCK)
ORDER BY id, alloy, form, cc, size, heat, What
' 
GO
/****** Object:  View [dbo].[WIPLst_Master_Union]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WIPLst_Master_Union]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[WIPLst_Master_Union]
AS
SELECT        TOP (100) PERCENT ''*'' AS [Who], ''AAA Current'' AS [What], GETDATE() AS [MWhen], alloy, form, cc, size, cond, mweight, specs, heat, lot, Paid, po_item, poduedate, mill, stkdate, history, num, POStatus, BrandName, FROM_ID, id, 
                         0 AS ID_History, [Melt], [mS_QTY], [WO_Detail], [ProjID], MillTrace
FROM            dbo.WIPLst_Master WITH (NOLOCK)
UNION
SELECT        TOP (100) PERCENT LEFT(Who, 20) AS [Who], [What],MH. [When] AS [MWhen], alloy, form, cc, size, cond, mweight, specs, heat, lot, Paid, po_item, poduedate, mill, stkdate, history, num, POStatus, BrandName, FROM_ID, id, ID_History, [Melt], 
                         [mS_QTY], [WO_Detail], [ProjID], MillTrace
FROM            dbo.[Ar.WIPLst_Master_History] MH WITH (NOLOCK)
ORDER BY id, alloy, form, cc, size, heat, What
' 
GO

/****** Object:  View [dbo].[StockLst_Master_union]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Master_union]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[StockLst_Master_union]
AS
SELECT        TOP (100) PERCENT LEFT
                             ((SELECT        TOP 1 ISNULL(I.[WHO], ''*'')
                                 FROM            dbo.StockLst_Master_Inserted I
                                 WHERE        I.Master_ID = M.ID), 20) AS [MWHO], ''AAA Current'' AS [What], GETDATE() AS [MWhen], M.alloy, M.form, M.cc, M.cl, M.size, M.cond, M.mweight, M.specs, M.heat, M.lot, M.Paid, M.po_item, M.poduedate, M.mill, 
                         M.stkdate, M.history, M.num, M.POStatus, M.BrandName, M.FROM_ID, M.id, 0 AS ID_History, M.[Melt], M.[mS_QTY], M.[WO_Detail], M.[ProjID], M.MillTrace
FROM            dbo.stocklst_master M
UNION
SELECT        TOP (100) PERCENT LEFT(MH.Who, 20) AS [Who], MH.[What] AS [What], MH.[When] AS [MWhen], MH.alloy, MH.form, MH.cc, MH.cl, MH.size, MH.cond, MH.mweight, MH.specs, MH.heat, MH.lot, MH.Paid, MH.po_item, MH.poduedate, 
                         MH.mill, MH.stkdate, MH.history, MH.num, MH.POStatus, MH.BrandName, MH.FROM_ID, MH.id, MH.ID_History, MH.[Melt], MH.[mS_QTY], MH.[WO_Detail], MH.[ProjID], MH.MillTrace
FROM            dbo.[Ar.Stocklst_Master_History] MH
ORDER BY id, alloy, form, cc, cl, size, heat, What
' 
GO
/****** Object:  View [dbo].[StockLst_Detail_Union]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Detail_Union]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[StockLst_Detail_Union]
AS
SELECT        TOP (100) PERCENT LEFT(''*'', 20) AS WHO, ''AAA Current'' AS WHAT, GETDATE() AS [WHEN], D.[size_h], D.[size_l], D.[pc], D.[dim1], D.[dim2], D.[dim3], D.[length], D.[weight], D.[costvalue], D.[descript], D.[location], D.[floorstatus], D.[class], D.[unit], D.[RandLen], 
                         D.[InvCheck], D.[id], D.[id_detail], D.[ReceivingID]
FROM            dbo.Stocklst_Detail D
UNION
SELECT        TOP (100) PERCENT LEFT(DH.Who, 20) AS Who, DH.what, DH.[when], DH.[size_h], DH.[size_l], DH.[pc], DH.[dim1], DH.[dim2], DH.[dim3], DH.[length], DH.[weight], DH.[costvalue], DH.[descript], DH.[location], DH.[floorstatus]
, DH.[class], DH.[unit], DH.[RandLen], DH.[InvCheck], DH.[id], DH.[id_detail], DH.[ReceivingID]
FROM            dbo.[Ar.Stocklst_Detail_History] DH
ORDER BY ID, ID_Detail, What
' 
GO

/****** Object:  View [dbo].[vStock_Union]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vStock_Union]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vStock_Union]
AS
SELECT        TOP (100) PERCENT LEFT
                             ((SELECT        TOP 1 ISNULL(I.[WHO], ''*'')
                                 FROM            dbo.StockLst_Master_Inserted I
                                 WHERE        I.Master_ID = M.ID), 20) AS [MWHO], ''AAA Current'' AS [MWhat], GETDATE() AS [MWhen], M.alloy, M.form, M.cc, M.cl, M.size, M.cond, M.mweight, M.specs, M.heat, M.lot, M.Paid, M.po_item, M.poduedate, M.mill, 
                         M.stkdate, M.history, M.num, M.POStatus, M.BrandName, M.FROM_ID, M.id, 0 AS ID_History, M.[Melt], M.[mS_QTY], M.[WO_Detail], M.[ProjID], M.MillTrace, LEFT(''*'', 20) AS DWHO, ''AAA Current'' AS DWHAT, GETDATE() 
                         AS [DWHEN], D .[size_h], D .[size_l], D .[pc], D .[dim1], D .[dim2], D .[dim3], D .[length], D .[weight], D .[costvalue], D .[descript], D .[location], D .[floorstatus], D .[class], D .[unit], D .[RandLen], D .[InvCheck], D .[id_detail], 
                         D .[ReceivingID]
FROM            dbo.stocklst_master M WITH (NOLOCK) INNER JOIN
                         dbo.StockLst_Detail D WITH (NOLOCK) ON M.id = D .id
UNION
SELECT        TOP (100) PERCENT LEFT(MH.Who, 20) AS [MWho], MH.[What] AS MWhat, MH.[When] AS MWhen, MH.alloy, MH.form, MH.cc, MH.cl, MH.size, MH.cond, MH.mweight, MH.specs, MH.heat, MH.lot, MH.Paid, MH.po_item, 
                         MH.poduedate, MH.mill, MH.stkdate, MH.history, MH.num, MH.POStatus, MH.BrandName, MH.FROM_ID, MH.id, MH.ID_History, MH.[Melt], MH.[mS_QTY], MH.[WO_Detail], MH.[ProjID], MH.MillTrace, LEFT(DH.Who, 20) 
                         AS [DWho], DH.what AS DWhat, DH.[when] AS Dwhen, DH.[size_h], DH.[size_l], DH.[pc], DH.[dim1], DH.[dim2], DH.[dim3], DH.[length], DH.[weight], DH.[costvalue], DH.[descript], DH.[location], DH.[floorstatus], DH.[class], 
                         DH.[unit], DH.[RandLen], DH.[InvCheck], DH.[id_detail], DH.[ReceivingID]
FROM            dbo.[Ar.Stocklst_Master_History] MH WITH (NOLOCK) INNER JOIN
                         dbo.[Ar.Stocklst_Detail_History] DH WITH (NOLOCK) ON MH.ID = DH.ID
' 
GO




/****** Object:  View [dbo].[NR_TimeClockID]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NR_TimeClockID]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[NR_TimeClockID]
AS
SELECT TOP (1000) EmployeeId, Name
FROM     dbo.v_TimeClockID
' 
GO
/****** Object:  View [dbo].[NR_OT_Emps]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NR_OT_Emps]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[NR_OT_Emps]
AS
SELECT        TOP (100) PERCENT ot.orderItem, ot.jobID, otj.jobDescription, t.Name
FROM            dbo.NR_OT AS ot INNER JOIN
                         dbo.NR_OT_Employee AS ote ON ote.trackID = ot.trackID INNER JOIN
                         dbo.NR_TimeClockID AS t ON t.EmployeeId = ote.EmployeeId INNER JOIN
                         dbo.NR_OT_Time AS ott ON ot.trackID = ott.trackID INNER JOIN
                         dbo.NR_OT_Job AS otj ON ot.jobID = otj.jobID
WHERE        (ott.time > GETDATE() - 365)
GROUP BY ot.trackID, ot.orderItem, ot.jobID, otj.jobDescription, t.Name
' 
GO

/****** Object:  View [dbo].[v_NR_OT_View_Admin]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_NR_OT_View_Admin]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_NR_OT_View_Admin]
AS
SELECT        trackID, OrderType, orderItem, jobID, jobDescription, status, time
FROM            (SELECT        o.trackID, otot.OrderType, o.orderItem, o.jobID, otj.jobDescription,
                                                        (SELECT        TOP (1) status
                                                          FROM            dbo.NR_OT_Time AS ott
                                                          WHERE        (time > GETDATE() - 365) AND (trackID = o.trackID)
                                                          ORDER BY time DESC) AS status,
                                                        (SELECT        TOP (1) time
                                                          FROM            dbo.NR_OT_Time AS ott
                                                          WHERE        (time > GETDATE() - 365) AND (trackID = o.trackID)
                                                          ORDER BY time DESC) AS time
                          FROM            dbo.NR_OT AS o LEFT OUTER JOIN
                                                    dbo.NR_OT_OrderType AS otot ON o.orderType = otot.Id INNER JOIN
                                                    dbo.NR_OT_Job AS otj ON o.jobID = otj.jobID
                          GROUP BY o.orderItem, o.jobID, otj.jobDescription, o.trackID, otot.OrderType) AS o_1
WHERE        (time > DATEADD(year, - 1, GETDATE()))
' 
GO
/****** Object:  View [dbo].[NR_TimeClock_ShopEmployees]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NR_TimeClock_ShopEmployees]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[NR_TimeClock_ShopEmployees]
AS
SELECT TOP (1000) EmployeeId, FullName, JobCodeId
FROM     dbo.v_TimeClock_ShopEmployees
' 
GO








