USE [ERP_2]
GO
/****** Object:  Trigger [dbo].[AcctCost_Cert_Update]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[AcctCost_Cert_Update]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[AcctCost_Cert_Update]
   ON  [dbo].[AcctCost_Cert] 
   FOR INSERT
   NOT FOR REPLICATION

AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    
DECLARE @cEmailFrom VARCHAR(30)
DECLARE @Body varchar(4000)


	BEGIN

		PRINT ''  PO finalize has updated PO with Invoice numbers, PO was not reconciled before.  [PurchaseOrder_Update]''
		
		--, @Body VARCHAR(8000)
		SET @cEmailFrom = ERP_2.dbo.f_GetSQL_Server_Email();
		
		SET @Body = ''A Conversion Service PO Invoice has been posted.  The material cost in Stock list must now be updated, recalculated.''
		


--SELECT dbo.f_get_Order_Description(''WO'',1020,'''')
--SELECT dbo.f_get_Order_Description(''WO_Detail'',1020,'''')
--SELECT dbo.f_get_Order_Description(''POitem'',0,''507113-01'')
--SELECT dbo.f_get_Order_Description(''SOitem'',0,''105000-01'')

--		SET @Body = @Body +''<br />''+ dbo.f_get_Order_Description(''POitem'',0,@POitem2)
--		SET @Body = @Body +''<br />''+dbo.f_HTML_link_POitem(@POitem2)

--		SET @Body = @Body +''<br />''+dbo.f_HTML_link_Receiving_POitem(@POitem2)

		SET @Body = @Body +''<br />''+@@SERVERNAME+'' TRIGGER dbo.purchaseOrder_Update '' ;
/*
		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = ''accounting@ERP_1s.com; David@ERP_1s.com'', 
			 @SubjectEmail = ''Conversion POitem, Paid Invoice.'' ,
			 @BodyEmail = @Body,
			 @BodyType = ''HTML''	;	
*/
			 		 

	END
END


' 
GO
ALTER TABLE [dbo].[AcctCost_Cert] ENABLE TRIGGER [AcctCost_Cert_Update]
GO
/****** Object:  Trigger [dbo].[Alloy_INSERT]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Alloy_INSERT]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<David Kirchner>
-- =============================================
CREATE TRIGGER [dbo].[Alloy_INSERT]
   ON [dbo].[Alloy] 
   FOR INSERT 
   NOT FOR REPLICATION
AS 
BEGIN
SET NOCOUNT ON;

DECLARE @cAlloy CHAR(12)
SELECT @cAlloy = Alloy FROM inserted

IF LEN(RTRIM(@cAlloy)) > 0
	BEGIN
	DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()

	DECLARE @Body varchar(4000)
	SELECT @Body = (''Alloy table has a new entry,''+CHAR(13)
		+'' Alloy:''+RTRIM(inserted.Alloy)+CHAR(13)
		+''Please verify this Alloy.''+CHAR(13)
		+''Entered by ''+RTRIM(suser_sname())
		+'' on ''+RTRIM(GETDATE())  
		+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.Alloy_INSERT '' )
		FROM inserted

		EXEC dbo.p_eMail_Send
			@FromEmail = @cEmailFrom, 
			@ToEmail = ''Admin.Alerts@ERP_1s.com'', 
			@SubjectEmail = ''New Alloy added to Alloy.'',
			@BodyEmail = @Body,
			@BodyType = ''TEXT''
			
	END


END
' 
GO
ALTER TABLE [dbo].[Alloy] ENABLE TRIGGER [Alloy_INSERT]
GO
/****** Object:  Trigger [dbo].[Alloy_UPDATE]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Alloy_UPDATE]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<David Kirchner>

-- =============================================
CREATE TRIGGER [dbo].[Alloy_UPDATE]
   ON [dbo].[Alloy] 
   FOR UPDATE 
   NOT FOR REPLICATION
AS 
BEGIN
SET NOCOUNT ON;

---big UPDATES are in error
DECLARE @Count int
SET @Count = @@ROWCOUNT;
   
IF @Count > 100
BEGIN
	RAISERROR(''Cannot UPDATE more than 100 records of dbo.Alloy at one time. trigger Alloy_Update'',16,1) 
	ROLLBACK TRANSACTION
	RETURN;
END
----------------------

DECLARE @cAlloy CHAR(12)
SELECT @cAlloy = Alloy FROM inserted

IF LEN(RTRIM(@cAlloy)) > 0
	IF (UPDATE(alloy)
		or UPDATE(BrandName)
		or UPDATE(UName)
		or UPDATE(density)
		or UPDATE(Co)
		or UPDATE(Cu)
		or UPDATE(Cr)
		or UPDATE(Ni)
		or UPDATE(Mo)
		or UPDATE(Fe)
		or UPDATE(Ti)
		or UPDATE(UNS)
		or UPDATE(CertName) )
	BEGIN

		DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()

		DECLARE @Body varchar(4000)
		SELECT TOP 1 @Body = (''Alloy table was edited: ''+CHAR(13)
			+'' Alloy:''+RTRIM(inserted.Alloy)+CHAR(13)
			+''Please verify this Alloy.''+CHAR(13)
			+''Entered by ''+RTRIM(suser_sname())
			+'' on ''+RTRIM(GETDATE()) 
			+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.Alloy_Update '' ) 
			FROM inserted, deleted
			WHERE inserted.alloy = deleted.Alloy

		EXEC dbo.p_eMail_Send
			@FromEmail = @cEmailFrom, 
			@ToEmail = ''Admin.Alerts@ERP_1s.com'', 
			@SubjectEmail = ''Alloy change.'',
			@BodyEmail = @Body,
			@BodyType = ''TEXT''
			
	END


END
' 
GO
ALTER TABLE [dbo].[Alloy] ENABLE TRIGGER [Alloy_UPDATE]
GO
/****** Object:  Trigger [dbo].[Alloys_INSERT]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Alloys_INSERT]'))
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		<David Kirchner>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[Alloys_INSERT]
   ON [dbo].[Alloys] 
   FOR INSERT 
   NOT FOR REPLICATION
AS 
BEGIN

SET NOCOUNT ON;

DECLARE @cAlloy CHAR(12)
SELECT @cAlloy = Alloy FROM inserted

IF LEN(RTRIM(@cAlloy)) > 0
	BEGIN
	DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
	DECLARE @Body varchar(4000)

	SELECT @Body = (''Alloys table has a new entry,''+CHAR(13)
		+'' Alloy:''+RTRIM(inserted.Alloy)+CHAR(13)
		+''Alloys:''+RTRIM(inserted.Alloys)+''.''+CHAR(13)
		+''Please verify this Alloy.''+CHAR(13)
		+''Entered by ''+RTRIM(suser_sname())
		+'' on ''+RTRIM(GETDATE())
		+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.Alloys_INSERT '' )
		FROM inserted

		EXEC dbo.p_eMail_Send
			@FromEmail = @cEmailFrom, 
			@ToEmail = ''vfpprogramming@ERP_1s.com'', 
			@SubjectEmail = ''New Alloy added to Alloys.'',
			@BodyEmail = @Body,
			@BodyType = ''TEXT''
			
	END


END

' 
GO
ALTER TABLE [dbo].[Alloys] ENABLE TRIGGER [Alloys_INSERT]
GO
/****** Object:  Trigger [dbo].[AlloySurcharge2_Update]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[AlloySurcharge2_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[AlloySurcharge2_Update] ON [dbo].[AlloySurcharge] 
	FOR UPDATE 
	NOT FOR REPLICATION
AS

	INSERT dbo.Ar_AlloySurcharge_History
	  ([Ni]
      ,[Co]
      ,[Cr]
      ,[Cu]
      ,[Mo]
      ,[Fe]
      ,[Ti]
	  ,[ID]
      ,[What]
      )

	SELECT 	
	  [Ni]
      ,[Co]
      ,[Cr]
      ,[Cu]
      ,[Mo]
      ,[Fe]
      ,[Ti]
	  ,[ID]
      ,''Updated''
	 FROM inserted
' 
GO
ALTER TABLE [dbo].[AlloySurcharge] ENABLE TRIGGER [AlloySurcharge2_Update]
GO
/****** Object:  Trigger [dbo].[AllQuotes_After_Update]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[AllQuotes_After_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[AllQuotes_After_Update] ON [dbo].[AllQuotes] 
	AFTER UPDATE 
	NOT FOR REPLICATION
AS
begin

	
IF EXISTS( SELECT COUNT(*) FROM inserted WHERE ISNULL(inserted.SalesNum,0)>0 )
	BEGIN

	PRINT ''Trigger Start [AllQuotes_After_Update]'';

	--*** S
	UPDATE dbo.Sales 
	SET S_QTY = inserted.S_QTY
	FROM inserted
	inner join dbo.Sales S ON inserted.SOitem = S.SOitem
	WHERE UPDATE(S_QTY)
	
	UPDATE dbo.Sales 
	SET S_PU = inserted.S_PU
	FROM inserted
	inner join dbo.Sales S ON inserted.SOitem = S.SOitem
	WHERE UPDATE(S_PU)
	
	UPDATE dbo.Sales 
	SET S_P = inserted.S_P
	FROM inserted
	inner join dbo.Sales S ON inserted.SOitem = S.SOitem
	WHERE UPDATE(S_P)
	
	UPDATE dbo.Sales 
	SET S_Total = inserted.S_Total
	FROM inserted
	inner join dbo.Sales S ON inserted.SOitem = S.SOitem
	WHERE UPDATE(S_Total)
	
	--*** Q
	UPDATE dbo.Sales 
	SET Quoted_QTY = inserted.Q_QTY
	FROM inserted
	inner join dbo.Sales S ON inserted.SOitem = S.SOitem
	WHERE UPDATE(Q_QTY)
	
	UPDATE dbo.Sales 
	SET Quoted_PU = inserted.Q_PU
	FROM inserted
	inner join dbo.Sales S ON inserted.SOitem = S.SOitem
	WHERE UPDATE(Q_PU)
	
	UPDATE dbo.Sales 
	SET Quoted_P = inserted.Q_P
	FROM inserted
	inner join dbo.Sales S ON inserted.SOitem = S.SOitem
	WHERE UPDATE(Q_P)
	
	UPDATE dbo.Sales 
	SET Quoted_Total = inserted.Q_Total
	FROM inserted
	inner join dbo.Sales S ON inserted.SOitem = S.SOitem
	WHERE UPDATE(Q_Total)

	--**Fill S_Total if empty
	UPDATE dbo.Sales 
	SET S_Total = inserted.Q_Total
	FROM inserted
	inner join dbo.Sales S ON inserted.SOitem = S.SOitem
	WHERE UPDATE(Q_Total)
	AND ISNULL(inserted.S_Total,0) = 0

	--*** ItemSale
	UPDATE dbo.Sales 
	SET ItemSale = inserted.Q_Total
	FROM inserted
	inner join dbo.Sales S ON inserted.SOitem = S.SOitem
	WHERE UPDATE(Q_Total)

	PRINT ''Trigger  End  [AllQuotes_After_Update]'';

	END



/*
IF (UPDATE(S_QTY) OR UPDATE(P_lb) OR UPDATE(P_Pc) OR UPDATE(P_Ft) OR UPDATE(OtherP) OR UPDATE(Q_Total)) 
	AND EXISTS ( SELECT * FROM inserted WHERE ISNULL(inserted.Q_Total,0) > 0 )
	begin
		
		UPDATE dbo.AllQuotes SET S_P = dbo.f_Calc_S_P(inserted.Form,inserted.S_QTY,inserted.Pieces,inserted.P_lb,inserted.P_Pc,inserted.Sz2,inserted.Sz3,inserted.P_Ft,inserted.OtherP,inserted.Q_Total)
		FROM inserted, deleted
			WHERE inserted.ID = deleted.ID
			AND ISNULL(inserted.Q_Total,0) > 0 
			--AND (UPDATE(S_QTY) OR UPDATE(P_lb) OR UPDATE(P_Pc) OR UPDATE(P_Ft) OR UPDATE(OtherP) OR UPDATE(Q_Total))

	end
*/

end
' 
GO
ALTER TABLE [dbo].[AllQuotes] ENABLE TRIGGER [AllQuotes_After_Update]
GO
/****** Object:  Trigger [dbo].[AllQuotes_Delete]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[AllQuotes_Delete]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[AllQuotes_Delete] ON [dbo].[AllQuotes] 
	INSTEAD OF DELETE 
	--NOT FOR REPLICATION
AS
     
PRINT ''Trigger Start [AllQuotes_Delete]'';   

--Remove from StartingStock! if SalesNum=0
DELETE FROM dbo.StartingStock WHERE AllQuotes_ID IN 
( SELECT [ID] FROM DELETED WHERE ISNULL([Salesnum],0)=0  ) 

--Only Delete if SalesNum=0
DELETE FROM [dbo].[AllQuotes] WHERE ISNULL([Salesnum],0)=0 
	AND [ID] IN ( SELECT [ID] FROM DELETED ) 

IF EXISTS( SELECT ID FROM DELETED WHERE ISNULL([Salesnum],0)>0 )
	begin
		RAISERROR(''Deletions not allowed for Quotes with Salesnumbers (source = [AllQuotes_Delete])'', 16, 1)		
	end

PRINT ''Trigger  End  [AllQuotes_Delete]'';
' 
GO
ALTER TABLE [dbo].[AllQuotes] ENABLE TRIGGER [AllQuotes_Delete]
GO
/****** Object:  Trigger [dbo].[AllQuotes_Update]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[AllQuotes_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[AllQuotes_Update] ON [dbo].[AllQuotes] 
FOR UPDATE NOT FOR REPLICATION
AS



IF TRIGGER_NESTLEVEL() > 1 /*this update is coming from some other trigger*/
begin
	PRINT ''trigger will not fire since it is called from another Trigger'';
	PRINT ''Exiting from recursive call to: '' + ISNULL(OBJECT_NAME(@@PROCID), '''');
	RETURN ;
end;

PRINT ''Trigger Start [AllQuotes_Update]'';

    
---big UPDATES are in error
DECLARE @Count int
SET @Count = @@ROWCOUNT;
   
IF @Count > 1000
BEGIN
	RAISERROR(''Cannot UPDATE more than 1000 records of dbo.Sales_No at one time. trigger Sales_No_Update'',16,1) 
	ROLLBACK TRANSACTION
	RETURN;
END
----------------------


IF UPDATE(Company) 
--	IF ((SELECT TRIGGER_NESTLEVEL()) < 2)
		BEGIN
		PRINT ''NoNoiseName = dbo.f_NoNoiseName(inserted.Company)  --use when not update from VFP'';

		UPDATE dbo.AllQuotes SET NoNoiseName = dbo.f_NoNoiseName(inserted.Company) 
			FROM inserted, deleted
			WHERE inserted.ID = deleted.ID
				AND NOT ISNULL(inserted.Company,'''') = ISNULL(deleted.Company,'''')
				AND NOT ISNULL(inserted.NoNoiseName,'''') = ISNULL(deleted.NoNoiseName,'''')
				AND AllQuotes.ID = inserted.ID
		END

IF UPDATE(Thck) 
--	IF ((SELECT TRIGGER_NESTLEVEL()) < 2)
		BEGIN
		PRINT ''SET StandardSize = dbo.f_SizeStandard(inserted.Thck)  --use when not update from VFP'';

		UPDATE dbo.AllQuotes SET StandardSize = dbo.f_SizeStandard(inserted.Thck) 
			FROM inserted, deleted
			WHERE inserted.ID = deleted.ID
				AND NOT ISNULL(inserted.Thck,0) = ISNULL(deleted.Thck,0)
				AND NOT ISNULL(inserted.StandardSize,0) = ISNULL(deleted.StandardSize,0)
				AND AllQuotes.ID = inserted.ID

		END

	

DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
DECLARE @Body varchar(4000)
DECLARE @badSOitem CHAR(10)
DECLARE @badPOnum INT
DECLARE @badID INT = 0

IF EXISTS ( SELECT * FROM inserted WHERE SUBSTRING(inserted.SOitem,6,1) = ''-'')
	BEGIN
	
		SELECT @Body = ''dbo.AllQuotes table, SOitem is not Proper,''+CHAR(13)
		
		SELECT TOP 1 @BadSoitem = SOitem, @badID = ID  FROM inserted WHERE SUBSTRING(inserted.SOitem,6,1) = ''-''
		SET @Body = @Body+'' SO item:''+@BadSoitem +''. ID:''+CAST(@badID AS CHAR(10))+CHAR(13)
			+RTRIM(suser_sname())+CHAR(13)
			+@@SERVERNAME+'' TRIGGER ERP_2.dbo.AllQuotes_Update ''
		
		PRINT ''SOitem:''+@BadSoitem+'' not Proper.''

		EXEC dbo.p_eMail_Send
			@FromEmail = @cEmailFrom, 
			@ToEmail = ''vfpprogramming@ERP_1s.com'', 
			@SubjectEmail = ''BAD SOitem.'',
			@BodyEmail = @Body,
			@BodyType = ''TEXT''
					
		SET @Body = ''Insert into dbo.AllQuotes table failed. SOitem:''+@BadSoitem+'' not Proper.''
		RAISERROR( @Body, 16, -1)
		--RETURN

	END


IF EXISTS ( SELECT * FROM inserted WHERE Salesnum > 0 AND Salesnum = HPApo )
	BEGIN

		
		PRINT ''SalesNum is same as HPApo number.''

		SELECT @Body = ''dbo.AllQuotes table SalesNum is same as HPA Po,''+CHAR(13)
		
		SELECT TOP 1 @badPOnum = HPApo, @BadSoitem = SOitem, @badID = ID 
			FROM inserted WHERE Salesnum > 0 AND Salesnum = HPApo

		SET @Body = @Body+'' HPA PO: ''+Cast( @badPOnum AS CHAR(10) ) +''.''+CHAR(13)
			+''SOitem = ''+@badSOitem+''.''+CHAR(13)
			+''ID:''+CAST(@badID AS CHAR(10))+CHAR(13)
			+RTRIM(suser_sname())+CHAR(13)
			+@@SERVERNAME+'' TRIGGER ERP_2.dbo.AllQuotes_Update ''
			
		EXEC dbo.p_eMail_Send
			@FromEmail = @cEmailFrom, 
			@ToEmail = ''vfp@ERP_1s.com'', 
			@SubjectEmail = ''BAD allQuotes SO=PO.'',
			@BodyEmail = @Body,
			@BodyType = ''TEXT''
					

	END

IF EXISTS ( SELECT * FROM inserted WHERE Salesnum > 0 AND Salesnum = HPApo2 )
	BEGIN

		
		PRINT ''SalesNum is same as HPApo2 number.''

		SELECT @Body = ''dbo.AllQuotes table SalesNum is same as HPA Po2,''+CHAR(13)

		SELECT TOP 1 @badPOnum = HPApo2, @badSOitem = SOitem, @badID = ID 
			FROM inserted WHERE Salesnum > 0 AND Salesnum = HPApo2

		SET @Body = @Body+'' HPA PO2: ''+Cast( @badPOnum AS CHAR(10) ) +''.''+CHAR(13)
			+''SOitem = ''+@badSOitem+''.''+CHAR(13)
			+''ID:''+CAST(@badID AS CHAR(10))+CHAR(13)
			+RTRIM(suser_sname())+CHAR(13)
			+@@SERVERNAME+'' TRIGGER ERP_2.dbo.AllQuotes_Update ''
			
		EXEC dbo.p_eMail_Send
			@FromEmail = @cEmailFrom, 
			@ToEmail = ''vfp@ERP_1s.com'', 
			@SubjectEmail = ''BAD allQuotes SO=PO2.'',
			@BodyEmail = @Body,
			@BodyType = ''TEXT''
					

	END


IF EXISTS( SELECT COUNT(*) FROM inserted WHERE ISNULL(inserted.SalesNum,0)>0 )
	BEGIN

	PRINT ''INSERT dbo.Ar_AllQuotes_History WHERE SalesNum > 0'';

	----------------------------------------------------
	--  Before Edit, see what it looks for in changes

	INSERT dbo.Ar_AllQuotes_History 
	  ([What]
	  ,[When]
	  ,[Company]
      ,[Name]
      ,[Phone]
      ,[Phone_Ext]
      ,[Fax]
      ,[Email]
      ,[PO_num]
      ,[Alloy]
      ,[Form]
      ,[CC]
      ,[CL]
      ,[Pieces]
      ,[Thck]
      ,[Sz2]
      ,[Sz3]
      ,[Weight]
      ,[Descript]
      ,[p_lb]
      ,[p_pc]
      ,[p_ft]
      ,[Cuts]
      ,[OtherFld]
      ,[OtherP]
      ,[LotP]
      ,[LotCost]
      ,[LeadTime]
      ,[cWeight]
      ,[cP_lb]
      ,[cP_pc]
      ,[cP_pcc]
      ,[cthk]
      ,[cLotP]
      ,[cLotcP]
      ,[cCut]
      ,[cCutM]
      ,[cKerfD]
      ,[InqDate]
      ,[InqNum]
      ,[InqNumP]
      ,[SalesP]
      ,[SalesNum]
      ,[SOitem]
      ,[item]
      ,[HPApo]
      ,[POitem]
      ,[SaleDate]
      ,[ShipDate]
      ,[Buyfrom]
      ,[BuyCost]
      ,[BuyFrom2]
      ,[HPApo2]
      ,[open_]
      ,[Bracket]
      ,[CustID]
      ,[QuoteMemo]
      ,[Comments]
      ,[CountryC]
      ,[Country]
      ,[Services]
      ,[RandLen]
      ,[Metric]
      ,[StartStock]
      ,[TN]
      ,[sz1orig]
      ,[sz2orig]
      ,[sz3orig]
      ,[QuoteDate]
      ,[Cover]
      ,[Cut]
      ,[ID]
      ,[Line1]
      ,[WO]
      ,[CutOptions]
      ,[Surcharge]
      ,[Regret]
      ,[NoNoiseName]
      ,[CutHr]
      ,[Q_P]
      ,[Q_QTY]
      ,[Q_PU]
      ,[Q_Total]
      ,[S_QTY]
	  ,[S_P],[S_PU]
      ,[StandardSize]
      ,[CustDisc]
      )
		SELECT 
	  ''BeforeEdit''
	  , GETDATE()
	  ,deleted.[Company]
      ,deleted.[Name]
      ,deleted.[Phone]
      ,deleted.[Phone_Ext]
      ,deleted.[Fax]
      ,deleted.[Email]
      ,deleted.[PO_num]
      ,deleted.[Alloy]
      ,deleted.[Form]
      ,deleted.[CC]
      ,deleted.[CL]
      ,deleted.[Pieces]
      ,deleted.[Thck]
      ,deleted.[Sz2]
      ,deleted.[Sz3]
      ,deleted.[Weight]
      ,deleted.[Descript]
      ,deleted.[p_lb]
      ,deleted.[p_pc]
      ,deleted.[p_ft]
      ,deleted.[Cuts]
      ,deleted.[OtherFld]
      ,deleted.[OtherP]
      ,deleted.[LotP]
      ,deleted.[LotCost]
      ,deleted.[LeadTime]
      ,deleted.[cWeight]
      ,deleted.[cP_lb]
      ,deleted.[cP_pc]
      ,deleted.[cP_pcc]
      ,deleted.[cthk]
      ,deleted.[cLotP]
      ,deleted.[cLotcP]
      ,deleted.[cCut]
      ,deleted.[cCutM]
      ,deleted.[cKerfD]
      ,deleted.[InqDate]
      ,deleted.[InqNum]
      ,deleted.[InqNumP]
      ,deleted.[SalesP]
      ,deleted.[SalesNum]
      ,deleted.[SOitem]
      ,deleted.[item]
      ,deleted.[HPApo]
      ,deleted.[POitem]
      ,deleted.[SaleDate]
      ,deleted.[ShipDate]
      ,deleted.[Buyfrom]
      ,deleted.[BuyCost]
      ,deleted.[BuyFrom2]
      ,deleted.[HPApo2]
      ,deleted.[open_]
      ,deleted.[Bracket]
      ,deleted.[CustID]
      ,deleted.[QuoteMemo]
      ,deleted.[Comments]
      ,deleted.[CountryC]
      ,deleted.[Country]
      ,deleted.[Services]
      ,deleted.[RandLen]
      ,deleted.[Metric]
      ,deleted.[StartStock]
      ,deleted.[TN]
      ,deleted.[sz1orig]
      ,deleted.[sz2orig]
      ,deleted.[sz3orig]
      ,deleted.[QuoteDate]
      ,deleted.[Cover]
      ,deleted.[Cut]
      ,deleted.[ID]
      ,deleted.[Line1]
      ,deleted.[WO]
      ,deleted.[CutOptions]
      ,deleted.[Surcharge]
      ,deleted.[Regret]
      ,deleted.[NoNoiseName]
      ,deleted.[CutHr]
      ,deleted.[Q_P]
      ,deleted.[Q_QTY]
      ,deleted.[Q_PU]
      ,deleted.[Q_Total]
      ,deleted.[S_QTY]
	  ,deleted.[S_P],deleted.[S_PU]
      ,deleted.[StandardSize]
      ,deleted.[CustDisc]
		 FROM deleted,inserted
			WHERE ISNULL(deleted.SalesNum,0)>0
			AND inserted.[Salesnum] = deleted.[Salesnum]
			AND NOT ( inserted.[alloy] = deleted.[alloy]
			AND inserted.[form] = deleted.[form]
			AND inserted.[cc] = deleted.[cc]
			AND inserted.[pieces] = deleted.[pieces]
 			AND inserted.[thck] = deleted.[thck]
 			AND inserted.[sz2] = deleted.[sz2]
 			AND inserted.[sz3] = deleted.[sz3]
 			AND inserted.[weight] = deleted.[weight]
			AND inserted.[descript] = deleted.[descript]
			AND inserted.[p_lb] = deleted.[p_lb]
			AND inserted.[p_pc] = deleted.[p_pc]
			AND inserted.[p_ft] = deleted.[p_ft]
			AND inserted.[cuts] = deleted.[cuts]
			AND inserted.[otherfld] = deleted.[otherfld]
			AND inserted.[otherp] = deleted.[otherp]
 			AND inserted.[lotp] = deleted.[lotp]
 			AND inserted.[lotcost] = deleted.[lotcost]
 			AND inserted.[leadtime] = deleted.[leadtime]
 			AND inserted.[Comments] = deleted.[Comments] 
  			AND inserted.[CountryC] = deleted.[CountryC]
 			AND inserted.[Country] = deleted.[Country]
 			AND inserted.[Services] = deleted.[Services]
 			AND inserted.[RandLen] = deleted.[RandLen]
  			AND inserted.[Metric] = deleted.[Metric]
 			AND inserted.[CutOptions] = deleted.[CutOptions]
 			AND inserted.[Surcharge] = deleted.[Surcharge]
 			AND inserted.[Regret] = deleted.[Regret] )
 	
	-------------
	-- After Edit, small list of changed field
	INSERT dbo.Ar_AllQuotes_History 
	  ([What]
	  ,[When]
	  ,[Company]
      ,[Name]
      ,[Phone]
      ,[Phone_Ext]
      ,[Fax]
      ,[Email]
      ,[PO_num]
      ,[Alloy]
      ,[Form]
      ,[CC]
      ,[CL]
      ,[Pieces]
      ,[Thck]
      ,[Sz2]
      ,[Sz3]
      ,[Weight]
      ,[Descript]
      ,[p_lb]
      ,[p_pc]
      ,[p_ft]
      ,[Cuts]
      ,[OtherFld]
      ,[OtherP]
      ,[LotP]
      ,[LotCost]
      ,[LeadTime]
      ,[cWeight]
      ,[cP_lb]
      ,[cP_pc]
      ,[cP_pcc]
      ,[cthk]
      ,[cLotP]
      ,[cLotcP]
      ,[cCut]
      ,[cCutM]
      ,[cKerfD]
      ,[InqDate]
      ,[InqNum]
      ,[InqNumP]
      ,[SalesP]
      ,[SalesNum]
      ,[SOitem]
      ,[item]
      ,[HPApo]
      ,[POitem]
      ,[SaleDate]
      ,[ShipDate]
      ,[Buyfrom]
      ,[BuyCost]
      ,[BuyFrom2]
      ,[HPApo2]
      ,[open_]
      ,[Bracket]
      ,[CustID]
      ,[QuoteMemo]
      ,[Comments]
      ,[CountryC]
      ,[Country]
      ,[Services]
      ,[RandLen]
      ,[Metric]
      ,[StartStock]
      ,[TN]
      ,[sz1orig]
      ,[sz2orig]
      ,[sz3orig]
      ,[QuoteDate]
      ,[Cover]
      ,[Cut]
      ,[ID]
      ,[Line1]
      ,[WO]
      ,[CutOptions]
      ,[Surcharge]
      ,[Regret]
      ,[NoNoiseName]
      ,[CutHr]
      ,[Q_P]
      ,[Q_QTY]
      ,[Q_PU]
      ,[Q_Total]
      ,[S_QTY]
	  ,[S_P],[S_PU]
      ,[StandardSize]
      ,[CustDisc]
      )
		SELECT 
	  ''AfterEdit''
	  , GETDATE()
	  ,inserted.[Company]
      ,inserted.[Name]
      ,inserted.[Phone]
      ,inserted.[Phone_Ext]
      ,inserted.[Fax]
      ,inserted.[Email]
      ,inserted.[PO_num]
      ,inserted.[Alloy]
      ,inserted.[Form]
      ,inserted.[CC]
      ,inserted.[CL]
      ,inserted.[Pieces]
      ,inserted.[Thck]
      ,inserted.[Sz2]
      ,inserted.[Sz3]
      ,inserted.[Weight]
      ,inserted.[Descript]
      ,inserted.[p_lb]
      ,inserted.[p_pc]
      ,inserted.[p_ft]
      ,inserted.[Cuts]
      ,inserted.[OtherFld]
      ,inserted.[OtherP]
      ,inserted.[LotP]
      ,inserted.[LotCost]
      ,inserted.[LeadTime]
      ,inserted.[cWeight]
      ,inserted.[cP_lb]
      ,inserted.[cP_pc]
      ,inserted.[cP_pcc]
      ,inserted.[cthk]
      ,inserted.[cLotP]
      ,inserted.[cLotcP]
      ,inserted.[cCut]
      ,inserted.[cCutM]
      ,inserted.[cKerfD]
      ,inserted.[InqDate]
      ,inserted.[InqNum]
      ,inserted.[InqNumP]
      ,inserted.[SalesP]
      ,inserted.[SalesNum]
      ,inserted.[SOitem]
      ,inserted.[item]
      ,inserted.[HPApo]
      ,inserted.[POitem]
      ,inserted.[SaleDate]
      ,inserted.[ShipDate]
      ,inserted.[Buyfrom]
      ,inserted.[BuyCost]
      ,inserted.[BuyFrom2]
      ,inserted.[HPApo2]
      ,inserted.[open_]
      ,inserted.[Bracket]
      ,inserted.[CustID]
      ,inserted.[QuoteMemo]
      ,inserted.[Comments]
      ,inserted.[CountryC]
      ,inserted.[Country]
      ,inserted.[Services]
      ,inserted.[RandLen]
      ,inserted.[Metric]
      ,inserted.[StartStock]
      ,inserted.[TN]
      ,inserted.[sz1orig]
      ,inserted.[sz2orig]
      ,inserted.[sz3orig]
      ,inserted.[QuoteDate]
      ,inserted.[Cover]
      ,inserted.[Cut]
      ,inserted.[ID]
      ,inserted.[Line1]
      ,inserted.[WO]
      ,inserted.[CutOptions]
      ,inserted.[Surcharge]
      ,inserted.[Regret]
      ,inserted.[NoNoiseName]
      ,inserted.[CutHr]
      ,inserted.[Q_P]
      ,inserted.[Q_QTY]
      ,inserted.[Q_PU]
      ,inserted.[Q_Total]
      ,inserted.[S_QTY]
	  ,inserted.[S_P],inserted.[S_PU]
      ,inserted.[StandardSize]
      ,inserted.[CustDisc]
		 FROM deleted,inserted
			WHERE ISNULL(deleted.SalesNum,0)>0
			AND inserted.[Salesnum] = deleted.[Salesnum]
			AND NOT ( inserted.[Company] = deleted.[Company]
			AND inserted.[PO_num] = deleted.[PO_num]

			AND inserted.[alloy] = deleted.[alloy]
			AND inserted.[form] = deleted.[form]
			AND inserted.[cc] = deleted.[cc]
			AND inserted.[pieces] = deleted.[pieces]
 			AND inserted.[thck] = deleted.[thck]
 			AND inserted.[sz2] = deleted.[sz2]
 			AND inserted.[sz3] = deleted.[sz3]
 			AND inserted.[weight] = deleted.[weight]

			AND inserted.[Q_Total] = deleted.[Q_Total]
			 )
 	
	-------------

	DECLARE @cReturn VARCHAR(254) = ''''

	IF UPDATE(Company)
		SELECT TOP 1 @cReturn = @cReturn + ''Company='' +LTRIM(inserted.Company) +'' ''
		FROM inserted 
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
		WHERE ISNULL(inserted.Company,'''') > ''''
			AND NOT inserted.Company = deleted.Company
			AND UPDATE(Company)

	IF UPDATE(HPApo)
		SELECT TOP 1 @cReturn = @cReturn + ''HPApo='' +LTRIM(CAST( inserted.HPApo AS CHAR(10))) +'' ''
		FROM inserted 
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
		WHERE ISNULL(inserted.HPApo,0) > 0
			AND NOT inserted.HPApo = deleted.HPApo
			AND UPDATE(HPApo)

	IF UPDATE(HPApo2)
		SELECT TOP 1 @cReturn = @cReturn + ''HPApo2='' +LTRIM(CAST( inserted.HPApo2 AS CHAR(10))) +'' ''
		FROM inserted 
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
		WHERE ISNULL(inserted.HPApo2,0) > 0
			AND NOT inserted.HPApo2 = deleted.HPApo2
			AND UPDATE(HPApo2)

	IF UPDATE(Alloy)
		SELECT TOP 1 @cReturn = @cReturn + ''Alloy='' +LTRIM(CAST( inserted.Alloy AS CHAR(12))) +'' ''
		FROM inserted 
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
		WHERE ISNULL(inserted.Alloy,'''') > ''''
			AND NOT inserted.Alloy = deleted.Alloy
			AND UPDATE(Alloy)

	IF UPDATE(Form)
		SELECT TOP 1 @cReturn = @cReturn + ''Form='' +LTRIM(CAST( inserted.Form AS CHAR(1))) +'' ''
		FROM inserted 
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
		WHERE ISNULL(inserted.Form,'''') > ''''
			AND NOT inserted.Form = deleted.Form
			AND UPDATE(Form)

	IF UPDATE(CC)
		SELECT TOP 1 @cReturn = @cReturn + ''CC='' +LTRIM(CAST( inserted.CC AS CHAR(1))) +'' ''
		FROM inserted 
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
		WHERE ISNULL(inserted.CC,'''') > ''''
			AND NOT inserted.CC = deleted.CC
			AND UPDATE(CC)

	IF UPDATE(CL)
		SELECT TOP 1 @cReturn = @cReturn + ''CL='' +LTRIM(CAST( inserted.CL AS CHAR(1))) +'' ''
		FROM inserted 
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
		WHERE ISNULL(inserted.CL,'''') > ''''
			AND NOT inserted.CL = deleted.CL
			AND UPDATE(CL)

	IF UPDATE(Pieces)
		SELECT TOP 1 @cReturn = @cReturn + ''Pieces='' +LTRIM(CAST( inserted.Pieces AS CHAR(10))) +'' ''
		FROM inserted 
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
		WHERE  ISNULL(inserted.Pieces,0) > 0
			AND NOT inserted.Pieces = deleted.Pieces
			AND UPDATE(Pieces)
	
	IF UPDATE(Thck)
		SELECT TOP 1 @cReturn = @cReturn + ''Thck='' +LTRIM(CAST( inserted.Thck AS CHAR(10))) +'' ''
		FROM inserted 
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
		WHERE  ISNULL(inserted.Thck,0) > 0
			AND NOT inserted.Thck = deleted.Thck
			AND UPDATE(Thck)	
				
	IF UPDATE(Sz2)
		SELECT TOP 1 @cReturn = @cReturn + ''Sz2='' +LTRIM(CAST( inserted.Sz2 AS CHAR(10))) +'' ''
		FROM inserted 
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
		WHERE  ISNULL(inserted.Sz2,0) > 0
			AND NOT inserted.Sz2 = deleted.Sz2
			AND UPDATE(Sz2)			
	
	IF UPDATE(Sz3)
		SELECT TOP 1 @cReturn = @cReturn + ''Sz3='' +LTRIM(CAST( inserted.Sz3 AS CHAR(10))) +'' ''
		FROM inserted 
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
		WHERE  ISNULL(inserted.Sz3,0) > 0
			AND NOT inserted.Sz3 = deleted.Sz3
			AND UPDATE(Sz3)

	IF UPDATE([Weight])
		SELECT TOP 1 @cReturn = @cReturn + ''[Weight]='' +LTRIM(CAST( FLOOR( CAST(inserted.[Weight] AS INT) ) AS CHAR(10))) +'' ''
		FROM inserted 
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
		WHERE  ISNULL(inserted.[Weight],0) > 0
			AND NOT inserted.[Weight] = deleted.[Weight]
			AND UPDATE([Weight])
	
	IF UPDATE(Descript)
		SELECT TOP 1 @cReturn = @cReturn + ''Descript ''
		FROM inserted 
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
		WHERE  ISNULL(inserted.Descript,'''') > ''''
			AND NOT inserted.Descript = deleted.Descript
			AND UPDATE(Descript)
			
	IF UPDATE(P_Lb)
		SELECT TOP 1 @cReturn = @cReturn + ''P_Lb='' +LTRIM(CAST( inserted.P_Lb AS CHAR(18))) +'' ''
		FROM inserted 
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
		WHERE  ISNULL(inserted.P_Lb,0) > 0
			AND NOT inserted.P_Lb = deleted.P_Lb
			AND UPDATE(P_Lb)
			
	IF UPDATE(P_Pc)
		SELECT TOP 1 @cReturn = @cReturn + ''P_Pc='' +LTRIM(CAST( inserted.P_Pc AS CHAR(18))) +'' ''
		FROM inserted 
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
		WHERE  ISNULL(inserted.P_Pc,0) > 0
			AND NOT inserted.P_Pc = deleted.P_Pc
			AND UPDATE(P_Pc)
			
	IF UPDATE(P_Ft)
		SELECT TOP 1 @cReturn = @cReturn + ''P_Ft='' +LTRIM(CAST( inserted.P_Ft AS CHAR(18))) +'' ''
		FROM inserted 
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
		WHERE  ISNULL(inserted.P_Ft,0) > 0
			AND NOT inserted.P_Ft = deleted.P_Ft
			AND UPDATE(P_Ft)
			
	IF UPDATE(Cuts)
		SELECT TOP 1 @cReturn = @cReturn + ''Cuts='' +LTRIM(CAST( inserted.Cuts AS CHAR(18))) +'' ''
		FROM inserted 
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
		WHERE  ISNULL(inserted.Cuts,0) > 0
			AND NOT inserted.Cuts = deleted.Cuts
			AND UPDATE(Cuts)
			
	IF UPDATE(OtherFld)
		SELECT TOP 1 @cReturn = @cReturn + ''OtherFld='' +LTRIM(CAST( inserted.OtherFld AS CHAR(18))) +'' ''
		FROM inserted 
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
		WHERE  ISNULL(inserted.OtherFld,'''') > ''''
			AND NOT inserted.OtherFld = deleted.OtherFld
			AND UPDATE(OtherFld)
			
	IF UPDATE(OtherP)
		SELECT TOP 1 @cReturn = @cReturn + ''OtherP='' +LTRIM(CAST( inserted.OtherP AS CHAR(18))) +'' ''
		FROM inserted 
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
		WHERE  ISNULL(inserted.OtherP,0) > 0
			AND NOT inserted.OtherP = deleted.OtherP
			AND UPDATE(OtherP)
			
	IF UPDATE(LotP)
		SELECT TOP 1 @cReturn = @cReturn + ''LotP='' +LTRIM(CAST( inserted.LotP AS CHAR(18))) +'' ''
		FROM inserted 
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
		WHERE  ISNULL(inserted.LotP,0) > 0
			AND NOT inserted.LotP = deleted.LotP
			AND UPDATE(LotP)
			
	IF UPDATE(LotCost)	--money needs Char(18)
		SELECT TOP 1 @cReturn = @cReturn + ''LotCost='' +LTRIM(CAST( inserted.LotCost AS CHAR(18))) +'' ''
		FROM inserted 
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
		WHERE  ISNULL(inserted.LotCost,0) > 0
			AND NOT inserted.LotCost = deleted.LotCost
			AND UPDATE(LotCost)
			
	IF UPDATE(LeadTime)
		SELECT TOP 1 @cReturn = @cReturn + ''LeadTime='' +LTRIM(CAST( inserted.LeadTime AS CHAR(15))) +'' ''
		FROM inserted 
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
		WHERE  ISNULL(inserted.LeadTime,'''') > ''''
			AND NOT inserted.LeadTime = deleted.LeadTime
			AND UPDATE(LeadTime)
			
	IF UPDATE(Comments)
		SELECT TOP 1 @cReturn = @cReturn + ''Comments= '' 
		FROM inserted 
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
		WHERE  ISNULL(inserted.Comments,'''') > ''''
			AND NOT inserted.Comments = deleted.Comments
			AND UPDATE(Comments)
			
	IF UPDATE(CountryC)
		SELECT TOP 1 @cReturn = @cReturn + ''CountryC='' +LTRIM(CAST( inserted.CountryC AS CHAR(10))) +'' ''
		FROM inserted 
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
		WHERE  ISNULL(inserted.CountryC,'''') > ''''
			AND NOT inserted.CountryC = deleted.CountryC
			AND UPDATE(CountryC)
			
	IF UPDATE(Country)
		SELECT TOP 1 @cReturn = @cReturn + ''Country='' +LTRIM(CAST( inserted.Country AS CHAR(10))) +'' ''
		FROM inserted 
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
		WHERE  ISNULL(inserted.Country,'''') > ''''
			AND NOT inserted.Country = deleted.Country
			AND UPDATE(Country)
			
	IF UPDATE([Services])
		SELECT TOP 1 @cReturn = @cReturn + ''[Services]='' +LTRIM(CAST( inserted.[Services] AS CHAR(10))) +'' ''
		FROM inserted 
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
		WHERE  ISNULL(inserted.[Services],0) > 0
			AND NOT inserted.[Services] = deleted.[Services]
			AND UPDATE([Services])
			
	IF UPDATE(RandLen)
		SELECT TOP 1 @cReturn = @cReturn + ''RandLen='' +LTRIM(CAST( inserted.RandLen AS CHAR(10))) +'' ''
		FROM inserted 
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
		WHERE  ISNULL(inserted.RandLen,0) > 0
			AND NOT inserted.RandLen = deleted.RandLen
			AND UPDATE(RandLen)
			
	IF UPDATE(Metric)
		SELECT TOP 1 @cReturn = @cReturn + ''Metric='' +LTRIM(CAST( inserted.Metric AS CHAR(10))) +'' ''
		FROM inserted 
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
		WHERE  ISNULL(inserted.Metric,0) > 0
			AND NOT inserted.Metric = deleted.Metric
			AND UPDATE(Metric)
			
	IF UPDATE(CutOptions)
		SELECT TOP 1 @cReturn = @cReturn + ''CutOptions '' 
		FROM inserted 
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
		WHERE  ISNULL(inserted.CutOptions,'''') > ''''
			AND NOT inserted.CutOptions = deleted.CutOptions
			AND UPDATE(CutOptions)
			

	IF LEN(@cReturn) > 0
		begin

  		PRINT ''INSERT INTO dbo.NR_UserTrack ''

--		DECLARE @ID INT = 0
--		SET @ID = ID FROM inserted

		INSERT INTO dbo.NR_UserTrack (Mess1,cProgram,ServerName) 
			SELECT LEFT(''AllQuotes ID''+LTRIM(CAST(inserted.ID AS CHAR(10)))+'' data for SOitem:''+inserted.SOitem+'' was changed. ''+ @cReturn ,1024) 
				,''AllQuotes_Update Trigger'' ,@@SERVERNAME
 			FROM inserted 
 			WHERE ISNULL(inserted.SalesNum,0)>0
 		
		end	
			
		
	END


/*
--Copy from MSDN2012R2 to BOBWHITE
UPDATE A
SET A.[Company] = B.Company
	  ,A.[Name] = B.[Name]
      ,A.[Phone] = B.[Phone]  
      ,A.[Phone_Ext] = B.[Phone_Ext]
      ,A.[Fax] = B.[Fax]
      ,A.[Email] = B.[Email]
      ,A.[PO_num] = B.[PO_num]
      ,A.[Alloy] = B.[Alloy]
      ,A.[Form] = B.[Form]
      ,A.[CC] = B.[CC]
      ,A.[CL] = B.[CL]
      ,A.[Pieces] = B.[Pieces]
      ,A.[Thck] = B.[Thck]
      ,A.[Sz2] = B.[Sz2]
      ,A.[Sz3] = B.[Sz3]
      ,A.[Weight] = B.[Weight]
      ,A.[Descript] = B.[Descript]
      ,A.[p_lb] = B.[p_lb]
      ,A.[p_pc] = B.[p_pc]
      ,A.[p_ft] = B.[p_ft]
      ,A.[Cuts] = B.[Cuts]
      ,A.[OtherFld] = B.[OtherFld]
      ,A.[OtherP] = B.[OtherP]
      ,A.[LotP] = B.[LotP]
      ,A.[LotCost] = B.[LotCost]
      ,A.[LeadTime] = B.[LeadTime]
      ,A.[cWeight] = B.[cWeight]
,A.[cP_lb] = B.[cP_lb]
      ,A.[cP_pc] = B.[cP_pc]
      ,A.[cP_pcc] = B.[cP_pcc]
      ,A.[cthk] = B.[cthk]
      ,A.[cLotP] = B.[cLotP]
      ,A.[cLotcP] = B.[cLotcP]
      ,A.[cCut] = B.[cCut]
      ,A.[InqDate] = B.[InqDate]
      ,A.[InqNum] = B.[InqNum]
      ,A.[InqNumP] = B.[InqNumP]
      ,A.[SalesP] = B.[SalesP]
      ,A.[SalesNum] = B.[SalesNum]
      ,A.[SOitem] = B.[SOitem]
      ,A.[item] = B.[item]
      ,A.[HPApo] = B.[HPApo]
      ,A.[POitem] = B.[POitem]
      ,A.[SaleDate] = B.[SaleDate]
      ,A.[ShipDate] = B.[ShipDate]
      ,A.[Buyfrom] = B.[Buyfrom]
      ,A.[BuyCost] = B.[BuyCost]
      ,A.[BuyFrom2] = B.[BuyFrom2]
      ,A.[HPApo2] = B.[HPApo2]
      ,A.[open_] = B.[open_]
      ,A.[Bracket] = B.[Bracket]
      ,A.[CustID] = B.[CustID]
      ,A.[QuoteMemo] = B.[QuoteMemo]
      ,A.[Comments] = B.[Comments]
      ,A.[CountryC] = B.[CountryC]
      ,A.[Country] = B.[Country]
      ,A.[Services] = B.[Services]
      ,A.[RandLen] = B.[RandLen]
      ,A.[Metric] = B.[Metric]
      ,A.[StartStock] = B.[StartStock]
      ,A.[TN] = B.[TN]
      ,A.[sz1orig] = B.[sz1orig]
      ,A.[sz2orig] = B.[sz2orig]
      ,A.[sz3orig] = B.[sz3orig]
      ,A.[QuoteDate] = B.[QuoteDate]
      ,A.[Cover] = B.[Cover]
      ,A.[Cut] = B.[Cut]
      --,A.[ID] = B.[ID]
      ,A.[Line1] = B.[Line1]
      ,A.[WO] = B.[WO]
      ,A.[CutOptions] = B.[CutOptions]
      ,A.[Surcharge] = B.[Surcharge]
      ,A.[Regret] = B.[Regret]
      ,A.[NoNoiseName] = B.[NoNoiseName]
      ,A.[CutHr] = B.[CutHr]
      ,A.[Q_P] = B.[Q_P]
      ,A.[Q_QTY] = B.[Q_QTY]
      ,A.[StandardSize] = B.[StandardSize]
      ,A.[CustDisc] = B.[CustDisc]
FROM [BOBWHITE].dbo.AllQuotes A
INNER JOIN [MSDN2012R2\HPADev].dbo.AllQuotes AS B ON A.ID = B.ID
WHERE A.ID = 2493213

*/

PRINT ''Trigger  End  [AllQuotes_Update]'';
' 
GO
ALTER TABLE [dbo].[AllQuotes] ENABLE TRIGGER [AllQuotes_Update]
GO
/****** Object:  Trigger [dbo].[AppSetup_After_Delete]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[AppSetup_After_Delete]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Brandon van de Venter
-- Create date: 10/16/2019
-- Description:	Updates email service user accounts
--
-- Updates:
-- [10/17/2019]: Brandon van de Venter - Added "ManualSettings" flag to the [EmailService_SalesUsers] table which, when set to true, should not be synchronized with [AppSetup]
-- =============================================
CREATE TRIGGER [dbo].[AppSetup_After_Delete] 
   ON  [dbo].[AppSetup] 
   AFTER DELETE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	DECLARE @email char(30)
	DECLARE @firstname char(20)
	DECLARE @lastname char(20)
	DECLARE @sp_initial char(30)

	DECLARE esUserCursor3 cursor for 
		SELECT RTRIM(A1.ANS) AS EmailAddress
			,SUBSTRING(LTRIM(A2.un),1,CHARINDEX('' '',LTRIM(A2.un) + '' '') -1) AS FirstName
			,SUBSTRING(LTRIM(RTRIM(A2.un)),CHARINDEX('' '',LTRIM(RTRIM(A2.un))) +1, LEN(LTRIM(RTRIM(A2.un)))) AS LastName
			,LTRIM(RTRIM(A2.Ans)) AS SP_Initial
		FROM ERP_2.dbo.AppSetup A1
		INNER JOIN ERP_2.dbo.AppSetup A2 ON A1.UN = A2.un
		WHERE A1.prp = ''E-mail''
		AND A2.PRP = ''ActiveSales''
	open esUserCursor3
	FETCH NEXT FROM esUserCursor3 INTO @email, @firstname, @lastname, @sp_initial
	while @@FETCH_STATUS = 0 
	BEGIN
		DECLARE @uID int = null
		DECLARE @uEmail varchar(254) = null
		DECLARE @uFirstName varchar(25) = null
		DECLARE @uLastName varchar(25) = null
		DECLARE @uIsActiveSales bit = 0
		DECLARE @uManualSet bit = 0
		
		SELECT @uID = su.Id
			,@uEmail = su.EmailAddress
			,@uFirstName = su.Firstname
			,@uLastName = su.Lastname
			,@uIsActiveSales = su.IsActiveSales
			,@uManualSet = su.[ManualSettings]
		FROM [dbo].[EmailService_SalesUsers] su
		WHERE su.SP_Initial = @sp_initial

		IF (@uID is not null) -- Found User, check if update is needed
			BEGIN
				if (@uManualSet != 1 AND (@uEmail != @email or @uFirstName != @firstname or @uLastName != @lastname or @uIsActiveSales != 1))
				BEGIN -- Only update the user if one of the above values does not match
					UPDATE [dbo].[EmailService_SalesUsers] 
					SET EmailAddress = @email
						,Firstname = @firstname
						,Lastname = @lastname
						,IsActiveSales = 1 --sets the user back to active if they were previously inactive
					WHERE Id = @uID
				END
			END
		ELSE -- New user
			BEGIN
				INSERT INTO [dbo].[EmailService_SalesUsers] ([Firstname] ,[Lastname] ,[EmailAddress] ,[MarkAbsent] ,[Note] ,[SP_Initial] ,[IsActiveSales])
				VALUES (@firstname, @lastname, @email, 0, null, @sp_initial, 1)
			END
		FETCH NEXT FROM esUserCursor3 INTO @email, @firstname, @lastname, @sp_initial
	END
	close esUserCursor3
	DEALLOCATE esUserCursor3

	-- Mark ActiveSales as Inactive if they are no longer active
	UPDATE [dbo].[EmailService_SalesUsers] 
	SET IsActiveSales = 0 --set the user to inactive
	WHERE
	[ManualSettings] != 1
	AND SP_Initial not in (
		SELECT LTRIM(RTRIM(A2.Ans)) AS SP_Initial
		FROM ERP_2.dbo.AppSetup A1
		INNER JOIN ERP_2.dbo.AppSetup A2 ON A1.UN = A2.un
		WHERE A1.prp = ''E-mail''
		AND A2.PRP = ''ActiveSales''
	)


	-- Archive Delete
	IF EXISTS( SELECT * FROM deleted WHERE [Prp] = ''Version'' AND [UN] = ''Minimum'' )
		DECLARE @cMinVal VarChar(50) = ''''
		SELECT TOP 1 @cMinVal=ANS FROM deleted WHERE [Prp] = ''Version'' AND [UN] = ''Minimum'' 

		INSERT INTO dbo.[Errors] ([nError]
        ,[mess1]
        ,[cprogram]
        ,[nlineno]
        ,[Revision]
        ,[Memo1]) VALUES 
	    (0,''Min Version was Deleted'',''SQL cmd'',0,''NaN'',RTRIM(@cMinVal)+'' Min Version was Deleted'')
      


END
' 
GO
ALTER TABLE [dbo].[AppSetup] ENABLE TRIGGER [AppSetup_After_Delete]
GO
/****** Object:  Trigger [dbo].[AppSetup_After_Insert]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[AppSetup_After_Insert]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Brandon van de Venter
-- Create date: 03/28/2019
-- Description:	Updates email service user accounts
--
-- Updates:
-- [09/10/2019]: Bug fix. initialize variables to null/default values within the cursor, otherwise they retain values when nothing is returned.
-- [10/17/2019]: Brandon van de Venter - Added "ManualSettings" flag to the [EmailService_SalesUsers] table which, when set to true, should not be synchronized with [AppSetup]
-- =============================================
CREATE TRIGGER [dbo].[AppSetup_After_Insert] 
   ON  [dbo].[AppSetup] 
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	DECLARE @email char(30)
	DECLARE @firstname char(20)
	DECLARE @lastname char(20)
	DECLARE @sp_initial char(30)

	DECLARE esUserCursor cursor for 
		SELECT RTRIM(A1.ANS) AS EmailAddress
			,SUBSTRING(LTRIM(A2.un),1,CHARINDEX('' '',LTRIM(A2.un) + '' '') -1) AS FirstName
			,SUBSTRING(LTRIM(RTRIM(A2.un)),CHARINDEX('' '',LTRIM(RTRIM(A2.un))) +1, LEN(LTRIM(RTRIM(A2.un)))) AS LastName
			,LTRIM(RTRIM(A2.Ans)) AS SP_Initial
		FROM ERP_2.dbo.AppSetup A1
		INNER JOIN ERP_2.dbo.AppSetup A2 ON A1.UN = A2.un
		WHERE A1.prp = ''E-mail''
		AND A2.PRP = ''ActiveSales''
	open esUserCursor
	FETCH NEXT FROM esUserCursor INTO @email, @firstname, @lastname, @sp_initial
	while @@FETCH_STATUS = 0 
	BEGIN
		DECLARE @uID int = null
		DECLARE @uEmail varchar(254) = null
		DECLARE @uFirstName varchar(25) = null
		DECLARE @uLastName varchar(25) = null
		DECLARE @uIsActiveSales bit = 0
		DECLARE @uManualSet bit = 0
		
		SELECT @uID = su.Id
			,@uEmail = su.EmailAddress
			,@uFirstName = su.Firstname
			,@uLastName = su.Lastname
			,@uIsActiveSales = su.IsActiveSales
			,@uManualSet = su.[ManualSettings]
		FROM [dbo].[EmailService_SalesUsers] su
		WHERE su.SP_Initial = @sp_initial

		IF (@uID is not null) -- Found User, check if update is needed
			BEGIN
				if (@uManualSet != 1 AND (@uEmail != @email or @uFirstName != @firstname or @uLastName != @lastname or @uIsActiveSales != 1))
				BEGIN -- Only update the user if one of the above values does not match
					UPDATE [dbo].[EmailService_SalesUsers] 
					SET EmailAddress = @email
						,Firstname = @firstname
						,Lastname = @lastname
						,IsActiveSales = 1 --sets the user back to active if they were previously inactive
					WHERE Id = @uID
				END
			END
		ELSE -- New user
			BEGIN
				INSERT INTO [dbo].[EmailService_SalesUsers] ([Firstname] ,[Lastname] ,[EmailAddress] ,[MarkAbsent] ,[Note] ,[SP_Initial] ,[IsActiveSales]
					,[EmailService_SalesUsers_Schedule],[ManualSettings],[EmailWeight] )
				VALUES (@firstname, @lastname, @email, 0, null, @sp_initial, 1
					,1,0,0)
			END
		FETCH NEXT FROM esUserCursor INTO @email, @firstname, @lastname, @sp_initial
	END
	close esUserCursor
	DEALLOCATE esUserCursor

	-- Mark ActiveSales as Inactive if they are no longer active
	UPDATE [dbo].[EmailService_SalesUsers] 
	SET IsActiveSales = 0 --set the user to inactive
	WHERE
	[ManualSettings] != 1
	AND SP_Initial not in (
		SELECT LTRIM(RTRIM(A2.Ans)) AS SP_Initial
		FROM ERP_2.dbo.AppSetup A1
		INNER JOIN ERP_2.dbo.AppSetup A2 ON A1.UN = A2.un
		WHERE A1.prp = ''E-mail''
		AND A2.PRP = ''ActiveSales''
	)
END
' 
GO
ALTER TABLE [dbo].[AppSetup] ENABLE TRIGGER [AppSetup_After_Insert]
GO
/****** Object:  Trigger [dbo].[AppSetup_After_Update]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[AppSetup_After_Update]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Brandon van de Venter
-- Create date: 03/28/2019
-- Description:	Updates email service user accounts
--
-- Updates:
-- [09/10/2019]: Bug fix. initialize variables to null/default values within the cursor, otherwise they retain values when nothing is returned.
-- [10/17/2019]: Brandon van de Venter - Added "ManualSettings" flag to the [EmailService_SalesUsers] table which, when set to true, should not be synchronized with [AppSetup]
-- =============================================
CREATE TRIGGER [dbo].[AppSetup_After_Update] 
   ON  [dbo].[AppSetup] 
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	DECLARE @email char(30)
	DECLARE @firstname char(20)
	DECLARE @lastname char(20)
	DECLARE @sp_initial char(30)

	DECLARE esUserCursor2 cursor for 
		SELECT RTRIM(A1.ANS) AS EmailAddress
			,SUBSTRING(LTRIM(A2.un),1,CHARINDEX('' '',LTRIM(A2.un) + '' '') -1) AS FirstName
			,SUBSTRING(LTRIM(RTRIM(A2.un)),CHARINDEX('' '',LTRIM(RTRIM(A2.un))) +1, LEN(LTRIM(RTRIM(A2.un)))) AS LastName
			,LTRIM(RTRIM(A2.Ans)) AS SP_Initial
		FROM ERP_2.dbo.AppSetup A1
		INNER JOIN ERP_2.dbo.AppSetup A2 ON A1.UN = A2.un
		WHERE A1.prp = ''E-mail''
		AND A2.PRP = ''ActiveSales''
	open esUserCursor2
	FETCH NEXT FROM esUserCursor2 INTO @email, @firstname, @lastname, @sp_initial
	while @@FETCH_STATUS = 0 
	BEGIN
		DECLARE @uID int = null
		DECLARE @uEmail varchar(254) = null
		DECLARE @uFirstName varchar(25) = null
		DECLARE @uLastName varchar(25) = null
		DECLARE @uIsActiveSales bit = 0
		DECLARE @uManualSet bit = 0
		
		SELECT @uID = su.Id
			,@uEmail = su.EmailAddress
			,@uFirstName = su.Firstname
			,@uLastName = su.Lastname
			,@uIsActiveSales = su.IsActiveSales
			,@uManualSet = su.[ManualSettings]
		FROM [dbo].[EmailService_SalesUsers] su
		WHERE su.SP_Initial = @sp_initial

		IF (@uID is not null) -- Found User, check if update is needed
			BEGIN
				if (@uManualSet != 1 AND (@uEmail != @email or @uFirstName != @firstname or @uLastName != @lastname or @uIsActiveSales != 1))
				BEGIN -- Only update the user if one of the above values does not match
					UPDATE [dbo].[EmailService_SalesUsers] 
					SET EmailAddress = @email
						,Firstname = @firstname
						,Lastname = @lastname
						,IsActiveSales = 1 --sets the user back to active if they were previously inactive
					WHERE Id = @uID
				END
			END
		ELSE -- New user
			BEGIN
				INSERT INTO [dbo].[EmailService_SalesUsers] ([Firstname] ,[Lastname] ,[EmailAddress] ,[MarkAbsent] ,[Note] ,[SP_Initial] ,[IsActiveSales])
				VALUES (@firstname, @lastname, @email, 0, null, @sp_initial, 1)
			END
		FETCH NEXT FROM esUserCursor2 INTO @email, @firstname, @lastname, @sp_initial
	END
	close esUserCursor2
	DEALLOCATE esUserCursor2

	-- Mark ActiveSales as Inactive if they are no longer active
	UPDATE [dbo].[EmailService_SalesUsers] 
	SET IsActiveSales = 0 --set the user to inactive
	WHERE
	[ManualSettings] != 1
	AND SP_Initial not in (
		SELECT LTRIM(RTRIM(A2.Ans)) AS SP_Initial
		FROM ERP_2.dbo.AppSetup A1
		INNER JOIN ERP_2.dbo.AppSetup A2 ON A1.UN = A2.un
		WHERE A1.prp = ''E-mail''
		AND A2.PRP = ''ActiveSales''
	)
END
' 
GO
ALTER TABLE [dbo].[AppSetup] ENABLE TRIGGER [AppSetup_After_Update]
GO
/****** Object:  Trigger [dbo].[AppSetup_Insert]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[AppSetup_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[AppSetup_Insert] ON [dbo].[AppSetup] 
	FOR INSERT
	NOT FOR REPLICATION
AS

PRINT ''start trigger [AppSetup_Insert]'';

--IF ( UPDATE(PRP)  or UPDATE(ANS) )
begin
	----
	
/*	IF EXISTS( SELECT * FROM dbo.AppSetup AP WITH(NOLOCK)
		inner join inserted ON AP.prp = inserted.prp AND AP.ans = inserted.ans AND AP.un = inserted.un
		AND inserted.Prp = ''SalesP'' )
		begin
			--Do not save
			RAISERROR (''SalesP already exits'', 16, 1);
			ROLLBACK TRANSACTION;
			RETURN;
		end
*/	

	----
	IF EXISTS( SELECT * FROM inserted WHERE inserted.Prp = ''SalesP''		)
	begin
		--Update SalesP!
		DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
		DECLARE @Body varchar(4000)
		DECLARE @ID INT
		DECLARE @SalesP CHAR(1)
		DECLARE @SalesPOld CHAR(1)

		SELECT TOP 1 
			@ID = inserted.ID
			,@SalesP = Inserted.ANS
			FROM inserted
			WHERE inserted.Prp = ''SalesP'' 
			

		PRINT ''Send a -Edited SalesP- Email ''
	
		SET @Body = RTRIM(SUSER_SNAME())+'' Inserted SalesP: ''+ISNULL(@SalesP,'''')
			+CHAR(13)+''ID: ''+CAST(ISNULL(@ID,'''') AS CHAR(10)) 
			+CHAR(10)+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.AppSetup_Insert ''
			
		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = ''Admin.Alerts@ERP_1s.com'', 
			 @SubjectEmail = ''Insert to AppSetup SalesP'',
			 @BodyEmail = @Body,
			 @BodyType = ''TEXT''
		
		DECLARE @UN CHAR(20)=''''
		SELECT TOP 1 @UN = inserted.UN
			FROM inserted
			WHERE inserted.Prp = ''SalesP'' 
			AND LEN(ISNULL(inserted.UN,'''')) > 0

		IF LEN(@UN) = 1
		BEGIN
			RAISERROR (''UserName must be more than 1 character'', 16, 1);
			ROLLBACK TRANSACTION;
			RETURN;
		END;	

	end
end


PRINT ''end trigger [AppSetup_Update]'';
' 
GO
ALTER TABLE [dbo].[AppSetup] ENABLE TRIGGER [AppSetup_Insert]
GO
/****** Object:  Trigger [dbo].[AppSetup_Update]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[AppSetup_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[AppSetup_Update] ON [dbo].[AppSetup] 
	FOR UPDATE 
	NOT FOR REPLICATION
AS

PRINT ''start trigger [AppSetup_Update]'';


---big UPDATES are in error
DECLARE @Count int
SET @Count = @@ROWCOUNT;
   
IF @Count > 100
BEGIN
	RAISERROR(''Cannot UPDATE more than 100 records of dbo.AppSetup at one time. trigger AppSetup_Update'',16,1) 
	ROLLBACK TRANSACTION
	RETURN;
END

DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
DECLARE @Body varchar(4000)
DECLARE @ID INT
DECLARE @SalesP CHAR(1)
DECLARE @SalesPOld CHAR(1)
DECLARE @UN	CHAR(20) = ''UserName''
DECLARE @ANS CHAR(20) = ''Answer''

----------------------

--IF ( UPDATE(PRP) or UPDATE(ANS) )
--begin
	----
	IF EXISTS( SELECT * FROM inserted
		inner join deleted ON deleted.ID = inserted.ID
		WHERE inserted.Prp = ''SalesP''
		AND ( UPDATE(PRP) or UPDATE(ANS) ) 
		AND inserted.ANS <> deleted.ANS
		)
	begin
		--Update SalesP!

		SELECT TOP 1 
			@ID = inserted.ID
			,@SalesP = inserted.ANS
			,@SalesPOld = deleted.ANS
			,@UN	= deleted.un
			FROM inserted
				inner join deleted ON deleted.ID = inserted.ID
			WHERE inserted.Prp = ''SalesP'' 
			AND inserted.ANS <> deleted.ANS
			AND UPDATE(ANS) 

		PRINT ''Send a -Edited SalesP- Email ''
	
		SET @Body = RTRIM(SUSER_SNAME())+'' Updated SalesP to: ''+ISNULL(@SalesP,'''')+'' from: ''+ISNULL(@SalesPOld,'''')
			+CHAR(13)+'' and UserName: ''+ISNULL(@UN,'''') 
			+CHAR(13)+'' on ID: ''+CAST(@ID AS CHAR(10)) 
			+CHAR(13)+'' WHERE Prp = SalesP''
			+CHAR(10)+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.AppSetup_Update ''
			
		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = ''Admin.Alerts@ERP_1s.com'', 
			 @SubjectEmail = ''Update to AppSetup SalesP'',
			 @BodyEmail = @Body,
			 @BodyType = ''TEXT''

	end
--end

	----

	IF EXISTS( SELECT * FROM inserted inner join deleted ON inserted.ID = deleted.ID 
		WHERE inserted.[PRP] = ''Version'' AND inserted.[UN]!=''Latest'' AND inserted.ANS =''3.8.26'')
	begin

		SELECT TOP 1 @UN = inserted.UN
			,@ANS = inserted.ANS

			FROM inserted
			inner join deleted ON inserted.ID = deleted.ID
			WHERE inserted.[PRP] = ''Version'' AND inserted.[UN]!=''Latest'' 
			AND inserted.ANS =''3.8.26''

		PRINT ''Send a David About Version 3.8.26 an Email of the Update''
	
		SET @Body = RTRIM(SUSER_SNAME())+'' Updated to Version ''+ISNULL(@ANS,'''')
			+CHAR(13)+''Machine: ''+ISNULL(@UN,'''')+CHAR(13)
			+CHAR(13)+''https://raptor/ReportS/report/dataBase/User%20Version%20HPA%20App''+CHAR(13)
			+CHAR(10)+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.AppSetup_Update ''
			
		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = ''David.Kirchner@ERP_1s.com'', 
			 @SubjectEmail = ''HPA App 3.8.26'',
			 @BodyEmail = @Body,
			 @BodyType = ''TEXT''
		

	end




	----
	DECLARE @ANS2 CHAR(20) = ''No Ver''

	IF EXISTS( SELECT * FROM inserted inner join deleted ON inserted.ID = deleted.ID 
		WHERE inserted.[PRP] = ''Version'' AND inserted.[UN]!=''Latest'' AND inserted.ANS <> deleted.ANS 
		AND inserted.ANS !=''3.8.26'' AND deleted.ANS !=''3.8.26'' )
	begin
		--UN			PRP				ANS
		--VFPVM        	Version     	3.8.50                                            
		--UPDATE dbo.AppSetup SET UN=''VFPVM'', PRP=''Version'', ANS=''3.8.54'' WHERE ID=5273
		
		SELECT TOP 1 @UN = inserted.UN
			,@ANS = inserted.ANS
			,@ANS2 = deleted.ANS
			FROM inserted
			inner join deleted ON inserted.ID = deleted.ID
			WHERE inserted.[PRP] = ''Version'' AND inserted.[UN]!=''Latest'' 
			AND inserted.ANS <> deleted.ANS
			--AND UPDATE(ANS) --ins<>del works 

		PRINT ''Send a David an Email of the Update''
	
		SET @Body = RTRIM(SUSER_SNAME())+'' Updated to Version ''+ISNULL(@ANS,'''')
			+CHAR(13)+''from Version ''+ISNULL(@ANS2,'''')+CHAR(13)
			+CHAR(13)+''Machine: ''+ISNULL(@UN,'''')+CHAR(13)
			+CHAR(13)+''https://raptor/ReportS/report/dataBase/User%20Version%20HPA%20App''+CHAR(13)
			+CHAR(10)+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.AppSetup_Update ''
			
		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = ''David.Kirchner@ERP_1s.com'', 
			 @SubjectEmail = ''HPA App Updated'',
			 @BodyEmail = @Body,
			 @BodyType = ''TEXT''
		

	end

PRINT ''end trigger [AppSetup_Update]'';
' 
GO
ALTER TABLE [dbo].[AppSetup] ENABLE TRIGGER [AppSetup_Update]
GO
/****** Object:  Trigger [dbo].[BrokerLst_Detail_After_Delete]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Detail_After_Delete]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[BrokerLst_Detail_After_Delete] ON [dbo].[BrokerLst_Detail] 
	AFTER DELETE 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [BrokerLst_Detail_After_Delete]'';

--
PRINT '' UPDATE dbo.BrokerLst_Master SET MWeight''

UPDATE dbo.BrokerLst_Master 
	SET MWeight = dbo.f_GetMWeight_BrokerLst_ID(deleted.ID)
	,mS_QTY  = dbo.f_Calc_mS_QTY_BrokerLst_ID(deleted.ID)
	FROM dbo.BrokerLst_Master
	INNER JOIN deleted ON BrokerLst_Master.ID = deleted.ID
	WHERE BrokerLst_Master.ID = deleted.ID;


PRINT ''Trigger  End  [BrokerLst_Detail_After_Delete]'';
' 
GO
ALTER TABLE [dbo].[BrokerLst_Detail] ENABLE TRIGGER [BrokerLst_Detail_After_Delete]
GO
/****** Object:  Trigger [dbo].[BrokerLst_Detail_After_Insert]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Detail_After_Insert]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.BrokerLst_Detail_Insert    Script Date: 10/14/2004 10:01:01 AM ******/

CREATE TRIGGER [dbo].[BrokerLst_Detail_After_Insert] ON [dbo].[BrokerLst_Detail] 
	AFTER INSERT 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [BrokerLst_Detail_After_Insert]'';

--
PRINT '' UPDATE dbo.BrokerLst_Master SET MWeight''

UPDATE dbo.BrokerLst_Master 
	SET MWeight = dbo.f_GetMWeight_BrokerLst_ID(inserted.ID)
	,mS_QTY  = dbo.f_Calc_mS_QTY_BrokerLst_ID(inserted.ID)
	FROM dbo.BrokerLst_Master
	INNER JOIN inserted ON BrokerLst_Master.ID = inserted.ID
	WHERE BrokerLst_Master.ID = inserted.ID;


--Email
IF EXISTS( SELECT * FROM inserted WHERE LEFT(inserted.Length,20) = inserted.Descript AND LEN(inserted.Descript) > 7 )
	begin

	DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
	DECLARE @Body varchar(4000)
	
	SET @Body = ''<!DOCTYPE html> <html><head><title>HPA Notice</title></head><body>''

	SELECT TOP 1 @Body = @Body+''Inserted Same Description and Length </br>''
		+''<p>BrokerLst Detail could have a problem. </p></br>''
		+''<p> ID:''+RTRIM(CAST(inserted.ID AS CHAR))+''</p>''
		+''<p> ID_Detail:''+RTRIM(CAST(inserted.ID_Detail AS CHAR))+''</p>''
		+''<p> ReceivingID:''+RTRIM(CAST(inserted.ReceivingID AS CHAR))+''</p>''
		+''<p><bold> Description:''+RTRIM(inserted.Descript)+''</bold></p>''+''</br>''
		+''<p> Broker Master ''+ISNULL(dbo.f_Reportlink_INT(''BrokerLstID'',inserted.ID),'''')+''</p>''
		+''<p> Broker Detail ''+ISNULL(dbo.f_Reportlink_INT(''BrokerLstID_Detail'',inserted.ID_Detail),'''')+''</p>''
		+''<p> ReceivingID ''+ISNULL(dbo.f_Reportlink_INT(''ReceivingID'',inserted.ReceivingID),'''')+''</p></br>''
		FROM inserted
		WHERE LEFT(inserted.Length,20) = inserted.Descript AND LEN(inserted.Descript) > 7 

	SET @Body = @Body +''<p>''+ SUSER_SNAME()+'' on ''+RTRIM(CAST(GETDATE()AS CHAR))+''</p></br>''

	SET @Body = @Body +''<p>''+@@SERVERNAME+ '' Trigger BrokerLst_Detail_After_Insert ''+''</p></br>''

	SET @Body = @Body +''</body></html>''

	EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''vfpprogramming@ERP_1s.com'', 
		 @SubjectEmail = ''Inserted Same Description and Length '',
		 @BodyEmail = @Body,
		 @BodyType = ''HTML''		

	end

---------------------------------------------
INSERT dbo.BrokerLst_Detail_Inserted
		( Master_ID, ID_Detail, [Who], [When]  )
	SELECT ISNULL(ID,0) AS Master_ID, ID_Detail, suser_sname(), GetDate() FROM inserted
		WHERE ISNULL(ID_Detail ,0) > 0


PRINT ''Trigger  End  [BrokerLst_Detail_After_Insert]'';
' 
GO
ALTER TABLE [dbo].[BrokerLst_Detail] ENABLE TRIGGER [BrokerLst_Detail_After_Insert]
GO
/****** Object:  Trigger [dbo].[BrokerLst_Detail_After_Update]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Detail_After_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[BrokerLst_Detail_After_Update] 
ON [dbo].[BrokerLst_Detail] 
	AFTER UPDATE 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [BrokerLst_Detail_After_Update]'';

--To track a change, insert a Process Detail that explains the change
--INSERT INTO dbo.BrokerLst_Process_Detail (ID_Detail,[What],WO,SOitem ) VALUES (9,''EDIT'',0,'''') 

DECLARE @SOitem CHAR(10)
DECLARE @POitem CHAR(12)
DECLARE @nID_Detail_Process INT
DECLARE @dtWHEN DateTime = GetDate()
DECLARE @cWho VARCHAR(255) = SUSER_SNAME()

IF ( UPDATE(PC) 
	or UPDATE(Size_H) 
	or UPDATE(Dim1) or UPDATE(Size_L) 
	or UPDATE(Dim2) or UPDATE(Dim3) 
	or UPDATE(Weight) or UPDATE(Descript) 
	or UPDATE(Length) or UPDATE(CostValue) 
	or UPDATE(Unit) or UPDATE(Quarantine)
	or UPDATE(S_QTY) or UPDATE(S_P) or UPDATE(S_Total)
	or UPDATE([Location]) )
begin
	
	PRINT '' INSERT dbo.Ar_BrokerLst_Detail_History from Before Edit.  [BrokerLst_Detail_After_Update]'';

	INSERT dbo.Ar_BrokerLst_Detail_History 
		([ID_Detail_Process],[Who],[What],[When],
		[ProcessValue],[size_h],[size_l],[pc],
		[dim1],[dim2],[dim3],[length],[weight],
		[costvalue],[descript],	[location],
		[floorstatus],[class],[unit],
		[RandLen],[InvCheck],[id],[id_detail],[ReceivingID],
		[InvoiceValue],	[AccountingCheck],[Quarantine],
		[S_QTY],[S_P],[S_Total],[S_PU],[Prime],[WO])
			SELECT 0,@cWho,''BEFOREEDIT'',@dtWHEN,
		ISNULL(deleted.S_QTY * deleted.S_P,0),	deleted.[size_h],deleted.[size_l],deleted.[pc],
		deleted.[dim1],deleted.[dim2],deleted.[dim3],deleted.[length],deleted.[weight],
		deleted.[costvalue],deleted.[descript],	deleted.[location],
		deleted.[floorstatus],deleted.[class],deleted.[unit],
		deleted.[RandLen],deleted.[InvCheck],deleted.[id],deleted.[id_detail],deleted.[ReceivingID],
		deleted.[InvoiceValue],	deleted.[AccountingCheck],deleted.[Quarantine],
		deleted.[S_QTY],deleted.[S_P],deleted.[S_Total],deleted.[S_PU],deleted.[Prime],deleted.[WO]
			FROM deleted

	PRINT '' INSERT dbo.Ar_BrokerLst_Detail_History from deleted.  [BrokerLst_Detail_After_Update]'';

	INSERT dbo.Ar_BrokerLst_Detail_History 
		([ID_Detail_Process],[Who],[What],[When],
		[ProcessValue],[size_h],[size_l],[pc],
		[dim1],[dim2],[dim3],[length],[weight],
		[costvalue],[descript],	[location],
		[floorstatus],[class],[unit],
		[RandLen],[InvCheck],[id],[id_detail],[ReceivingID],
		[InvoiceValue],	[AccountingCheck],[Quarantine],
		[S_QTY],[S_P],[S_Total],[S_PU],[Prime],[WO])
			SELECT 0,@cWho,''AFTEREDIT'',@dtWHEN,
		ISNULL(inserted.S_QTY * inserted.S_P,0),	inserted.[size_h],inserted.[size_l],inserted.[pc],
		inserted.[dim1],inserted.[dim2],inserted.[dim3],inserted.[length],inserted.[weight],
		inserted.[costvalue],inserted.[descript],	inserted.[location],
		inserted.[floorstatus],inserted.[class],inserted.[unit],
		inserted.[RandLen],inserted.[InvCheck],inserted.[id],inserted.[id_detail],inserted.[ReceivingID],
		inserted.[InvoiceValue],	inserted.[AccountingCheck],inserted.[Quarantine],
		inserted.[S_QTY],inserted.[S_P],inserted.[S_Total],inserted.[S_PU],inserted.[Prime],inserted.[WO]
			FROM inserted
			
		PRINT '' INSERT dbo.Ar_BrokerLst_Detail_History from inserted.  [BrokerLst_Detail_After_Update]'';

	--Update if Process detail is found
	IF EXISTS(SELECT * FROM dbo.BrokerLst_Process_Detail WHERE Who = @cWho AND What = ''EDIT'' )
		begin

		PRINT '' found Process Detail''
		SELECT TOP 1 @nID_Detail_Process = ID_Detail_Process 
		  FROM dbo.BrokerLst_Process_Detail 
		  WHERE Who = @cWho AND What = ''EDIT''

		PRINT ''nID_Detail_Process = ''+CAST(@nID_Detail_Process AS CHAR(10))+''  [BrokerLst_Detail_After_Update]'';
		
		PRINT '' UPDATE dbo.Ar_BrokerLst_Detail_History from deleted.  [BrokerLst_Detail_After_Update]'';

		UPDATE dbo.Ar_BrokerLst_Detail_History 
			SET ID_Detail_Process = SPD.ID_Detail_Process
			FROM dbo.Ar_BrokerLst_Detail_History DH
			INNER JOIN deleted ON DH.ID_Detail = deleted.ID_Detail
			INNER JOIN dbo.BrokerLst_Process_Detail SPD ON deleted.ID_Detail = SPD.ID_Detail
				WHERE SPD.Who = @cWho AND SPD.What = ''EDIT''
				AND DH.ID_Detail_Process=0
				AND DH.[Who] = @cWho
				AND DH.[What] = ''BEFOREEDIT''
				AND DH.[When] = @dtWHEN 
				
		
		PRINT '' UPDATE dbo.Ar_BrokerLst_Detail_History from inserted.   [BrokerLst_Detail_After_Update]'';
		
		UPDATE dbo.Ar_BrokerLst_Detail_History 
			SET ID_Detail_Process = SPD.ID_Detail_Process
			FROM dbo.Ar_BrokerLst_Detail_History DH
			INNER JOIN inserted ON DH.ID_Detail = inserted.ID_Detail
			INNER JOIN dbo.BrokerLst_Process_Detail SPD ON inserted.ID_Detail = SPD.ID_Detail
				WHERE SPD.Who = @cWho AND SPD.What = ''EDIT''
				AND DH.ID_Detail_Process=0
				AND DH.[Who] = @cWho
				AND DH.[What] = ''AFTEREDIT''
				AND DH.[When] = @dtWHEN 



		----

		PRINT '' DELETE FROM dbo.BrokerLst_Process_Detail WHERE Who = ''+RTRIM(@cWho)+'' AND What = EDIT    [BrokerLst_Detail_Update]''
		DELETE FROM dbo.BrokerLst_Process_Detail 
			WHERE Who = @cWho 
			AND ( What=''EDIT'' or What=''Sell Stock'' or What=''Work Order'' or What=''CANCELLED'' or what=''CORRECTION'');

		end

	---

	PRINT '' UPDATE dbo.BrokerLst_Master SET MWeight  [BrokerLst_Detail_After_Update]'';

	UPDATE dbo.BrokerLst_Master 
		SET MWeight = dbo.f_GetMWeight_BrokerLst_ID(inserted.ID)
		  ,mS_QTY  = dbo.f_Calc_mS_QTY_BrokerLst_ID(inserted.ID)
		FROM dbo.BrokerLst_Master
		INNER JOIN inserted ON Brokerlst_Master.ID = inserted.ID
		WHERE Brokerlst_Master.ID = inserted.ID

	SELECT @SOitem = SOitem, @POitem = PO_Item 
	   FROM dbo.Ar_BrokerLst_Process_History
	   WHERE ID_Detail_Process = @nID_Detail_Process
	
	--PRINT '' get WeightChange,PcChange,SOitem  [BrokerLst_Detail_After_Update]''

	/*
	INSERT dbo.Ar_BrokerLst_Process_GS_History 
		( [Who], [what] ,[When],	
		[SOitem], [POitem],
		[comment], [process_id], 
		[PWeight], 
		[PPc],
		[id_detail], [id_detail_process], [Validated],
		[S_QTY], [S_P], [S_PU] )
	  SELECT SUSER_SNAME(),''UPDATE'',GETDATE(),
		@SOitem, @POitem,
		''BrokerLst_Detail Update'',''GS CHANGE'',
		(deleted.[Weight] - inserted.[Weight]),
		(deleted.[Pc] - inserted.[Pc]),
		inserted.[id_detail],@nID_Detail_Process,0,
		inserted.[S_QTY],inserted.[S_P],inserted.[S_PU]
		FROM inserted
		INNER JOIN deleted ON deleted.ID_Detail = inserted.ID_Detail
		

	PRINT '' INSERT dbo.Ar_BrokerLst_Process_GS_History [BrokerLst_Detail_After_Update]''

	*/
	--Lost Receiving ID  ?
	----dbo.BrokerLst_Detail
	IF EXISTS( SELECT * FROM inserted, deleted 
		WHERE inserted.ID = deleted.ID
			AND inserted.ID_Detail = deleted.ID_Detail
			AND inserted.ReceivingID=0 
			AND ISNULL(deleted.ReceivingID,0)>0 )
	begin
		--Lost Receiving ID
		DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
		DECLARE @Body varchar(4000)
		DECLARE @ReceivingID INT, @ReceivingIDNew INT
		DECLARE @ID INT
		DECLARE @ID_Detail INT
		
		SELECT TOP 1 @ReceivingID = deleted.ReceivingID
			, @ReceivingIDNew = inserted.ReceivingID
			,@ID = deleted.ID
			,@ID_Detail = deleted.ID_Detail
			FROM inserted,deleted 
			WHERE inserted.ID = deleted.ID
				AND inserted.ID_Detail = deleted.ID_Detail
				AND inserted.ReceivingID=0 
				AND ISNULL(deleted.ReceivingID,0)>0 
	
		PRINT '' Send a -Removed ReceivingID- Email    [BrokerLst_Detail_Update]''
	
		SET @Body = RTRIM(@cWho)+'' updated the BrokerLst and that removed the ReceivingID: ''+CAST(@ReceivingID AS CHAR(10))+'' ''
		    +CHAR(13)+''New Receiving ID: ''+CAST(@ReceivingIDNew AS CHAR(10)) +''''
			+CHAR(13)+''for BrokerLst ID: ''+CAST(@ID AS CHAR(10)) +''''
			+CHAR(13)+'', ID_Detail: ''+RTRIM(CAST(@ID_Detail AS CHAR(10))) +''.''
			+CHAR(10)+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.BrokerLst_Detail_After_Update ''
			
		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = ''Admin.Alerts@ERP_1s.com'', 
			 @SubjectEmail = ''BrokerLst update removed the ReceivingID'',
			 @BodyEmail = @Body,
			 @BodyType = ''TEXT''

	end

end


PRINT ''Trigger  End  [BrokerLst_Detail_After_Update]'';
' 
GO
ALTER TABLE [dbo].[BrokerLst_Detail] ENABLE TRIGGER [BrokerLst_Detail_After_Update]
GO
/****** Object:  Trigger [dbo].[BrokerLst_Detail_Delete]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Detail_Delete]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[BrokerLst_Detail_Delete] ON [dbo].[BrokerLst_Detail] 
	FOR DELETE 
	NOT FOR REPLICATION
AS

DECLARE @Count int
SET @Count = @@ROWCOUNT;
        
IF @Count > 100
BEGIN
    RAISERROR(''Cannot DELETE more than 100 records of Lst_Detail at one time. BrokerLst_Detail_Delete'',16,1) 
    ROLLBACK TRANSACTION
    RETURN;
END

PRINT ''Start trigger [BrokerLst_Detail_Delete]'';

---
PRINT '' SELECT @nID_Detail_Process = ID_Detail_Process FROM dbo.BrokerLst_Process_Detail   [BrokerLst_Detail_Delete]''
DECLARE @nID_Detail_Process INT = 0

SELECT TOP 1 @nID_Detail_Process = ID_Detail_Process 
  FROM dbo.BrokerLst_Process_Detail 
  WHERE Who = SUSER_SNAME()
  AND ( What = ''DELETE'' OR What = ''REMOVED'' OR What = ''CONSUMED'' )

 PRINT ''ID_Detail_Process = '' +CAST(@nID_Detail_Process AS CHAR(10))


--Warn other Salesmen their SELECTED stock is gone.
IF ISNULL(  
	(SELECT P.ID_Detail FROM dbo.StockLst_Process P
	JOIN deleted ON deleted.ID_Detail = P.ID_Detail
	WHERE P.AllowSub = ''N''
	AND P.Process_ID = ''SELECTED''
	),0) > 0
begin
	PRINT '' Found Selected Broker Process that is dependant on the consumed stock.  [BrokerLst_Detail_Delete]''

	DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
	DECLARE @Body varchar(4000)

	SELECT ROW_NUMBER() OVER(ORDER BY ID_Detail_Process) AS RowID
	  ,P.ID_Detail_Process
	  ,P.ID_Detail
	  ,P.PO_item
	  ,P.SOitem
	  ,P.WO
	  ,P.Process_ID
		INTO #tmpBrokerLst_Process FROM dbo.BrokerLst_Process P
		JOIN deleted ON deleted.ID_Detail = P.ID_Detail
		WHERE P.AllowSub = ''N''
	--	AND P.Process_ID = ''SELECTED''
/*		AND NOT P.SOitem IN 
		(SELECT DISTINCT SOitem 
			FROM dbo.Ar_BrokerLst_Process_History
			WHERE ID_Detail_Process IN 
			(SELECT DISTINCT ID_Detail_Process 
				FROM dbo.BrokerLst_Process_Detail 
				WHERE Who = SUSER_SNAME() AND ( What = ''DELETE'' OR What = ''REMOVED'' OR What = ''CONSUMED'' )
			)
		) */
		ORDER BY ID_Detail_Process
	
	DECLARE @nTmpID_Detail_Process INT
	DECLARE @nTmpID_Detail INT
	DECLARE @cProcess_ID CHAR(10) = ''''
	DECLARE @NumberRecords int, @RowCount int
	DECLARE @SOitem CHAR(10)
	DECLARE @POitem CHAR(12)
	DECLARE @WO INT = 0
	--DECLARE @SOitem CHAR(10)
	-- Get the number of records in the temporary table
	SET @NumberRecords = @@ROWCOUNT
	SET @RowCount = 1
	
	-- loop through all records in the temporary table
	-- using the WHILE loop construct
	WHILE @RowCount <= @NumberRecords
	BEGIN
		SELECT @nTmpID_Detail_Process = ID_Detail_Process
			,@nTmpID_Detail = ID_Detail 
			,@POitem = PO_item
			,@SOitem = SOitem
			,@WO = ISNULL(WO,0)
			,@cProcess_ID = Process_ID
			FROM #tmpBrokerLst_Process
			WHERE RowID = @RowCount

		PRINT '' Send Salesman Warning Email that their selected Stock process was consumed.  [BrokerLst_Detail_Delete]''	

		IF ISNULL(@nTmpID_Detail_Process,0) > 0
			EXEC dbo.p_Warn_Stk_Deleted @nTmpID_Detail_Process, ''B'', @nTmpID_Detail, @SOitem, @WO

		IF ISNULL(@nTmpID_Detail,0) > 0
			begin

				Print ''Delete the Process that belonged to the Detail record being DELETED AND Process_ID = INCOMING.''

				DELETE FROM dbo.BrokerLst_Process 
					WHERE ID_Detail_Process IN 
					(SELECT P.ID_Detail_Process FROM dbo.BrokerLst_Process P
						INNER JOIN deleted ON deleted.ID_Detail = P.ID_Detail );

				/*DELETE FROM dbo.BrokerLst_Process 
					WHERE ID_Detail = @nTmpID_Detail 
					AND Process_ID = ''INCOMING'' */

				/*DELETE FROM dbo.BrokerLst_Process 
					WHERE ID_Detail = @nTmpID_Detail 
					AND Process_ID = ''Sell Stock''*/

			end

		
		SET @RowCount = @RowCount + 1
	END
	DROP TABLE #tmpBrokerLst_Process
end

---


PRINT ''remove @nID_Detail_Process = ''+CAST( @nID_Detail_Process AS CHAR(10))

---

--------------------------------------------

---
PRINT '' INSERT dbo.BrokerLst_Detail_History FROM deleted  [BrokerLst_Detail_Delete]''
INSERT dbo.Ar_BrokerLst_Detail_History 
	([ID_Detail_Process],
	[What],
	[When],
	[ProcessValue],
	[size_h],
	[size_l],
	[pc],
	[dim1],
	[dim2],
	[dim3],
	[length],
	[weight],
	[costvalue],
	[descript],
	[location],
	[floorstatus],
	[class],
	[unit],
	[randlen],
	[InvCheck],
	[id],
	[id_detail],
	[ReceivingID],
	[InvoiceValue],
	[Quarantine],
	[S_QTY],
	[S_P],
	[S_Total],
	[S_PU],
	[Prime])
SELECT TOP 1
	BPH.ID_Detail_Process,
	''DELETE'',
	GetDate(),
	-(d.S_QTY * d.S_P),
	d.[size_h],
	d.[size_l],
	d.[pc],
	d.[dim1],
	d.[dim2],
	d.[dim3],
	d.[length],
	d.[weight],
	d.[costvalue],
	d.[descript],
	d.[location],
	d.[floorstatus],
	d.[class],
	d.[unit],
	d.[randlen],
	d.[InvCheck],
	d.[id],
	d.[id_detail],
	d.[ReceivingID],
	d.[InvoiceValue],
	d.[Quarantine],
	d.[S_QTY],
	d.[S_P],
	d.[S_Total],
	d.[S_PU],
	d.[Prime]
 FROM deleted d
 	INNER JOIN dbo.Ar_BrokerLst_Process_History BPH ON BPH.ID_Detail = d.ID_Detail 
--	WHERE BPH.[WHAT] = ''DELETE''
	ORDER BY BPH.[When] DESC

---************************************************************************************

PRINT '' INSERT dbo.Ar_BrokerLst_Process_GS_History   [BrokerLst_Detail_Delete]''
INSERT dbo.Ar_BrokerLst_Process_GS_History 
	(What,
	[When],
	[SOitem],
	[comment],
	[process_id],
	[PWeight],
	[PPc],
	[id_detail],
	[id_detail_process],
	[Validated],
	[S_QTY],
	[S_P],
	[S_PU])
  SELECT ''DELETE'',
	GetDate(),
	BPH.SOitem,
	''BrokerLst_Detail Delete'',
	''GS DELETE'',
	BD.[Weight],
	BD.[Pc],
	bd.[id_detail],
	BPH.ID_Detail_Process,
	0,
	BD.[S_QTY],
	BD.[S_P],
	BD.[S_PU]
    FROM  dbo.BrokerLst_Process_Detail BPD 
	INNER JOIN dbo.Ar_BrokerLst_Process_History BPH 
		ON BPH.ID_Detail_Process = BPD.ID_Detail_Process 
	INNER JOIN BrokerLst_Detail BD 
		ON BD.ID_Detail = BPD.ID_Detail
	WHERE BPD.Who = SUSER_SNAME() AND ( BPD.What = ''DELETE'' OR BPD.What = ''REMOVED'' OR BPD.What = ''CONSUMED'' )

---

PRINT '' DELETE FROM dbo.BrokerLst_Process_Detail WHERE Who = SUSER_SNAME()   [BrokerLst_Detail_Delete]''

DELETE FROM dbo.BrokerLst_Process_Detail 
  WHERE Who = SUSER_SNAME()  AND 
  ( What = ''DELETE'' OR What = ''REMOVED'' OR What = ''CONSUMED'' )

PRINT ''Trigger  End  [BrokerLst_Detail_Delete]'';
' 
GO
ALTER TABLE [dbo].[BrokerLst_Detail] ENABLE TRIGGER [BrokerLst_Detail_Delete]
GO
/****** Object:  Trigger [dbo].[BrokerLst_Detail_Insert]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Detail_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[BrokerLst_Detail_Insert] 
ON [dbo].[BrokerLst_Detail] 
	FOR INSERT 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [BrokerLst_Detail_Insert]'';

-----------------------------------------------------

DECLARE @cProgram Char(60) = ''TRIGGER dbo.BrokerLst_Detail_Insert''
DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
DECLARE @Body varchar(4000)

IF EXISTS ( SELECT * FROM inserted 
			INNER JOIN dbo.PU ON inserted.S_PU = PU.PU 
			WHERE inserted.S_P > PU.Max_P )
BEGIN
	PRINT ''Found too high of a Unit Price (S_PU), check for $/Lb of 1000, $/FT of 5,000 and $/PC of 500,000''

	SELECT @Body = ''Cannot insert to dbo.BrokerLst_Detail, Found too high of a Unit Price.''+CHAR(13)
		+ RTRIM(PU.Unit) + '' is over the ''+CAST(PU.Max_P AS VARCHAR(25))+ '' max rule set in dbo.pU.'' + CHAR(13)
		+ ''ID= ''+CAST(ID AS CHAR(10))+'' ID_Detail= ''+CAST(ID_Detail AS CHAR(10))+'' PU=''+ CAST(S_PU AS CHAR(1)) +''  S_P=''+CAST(S_P AS VARCHAR(25))+CHAR(13)
		+''. ''+ISNULL([Length],'''') 
		FROM inserted
		INNER JOIN dbo.PU ON inserted.S_PU = PU.PU
			WHERE inserted.S_P > PU.Max_P
		

	SET @Body = @Body+RTRIM(suser_sname())+CHAR(13)
		+@@SERVERNAME+'' TRIGGER ERP_2.dbo.BrokerLst_Detial_Insert ''
			
	EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''vfpprogramming@ERP_1s.com'', 
		 @SubjectEmail = ''BAD Detail PU'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''
		 		
	SET @Body = ''Insert into dbo.BrokerLst_Detail table failed. S_PU above limit.''
	RAISERROR( @Body, 16, -1)

	ROLLBACK TRANSACTION


	INSERT INTO ERP_2.dbo.Errors ([nerror],[mess1],[cprogram],[nlineno],[errordate],[MACHINE],[Revision],[Memo1]) 
		SELECT 0,''Cannot insert to dbo.BrokerLst_Detail, Found too high of a Unit Price.''
			,@cProgram
			,0
			,GetDate()
			,Suser_Sname()
			,@cProgram
			,@Body
		FROM inserted 
		INNER JOIN dbo.PU ON inserted.S_PU = PU.PU
			WHERE inserted.S_P > PU.Max_P;

	
	RETURN

END


PRINT '' SELECT @nID_Detail_Process = ID_Detail_Process FROM dbo.BrokerLst_Process_Detail WHERE Who = SUSER_SNAME() AND What = ADD   [BrokerLst_Detail_Insert]''
DECLARE @nID_Detail_Process INT
SELECT TOP 1 @nID_Detail_Process = ID_Detail_Process 
  FROM dbo.BrokerLst_Process_Detail 
  WHERE Who = SUSER_SNAME() AND What = ''ADD''
PRINT @nID_Detail_Process

---

PRINT '' SELECT @SOitem = SOitem FROM dbo.BrokerLst_Process_History WHERE ID_Detail_Process = @nID_Detail_Process  [BrokerLst_Detail_Insert]''
DECLARE @SOitem CHAR(10)
SELECT TOP 1 @SOitem = SOitem 
   FROM dbo.Ar_BrokerLst_Process_History
   WHERE ID_Detail_Process = @nID_Detail_Process



   
--- Done After
--PRINT '' UPDATE dbo.StockLst_Master SET MWeight    [StockLst_Detail_Insert]''
--UPDATE dbo.StockLst_Master 
--	SET MWeight = dbo.f_GetMWeight_StockLst_ID(inserted.ID)
--	FROM dbo.StockLst_Master
--	INNER JOIN inserted ON Stocklst_Master.ID = inserted.ID


---
PRINT '' INSERT dbo.Ar_BrokerLst_Detail_History FROM inserted  [BrokerLst_Detail_Insert]''
INSERT dbo.Ar_BrokerLst_Detail_History 
	([ID_Detail_Process],
	[ProcessValue],
	[What],
	[size_h],
	[size_l],
	[pc],
	[dim1],
	[dim2],
	[dim3],
	[length],
	[weight],
	[costvalue],
	[descript],
	[location],
	[floorstatus],
	[class],
	[unit],
	[randlen],
	[InvCheck],
	[id],
	[id_detail],
	[ReceivingID],
	[InvoiceValue],
	[Quarantine],
	[S_QTY],
	[S_P],
	[S_Total],
	[S_PU],
	[Prime])
SELECT 	case when ISNULL(spd.ID_Detail_Process,0) > 0 then spd.ID_Detail_Process else @nID_Detail_Process end,
	(inserted.S_QTY * inserted.S_P),
	''ADD'',
	inserted.[size_h],
	inserted.[size_l],
	inserted.[pc],
	inserted.[dim1],
	inserted.[dim2],
	inserted.[dim3],
	inserted.[length],
	inserted.[weight],
	inserted.[costvalue],
	inserted.[descript],
	inserted.[location],
	inserted.[floorstatus],
	inserted.[class],
	inserted.[unit],
	inserted.[randlen],
	inserted.[InvCheck],
	inserted.[ID],
	inserted.[ID_Detail],
	inserted.[ReceivingID],
	inserted.[InvoiceValue],
	inserted.[Quarantine],
	inserted.[S_QTY],
	inserted.[S_P],
	inserted.[S_Total],
	inserted.[S_PU],
	inserted.[Prime]
 FROM inserted
 LEFT OUTER JOIN dbo.BrokerLst_Process_Detail spd ON inserted.ID = spd.ID 
		AND spd.Who = SUSER_SNAME() AND spd.What = ''ADD''

---
PRINT '' INSERT dbo.Ar_BrokerLst_Process_GS_History   [BrokerLst_Detail_Insert]''
INSERT dbo.Ar_BrokerLst_Process_GS_History 
	(What,
	[SOitem],
	[comment],
	[process_id],
	[PWeight],
	[PPc],
	[id_detail],
	[id_detail_process],
	[Validated],
	[S_QTY],
	[S_P],
	[S_PU])
  SELECT ''INSERT'',
    @SOitem,
	''BrokerLst_Detail Insert'',
	''GS INSERT'',
	i.[Weight],
	i.[Pc],
	i.[id_detail],
	case when ISNULL(spd.ID_Detail_Process,0) > 0 then spd.ID_Detail_Process else @nID_Detail_Process end,
	0,
	i.[S_QTY],
	i.[S_P],
	i.[S_PU]
    FROM inserted i
	LEFT OUTER JOIN dbo.BrokerLst_Process_Detail spd ON i.ID = spd.ID 
		AND spd.Who = SUSER_SNAME() AND spd.What = ''ADD''

---
PRINT '' DELETE FROM dbo.BrokerLst_Process_Detail WHERE Who = SUSER_SNAME() AND What = ADD  [BrokerLst_Detail_Insert]''
DELETE FROM dbo.BrokerLst_Process_Detail 
  WHERE Who = SUSER_SNAME() AND What = ''ADD''

PRINT ''Trigger  End  [BrokerLst_Detail_Insert]'';
' 
GO
ALTER TABLE [dbo].[BrokerLst_Detail] ENABLE TRIGGER [BrokerLst_Detail_Insert]
GO
/****** Object:  Trigger [dbo].[BrokerLst_Detail_Update]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Detail_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[BrokerLst_Detail_Update] ON [dbo].[BrokerLst_Detail] 
	FOR UPDATE 
	NOT FOR REPLICATION
AS

--DECLARE @SOitem CHAR(10)
--DECLARE @POitem CHAR(12)
--DECLARE @nID_Detail_Process INT

PRINT ''Trigger Start [BrokerLst_Detail_Update]'';
DECLARE @cProgram Char(60) = ''TRIGGER dbo.BrokerLst_Detail_Update''

DECLARE @Count int
SET @Count = @@ROWCOUNT;
        
IF @Count > 100
BEGIN
    RAISERROR(''Cannot UPDATE more than 100 records of Lst_Detail at one time.'',16,1) 
    ROLLBACK TRANSACTION
    RETURN;
END

------------------
DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
DECLARE @Body varchar(4000) = ''''
DECLARE @msg VARCHAR(250);
DECLARE @query varchar(2048);
DECLARE @cProfile_Name VarChar(50);

------------------------
-- 2 levels of bad S_P
-- IF over set limit in dbo.PU then STOP, Error the update!

IF EXISTS ( SELECT * FROM inserted 
			INNER JOIN dbo.PU ON inserted.S_PU = PU.PU 
			WHERE inserted.S_P > PU.Max_P )
BEGIN
	PRINT ''Found too high of a Unit Price (S_P), check for $/Lb of 1000, $/FT of 5,000 and $/PC of 500,000''

	SELECT @Body = ''Cannot Update into dbo.BrokerLst_Detail, Found too high of a Price.''+CHAR(13)
		+ ''P ''+RTRIM(CAST(S_P AS VARCHAR(25)))+ '' is over the ''+RTRIM(CAST(PU.Max_P AS VARCHAR(25)))+ '' max rule set in dbo.pU.'' + CHAR(13)
		+ ''ID= ''+CAST(ID AS CHAR(10))+'' ID_Detail= ''+CAST(ID_Detail AS CHAR(10))+'' PU=''+ CAST(S_PU AS CHAR(1)) +''  S_P=''+CAST(S_P AS VARCHAR(25))+CHAR(13)
		+''. ''+ISNULL([Length],'''') 
		FROM inserted
		INNER JOIN dbo.PU ON inserted.S_PU = PU.PU
			WHERE inserted.S_P > PU.Max_P

	SET @Body = @Body+CHAR(13)+RTRIM(suser_sname())+CHAR(13)
		+@@SERVERNAME+'' TRIGGER ERP_2.dbo.BrokerLst_Detail_Update ''
			
	EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
		 @SubjectEmail = ''BAD Detail Price'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''

	----------

	INSERT INTO ERP_2.dbo.Errors ([nerror],[mess1],[cprogram],[nlineno],[errordate],[MACHINE],[Revision],[Memo1]) 
		SELECT 0,''Cannot Update to dbo.BrokerLst_Detail, Found too high of a Per Unit Price.''
			,@cProgram
			,0
			,GetDate()
			,Suser_Sname()
			,@cProgram
			,@Body
		FROM inserted 
		INNER JOIN dbo.PU ON inserted.S_PU = PU.PU
			WHERE inserted.S_P > PU.Max_P

	RAISERROR( ''UPDATE into dbo.BrokerLst_Detail table failed. S_P above limit.'', 16, -1)
	ROLLBACK TRANSACTION


	PRINT ''Trigger  End  [BrokerLst_Detail_Update]'';
	RETURN

END


---------------------------------
-- IF S_Total is over million 1,000,000 then Update and send email alert

SET @Body = ''''
PRINT ''Trigger middle [StockLst_Detail_Update]''
	
SELECT @Body = ''S_Total price over $1,000,000 on Update''
	+CHAR(13)+''ID_Detail ''+CAST(inserted.ID_Detail AS VARCHAR(10))
	+CHAR(13)+''S_P is ''+CAST(inserted.S_P AS VARCHAR(10))
	+CHAR(13)+''S_QTY is ''+CAST(inserted.S_QTY AS VARCHAR(10))
	+CHAR(13)+''S_Total is ''+CAST(inserted.S_Total AS VARCHAR(20))
	+CHAR(13)+''S_PU is ''+CAST(inserted.S_PU AS VARCHAR(1))
	+CHAR(13)+''This does not stop the update.''
	+CHAR(13)+RTRIM(suser_sname())
	+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.StockLst_Detail_Update ''
	+CHAR(13)+CAST( GetDate() AS VarChar(50) )
	FROM inserted
	WHERE ISNULL(inserted.S_Total,0) > 1000000 
		
IF LEN(@Body) > 0
	begin	
	EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
		 @SubjectEmail = ''Problem S_Total'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''

	----------
	----------
	end

---------------------------------


/*IF ( UPDATE(PC) 
	or UPDATE(Size_H) 
	or UPDATE(Dim1) or UPDATE(Size_L) 
	or UPDATE(Dim2) or UPDATE(Dim3) 
	or UPDATE(Weight) or UPDATE(Descript) 
	or UPDATE(Length) or UPDATE(CostValue) 
	or UPDATE(Unit) or UPDATE(Quarantine) 
	or UPDATE(S_QTY) or UPDATE(S_P) or UPDATE(S_Total)
	)
begin

	SELECT @nID_Detail_Process = ID_Detail_Process 
	  FROM dbo.BrokerLst_Process_Detail 
	  WHERE Who = SUSER_SNAME() AND What = ''EDIT''

	PRINT '' nID_Detail_Process = ''+CAST(@nID_Detail_Process AS CHAR(10))+''    [BrokerLst_Detail_Update]''
	
	---

	PRINT '' DELETE FROM dbo.BrokerLst_Process_Detail WHERE Who = ''+SUSER_SNAME()+'' AND What = EDIT   [BrokerLst_Detail_Update]''
	DELETE FROM dbo.BrokerLst_Process_Detail WHERE Who = SUSER_SNAME() AND What = ''EDIT''
	
	----
	IF EXISTS( SELECT * FROM inserted,deleted 
		WHERE inserted.ID = deleted.ID
			AND inserted.ID_Detail = deleted.ID_Detail
			AND inserted.ReceivingID=0 
			AND ISNULL(deleted.ReceivingID,0)>0 )
	begin
		--Lost Receiving ID
		DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
		DECLARE @Body varchar(4000)
		DECLARE @ReceivingID INT
		DECLARE @ID INT
		DECLARE @ID_Detail INT
		
		SELECT TOP 1 @ReceivingID = deleted.ReceivingID
			,@ID = deleted.ID
			,@ID_Detail = deleted.ID_Detail
			FROM inserted,deleted 
			WHERE inserted.ID = deleted.ID
				AND inserted.ID_Detail = deleted.ID_Detail
				AND inserted.ReceivingID=0 
				AND ISNULL(deleted.ReceivingID,0)>0 
	
		PRINT '' Send a -Removed ReceivingID- Email   [BrokerLst_Detail_Update]''
	
		SET @Body = RTRIM(SUSER_SNAME())+'' updated the StockLst and that removed the ReceivingID: ''+CAST(@ReceivingID AS CHAR(10))+'' ''
			+CHAR(13)+''for StockLst ID: ''+CAST(@ID AS CHAR(10)) +''''
			+CHAR(13)+'', ID_Detail: ''+RTRIM(CAST(@ID_Detail AS CHAR(10))) +''.''
			+CHAR(10)+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.StockLst_Detail_After_Update ''
			
		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = ''Admin.Alerts@ERP_1s.com'', 
			 @SubjectEmail = ''StockLst update removed the ReceivingID'',
			 @BodyEmail = @Body,
			 @BodyType = ''TEXT''

	end
end
*/

PRINT ''Trigger  End  [BrokerLst_Detail_Update]'';
' 
GO
ALTER TABLE [dbo].[BrokerLst_Detail] ENABLE TRIGGER [BrokerLst_Detail_Update]
GO
/****** Object:  Trigger [dbo].[BrokerLst_Master_After_Insert]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Master_After_Insert]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.BrokerLst_Master_Insert    Script Date: 10/14/2004 10:01:01 AM ******/
CREATE TRIGGER [dbo].[BrokerLst_Master_After_Insert] ON [dbo].[BrokerLst_Master] 
AFTER INSERT 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [BrokerLst_Master_After_Insert]'';

INSERT dbo.Ar_BrokerLst_Master_History 
	([WHO],[WHAT],[WHEN],
	[alloy],
	[form],
	[cc],
	[CL],
	[size],
	[cond],
	[mweight],
	[specs],
	[heat],
	[lot],
	[Paid],
	[po_item],
	[poduedate],
	[mill],
	[stkdate],
	[history],
	[num],
	[PoStatus],
	[BrandName],
	[MillTrace],
	[FROM_ID],
	[Melt],
	[id],
	[mS_QTY],
	[WO_Detail],
	[ProjID])
SELECT suser_sname(),''ADD'',GetDate(),
	[alloy],
	[form],
	[cc],
	[CL],
	[size],
	[cond],
	[mweight],
	[specs],
	[heat],
	[lot],
	[Paid],
	[po_item],
	[poduedate],
	[mill],
	[stkdate],
	[history],
	[num],
	[PoStatus],
	[BrandName],
	[MillTrace],
	[FROM_ID],
	[Melt],
	[id],
	[mS_QTY],
	[WO_Detail],
	[ProjID]
 FROM inserted

 ---------------------------------------------
INSERT dbo.BrokerLst_Master_Inserted
	( Master_ID, [Who], [When]  )
SELECT ID, suser_sname(), GetDate() FROM inserted


 PRINT ''Trigger  End  [BrokerLst_Master_After_Insert]'';
' 
GO
ALTER TABLE [dbo].[BrokerLst_Master] ENABLE TRIGGER [BrokerLst_Master_After_Insert]
GO
/****** Object:  Trigger [dbo].[BrokerLst_Master_After_Update]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Master_After_Update]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.BrokerLst_Master_Update    Script Date: 10/14/2004 10:01:01 AM ******/
/****** Object:  Trigger dbo.BrokerLst_Master_Update    Script Date: 7/1/2004 1:57:08 PM ******/



CREATE TRIGGER [dbo].[BrokerLst_Master_After_Update] ON [dbo].[BrokerLst_Master] 
	AFTER UPDATE 
	NOT FOR REPLICATION

AS

PRINT ''Trigger Start [BrokerLst_Master_After_Update]'';

IF UPDATE(alloy)
 OR UPDATE(form)
 OR UPDATE(cc)
 OR UPDATE(CL)
 OR UPDATE(size)
 OR UPDATE(cond)
 OR UPDATE(specs) 
 OR UPDATE(heat)
 OR UPDATE(lot)
 OR UPDATE(Paid)
 OR UPDATE(mill)
 OR UPDATE(stkdate)
 OR UPDATE(history)

begin

 INSERT dbo.Ar_BrokerLst_Master_History 
	([WHO],[WHAT],[WHEN],
	[alloy],
	[form],
	[cc],
	[CL],
	[size],
	[cond],
	[mweight],
	[specs],
	[heat],
	[lot],
	[Paid],
	[po_item],
	[poduedate],
	[mill],
	[stkdate],
	[history],
	[num],
	[PoStatus],
	[BrandName],[MillTrace],
	[FROM_ID],
	[Melt],
	[id],
	[mS_QTY],
	[WO_Detail],
	[ProjID])
SELECT 	suser_sname(),''BEFOREEDIT'',GetDate(),
	[alloy],
	[form],
	[cc],
	[CL],
	[size],
	[cond],
	[mweight],
	[specs],
	[heat],
	[lot],
	[Paid],
	[po_item],
	[poduedate],
	[mill],
	[stkdate],
	[history],
	[num],
	[PoStatus],
	[BrandName],[MillTrace],
	[FROM_ID],
	[Melt],
	[id],
	[mS_QTY],
	[WO_Detail],
	[ProjID]
 FROM Deleted

INSERT dbo.Ar_BrokerLst_Master_History 
	([WHO],[WHAT],[WHEN],
	[alloy],
	[form],
	[cc],
	[CL],
	[size],
	[cond],
	[mweight],
	[specs],
	[heat],
	[lot],
	[Paid],
	[po_item],
	[poduedate],
	[mill],
	[stkdate],
	[history],
	[num],
	[PoStatus],
	[BrandName],[MillTrace],
	[FROM_ID],
	[Melt],
	[id],
	[mS_QTY],
	[WO_Detail],
	[ProjID])
SELECT 	suser_sname(),''AFTER EDIT'',GetDate(),
	[alloy],
	[form],
	[cc],
	[CL],
	[size],
	[cond],
	[mweight],
	[specs],
	[heat],
	[lot],
	[Paid],
	[po_item],
	[poduedate],
	[mill],
	[stkdate],
	[history],
	[num],
	[PoStatus],
	[BrandName],[MillTrace],
	[FROM_ID],
	[Melt],
	[id],
	[mS_QTY],
	[WO_Detail],
	[ProjID]
 FROM inserted

end

PRINT ''Trigger  End  [BrokerLst_Master_After_Update]'';
' 
GO
ALTER TABLE [dbo].[BrokerLst_Master] ENABLE TRIGGER [BrokerLst_Master_After_Update]
GO
/****** Object:  Trigger [dbo].[BrokerLst_Master_Delete]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Master_Delete]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.BrokerLst_Master_Delete    Script Date: 10/14/2004 10:01:01 AM ******/
/****** Object:  Trigger dbo.BrokerLst_Master_Delete    Script Date: 7/1/2004 1:57:08 PM ******/


CREATE TRIGGER [dbo].[BrokerLst_Master_Delete] ON [dbo].[BrokerLst_Master] 
	FOR DELETE 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [BrokerLst_Master_Delete]'';

---big deletes are in error
DECLARE @Count int
SET @Count = @@ROWCOUNT;
    
IF @Count > 100
BEGIN
    RAISERROR(''Cannot DELETE more than 100 records of Lst_Master at one time. Trigger BrokerLst_Master_Delete'',16,1) 
    ROLLBACK TRANSACTION
    RETURN;
END

-------------------------------------------
INSERT dbo.Ar_BrokerLst_Master_History 
	([WHO],[WHAT],[WHEN],
	[alloy],
	[form],
	[cc],
	[CL],
	[size],
	[cond],
	[mweight],
	[specs],
	[heat],
	[lot],
	[Paid],
	[po_item],
	[poduedate],
	[mill],
	[stkdate],
	[history],
	[num],
	[PoStatus],
	[BrandName],[MillTrace],
	[FROM_ID],
	[Melt],
	[id],
	[mS_QTY],
	[ProjID])
SELECT 	suser_sname(),''DELETE'',GetDate(),
	[alloy],
	[form],
	[cc],
	[CL],
	[size],
	[cond],
	[mweight],
	[specs],
	[heat],
	[lot],
	[Paid],
	[po_item],
	[poduedate],
	[mill],
	[stkdate],
	[history],
	[num],
	[PoStatus],
	[BrandName],[MillTrace],
	[FROM_ID],
	[Melt],
	[id],
	[mS_QTY],
	[ProjID]
 FROM Deleted

PRINT ''Trigger  End  [BrokerLst_Master_Delete]'';
' 
GO
ALTER TABLE [dbo].[BrokerLst_Master] ENABLE TRIGGER [BrokerLst_Master_Delete]
GO
/****** Object:  Trigger [dbo].[BrokerLst_Master_Insert]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Master_Insert]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.BrokerLst_Master_Insert    Script Date: 10/14/2004 10:01:01 AM ******/
CREATE TRIGGER [dbo].[BrokerLst_Master_Insert] ON [dbo].[BrokerLst_Master] 
	FOR INSERT 
	NOT FOR REPLICATION
AS

/*  Could be POitem or WO_Detail
PRINT ''Trigger Start [BrokerLst_Master_Insert]'';
DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
DECLARE @Body varchar(4000)
DECLARE @WO_Detail INT = 0

IF EXISTS ( SELECT * FROM inserted WHERE 
		NOT ( SUBSTRING(PO_item,10,1) = ''-'' 
		AND ISNULL(WO_Detail,0) = 0)  )
	BEGIN
	
	DECLARE @badPOitem CHAR(12) = ''''
	
	SELECT @Body = ''Cannot insert to dbo.BrokerLst_Master, POitem is not Proper and WO_Detail is 0,''+CHAR(13)
		
	SELECT TOP 1 @BadPOitem = PO_item FROM inserted 
		WHERE LEN(PO_Item)=0 AND ISNULL(WO_Detail,0) = 0

	SET @Body = @Body+'' PO item:''+@badPOitem +''.''+CHAR(13)
		+''WO_Detail:0.''+CHAR(13)
		+RTRIM(suser_sname())+CHAR(13)
		+@@SERVERNAME+'' TRIGGER ERP_2.dbo.BrokerLst_Master_Insert ''
			
	EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''vfpprogramming@ERP_1s.com'', 
		 @SubjectEmail = ''Check BrokerLst_Master Insert -BAD POitem and WO_Detail'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''
		 		
	SET @Body = ''Insert into dbo.BrokerLst_Master table failed. POitem:''+@badPOitem+'' not Proper.''
	RAISERROR( @Body, 16, -1)

END


IF EXISTS ( SELECT * FROM inserted WHERE 
			LEN(PO_Item)=0 AND ISNULL(WO_Detail,0) = 0) 
	BEGIN
	DECLARE @badID INT
		
	SELECT @Body = ''Tried to Insert into dbo.BrokerLst_Master with empty PO and WO_Detail and WO_Detail is 0.''+CHAR(13)
		
	SELECT TOP 1 @badID = ID FROM inserted WHERE 
		NOT ( LEN(PO_Item)=0 AND ISNULL(WO_Detail,0) = 0) 

	SET @Body = @Body+'' BrokerLst_Master ID=''+CAST(@badID AS CHAR(10))+''.''
			+''WO_Detail:0.''+CHAR(13)
			+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.BrokerLst_Master_Insert ''
			
	EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''vfpprogramming@ERP_1s.com'', 
		 @SubjectEmail = ''Check BrokerLst_Master Insert -BAD POitem and WO_Detail'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''
		 		
	RAISERROR( @Body, 16, -1)

	END
*/

 PRINT ''Trigger  End  [BrokerLst_Master_Insert]'';
' 
GO
ALTER TABLE [dbo].[BrokerLst_Master] ENABLE TRIGGER [BrokerLst_Master_Insert]
GO
/****** Object:  Trigger [dbo].[BrokerLst_Master_Update]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Master_Update]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.BrokerLst_Master_Update    Script Date: 10/14/2004 10:01:01 AM ******/
/****** Object:  Trigger dbo.BrokerLst_Master_Update    Script Date: 7/1/2004 1:57:08 PM ******/



CREATE  TRIGGER [dbo].[BrokerLst_Master_Update] ON [dbo].[BrokerLst_Master] 
	FOR UPDATE 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [BrokerLst_Master_Update]'';

    
---big UPDATES are in error
DECLARE @Count int
SET @Count = @@ROWCOUNT;
   
IF @Count > 1000
BEGIN
	RAISERROR(''Cannot UPDATE more than 1000 records of dbo.Sales_No at one time. trigger Sales_No_Update'',16,1) 
	ROLLBACK TRANSACTION
	RETURN;
END
----------------------

IF EXISTS ( SELECT * FROM inserted WHERE 
						NOT SUBSTRING( dbo.f_ProperPOitem( PO_item ),10,1) = ''-'' 
						AND ISNULL(WO_Detail,0) = 0)  
	BEGIN

	DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
	DECLARE @Body varchar(4000)
	DECLARE @badPOitem CHAR(12) = ''''
	DECLARE @ID INT
	DECLARE @WO_Detail INT = 0
	
	SELECT @Body = ''Cannot update dbo.BrokerLst_Master, POitem is not Proper and WO_Detail = 0,''
		+CHAR(13)
	
	SELECT TOP 1 @badPOitem = PO_item, @ID=ID
		FROM inserted WHERE NOT ( SUBSTRING(PO_item,10,1) = ''-'' 
		AND ISNULL(WO_Detail,0) = 0) 
	
	SET @Body = @Body+'' PO item:''+@badPOitem +''.''
		+'' WO_Detil = 0.''+CHAR(13)
		+CHAR(13)+''BrokerLst_Master ID:''+CAST(@ID AS CHAR(10))
		+CHAR(13)+(suser_sname())
		+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.BrokerLst_Master_Update ''
		
	EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''Admin.Alerts@ERP_1s.com'', 
		 @SubjectEmail = ''BAD POitem and WO_Detail=0'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''
					
	SET @Body = ''Update dbo.BrokerLst_Master_Update table failed. POitem:''
		+@badPOitem+'' not Proper and WO_Detail = 0.''

	RAISERROR( @Body, 16, -1)

	PRINT ''Update dbo.BrokerLst_Master_Update table failed. POitem:''
		+@badPOitem+'' not Proper and WO_Detail=0. [WIPLst_Master_Update]''

END


PRINT ''Trigger  End  [BrokerLst_Master_Update]'';
' 
GO
ALTER TABLE [dbo].[BrokerLst_Master] ENABLE TRIGGER [BrokerLst_Master_Update]
GO
/****** Object:  Trigger [dbo].[BrokerLst_Process_After_Delete]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Process_After_Delete]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.StockLst_Process_Delete    Script Date: 11/30/2005 3:54:44 PM ******/
CREATE TRIGGER [dbo].[BrokerLst_Process_After_Delete]
ON [dbo].[BrokerLst_Process] 
  AFTER DELETE 
  NOT FOR REPLICATION
AS

PRINT ''Trigger Start [BrokerLst_Process_After_Delete]'';
IF EXISTS( SELECT * from deleted WHERE LEN(LTRIM(deleted.SOitem)) > 7 )
	begin
	
	PRINT '' SOitem Deleted from BrokerLst_Process''
	
	INSERT dbo.NR_UserTrack 
		([mess1],[cprogram])
		SELECT ''SOitem:''+soitem+'' BrokerLst Process was Deleted'' AS Mess1
		, ''BrokerLst_Process_Delete trigger'' AS cProgram
		FROM deleted 
		WHERE LEN(LTRIM(SOitem)) > 7
	end
	
PRINT ''Trigger  End  [BrokerLst_Process_After_Delete]'';
' 
GO
ALTER TABLE [dbo].[BrokerLst_Process] ENABLE TRIGGER [BrokerLst_Process_After_Delete]
GO
/****** Object:  Trigger [dbo].[BrokerLst_Process_After_Insert]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Process_After_Insert]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.BrokerLst_Process_Insert    Script Date: 11/30/2005 4:02:11 PM ******/
CREATE TRIGGER [dbo].[BrokerLst_Process_After_Insert] ON [dbo].[BrokerLst_Process] 
  AFTER INSERT 
  NOT FOR REPLICATION
AS


PRINT ''Trigger Start [BrokerLst_Process_After_Insert]'';
--Run clean up Process- These Process_ID are designed to be scavanged

IF EXISTS(SELECT * FROM inserted WHERE 
  (inserted.[process_id] = ''RECEIVED'' 
  or inserted.[process_id] = ''Sell Stock''   
  or inserted.[process_id] = ''Shipped'' 
  or inserted.[process_id] = ''Receiving'' 
  or inserted.[process_id] = ''CORRECTION''
  or inserted.[process_id] = ''CANCELLED'')
  and inserted.[id_detail_process] > 0 ) 
	begin
	
	PRINT ''After Insert, some [Process_ID] types will be triggered for Delete''
	PRINT ''Deleting from BrokerLst_Process WHERE Process_ID is: RECEIVED, Sell Stock, Shipped, Receiving or Correction.''
	
	DELETE FROM dbo.BrokerLst_Process WHERE BrokerLst_Process.[id_detail_process] IN 
		( SELECT [id_detail_process] FROM inserted WHERE 
			( inserted.[process_id] = ''RECEIVED''   
			or inserted.[process_id] = ''Sell Stock'' 
			or inserted.[process_id] = ''Shipped'' 
			or inserted.[process_id] = ''Receiving''
			or inserted.[process_id] = ''CORRECTION''
			or inserted.[process_id] = ''CANCELLED'' )
			  and inserted.[id_detail_process] > 0  )
			  
	end

PRINT ''Trigger  End  [BrokerLst_Process_After_Insert]'';
' 
GO
ALTER TABLE [dbo].[BrokerLst_Process] ENABLE TRIGGER [BrokerLst_Process_After_Insert]
GO
/****** Object:  Trigger [dbo].[BrokerLst_Process_After_Update]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Process_After_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[BrokerLst_Process_After_Update] 
  ON [dbo].[BrokerLst_Process] 
  AFTER UPDATE 
  NOT FOR REPLICATION
AS


PRINT ''Trigger Start [BrokerLst_Process_After_Update]'';

DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
DECLARE @Body varchar(4000)

--Send Email alert
IF EXISTS(SELECT * FROM inserted WHERE inserted.[Process_ID] = ''Shipped'') 
	BEGIN
	PRINT ''Send Email as -Broker marked as Shipped, but still on BrokerLst''
	
	SELECT TOP 1 @Body = ''SO-Item:''+inserted.SOitem
		+''"''+dbo.f_Reportlink_CHAR(''SOitem'',inserted.SOitem)+''"''
		+'' was marked as SHIPPED on BrokerLst_Process:''
		+RTRIM(CAST(inserted.id_detail_process AS CHAR))
		+CHAR(13)+'' on ''+RTRIM(CAST(GETDATE()AS CHAR))
		+CHAR(13)+'', but still listed on BrokerLst''  
		+CHAR(13)+''Entered by ''+RTRIM(suser_sname())	+'' on ''+RTRIM(GETDATE())
		+CHAR(10)+CHAR(13)
		FROM inserted
		WHERE inserted.[Process_ID] = ''Shipped'';

		SET @Body = @Body +ISNULL(@@SERVERNAME,''SRVR '')+'' TRIGGER ERP_2.dbo.StockLst_Process_After_Update '';
		
		EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''vfpprogramming@ERP_1s.com'', 
		 @SubjectEmail = ''Material marked as Shipped, but still on BrokerLst'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT'';
		 
		 SET @Body = ''Metal marked as Shipped, but still on BrokerLst.''+CHAR(10)+CHAR(13)+@Body;
		 
		INSERT INTO dbo.NR_UserTrack ([mess1],[cprogram]) VALUES ( LEFT(@Body,1024),''TRIGGER ERP_2.dbo.StockLst_Process_After_Update Alert'')
	END

--********	

--Delete ENDING process''
IF EXISTS(SELECT * FROM inserted WHERE 
	  (inserted.[Process_ID] = ''RECEIVED'' 
	or inserted.[Process_ID] = ''Sell Stock'' 
	or inserted.[Process_ID] = ''Shipped''
	or inserted.[Process_ID] = ''Receiving''
	or inserted.[Process_ID] = ''CORRECTION''
	or inserted.[Process_ID] = ''CANCELLED'' )
	and inserted.[ID_Detail_Process] > 0 )
	begin
	
	INSERT INTO dbo.NR_UserTrack ([mess1],[cprogram]) 
		SELECT LEFT(''SO-Item:''+inserted.SOitem+'' deleted from BrokerLst_Process WHERE Process_ID is:''
			+CHAR(13)+inserted.Process_ID
			+CHAR(13)+''Entered by ''+RTRIM(suser_sname()) +'' on ''+RTRIM(GETDATE())
			+CHAR(10)+CHAR(13)+ISNULL(@@SERVERNAME,''SRVR '')+'' TRIGGER ERP_2.dbo.BrokerLst_Process_After_Update ''
			+CHAR(10)+CHAR(13)+''Deleting from BrokerLst_Process WHERE Process_ID is: RECEIVED, Sell Stock, Shipped, Receiving, Correction or Cancelled.'',1024)
		,LEFT(''TRIGGER ERP_2.dbo.BrokerLst_Process_After_Update Delete'',100) 
		FROM inserted
			WHERE (inserted.[Process_ID] =''RECEIVED'' 
			or inserted.[Process_ID] = ''Sell Stock''   
			or inserted.[Process_ID] = ''Shipped'' 
			or inserted.[Process_ID] = ''Receiving'' 
			or inserted.[Process_ID] = ''CORRECTION''
			or inserted.[Process_ID] = ''CANCELLED'')
			and inserted.[ID_Detail_Process] > 0

	PRINT '' Deleting from BrokerLst_Process WHERE Process_ID is: RECEIVED, Sell Stock, Shipped, Receiving, Correction or Cancelled.'';

	DELETE FROM dbo.BrokerLst_Process WHERE BrokerLst_Process.ID_Detail_Process IN
		( SELECT [ID_Detail_Process] FROM inserted  WHERE 
			(  inserted.[Process_ID] = ''RECEIVED'' 
			or inserted.[Process_ID] = ''Sell Stock'' 
			or inserted.[Process_ID] = ''Shipped'' 
			or inserted.[Process_ID] = ''Receiving''
			or inserted.[Process_ID] = ''CORRECTION''
			or inserted.[Process_ID] = ''CANCELLED'' )
			and inserted.[ID_Detail_Process] > 0 )
	end

PRINT ''Trigger  End  [BrokerLst_Process_After_Update]'';
' 
GO
ALTER TABLE [dbo].[BrokerLst_Process] ENABLE TRIGGER [BrokerLst_Process_After_Update]
GO
/****** Object:  Trigger [dbo].[BrokerLst_Process_Delete]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Process_Delete]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.StockLst_Process_Delete    Script Date: 11/30/2005 3:54:44 PM ******/
CREATE TRIGGER [dbo].[BrokerLst_Process_Delete]
ON [dbo].[BrokerLst_Process] 
  FOR DELETE 
  NOT FOR REPLICATION
AS


---big deletes are in error
DECLARE @Count int
SET @Count = @@ROWCOUNT;
        
IF @Count > 100
BEGIN
    RAISERROR(''Cannot DELETE more than 100 records of Lst_Process at one time.'',16,1) 
    ROLLBACK TRANSACTION
    RETURN;
END

PRINT ''Trigger Begin [BrokerLst_Process_Delete]'';

PRINT ''Record to dbo.NR_UserTrack''

IF EXISTS( SELECT * from deleted WHERE LEN(LTRIM(deleted.SOitem)) > 7 AND NOT dbo.f_ProperSOitem(deleted.SOitem)=dbo.f_ProperSOitem('''') )
	begin
	
	INSERT dbo.NR_UserTrack 
	   ([mess1],[cprogram],[errordate],[machine])
		SELECT LEFT(''SOitem:''+deleted.soitem
			+'', BrokerLst ID_Detail_Process:''+CAST(deleted.ID_Detail_Process AS VARCHAR(10))+'' was Deleted,''
			+'', ID_Detail:''+CAST(deleted.ID_Detail AS VARCHAR(10))
			+'', Process_ID:''+deleted.Process_ID
			+'', ReceivingID:''+CAST(ReceivingID AS VARCHAR(10)),1024) AS Mess1
		, ''BrokerLst_Process_Delete trigger'' AS cProgram
		, GETDATE() AS ErrorDate
		, LEFT((suser_sname()),40) AS Machine
		FROM deleted 
		WHERE LEN(LTRIM(SOitem)) > 7
		AND NOT dbo.f_ProperSOitem(deleted.SOitem)=dbo.f_ProperSOitem('''')

	PRINT '' SOitem Deleted from BrokerLst_Process''

	end

IF EXISTS( SELECT * from deleted WHERE LEN(LTRIM(deleted.PO_item)) > 9 AND NOT dbo.f_ProperPOitem(deleted.PO_item)=dbo.f_ProperPOitem('''') )
	begin
	INSERT dbo.NR_UserTrack 
	   ([mess1],[cprogram],[errordate],[machine])
		SELECT LEFT( ''POitem:''+deleted.PO_item+'' had selected stock that was deleted.''
			+'', StockLst ID_Detail_Process:''+CAST(deleted.ID_Detail_Process AS VARCHAR(10))+'' was Deleted,''
			+'', ID_Detail:''+CAST(deleted.ID_Detail AS VARCHAR(10))
			+'', Process_ID:''+deleted.Process_ID
			+'', ReceivingID:''+CAST(ReceivingID AS VARCHAR(10)), 1024) AS Mess1
		, ''BrokerLst_Process_Delete trigger'' AS cProgram
		, GETDATE() AS ErrorDate
		, LEFT((suser_sname()),40) AS Machine
		FROM deleted 
		WHERE LEN(LTRIM(deleted.PO_item)) > 9
		AND NOT dbo.f_ProperPOitem(deleted.SOitem)=dbo.f_ProperPOitem('''')

	PRINT '' POitem Deleted from StockLst_Process''
	end

IF EXISTS( SELECT * from deleted WHERE ISNULL(deleted.WO,0)>0 )
	begin
	INSERT dbo.NR_UserTrack 
	   ([mess1],[cprogram],[errordate],[machine])
		SELECT LEFT(''WO:''+CAST(deleted.WO AS VARCHAR(10))
			+'', BrokerLst ID_Detail_Process:''+CAST(deleted.ID_Detail_Process AS VARCHAR(10))+'' was Deleted,''
			+'', ID_Detail:''+CAST(deleted.ID_Detail AS VARCHAR(10))
			+'', Process_ID:''+deleted.Process_ID
			+'', ReceivingID:''+CAST(ReceivingID AS VARCHAR(10)) ,1024) AS Mess1
		, ''BrokerLst_Process_Delete trigger'' AS cProgram
		, GETDATE() AS ErrorDate
		, LEFT((suser_sname()),40) AS Machine
		FROM deleted 
		WHERE ISNULL(deleted.WO,0)>0
	PRINT '' WO Deleted from BrokerLst_Process''

	end

IF EXISTS( SELECT * from deleted WHERE ISNULL(deleted.WO_Detail,0)>0 )
	begin
	INSERT dbo.NR_UserTrack 
	   ([mess1],[cprogram],[errordate],[machine])
		SELECT LEFT(''WO_Detail:''+CAST(deleted.WO_Detail AS VARCHAR(10))
			+'', BrokerLst ID_Detail_Process:''+CAST(deleted.ID_Detail_Process AS VARCHAR(10))+'' was Deleted,''
			+'', ID_Detail:''+CAST(deleted.ID_Detail AS VARCHAR(10))
			+'', Process_ID:''+deleted.Process_ID
			+'', ReceivingID:''+CAST(ReceivingID AS VARCHAR(10)),1024) AS Mess1
		, ''BrokerLst_Process_Delete trigger'' AS cProgram
		, GETDATE() AS ErrorDate
		, LEFT((suser_sname()),40) AS Machine
		FROM deleted 
		WHERE ISNULL(deleted.WO_Detail,0)>0

	PRINT '' WO_Detail Deleted from BrokerLst_Process''
	end

PRINT '' INSERT dbo.Ar_BrokerLst_Process_History  [BrokerLst_Process_Delete]'';
INSERT dbo.Ar_BrokerLst_Process_History
(	[Who],
	[What],
	[When],
	[soitem],
	[po_item],
	[SalesPerson],
	[startdate],
	[duedate],
	[comment],
	[process_id],
	[processor],
	[AllowSub],
	[PWeight],
	[PPc],
	[PU],
	[QTY],
	[Ordered_QTY],
	[Ordered_P],

	[Pounds],
	[id_detail],
	[id_detail_process],
	[Removed],
	[Validated],
	[ReceivingID],
	[WO]
	,[WO_Detail]
	,[InqNumP]
	,[Prc_QTY]
	,[Prc_Form]
	,[Prc_PCs]
	,[Prc_Dim2]
	,[Prc_Dim3]
	,FoundSTK ) 
SELECT
	suser_sname() AS [Who],
	''Delete Trg'' AS [What],
	GETDATE() AS [When],
	[soitem],
	[po_item],
	[SalesPerson],
	[startdate],
	[duedate],
	[comment],
	[process_id],
	[processor],
	[AllowSub],
	[PWeight],
	[PPc],
	[PU],
	[QTY],
	[Ordered_QTY],
	[Ordered_P],

	[Pounds],
	[id_detail],
	[id_detail_process],
	GETDATE() AS [Removed],
	''F'' AS [Validated],
	[ReceivingID],
	[WO]
	,[WO_Detail]
	,[InqNumP]
	,[Prc_QTY]
	,[Prc_Form]
	,[Prc_PCs]
	,[Prc_Dim2]
	,[Prc_Dim3]
	,FoundSTK
	FROM deleted

 
PRINT '' Copy to dbo.StockLst_Process_Recv -Keep a Received Record!'';
INSERT dbo.BrokerLst_Process_Recvd
	( [PO_item]
      ,[SalesPerson]
      ,[StartDate]
      ,[DueDate]
	  ,[RecvDate]
      ,[Comment]
      ,[Process_ID]
      ,[Processor]
      ,[PU]
      ,[QTY]
      ,[Ordered_QTY]
      ,[Ordered_P]
      ,[Pounds]
      ,[ID_Detail]
      ,[ID_Detail_Process]
      ,[ReceivingID]
      ,[WO_Detail]
      ,[Prc_Form]
      ,[Prc_PCs]
      ,[Prc_Dim1]
      ,[Prc_Dim2]
      ,[Prc_Dim3] )

 SELECT 
 	 [PO_item]
      ,[SalesPerson]
      ,[StartDate]
      ,[DueDate]
	  ,GETDATE() AS [RecvDate]
      ,[Comment]
      ,[Process_ID]
      ,[Processor]
      ,[PU]
      ,[QTY]
      ,[Ordered_QTY]
      ,[Ordered_P]
      ,[Pounds]
      ,[ID_Detail]
      ,[ID_Detail_Process]
      ,[ReceivingID]
      ,[WO_Detail]
      ,[Prc_Form]
      ,[Prc_PCs]
      ,[Prc_Dim1]
      ,[Prc_Dim2]
      ,[Prc_Dim3]
  FROM Deleted WHERE Process_ID=''RECEIVED''


IF (SELECT COUNT(*) FROM deleted WHERE deleted.[Process_ID] = ''SELECTED'') > 0  
	BEGIN
	--UPDATE rtr
	DECLARE @cOrderNumber CHAR(13) = ''''
	DECLARE @nID_Detail_Process INT = 0

	DECLARE @nWO INT = 0
	SELECT TOP 1 @nWO = deleted.WO, @nID_Detail_Process = deleted.ID_Detail_Process FROM deleted WHERE deleted.Process_ID = ''SELECTED'' AND ISNULL(deleted.WO,0) > 0
	IF @nWO > 0 AND @nID_Detail_Process > 0
		begin
		SET @cOrderNumber = CAST(@nWO AS CHAR(10) )
		PRINT ''FINISH rtr_Detail with WO '' + @cOrderNumber
		EXEC dbo.p_rtr_Select_Material_Done ''WO'', @cOrderNumber, ''B'', @nID_Detail_Process
		end

	DECLARE @nWO_Detail INT = 0
	SELECT TOP 1 @nWO_Detail = deleted.WO_Detail, @nID_Detail_Process = deleted.ID_Detail_Process FROM deleted WHERE deleted.Process_ID = ''SELECTED'' AND ISNULL(deleted.WO_Detail,0) > 0
	IF @nWO_Detail > 0 AND @nID_Detail_Process > 0
		begin
		SET @cOrderNumber = CAST(@nWO_Detail AS CHAR(10) )
		PRINT ''FINISH rtr_Detail with WO_Detail ''+@cOrderNumber
		EXEC dbo.p_rtr_Select_Material_Done ''WO_Detail'', @cOrderNumber, ''B'', @nID_Detail_Process
		end

	DECLARE @cSOitem CHAR(10) = ''''
	SELECT TOP 1 @cSOitem = deleted.SOitem, @nID_Detail_Process = deleted.ID_Detail_Process FROM deleted WHERE deleted.Process_ID = ''SELECTED'' AND LEN(ISNULL(deleted.SOitem,0)) > 3

	IF dbo.f_ProperSOitem(@cSOitem) <> dbo.f_ProperSOitem('''') AND  @nID_Detail_Process > 0
		begin
		--
		PRINT ''FINISH rtr_Detail with SOitem ''+@cSOitem
		EXEC dbo.p_rtr_Select_Material ''SOitem'', @cSOitem, ''B'', @nID_Detail_Process
		end

	END

-- Mark StockLst_Process_Grab as Gone on Delete of ID_Detail
UPDATE G SET G.Gone=1
	FROM dbo.BrokerLst_Process_Grab G
	inner join deleted ON G.ID_Detail = deleted.ID_Detail
	--WHERE deleted.Process_ID = ''SELECTED'';

PRINT ''Trigger  End  [BrokerLst_Process_Delete]'';
' 
GO
ALTER TABLE [dbo].[BrokerLst_Process] ENABLE TRIGGER [BrokerLst_Process_Delete]
GO
/****** Object:  Trigger [dbo].[BrokerLst_Process_Insert]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Process_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[BrokerLst_Process_Insert] ON [dbo].[BrokerLst_Process] 
  FOR INSERT 
  NOT FOR REPLICATION
AS

PRINT ''Trigger Start [BrokerLst_Process_Insert]'';

DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
DECLARE @Body varchar(4000)
DECLARE @badSOitem CHAR(10)

--Send Email alert for Shipped
IF (SELECT COUNT(*) FROM inserted 
	WHERE inserted.[process_id] = ''Shipped'') > 0  
	BEGIN
		PRINT ''Send Email alert: SOitem was marked as SHIPPED on BrokerLst_Process ''

		SELECT TOP 1 @Body = ''Material for SO-Item:''+ISNULL(inserted.SOitem,'''')
			+'' or WO:''+CAST(ISNULL(inserted.WO,0) AS CHAR)
			+'' was marked as SHIPPED on BrokerLst_Process:''
			+RTRIM(CAST(inserted.id_detail_process AS CHAR))
			+CHAR(13)+dbo.f_Reportlink_CHAR(''SOitem'',inserted.SOitem)
			+CHAR(13)+''User ''+RTRIM(suser_sname())+'' on ''+RTRIM(CAST(GETDATE() AS CHAR))
			+CHAR(13)+'', but still listed on BrokerLst.''  
			+CHAR(13)+@@SERVERNAME+'' TRIGGER ''+''BrokerLst_Process_Insert ''
			FROM inserted
				WHERE inserted.[process_id] = ''Shipped''

		PRINT ''Send Email alert for Shipped that still exists.''
		
		EXEC dbo.P_Email_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
		 @SubjectEmail = ''Stock marked as Shipped'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''
		 

		INSERT dbo.NR_UserTrack ([mess1],[cprogram]) 
			SELECT LEFT(''SO-Item:''+ISNULL(inserted.SOitem,'''')
			+'' or WO:''+CAST(ISNULL(inserted.WO,0) AS CHAR)+'' was marked as SHIPPED on BrokerLst_Process:''
			+RTRIM(CAST(inserted.id_detail_process AS CHAR))+CHAR(13)+'' on ''+RTRIM(CAST(GETDATE()AS CHAR))
			+CHAR(13)+'', but still listed on BrokerLst.''+CHAR(13)
			+''User ''+RTRIM(suser_sname())+'' on ''+RTRIM(CAST(GETDATE()AS CHAR))+'' ''
			+@@SERVERNAME+'' TRIGGER ''+''.dbo.BrokerLst_Process_Insert '',1024) AS Mess1
			,''TRIGGER ERP_2.dbo.BrokerLst_Process''
			FROM inserted
				WHERE inserted.[process_id] = ''Shipped''

	END

--Send Email alert for SOitem ''9999999-99''.
IF (SELECT COUNT(*) FROM inserted WHERE inserted.SOitem = ''9999999-99'') > 0  
	BEGIN
		

		SELECT TOP 1 @Body = ''SO is 9999999-99 on BrokerLst_Process id_detail_process:''
			+RTRIM(CAST(inserted.id_detail_process AS CHAR))
			+CHAR(13)+ dbo.f_Reportlink_CHAR(''SOitem'',inserted.SOitem)
			+CHAR(13)+ dbo.f_Reportlink_CHAR(''POitem'',inserted.PO_item)
			+CHAR(13)+ ISNULL(inserted.Comment,''Comment NA'')
			+CHAR(13)+''User ''+RTRIM(suser_sname())+'' on ''+RTRIM(CAST(GETDATE() AS CHAR))
			+CHAR(13)+@@SERVERNAME+'' TRIGGER ''+''BrokerLst_Process_Insert ''
			FROM inserted
			WHERE inserted.SOitem = ''9999999-99''

			PRINT ''Send Email alert for SOitem 9999999-99''
		--PRINT @Body		
		
		EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''David.Kirchner@ERP_1s.com'', 
		 @SubjectEmail = ''SOitem 9999999-99'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''
		 

	END
--- rtr ---
PRINT ''Trigger Start [BrokerLst_Process_Insert rtr]'';

IF (SELECT COUNT(*) FROM inserted WHERE inserted.[Process_ID] = ''SELECTED'') > 0  
	BEGIN
	--UPDATE rtr
	DECLARE @cOrderNumber CHAR(13) = ''''
	DECLARE @nID_Detail_Process INT = 0

	DECLARE @nWO INT = 0
	SELECT TOP 1 @nWO = inserted.WO, @nID_Detail_Process = inserted.ID_Detail_Process 
		FROM Inserted 
		WHERE inserted.Process_ID = ''SELECTED'' AND ISNULL(inserted.WO,0) > 0

	IF @nWO > 0 AND @nID_Detail_Process > 0
		begin
		SET @cOrderNumber = CAST(@nWO AS CHAR(10) )
		PRINT ''UPDATE rtr_Detail with WO '' + @cOrderNumber
		EXEC dbo.p_rtr_Select_Material ''WO'', @cOrderNumber, ''B'', @nID_Detail_Process
		end

	DECLARE @nWO_Detail INT = 0
	SELECT TOP 1 @nWO_Detail = inserted.WO_Detail, @nID_Detail_Process = inserted.ID_Detail_Process 
		FROM Inserted WHERE inserted.Process_ID = ''SELECTED'' AND ISNULL(inserted.WO_Detail,0) > 0

	IF @nWO_Detail > 0 AND @nID_Detail_Process > 0
		begin
		SET @cOrderNumber = CAST(@nWO_Detail AS CHAR(10) )
		PRINT ''UPDATE rtr_Detail with WO_Detail ''+@cOrderNumber
		EXEC dbo.p_rtr_Select_Material ''WO_Detail'', @cOrderNumber, ''B'', @nID_Detail_Process
		end

	DECLARE @cSOitem CHAR(10) = ''''
	SELECT TOP 1 @cSOitem = inserted.SOitem, @nID_Detail_Process = inserted.ID_Detail_Process 
		FROM Inserted WHERE inserted.Process_ID = ''SELECTED'' 
		AND NOT dbo.f_ProperSOitem(inserted.SOitem) = dbo.f_ProperSOitem('''')

	IF dbo.f_ProperSOitem(@cSOitem) <> dbo.f_ProperSOitem('''') AND  @nID_Detail_Process > 0
		begin
		--SET @cOrderNumber = CAST(@nWO_Detail AS CHAR(10) )
		PRINT ''UPDATE rtr_Detail with SOitem ''+@cSOitem

		EXEC dbo.p_rtr_Select_Material ''SOitem'', @cSOitem, ''B'', @nID_Detail_Process
		end
	END
--- rtr ---


PRINT '' INSERT dbo.Ar_BrokerLst_Process_History  [BrokerLst_Process_Insert]'';
INSERT dbo.Ar_BrokerLst_Process_History 
	([Who],
	[What],
	[When],
	[soitem],
	[PO_Item],
	[SalesPerson],
	[startdate],
	[duedate],
	[comment],
	[process_id],
	[processor],
	[AllowSub],
	[PWeight],
	[PPc],
	[PU],
	[QTY],
	[Ordered_QTY],
	[Ordered_P],

	[Pounds],
	[id_detail],
	[id_detail_process],
	[Validated],
	[ReceivingID],
	[WO]
	,[WO_Detail]
	,[InqNumP]
	,[Prc_QTY]
	,[Prc_Form]
	,[Prc_PCs]
	,[Prc_Dim2]
	,[Prc_Dim3]
	,FoundSTK )
SELECT 	suser_sname() AS [Who],
	''ADD'' AS [What],
	GETDATE() AS [When],
	[soitem],
	[PO_Item],
	[SalesPerson],
	[startdate],
	[duedate],
	[comment],
	[process_id],
	[processor],
	[AllowSub],
	[PWeight],
	[PPc],
	[PU],
	[QTY],
	[Ordered_QTY],
	[Ordered_P],

	[Pounds],
	[id_detail],
	[id_detail_process],
	''F'',
	[ReceivingID],
	[WO]
	,[WO_Detail]
	,[InqNumP]
	,[Prc_QTY]
	,[Prc_Form]
	,[Prc_PCs]
	,[Prc_Dim2]
	,[Prc_Dim3]
	,FoundSTK
 FROM inserted


 PRINT ''Trigger  End  [BrokerLst_Process_Insert]'';
' 
GO
ALTER TABLE [dbo].[BrokerLst_Process] ENABLE TRIGGER [BrokerLst_Process_Insert]
GO
/****** Object:  Trigger [dbo].[BrokerLst_Process_Update]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Process_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[BrokerLst_Process_Update]
   ON  [dbo].[BrokerLst_Process] 
   FOR UPDATE 
   NOT FOR REPLICATION
AS

PRINT ''Trigger Begin [BrokerLst_Process_Update]'';

-- Removed DueDate on 2011-10-18 so there would be less updates.
-- inserted.[duedate]     = deleted.[duedate] and
-- Removed Process_ID Update on 2011-10-18
-- inserted.[process_id]  = deleted.[process_id] and

    
---big UPDATES are in error
DECLARE @Count int
SET @Count = @@ROWCOUNT;
   
IF @Count > 1000
BEGIN
	RAISERROR(''Cannot UPDATE more than 1000 records of dbo.Sales_No at one time. trigger Sales_No_Update'',16,1) 
	ROLLBACK TRANSACTION
	RETURN;
END
----------------------

-- ''ERP_1_Archive''
DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
DECLARE @Body varchar(4000)
DECLARE @badSOitem CHAR(10)=''''
DECLARE @badPOitem CHAR(12)=''''

IF EXISTS ( SELECT * FROM inserted WHERE 
		( SUBSTRING(SOitem,1,7) like ''%-%'' 
		OR SUBSTRING(PO_item,1,9) like ''%-%'' ) 
		--AND ISNULL(WO_Detail,0) > 0 
		)
	BEGIN
	--SUBSTRING(SOitem,1,7) Like ''%-%'', Looks for a - in first 7 digits

	PRINT '' Cannot insert into dbo.StockLst_Process, SOitem is not Proper or POitem is not Proper''
	SELECT @Body = ''Cannot insert into dbo.StockLst_Process, SOitem or PO_item is not Proper,''+CHAR(13)
		
	SELECT TOP 1 @badPOitem = ISNULL(PO_item,''null'')  FROM inserted WHERE 
		SUBSTRING(PO_item,1,9) like ''%-%'' 

	SELECT TOP 1 @badSOitem = ISNULL(SOitem,''null'')  FROM inserted WHERE 
		 SUBSTRING(SOitem,1,7) like ''%-%''

	SET @Body = @Body+'' PO item:''+@badPOitem +''.''
		+'' SO item:''+@badSOitem +''.''
		+RTRIM(suser_sname())
		+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.StockLst_Process_Update ''
				
	EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
		 @SubjectEmail = ''a BAD SOitem or POitem'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''
		 	
	SET @Body = ''INSERT dbo.StockLst_Process table failed. POitem:''
		+@badPOitem+'' not Proper.''
		+'' SOitem:''+@badSOitem+'' not Proper.''

--	RAISERROR( @Body, 16, -1)

	END

IF (SELECT COUNT(*) FROM inserted, deleted
WHERE inserted.[SOitem]   = deleted.[SOitem] and
   inserted.[PO_Item]     = deleted.[PO_Item] and
   inserted.[SalesPerson] = deleted.[SalesPerson] and
   inserted.[StartDate]   = deleted.[StartDate] and
   inserted.[Comment]     = deleted.[Comment] and
   inserted.[Processor]   = deleted.[Processor]  and
   inserted.[AllowSub]    = deleted.[AllowSub] and
   inserted.[PWeight]     = deleted.[PWeight] and
   inserted.[PPc]         = deleted.[PPc] and
   inserted.[PU]          = deleted.[PU] and
   inserted.[QTY]         = deleted.[QTY] and
   inserted.[Pounds]      = deleted.[Pounds] and
   inserted.[ReceivingID] = deleted.[ReceivingID] and
   inserted.WO_Detail     = deleted.WO_Detail and
   inserted.Prc_QTY       = deleted.Prc_QTY and
   inserted.FoundSTK	  = deleted.FoundSTK
   ) <> 1
BEGIN
	--Major field has changed
   PRINT '' INSERT dbo.Ar_BrokerLst_Process_History  [BrokerLst_Process_Update]'';
   INSERT dbo.Ar_BrokerLst_Process_History 
	([Who],[What],[When],
	[SOitem],
	[PO_Item],
	[SalesPerson],
	[StartDate],
	[DueDate],
	[Comment],
	[Process_ID],
	[Processor],
	[AllowSub],
	[PWeight],
	[PPc],
	[PFt],
	[PU],
	[QTY],
	[Ordered_QTY],
	[Ordered_P],

	[Pounds],
	[ID_Detail],
	[ID_Detail_Process],
	[Validated],
	[ReceivingID],
	[WO]
	,[WO_Detail]
	,[InqNumP]
	,[Prc_QTY]
	,[Prc_Form]
	,[Prc_PCs]
	,[Prc_Dim2]
	,[Prc_Dim3]
	,FoundSTK)
   SELECT suser_sname() AS [Who],
	''BEFOREEDIT'' AS [What],
	GETDATE() AS [When],
	inserted.[SOitem],
	inserted.[PO_Item],
	inserted.[SalesPerson],
	inserted.[StartDate],
	inserted.[DueDate],
	inserted.[Comment],
	inserted.[Process_ID],
	inserted.[Processor],
	inserted.[AllowSub],
	inserted.[PWeight],
	inserted.[PPc],
	inserted.[PFt],
	inserted.[PU],
	inserted.[QTY],
	inserted.[Ordered_QTY],
	inserted.[Ordered_P],

	inserted.[Pounds],
	inserted.[ID_Detail],
	inserted.[ID_Detail_Process],
	''F'',
	inserted.[ReceivingID],
	inserted.[WO]
	,inserted.[WO_Detail]
	,inserted.[InqNumP]
	,inserted.[Prc_QTY]
	,inserted.[Prc_Form]
	,inserted.[Prc_PCs]
	,inserted.[Prc_Dim2]
	,inserted.[Prc_Dim3]
	,inserted.FoundSTK
    FROM deleted, inserted
	WHERE inserted.[ID_Detail_Process] = deleted.[ID_Detail_Process]
	   and NOT ( inserted.[SOitem] = deleted.[SOitem] 
	   and inserted.[PO_Item]     = deleted.[PO_Item] 
	   and inserted.[SalesPerson] = deleted.[SalesPerson]
	   and inserted.[StartDate]   = deleted.[StartDate]
	   and inserted.[Comment]     = deleted.[Comment]
	   and inserted.[Processor]   = deleted.[Processor]
	   and inserted.[AllowSub]    = deleted.[AllowSub]
	   and inserted.[PWeight]     = deleted.[PWeight]
	   and inserted.[PPc]         = deleted.[PPc]
	   and inserted.[PU]          = deleted.[PU]
	   and inserted.[QTY]         = deleted.[QTY]
	   and inserted.[Pounds]      = deleted.[Pounds] 
	   and inserted.[FoundSTK]    = deleted.[FoundSTK] )
	and ( UPDATE([SOitem]) 
		or UPDATE([PO_Item])
		or UPDATE([SalesPerson])
		or UPDATE([StartDate])
		or UPDATE([Comment])
		or UPDATE([Processor])
		or UPDATE([AllowSub])
		or UPDATE([PWeight])
		or UPDATE([PPc])
		or UPDATE([PU])
		or UPDATE([QTY])
		or UPDATE([Pounds])
		or UPDATE([Prc_QTY])
		or UPDATE([FoundSTK]) )


   INSERT dbo.Ar_BrokerLst_Process_History 
	([Who],[What],[When],
	[SOitem],
	[PO_Item],
	[SalesPerson],
	[StartDate],
	[DueDate],
	[Comment],
	[Process_ID],
	[Processor],
	[AllowSub],
	[PWeight],
	[PPc],
	[PFt],
	[PU],
	[QTY],
	[Ordered_QTY],
	[Ordered_P],

	[Pounds],
	[ID_Detail],
	[ID_Detail_Process],
	[Validated],
	[ReceivingID],
	[WO]
	,[WO_Detail]
	,[InqNumP]
	,[Prc_QTY]
	,[Prc_Form]
	,[Prc_PCs]
	,[Prc_Dim2]
	,[Prc_Dim3]
	,FoundSTK)
   SELECT suser_sname() AS [Who],
	''AFTER EDIT'' AS [What],
	GETDATE() AS [When],
	deleted.[SOitem],
	deleted.[PO_Item],
	deleted.[SalesPerson],
	deleted.[StartDate],
	deleted.[DueDate],
	deleted.[Comment],
	deleted.[Process_ID],
	deleted.[Processor],
	deleted.[AllowSub],
	deleted.[PWeight],
	deleted.[PPc],
	deleted.[PFt],
	deleted.[PU],
	deleted.[QTY],
	deleted.[Ordered_QTY],
	deleted.[Ordered_P],

	deleted.[Pounds],
	deleted.[ID_Detail],
	deleted.[ID_Detail_Process],
	''F'',
	deleted.[ReceivingID],
	deleted.[WO]
	,deleted.[WO_Detail]
	,deleted.[InqNumP]
	,deleted.[Prc_QTY]
	,deleted.[Prc_Form]
	,deleted.[Prc_PCs]
	,deleted.[Prc_Dim2]
	,deleted.[Prc_Dim3]
	,deleted.FoundSTK
    FROM inserted, deleted
	WHERE inserted.[ID_Detail_Process] = deleted.[ID_Detail_Process]
	   and NOT ( inserted.[SOitem] = deleted.[SOitem] 
	   and inserted.[PO_Item]     = deleted.[PO_Item] 
	   and inserted.[SalesPerson] = deleted.[SalesPerson]
	   and inserted.[StartDate]   = deleted.[StartDate]  
	   and inserted.[Comment]     = deleted.[Comment]  
	   and inserted.[Processor]   = deleted.[Processor]  
	   and inserted.[AllowSub]    = deleted.[AllowSub]
	   and inserted.[PWeight]     = deleted.[PWeight]
	   and inserted.[PPc]         = deleted.[PPc] 
	   and inserted.[PU]          = deleted.[PU]
	   and inserted.[QTY]         = deleted.[QTY]
	   and inserted.[Pounds]      = deleted.[Pounds] )
	and ( UPDATE([SOitem]) 
		or UPDATE([PO_Item])
		or UPDATE([SalesPerson])
		or UPDATE([StartDate])
		or UPDATE([Comment])
		or UPDATE([Processor])
		or UPDATE([AllowSub])
		or UPDATE([PWeight])
		or UPDATE([PPc])
		or UPDATE([PU])
		or UPDATE([QTY])
		or UPDATE([Pounds])
		or UPDATE([Prc_QTY])
		or UPDATE([FoundSTK]) )

END
PRINT ''Trigger  End  [BrokerLst_Process_Update]'';
' 
GO
ALTER TABLE [dbo].[BrokerLst_Process] ENABLE TRIGGER [BrokerLst_Process_Update]
GO
/****** Object:  Trigger [dbo].[BrokerLst_Process_Detail_Delete]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLst_Process_Detail_Delete]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.BrokerLst_Process_Delete    Script Date: 11/30/2005 3:54:44 PM ******/
Create TRIGGER [dbo].[BrokerLst_Process_Detail_Delete] ON [dbo].[BrokerLst_Process_Detail] 
FOR DELETE NOT FOR REPLICATION 
AS

PRINT ''Start trigger [BrokerLst_Process_Detail_Delete]'';

INSERT dbo.Ar_BrokerLst_Process_Detail_History 
	([Who],
	[What],
	[When],
	[ID],
	[ID_Detail],
	[ID_Detail_Process],
	[WO],
	[SOitem] )
SELECT [Who],
	[What],
	[When],
	[ID],
	[ID_Detail],
	[ID_Detail_Process],
	[WO],
	[SOitem]
 FROM Deleted

 PRINT ''End trigger [BrokerLst_Process_Detail_Delete]'';' 
GO
ALTER TABLE [dbo].[BrokerLst_Process_Detail] ENABLE TRIGGER [BrokerLst_Process_Detail_Delete]
GO
/****** Object:  Trigger [dbo].[Cert_Delete]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Cert_Delete]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[Cert_Delete] ON [dbo].[Cert] 
FOR DELETE 
--NOT FOR REPLICATION
AS

     
INSERT dbo.Ar_Cert_History
	([WHO],[WHAT],[WHEN]
	,[Reference]
      ,[DateCert]
      ,[DateProd]
      ,[Heat]
      ,[Lot]
      ,[Alloy]
      ,[Size]
      ,[Spec],[Cond_Fin]
      ,[SpecLMA]
      ,[Spec2]
      ,[SpecSpaceX]
      ,[UNS]
      ,[Al]
      ,[B]
      ,[Be]
      ,[C]
      ,[Ca]
      ,[Cb]
      ,[Cd]
      ,[Cl]
      ,[Co]
      ,[Cr]
      ,[Cu]
      ,[Fe]
      ,[H]
      ,[Hf]
      ,[Mg]
      ,[Mn]
      ,[Mo]
      ,[N]
      ,[Na]
      ,[Ni]
      ,[O]
      ,[P]
      ,[Pb]
      ,[S]
      ,[Si]
      ,[Sn]
      ,[Ta]
      ,[Ti]
      ,[U]
      ,[V]
      ,[W]
      ,[Y]
      ,[Zr]
      ,[CbandTa]
      ,[NiandCo]
      ,[Other]
      ,[Ult1]
      ,[Yield1]
      ,[Elong1]
      ,[ElonInches]
      ,[RA1]
      ,[tLoc1]
      ,[Hardness]
      ,[BHN]
      ,[Ult2]
      ,[Yield2]
      ,[Elong2]
      ,[ElonInches2]
      ,[RA2]
      ,[tLoc2]
      ,[Hardness2]
      ,[BHN2]
      ,[Ult3]
      ,[Yield3]
      ,[Elong3]
      ,[ElonInches3]
      ,[RA3]
      ,[tLoc3]
      ,[Hardness3]
      ,[BHN3]
      ,[Ult4]
      ,[Yield4]
      ,[Elong4]
      ,[ElonInches4]
      ,[RA4]
      ,[tLoc4]
      ,[Hardness4]
      ,[BHN4]
      ,[Ult5]
      ,[Yield5]
      ,[Elong5]
      ,[ElonInches5]
      ,[RA5]
      ,[tLoc5]
      ,[Hardness5]
      ,[BHN5]
      ,[Ult6]
      ,[Yield6]
      ,[Elong6]
      ,[ElonInches6]
      ,[RA6]
      ,[tLoc6]
      ,[Ult7]
      ,[Yield7]
      ,[Elong7]
      ,[ElonInches7]
      ,[RA7]
      ,[tLoc7]
      ,[Temp2]
      ,[STen2]
      ,[Time2]
      ,[Temp3]
      ,[STen3]
      ,[Time3]
      ,[HeatTreat]
      ,[CorrosionR]
      ,[GrainSize]
      ,[TestPO]
      ,[LabUsed]
      ,[TestPO2]
      ,[LabUsed2]
      ,[Signed]
      ,[Machine]
      ,[Signature]
      ,[SignUser]
      ,[SignDate]
      ,[XtraInfo]
      ,[QA]
      ,[QArev]
      ,[MercFree]
      ,[NoWeld]
      ,[DFARS]
      ,[SRHours]
      ,[SRTemp]
      ,[SRStress]
      ,[SRRA]
      ,[SRElong]
      ,[ID]
      ,[StockLst_ID]
      ,[AC_ID]
      ,[AC_cmplt]
      ,[WhoInsert]
      )
SELECT 	suser_sname(),''DELETE'',GetDate()
	,[Reference]
      ,[DateCert]
      ,[DateProd]
      ,[Heat]
      ,[Lot]
      ,[Alloy]
      ,[Size]
      ,[Spec],[Cond_Fin]
      ,[SpecLMA]
      ,[Spec2]
      ,[SpecSpaceX]
      ,[UNS]
      ,[Al]
      ,[B]
      ,[Be]
      ,[C]
      ,[Ca]
      ,[Cb]
      ,[Cd]
      ,[Cl]
      ,[Co]
      ,[Cr]
      ,[Cu]
      ,[Fe]
      ,[H]
      ,[Hf]
      ,[Mg]
      ,[Mn]
      ,[Mo]
      ,[N]
      ,[Na]
      ,[Ni]
      ,[O]
      ,[P]
      ,[Pb]
      ,[S]
      ,[Si]
      ,[Sn]
      ,[Ta]
      ,[Ti]
      ,[U]
      ,[V]
      ,[W]
      ,[Y]
      ,[Zr]
      ,[CbandTa]
      ,[NiandCo]
      ,[Other]
      ,[Ult1]
      ,[Yield1]
      ,[Elong1]
      ,[ElonInches]
      ,[RA1]
      ,[tLoc1]
      ,[Hardness]
      ,[BHN]
      ,[Ult2]
      ,[Yield2]
      ,[Elong2]
      ,[ElonInches2]
      ,[RA2]
      ,[tLoc2]
      ,[Hardness2]
      ,[BHN2]
      ,[Ult3]
      ,[Yield3]
      ,[Elong3]
      ,[ElonInches3]
      ,[RA3]
      ,[tLoc3]
      ,[Hardness3]
      ,[BHN3]
      ,[Ult4]
      ,[Yield4]
      ,[Elong4]
      ,[ElonInches4]
      ,[RA4]
      ,[tLoc4]
      ,[Hardness4]
      ,[BHN4]
      ,[Ult5]
      ,[Yield5]
      ,[Elong5]
      ,[ElonInches5]
      ,[RA5]
      ,[tLoc5]
      ,[Hardness5]
      ,[BHN5]
      ,[Ult6]
      ,[Yield6]
      ,[Elong6]
      ,[ElonInches6]
      ,[RA6]
      ,[tLoc6]
      ,[Ult7]
      ,[Yield7]
      ,[Elong7]
      ,[ElonInches7]
      ,[RA7]
      ,[tLoc7]
      ,[Temp2]
      ,[STen2]
      ,[Time2]
      ,[Temp3]
,[STen3]
      ,[Time3]
      ,[HeatTreat]
      ,[CorrosionR]
      ,[GrainSize]
      ,[TestPO]
      ,[LabUsed]
      ,[TestPO2]
      ,[LabUsed2]
      ,[Signed]
      ,[Machine]
      ,[Signature]
      ,[SignUser]
      ,[SignDate]
      ,[XtraInfo]
      ,[QA]
      ,[QArev]
      ,[MercFree]
      ,[NoWeld]
      ,[DFARS]
      ,[SRHours]
      ,[SRTemp]
      ,[SRStress]
      ,[SRRA]
      ,[SRElong]
      ,[ID]
      ,[StockLst_ID]
      ,[AC_ID]
      ,[AC_cmplt]
      ,[WhoInsert]
 FROM Deleted
' 
GO
ALTER TABLE [dbo].[Cert] ENABLE TRIGGER [Cert_Delete]
GO
/****** Object:  Trigger [dbo].[Cert_Update]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Cert_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[Cert_Update] ON [dbo].[Cert] 
FOR UPDATE 
--NOT FOR REPLICATION
AS

    
---big UPDATES are in error
DECLARE @Count int
SET @Count = @@ROWCOUNT;
   
IF @Count > 1000
BEGIN
	RAISERROR(''Cannot UPDATE more than 1000 records of dbo.Sales_No at one time. trigger Sales_No_Update'',16,1) 
	ROLLBACK TRANSACTION
	RETURN;
END
----------------------

INSERT dbo.Ar_Cert_History
	([WHO],[WHAT],[WHEN]
	,[Reference]
      ,[DateCert]
      ,[DateProd]
      ,[Heat]
      ,[Lot]
      ,[Alloy]
      ,[Size]
      ,[Spec],Cond_Fin
      ,[SpecLMA]
      ,[Spec2]
      ,[SpecSpaceX]
      ,[UNS]
      ,[Al]
      ,[B]
      ,[Be]
      ,[C]
      ,[Ca]
      ,[Cb]
      ,[Cd]
      ,[Cl]
      ,[Co]
      ,[Cr]
      ,[Cu]
      ,[Fe]
      ,[H]
      ,[Hf]
      ,[Mg]
      ,[Mn]
      ,[Mo]
      ,[N]
      ,[Na]
      ,[Ni]
      ,[O]
      ,[P]
      ,[Pb]
      ,[S]
      ,[Si]
      ,[Sn]
      ,[Ta]
      ,[Ti]
      ,[U]
      ,[V]
      ,[W]
      ,[Y]
      ,[Zr]
      ,[CbandTa]
      ,[NiandCo]
      ,[Other]
      ,[Ult1]
      ,[Yield1]
      ,[Elong1]
      ,[ElonInches]
      ,[RA1]
      ,[tLoc1]
      ,[Hardness]
      ,[BHN]
      ,[Ult2]
      ,[Yield2]
      ,[Elong2]
      ,[ElonInches2]
      ,[RA2]
      ,[tLoc2]
      ,[Hardness2]
      ,[BHN2]
      ,[Ult3]
      ,[Yield3]
      ,[Elong3]
      ,[ElonInches3]
      ,[RA3]
      ,[tLoc3]
      ,[Hardness3]
      ,[BHN3]
      ,[Ult4]
      ,[Yield4]
      ,[Elong4]
      ,[ElonInches4]
      ,[RA4]
      ,[tLoc4]
      ,[Hardness4]
      ,[BHN4]
      ,[Ult5]
      ,[Yield5]
      ,[Elong5]
      ,[ElonInches5]
      ,[RA5]
      ,[tLoc5]
      ,[Hardness5]
      ,[BHN5]
      ,[Ult6]
      ,[Yield6]
      ,[Elong6]
      ,[ElonInches6]
      ,[RA6]
      ,[tLoc6]
      ,[Ult7]
      ,[Yield7]
      ,[Elong7]
      ,[ElonInches7]
      ,[RA7]
      ,[tLoc7]
      ,[Temp2]
      ,[STen2]
      ,[Time2]
      ,[Temp3]
      ,[STen3]
      ,[Time3]
      ,[HeatTreat]
      ,[CorrosionR]
      ,[GrainSize]
      ,[TestPO]
      ,[LabUsed]
      ,[TestPO2]
      ,[LabUsed2]
      ,[Signed]
      ,[Machine]
      ,[Signature]
      ,[SignUser]
      ,[SignDate]
      ,[XtraInfo]
      ,[QA]
      ,[QArev]
      ,[MercFree]
      ,[NoWeld]
      ,[DFARS]
      ,[SRHours]
      ,[SRTemp]
      ,[SRStress]
      ,[SRRA]
      ,[SRElong]
      ,[ID]
      ,[StockLst_ID]
      ,[AC_ID]
      ,[AC_cmplt]
      ,[WhoInsert]
      )
SELECT 	suser_sname(),''BeforeEdit'',GetDate()
	,[Reference]
      ,[DateCert]
      ,[DateProd]
      ,[Heat]
      ,[Lot]
      ,[Alloy]
      ,[Size]
      ,[Spec],Cond_Fin
      ,[SpecLMA]
      ,[Spec2]
      ,[SpecSpaceX]
      ,[UNS]
      ,[Al]
      ,[B]
      ,[Be]
      ,[C]
      ,[Ca]
      ,[Cb]
      ,[Cd]
      ,[Cl]
      ,[Co]
      ,[Cr]
      ,[Cu]
      ,[Fe]
      ,[H]
      ,[Hf]
      ,[Mg]
      ,[Mn]
      ,[Mo]
      ,[N]
      ,[Na]
      ,[Ni]
      ,[O]
      ,[P]
      ,[Pb]
      ,[S]
      ,[Si]
      ,[Sn]
      ,[Ta]
      ,[Ti]
      ,[U]
      ,[V]
      ,[W]
      ,[Y]
      ,[Zr]
      ,[CbandTa]
      ,[NiandCo]
      ,[Other]
      ,[Ult1]
      ,[Yield1]
      ,[Elong1]
      ,[ElonInches]
      ,[RA1]
      ,[tLoc1]
      ,[Hardness]
      ,[BHN]
      ,[Ult2]
      ,[Yield2]
      ,[Elong2]
      ,[ElonInches2]
      ,[RA2]
      ,[tLoc2]
      ,[Hardness2]
      ,[BHN2]
      ,[Ult3]
      ,[Yield3]
      ,[Elong3]
      ,[ElonInches3]
      ,[RA3]
      ,[tLoc3]
      ,[Hardness3]
      ,[BHN3]
      ,[Ult4]
      ,[Yield4]
      ,[Elong4]
      ,[ElonInches4]
      ,[RA4]
      ,[tLoc4]
      ,[Hardness4]
      ,[BHN4]
      ,[Ult5]
      ,[Yield5]
      ,[Elong5]
      ,[ElonInches5]
      ,[RA5]
      ,[tLoc5]
      ,[Hardness5]
      ,[BHN5]
      ,[Ult6]
      ,[Yield6]
      ,[Elong6]
      ,[ElonInches6]
      ,[RA6]
      ,[tLoc6]
      ,[Ult7]
      ,[Yield7]
      ,[Elong7]
      ,[ElonInches7]
      ,[RA7]
      ,[tLoc7]
      ,[Temp2]
      ,[STen2]
      ,[Time2]
      ,[Temp3]
      ,[STen3]
      ,[Time3]
      ,[HeatTreat]
      ,[CorrosionR]
      ,[GrainSize]
      ,[TestPO]
      ,[LabUsed]
      ,[TestPO2]
      ,[LabUsed2]
      ,[Signed]
      ,[Machine]
      ,[Signature]
      ,[SignUser]
      ,[SignDate]
      ,[XtraInfo]
      ,[QA]
      ,[QArev]
      ,[MercFree]
      ,[NoWeld]
      ,[DFARS]
      ,[SRHours]
      ,[SRTemp]
      ,[SRStress]
      ,[SRRA]
      ,[SRElong]
      ,[ID]
      ,[StockLst_ID]
      ,[AC_ID]
      ,[AC_cmplt]
      ,[WhoInsert]
 FROM inserted


INSERT dbo.Ar_Cert_History
	([WHO],[WHAT],[WHEN]
	,[Reference]
      ,[DateCert]
      ,[DateProd]
      ,[Heat]
      ,[Lot]
      ,[Alloy]
      ,[Size]
      ,[Spec],Cond_Fin
      ,[SpecLMA]
      ,[Spec2]
      ,[SpecSpaceX]
      ,[UNS]
      ,[Al]
      ,[B]
      ,[Be]
      ,[C]
      ,[Ca]
      ,[Cb]
      ,[Cd]
      ,[Cl]
      ,[Co]
      ,[Cr]
      ,[Cu]
      ,[Fe]
      ,[H]
      ,[Hf]
      ,[Mg]
      ,[Mn]
      ,[Mo]
      ,[N]
      ,[Na]
      ,[Ni]
      ,[O]
      ,[P]
      ,[Pb]
      ,[S]
      ,[Si]
      ,[Sn]
      ,[Ta]
      ,[Ti]
      ,[U]
      ,[V]
      ,[W]
      ,[Y]
      ,[Zr]
      ,[CbandTa]
      ,[NiandCo]
      ,[Other]
      ,[Ult1]
      ,[Yield1]
      ,[Elong1]
      ,[ElonInches]
      ,[RA1]
      ,[tLoc1]
      ,[Hardness]
      ,[BHN]
      ,[Ult2]
      ,[Yield2]
      ,[Elong2]
      ,[ElonInches2]
      ,[RA2]
      ,[tLoc2]
      ,[Hardness2]
      ,[BHN2]
      ,[Ult3]
      ,[Yield3]
      ,[Elong3]
      ,[ElonInches3]
      ,[RA3]
      ,[tLoc3]
      ,[Hardness3]
      ,[BHN3]
      ,[Ult4]
      ,[Yield4]
      ,[Elong4]
      ,[ElonInches4]
      ,[RA4]
      ,[tLoc4]
      ,[Hardness4]
      ,[BHN4]
      ,[Ult5]
      ,[Yield5]
      ,[Elong5]
      ,[ElonInches5]
      ,[RA5]
      ,[tLoc5]
      ,[Hardness5]
      ,[BHN5]
      ,[Ult6]
      ,[Yield6]
      ,[Elong6]
      ,[ElonInches6]
      ,[RA6]
      ,[tLoc6]
      ,[Ult7]
      ,[Yield7]
      ,[Elong7]
      ,[ElonInches7]
      ,[RA7]
      ,[tLoc7]
      ,[Temp2]
      ,[STen2]
      ,[Time2]
      ,[Temp3]
      ,[STen3]
      ,[Time3]
      ,[HeatTreat]
      ,[CorrosionR]
      ,[GrainSize]
      ,[TestPO]
      ,[LabUsed]
      ,[TestPO2]
      ,[LabUsed2]
      ,[Signed]
      ,[Machine]
      ,[Signature]
      ,[SignUser]
      ,[SignDate]
      ,[XtraInfo]
      ,[QA]
      ,[QArev]
      ,[MercFree]
      ,[NoWeld]
      ,[DFARS]
      ,[SRHours]
      ,[SRTemp]
      ,[SRStress]
      ,[SRRA]
      ,[SRElong]
      ,[ID]
      ,[StockLst_ID]
      ,[AC_ID]
      ,[AC_cmplt]
      ,[WhoInsert]
      )
SELECT 	suser_sname(),''After Edit'',GetDate()
	,[Reference]
      ,[DateCert]
      ,[DateProd]
      ,[Heat]
      ,[Lot]
      ,[Alloy]
      ,[Size]
      ,[Spec],Cond_Fin
      ,[SpecLMA]
      ,[Spec2]
      ,[SpecSpaceX]
      ,[UNS]
      ,[Al]
      ,[B]
      ,[Be]
      ,[C]
      ,[Ca]
      ,[Cb]
      ,[Cd]
      ,[Cl]
      ,[Co]
      ,[Cr]
      ,[Cu]
      ,[Fe]
      ,[H]
      ,[Hf]
      ,[Mg]
      ,[Mn]
      ,[Mo]
      ,[N]
      ,[Na]
      ,[Ni]
      ,[O]
      ,[P]
      ,[Pb]
      ,[S]
      ,[Si]
      ,[Sn]
      ,[Ta]
      ,[Ti]
      ,[U]
      ,[V]
      ,[W]
      ,[Y]
      ,[Zr]
      ,[CbandTa]
      ,[NiandCo]
      ,[Other]
      ,[Ult1]
      ,[Yield1]
      ,[Elong1]
      ,[ElonInches]
      ,[RA1]
      ,[tLoc1]
      ,[Hardness]
      ,[BHN]
      ,[Ult2]
      ,[Yield2]
      ,[Elong2]
      ,[ElonInches2]
      ,[RA2]
 ,[tLoc2]
      ,[Hardness2]
      ,[BHN2]
      ,[Ult3]
      ,[Yield3]
      ,[Elong3]
      ,[ElonInches3]
      ,[RA3]
      ,[tLoc3]
      ,[Hardness3]
      ,[BHN3]
      ,[Ult4]
      ,[Yield4]
      ,[Elong4]
      ,[ElonInches4]
      ,[RA4]
      ,[tLoc4]
      ,[Hardness4]
      ,[BHN4]
      ,[Ult5]
      ,[Yield5]
      ,[Elong5]
      ,[ElonInches5]
      ,[RA5]
      ,[tLoc5]
      ,[Hardness5]
      ,[BHN5]
      ,[Ult6]
      ,[Yield6]
      ,[Elong6]
      ,[ElonInches6]
      ,[RA6]
      ,[tLoc6]
      ,[Ult7]
      ,[Yield7]
      ,[Elong7]
      ,[ElonInches7]
      ,[RA7]
      ,[tLoc7]
      ,[Temp2]
      ,[STen2]
      ,[Time2]
      ,[Temp3]
      ,[STen3]
      ,[Time3]
      ,[HeatTreat]
      ,[CorrosionR]
      ,[GrainSize]
      ,[TestPO]
      ,[LabUsed]
      ,[TestPO2]
      ,[LabUsed2]
      ,[Signed]
      ,[Machine]
      ,[Signature]
      ,[SignUser]
      ,[SignDate]
      ,[XtraInfo]
      ,[QA]
      ,[QArev]
      ,[MercFree]
      ,[NoWeld]
      ,[DFARS]
      ,[SRHours]
      ,[SRTemp]
      ,[SRStress]
      ,[SRRA]
      ,[SRElong]
      ,[ID]
      ,[StockLst_ID]
      ,[AC_ID]
      ,[AC_cmplt]
      ,[WhoInsert]
 FROM Deleted
' 
GO
ALTER TABLE [dbo].[Cert] ENABLE TRIGGER [Cert_Update]
GO
/****** Object:  Trigger [dbo].[Draw_log_After_Update]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Draw_log_After_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[Draw_log_After_Update] 
ON [dbo].[Draw_log] 
	AFTER UPDATE 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [Draw_log_After_Update]'';

DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()

IF UPDATE(Passed) 
	begin
	PRINT ''Update the WO_Detail for Test POitem''
		
	UPDATE dbo.WorkOrder_Detail
		SET PassTest = inserted.Passed
		FROM inserted
		INNER JOIN dbo.WorkOrder_Detail WO_D ON inserted.WO_Detail = WO_D.WO_Detail
		WHERE WO_D.WO_Detail = inserted.WO_Detail
		AND WO_D.TestPO = inserted.TestPOitem
		AND ISNULL(inserted.Lot,0) > 0
		AND NOT inserted.Passed IS NULL
		AND UPDATE(Passed);

	end


IF UPDATE(Passed) 
begin
	BEGIN TRY
	--Send Email
	
		DECLARE @Body varchar(4000)
		DECLARE @Lot	INT = 0
		DECLARE @SOitem	CHAR(10) = ''''
		DECLARE @TestPOitem CHAR(12) = ''''
		DECLARE @WorkOrder INT = 0
		DECLARE @WorkOrder_Detail INT = 0
		DECLARE @ProjID	INT = 0
		DECLARE @Descript VarChar(200) = ''''

		SELECT TOP 1 
			 @Lot = inserted.Lot
			,@SOitem = ISNULL(inserted.SOitem,'''')
			,@TestPOitem = ISNULL(inserted.TestPOitem,'''')
			,@WorkOrder = ISNULL(inserted.WO,0)
			,@WorkOrder_Detail = ISNULL(inserted.WO_Detail,0)
			,@ProjID = ISNULL(inserted.ProjID,0)
			,@Descript = ISNULL(RTRIM(Cast(COALESCE(inserted.fPiece,inserted.sPiece) AS CHAR(10)))+''pc ''+RTRIM(inserted.AlloyName)+'' ''+RTRIM(Cast(COALESCE(inserted.DrawSize,inserted.fSize) AS CHAR(10)))+'' Dia x ''+RTRIM(CAST( FLOOR(inserted.sWeight) AS CHAR(10)))+'' Pounds '' ,''No Description'')
			FROM inserted, deleted
			WHERE inserted.ID = deleted.ID
				AND ISNULL(inserted.Passed,0) = 1 
				AND ISNULL(deleted.Passed,0) = 0	--Pass is now True and was False
				AND ISNULL(inserted.Lot,0) > 0
				AND UPDATE(Passed);

		IF @Lot > 0
			begin
			--Found a Lot to Email
			PRINT ''LOT ''+CAST(@Lot AS CHAR(10));
			PRINT ''Descript ''+@Descript;

			PRINT '' Send a -Passed Lab Test- Email'';
		
			SET @Body = ''<!DOCTYPE html> <html><head><title>HPA Notice</title></head><body>''
			SET @Body = @Body + RTRIM(SUSER_SNAME())+'' updated the Draw_log ''+'' on ''+RTRIM(CAST(GETDATE()AS CHAR))
				+CHAR(10)+CHAR(13)+''<br>''+''Draw log test Passed for Lot: ''+CAST(@Lot AS CHAR(10)) +''<br>'';
		
			SET @Body = @Body+CHAR(13)+''<br>''+@Descript

			--SET @Body = @Body+CHAR(13)+''<br>''+''<a href="''+dbo.f_Reportlink_INT(''Wire_log'',@Lot) +''">Wire Lot: ''+LTRIM(RTRIM(@Lot))+''</a>''+''<br>'';
			SET @Body = @Body+CHAR(13)+''<br>''+dbo.f_HTML_link_Draw(@Lot)
		

			IF LEN(LTRIM(@SOitem))>6
				SET @Body = @Body+CHAR(13)+''<br>''+dbo.f_HTML_link_SOitem(@SOitem);
				--Alert SOitem SalesP
				--end

			IF @WorkOrder > 0
				SET @Body = @Body+CHAR(13)+''<br>''+dbo.f_HTML_link_WO(@WorkOrder);
				--Alert WO person
				--end

			IF @WorkOrder_Detail > 0
				SET @Body = @Body+CHAR(13)+''<br>''+dbo.f_HTML_link_WO_Detail(@WorkOrder_Detail);
				--Alert WO person for this WOD
				--end
			ELSE
				SET @Body = @Body+CHAR(13)+''<br>''+''No WorkOrder_Detail was found!''

			IF @ProjID > 0
				SET @Body = @Body+CHAR(13)+''<br>''+''<a href="''+dbo.f_Reportlink_INT(''ProjID'',@ProjID)+''"> ProjectID: ''+LTRIM(RTRIM(CAST(@ProjID AS CHAR)))+''</a>''+''<br>'';
				--Alert ProjID Person
				--end

			--@TestPOitem
			SET @Body = @Body+CHAR(13)+''<br>''+dbo.f_HTML_link_POitem(@TestPOitem);

			--Router
			SET @Body = @Body+CHAR(13)+''<br>''+''rtr''; --dbo.f_HTML_link_rtr(@rtr);

			--OT
			SET @Body = @Body+CHAR(13)+''<br>''+''Order Tracking''; --dbo.f_HTML_link_OT(@TrackID);



			SET @Body = @Body+CHAR(10)+CHAR(13)+''<br>'';
			SET @Body = @Body+CHAR(10)+CHAR(13)+''<br>'';
			SET @Body = @Body+''The accounting costing needs to be calculated.<br>'';
			SET @Body = @Body+CHAR(10)+CHAR(13)+''<br>'';
			SET @Body = @Body+CHAR(10)+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.Draw_log_After_Update '';
	
			SET @Body = @Body +''</body>+</HTML>''

			--PRINT @Body
			DECLARE @cSubjectEmail VARCHAR(250)
			SET @cSubjectEmail = ''Draw log ''+RTRIM(CAST(@Lot AS CHAR(10)))+'' test Passed''

			--IF @WorkOrder_Detail > 0	
				EXEC dbo.p_eMail_Send
					@FromEmail = @cEmailFrom, 
					@ToEmail = ''David.Kirchner@ERP_1s.com; ForgeManager@ERP_1s.com; production.costing@ERP_1s.com; QA@ERP_1s.com'',
					@SubjectEmail = @cSubjectEmail,
					@BodyEmail = @Body,
					@BodyType = ''HTML''

			end

	END TRY
	BEGIN CATCH
		EXEC dbo.p_eMail_Send
			@FromEmail = @cEmailFrom, 
			@ToEmail = ''David.Kirchner@ERP_1s.com;'',
			@SubjectEmail = ''Failed to create text'',
			@BodyEmail = ''Failed to create text in trigger Draw_log_After_Update'',
			@BodyType = ''TEXT''

	END CATCH;

	end


PRINT ''Trigger  End [Draw_log_After_Update]'';
' 
GO
ALTER TABLE [dbo].[Draw_log] ENABLE TRIGGER [Draw_log_After_Update]
GO
/****** Object:  Trigger [dbo].[Draw_Log_Update]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Draw_Log_Update]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.Swage_Log_Update     ******/


create TRIGGER [dbo].[Draw_Log_Update] 
ON [dbo].[Draw_log] 
	FOR UPDATE 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [Draw_Log_Update]'';

    
---big UPDATES are in error
DECLARE @Count int
SET @Count = @@ROWCOUNT;
   
IF @Count > 1000
BEGIN
	RAISERROR(''Cannot UPDATE more than 1000 records of dbo.Sales_No at one time. trigger Draw_Log_Update'',16,1) 
	ROLLBACK TRANSACTION
	RETURN;
END
----------------------

PRINT ''Trigger  End [Draw_Log_Update]'';
' 
GO
ALTER TABLE [dbo].[Draw_log] ENABLE TRIGGER [Draw_Log_Update]
GO
/****** Object:  Trigger [dbo].[Errors_INSERT]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Errors_INSERT]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<David Kirchner>
-- Create date: <07/03/2112>
-- Description:	<>
-- =============================================
CREATE TRIGGER [dbo].[Errors_INSERT]
   ON [dbo].[Errors] 
   AFTER INSERT 
   NOT FOR REPLICATION
AS 
BEGIN
IF @@NESTLEVEL>1 RETURN 

--Also see dbo.NR_UserTrack

SET NOCOUNT ON;

DECLARE @Body varchar(4000)

--SELECT [nError],[mess1],[cprogram],[nlineno],[ErrorDate],[MACHINE],[Revision],[Memo1],[ID] FROM [dbo].[Errors]
--insert into  [dbo].Errors ([nError],[mess1],[cprogram],[nlineno],[Memo1]) VALUES (0,''Testing message'',''by hand'',1,''The Big Memo'')


IF EXISTS( SELECT * FROM inserted WHERE mess1<>''Record Test Data.'' )
	begin
		SELECT TOP 1 @Body = (''Errors table has a new entry!''+''<br />''--+CHAR(13)+CHAR(13)
			+''Error: ''+RTRIM( CAST(ISNULL(inserted.nError ,'''')AS CHAR(10)) )+''.''+''<br />''--+CHAR(13)
			+''Mess1: ''+RTRIM(ISNULL(inserted.Mess1,''''))+''<br />''--+CHAR(13)
			+''Program: ''+RTRIM(ISNULL(inserted.cProgram,''''))+''.''+''<br />''--+CHAR(13)
			+''Line: ''+RTRIM( CAST(ISNULL(inserted.nLineNo,'''') AS CHAR(9)) )+''.''+''<br />''--+CHAR(13)
			+''Date: ''+RTRIM( CAST(ISNULL(inserted.ErrorDate,'''') AS VARCHAR(20)) )+''.''+''<br />''--+CHAR(13)
			+''Machine: ''+RTRIM(ISNULL(inserted.Machine,''''))+''.''+''<br />''--+CHAR(13)
			--+''sUser_sName: ''+RTRIM(inserted.suser_sname())+''</br>''+CHAR(13)
			+''Revision: ''+RTRIM(ISNULL(inserted.Revision,''''))+''.''+''<br />''--+CHAR(13)+CHAR(13)
			+''Memo1: ''+RTRIM(ISNULL(inserted.Memo1,''''))+''.''+''<br />''--+CHAR(13)
			+@@SERVERNAME+'' TRIGGER ERP_2.dbo.Errors_INSERT sent this Email'' )
			FROM inserted 
			WHERE mess1<>''Record Test Data.''
			--Do not Send Email for ''Record Test Data.''
	
		--DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
		--DECLARE @cEmailFrom VARCHAR(30) = ''HPA.IT@ERP_1s.com''
		--DECLARE @cEmailFrom VARCHAR(30) = ''vfp@windfall.hpa.local''
		DECLARE @cEmailFrom VARCHAR(30) = ''vfp@ERP_1s.com''
		--DECLARE @cEmailFrom VARCHAR(30) = ''david.kirchner@windfall.hpa.local''
	
		EXEC dbo.p_eMail_Send
			@FromEmail = @cEmailFrom, 
			--@ToEmail = ''david.kirchner@windfall.hpa.local'', 
			@ToEmail = ''VFP@ERP_1s.com'',
		
			@SubjectEmail = ''New dbo.Errors entry.'',	
			@BodyEmail = @Body,
			@BodyType = ''HTML''
	
		--EXEC dbo.p_eMail_Send @FromEmail = ''vfp@windfall.hpa.local'', @ToEmail = ''david.kirchner@windfall.hpa.local'', @SubjectEmail = ''New dbo.Errors entry.'',@BodyEmail = ''Errors table has a new entry!'',		@BodyType = ''HTML''

	end
END

--INSERT INTO dbo.Errors (mess1,cprogram,Memo1) VALUES (''TestEmail3'',''Raptor Server'', ''vfp@windfall.hpa.local TestEmail3 from Raptor Server'')' 
GO
ALTER TABLE [dbo].[Errors] ENABLE TRIGGER [Errors_INSERT]
GO
/****** Object:  Trigger [dbo].[GFM_DIE_CONDITION_INSERT]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[GFM_DIE_CONDITION_INSERT]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[GFM_DIE_CONDITION_INSERT] 
   ON  [dbo].[GFM_Die_Condition] 
   AFTER INSERT
AS 
BEGIN
	SET NOCOUNT ON;
	UPDATE dbo.GFM_Die_Inventory
	SET dbo.GFM_Die_Inventory.Condition = dgc.Condition
	FROM inserted as dgc
	WHERE dbo.GFM_Die_Inventory.DieID = dgc.DieID
END
' 
GO
ALTER TABLE [dbo].[GFM_Die_Condition] ENABLE TRIGGER [GFM_DIE_CONDITION_INSERT]
GO
/****** Object:  Trigger [dbo].[GFM_DIE_HEIGHT_INSERT]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[GFM_DIE_HEIGHT_INSERT]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[GFM_DIE_HEIGHT_INSERT] 
   ON  [dbo].[GFM_Die_Height] 
   AFTER INSERT
AS 
BEGIN
	SET NOCOUNT ON;
	UPDATE dbo.GFM_Die_Inventory
	SET dbo.GFM_Die_Inventory.DieHeight = dgh.DieHeight
	FROM inserted as dgh
	WHERE dbo.GFM_Die_Inventory.DieID = dgh.DieID
END
' 
GO
ALTER TABLE [dbo].[GFM_Die_Height] ENABLE TRIGGER [GFM_DIE_HEIGHT_INSERT]
GO
/****** Object:  Trigger [dbo].[GFM_DIE_INSPECTION_INSERT]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[GFM_DIE_INSPECTION_INSERT]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[GFM_DIE_INSPECTION_INSERT] 
   ON [dbo].[GFM_Die_Inspection]
   AFTER INSERT
AS 
BEGIN
	SET NOCOUNT ON;
	UPDATE dbo.GFM_Die_Inventory
	SET dbo.GFM_Die_Inventory.LastInspection = dgi.InspectionDate
	FROM inserted as dgi
	WHERE dbo.GFM_Die_Inventory.DieID = dgi.DieID
END
' 
GO
ALTER TABLE [dbo].[GFM_Die_Inspection] ENABLE TRIGGER [GFM_DIE_INSPECTION_INSERT]
GO
/****** Object:  Trigger [dbo].[GFM_DIE_LANDING_INSERT]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[GFM_DIE_LANDING_INSERT]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[GFM_DIE_LANDING_INSERT] 
   ON  [dbo].[GFM_Die_Landing] 
   AFTER INSERT
AS 
BEGIN
	SET NOCOUNT ON;
	UPDATE dbo.GFM_Die_Inventory
	SET dbo.GFM_Die_Inventory.LandingSize = dgl.LandingSize
	FROM inserted as dgl
	WHERE dbo.GFM_Die_Inventory.DieID = dgl.DieID
END
' 
GO
ALTER TABLE [dbo].[GFM_Die_Landing] ENABLE TRIGGER [GFM_DIE_LANDING_INSERT]
GO
/****** Object:  Trigger [dbo].[GFM_DIE_RANGE_INSERT]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[GFM_DIE_RANGE_INSERT]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[GFM_DIE_RANGE_INSERT] 
   ON  [dbo].[GFM_Die_Range]
   AFTER INSERT
AS 
BEGIN
	SET NOCOUNT ON;
	UPDATE dbo.GFM_Die_Inventory
	SET dbo.GFM_Die_Inventory.RangeMin = dgr.RangeMin, 
	dbo.GFM_Die_Inventory.RangeMax = dgr.RangeMax
	FROM inserted as dgr
	WHERE dbo.GFM_Die_Inventory.DieID = dgr.DieID
END
' 
GO
ALTER TABLE [dbo].[GFM_Die_Range] ENABLE TRIGGER [GFM_DIE_RANGE_INSERT]
GO
/****** Object:  Trigger [dbo].[GFMlog DELETE history]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[GFMlog DELETE history]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[GFMlog DELETE history] ON [dbo].[GFMlog] 
FOR DELETE 
--NOT FOR REPLICATION
AS

INSERT INTO dbo.Ar_GFMlog_hist 
	([AlloyName],
	[Heat],
	[Lot],
	[Date],
	[sPiece],
	[sSize],
	[sLength],
	[sWeight],
	[GfmSize],
	[fPiece],
	[fSize],
	[fLength],
	[Condition],
	[HTreat],
	[ColdWork],
	[SalesNum],
	[ItemSO],
	[SOitem],
	[Spec],
	[PO],
	[OvenTemp],
	[Notes],
	[Tensile],
	[Yield],
	[Elongation],
	[Red_Area],
	[tLoc],
	[Rockwell],
	[BHN],
	[Tensile2],
	[Yield2],
	[Elongation2],
	[Red_Area2],
	[tLoc2],
	[Rockwell2],
	[BHN2],
	[Tensile3],
	[Yield3],
	[Elongation3],
	[red_area3],
	[tLoc3],
	[Rockwell3],
	[BHN3],
	[Tensile4],
	[Yield4],
	[Elongation4],
	[Red_Area4],
	[tLoc4],
	[Rockwell4],
	[BHN4],
	[Tensile5],
	[Yield5],
	[Elongation5],
	[Red_Area5],
	[tLoc5] ,
	[Rockwell5],
	[BHN5] ,
	[Tensile6] ,
	[Yield6],
	[Elongation6],
	[Red_Area6],
	[tLoc6],
	[Tensile7],
	[Yield7] ,
	[Elongation7],
	[Red_Area7] ,
	[tLoc7] ,
	[TestPO],
	[TestPOitem],
	[TestItemPO],
	[TestSent] ,
	[Lab] ,
	[Passed] ,
	[TestPO2],
	[TestPOitem2],
	[TestSent2],
	[Lab2],
	[Passed2],
	[CustomerMat],
	[Chart],
	[Minutes],
	[GFMp] ,
	[Ovenp],
	[cgp] ,
	[HTrockwell],
	[HTBHN] ,
	[ChartData],
	[SrvcPO] ,
	[LMA_Practice],
	[LMA_Procedure],
	[SpaceX],
	[ID] ,
	[WO] ,
	[WO_Detail] ,
	[Machine] ,
	[Oper],
	[ProjID], 
	[Who],
	[What],
	[When]
	)
   SELECT [AlloyName],
	[Heat],
	[Lot],
	[Date],
	[sPiece],
	[sSize],
	[sLength],
	[sWeight],
	[GfmSize],
	[fPiece],
	[fSize],
	[fLength],
	[Condition],
	[HTreat],
	[ColdWork],
	[SalesNum],
	[ItemSO],
	[SOitem],
	[Spec],
	[PO],
	[OvenTemp],
	[Notes],
	[Tensile],
	[Yield],
	[Elongation],
	[Red_Area],
	[tLoc],
	[Rockwell],
	[BHN],
	[Tensile2],
	[Yield2],
	[Elongation2],
	[Red_Area2],
	[tLoc2],
	[Rockwell2],
	[BHN2],
	[Tensile3],
	[Yield3],
	[Elongation3],
	[red_area3],
	[tLoc3],
	[Rockwell3],
	[BHN3],
	[Tensile4],
	[Yield4],
	[Elongation4],
	[Red_Area4],
	[tLoc4],
	[Rockwell4],
	[BHN4],
	[Tensile5],
	[Yield5],
	[Elongation5],
	[Red_Area5],
	[tLoc5] ,
	[Rockwell5],
	[BHN5] ,
	[Tensile6] ,
	[Yield6],
	[Elongation6],
	[Red_Area6],
	[tLoc6],
	[Tensile7],
	[Yield7] ,
	[Elongation7],
	[Red_Area7] ,
	[tLoc7] ,
	[TestPO],
	[TestPOitem],
	[TestItemPO],
	[TestSent] ,
	[Lab] ,
	[Passed] ,
	[TestPO2],
	[TestPOitem2],
	[TestSent2],
	[Lab2],
	[Passed2],
	[CustomerMat],
	[Chart],
	[Minutes],
	[GFMp] ,
	[Ovenp],
	[cgp] ,
	[HTrockwell],
	[HTBHN] ,
	[ChartData],
	[SrvcPO] ,
	[LMA_Practice],
	[LMA_Procedure],
	[SpaceX],
	[ID] ,
	[WO] ,
	[WO_Detail] ,
	[Machine] ,
	[Oper] ,
	[ProjID]
	,suser_sname()
	, ''Delete''
	, GETDATE() 
    FROM deleted
' 
GO
ALTER TABLE [dbo].[GFMlog] ENABLE TRIGGER [GFMlog DELETE history]
GO
/****** Object:  Trigger [dbo].[GFMlog_After_Update]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[GFMlog_After_Update]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.GFMlog_Update     ******/


CREATE TRIGGER [dbo].[GFMlog_After_Update] 
ON [dbo].[GFMlog] 
	AFTER UPDATE 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [GFMlog_After_Update]'';

DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()

IF UPDATE(Passed) 
	begin
	PRINT ''Update WO_Detail''
		
	UPDATE dbo.WorkOrder_Detail
		SET PassTest = inserted.Passed
		FROM inserted
		INNER JOIN dbo.WorkOrder_Detail WO_D ON inserted.WO_Detail = WO_D.WO_Detail
		WHERE WO_D.WO_Detail = inserted.WO_Detail
		AND WO_D.TestPO = inserted.TestPOitem
		AND ISNULL(inserted.Lot,0) > 0
		AND UPDATE(Passed);

	end


IF UPDATE(Passed) 
begin
	BEGIN TRY
	--Send Email
	
		DECLARE @Body varchar(4000)
		DECLARE @Lot	INT = 0
		DECLARE @SOitem	CHAR(10) = ''''
		DECLARE @TestPOitem CHAR(12) = ''''
		DECLARE @WorkOrder INT = 0
		DECLARE @WorkOrder_Detail INT = 0
		DECLARE @ProjID	INT = 0
		DECLARE @Descript VarChar(200) = ''''

		SELECT TOP 1 
			 @Lot = inserted.Lot
			,@SOitem = ISNULL(inserted.SOitem,'''')
			,@TestPOitem = ISNULL(inserted.TestPOitem,'''')
			,@WorkOrder = ISNULL(inserted.WO,0)
			,@WorkOrder_Detail = ISNULL(inserted.WO_Detail,0)
			,@ProjID = ISNULL(inserted.ProjID,0)
			,@Descript = ISNULL(RTRIM(Cast(inserted.fPiece AS CHAR(10)))+''pc ''+RTRIM(inserted.AlloyName)+'' ''+RTRIM(Cast(COALESCE(inserted.fSize,inserted.GFMsize) AS CHAR(10)))+'' Dia x ''+RTRIM(CAST( FLOOR(inserted.sWeight) AS CHAR(10)))+'' Pounds '' ,''No Description'')
			FROM inserted, deleted
			WHERE inserted.ID = deleted.ID
				AND ISNULL(inserted.Passed,0) = 1 
				AND ISNULL(deleted.Passed,0) = 0	--Pass is now True and was False
				AND ISNULL(inserted.Lot,0) > 0
				AND UPDATE(Passed);

		IF @Lot > 0
			begin
			--Found a Lot to Email
			PRINT ''LOT ''+CAST(@Lot AS CHAR(10));
			PRINT ''Descript ''+@Descript;

			PRINT '' Send a -Passed Lab Test- Email'';
		
			SET @Body = ''<!DOCTYPE html> <html><head><title>HPA Notice</title></head><body>''
			SET @Body = @Body + RTRIM(SUSER_SNAME())+'' updated the GFMlog ''+'' on ''+RTRIM(CAST(GETDATE()AS CHAR))
				+CHAR(10)+CHAR(13)+''<br>''+''GFM log test Passed for Lot: ''+CAST(@Lot AS CHAR(10)) +''<br>'';
		
			SET @Body = @Body+CHAR(13)+''<br>''+@Descript

			--SET @Body = @Body+CHAR(13)+''<br>''+''<a href="''+dbo.f_Reportlink_INT(''GFMlog'',@Lot) +''">GFM Lot: ''+LTRIM(RTRIM(@Lot))+''</a>''+''<br>'';
			SET @Body = @Body+CHAR(13)+''<br>''+dbo.f_HTML_link_GFM(@Lot)
		

			IF LEN(LTRIM(@SOitem))>6
				SET @Body = @Body+CHAR(13)+''<br>''+dbo.f_HTML_link_SOitem(@SOitem);
				--Alert SOitem SalesP
				--end

			IF @WorkOrder > 0
				SET @Body = @Body+CHAR(13)+''<br>''+dbo.f_HTML_link_WO(@WorkOrder);
				--Alert WO person
				--end

			IF @WorkOrder_Detail > 0
				SET @Body = @Body+CHAR(13)+''<br>''+dbo.f_HTML_link_WO_Detail(@WorkOrder_Detail);
				--Alert WO person for this WOD
				--end
			ELSE
				SET @Body = @Body+CHAR(13)+''<br>''+''No WorkOrder_Detail was found!''

			IF @ProjID > 0
				SET @Body = @Body+CHAR(13)+''<br>''+''<a href="''+dbo.f_Reportlink_INT(''ProjID'',@ProjID)+''"> ProjectID: ''+LTRIM(RTRIM(CAST(@ProjID AS CHAR)))+''</a>''+''<br>'';
				--Alert ProjID Person
				--end

			--@TestPOitem
			SET @Body = @Body+CHAR(13)+''<br>''+dbo.f_HTML_link_POitem(@TestPOitem);

			--Router
			SET @Body = @Body+CHAR(13)+''<br>''+''rtr''; --dbo.f_HTML_link_rtr(@rtr);

			--OT
			SET @Body = @Body+CHAR(13)+''<br>''+''Order Tracking''; --dbo.f_HTML_link_OT(@TrackID);



			SET @Body = @Body+CHAR(10)+CHAR(13)+''<br>'';
			SET @Body = @Body+CHAR(10)+CHAR(13)+''<br>'';
			SET @Body = @Body+''The accounting costing needs to be calculated.<br>'';
			SET @Body = @Body+CHAR(10)+CHAR(13)+''<br>'';
			SET @Body = @Body+CHAR(10)+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.GFMlog_After_Update '';
	
			SET @Body = @Body +''</body>+</HTML>''

			--PRINT @Body
			DECLARE @cSubjectEmail VARCHAR(250)
			SET @cSubjectEmail = ''GFM log ''+RTRIM(CAST(@Lot AS CHAR(10)))+'' test Passed''

			--IF @WorkOrder_Detail > 0	
				EXEC dbo.p_eMail_Send
					@FromEmail = @cEmailFrom, 
					@ToEmail = ''David.Kirchner@ERP_1s.com;ForgeManager@ERP_1s.com; production.costing@ERP_1s.com;'',
					@SubjectEmail = @cSubjectEmail,
					@BodyEmail = @Body,
					@BodyType = ''HTML''

			end
--Removed code block, This fires when inserted.Passed = 1 AND deleted.Passed = 1
/*		ELSE
			
			SELECT TOP 1 
				 @Lot = inserted.Lot
				,@SOitem = ISNULL(inserted.SOitem,'''')
				,@TestPOitem = ISNULL(inserted.TestPOitem,'''')
				,@WorkOrder = ISNULL(inserted.WO,0)
				,@WorkOrder_Detail = ISNULL(inserted.WO_Detail,0)
				,@ProjID = ISNULL(inserted.ProjID,0)
				,@Descript = ISNULL(RTRIM(Cast(inserted.fPiece AS CHAR(10)))+''pc ''+RTRIM(inserted.AlloyName)+'' ''+RTRIM(Cast(COALESCE(inserted.fSize,inserted.GFMsize) AS CHAR(10)))+'' Dia x ''+RTRIM(CAST( FLOOR(inserted.sWeight) AS CHAR(10)))+'' Pounds '' ,''No Description'')
				FROM inserted
				WHERE ISNULL(inserted.Lot,0) > 0
					AND UPDATE(Passed);
			
			IF @Lot>0
				begin
				SET @Body = RTRIM(SUSER_SNAME())+'' updated the GFMlog ''+'' on ''+RTRIM(CAST(GETDATE()AS CHAR))
					+CHAR(10)+CHAR(13)+''GFM log for Lot: ''+CAST(@Lot AS CHAR(10)) ;
				SET @Body = @Body+CHAR(13)+@Descript+CHAR(13);
				end
			ELSE
				SET @Body = RTRIM(SUSER_SNAME())+'' updated the GFMlog ''+'' on ''+RTRIM(CAST(GETDATE()AS CHAR))
				+CHAR(10)+CHAR(13)+''GFM log Lot not found ''

			SET @Body = @Body+CHAR(13)+CHAR(13)+''No records found in trigger GFMlog_After_Update WHERE:
	WHERE inserted.ID = deleted.ID
	AND inserted.Passed = 1 
	AND deleted.Passed = 0	--Pass is True and was False
	AND ISNULL(inserted.Lot,0) > 0
	AND UPDATE(Passed);''

			EXEC dbo.p_eMail_Send
				@FromEmail = @cEmailFrom, 
				@ToEmail = ''David.Kirchner@ERP_1s.com;'',
				@SubjectEmail = ''Failed to create text'',
				@BodyEmail = @Body,
				@BodyType = ''TEXT''
*/
	END TRY
	BEGIN CATCH
		EXEC dbo.p_eMail_Send
			@FromEmail = @cEmailFrom, 
			@ToEmail = ''David.Kirchner@ERP_1s.com;'',
			@SubjectEmail = ''Failed to create text'',
			@BodyEmail = ''Failed to create text in trigger GFMlog_After_Update'',
			@BodyType = ''TEXT''

	END CATCH;

/*	ELSE
	begin

	-- check for Pass is now False!
	-- Send Email

	SELECT TOP 1 
		 @Lot = inserted.Lot
		,@SOitem = ISNULL(inserted.SOitem,'''')
		,@TestPOitem = ISNULL(inserted.TestPOitem,'''')
		,@WorkOrder = ISNULL(inserted.WO,0)
		,@WorkOrder_Detail = ISNULL(inserted.WO_Detail,0)
		,@ProjID = ISNULL(inserted.ProjID,0)
		FROM inserted, deleted
		WHERE inserted.ID = deleted.ID
		AND inserted.Passed = 0 
		AND deleted.Passed = 1	--Pass was True and is now False
		AND ISNULL(inserted.Lot,0) > 0
--			AND ISNULL(inserted.WO_Detail,0)>0 	

		

	end
*/
	end


PRINT ''Trigger  End [GFMlog_After_Update]'';
' 
GO
ALTER TABLE [dbo].[GFMlog] ENABLE TRIGGER [GFMlog_After_Update]
GO
/****** Object:  Trigger [dbo].[GFMLog_Update]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[GFMLog_Update]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.Swage_Log_Update     ******/


CREATE TRIGGER [dbo].[GFMLog_Update] 
ON [dbo].[GFMlog] 
	FOR UPDATE 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [GFMLog_Update]'';

    
---big UPDATES are in error
DECLARE @Count int
SET @Count = @@ROWCOUNT;
   
IF @Count > 100
BEGIN
	RAISERROR(''Cannot UPDATE more than 100 records of dbo.Sales_No at one time. trigger GFMLog_Update'',16,1) 
	ROLLBACK TRANSACTION
	RETURN;
END
----------------------

PRINT ''Trigger  End [GFMLog_Update]'';
' 
GO
ALTER TABLE [dbo].[GFMlog] ENABLE TRIGGER [GFMLog_Update]
GO
/****** Object:  Trigger [dbo].[HT_Log_Update]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[HT_Log_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[HT_Log_Update] 
ON [dbo].[HT_log] 
	FOR UPDATE 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [HT_Log_Update]'';

    
---big UPDATES are in error
DECLARE @Count int
SET @Count = @@ROWCOUNT;
   
IF @Count > 1000
BEGIN
	RAISERROR(''Cannot UPDATE more than 1000 records of dbo.Sales_No at one time. trigger HT_Log_Update'',16,1) 
	ROLLBACK TRANSACTION
	RETURN;
END
----------------------

PRINT ''Trigger  End [HT_Log_Update]'';
' 
GO
ALTER TABLE [dbo].[HT_log] ENABLE TRIGGER [HT_Log_Update]
GO
/****** Object:  Trigger [dbo].[Invoice_Insert]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Invoice_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[Invoice_Insert]
   ON  [dbo].[Invoice_DEL] 
   FOR INSERT 
   NOT FOR REPLICATION
AS 
BEGIN

SET NOCOUNT ON;
		
IF EXISTS ( SELECT * FROM inserted WHERE inserted.SOitem NOT Like ''%-%'' )
	BEGIN

	DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
	DECLARE @Body varchar(4000)
	DECLARE @badSOitem CHAR(10)
	
	SELECT @Body = ''dbo.Invoice table was inserted and SOitem is not Proper,''+CHAR(13)
		
	SELECT TOP 1 @BadSoitem = soitem  FROM inserted WHERE inserted.SOitem NOT Like ''%-%''
	SET @Body = @Body+'' SO item:''+@BadSoitem +''.''
		+CHAR(13)+''User ''+RTRIM(suser_sname())+'' on ''+RTRIM(CAST(GETDATE()AS CHAR))
		+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.Invoice_Insert ''
		
	EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''Admin.Alerts@ERP_1s.com'', 
		 @SubjectEmail = ''BAD SOitem'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''
			 		
	SET @Body = ''Insert into dbo.Invoice table failed. SOitem:''+@BadSoitem+'' not Proper.''
	RAISERROR( @Body, 16, -1)

	END
END
' 
GO
ALTER TABLE [dbo].[Invoice_DEL] DISABLE TRIGGER [Invoice_Insert]
GO
/****** Object:  Trigger [dbo].[Invoice_Update]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Invoice_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[Invoice_Update]
   ON  [dbo].[Invoice_DEL] 
   FOR UPDATE 
   NOT FOR REPLICATION
AS 
BEGIN
	SET NOCOUNT ON;


	IF EXISTS ( SELECT * FROM inserted WHERE inserted.SOitem NOT Like ''%-%'' )
		BEGIN

		DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
		DECLARE @Body varchar(4000)
		DECLARE @badSOitem CHAR(10)
		
		SELECT @Body = ''dbo.Invoice table was inserted and SOitem is not Proper,''+CHAR(13)
		
		SELECT TOP 1 @BadSoitem = SOitem  FROM inserted WHERE inserted.SOitem NOT Like ''%-%''
		SET @Body = @Body+'' SO item:''+@BadSoitem+'' ''
		+CHAR(13)+''User ''+RTRIM(suser_sname())+'' on ''+RTRIM(CAST(GETDATE()AS CHAR))
		+@@SERVERNAME+'' TRIGGER Invoice_Update '' 
			
		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = ''Admin.Alerts@ERP_1s.com'', 
			 @SubjectEmail = ''BAD SOitem'',
			 @BodyEmail = @Body,
			 @BodyType = ''TEXT''
		
		SET @Body = ''Insert into dbo.Invoice table failed. SOitem:''+@BadSoitem+'' not Proper.''
		RAISERROR( @Body, 16, -1)

		END

END
' 
GO
ALTER TABLE [dbo].[Invoice_DEL] DISABLE TRIGGER [Invoice_Update]
GO
/****** Object:  Trigger [dbo].[Lading_Update]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Lading_Update]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.Swage_Log_Update     ******/


create TRIGGER [dbo].[Lading_Update] 
ON [dbo].[Lading] 
	FOR UPDATE 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [Lading_Update]'';

    
---big UPDATES are in error
DECLARE @Count int
SET @Count = @@ROWCOUNT;
   
IF @Count > 1000
BEGIN
	RAISERROR(''Cannot UPDATE more than 1000 records of dbo.Sales_No at one time. trigger Lading_Update'',16,1) 
	ROLLBACK TRANSACTION
	RETURN;
END
----------------------

PRINT ''Trigger  End [Lading_Update]'';
' 
GO
ALTER TABLE [dbo].[Lading] ENABLE TRIGGER [Lading_Update]
GO
/****** Object:  Trigger [dbo].[LakeErie_log DELETE history]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[LakeErie_log DELETE history]'))
EXEC dbo.sp_executesql @statement = N'Create TRIGGER [dbo].[LakeErie_log DELETE history] ON [dbo].[LakeErie_log] 
FOR DELETE 
--NOT FOR REPLICATION
AS

INSERT INTO dbo.Ar_LakeErie_log_hist 
	([AlloyName],
	[Heat],
	[Lot],
	[Date],
	[sPiece],
	[sSize],
	[sLength],
	[sWeight],
	[rollsize],
	[fPiece],
	[fSize],
	[fLength],
	[Condition],
	[HTreat],
	[ColdWork],
	[SalesNum],
	[ItemSO],
	[SOitem],
	[Spec],
	[PO],
	[OvenTemp],
	[Notes],
	[Tensile],
	[Yield],
	[Elongation],
	[Red_Area],
--	[tLoc],
	[Rockwell],
	[BHN],
	[Tensile2],
	[Yield2],
	[Elongation2],
	[Red_Area2],
--	[tLoc2],
	[Rockwell2],
	[BHN2],
	[Tensile3],
	[Yield3],
	[Elongation3],
	[red_area3],
--	[tLoc3],
	[Rockwell3],
	[BHN3],

	[TestPO],
	[TestPOitem],
	[TestItemPO],
	[TestSent] ,
	[Lab] ,
	[Passed] ,

	[CustomerMat],
	[Chart],
	[Minutes],

	[Ovenp],
	[cgp] ,
	[HTrockwell],
	[HTBHN] ,
	[ChartData],
	[SrvcPO] ,

	[ID] ,
	[WO] ,
	[WO_Detail] ,

	[Who],
	[What],
	[When]
	)
   SELECT [AlloyName],
	[Heat],
	[Lot],
	[Date],
	[sPiece],
	[sSize],
	[sLength],
	[sWeight],
	[rollsize],
	[fPiece],
	[fSize],
	[fLength],
	[Condition],
	[HTreat],
	[ColdWork],
	[SalesNum],
	[ItemSO],
	[SOitem],
	[Spec],
	[PO],
	[OvenTemp],
	[Notes],
	[Tensile],
	[Yield],
	[Elongation],
	[Red_Area],
--	[tLoc],
	[Rockwell],
	[BHN],
	[Tensile2],
	[Yield2],
	[Elongation2],
	[Red_Area2],
--	[tLoc2],
	[Rockwell2],
	[BHN2],
	[Tensile3],
	[Yield3],
	[Elongation3],
	[red_area3],
--	[tLoc3],
	[Rockwell3],
	[BHN3],

	[TestPO],
	[TestPOitem],
	[TestItemPO],
	[TestSent] ,
	[Lab] ,
	[Passed] ,

	[CustomerMat],
	[Chart],
	[Minutes],
	
	[Ovenp],
	[cgp] ,
	[HTrockwell],
	[HTBHN] ,
	[ChartData],
	[SrvcPO] ,

	[ID] ,
	[WO] ,
	[WO_Detail] 

	,suser_sname()
	, ''Delete''
	, GETDATE() 
    FROM deleted
' 
GO
ALTER TABLE [dbo].[LakeErie_log] ENABLE TRIGGER [LakeErie_log DELETE history]
GO
/****** Object:  Trigger [dbo].[LakeErie_log_Update]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[LakeErie_log_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[LakeErie_log_Update] 
ON [dbo].[LakeErie_log] 
	FOR UPDATE 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [LakeErie_log_Update]'';

    
---big UPDATES are in error
DECLARE @Count int
SET @Count = @@ROWCOUNT;
   
IF @Count > 1000
BEGIN
	RAISERROR(''Cannot UPDATE more than 1000 records of dbo.Sales_No at one time. trigger LakeErie_log_Update'',16,1) 
	ROLLBACK TRANSACTION
	RETURN;
END
----------------------

PRINT ''Trigger  End [LakeErie_log_Update]'';
' 
GO
ALTER TABLE [dbo].[LakeErie_log] ENABLE TRIGGER [LakeErie_log_Update]
GO

/****** Object:  StoredProcedure [dbo].[p_Maintenance_Daily]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_Maintenance_Daily]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_Maintenance_Daily] AS ' 
END
GO

ALTER PROCEDURE [dbo].[p_Maintenance_Daily]

AS

--EXEC dbo.p_Maintenance_Daily
--'SQL Server Agent \ Jobs \ [_ERP_1 Maintenance Daily]
--like Maintenace Plans: ERP_1 Backup saturday
--like _ERP_1 Weekly '
---------------------------------------------------------------------
/*
DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
DECLARE @Body varchar(4000)

PRINT 'p_Maintenance_Daily'

SELECT @Body = ('EXEC dbo.p_Maintenance_Daily '
	+CHAR(10)+CHAR(13)+'started on '+RTRIM(GETDATE())+'. '
	 +@@SERVERNAME+'. Agent Job _ERP_1 Maintenance Daily Summarize Sales Daily ERP_1 ' )
		

EXEC dbo.p_eMail_Send
	@FromEmail = @cEmailFrom, 
	@ToEmail = 'David.Kirchner@ERP_1s.com', 
	@SubjectEmail = 'p_Maintenance_Daily.',
	@BodyEmail = @Body,
	@BodyType = 'TEXT'
*/

------------------------------------------------------------------------
PRINT 'EXEC dbo.p_Maintenance_BrokerLst_Detail'
EXEC dbo.p_Maintenance_BrokerLst_Detail;

PRINT 'EXEC dbo.p_Maintenance_BrokerLst_Process'
EXEC dbo.p_Maintenance_BrokerLst_Process;

PRINT 'EXEC dbo.p_Maintenance_Failed_Email'
EXEC dbo.p_Maintenance_Failed_Email;

PRINT 'EXEC dbo.p_Maintenance_Process_Cancel'
EXEC dbo.p_Maintenance_Process_Cancel;

PRINT 'EXEC dbo.p_Maintenance_Process_Complete'
EXEC dbo.p_Maintenance_Process_Complete;

PRINT 'EXEC dbo.p_Maintenance_Process_Delivered'
EXEC dbo.p_Maintenance_Process_Delivered;

PRINT 'EXEC dbo.p_Maintenance_Sales_Cancel'
EXEC dbo.p_Maintenance_Sales_Cancel;

PRINT 'EXEC dbo.p_Maintenance_Sales_Complete'
EXEC dbo.p_Maintenance_Sales_Complete;

PRINT 'EXEC dbo.p_Maintenance_Sales_OnHold'
EXEC dbo.p_Maintenance_Sales_OnHold @Whn='Daily';

PRINT 'EXEC dbo.p_Maintenance_Sales_ItemTot'
--ItemTot needs to be fixed before other fixes!
EXEC dbo.p_Maintenance_Sales_ItemTot;

PRINT 'EXEC dbo.p_Maintenance_Sales_No_Quotes'
EXEC dbo.p_Maintenance_Sales_No_Quotes;

PRINT 'EXEC dbo.p_Maintenance_Sales_No_Ver'
EXEC dbo.p_Maintenance_Sales_No_Ver;

PRINT 'EXEC dbo.p_Maintenance_Sales_NoAddr'
--EXEC dbo.p_Maintenance_Sales_NoAddr

PRINT 'EXEC dbo.p_Maintenance_Sales_Quotes'
EXEC dbo.p_Maintenance_Sales_Quotes;

PRINT 'EXEC dbo.p_Maintenance_Sales_Summary'
EXEC dbo.p_Maintenance_Sales_Summary;

PRINT 'EXEC dbo.p_Maintenance_SalesNum_Quotes'
EXEC dbo.p_Maintenance_SalesNum_Quotes;

PRINT 'EXEC dbo.p_Maintenance_StockLst_Detail'
EXEC dbo.p_Maintenance_StockLst_Detail;

PRINT 'EXEC dbo.p_Maintenance_StockLst_Process'
EXEC dbo.p_Maintenance_StockLst_Process;
--now include deleting Quoted Process_ID

PRINT 'EXEC dbo.p_Maintenance_AQ_SalesNum_HPApo'
EXEC dbo.p_Maintenance_AQ_SalesNum_HPApo;

PRINT 'EXEC dbo.p_Maintenance_Router_rtr';
EXEC dbo.p_Maintenance_Router_rtr;

PRINT 'EXEC dbo.p_Maintenance_Purchase';
EXEC dbo.p_Maintenance_Purchase;

RETURN

--GRANT EXECUTE ON [dbo].[p_Maintenance_Daily] TO [WINDFALL\HPA]


/****** Object:  Trigger [dbo].[McMaster_Quotes_Update]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[McMaster_Quotes_Update]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[McMaster_Quotes_Update]
   ON [dbo].[McMaster_Quotes]
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	IF EXISTS( 
		SELECT inserted.ID FROM inserted 
			INNER JOIN deleted ON inserted.ID=deleted.ID 
			WHERE inserted.PriceBreak < deleted.PriceBreak 
			)
	begin
		PRINT ''TRIGGER dbo.McMaster_Quotes_Update''
		DECLARE @nID INT
		SELECT TOP 1 @nID = inserted.ID
			FROM inserted 
			INNER JOIN deleted ON inserted.ID=deleted.ID 
			WHERE inserted.PriceBreak < deleted.PriceBreak 

		PRINT ''ID that was to be a lower PriceBreak = ''+LTRIM(CAST( @nID AS CHAR(10) ))
	end

	/*
	IF EXISTS(
		SELECT ID FROM inserted  
		WHERE [Quote_LBS] = 9.99	
		AND ( 
			--  (form = ''10'' AND dbo.f_Get_Weight([FB_Min_PC],Alloy,''10'',CC,[PI_Diameter],[PI_Length],0,0)  + ([CutLossLbs]*[FB_Min_PC]) <	  22000	) OR   --2252.033
		  (form = ''40'' AND dbo.f_Get_Weight([FB_Min_PC],Alloy,''40'',CC,[PI_Thck],[PI_Width],[PI_Length],0) + ( [CutLossLbs]*[FB_Min_PC] ) <	  22000 )
		  )	)
	begin
		PRINT ''TRIGGER dbo.McMaster_Quotes_Update''
		PRINT ''form = 40 AND dbo.f_Get_Weight([FB_Min_PC],Alloy,40,CC,[PI_Thck],[PI_Width],[PI_Length],0) + ( [CutLossLbs]*[FB_Min_PC] ) <	  22000 ''
		PRINT ''SELECT * FROM Inserted WHERE form = ''''40'''' and [Quote_Lbs] < 100  AND dbo.f_Get_Weight([FB_Min_PC],Alloy,''''40'''',CC,[PI_Thck],[PI_Width],[PI_Length],0) + ( [CutLossLbs]*[FB_Min_PC] ) >	  2200 )''

		--THROW 51000, ''The record does not exist.'', 1;  

		RETURN 
	end
	*/
END
' 
GO
ALTER TABLE [dbo].[McMaster_Quotes] ENABLE TRIGGER [McMaster_Quotes_Update]
GO
/****** Object:  Trigger [dbo].[OT_After_Insert]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[OT_After_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[OT_After_Insert] 
ON [dbo].[OT] 
	AFTER Insert 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [OT_After_Insert]: '' + (CONVERT( VARCHAR(24), GETDATE(), 121));
/*  INSERT INTO [dbo].[OT]
  ( [OrderNumber] ,[JobID] ,[OrderTypeID] ) 
  SELECT [OrderNumber] ,[JobID] ,[OrderTypeID]
  FROM [dbo].[OT]
  WHERE TrackID= 34849

  SELECT * FROM dbo.rtr WHERE OType_Num = ''SI114312-01    ''

  INSERT INTO [dbo].[OT] ( [OrderNumber] ,[JobID] ,[OrderTypeID] ) VALUES 
  (1550,157,5) ;

 */

begin


	DECLARE @OType_Num CHAR(15);
	--DECLARE @SOitem CHAR(10);

	--SELECT @SOitem = dbo.f_ProperSOitem(inserted.OrderNumber) 
	--FROM inserted
	
	SELECT @OType_Num = dbo.f_rtr_OType_Num_OrderTypeID(inserted.[OrderTypeID],inserted.[OrderNumber])
	FROM inserted

	/*
	SELECT @OType_Num = (
		CONVERT([char](15),
			case when [OrderTypeID]=(1) then ''WO''+CONVERT([char](10),[OrderNumber]) 
			when [OrderTypeID]=(2) then ''SO''+CONVERT([char](10),[OrderNumber]) 
			when [OrderTypeID]=(3) then ''PI''+CONVERT([char](12),[OrderNumber]) 
			when [OrderTypeID]=(4) then ''SI''+CONVERT([char](10),[OrderNumber]) 
			when [OrderTypeID]=(5) then ''WD''+CONVERT([char](10),[OrderNumber]) 
			when [OrderTypeID]=(6) then ''MT''+CONVERT([char](10),[OrderNumber]) 
			when [OrderTypeID]=(7) then ''PO''+CONVERT([char](10),[OrderNumber]) 
			when [OrderTypeID]=(8) then ''RA''+CONVERT([char](10),[OrderNumber]) 
			when [OrderTypeID]=(9) then ''RD''+CONVERT([char](10),[OrderNumber]) else '''' end))
	FROM INSERTED
	*/

	PRINT ''Insert into RTR when does not exist in dbo.rtr: '' + (CONVERT( VARCHAR(24), GETDATE(), 121))


	--Somewhere dbo.rtr has an insert with SOitem, WO and WO_Detail all the same WO Detail number.
	-- could create a break if SOitem=WO and WO=WO_Detail to chatch problem

	-- Creating Problems
	--INSERT INTO dbo.rtr ( SOitem,WO,WO_Detail )
	--	SELECT 
	-- (CASE WHEN ISNULL(inserted.[OrderTypeID],0)=(4) THEN dbo.f_ProperSOitem(inserted.OrderNumber) ELSE '''' END) AS SOitem -- 01/04/2023 : Added to format Proper SOitem
	--,(CASE WHEN ISNULL(inserted.[OrderTypeID],0)=(1) THEN inserted.OrderNumber ELSE 0 END) AS WO
	--,(CASE WHEN ISNULL(inserted.[OrderTypeID],0)=(5) THEN inserted.OrderNumber ELSE 0 END) AS WO_Detail
	--	FROM inserted 
	--	--WHERE @OType_Num 
	--	WHERE dbo.f_rtr_OType_Num_OrderTypeID(inserted.[OrderTypeID],inserted.[OrderNumber])
	--		NOT IN (SELECT OType_Num FROM dbo.rtr WITH(NOLOCK) )
			
	
	PRINT ''Done with OT_After_Insert''

/*
IF ISNULL((SELECT COUNT(*) FROM dbo.rtr INNER JOIN inserted ON rtr.OType_Num = inserted.OType_Num ),0) > 0
	PRINT ''Found in RTR''
ELSE
	begin
	PRINT ''Insert into RTR''

	DECLARE @SOitem CHAR(10);
	DECLARE @WO INT;
	DECLARE @WO_Detail INT;

	DECLARE @OType_Num CHAR(15);

	DECLARE Cursor_RTR CURSOR
	FOR SELECT 
			CASE WHEN inserted.[OrderTypeID]=4 THEN inserted.OrderNumber ELSE '''' END AS SOitem
			,CASE WHEN inserted.[OrderTypeID]=1 THEN inserted.OrderNumber ELSE 0 END AS WO
			,CASE WHEN inserted.[OrderTypeID]=5 THEN inserted.OrderNumber ELSE 0 END AS WO_Detail
			,inserted.OType_Num
			FROM inserted 
			WHERE inserted.OType_Num NOT IN (SELECT OType_Num FROM dbo.rtr )
	
	OPEN Cursor_RTR;

	FETCH NEXT FROM Cursor_RTR INTO 
	    @SOitem,
		@WO,
		@WO_Detail,
		@OType_Num;
 
	WHILE @@FETCH_STATUS = 0
		BEGIN
			PRINT @OType_Num ;

			INSERT INTO dbo.rtr ( SOitem,WO,WO_Detail )
			 VALUES (@SOitem,@WO,@WO_Detail)


			--------------------------------------
			FETCH NEXT FROM Cursor_RTR INTO 
				@SOitem,
				@WO,
				@WO_Detail,
				@OType_Num;
		END;


	CLOSE Cursor_RTR;
	DEALLOCATE Cursor_RTR;


--	end
-----
*/

----
--Done with rtr

end


PRINT ''Trigger  End  [OT_After_Insert]: '' + (CONVERT( VARCHAR(24), GETDATE(), 121))
' 
GO
ALTER TABLE [dbo].[OT] ENABLE TRIGGER [OT_After_Insert]
GO
/****** Object:  Trigger [dbo].[OTJob_After_Insert]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[OTJob_After_Insert]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David Kirchner
-- Create date: <2020-02-12>
-- Description:	<use OT scaned data to fill rtr_Detail table>
-- Updated: 
-- =============================================
CREATE TRIGGER [dbo].[OTJob_After_Insert]
   ON  [dbo].[OT_Job]
   AFTER INSERT
AS 
BEGIN

	PRINT ''Trigger Start [OTJob_After_Insert]'';

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	INSERT INTO dbo.rtr_Operation
		([Operation],[jobType]) 
		(SELECT [Description],[Type]
		FROM inserted 
		join ERP_2.dbo.OT_Job_Class otjc on inserted.ClassId = otjc.ClassId
		WHERE ISNULL(inserted.[IsMachine],0) = 0 )
		--[jobClass]=otjc.[Name]
	PRINT ''Trigger  End  [OTJob_After_Insert]'';
END
' 

GO
--ALTER TABLE [dbo].[OT_Job] DISABLE TRIGGER [OT_Job_After_Insert]
GO



/****** Object:  Trigger [dbo].[OT_Times_After_Update]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[OT_Times_After_Update]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Brandon van de Venter
-- Create date: ???
-- Description:	<Description,,>
-- Updated: 02/24/2019
-- =============================================
CREATE TRIGGER [dbo].[OT_Times_After_Update]
   ON  [dbo].[OT_Times]
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @stopStatus int = (SELECT inserted.[Stop_StatusId] FROM inserted)
	DECLARE @trackID int = (SELECT inserted.[trackID] FROM inserted)
	DECLARE @endTime datetime = (SELECT inserted.[StopTime] FROM inserted)

	IF (@stopStatus is not null AND @endTime is not null AND @stopStatus = 4) -- ''finish''
	BEGIN
		IF not exists(select 1 from [dbo].[OT_Total] where [trackID] = @trackID and [StatusId] = @stopStatus)
		BEGIN
			insert into [dbo].[OT_Total] ([trackID], [OrderNumber], [StatusId], [jobDescription], [EmployeeId], [TotalMinutesOnJob], [JobEndTime], [Total Job Time])
			SELECT trackID, OrderNumber, [StatusId], [Description], EmployeeId, [Total Time], @endTime, [dbo].f_OT_GetTotalTime_Adv(trackID) FROM
			(
				SELECT distinct o.trackID
						, o.OrderNumber
						, (SELECT     TOP (1) Stop_StatusId
							FROM          ERP_2.dbo.OT_Times AS ott
							WHERE (trackID = o.trackID)
							ORDER BY StartTime DESC) AS [StatusId]
						, otj.[Description]
						, ote.EmployeeId
						,ERP_2.dbo.f_OT_GetTotalTime_Adv_Per_Employee(o.trackID, ote.EmployeeId) as [Total Time]
						--,ERP_2.dbo.f_OT_GetTotalTime_Adv(o.trackID) AS [Total Time]
				FROM ERP_2.dbo.OT AS o
					INNER JOIN ERP_2.dbo.OT_Job AS otj ON o.jobID = otj.jobID
					INNER JOIN ERP_2.dbo.OT_Times_Employees ote on ote.trackID = o.trackID
			) as inner_table
			WHERE [StatusId] = @stopStatus
			and trackID = @trackID
		END

		else if exists(select 1 from [dbo].[OT_Total] where [trackID] = @trackID and [StatusId] = @stopStatus)
		BEGIN
			update [dbo].[OT_Total]
			set [TotalMinutesOnJob] = ERP_2.dbo.f_OT_GetTotalTime_Adv_Per_Employee(@trackID, EmployeeId),
			[Total Job Time] = [dbo].f_OT_GetTotalTime_Adv(trackID)
			--set [TotalMinutesOnJob] = ERP_2.dbo.f_OT_GetTotalTime_Adv(@trackID)
			, [JobEndTime] = @endTime
			where trackID = @trackID and [StatusId] = @stopStatus
		END
	end	

    -- Insert statements for trigger here

END
' 
GO
ALTER TABLE [dbo].[OT_Times] ENABLE TRIGGER [OT_Times_After_Update]
GO
/****** Object:  Trigger [dbo].[OT_Times_Insert]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[OT_Times_Insert]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David Kirchner
-- Create date: ???
-- Description:	<Record to dbo.rtr_Detail,,>
-- Updated: 02/24/2020
-- =============================================
CREATE TRIGGER [dbo].[OT_Times_Insert]
   ON  [dbo].[OT_Times]
   AFTER Insert
	NOT FOR REPLICATION

AS 
BEGIN

-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
--SET NOCOUNT ON;

PRINT ''Trigger Start [OT_Times_Insert]: '' + (CONVERT( VARCHAR(24), GETDATE(), 121));

	--INSERT INTO dbo.rtr_Detail_OT (
	--	[rtr_ID]
	--	,[Detail]
	--	,[EstStart]
	--	,[Started]
	--	,[StartDate]
	--	,[EstFinish]
	--	,[Finished]
	--	,[FinishDate]
	--	,[Operation]
	--	,[Oper_ID]
	--	,[Oper_Note]
	--	,[TimeId]
	--	,[StartTime]
	--	,[Start_StatusId]
	--	,[StopTime]
	--	,[Stop_StatusId]
	--	,TrackId
	--	,JobID
	--	,OrderTypeID
	--)
	--SELECT dbo.f_rtrID_TrackID(inserted.TrackID) AS rtr_ID
	--	,dbo.f_rtr_StdDetail_Oper_ID(OJ.Oper_ID) AS Detail
	--	,inserted.[StartTime] AS [EstStart]
	--	,CASE WHEN ISNULL(O.OrderTypeID,0) = 1 THEN 1 ELSE 1 END AS [Started]
	--	,inserted.StartTime AS [StartDate]
	--	,CASE WHEN ISNULL(O.OrderTypeID,0) = 4 THEN inserted.[StopTime] ELSE '''' END AS [EstFinish]
	--	,CASE WHEN ISNULL(O.OrderTypeID,0) = 4 THEN 1 ELSE 0 END AS [Finished]
	--	,CASE WHEN ISNULL(O.OrderTypeID,0) = 4 THEN inserted.[StopTime] ELSE '''' END AS [FinishDate]
	--	,OJ.[Type] AS [Operation]
	--	,dbo.f_OT_Oper_ID_JobID(OJ.JobID) AS [Oper_ID]
	--	,OJ.[Description] AS [Oper_Note]
	--	,[TimeId]
	--	,[StartTime]
	--	,[Start_StatusId]
	--	,[StopTime]
	--	,[Stop_StatusId]
	--	,O.TrackID
	--	,O.JobID
	--	,O.OrderTypeID
	--FROM inserted
	--INNER JOIN dbo.OT O ON inserted.TrackID = O.TrackId
	--INNER JOIN dbo.OT_Job OJ ON O.JobID = OJ.JobId

PRINT ''Trigger  End  [OT_Times_Insert]: '' + (CONVERT( VARCHAR(24), GETDATE(), 121));

END' 
GO
ALTER TABLE [dbo].[OT_Times] ENABLE TRIGGER [OT_Times_Insert]
GO
/****** Object:  Trigger [dbo].[PackingSlip_After_Insert]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[PackingSlip_After_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[PackingSlip_After_Insert]
   ON  [dbo].[PackingSlip] 
   FOR INSERT 
   NOT FOR REPLICATION
AS 
BEGIN
	SET NOCOUNT ON;

	PRINT ''trigger start PackingSlip_After_Insert:'';

	IF UPDATE(SOitem)
	begin
		UPDATE dbo.Sales SET pckd=1 
			FROM inserted
			INNER JOIN dbo.PackingSlip ON inserted.SOitem = PackingSlip.SOitem
			WHERE Sales.pckd = 0
			AND inserted.Cancld = 0
			AND Sales.cncld = 0
		
	end

	PRINT ''trigger end  PackingSlip_After_Insert:'';

END
' 
GO
ALTER TABLE [dbo].[PackingSlip] ENABLE TRIGGER [PackingSlip_After_Insert]
GO
/****** Object:  Trigger [dbo].[PackingSlip_After_Update]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[PackingSlip_After_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[PackingSlip_After_Update]
   ON  [dbo].[PackingSlip] 
   AFTER UPDATE 
   NOT FOR REPLICATION
AS 
BEGIN

SET NOCOUNT ON;

PRINT ''trigger Start PackingSlip_after_Update:''

IF UPDATE(Cancld)
	begin
		
		PRINT ''Delete Cancelled PackingSlip from dbo.Sales_Detail.''

		DELETE FROM dbo.Sales_Detail
			FROM inserted 
			WHERE UPDATE(Cancld)
			AND inserted.Cancld = 1
			AND Sales_Detail.SOitem = inserted.SOitem
			AND Sales_Detail.PackingSli = inserted.PackingSli

	end

IF UPDATE(SOitem)
	begin
		UPDATE dbo.Sales SET pckd=1 
			FROM inserted
			INNER JOIN dbo.PackingSlip ON inserted.SOitem = PackingSlip.SOitem
			WHERE Sales.pckd = 0
			AND inserted.Cancld = 0
			AND Sales.cncld = 0
		
	end

PRINT ''trigger End PackingSlip_after_Update:''

end
' 
GO
ALTER TABLE [dbo].[PackingSlip] ENABLE TRIGGER [PackingSlip_After_Update]
GO
/****** Object:  Trigger [dbo].[PackingSlip_Delete]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[PackingSlip_Delete]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[PackingSlip_Delete] 
ON [dbo].[PackingSlip] 
	FOR DELETE
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [PackingSlip_Delete]'';

RAISERROR(''Cannot DELETE from dbo.PackingSlip. trigger PackingSlip_Delete'',16,1) 
ROLLBACK TRANSACTION
RETURN;

----------------------

PRINT '' INSERT dbo.Ar_PackingSlip_Delete'';

INSERT dbo.Ar_PackingSlip
	(	[Who2], [What],[When],
		[packingsli]

      ,[PCs]
      ,[Descript]
      ,[SOitem]
      ,[PackedWeight]
      ,[PO_Num]
      ,[Heat]
      ,[Weight]
      ,[Kg]
      ,[Alloy]
      ,[PartNo]
      ,[Id]
      ,[Peach]
      ,[Cancld]
      ,[SOitem_cmplt]
      ,[Reconciled]
      ,[Sales_Detail_ID]
      ,[ID_PackingSlip]
      ,[WhenAdd]
      ,[First_RSO]
      ,[PT_QTY]
      ,[SO_QTY]
      ,[PT_P]
	 )

SELECT suser_sname() AS [Who2],
	''DELETE'' AS [What],
	GETDATE() AS [When],
		[packingsli]
      ,[PCs]
      ,[Descript]
      ,[SOitem]
      ,[PackedWeight]
      ,[PO_Num]
      ,[Heat]
      ,[Weight]
      ,[Kg]
      ,[Alloy]
      ,[PartNo]
      ,[Id]
      ,[Peach]
      ,[Cancld]
      ,[SOitem_cmplt]
      ,[Reconciled]
      ,[Sales_Detail_ID]
      ,[ID_PackingSlip]
      ,[WhenAdd]
      ,[First_RSO]
      ,[PT_QTY]
      ,[SO_QTY]
      ,[PT_P]
  FROM Deleted
' 
GO
ALTER TABLE [dbo].[PackingSlip] ENABLE TRIGGER [PackingSlip_Delete]
GO
/****** Object:  Trigger [dbo].[packingslip_Insert]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[packingslip_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[packingslip_Insert]
   ON  [dbo].[PackingSlip] 
   FOR INSERT 
   NOT FOR REPLICATION
AS 
BEGIN
	SET NOCOUNT ON;
		
	IF EXISTS ( SELECT * FROM inserted WHERE SUBSTRING(SOitem,1,7) Like ''%-%'')
		BEGIN

		DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
		DECLARE @Body varchar(4000)
		DECLARE @badSOitem CHAR(10)
		
		SELECT @Body = ''Cannot insert to dbo.Packingslip, SOitem is not Proper,''+CHAR(13)
		
		SELECT TOP 1 @BadSoitem = soitem  FROM inserted WHERE SUBSTRING(SOitem,1,7) Like ''%-%''
		SET @Body = @Body+'' SO item:''+@BadSoitem+''. ''
			+CHAR(13)+@@SERVERNAME+'' TRIGGER dbo.packingSlip_Insert '' 
			
		EXEC dbo.p_eMail_Send
			@FromEmail = @cEmailFrom, 
			@ToEmail = ''Admin.Alerts@ERP_1s.com'', 
			@SubjectEmail = ''BAD SOitem.'',
			@BodyEmail = @Body,
			@BodyType = ''TEXT''
		 						
		SET @Body = ''Insert into dbo.Packingslip table failed. SOitem:''+@BadSoitem+'' not Proper.''
		RAISERROR( @Body, 16, -1)

		END
END
' 
GO
ALTER TABLE [dbo].[PackingSlip] ENABLE TRIGGER [packingslip_Insert]
GO
/****** Object:  Trigger [dbo].[PackingSlip_Update]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[PackingSlip_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[PackingSlip_Update]
   ON  [dbo].[PackingSlip] 
   FOR UPDATE 
   NOT FOR REPLICATION
AS 
BEGIN
	SET NOCOUNT ON;
		
	IF EXISTS ( SELECT * FROM inserted WHERE SUBSTRING(SOitem,1,7) Like ''%-%'')
		BEGIN
		DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
		DECLARE @Body varchar(4000)
		DECLARE @badSOitem CHAR(10)
		
		SELECT @Body = ''Cannot update dbo.Packingslip, SOitem is not Proper,''+CHAR(13)
		
		SELECT TOP 1 @BadSoitem = soitem  FROM inserted WHERE SUBSTRING(SOitem,1,7) Like ''%-%''
		SET @Body = @Body+'' SO item:''+@BadSoitem+'', ''+@@SERVERNAME+'' TRIGGER dbo.packingSlip_Update '' 
			
		EXEC dbo.p_eMail_Send
			@FromEmail = @cEmailFrom, 
			@ToEmail = ''Admin.Alerts@ERP_1s.com'', 
			@SubjectEmail = ''BAD SOitem.'',
			@BodyEmail = @Body,
			@BodyType = ''TEXT''
		 						
		SET @Body = ''Update dbo.Packingslip table failed. SOitem:''+@BadSoitem+'' not Proper.''
		RAISERROR( @Body, 16, -1)

		END
END

-------------------------

PRINT '' INSERT dbo.Ar_PackingSlip_Update'';

INSERT dbo.Ar_PackingSlip
	(	[Who2], [What],[When],
		[packingsli]
      ,[PCs]
      ,[Descript]
      ,[SOitem]
      ,[PackedWeight]
      ,[PO_Num]
      ,[Heat]
      ,[Weight]
      ,[Kg]
      ,[Alloy]
      ,[PartNo]
      ,[Id]
      ,[Peach]
      ,[Cancld]
      ,[SOitem_cmplt]
      ,[Reconciled]
      ,[Sales_Detail_ID]
      ,[ID_PackingSlip]
      ,[WhenAdd]
      ,[First_RSO]
      ,[PT_QTY]
      ,[SO_QTY]
      ,[PT_P]
	 )

SELECT suser_sname() AS [Who2],
	''UPDATE'' AS [What],
	GETDATE() AS [When],
		[packingsli]
      ,[PCs]
      ,[Descript]
      ,[SOitem]
      ,[PackedWeight]
      ,[PO_Num]
      ,[Heat]
      ,[Weight]
      ,[Kg]
      ,[Alloy]
      ,[PartNo]
      ,[Id]
      ,[Peach]
      ,[Cancld]
      ,[SOitem_cmplt]
      ,[Reconciled]
      ,[Sales_Detail_ID]
      ,[ID_PackingSlip]
      ,[WhenAdd]
      ,[First_RSO]
      ,[PT_QTY]
      ,[SO_QTY]
      ,[PT_P]
  FROM Deleted

  PRINT '' INSERT dbo.Ar_PackingSlip_Update'';
' 
GO
ALTER TABLE [dbo].[PackingSlip] ENABLE TRIGGER [PackingSlip_Update]
GO
/****** Object:  Trigger [dbo].[PackingSlip_No_After_Update]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[PackingSlip_No_After_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[PackingSlip_No_After_Update] 
ON [dbo].[PackingSlip_No] 
	AFTER UPDATE 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [PackingSlip_No_After_Update]'';



IF  UPDATE(RSO_Date) 
begin
	

	PRINT '' UPDATE dbo.PackingSlip_No   [PackingSlip_No_After_Update]'';

	UPDATE dbo.PackingSlip
		SET [First_RSO] = RSO_Date
		FROM inserted
			INNER JOIN dbo.PackingSlip ON inserted.packingsli = PackingSlip.Packingsli
		WHERE UPDATE(RSO_Date) 
			AND PackingSlip.First_RSO IS NULL

end


PRINT ''Trigger  End  [PackingSlip_No_After_Update]'';

/*
UPDATE dbo.PackingSlip_No SET RSO_Date = GetDate() WHERE packingsli = 79588

SELECT * FROM dbo.PackingSlip_No 
WHERE packingsli = 79588
--order by PS_Date DESC

SELECT * FROM dbo.PackingSlip
WHERE packingsli = 79588
*/
' 
GO
ALTER TABLE [dbo].[PackingSlip_No] ENABLE TRIGGER [PackingSlip_No_After_Update]
GO
/****** Object:  Trigger [dbo].[PackingSlip_No_Delete]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[PackingSlip_No_Delete]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[PackingSlip_No_Delete] 
ON [dbo].[PackingSlip_No] 
	FOR DELETE
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [PackingSlip_No_Delete]'';

/*
RAISERROR(''Cannot DELETE from dbo.PackingSlip_No. trigger PackingSlip_No_Delete'',16,1) 
ROLLBACK TRANSACTION
RETURN;
*/
----------------------

PRINT '' INSERT dbo.Ar_PackingSlip_No_Delete'';
INSERT dbo.Ar_PackingSlip_No 
	(	[Who2], [What],[When],
	[packingsli],
	[ps_date],
	[shipcode],
	[soldcode],
	[bill3code],
	[packedby],
	[checkedby],
	[carton],
	[totalweight],
	[Kg],
	[shippedvia],
	[all_po],
	[all_so],
	[tracking],
	[freightcharge],
	[dutytax],
	[cod],
	[codcheck],
	[codfreightfee],
	[box_size],
	[packedweight],
	[RSO_Date],
	[PickUpDate],
	[HoldReason],
	[WHO]  )
SELECT suser_sname() AS [Who2],
	''DELETE'' AS [What],
	GETDATE() AS [When],
	[packingsli],
	[ps_date],
	[shipcode],
	[soldcode],
	[bill3code],
	[packedby],
	[checkedby],
	[carton],
	[totalweight],
	[Kg],
	[shippedvia],
	[all_po],
	[all_so],
	[tracking],
	[freightcharge],
	[dutytax],
	[cod],
	[codcheck],
	[codfreightfee],
	[box_size],
	[packedweight],
	[RSO_Date],
	[PickUpDate],
	'''' AS [HoldReason],
	[WHO]
 FROM Deleted
' 
GO
ALTER TABLE [dbo].[PackingSlip_No] ENABLE TRIGGER [PackingSlip_No_Delete]
GO
/****** Object:  Trigger [dbo].[PO_No_Update]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[PO_No_Update]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.StockLst_Process_Delete    Script Date: 11/30/2005 3:54:44 PM ******/
CREATE  TRIGGER [dbo].[PO_No_Update] ON [dbo].[PO_No] 
	FOR UPDATE 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [PO_No_Update]'';

IF UPDATE(Cancelled)
begin
	DECLARE @Mess1 VARCHAR(254)
	DECLARE @cProgram VarChar(60)
	
	SET @Mess1 = ''''
	SET @cProgram = ''TRIGGER dbo.PO_No_Update''
	
	IF UPDATE(Cancelled)
		begin

		PRINT ''Found updated Cancelled record''
		PRINT ''Insert Cancel in User Track''

		SELECT TOP 1 @Mess1 = LTRIM(CAST(ISNULL(inserted.HPAPO,0) AS CHAR(10)))
		FROM inserted 
		WHERE ISNULL(inserted.Cancelled,0) = 1
		AND UPDATE(Cancelled)
		
		IF LEN(@Mess1) > 0	 
			SET @Mess1 = ''Po_No Cancelled for HPA PO '' + @Mess1
	
		IF LEN(@Mess1) > 0	 
			INSERT dbo.NR_UserTrack	(Mess1,cProgram) VALUES (LEFT(@Mess1,1024),LEFT(@cProgram,100));
		end
		
end

IF UPDATE(PO_Rev)

begin
	
	PRINT ''Found updated PO_Rev record''
	PRINT ''Update Amendment number in PurchaseOrder table''

	UPDATE dbo.PurchaseOrder SET Amendment = inserted.PO_Rev
		FROM inserted
		INNER JOIN PurchaseOrder ON inserted.HPAPO = PurchaseOrder.HPApo
		WHERE ISNULL(inserted.PO_Rev,0) > 0

end

PRINT ''Trigger  End  [PO_No_Update]'';
' 
GO
ALTER TABLE [dbo].[PO_No] ENABLE TRIGGER [PO_No_Update]
GO
/****** Object:  Trigger [dbo].[PO_ProcessNotes_Insert]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[PO_ProcessNotes_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[PO_ProcessNotes_Insert]
   ON  [dbo].[PO_ProcessNotes] 
   FOR INSERT 
   NOT FOR REPLICATION
AS 
BEGIN
	SET NOCOUNT ON;
		
	IF EXISTS ( SELECT * FROM inserted WHERE SUBSTRING(POitem,1,9) Like ''%-%'')
		BEGIN
		DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
		DECLARE @Body varchar(4000)
		DECLARE @badSOitem CHAR(10)
		
		SELECT @Body = ''Cannot insert to dbo.PO_ProcessNotes, SOitem is not Proper,''+CHAR(13)
		
		SELECT TOP 1 @BadSoitem = POitem  FROM inserted WHERE SUBSTRING(POitem,1,9) Like ''%-%''
		SET @Body = @Body+'' PO item:''+@BadSoitem +''.''
			+CHAR(13)+@@SERVERNAME+'' TRIGGER dbo.pO_ProcessNotes_Insert '' 
			
		EXEC dbo.p_eMail_Send
			@FromEmail = @cEmailFrom, 
			@ToEmail = ''Admin.Alerts@ERP_1s.com'', 
			@SubjectEmail = ''BAD POitem.'',
			@BodyEmail = @Body,
			@BodyType = ''TEXT''
		 						
		SET @Body = ''Insert into dbo.PO_ProcessNotes table failed. POitem:''+@BadSoitem+'' not Proper.''
		RAISERROR( @Body, 16, -1)

		END
END
' 
GO
ALTER TABLE [dbo].[PO_ProcessNotes] ENABLE TRIGGER [PO_ProcessNotes_Insert]
GO
/****** Object:  Trigger [dbo].[PO_ProcessNotes_Update]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[PO_ProcessNotes_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[PO_ProcessNotes_Update]
   ON  [dbo].[PO_ProcessNotes] 
   FOR UPDATE 
   NOT FOR REPLICATION
AS 
BEGIN
	SET NOCOUNT ON;
		
	IF EXISTS ( SELECT * FROM inserted WHERE SUBSTRING(POitem,1,9) Like ''%-%'')
		BEGIN
		DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
		DECLARE @Body varchar(4000)
		DECLARE @badSOitem CHAR(10)
		
		SELECT @Body = ''Cannot update dbo.PO_ProcessNotes, POitem is not Proper,''+CHAR(13)
		
		SELECT TOP 1 @BadSoitem = POitem  FROM inserted WHERE SUBSTRING(POitem,1,9) Like ''%-%''
		SET @Body = @Body+'' PO item:''+@BadSoitem +''.''
			+CHAR(13)+@@SERVERNAME+'' TRIGGER dbo.pO_ProcessNotes_Update '' 
			
		EXEC dbo.p_eMail_Send
			@FromEmail = @cEmailFrom, 
			@ToEmail = ''Admin.Alerts@ERP_1s.com'', 
			@SubjectEmail = ''BAD POitem.'',
			@BodyEmail = @Body,
			@BodyType = ''TEXT''
		 				
		SET @Body = ''Update dbo.PO_ProcessNotes table failed. POitem:''+@BadSoitem+'' not Proper.''
		RAISERROR( @Body, 16, -1)

		END
END
' 
GO
ALTER TABLE [dbo].[PO_ProcessNotes] ENABLE TRIGGER [PO_ProcessNotes_Update]
GO
/****** Object:  Trigger [dbo].[PO_Testing_Insert]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[PO_Testing_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[PO_Testing_Insert]
   ON  [dbo].[PO_Testing] 
   FOR INSERT 
   NOT FOR REPLICATION
AS 
BEGIN
	SET NOCOUNT ON;
		
	IF EXISTS ( SELECT * FROM inserted WHERE SUBSTRING(POitem,1,9) Like ''%-%'')
		BEGIN

		DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
		DECLARE @Body varchar(4000)
		DECLARE @badSOitem CHAR(10)
		
		SELECT @Body = ''Cannot insert to dbo.PO_Testing, SOitem is not Proper,''+CHAR(13)
		
		SELECT TOP 1 @BadSoitem = POitem  FROM inserted WHERE SUBSTRING(POitem,1,9) Like ''%-%''
		SET @Body = @Body+'' PO item:''+@BadSoitem +''.''
			+CHAR(13)+@@SERVERNAME+'' TRIGGER dbo.pO_PO_Testing_Insert '' 
			
		EXEC dbo.p_eMail_Send
			@FromEmail = @cEmailFrom, 
			@ToEmail = ''Admin.Alerts@ERP_1s.com'', 
			@SubjectEmail = ''BAD POitem.'',
			@BodyEmail = @Body,
			@BodyType = ''TEXT''
		 		
		SET @Body = ''Insert into dbo.PO_Testing table failed. POitem:''+@BadSoitem+'' not Proper.''
		RAISERROR( @Body, 16, -1)

		END
END
' 
GO
ALTER TABLE [dbo].[PO_Testing] ENABLE TRIGGER [PO_Testing_Insert]
GO
/****** Object:  Trigger [dbo].[PO_Testing_Update]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[PO_Testing_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[PO_Testing_Update]
   ON  [dbo].[PO_Testing] 
   FOR UPDATE 
   NOT FOR REPLICATION
AS 
BEGIN
	SET NOCOUNT ON;
		
	IF EXISTS ( SELECT * FROM inserted WHERE SUBSTRING(POitem,1,9) Like ''%-%'' )
		BEGIN
		DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
		DECLARE @Body varchar(4000)
		DECLARE @badSOitem CHAR(10)
		
		SELECT @Body = ''Cannot update dbo.PO_Testing, POitem is not Proper,''+CHAR(13)
		
		SELECT TOP 1 @BadSoitem = POitem  FROM inserted WHERE SUBSTRING(POitem,1,9) Like ''%-%''
		SET @Body = @Body+'' PO item:''+@BadSoitem+''.''
			+CHAR(13)+@@SERVERNAME+'' TRIGGER dbo.pO_Testing_Update '' 
			
		EXEC dbo.p_eMail_Send
			@FromEmail = @cEmailFrom, 
			@ToEmail = ''Admin.Alerts@ERP_1s.com'', 
			@SubjectEmail = ''BAD POitem.'',
			@BodyEmail = @Body,
			@BodyType = ''TEXT''
		 				
		SET @Body = ''Update dbo.PO_Testing table failed. POitem:''+@BadSoitem+'' not Proper.''
		RAISERROR( @Body, 16, -1)

		END
END
' 
GO
ALTER TABLE [dbo].[PO_Testing] ENABLE TRIGGER [PO_Testing_Update]
GO
/****** Object:  Trigger [dbo].[pricetable DELETE history]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[pricetable DELETE history]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[pricetable DELETE history] ON [dbo].[PriceTable] 
FOR DELETE 
--NOT FOR REPLICATION
AS

/*
DECLARE @Count int
SET @Count = @@ROWCOUNT;
 
IF @Count >= (SELECT SUM(row_count)
    FROM sys.dm_db_partition_stats 
    WHERE OBJECT_ID = OBJECT_ID(''pricetable'' ) 
    AND index_id = 1)
BEGIN
    RAISERROR(''Cannot delete all rows'',16,1) 
    ROLLBACK TRANSACTION
    RETURN;
END
*/     
     INSERT INTO dbo.Ar_pricetable_hist 
	 ([pt_id],[alloy],[form],[cc],[thk],[size],[size2],[size3]
      ,[w0],[w5],[w10],[w25],[w50],[w100],[w200],[w500],[w1000],[w2000],[wBASE]
      ,[activepric],[lastedit],[username],[zalloy],[item_code]
      
	  ,[h0],[h5],[h10],[h25],[h50],[h100],[h200],[h500],[h1000],[h2000],[hbase]
      
      ,[hist],[commspec],[Who],[What],[When])
   SELECT [pt_id],[alloy],[form],[cc],[thk],[size],[size2],[size3]
      ,[w0],[w5],[w10],[w25],[w50],[w100],[w200],[w500],[w1000],[w2000],[wBASE]
      ,[activepric],[lastedit],[username],[zalloy],CAST(NULL AS char(13))
      
	  ,[h0],[h5],[h10],[h25],[h50],[h100],[h200],[h500],[h1000],[h2000],[hbase]
      
      ,[hist],[commspec],suser_sname(), ''Delete'', GETDATE() 
       FROM deleted
' 
GO
ALTER TABLE [dbo].[PriceTable] ENABLE TRIGGER [pricetable DELETE history]
GO
/****** Object:  Trigger [dbo].[pricetable INSERT history]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[pricetable INSERT history]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[pricetable INSERT history] ON [dbo].[PriceTable] 
FOR INSERT 
--NOT FOR REPLICATION
AS

INSERT INTO dbo.Ar_pricetable_hist 
	 ([pt_id],[alloy],[form],[cc],[thk],[size],[size2],[size3]
      ,[w0],[w5],[w10],[w25],[w50],[w100],[w200],[w500],[w1000],[w2000],[wBASE]
      ,[activepric],[lastedit],[username],[zalloy],[item_code]
      ,[h0],[h5],[h10],[h25],[h50],[h100],[h200],[h500],[h1000],[h2000],[hbase]
      ,[hist],[commspec],[Who],[What],[When])
   SELECT [pt_id],[alloy],[form],[cc],[thk],[size],[size2],[size3]
      ,[w0],[w5],[w10],[w25],[w50],[w100],[w200],[w500],[w1000],[w2000],[wBASE]
      ,[activepric],[lastedit],[username],[zalloy],CAST(NULL AS char(13))
      ,[h0],[h5],[h10],[h25],[h50],[h100],[h200],[h500],[h1000],[h2000],[hbase]
      ,[hist],[commspec],suser_sname(), ''INSERT'', GETDATE() 
       FROM inserted
' 
GO
ALTER TABLE [dbo].[PriceTable] ENABLE TRIGGER [pricetable INSERT history]
GO
/****** Object:  Trigger [dbo].[pricetable UPDATE history]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[pricetable UPDATE history]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[pricetable UPDATE history] ON [dbo].[PriceTable] 
FOR UPDATE 
--NOT FOR REPLICATION
AS
--UPDATE [dbo].[pricetable] SET 
--   SELECT *, suser_sname() AS [username], GETDATE() AS [lastedit]  FROM inserted

IF  UPDATE([alloy])
	OR UPDATE([form])
	OR UPDATE([cc])
	OR UPDATE([thk])
	OR UPDATE([size])
	OR UPDATE([size2])
	OR UPDATE([size3])
	OR UPDATE([w0])
	OR UPDATE([w5])
	OR UPDATE([w10])
	OR UPDATE([w25])
	OR UPDATE([w50])
	OR UPDATE([w100])
	OR UPDATE([w200])
	OR UPDATE([w500])
	OR UPDATE([w1000])
	OR UPDATE([w2000])
	OR UPDATE([wBASE])
	OR UPDATE([activepric])
	OR UPDATE([costCurr])
	
begin	
	INSERT INTO dbo.Ar_Pricetable_Hist 
		 ([pt_id],[alloy],[form],[cc],[thk],[size],[size2],[size3]
		  ,[w0],[w5],[w10],[w25],[w50],[w100],[w200],[w500],[w1000],[w2000],[wBASE]
		  ,[activepric],[lastedit],[username],[zalloy],[item_code]
		  
		  ,[h0],[h5],[h10],[h25],[h50],[h100],[h200],[h500],[h1000],[h2000],[hbase]
		  
		  ,[hist],[commspec],[Who],[What],[When])
	   SELECT [pt_id],[alloy],[form],[cc],[thk],[size],[size2],[size3]
		  ,[w0],[w5],[w10],[w25],[w50],[w100],[w200],[w500],[w1000],[w2000],[wBASE]
		  ,[activepric],[lastedit],[username],[zalloy],CAST(NULL AS char(13))
		  
		  ,[h0],[h5],[h10],[h25],[h50],[h100],[h200],[h500],[h1000],[h2000],[hbase]
		  
		  ,[hist],[commspec],suser_sname(), ''Insert UPD'',GETDATE() 
		   FROM inserted

	INSERT INTO dbo.Ar_pricetable_hist 
		 ([pt_id],[alloy],[form],[cc],[thk],[size],[size2],[size3]
		  ,[w0],[w5],[w10],[w25],[w50],[w100],[w200],[w500],[w1000],[w2000],[wBASE]
		  ,[activepric],[lastedit],[username],[zalloy],[item_code]
		  
		  ,[h0],[h5],[h10],[h25],[h50],[h100],[h200],[h500],[h1000],[h2000],[hbase]
		  
		  ,[hist],[commspec],[Who],[What],[When])
	   SELECT [pt_id],[alloy],[form],[cc],[thk],[size],[size2],[size3]
		  ,[w0],[w5],[w10],[w25],[w50],[w100],[w200],[w500],[w1000],[w2000],[wBASE]
		  ,[activepric],[lastedit],[username],[zalloy],CAST(NULL AS char(13))
		  
		  ,[h0],[h5],[h10],[h25],[h50],[h100],[h200],[h500],[h1000],[h2000],[hbase]
		  
		  ,[hist],[commspec],suser_sname(), ''Delete UPD'', GETDATE() 
		   FROM deleted
end

--SELECT Distinct CAST(ISNULL(thk,'''') AS DECIMAL(9,3)) AS Thck INTO dbo.StandardSize FROM deleted
' 
GO
ALTER TABLE [dbo].[PriceTable] ENABLE TRIGGER [pricetable UPDATE history]
GO
/****** Object:  Trigger [dbo].[PriceTable_After_Update]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[PriceTable_After_Update]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.StockLst_Process_Delete    Script Date: 11/30/2005 3:54:44 PM ******/
CREATE TRIGGER [dbo].[PriceTable_After_Update] ON [dbo].[PriceTable] 
AFTER UPDATE 
NOT FOR REPLICATION
AS


IF  UPDATE([alloy])
	OR UPDATE([form])
	OR UPDATE([cc])
	OR UPDATE([size])
	OR UPDATE([size2])
	OR UPDATE([size3])
	OR UPDATE([w0])
	OR UPDATE([w5])
	OR UPDATE([w10])
	OR UPDATE([w25])
	OR UPDATE([w50])
	OR UPDATE([w100])
	OR UPDATE([w200])
	OR UPDATE([w500])
	OR UPDATE([w1000])
	OR UPDATE([w2000])
	OR UPDATE([wBASE])
	OR UPDATE([activepric])
begin	
UPDATE dbo.PriceTable SET UserName = (left(suser_sname(),(20))), LastEdit = GETDATE()
	FROM inserted
	WHERE PriceTable.pt_id = inserted.pt_id
	
end
' 
GO
ALTER TABLE [dbo].[PriceTable] ENABLE TRIGGER [PriceTable_After_Update]
GO
/****** Object:  Trigger [dbo].[Production_Delete]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Production_Delete]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.Production    Script Date: 7/1/2004 1:57:08 PM ******/


CreATE TRIGGER [dbo].[Production_Delete] ON [dbo].[Production]
FOR DELETE NOT FOR REPLICATION
AS

PRINT ''trigger start Production_Delete:'';

---big deletes are in error
DECLARE @Count int
SET @Count = @@ROWCOUNT;
    
IF @Count > 100
BEGIN
    RAISERROR(''Cannot DELETE more than 100 records of dbo.Production at one time. trigger Production_Delete'',16,1) 
    ROLLBACK TRANSACTION
    RETURN;
END
----------------------
PRINT ''trigger start Production_Delete:'';

PRINT ''trigger end  Production_Delete:'';
' 
GO
ALTER TABLE [dbo].[Production] ENABLE TRIGGER [Production_Delete]
GO
/****** Object:  Trigger [dbo].[Production_Update]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Production_Update]'))
EXEC dbo.sp_executesql @statement = N'create TRIGGER [dbo].[Production_Update]
   ON  [dbo].[Production] 
   FOR UPDATE 
   --NOT FOR REPLICATION
AS 
BEGIN

	SET NOCOUNT ON;

	PRINT ''trigger start Production_Update:'';

	
	---big UPDATES are in error
	DECLARE @Count int
	SET @Count = @@ROWCOUNT;
    
	IF @Count > 100
	BEGIN
		RAISERROR(''Cannot UPDATE more than 100 records of dbo.Production at one time. trigger Production_Update'',16,1) 
		ROLLBACK TRANSACTION
		RETURN;
	END
	----------------------

	--DECLARE @cProgram VarChar(60) ='' TRIGGER ERP_2.dbo.Sales_Update''
	--DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()

		
PRINT ''trigger  end  Production_Update:'';

END
' 
GO
ALTER TABLE [dbo].[Production] ENABLE TRIGGER [Production_Update]
GO
/****** Object:  Trigger [dbo].[PurchaseOrder After_Delete]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseOrder After_Delete]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[PurchaseOrder After_Delete] ON [dbo].[PurchaseOrder] 
	AFTER DELETE 
	--NOT FOR REPLICATION
AS

PRINT ''Trigger begin [PurchaseOrder After_Delete]''
INSERT INTO dbo.Ar_PurchaseOrder_hist 
(	[poitem],
	[hpapo],
	[itempo],
	[soitem],
	[salesnum],
	[item],
	[salesp],
	[company],
	[alloy],
	[form],
	[cc],[cl],
	[order_qty],
	[pieces],
	[thck],
	[sz2],
	[sz3],
	[p_lb],
	[p_pc],
	[p_ft],
	[lotp],
	[otherp],
	[otherfld],
	[orderdate],
	[due_min],
	[due_max],
	[received],
	[cond_spec],
	[misc_purch],
	[heat],
	[cert],
	[receivedby],
	[receipt],
	[delivered],
	[Cmplt],
	[cancelled],
	[posalesp],
	[shipvia],
	[jobnumber],
	[services],
	[ConvServ],
	[Equipment],
	[Stock],
	[sheet_pk],
	[shipwhere],
	[poshipaddr],
	[popayaddr],
	[randlen],
	[OddCut],
	[Metric],
	[dispalloy],
	[StandSize],
	[Amendment],
	[Printed],
	[VendCode],
	[ContactID],
	[Terms],
	[FOB],
	[HPA_due_min],
	[HPA_due_max],
	[First_due_max],
	[Reconciled],
	[ReconcileTotal],
	[StockLst_QTY],
	[StockLst_P],
	[StockLst_PU],
	[Order_P],
	[Order_PU],
	[Pounds],
	[BMScheck],
	[ShipLocation],
	[VendorPOConf],
	[Melt],
	[Who],
	[What],
	[When]
	,[WO]
	,[Cover]
	,[WO_Detail]
	,[IntP]
	,[RcvdE]
	,[DLAE]
	,[TBL] 
	,[hold]
	,[Lab_Service]  ) 
SELECT
	[poitem],
	[hpapo],
	[itempo],
	[soitem],
	[salesnum],
	[item],
	[salesp],
	[company],
	[alloy],
	[form],
	[cc],[cl],
	[order_qty],
	[pieces],
	[thck],
	[sz2],
	[sz3],
	[p_lb],
	[p_pc],
	[p_ft],
	[lotp],
	[otherp],
	[otherfld],
	[orderdate],
	[due_min],
	[due_max],
	[received],
	[cond_spec],
	[misc_purch],
	[heat],
	[cert],
	[receivedby],
	[receipt],
	[delivered],
	[Cmplt],
	[cancelled],
	[posalesp],
	[shipvia],
	[jobnumber],
	[services],
	[ConvServ],
	[Equipment],
	[stock],
	[sheet_pk],
	[shipwhere],
	[poshipaddr],
	[popayaddr],
	[randlen],
	[OddCut],
	[Metric],
	[dispalloy],
	[StandSize],
	[Amendment],
	[Printed],
	[VendCode],
	[ContactID],
	[Terms],
	[FOB],
	[HPA_due_min],
	[HPA_due_max],
	[First_due_max],
	[Reconciled],
	[ReconcileTotal],
	[StockLst_QTY],
	[StockLst_P],
	[StockLst_PU],
	[Order_P],
	[Order_PU],
	[Pounds],
	[BMScheck],
	[ShipLocation],
	[VendorPOConf],
	[Melt],
	 suser_sname() AS [Who],
	''Delete'' AS [What],
	GETDATE() AS [When]
	,[WO]
	,[Cover]
	,[WO_Detail]
	,[IntP]
	,[RcvdE]
	,[DLAE]
	,[TBL]
	,[hold]
	,[Lab_Service]
	FROM deleted

PRINT ''Trigger  end  [PurchaseOrder After_Delete]''
' 
GO
ALTER TABLE [dbo].[PurchaseOrder] ENABLE TRIGGER [PurchaseOrder After_Delete]
GO
/****** Object:  Trigger [dbo].[PurchaseOrder_After_Update]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseOrder_After_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[PurchaseOrder_After_Update]
   ON  [dbo].[PurchaseOrder] 
   AFTER UPDATE 
   --NOT FOR REPLICATION
AS 
BEGIN

PRINT ''Trigger begin [PurchaseOrder After_Update]''
IF UPDATE([SalesNum]) or UPDATE([Company]) or UPDATE([Amendment]) or UPDATE([itempo])
	BEGIN
		INSERT INTO dbo.Ar_PurchaseOrder_hist 
	(	[poitem],
		[hpapo],
		[itempo],
		[soitem],
		[salesnum],
		[item],
		[salesp],
		[company],
		[alloy],
		[form],
		[cc],[cl],
		[order_qty],
		[pieces],
		[thck],
		[sz2],
		[sz3],
		[p_lb],
		[p_pc],
		[p_ft],
		[lotp],
		[otherp],
		[otherfld],
		[orderdate],
		[due_min],
		[due_max],
		[received],
		[cond_spec],
		[misc_purch],
		[heat],
		[cert],
		[receivedby],
		[receipt],
		[delivered],
		[Cmplt],
		[cancelled],
		[posalesp],
		[shipvia],
		[jobnumber],
		[Services],
		[ConvServ],
		[Equipment],
		[stock],
		[sheet_pk],
		[shipwhere],
		[poshipaddr],
		[popayaddr],
		[randlen],
		[OddCut],
		[Metric],
		[dispalloy],
		[StandSize],
		[Amendment],
		[Printed],
		[VendCode],
		[ContactID],
		[Terms],
		[FOB],
		[HPA_due_min],
		[HPA_due_max],
		[First_due_max],
		[Reconciled],
		[ReconcileTotal],
		[StockLst_PU],
		[StockLst_QTY],
		[StockLst_P],
		[Order_P],
		[Order_PU],
		[Pounds],
		[BMScheck],
		[ShipLocation],
		[VendorPOConf],
		[Melt],
		[Who],
		[What],
		[When]
		,[WO]
		,[Cover]
		,[WO_Detail]
		,[IntP]
		,[RcvdE]
		,[DLAE]
		,[TBL] 
		,Hold
		,[Lab_Service]  ) 
	SELECT
		[poitem],
		[hpapo],
		[itempo],
		[soitem],
		[salesnum],
		[item],
		[salesp],
		[company],
		[alloy],
		[form],
		[cc],[cl],
		[order_qty],
		[pieces],
		[thck],
		[sz2],
		[sz3],
		[p_lb],
		[p_pc],
		[p_ft],
		[lotp],
		[otherp],
		[otherfld],
		[orderdate],
		[due_min],
		[due_max],
		[received],
		[cond_spec],
		[misc_purch],
		[heat],
		[cert],
		[receivedby],
		[receipt],
		[delivered],
		[Cmplt],
		[cancelled],
		[posalesp],
		[shipvia],
		[jobnumber],
		[Services],
		[Equipment],
		[ConvServ],
		[stock],
		[sheet_pk],
		[shipwhere],
		[poshipaddr],
		[popayaddr],
		[randlen],
		[OddCut],
		[Metric],
		[dispalloy],
		[StandSize],
		[Amendment],
		[Printed],
		[VendCode],
		[ContactID],
		[Terms],
		[FOB],
		[HPA_due_min],
		[HPA_due_max],
		[First_due_max],
		[Reconciled],
		[ReconcileTotal],
		[StockLst_PU],
		[StockLst_QTY],
		[StockLst_P],
		[Order_P],
		[Order_PU],
		[Pounds],
		[BMScheck],
		[ShipLocation],
		[VendorPOConf],
		[Melt],
		 suser_sname() AS [Who],
		''UPDATE'' AS [What],
		GETDATE() AS [When]
		,[WO]
		,[Cover]
		,[WO_Detail]
		,[IntP]
		,[RcvdE]
		,[DLAE]
		,[TBL]
		,Hold
		,[Lab_Service]
		FROM deleted
	END
end
PRINT ''Trigger  end  [PurchaseOrder After_Update]''
' 
GO
ALTER TABLE [dbo].[PurchaseOrder] ENABLE TRIGGER [PurchaseOrder_After_Update]
GO
/****** Object:  Trigger [dbo].[PurchaseOrder_Delete]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseOrder_Delete]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[PurchaseOrder_Delete] ON [dbo].[PurchaseOrder] 
	FOR DELETE 
	NOT FOR REPLICATION
AS

PRINT ''Trigger begin [PurchaseOrder_Delete]''

---

DECLARE @Count int
SET @Count = @@ROWCOUNT;
       
IF @Count > 10000
BEGIN
	RAISERROR(''Cannot DELETE more than 10 000 records of [Sales_No] at one time.'',16,1) 
	ROLLBACK TRANSACTION
	RETURN;
END

---
UPDATE dbo.AllQuotes SET HPApo = 0, BuyFrom = '''' 
	FROM dbo.AllQuotes AQ
	INNER JOIN deleted ON AQ.HPApo = deleted.HPAPO 
		AND AQ.SOitem = deleted.SOitem
--
UPDATE dbo.AllQuotes SET HPApo2 = 0, BuyFrom2 = '''' 
	FROM dbo.AllQuotes AQ
	INNER JOIN deleted ON AQ.HPApo2 = deleted.HPAPO 
		AND AQ.SOitem = deleted.SOitem
--

IF EXISTS (SELECT * FROM deleted INNER JOIN dbo.BrokerLst_Master BM ON deleted.POitem = BM.PO_item) 
	BEGIN
			
	--Add Reason to BrokerLst Process
	INSERT INTO dbo.BrokerLst_Process 
		( [po_item],[SalesPerson],[comment],[process_id],[processor],[ID_Detail] )	
		SELECT  deleted.POitem AS PO_Item
			, SUBSTRING(suser_sname(),CHARINDEX(''\'',suser_sname() )+1 ,20 ) AS SalesPerson
			, ''Delete PO'' AS Comment
			, ''CANCELLED'' AS Process_ID
			, SUBSTRING(suser_sname(),CHARINDEX(''\'',suser_sname() )+1 ,20 ) AS Processor
			, SD.ID_Detail AS ID_Detail
				FROM deleted 
				INNER JOIN dbo.BrokerLst_Master SM ON deleted.POitem = SM.PO_item 
				INNER JOIN dbo.BrokerLst_Detail SD ON SM.ID = SD.ID 

		--Remove Process
		DELETE FROM dbo.BrokerLst_Process
			FROM deleted
			WHERE deleted.POitem = BrokerLst_Process.PO_item 
			
		
		--Remove BrokerLst Detail
		DELETE FROM dbo.BrokerLst_Detail
			FROM deleted
			INNER JOIN dbo.BrokerLst_Master SM ON deleted.POitem = SM.PO_item
			INNER JOIN dbo.BrokerLst_Detail SD ON SM.ID = SD.ID
			WHERE deleted.POitem = SM.PO_item 
			
		
		--Remove BrokerLst Master
		DELETE FROM dbo.BrokerLst_Master
			FROM deleted
			INNER JOIN dbo.BrokerLst_Master SM ON deleted.POitem = SM.PO_item
			WHERE deleted.POitem = SM.PO_item 	
				
	END

IF EXISTS (SELECT * FROM deleted INNER JOIN dbo.StockLst_Master SM ON deleted.POitem = SM.PO_item) 
	BEGIN
			
	--Add Reason to StockLst Process
	INSERT INTO dbo.StockLst_Process 
	( [po_item],[SalesPerson],[comment],[process_id],[processor],[ID_Detail] )	
		SELECT  deleted.POitem AS PO_Item
		, SUBSTRING(suser_sname(),CHARINDEX(''\'',suser_sname() )+1 ,20 ) AS SalesPerson
		, ''Delete PO'' AS Comment
		, ''CANCELLED'' AS Process_ID
		, SUBSTRING(suser_sname(),CHARINDEX(''\'',suser_sname() )+1 ,20 ) AS Processor
		, SD.ID_Detail AS ID_Detail
		FROM deleted 
			INNER JOIN dbo.StockLst_Master SM ON deleted.POitem = SM.PO_item 
			INNER JOIN dbo.StockLst_Detail SD ON SM.ID = SD.ID 
				
	--Remove Process
	DELETE FROM dbo.StockLst_Process
		FROM deleted
		WHERE deleted.POitem = StockLst_Process.PO_item 	
			
			
	--Remove StockLst Detail
	DELETE FROM dbo.StockLst_Detail
		FROM deleted
		INNER JOIN dbo.StockLst_Master SM ON deleted.POitem = SM.PO_item
		INNER JOIN dbo.StockLst_Detail SD ON SM.ID = SD.ID
		WHERE deleted.POitem = SM.PO_item 
				
	--Remove StockLst Master
	DELETE FROM dbo.StockLst_Master
		FROM deleted
		INNER JOIN dbo.StockLst_Master SM ON deleted.POitem = SM.PO_item
		WHERE deleted.POitem = SM.PO_item 	
				
	END

PRINT ''Trigger  end  [PurchaseOrder_Delete]''
' 
GO
ALTER TABLE [dbo].[PurchaseOrder] ENABLE TRIGGER [PurchaseOrder_Delete]
GO
/****** Object:  Trigger [dbo].[PurchaseOrder_Insert]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseOrder_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[PurchaseOrder_Insert] ON [dbo].[PurchaseOrder] 
	FOR INSERT 
	NOT FOR REPLICATION
AS
begin
/****
Edit History:
2022 Nov 9: Sean Lykins - replacing all web.highperformancealloys.com references with web.highperformancealloys.com
*****/

PRINT ''Trigger begin [PurchaseOrder_Insert]''

DECLARE @cEmailFrom VARCHAR(30)
DECLARE @Body varchar(4000)

SET @cEmailFrom = ERP_2.dbo.f_GetSQL_Server_Email();

-- Check Vendor Status (3 = unapproved) -- added 04/04/2022
--IF (SELECT dbo.[f_IsVendorAppr] (inserted.VendCode) FROM inserted) = 3
--	BEGIN

DECLARE @nUnApprPO INT = 0

SELECT TOP 1 @nUnApprPO = inserted.HPApo 
	FROM dbo.PO_No WITH(NOLOCK) 
	INNER JOIN inserted ON PO_No.HPAPO = inserted.HPApo 
	WHERE inserted.HPApo > 0
	AND dbo.[f_IsVendorAppr] (inserted.VendCode) = 3
	AND PO_No.[SentUnAproved] = 0 

IF @nUnApprPO > 0 
	BEGIN

	declare @unapprovedSubject varchar(50) = ''PO:'' + CONVERT(varchar, @nUnApprPO) 
		+ '' used unapproved vendor.'';

	SELECT @Body = ''<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 5.0 Strict//EN\">''
    + ''<html>''
    + ''<head>''
    + ''    <title></title>''
    + ''</head>''
    + ''<body>''
    + ''<p>''
		+ ''Purchase Order ''+''<a href="https://raptor/ReportServer/Pages/ReportViewer.aspx?%2fHPA+Purchasing+Reports%2fPurchaseOrders&rs:Command=Render&hpapo='' + CONVERT(varchar, inserted.HPApo) + ''">'' + CONVERT(varchar, inserted.HPApo) + ''</a><br />''
		+ ''unapproved Vendor: '' + [dbo].[f_getVendorCompany](inserted.VendCode) + ''<br />''
		+ ''VendCode: '' + CONVERT(varchar, inserted.VendCode) + ''<br />''
		+ ''SalesP: '' + inserted.SalesP + '' '' + [dbo].[f_SaleRep_SP](inserted.SalesP) + ''<br />''
		+ ''Packing Slip ''+''<a href="https://raptor/ReportServer/Pages/ReportViewer.aspx?%2fHPA+Sales+Reports%2fSalesOrders&rs:Command=Render&soNum='' + CONVERT(varchar, inserted.SalesNum) + ''">'' + CONVERT(varchar, inserted.SalesNum) + ''</a>''
		+ ''<br />''
		+ ''Equipment: '' + ( CASE When ISNULL(inserted.Equipment,0)=0 Then ''No'' Else ''Yes'' End ) + ''<br />''
		+ ''Conv Serv: '' + ( CASE When ISNULL(inserted.ConvServ,0)=0 Then ''No'' Else ''Yes'' End ) + ''<br />''
		+ ''Lab Services: '' + ( CASE When ISNULL(inserted.Services,0)=0 Then ''No'' Else ''Yes'' End ) + ''<br />''
    + ''</p>''
    + ''<p>trigger: [dbo].[PurchaseOrder_Insert] ON [dbo].[PurchaseOrder]</p>''
    + ''</body>''
    + ''</html>''

		FROM inserted

		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = ''QA@ERP_1s.com'', 
			 @SubjectEmail = @unapprovedSubject,
			 @BodyEmail = @Body,
			 @BodyType = ''HTML''
	
	
		UPDATE dbo.PO_No
			SET SentUnAproved = 1
			WHERE HPAPO = @nUnApprPO
			
	END

-- Check Vendor Status (2 = conditionally approved) -- added 04/04/2022
DECLARE @nCondApprPO INT = 0

SELECT TOP 1 @nCondApprPO = inserted.HPApo 
	FROM dbo.PO_No WITH(NOLOCK) 
	INNER JOIN inserted ON PO_No.HPAPO = inserted.HPApo 
	WHERE inserted.HPApo > 0
	AND dbo.[f_IsVendorAppr] (inserted.VendCode) = 2
	AND PO_No.[SentCondAprv] = 0 

IF @nCondApprPO > 0 
	BEGIN

	declare @conditionalSubject varchar(50) = ''PO:'' + CONVERT(varchar, @nCondApprPO) + '' used conditionally approved vendor.'';

	SELECT @Body = ''<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 5.0 Strict//EN\">''
    + ''<html>''
    + ''<head>''
    + ''    <title></title>''
    + ''</head>''
    + ''<body>''
    + ''<p>''
		+ ''Purchase Order ''+''<a href="https://raptor/ReportServer/Pages/ReportViewer.aspx?%2fHPA+Purchasing+Reports%2fPurchaseOrders&rs:Command=Render&hpapo='' + CONVERT(varchar, inserted.HPApo) + ''">'' + CONVERT(varchar, inserted.HPApo) + ''</a><br />''
		+ ''conditionally approved Vendor: '' + [dbo].[f_getVendorCompany](inserted.VendCode) + ''<br />''
		+ ''VendCode: '' + CONVERT(varchar, inserted.VendCode) + ''<br />''
		+ ''SalesP: '' + inserted.SalesP + '' '' + [dbo].[f_SaleRep_SP](inserted.SalesP) + ''<br />''
		+ ''Sales Order ''+''<a href="https://raptor/ReportServer/Pages/ReportViewer.aspx?%2fHPA+Sales+Reports%2fSalesOrders&rs:Command=Render&soNum='' + CONVERT(varchar, inserted.SalesNum) + ''">'' + CONVERT(varchar, inserted.SalesNum) + ''</a>''
    + ''</p>''
    + ''<p>trigger: [dbo].[PurchaseOrder_Insert] ON [dbo].[PurchaseOrder]</p>''
    + ''</body>''
    + ''</html>''

		FROM inserted

		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = ''QA@ERP_1s.com'', 
			 @SubjectEmail = @conditionalSubject,
			 @BodyEmail = @Body,
			 @BodyType = ''HTML''
		
		
		UPDATE dbo.PO_No
			SET [SentCondAprv] = 1
			WHERE HPAPO = @nCondApprPO

	END

IF (SELECT dbo.[f_IsVendorDLA_BMS] (inserted.VendCode) FROM inserted) = 1
	BEGIN
	--Code to Email is now in PO_Save!

	SELECT @Body = ''<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 5.0 Strict//EN\">''
    + ''<html>''
    + ''<head>''
    + ''    <title></title>''
    + ''</head>''
    + ''<table style="width: 100%;">''
    + ''<tr>''
    + ''	<td style="width: 100%; font-weight: normal; text-align: center;">''
    + ''        <img SRC="https://images.ERP_1s.com/v1/images/HPALogo.png"''
    + ''            HEIGHT="69" alt="HPA Logo"></td>''
    + ''</tr>''
    + ''<tr>''
    + ''	<td style="width: 100%; font-weight: normal; text-align: center; font-size: large;">High Performance Alloys</td>''
    + ''</tr>''
    + ''<tr>''
    + ''	<td style="width: 100%; font-weight: normal; text-align: center;">1985 E 500 N, Windfall, IN 46076</td>''
    + ''</tr>''
    + ''<tr>''
    + ''	<td style="width: 100%; font-weight: normal; text-align: center;"><strong>P</strong> 765-945-8230&nbsp;&nbsp;<strong>F</strong> 765-945-8294</td>''
    + ''</tr>''
    + ''<tr>''
    + ''	<td style="width: 100%; font-weight: normal; text-align: center;">&nbsp;</td>''
    + ''</tr>''
    + ''</table><p>Quality Assurance Manager,</p><p>This is a notification that a new Purchase Order item, <strong>'' + RTRIM(inserted.POitem)
	+''</strong>, has been created by '' + SYSTEM_USER + '' on '' + CONVERT(char, GETDATE()) + '' and needs QA approval for DLA requirements.</p>''
    + ''    <p>"''+''https://web.highperformancealloys.com/HPA/QA/ApprovePO.aspx?poitem=''+RTRIM(inserted.POitem)+''"</p>''
    + ''    <p>Regards,</p>''
    + ''    <p>Automated System<br />''
    + ''        <a href="mailto:development@ERP_1s.com">development@ERP_1s.com</a></p>''
    + ''    <p>High Performance Alloys, Inc.<br />''
    + ''        PH: (800) 472-5569</p>''
    + ''    <p>An ISO 9001:2015 Registered Company</p>''
    + ''</body>''
    + ''</html>''
  --  (''PurchaseOrder table has a new DLA_BMS PO,''+CHAR(13)
		--+'' PO item:''+RTRIM(inserted.POitem)+CHAR(13)
		--+''"''+''https://web.highperformancealloys.com/HPA/QA/ApprovePO.aspx?poitem=''+RTRIM(inserted.POitem)+''"''+CHAR(13)
		--+''VendCode:''+RTRIM(STR(inserted.VendCode))+''.''+CHAR(13)
		--+''Please verify this PO.''+CHAR(13)
		--+''Entered by ''+RTRIM(suser_sname())
		--+'' on ''+RTRIM(GETDATE()) )
		FROM inserted

		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = ''QA@ERP_1s.com'', 
			 @SubjectEmail = ''DLA_BMS PO.'',
			 @BodyEmail = @Body,
			 @BodyType = ''HTML''
			 
	END

DECLARE @badPOitem CHAR(13)
DECLARE @BadPO INT
		
IF EXISTS ( SELECT * FROM inserted WHERE SUBSTRING(POitem,1,9) LIKE ''%-%'')
	BEGIN
	-- the dash is too soon, not proper format
	SELECT @Body = ''dbo.PurchaseOrder needs FIXED, POitem is not Proper,''+CHAR(13)
	
	SELECT TOP 1 @badPOitem = POitem, @BadPO = HPApo  FROM inserted WHERE SUBSTRING(POitem,1,9) LIKE ''%-%''
	SET @Body = @Body+'' PO item:''+@badPOitem +''.''
		+CHAR(13)+@@SERVERNAME+'' TRIGGER dbo.purchaseOrder_Insert '' 
			
	EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''Admin.Alerts@ERP_1s.com'', 
		 @SubjectEmail = ''BAD POitem.'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''
	
	SET @Body = ''dbo.PurchaseOrder table, POitem:''+@badPOitem+'' not Proper.''
		+CHAR(13)+@@SERVERNAME+'' TRIGGER dbo.purchaseOrder_Insert '' 
		
	RAISERROR( @Body, 16, -1)

	END
ELSE
	BEGIN
	--Insert for PO_No ?
	--IF EXISTS (SELECT * FROM dbo.PO_No WHERE HPAPO = inserted.HPAPO)
	INSERT INTO dbo.PO_No (HPAPO) 
		SELECT inserted.HPAPO FROM inserted
		WHERE inserted.HPAPO > 0
		AND inserted.HPAPO NOT IN (SELECT HPApo FROM dbo.PO_No)
	END
	
		
IF EXISTS (SELECT * FROM inserted WHERE HPAPO > 520000)
	BEGIN
		
	SELECT @Body = ''Insert on dbo.PurchaseOrder needs FIXED, HPAPO > 520000,''+CHAR(13)
		
	SELECT TOP 1 @badPOitem = POitem, @BadPO = HPApo  FROM inserted WHERE HPAPO > 520000
	SET @Body = @Body+'' PO item:''+@badPOitem +''.''
		+CHAR(13)+''HPA PO:''+CAST(@badPO AS CHAR(10)) +'' too large.''
		+CHAR(13)+@@SERVERNAME+'' TRIGGER dbo.purchaseOrder_Update '' 
			
	EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''Admin.Alerts@ERP_1s.com'', 
		 @SubjectEmail = ''BAD POitem.'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''
		 		
	SET @Body = ''dbo.PurchaseOrder table with POitem:''+@badPOitem+'' too large.''
		+CHAR(13)+''HPA PO:''+CAST(@badPO AS CHAR(10)) +'' too large.''
		+CHAR(13)+@@SERVERNAME+'' TRIGGER dbo.purchaseOrder_Update '' 
		
	RAISERROR( @Body, 16, -1)
	END
	
	
--------------------------------- Needs work
/*
	PRINT ''start fix PO NUM:'';

	DECLARE @HPAPO_Old INT, @HPAPO_New INT, @POitem_Old CHAR(12), @POitem_New CHAR(12)

	SET @HPAPO_Old = 5038478
	SET @HPAPO_New = 504016
	SET @POitem_Old = ''  5038478-01''
	SET @POitem_New = ''   504016-01''

	PRINT ''UPDATE dbo.AllQuotes SET POitem = @POitem_New WHERE POitem = @POitem_Old''
	UPDATE dbo.AllQuotes SET POitem = @POitem_New WHERE POitem = @POitem_Old
	PRINT ''---''

	PRINT ''UPDATE dbo.AllQuotes SET HPAPO2 = @HPAPO_New WHERE HPAPO2 = @HPAPO_Old''
	UPDATE dbo.AllQuotes SET HPAPO2 = @HPAPO_New WHERE HPAPO2 = @HPAPO_Old
	PRINT ''---''

	PRINT ''UPDATE dbo.BrokerLst_Master SET PO_item=@POitem_New WHERE PO_item = @POitem_Old''
	UPDATE dbo.BrokerLst_Master SET PO_item=@POitem_New WHERE PO_item = @POitem_Old
	PRINT ''---''

	PRINT ''UPDATE dbo.BrokerLst_Process SET PO_item=@POitem_New WHERE PO_item = @POitem_Old''
	UPDATE dbo.BrokerLst_Process SET PO_item=@POitem_New WHERE PO_item = @POitem_Old
	PRINT ''---''

	PRINT ''UPDATE dbo.PurchaseOrder SET POitem=@POitem_New,  HPApo = @HPAPO_New WHERE POitem = @POitem_Old''
	UPDATE dbo.PurchaseOrder SET POitem=@POitem_New,  HPApo = @HPAPO_New WHERE POitem = @POitem_Old
	PRINT ''---''

	PRINT ''UPDATE dbo.Receiving SET POitem=@POitem_New WHERE POitem = @POitem_Old''
	UPDATE dbo.Receiving SET POitem=@POitem_New WHERE POitem = @POitem_Old
	PRINT ''---''

	PRINT ''UPDATE dbo.Stocklst_Master SET PO_item=@POitem_New WHERE PO_item = @POitem_Old''
	UPDATE dbo.Stocklst_Master SET PO_item=@POitem_New WHERE PO_item = @POitem_Old
	PRINT ''---''

	PRINT ''UPDATE dbo.StockLst_Process SET PO_item=@POitem_New WHERE PO_item = @POitem_Old''
	UPDATE dbo.StockLst_Process SET PO_item=@POitem_New WHERE PO_item = @POitem_Old
	PRINT ''---''


	PRINT ''UPDATE dbo.GFMLog SET TestPOitem=@POitem_New, TestPO=@HPAPO_New WHERE TestPOitem = @POitem_Old''
	--If POitem is used, update it.
	UPDATE dbo.GFMLog SET TestPOitem=@POitem_New, TestPO=@HPAPO_New WHERE TestPOitem = @POitem_Old
	PRINT ''---''

	PRINT ''UPDATE dbo.GFMLog SET TestPO=@HPAPO_New WHERE TestPO=@HPAPO_Old''
	--Item is not always used, change all for where only the PO is used.
	UPDATE dbo.GFMLog SET TestPO=@HPAPO_New WHERE TestPO=@HPAPO_Old
	PRINT ''---''

	PRINT ''UPDATE dbo.HT_log SET TestPOitem=@POitem_New, TestPO=@HPAPO_New WHERE TestPOitem = @POitem_Old''
	UPDATE dbo.HT_log SET TestPOitem=@POitem_New, TestPO=@HPAPO_New WHERE TestPOitem = @POitem_Old
	PRINT ''---''

	PRINT ''UPDATE dbo.HT_log SET TestPO=@HPAPO_New WHERE TestPO=@HPAPO_Old''
	UPDATE dbo.HT_log SET TestPO=@HPAPO_New WHERE TestPO=@HPAPO_Old
	PRINT ''---''

	PRINT ''UPDATE dbo.LakeErie_log SET TestPOitem=@POitem_New, TestPO=@HPAPO_New WHERE TestPOitem = @POitem_Old''
	UPDATE dbo.LakeErie_log SET TestPOitem=@POitem_New, TestPO=@HPAPO_New WHERE TestPOitem = @POitem_Old
	PRINT ''---''

	PRINT ''UPDATE dbo.LakeErie_log SET TestPO=@HPAPO_New WHERE TestPO=@HPAPO_Old''
	UPDATE dbo.LakeErie_log SET TestPO=@HPAPO_New WHERE TestPO=@HPAPO_Old
	PRINT ''---''

	PRINT ''UPDATE dbo.Roll_log SET TestPOitem=@POitem_New, TestPO=@HPAPO_New WHERE TestPOitem = @POitem_Old''
	UPDATE dbo.Roll_log SET TestPOitem=@POitem_New, TestPO=@HPAPO_New WHERE TestPOitem = @POitem_Old
	PRINT ''---''

	PRINT ''UPDATE dbo.Roll_log SET TestPO=@HPAPO_New WHERE TestPO=@HPAPO_Old''
	UPDATE dbo.Roll_log SET TestPO=@HPAPO_New WHERE TestPO=@HPAPO_Old
	PRINT ''---''

	PRINT ''end fix PO NUM:'';

*/

/*
-- Code to clone PO
INSERT INTO dbo.PurchaseOrder ( [POitem]
      ,[HPApo]      ,[ItemPO]      ,[SOitem]      ,[SalesNum]      ,[Item]
      ,[SalesP]      ,[Company]
      ,[Alloy]      ,[Form]      ,[CC]      ,[Order_QTY]
      ,[Pieces]      ,[Thck]      ,[Sz2]      ,[Sz3]
      ,[p_lb]      ,[p_pc]      ,[p_ft]      ,[lotp]      ,[OtherP]      ,[OtherFld]
      ,[OrderDate]      ,[Due_Min]      ,[Due_Max]      ,[Received]
      ,[Cond_Spec]      ,[Misc_Purch]      ,[Heat]      ,[Cert]
      ,[ReceivedBy]      ,[Receipt]      ,[Delivered]      ,[Cancelled]
      ,[POSalesP]      ,[ShipVia]      ,[JobNumber]      ,[Services]
      ,[ConvServ]      ,[Equipment]      ,[Stock]      ,[Sheet_pk]
      ,[ShipWhere]      ,[POshipaddr]      ,[POpayaddr]      ,[Randlen]      ,[OddCut]      ,[Metric]
      ,[Sz1Orig]      ,[Sz2Orig]      ,[Sz3Orig]      ,[DispAlloy]      ,[StandSize]
      ,[Amendment]      ,[Printed]      ,[VendCode]      ,[ContactID]
      ,[Terms]      ,[FOB]      ,[HPA_Due_Min]      ,[HPA_Due_Max]      ,[First_Due_Max]
      ,[Reconciled]      ,[ReconcileTotal]      ,[StockLst_QTY]      
	  ,[StockLst_P]      ,[Order_P]      ,[Order_PU]      ,[Pounds]
      ,[BMScheck]      ,[ShipLocation]      ,[VendorPOConf]      ,[Melt]
      ,[WO]      ,[Cover]      ,[WO_Detail]      ,[IntP])
SELECT  dbo.f_ProperPOitem( ''  505625-''+CAST([ItemPO] AS CHar(2)) ) AS [POitem]
							  ,505625 AS [HPApo]      
	  ,[ItemPO]      ,[SOitem]      ,[SalesNum]      ,[Item]
      ,[SalesP]      ,''Cumberland Diversified Metals'' AS [Company]
      ,[Alloy]      ,[Form]      ,[CC]      ,[Order_QTY]
      ,[Pieces]      ,[Thck]      ,[Sz2]      ,[Sz3]
      ,[p_lb]      ,[p_pc]      ,[p_ft]      ,[lotp]      ,[OtherP]      ,[OtherFld]
      ,[OrderDate]      ,[Due_Min]      ,[Due_Max]      ,[Received]
      ,[Cond_Spec]      ,[Misc_Purch]      ,[Heat]      ,[Cert]
      ,[ReceivedBy]      ,[Receipt]      ,[Delivered]      ,[Cancelled]
      ,''Pam Clark'' AS [POSalesP]      
	  ,'''' AS ShipVia
      ,[JobNumber]
      ,1 AS [Services]
      ,[ConvServ]
      ,[Equipment]
      ,''No Stock'' AS Stock
      ,0 AS Sheet_PK
      ,[ShipWhere]      ,[POshipaddr]      ,[POpayaddr]      ,[Randlen]      ,[OddCut]      ,[Metric]
      ,[Sz1Orig]      ,[Sz2Orig]      ,[Sz3Orig]      ,[DispAlloy]      ,[StandSize]
      ,[Amendment]      
	  ,0 AS [Printed]      
	  ,10841 As VendCode
      ,978 AS ContactID
      ,[Terms]      ,[FOB]      ,[HPA_Due_Min]      ,[HPA_Due_Max]      ,[First_Due_Max]
      ,0 AS [Reconciled]      ,[ReconcileTotal]      ,[StockLst_QTY]
      ,1 AS StockLst_P
      ,1 AS Order_P
      ,[Order_PU]
      ,[Pounds]
      ,[BMScheck]      ,[ShipLocation]      ,[VendorPOConf]      ,[Melt]
      ,[WO]      ,[Cover]      ,[WO_Detail]      ,[IntP]
	   FROM dbo.PurchaseOrder 
WHERE [POitem] = ''   505623-23''
*/

PRINT ''Trigger  end  [PurchaseOrder_Insert]''
end
' 
GO
ALTER TABLE [dbo].[PurchaseOrder] ENABLE TRIGGER [PurchaseOrder_Insert]
GO
/****** Object:  Trigger [dbo].[PurchaseOrder_Update]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseOrder_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[PurchaseOrder_Update]
   ON  [dbo].[PurchaseOrder] 
   FOR UPDATE 
   NOT FOR REPLICATION
AS 
BEGIN

SET NOCOUNT ON;

DECLARE @cEmailFrom VARCHAR(30);
DECLARE @Body varchar(4000);
DECLARE @badSOitem CHAR(10);

PRINT ''Trigger begin [PurchaseOrder_Update]'';


---big UPDATES are in error
DECLARE @Count int
SET @Count = @@ROWCOUNT;
   
IF @Count > 1000
BEGIN
	RAISERROR(''Cannot UPDATE more than 1000 records of dbo.PurchaseOrder at one time. trigger PurchaseOrder_Update'',16,1) 
	ROLLBACK TRANSACTION
	RETURN;
END
	----------------------


IF EXISTS ( SELECT * FROM inserted WHERE SUBSTRING(inserted.POitem,1,9) LIKE ''%-%'')
	BEGIN
	
	PRINT '' Update on dbo.PurchaseOrder needs FIXED, POitem is not Proper'';

	SET @cEmailFrom = ERP_2.dbo.f_GetSQL_Server_Email();
	SELECT @Body = ''Update on dbo.PurchaseOrder needs FIXED, POitem is not Proper,''+CHAR(13);
		
	SELECT TOP 1 @BadSoitem = soitem  FROM inserted WHERE SUBSTRING(POitem,1,9) LIKE ''%-%'';
	SET @Body = @Body+'' PO item:''+@BadSoitem +''.''
		+CHAR(13)+(suser_sname())
		+CHAR(13)+@@SERVERNAME+'' TRIGGER dbo.purchaseOrder_Update '' ;
			
	EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
		 @SubjectEmail = ''BAD Soitem.'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT'';
		 		
	SET @Body = ''UPDATE dbo.PurchaseOrder table failed. POitem:''+@BadSoitem+'' not Proper.''
		+CHAR(13)+@@SERVERNAME+'' TRIGGER dbo.purchaseOrder_Update '' ;
		
	RAISERROR( @Body, 16, -1);
	END


IF EXISTS (SELECT * FROM inserted WHERE HPAPO > 5000000)
	BEGIN
	
	PRINT ''  Update on dbo.PurchaseOrder needs FIXED, HPAPO > 5000000 [PurchaseOrder_Update]'';

	SET @cEmailFrom = ERP_2.dbo.f_GetSQL_Server_Email();
	SELECT @Body = ''Update on dbo.PurchaseOrder needs FIXED, HPAPO > 5000000,''+CHAR(13);
		
	SELECT TOP 1 @BadSoitem = soitem  FROM inserted WHERE HPAPO > 5000000;
	SET @Body = @Body+'' PO item:''+@BadSoitem +''.''
		+CHAR(13)+@@SERVERNAME+'' TRIGGER dbo.purchaseOrder_Update  [PurchaseOrder_Update]'' ;
			
	EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
		 @SubjectEmail = ''BAD Soitem.'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT'';
		 		
	SET @Body = ''UPDATE dbo.PurchaseOrder table failed. POitem:''+@BadSoitem+'' too large. Set to HPApo 5,000,000 Max in trigger  [PurchaseOrder_Update]''
		+CHAR(13)+@@SERVERNAME+'' TRIGGER dbo.purchaseOrder_Update '' ;
		
	RAISERROR( @Body, 16, -1);
	END

--IF UPDATE(Cancelled)
--	UPDATE dbo.PO_No SET cncld 
--		SELECT inserted.Cancelled FROM inserted WHERE UPDATE(Cancelled)
--		WHERE PO_No.HPAPO = inserted.HPAPO

--------
IF UPDATE(Reconciled)
	BEGIN
	PRINT ''  Reconcile dbo.PO_No'';

	UPDATE dbo.PO_No 
		SET Reconciled = inserted.Reconciled
		,Rec_Date = GetDate()
		,Rec_Who = suser_sname()
		FROM inserted
		INNER JOIN dbo.PO_No ON inserted.HPApo = PO_No.HPAPO
		WHERE UPDATE(Reconciled)
		AND ISNULL(inserted.Reconciled,0) = 1;

	END

--------
IF UPDATE(Reconciled)
	BEGIN
	PRINT ''  ReconcileTotal dbo.PO_SOdist'';

	UPDATE dbo.PO_SOdist
		SET ReconcileTotal = inserted.ReconcileTotal
		,P = inserted.StockLst_P
		,Total = inserted.StockLst_QTY * inserted.StockLst_P
		FROM inserted
		INNER JOIN dbo.PO_SOdist ON inserted.POitem = PO_SOdist.POitem
		WHERE UPDATE(Reconciled)
		AND ISNULL(inserted.Reconciled,0) = 1
		--AND inserted.ConvServ = 0 AND inserted.Equipment = 0 and inserted.Services = 0

	END

/*
--Reconcile is now at the Receive level, not the PO level
--------
IF UPDATE(Reconciled)
	BEGIN
	PRINT ''  Remove [INCOMING] Process for [Reconciled]''

	PRINT ''  DELETE FROM dbo.StockLst_Process WHERE UPDATE(Reconciled)''

	DELETE FROM dbo.StockLst_Process 
		WHERE PO_item IN (
			SELECT dbo.f_ProperPOitem(POitem)
			FROM inserted
			WHERE Reconciled = 1 AND UPDATE(Reconciled) )
		AND ( Process_ID = ''INCOMING  '' OR Process_ID = ''PARTRECV'' ) 

	PRINT ''  DELETE FROM dbo.BrokerLst_Process''
	DELETE FROM dbo.BrokerLst_Process 
		WHERE PO_item IN (
			SELECT dbo.f_ProperPOitem(POitem)
			FROM inserted
			WHERE Reconciled = 1 AND UPDATE(Reconciled) )
		AND ( Process_ID = ''INCOMING  '' OR Process_ID = ''PARTRECV'' ) 


	PRINT ''  DELETE FROM dbo.WIPLst_Process''
	DELETE FROM dbo.WIPLst_Process 
		WHERE PO_item IN (
			SELECT dbo.f_ProperPOitem(POitem)
			FROM inserted
			WHERE Reconciled = 1 AND UPDATE(Reconciled) )
		AND ( Process_ID = ''INCOMING  '' OR Process_ID = ''PARTRECV'' ) 

	END

*/

IF UPDATE([HPA_Due_Max])
	BEGIN
	IF EXISTS (SELECT * FROM inserted,deleted WHERE inserted.[HPA_Due_Max] != deleted.[HPA_Due_Max] AND UPDATE([HPA_Due_Max]) 
	AND inserted.POitem = deleted.POitem ) 
		BEGIN

		PRINT '' UPDATE Process with DueDate INCOMING  [PurchaseOrder_Update]''
		
		UPDATE dbo.BrokerLst_Process
			SET DueDate = inserted.[HPA_Due_Max]
			FROM inserted,deleted
			WHERE inserted.POitem = BrokerLst_Process.PO_item 	
			AND ( BrokerLst_Process.Process_ID = ''INCOMING  '' OR  BrokerLst_Process.Process_ID = ''NOT2HPA'' )
			AND inserted.[HPA_Due_Max] != deleted.[HPA_Due_Max] 
			AND UPDATE([HPA_Due_Max]) 
			
		UPDATE dbo.StockLst_Process
			SET DueDate = inserted.[HPA_Due_Max]
			FROM inserted,deleted
			WHERE inserted.POitem = StockLst_Process.PO_item 	
			AND ( StockLst_Process.Process_ID = ''INCOMING  '' OR  StockLst_Process.Process_ID = ''NOT2HPA'' )
			AND inserted.[HPA_Due_Max] != deleted.[HPA_Due_Max] 
			AND UPDATE([HPA_Due_Max]) 
			
		UPDATE dbo.WIPLst_Process
			SET DueDate = inserted.[HPA_Due_Max]
			FROM inserted,deleted
			WHERE inserted.POitem = WIPLst_Process.PO_item 	
			AND ( WIPLst_Process.Process_ID = ''INCOMING  '' OR  WIPLst_Process.Process_ID = ''NOT2HPA'' )
			AND inserted.[HPA_Due_Max] != deleted.[HPA_Due_Max] 
			AND UPDATE([HPA_Due_Max]) 
	
		END
	END


--DECLARE @Body varchar(8000)
IF UPDATE([Delivered])
	BEGIN
	IF EXISTS (SELECT * FROM inserted WHERE inserted.Delivered = 1 AND UPDATE([Delivered])) 
		BEGIN

		--PRINT '' DELETE FROM dbo.?Lst_Process INCOMING  [PurchaseOrder_Update]''
		PRINT '' depricated --DELETE FROM dbo.?Lst_Process INCOMING  [PurchaseOrder_Update]''
		/*
		DELETE FROM dbo.BrokerLst_Process
			FROM inserted
			WHERE inserted.POitem = BrokerLst_Process.PO_item 
			AND ( BrokerLst_Process.Process_ID = ''INCOMING  '' OR  BrokerLst_Process.Process_ID = ''NOT2HPA'' )
			AND inserted.Delivered = 1
			AND UPDATE([Delivered])

		DELETE FROM dbo.StockLst_Process
			FROM inserted
			WHERE inserted.POitem = StockLst_Process.PO_item 	
			AND ( StockLst_Process.Process_ID = ''INCOMING  '' OR  StockLst_Process.Process_ID = ''NOT2HPA'' )
			AND inserted.Delivered = 1
			AND UPDATE([Delivered])

		DELETE FROM dbo.WIPLst_Process
			FROM inserted
			WHERE inserted.POitem = WIPLst_Process.PO_item 	
			AND ( WIPLst_Process.Process_ID = ''INCOMING  '' OR  WIPLst_Process.Process_ID = ''NOT2HPA'' )
			AND inserted.Delivered = 1
			AND UPDATE([Delivered])
		*/

		END
	ELSE
		IF EXISTS (SELECT * FROM inserted, deleted 
					WHERE ISNULL(inserted.Delivered,0) = 1
						AND deleted.Delivered = 0
						AND inserted.POitem = deleted.POitem )
			BEGIN
			
			PRINT '' inserted.Delivered not 1 and not NULL  [PurchaseOrder_Update]''

			SELECT TOP 1 @Body = (''PO item has been marked as NOT Delivered,''+CHAR(13)
				+'' PO item:''+RTRIM(inserted.POitem)+CHAR(13)
				+''"''+dbo.f_Reportlink_CHAR(''POitem'',inserted.POitem)+''"''+CHAR(13)
				+''VendCode:''+RTRIM(STR(inserted.VendCode))+''.''+CHAR(13)
				+''Entered by ''+RTRIM(suser_sname())+'' on ''+RTRIM(GETDATE())+''. trigger PurchaseOrder_Update'' )
				FROM inserted, deleted 
				WHERE ISNULL(inserted.Delivered,0) = 1
					AND deleted.Delivered = 0
					AND inserted.POitem = deleted.POitem 
					AND UPDATE([Delivered])
				
			DECLARE @cCompany AS VARCHAR(30)	
			SELECT @cCompany = inserted.[Company] FROM inserted
			SET @Body = @Body + CHAR(13)+CHAR(10) + ''Company:''+ISNULL(@cCompany,'''')
						
			IF EXISTS (SELECT * FROM inserted WHERE ISNULL([Services],0) = 1 ) 
				SET @Body = @Body + CHAR(13)+CHAR(10) + ''Service PO.''
			ELSE
				SET @Body = @Body + CHAR(13)+CHAR(10) + ''Not service PO.''

			IF EXISTS (SELECT * FROM inserted WHERE ISNULL([Equipment],0) = 1 ) 
				SET @Body = @Body + CHAR(13)+CHAR(10) + ''Equipment PO.''

			IF EXISTS (SELECT * FROM inserted WHERE ISNULL([ConvServ],0) = 1 ) 
				SET @Body = @Body + CHAR(13)+CHAR(10) + ''ConvServ PO.''

			DECLARE @Stock AS VARCHAR(255)	
			SELECT @Stock = ''Stock:''+RTRIM(ISNULL(inserted.[Stock],'' ''))
						+''   ShipWhere:''
						+CASE ShipWhere
							WHEN 1 THEN ''Tipton.'' 
							WHEN 2 THEN ''Direct to Customer.''
							WHEN 3 THEN ''Blind to Customer.''
							WHEN 4 THEN ''Service-No return.''
							WHEN 5 THEN ''Windfall.'' 
							ELSE CAST([ShipWhere] AS CHAR(1))
						 END
						+''   PO ShipAddr:''+CAST(ISNULL(inserted.[POShipAddr],0) AS CHAR(1) ) 
						FROM inserted
						
			SET @Body = @Body + CHAR(13)+CHAR(10) + ISNULL(@Stock,''Null stock'')
			SET @Body = @Body + CHAR(13)+CHAR(10) + ''TRIGGER [dbo].[PurchaseOrder_Update] ON [dbo].[PurchaseOrder]''
			
			EXEC dbo.p_eMail_Send
				 @FromEmail = @cEmailFrom, 
				 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
				 @SubjectEmail = ''PO UN Delivered.'',
				 @BodyEmail = @Body,
				 @BodyType = ''TEXT''		
			END
	END

-------------------------------
----- lots to do with a Cancel
--------
--IF UPDATE(Cancelled)
IF EXISTS (SELECT * FROM inserted, deleted 
		WHERE inserted.POitem = deleted.POitem 
		AND inserted.Cancelled <> deleted.Cancelled 
		AND UPDATE(Cancelled) )

	BEGIN
	PRINT ''  Cancel dbo.PO_No''

	UPDATE dbo.PO_No 
		SET Cancelled = inserted.Cancelled
		FROM inserted 
		INNER JOIN deleted ON inserted.POitem = deleted.POitem
		INNER JOIN dbo.PO_No ON inserted.HPApo = PO_No.HPAPO
		WHERE UPDATE(Cancelled)
	END

IF UPDATE([Cancelled])
	begin
	IF EXISTS (SELECT * FROM inserted, deleted 
		WHERE inserted.POitem = deleted.POitem 
			AND inserted.Cancelled <> deleted.Cancelled 
			AND UPDATE([Cancelled]) ) 
		BEGIN
		
		--Do Not Delete if have receiving record ????
		--SELECT COUNT(*) AS Cntd FROM dbo.Receiving WHERE POitem = @POitem AND ISNULL(Cancelled,0) = 0
		
		-----------------------------------

		IF EXISTS (SELECT * FROM inserted INNER JOIN dbo.StockLst_Master SM 
		  ON inserted.POitem = SM.PO_item WHERE inserted.Cancelled = 1 AND UPDATE([Cancelled])) 
			
			BEGIN
			--Now Cancelled: StockLst	
			PRINT ''Added StockLst_Process as Process_ID=Cancelled  [PurchaseOrder_Update]''
			INSERT INTO dbo.StockLst_Process 
				( [po_item],[SalesPerson],[comment],[process_id],[processor],[AllowSub],[QTY],[ID_Detail] )	
				SELECT  inserted.POitem AS PO_Item
					, SUBSTRING(suser_sname(),CHARINDEX(''\'',suser_sname() )+1 ,20 ) AS SalesPerson
					, ''Cancelled PO'' AS Comment
					, ''CANCELLED'' AS Process_ID
					, SUBSTRING(suser_sname(),CHARINDEX(''\'',suser_sname() )+1 ,20 ) AS Processor
					,''N''
					, inserted.Order_QTY
					, SD.ID_Detail AS ID_Detail
				FROM inserted 
					INNER JOIN dbo.StockLst_Master SM ON inserted.POitem = SM.PO_item 
					INNER JOIN dbo.StockLst_Detail SD ON SM.ID = SD.ID 
					WHERE inserted.Cancelled = 1
					AND ISNULL(SM.heat,''Due in'') = ''Due in''
					AND UPDATE([Cancelled])
				
			PRINT ''Delete StockLst_Process for PO  [PurchaseOrder_Update]''
			DELETE FROM dbo.StockLst_Process
				FROM inserted
				WHERE inserted.POitem = StockLst_Process.PO_item 	
				AND ( StockLst_Process.Process_ID = ''INCOMING  ''
				OR StockLst_Process.Process_ID = ''PARTRECV''
				OR StockLst_Process.Process_ID = ''SELECTED  '' )
				AND inserted.Cancelled = 1
				AND UPDATE([Cancelled])
			
			PRINT ''Delete StockLst_Detail for PO  [PurchaseOrder_Update]''
			DELETE FROM dbo.StockLst_Detail
				FROM inserted
				INNER JOIN dbo.StockLst_Master SM ON inserted.POitem = SM.PO_item
				INNER JOIN dbo.StockLst_Detail SD ON SM.ID = SD.ID
				WHERE inserted.POitem = SM.PO_item 
				AND inserted.Cancelled = 1
				AND ISNULL(SM.heat,''Due in'') = ''Due in''
				AND UPDATE([Cancelled])
				
			PRINT ''Delete StockLst_Master for PO  [PurchaseOrder_Update]''
			DELETE FROM dbo.StockLst_Master
				FROM inserted
				INNER JOIN dbo.StockLst_Master SM ON inserted.POitem = SM.PO_item
				WHERE inserted.POitem = SM.PO_item 	
				AND inserted.Cancelled = 1
				AND ISNULL(SM.heat,''Due in'') = ''Due in''
				AND UPDATE([Cancelled])
			
		END

		-----------------------------------

		IF EXISTS (SELECT * FROM inserted 
				INNER JOIN deleted ON inserted.POitem = deleted.POitem 
				INNER JOIN dbo.BrokerLst_Master BM ON inserted.POitem = BM.PO_item 
				WHERE inserted.Cancelled <> deleted.Cancelled AND inserted.Cancelled = 1 AND UPDATE([Cancelled]) ) 
			BEGIN
			--Now Cancelled: BrokerLst
			PRINT '' Added BrokerLst_Process as Process_ID=Cancelled  [PurchaseOrder_Update]''
			INSERT INTO dbo.BrokerLst_Process 
				( [po_item],[SalesPerson],[comment],[process_id],[processor],[AllowSub],[QTY],[ID_Detail] )	
				SELECT  inserted.POitem AS PO_Item
					, SUBSTRING(suser_sname(),CHARINDEX(''\'',suser_sname() )+1 ,20 ) AS SalesPerson
					, ''Cancelled PO'' AS Comment
					, ''CANCELLED'' AS Process_ID
					, SUBSTRING(suser_sname(),CHARINDEX(''\'',suser_sname() )+1 ,20 ) AS Processor
					,''N''
					, inserted.Order_QTY
					, SD.ID_Detail AS ID_Detail
				FROM inserted 
					INNER JOIN dbo.BrokerLst_Master SM ON inserted.POitem = SM.PO_item 
					INNER JOIN dbo.BrokerLst_Detail SD ON SM.ID = SD.ID 
					WHERE inserted.Cancelled = 1
					AND ISNULL(SM.heat,''Due in'') = ''Due in''
					AND UPDATE([Cancelled])
			
			--Remove BrokerLst Process
			PRINT '' Delete BrokerLst_Process for PO  [PurchaseOrder_Update]''
			DELETE FROM dbo.BrokerLst_Process
				FROM inserted
				WHERE inserted.POitem = BrokerLst_Process.PO_item 
				AND ( BrokerLst_Process.Process_ID = ''INCOMING  ''  
				OR BrokerLst_Process.Process_ID = ''PARTRECV''
				OR BrokerLst_Process.Process_ID = ''SELECTED  '' )
				AND inserted.Cancelled = 1
				AND  UPDATE([Cancelled])
			
			--Remove BrokerLst Detail
			PRINT '' Delete BrokerLst_Detail for PO  [PurchaseOrder_Update]''
			DELETE FROM dbo.BrokerLst_Detail
				FROM inserted
				INNER JOIN dbo.BrokerLst_Master SM ON inserted.POitem = SM.PO_item
				INNER JOIN dbo.BrokerLst_Detail SD ON SM.ID = SD.ID
				WHERE inserted.POitem = SM.PO_item 
				AND inserted.Cancelled = 1
				AND ISNULL(SM.heat,''Due in'') = ''Due in''
				AND UPDATE([Cancelled])
			
			--Remove BrokerLst Master
			PRINT '' Delete BrokerLst_Master for PO''
			DELETE FROM dbo.BrokerLst_Master
				FROM inserted
				INNER JOIN dbo.BrokerLst_Master SM ON inserted.POitem = SM.PO_item
				WHERE inserted.POitem = SM.PO_item 	
				AND inserted.Cancelled = 1
				AND ISNULL(SM.heat,''Due in'') = ''Due in''
				AND UPDATE([Cancelled])
			
		END

		
		-----------------------

		IF EXISTS (SELECT * FROM inserted INNER JOIN dbo.WIPLst_Master BM 
		  ON inserted.POitem = BM.PO_item WHERE inserted.Cancelled = 1 AND UPDATE([Cancelled]) ) 
			
			BEGIN
			
			PRINT '' Added WIPLst_Process as Process_ID=Cancelled  [PurchaseOrder_Update]''
			INSERT INTO dbo.WIPLst_Process 
				( [po_item],[SalesPerson],[comment],[process_id],[processor],[AllowSub],[QTY],[ID_Detail] )	
				SELECT  inserted.POitem AS PO_Item
					, SUBSTRING(suser_sname(),CHARINDEX(''\'',suser_sname() )+1 ,20 ) AS SalesPerson
					, ''Cancelled PO'' AS Comment
					, ''CANCELLED'' AS Process_ID
					, SUBSTRING(suser_sname(),CHARINDEX(''\'',suser_sname() )+1 ,20 ) AS Processor
					,''N''
					, inserted.Order_QTY
					, SD.ID_Detail AS ID_Detail
				FROM inserted 
					INNER JOIN dbo.WIPLst_Master SM ON inserted.POitem = SM.PO_item 
					INNER JOIN dbo.WIPLst_Detail SD ON SM.ID = SD.ID 
					WHERE inserted.Cancelled = 1
					AND ISNULL(SM.heat,''Due in'') = ''Due in''
					AND UPDATE([Cancelled])
			
			--Remove WIPLst Process
			PRINT '' Delete WIPLst_Process for PO  [PurchaseOrder_Update]''
			DELETE FROM dbo.WIPLst_Process
				FROM inserted
				WHERE inserted.POitem = WIPLst_Process.PO_item 
				AND ( WIPLst_Process.Process_ID = ''INCOMING  ''  
				OR WIPLst_Process.Process_ID = ''PARTRECV''
				OR WIPLst_Process.Process_ID = ''SELECTED  '' )
				AND inserted.Cancelled = 1
				AND  UPDATE([Cancelled])
			
			--Remove WIPLst Detail
			PRINT '' Delete WIPLst_Detail for PO  [PurchaseOrder_Update]''
			DELETE FROM dbo.WIPLst_Detail
				FROM inserted
				INNER JOIN dbo.WIPLst_Master SM ON inserted.POitem = SM.PO_item
				INNER JOIN dbo.WIPLst_Detail SD ON SM.ID = SD.ID
				WHERE inserted.POitem = SM.PO_item 
				AND inserted.Cancelled = 1
				AND ISNULL(SM.heat,''Due in'') = ''Due in''
				AND UPDATE([Cancelled])
			
			--Remove WIPLst Master
			PRINT '' Delete BrokerLst_Master for PO''
			DELETE FROM dbo.WIPLst_Master
				FROM inserted
				INNER JOIN dbo.WIPLst_Master SM ON inserted.POitem = SM.PO_item
				WHERE inserted.POitem = SM.PO_item 	
				AND inserted.Cancelled = 1
				AND ISNULL(SM.heat,''Due in'') = ''Due in''
				AND UPDATE([Cancelled])
			
			END
		END

	END
	


IF ( UPDATE([Services]) OR UPDATE([Lab_Service]) )
	BEGIN
	IF EXISTS (SELECT * FROM inserted WHERE ( inserted.[Services] = 1 OR inserted.[Lab_Service] = 1 ) AND ( UPDATE([Services]) OR UPDATE([Lab_Service]) )) 
		BEGIN

		-----------------
		IF EXISTS (SELECT * FROM inserted INNER JOIN dbo.BrokerLst_Master BM ON 
		  inserted.POitem = BM.PO_item WHERE ( inserted.[Services] = 1 OR inserted.[Lab_Service] = 1 ) AND ( UPDATE([Services]) OR UPDATE([Lab_Service]) )) 
			
			BEGIN
			
			PRINT '' Added brokerLst_Process as Process_ID=Cancelled  [PurchaseOrder_Update]''
			INSERT INTO dbo.BrokerLst_Process 
				( [po_item],[SalesPerson],[comment],[process_id],[processor],[AllowSub],[QTY],[ID_Detail] )	
				SELECT  inserted.POitem AS PO_Item
					, SUBSTRING(suser_sname(),CHARINDEX(''\'',suser_sname() )+1 ,20 ) AS SalesPerson
					, ''PO Changed to a Service'' AS Comment
					, ''CANCELLED'' AS Process_ID
					, SUBSTRING(suser_sname(),CHARINDEX(''\'',suser_sname() )+1 ,20 ) AS Processor
					,''N''
					, inserted.Order_QTY
					, SD.ID_Detail AS ID_Detail
				FROM inserted 
					INNER JOIN dbo.BrokerLst_Master SM ON inserted.POitem = SM.PO_item 
					INNER JOIN dbo.BrokerLst_Detail SD ON SM.ID = SD.ID 
					WHERE ( inserted.[Services] = 1 OR inserted.[Lab_Service] = 1 )
					AND ISNULL(SM.heat,''Due in'') = ''Due in''
					AND ( UPDATE([Services]) OR UPDATE([Lab_Service]) )
			
			PRINT '' Delete BrokerLst_Process for PO  [PurchaseOrder_Update]''
			DELETE FROM dbo.BrokerLst_Process
				FROM inserted
				WHERE inserted.POitem = BrokerLst_Process.PO_item 
				AND ( BrokerLst_Process.Process_ID = ''INCOMING  '' 
				OR BrokerLst_Process.Process_ID = ''PARTRECV''
				OR BrokerLst_Process.Process_ID = ''SELECTED  '' )
				AND ( inserted.[Services] = 1 OR inserted.[Lab_Service] = 1 )
				AND ( UPDATE([Services]) OR UPDATE([Lab_Service]) )
			
			PRINT ''Delete BrokerLst_Detail for PO  [PurchaseOrder_Update]''
			DELETE FROM dbo.BrokerLst_Detail
				FROM inserted
				INNER JOIN dbo.BrokerLst_Master SM ON inserted.POitem = SM.PO_item
				INNER JOIN dbo.BrokerLst_Detail SD ON SM.ID = SD.ID
				WHERE inserted.POitem = SM.PO_item 
				AND ( inserted.[Services] = 1 OR inserted.[Lab_Service] = 1 )
				AND ISNULL(SM.heat,''Due in'') = ''Due in''
				AND ( UPDATE([Services]) OR UPDATE([Lab_Service]) )
			
			PRINT ''Delete BrokerLst_Master for PO  [PurchaseOrder_Update]''
			DELETE FROM dbo.BrokerLst_Master
				FROM inserted
				INNER JOIN dbo.BrokerLst_Master SM ON inserted.POitem = SM.PO_item
				WHERE inserted.POitem = SM.PO_item 	
				AND ( inserted.[Services] = 1 OR inserted.[Lab_Service] = 1 )
				AND ISNULL(SM.heat,''Due in'') = ''Due in''
				AND ( UPDATE([Services]) OR UPDATE([Lab_Service]) )
			
			END

		-------------------

		IF EXISTS (SELECT * FROM inserted INNER JOIN dbo.StockLst_Master SM ON 
		  inserted.POitem = SM.PO_item WHERE ( inserted.[Services] = 1 OR inserted.[Lab_Service] = 1 ) AND ( UPDATE([Services]) OR UPDATE([Lab_Service]) )) 
			
			BEGIN
				
			PRINT '' Added StockLst_Process as Process_ID=Cancelled  [PurchaseOrder_Update]''
			INSERT INTO dbo.StockLst_Process 
				( [po_item],[SalesPerson],[comment],[process_id],[processor],[AllowSub],[QTY],[ID_Detail] )	
				SELECT  inserted.POitem AS PO_Item
					, SUBSTRING(suser_sname(),CHARINDEX(''\'',suser_sname() )+1 ,20 ) AS SalesPerson
					, ''PO Changed to a Service'' AS Comment
					, ''CANCELLED'' AS Process_ID
					, SUBSTRING(suser_sname(),CHARINDEX(''\'',suser_sname() )+1 ,20 ) AS Processor
					, ''N''
					, inserted.Order_QTY
					, SD.ID_Detail AS ID_Detail
				FROM inserted 
					INNER JOIN dbo.StockLst_Master SM ON inserted.POitem = SM.PO_item 
					INNER JOIN dbo.StockLst_Detail SD ON SM.ID = SD.ID 
					WHERE ( inserted.[Services] = 1 OR inserted.[Lab_Service] = 1 )
					AND ISNULL(SM.heat,''Due in'') = ''Due in''
					AND ( UPDATE([Services]) OR UPDATE([Lab_Service]) )
				
			PRINT '' Delete StockLst_Process for PO  [PurchaseOrder_Update]''
			DELETE FROM dbo.StockLst_Process
				FROM inserted
				WHERE inserted.POitem = StockLst_Process.PO_item 	
				AND ( StockLst_Process.Process_ID = ''INCOMING  ''
				OR StockLst_Process.Process_ID = ''PARTRECV''
				OR StockLst_Process.Process_ID = ''SELECTED  '' )
				AND ( inserted.[Services] = 1 OR inserted.[Lab_Service] = 1 )
				AND ( UPDATE([Services]) OR UPDATE([Lab_Service]) )
			
			PRINT '' Delete StockLst_Detail for PO  [PurchaseOrder_Update]''
			DELETE FROM dbo.StockLst_Detail
				FROM inserted
				INNER JOIN dbo.StockLst_Master SM ON inserted.POitem = SM.PO_item
				INNER JOIN dbo.StockLst_Detail SD ON SM.ID = SD.ID
				WHERE inserted.POitem = SM.PO_item 
				AND ( inserted.[Services] = 1 OR inserted.[Lab_Service] = 1 )
				AND ISNULL(SM.heat,''Due in'') = ''Due in''
				AND ( UPDATE([Services]) OR UPDATE([Lab_Service]) )
				
			PRINT '' Delete StockLst_Master for PO  [PurchaseOrder_Update]''
			DELETE FROM dbo.StockLst_Master
				FROM inserted
				INNER JOIN dbo.StockLst_Master SM ON inserted.POitem = SM.PO_item
				WHERE inserted.POitem = SM.PO_item 	
				AND ( inserted.[Services] = 1 OR inserted.[Lab_Service] = 1 )
				AND ISNULL(SM.heat,''Due in'') = ''Due in''
				AND ( UPDATE([Services]) OR UPDATE([Lab_Service]) )
			
			END

		-----------------

		IF EXISTS (SELECT * FROM inserted INNER JOIN dbo.WIPLst_Master BM ON 
		  inserted.POitem = BM.PO_item WHERE ( inserted.[Services] = 1 OR inserted.[Lab_Service] = 1 ) AND ( UPDATE([Services]) OR UPDATE([Lab_Service]) )) 
			
			BEGIN
			
			PRINT '' Added Lst_Process as Process_ID=Cancelled  [PurchaseOrder_Update]''
			INSERT INTO dbo.WIPLst_Process 
				( [po_item],[SalesPerson],[comment],[process_id],[processor],[AllowSub],[QTY],[ID_Detail] )	
				SELECT  inserted.POitem AS PO_Item
					, SUBSTRING(suser_sname(),CHARINDEX(''\'',suser_sname() )+1 ,20 ) AS SalesPerson
					, ''PO Changed to a Service'' AS Comment
					, ''CANCELLED'' AS Process_ID
					, SUBSTRING(suser_sname(),CHARINDEX(''\'',suser_sname() )+1 ,20 ) AS Processor
					,''N''
					, inserted.Order_QTY
					, SD.ID_Detail AS ID_Detail
				FROM inserted 
					INNER JOIN dbo.WIPLst_Master SM ON inserted.POitem = SM.PO_item 
					INNER JOIN dbo.WIPLst_Detail SD ON SM.ID = SD.ID 
					WHERE ( inserted.[Services] = 1 OR inserted.[Lab_Service] = 1 )
					AND ISNULL(SM.heat,''Due in'') = ''Due in''
					AND ( UPDATE([Services]) OR UPDATE([Lab_Service]) )
			
			PRINT '' Delete Lst_Process for PO  [PurchaseOrder_Update]''
			DELETE FROM dbo.WIPLst_Process
				FROM inserted
				WHERE inserted.POitem = WIPLst_Process.PO_item 
				AND ( WIPLst_Process.Process_ID = ''INCOMING  '' 
				OR WIPLst_Process.Process_ID = ''PARTRECV''
				OR WIPLst_Process.Process_ID = ''SELECTED  '' )
				AND ( inserted.[Services] = 1 OR inserted.[Lab_Service] = 1 )
				AND ( UPDATE([Services]) OR UPDATE([Lab_Service]) )
			
			PRINT ''Delete Lst_Detail for PO  [PurchaseOrder_Update]''
			DELETE FROM dbo.WIPLst_Detail
				FROM inserted
				INNER JOIN dbo.WIPLst_Master SM ON inserted.POitem = SM.PO_item
				INNER JOIN dbo.WIPLst_Detail SD ON SM.ID = SD.ID
				WHERE inserted.POitem = SM.PO_item 
				AND ( inserted.[Services] = 1 OR inserted.[Lab_Service] = 1 )
				AND ISNULL(SM.heat,''Due in'') = ''Due in''
				AND ( UPDATE([Services]) OR UPDATE([Lab_Service]) )
			
			PRINT ''Delete Lst_Master for PO  [PurchaseOrder_Update]''
			DELETE FROM dbo.WIPLst_Master
				FROM inserted
				INNER JOIN dbo.WIPLst_Master SM ON inserted.POitem = SM.PO_item
				WHERE inserted.POitem = SM.PO_item 	
				AND ( inserted.[Services] = 1 OR inserted.[Lab_Service] = 1 )
				AND ISNULL(SM.heat,''Due in'') = ''Due in''
				AND ( UPDATE([Services]) OR UPDATE([Lab_Service]) )
			
			END
		-----------------------
		END		
	END

---
DECLARE @File VARCHAR(8000), @NewName VARCHAR(8000),  @POitem2 CHAR(12)

--Reconcile to begin at Receive level!!! 2020
--Then total to PO level as a bucket

IF UPDATE(Reconciled) AND UPDATE(ReconcileTotal)
	BEGIN
	IF EXISTS (SELECT * FROM inserted INNER JOIN deleted ON deleted.POitem = inserted.POitem
				 WHERE ISNULL(inserted.ConvServ,0)=1 
				 AND ISNULL(inserted.Reconciled,0)=1 
				 AND ISNULL(deleted.Reconciled,0)=0 
				 AND ISNULL(inserted.ReconcileTotal,0) > 0 )
		BEGIN
		PRINT ''  PO finalize has updated PO with Invoice numbers, PO was not reconciled before.  [PurchaseOrder_Update]''
		
		--, @Body VARCHAR(8000)
		SET @cEmailFrom = ERP_2.dbo.f_GetSQL_Server_Email();
		
		SET @Body = ''A Conversion Service PO Invoice has been posted.  The material cost in Stock list must now be updated, recalculated.''
		
		SELECT TOP 1 @POitem2 = RTRIM(inserted.POitem) FROM inserted
			INNER JOIN deleted ON deleted.POitem = inserted.POitem
				 WHERE ISNULL(inserted.ConvServ,0)=1 
				 AND ISNULL(inserted.Reconciled,0)=1 
				 AND ISNULL(deleted.Reconciled,0)=0 
				 AND ISNULL(inserted.ReconcileTotal,0)>0
				 AND UPDATE(Reconciled)

--SELECT dbo.f_get_Order_Description(''WO'',1020,'''')
--SELECT dbo.f_get_Order_Description(''WO_Detail'',1020,'''')
--SELECT dbo.f_get_Order_Description(''POitem'',0,''507113-01'')
--SELECT dbo.f_get_Order_Description(''SOitem'',0,''105000-01'')

		SET @Body = @Body +''<br />''+dbo.f_get_Order_Description(''POitem'',0,@POitem2)
		SET @Body = @Body +''<br />''+dbo.f_HTML_link_POitem(@POitem2)
		SET @Body = @Body +''<br />''+dbo.f_HTML_link_Receiving_POitem(@POitem2)
		SET @Body = @Body +''<br />''+@@SERVERNAME+'' TRIGGER dbo.purchaseOrder_Update '' 

		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = ''accounting@ERP_1s.com; VFPprogramming@ERP_1s.com'', 
			 @SubjectEmail = ''Conversion POitem, Paid Invoice.'' ,
			 @BodyEmail = @Body,
			 @BodyType = ''HTML''		
			 		 
		END
	END

DECLARE @PO_Item CHAR(12)
DECLARE @nRowcount INT

--Update StockLst as have been invoiced, ''A'' Accounted.
	-- Done in purchase_finalize_lst.scx  
--Remove Reconciled ''INCOMING'' from StockLst_Process
	--Too soon! 
--Reconciled and Not Delivered.
	--Too soon! 


--Start QA Vendor Email	
IF EXISTS (SELECT * FROM inserted WHERE dbo.f_IsVendorDLA_BMS (inserted.VendCode) = 1 
	AND (RTRIM(VendCode) != '''' OR RTRIM(VendCode) != 0) -- AND UPDATE(VendCode) 
	AND ISNULL(received, CONVERT(datetime,''2000-01-01 00:00:00.000'')) = CONVERT(datetime,''2000-01-01 00:00:00.000'')
	AND (SELECT TOP 1 [sent_date]
		  FROM [msdb].[dbo].[sysmail_sentitems]
		  WHERE recipients = ''QA@ERP_1s.com''
		  ORDER BY mailitem_id desc) < DATEADD(MINUTE, -5, GETDATE()) )

	BEGIN
	
	DECLARE @poItemText varchar(100), @sub varchar(50), @poText varchar(100), @link varchar(300)
	SELECT @poItemText = RTRIM(inserted.POitem)
		FROM inserted
		
	SELECT @poText = RTRIM(inserted.hpapo)
		FROM inserted
	
	PRINT ''  Updated DLA Purchase Order Item  [PurchaseOrder_Update]''
	SET @sub = ''Updated DLA Purchase Order Item ('' + @poItemText +'')''
	
	DECLARE @SendEmail bit = 0
	  ,@POitem varchar(10) = ''false''
      ,@SalesP  varchar(10) = ''false''
      ,@Company varchar(10) = ''false''
      ,@Alloy varchar(10) = ''false''
      ,@Form varchar(10) = ''false''
      ,@CC varchar(10) = ''false''
      ,@order_qty varchar(10) = ''false''
      ,@pieces varchar(10) = ''false''
      ,@thck varchar(10) = ''false''
      ,@sz2 varchar(10) = ''false''
      ,@sz3 varchar(10) = ''false''
      ,@orderdate varchar(10) = ''false''
      ,@due_max varchar(10) = ''false''
      ,@cond_spec varchar(10) = ''false''
      ,@misc_purch varchar(10) = ''false''
      ,@heat varchar(10) = ''false''
      ,@cert varchar(10) = ''false''
      ,@posalesp varchar(10) = ''false''
      ,@Randlen varchar(10) = ''false''
      ,@HPA_Due_Max varchar(10) = ''false''
      ,@First_Due_Max varchar(10) = ''false''

	--IF UPDATE(poitem)
	--	BEGIN
	--	SET @POitem = ''true''
	--	SET @SendEmail = 1
	--	END
		
	--IF UPDATE(SalesP)
	--	BEGIN
	--	SET @SalesP = ''true''
	--	SET @SendEmail = 1
	--	END
		
	IF UPDATE(Company)
		BEGIN
		SET @Company = ''true''
		SET @SendEmail = 1
		END
		
	IF UPDATE(Alloy)
		BEGIN
		SET @Alloy = ''true''
		SET @SendEmail = 1
		END
		
	IF UPDATE(Form)
		BEGIN
		SET @Form = ''true''
		SET @SendEmail = 1
		END
		
	IF UPDATE(CC)
		BEGIN
		SET @CC = ''true''
		SET @SendEmail = 1
		END
		
	IF UPDATE(order_qty)
		BEGIN
		SET @order_qty = ''true''
		SET @SendEmail = 1
		END
		
	IF UPDATE(pieces)
		BEGIN
		SET @pieces = ''true''
		SET @SendEmail = 1
		END
		
	IF UPDATE(thck)
		BEGIN
		SET @thck = ''true''
		SET @SendEmail = 1
		END
		
	IF UPDATE(sz2)
		BEGIN
		SET @sz2 = ''true''
		SET @SendEmail = 1
		END
		
	IF UPDATE(sz3)
		BEGIN
		SET @sz3 = ''true''
		SET @SendEmail = 1
		END
		
	IF UPDATE(orderdate)
		BEGIN
		SET @orderdate = ''true''
		SET @SendEmail = 1
		END
		
	IF UPDATE(due_max)
		BEGIN
		SET @due_max = ''true''
		SET @SendEmail = 1
		END
		
	IF UPDATE(cond_spec)
		BEGIN
		SET @cond_spec = ''true''
		SET @SendEmail = 1
		END
		
	IF UPDATE(misc_purch)
		BEGIN
		SET @misc_purch = ''true''
		SET @SendEmail = 1
		END
		
	IF UPDATE(heat)
		BEGIN
		SET @heat = ''true''
		SET @SendEmail = 1
		END
		
	--IF UPDATE(cert)
	--	BEGIN
	--	SET @cert = ''true''
	--	SET @SendEmail = 1
	--	END
		
	--IF UPDATE(posalesp)
	--	BEGIN
	--	SET @posalesp = ''true''
	--	SET @SendEmail = 1
	--	END
		
	--IF UPDATE(Randlen)
	--	BEGIN
	--	SET @Randlen = ''true''
	--	SET @SendEmail = 1
	--	END
		
	IF UPDATE(HPA_Due_Max)
		BEGIN
		SET @HPA_Due_Max = ''true''
		SET @SendEmail = 1
		END
		
	IF UPDATE(First_Due_Max)
		BEGIN
		SET @First_Due_Max = ''true''
		SET @SendEmail = 1
		END
	
	IF @SendEmail = 1
		BEGIN
		
		SET @link = ''https://web.ERP_1.com/HPA/QA/ApprovePO.aspx?poitem='' + @poItemText
		+ ''&Company='' + @Company + ''&Alloy='' + @Alloy + ''&Form='' + @Form + ''&CC='' + @CC + ''&order_qty='' + @order_qty + ''&pieces='' + @pieces
		+ ''&thck='' + @thck + ''&sz2='' + @sz2 + ''&sz3='' + @sz3 + ''&orderdate='' + @orderdate + ''&due_max='' + @due_max
		+ ''&cond_spec='' + @cond_spec + ''&misc_purch='' + @misc_purch + ''&heat='' + @heat --''&cert='' + @cert + ''&posalesp='' + @posalesp + ''&Randlen='' + @Randlen + 
		+ ''&HPA_Due_Max='' + @HPA_Due_Max + ''&First_Due_Max='' + @First_Due_Max
		
		SELECT @Body = ''<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 5.0 Strict//EN"><html>	<head>		<title></title>	    </head>
		<body>    <p>Quality Manager,</p>
		<p>A Purchase Order Item associated with a DLA Vendor has been updated ('' + @poItemText +'') by '' + SYSTEM_USER + '' at '' + CONVERT(Varchar, GETDATE()) + ''.</p>
		<p>Please check the purchase order item ('' + @poItemText +'') for any errors and complete the approval or rejection process by clicking or coping/pasting the following link 
		into your browser.</p>
		<p><a href="'' + @link + ''">'' + @link + ''</a></p>
		<p>To view an online version of the complete purchase order, click <a href="''
		+dbo.f_Reportlink_INT(''HPAPO'',@poText) +''">here</a>.</p>
		<p>Regards,</p><p>Automated System<br />Secure Website Authorization System<br /><a href="mailto:Admin@ERP_1s.com">Admin@ERP_1s.com</a></p>
		<p>High Performance Alloys, Inc.<br />PH: (800) 472-5569</p>
		<p>An ISO 9001:2015 Registered Company</p></body></html>''
				
		SET @cEmailFrom = ERP_2.dbo.f_GetSQL_Server_Email()
		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = ''QA@ERP_1s.com'', 
			 @SubjectEmail = @sub ,
			 @BodyEmail = @Body,
			 @BodyType = ''HTML''		
			 
		PRINT '' Sent DLA Vendor Email to QA   [PurchaseOrder_Update]''
			 
		END
	END


--------------
--IF UPDATE(SalesNum)
IF EXISTS (SELECT * FROM inserted,deleted WHERE inserted.SalesNum <> deleted.SalesNum AND UPDATE(SalesNum)) 
	begin

	--DECLARE @cCompany VARCHAR(30)
	DECLARE @nPO INT = 0
	DECLARE @cSOitem CHAR(10)

	SELECT TOP 1
		@cCompany = Company
		,@nPO = ISNULL(HPAPO,0)
		,@cSOitem = SOitem
		FROM Inserted
			WHERE HPAPO > 0
			AND ISNULL(SalesNum,0) > 0 
			AND UPDATE(SalesNum)
			AND ISNULL([Services],0) = 0 
			AND ISNULL(ConvServ,0) = 0 
			AND ISNULL(Equipment,0) = 0
			AND dbo.f_ProperSOitem(SOitem) <> dbo.f_ProperSOitem('''')
			--SOitem must be real, some times a word like ''Stock'' is stored here.

	IF @nPO > 0 AND @nPO > 500000
		EXEC dbo.p_AllQuotes_AddPO @cCompany, @nPO, @cSOitem

	end

--------------
--IF UPDATE(Hold)
IF EXISTS (SELECT * FROM inserted,deleted WHERE ISNULL(inserted.Hold,0) <> ISNULL(deleted.Hold,0) AND inserted.POitem = deleted.POitem AND UPDATE(Hold)) 
begin
	PRINT ''Update HOLD'';

	DECLARE @nUserID INT = 0
	DECLARE @cSalesRep VARCHAR(20)
	DECLARE @cSalesP char(1) = ''''
	DECLARE @cPOitem CHAR(12) = ''''
	DECLARE @cHoldMessage VARCHAR(255) = ''''
	DECLARE @cVendor VARCHAR(30) = ''''
	DECLARE @cHoldTxt CHAR(8) = ''ON HOLD''
	DECLARE @bHold BIT = 0
	DECLARE @SP_Email VARCHAR(30) = ''''

	DECLARE @cUser VARCHAR(100) = left(suser_sname(),100)

--****************************************
/* begin transaction
UPDATE dbo.PurchaseOrder SET Hold=1 WHERE PoItem = dbo.f_ProperPOitem('' 506347-02'') 
rollback
*/
--****************************************
	PRINT ''SELECT TOP(1) @cSalesP = inserted.SalesP''

	DECLARE @xmltmp xml = (SELECT TOP 1 inserted.SalesP as SalesP
		, inserted.POitem as POitem
		,ISNULL(inserted.Company,'''') AS Vendor
		,case when ISNULL(inserted.hold,0) = 0 then ''Off Hold'' else ''On Hold'' end AS HoldTxt
		,ISNULL(inserted.hold,0) AS hold
		FROM inserted
		INNER JOIN deleted on inserted.POitem = deleted.POitem
		WHERE inserted.Hold <> deleted.Hold AND inserted.POitem = deleted.POitem AND UPDATE(Hold)
		AND dbo.f_ProperPOitem('''') <> dbo.f_ProperPOitem(inserted.POitem) FOR XML AUTO)
	PRINT CONVERT(NVARCHAR(MAX), @xmltmp)


	SELECT TOP 1 @cSalesP = inserted.SalesP
		,@cPOitem = inserted.POitem
		,@cVendor = ISNULL(inserted.Company,'''')
		,@cHoldTxt = case when ISNULL(inserted.hold,0) = 0 then ''Off Hold'' else ''On Hold'' end
		,@bHold = ISNULL(inserted.hold,0)
		FROM inserted
		INNER JOIN deleted on inserted.POitem = deleted.POitem
		WHERE ISNULL(inserted.Hold,0) <> ISNULL(deleted.Hold,0) 
			AND inserted.POitem = deleted.POitem 
			AND UPDATE(Hold)
			AND dbo.f_ProperPOitem('''') <> dbo.f_ProperPOitem(inserted.POitem)

	--PRINT ''use MyCursorPOInsert''
	--declare MyCursorPOInsert cursor STATIC for 
	--SELECT TOP 1 inserted.SalesP as SalesP
	--	, inserted.POitem as POitem
	--	,ISNULL(inserted.Company,'''') AS Vendor
	--	,case when ISNULL(inserted.hold,0) = 0 then ''Off Hold'' else ''On Hold'' end AS HoldTxt
	--	,ISNULL(inserted.hold,0) AS hold
	--	FROM inserted
	--	INNER JOIN deleted on inserted.POitem = deleted.POitem
	--	WHERE inserted.Hold <> deleted.Hold AND inserted.POitem = deleted.POitem AND UPDATE(Hold)
	--	AND dbo.f_ProperPOitem('''') <> dbo.f_ProperPOitem(inserted.POitem)
	--open MyCursorPOInsert
	--FETCH NEXT FROM MyCursorPOInsert INTO @cSalesP, @cPOitem, @cVendor, @cHoldTxt, @bHold
	--close MyCursorPOInsert
	--DEALLOCATE MyCursorPOInsert
	--PRINT ''close MyCursorPOInsert''

	--SET @cSalesP2 = SUBSTRING(CONVERT(varchar(500),@xmltmp), 19, 1)
	--PRINT SUBSTRING(CONVERT(varchar(500),@xmltmp), 19, 1)
	PRINT @cSalesP

	IF LEN(@cSalesP)>0
		SET @cSalesRep = dbo.f_SaleRep_SP(@cSalesP)
	ELSE
		SET @cSalesRep = ''''

	SET @SP_Email = dbo.f_SaleRep_Email_SP(@cSalesP)

	PRINT ''SP Email ''+@SP_Email

	-- GET SALES REP CHATTER ID
	IF LEN(@cSalesRep) > 0
	    SELECT TOP 1 @nUserID = UserID
           FROM [Messenger].[dbo].[Users] WITH(NOLOCK)
           WHERE LTRIM(RTRIM(UserName)) = @cSalesRep
	
	PRINT @nUserID
	SET @cEmailFrom = ERP_2.dbo.f_GetSQL_Server_Email()

	-- trigger a chatter message.
	IF @nUserID > 0
		begin

		SET @cHoldMessage = ''PO item:''+@cPOitem+'' HOLD status changed by PurchaseOrder_Update trigger. ''
			+CHAR(10)+CHAR(13)+'' Now ''+@cHoldTxt+''. Vendor:''+@cVendor+'', SalesRep:''+@cSalesRep+'', by ''+@cUser
			+'' trigger PurchaseOrder_Update '';

		INSERT INTO [Messenger].[dbo].[Message]
             (
                 [UserID],
                 [Message]
             )
             VALUES
             (
                 @nUserID,
                 @cHoldMessage
             )
		
		--take out bad charaters
		SET @cHoldMessage = ''PO item:''+@cPOitem+'' HOLD status changed by PurchaseOrder_Update trigger. ''
			+'' Now ''+@cHoldTxt+''. Vendor:''+@cVendor+'', SalesRep:''+@cSalesRep+'', by ''+@cUser
			+'' trigger PurchaseOrder_Update '';

		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = ''David.Kirchner@ERP_1s.com'', 
			 @SubjectEmail = ''Sent PO Hold to Chatter'' ,
			 @BodyEmail = @cHoldMessage,
			 @BodyType = ''TEXT''		
		end
	ELSE
		begin
		--take out bad charaters
		SET @cHoldMessage = ''PurchaseOrder_Update trigger Could not place PO Hold into the Messenger Chatter system. ''
			+''PO item:''+@cPOitem+'' HOLD status changed. Now ''+@cHoldTxt+''. Vendor:''+@cVendor+'' by ''+@cUser
			+'' trigger PurchaseOrder_Update'' ;

		SET @cEmailFrom = ERP_2.dbo.f_GetSQL_Server_Email()
		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = ''David.Kirchner@ERP_1s.com'', 
			 @SubjectEmail = ''Could NOT Chatter the PO Hold.'' ,
			 @BodyEmail = @cHoldMessage,
			 @BodyType = ''TEXT''		
		end

	--Record
	PRINT ''Record HOLD to Notes''

	INSERT INTO dbo.PO_Item_Notes (POitem,Notes) Values (@cPOitem,@cHoldMessage)

	INSERT INTO [dbo].[Sales_Hold_Status] 
			(
				[SOitem]
				,[SalesNum]
				,[POitem]
				,[Hold_Type]
				,[Hold_Value]
				,[Who]
				,[What]
				,[Comment]
			)
			VALUES 
			(
				'''', -- cannot set to null so leave as empty string
				0,
				@cPOitem,
				''PO'',
				@bHold,
				suser_sname(),
				''PO '' + @cHoldTxt,
				@cHoldMessage
			)
	--INSERT INTO dbo.Sales_Hold_Status (SOitem,SalesNum,POitem,Hold_Type,Hold_Value,Comment) Values ('''',0,@cPOitem,''PO Receive'',@bHold,@cHoldMessage)

end
/*
*code to change a PO number
IF UPDATE(POitem)
	SELECT MAX(HPAPO) AS OldMax FROM PurchaseOrder

	DECLARE @HPAPO_Old INT, @HPAPO_New INT, @POitem_Old CHAR(12), @POitem_New CHAR(12), @ItemPO TinyInt
	SET @HPAPO_Old = 5038478
	SET @HPAPO_New = 503878
	SET @ItemPO_New = 1
	SET @POitem_Old = ''  5038478-01''
	SET @POitem_New = ''   503878-01''
	
	SELECT * FROM PurchaseOrder WHERE HPApo = HPAPO_Old

	UPDATE dbo.AllQuotes SET POitem = @POitem_New WHERE POitem = @POitem_Old
	UPDATE dbo.AllQuotes SET HPAPO  = @HPAPO_New WHERE HPAPO  = @HPAPO_Old
	UPDATE dbo.AllQuotes SET HPAPO2 = @HPAPO_New WHERE HPAPO2 = @HPAPO_Old

	UPDATE dbo.Stocklst_Master   SET PO_item=@POitem_New WHERE PO_item = @POitem_Old
	UPDATE dbo.StockLst_Process  SET PO_item=@POitem_New WHERE PO_item = @POitem_Old

	UPDATE dbo.BrokerLst_Master  SET PO_item=@POitem_New WHERE PO_item = @POitem_Old
	UPDATE dbo.BrokerLst_Process SET PO_item=@POitem_New WHERE PO_item = @POitem_Old

	UPDATE dbo.WIPLst_Master  SET PO_item=@POitem_New WHERE PO_item = @POitem_Old
	UPDATE dbo.WIPLst_Process SET PO_item=@POitem_New WHERE PO_item = @POitem_Old

	UPDATE dbo.PurchaseOrder SET POitem = @POitem_New, HPApo = @HPAPO_New, ItemPO = @ItemPO_New WHERE POitem = @POitem_Old

	UPDATE dbo.Receiving SET POitem=@POitem_New WHERE POitem = @POitem_Old

	UPDATE dbo.PO_ProcessNotes SET POitem = @POitem_New WHERE POitem = @POitem_Old
	UPDATE dbo.PO_SOdist SET POitem = @POitem_New WHERE POitem = @POitem_Old
	UPDATE dbo.PO_Testing SET POitem = @POitem_New WHERE POitem = @POitem_Old

	UPDATE dbo.PO_NO SET HPAPO  = @HPAPO_New WHERE HPAPO  = @HPAPO_Old

	SELECT * FROM PurchaseOrder WHERE HPApo = @HPApo OR POitem = @POitem_Old

*/
PRINT ''Trigger  end  [PurchaseOrder_Update]''

END
' 
GO
ALTER TABLE [dbo].[PurchaseOrder] ENABLE TRIGGER [PurchaseOrder_Update]
GO
/****** Object:  Trigger [dbo].[QuickCompany_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[QuickCompany_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[QuickCompany_Insert] 
ON [dbo].[QuickCompany] 
	FOR INSERT  
	NOT FOR REPLICATION
AS

	UPDATE dbo.QuickCompany
	   SET [xCompName] = dbo.[f_GetxCompName](inserted.phone,inserted.Company,inserted.Name)
	   , [xComp] = ISNULL(inserted.Phone,SPACE(10))+ISNULL(SOUNDEX(inserted.Company),SPACE(4))
	   , [LastEdit] = CAST(GetDate() AS SmallDateTime)
	   , [NoNoiseName] = dbo.f_NoNoiseName(inserted.Company)
	 FROM [inserted]
	 WHERE QuickCompany.ID = inserted.ID
' 
GO
ALTER TABLE [dbo].[QuickCompany] ENABLE TRIGGER [QuickCompany_Insert]
GO
/****** Object:  Trigger [dbo].[QuickCompany_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[QuickCompany_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[QuickCompany_Update] ON [dbo].[QuickCompany] 
	FOR UPDATE 
	NOT FOR REPLICATION
AS

IF (UPDATE(Company) 
	or UPDATE([Name])
	or UPDATE(PHONE)
	)
	begin

		UPDATE [dbo].[QuickCompany]
		   SET [xCompName] = dbo.[f_GetxCompName](inserted.phone,inserted.Company,inserted.Name)
           , [xComp] = ISNULL(inserted.Phone,SPACE(10))+ISNULL(SOUNDEX(inserted.Company),SPACE(4))
           , [LastEdit] = CAST(GetDate() AS SmallDateTime)
		   , [NoNoiseName] = dbo.f_NoNoiseName(inserted.Company) 
		 FROM [inserted]
		 WHERE [QuickCompany].ID = inserted.ID


	end
	
' 
GO
ALTER TABLE [dbo].[QuickCompany] DISABLE TRIGGER [QuickCompany_Update]
GO
/****** Object:  Trigger [dbo].[Quote_NO_INSERT]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Quote_NO_INSERT]'))
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		<David Kirchner>
-- =============================================
CREATE TRIGGER [dbo].[Quote_NO_INSERT]
   ON [dbo].[Quote_No] 
   FOR INSERT 
   NOT FOR REPLICATION
AS 
BEGIN
SET NOCOUNT ON;

/*
DECLARE @lHPAcapable BIT
SELECT @lHPAcapable = ISNULL(HPAcapable,0) FROM inserted

IF @lHPAcapable > 0
	BEGIN

	DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
	DECLARE @Body varchar(4000)
	SELECT @Body = (''A quote was made with HPA capable selected ''+CHAR(13)
		+'' InqNumP:''+RTRIM(inserted.InqNumP)+CHAR(13)
		+'' Coments:''+RTRIM(inserted.Comments)+CHAR(13)
		+''Entered by ''+RTRIM(suser_sname())
		+'' on ''+RTRIM(GETDATE()) ) 
		FROM inserted

		EXEC dbo.p_eMail_Send
			 @FromEmail = ''cEmailFrom, 
			 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
			 @SubjectEmail = ''HPA Capable Quote.'',
			 @BodyEmail = @Body,
			 @BodyType = ''TEXT''		
			 
	END
*/

END' 
GO
ALTER TABLE [dbo].[Quote_No] ENABLE TRIGGER [Quote_NO_INSERT]
GO
/****** Object:  Trigger [dbo].[Quote_NO_UPDATE]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Quote_NO_UPDATE]'))
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		<David Kirchner>
-- =============================================
CREATE TRIGGER [dbo].[Quote_NO_UPDATE]
   ON [dbo].[Quote_No] 
   FOR UPDATE 
   NOT FOR REPLICATION
AS 
BEGIN
SET NOCOUNT ON;
/*
DECLARE @lHPAcapable BIT
SELECT @lHPAcapable = ISNULL(HPAcapable,0) FROM inserted

IF @lHPAcapable > 0
	BEGIN

	DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
	DECLARE @Body varchar(4000)
	SELECT @Body = (''A quote was made with HPA capable selected ''+CHAR(13)
		+'' InqNumP:''+RTRIM(inserted.InqNumP)+CHAR(13)
		+'' Coments:''+RTRIM(inserted.Comments)+CHAR(13)
		+''Entered by ''+RTRIM(suser_sname())
		+'' on ''+RTRIM(GETDATE())+''.''
			+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.Quote_NO_Update ''  ) 
		FROM inserted

		EXEC dbo.p_eMail_Send
			 @FromEmail = cEmailFrom, 
			 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
			 @SubjectEmail = ''HPA Capable Quote.'',
			 @BodyEmail = @Body,
			 @BodyType = ''TEXT''		
	
		END
*/

END

' 
GO
ALTER TABLE [dbo].[Quote_No] ENABLE TRIGGER [Quote_NO_UPDATE]
GO
/****** Object:  Trigger [dbo].[Receiving_After_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Receiving_After_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[Receiving_After_Update]
   ON  [dbo].[Receiving] 
   AFTER UPDATE 
   NOT FOR REPLICATION
AS 
BEGIN

SET NOCOUNT ON;
DECLARE @HTMLHead varchar(4000)
DECLARE @Body varchar(4000)
DECLARE @currID INT
DECLARE @currTbl CHAR(1)	
DECLARE @Tbl CHAR(1)
DECLARE @ID_Master INT
DECLARE @CurrentID_Master INT

PRINT ''Start trigger Receiving_After_Update''


SELECT @HTMLHead = dbo.f_Get_HTML_Header()

DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
	
--Email when Receiving does not Pass inspection!
IF UPDATE(Pass)
	IF EXISTS (SELECT * FROM inserted WHERE ISNULL([Pass],1) = 0 AND RMA_No = 0 ) 
		BEGIN
		DECLARE @SalesPEmail VARCHAR(100) = ''David.Kirchner@ERP_1s.com''
		DECLARE @SalesP CHAR(1)

		
		SELECT TOP 1 @Body = @HTMLHead +''Receiving!''+''<br />''
			+dbo.f_HTML_link_ReceivingID(inserted.ID)+''</a>''+''<br />'' 
			+dbo.f_HTML_link_Receiving_POitem(inserted.POitem)+''</a>''+''<br />'' 
			+dbo.f_HTML_link_WO_Detail(inserted.WO_Detail)+''</a>''+''<br />'' 
			FROM inserted
			WHERE ISNULL([Pass],1) = 0 AND ISNULL(RMA_No,0) = 0
			--+dbo.f_HTML_link_Vendor_Info(inserted.POitem)+''</a>''+''<br />'' wanted Vendor Name

		PRINT ''Email that Receiving did not Pass inspection!''

		IF EXISTS ( SELECT * FROM inserted WHERE NOT ( inserted.SOitem = dbo.f_ProperSOitem('''') AND ISNULL(inserted.WO_Detail,0) = 0)
					AND ISNULL([Pass],1) = 0 AND ISNULL(RMA_No,0) = 0 )
			begin
			
			SELECT TOP 1 @Body = @Body + ''<br />''
				+dbo.f_HTML_link_SOitem(inserted.SOitem)+''</a>''+''<br />''
				FROM inserted
				WHERE inserted.SOitem != dbo.f_ProperSOitem('''') 
					AND ISNULL([Pass],1) = 0 AND ISNULL(RMA_No,0) = 0
					
			SELECT @SalesP = dbo.Whos_Sales_Order(dbo.UDF_ParseChars_Int(inserted.SOitem)) FROM inserted WHERE ISNULL([Pass],1) = 0
			
			SET @SalesP = RIGHT(RTRIM(@SalesP),1)

			SET @SalesPEmail = dbo.SalesPEmail(@SalesP)
			
			end
			
		SELECT TOP 1 @Body = @Body + ''<br />''
			+''Entered by ''+RTRIM(suser_sname())+'' on ''+RTRIM(GETDATE())+''.''+''<br />''
			+''Table:''+ISNULL(inserted.StockTable,'''') +''  ID_Master:''+LTRIM(STR(ISNULL(inserted.ID_Master,0))) +''<br />''
			+''Table:''+ISNULL(dbo.f_TableName_ReceivingID(inserted.ID),''N'')+''  ID_Master:''+LTRIM(STR(ISNULL(dbo.f_TableID_ReceivingID(inserted.ID),0)))+''.''+''<br />''
			+@@SERVERNAME+''<br />''
			FROM inserted
			WHERE ISNULL([Pass],1) = 0 AND RMA_No = 0
							
		SET @Body = @Body + ''<br />''+''<br />'' + ''Receiving Did Not Pass Inspection.''
		SET @Body = @Body + ''<br />'' + ''Trigger [dbo].[Receiving_After_Update].''
		SET @Body = @Body + ''</body></html>''
		
		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = @SalesPEmail ,
			 @SubjectEmail = ''Receiving Did Not Pass.'',
			 @BodyEmail = @Body,
			 @BodyType = ''HTML''		
			 	
		END

----------------------------------------------------
PRINT ''Insert into dbo.Ar_Receiving_Hist WHERE [ID_Master] changes.''
  
INSERT INTO dbo.Ar_Receiving_Hist 
(	[ID],
	[Received],
	[POitem],
	[SOitem],
	WO,WO_Detail,
	[Alloy],[Form],
	[Heat],
	[Cert],
	[Pieces],
	[Description],
	[Specs],
	[Comments],
	[Init],
	[Date],
	[Pass],
	[GoodPapers],
	[ActualW],
	[BillW],
	[Vendor],
	[Cancelled],
	[WhoAdd],
	[WhenAdd],
	[ID_Master],[ID_Detail],[StockTable],
	[RejectPC],
	[RejectReason],
	[RMA_No],
	RMA_Detail,VeriRecv,AcctNotify,AcctFinish,VI_ID_Detail,R_QTY,R_P,
	R_PU,
	[hold],
    [PO_QTY],[PO_P],[PO_PU],
	[Services],[ConvServ],[Equipment],[Lab_Service],[CertID],
	[Who],[What],[When]  ) 
SELECT
	deleted.[ID],
	deleted.[Received],
	deleted.[POitem],
	deleted.[SOitem],
	deleted.WO,deleted.WO_Detail,
	deleted.[Alloy],deleted.[Form],
	deleted.[Heat],
	deleted.[Cert],
	deleted.[Pieces],
	deleted.[Description],
	deleted.[Specs],
	deleted.[Comments],
	deleted.[Init],
	deleted.[Date],
	deleted.[Pass],
	deleted.[GoodPapers],
	deleted.[ActualW],
	deleted.[BillW],
	deleted.[Vendor],
	deleted.[Cancelled],
	deleted.[WhoAdd],
	deleted.[WhenAdd],
	deleted.[ID_Master],deleted.[ID_Detail],deleted.[StockTable],
	deleted.[RejectPC],
	deleted.[RejectReason],
	deleted.[RMA_No],
	deleted.RMA_Detail,deleted.VeriRecv,deleted.AcctNotify,deleted.AcctFinish,deleted.VI_ID_Detail,deleted.R_QTY,deleted.R_P,
	deleted.R_PU,
	deleted.[hold],
    deleted.[PO_QTY],deleted.[PO_P],deleted.[PO_PU],
	deleted.[Services],deleted.[ConvServ],deleted.[Equipment],deleted.[Lab_Service],deleted.[CertID],
	 suser_sname() AS [Who],	''Edit'' AS [What],	GETDATE() AS [When]
	FROM deleted, inserted
		WHERE deleted.ID=inserted.ID AND 
		(  deleted.[Received] <> inserted.[Received]
		OR deleted.[Alloy] <> inserted.[Alloy]
		OR deleted.[Heat] <> inserted.[Heat]
		OR deleted.Specs <> inserted.Specs
		OR deleted.ActualW <> inserted.BillW 
		OR deleted.[ID_Master] <> inserted.[ID_Master] 
		OR ISNULL(deleted.StockTable,'''') <> ISNULL(inserted.StockTable,'''')
		)

/*
	OR UPDATE([POitem]) OR UPDATE([SOitem]) 
	OR UPDATE([WO]) OR UPDATE([WO_Detail]) OR UPDATE([Alloy]) OR UPDATE([Heat])
	OR UPDATE(Pieces) OR UPDATE(Specs) OR UPDATE(Pass) OR UPDATE(GoodPapers)
	OR UPDATE(ActualW) OR UPDATE(BillW)
*/


PRINT ''End   trigger Receiving_After_Update''
END
' 
GO
ALTER TABLE [dbo].[Receiving] ENABLE TRIGGER [Receiving_After_Update]
GO
/****** Object:  Trigger [dbo].[Receiving_Delete]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Receiving_Delete]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[Receiving_Delete] ON [dbo].[Receiving] 
	FOR DELETE 
	--NOT FOR REPLICATION
AS


INSERT INTO dbo.Ar_Receiving_Hist 
(	[ID],
	[Received],
	[POitem],
	[SOitem],
	WO,WO_Detail,
	[Alloy],[Form],
	[Heat],
	[Cert],
	[Pieces],
	[Description],
	[Specs],
	[Comments],
	[Init],
	[Date],
	[Pass],
	[GoodPapers],
	[ActualW],
	[BillW],
	[Vendor],
	[Cancelled],
	[WhoAdd],
	[WhenAdd],
	[ID_Master],
	[ID_Detail],
	[StockTable],
	[RejectPC],
	[RejectReason],
	[RMA_No],
	RMA_Detail,VeriRecv,AcctNotify,AcctFinish,VI_ID_Detail,
	R_QTY, R_P, R_PU,
	R_AP_P, 
	[hold],
    [PO_QTY], [PO_P], [PO_PU],
	[Services],[ConvServ],[Equipment],[Lab_Service],[CertID],
	[Who],
	[What],
	[When]   ) 
SELECT
	[ID],
	[Received],
	[POitem],
	[SOitem],
	WO,WO_Detail,
	[Alloy],[Form],
	[Heat],
	[Cert],
	[Pieces],
	[Description],
	[Specs],
	[Comments],
	[Init],
	[Date],
	[Pass],
	[GoodPapers],
	[ActualW],
	[BillW],
	[Vendor],
	[Cancelled],
	[WhoAdd],
	[WhenAdd],
	[ID_Master],
	[ID_Detail],
	[StockTable],
	[RejectPC],
	[RejectReason],
	[RMA_No],
	RMA_Detail,VeriRecv,AcctNotify,AcctFinish,VI_ID_Detail,
	R_QTY, R_P, R_PU,
	R_AP_P, 
	[hold],
    [PO_QTY], [PO_P], [PO_PU],
	[Services],[ConvServ],[Equipment],[Lab_Service],[CertID],
	 suser_sname() AS [Who],
	''Delete'' AS [What],
	GETDATE() AS [When]
	FROM deleted
' 
GO
ALTER TABLE [dbo].[Receiving] ENABLE TRIGGER [Receiving_Delete]
GO
/****** Object:  Trigger [dbo].[Receiving_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Receiving_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[Receiving_Insert]
   ON  [dbo].[Receiving] 
   FOR INSERT 
   NOT FOR REPLICATION
AS 
BEGIN
	SET NOCOUNT ON;

	DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
	DECLARE @Body varchar(4000)
	DECLARE @badSOitem CHAR(10)

	IF EXISTS ( SELECT * FROM inserted WHERE SUBSTRING(SOitem,1,7) Like ''%-%'')
		BEGIN
		
		SELECT @Body = ''Cannot insert into dbo.Receiving, SOitem is not Proper,''+CHAR(13)
		
		SELECT TOP 1 @BadSoitem = SOitem  FROM inserted WHERE SUBSTRING(SOitem,1,7) Like ''%-%''
		SET @Body = @Body+'' SO item:''+@BadSoitem +''.''
			+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.Receiving_Insert '' 
			
		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
			 @SubjectEmail = ''BAD SOitem.'',
			 @BodyEmail = @Body,
			 @BodyType = ''TEXT''		
			 		
		SET @Body = ''INSERT dbo.Receiving table failed. SOitem:''+@BadSoitem+'' not Proper.''
		RAISERROR( @Body, 16, -1)

		END
		
		
	IF EXISTS ( SELECT * FROM inserted WHERE SUBSTRING(POitem,1,9) Like ''%-%'')
		BEGIN
		
		SELECT @Body = ''Cannot insert into dbo.Receiving, POitem is not Proper,''+CHAR(13)
		
		SELECT TOP 1 @BadSoitem = POitem  FROM inserted WHERE SUBSTRING(POitem,1,9) Like ''%-%''
		SET @Body = @Body+'' PO item:''+@BadSoitem +''.''
			+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.Receiving_Insert '' 
			
		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
			 @SubjectEmail = ''BAD POitem.'',
			 @BodyEmail = @Body,
			 @BodyType = ''TEXT''		
		
		SET @Body = ''INSERT dbo.Receiving table failed. POitem:''+@BadSoitem+'' not Proper.''
		RAISERROR( @Body, 16, -1)

		END
		
END
' 
GO
ALTER TABLE [dbo].[Receiving] ENABLE TRIGGER [Receiving_Insert]
GO
/****** Object:  Trigger [dbo].[Receiving_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Receiving_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[Receiving_Update]
   ON  [dbo].[Receiving] 
   FOR UPDATE 
   NOT FOR REPLICATION
AS 
BEGIN

PRINT ''Start trigger Receiving_Update''

	SET NOCOUNT ON;

	DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
	DECLARE @Body varchar(4000)
	DECLARE @badSOitem CHAR(10)

	IF EXISTS ( SELECT * FROM inserted WHERE SUBSTRING(SOitem,1,7) Like ''%-%'')
		BEGIN
		
		SELECT @Body = ''Cannot update dbo.Receiving, SOitem is not Proper,''+CHAR(13)
		
		SELECT TOP 1 @BadSoitem = SOitem  FROM inserted WHERE SUBSTRING(SOitem,1,7) Like ''%-%''
		SET @Body = @Body+'' SO item:''+@BadSoitem +''.''
			+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.Receiving_Update '' 
			
		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
			 @SubjectEmail = ''BAD SOitem.'',
			 @BodyEmail = @Body,
			 @BodyType = ''TEXT''		
					
		SET @Body = ''Update dbo.Receiving table failed. SOitem:''+@BadSoitem+'' not Proper.''
		RAISERROR( @Body, 16, -1)

		END
		
		
	IF EXISTS ( SELECT * FROM inserted WHERE SUBSTRING(POitem,1,9) Like ''%-%'')
		BEGIN
		
		SELECT @Body = ''Cannot update dbo.Receiving, POitem is not Proper,''+CHAR(13)
		
		SELECT TOP 1 @BadSoitem = POitem  FROM inserted WHERE SUBSTRING(POitem,1,9) Like ''%-%''
		SET @Body = @Body+'' PO item:''+@BadSoitem +''.''
			+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.Receiving_Update '' 
			
		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
			 @SubjectEmail = ''BAD POitem.'',
			 @BodyEmail = @Body,
			 @BodyType = ''TEXT''		
			 		
		
		SET @Body = ''Update dbo.Receiving table failed. POitem:''+@BadSoitem+'' not Proper.''
		RAISERROR( @Body, 16, -1)

		END
		
	PRINT ''End   trigger Receiving_Update''
END
' 
GO
ALTER TABLE [dbo].[Receiving] ENABLE TRIGGER [Receiving_Update]
GO
/****** Object:  Trigger [dbo].[RMA_Detail_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[RMA_Detail_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[RMA_Detail_Insert]
   ON  [dbo].[RMA_Detail] 
   FOR INSERT 
   NOT FOR REPLICATION
AS 
BEGIN
	SET NOCOUNT ON;

	DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
	DECLARE @Body varchar(4000)
	DECLARE @badSOitem CHAR(10)

	IF EXISTS ( SELECT * FROM inserted WHERE SUBSTRING(SO_item,1,7) Like ''%-%'')
		BEGIN
		
		SELECT @Body = ''Cannot insert into dbo.RMA_Detail, SOitem is not Proper,''+CHAR(13)
		
		SELECT TOP 1 @BadSoitem = SO_item  FROM inserted WHERE SUBSTRING(SO_item,1,7) Like ''%-%''
		SET @Body = @Body+'' SO item:''+@BadSoitem +'',''
			+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.RMA_Detail_Insert '' 
			
		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
			 @SubjectEmail = ''BAD SOitem'',
			 @BodyEmail = @Body,
			 @BodyType = ''TEXT''
		
		SET @Body = ''INSERT dbo.RMA_Detail table failed. SOitem:''+@BadSoitem+'' not Proper.''
		RAISERROR( @Body, 16, -1)

		END
		
	
END
' 
GO
ALTER TABLE [dbo].[RMA_Detail] ENABLE TRIGGER [RMA_Detail_Insert]
GO
/****** Object:  Trigger [dbo].[RMA_Detail_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[RMA_Detail_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[RMA_Detail_Update]
   ON  [dbo].[RMA_Detail] 
   FOR UPDATE 
   NOT FOR REPLICATION
AS 
BEGIN
	SET NOCOUNT ON;

	DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
	DECLARE @Body varchar(4000)
	DECLARE @badSOitem CHAR(10)

	IF EXISTS ( SELECT * FROM inserted WHERE SUBSTRING(SO_item,1,7) Like ''%-%'')
		BEGIN
		
		SELECT @Body = ''Cannot update dbo.RMA_Detail, SOitem is not Proper,''+CHAR(13)
		
		SELECT TOP 1 @BadSoitem = SO_item  FROM inserted WHERE SUBSTRING(SO_item,1,7) Like ''%-%''
		SET @Body = @Body+'' SO item:''+@BadSoitem +''.''
			+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.RMA_Detail_Update ''
			
		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
			 @SubjectEmail = ''BAD SOitem'',
			 @BodyEmail = @Body,
			 @BodyType = ''TEXT''
			 		
		SET @Body = ''Update dbo.RMA_detail table failed. SOitem:''+@BadSoitem+'' not Proper.''
		RAISERROR( @Body, 16, -1)

		END
		
END
' 
GO
ALTER TABLE [dbo].[RMA_Detail] ENABLE TRIGGER [RMA_Detail_Update]
GO
/****** Object:  Trigger [dbo].[Roll_log DELETE history]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Roll_log DELETE history]'))
EXEC dbo.sp_executesql @statement = N'Create TRIGGER [dbo].[Roll_log DELETE history] ON [dbo].[Roll_log] 
FOR DELETE 
--NOT FOR REPLICATION
AS

INSERT INTO dbo.Ar_Roll_log_hist 
	([AlloyName],
	[Heat],
	[Lot],
	[Date],
	[sPiece],
	[sSize],
	[sLength],
	[sWeight],
	[rollsize],
	[fPiece],
	[fSize],
	[fLength],
	[Condition],
	[HTreat],
	[ColdWork],
	[SalesNum],
	[ItemSO],
	[SOitem],
	[Spec],
	[PO],
	[OvenTemp],
	[Notes],
	[Tensile],
	[Yield],
	[Elongation],
	[Red_Area],
--	[tLoc],
	[Rockwell],
	[BHN],
	[Tensile2],
	[Yield2],
	[Elongation2],
	[Red_Area2],
--	[tLoc2],
	[Rockwell2],
	[BHN2],
	[Tensile3],
	[Yield3],
	[Elongation3],
	[red_area3],
--	[tLoc3],
	[Rockwell3],
	[BHN3],
	[TestPO],
	[TestPOitem],
	[TestItemPO],
	[TestSent] ,
	[Lab] ,
	[Passed] ,

	[CustomerMat],
	[Chart],
	[Minutes],
	
	[Ovenp],
	[cgp] ,
	[HTrockwell],
	[HTBHN] ,
	[ChartData],
	[SrvcPO] ,
	[LMA_Practice],
	[LMA_Procedure],

	[ID] ,
	[WO] ,
	[WO_Detail] ,
--	[Machine] ,
--	[Oper], 
	[Who],
	[What],
	[When]
	)
   SELECT [AlloyName],
	[Heat],
	[Lot],
	[Date],
	[sPiece],
	[sSize],
	[sLength],
	[sWeight],
	[rollsize],
	[fPiece],
	[fSize],
	[fLength],
	[Condition],
	[HTreat],
	[ColdWork],
	[SalesNum],
	[ItemSO],
	[SOitem],
	[Spec],
	[PO],
	[OvenTemp],
	[Notes],
	[Tensile],
	[Yield],
	[Elongation],
	[Red_Area],
--	[tLoc],
	[Rockwell],
	[BHN],
	[Tensile2],
	[Yield2],
	[Elongation2],
	[Red_Area2],
--	[tLoc2],
	[Rockwell2],
	[BHN2],
	[Tensile3],
	[Yield3],
	[Elongation3],
	[red_area3],
--	[tLoc3],
	[Rockwell3],
	[BHN3],
	[TestPO],
	[TestPOitem],
	[TestItemPO],
	[TestSent] ,
	[Lab] ,
	[Passed] ,

	[CustomerMat],
	[Chart],
	[Minutes],
	
	[Ovenp],
	[cgp] ,
	[HTrockwell],
	[HTBHN] ,
	[ChartData],
	[SrvcPO] ,
	[LMA_Practice],
	[LMA_Procedure],

	[ID] ,
	[WO] ,
	[WO_Detail] ,
--	[Machine] ,
--	[Oper] 
	suser_sname()
	, ''Delete''
	, GETDATE() 
    FROM deleted
' 
GO
ALTER TABLE [dbo].[Roll_log] ENABLE TRIGGER [Roll_log DELETE history]
GO
/****** Object:  Trigger [dbo].[Roll_log_After_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Roll_log_After_Update]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.Roll_log_Update     ******/


CREATE TRIGGER [dbo].[Roll_log_After_Update] 
ON [dbo].[Roll_log] 
	AFTER UPDATE 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [Roll_log_After_Update]'';

DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()

IF UPDATE(Passed) 
	begin
	PRINT ''Update the WO_Detail for Test POitem''
		
	UPDATE dbo.WorkOrder_Detail
		SET PassTest = inserted.Passed
		FROM inserted
		INNER JOIN dbo.WorkOrder_Detail WO_D ON inserted.WO_Detail = WO_D.WO_Detail
		WHERE WO_D.WO_Detail = inserted.WO_Detail
		AND WO_D.TestPO = inserted.TestPOitem
		AND ISNULL(inserted.Lot,0) > 0
		AND NOT inserted.Passed IS NULL
		AND UPDATE(Passed);

	end







	

IF UPDATE(Passed) 
begin
	BEGIN TRY
	--Send Email
	
		DECLARE @Body varchar(4000)
		DECLARE @Lot	INT = 0
		DECLARE @SOitem	CHAR(10) = ''''
		DECLARE @TestPOitem CHAR(12) = ''''
		DECLARE @WorkOrder INT = 0
		DECLARE @WorkOrder_Detail INT = 0
		DECLARE @ProjID	INT = 0
		DECLARE @Descript VarChar(200) = ''''

		SELECT TOP 1 
			 @Lot = inserted.Lot
			,@SOitem = ISNULL(inserted.SOitem,'''')
			,@TestPOitem = ISNULL(inserted.TestPOitem,'''')
			,@WorkOrder = ISNULL(inserted.WO,0)
			,@WorkOrder_Detail = ISNULL(inserted.WO_Detail,0)
			,@ProjID = ISNULL(inserted.ProjID,0)

			,@Descript = ISNULL(	RTRIM(Cast(COALESCE(inserted.fPiece,inserted.sPiece) AS CHAR(10) ))
	+''pc ''+RTRIM(inserted.AlloyName)
	+'' ''+RTRIM( Cast(inserted.fSize AS CHAR(10) ))
	+''  x ''+RTRIM( Cast(inserted.fWidth AS CHAR(10) ))
	+''  x ''+RTRIM( Cast(inserted.fLength AS CHAR(10) ))
	+'' ''+RTRIM(CAST( FLOOR(inserted.sWeight) AS CHAR(10) ))+'' Pounds '' ,''No Description'')
	
			FROM inserted, deleted
			WHERE inserted.ID = deleted.ID
				AND ISNULL(inserted.Passed,0) = 1 
				AND ISNULL(deleted.Passed,0) = 0	--Pass is now True and was False
				AND ISNULL(inserted.Lot,0) > 0
				AND UPDATE(Passed);

		IF @Lot > 0
			begin
			--Found a Lot to Email
			PRINT ''LOT ''+CAST(@Lot AS CHAR(10));
			PRINT ''Descript ''+@Descript;

			PRINT '' Send a -Passed Lab Test- Email'';
		
			SET @Body = ''<!DOCTYPE html> <html><head><title>HPA Notice</title></head><body>''
			SET @Body = @Body + RTRIM(SUSER_SNAME())+'' updated the Roll_log ''+'' on ''+RTRIM(CAST(GETDATE()AS CHAR))
				+CHAR(10)+CHAR(13)+''<br>''+'' log test Passed for Lot: ''+CAST(@Lot AS CHAR(10)) +''<br>'';
		
			SET @Body = @Body+CHAR(13)+''<br>''+@Descript

			--SET @Body = @Body+CHAR(13)+''<br>''+''<a href="''+dbo.f_Reportlink_INT(''Wire_log'',@Lot) +''">Wire Lot: ''+LTRIM(RTRIM(@Lot))+''</a>''+''<br>'';
			SET @Body = @Body+CHAR(13)+''<br>''+dbo.f_HTML_link_Roll(@Lot)
		

			IF LEN(LTRIM(@SOitem))>6
				SET @Body = @Body+CHAR(13)+''<br>''+dbo.f_HTML_link_SOitem(@SOitem);
				--Alert SOitem SalesP
				--end

			IF @WorkOrder > 0
				SET @Body = @Body+CHAR(13)+''<br>''+dbo.f_HTML_link_WO(@WorkOrder);
				--Alert WO person
				--end

			IF @WorkOrder_Detail > 0
				SET @Body = @Body+CHAR(13)+''<br>''+dbo.f_HTML_link_WO_Detail(@WorkOrder_Detail);
				--Alert WO person for this WOD
				--end
			ELSE
				SET @Body = @Body+CHAR(13)+''<br>''+''No WorkOrder_Detail was found!''

			IF @ProjID > 0
				SET @Body = @Body+CHAR(13)+''<br>''+''<a href="''+dbo.f_Reportlink_INT(''ProjID'',@ProjID)+''"> ProjectID: ''+LTRIM(RTRIM(CAST(@ProjID AS CHAR)))+''</a>''+''<br>'';
				--Alert ProjID Person
				--end

			--@TestPOitem
			SET @Body = @Body+CHAR(13)+''<br>''+dbo.f_HTML_link_POitem(@TestPOitem);

			--Router
			SET @Body = @Body+CHAR(13)+''<br>''+''rtr''; --dbo.f_HTML_link_rtr(@rtr);

			--OT
			SET @Body = @Body+CHAR(13)+''<br>''+''Order Tracking''; --dbo.f_HTML_link_OT(@TrackID);



			SET @Body = @Body+CHAR(10)+CHAR(13)+''<br>'';
			SET @Body = @Body+CHAR(10)+CHAR(13)+''<br>'';
			SET @Body = @Body+''The accounting costing needs to be calculated.<br>'';
			SET @Body = @Body+CHAR(10)+CHAR(13)+''<br>'';
			SET @Body = @Body+CHAR(10)+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.Roll_log_After_Update '';
	
			SET @Body = @Body +''</body>+</HTML>''

			--PRINT @Body
			DECLARE @cSubjectEmail VARCHAR(250)
			SET @cSubjectEmail = ''Roll log ''+RTRIM(CAST(@Lot AS CHAR(10)))+'' test Passed''

			--IF @WorkOrder_Detail > 0	
				EXEC dbo.p_eMail_Send
					@FromEmail = @cEmailFrom, 
					@ToEmail = ''David.Kirchner@ERP_1s.com; ForgeManager@ERP_1s.com; production.costing@ERP_1s.com; QA@ERP_1s.com'',
					@SubjectEmail = @cSubjectEmail,
					@BodyEmail = @Body,
					@BodyType = ''HTML''

			end

	END TRY
	BEGIN CATCH
		EXEC dbo.p_eMail_Send
			@FromEmail = @cEmailFrom, 
			@ToEmail = ''David.Kirchner@ERP_1s.com;'',
			@SubjectEmail = ''Failed to create text'',
			@BodyEmail = ''Failed to create text in trigger Roll_log_After_Update'',
			@BodyType = ''TEXT''

	END CATCH;

	end


PRINT ''Trigger  End [Roll_log_After_Update]'';
' 
GO
ALTER TABLE [dbo].[Roll_log] ENABLE TRIGGER [Roll_log_After_Update]
GO
/****** Object:  Trigger [dbo].[Roll_Log_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Roll_Log_Update]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.Swage_Log_Update     ******/


create TRIGGER [dbo].[Roll_Log_Update] 
ON [dbo].[Roll_log] 
	FOR UPDATE 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [Roll_Log_Update]'';

    
---big UPDATES are in error
DECLARE @Count int
SET @Count = @@ROWCOUNT;
   
IF @Count > 1000
BEGIN
	RAISERROR(''Cannot UPDATE more than 1000 records of dbo.Roll_Log at one time. trigger Roll_Log_Update'',16,1) 
	ROLLBACK TRANSACTION
	RETURN;
END
----------------------

PRINT ''Trigger  End [Roll_Log_Update]'';
' 
GO
ALTER TABLE [dbo].[Roll_log] ENABLE TRIGGER [Roll_Log_Update]
GO
/****** Object:  Trigger [dbo].[rtr_After_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[rtr_After_Insert]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.StockLst_Process_Delete    Script Date: 11/30/2005 3:54:44 PM ******/
Create TRIGGER [dbo].[rtr_After_Insert] ON [dbo].[rtr] 
	AFTER INSERT
	NOT FOR REPLICATION
AS


PRINT ''Trigger Start ERP_2.dbo.[rtr_After_Insert]'';
UPDATE dbo.rtr
  Set OType_Num = 
	( CASE WHEN LEN(ISNULL(inserted.SOitem,'''') )=10 then dbo.f_rtr_OType_Num(''SI'',inserted.SOitem) 
	WHEN ISNULL(inserted.WO,0)>0 then dbo.f_rtr_OType_Num(''WO'',inserted.WO)
	WHEN ISNULL(inserted.WO_Detail,0)>0 then dbo.f_rtr_OType_Num(''WD'',inserted.WO_Detail)
	WHEN ISNULL(inserted.Quote_ID,0)>0 then dbo.f_rtr_OType_Num(''QI'',inserted.Quote_ID)
	end ) 
FROM inserted

PRINT ''trigger end  Router.rtr_Insert:'';
' 
GO
ALTER TABLE [dbo].[rtr] ENABLE TRIGGER [rtr_After_Insert]
GO
/****** Object:  Trigger [dbo].[rtr_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[rtr_Insert]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.StockLst_Process_Delete    Script Date: 11/30/2005 3:54:44 PM ******/
CREATE TRIGGER [dbo].[rtr_Insert] ON [dbo].[rtr] 
	FOR INSERT
	NOT FOR REPLICATION
AS


PRINT ''Trigger Start ERP_2.dbo.[rtr_Insert]'';

----------------------
/*
DECLARE @data XML  
SET @data = EVENTDATA()  

INSERT INTO Router.dbo.rtr_log   
   (PostTime, DB_User, [Event], [TSQL], ID, AppName)   
SELECT   
   GETDATE(),   
   CONVERT(NVARCHAR(100), SUSER_NAME()),   
   @data.value(''(/EVENT_INSTANCE/EventType)[1]'', ''NVARCHAR(100)''),   
   @data.value(''(/EVENT_INSTANCE/TSQLCommand)[1]'', ''NVARCHAR(2000)''),
   inserted.ID,
   APP_NAME()
   FROM inserted 

*/

   ------------------------


IF (SELECT COUNT(*) FROM inserted WHERE ISNULL(WO,0)>0 AND ISNULL(WO_Detail,0)>0 AND ISNULL(WO,0)=ISNULL(WO_Detail,0) ) > 0
BEGIN
	PRINT ''Found Insert where WO = WO_Detail and WO NOT NULL.''
	

	--DECLARE @Mess1 VARCHAR(254) = ''''
	DECLARE @cProgram Char(60) = ''TRIGGER dbo.rtr_Insert''

	DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
	DECLARE @Body varchar(4000)
	
	DECLARE @nrtr_ID BIGINT = 0
	DECLARE @nWO	INT = 0
	DECLARE @nWO_Detail INT = 0
	DECLARE @cSOitem CHAR(10) = ''''
	
	SET @Body = ''''
	SELECT TOP 1 @Body = ''Found Insert to dbo.rtr WHERE WO = WO_Detail ''+CHAR(13)
		,@nrtr_ID= ISNULL(inserted.ID,0) 
		,@nWO = ISNULL(inserted.WO,0)
		,@nWO_Detail = ISNULL(inserted.WO_Detail,0)
		,@cSOitem = ISNULL(inserted.SOitem,'''')
		FROM inserted
		WHERE ISNULL(WO,0)>0 AND ISNULL(WO_Detail,0)>0 AND WO=WO_Detail
	
	SET @Body=@Body+ ''rtr_ID is ''+CAST(@nrtr_ID AS CHAR(20))+CHAR(13)
	SET @Body=@Body+'' and WO is ''+CAST(ISNULL(@nWO,0) AS CHAR(10))+CHAR(13)
	SET @Body=@Body+'' and WO_Detail is ''+CAST(ISNULL(@nWO_Detail,0) AS CHAR(10))+CHAR(13)
	SET @Body=@Body+'' and SOitem is ''+@cSOitem+CHAR(13)
	
	--SET @Body=@Body+'' UPDATE Router.dbo.rtr SET SOitem='''''''',WO=0 WHERE ID=''+CAST(@nrtr_ID AS CHAR(20))+CHAR(13)
	
	PRINT ''Send Email:''
	PRINT @Body

	IF LEN(@Body) > 1
	begin
		SET @Body = @Body+CHAR(10)+CHAR(13)+RTRIM(suser_sname())+CHAR(10)+CHAR(13)
		SET @Body = @Body+@@SERVERNAME+'' TRIGGER dbo.rtr_Insert ''+CHAR(10)+CHAR(13)
			
		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = ''VFPprogramming@ERP_1s.com; 7654373765@vtext.com'', 
			 @SubjectEmail = ''rtr insert same SOi, WO, WO_Detail'',
			 @BodyEmail = @Body,
			 @BodyType = ''TEXT''
	end

--	RAISERROR(''Cannot INSERT Router.dbo.rtr -Found where WO = WO_Detail. trigger rtr_Update'',16,1) 
--	ROLLBACK TRANSACTION
--	RETURN;

END

/*
	INSERT INTO ERP_2.dbo.Errors ([nerror],[mess1],[cprogram],[nlineno],[errordate],[MACHINE],[Revision],[Memo1]) 
		SELECT 0,''Updated dbo.Sales_No, SO is for (STD TERMS), but that is not allowed.''
			,@cProgram
			,0
			,GetDate()
			,Suser_Sname()
			,@cProgram
			,@Body
		FROM inserted
		
*/

PRINT ''trigger end  Router.rtr_Insert:'';
' 
GO
ALTER TABLE [dbo].[rtr] ENABLE TRIGGER [rtr_Insert]
GO
/****** Object:  Trigger [dbo].[rtr_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[rtr_Update]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.StockLst_Process_Delete    Script Date: 11/30/2005 3:54:44 PM ******/
CREATE TRIGGER [dbo].[rtr_Update] ON [dbo].[rtr] 
	FOR UPDATE 
	NOT FOR REPLICATION
AS


PRINT ''Trigger Start Router.dbo.[rtr_Update]'';

---big UPDATES are in error
DECLARE @Count int
SET @Count = @@ROWCOUNT;
   
IF @Count > 100
BEGIN
	RAISERROR(''Cannot UPDATE more than 100 records of dbo.rtr at one time. trigger rtr_Update'',16,1) 
	ROLLBACK TRANSACTION
	RETURN;
END

----------------------
/*
DECLARE @data XML  
SET @data = EVENTDATA()  

INSERT INTO Router.dbo.rtr_log   
   (PostTime, DB_User, Event, TSQL, ID, AppName )   
SELECT   
   GETDATE(),   
   CONVERT(NVARCHAR(100), SUSER_NAME()),   
   @data.value(''(/EVENT_INSTANCE/EventType)[1]'', ''NVARCHAR(100)''),   
   @data.value(''(/EVENT_INSTANCE/TSQLCommand)[1]'', ''NVARCHAR(2000)''),
   inserted.ID,
   APP_NAME()
   FROM inserted 
*/

------------------------

IF (SELECT COUNT(*) FROM inserted WHERE 
		    ISNULL(inserted.[WO],0) >0 
		AND ISNULL(inserted.[WO_Detail],0) > 0
		AND ISNULL(inserted.[WO],0)=ISNULL(inserted.[WO_Detail],0) 
		AND ( UPDATE([WO]) OR UPDATE([WO_Detail]) )
	) > 0
BEGIN
	PRINT ''Found Update where WO = WO_Detail and WO NOT NULL.''
	
	--PRINT ''cSOitem=''+inserted.SOitem+'', WO=''+CAST(inserted.WO AS CHAR(10))+'', WO_Detail=''+CAST(inserted.WO_Detail AS CHAR(10))+'', Quote_ID=''+CAST(inserted.Quote_ID AS CHAR(10))

	--DECLARE @Mess1 VARCHAR(254) = ''''
	DECLARE @cProgram Char(60) = ''TRIGGER dbo.rtr_Update''

	DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
	DECLARE @Body varchar(4000)
	
	SELECT TOP 1 @Body = ''Found Update to ERP_2.dbo.rtr WHERE WO = WO_Detail ''+CHAR(13)
		+ ''rtr_ID is ''+CAST(inserted.[ID] AS CHAR(20))+CHAR(13)
		+'' WHERE WO is ''+CAST(inserted.[WO] AS CHAR(10))+CHAR(13)
		+'' and WO_Detail is ''+CAST(inserted.[WO_Detail] AS CHAR(10))+CHAR(13)
		+'' and SOitem is ''+inserted.[SOitem]+CHAR(13)
		+'' and OType_Num is ''+inserted.[OType_Num]+CHAR(13)
		FROM inserted
		WHERE ISNULL(inserted.WO,0)>0 AND ISNULL(inserted.WO_Detail,0)>0 AND ISNULL(inserted.WO,0)=ISNULL(inserted.WO_Detail,0)
	
	PRINT @Body

	SET @Body = @Body+RTRIM(suser_sname())+CHAR(13)
		+@@SERVERNAME+'' TRIGGER ERP_2.dbo.rtr_Update ''
			
	EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
		 @SubjectEmail = ''rtr update WO and WO_Detail'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''
	
	RAISERROR(''Cannot UPDATE dbo.rtr -Found Update where WO = WO_Detail AND WO>0. trigger rtr_Update'',16,1) 
	ROLLBACK TRANSACTION
	RETURN;

END

/*
	INSERT INTO ERP_2.dbo.Errors ([nerror],[mess1],[cprogram],[nlineno],[errordate],[MACHINE],[Revision],[Memo1]) 
		SELECT 0,''Updated dbo.Sales_No, SO is for (STD TERMS), but that is not allowed.''
			,@cProgram
			,0
			,GetDate()
			,Suser_Sname()
			,@cProgram
			,@Body
		FROM inserted
		WHERE ISNULL(inserted.paytype,'''') =''STD TERMS'' 
*/

PRINT ''trigger end  rtr_Update:'';
' 
GO
ALTER TABLE [dbo].[rtr] ENABLE TRIGGER [rtr_Update]
GO
/****** Object:  Trigger [dbo].[rtr_Detail_After_Delete]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[rtr_Detail_After_Delete]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[rtr_Detail_After_Delete] 
ON [dbo].[rtr_Detail] 
	AFTER Delete
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [rtr_Detail_After_Delete]'';



--IF ( UPDATE(Detail) )
begin
	

PRINT '' UPDATE dbo.RTR   [rtr_Detail_After_Delete]'';

-- Calculate new rtr data
UPDATE dbo.rtr 
	SET [Started] = dbo.f_rtr_Min_Started(deleted.rtr_ID, dbo.f_rtr_MIN_Detail(deleted.rtr_ID) )
	,Finished = dbo.f_rtr_Max_Finished (deleted.rtr_ID,dbo.f_rtr_MAX_Detail(deleted.rtr_ID) )
	,MinD = dbo.f_rtr_MIN_Detail(deleted.rtr_ID) 
	,MaxD = dbo.f_rtr_MAX_Detail(deleted.rtr_ID) 
	,Last_Started = dbo.f_rtr_Last_Started(deleted.rtr_ID) 
	,Last_Finished = dbo.f_rtr_Last_Finished(deleted.rtr_ID)
	,Next_Detail_Start = dbo.f_rtr_Next_Detail_Start(deleted.rtr_ID, dbo.f_rtr_Last_Started(deleted.rtr_ID) )
	,Next_Detail_Finish = dbo.f_rtr_Next_Detail_Finish(deleted.rtr_ID, dbo.f_rtr_Last_Finished(deleted.rtr_ID) )
	,Next_Rely_On_Start = dbo.f_rtr_RelyOn_Start(deleted.rtr_ID, dbo.f_rtr_Last_Finished(deleted.rtr_ID) ) 
	FROM dbo.rtr
		INNER JOIN deleted ON rtr.ID = deleted.rtr_ID
		WHERE rtr.ID = deleted.rtr_ID AND ISNULL(deleted.rtr_ID,0) > 0


end


PRINT ''Trigger  End  [rtr_Detail_After_Delete]'';
begin
	BEGIN TRY
	--Send Email
		DECLARE @Oper_ID INT = 0
		DECLARE @Detail INT = 0
		DECLARE @CreateUser VARCHAR(100) = ''''
		DECLARE @rtr_ID BIGINT = 0
		
		SELECT TOP 1 @rtr_ID=ISNULL(deleted.rtr_ID,0), @Detail=ISNULL(deleted.Detail,0), @Oper_ID=ISNULL(deleted.Oper_ID,0), @CreateUser=ISNULL(deleted.CreateUser,'''') 
			FROM deleted WHERE ISNULL(deleted.rtr_ID,0) > 0
		
		IF @rtr_ID = 0
			SELECT TOP 1 @rtr_ID=ISNULL(deleted.rtr_ID,0), @Detail=ISNULL(deleted.Detail,0), @Oper_ID=ISNULL(deleted.Oper_ID,0), @CreateUser=ISNULL(deleted.CreateUser,'''') 
				FROM deleted 

		DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
		DECLARE @Body varchar(4000)
		SET @Body = ''<!DOCTYPE html> <html><head><title>HPA Notice</title></head><body>''
			
			--Router
		IF @rtr_ID = 0 AND @Detail+@Oper_ID > 0
		begin

			SET @Body = @Body+CHAR(13)+''<br>''+''rtr '' + ERP_2.dbo.f_HTML_link_rtr(@rtr_ID);

			SET @Body = @Body+CHAR(10)+CHAR(13)+''<br>'';
			SET @Body = @Body+CHAR(13)+'' Trigger rtr_Detail_After_Insert. UPDATE dbo.rtr ''
			SET @Body = @Body+CHAR(13)+'' rtr.ID = ''+CAST(@rtr_ID AS CHAR(20) )+'' ''
			SET @Body = @Body+CHAR(13)+'' AND Detail=''+CAST(@Detail AS CHAR(10))+'' ''
			SET @Body = @Body+CHAR(13)+'' AND Oper_ID=''+CAST(@Oper_ID AS CHAR(10))+'' ''
			SET @Body = @Body+CHAR(13)+'' AND @CreateUser=''+TRIM(@CreateUser)
			SET @Body = @Body+CHAR(10)+CHAR(13)+''<br>'';
			
			SET @Body = @Body+CHAR(10)+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.rtr_Detail_After_Delete '';
	
			SET @Body = @Body +''</body>+</HTML>''

				--PRINT @Body
			DECLARE @cSubjectEmail VARCHAR(250)
			SET @cSubjectEmail = ''rtr_Detail Insert''

		
			EXEC dbo.p_eMail_Send
				@FromEmail = @cEmailFrom, 
				@ToEmail = ''David.Kirchner@ERP_1s.com'',
				@SubjectEmail = @cSubjectEmail,
				@BodyEmail = @Body,
				@BodyType = ''HTML''

			
		end
	END TRY
	BEGIN CATCH
		EXEC dbo.p_eMail_Send
			@FromEmail = @cEmailFrom, 
			@ToEmail = ''David.Kirchner@ERP_1s.com;'',
			@SubjectEmail = ''Failed to create text'',
			@BodyEmail = ''Failed to create text in trigger rtr_Detail_After_Delete'',
			@BodyType = ''TEXT''

	END CATCH;
end' 
GO
ALTER TABLE [dbo].[rtr_Detail] ENABLE TRIGGER [rtr_Detail_After_Delete]
GO
/****** Object:  Trigger [dbo].[rtr_Detail_After_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[rtr_Detail_After_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[rtr_Detail_After_Insert] 
ON [dbo].[rtr_Detail] 
	AFTER Insert 
	NOT FOR REPLICATION
AS

begin
	
PRINT ''Trigger Start dbo.[rtr_Detail_After_Insert]'';

DECLARE @rtr_ID BIGINT = 0
SELECT TOP 1 @rtr_ID = inserted.rtr_ID FROM inserted WHERE ISNULL(inserted.rtr_ID,0) > 0


PRINT '' UPDATE dbo.RTR WHERE rtr_ID = ''+TRIM(CAST(@rtr_ID AS CHAR(20)) )+''  [rtr_Detail_After_Insert]'';


UPDATE dbo.rtr 
	SET [Started] = dbo.f_rtr_Min_Started(inserted.rtr_ID, dbo.f_rtr_MIN_Detail(inserted.rtr_ID) )
	,Finished = dbo.f_rtr_Max_Finished (inserted.rtr_ID,dbo.f_rtr_MAX_Detail(inserted.rtr_ID) )
	,MinD = dbo.f_rtr_MIN_Detail(inserted.rtr_ID) 
	,MaxD = dbo.f_rtr_MAX_Detail(inserted.rtr_ID) 
	,Last_Started = dbo.f_rtr_Last_Started(inserted.rtr_ID) 
	,Last_Finished = dbo.f_rtr_Last_Finished(inserted.rtr_ID)
	,Next_Detail_Start = dbo.f_rtr_Next_Detail_Start(inserted.rtr_ID, dbo.f_rtr_Last_Started(inserted.rtr_ID) )
	,Next_Detail_Finish = dbo.f_rtr_Next_Detail_Finish(inserted.rtr_ID, dbo.f_rtr_Last_Finished(inserted.rtr_ID) )
	,Next_Rely_On_Start = dbo.f_rtr_RelyOn_Start(inserted.rtr_ID, dbo.f_rtr_Last_Finished(inserted.rtr_ID) ) 
	FROM dbo.rtr
		INNER JOIN inserted ON rtr.ID = inserted.rtr_ID
		WHERE rtr.ID = inserted.rtr_ID AND ISNULL(inserted.rtr_ID,0) > 0


end


PRINT ''Trigger  End  [rtr_Detail_After_Insert]'';


begin
	BEGIN TRY
	--Send Email
		DECLARE @Oper_ID INT = 0
		DECLARE @Detail INT = 0
		DECLARE @CreateUser VARCHAR(100) = ''''
		DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
		DECLARE @Body varchar(4000)
		SET @Body = ''<!DOCTYPE html> <html><head><title>HPA Notice</title></head><body>''
		
		SELECT TOP 1 @rtr_ID=ISNULL(inserted.rtr_ID,0), @Detail=ISNULL(inserted.Detail,0), @Oper_ID=ISNULL(inserted.Oper_ID,0), @CreateUser=ISNULL(inserted.CreateUser,'''') 
			FROM inserted WHERE ISNULL(inserted.rtr_ID,0) > 0
		
		--Catch data when rtr_ID is 0 for this Email report.
		IF @rtr_ID = 0
			SELECT TOP 1 @rtr_ID=ISNULL(inserted.rtr_ID,0), @Detail=ISNULL(inserted.Detail,0), @Oper_ID=ISNULL(inserted.Oper_ID,0), @CreateUser=ISNULL(inserted.CreateUser,'''')
				FROM inserted 

		--Router
		IF @rtr_ID = 0 AND @Detail+@Oper_ID > 0
		begin
			SET @Body = @Body+CHAR(13)+''<br>''+''rtr_ID = 0 ''; --+ ISNULL(ERP_2.dbo.f_HTML_link_rtr(@rtr_ID),''f_HTML_link_rtr'');
			SET @Body = @Body+CHAR(10)+CHAR(13)+''<br>'';
			SET @Body = @Body+CHAR(13)+'' Trigger rtr_Detail_After_Insert. UPDATE dbo.rtr ''
			--SET @Body = @Body+CHAR(13)+'' rtr.ID = ''+CAST(@rtr_ID AS CHAR(20) )+'' ''
			SET @Body = @Body+CHAR(13)+'' Detail=''+ISNULL(CAST(@Detail AS CHAR(10)),''0'')+'' ''
			SET @Body = @Body+CHAR(13)+'' AND Oper_ID=''+ISNULL(CAST(@Oper_ID AS CHAR(10)),''0'')+'' ''
			SET @Body = @Body+CHAR(13)+'' AND @CreateUser=''+TRIM(@CreateUser)

			SET @Body = @Body+CHAR(10)+CHAR(13)+''<br>'';
			
			SET @Body = @Body+CHAR(10)+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.rtr_Detail_After_Insert '';
	
			SET @Body = @Body +''</body>+</HTML>''

			--PRINT @Body
			DECLARE @cSubjectEmail VARCHAR(250)
			SET @cSubjectEmail = ''rtr_Detail After Insert''


				EXEC dbo.p_eMail_Send
					@FromEmail = @cEmailFrom, 
					@ToEmail = ''David.Kirchner@ERP_1s.com'',
					@SubjectEmail = @cSubjectEmail,
					@BodyEmail = @Body,
					@BodyType = ''HTML''

		end			

	END TRY
	BEGIN CATCH
		EXEC dbo.p_eMail_Send
			@FromEmail = @cEmailFrom, 
			@ToEmail = ''David.Kirchner@ERP_1s.com;'',
			@SubjectEmail = ''Failed to create text for Email'',
			@BodyEmail = ''Failed to create text in trigger rtr_Detail_After_Insert'',
			@BodyType = ''TEXT''

	END CATCH;
end' 
GO
ALTER TABLE [dbo].[rtr_Detail] ENABLE TRIGGER [rtr_Detail_After_Insert]
GO
/****** Object:  Trigger [dbo].[rtr_Detail_After_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[rtr_Detail_After_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[rtr_Detail_After_Update] 
ON [dbo].[rtr_Detail] 
	AFTER UPDATE 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [rtr_Detail_After_Update]'';



--IF ( UPDATE(Detail) )
begin
	

PRINT '' UPDATE dbo.RTR with rtr_Detail data [rtr_Detail_After_Update]'';

UPDATE dbo.rtr 
	SET [Started] = dbo.f_rtr_Min_Started(inserted.rtr_ID, dbo.f_rtr_MIN_Detail(inserted.rtr_ID) )
	,Finished = dbo.f_rtr_Max_Finished (inserted.rtr_ID,dbo.f_rtr_MAX_Detail(inserted.rtr_ID) )
	,MinD = dbo.f_rtr_MIN_Detail(inserted.rtr_ID) 
	,MaxD = dbo.f_rtr_MAX_Detail(inserted.rtr_ID) 
	,Last_Started = dbo.f_rtr_Last_Started(inserted.rtr_ID) 
	,Last_Finished = dbo.f_rtr_Last_Finished(inserted.rtr_ID)
	,Next_Detail_Start = dbo.f_rtr_Next_Detail_Start(inserted.rtr_ID, dbo.f_rtr_Last_Started(inserted.rtr_ID) )
	,Next_Detail_Finish = dbo.f_rtr_Next_Detail_Finish(inserted.rtr_ID, dbo.f_rtr_Last_Finished(inserted.rtr_ID) )
	,Next_Rely_On_Start = dbo.f_rtr_RelyOn_Start(inserted.rtr_ID, dbo.f_rtr_Last_Finished(inserted.rtr_ID) ) 
	FROM dbo.rtr
		INNER JOIN inserted ON rtr.ID = inserted.rtr_ID
		WHERE rtr.ID = inserted.rtr_ID AND ISNULL(inserted.rtr_ID,0) > 0


end


PRINT ''Trigger  End  [rtr_Detail_After_Update]'';

begin
	BEGIN TRY
	--Send Email
		DECLARE @Oper_ID INT = 0
		DECLARE @Detail INT = 0
		DECLARE @CreateUser VARCHAR(100) = ''''

		DECLARE @rtr_ID BIGINT = 0

		SELECT TOP 1 @rtr_ID=ISNULL(inserted.rtr_ID,0), @Detail=ISNULL(inserted.Detail,0), @Oper_ID=ISNULL(inserted.Oper_ID,0), @CreateUser=ISNULL(inserted.CreateUser,'''') 
			FROM inserted WHERE ISNULL(inserted.rtr_ID,0) > 0
		
		--Catch data when rtr_ID is 0 for this Email report.
		IF @rtr_ID = 0
			SELECT TOP 1 @rtr_ID=ISNULL(inserted.rtr_ID,0), @Detail=ISNULL(inserted.Detail,0), @Oper_ID=ISNULL(inserted.Oper_ID,0), @CreateUser=ISNULL(inserted.CreateUser,'''')
				FROM inserted 



		DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
		DECLARE @Body varchar(4000)
		SET @Body = ''<!DOCTYPE html> <html><head><title>HPA Notice</title></head><body>''
		

		--Router
		IF @rtr_ID = 0 AND @Detail+@Oper_ID > 0
		begin

		SET @Body = @Body+CHAR(13)+''<br>''+''rtr '' + ERP_2.dbo.f_HTML_link_rtr(@rtr_ID);

		SET @Body = @Body+CHAR(10)+CHAR(13)+''<br>'';

		SET @Body = @Body+CHAR(13)+'' Trigger rtr_Detail_After_Update. UPDATE dbo.rtr ''
		SET @Body = @Body+CHAR(13)+'' rtr.ID = ''+CAST(@rtr_ID AS CHAR(20) )+'' ''
		SET @Body = @Body+CHAR(13)+'' AND Detail=''+CAST(@Detail AS CHAR(10))+'' ''
		SET @Body = @Body+CHAR(13)+'' AND Oper_ID=''+CAST(@Oper_ID AS CHAR(10))+'' ''
		SET @Body = @Body+CHAR(13)+'' AND @CreateUser=''+TRIM(@CreateUser)

		SET @Body = @Body+CHAR(10)+CHAR(13)+''<br>'';
			
		SET @Body = @Body+CHAR(10)+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.rtr_Detail_After_Update '';
	
		SET @Body = @Body +''</body>+</HTML>''

			--PRINT @Body
			DECLARE @cSubjectEmail VARCHAR(250)
			SET @cSubjectEmail = ''rtr_Detail UPDATE''

			--IF @WorkOrder_Detail > 0	
				EXEC dbo.p_eMail_Send
					@FromEmail = @cEmailFrom, 
					@ToEmail = ''David.Kirchner@ERP_1s.com'',
					@SubjectEmail = @cSubjectEmail,
					@BodyEmail = @Body,
					@BodyType = ''HTML''

			
		end
	END TRY
	BEGIN CATCH
		EXEC dbo.p_eMail_Send
			@FromEmail = @cEmailFrom, 
			@ToEmail = ''David.Kirchner@ERP_1s.com;'',
			@SubjectEmail = ''Failed to create text'',
			@BodyEmail = ''Failed to create text in trigger rtr_Detail_After_UPDATE'',
			@BodyType = ''TEXT''

	END CATCH;
end' 
GO
ALTER TABLE [dbo].[rtr_Detail] ENABLE TRIGGER [rtr_Detail_After_Update]
GO
/****** Object:  Trigger [dbo].[Sales_After_Delete]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Sales_After_Delete]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.Sales_Delete    Script Date: 7/1/2004 1:57:08 PM ******/


CREATE TRIGGER [dbo].[Sales_After_Delete] ON [dbo].[Sales] 
	AFTER DELETE 
	--NOT FOR REPLICATION
AS

PRINT ''trigger start Sales_After_Delete:'';

INSERT dbo.Ar_Sales_History 
	([WHO],[WHAT],[WHEN]
      ,[soitem]
      ,[salesnum]
      ,[item]
      ,[orderspec]
      ,[inv]
      ,[gfm]
	  ,[Draw]
      ,[roll]
      ,[press]
      ,[mach]
      ,[cg]
      ,[plasma]
      ,[WJet]
	  ,[ColdSaw]
      ,[cert]

      ,[itemtot]
      ,[shipdue]
      ,[shipped]

      ,[matlwt]
      ,[cncld]
      ,[cmplt]
      ,[partno]
      ,[itemcost]
      ,[itemsale]
	  ,StkCost
	  ,POCost
	  ,StkPaid
      ,[gs_cost]
      ,[gs_sale]
      ,[gs_cmplt]
      ,[rma_no],[RMA_Detail]
      ,[qa]
      ,[cofc]
      ,[merc]
      ,[ppo]
      ,[ppn]
      ,[pheat]
      ,[pspec]
      ,[pdesc]
      ,[pother]
      ,[other]
      ,[prcp]
      ,[prcd]
      ,[pckd]
      ,[urgent]
      ,[shipon]
      ,[Tol]
      ,[JobHours]
      ,[ProcLoc]


	  ,[Quoted_QTY]
	  ,[Quoted_P]
	  ,[Quoted_Total]
	  ,[Quoted_PU]
	  ,[dShip]
	  ,[Typ]
	  ,[WO]
	  ,[WO_Detail]
	  ,[ProductionWO]
	  ,[Export]
	  ,[RcvdE]
	  ,[InqNumP]
	  ,ID_AllQuotes
	  ,DateAdded
	  --,Review
	  ,RVW_Stock,RVW_Prod
	  ,Review_Date
	   )
SELECT 	suser_sname(),''DELETE'',GetDate()
      ,[soitem]
      ,[salesnum]
      ,[item]
      ,[orderspec]
      ,[inv]
      ,[gfm]
	  ,[Draw]
      ,[roll]
      ,[press]
      ,[mach]
      ,[cg]
      ,[plasma]
      ,[WJet]
	  ,[ColdSaw]
      ,[cert]

      ,[itemtot]
      ,[shipdue]
      ,[shipped]

      ,[matlwt]
      ,[cncld]
      ,[cmplt]
      ,[partno]
      ,[itemcost]
      ,[itemsale]
	  ,StkCost
	  ,POCost
	  ,StkPaid
      ,[gs_cost]
      ,[gs_sale]
      ,[gs_cmplt]
      ,[rma_no],[RMA_Detail]
      ,[qa]
      ,[cofc]
      ,[merc]
      ,[ppo]
      ,[ppn]
      ,[pheat]
      ,[pspec]
      ,[pdesc]
      ,[pother]
      ,[other]
      ,[prcp]
      ,[prcd]
      ,[pckd]
      ,[urgent]
      ,[shipon]
      ,[Tol]
      ,[JobHours]
      ,[ProcLoc]
	  

	  ,[Quoted_QTY]
	  ,[Quoted_P]
	  ,[Quoted_Total]
	  ,[Quoted_PU]
	  ,[dShip]
	  ,[Typ]
	  ,[WO]
	  ,[WO_Detail]
	  ,[ProductionWO]
	  ,[Export]
	  ,[RcvdE]
	  ,[InqNumP]
	  	  , ( case WHEN deleted.ID_AllQuotes IS NULL 
		then (SELECT TOP 1 ISNULL(AQ.ID,0) AS AllQuotes_ID FROM dbo.AllQuotes AQ WHERE deleted.SOitem = AQ.SOitem )
		else deleted.ID_AllQuotes end
		) AS AllQuotes_ID
	  ,deleted.DateAdded
	  --,Review
	  ,RVW_Stock,RVW_Prod
	  ,Review_Date
 FROM deleted

 PRINT ''trigger end  Sales_After_Delete:'';
' 
GO
ALTER TABLE [dbo].[Sales] ENABLE TRIGGER [Sales_After_Delete]
GO
/****** Object:  Trigger [dbo].[Sales_After_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Sales_After_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[Sales_After_Insert]
   ON  [dbo].[Sales] 
   FOR INSERT 
   NOT FOR REPLICATION
AS 
BEGIN
	SET NOCOUNT ON;

	PRINT ''trigger start Sales_After_Insert:'';

	IF UPDATE(Shipped)
	begin
	    UPDATE dbo.AllQuotes
			SET ShipDate = inserted.Shipped
			FROM Inserted
			WHERE AllQuotes.SOitem = inserted.SOitem 
		
	end

	IF UPDATE(Cmplt)
	begin
	    DELETE dbo.StockLst_Process
			FROM Inserted
			WHERE inserted.SOitem = StockLst_Process.SOitem 
				AND ISNULL(inserted.Cmplt,0) = 1  AND UPDATE(Cmplt) 
				AND StockLst_Process.Process_ID = ''SELECTED  ''

	    DELETE dbo.BrokerLst_Process
			FROM Inserted
			WHERE inserted.SOitem = BrokerLst_Process.SOitem 
				AND ISNULL(inserted.Cmplt,0) = 1  AND UPDATE(Cmplt) 
				AND BrokerLst_Process.Process_ID = ''SELECTED  ''


	end
	
	PRINT ''trigger end  Sales_After_Insert:'';

END
' 
GO
ALTER TABLE [dbo].[Sales] ENABLE TRIGGER [Sales_After_Insert]
GO
/****** Object:  Trigger [dbo].[Sales_After_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Sales_After_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[Sales_After_Update]
   ON  [dbo].[Sales] 
   AFTER UPDATE 
   NOT FOR REPLICATION
AS 
BEGIN

SET NOCOUNT ON;

--UPDATE dbo.Sales SET  [Cmplt] = 1 WHERE SOitem = dbo.f_ProperSOitem(''  89429-02'')

PRINT ''trigger start [Sales_after_Update]'';

-----------------------------------------------------

DECLARE @cProgram Char(60) = ''TRIGGER dbo.Sales_After_Update''

-----------------------------------------------------
IF UPDATE(cmplt)
	begin
--	PRINT '' dbo.Sales UPDATE(cmplt)'';

--	PRINT ''  Updated Ship to same CMPLT as Inserted Sales.SOitem WHERE UPDATE(cmplt). [Sales_after_Update]''	;
	UPDATE [dbo].[Ship]
		SET complete = inserted.cmplt
		,ShipDate = ISNULL( inserted.Shipped, GetDate() )
	FROM inserted, deleted
		WHERE UPDATE(cmplt)
		AND inserted.SOitem = deleted.SOitem AND NOT dbo.f_ProperSOitem(inserted.SOitem) =  dbo.f_ProperSOitem('''')
		AND NOT inserted.cmplt = deleted.cmplt 
		AND inserted.SOitem = Ship.SOitem 
		--AND ISNULL(inserted.cmplt,0)>0


--	PRINT ''  Update SOitem_HRS cmplt to same as Inserted Sales WHERE UPDATE(cmplt). [Sales_after_Update]'';
	UPDATE dbo.SOitem_Hrs
		SET cmplt = inserted.cmplt
			,DateAct = GetDate()
	FROM inserted, deleted
		WHERE UPDATE(cmplt)
		AND inserted.SOitem = deleted.SOitem AND NOT dbo.f_ProperSOitem(inserted.SOitem) =  dbo.f_ProperSOitem('''')
		AND SOitem_Hrs.SOitem = inserted.SOitem
		AND ISNULL(inserted.cmplt,0) = 1


	UPDATE dbo.Sales_No 
		SET cmplt = 1
	FROM inserted, deleted
		WHERE inserted.SOitem = deleted.SOitem 
			AND NOT dbo.f_ProperSOitem(inserted.SOitem) =  dbo.f_ProperSOitem('''')
		AND NOT inserted.cmplt = deleted.cmplt
		AND UPDATE(cmplt)
		AND Sales_No.SalesNum = inserted.SalesNum
		AND Sales_No.ItemTot = (SELECT COUNT(SalesNum) AS CNTD FROM dbo.Sales WHERE Sales.SalesNum = inserted.SalesNum AND Sales.cmplt = 1)
		--Only mark complete in Sales_No when ItemTot count matches.




/*	Print '' UPDATE dbo.Sales_No SET Cmplt = Sales_No f_CheckSet_Sales_No_Cmplt! [Sales_after_Update]'';
	UPDATE dbo.Sales_No 
		SET Cmplt = dbo.f_CheckSet_Sales_No_Cmplt( inserted.SalesNum )
	FROM inserted, deleted
		WHERE UPDATE(cmplt) AND NOT inserted.cmplt = deleted.cmplt
		AND Sales_No.SalesNum = inserted.SalesNum */


--	Print ''INSERT INTO dbo.NR_userTrack. [Sales_after_Update]'';
	INSERT INTO dbo.NR_userTrack (Mess1,cProgram,ErrorDate,Machine) 
		SELECT LEFT(''SalesNum:''+CAST(inserted.SalesNum AS VARCHAR(13))+'' was marked as NOT ''
			+CASE ISNULL(inserted.cmplt,0) WHEN 1 THEN ''complete'' ELSE ''Uncomplete'' END
			+'' in Sales_No when complete in Sales.'',1024),LEFT(''TRIGGER Sales_After_Update'',100),GetDate(),suser_sname() 
		FROM inserted, deleted
		--, dbo.Sales_No
			--WHERE inserted.SalesNum = [Sales_No].SalesNum
			WHERE inserted.SOitem = deleted.SOitem AND NOT dbo.f_ProperSOitem(inserted.SOitem) =  dbo.f_ProperSOitem('''')
			AND ISNULL(inserted.cmplt,0) = 1
			AND ISNULL(deleted.cmplt,0) = 0
			--AND ISNULL(Sales_No.cmplt,0) = 1
			AND UPDATE(cmplt) 
			--AND NOT inserted.cmplt = deleted.cmplt
			AND dbo.f_CheckSet_Sales_No_Cmplt( inserted.SalesNum ) = 1
	-----

		DECLARE @nCntSOiCmplt INT = 0
		SELECT @nCntSOiCmplt = COUNT(*) 
			FROM inserted, deleted
			WHERE inserted.Cmplt = 1
			AND inserted.SOitem = deleted.SOitem AND NOT dbo.f_ProperSOitem(inserted.SOitem) =  dbo.f_ProperSOitem('''')
			AND NOT inserted.cmplt = deleted.cmplt
			AND UPDATE(cmplt)
			

		PRINT '' Found ''+RTRIM(CAST(@nCntSOiCmplt AS CHAR(10)))+'' SOitem that are NOW Complete. [Sales_after_Update]''

	-----

		INSERT dbo.NR_UserTrack	(Mess1,cProgram,ServerName) 
			SELECT LEFT(''Sales_No is being marked Complete for SalesNum ''+LTRIM(CAST(ISNULL(inserted.SalesNum,0) AS CHAR(10)))+'' and ItemTot is ''+CAST(ISNULL(inserted.itemTot,0) AS CHAR(2)),1024)
				,LEFT(@cProgram,100)
				,@@SERVERNAME
			FROM inserted 
				INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
				INNER JOIN dbo.Sales_No SN on inserted.SalesNum = SN.salesnum
			WHERE inserted.SOitem = deleted.SOitem 
				AND NOT dbo.f_ProperSOitem(inserted.SOitem) =  dbo.f_ProperSOitem('''')
			AND ISNULL(inserted.cmplt,0) = 1
			AND NOT ISNULL(inserted.cmplt,0) = ISNULL(deleted.cmplt,0)
			AND UPDATE(cmplt)
			AND SN.SalesNum = inserted.SalesNum
			AND SN.ItemTot = (SELECT COUNT(SalesNum) AS CNTD FROM dbo.Sales WITH (NOLOCK) WHERE Sales.SalesNum = inserted.SalesNum AND ISNULL(Sales.cmplt,0) = 1)
		
		UPDATE dbo.Sales_No SET cmplt = 1
			FROM inserted, deleted
			WHERE inserted.SOitem = deleted.SOitem 
				AND NOT dbo.f_ProperSOitem(inserted.SOitem) =  dbo.f_ProperSOitem('''')
				AND NOT inserted.cmplt = deleted.cmplt
				AND UPDATE(cmplt)
				AND Sales_No.SalesNum = inserted.SalesNum
				AND Sales_No.ItemTot = (SELECT COUNT(SalesNum) AS CNTD FROM dbo.Sales WITH (NOLOCK) WHERE Sales.SalesNum = inserted.SalesNum AND ISNULL(Sales.cmplt,0) = 1)
				--AND dbo.f_CheckSet_Sales_No_Cancled( inserted.SalesNum ) = 1

		--INSERT dbo.NR_UserTrack	(Mess1,cProgram,ServerName)
		INSERT INTO dbo.Errors ([nerror],[mess1],[cprogram],[nlineno],[errordate],[MACHINE],[Revision],[Memo1]) 
			SELECT 0,''Sales_No should not be marked as Complete for SalesNum ''+LTRIM(CAST(ISNULL(inserted.SalesNum,0) AS CHAR(10)))+'' and ItemTot is ''+CAST(ISNULL(inserted.itemTot,0) AS CHAR(2))
				,@cProgram
				,0
				,GetDate()
				,Suser_Sname()
				,@cProgram
				,''Sales_No should not be marked as Complete for SalesNum ''+LTRIM(CAST(ISNULL(inserted.SalesNum,0) AS CHAR(10)))+'' and ItemTot is ''+CAST(ISNULL(inserted.itemTot,0) AS CHAR(2))
			FROM inserted 
				INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
				INNER JOIN dbo.Sales_No SN on inserted.SalesNum = SN.salesnum
			WHERE inserted.SOitem = deleted.SOitem 
				AND NOT dbo.f_ProperSOitem(inserted.SOitem) =  dbo.f_ProperSOitem('''')
			AND ISNULL(inserted.cmplt,0) = 0
			AND NOT ISNULL(inserted.cmplt,0) = ISNULL(deleted.cmplt,0)
			AND UPDATE(cmplt)
			AND SN.SalesNum = inserted.SalesNum
			AND NOT SN.ItemTot = (SELECT COUNT(SalesNum) AS CNTD FROM dbo.Sales WITH (NOLOCK) WHERE Sales.SalesNum = inserted.SalesNum AND ISNULL(Sales.cmplt,0) = 0)

	-----

	end

-----------------------------------------------------
IF UPDATE(cncld)
	begin
	
	PRINT '' dbo.Sales UPDATE(cnld)''

		UPDATE [dbo].[Ship]
			SET Ship.cncld = inserted.cncld 
			FROM inserted, deleted
			WHERE Ship.SOitem = inserted.SOitem
			AND NOT dbo.f_ProperSOitem(inserted.SOitem) =  dbo.f_ProperSOitem('''')
			AND NOT inserted.cncld = deleted.cncld
			AND UPDATE(cncld)

		--PRINT ''  Ship was updated to same as Inserted Sales. [Sales_after_Update]''

		INSERT INTO dbo.userTrack (Mess1,cProgram,ErrorDate,Machine) 
			SELECT LEFT(''SOitem:''+inserted.SOitem+'' was marked as ''+CASE inserted.cncld WHEN 1 THEN ''cancelled'' ELSE ''UnCancelled'' END
			+'' in Ship.'',1024),LEFT(''TRIGGER Sales_After_Update'',100),GetDate(),suser_sname() 
				FROM inserted, deleted
				WHERE inserted.SOitem = deleted.SOitem 
				AND NOT dbo.f_ProperSOitem(inserted.SOitem) =  dbo.f_ProperSOitem('''')
				AND UPDATE(cncld)
				AND NOT inserted.cncld = deleted.cncld
				--AND ISNULL(inserted.cncld,0) = 1

		UPDATE dbo.SOitem_Hrs
			SET Cncld = inserted.cncld
			FROM inserted, deleted 
			WHERE UPDATE(cncld)
			AND NOT inserted.cncld = deleted.cncld
			AND SOitem_Hrs.SOitem = inserted.SOitem
				AND NOT dbo.f_ProperSOitem(inserted.SOitem) =  dbo.f_ProperSOitem('''')

		--PRINT ''  Update SOitem_HRS cncld to same as Inserted Sales. [Sales_after_Update]''

		UPDATE dbo.SOitem_Hrs
			SET DateAct = GetDATE()
			FROM inserted, deleted
			WHERE inserted.SOitem = deleted.SOitem 
				AND NOT dbo.f_ProperSOitem(inserted.SOitem) =  dbo.f_ProperSOitem('''')
			AND SOitem_Hrs.SOitem = inserted.SOitem
			AND inserted.cncld = 1
			AND UPDATE(cncld)
			AND NOT inserted.cncld = deleted.cncld

		--PRINT ''  Update SOitem_HRS DateAct where cncld. [Sales_after_Update]''
			
		-----


			PRINT ''Update Sales_No as Cancelled .''


			INSERT dbo.NR_UserTrack	(Mess1,cProgram,ServerName) 
				SELECT LEFT(''Sales_No is being Cancelled for SalesNum ''+LTRIM(CAST(ISNULL(inserted.SalesNum,0) AS CHAR(10)))+'' and ItemTot is ''+CAST(ISNULL(inserted.itemTot,0) AS CHAR(2)),1024)
					,LEFT(@cProgram,100)
					,@@SERVERNAME
				FROM inserted 
					INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
					INNER JOIN dbo.Sales_No SN on inserted.SalesNum = SN.salesnum
				WHERE inserted.SOitem = deleted.SOitem 
					AND NOT dbo.f_ProperSOitem(inserted.SOitem) =  dbo.f_ProperSOitem('''')
				AND ISNULL(inserted.cncld,0) = 1
				AND NOT ISNULL(inserted.cncld,0) = ISNULL(deleted.cncld,0)
				AND UPDATE(cncld)
				AND SN.SalesNum = inserted.SalesNum
				AND SN.ItemTot = (SELECT COUNT(SalesNum) AS CNTD FROM dbo.Sales WITH (NOLOCK) WHERE Sales.SalesNum = inserted.SalesNum AND ISNULL(Sales.cncld,0) = 1)
		
			--UPDATE dbo.Sales_No SET cncld = dbo.f_CheckSet_Sales_No_Cancled( inserted.SalesNum )
			UPDATE dbo.Sales_No SET cncld = 1
				FROM inserted, deleted
				WHERE inserted.SOitem = deleted.SOitem 
					AND NOT dbo.f_ProperSOitem(inserted.SOitem) =  dbo.f_ProperSOitem('''')
				AND NOT inserted.cncld = deleted.cncld
				AND UPDATE(cncld)
				AND Sales_No.SalesNum = inserted.SalesNum
				AND Sales_No.ItemTot = (SELECT COUNT(SalesNum) AS CNTD FROM dbo.Sales WITH (NOLOCK) WHERE Sales.SalesNum = inserted.SalesNum AND ISNULL(Sales.cncld,0) = 1)
				--AND dbo.f_CheckSet_Sales_No_Cancled( inserted.SalesNum ) = 1

			--end
/* */

	end
	

-------------------------------------------------


PRINT ''trigger  end  [Sales_after_Update]'';

END
' 
GO
ALTER TABLE [dbo].[Sales] ENABLE TRIGGER [Sales_After_Update]
GO
/****** Object:  Trigger [dbo].[Sales_Delete]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Delete]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.Sales_Delete    Script Date: 7/1/2004 1:57:08 PM ******/


CREATE TRIGGER [dbo].[Sales_Delete] ON [dbo].[Sales] 
FOR DELETE NOT FOR REPLICATION
AS

PRINT ''trigger start Sales_Delete:'';

---big deletes are in error
DECLARE @Count int
SET @Count = @@ROWCOUNT;
    
IF @Count > 100
BEGIN
    RAISERROR(''Cannot DELETE more than 100 records of dbo.Sales at one time. trigger Sales_Delete'',16,1) 
    ROLLBACK TRANSACTION
    RETURN;
END
----------------------


DECLARE @nSalesNum INT
DECLARE @Mess1 VARCHAR(254)
DECLARE @cProgram VarChar(60)

SET @Mess1 = ''''
SET @cProgram = ''TRIGGER dbo.Sales_Delete''

SELECT TOP 1 @Mess1 = LTRIM(CAST(ISNULL(deleted.SalesNum,0) AS CHAR(10)))
FROM deleted

IF LEN(@Mess1) > 0	 
	SET @Mess1 = ''Sales DELETED for SalesNum '' + @Mess1

IF LEN(@Mess1) > 0	 
	INSERT dbo.NR_UserTrack
		(Mess1
		,cProgram
		) VALUES (
		LEFT(@Mess1,1024),LEFT(@cProgram,100)
		)


IF EXISTS (SELECT * FROM deleted WHERE NOT dbo.f_ProperSOitem(deleted.SOitem) = dbo.f_ProperSOitem('''') )
	begin

	PRINT ''Delete StockLst Process''

	DELETE FROM dbo.StockLst_Process 
		FROM dbo.StockLst_Process P
		INNER JOIN deleted ON P.SOitem = deleted.SOitem
		AND NOT dbo.f_ProperSOitem(deleted.SOitem) =  dbo.f_ProperSOitem('''')

	PRINT ''Delete BrokerLst Process''

	DELETE FROM dbo.BrokerLst_Process 
		FROM dbo.BrokerLst_Process P
		INNER JOIN deleted ON P.SOitem = deleted.SOitem
		AND NOT dbo.f_ProperSOitem(deleted.SOitem) =  dbo.f_ProperSOitem('''')

	PRINT ''Delete WIPLst Process''

	DELETE FROM dbo.WIPLst_Process 
		FROM dbo.StockLst_Process P
		INNER JOIN deleted ON P.SOitem = deleted.SOitem
		AND NOT dbo.f_ProperSOitem(deleted.SOitem) =  dbo.f_ProperSOitem('''')

	end



PRINT ''trigger end  Sales_Delete:'';
' 
GO
ALTER TABLE [dbo].[Sales] ENABLE TRIGGER [Sales_Delete]
GO
/****** Object:  Trigger [dbo].[Sales_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[Sales_Insert]
   ON  [dbo].[Sales] 
   FOR INSERT 
   NOT FOR REPLICATION
AS 
BEGIN

SET NOCOUNT ON;

PRINT ''trigger start Sales_Insert:'';

DECLARE @Body varchar(4000)

IF EXISTS ( SELECT * FROM inserted WHERE inserted.SOitem NOT Like ''%-%'' )
	BEGIN
	DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
	DECLARE @badSOitem CHAR(10)
	
	SELECT @Body = ''insert to dbo.Sales needs FIXED, SOitem is not Proper,''+CHAR(13)
	SET @badSOitem = ''''
	
	SELECT TOP 1 @BadSoitem = SOitem  FROM inserted WHERE inserted.SOitem NOT Like ''%-%''
	SET @Body = @Body+'' SO item:''+@BadSoitem +''.''
		+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.Sales_Insert ''
		
	EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
		 @SubjectEmail = ''BAD SOitem'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''
			 		
	SET @Body = ''Insert into dbo.Sales table needs FIXED. SOitem:''+@BadSoitem+'' not Proper. ''+CAST( ERROR_MESSAGE() AS CHAR(10))
	RAISERROR( @Body, 16, -1)

	END

/*
IF EXISTS ( SELECT * FROM dbo.Sales
	inner join inserted ON Sales.SOitem = inserted.SOitem AND ISNULL(inserted.SalesNum,0) > 0
		WHERE Sales.ID_AllQuotes = inserted.ID_AllQuotes AND ISNULL(inserted.ID_AllQuotes,0) > 0)
	BEGIN
	DECLARE @ID_AllQuotes BIGINT = 0

	SET @Body = ''Sales.ID_AllQuotes already exsist '' + CAST(@ID_AllQuotes AS CHAR(20))+ ''cannot Insert. ''+CAST( ERROR_MESSAGE() AS CHAR(10))
	RAISERROR( @Body, 16, -1)
	ROLLBACK TRANSACTION
	RETURN;

	END
*/
PRINT ''trigger end  Sales_Insert:'';

END
' 
GO
ALTER TABLE [dbo].[Sales] ENABLE TRIGGER [Sales_Insert]
GO
/****** Object:  Trigger [dbo].[Sales_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[Sales_Update]
   ON  [dbo].[Sales] 
   FOR UPDATE 
   --NOT FOR REPLICATION
AS 
BEGIN

	--SET NOCOUNT ON; do not use when big UPDATE check is used

	PRINT ''trigger start [Sales_Update]:'';

	
	---big UPDATES are in error
	DECLARE @Count int
	SET @Count = @@ROWCOUNT;
    
	IF @Count > 100
	BEGIN
		RAISERROR(''Cannot UPDATE more than 100 records of dbo.Sales at one time. trigger Sales_Update'',16,1) 
		ROLLBACK TRANSACTION
		RETURN;
	END
	----------------------
	

	DECLARE @cProgram VarChar(60) ='' TRIGGER ERP_2.dbo.Sales_Update''
	DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()

	IF EXISTS ( SELECT * FROM inserted WHERE inserted.SOitem NOT Like ''%-%'' )
	BEGIN
		
		DECLARE @Body varchar(4000)
		DECLARE @badSOitem CHAR(10)
		
		SELECT @Body = ''dbo.Sales table was inserted and SOitem is not Proper,''+CHAR(13)
		SET @badSOitem = ''''
		
		SELECT TOP 1 @BadSoitem = SOitem  FROM inserted WHERE inserted.SOitem NOT Like ''%-%''
		SET @Body = @Body+'' SO item:''+@BadSoitem
			+CHAR(13)+(suser_sname())
			+CHAR(13)+@@SERVERNAME+@cProgram 
			
		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
			 @SubjectEmail = ''BAD SOitem'',
			 @BodyEmail = @Body,
			 @BodyType = ''TEXT''
		
		SET @Body = ''Insert into dbo.Sales table failed. SOitem:''+@BadSoitem+'' not Proper.''
		RAISERROR( @Body, 16, -1)

	END

-----------------------------------------------------
--also done in After_Update

IF UPDATE(Shipped)
	begin

	PRINT '' Found an UPDATE(Shipped) [Sales_Update]''
	UPDATE dbo.AllQuotes
		SET ShipDate = inserted.Shipped
		FROM inserted, deleted
		WHERE inserted.SOitem = [AllQuotes].SOitem 
		AND inserted.SOitem = deleted.SOitem 
		AND NOT inserted.Shipped = deleted.Shipped 
		AND inserted.Shipped IS NOT NULL
		AND UPDATE(Shipped)

	PRINT '' Updated AllQuotes with ShipDate=Shipped [Sales_Update]''

	UPDATE dbo.Ship
		SET ShipDate = inserted.Shipped
		FROM inserted, deleted
		WHERE inserted.SOitem = [Ship].SOitem 
		AND inserted.SOitem = deleted.SOitem 
		AND NOT inserted.Shipped = deleted.Shipped 
		AND inserted.Shipped IS NOT NULL
		AND UPDATE(Shipped)
	PRINT '' Updated Ship with ShipDate=Shipped [Sales_Update]''

	end

----------------------------------------------------


IF UPDATE([cncld]) OR UPDATE([cmplt])
	begin

	------------------------------------
	PRINT ''Delete StockLst Process if Cncld or cmplt ''

	DELETE FROM dbo.StockLst_Process 
		FROM dbo.StockLst_Process P
		INNER JOIN deleted ON P.SOitem = deleted.SOitem
		INNER JOIN inserted ON P.SOitem = inserted.SOitem
		WHERE P.PO_item = dbo.f_ProperSOitem(inserted.SOitem) 
			AND NOT dbo.f_ProperSOitem(deleted.SOitem) =  dbo.f_ProperSOitem('''')
		AND ( ISNULL(deleted.cmplt,0) = 0 AND ISNULL(inserted.cmplt,0) = 1
			OR ISNULL(deleted.cncld,0) = 0 AND ISNULL(inserted.cncld,0) = 1 )
		

	PRINT ''Delete BrokerLst Process if Cncld or cmplt ''

	DELETE FROM dbo.BrokerLst_Process 
		FROM dbo.BrokerLst_Process P
		INNER JOIN deleted ON P.SOitem = deleted.SOitem
		INNER JOIN inserted ON P.SOitem = inserted.SOitem
		WHERE P.PO_item = dbo.f_ProperSOitem(inserted.SOitem) 
			AND NOT dbo.f_ProperSOitem(deleted.SOitem) =  dbo.f_ProperSOitem('''')
		AND ( ISNULL(deleted.cmplt,0) = 0 AND ISNULL(inserted.cmplt,0) = 1
			OR ISNULL(deleted.cncld,0) = 0 AND ISNULL(inserted.cncld,0) = 1 )
		

	PRINT ''Delete WIPLst Process if Cncld or cmplt ''

	DELETE FROM dbo.WIPLst_Process 
		FROM dbo.WIPLst_Process P
		INNER JOIN deleted ON P.SOitem = deleted.SOitem
		INNER JOIN inserted ON P.SOitem = inserted.SOitem
		WHERE P.PO_item = dbo.f_ProperSOitem(inserted.SOitem) 
			AND NOT dbo.f_ProperSOitem(deleted.SOitem) =  dbo.f_ProperSOitem('''')
		AND ( ISNULL(deleted.cmplt,0) = 0 AND ISNULL(inserted.cmplt,0) = 1
			OR ISNULL(deleted.cncld,0) = 0 AND ISNULL(inserted.cncld,0) = 1 )

	------------------------------------------------------
	---- Create cReturn string
	PRINT ''Create cReturn string''
	
	DECLARE @cReturn VARCHAR(254) = ''''

	SELECT @cReturn = @cReturn + ''Cancelled ''+ deleted.SOitem + ''. ''
		FROM inserted, deleted
		WHERE deleted.SOitem = inserted.SOitem 
		AND inserted.SalesNum > 0
		AND ISNULL(deleted.Cncld,0) = 0
		AND ISNULL(inserted.Cncld,0) = 1
		AND NOT dbo.f_ProperSOitem(inserted.SOitem) =  dbo.f_ProperSOitem('''')
		AND ( UPDATE([cncld]) OR UPDATE([cmplt]) )

	SELECT @cReturn = @cReturn + ''UnCancel '' + deleted.SOitem + ''. ''
		FROM deleted, inserted 
		WHERE deleted.SOitem = inserted.SOitem 
		AND inserted.SalesNum > 0
		AND ISNULL(deleted.Cncld,0) = 1
		AND ISNULL(inserted.Cncld,0) = 0
		AND NOT dbo.f_ProperSOitem(inserted.SOitem) =  dbo.f_ProperSOitem('''')
		AND ( UPDATE([cncld]) OR UPDATE([cmplt]) )


	SELECT @cReturn = @cReturn + ''Completed '' + deleted.SOitem + ''. ''
		FROM deleted, inserted 
		WHERE deleted.SOitem = inserted.SOitem 
		AND inserted.SalesNum > 0
		AND ISNULL(deleted.cmplt,0) = 0 
		AND ISNULL(inserted.cmplt,0) = 1
		AND NOT dbo.f_ProperSOitem(inserted.SOitem) =  dbo.f_ProperSOitem('''')
		AND ( UPDATE([cncld]) OR UPDATE([cmplt]) )


	SELECT @cReturn = @cReturn + ''UnComplete '' + deleted.SOitem + ''. ''
		FROM deleted, inserted 
		WHERE deleted.SOitem = inserted.SOitem
		AND inserted.SalesNum > 0
		AND ISNULL(deleted.cmplt,0) = 1
		AND ISNULL(inserted.cmplt,0) = 0
		AND NOT dbo.f_ProperSOitem(inserted.SOitem) =  dbo.f_ProperSOitem('''')
		AND ( UPDATE([cncld]) OR UPDATE([cmplt]) )


	end

------------------------------------------------------------------------------------
IF UPDATE([cmplt])
	begin
	PRINT ''Record to rtr_Detail that Packing Slip has Completed the SOi''

	DECLARE @cOrderType CHAR(10) ,@cOrderNumber CHAR(10) ,@nOper_ID INT	,@bStart BIT
	SET @nOper_ID = 0

		SELECT TOP 1  @cOrderType=''SOitem'',  @cOrderNumber=inserted.SOitem, @nOper_ID=523, @bStart=0
		FROM deleted, inserted 
		WHERE deleted.SOitem = inserted.SOitem
		AND inserted.SalesNum > 0
		AND ISNULL(deleted.cmplt,0) = 0
		--AND inserted.SOitem = '' 116999-01'' --for testing!
		AND ISNULL(inserted.cmplt,0) = 1
		AND UPDATE([cmplt])

		IF @nOper_ID > 0
			EXEC dbo.p_rtr_Oper @cOrderType, @cOrderNumber, @nOper_ID, @bStart 
		

	end

------------------------------------------------------------------------------------
/*IF UPDATE([cmplt])
	begin
	PRINT ''Check Hold''

	
	
		FROM deleted, inserted 
		WHERE deleted.SOitem = inserted.SOitem
		AND inserted.SalesNum > 0
		AND ISNULL(deleted.cmplt,0) = 0
		AND ISNULL(inserted.cmplt,0) = 1
		AND ISNULL(inserted.Hold,0) = 1
		AND UPDATE([cmplt])

*/

------------------------------------------------------------------------------------
IF UPDATE(ItemTot)
	begin
	PRINT ''Record to UserTrack Sales_No ItemTot''

	INSERT dbo.NR_UserTrack	(Mess1,cProgram,ServerName) 
		SELECT LEFT(''Sales ItemTot=''+LTRIM(CAST(inserted.ItemTot AS VarChar(10)))
			+'' now set for SalesNum ''+LTRIM(CAST(ISNULL(inserted.SalesNum,0) AS CHAR(10)))+''. '',1024)
			,LEFT(@cProgram,100)
			,@@SERVERNAME
		FROM inserted 
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
			WHERE -- ISNULL(inserted.ItemTot,0) = 0 AND
			ISNULL(inserted.ItemTot,0) <> ISNULL(deleted.ItemTot,0)
			AND UPDATE(ItemTot)
	end


/*
--Record Update
IF LEN(@cReturn)>0
	BEGIN		
	
	DECLARE @Mess1 VARCHAR(254) = ''''
	
	SELECT TOP 1 @Mess1 = LEFT(''Sales data for SO Item:''+inserted.SOitem+'' was changed.''+@cReturn ,254) 
		FROM inserted 
		WHERE ISNULL(inserted.SalesNum,0)>0
 			AND ( UPDATE([cncld]) OR UPDATE([cmplt]) )

	PRINT ''Record Cancel and Complete status to dbo.NR_UserTrack. [Sales_after_Update]''
	PRINT @Mess1

	INSERT INTO dbo.NR_UserTrack (Mess1,cProgram,ErrorDate,Machine) 
		SELECT @Mess1,@cProgram,GetDate(),suser_sname() 

	PRINT ''Send a HTML Email''
	DECLARE @HTML VARCHAR(MAX)

	SELECT TOP 1 @HTML = LEFT(''Sales data for SO Item:''+inserted.SOitem+'' was changed. <br>''
			+dbo.f_HTML_link_SO_Status(inserted.SalesNum)+'' <br> ''+@cReturn ,254) 
			FROM inserted 
			WHERE ISNULL(inserted.SalesNum,0)>0
 			AND ( UPDATE([cncld]) OR UPDATE([cmplt]) )

	SET @HTML = @HTML+''<br> ''+RTRIM(suser_sname())+''. <br> ''
			+@@SERVERNAME+@cProgram 
			
	EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
		 @SubjectEmail = ''Updated Sales'',
		 @BodyEmail = @HTML,
		 @BodyType = ''HTML''		

	END
*/
----------------------------------------------------


PRINT ''Insert into dbo.Ar_Sales_History ''

INSERT dbo.Ar_Sales_History 
	([WHO],[WHAT],[WHEN]
      ,[soitem]
      ,[salesnum]
      ,[item]
      ,[orderspec]
      ,[inv]      ,[gfm]	  ,[Draw]      ,[roll]      ,[press]      ,[mach]      ,[cg]      ,[plasma]      ,[WJet]	  ,[ColdSaw]
      ,[cert]
      ,[itemtot]
      ,[shipdue]      ,[shipped]      ,[matlwt]
      ,[cncld]      ,[cmplt]
      ,[partno]
      ,[itemcost]      ,[itemsale]
	  ,StkCost	  ,POCost 	  ,StkPaid
      ,[gs_cost]      ,[gs_sale]      ,[gs_cmplt]
      ,[rma_no],[RMA_Detail]
      ,[qa]      ,[cofc]      ,[merc]
      ,[ppo]      ,[ppn]      ,[pheat]      ,[pspec]      ,[pdesc]      ,[pother]      ,[other]
      ,[prcp]      ,[prcd]      ,[pckd]
      ,[urgent]
      ,[shipon]
      ,[Tol]
      ,[JobHours]
      ,[ProcLoc]

	,[S_QTY]
	  ,[Quoted_QTY]	  ,[Quoted_P]	  ,[Quoted_Total]	  
	  ,[Quoted_CutsP]	  	  ,[Quoted_OtherP]	  	  ,[Quoted_PU]
	  ,[dShip]
	  ,[Typ]
	  ,[WO]	  ,[WO_Detail]	  ,[ProductionWO]
	  ,[Export]
	  ,[RcvdE]
	  ,[InqNumP]	  ,ID_AllQuotes
	  ,DateAdded
	  --,Review
	  ,RVW_Stock,RVW_Prod
	  ,Review_Date)
SELECT 	suser_sname(),''BeforeEdit'',GetDate()
      ,inserted.[soitem]
      ,inserted.[salesnum]
      ,inserted.[item]
      ,inserted.[orderspec]
      ,inserted.[inv]      ,inserted.[gfm]	  ,inserted.[Draw]      ,inserted.[roll]      ,inserted.[press]      ,inserted.[mach]      ,inserted.[cg]      ,inserted.[plasma]      ,inserted.[WJet]	  ,inserted.[ColdSaw]
      ,inserted.[cert]
      ,inserted.[itemtot]
      ,inserted.[shipdue]      ,inserted.[shipped]      ,inserted.[matlwt]
      ,inserted.[cncld]      ,inserted.[cmplt]
      ,inserted.[partno]
      ,inserted.[itemcost]      ,inserted.[itemsale]
	  ,inserted.StkCost	  ,inserted.POCost ,inserted.StkPaid
      ,inserted.[gs_cost]      ,inserted.[gs_sale]      ,inserted.[gs_cmplt]
      ,inserted.[rma_no]	  ,inserted.[RMA_Detail]
	  ,inserted.[qa]      ,inserted.[cofc]      ,inserted.[merc]
      ,inserted.[ppo]      ,inserted.[ppn]      ,inserted.[pheat]      ,inserted.[pspec]      ,inserted.[pdesc]      ,inserted.[pother]      ,inserted.[other]
      ,inserted.[prcp]      ,inserted.[prcd]      ,inserted.[pckd]
      ,inserted.[urgent]
      ,inserted.[shipon]
      ,inserted.[Tol]
      ,inserted.[JobHours]
      ,inserted.[ProcLoc]

	,inserted.[S_QTY]	  
	,inserted.[Quoted_QTY]	  ,inserted.[Quoted_P]	  ,inserted.[Quoted_Total]	  
	,inserted.[Quoted_CutsP]	  	,inserted.[Quoted_OtherP]	  	,inserted.[Quoted_PU]
	  ,inserted.[dShip]
	  ,inserted.[Typ]
	  ,inserted.[WO]	  ,inserted.[WO_Detail]	  ,inserted.[ProductionWO]
	  ,inserted.[Export]
	  ,inserted.[RcvdE]
	  ,inserted.[InqNumP]	 
	  , ( case WHEN inserted.ID_AllQuotes IS NULL 
		then (SELECT TOP 1 ISNULL(AQ.ID,0) AS AllQuotes_ID FROM dbo.AllQuotes AQ WHERE deleted.SOitem = AQ.SOitem )
		else inserted.ID_AllQuotes end
		) AS AllQuotes_ID
	  ,inserted.DateAdded
	  --,inserted.Review
	  ,inserted.RVW_Stock,inserted.RVW_Prod
	  ,inserted.Review_Date
 FROM inserted, deleted
	WHERE inserted.SOitem = deleted.SOitem 
--	AND UPDATE(BAD_itemSale)
		AND NOT (
		    inserted.[salesnum] = deleted.[salesnum]
		and inserted.[item] = deleted.[item]
    	and inserted.[orderspec] = deleted.[orderspec]
      	and inserted.[inv] = deleted.[inv]
      	and inserted.[gfm] = deleted.[gfm]
		and inserted.[draw] = deleted.[draw]
	and inserted.[roll] = deleted.[roll]
      	and inserted.[press] = deleted.[press]
      	and inserted.[mach] = deleted.[mach]
      	and inserted.[cg] = deleted.[cg]
      	and inserted.[plasma] = deleted.[plasma]
      	and inserted.[WJet] = deleted.[WJet]
		and inserted.[ColdSaw] = deleted.[ColdSaw]
      	and inserted.[cert] = deleted.[cert]

      	and inserted.[itemtot] = deleted.[itemtot] 
      	and inserted.[shipdue] = deleted.[shipdue]
 
		and inserted.[matlwt] = deleted.[matlwt]
      	and inserted.[cncld] = deleted.[cncld]
      	and inserted.[cmplt] = deleted.[cmplt]
      	and inserted.[partno] = deleted.[partno]
      	and inserted.[itemcost] = deleted.[itemcost]
      	and inserted.[itemsale] = deleted.[itemsale]
--      	and inserted.[gs_cost] = deleted.[gs_cost]
--	     	and inserted.[gs_sale] = deleted.[gs_sale]
--      	and inserted.[gs_cmplt] = deleted.[gs_cmplt]
      	and inserted.[rma_no] = deleted.[rma_no]
		and inserted.[RMA_Detail] = deleted.[RMA_Detail]
      	and inserted.[qa] = deleted.[qa]
      	and inserted.[cofc] = deleted.[cofc]
      	and inserted.[merc] = deleted.[merc]
--      	and inserted.[ppo] = deleted.[ppo]
--      	and inserted.[ppn] = deleted.[ppn]
      	and inserted.[pheat] = deleted.[pheat]
      	and inserted.[pspec] = deleted.[pspec]
      	and inserted.[pdesc] = deleted.[pdesc]
      	and inserted.[pother] = deleted.[pother]
      	and inserted.[other] = deleted.[other]
--      	and inserted.[prcp] = deleted.[prcp]
--      	and inserted.[prcd] = deleted.[prcd]
--      	and inserted.[pckd] = deleted.[pckd]
      	and inserted.[urgent] = deleted.[urgent]
      	and inserted.[shipon] = deleted.[shipon]
      	and inserted.[Tol] = deleted.[Tol]
--      	and inserted.[JobHours] = deleted.[JobHours]
      	and inserted.[ProcLoc] = deleted.[ProcLoc] 

		and inserted.[S_QTY] = deleted.[S_QTY]

		and inserted.[dShip] = deleted.[dShip]
		and inserted.[Typ] = deleted.[Typ]
		and inserted.[WO] = deleted.[WO]
		and inserted.[WO_Detail] = deleted.[WO_Detail]
--		and inserted.[ProductionWO] = deleted.[ProductionWO]
		--and inserted.Review = deleted.Review
--		and inserted.RVW_Stock = deleted.RVW_Stock
--		and inserted.RVW_Prod = deleted.RVW_Prod
		);


PRINT ''trigger  end  [Sales_Update]:'';

END
' 
GO
ALTER TABLE [dbo].[Sales] ENABLE TRIGGER [Sales_Update]
GO
/****** Object:  Trigger [dbo].[Sales_Detail_After_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Detail_After_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[Sales_Detail_After_Insert] 
ON [dbo].[Sales_Detail] 
	AFTER INSERT 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [Sales_Detail_After_Insert]'';

---
PRINT '' Copy Insert to Sales_Item_Detail''

---  Remove when Shop is on 3.0.10+ code!!
/*
INSERT INTO dbo.Sales_Item_Detail 
	(
      [Sales_Detail_ID]
	  ,[SOitem]
      ,[WO]
	  ,[Form]
      ,[PCS]
      ,[Dim1]
      ,[Dim2]
      ,[Dim3]
      ,[QTY]
      ,[Weight]
      ,[PackingSlip]
      ,[Invoice]
      ,[Est_P]
      ,[Act_P]
      ,[Total]
--      ,[Reconciled]
--      ,[When]
      ,[Heat]
      ,[ID_Master]
      ,[ID_Detail]
      ,[ID_Detail_Process]
      ,[TBL]
	  
	  )
SELECT  [ID]
      ,[SOitem]
	  ,[WO]
	  ,ISNULL([Form],'''') AS Form
      ,ISNULL([StockLst_PC],0) AS PCS
      ,ISNULL([StockLst_Dim1],0) AS Dim1
      ,ISNULL([StockLst_Dim2],0) AS Dim2
      ,ISNULL([StockLst_Dim3],0) AS Dim3
      ,ISNULL([StockLst_Qty],0) AS QTY
      ,ISNULL([StockLst_LBS],0) AS Weight
      ,ISNULL([PackingSli],0) AS PackingSlip
	  ,ISNULL([Invoice],0) AS [Invoice]
      ,ISNULL([StkPaid_P],0) AS Est_P
      ,ISNULL([StockLst_P],0) AS ACT_P
      ,ISNULL([StockLst_Total],0) AS Total

	  ,ISNULL([Heat],'''') AS Heat
      ,ISNULL(StockLst_ID,0) AS ID_Master
      ,ISNULL(StockLst_ID_Detail,0) AS [ID_Detail]
      ,ISNULL([ID_Detail_Process],0) AS ID_Detail_Process
      ,ISNULL([TBL],'''') AS TBL

  FROM inserted
  WHERE ISNULL([DoNotCopy],0) = 0
*/

PRINT ''Trigger  End  [Sales_Detail_After_Insert]'';

/*

UPDATE dbo.Sales_Item_Detail 
	SET Heat = ISNULL(Sales_Detail.Heat,'''') 
      ,ID_Master = ISNULL(Sales_Detail.StockLst_ID,0) 
      ,ID_Detail = ISNULL(Sales_Detail.StockLst_ID_Detail,0)  
      ,ID_Detail_Process = ISNULL(Sales_Detail.ID_Detail_Process,0) 
      ,TBL = ISNULL(Sales_Detail.TBL,'''') 
FROM dbo.Sales_Detail
WHERE Sales_Item_Detail.Sales_Detail_ID = Sales_Detail.ID

*/
' 
GO
ALTER TABLE [dbo].[Sales_Detail] ENABLE TRIGGER [Sales_Detail_After_Insert]
GO
/****** Object:  Trigger [dbo].[Sales_Detail_Delete]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Detail_Delete]'))
EXEC dbo.sp_executesql @statement = N'create TRIGGER [dbo].[Sales_Detail_Delete] 
ON [dbo].[Sales_Detail] 
	FOR DELETE
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [Sales_Detail_Delete]'';

	

	DECLARE @Count int
	SET @Count = @@ROWCOUNT;
        
	IF @Count > 50000
	BEGIN
		RAISERROR(''Cannot DELETE more than 50 000 records of Lst_Detail at one time.'',16,1) 
		ROLLBACK TRANSACTION
		RETURN;
	END

PRINT ''Trigger  End  [Sales_Detail_Detail]'';
' 
GO
ALTER TABLE [dbo].[Sales_Detail] ENABLE TRIGGER [Sales_Detail_Delete]
GO
/****** Object:  Trigger [dbo].[Sales_Detail_PackingSlip_After_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Detail_PackingSlip_After_Insert]'))
EXEC dbo.sp_executesql @statement = N'Create TRIGGER [dbo].[Sales_Detail_PackingSlip_After_Insert] 
ON [dbo].[Sales_Detail_PackingSlip] 
	AFTER INSERT 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [Sales_Detail_PackingSlip_After_Insert]'';

---

PRINT ''Trigger  End  [Sales_Detail_PackingSlip_After_Insert]'';
' 
GO
ALTER TABLE [dbo].[Sales_Detail_PackingSlip] ENABLE TRIGGER [Sales_Detail_PackingSlip_After_Insert]
GO
/****** Object:  Trigger [dbo].[Sales_Detail_Sum_Delete]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Detail_Sum_Delete]'))
EXEC dbo.sp_executesql @statement = N'create TRIGGER [dbo].[Sales_Detail_Sum_Delete] 
ON [dbo].[Sales_Detail_Sum] 
	FOR DELETE
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [Sales_Detail_Sum_Delete]'';

	

	DECLARE @Count int
	SET @Count = @@ROWCOUNT;
        
	IF @Count > 100
	BEGIN
		RAISERROR(''Cannot DELETE more than 100 records of Lst_Detail at one time.'',16,1) 
		ROLLBACK TRANSACTION
		RETURN;
	END

PRINT ''Trigger  End  [Sales_Detail_Sum_Detail]'';
' 
GO
ALTER TABLE [dbo].[Sales_Detail_Sum] ENABLE TRIGGER [Sales_Detail_Sum_Delete]
GO
/****** Object:  Trigger [dbo].[Sales_Hold_Status_After_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Hold_Status_After_Insert]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Brandon van de Venter
-- Create date: 03/20/2020
-- Description:	Adds a message to GlaDOS message queue for sales users
-- UPDATES:
-- 07/28/2020:	Added ''@whoChangedHold'' variable to retrieve the user making the change for use in messages and emails. 
--				Updated the GLaDOS and email messages to use the new variable. Corrected email to use holdphrase to determine if ''on'' or ''off'' hold.
-- 10/19/2022:	Added ''OrderHoldUpdate@ERP_1s.com'' as a default email to address. Lisa would like to receive all emails regarding 
-- 2022 Dec 6:	SL: updated terms@ERP_1s.com to ar@ERP_1s.com 
-- =============================================
CREATE TRIGGER [dbo].[Sales_Hold_Status_After_Insert] 
   ON  [dbo].[Sales_Hold_Status] 
   AFTER INSERT
AS 
BEGIN

	PRINT ''trigger start Sales_Hold_Status_After_Insert:'';

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	DECLARE
		@Hold_Value bit = 0,
		@HoldType char(10) = '''',
		@SOitem char(10) = '''',
		@SalesNum int = -1,
		@POitem char(12) = '''',
		@salesRep char(20) = '''',
		@SalesP char(1) = '''',
		@userId int = 0,
		@whoChangedHold varchar(MAX) = '''',
		@holdMessage_phrase varchar(20) = '''',
		@holdMessage varchar(MAX) = '''',
		@holdComment varchar(255) = '''',
		@holdDesc VarChar(255) = ''''
		
	DECLARE @cCompany	VarChar(30)='''',
		@cCompany_NoNoise	VarChar(30)='''',
		@CustID		CHAR(20)='''',
		@cBuyCompany	VarChar(30)=''''

	DECLARE @SalesP_Email VARCHAR(30) = '''',
		@cEmailTo VARCHAR(4000) = ''''

	SELECT
		@Hold_Value = Hold_Value,
		@HoldType = Hold_Type,
		@SOitem = SOitem,
		@POitem = POitem,
		@SalesNum = SalesNum,
		@holdComment = Comment,
		@whoChangedHold = [Who]
	FROM [inserted]

	IF (@SalesNum > 0) 
	BEGIN
		PRINT ''Sales_Hold_Status_After_Insert: Prepare to:INSERT INTO [Messenger].[dbo].[Message] ''
		PRINT ''GET ASSIGNED SALES REP''

		SELECT TOP(1) @salesRep = LTRIM(RTRIM(SalesRep))
		  FROM [dbo].[Sales_No] WITH(NOLOCK) 
		  WHERE [salesnum] = @SalesNum

		PRINT ''Could be a PO hold, not SO''
		IF LEN(@salesRep) = 0
			SELECT TOP(1) @SalesP = LTRIM(RTRIM(SalesP))
			  FROM [dbo].[PurchaseOrder] WITH(NOLOCK) 
			  WHERE [POitem] = dbo.f_ProperPOitem( @POitem )

		IF LEN(@SalesP)>1
			SELECT TOP(1) @salesRep =  LTRIM(RTRIM([UN]))
			  FROM dbo.AppSetup WITH(NOLOCK)
			  WHERE PRP = ''SalesP'' AND [ANS] = @SalesP
		
		IF LEN(@salesRep) > 0
			SELECT TOP 1 @SalesP_Email=LTRIM(RTRIM([ANS])) 
			  FROM dbo.AppSetup WITH(NOLOCK) 
			  WHERE PRP = ''E-mail'' AND [UN] = @salesRep
		
		SELECT TOP 1 @CustID=CustID
			FROM dbo.AllQuotes WITH(NOLOCK)
			WHERE [salesnum] = @SalesNum


		PRINT ''GET SALES REP CHATTER ID''
		SELECT TOP(1) @userId = UserID
		  FROM [Messenger].[dbo].[Users] WITH(NOLOCK) 
		  WHERE LTRIM(RTRIM(UserName)) = @salesRep


		PRINT ''Create message for GlaDOS to deliver''
		IF (@userId > 0) 
		BEGIN
			IF (@Hold_Value = 1)
				set @holdMessage_phrase = ''placed on '';
			Else
				set @holdMessage_phrase = ''removed from '';


			SET @holdMessage = ''Hello '' + LTRIM(RTRIM(@salesRep)) +'', ''
			SET @holdMessage = @holdMessage+ ''I''''d like to make you aware that ''
			IF @SalesNum > 0
				SET @holdMessage = @holdMessage+ ''Sales Order Item '' + LTRIM(RTRIM(@SOitem))+CHAR(13) ;
			ELSE
				SET @holdMessage = @holdMessage+ ''Purchase Order Item '' + LTRIM(RTRIM(@POitem)) ;
	
			SET @holdMessage = @holdMessage+ '' has been '' + @holdMessage_phrase 
			SET @holdMessage = @holdMessage+ '' '' + LTRIM(RTRIM(@HoldType)) + '' hold by '' + LTRIM(RTRIM(@whoChangedHold)) + ''.''

			IF LEN(@CustID) > 0
				SET @holdMessage = @holdMessage+ CHAR(13)+''CustID=''+@CustID+''.''+CHAR(13)

			SET @holdMessage = @holdMessage+ CHAR(13)+@holdComment ;

			PRINT ''INSERT INTO [Messenger].[dbo].[Message] ''

			INSERT INTO [Messenger].[dbo].[Message] 
			(
				[UserID],
				[Message]
			)
			VALUES 
			(
				@userId,
				@holdMessage
			)
			
			--*************************************************************************

			PRINT ''Email Alert''

			SET @cEmailTo = ''OrderHoldUpdate@ERP_1s.com''; -- ADDED 10/19/2022

			--EQP, INV, AR, QA, PO, CSTR, RCV
			IF @HoldType = ''AR''
				SET @cEmailTo = ''Acct@ERP_1s.com;'' + @cEmailTo -- Modified 10/19/2022
				--SET @cEmailTo = ''AR@ERP_1s.com''
			ELSE IF @HoldType = ''QA'' OR @HoldType = ''RCV''
				SET @cEmailTo = ''QA@ERP_1s.com;'' + @cEmailTo -- Modified 10/19/2022



			IF LEN(@SalesP_Email) > 1
				IF LEN(@cEmailTo) > 1
					SET @cEmailTo = @SalesP_Email +'';''+ @cEmailTo
				ELSE
					SET @cEmailTo = @SalesP_Email 

			IF LEN(@cEmailTo) > 1
				begin
					PRINT ''Build Email''

					DECLARE @cEmailFrom VARCHAR(30) 
					SET @cEmailFrom = ERP_2.dbo.f_GetSQL_Server_Email()
					DECLARE @Body varchar(8000)
					SET @Body = dbo.f_HTML_HPA_Header()+''<br />''

					SET @Body = @Body + '' Hold Status has new entry, now '' + @holdMessage_phrase + LTRIM(RTRIM(@HoldType)) + '' hold.''+''<br />''
				
					SET @SalesNum = CAST( LEFT(@SOitem,7) AS INT)

					DECLARE @PurchaseOrder INT = 0
					SET @PurchaseOrder = CAST( LEFT(@POitem,9) AS INT)

					IF @SalesNum > 0
						begin
						--PRINT ''Add SO''

						SET @Body = @Body + CHAR(13)+CHAR(10) + ''@SOitem:''+ISNULL(@SOitem,'''')+'' ''
						SET @Body = @Body + CHAR(13)+CHAR(10) + ''"''+ dbo.f_HTML_link_SOitem(@SOitem)+''"''+''<br />''+''<br />''
						--SET @Body = @Body+'' "''+ dbo.f_Reportlink_CHAR(''SOitem'',@SOitem)+''"''+''<br />''

						--SET @holdMessage = @holdMessage+ ''Sales Order Item '' + LTRIM(RTRIM(@SOitem))+CHAR(13) ;
						SELECT @holdDesc = dbo.f_ItemDescriptionMetric(Q.Form,Q.Thck,Q.SZ2,Q.SZ3,Q.[Weight],Q.RandLen,Q.Metric,Q.Sz1orig,Q.Sz2orig,Q.Sz3orig)
							FROM dbo.AllQuotes Q WITH(NOLOCK) WHERE Q.SOItem = dbo.f_ProperSOitem(@SOItem) ;

						SET @Body = @Body + CHAR(13)+CHAR(10) + ''Desc: ''+@holdDesc+ CHAR(13)+CHAR(10) ;

						
						SELECT TOP 1 @cCompany = Company FROM dbo.AllQuotes WHERE SOitem = @SOitem
						
						SET @Body = @Body+''<br />'' 
						SET @Body = @Body+CHAR(13)+CHAR(10)+''On Hold Status: "''+ dbo.[f_HTML_link_SOitem_onHold](@SOitem)+''"''+''<br />''
						--SET @Body = @Body+CHAR(13)+CHAR(10)+''"''+ dbo.f_ReportLink_CHAR(''Internal.onHoldSales'',@SOitem)+''"''+''<br />''
						--SET @cReturnString = ''https://internal.highperformancealloys.com/onHoldSales/''+TRIM(@cCHAR)
						--https://internal.highperformancealloys.com/onHoldSales/117770-01

						end

					IF @PurchaseOrder > 0
						begin
						--PRINT ''Add PO''

						SET @Body = @Body + CHAR(13)+CHAR(10) + ''@POitem:''+ISNULL(@POitem,'''')+''  ''
						SET @Body = @Body + CHAR(13)+CHAR(10) + ''"''+ dbo.f_HTML_link_POitem(@POitem)+''"''+''<br />''
						--SET @Body = @Body + CHAR(13)+CHAR(10) + ''"''+ dbo.f_Reportlink_CHAR(''POitem'',@POitem)+''"''+''<br />''
						SELECT TOP 1 @cBuyCompany = Company FROM dbo.PurchaseOrder WHERE POitem = @POitem
						

						end

					IF LEN(@cCompany) > 0
						begin
						--PRINT ''Add Company''

						SET @cCompany_NoNoise = dbo.f_NoNoiseName(@cCompany)

						SET @Body = @Body + CHAR(13)+CHAR(10) + ''<br />''
						SET @Body = @Body + CHAR(13)+CHAR(10) + ''Company Info: ''+ISNULL(@cCompany,'''')+'' ''
						SET @Body = @Body+CHAR(13)+CHAR(10)+''"''+ dbo.f_HTML_link_Company_Info(@cCompany)+''"''+''<br />''
						--SET @Body = @Body+CHAR(13)+CHAR(10)+''"''+ dbo.f_Reportlink_CHAR(''CustomerInfo_NoNoise'',@cCompany_NoNoise)+''"''+''<br />''
						end

					IF LEN(@CustID) > 0
						begin
						--PRINT ''Add CustomerID''

						SET @Body = @Body + CHAR(13)+CHAR(10) + ''<br />''
						SET @Body = @Body + CHAR(13)+CHAR(10) + ''CustomerID: ''+ISNULL(@CustID,'''')+''  ''
						--un remmed the next line 07/30/24 - I am looking to just display the HTML tag, not the full text.
						SET @Body = @Body+CHAR(13)+CHAR(10)+''"''+ dbo.f_HTML_link_CustomerID(@CustID) +''"''+''<br />''
						--SET @Body = @Body+CHAR(13)+CHAR(10)+''"''+ dbo.f_Reportlink_CHAR(''CustomerID'',@CustID) +''"''+''<br />''
						end

					IF @SalesNum > 0
						begin
						--PRINT ''On Hold History''

						SET @Body = @Body + CHAR(13)+CHAR(10) + ''<br />''
						SET @Body = @Body+CHAR(13)+CHAR(10)+''"''+ dbo.f_HTML_link_SO_OnHold_History(@SalesNum) +''"''+''<br />''
						--SET @Body = @Body+CHAR(13)+CHAR(10)+''Hold History: "''+ dbo.f_Reportlink_INT(''SO_OnHold_Hist'',@SalesNum)	+''"''+''<br />''
						--dbo.f_HTML_link_SO_OnHold_History(@@SalesNum)
						
												
						end


					SET @Body = @Body +''<br />'' + ''Code from Trigger dbo.Sales_Hold_Status_After_Insert ''					
					SET @Body = @Body +''<br />'' + ''Entered by '' + LTRIM(RTRIM(@whoChangedHold)) + '' on ''+RTRIM(GETDATE())+''.'' 
				
					SET @Body = @Body + dbo.f_HTML_HPA_Footer(0)
					
					--PRINT ''Body is set ''+@Body
					--PRINT ''EXEC dbo.p_eMail_Send @FromEmail = ''''''+@cEmailFrom+'''''' , @ToEmail = ''''''+@cEmailTo+'''''', @SubjectEmail = ''''Hold Status change.'''', @BodyEmail ='''',@BodyType = ''''HTML'''' ''

					EXEC dbo.p_eMail_Send
						 @FromEmail = @cEmailFrom, 
						 @ToEmail = @cEmailTo, 
						 @SubjectEmail = ''Hold Status change.'',
						 @BodyEmail = @Body,
						 @BodyType = ''HTML''		
						
					PRINT ''Alert Email Sent''

				end
			
		END
		Else
			INSERT INTO ERP_2.dbo.UserTrack (mess1,cProgram) VALUES (''Did not get UserID for @salesRep=''+@salesRep,''TRIGGER [dbo].[Sales_Hold_Status_After_Insert] '')

	END

	PRINT ''trigger end  Sales_Hold_Status_After_Insert:'';
END

' 
GO
ALTER TABLE [dbo].[Sales_Hold_Status] ENABLE TRIGGER [Sales_Hold_Status_After_Insert]
GO
/****** Object:  Trigger [dbo].[Sales_Hold_Status_After_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Hold_Status_After_Update]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Brandon van de Venter
-- Create date: 09/29/2020
-- Description:	Updates dbo.PurchaseOrder with overall Hold Status
-- =============================================
CREATE TRIGGER [dbo].[Sales_Hold_Status_After_Update] 
   ON [dbo].[Sales_Hold_Status] 
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	DECLARE
		@Hold_Value bit = 0,
		@HoldType char(10) = '''',
		@SOitem char(10) = '''',
		@SalesNum int = -1,
		@POitem char(12) = ''''


	SELECT TOP 1
		@Hold_Value = Hold_Value,
		@HoldType = Hold_Type,
		@SOitem = SOitem,
		@SalesNum = SalesNum,
		@POitem = POitem 
	FROM [inserted]

	--SELECT @Hold_Value = dbo.f_Is_SOitemHeld(SOitem) FROM dbo.Sales WITH(NOLOCK) WHERE SalesNum = @SalesNum
	IF dbo.f_ProperSOitem(@SOitem) <> dbo.f_ProperSOitem('''')
		UPDATE dbo.Sales SET Hold = ISNULL(dbo.f_Is_SOitemHeld(@SOitem),0) WHERE SOitem = @SOitem
	--ELSE
	--	IF dbo.f_ProperPOitem(ISNULL(@POitem, '''')) <> dbo.f_ProperPOitem('''')
	--		UPDATE dbo.PurchaseOrder SET Hold = ISNULL(dbo.f_Is_POitemHeld(@POitem),0) WHERE POitem = @POitem

END
' 
GO
ALTER TABLE [dbo].[Sales_Hold_Status] DISABLE TRIGGER [Sales_Hold_Status_After_Update]
GO
/****** Object:  Trigger [dbo].[Sales_Hold_Status_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Hold_Status_Insert]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David Kirchner
-- Create date: 03/20/2020
-- Description:	Updates dbo.Sales with overall Hold Status
-- UPDATES:
-- 10/09/2020 - (Brandon) POitems will directly update PO table, nothing needs to be done for a PO on insert.
-- =============================================
CREATE TRIGGER [dbo].[Sales_Hold_Status_Insert] 
   ON  [dbo].[Sales_Hold_Status] 
   FOR INSERT
AS 



BEGIN
	PRINT ''trigger start Sales_Hold_Status_Insert:'';
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	DECLARE
		@Hold_Value bit = 0,
		@HoldType char(10) = '''',
		@SOitem char(10) = '''',
		@SalesNum int = -1,
		@POitem char(12) = ''''


	SELECT TOP 1
		@Hold_Value = Hold_Value,
		@HoldType = Hold_Type,
		@SOitem = SOitem,
		@SalesNum = SalesNum,
		@POitem = POitem 
	FROM [inserted]

	--SELECT @Hold_Value = dbo.f_Is_SOitemHeld(SOitem) FROM dbo.Sales WITH(NOLOCK) WHERE SalesNum = @SalesNum
	--IF (RTRIM(@HoldType) = ''PO'')
	--	IF dbo.f_ProperPOitem(ISNULL(@POitem, '''')) <> dbo.f_ProperPOitem('''')
	--		UPDATE dbo.PurchaseOrder SET Hold = ISNULL(@Hold_Value, CONVERT(bit, 0)) WHERE POitem = @POitem
	IF dbo.f_ProperSOitem(@SOitem) <> dbo.f_ProperSOitem('''')
		UPDATE dbo.Sales SET Hold = ISNULL( dbo.f_Is_SOitemHeld(@SOitem) ,0) WHERE SOitem = @SOitem
	--ELSE
	--	IF dbo.f_ProperPOitem(ISNULL(@POitem, '''')) <> dbo.f_ProperPOitem('''')
	--		UPDATE dbo.PurchaseOrder SET Hold = ISNULL(dbo.f_Is_POitemHeld(@POitem),0) WHERE POitem = @POitem
	
	PRINT ''trigger end  Sales_Hold_Status_Insert:'';
END

' 
GO
ALTER TABLE [dbo].[Sales_Hold_Status] ENABLE TRIGGER [Sales_Hold_Status_Insert]
GO
/****** Object:  Trigger [dbo].[Sales_No_After_Delete]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Sales_No_After_Delete]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.StockLst_Process_Delete    Script Date: 11/30/2005 3:54:44 PM ******/
CREATE   TRIGGER [dbo].[Sales_No_After_Delete] ON [dbo].[Sales_No] 
	AFTER DELETE 
	NOT FOR REPLICATION
AS

PRINT ''trigger start Sales_No_After_Delete:'';

INSERT dbo.Ar_Sales_No_History 
	(What,[WHEN]
	  ,[salesnum]
      ,[salesrep]
      ,[instrct]
      ,[itemtot]
      ,[psoldaddr]
      ,[pshipaddr]
      ,[shiproute]
      ,[shippay]
      ,[paytype]
	  ,[CustID]
      ,[paper_po]
      ,[cncld]
      ,[cmplt]
      ,[blind]
      ,[faxconf]
      ,[emailconf]
      ,[freightest]
      ,[printedso]
      ,[emailedps]
      ,[faxedps]
      ,[addr_ref]
      ,[trt_lumber]
      ,[tarfbill]
      ,[usa]
      ,[ECPC]
	  ,[DPAS]
	  ,[FCI]
	  ,[GOV]
      ,[amendment]
	  ,BillInstrct
      ,[ShopRecv]
      ,[Changing]
	  )

SELECT 	''DELETE'',GETDATE()
	  ,[salesnum]
      ,[salesrep]
      ,[instrct]
      ,[itemtot]
      ,[psoldaddr]
      ,[pshipaddr]
      ,[shiproute]
      ,[shippay]
      ,[paytype]
	  ,[CustID]
      ,[paper_po]
      ,[cncld]
      ,[cmplt]
      ,[blind]
      ,[faxconf]
      ,[emailconf]
      ,[freightest]
      ,[printedso]
      ,[emailedps]
      ,[faxedps]
      ,[addr_ref]
      ,[trt_lumber]
      ,[tarfbill]
      ,[usa]
      ,[ECPC]
	  ,[DPAS]
	  ,[FCI]
	  ,[GOV]
      ,[amendment]
	  ,BillInstrct
      ,[ShopRecv]
      ,[Changing]
 FROM deleted

 ---------------------------

 DELETE FROM dbo.Sales_No_Chng 
	WHERE SalesNum IN ( SELECT deleted.SalesNum FROM deleted WHERE ISNULL(deleted.SalesNum,0) > 0 ) 
	
DELETE FROM dbo.Sales_No_Rev
	WHERE SalesNum IN ( SELECT deleted.SalesNum FROM deleted WHERE ISNULL(deleted.SalesNum,0) > 0 ) 

-----------------------------

 PRINT ''trigger end  Sales_No_After_Delete:'';
' 
GO
ALTER TABLE [dbo].[Sales_No] ENABLE TRIGGER [Sales_No_After_Delete]
GO
/****** Object:  Trigger [dbo].[Sales_No_After_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Sales_No_After_Update]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.StockLst_Process_Delete    Script Date: 11/30/2005 3:54:44 PM ******/
CREATE TRIGGER [dbo].[Sales_No_After_Update] ON [dbo].[Sales_No] 
	AFTER UPDATE 
	--NOT FOR REPLICATION
AS

PRINT ''trigger start Sales_No_After_Update:'';


--IF UPDATE() only need the WHERE NOT clause.

PRINT ''Archive: dbo.Ar_Sales_No_History ''
INSERT dbo.Ar_Sales_No_History 
	  (What
	  ,[WHEN]
	  ,[salesnum]
      ,[salesrep]
      ,[instrct]
      ,[itemtot]
      ,[psoldaddr]
      ,[pshipaddr]
      ,[shiproute]
      ,[shippay]
      ,[paytype]
	  ,[CustID]
      ,[paper_po]
      ,[cncld]
      ,[cmplt]
      ,[blind]
      ,[faxconf]
      ,[emailconf]
      ,[freightest]
      ,[printedso]
      ,[emailedps]
      ,[faxedps]
      ,[addr_ref]
      ,[trt_lumber]
      ,[tarfbill]
      ,[usa]
      ,[ECPC]
	  ,[DPAS]
	  ,[FCI]
	  ,[GOV]
      ,[amendment]
	  ,BillInstrct
      ,[ShopRecv]
      ,[Changing]
	  )
SELECT 	''BeforeEdit''
	  , GETDATE()
	  ,inserted.[salesnum]
      ,inserted.[salesrep]
      ,inserted.[instrct]
      ,inserted.[itemtot]
      ,inserted.[psoldaddr]
      ,inserted.[pshipaddr]
      ,inserted.[shiproute]
      ,inserted.[shippay]
      ,inserted.[paytype]
	  ,inserted.[CustID]
      ,inserted.[paper_po]
      ,inserted.[cncld]
      ,inserted.[cmplt]
      ,inserted.[blind]
      ,inserted.[faxconf]
      ,inserted.[emailconf]
      ,inserted.[freightest]
      ,inserted.[printedso]
      ,inserted.[emailedps]
      ,inserted.[faxedps]
      ,inserted.[addr_ref]
      ,inserted.[trt_lumber]
      ,inserted.[tarfbill]
      ,inserted.[usa]
      ,inserted.[ECPC]
	  ,inserted.[DPAS]
	  ,inserted.[FCI]
	  ,inserted.[GOV]
      ,inserted.[amendment]
	  ,inserted.BillInstrct
      ,inserted.[ShopRecv]
      ,inserted.[Changing]
 FROM inserted,deleted
	WHERE inserted.salesnum = deleted.salesnum 
	--Save when One of these have changed.
	AND NOT ( inserted.[salesrep] = deleted.[salesrep]
		AND inserted.[instrct] = deleted.[instrct]
		AND inserted.[itemtot] = deleted.[itemtot]
		AND inserted.[psoldaddr] = deleted.[psoldaddr]
		AND inserted.[pshipaddr] = deleted.[pshipaddr]
		AND inserted.[shiproute] = deleted.[shiproute]
		AND inserted.[shippay] = deleted.[shippay]
		AND inserted.[paytype] = deleted.[paytype]
		AND inserted.[CustID] = deleted.[CustID]
		AND inserted.[paper_po] = deleted.[paper_po]
		AND inserted.[cncld] = deleted.[cncld]
		AND inserted.[cmplt] = deleted.[cmplt]
		AND inserted.[blind] = deleted.[blind]
		--AND inserted.[faxconf] = deleted.[faxconf]
		--AND inserted.[emailconf] = deleted.[emailconf]
		--AND inserted.[freightest] = deleted.[freightest]
		--AND inserted.[addr_ref] = deleted.[addr_ref]
		--AND inserted.[trt_lumber] = deleted.[trt_lumber]
		--AND inserted.[tarfbill] = deleted.[tarfbill]
		AND inserted.[USA] = deleted.USA
		AND inserted.[ECPC] = deleted.[ECPC] 
		AND inserted.[FCI] = deleted.[FCI] 
		AND inserted.[GOV] = deleted.[GOV]
		AND inserted.Amendment = deleted.Amendment 
		)
		
PRINT ''trigger end  Sales_No_After_Update:'';
' 
GO
ALTER TABLE [dbo].[Sales_No] ENABLE TRIGGER [Sales_No_After_Update]
GO
/****** Object:  Trigger [dbo].[Sales_No_Delete]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Sales_No_Delete]'))
EXEC dbo.sp_executesql @statement = N'CREATE   TRIGGER [dbo].[Sales_No_Delete] ON [dbo].[Sales_No] 
	FOR DELETE 
	NOT FOR REPLICATION
AS

PRINT ''trigger start Sales_No_Delete:'';

---

DECLARE @Count int
SET @Count = @@ROWCOUNT;
       
IF @Count > 1000
BEGIN
	RAISERROR(''Cannot DELETE more than 1 000 records of [Sales_No] at one time.'',16,1) 
	ROLLBACK TRANSACTION
	RETURN;
END

---

INSERT INTO dbo.NR_UserTrack ([mess1],[cprogram],ServerName) 
	SELECT LEFT(''Sales_No DELETED for SalesNum ''+LTRIM(CAST(ISNULL(deleted.SalesNum,0) AS CHAR(10))) ,1024)
		,LEFT(''TRIGGER dbo.Sales_No_Delete'',100)  
		,@@ServerName
		FROM deleted

PRINT ''trigger end  Sales_No_Delete:'';
' 
GO
ALTER TABLE [dbo].[Sales_No] ENABLE TRIGGER [Sales_No_Delete]
GO
/****** Object:  Trigger [dbo].[Sales_No_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Sales_No_Insert]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.StockLst_Process_Delete    Script Date: 11/30/2005 3:54:44 PM ******/
CREATE TRIGGER [dbo].[Sales_No_Insert] ON [dbo].[Sales_No] 
	FOR INSERT
	NOT FOR REPLICATION
AS


PRINT ''trigger start Sales_No_Insert:'';

---big UPDATES are in error
DECLARE @Count int
SET @Count = @@ROWCOUNT;
   
IF @Count > 1000
BEGIN
	RAISERROR(''Cannot INSERT more than 1000 records of dbo.Sales_No at one time. trigger Sales_No_Insert'',16,1) 
	ROLLBACK TRANSACTION
	RETURN;
END
	----------------------

--IF (TRIGGER_NESTLEVEL(@@PROCID , ''AFTER'' , ''DML'') > 1)
--IF TRIGGER_NESTLEVEL() <= 1 /*this update is not coming from some other trigger*/
--IF TRIGGER_NESTLEVEL() > 1 /*this update is coming from some other trigger*/

--look for WHERE paytype =''STD TERMS '' then check against Terms data.
-----------------------------------------------------

DECLARE @cProgram Char(60) = ''TRIGGER dbo.Sales_No_Insert''
DECLARE @Body varchar(4000) = ''''
DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()

----------------------------------------------------------------------------------------------------
PRINT ''Test STD TERMS'';
--IF EXISTS ( SELECT * FROM inserted WHERE ISNULL(inserted.paytype,'''') =''STD TERMS'' )
IF ISNULL((SELECT COUNT(*) FROM inserted WHERE ISNULL(inserted.paytype,'''') =''STD TERMS'' ),0) > 0
BEGIN
	PRINT ''Found insert with Paytype=STD TERMS''
	
	SELECT @Body = ''Insert to dbo.Sales_No ''+CAST(Inserted.salesnum AS CHAR(10))+CHAR(13)
		+ '' has a [PayType] of [STD TYPE] ''
		--+CAST(PU.Max_P AS VARCHAR(25))+ '' max rule set in dbo.pU.'' + CHAR(13)
		--+ ''ID= ''+CAST(ID AS CHAR(10))+'' ID_Detail= ''+CAST(ID_Detail AS CHAR(10))+'' PU=''+ CAST(S_PU AS CHAR(1)) +''  S_P=''+CAST(S_P AS VARCHAR(25))+CHAR(13)
		--+''. ''+ISNULL([Length],'''') 
		FROM inserted
		WHERE ISNULL(inserted.paytype,'''') =''STD TERMS'' 
	

	SET @Body = @Body+RTRIM(suser_sname())+CHAR(13)
		+@@SERVERNAME+'' TRIGGER ERP_2.dbo.Sales_No_Insert ''
			
	EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''Terms@ERP_1s.com'', 
		 @SubjectEmail = ''STD TERMS'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''
	

END


----------------------------------------------------------------------------------------------------
PRINT ''Test STD TERMS with NO Customer Terms'';
IF ISNULL((SELECT COUNT(*) FROM inserted WHERE ISNULL(inserted.paytype,'''') =''STD TERMS'' 
	AND ISNULL(inserted.salesnum,0)>0   
	AND NOT dbo.f_Customer_Terms(dbo.f_CustomerID_SalesNum(inserted.salesnum)) = ''STD TERMS''
	),0) > 0
	AND UPDATE(PayType)
BEGIN
	PRINT ''Found Paytype=STD TERMS and CustomerID Not set for STD Terms''
	--PRINT dbo.f_CustomerID_SalesNum(114478)
	--IF dbo.f_Customer_Terms(''LYNCHBU'') = ''STD TERMS''
	--IF dbo.f_Customer_Terms(dbo.f_CustomerID_SalesNum(114478)) = ''STD TERMS''

	SELECT TOP 1 @Body = ''Insert to dbo.Sales_No has BAD Terms, SalesNum ''+CAST(Inserted.salesnum AS CHAR(10))
	    +'' has a [PayType] of [STD TYPE] ''+CHAR(13)
		+'' and CustomerID is ''+dbo.f_CustomerID_SalesNum(inserted.salesnum)+'' ''
		+ dbo.f_Reportlink_CHAR(''CustomerID'',dbo.f_CustomerID_SalesNum(inserted.salesnum))+'' ''+CHAR(13)
		--http://peregrine/ReportS/report/Customer/Customer%20Info dbo.f_CustomerID_SalesNum(inserted.salesnum)
		+ '' with accounting standard of ''+dbo.f_Customer_Terms(dbo.f_CustomerID_SalesNum(inserted.salesnum))+''.''
		FROM inserted
		WHERE ISNULL(inserted.paytype,'''') =''STD TERMS''  
			AND ISNULL(inserted.salesnum,0)>0 
			--AND NOT dbo.f_Customer_Terms(dbo.f_CustomerID_SalesNum(inserted.salesnum)) = ''STD TERMS''
			AND LEN(ISNULL(dbo.f_Customer_Terms(dbo.f_CustomerID_SalesNum(inserted.salesnum)),''''))>0
			AND UPDATE(PayType) ;

	SET @Body = @Body+RTRIM(suser_sname())+CHAR(13)
		+@@SERVERNAME+'' TRIGGER ERP_2.dbo.Sales_No_Insert ''
			
	EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''Terms@ERP_1s.com'', 
		 @SubjectEmail = ''BAD TERMS'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''
	
	--RAISERROR( ''Insert into dbo.Sales_No table failed. SO is for (STD TERMS), but that is not allowed.'', 16, -1)
	--ROLLBACK TRANSACTION


	INSERT INTO ERP_2.dbo.Errors ([nerror],[mess1],[cprogram],[nlineno],[errordate],[MACHINE],[Revision],[Memo1]) 
		SELECT 0,''Cannot Update dbo.Sales_No, SO is for (STD TERMS), but that is not allowed.''
			,@cProgram
			,0
			,GetDate()
			,Suser_Sname()
			,@cProgram
			,@Body
		FROM inserted
		WHERE ISNULL(inserted.paytype,'''') =''STD TERMS'' 
			AND NOT dbo.f_Customer_Terms(dbo.f_CustomerID_SalesNum(inserted.salesnum)) = ''STD TERMS'' 
			AND ISNULL(inserted.salesnum,0)>0 
			AND LEN(ISNULL(dbo.f_Customer_Terms(dbo.f_CustomerID_SalesNum(inserted.salesnum)),''''))>0
			AND UPDATE(PayType) ;
	--RETURN
END

----------------------------------------------------------------------------------------------------
PRINT ''Test STD TERMS by Customer Terms'';
IF ISNULL((SELECT COUNT(*) FROM inserted WHERE ISNULL(inserted.paytype,'''') =''STD TERMS'' 
	AND ISNULL(inserted.salesnum,0)>0   
	AND NOT dbo.f_Customer_Terms(dbo.f_CustomerID_SalesNum(inserted.salesnum)) = ''STD TERMS''
	),0) > 0
	AND UPDATE(PayType)
BEGIN
	PRINT ''Found Paytype=STD TERMS and CustomerID Not set for STD Terms''
	--PRINT dbo.f_CustomerID_SalesNum(114478)
	--IF dbo.f_Customer_Terms(''LYNCHBU'') = ''STD TERMS''
	--IF dbo.f_Customer_Terms(dbo.f_CustomerID_SalesNum(114478)) = ''STD TERMS''

	SELECT TOP 1 @Body = ''Insert to dbo.Sales_No has BAD Terms, SalesNum ''+CAST(Inserted.salesnum AS CHAR(10))
	    +'' has a [PayType] of [STD TYPE] ''+CHAR(13)
		+'' and CustomerID is ''+dbo.f_CustomerID_SalesNum(inserted.salesnum)+'' ''
		+ dbo.f_Reportlink_CHAR(''CustomerID'',dbo.f_CustomerID_SalesNum(inserted.salesnum))+'' ''+CHAR(13)
		--http://peregrine/ReportS/report/Customer/Customer%20Info dbo.f_CustomerID_SalesNum(inserted.salesnum)
		+ '' with accounting standard of ''+dbo.f_Customer_Terms(dbo.f_CustomerID_SalesNum(inserted.salesnum))+''.''
		FROM inserted
		WHERE ISNULL(inserted.paytype,'''') =''STD TERMS''  
			AND ISNULL(inserted.salesnum,0)>0 
			--AND NOT dbo.f_Customer_Terms(dbo.f_CustomerID_SalesNum(inserted.salesnum)) = ''STD TERMS''
			AND LEN(ISNULL(dbo.f_Customer_Terms(dbo.f_CustomerID_SalesNum(inserted.salesnum)),''''))>0
			AND UPDATE(PayType) ;

	SET @Body = @Body+RTRIM(suser_sname())+CHAR(13)
		+@@SERVERNAME+'' TRIGGER ERP_2.dbo.Sales_No_Insert ''
			
	EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''Terms@ERP_1s.com'', 
		 @SubjectEmail = ''BAD TERMS'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''
	
	--RAISERROR( ''Insert into dbo.Sales_No table failed. SO is for (STD TERMS), but that is not allowed.'', 16, -1)
	--ROLLBACK TRANSACTION


	INSERT INTO ERP_2.dbo.Errors ([nerror],[mess1],[cprogram],[nlineno],[errordate],[MACHINE],[Revision],[Memo1]) 
		SELECT 0,''Cannot Update dbo.Sales_No, SO is for (STD TERMS), but that is not allowed.''
			,@cProgram
			,0
			,GetDate()
			,Suser_Sname()
			,@cProgram
			,@Body
		FROM inserted
		WHERE ISNULL(inserted.paytype,'''') =''STD TERMS'' 
			AND NOT dbo.f_Customer_Terms(dbo.f_CustomerID_SalesNum(inserted.salesnum)) = ''STD TERMS'' 
			AND ISNULL(inserted.salesnum,0)>0 
			AND LEN(ISNULL(dbo.f_Customer_Terms(dbo.f_CustomerID_SalesNum(inserted.salesnum)),''''))>0
			AND UPDATE(PayType) ;
	--RETURN
END


PRINT ''trigger end  Sales_No_Insert:'';
' 
GO
ALTER TABLE [dbo].[Sales_No] ENABLE TRIGGER [Sales_No_Insert]
GO
/****** Object:  Trigger [dbo].[Sales_No_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Sales_No_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[Sales_No_Update] ON [dbo].[Sales_No] 
	FOR UPDATE 
	NOT FOR REPLICATION
AS


PRINT ''trigger start Sales_No_Update:'';

---big UPDATES are in error
DECLARE @Count int
SET @Count = @@ROWCOUNT;
   
IF @Count > 1000
BEGIN
	RAISERROR(''Cannot UPDATE more than 1000 records of dbo.Sales_No at one time. trigger Sales_No_Update'',16,1) 
	ROLLBACK TRANSACTION
	RETURN;
END
	----------------------

--IF (TRIGGER_NESTLEVEL(@@PROCID , ''AFTER'' , ''DML'') > 1)
--IF TRIGGER_NESTLEVEL() <= 1 /*this update is not coming from some other trigger*/
IF TRIGGER_NESTLEVEL() > 1 /*this update is coming from some other trigger*/
begin

	PRINT ''Sales_No_Update trigger will NOT fire since it is called from another Trigger'';
	PRINT ''  Exiting from recursive call to: '' + ISNULL(OBJECT_NAME(@@PROCID), '''');

	INSERT INTO dbo.Sales_No_Chng (Body,SalesNum,ShopRecv,Ver) 
		SELECT TOP 1 ''  Exiting from recursive call to: '' + ISNULL(OBJECT_NAME(@@PROCID), '''')
			+CHAR(13)+''An amendment update resets ShopRecv to 0 ''
			+CHAR(13)+''new Amendment is ''+CAST(inserted.amendment AS CHAR(2))+'' from ''+CAST(deleted.amendment AS CHAR(2))
			+CHAR(13)+''on SalesNum ''+CAST(inserted.SalesNum AS CHAR(10))
			+CHAR(13)+'' TRIGGER dbo.Sales_No_Update''
			,inserted.SalesNum
			,inserted.ShopRecv
			,inserted.amendment
		FROM inserted, deleted 
		WHERE inserted.SalesNum = deleted.SalesNum
			AND NOT inserted.amendment = deleted.amendment
			AND UPDATE(Amendment) 
	
	PRINT ''RETURNING NOW'';

	RETURN ;
end;

--------
--Code that RE-UPDATES this table

--DECLARE @nSalesNum INT
DECLARE @Mess1 VARCHAR(254) = ''''
DECLARE @cProgram Char(60) = ''TRIGGER dbo.Sales_No_Update''

DECLARE @Body varchar(4000) = ''''
DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
DECLARE @SalesRepEmail varchar(4000) = ''''

--DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
--DECLARE @Body varchar(4000)

PRINT ''trigger is still Sales_No_Update:'';

IF UPDATE(Amendment) 
	BEGIN
		/*
		PRINT ''An amendment update resets ShopRecv to 0'';
		PRINT ''UPDATE dbo.Sales_No SET ShopRecv = 0'';

		UPDATE dbo.Sales_No SET ShopRecv = 0
			FROM inserted, deleted 
			WHERE inserted.SalesNum = deleted.SalesNum
				AND NOT inserted.amendment = deleted.amendment
				AND UPDATE(Amendment) 
		*/

		PRINT ''Record to Sales_No_Chng An amendment update resets ShopRecv to 0''

		INSERT INTO dbo.Sales_No_Chng (Body,SalesNum,ShopRecv,Ver) 
			SELECT TOP 1 ''An amendment update resets ShopRecv to 0 ''
				+CHAR(13)+''new Amendment is ''+CAST(inserted.amendment AS CHAR(2))+'' from ''+CAST(deleted.amendment AS CHAR(2))
				+CHAR(13)+''on SalesNum ''+CAST(inserted.SalesNum AS CHAR(10))
				+CHAR(13)+'' ''+@cProgram
				,inserted.SalesNum
				,inserted.ShopRecv
				,inserted.amendment
			FROM inserted, deleted 
			WHERE inserted.SalesNum = deleted.SalesNum
				AND NOT inserted.amendment = deleted.amendment
				AND UPDATE(Amendment) 

	END

--------
--find updates to Track
--Do Detailed UserTrack inserts, then make a combined UserTrack entry


IF UPDATE(ShopRecv)
	begin
	PRINT ''Record to UserTrack ShopRecv'';
	
	--This text is use for search in Quotes Remove SO ''Sales_No ShopRecv now True for SalesNum ''
	INSERT dbo.NR_UserTrack	(Mess1,cProgram,ServerName) 
		SELECT TOP 1 LEFT(''Sales_No ShopRecv now True for SalesNum '' + LTRIM(CAST(ISNULL(inserted.SalesNum,0) AS CHAR(10)))+'' '',1024)
			,LEFT(@cProgram,100)
			,@@SERVERNAME
		FROM inserted 
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
			WHERE ISNULL(inserted.ShopRecv,0) = 1
			AND ISNULL(deleted.ShopRecv,0) = 0
			AND UPDATE(ShopRecv)
	end

IF UPDATE(CNCLD)
	begin
	PRINT ''Record to UserTrack Sales_No CNCLD''

	INSERT dbo.NR_UserTrack	(Mess1,cProgram,ServerName) 
		SELECT  TOP 1 LEFT(''Sales_No CNCLD now True for SalesNum ''+LTRIM(CAST(ISNULL(inserted.SalesNum,0) AS CHAR(10)))+'' '',1024)
			,LEFT(@cProgram,100)
			,@@SERVERNAME
		FROM inserted
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
			WHERE  ISNULL(inserted.CNCLD,0) = 1
			AND ISNULL(deleted.CNCLD,0) = 0	--Record if changed from NotCncld
			AND UPDATE(CNCLD)
	end
			
IF UPDATE(CNCLD)
	begin
	PRINT ''Record to UserTrack Sales_No UN-CNCLD''

	INSERT dbo.NR_UserTrack	(Mess1,cProgram,ServerName) 
		SELECT  TOP 1 LEFT(''Sales_No UN-CNCLD now True for SalesNum ''+LTRIM(CAST(ISNULL(inserted.SalesNum,0) AS CHAR(10)))+'' '',1024)
			,LEFT(@cProgram,100)
			,@@SERVERNAME
		FROM inserted 
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
			WHERE  ISNULL(inserted.CNCLD,0) = 0
			AND ISNULL(deleted.CNCLD,0) = 1	--Record if changed from Cncld, ignore Null change
			AND UPDATE(CNCLD)
	end
			
IF UPDATE(CMPLT)
	begin
	PRINT ''Record to UserTrack Sales_No CMPLT''

	INSERT dbo.NR_UserTrack	(Mess1,cProgram,ServerName) 
		SELECT TOP 1 LEFT(''Sales_No CMPLT now True for SalesNum ''+LTRIM(CAST(ISNULL(inserted.SalesNum,0) AS CHAR(10)))+'' '',1024)
			,LEFT(@cProgram,100)
			,@@SERVERNAME
		FROM inserted 
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
			WHERE  ISNULL(inserted.CMPLT,0) = 1 
			AND ISNULL(deleted.CMPLT,0) = 0 --Record if changed from not CMPLT
			--AND ISNULL(inserted.CNCLD,0) = 0 
			AND UPDATE(CMPLT)
		PRINT ''Record to UserTrack Sales_No CMPLT''
	
	----

	INSERT dbo.Sales_No_Chng (Body,SalesNum) 
		SELECT TOP 1 ''CMPLT now True from Trigger [dbo].[Sales_No_Update]''
			,inserted.SalesNum
		FROM inserted 
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
			WHERE  ISNULL(inserted.CMPLT,0) = 1 
			AND ISNULL(deleted.CMPLT,0) = 0 --Record if changed from not CMPLT
			--AND ISNULL(inserted.CNCLD,0) = 0 
			AND ISNULL(inserted.SalesNum,0) > 0
			AND UPDATE(CMPLT)

	end

--Sales_No data for SO:108096 was changed. Cancelled                                                                                                                                                                                                            

IF UPDATE(CMPLT)
	begin
	PRINT ''Record to UserTrack Sales_No UN-CMPLT''

	INSERT dbo.NR_UserTrack	(Mess1,cProgram,ServerName) 
		SELECT TOP 1 LEFT(''Sales_No UN-CMPLT now set for SalesNum ''+LTRIM(CAST(ISNULL(inserted.SalesNum,0) AS CHAR(10)))+'' '',1024)
			,LEFT(@cProgram,100)
			,@@SERVERNAME
		FROM inserted 
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
			WHERE  ISNULL(inserted.CMPLT,0) = 0
			AND ISNULL(deleted.CMPLT,0) = 1
			--AND ISNULL(deleted.CNCLD,0) = 1	--Record if changed from Cncld, ignore Null change
			AND UPDATE(CMPLT)

	INSERT dbo.Sales_No_Chng (Body,SalesNum) 
		SELECT TOP 1 ''CMPLT now False from Trigger [dbo].[Sales_No_Update]''
			,inserted.SalesNum
		FROM inserted 
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
			WHERE  ISNULL(inserted.CMPLT,0) = 1 
			AND ISNULL(deleted.CMPLT,0) = 1 --Record if changed from not CMPLT
			--AND ISNULL(inserted.CNCLD,0) = 0 
			AND ISNULL(inserted.SalesNum,0) > 0
			AND UPDATE(CMPLT)

	end

IF UPDATE(ItemTot)
	begin
	PRINT ''Record to UserTrack Sales_No ItemTot''

	INSERT dbo.NR_UserTrack	(Mess1,cProgram,ServerName) 
		SELECT TOP 1 LEFT(''Sales_No ItemTot=''+LTRIM(CAST(inserted.ItemTot AS VarChar(10)))
			+'' now set for SalesNum ''+LTRIM(CAST(ISNULL(inserted.SalesNum,0) AS CHAR(10)))+''. '',1024)
			,LEFT(@cProgram,100)
			,@@SERVERNAME
		FROM inserted 
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
			WHERE -- ISNULL(inserted.ItemTot,0) = 0 AND
			ISNULL(inserted.ItemTot,0) <> ISNULL(deleted.ItemTot,0)
			AND UPDATE(ItemTot)
	end

-------------------------------------
IF UPDATE(Amendment)
	begin
	PRINT ''INSERT INTO dbo.Sales_No_Rev if amendment does not exists'';
	
	INSERT dbo.Sales_No_Rev (SalesNum,Ver)
		SELECT TOP 1 inserted.SalesNum, inserted.amendment
		FROM inserted
			INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
			LEFT OUTER JOIN dbo.Sales_No_Rev SNR ON inserted.SalesNum = SNR.SalesNum AND inserted.amendment = SNR.Ver
		WHERE UPDATE(amendment) 
			AND ISNULL(inserted.amendment,0) > 0
			AND NOT inserted.amendment = deleted.amendment
			AND ISNULL(SNR.Ver,0) > ISNULL(inserted.amendment,0)
			--AND ISNULL(SNR.Ver,0) = 0	--Only Insert if Ver does not exists.  Records amendment dateTime
		
	end

----------------------------------------------------		
DECLARE @cReturn VARCHAR(254)
SET @cReturn = ''''

IF UPDATE([SalesRep])
	begin
	PRINT ''Record to UserTrack SalesRep''

	--SET @cReturn = @cReturn + ''SalesRep ''
	SELECT TOP 1 @cReturn = @cReturn + ''SalesRep='' + TRIM(inserted.SalesRep) +'' ''
	FROM inserted 
	INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
	WHERE ISNULL(inserted.SalesNum,0)>0
 		AND UPDATE(SalesRep) 
		AND LEN(ISNULL(inserted.SalesRep,'''')) > 0
		AND NOT inserted.SalesRep = deleted.SalesRep
	end

IF UPDATE([Instrct])
	begin
	PRINT ''Record to UserTrack Instructions''

	--SET @cReturn = @cReturn + ''Instructions ''
	SELECT TOP 1 @cReturn = @cReturn + ''Instructions='' + TRIM(CAST(inserted.Instrct AS VarChar(20))) +'' ''
	FROM inserted 
	INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
	WHERE ISNULL(inserted.SalesNum,0)>0
 		AND UPDATE(Instrct) 
		AND LEN(ISNULL(inserted.Instrct,'''')) > 0
		AND NOT inserted.Instrct = deleted.Instrct
	end

IF UPDATE([pSoldAddr])
	begin
	PRINT ''Record to UserTrack SoldAddr''

	SELECT TOP 1 @cReturn = @cReturn + ''pSoldAddr='' + CAST(inserted.pSoldAddr AS CHAR(10) ) +'' ''
	FROM inserted 
	INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
	WHERE ISNULL(inserted.SalesNum,0)>0
 		AND UPDATE(pSoldAddr) 
		AND ISNULL( inserted.pSoldAddr,0) > 0
		AND NOT inserted.pSoldAddr = deleted.pSoldAddr
	end

IF UPDATE([pShipAddr])
	begin
	PRINT ''Record to UserTrack pShipAddr''

	SELECT TOP 1 @cReturn = @cReturn + ''pShipAddr='' + CAST(inserted.pShipAddr AS CHAR(10) ) +'' ''
	FROM inserted 
	INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
	WHERE ISNULL(inserted.SalesNum,0)>0
 		AND UPDATE(pShipAddr) 
		AND ISNULL( inserted.pShipAddr,0) > 0
		AND NOT inserted.pShipAddr = deleted.pShipAddr
	end

IF UPDATE(Amendment)
	begin
	PRINT ''Record to UserTrack Amendment''

	SELECT TOP 1 @cReturn = @cReturn + ''Amendment='' +LTRIM(CAST( inserted.Amendment AS CHAR(10))) +'' ''
	FROM inserted 
	INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
	WHERE  ISNULL(inserted.Amendment,0) > 0
		AND NOT inserted.amendment = deleted.amendment
		AND UPDATE(Amendment)

	end
--ISNULL(inserted.Cncld,0) = 0 FROM inserted WHERE ISNULL(inserted.CNCLD,0) = 0 AND UPDATE(CNCLD)


IF LEN(@cReturn)>0
	BEGIN		

	PRINT ''INSERT dbo.NR_UserTrack - Sales_No fields that were changed. ''+ @cReturn

	INSERT dbo.NR_UserTrack	(Mess1,cProgram,ServerName) 
		SELECT TOP 1 LEFT(''Sales_No data for SO:''+RTRIM(CAST(inserted.SalesNum AS VARCHAR(10))) +'' was changed to: ''+ @cReturn ,1024) 
			,LEFT(@cProgram,100)
			,@@SERVERNAME
		FROM inserted 
		WHERE ISNULL(inserted.SalesNum,0)>0
 			AND (UPDATE([SalesRep]) OR UPDATE([Instrct]) OR UPDATE([pSoldAddr]) OR UPDATE([pShipAddr]) OR UPDATE(Amendment) )
	END

-----------------------------------------------

IF LEN(@cReturn)>0
	begin

	PRINT ''Record to Sales_No_Chng UserTrack''

	INSERT INTO dbo.Sales_No_Chng (Body,SalesNum,ShopRecv,Ver) 
		SELECT TOP 1 ''UserTrack :''+@cReturn
			+CHAR(13)+''on SalesNum ''+CAST(inserted.SalesNum AS CHAR(10))
			+CHAR(13)+'' ''+@cProgram
			,inserted.SalesNum
			,inserted.ShopRecv
			,inserted.amendment
		FROM inserted, deleted 
		WHERE inserted.SalesNum = deleted.SalesNum AND 
		( NOT ISNULL(inserted.CMPLT,0) = ISNULL(deleted.CMPLT,0)
		OR NOT ISNULL(inserted.CNCLD,0) = ISNULL(deleted.CNCLD,0)
		OR NOT inserted.SalesRep = deleted.SalesRep
		OR NOT inserted.Instrct  = deleted.Instrct
		OR NOT inserted.pSoldAddr = deleted.pSoldAddr
		OR NOT inserted.pShipAddr = deleted.pShipAddr
		OR NOT inserted.amendment = deleted.amendment )

	end

IF UPDATE(ShopRecv) 
	begin

	PRINT ''Record to Sales_No_Chng ShopRecv change''
	INSERT INTO dbo.Sales_No_Chng (Body,SalesNum,ShopRecv,Ver) 
		SELECT TOP 1 ''ShopRecv change:''
			+CHAR(13)+''new ShopRecv is ''+CAST(inserted.ShopRecv AS CHAR(1))+'' from ''+CAST(deleted.ShopRecv AS CHAR(1))+'' ''
			+CHAR(13)+''on SalesNum ''+CAST(inserted.SalesNum AS CHAR(10))
			+CHAR(13)+'' ''+@cProgram
			,inserted.SalesNum
			,inserted.ShopRecv
			,inserted.amendment
		FROM inserted, deleted 
		WHERE inserted.SalesNum = deleted.SalesNum
			AND NOT inserted.ShopRecv = deleted.ShopRecv
			AND UPDATE(ShopRecv) 
	end

IF UPDATE(emailconf) 
	begin

	PRINT ''Record to Sales_No_Chng emailconf change''
	INSERT INTO dbo.Sales_No_Chng (Body,SalesNum,ShopRecv,Ver) 
		SELECT TOP 1 ''emailconf change:''
			+CHAR(13)+''new emailconf is ''+CAST(inserted.emailconf AS CHAR(1))+'' from ''+CAST(deleted.emailconf AS CHAR(1))+'' ''
			+CHAR(13)+''on SalesNum ''+CAST(inserted.SalesNum AS CHAR(10))
			+CHAR(13)+'' ''+@cProgram
			,inserted.SalesNum
			,inserted.ShopRecv
			,inserted.amendment
		FROM inserted, deleted 
		WHERE inserted.SalesNum = deleted.SalesNum
			AND NOT inserted.emailconf = deleted.emailconf
			AND UPDATE(emailconf) 
	end

IF UPDATE(emailedps) 
	begin

	PRINT ''Record to Sales_No_Chng emailedps change''
	INSERT INTO dbo.Sales_No_Chng (Body,SalesNum,ShopRecv,Ver) 
		SELECT TOP 1 ''emailedps change:''
			+CHAR(13)+''new emailedps is ''+CAST(inserted.emailedps AS CHAR(1))+'' from ''+CAST(deleted.emailedps AS CHAR(1))+'' ''
			+CHAR(13)+''on SalesNum ''+CAST(inserted.SalesNum AS CHAR(10))
			+CHAR(13)+'' ''+@cProgram
			,inserted.SalesNum
			,inserted.ShopRecv
			,inserted.amendment
		FROM inserted, deleted 
		WHERE inserted.SalesNum = deleted.SalesNum
			AND NOT inserted.emailedps = deleted.emailedps
			AND UPDATE(emailedps) 
	end

IF UPDATE(Changing) 
	begin

	PRINT ''Record to Sales_No_Chng Changing change''
	INSERT INTO dbo.Sales_No_Chng (Body,SalesNum,ShopRecv,Ver) 
		SELECT TOP 1 ''Changing change:''
			+CHAR(13)+''new Changing is ''+CAST(inserted.Changing AS CHAR(1))+'' from ''+CAST(deleted.Changing AS CHAR(1))+'' ''
			+CHAR(13)+''on SalesNum ''+CAST(inserted.SalesNum AS CHAR(10))
			+CHAR(13)+'' ''+@cProgram
			,inserted.SalesNum
			,inserted.ShopRecv
			,inserted.amendment
		FROM inserted, deleted 
		WHERE inserted.SalesNum = deleted.SalesNum
			AND NOT inserted.Changing = deleted.Changing
			AND UPDATE(Changing) 
	end

IF UPDATE(DPAS) 
	begin

	PRINT ''Record to Sales_No_Chng DPAS change''
	INSERT INTO dbo.Sales_No_Chng (Body,SalesNum,ShopRecv,Ver) 
		SELECT TOP 1 ''DPAS change:''
			+CHAR(13)+''new DPAS is ''+CAST(inserted.DPAS AS CHAR(1))+'' from ''+CAST(deleted.DPAS AS CHAR(1))+'' ''
			+CHAR(13)+''on SalesNum ''+CAST(inserted.SalesNum AS CHAR(10))
			+CHAR(13)+'' ''+@cProgram
			,inserted.SalesNum
			,inserted.ShopRecv
			,inserted.amendment
		FROM inserted, deleted 
		WHERE inserted.SalesNum = deleted.SalesNum
			AND NOT inserted.DPAS = deleted.DPAS
			AND UPDATE(DPAS) 

	end

IF UPDATE(FCI) 
	begin

	PRINT ''Record to Sales_No_Chng FCI change''
	INSERT INTO dbo.Sales_No_Chng (Body,SalesNum,ShopRecv,Ver) 
		SELECT TOP 1 ''FCI change:''
			+CHAR(13)+''new FIC is ''+CAST(inserted.FCI AS CHAR(1))+'' from ''+CAST(deleted.FCI AS CHAR(1))+'' ''
			+CHAR(13)+''on SalesNum ''+CAST(inserted.SalesNum AS CHAR(10))
			+CHAR(13)+'' ''+@cProgram
			,inserted.SalesNum
			,inserted.ShopRecv
			,inserted.amendment
		FROM inserted, deleted 
		WHERE inserted.SalesNum = deleted.SalesNum
			AND NOT inserted.FCI = deleted.FCI
			AND NOT inserted.FCI IS NULL
			AND UPDATE(FCI) 

--SELECT TOP 50 * FROM dbo.Sales_No_Chng WHERE Body like ''%FCI %'' ORDER BY [When] desc

	PRINT ''Found Update in FCI.''
	
	SET @Body = ''Not Found'';

	SELECT TOP 1 @Body = ''FCI change in dbo.Sales_No:''
			+CHAR(13)+''new FIC is now ''+CAST(inserted.FCI AS CHAR(1))+'' from ''+CAST(deleted.FCI AS CHAR(1))+'' ''
			+CHAR(13)+''on SalesNum ''+CAST(inserted.SalesNum AS CHAR(10))
			+CHAR(13)+'' ''+@cProgram+CHAR(13)
			FROM inserted, deleted 
				WHERE inserted.SalesNum = deleted.SalesNum
				AND NOT ISNULL(inserted.FCI,0) = ISNULL(deleted.FCI,0)
				AND NOT inserted.FCI IS NULL
				AND UPDATE(FCI) 
	
	IF LEN(@Body) > 9
		SET @Body = ISNULL(@Body,'''')+CHAR(13)+RTRIM(suser_sname())+CHAR(13)
			+@@SERVERNAME+'' TRIGGER ERP_2.dbo.Sales_No_Update ''
	
	IF LEN(@Body) > 9
		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = ''David.Kirchner@ERP_1s.com'', 
			 @SubjectEmail = ''FCI found'',
			 @BodyEmail = @Body,
			 @BodyType = ''TEXT''
	

	end

IF UPDATE(GOV) 
	begin

	PRINT ''Record to Sales_No_Chng GOV change''
	INSERT INTO dbo.Sales_No_Chng (Body,SalesNum,ShopRecv,Ver) 
		SELECT TOP 1 ''GOV change:''
			+CHAR(13)+''new GOv is ''+CAST(inserted.GOV AS CHAR(1))+'' from ''+CAST(deleted.GOV AS CHAR(1))+'' ''
			+CHAR(13)+''on SalesNum ''+CAST(inserted.SalesNum AS CHAR(10))
			+CHAR(13)+'' ''+@cProgram
			,inserted.SalesNum
			,inserted.ShopRecv
			,inserted.amendment
		FROM inserted, deleted 
		WHERE inserted.SalesNum = deleted.SalesNum
			AND NOT inserted.GOV = deleted.GOV
			AND UPDATE(GOV) 


	end
--look for WHERE paytype =''STD TERMS '' then check against Terms data.
-----------------------------------------------------


/*
--IF EXISTS ( SELECT * FROM inserted WHERE ISNULL(inserted.paytype,'''') =''STD TERMS'' )
IF ISNULL((SELECT COUNT(*) FROM inserted WHERE ISNULL(inserted.paytype,'''') =''STD TERMS'' ),0) > 0
BEGIN
	PRINT ''Found Update where Paytype="STD TERMS" for testing.''
	
	SELECT TOP 1 @Body = ''Found an Update to dbo.Sales_No ''+CAST(Inserted.salesnum AS CHAR(10))+CHAR(13)
		+'' WHERE [PayType] is "STD TYPE" ''+CHAR(13)
		+'' and CustomerID is "''+RTRIM(dbo.f_CustomerID_SalesNum(inserted.salesnum))+''"''+CHAR(13)
		+'' with accounting standard of "''+RTRIM(dbo.f_Customer_Terms(dbo.f_CustomerID_SalesNum(inserted.salesnum)))+''".''+CHAR(13)
		FROM inserted
		WHERE ISNULL(inserted.paytype,'''') =''STD TERMS'' 
			--AND LEN(ISNULL(dbo.f_CustomerID_SalesNum(inserted.salesnum),''''))>0

	SET @Body = @Body+RTRIM(suser_sname())+CHAR(13)
		+@@SERVERNAME+'' TRIGGER ERP_2.dbo.Sales_No_Update ''
			
	EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = terms@ERP_1s.com'', 
		 @SubjectEmail = ''STD TERMS'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''
	
END  */



IF ISNULL((SELECT COUNT(*) FROM inserted 
	WHERE ISNULL(inserted.paytype,'''') =''STD TERMS'' 
		AND NOT dbo.f_Customer_Terms(dbo.f_CustomerID_SalesNum(inserted.salesnum)) = ''STD TERMS'' 
		AND ISNULL(inserted.salesnum,0)>0  
		AND dbo.f_Is_Sales_No_Chn_BadTerms(ISNULL(inserted.salesnum,0)) = 0
		AND NOT inserted.salesnum IN 
	(SELECT TOP 1 SalesNum FROM dbo.Sales_No_Chng SNC WITH(NOLOCK) WHERE SNC.SalesNum = inserted.SalesNum 
	AND SNC.Body LIKE ''Bad PayType:%'')		),0) > 0     
	AND UPDATE(PayType) 
BEGIN
	PRINT ''Found Update where Paytype="STD TERMS" and CustomerID Not set to "STD Terms" and UPDATE(PayType)''
	--PRINT dbo.f_CustomerID_SalesNum(114478)
	--IF dbo.f_Customer_Terms(''LYNCHBU'') = ''STD TERMS''
	--IF dbo.f_Customer_Terms(dbo.f_CustomerID_SalesNum(114478)) = ''STD TERMS''

	SELECT TOP 1 @Body = ''Found an Update to dbo.Sales_No that has BAD PayType Terms.''
		+''    SalesNum ''+RTRIM(LTRIM(CAST(Inserted.salesnum AS CHAR(10))))+''. ''+CHAR(13)
		+ dbo.f_Reportlink_INT(''SO'',Inserted.salesnum) +'' ''+CHAR(10)+CHAR(13)
		+'' Where [PayType] is "STD TYPE" for Company ''+RTRIM(ISNULL(AQ.Company,''NA''))+'' ''+CHAR(10)+CHAR(13)
		+  case when LEN(dbo.f_CustomerID_SalesNum(inserted.salesnum))>1 
			then dbo.f_Reportlink_CHAR(''CustomerID'',dbo.f_CustomerID_SalesNum(inserted.salesnum)) +CHAR(10)+CHAR(13)
			else '''' end  

		+'' CustomerID is ''
			+RTRIM( case when LEN(dbo.f_CustomerID_SalesNum(inserted.salesnum))>1 
					then dbo.f_CustomerID_SalesNum(inserted.salesnum)
					else ''Not_Found'' end )
		+''. ''+CHAR(10)+CHAR(13)

		+''  Customer Terms ''
			+RTRIM( case when LEN(dbo.f_Customer_Terms(dbo.f_CustomerID_SalesNum(inserted.salesnum)))>1 
					then dbo.f_Customer_Terms(dbo.f_CustomerID_SalesNum(inserted.salesnum))
					else ''Not_Found'' end )
		+''. ''+CHAR(10)+CHAR(13)
		
		+ RTRIM(dbo.f_SaleRep_Email_SO(inserted.salesnum))+'' ''+CHAR(10)+CHAR(13)
		,@SalesRepEmail = RTRIM(dbo.f_SaleRep_Email_SO(inserted.salesnum))
		FROM inserted
		--INNER JOIN dbo.Sales_No_Chng SNC ON inserted.SalesNum = SNC.SalesNum
		INNER JOIN dbo.AllQuotes AQ ON inserted.SalesNum = AQ.SalesNum
		WHERE ISNULL(inserted.paytype,'''') =''STD TERMS'' 
			AND NOT dbo.f_Customer_Terms(dbo.f_CustomerID_SalesNum(inserted.salesnum)) = ''STD TERMS'' 
			AND ISNULL(inserted.salesnum,0)>0 
			AND AQ.Item = 1	--limit to just first record, do not let many complicate data.
			AND dbo.f_Is_Sales_No_Chn_BadTerms(ISNULL(inserted.salesnum,0)) = 0
			AND NOT inserted.salesnum IN 
	(SELECT TOP 1 SalesNum FROM dbo.Sales_No_Chng SNC WITH(NOLOCK) WHERE SNC.SalesNum = inserted.SalesNum 
	AND SNC.Body LIKE ''Bad PayType:%'')
			AND UPDATE(PayType) ;

	SET @Body = @Body+RTRIM(suser_sname())+CHAR(13)
		+@@SERVERNAME+'' TRIGGER ERP_2.dbo.Sales_No_Update '';
	PRINT @Body

	
	IF LEN(@SalesRepEmail)=0
		SET @SalesRepEmail = ''Terms@ERP_1s.com''
	ELSE
		SET @SalesRepEmail = @SalesRepEmail+'';Terms@ERP_1s.com''

	EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = @SalesRepEmail, 
		 @SubjectEmail = ''Sales_No BAD TERMS'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT'';
	
	--RAISERROR( ''Insert into dbo.Sales_No table failed. SO is for (STD TERMS), but that is not allowed.'', 16, -1)
	--ROLLBACK TRANSACTION


	INSERT INTO ERP_2.dbo.Errors ([nerror],[mess1],[cprogram],[nlineno],[errordate],[MACHINE],[Revision],[Memo1]) 
		SELECT 0,''Updated dbo.Sales_No, SO is for (STD TERMS), but that is not allowed.''
			,@cProgram
			,0
			,GetDate()
			,Suser_Sname()
			,@cProgram
			,@Body
		FROM inserted
		--INNER JOIN dbo.Sales_No_Chng SNC ON inserted.SalesNum = SNC.SalesNum
		WHERE ISNULL(inserted.paytype,'''') =''STD TERMS'' 
			AND NOT dbo.f_Customer_Terms(dbo.f_CustomerID_SalesNum(inserted.salesnum)) = ''STD TERMS'' 
			--AND LEN(dbo.f_CustomerID_SalesNum(inserted.salesnum))>1
			AND ISNULL(inserted.salesnum,0)>0 
			--AND SNC.BadTerms = 0 
			AND dbo.f_Is_Sales_No_Chn_BadTerms(ISNULL(inserted.salesnum,0))=0
			AND NOT inserted.salesnum IN 
	(SELECT TOP 1 SalesNum FROM dbo.Sales_No_Chng SNC WITH(NOLOCK) WHERE SNC.SalesNum = inserted.SalesNum 
	AND SNC.Body LIKE ''Bad PayType:%'')
			AND UPDATE(PayType) ;

	
	--table Sales_No_Chng is a rolling history, do not UPDATE, just INSERT
	PRINT ''Insert [Bad PayType] into Sales_No_Chng AND UPDATE(PayType)''

	INSERT INTO dbo.Sales_No_Chng (Body,SalesNum,ShopRecv,BadTerms,Ver) 
		SELECT TOP 1 ''Bad PayType:''
			+CHAR(13)+'' PayType is ''+dbo.f_Customer_Terms(dbo.f_CustomerID_SalesNum(inserted.salesnum))
			+CHAR(13)+''on SalesNum ''+CAST(inserted.SalesNum AS CHAR(10))
			+ ''The accounting standard Allowed is ''+RTRIM(dbo.f_Customer_Terms(dbo.f_CustomerID_SalesNum(inserted.salesnum)))+''. ''
			+CHAR(13)+'' ''+@cProgram
			,inserted.SalesNum
			,inserted.ShopRecv
			,1
			,inserted.amendment
		FROM inserted
		INNER JOIN deleted ON inserted.SalesNum = deleted.SalesNum
		--LEFT OUTER JOIN dbo.Sales_No_Chng SNC ON inserted.SalesNum = SNC.SalesNum
		WHERE inserted.SalesNum = deleted.SalesNum
			AND ISNULL(inserted.paytype,'''') =''STD TERMS'' 
			AND NOT dbo.f_Customer_Terms(dbo.f_CustomerID_SalesNum(inserted.salesnum)) = ''STD TERMS'' 
			--AND LEN(dbo.f_CustomerID_SalesNum(inserted.salesnum))>1
			AND ISNULL(inserted.salesnum,0)>0 
			--AND ISNULL(SNC.SalesNum,0) = 0 --Insert where SalesNum NOT found!
			--AND SNC.BadTerms = 0 
			AND dbo.f_Is_Sales_No_Chn_BadTerms(ISNULL(inserted.salesnum,0))=0 
			AND NOT inserted.salesnum IN 
	(SELECT TOP 1 SalesNum FROM dbo.Sales_No_Chng SNC WITH(NOLOCK) WHERE SNC.SalesNum = inserted.SalesNum 
	AND SNC.Body LIKE ''Bad PayType:%'')
			AND UPDATE(PayType);

END


PRINT ''trigger end  Sales_No_Update:'';
' 
GO
ALTER TABLE [dbo].[Sales_No] ENABLE TRIGGER [Sales_No_Update]
GO
/****** Object:  Trigger [dbo].[Sales_No_Chng_Delete]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Sales_No_Chng_Delete]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.StockLst_Process_Delete    Script Date: 11/30/2005 3:54:44 PM ******/
CREATE TRIGGER [dbo].[Sales_No_Chng_Delete] ON [dbo].[Sales_No_Chng] 
	FOR DELETE
	NOT FOR REPLICATION
AS


PRINT ''trigger start Sales_No_Chng_Delete:'';

---big DELETES are in error
DECLARE @Count int
SET @Count = @@ROWCOUNT;
   
IF @Count > 100
BEGIN
	RAISERROR(''Cannot DELETE more than 100 records of dbo.Sales_No_Chng at one time. trigger Sales_No_Chng_Delete'',16,1) 
	ROLLBACK TRANSACTION
	RETURN;
END
	----------------------

PRINT ''trigger end  Sales_No_Chng_Delete'';
' 
GO
ALTER TABLE [dbo].[Sales_No_Chng] ENABLE TRIGGER [Sales_No_Chng_Delete]
GO
/****** Object:  Trigger [dbo].[Sales_No_Chng_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Sales_No_Chng_Insert]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.StockLst_Process_Delete    Script Date: 11/30/2005 3:54:44 PM ******/
CREATE TRIGGER [dbo].[Sales_No_Chng_Insert] ON [dbo].[Sales_No_Chng] 
	FOR INSERT
	NOT FOR REPLICATION
AS


PRINT ''trigger start Sales_No_Chng_Insert:'';

---big UPDATES are in error
DECLARE @Count int
SET @Count = @@ROWCOUNT;
   
IF @Count > 1000
BEGIN
	RAISERROR(''Cannot INSERT more than 1000 records of dbo.Sales_No at one time. trigger Sales_No_Insert'',16,1) 
	ROLLBACK TRANSACTION
	RETURN;
END
	----------------------

--IF (TRIGGER_NESTLEVEL(@@PROCID , ''AFTER'' , ''DML'') > 1)
--IF TRIGGER_NESTLEVEL() <= 1 /*this update is not coming from some other trigger*/
--IF TRIGGER_NESTLEVEL() > 1 /*this update is coming from some other trigger*/

--look for WHERE paytype =''STD TERMS '' then check against Terms data.


/*
--Found insert with  changed ShipDue from:''
-----------------------------------------------------
IF ISNULL((SELECT COUNT(*) FROM inserted WHERE ISNULL(inserted.Body,'''') LIKE ''% changed ShipDue from:%'' ),0) > 0
BEGIN

	DECLARE @cProgram Char(60) = ''TRIGGER dbo.Sales_No_Chng_Insert''
	DECLARE @Body varchar(4000) = ''''
	DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
	--RAPTOR@ERP_1s.com

	PRINT ''Found insert with  changed ShipDue from:''
	
	--SELECT @Body = ''ShipDue has changed for SO ''+CAST(Inserted.salesnum AS CHAR(10))+CHAR(13)
	--Get the SOitem
	SELECT TOP 1 @Body = REPLACE (inserted.Body, ''to:'', CHAR(13)+''</Br>''+''__to:'') 
		FROM inserted
		WHERE ISNULL(inserted.Body,'''') LIKE ''% changed ShipDue from:%'' 

	SET @Body = REPLACE (@Body, ''from:'', CHAR(13)+''</Br>''+''from:'') ;
--	SET @Body = REPLACE (@Body, ''to:'', CHAR(13)+''</Br>''+''to:'') 


	DECLARE @SOitem CHAR(10) = ''''
	DECLARE @SOstr CHAR(255) = ''''
	DECLARE @nSOlen INT = 0
	DECLARE @nSalesNum INT = 0
	
	
	--SELECT TOP 1 REPLACE (Body, ''to:'', CHAR(13)+''</Br>''+''__to:'') AS Body FROM dbo.Sales_No_Chng WHERE ISNULL(Body,'''') LIKE ''% changed ShipDue from:%'' ORDER BY [When] DESC

	--INSERT INTO [dbo].[Sales_No_Chng]  (Body,SalesNum)VALUES (''SOitem:   131097-01 changed ShipDue from:01/03/2023 to:01/04/2023.'',131097)
	--SOitem:   131136-01 changed ShipDue 
	SET @nSOlen = LEN(@Body)
	SET @SOstr = RIGHT(@Body,@nSOlen-LEN(''SOitem:''))
	SET @SOstr = LEFT(@SOstr,12)
	SET @SOitem = dbo.f_ProperSOitem(@SOstr);
	SET @nSalesNum = dbo.f_ProperSO(@SOitem)

	IF @SOitem <> dbo.f_ProperSOitem('''') AND @nSalesNum>0
		IF EXISTS (SELECT COUNT(*) FROM dbo.Sales_No WITH(NOLOCK) WHERE SalesNum = @nSalesNum AND ISNULL(EverPrint,0)=1 )
		begin
		--**Only send if PrintedSO is true

		SET @Body = @Body + CHAR(13) +''</Br>''
			+ dbo.f_Reportlink_CHAR(''SOitem'',@SOitem)
			--+ dbo.f_HTML_link_SOitem(@SOitem) 
			+ CHAR(13) +''</Br>'';
		
		----------
		DECLARE @sdtCreateDate smallDateTime 
		SELECT @sdtCreateDate = CreateDate FROM dbo.Sales_No WHERE SalesNum = 132920 AND ISNULL(CreateDate,GETDATE()) < GETDATE()

		SET @Body = @Body + CHAR(13) +''</Br> Created ''
			+ CONVERT(CHAR(12), ISNULL(@sdtCreateDate,''No Date''), 101 );

		-----------
		DECLARE @Descript VARCHAR(1000) = ''''
		DECLARE @Company VARCHAR(30) = ''''

		SELECT TOP 1 @Descript = ISNULL(RTRIM(Cast(AQ.Pieces AS CHAR(10)))+''pc ''+RTRIM(AQ.Alloy)+'' ''+RTRIM(Cast(AQ.Thck AS CHAR(10)))+'' Dia x ''+RTRIM(CAST( FLOOR(AQ.Weight) AS CHAR(10)))+'' Pounds '' ,''No Description'')
			,@Company = ISNULL(AQ.Company,''Company'')
			FROM dbo.AllQuotes AQ 
			WHERE AQ.SOitem = @SOitem

		IF LEN(@Descript) > 0
			SET @Body = @Body + CHAR(13) +''</Br>'' + @Company+'': ''+@Descript +''</Br>''

		


	

		SET @Body = @Body+CHAR(13)+RTRIM(suser_sname())+CHAR(13)+''</Br>''
			+@@SERVERNAME+'' TRIGGER ERP_2.dbo.Sales_No_Chng_Insert '';
			
		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = ''Russell.Kirchner@ERP_1s.com'', 
			 @SubjectEmail = @cProgram,
			 @BodyEmail = @Body,
			 @BodyType = ''HTML'';
	
		end
END
*/

PRINT ''trigger end  Sales_No_Chng_Insert:'';
' 
GO
ALTER TABLE [dbo].[Sales_No_Chng] ENABLE TRIGGER [Sales_No_Chng_Insert]
GO
/****** Object:  Trigger [dbo].[Sales_No_Rev_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Sales_No_Rev_Insert]'))
EXEC dbo.sp_executesql @statement = N'
Create TRIGGER [dbo].[Sales_No_Rev_Insert] ON [dbo].[Sales_No_Rev] 
	FOR INSERT
	NOT FOR REPLICATION
AS

PRINT ''trigger start Sales_No_Rev_Insert:'';
PRINT ''trigger  end  Sales_No_Rev_Insert:'';' 
GO
ALTER TABLE [dbo].[Sales_No_Rev] ENABLE TRIGGER [Sales_No_Rev_Insert]
GO
/****** Object:  Trigger [dbo].[Sales_No_Rev_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Sales_No_Rev_Update]'))
EXEC dbo.sp_executesql @statement = N'
Create TRIGGER [dbo].[Sales_No_Rev_Update] ON [dbo].[Sales_No_Rev] 
	FOR UPDATE 
	NOT FOR REPLICATION
AS

--Do not Triger here - only update the Sales_no.amendment
/*
IF  UPDATE(VER)
	begin
	PRINT ''trigger start Sales_No_Rev_Update:'';
	
	UPDATE dbo.Sales_No 
		SET amendment = inserted.Ver
		FROM inserted 
		INNER JOIN dbo.Sales_No SN ON inserted.SalesNum = SN.salesnum
		WHERE UPDATE(VER)
		AND  SN.amendment < inserted.Ver
					

	PRINT ''trigger end  Sales_No_RevUpdate:'';
	end
*/
PRINT ''trigger end  Sales_No_Rev_Update:'';' 
GO
ALTER TABLE [dbo].[Sales_No_Rev] ENABLE TRIGGER [Sales_No_Rev_Update]
GO
/****** Object:  Trigger [dbo].[Sales_PS_Delete]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Sales_PS_Delete]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.Sales_PS_Delete    Script Date: 7/1/2004 1:57:08 PM ******/


CREATE TRIGGER [dbo].[Sales_PS_Delete] ON [dbo].[Sales_PS] 
FOR DELETE NOT FOR REPLICATION
AS
BEGIN

PRINT ''trigger start Sales_PS_Delete:'';

---big deletes are in error
DECLARE @Count int
SET @Count = @@ROWCOUNT;
    
IF @Count > 100
BEGIN
    RAISERROR(''Cannot DELETE more than 100 records of dbo.Sales_PS at one time. trigger Sales_PS_Delete'',16,1) 
    ROLLBACK TRANSACTION
    RETURN;
END


----------------------------------------------------


PRINT ''trigger end  Sales_PS_Delete:'';
END
' 
GO
ALTER TABLE [dbo].[Sales_PS] ENABLE TRIGGER [Sales_PS_Delete]
GO
/****** Object:  Trigger [dbo].[Sales_PS_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Sales_PS_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[Sales_PS_Insert]
   ON  [dbo].[Sales_PS] 
   FOR INSERT 
   NOT FOR REPLICATION
AS 
BEGIN

SET NOCOUNT ON;

PRINT ''trigger start Sales_PS_Insert:'';

PRINT ''trigger end  Sales_PS_Insert:'';

END
' 
GO
ALTER TABLE [dbo].[Sales_PS] ENABLE TRIGGER [Sales_PS_Insert]
GO
/****** Object:  Trigger [dbo].[Sales_PS_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Sales_PS_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[Sales_PS_Update]
   ON  [dbo].[Sales_PS] 
   FOR UPDATE 
   --NOT FOR REPLICATION
AS 
BEGIN

	SET NOCOUNT ON;

	PRINT ''trigger start Sales_PS_Update:'';

	
	---big UPDATES are in error
	DECLARE @Count int
	SET @Count = @@ROWCOUNT;
    
	IF @Count > 100
	BEGIN
		RAISERROR(''Cannot UPDATE more than 100 records of dbo.Sales_PS at one time. trigger Sales_PS_Update'',16,1) 
		ROLLBACK TRANSACTION
		RETURN;
	END
	----------------------


----------------------------------------------------
		
PRINT ''trigger  end  Sales_PS_Update:'';

END
' 
GO
ALTER TABLE [dbo].[Sales_PS] ENABLE TRIGGER [Sales_PS_Update]
GO
/****** Object:  Trigger [dbo].[Sales_Status_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Status_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[Sales_Status_Insert]
   ON  [dbo].[Sales_Status] 
   FOR INSERT 
   NOT FOR REPLICATION
AS 
BEGIN
	SET NOCOUNT ON;

	DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
	DECLARE @Body varchar(4000)
	DECLARE @badSOitem CHAR(10)

	IF EXISTS ( SELECT * FROM inserted WHERE SUBSTRING(SOitem,1,7) Like ''%-%'')
		BEGIN
		
		SELECT @Body = ''Cannot insert into dbo.Sales_Status, SOitem is not Proper,''+CHAR(13)
		
		SELECT TOP 1 @BadSoitem = SOitem  FROM inserted WHERE SUBSTRING(SOitem,1,7) Like ''%-%''
		SET @Body = @Body+'' SO item:''+@BadSoitem +''.''
			+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.Sales_Status_Insert ''
			
		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
			 @SubjectEmail = ''BAD SOitem'',
			 @BodyEmail = @Body,
			 @BodyType = ''TEXT''
						
		SET @Body = ''INSERT dbo.Sales_Status table failed. SOitem:''+@BadSoitem+'' not Proper.''
		RAISERROR( @Body, 16, -1)

		END
		
	
END
' 
GO
ALTER TABLE [dbo].[Sales_Status] ENABLE TRIGGER [Sales_Status_Insert]
GO
/****** Object:  Trigger [dbo].[Sales_Status_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Status_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[Sales_Status_Update]
   ON  [dbo].[Sales_Status] 
   FOR UPDATE 
   NOT FOR REPLICATION
AS 
BEGIN
	SET NOCOUNT ON;

	DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
	DECLARE @Body varchar(4000)
	DECLARE @badSOitem CHAR(10)

	IF EXISTS ( SELECT * FROM inserted WHERE SUBSTRING(SOitem,1,7) Like ''%-%'')
		BEGIN
		
		SELECT @Body = ''Cannot update dbo.Sales_Status, SOitem is not Proper,''+CHAR(13)
		
		SELECT TOP 1 @BadSoitem = SOitem  FROM inserted WHERE SUBSTRING(SOitem,1,7) Like ''%-%''
		SET @Body = @Body+'' SO item:''+@BadSoitem +''.''
			+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.Sales_Status_Update ''
			
		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
			 @SubjectEmail = ''BAD SOitem'',
			 @BodyEmail = @Body,
			 @BodyType = ''TEXT''
										
		SET @Body = ''Update dbo.Sales_Status table failed. SOitem:''+@BadSoitem+'' not Proper.''
		RAISERROR( @Body, 16, -1)

		END
		
END
' 
GO
ALTER TABLE [dbo].[Sales_Status] ENABLE TRIGGER [Sales_Status_Update]
GO
/****** Object:  Trigger [dbo].[Sales_Stock_After_Delete]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Stock_After_Delete]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[Sales_Stock_After_Delete]
   ON  [dbo].[Sales_Stock] 
   AFTER DELETE 
   NOT FOR REPLICATION
AS 
BEGIN
	SET NOCOUNT ON;
		
	PRINT ''trigger start [Sales_Stock_after_Delete]'';

			UPDATE dbo.Sales SET 
				ItemCost = ( ISNULL(dbo.f_CalcStkCost_SOitem(deleted.SOitem),0) + ISNULL(dbo.f_CalcStkCost_Sales_Stock(deleted.SOitem),0) + ISNULL(dbo.f_CalcPOCost_SOitem(deleted.SOitem),0) )
				,StkCost = ( ISNULL(dbo.f_CalcStkCost_SOitem(deleted.SOitem),0) + ISNULL(dbo.f_CalcStkCost_Sales_Stock(deleted.SOitem),0) )
				,POCost = ISNULL(dbo.f_CalcPOCost_SOitem(deleted.SOitem),0)
				FROM deleted
				INNER JOIN dbo.Sales S ON deleted.SOitem = S.SOitem
				WHERE deleted.SOitem = dbo.ProperSO(deleted.SOitem)
				AND (UPDATE(StockLst_Qty) OR UPDATE(StockLst_P));

			UPDATE dbo.WorkOrder SET StkCost = ( 
				ISNULL(dbo.f_CalcStkCost_Selected_WO(deleted.WO),0) 
				+ ISNULL(dbo.f_CalcStkCost_Sales_Stock_WO(deleted.WO),0) ) 
				FROM deleted
				INNER JOIN dbo.WorkOrder WO ON deleted.WO = WO.WO
				WHERE ISNULL(deleted.WO,0) > 0
				AND (UPDATE(StockLst_Qty) OR UPDATE(StockLst_P));

	-------------------------------------------------------------
	PRINT ''trigger  end  [Sales_Stock_after_Delete]'';

END
' 
GO
ALTER TABLE [dbo].[Sales_Stock] ENABLE TRIGGER [Sales_Stock_After_Delete]
GO
/****** Object:  Trigger [dbo].[Sales_Stock_After_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Stock_After_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[Sales_Stock_After_Insert]
   ON  [dbo].[Sales_Stock] 
   AFTER INSERT
   NOT FOR REPLICATION
AS 
BEGIN

	SET NOCOUNT ON;
	
	PRINT ''trigger start [Sales_Stock_after_Insert]'';

/*
	IF UPDATE(StockLst_Qty) OR UPDATE(StockLst_P)
	BEGIN
			
			UPDATE dbo.Sales SET 
				ItemCost = ( ISNULL(dbo.f_CalcStkCost_SOitem(inserted.SOitem),0) + ISNULL(dbo.f_CalcStkCost_Sales_Stock(inserted.SOitem),0) + ISNULL(dbo.f_CalcPOCost_SOitem(inserted.SOitem),0) )
				,StkCost = ( ISNULL(dbo.f_CalcStkCost_SOitem(inserted.SOitem),0) + ISNULL(dbo.f_CalcStkCost_Sales_Stock(inserted.SOitem),0) )
				,POCost = ISNULL(dbo.f_CalcPOCost_SOitem(inserted.SOitem),0)
				FROM inserted
				INNER JOIN dbo.Sales S ON inserted.SOitem = S.SOitem
				WHERE inserted.SOitem = dbo.ProperSO(inserted.SOitem)
				AND (UPDATE(StockLst_Qty) OR UPDATE(StockLst_P));

			UPDATE dbo.WorkOrder SET StkCost = ( 
				ISNULL(dbo.f_CalcStkCost_Selected_WO(inserted.WO),0) 
				+ ISNULL(dbo.f_CalcStkCost_Sales_Stock_WO(inserted.WO),0) ) 
				FROM inserted
				INNER JOIN dbo.WorkOrder WO ON inserted.WO = WO.WO
				WHERE ISNULL(inserted.WO,0) > 0
				AND (UPDATE(StockLst_Qty) OR UPDATE(StockLst_P));

	END
*/

	PRINT ''trigger  end  [Sales_Stock_after_Insert]'';
END
' 
GO
ALTER TABLE [dbo].[Sales_Stock] DISABLE TRIGGER [Sales_Stock_After_Insert]
GO
/****** Object:  Trigger [dbo].[Sales_Stock_After_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Stock_After_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[Sales_Stock_After_Update]
   ON  [dbo].[Sales_Stock] 
   AFTER UPDATE 
   NOT FOR REPLICATION
AS 
BEGIN

	SET NOCOUNT ON;
	
	PRINT ''trigger start [Sales_Stock_after_Update]'';

	IF UPDATE(StockLst_Qty) OR UPDATE(StockLst_P)
	BEGIN

			UPDATE dbo.Sales SET 
				ItemCost = ( ISNULL(dbo.f_CalcStkCost_SOitem(deleted.SOitem),0) + ISNULL(dbo.f_CalcStkCost_Sales_Stock(deleted.SOitem),0) + ISNULL(dbo.f_CalcPOCost_SOitem(deleted.SOitem),0) )
				,StkCost = ( ISNULL(dbo.f_CalcStkCost_SOitem(deleted.SOitem),0) + ISNULL(dbo.f_CalcStkCost_Sales_Stock(deleted.SOitem),0) )
				,POCost = ISNULL(dbo.f_CalcPOCost_SOitem(deleted.SOitem),0)
				FROM deleted
				INNER JOIN dbo.Sales S ON deleted.SOitem = S.SOitem
				WHERE deleted.SOitem = dbo.ProperSO(deleted.SOitem)
				AND (UPDATE(StockLst_Qty) OR UPDATE(StockLst_P));

			UPDATE dbo.WorkOrder SET StkCost = ( 
				ISNULL(dbo.f_CalcStkCost_Selected_WO(deleted.WO),0) 
				+ ISNULL(dbo.f_CalcStkCost_Sales_Stock_WO(deleted.WO),0) ) 
				FROM deleted
				INNER JOIN dbo.WorkOrder WO ON deleted.WO = WO.WO
				WHERE ISNULL(deleted.WO,0) > 0
				AND (UPDATE(StockLst_Qty) OR UPDATE(StockLst_P));

	END

	PRINT ''trigger  end  [Sales_Stock_after_Update]'';
END
' 
GO
ALTER TABLE [dbo].[Sales_Stock] ENABLE TRIGGER [Sales_Stock_After_Update]
GO
/****** Object:  Trigger [dbo].[Sales_Stock_Delete]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Sales_Stock_Delete]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[Sales_Stock_Delete]
   ON  [dbo].[Sales_Stock] 
   AFTER DELETE 
   NOT FOR REPLICATION
AS 
BEGIN
	SET NOCOUNT ON;
		
	PRINT ''trigger start [Sales_Stock_Delete]'';

	

	DECLARE @Count int
	SET @Count = @@ROWCOUNT;
        
	IF @Count > 50000
	BEGIN
		RAISERROR(''Cannot DELETE more than 50 000 records of Lst_Detail at one time.'',16,1) 
		ROLLBACK TRANSACTION
		RETURN;
	END



	PRINT ''trigger  end  [Sales_Stock_Delete]'';

END
' 
GO
ALTER TABLE [dbo].[Sales_Stock] ENABLE TRIGGER [Sales_Stock_Delete]
GO
/****** Object:  Trigger [dbo].[SalesP_Customer_After_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[SalesP_Customer_After_Insert]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[SalesP_Customer_After_Insert] 
   ON  [dbo].[SalesP_Customer]
   AFTER INSERT
   NOT FOR REPLICATION
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	UPDATE dbo.SalesP_Customer
		SET NoNoiseName = (SELECT dbo.f_NoNoiseName(inserted.Customer)
			FROM inserted
			WHERE SalesP_customer.ID = inserted.ID)
		WHERE EXISTS (SELECT * FROM 
			inserted
			WHERE LEN(inserted.Customer) > 0
			AND LEN(inserted.NoNoiseName) = 0 )
		
END
' 
GO
ALTER TABLE [dbo].[SalesP_Customer] DISABLE TRIGGER [SalesP_Customer_After_Insert]
GO
/****** Object:  Trigger [dbo].[SalesP_Customer_Delete]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[SalesP_Customer_Delete]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[SalesP_Customer_Delete] 
  ON [dbo].[SalesP_Customer] 
  for Delete NOT FOR REPLICATION 
AS

PRINT ''Start trigger [SalesP_Customer_Delete]'';


   INSERT dbo.Ar_SalesP_Customer_History 
	( [ID]
      ,[SoldCode]
      ,[SalesP]
      ,[NoNoiseName]
      ,[Customer]
      ,[CustID]
      ,[Who]
      ,[What]
      ,[When] )
   SELECT 	
	  deleted.[ID]
      ,deleted.[SoldCode]
      ,deleted.[SalesP]
      ,deleted.[NoNoiseName]
      ,deleted.[Customer]
      ,deleted.[CustID]
	  ,suser_sname() AS [Who]
	  ,''DELETED'' AS [What]
	  ,GETDATE() AS [When]
    FROM deleted

--********

PRINT ''End trigger [SalesP_Customer_Delete]'';' 
GO
ALTER TABLE [dbo].[SalesP_Customer] ENABLE TRIGGER [SalesP_Customer_Delete]
GO
/****** Object:  Trigger [dbo].[SalesP_Customer_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[SalesP_Customer_Insert]'))
EXEC dbo.sp_executesql @statement = N'create TRIGGER [dbo].[SalesP_Customer_Insert] 
  ON [dbo].[SalesP_Customer] 
  for Insert NOT FOR REPLICATION 
AS

PRINT ''Start trigger [SalesP_Customer_Delete]'';


   INSERT dbo.Ar_SalesP_Customer_History 
	( [ID]
      ,[SoldCode]
      ,[SalesP]
      ,[NoNoiseName]
      ,[Customer]
      ,[CustID]
      ,[Who]
      ,[What]
      ,[When] )
   SELECT 	
	  inserted.[ID]
      ,inserted.[SoldCode]
      ,inserted.[SalesP]
      ,inserted.[NoNoiseName]
      ,inserted.[Customer]
      ,inserted.[CustID]
	  ,suser_sname() AS [Who]
	  ,''INSERT'' AS [What]
	  ,GETDATE() AS [When]
    FROM inserted

--********

PRINT ''End trigger [SalesP_Customer_Insert]'';' 
GO
ALTER TABLE [dbo].[SalesP_Customer] ENABLE TRIGGER [SalesP_Customer_Insert]
GO
/****** Object:  Trigger [dbo].[SalesP_Customer_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[SalesP_Customer_Update]'))
EXEC dbo.sp_executesql @statement = N'create TRIGGER [dbo].[SalesP_Customer_Update] 
  ON [dbo].[SalesP_Customer] 
  for UPDATE NOT FOR REPLICATION 
AS

PRINT ''Start trigger [SalesP_Customer_Update]'';

	
   INSERT dbo.Ar_SalesP_Customer_History 
	( [ID]
      ,[SoldCode]
      ,[SalesP]
      ,[NoNoiseName]
      ,[Customer]
      ,[CustID]
      ,[Who]
      ,[What]
      ,[When] )
   SELECT 	
	  inserted.[ID]
      ,inserted.[SoldCode]
      ,inserted.[SalesP]
      ,inserted.[NoNoiseName]
      ,inserted.[Customer]
      ,inserted.[CustID]
	  ,suser_sname() AS [Who]
	  ,''BEFOREEDIT'' AS [What]
	  ,GETDATE() AS [When]
    FROM inserted

   INSERT dbo.Ar_SalesP_Customer_History 
	( [ID]
      ,[SoldCode]
      ,[SalesP]
      ,[NoNoiseName]
      ,[Customer]
      ,[CustID]
      ,[Who]
      ,[What]
      ,[When] )
   SELECT 	
	  deleted.[ID]
      ,deleted.[SoldCode]
      ,deleted.[SalesP]
      ,deleted.[NoNoiseName]
      ,deleted.[Customer]
      ,deleted.[CustID]
	  ,suser_sname() AS [Who]
	  ,''AFTEREDIT'' AS [What]
	  ,GETDATE() AS [When]
    FROM deleted

--********

PRINT ''End trigger [SalesP_Customer_Update]'';' 
GO
ALTER TABLE [dbo].[SalesP_Customer] ENABLE TRIGGER [SalesP_Customer_Update]
GO
/****** Object:  Trigger [dbo].[Ship_After_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Ship_After_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[Ship_After_Update]
   ON  [dbo].[Ship] 
   AFTER UPDATE 
   NOT FOR REPLICATION
AS 
BEGIN

SET NOCOUNT ON;
PRINT ''trigger start [Ship_after_Update]''

IF UPDATE(RMA_No)
	begin
	
	INSERT INTO dbo.NR_UserTrack ([mess1],[cprogram]) 
		SELECT LEFT(''SOitem: ''+inserted.SOitem
		+ CASE When ISNULL(inserted.Cncld,0)=1 THEN '' was Cancelled'' ELSE '' was unCancelled'' END
		+ '', RMA: ''+CAST(inserted.RMA_No AS CHAR(10)) ,1024)
		,LEFT(''TRIGGER ERP_2.dbo.Ship_After_Update'' ,100)
		FROM inserted
		WHERE UPDATE(RMA_No)
		AND ISNULL(inserted.RMA_No,0) > 0

	end

	PRINT ''IF UPDATE(ShipDate) AND UPDATE(Complete) '';

	IF UPDATE(ShipDate) AND UPDATE(Complete) 
	begin
		PRINT ''Ship_after_Update TRIGGER_NESTLEVEL() is ''+CAST(TRIGGER_NESTLEVEL() AS CHAR(10))

		--Enabled 10/6 9:20
		IF TRIGGER_NESTLEVEL() <= 4
			begin
			UPDATE dbo.Sales SET Shipped = ISNULL(inserted.ShipDate,GetDate())
			, cmplt = 1
			--, cmplt = inserted.Complete
			FROM inserted
			WHERE Sales.SOitem = inserted.SOitem 
			AND dbo.f_ProperSOitem(inserted.SOitem) <> dbo.f_ProperSOItem('''')
			and inserted.ShipDate IS NOT NULL 
			AND inserted.Complete = 1
			AND inserted.Cncld = 0	
			AND UPDATE(ShipDate)  ;

			PRINT ''trigger        [Ship_after_Update]  --Updated Sales with Shipped Date'';
			end
		
	end	




PRINT ''trigger  end  [Ship_after_Update]''
END' 
GO
ALTER TABLE [dbo].[Ship] ENABLE TRIGGER [Ship_After_Update]
GO
/****** Object:  Trigger [dbo].[Ship_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Ship_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[Ship_Insert]
   ON  [dbo].[Ship] 
   FOR INSERT 
   NOT FOR REPLICATION
AS 

--Trigger for Sales_Update will set a Lot of matching data, Always check there for data errors.


BEGIN
	SET NOCOUNT ON;

	DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
	DECLARE @Body varchar(4000)
	DECLARE @badSOitem CHAR(10)
		
	PRINT ''trigger start Ship_Insert:''

	IF EXISTS ( SELECT * FROM inserted WHERE SUBSTRING(SOitem,1,7) Like ''%-%'')
	BEGIN
		
		SELECT @Body = ''dbo.Ship table, SOitem is not Proper,''+CHAR(13)
		
		SELECT TOP 1 @BadSoitem = soitem  FROM inserted WHERE SUBSTRING(SOitem,1,7) Like ''%-%''
		SET @Body = @Body+'' SO item:''+@BadSoitem +''.''+CHAR(13)
		SET @Body = @Body+RTRIM(suser_sname())+''.''+CHAR(13)
			+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.Ship_Insert ''
			
		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
			 @SubjectEmail = ''BAD SOitem'',
			 @BodyEmail = @Body,
			 @BodyType = ''TEXT''
								
		SET @Body = ''Insert into dbo.Ship table failed. SOitem:''+@BadSoitem+'' not Proper.''
		RAISERROR( @Body, 16, -1)
	END

	IF EXISTS ( SELECT * FROM inserted WHERE ShipDate=''2000-01-01 00:00:00.000'' AND [Complete]=1 ) 
		BEGIN

		PRINT ''dbo.Ship table, shipDate is empty and Complete.''

		SELECT @Body = ''dbo.Ship table, shipDate is empty and Complete.''+CHAR(13)
		
		SELECT TOP 1 @BadSoitem = SOitem  FROM inserted WHERE ShipDate=''1900-01-01 00:00:00.000'' AND [Complete]=1
		
		SET @Body = @Body+'' SO item:''+@BadSoitem +''.''+CHAR(13)
		SET @Body = @Body+RTRIM(suser_sname())+''.''+CHAR(13)
			+@@SERVERNAME+'' TRIGGER ''+DB_NAME()+''.dbo.Ship_Insert '' 
			
		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
			 @SubjectEmail = ''BAD Shipdate'',
			 @BodyEmail = @Body,
			 @BodyType = ''TEXT''		
			 		
		END

	/*

	--EXEC [dbo].[p_Duplicates]

	*Need to fix ''Select for SalesOrder'' before enabling again.
	IF EXISTS (
		SELECT * FROM dbo.Ship s1
			INNER JOIN inserted s2 ON S1.SOitem = S2.SOitem
			WHERE S2.ID != S1.ID )
	BEGIN
		
		SELECT @Body = ''dbo.Ship table, SOitem allready exits!''+CHAR(13)
		
		SELECT TOP 1 @BadSoitem = soitem  FROM inserted WHERE SUBSTRING(SOitem,1,7) Like ''%-%''
		SET @Body = @Body+'' SO item:''+@BadSoitem +''.''
			+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.Ship_Insert ''
			
		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
			 @SubjectEmail = ''Duplicate SOitem'',
			 @BodyEmail = @Body,
			 @BodyType = ''TEXT''
								
		SET @Body = ''Insert into dbo.Ship table failed. SOitem:''+@BadSoitem+'' Duplicated.''
		RAISERROR( @Body, 16, -1)
	END
	*/

	PRINT ''trigger end  Ship_Insert:''
END
' 
GO
ALTER TABLE [dbo].[Ship] ENABLE TRIGGER [Ship_Insert]
GO
/****** Object:  Trigger [dbo].[Ship_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Ship_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[Ship_Update]
   ON  [dbo].[Ship] FOR UPDATE  
   NOT FOR REPLICATION
AS 

--Trigger for Sales_Update will set a Lot of matching data, Always check there for data errors.

BEGIN
	---big UPDATES are in error
	DECLARE @Count int
	SET @Count = @@ROWCOUNT;
   
	IF @Count > 1000
	BEGIN
		RAISERROR(''Cannot UPDATE more than 1000 records of dbo.Ship at one time. trigger Ship_Update'',16,1) 
		ROLLBACK TRANSACTION
		RETURN;
	END
	----------------------

	SET NOCOUNT ON;

	DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
	DECLARE @Body varchar(4000)
	DECLARE @badSOitem CHAR(10)

	PRINT ''trigger begin [Ship_Update]:''

	IF EXISTS ( SELECT * FROM inserted WHERE SUBSTRING(SOitem,1,7) Like ''%-%'' ) 
		BEGIN
		
		PRINT '' dbo.Ship table, SOitem is not Proper''

		SELECT @Body = ''dbo.Ship table, SOitem is not Proper,''+CHAR(13)
		
		SELECT TOP 1 @BadSoitem = soitem  FROM inserted WHERE SUBSTRING(SOitem,1,7) Like ''%-%''
		
		SET @Body = @Body+'' SO item:''+@BadSoitem +''.''+CHAR(13)
		SET @Body = @Body+RTRIM(suser_sname())+''.''+CHAR(13)
			+@@SERVERNAME+'' TRIGGER ''+DB_NAME()+''.dbo.Ship_Update '' 
			
		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
			 @SubjectEmail = ''BAD SOitem'',
			 @BodyEmail = @Body,
			 @BodyType = ''TEXT''		
		
		PRINT  '' Update into dbo.ship table failed. SOitem:''+@BadSoitem+'' not Proper.''

		SET @Body = ''Update into dbo.ship table failed. SOitem:''+@BadSoitem+'' not Proper.''
			
		--RAISERROR( @Body, 16, -1)
		
		END

	-------------------
	IF UPDATE(ShipDate)
		INSERT INTO dbo.NR_UserTrack (Mess1,cProgram,ErrorDate,Machine) 
			SELECT LEFT(''SOitem:''+inserted.SOitem+'' was marked as Ship Date ''+CONVERT(char(10), inserted.ShipDate, 23)
				+CASE ISNULL(inserted.complete,0) WHEN 1 THEN '' Complete'' ELSE '' UnComplete'' END
			+'' in Ship.'',1024) 
			,LEFT(''Ship_Update Trigger'',100)
			,GetDate(),suser_sname() 
			FROM inserted, deleted
			WHERE inserted.SOitem = deleted.SOitem
			AND NOT inserted.ShipDate = deleted.ShipDate
			AND UPDATE(ShipDate)

/*	IF UPDATE(ShipDate)
		UPDATE dbo.Sales SET Shipped = inserted.ShipDate, cmplt = inserted.Complete
			FROM inserted
			WHERE Sales.SOitem = inserted.SOitem 
			AND dbo.f_ProperSOitem(inserted.SOitem) <> dbo.f_ProperSOItem('''')
			and inserted.ShipDate IS NOT NULL 
			AND inserted.Complete = 1
			AND inserted.Cncld = 0	
			AND Sales.cncld = 0
*/			


/*
	IF EXISTS ( SELECT * FROM inserted WHERE ShipDate=''1900-01-01 00:00:00.000'' AND [Complete]=1 ) 
		BEGIN
		
		PRINT '' dbo.Ship table, ShipDate is empty and Complete.''

		SELECT @Body = ''dbo.Ship table, ShipDate is empty and Complete.''+CHAR(13)
		
		DECLARE @Company VARCHAR(30)
		DECLARE @DueDate DATETIME
		DECLARE @ShipDate DATETIME
		DECLARE @ShipVia VARCHAR(20)
		
		SELECT TOP 1 @BadSoitem = SOitem
			, @Company = ISNULL(Company,'''')
			, @DueDate = ISNULL(DueDate,'''')
			, @ShipDate = ISNULL(ShipDate,'''')
			, @ShipVia = ISNULL(ShipVia,'''')
			FROM inserted WHERE ShipDate=''2000-01-01 00:00:00.000'' AND [Complete]=1
		
		SET @Body = @Body+''  SO item:''+@BadSoitem +''.''+CHAR(13)
		SET @Body = @Body+''  Company:''+@Company +''.''+CHAR(13)

		SET @Body = @Body+''  DueDate:''+CAST( @DueDate AS VARCHAR(12))+''.''+CHAR(13)
		SET @Body = @Body+'' ShipDate:''+CAST( @ShipDate AS VARCHAR(12)) +''.''+CHAR(13)
		SET @Body = @Body+''  ShipVia:''+@ShipVia +''.''+CHAR(13)

		SET @Body = @Body+RTRIM(suser_sname())+''.''+CHAR(13)
			+@@SERVERNAME+'' TRIGGER ''+DB_NAME()+''.dbo.Ship_Update '' 
			
		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
			 @SubjectEmail = ''BAD Shipdate'',
			 @BodyEmail = @Body,
			 @BodyType = ''TEXT''		
			 		
		END
*/
	PRINT ''trigger  end  [Ship_Update]:''
end
' 
GO
ALTER TABLE [dbo].[Ship] ENABLE TRIGGER [Ship_Update]
GO
/****** Object:  Trigger [dbo].[ShipAddr_After_INSERT]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[ShipAddr_After_INSERT]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<David Kirchner>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[ShipAddr_After_INSERT]
   ON [dbo].[ShipAddr] 
   AFTER INSERT 
   NOT FOR REPLICATION
AS 

begin

-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

IF UPDATE(Company)
	UPDATE dbo.ShipAddr 
		SET NoNoiseName = dbo.f_NoNoiseName(inserted.Company) 
		FROM inserted WHERE ShipAddr.ShipCode = inserted.ShipCode
		AND UPDATE(Company);



END
' 
GO
ALTER TABLE [dbo].[ShipAddr] ENABLE TRIGGER [ShipAddr_After_INSERT]
GO
/****** Object:  Trigger [dbo].[ShipAddr_DELETE]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[ShipAddr_DELETE]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<David Kirchner>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[ShipAddr_DELETE]
   ON [dbo].[ShipAddr] 
   FOR DELETE 
   NOT FOR REPLICATION
AS 

---

DECLARE @Count int
SET @Count = @@ROWCOUNT;
       
IF @Count > 1000
BEGIN
	RAISERROR(''Cannot DELETE more than 1 000 records of [ShipAddr] at one time.'',16,1) 
	ROLLBACK TRANSACTION
	RETURN;
END

---

if (select count(*) from deleted where shipcode < 10 ) > 0 
  begin 
    rollback transaction
    RAISERROR(''You cannot delete first 9 ShipCodes. (source = [ShipAddr_Delete])'', 16, 1)
  end

---
' 
GO
ALTER TABLE [dbo].[ShipAddr] ENABLE TRIGGER [ShipAddr_DELETE]
GO
/****** Object:  Trigger [dbo].[ShipAddr_INSERT]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[ShipAddr_INSERT]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<David Kirchner>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[ShipAddr_INSERT]
   ON [dbo].[ShipAddr] 
   AFTER INSERT 
   NOT FOR REPLICATION
AS 
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--SELECT * FROM dbo.ShipAddr ORDER BY ShipCode DESC

	DECLARE @iShipCode INT
	SELECT TOP 1 @iShipCode = ShipCode FROM inserted 

	DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()

	--UPDATE [dbo].[ShipAddr] SET LastEdit = GETDATE()
	  --WHERE ShipCode = @iShipCode

	IF (SELECT COUNT(*) FROM inserted WHERE ISNULL(inserted.ShipCode,0) > 0 ) > 0
		BEGIN
			--Create the Email Body
			--PRINT ''ShipCode '' + RTRIM(CAST(@iShipCode AS CHAR))
			DECLARE @SalesNum INT
			SELECT TOP 1 @SalesNum = SalesNum 
				FROM dbo.Sales_No WITH(NOLOCK)
				INNER JOIN inserted ON Sales_No.pShipAddr = inserted.shipcode
				--WHERE Sales_No.pShipAddr = @iShipCode

			DECLARE @Body varchar(4000)

			IF @SalesNum > 0
				BEGIN

				SELECT TOP 1 @Body = ''Ship to table has a new entry, ShipCode:''
					+RTRIM(CAST(@iShipCode AS CHAR))+CHAR(10)+CHAR(13)+'' on ''+RTRIM(CAST(GETDATE()AS CHAR))+''.''+CHAR(10)+CHAR(13)
					+CHAR(9)+''User ''+RTRIM(suser_sname())+CHAR(13)
					FROM inserted
				
				SET @Body = ISNULL(@Body,'''') +''Please verify that the ordering company will allow material to be shipped to this address.''+CHAR(13)
				SET @Body = ISNULL(@Body,'''') +''For Sales Order# ''+RTRIM(CAST(@SalesNum AS CHAR))+'' ''+CHAR(13)
				SET @Body = ISNULL(@Body,'''') +''"''+dbo.f_Reportlink_INT(''SO'',@SalesNum)+''"''+CHAR(13)
				SET @Body = ISNULL(@Body,'''') +''User ''+RTRIM(suser_sname())+CHAR(13)
				

				DECLARE @SalesRep VARCHAR(20)
				DECLARE @ItemTot INT
			
				SELECT TOP 1 @SalesRep=ISNULL(Sales_No.SalesRep,'''')
					, @ItemTot=ISNULL(Sales.itemTot,0)
					FROM dbo.Sales_No, dbo.Sales
					WHERE Sales_No.SalesNum = @SalesNum 
					AND Sales.SalesNum = Sales_No.SalesNum			
			
				DECLARE @Sale MONEY
				SELECT TOP 1 @Sale = SUM(ISNULL(Sales.ItemSale,0)) 
					FROM dbo.Sales WHERE Sales.SalesNum = @SalesNum

				SET @Body = @Body + ''SalesRep=''+ISNULL(@SalesRep,''No SalesRep'')+CHAR(13)
				SET @Body = @Body + ''ItemTot=''+ISNULL(CAST(@ItemTot AS CHAR),''No Items'')+CHAR(13)
				SET @Body = @Body + ''Sale=''+ISNULL(CAST(@Sale AS CHAR),''No Sale'')+CHAR(13)

				END
			ELSE
				SELECT TOP 1 @Body = ''Ship to table has a new entry, ShipCode:''
					+RTRIM(CAST(ISNULL(@iShipCode,0) AS CHAR))+'' on ''+RTRIM(CAST(GETDATE()AS CHAR))+''.''+CHAR(10)+CHAR(13)
					+''Please verify that the ordering company will allow material to be shipped to this address.''+CHAR(10)+CHAR(13)
					+''No Sales Order yet.''+CHAR(10)+CHAR(13)
					+CHAR(9)+''User ''+RTRIM(suser_sname())+CHAR(13)
					FROM inserted

			DECLARE @shipcode INT
			DECLARE @soldcode INT
			DECLARE	@company VARCHAR(30)
			DECLARE @addr1 VARCHAR(30)
			DECLARE @addr2 VARCHAR(30)
			DECLARE @city VARCHAR(20)
			DECLARE @st VARCHAR(2)
			DECLARE @zip VARCHAR(12)
			DECLARE @country VARCHAR(15)
			DECLARE @contact VARCHAR(20)
			DECLARE @telephone VARCHAR(12)
			DECLARE @fax_number VARCHAR(12)
			DECLARE @email VARCHAR(60)
			DECLARE @customer VARCHAR(20)
			DECLARE @NoNoiseName VARCHAR(100)

			SELECT TOP 1 @shipcode=ISNULL(shipcode,0), @Company=ISNULL(Company,''''), @Addr1=ISNULL(Addr1,''''), @Addr2=ISNULL(Addr2,'''')
			    , @City=ISNULL(City,''''), @ST=ISNULL(ST,''''), @Zip=ISNULL(Zip,''''), @Country=ISNULL(Country,''''), @Contact=ISNULL(Contact,'''')
				, @Telephone=ISNULL(Telephone,''''), @Fax_Number=ISNULL(Fax_Number,''''), @Email=ISNULL(Email,'''')
				, @Customer=ISNULL(Customer,''''), @NoNoiseName = ISNULL(NoNoiseName,'''')
				FROM inserted WHERE ShipCode = @iShipCode 

			SET @Body = ISNULL(@Body,'''') + CHAR(13)+''Shipping Address: -New-''+CHAR(13)
			SET @Body = ISNULL(@Body,'''') + ''shipcode=''+CHAR(9)+CAST(@shipcode AS CHAR)+CHAR(13)
			SET @Body = ISNULL(@Body,'''') + ''Company=''+CHAR(9)+@Company+CHAR(13)

			IF LEN(@Company) > 1
				begin
				DECLARE @cCleanPara	VarChar(1000)
				SET @cCleanPara = REPLACE(@Company,'' '', ''+'');
				SET @Body = ISNULL(@Body,'''') +''"''+dbo.f_Reportlink_CHAR(''CompanyInfo'',@cCleanPara)+''"''+CHAR(10)+CHAR(13)
				end

			SET @Body = ISNULL(@Body,'''') + ''Addr1=''+CHAR(9)+CHAR(9)+@Addr1+CHAR(13)
			SET @Body = ISNULL(@Body,'''') + ''Addr2=''+CHAR(9)+CHAR(9)+@Addr2+CHAR(13)
			SET @Body = ISNULL(@Body,'''') + ''City=''+CHAR(9)+CHAR(9)+@City+CHAR(13)
			SET @Body = ISNULL(@Body,'''') + ''ST=''+CHAR(9)+CHAR(9)+@ST+CHAR(13)
			SET @Body = ISNULL(@Body,'''') + ''Zip=''+CHAR(9)+CHAR(9)+@Zip+CHAR(13)
			SET @Body = ISNULL(@Body,'''') + ''Country=''+CHAR(9)+@Country+CHAR(13)
			SET @Body = ISNULL(@Body,'''') + ''Contact=''+CHAR(9)+@Contact+CHAR(13)
			SET @Body = ISNULL(@Body,'''') + ''Telephone=''+CHAR(9)+@Telephone+CHAR(13)
			SET @Body = ISNULL(@Body,'''') + ''Fax_Number=''+CHAR(9)+@Fax_Number+CHAR(13)
			SET @Body = ISNULL(@Body,'''') + ''Email=''+CHAR(9)+CHAR(9)+@Email+CHAR(13)
			SET @Body = ISNULL(@Body,'''') + ''CustomerID=''+CHAR(9)+@Customer+CHAR(13)

			IF LEN(@Customer) > 1
				SET @Body = ISNULL(@Body,'''') +''"''+ dbo.f_Reportlink_CHAR(''CustomerID'',@Customer)+''"''+CHAR(10)+CHAR(13)
				--SET @Body = @body +''"''+ dbo.f_HTML_link_CustomerID(@Customer)+''"''+CHAR(10)+CHAR(13)

			SET @Body = ISNULL(@Body,'''') + ''NoNoiseName=''+CHAR(9)+@NoNoiseName+CHAR(13)
			IF LEN(@NoNoiseName) > 1
				SET @Body = ISNULL(@Body,'''') +''"''+ dbo.f_Reportlink_CHAR(''CustomerInfo_NoNoise'',@NoNoiseName)+''"''+CHAR(10)+CHAR(13)
				--SET @Body = @body +''"''+ dbo.f_HTML_link_CustomerInfo_NoNoise(@NoNoiseName)+''"''+CHAR(10)+CHAR(13)

			SET @Body = ISNULL(@Body,'''') + CHAR(13)
				
			SELECT TOP 1 @soldcode=ISNULL(soldcode,0), @Company=ISNULL(Company,''''), @Addr1=ISNULL(Addr1,''''), @Addr2=ISNULL(Addr2,'''')
			    , @City=ISNULL(City,''''), @ST=ISNULL(ST,''''), @Zip=ISNULL(Zip,''''), @Country=ISNULL(Country,''''), @Contact=ISNULL(Contact,'''')
				, @Telephone=ISNULL(Telephone,''''), @Fax_Number=ISNULL(Fax_Number,''''), @Email=ISNULL(Email,'''')
				, @Customer=ISNULL(Customer,''''), @NoNoiseName = ISNULL(NoNoiseName,'''')
				FROM dbo.SoldAddr WHERE Customer LIKE @Customer
						
			SET @Body = ISNULL(@Body,'''') + CHAR(13)+''Billing Address:''+CHAR(13)
			SET @Body = ISNULL(@Body,'''') + ''soldcode=''+CHAR(9)+CAST(@soldcode AS CHAR)+CHAR(13)
			SET @Body = ISNULL(@Body,'''') + ''Company=''+CHAR(9)+@Company+CHAR(13)
			SET @Body = ISNULL(@Body,'''') + ''Addr1=''+CHAR(9)+CHAR(9)+@Addr1+CHAR(13)
			SET @Body = ISNULL(@Body,'''') + ''Addr2=''+CHAR(9)+CHAR(9)+@Addr2+CHAR(13)
			SET @Body = ISNULL(@Body,'''') + ''City=''+CHAR(9)+CHAR(9)+@City+CHAR(13)
			SET @Body = ISNULL(@Body,'''') + ''ST=''+CHAR(9)+CHAR(9)+@ST+CHAR(13)
			SET @Body = ISNULL(@Body,'''') + ''Zip=''+CHAR(9)+CHAR(9)+@Zip+CHAR(13)
			SET @Body = ISNULL(@Body,'''') + ''Country=''+CHAR(9)+@Country+CHAR(13)
			SET @Body = ISNULL(@Body,'''') + ''Contact=''+CHAR(9)+@Contact+CHAR(13)
			SET @Body = ISNULL(@Body,'''') + ''Telephone=''+CHAR(9)+@Telephone+CHAR(13)
			SET @Body = ISNULL(@Body,'''') + ''Fax_Number=''+CHAR(9)+@Fax_Number+CHAR(13)
			SET @Body = ISNULL(@Body,'''') + ''Email=''+CHAR(9)+CHAR(9)+@Email+CHAR(13)
			SET @Body = ISNULL(@Body,'''') + ''NoNoiseName=''+CHAR(9)+@NoNoiseName+CHAR(13)
			SET @Body = ISNULL(@Body,'''') + CHAR(13)

			IF LEN(ISNULL(@Body,'''')) < 10
				SET @Body = ''Lost data for ShipCode insert ShipCode:'' + CAST(@iShipCode AS CHAR(10)) +CHAR(13)

			SET @Body = ISNULL(@Body,'''') + '' Trigger ShipAddr_INSERT''
				+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.ShipAddr_INSERT ''
			
			-- Deprecated as the Report wasn''t functioning correctly, 
			-- And the process doesn''t match the correct prosses of checking addresses for ITAR
			-- Shipping/Billing address/Contacts needs to be checked for EVERY order when created, and before shipped
			-- Do Not Sell List needs to be checked for DOMESTIC and FOREIGN.
			-- Do Not Sell List is dynamic and changes.
			-- Checking the address 1 time, does not mean it will be OK to ship to in the future

			--EXEC dbo.p_eMail_Send
			--	 @FromEmail = @cEmailFrom, 
			--	 @ToEmail = ''NewShipAddr@ERP_1s.com'', 
			--	 @SubjectEmail = ''New Shipping Address was just added'',
			--	 @BodyEmail = @Body,
			--	 @BodyType = ''TEXT''		
		 
		END

	--UPDATE dbo.ShipAddr SET NoNoiseName = dbo.f_NoNoiseName(inserted.Company) FROM inserted WHERE ShipAddr.ShipCode = inserted.ShipCode
END
' 
GO
ALTER TABLE [dbo].[ShipAddr] ENABLE TRIGGER [ShipAddr_INSERT]
GO
/****** Object:  Trigger [dbo].[ShipAddr_UPDATE]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[ShipAddr_UPDATE]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<David Kirchner>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[ShipAddr_UPDATE]
   ON [dbo].[ShipAddr] 
   FOR UPDATE 
   NOT FOR REPLICATION
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
--	SET NOCOUNT ON;
    
---big UPDATES are in error
DECLARE @Count int
SET @Count = @@ROWCOUNT;
   
IF @Count > 1000
BEGIN
	RAISERROR(''Cannot UPDATE more than 1000 records of dbo.Sales_No at one time. trigger Sales_No_Update'',16,1) 
	ROLLBACK TRANSACTION
	RETURN;
END
----------------------

	IF UPDATE(Company) 
		IF ((SELECT TRIGGER_NESTLEVEL()) < 2)
		BEGIN
			UPDATE sa SET NoNoiseName = dbo.f_NoNoiseName(i.Company) 
				FROM dbo.ShipAddr sa 
				INNER JOIN inserted i ON sa.ShipCode = i.ShipCode 
				WHERE UPDATE(Company)
		END


	IF UPDATE(ShipCode) 
	begin
	
		if (select count(*) from deleted where ShipCode < 10 AND UPDATE(ShipCode) ) > 0
		begin 
			rollback transaction 
			RAISERROR(''You cannot Change ShipCode record less than 10. (source = [ShipAddr_UPDATE])'', 16, 1)
		end
	end

END
' 
GO
ALTER TABLE [dbo].[ShipAddr] ENABLE TRIGGER [ShipAddr_UPDATE]
GO
/****** Object:  Trigger [dbo].[SO_ProcessNotes_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[SO_ProcessNotes_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[SO_ProcessNotes_Insert]
   ON  [dbo].[SO_ProcessNotes] 
   FOR INSERT 
   NOT FOR REPLICATION
AS 
BEGIN
	SET NOCOUNT ON;

	DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
	DECLARE @Body varchar(4000)
	DECLARE @badSOitem CHAR(10)

	IF EXISTS ( SELECT * FROM inserted WHERE SUBSTRING(SOitem,1,7) Like ''%-%'')
		BEGIN
		
		SELECT @Body = ''Cannot insert into dbo.SO_ProcessNotes, SOitem is not Proper,''+CHAR(13)
		
		SELECT TOP 1 @BadSoitem = SOitem  FROM inserted WHERE SUBSTRING(SOitem,1,7) Like ''%-%''
		SET @Body = @Body+'' SO item:''+@BadSoitem +''.''
			+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.SO_ProcessNotes_Insert ''
			
		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
			 @SubjectEmail = ''BAD SOitem'',
			 @BodyEmail = @Body,
			 @BodyType = ''TEXT''		
			 
		SET @Body = ''INSERT dbo.SO_ProcessNotes table failed. SOitem:''+@BadSoitem+'' not Proper.''
		RAISERROR( @Body, 16, -1)

		END
		
	
END
' 
GO
ALTER TABLE [dbo].[SO_ProcessNotes] ENABLE TRIGGER [SO_ProcessNotes_Insert]
GO
/****** Object:  Trigger [dbo].[SO_ProcessNotes_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[SO_ProcessNotes_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[SO_ProcessNotes_Update]
   ON  [dbo].[SO_ProcessNotes] 
   FOR UPDATE 
   NOT FOR REPLICATION
AS 
BEGIN
	SET NOCOUNT ON;

	DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
	DECLARE @Body varchar(4000)
	DECLARE @badSOitem CHAR(10)

	IF EXISTS ( SELECT * FROM inserted WHERE SUBSTRING(SOitem,1,7) Like ''%-%'' )
		BEGIN
		
		SELECT @Body = ''Cannot update dbo.SO_ProcessNotes, SOitem is not Proper,''+CHAR(13)
		
		SELECT TOP 1 @BadSoitem = SOitem  FROM inserted WHERE SUBSTRING(SOitem,1,7) Like ''%-%''
		SET @Body = @Body+'' SO item:''+@BadSoitem +''.''
			+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.SO_ProcessNotes_Update ''
			
		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
			 @SubjectEmail = ''BAD SOitem'',
			 @BodyEmail = @Body,
			 @BodyType = ''TEXT''	
			 		
		SET @Body = ''Update dbo.SO_ProcessNotes table failed. SOitem:''+@BadSoitem+'' not Proper.''
		RAISERROR( @Body, 16, -1)

		END
		
END
' 
GO
ALTER TABLE [dbo].[SO_ProcessNotes] ENABLE TRIGGER [SO_ProcessNotes_Update]
GO
/****** Object:  Trigger [dbo].[SoldAddr_After_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[SoldAddr_After_Insert]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<David Kirchner>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[SoldAddr_After_Insert] 
	ON [dbo].[SoldAddr] 
	AFTER INSERT 
	NOT FOR REPLICATION
AS
begin

IF UPDATE(Company)
	UPDATE dbo.SoldAddr 
		SET NoNoiseName = dbo.f_NoNoiseName(inserted.Company) 
		FROM inserted WHERE SoldAddr.SoldCode = inserted.SoldCode
		AND UPDATE(Company)


	/*	--Email
	IF UPDATE(Company) OR UPDATE(Addr1) OR UPDATE(Addr2) OR UPDATE(City) OR UPDATE(ST)  
		OR UPDATE(zip) OR UPDATE(Country) OR UPDATE(Contact) 
	begin
		DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
		DECLARE @Body varchar(4000)
	
		SELECT @Body = ''Sold to database has been edited, SoldCode:''
			+RTRIM(CAST(inserted.SoldCode AS CHAR))+'' on ''+RTRIM(CAST(GETDATE()AS CHAR))+''.''+CHAR(13)
			+''Please verify that the ordering company will allow material to be shipped to this address.''+CHAR(13)
			+''  ''+RTRIM(suser_sname())+CHAR(13)
			FROM inserted
			WHERE UPDATE(Company) OR UPDATE(Addr1) OR UPDATE(Addr2) OR UPDATE(City) OR UPDATE(ST)  
			OR UPDATE(zip) OR UPDATE(Country) OR UPDATE(Contact) 

		DECLARE @shipcode decimal(10, 0)
		DECLARE	@company VARCHAR(30)
		DECLARE @addr1 VARCHAR(30)
		DECLARE @addr2 VARCHAR(30)
		DECLARE @city VARCHAR(20)
		DECLARE @st VARCHAR(2)
		DECLARE @zip VARCHAR(12)
		DECLARE @country VARCHAR(15)
		DECLARE @contact VARCHAR(20)
		DECLARE @telephone VARCHAR(12)
		DECLARE @fax_number VARCHAR(12)
		DECLARE @email VARCHAR(60)
		DECLARE @customer VARCHAR(20)

		SELECT TOP 1 @shipcode=soldcode, @Company=Company, @Addr1=Addr1, @Addr2=Addr2, @City=City, @ST=ST, @Zip=Zip, @Country=Country, @Contact=Contact, @Telephone=Telephone, @Fax_Number=Fax_Number, @Email=Email, @Customer=Customer 
			FROM inserted --WHERE Customer LIKE @Customer
			WHERE UPDATE(Company) OR UPDATE(Addr1) OR UPDATE(Addr2) OR UPDATE(City) OR UPDATE(ST)  
			OR UPDATE(zip) OR UPDATE(Country) OR UPDATE(Contact) 

		SET @Body = @body + CHAR(13)+''Billing Address:''+CHAR(13)
		SET @Body = @body + ''soldcode=''+CHAR(9)+CAST(@shipcode AS CHAR)+CHAR(13)
		SET @Body = @body + ''Company=''+CHAR(9)+@Company+CHAR(13)
		SET @Body = @body + ''Addr1=''+CHAR(9)+CHAR(9)+@Addr1+CHAR(13)
		SET @Body = @body + ''Addr2=''+CHAR(9)+CHAR(9)+@Addr2+CHAR(13)
		SET @Body = @body + ''City=''+CHAR(9)+CHAR(9)+@City+CHAR(13)
		SET @Body = @body + ''ST=''+CHAR(9)+CHAR(9)+@ST+CHAR(13)
		SET @Body = @body + ''Zip=''+CHAR(9)+CHAR(9)+@Zip+CHAR(13)
		SET @Body = @body + ''Country=''+CHAR(9)+@Country+CHAR(13)
		SET @Body = @body + ''Contact=''+CHAR(9)+@Contact+CHAR(13)
		SET @Body = @body + ''Telephone=''+CHAR(9)+@Telephone+CHAR(13)
		SET @Body = @body + ''Fax_Number=''+CHAR(9)+@Fax_Number+CHAR(13)
		SET @Body = @body + ''Email=''+CHAR(9)+CHAR(9)+@Email+CHAR(13)+CHAR(13)
		SET @Body = @body + ''Trigger SoldAddr_After_UPDATE''
			+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.SoldAddr_After_UPDATE ''
	
		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = ''NewShipAddr@ERP_1s.com'', 
			 @SubjectEmail = ''Updated SoldTo Address'',
			 @BodyEmail = @Body,
			 @BodyType = ''TEXT''		
			 
	end
*/
END

' 
GO
ALTER TABLE [dbo].[SoldAddr] ENABLE TRIGGER [SoldAddr_After_Insert]
GO
/****** Object:  Trigger [dbo].[SoldAddr_DELETE]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[SoldAddr_DELETE]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<David Kirchner>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[SoldAddr_DELETE]
   ON [dbo].[SoldAddr] 
   FOR DELETE 
   NOT FOR REPLICATION
AS 

---

DECLARE @Count int
SET @Count = @@ROWCOUNT;
       
IF @Count > 1000
BEGIN
	RAISERROR(''Cannot DELETE more than 1 000 records of [SoldAddr] at one time.'',16,1) 
	ROLLBACK TRANSACTION
	RETURN;
END

---

if (select count(*) from deleted where SoldCode < 10 ) > 0 
  begin 
    rollback transaction 
    RAISERROR(''You cannot delete first 9 SoldCodes. (source = [SoldAddr_Delete])'', 16, 1)
  end
' 
GO
ALTER TABLE [dbo].[SoldAddr] ENABLE TRIGGER [SoldAddr_DELETE]
GO
/****** Object:  Trigger [dbo].[SoldAddr_INSERT]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[SoldAddr_INSERT]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<David Kirchner>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[SoldAddr_INSERT]
   ON [dbo].[SoldAddr] 
   FOR INSERT 
   NOT FOR REPLICATION
AS 
BEGIN
	PRINT ''Trigger Start [SoldAddr_INSERT]'';

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

		INSERT INTO [dbo].[SoldAddrCode]
			(SoldCode,Customer,OldCode)
			SELECT i.SoldCode, i.Customer, d.SoldCode 
			FROM inserted i, deleted d 
			WHERE i.ID = d.ID 
			AND i.SoldCode <> d.SoldCode


	--Email

	--IF UPDATE(Company) OR UPDATE(Addr1)  OR UPDATE(Addr2)  OR UPDATE(City)  OR UPDATE(ST)  OR UPDATE(zip)  OR UPDATE(Country)  OR UPDATE(Contact) 
	IF (SELECT COUNT(*) FROM inserted WHERE ISNULL(inserted.SoldCode,0) > 0 ) > 0
	begin
		DECLARE @iSoldCode INT
		SELECT TOP 1 @iSoldCode = soldcode FROM inserted 

		DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
		DECLARE @Body varchar(4000)
	
		SELECT @Body = ''Sold to table has a new entry, SoldCode: ''
			+RTRIM(CAST(@iSoldCode AS CHAR))+'' on ''+RTRIM(CAST(GETDATE()AS CHAR))+''.''+CHAR(10)+CHAR(13)
			FROM inserted;

		SET @Body = @Body+''Please verify that the ordering company will allow material to be shipped to this address.''+CHAR(10)+CHAR(13)
		SET @Body = @Body+''User ''+RTRIM(suser_sname())+CHAR(10)+CHAR(13)

		DECLARE @soldcode decimal(10, 0)
		DECLARE	@company VARCHAR(30)
		DECLARE @addr1 VARCHAR(30)
		DECLARE @addr2 VARCHAR(30)
		DECLARE @city VARCHAR(20)
		DECLARE @st VARCHAR(2)
		DECLARE @zip VARCHAR(12)
		DECLARE @country VARCHAR(15)
		DECLARE @contact VARCHAR(20)
		DECLARE @telephone VARCHAR(12)
		DECLARE @fax_number VARCHAR(12)
		DECLARE @email VARCHAR(60)
		DECLARE @customer VARCHAR(20)
		DECLARE @NoNoiseName VARCHAR(100)

		SELECT TOP 1 @soldcode=ISNULL(soldcode,0), @Company=ISNULL(Company,''''), @Addr1=ISNULL(Addr1,''''), @Addr2=ISNULL(Addr2,''''), @City=ISNULL(City,''''), @ST=ISNULL(ST,''''), @Zip=ISNULL(Zip,'''') 
			, @Country=ISNULL(Country,''''), @Contact=ISNULL(Contact,''''), @Telephone=ISNULL(Telephone,''''), @Fax_Number=ISNULL(Fax_Number,''''), @Email=ISNULL(Email,'''')
			, @Customer=ISNULL(Customer,''''), @NoNoiseName = ISNULL(NoNoiseName,'''')
			FROM inserted --WHERE Customer LIKE @Customer
			--WHERE UPDATE(Company) OR UPDATE(Addr1)  OR UPDATE(Addr2)  OR UPDATE(City)  OR UPDATE(ST)  OR UPDATE(zip)  OR UPDATE(Country)  OR UPDATE(Contact) 
			WHERE SoldCode = @iSoldCode

		SET @Body = ISNULL(@Body,'''') + CHAR(13)+''Billing Address:''+CHAR(13)
		SET @Body = ISNULL(@Body,'''') + ''soldcode=''+CHAR(9)+CAST(@soldcode AS CHAR)+CHAR(13)
		SET @Body = ISNULL(@Body,'''') + ''Company=''+CHAR(9)+@Company+CHAR(13)

		IF LEN(@Company) > 1
			begin
				DECLARE @cCleanPara	VarChar(4000)
				SET @cCleanPara = REPLACE(@Company,'' '', ''+'');
				SET @Body = @body +''"''+dbo.f_Reportlink_CHAR(''CompanyInfo'',@cCleanPara)+''"''+CHAR(10)+CHAR(13)
			end

		SET @Body = ISNULL(@Body,'''') + ''Addr1=''+CHAR(9)+CHAR(9)+ISNULL(@Addr1,'' '')+CHAR(13)
		SET @Body = @Body + ''Addr2=''+CHAR(9)+CHAR(9)+@Addr2+CHAR(13)
		SET @Body = @Body + ''City=''+CHAR(9)+CHAR(9)+@City+CHAR(13)
		SET @Body = @Body + ''ST=''+CHAR(9)+CHAR(9)+@ST+CHAR(13)
		SET @Body = ISNULL(@Body,'''') + ''Zip=''+CHAR(9)+CHAR(9)+@Zip+CHAR(13)
		SET @Body = ISNULL(@Body,'''') + ''Country=''+CHAR(9)+@Country+CHAR(13)
		SET @Body = ISNULL(@Body,'''') + ''Contact=''+CHAR(9)+@Contact+CHAR(13)
		SET @Body = ISNULL(@Body,'''') + ''Telephone=''+CHAR(9)+@Telephone+CHAR(13)
		SET @Body = ISNULL(@Body,'''') + ''Fax_Number=''+CHAR(9)+@Fax_Number+CHAR(13)
		SET @Body = ISNULL(@Body,'''') + ''Email=''+CHAR(9)+CHAR(9)+@Email+CHAR(13)+CHAR(13)
		SET @Body = ISNULL(@Body,'''') + ''CustomerID=''+CHAR(9)+@Customer+CHAR(13)
		IF LEN(@Customer) > 1
			SET @Body = ISNULL(@Body,'''') +''"''+ dbo.f_Reportlink_CHAR(''CustomerID'',@Customer)+''"''+CHAR(10)+CHAR(13)

		SET @Body = ISNULL(@Body,'''') + ''NoNoiseName=''+CHAR(9)+@NoNoiseName+CHAR(13)
		IF LEN(@NoNoiseName) > 1
				SET @Body = ISNULL(@Body,'''') +''"''+ dbo.f_Reportlink_CHAR(''CustomerInfo_NoNoise'',@NoNoiseName)+''"''+CHAR(10)+CHAR(13)
		
		IF LEN(ISNULL(@Body,'''')) < 10
			SET @Body = ''Lost data for SoldCode insert SoldCode:'' + CAST(@iSoldCode AS CHAR(10)) +CHAR(13)


		SET @Body = ISNULL(@Body,'''') + '' Trigger SoldAddr_INSERT''
			+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.SoldAddr_INSERT ''
	
		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = ''NewShipAddr@ERP_1s.com'', 
			 @SubjectEmail = ''Inserted SoldTo Billing Address just now'',
			 @BodyEmail = @Body,
			 @BodyType = ''TEXT''		
			 
	end
END
' 
GO
ALTER TABLE [dbo].[SoldAddr] ENABLE TRIGGER [SoldAddr_INSERT]
GO
/****** Object:  Trigger [dbo].[SoldAddr_UPDATE]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[SoldAddr_UPDATE]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[SoldAddr_UPDATE]
   ON [dbo].[SoldAddr] 
   FOR UPDATE 
   NOT FOR REPLICATION
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	
	IF UPDATE(Company) 
		IF ((SELECT TRIGGER_NESTLEVEL()) < 2)
		BEGIN
			UPDATE s SET NoNoiseName = dbo.f_NoNoiseName(i.Company) 
				FROM dbo.SoldAddr s 
				INNER JOIN inserted i ON s.SoldCode = i.SoldCode
				WHERE UPDATE(Company)
		END
	


	IF UPDATE(SoldCode) 
	begin
	
		if (select count(*) from deleted where SoldCode < 10 AND UPDATE(SoldCode) ) > 0 
		begin 
			rollback transaction 
			RAISERROR(''You cannot Change SoldCodes records less than 10. (source = [SoldAddr_Update])'', 16, 1)
		end
		
		
		INSERT INTO [dbo].[SoldAddrCode]
			(SoldCode,Customer,OldCode)
			SELECT i.SoldCode, i.Customer, d.SoldCode 
			FROM inserted i, deleted d 
			WHERE i.ID = d.ID 
			AND i.SoldCode <> d.SoldCode
			
	end


END
' 
GO
ALTER TABLE [dbo].[SoldAddr] ENABLE TRIGGER [SoldAddr_UPDATE]
GO
/****** Object:  Trigger [dbo].[SourcePH_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[SourcePH_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[SourcePH_Insert] 
ON [dbo].[SourcePH] 
	FOR INSERT 
	NOT FOR REPLICATION
AS

PRINT ''Start trigger [SourcePH_Insert]'';

--PRINT ''UPDATE dbo.Sources SET SourcePD.ID ''
--UPDATE dbo.Sources 
--	SET ID = inserted.ID
--	FROM dbo.Sources
--	INNER JOIN inserted ON Sources.ID_Sources = inserted.ID_Sources


PRINT ''End trigger [SourcePH_Insert]'';' 
GO
ALTER TABLE [dbo].[SourcePH] ENABLE TRIGGER [SourcePH_Insert]
GO
/****** Object:  Trigger [dbo].[STAR_Inventory_StockChanges_After_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[STAR_Inventory_StockChanges_After_Insert]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Brandon van de Venter
-- Create date: 3/28/2021
-- Description:	Tracks stock changes and updates inventory
-- =============================================
CREATE TRIGGER [dbo].[STAR_Inventory_StockChanges_After_Insert] 
   ON  [dbo].[STAR_Inventory_StockChanges]
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	UPDATE si
	SET si.Stock = (si.Stock + inserted.StockChange)
	FROM dbo.[STAR_Inventory] si
	JOIN inserted on si.ID = inserted.InventoryID
END
' 
GO
ALTER TABLE [dbo].[STAR_Inventory_StockChanges] ENABLE TRIGGER [STAR_Inventory_StockChanges_After_Insert]
GO
/****** Object:  Trigger [dbo].[StartingStock_Delete]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[StartingStock_Delete]'))
EXEC dbo.sp_executesql @statement = N'Create TRIGGER [dbo].[StartingStock_Delete] ON [dbo].[StartingStock] 
	FOR DELETE  
	--NOT FOR REPLICATION
AS
     
PRINT ''Trigger Start [StartingStocks_Delete]'';   

--Remove from StartingStock! if SalesNum=0

PRINT ''Trigger  End  [StartingStock_Delete]'';
' 
GO
ALTER TABLE [dbo].[StartingStock] ENABLE TRIGGER [StartingStock_Delete]
GO
/****** Object:  Trigger [dbo].[StockLst_Detail_After_Delete]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Detail_After_Delete]'))
EXEC dbo.sp_executesql @statement = N'CREATE  TRIGGER [dbo].[StockLst_Detail_After_Delete] ON [dbo].[StockLst_Detail] 
	AFTER DELETE 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [StockLst_Detail_After_Delete]'';

---
PRINT '' UPDATE dbo.StockLst_Master SET MWeight [StockLst_Detail_After_Delete]''
UPDATE dbo.StockLst_Master 
	SET MWeight = dbo.f_GetMWeight_StockLst_ID(deleted.ID)
	,mS_QTY  = dbo.f_Calc_mS_QTY_StockLst_ID(deleted.ID)
	FROM dbo.StockLst_Master
	INNER JOIN deleted ON Stocklst_Master.ID = deleted.ID
	WHERE Stocklst_Master.ID = deleted.ID;


	--+''  ''+RTRIM(suser_sname())+CHAR(13)
PRINT ''Trigger  End  [StockLst_Detail_After_Delete]'';
' 
GO
ALTER TABLE [dbo].[StockLst_Detail] ENABLE TRIGGER [StockLst_Detail_After_Delete]
GO
/****** Object:  Trigger [dbo].[StockLst_Detail_After_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Detail_After_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[StockLst_Detail_After_Insert] 
ON [dbo].[StockLst_Detail] 
	AFTER INSERT 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [StockLst_Detail_After_Insert]'';

---
PRINT '' UPDATE dbo.StockLst_Master SET MWeight [StockLst_Detail_After_Insert]''

UPDATE dbo.StockLst_Master 
	SET MWeight = dbo.f_GetMWeight_StockLst_ID(inserted.ID)
	,mS_QTY  = dbo.f_Calc_mS_QTY_StockLst_ID(inserted.ID)
	FROM dbo.StockLst_Master
	INNER JOIN inserted ON Stocklst_Master.ID = inserted.ID
	WHERE Stocklst_Master.ID = inserted.ID;


--Email
/*
IF EXISTS( SELECT * FROM inserted WHERE LEFT(inserted.Length,20) = inserted.Descript AND LEN(inserted.Descript) > 7 )
	begin

	DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
	DECLARE @Body varchar(4000)
	
	--SELECT dbo.f_HTML_HPA_Header()
	--SET @Body = dbo.f_HTML_HPA_Header()
	SET @Body = ''<!DOCTYPE html> <html><head><title>HPA Notice</title></head><body>''

	SELECT TOP 1 @Body = @Body+''StockLst Detail could have a problem. ''+''</br>''
		+''<p> Description is like Length -Probably a duplicate!''+''</p></br>''

		+''<p> -----Length: ''+RTRIM(inserted.Length)+''</p>''
		+''<p> Description: ''+RTRIM(inserted.Descript)+''</p>''+''</br>''

		+''<p> Stock Master ''+ISNULL(dbo.f_HTML_link_StockLstID(inserted.ID),'''')+''</p>''
		+''<p> Stock Detail ''+ISNULL(dbo.f_HTML_link_StockLstID_Detail(inserted.ID_Detail),'''')+''</p>''
		+''<p> ReceivingID  ''+ISNULL(dbo.f_HTML_link_ReceivingID(inserted.ReceivingID),'''')+''</p></br>''
		FROM inserted
		WHERE LEFT(inserted.Length,20) = inserted.Descript AND LEN(inserted.Descript) > 7 

	SET @Body = @Body +''<p>''+ SUSER_SNAME()+'' on ''+RTRIM(CAST(GETDATE()AS CHAR))+''</p></br>''

	SET @Body = @Body +''<p>''+@@SERVERNAME+ '' Trigger StockLst_Detail_After_Insert ''+''</p></br>''


	SET @Body = @Body +''</body></html>''

	EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
		 @SubjectEmail = ''Inserted Same Description and Length '',
		 @BodyEmail = @Body,
		 @BodyType = ''HTML''		

	end
*/

---------------------------------------------
INSERT dbo.StockLst_Detail_Inserted
		( Master_ID, ID_Detail, [Who], [When]  )
	SELECT ISNULL(ID,0) AS Master_ID, ID_Detail, suser_sname(), GetDate() FROM inserted
		WHERE ISNULL(ID_Detail ,0) > 0


---------------------------------------------
PRINT ''Trigger  End  [StockLst_Detail_After_Insert]'';
' 
GO
ALTER TABLE [dbo].[StockLst_Detail] ENABLE TRIGGER [StockLst_Detail_After_Insert]
GO
/****** Object:  Trigger [dbo].[StockLst_Detail_After_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Detail_After_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[StockLst_Detail_After_Update] 
ON [dbo].[StockLst_Detail] 
	AFTER UPDATE 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [StockLst_Detail_After_Update]'';

--To track a change, insert a Process Detail that explains the change
--INSERT INTO dbo.StockLst_Process_Detail (ID_Detail,[What],WO,SOitem ) VALUES (9,''EDIT'',0,'''') 

DECLARE @SOitem CHAR(10)
DECLARE @POitem CHAR(12)
DECLARE @nID_Detail_Process INT = 0
DECLARE @dtWHEN DateTime = GetDate()
DECLARE @cWho VARCHAR(255) = SUSER_SNAME()

IF ( UPDATE(PC) 
	or UPDATE(Size_H) 
	or UPDATE(Dim1) or UPDATE(Size_L) 
	or UPDATE(Dim2) or UPDATE(Dim3) 
	or UPDATE([Weight]) or UPDATE(Descript) 
	or UPDATE([Length]) or UPDATE(CostValue) 
	or UPDATE(Unit) or UPDATE(Quarantine)
	or UPDATE(S_QTY) or UPDATE(S_P) or UPDATE(S_Total)
	or UPDATE([Location]) )
begin
	
	PRINT '' INSERT dbo.Ar_StockLst_Detail_History from Before Edit.  [StockLst_Detail_After_Update]'';

	INSERT dbo.Ar_StockLst_Detail_History 
		([ID_Detail_Process],[Who],[What],[When],
		[ProcessValue],[size_h],[size_l],[pc],
		[dim1],[dim2],[dim3],[length],[weight],
		[costvalue],[descript],	[location],
		[floorstatus],[class],[unit],
		[RandLen],[InvCheck],[id],[id_detail],[ReceivingID],
		[InvoiceValue],	[AccountingCheck],[Quarantine],
		[S_QTY],[S_P],[S_Total],[S_PU],[Prime],[WO])
			SELECT 0,@cWho,''BEFOREEDIT'',@dtWHEN,
		ISNULL(deleted.S_QTY * deleted.S_P,0),	deleted.[size_h],deleted.[size_l],deleted.[pc],
		deleted.[dim1],deleted.[dim2],deleted.[dim3],deleted.[length],deleted.[weight],
		deleted.[costvalue],deleted.[descript],	deleted.[location],
		deleted.[floorstatus],deleted.[class],deleted.[unit],
		deleted.[RandLen],deleted.[InvCheck],deleted.[id],deleted.[id_detail],deleted.[ReceivingID],
		deleted.[InvoiceValue],	deleted.[AccountingCheck],deleted.[Quarantine],
		deleted.[S_QTY],deleted.[S_P],deleted.[S_Total],deleted.[S_PU],deleted.[Prime],deleted.[WO]
			FROM deleted

	PRINT '' INSERT dbo.Ar_StockLst_Detail_History from deleted.  [StockLst_Detail_After_Update]'';

	INSERT dbo.Ar_StockLst_Detail_History 
		([ID_Detail_Process],[Who],[What],[When],
		[ProcessValue],[size_h],[size_l],[pc],
		[dim1],[dim2],[dim3],[length],[weight],
		[costvalue],[descript],	[location],
		[floorstatus],[class],[unit],
		[RandLen],[InvCheck],[id],[id_detail],[ReceivingID],
		[InvoiceValue],	[AccountingCheck],[Quarantine],
		[S_QTY],[S_P],[S_Total],[S_PU],[Prime],[WO])
			SELECT 0,@cWho,''AFTEREDIT'',@dtWHEN,
		ISNULL(inserted.S_QTY * inserted.S_P,0),	inserted.[size_h],inserted.[size_l],inserted.[pc],
		inserted.[dim1],inserted.[dim2],inserted.[dim3],inserted.[length],inserted.[weight],
		inserted.[costvalue],inserted.[descript],	inserted.[location],
		inserted.[floorstatus],inserted.[class],inserted.[unit],
		inserted.[RandLen],inserted.[InvCheck],inserted.[id],inserted.[id_detail],inserted.[ReceivingID],
		inserted.[InvoiceValue],	inserted.[AccountingCheck],inserted.[Quarantine],
		inserted.[S_QTY],inserted.[S_P],inserted.[S_Total],inserted.[S_PU],inserted.[Prime],inserted.[WO]
			FROM inserted
			
		PRINT '' INSERT dbo.Ar_StockLst_Detail_History from inserted.  [StockLst_Detail_After_Update]'';

	--Update if Process DETAIL is found
	IF EXISTS(SELECT * FROM dbo.StockLst_Process_Detail WHERE Who = @cWho 
				AND ( What=''EDIT'' or What=''Sell Stock'' or What=''Work Order'' or What=''CANCELLED'' or what=''CORRECTION'') )
		begin

		PRINT '' found Process Detail''
		SELECT TOP 1 @nID_Detail_Process = ID_Detail_Process 
		  FROM dbo.StockLst_Process_Detail 
		  WHERE Who = @cWho AND ( What=''EDIT'' or What=''Sell Stock'' or What=''Work Order'' or What=''CANCELLED'' or what=''CORRECTION'')

		PRINT ''nID_Detail_Process = ''+CAST(@nID_Detail_Process AS CHAR(10))+''  [StockLst_Detail_After_Update]'';
		
		PRINT '' UPDATE dbo.Ar_StockLst_Detail_History from deleted.  [StockLst_Detail_After_Update]'';

		UPDATE dbo.Ar_StockLst_Detail_History 
			SET ID_Detail_Process = SPD.ID_Detail_Process
			FROM dbo.Ar_StockLst_Detail_History DH
			INNER JOIN deleted ON DH.ID_Detail = deleted.ID_Detail
			INNER JOIN dbo.StockLst_Process_Detail SPD ON deleted.ID_Detail = SPD.ID_Detail
				WHERE SPD.Who = @cWho 
				AND ( SPD.What=''EDIT'' or SPD.What=''Sell Stock'' or SPD.What=''Work Order'' or SPD.What=''CANCELLED'' or SPD.what=''CORRECTION'')
				AND DH.ID_Detail_Process=0
				AND DH.[Who] = @cWho
				AND DH.[What] = ''BEFOREEDIT''
				AND DH.[When] = @dtWHEN 
				
--( What = ''EDIT'' or What = ''Sell Stock'' )		
		PRINT '' UPDATE dbo.Ar_StockLst_Detail_History from inserted.   [StockLst_Detail_After_Update]'';
		
		UPDATE dbo.Ar_StockLst_Detail_History 
			SET ID_Detail_Process = SPD.ID_Detail_Process
			FROM dbo.Ar_StockLst_Detail_History DH
			INNER JOIN inserted ON DH.ID_Detail = inserted.ID_Detail
			INNER JOIN dbo.StockLst_Process_Detail SPD ON inserted.ID_Detail = SPD.ID_Detail
				WHERE SPD.Who = @cWho 
				AND ( SPD.What=''EDIT'' or SPD.What=''Sell Stock'' or SPD.What=''Work Order'' or SPD.What=''CANCELLED'' or SPD.what=''CORRECTION'')
				AND DH.ID_Detail_Process=0
				AND DH.[Who] = @cWho
				AND DH.[What] = ''AFTEREDIT''
				AND DH.[When] = @dtWHEN 
--( What=''EDIT'' or What=''Sell Stock'' or What=''Work Order'' or What=''CANCELLED'' or what=''CORRECTION'')
--( SPD.What=''EDIT'' or SPD.What=''Sell Stock'' or SPD.What=''Work Order'' or SPD.What=''CANCELLED'' or SPD.what=''CORRECTION'')

		----

		PRINT '' DELETE FROM dbo.StockLst_Process_Detail WHERE Who = ''+RTRIM(@cWho)+'' AND ( What = EDIT or What = Sell Stock )	    [StockLst_Detail_Update]''
		DELETE FROM dbo.StockLst_Process_Detail 
			WHERE Who = @cWho 
			AND ( What=''EDIT'' or What=''Sell Stock'' or What=''Work Order'' or What=''CANCELLED'' or what=''CORRECTION'');
		
		end

	---

	PRINT '' UPDATE dbo.StockLst_Master SET MWeight  [StockLst_Detail_After_Update]'';

	UPDATE dbo.StockLst_Master 
		SET MWeight = dbo.f_GetMWeight_StockLst_ID(inserted.ID)
		  ,mS_QTY  = dbo.f_Calc_mS_QTY_StockLst_ID(inserted.ID)
		FROM dbo.StockLst_Master
		INNER JOIN inserted ON Stocklst_Master.ID = inserted.ID
		WHERE Stocklst_Master.ID = inserted.ID

	SELECT @SOitem = SOitem, @POitem = PO_Item 
	   FROM dbo.Ar_StockLst_Process_History
	   WHERE ID_Detail_Process = @nID_Detail_Process
	
	--PRINT ''get WeightChange,PcChange,SOitem''

	/*
	PRINT '' INSERT dbo.Ar_StockLst_Process_GS_History.  [StockLst_Detail_After_Update]'';
	INSERT dbo.Ar_StockLst_Process_GS_History 
		( [Who], [what] ,[When],	
		[SOitem], [POitem],
		[comment], [process_id], 
		[PWeight], 
		[PPc],
		[id_detail], [id_detail_process], [Validated],
		[S_QTY], [S_P], [S_PU] )
	  SELECT SUSER_SNAME(),''UPDATE'',GETDATE(),
		SPH.SOitem, SPH.PO_item,
		''StockLst_Detail Update'',''GS CHANGE'',
		(deleted.[Weight] - inserted.[Weight]),
		(deleted.[Pc] - inserted.[Pc]),
		inserted.[id_detail],@nID_Detail_Process,0,
		inserted.[S_QTY],inserted.[S_P],inserted.[S_PU]
		FROM inserted
		INNER JOIN deleted ON deleted.ID_Detail = inserted.ID_Detail
		INNER JOIN dbo.StockLst_Process_Detail SPD ON inserted.ID_Detail = SPD.ID_Detail
		INNER JOIN dbo.Ar_StockLst_Process_History SPH ON SPD.ID_Detail_Process = SPH.ID_Detail_Process
			WHERE SPD.[Who] = SUSER_SNAME() AND SPD.[What] = ''EDIT''

	PRINT '' INSERT dbo.Ar_StockLst_Process_GS_History [StockLst_Detail_After_Update]''
	*/		
		---

	--Lost Receiving ID  ?
	----dbo.StockLst_Detail
	IF EXISTS( SELECT * FROM inserted, deleted 
		WHERE inserted.ID = deleted.ID
			AND inserted.ID_Detail = deleted.ID_Detail
			AND ISNULL(inserted.ReceivingID,0)<1
			AND ISNULL(deleted.ReceivingID,0)>0 )
	begin
		--Lost Receiving ID  ?!?!? --Sometimes NOT lost !?!?!??!?!?!
		DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
		DECLARE @Body varchar(4000)
		DECLARE @ReceivingID INT, @ReceivingIDNew INT
		DECLARE @ID INT
		DECLARE @ID_Detail INT
		
		SELECT TOP 1 @ReceivingID = deleted.ReceivingID
			,@ReceivingIDNew = inserted.ReceivingID
			,@ID = deleted.ID
			,@ID_Detail = deleted.ID_Detail
			FROM inserted,deleted 
			WHERE inserted.ID = deleted.ID
				AND inserted.ID_Detail = deleted.ID_Detail
				AND ISNULL(inserted.ReceivingID,0)=0 
				AND ISNULL(deleted.ReceivingID,0)>0 
	
		PRINT '' Send a -Removed ReceivingID- Email    [StockLst_Detail_Update]''
	
		SET @Body = +CHAR(10)+RTRIM(@cWho)+'' updated the StockLst and that removed the ReceivingID: ''+CAST(@ReceivingID AS CHAR(10))+'' ''
			+CHAR(13)+''New Receiving ID: ''+CAST(@ReceivingIDNew AS CHAR(10)) +''''
			+CHAR(13)+''for StockLst ID: ''+CAST(@ID AS CHAR(10)) +''''
			+CHAR(13)+'', ID_Detail: ''+RTRIM(CAST(@ID_Detail AS CHAR(10))) +''.''
			+CHAR(13)+''see ID Report here ''+ ISNULL(dbo.f_HTML_link_StockLstID(@ID),''-error-'') +'' ''
			+CHAR(10)+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.StockLst_Detail_After_Update ''
			
		EXEC dbo.p_eMail_Send
			 @FromEmail = @cEmailFrom, 
			 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
			 @SubjectEmail = ''StockLst update removed the ReceivingID'',
			 @BodyEmail = @Body,
			 @BodyType = ''TEXT''

	end

end


PRINT ''Trigger  End  [StockLst_Detail_After_Update]'';

/*  Clean up Code
SELECT D.S_QTY ,dbo.f_Calc_QTY(Alloy,Form,PC,Dim1,Dim2,Dim3) AS f_Calc_QTY
,D.Weight ,dbo.f_Calc_Weight(Alloy,Form,PC,Dim1,Dim2,Dim3) AS f_Calc_Weight
,M.Alloy,M.Form ,PC,Dim1,Dim2,Dim3,D.RandLen
,InvCheck,M.ID,ID_Detail
FROM dbo.Stocklst_Detail D
INNER JOIN dbo.StockLst_Master M ON D.ID = M.ID
--WHERE D.S_QTY > dbo.f_Calc_QTY(Alloy,Form,PC,Dim1,Dim2,Dim3)*1.2
WHERE D.S_QTY*1.2 < dbo.f_Calc_QTY(Alloy,Form,PC,Dim1,Dim2,Dim3)
AND D.S_QTY > 15 AND M.Form = ''10'' 
--ORDER BY  D.S_QTY DESC

UPDATE dbo.Stocklst_Detail SET S_QTY = dbo.f_Calc_QTY(Alloy,Form,PC,Dim1,Dim2,Dim3)
FROM dbo.Stocklst_Detail D
INNER JOIN dbo.StockLst_Master M ON D.ID = M.ID
--WHERE D.S_QTY > D.Weight*1.1 OR D.S_QTY*1.1 < D.Weight
WHERE D.S_QTY > dbo.f_Calc_QTY(Alloy,Form,PC,Dim1,Dim2,Dim3)*1.2
AND D.S_QTY > 15 AND M.Form = ''10''
*/
' 
GO
ALTER TABLE [dbo].[StockLst_Detail] ENABLE TRIGGER [StockLst_Detail_After_Update]
GO
/****** Object:  Trigger [dbo].[StockLst_Detail_Delete]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Detail_Delete]'))
EXEC dbo.sp_executesql @statement = N'CREATE   TRIGGER [dbo].[StockLst_Detail_Delete] ON [dbo].[StockLst_Detail] 
	FOR DELETE 
	NOT FOR REPLICATION
AS

DECLARE @Count int
SET @Count = @@ROWCOUNT;
        
IF @Count > 100
BEGIN
    RAISERROR(''Cannot DELETE more than 100 records of Lst_Detail at one time.'',16,1) 
    ROLLBACK TRANSACTION
    RETURN;
END

PRINT ''Trigger Start [StockLst_Detail_Delete]'';

---
PRINT '' SELECT @nID_Detail_Process = ID_Detail_Process FROM dbo.StockLst_Process_Detail   [StockLst_Detail_Delete]''
DECLARE @nID_Detail_Process INT = 0

SELECT TOP 1 @nID_Detail_Process = ID_Detail_Process 
  FROM dbo.StockLst_Process_Detail 
  WHERE Who = SUSER_SNAME()
  AND ( What = ''DELETE'' OR What = ''REMOVED'' OR What = ''CONSUMED'' )

PRINT ''ID_Detail_Process = '' +CAST(@nID_Detail_Process AS CHAR(10))


--Warn other Salesmen their stock is gone.  Look for Process that used ID_Detail
IF ISNULL( 
	(SELECT P.ID_Detail FROM dbo.StockLst_Process P
	JOIN deleted ON deleted.ID_Detail = P.ID_Detail
	WHERE P.AllowSub = ''N''
	AND P.Process_ID = ''SELECTED''
/*	AND 
	 ( NOT
	  ( P.SOitem IN 
	   (SELECT DISTINCT SOitem 
        FROM dbo.Ar_StockLst_Process_History
        WHERE ID_Detail_Process IN 
	     (SELECT DISTINCT ID_Detail_Process 
          FROM dbo.StockLst_Process_Detail 
          WHERE Who = SUSER_SNAME() AND ( What = ''DELETE'' OR What = ''REMOVED'' OR What = ''CONSUMED'' OR What = ''Sell Stock'' )
         )
       )	
	  )
	 OR
	  ( P.WO IN 
	   (SELECT DISTINCT WO
        FROM dbo.Ar_StockLst_Process_History
        WHERE ID_Detail_Process IN 
	     (SELECT DISTINCT ID_Detail_Process 
          FROM dbo.StockLst_Process_Detail 
          WHERE Who = SUSER_SNAME() AND ( What = ''DELETE'' OR What = ''REMOVED'' OR What = ''CONSUMED'' OR What = ''Sell Stock'' )
        )
       )
	  ) 
	 )   
*/
),0) > 0
begin
	PRINT '' Found Selected Stock process that is dependant on the consumed stock Detail. [StockLst_Detail_Delete]''

	DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
	DECLARE @Body varchar(4000)

	SELECT ROW_NUMBER() OVER(ORDER BY ID_Detail_Process) AS RowID
	  ,P.ID_Detail_Process
	  ,P.ID_Detail
	  ,P.PO_item
	  ,P.SOitem
	  ,P.WO
	  ,P.Process_ID
		INTO #tmpStockLst_Process FROM dbo.StockLst_Process P
		JOIN deleted ON deleted.ID_Detail = P.ID_Detail
		WHERE P.AllowSub = ''N''
		--AND P.Process_ID = ''SELECTED''
/*		AND 
		 ( NOT
		  ( P.SOitem IN 
		   (SELECT DISTINCT SOitem 
		    FROM dbo.Ar_StockLst_Process_History
		    WHERE ID_Detail_Process IN 
		     (SELECT DISTINCT ID_Detail_Process 
		      FROM dbo.StockLst_Process_Detail 
		      WHERE Who = SUSER_SNAME() AND ( What = ''DELETE'' OR What = ''REMOVED'' OR What = ''CONSUMED'' )
		     )
		   )	
		  )
		 OR
		  ( P.WO IN 
		   (SELECT DISTINCT WO
		    FROM dbo.Ar_StockLst_Process_History
		    WHERE ID_Detail_Process IN 
		     (SELECT DISTINCT ID_Detail_Process 
		      FROM dbo.StockLst_Process_Detail 
		      WHERE Who = SUSER_SNAME() AND ( What = ''DELETE'' OR What = ''REMOVED'' OR What = ''CONSUMED'' )
		    )
		   )
		  )
		 )
		 */
		ORDER BY ID_Detail_Process
	
	DECLARE @nTmpID_Detail_Process INT
	DECLARE @nTmpID_Detail INT
	DECLARE @cProcess_ID CHAR(10) = ''''
	DECLARE @NumberRecords int, @RowCount int
	DECLARE @SOitem CHAR(10)
	DECLARE @POitem CHAR(12)
	DECLARE @WO INT = 0

	-- Get the number of records in the temporary table
	SET @NumberRecords = @@ROWCOUNT
	SET @RowCount = 1
	
	-- loop through all records in the temporary table #tmpStockLst_Process
	-- using the WHILE loop construct
	WHILE @RowCount <= @NumberRecords
	BEGIN
		SELECT @nTmpID_Detail_Process = ID_Detail_Process
			,@nTmpID_Detail = ID_Detail 
			,@POitem = PO_item
			,@SOitem = SOitem
			,@WO = ISNULL(WO,0)
			,@cProcess_ID = Process_ID
			FROM #tmpStockLst_Process
			WHERE RowID = @RowCount

		PRINT '' Send Salesman Warning that their selected Stock process was consumed.  [StockLst_Detail_Delete]''
		IF ISNULL(@nTmpID_Detail_Process,0) > 0
			EXEC dbo.p_Warn_Stk_Deleted @nTmpID_Detail_Process, ''S'', @nTmpID_Detail, @SOitem, @WO
		

--		Send the Deleted ID to Email for Review.
Begin Try
			SET @Body = ''StockLst ID_Detail = ''+ CAST(@nTmpID_Detail AS CHAR(10))
			SET @Body=@Body+CHAR(13)+'' was DELETED and Process is Orphaned.''
			SET @Body=@Body+CHAR(13)+''nID_Detail_Process = ''+CAST(@nTmpID_Detail_Process AS CHAR(10))
			SET @Body=@Body+CHAR(13)+''Process_ID=''+@cProcess_ID
			SET @Body=@Body+CHAR(13)+''Entered by ''+RTRIM(suser_sname())+'' on ''+RTRIM(GETDATE())  
			SET @Body=@Body+CHAR(10)+CHAR(13)+@@SERVERNAME+'' TRIGGER dbo.StockLst_Detail_Delete '' 
	

			EXEC dbo.p_eMail_Send
				@FromEmail = @cEmailFrom, 
				@ToEmail = ''VFPprogramming@ERP_1s.com'', 
				@SubjectEmail = ''StockLst Detail Deleted.'',
				@BodyEmail = @Body,
				@BodyType = ''TEXT''

End Try
Begin Catch
End Catch

		IF ISNULL(@nTmpID_Detail,0) > 0
			begin

				Print ''Delete the Process that belonged to the Detail record being DELETED AND Process_ID = INCOMING.''

				DELETE FROM dbo.StockLst_Process 
					WHERE ID_Detail_Process IN 
					(SELECT P.ID_Detail_Process FROM dbo.StockLst_Process P
						INNER JOIN deleted ON deleted.ID_Detail = P.ID_Detail );


				/*DELETE FROM dbo.StockLst_Process 
					WHERE ID_Detail = @nTmpID_Detail 
					AND Process_ID = ''INCOMING''*/

				/*DELETE FROM dbo.StockLst_Process 
					WHERE ID_Detail = @nTmpID_Detail 
					AND Process_ID = ''Sell Stock''*/

			end


		SET @RowCount = @RowCount + 1
	END
	DROP TABLE #tmpStockLst_Process


	--end of block where ''SELECTED'' processes of the DELETED ID_Detail
end

---

---
PRINT '' INSERT dbo.Ar_StockLst_Detail_History FROM deleted.  [StockLst_Detail_Delete]''
INSERT dbo.Ar_StockLst_Detail_History 
	([ID_Detail_Process],
	[What],
	[When],
	[ProcessValue],
	[size_h],
	[size_l],
	[pc],
	[dim1],
	[dim2],
	[dim3],
	[length],
	[weight],
	[costvalue],
	[descript],
	[location],
	[floorstatus],
	[class],
	[unit],
	[randlen],
	[InvCheck],
	[id],
	[id_detail],
	[ReceivingID],
	[InvoiceValue],
    [LiveCheck],
    [AccountingCheck],
	[Quarantine],
	[S_QTY],
	[S_P],
	[S_Total],
	[S_PU],
	[Prime]
	,[WO])
SELECT  TOP 1
	SPH.ID_Detail_Process,
	''DELETE'',
	GetDate(),
	-(d.S_QTY * d.S_P),
	d.[size_h],
	d.[size_l],
	d.[pc],
	d.[dim1],
	d.[dim2],
	d.[dim3],
	d.[length],
	d.[weight],
	d.[costvalue],
	d.[descript],
	d.[location],
	d.[floorstatus],
	d.[class],
	d.[unit],
	d.[randlen],
	d.[InvCheck],
	d.[id],
	d.[id_detail],
	d.[ReceivingID],
	d.[InvoiceValue],
    d.[LiveCheck],
    d.[AccountingCheck],
	d.[Quarantine],
	d.[S_QTY],
	d.[S_P],
	d.[S_Total],
	d.[S_PU],
	d.[Prime]
	,d.[WO]
 FROM deleted d
 	INNER JOIN dbo.Ar_StockLst_Process_History SPH ON SPH.ID_Detail = d.ID_Detail 
--	WHERE SPH.[WHAT] = ''DELETE''
	ORDER BY SPH.[When] DESC

---************************************************************************************

--SOitem IN (SELECT DISTINCT SOitem FROM dbo.Ar_StockLst_Process_History WHERE ID_Detail_Process IN 
--(SELECT DISTINCT ID_Detail_Process FROM dbo.StockLst_Process_Detail WHERE Who = SUSER_SNAME() AND ( What = ''DELETE'' OR What = ''REMOVED'' OR What = ''CONSUMED'' )))

PRINT '' INSERT dbo.Ar_StockLst_Process_GS_History  [StockLst_Detail_Delete]''
INSERT dbo.Ar_StockLst_Process_GS_History 
	(What,
	[When],
	[SOitem],
	[comment],
	[process_id],
	[PWeight],
	[PPc],
	[id_detail],
	[id_detail_process],
	[Validated],
	[S_QTY],
	[S_P],
	[S_PU])
  SELECT 
    ''DELETE'',
	GetDate(),
	SPH.SOitem,
	''StockLst_Detail Delete'',
	''GS DELETE'',
	SD.[Weight],
	SD.[Pc],
	sd.[id_detail],
	SPH.ID_Detail_Process,
	0,
	SD.[S_QTY],
	SD.[S_P],
	SD.[S_PU]
    FROM  dbo.StockLst_Process_Detail SPD 
	INNER JOIN dbo.Ar_StockLst_Process_History SPH 
		ON SPH.ID_Detail_Process = SPD.ID_Detail_Process 
	INNER JOIN Stocklst_Detail SD 
		ON SD.ID_Detail = SPD.ID_Detail
	WHERE SPD.Who = SUSER_SNAME() AND ( SPD.What = ''DELETE'' OR SPD.What = ''REMOVED'' OR SPD.What = ''CONSUMED'' )


---

PRINT '' DELETE FROM dbo.StockLst_Process_Detail WHERE Who = SUSER_SNAME()  [StockLst_Detail_Delete]''
DELETE FROM dbo.StockLst_Process_Detail 
  WHERE Who = SUSER_SNAME()  AND 
  ( What = ''DELETE'' OR What = ''REMOVED'' OR What = ''CONSUMED'' )


PRINT ''Trigger  End  [StockLst_Detail_Delete]'';
' 
GO
ALTER TABLE [dbo].[StockLst_Detail] ENABLE TRIGGER [StockLst_Detail_Delete]
GO
/****** Object:  Trigger [dbo].[StockLst_Detail_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Detail_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[StockLst_Detail_Insert] 
ON [dbo].[StockLst_Detail] 
	FOR INSERT 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [StockLst_Detail_Insert]'';

-----------------------------------------------------

DECLARE @cProgram Char(60) = ''TRIGGER dbo.StockLst_Detail_Insert''
DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
DECLARE @Body varchar(4000) = ''''

IF EXISTS ( SELECT * FROM inserted 
			INNER JOIN dbo.PU ON inserted.S_PU = PU.PU 
			WHERE inserted.S_P > PU.Max_P )
BEGIN
	PRINT ''Found too high of a Unit Price (S_PU), check for $/Lb of 1000, $/FT of 5,000 and $/PC of 500,000''

	SELECT @Body = ''Cannot insert to dbo.StockLst_Detail, Found too high of a Unit Price.''+CHAR(13)
		+ RTRIM(PU.Unit) + '' is over the ''+CAST(PU.Max_P AS VARCHAR(25))+ '' max rule set in dbo.pU.'' + CHAR(13)
		+ ''ID= ''+CAST(ID AS CHAR(10))+'' ID_Detail= ''+CAST(ID_Detail AS CHAR(10))+'' PU=''+ CAST(S_PU AS CHAR(1)) +''  S_P=''+CAST(S_P AS VARCHAR(25))+CHAR(13)
		+''. ''+ISNULL([Length],'''') 
		FROM inserted
		INNER JOIN dbo.PU ON inserted.S_PU = PU.PU
			WHERE inserted.S_P > PU.Max_P
		

	SET @Body = @Body+RTRIM(suser_sname())+CHAR(13)
		+@@SERVERNAME+'' TRIGGER ERP_2.dbo.StockLst_Detail_Insert ''
			
	EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
		 @SubjectEmail = ''BAD Detail -High Price'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''
	
	RAISERROR( ''Insert into dbo.StockLst_Detail table failed. S_P above limit by dbo.PU.'', 16, -1)
	ROLLBACK TRANSACTION


	INSERT INTO ERP_2.dbo.Errors ([nerror],[mess1],[cprogram],[nlineno],[errordate],[MACHINE],[Revision],[Memo1]) 
		SELECT 0,''Cannot insert to dbo.StockLst_Detail, Found too high of a Unit Price.''
			,@cProgram
			,0
			,GetDate()
			,Suser_Sname()
			,@cProgram
			,@Body
		FROM inserted 
		INNER JOIN dbo.PU ON inserted.S_PU = PU.PU
			WHERE inserted.S_P > PU.Max_P

	
	RETURN

END



--- Done After
--PRINT '' UPDATE dbo.StockLst_Master SET MWeight    [StockLst_Detail_Insert]''
--UPDATE dbo.StockLst_Master 
--	SET MWeight = dbo.f_GetMWeight_StockLst_ID(inserted.ID)
--	FROM dbo.StockLst_Master
--	INNER JOIN inserted ON Stocklst_Master.ID = inserted.ID

---

PRINT '' INSERT dbo.Ar_StockLst_Detail_History FROM inserted.   [StockLst_Detail_Insert]''
INSERT dbo.Ar_StockLst_Detail_History 
	([ID_Detail_Process],
	[ProcessValue],
	[What],
	[size_h],
	[size_l],
	[pc],
	[dim1],
	[dim2],
	[dim3],
	[length],
	[weight],
	[costvalue],
	[descript],
	[location],
	[floorstatus],
	[class],
	[unit],
	[RandLen],
	[InvCheck],
	[id],
	[id_detail],
	[ReceivingID],
	[InvoiceValue],
	[AccountingCheck],
	[Quarantine],
	[S_QTY],
	[S_P],
	[S_Total],
	[S_PU],
	[Prime]
	,[WO])
SELECT 	ISNULL(spd.ID_Detail_Process,0),
	(inserted.S_QTY * inserted.S_P),
	''ADD'',
	inserted.[size_h],
	inserted.[size_l],
	inserted.[pc],
	inserted.[dim1],
	inserted.[dim2],
	inserted.[dim3],
	inserted.[length],
	inserted.[weight],
	inserted.[costvalue],
	inserted.[descript],
	inserted.[location],
	inserted.[floorstatus],
	inserted.[class],
	inserted.[unit],
	inserted.[RandLen],
	inserted.[InvCheck],
	inserted.[id],
	inserted.[id_detail],
	inserted.[ReceivingID],
	inserted.[InvoiceValue],
	inserted.[AccountingCheck],
	inserted.[Quarantine],
	inserted.[S_QTY],
	inserted.[S_P],
	inserted.[S_Total],
	inserted.[S_PU],
	inserted.[Prime]
	,inserted.[WO]
 FROM inserted
 LEFT OUTER JOIN dbo.StockLst_Process_Detail spd WITH(NOLOCK) ON inserted.ID = spd.ID 
		AND spd.Who = SUSER_SNAME() AND spd.What = ''ADD''

PRINT '' INSERT dbo.Ar_StockLst_Process_GS_History    [StockLst_Detail_Insert]''
 INSERT dbo.Ar_StockLst_Process_GS_History 
	(What,
	[When],
	[SOitem],
	[comment],
	[process_id],
	[PWeight],
	[PPc],
	[id_detail],
	[id_detail_process],
	[Validated],
	[S_QTY],
	[S_P],
	[S_PU])
  SELECT ''INSERT'',
	GETDATE(),
	spd.SOitem,
	''StockLst_Detail Insert'',
	''GS INSERT'',
	i.[Weight],
	i.[Pc],
	i.[id_detail],
	ISNULL(spd.ID_Detail_Process,0),
	0,
	i.[S_QTY],
	i.[S_P],
	i.[S_PU]
    FROM inserted i 
	LEFT OUTER JOIN dbo.StockLst_Process_Detail spd WITH(NOLOCK) ON i.ID = spd.ID 
		AND spd.Who = SUSER_SNAME() AND spd.What = ''ADD''

---
PRINT '' DELETE FROM dbo.StockLst_Process_Detail WHERE Who = SUSER_SNAME() AND What = ADD    [StockLst_Detail_Insert]''
DELETE FROM dbo.StockLst_Process_Detail 
  WHERE Who = SUSER_SNAME() AND What = ''ADD''

PRINT ''Trigger  End  [StockLst_Detail_Insert]'';
' 
GO
ALTER TABLE [dbo].[StockLst_Detail] ENABLE TRIGGER [StockLst_Detail_Insert]
GO
/****** Object:  Trigger [dbo].[StockLst_Detail_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Detail_Update]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.StockLst_Detail_Update    Script Date: 7/1/2004 1:56:06 PM ******/


CREATE TRIGGER [dbo].[StockLst_Detail_Update] 
ON [dbo].[StockLst_Detail] 
	FOR UPDATE 
	NOT FOR REPLICATION
AS


PRINT ''Trigger Start [StockLst_Detail_Update]'';
DECLARE @cProgram Char(60) = ''TRIGGER dbo.StockLst_Detail_Update''

DECLARE @Count int
SET @Count = @@ROWCOUNT;
        
IF @Count > 100
BEGIN
    RAISERROR(''Cannot UPDATE more than 100 records of Lst_Detail at one time.'',16,1) 
    ROLLBACK TRANSACTION
    RETURN;
END

------------------
DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
DECLARE @Body varchar(4000) = ''''


 --dbo.Stocklst_Detail WHERE ID_Detail = 35973
--PRINT ''Record Changed to dbo.David if ID_Detail = 35973''  --Wayne says length keeps changing
	

--------------------------
DECLARE @msg VARCHAR(250);
DECLARE @query varchar(2048);
DECLARE @cProfile_Name VarChar(50);


------------------------
-- 2 levels of bad S_P
-- IF over set limit in dbo.PU then STOP, Error the update!

IF EXISTS ( SELECT * FROM inserted 
			INNER JOIN dbo.PU ON inserted.S_PU = PU.PU 
			WHERE inserted.S_P > PU.Max_P )
BEGIN
	PRINT ''Found too high of a Unit Price (S_P), check for $/Lb of 1000, $/FT of 5,000 and $/PC of 500,000''

	SELECT @Body = ''Cannot Update into dbo.StockLst_Detail, Found too high of a Price.''+CHAR(13)
		+ ''P ''+RTRIM(CAST(S_P AS VARCHAR(25)))+ '' is over the ''+RTRIM(CAST(PU.Max_P AS VARCHAR(25)))+ '' max rule set in dbo.pU.'' + CHAR(13)
		+ ''ID= ''+CAST(ID AS CHAR(10))+'' ID_Detail= ''+CAST(ID_Detail AS CHAR(10))+'' PU=''+ CAST(S_PU AS CHAR(1)) +''  S_P=''+CAST(S_P AS VARCHAR(25))+CHAR(13)
		+''. ''+ISNULL([Length],'''') 
		FROM inserted
		INNER JOIN dbo.PU ON inserted.S_PU = PU.PU
			WHERE inserted.S_P > PU.Max_P

	SET @Body = @Body+CHAR(13)+RTRIM(suser_sname())+CHAR(13)
		+@@SERVERNAME+'' TRIGGER ERP_2.dbo.StockLst_Detail_Update ''
			
	EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
		 @SubjectEmail = ''BAD Detail Price'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''

	----------
/*	SET @msg = ''Please refer to the attached spread sheet for the report.'';  
	
	SET @query=''SELECT * FROM inserted 
			INNER JOIN dbo.PU ON inserted.S_PU = PU.PU 
			WHERE inserted.S_P > PU.Max_P'''';'';

	SET @cProfile_Name = dbo.f_Get_profile_name('''');

	EXEC msdb.dbo.sp_send_dbmail
		@profile_name = @cProfile_Name
		, @recipients = ''VFPprogramming@ERP_1s.com''
		, @subject = ''Found too high of a Unit Price (S_P)''
		, @body= @msg
		, @body_format = ''TEXT''
		, @query = @query
		, @execute_query_database = ''ERP_2''  
		, @attach_query_result_as_file = 1
		, @query_attachment_filename=''BadStockPrice.csv''
		, @query_result_header = 1
		, @query_result_width = 80
		, @query_result_separator = '',''
		, @exclude_query_output = 0
		, @append_query_error = 1
		, @query_no_truncate = 0
		, @query_result_no_padding = 0;
*/
	----------


	INSERT INTO ERP_2.dbo.Errors ([nerror],[mess1],[cprogram],[nlineno],[errordate],[MACHINE],[Revision],[Memo1]) 
		SELECT 0,''Cannot Update to dbo.StockLst_Detail, Found too high of a Per Unit Price.''
			,@cProgram
			,0
			,GetDate()
			,Suser_Sname()
			,@cProgram
			,@Body
		FROM inserted 
		INNER JOIN dbo.PU ON inserted.S_PU = PU.PU
			WHERE inserted.S_P > PU.Max_P

	RAISERROR( ''UPDATE into dbo.StockLst_Detail table failed. S_P above limit.'', 16, -1)
	ROLLBACK TRANSACTION


	PRINT ''Trigger  End  [StockLst_Detail_Update]'';
	RETURN

END

---------------------------------
-- IF S_Total is over million 1,000,000 then Update and send email alert

SET @Body = ''''
PRINT ''Trigger middle [StockLst_Detail_Update]''
	
SELECT @Body = ''S_Total price over $1,000,000 on Update''
	+CHAR(13)+''ID_Detail ''+CAST(inserted.ID_Detail AS VARCHAR(10))
	+CHAR(13)+''S_P is ''+CAST(inserted.S_P AS VARCHAR(10))
	+CHAR(13)+''S_QTY is ''+CAST(inserted.S_QTY AS VARCHAR(10))
	+CHAR(13)+''S_Total is ''+CAST(inserted.S_Total AS VARCHAR(20))
	+CHAR(13)+''S_PU is ''+CAST(inserted.S_PU AS VARCHAR(1))
	+CHAR(13)+''This does not stop the update.''
	+CHAR(13)+RTRIM(suser_sname())
	+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.StockLst_Detail_Update ''
	+CHAR(13)+CAST( GetDate() AS VarChar(50) )
	FROM inserted
	WHERE ISNULL(inserted.S_Total,0) > 1000000 
		
IF LEN(@Body) > 0
	begin	
	EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
		 @SubjectEmail = ''Problem S_Total'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''

	----------
/*	SET @msg = ''Please refer to the attached spread sheet for the report.'';  
	
	SET @query=''SELECT * FROM inserted 
			WHERE ISNULL(inserted.S_Total,0) > 1000000 '''';'';

	SET @cProfile_Name = dbo.f_Get_profile_name('''');

	EXEC msdb.dbo.sp_send_dbmail
		@profile_name = @cProfile_Name
		, @recipients = ''VFPprogramming@ERP_1s.com''
		, @subject = ''Found too high of Price (S_Total)''
		, @body= @msg
		, @body_format = ''TEXT''
		, @query = @query
		, @execute_query_database = ''ERP_2''  
		, @attach_query_result_as_file = 1
		, @query_attachment_filename=''BadStockPrice.csv''
		, @query_result_header = 1
		, @query_result_width = 80
		, @query_result_separator = '',''
		, @exclude_query_output = 0
		, @append_query_error = 1
		, @query_no_truncate = 0
		, @query_result_no_padding = 0;
*/
	----------
	end
-------------------------
PRINT ''Trigger  End  [StockLst_Detail_Update]'';
' 
GO
ALTER TABLE [dbo].[StockLst_Detail] ENABLE TRIGGER [StockLst_Detail_Update]
GO
/****** Object:  Trigger [dbo].[StockLst_Detail_Inserted_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Detail_Inserted_Update]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.StockLst_Detail_Update    Script Date: 7/1/2004 1:56:06 PM ******/


create TRIGGER [dbo].[StockLst_Detail_Inserted_Update] 
ON [dbo].[StockLst_Detail_Inserted] 
	FOR UPDATE 
	NOT FOR REPLICATION
AS


PRINT ''Trigger       [StockLst_Detail_Inserted_Update]'';
-------------------------
--PRINT ''Trigger  End  [StockLst_Detail_Inserted_Update]'';
' 
GO
ALTER TABLE [dbo].[StockLst_Detail_Inserted] ENABLE TRIGGER [StockLst_Detail_Inserted_Update]
GO
/****** Object:  Trigger [dbo].[StockLst_Master_After_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Master_After_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[StockLst_Master_After_Insert] ON [dbo].[Stocklst_Master] 
	AFTER INSERT  
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [StockLst_Master_After_Insert]'';

INSERT dbo.Ar_StockLst_Master_History 
	([WHO],[WHAT],[WHEN],
	[alloy],
	[form],
	[cc],
	[CL],
	[size],
	[cond],
	[mweight],
	[specs],
	[heat],
	[lot],
	[Paid],
	[po_item],
	[poduedate],
	[mill],
	[stkdate],
	[history],
	[num],
	[PoStatus],
	[BrandName],MillTrace,
	[FROM_ID],
	[Melt],
	[id],
	[mS_QTY],
	[WO_Detail],
	[ProjID])
SELECT 	suser_sname(),''ADD'',GetDate(),
	[alloy],
	[form],
	[cc],
	[CL],
	[size],
	[cond],
	[mweight],
	[specs],
	[heat],
	[lot],
	[Paid],
	[po_item],
	[poduedate],
	[mill],
	[stkdate],
	[history],
	[num],
	[PoStatus],
	[BrandName],MillTrace,
	[FROM_ID],
	[Melt],
	[id],
	[mS_QTY],
	[WO_Detail],
	[ProjID]
 FROM inserted


---------------------------------------------
INSERT dbo.StockLst_Master_Inserted
	( Master_ID, [Who], [When]  )
SELECT ID, suser_sname(), GetDate() FROM inserted

---------------------------------------------

PRINT ''Trigger  End  [StockLst_Master_After_Insert]'';
' 
GO
ALTER TABLE [dbo].[Stocklst_Master] ENABLE TRIGGER [StockLst_Master_After_Insert]
GO
/****** Object:  Trigger [dbo].[StockLst_Master_After_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Master_After_Update]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.StockLst_Master_Update    Script Date: 12/16/2005 10:36:30 AM ******/
/****** Object:  Trigger dbo.StockLst_Master_Update    Script Date: 7/1/2004 1:57:08 PM ******/



CREATE TRIGGER [dbo].[StockLst_Master_After_Update] ON [dbo].[Stocklst_Master] 
	AFTER UPDATE 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [StockLst_Master_After_Update]'';

 IF UPDATE(alloy)
 OR UPDATE(form)
 OR UPDATE(cc)
 OR UPDATE(CL)
 OR UPDATE(size)
 OR UPDATE(cond)
 OR UPDATE(specs) 
 OR UPDATE(heat)
 OR UPDATE(lot)
 OR UPDATE(Paid)
 OR UPDATE(mill)
 OR UPDATE(stkdate)
 OR UPDATE(history)
 
begin

	INSERT dbo.Ar_StockLst_Master_History 
		([Who],[what],[When],
		[alloy],
		[form],
		[cc],
		[CL],
		[size],
		[cond],
		[mweight],
		[specs],
		[heat],
		[lot],
		[Paid],
		[po_item],
		[poduedate],
		[mill],
		[stkdate],
		[history],
		[num],
		[PoStatus],
		[BrandName],
		[FROM_ID],
		[Melt],
		[id],
		[mS_QTY],
		[WO_Detail],
		[ProjID],
		MillTrace)
	SELECT 	SUSER_SNAME(),''BEFOREEDIT'',GETDATE(),
		[alloy],
		[form],
		[cc],
		[CL],
		[size],
		[cond],
		[mweight],
		[specs],
		[heat],
		[lot],
		[Paid],
		[po_item],
		[poduedate],
		[mill],
		[stkdate],
		[history],
		[num],
		[PoStatus],
		[BrandName],
		[FROM_ID],
		[Melt],
		[id],
		[mS_QTY],
		[WO_Detail],
		[ProjID],
		MillTrace
	 FROM Deleted

	INSERT dbo.Ar_Stocklst_Master_History 
		([who],[what],[When],
		[alloy],
		[form],
		[cc],
		[CL],
		[size],
		[cond],
		[mweight],
		[specs],
		[heat],
		[lot],
		[Paid],
		[po_item],
		[poduedate],
		[mill],
		[stkdate],
		[history],
		[num],
		[PoStatus],
		[BrandName],
		[FROM_ID],
		[Melt],
		[id],
		[mS_QTY],
		[WO_Detail],
		[ProjID],
		MillTrace)
	SELECT 	SUSER_SNAME(),''AFTER EDIT'',GETDATE(),
		[alloy],
		[form],
		[cc],
		[CL],
		[size],
		[cond],
		[mweight],
		[specs],
		[heat],
		[lot],
		[Paid],
		[po_item],
		[poduedate],
		[mill],
		[stkdate],
		[history],
		[num],
		[PoStatus],
		[BrandName],
		[FROM_ID],
		[Melt],
		[id],
		[mS_QTY],
		[WO_Detail],
		[ProjID],
		MillTrace
	 FROM inserted
	 

end

PRINT ''Trigger  End  [StockLst_Master_After_Update]'';
' 
GO
ALTER TABLE [dbo].[Stocklst_Master] ENABLE TRIGGER [StockLst_Master_After_Update]
GO
/****** Object:  Trigger [dbo].[StockLst_Master_Delete]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Master_Delete]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.StockLst_Master_Delete    Script Date: 7/1/2004 1:57:08 PM ******/


CREATE TRIGGER [dbo].[StockLst_Master_Delete] ON [dbo].[Stocklst_Master] 
	FOR DELETE 
	NOT FOR REPLICATION
AS


---big deletes are in error
DECLARE @Count int
SET @Count = @@ROWCOUNT;
        
IF @Count > 100
BEGIN
    RAISERROR(''Cannot DELETE more than 100 records of Lst_Master at one time.'',16,1) 
    ROLLBACK TRANSACTION
    RETURN;
END

PRINT ''Trigger Start [StockLst_Master_delete]'';

INSERT dbo.Ar_StockLst_Master_History 
	([WHO],[WHAT],[WHEN],
	[alloy],
	[cc],
	[CL],
	[form],
	[size],
	[cond],
	[mweight],
	[specs],
	[heat],
	[lot],
	[Paid],
	[po_item],
	[poduedate],
	[mill],
	[stkdate],
	[history],
	[num],
	[PoStatus],
	[BrandName],MillTrace,
	[FROM_ID],
	[Melt],
	[id],
	[mS_QTY],
	[WO_Detail],
	[ProjID])
SELECT 	suser_sname(),''DELETE'',GetDate(),
	[alloy],
	[cc],
	[CL],
	[form],
	[size],
	[cond],
	[mweight],
	[specs],
	[heat],
	[lot],
	[Paid],
	[po_item],
	[poduedate],
	[mill],
	[stkdate],
	[history],
	[num],
	[PoStatus],
	[BrandName],MillTrace,
	[FROM_ID],
	[Melt],
	[id],
	[mS_QTY],
	[WO_Detail],
	[ProjID]
 FROM Deleted

PRINT ''Trigger  End  [StockLst_Master_delete]'';
' 
GO
ALTER TABLE [dbo].[Stocklst_Master] ENABLE TRIGGER [StockLst_Master_Delete]
GO
/****** Object:  Trigger [dbo].[StockLst_Master_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Master_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[StockLst_Master_Insert] ON [dbo].[Stocklst_Master] 
	FOR INSERT 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [StockLst_Master_Insert]'';

/*  Could be POitem or WO_Detail
DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
DECLARE @WO_Detail INT = 0

IF EXISTS ( SELECT * FROM inserted WHERE 
		NOT ( SUBSTRING(PO_item,10,1) = ''-'' 
		AND ISNULL(WO_Detail,0) = 0)  )
	BEGIN

	DECLARE @Body varchar(4000)
	DECLARE @badPOitem CHAR(12) = ''''
		
	SELECT @Body = ''Cannot insert to dbo.StockLst_Master, SOitem is not Proper and WO_Detail is 0,''+CHAR(13)
		
	SELECT TOP 1 @badPOitem = PO_item FROM inserted WHERE FROM 
		inserted WHERE NOT ( SUBSTRING(PO_item,10,1) = ''-'' 
		AND ISNULL(WO_Detail,0) = 0) 

	SET @Body = @Body+'' PO item:''+@badPOitem +''.''
			+''WO_Detail:0.''+CHAR(13)
			+CHAR(13)+(suser_sname())
			+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.StockLst_Master_Insert ''
			
	EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
		 @SubjectEmail = ''BAD POitem'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''
		 		
	SET @Body = ''Insert into dbo.StockLst_Master table failed. POitem:''+@badPOitem+'' not Proper.''
	RAISERROR( @Body, 16, -1)

	PRINT '' Insert into dbo.StockLst_Master table failed. POitem:''+@badPOitem+'' not Proper.  [StockLst_Master_Insert]''

	END


IF EXISTS ( SELECT * FROM inserted WHERE 
		LEN(PO_Item)=0 AND ISNULL(WO_Detail,0) = 0)
	BEGIN
	--DECLARE @Body varchar(4000)
	DECLARE @badID INT
		
	SELECT @Body = ''Inserted into dbo.StockLst_Master whith empty PO and WO_Detail.''+CHAR(13)
		
	SELECT TOP 1 @badID = ID FROM inserted 
		WHERE LEN(PO_Item)=0 AND ISNULL(WO_Detail,0) = 0
	SET @Body = @Body+'' StockLst_Master ID=''+CAST(@badID AS CHAR(10))+''.''
			+''WO_Detail:0.''+CHAR(13)
			+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.StockLst_Master_After_Insert ''
			
	EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
		 @SubjectEmail = ''Check StockLst_Master Insert -BAD POitem and WO_Detail'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''
		 		
	RAISERROR( @Body, 16, -1)

	PRINT '' Inserted into dbo.StockLst_Master whith empty PO and WO_Detail.  [StockLst_Master_Insert]''

	END

*/

PRINT ''Trigger  End  [StockLst_Master_Insert]'';
' 
GO
ALTER TABLE [dbo].[Stocklst_Master] ENABLE TRIGGER [StockLst_Master_Insert]
GO
/****** Object:  Trigger [dbo].[StockLst_Master_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Master_Update]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.StockLst_Master_Update    Script Date: 12/16/2005 10:36:30 AM ******/
/****** Object:  Trigger dbo.StockLst_Master_Update    Script Date: 7/1/2004 1:57:08 PM ******/



CREATE   TRIGGER [dbo].[StockLst_Master_Update] ON [dbo].[Stocklst_Master] 
	FOR UPDATE 
	NOT FOR REPLICATION
AS


DECLARE @Count int
SET @Count = @@ROWCOUNT;
        
IF @Count > 1000
BEGIN
    RAISERROR(''Cannot UPDATE more than 1000 records of StockLst_Master at one time.'',16,1) 
    ROLLBACK TRANSACTION
    RETURN;
END
PRINT ''Trigger Start [StockLst_Master_Update]'';

--IF EXISTS ( SELECT * FROM inserted WHERE SUBSTRING(PO_item,1,9) Like ''%-%'' )
IF EXISTS ( SELECT * FROM inserted WHERE 
						NOT SUBSTRING( dbo.f_ProperPOitem( PO_item ),10,1) = ''-''
						AND ISNULL(WO_Detail,0) = 0 )  

	BEGIN
	DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
	DECLARE @Body varchar(4000)
	DECLARE @badPOitem CHAR(10)
	DECLARE @ID INT
	DECLARE @WO_Detail INT = 0
	
	SELECT @Body = ''Cannot update dbo.StockLst_Master, POitem is not Proper and WO_Detail = 0,''
		+CHAR(13)
	
	SELECT TOP 1 @badPOitem = PO_item, @ID=ID  
		FROM inserted  WHERE NOT ( SUBSTRING(PO_item,10,1) = ''-'' 
		AND ISNULL(WO_Detail,0) = 0) 
	
	SET @Body = @Body+'' PO item:''+@badPOitem +''.''
		+'' WO_Detil = 0.''+CHAR(13)
		+CHAR(13)+''StockLst_Master ID:''+CAST(@ID AS CHAR(10))
		+CHAR(13)+(suser_sname())
		+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.StockLst_Master_Update ''
		
	EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
		 @SubjectEmail = ''BAD POitem and WO_Detail=0'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''
					
	SET @Body = ''Update dbo.StockLst_Master_Update table failed. POitem:''+@badPOitem+'' not Proper.''
	
	RAISERROR( @Body, 16, -1)

	PRINT ''Update dbo.StockLst_Master_Update table failed. POitem:''
		+@badPOitem+'' not Proper and WO_Detail=0. [StockLst_Master_Update]''


END

PRINT ''Trigger  End  [StockLst_Master_Update]'';

/*
SELECT * FROM dbo.StockLst_Master WHERE ID= 15261
SELECT * FROM dbo.StockLst_Detail WHERE ID= 15261

SELECT * FROM dbo.Ar_Stocklst_Master_History WHERE ID= 15261 AND ID_History = 71548
SELECT * FROM dbo.Ar_StockLst_Detail_History WHERE ID= 15261 AND ID_Detail_History = 325433


--Copy from ERP_1_Archive back to ERP_1
begin Transaction 

UPDATE sm SET
	sm.[Alloy]=h.alloy
      ,sm.[Form]=h.form
      ,sm.[CC]=h.cc
      ,sm.[Size]=h.size
      ,sm.[Cond]=h.cond
      ,sm.[MWeight]=h.mweight
      ,sm.[Specs]=h.specs
      ,sm.[Heat]=h.heat
      ,sm.[Lot]=h.lot
      ,sm.[Paid]=h.Paid
      ,sm.[PO_item]=h.po_item
      ,sm.[PoDueDate]=h.poduedate
      ,sm.[Mill]=h.mill
      ,sm.[StkDate]=h.stkdate
      ,sm.[History]=h.history
      ,sm.[Num]=h.num
      ,sm.[POStatus]=h.POStatus
      ,sm.[BrandName]=h.BrandName
      ,sm.[FROM_ID]=h.FROM_ID
      ,sm.[Melt]=h.Melt
      --,[ID]
      ,sm.[mS_QTY]=h.mS_QTY
      ,sm.[WO_Detail]=h.WO_Detail

  FROM dbo.Ar_Stocklst_Master_History H 
  JOIN dbo.StockLst_Master sm on sm.ID = h.ID
WHERE sm.ID= 15261
AND h.ID= 15261 AND H.ID_History = 71548

commit
*/
/*
begin Transaction 

UPDATE sd SET
	sd.[Size_H]=h.size_h
      ,sd.[Size_L]=h.size_l
      ,sd.[PC]=h.pc
      ,sd.[Dim1]=h.dim1
      ,sd.[Dim2]=h.dim2
      ,sd.[Dim3]=h.dim3
      ,sd.[Length]=h.length
      ,sd.[Weight]=h.weight
      ,sd.[CostValue]=h.costvalue
      ,sd.[Descript]=h.descript
      ,sd.[Location]=h.location
      ,sd.[FloorStatus]=h.floorstatus
      ,sd.[Class]=h.class
      ,sd.[Unit]=h.unit
      ,sd.[RandLen]=h.RandLen
      ,sd.[InvCheck]=h.InvCheck
      ,sd.[ID]=h.id
      --,[ID_Detail]
      ,sd.[ReceivingID]=h.ReceivingID
      ,sd.[InvoiceValue]=h.InvoiceValue
      ,sd.[LiveCheck]=h.LiveCheck
      ,sd.[AccountingCheck]=h.AccountingCheck
      ,sd.[Quarantine]=h.Quarantine	
      ,sd.[S_QTY]=h.S_QTY
      ,sd.[S_P]=h.S_P
      ,sd.[S_Total]=h.S_Total
      ,sd.[S_PU]=h.S_PU
      ,sd.[Prime]=h.Prime
      ,sd.[WO]=h.WO

 FROM dbo.Ar_Stocklst_Detail_History H 
  JOIN dbo.StockLst_Detail sd on sd.ID = h.ID
WHERE sd.ID_Detail= 33219
AND h.ID_Detail = 33219 AND h.ID_Detail_History = 325433
*/
' 
GO
ALTER TABLE [dbo].[Stocklst_Master] ENABLE TRIGGER [StockLst_Master_Update]
GO
/****** Object:  Trigger [dbo].[StockLst_Master_Inserted_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Master_Inserted_Update]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.StockLst_Detail_Update    Script Date: 7/1/2004 1:56:06 PM ******/


create TRIGGER [dbo].[StockLst_Master_Inserted_Update] 
ON [dbo].[StockLst_Master_Inserted] 
	FOR UPDATE 
	NOT FOR REPLICATION
AS


PRINT ''Trigger       [StockLst_Master_Inserted_Update]'';
-------------------------
--PRINT ''Trigger  End  [StockLst_Master_Inserted_Update]'';
' 
GO
ALTER TABLE [dbo].[StockLst_Master_Inserted] ENABLE TRIGGER [StockLst_Master_Inserted_Update]
GO
/****** Object:  Trigger [dbo].[StockLst_Process_After_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Process_After_Insert]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.StockLst_Process_Insert    Script Date: 11/30/2005 4:02:11 PM ******/
CREATE TRIGGER [dbo].[StockLst_Process_After_Insert] ON [dbo].[StockLst_Process] 
AFTER INSERT NOT FOR REPLICATION 
AS

PRINT ''Trigger Start [StockLst_Process_After_Insert]'';
--Run clean up Process- These Process_ID are designed to be scavanged

IF EXISTS(SELECT * FROM inserted WHERE 
  (inserted.[Process_ID]  = ''RECEIVED'' 
  or inserted.[Process_ID] = ''Sell Stock''   
  or inserted.[Process_ID] = ''Shipped'' 
  or inserted.[Process_ID] = ''Receiving'' 
  or inserted.[Process_ID] = ''CORRECTION''
  or inserted.[Process_ID] = ''CANCELLED'')
  and inserted.[ID_Detail_Process] > 0 ) 
	begin
	
	PRINT ''After Insert, some [Process_ID] types will be triggered for Delete''
	PRINT '' Deleting from StockLst_Process WHERE Process_ID is: RECEIVED, Sell Stock, Shipped, Receiving or Correction.''
	
	DELETE FROM dbo.StockLst_Process WHERE StockLst_Process.[ID_Detail_Process] IN 
		( SELECT [ID_Detail_Process] FROM inserted WHERE 
			( inserted.[Process_ID] = ''RECEIVED''   
			or inserted.[Process_ID] = ''Sell Stock'' 
			or inserted.[Process_ID] = ''Shipped'' 
			or inserted.[Process_ID] = ''Receiving''
			or inserted.[Process_ID] = ''CORRECTION''
			or inserted.[Process_ID] = ''CANCELLED'' )
			  and inserted.[ID_Detail_Process] > 0  )
			  
	end
	
/*
IF EXISTS(SELECT * FROM inserted WHERE 
  inserted.[Process_ID]  = ''SELECTED'' and inserted.[ID_Detail_Process] > 0 ) 
	begin
	
	PRINT '' UPDATE dbo.rtr_Detail from StockLst_Process WHERE Process_ID is SELECTED.''
	
	UPDATE dbo.rtr_Detail SET StartDate = GetDate(), Started = 1
	FROM inserted 
	WHERE inserted.[Process_ID]  = ''SELECTED'' and inserted.ID_Detail_Process > 0  
	AND rtr_Detail.ID_Detail_Process = inserted.ID_Detail_Process
			  
	end
*/

PRINT ''Trigger  End  [StockLst_Process_After_Insert]'';
' 
GO
ALTER TABLE [dbo].[StockLst_Process] ENABLE TRIGGER [StockLst_Process_After_Insert]
GO
/****** Object:  Trigger [dbo].[StockLst_Process_After_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Process_After_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[StockLst_Process_After_Update] 
  ON [dbo].[StockLst_Process] 
  AFTER UPDATE NOT FOR REPLICATION 
AS

-- Removed DueDate from Inserted check on 2011-10-18 so there would be less updates.
-- inserted.[duedate]     = deleted.[duedate] and
-- Removed Process_ID Update on 2011-10-18
-- inserted.[process_id]  = deleted.[process_id] and

PRINT ''Trigger Start [StockLst_Process_After_Update]'';



--********

DECLARE @Body varchar(4000)

--Send Email alert
IF EXISTS(SELECT * FROM inserted WHERE inserted.[Process_ID] = ''Shipped'') 
	BEGIN
	PRINT ''Send Email as -Stock marked as Shipped, but still on StockLst''
	DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
	SELECT TOP 1 @Body = ''SO-Item:"''+inserted.SOitem
		+''" ''+CHAR(10)+CHAR(13)+dbo.f_Reportlink_CHAR(''SOitem'',inserted.SOitem)+''" ''+CHAR(10)+CHAR(13)
		+'' was marked as SHIPPED on StockLst_Process:''
		+RTRIM(CAST(inserted.id_detail_process AS CHAR(10))) +CHAR(10)+CHAR(13)
		+'' on ''+CAST(GETDATE() AS CHAR )+CHAR(10)+CHAR(13)
		+''still listed on StockLst''  +CHAR(10)+CHAR(13)	
		FROM inserted
		WHERE inserted.[Process_ID] = ''Shipped'';
	
	SET @Body = @Body +ISNULL(@@SERVERNAME,''SRVR '')+'' TRIGGER ERP_2.dbo.StockLst_Process_After_Update '';

	PRINT ''EXEC dbo.p_eMail_Send''

		EXEC dbo.p_eMail_Send
		 @FromEmail = cEmailFrom, 
		 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
		 @SubjectEmail = ''Stock was marked as Shipped, but still on StockLst'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''
		 
		SET @Body = ''Stock marked as Shipped, but still on StockLst.''+CHAR(10)+CHAR(13)+@Body;
		 
	PRINT ''Sent Email as -Stock marked as Shipped, but still on StockLst'';

		INSERT INTO dbo.NR_UserTrack ([mess1],[cprogram]) VALUES ( LEFT(@Body,1024), LEFT(''TRIGGER ERP_2.dbo.StockLst_Process_After_Update Alert'',100) );

	END

--********	
--SELECTED, INCOMING, PARTRECV, Shipped, CORRECTION, SUBED,CANCELLED,PartialPik
--RECEIVED,Sell Stock,Receiving
--Delete ending process''
IF EXISTS(SELECT * FROM inserted WHERE 
    (inserted.[Process_ID] = ''RECEIVED'' 
  or inserted.[Process_ID] = ''Sell Stock''   
  or inserted.[Process_ID] = ''Shipped'' 
  or inserted.[Process_ID] = ''Receiving'' 
  or inserted.[Process_ID] = ''CORRECTION''
  or inserted.[Process_ID] = ''CANCELLED'')
  and inserted.[ID_Detail_Process] > 0 ) 
	begin
	
	PRINT '' Deleting from StockLst_Process WHERE Process_ID is: RECEIVED, Sell Stock, Shipped, Receiving, Correction or Cancelled.'';
	
	SELECT TOP 1 @Body = ''SO-Item:''+inserted.SOitem+'' deleted from StockLst_Process WHERE Process_ID is:''
	+CHAR(13)+inserted.Process_ID  
	+CHAR(10)+CHAR(13)+ISNULL(@@SERVERNAME,''SRVR '')+'' TRIGGER ERP_2.dbo.StockLst_Process_After_Update ''
	FROM inserted
	WHERE (inserted.[Process_ID] =''RECEIVED'' 
	or inserted.[Process_ID] = ''Sell Stock''   
	or inserted.[Process_ID] = ''Shipped'' 
	or inserted.[Process_ID] = ''Receiving'' 
	or inserted.[Process_ID] = ''CORRECTION''
	or inserted.[Process_ID] = ''CANCELLED'')
	and inserted.[ID_Detail_Process] > 0;
  		
  	SET @Body = @Body+CHAR(10)+CHAR(13)+''Deleting from StockLst_Process WHERE Process_ID is: RECEIVED, Sell Stock, Shipped, Receiving, Correction or Cancelled.'';
  	
	INSERT INTO dbo.NR_UserTrack ([mess1],[cprogram]) VALUES ( LEFT(@Body,1024),LEFT(''TRIGGER ERP_2.dbo.StockLst_Process_After_Update Delete'',100) );

	
	DELETE FROM dbo.StockLst_Process WHERE StockLst_Process.ID_Detail_Process IN 
		( SELECT [ID_Detail_Process] FROM inserted WHERE 
			(  inserted.[Process_ID] = ''RECEIVED''   
			or inserted.[Process_ID] = ''Sell Stock'' 
			or inserted.[Process_ID] = ''Shipped'' 
			or inserted.[Process_ID] = ''Receiving''
			or inserted.[Process_ID] = ''CORRECTION''
			or inserted.[Process_ID] = ''CANCELLED'' )
			and inserted.[ID_Detail_Process] > 0  );
			  
	end
--********

PRINT ''Trigger  End  [StockLst_Process_After_Update]'';
' 
GO
ALTER TABLE [dbo].[StockLst_Process] ENABLE TRIGGER [StockLst_Process_After_Update]
GO
/****** Object:  Trigger [dbo].[StockLst_Process_Delete]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Process_Delete]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.StockLst_Process_Delete    Script Date: 11/30/2005 3:54:44 PM ******/
CREATE TRIGGER [dbo].[StockLst_Process_Delete] ON [dbo].[StockLst_Process] 
FOR DELETE NOT FOR REPLICATION 
AS

---big deletes are in error
DECLARE @Count int
SET @Count = @@ROWCOUNT;
        
IF @Count > 100
BEGIN
    RAISERROR(''Cannot DELETE more than 100 records of Lst_Process at one time.'',16,1) 
    ROLLBACK TRANSACTION
    RETURN;
END


PRINT ''Trigger Start [StockLst_Process_Delete]'';

PRINT ''Record to dbo.NR_UserTrack''

IF EXISTS( SELECT * from deleted WHERE LEN(LTRIM(deleted.SOitem)) > 7 AND NOT dbo.f_ProperSOitem(deleted.SOitem)=dbo.f_ProperSOitem('''') )
	begin
	INSERT dbo.NR_UserTrack 
	   ([mess1],[cprogram],[errordate],[machine])
		SELECT LEFT(''SOitem:''+deleted.SOitem+'' had a Process that was deleted. ''
			+'' WO_Detail is ''+CAST(deleted.WO_Detail AS VARCHAR(10))+''.''
			+'', StockLst ID_Detail_Process:''+CAST(deleted.ID_Detail_Process AS VARCHAR(10))+'' was Deleted,''
			+'', ID_Detail:''+CAST(deleted.ID_Detail AS VARCHAR(10))
			+'', Process_ID:''+deleted.Process_ID
			+'', ReceivingID:''+CAST(ReceivingID AS VARCHAR(10)),1024) AS Mess1
		, LEFT(''StockLst_Process_Delete trigger'',100) AS cProgram
		, GETDATE() AS ErrorDate
		, LEFT((suser_sname()),40) AS Machine
		FROM deleted 
		WHERE LEN(LTRIM(deleted.SOitem)) > 7
		AND NOT dbo.f_ProperSOitem(deleted.SOitem)=dbo.f_ProperSOitem('''')

	PRINT '' SOitem Process Deleted from StockLst_Process''
	end

IF EXISTS( SELECT * from deleted WHERE LEN(LTRIM(deleted.PO_item)) > 9 AND NOT dbo.f_ProperPOitem(deleted.PO_item)=dbo.f_ProperPOitem('''') )
	begin
	INSERT dbo.NR_UserTrack 
	   ([mess1],[cprogram],[errordate],[machine])
		SELECT LEFT(''POitem:''+deleted.PO_item+'' had a Process that was deleted. ''
			+'' SOitem:''+ISNULL(deleted.SOitem,'''')+'' ''
			+'', StockLst ID_Detail_Process:''+CAST(deleted.ID_Detail_Process AS VARCHAR(10))+'' was Deleted,''
			+'', ID_Detail:''+CAST(deleted.ID_Detail AS VARCHAR(10))
			+'', Process_ID:''+deleted.Process_ID
			+'', ReceivingID:''+CAST(ReceivingID AS VARCHAR(10)),1024) AS Mess1
		, LEFT(''StockLst_Process_Delete trigger'',100) AS cProgram
		, GETDATE() AS ErrorDate
		, LEFT((suser_sname()),40) AS Machine
		FROM deleted 
		WHERE LEN(LTRIM(deleted.PO_item)) > 9
		AND NOT dbo.f_ProperPOitem(deleted.SOitem)=dbo.f_ProperPOitem('''')

	PRINT '' POitem Process Deleted from StockLst_Process''
	end

IF EXISTS( SELECT * from deleted WHERE ISNULL(deleted.WO,0)>0 )
	begin
	INSERT dbo.NR_UserTrack 
	   ([mess1],[cprogram],[errordate],[machine])
		SELECT LEFT(''WO:''+CAST(deleted.WO AS VARCHAR(10))+'' had a Process that was deleted. ''
			+'' SOitem:''+ISNULL(deleted.SOitem,'''')+'' ''
			+'', StockLst ID_Detail_Process:''+CAST(deleted.ID_Detail_Process AS VARCHAR(10))+'' was Deleted,''
			+'', ID_Detail:''+CAST(deleted.ID_Detail AS VARCHAR(10))
			+'', Process_ID:''+deleted.Process_ID
			+'', ReceivingID:''+CAST(ReceivingID AS VARCHAR(10)),1024) AS Mess1
		, LEFT(''StockLst_Process_Delete trigger'',100) AS cProgram
		, GETDATE() AS ErrorDate
		, LEFT((suser_sname()),40) AS Machine
		FROM deleted 
		WHERE ISNULL(deleted.WO,0)>0
	PRINT '' WO Process Deleted from StockLst_Process''

	end

IF EXISTS( SELECT * from deleted WHERE ISNULL(deleted.WO_Detail,0)>0 )
	begin
	INSERT dbo.NR_UserTrack 
	   ([mess1],[cprogram],[errordate],[machine])
		SELECT LEFT(''WO_Detail:''+CAST(deleted.WO_Detail AS VARCHAR(10))+'' had a Process that was deleted. ''
			+''SOitem:''+ISNULL(deleted.SOitem,'''')+'' ''
			+'', StockLst ID_Detail_Process:''+CAST(deleted.ID_Detail_Process AS VARCHAR(10))+'' was Deleted,''
			+'', ID_Detail:''+CAST(deleted.ID_Detail AS VARCHAR(10))
			+'', Process_ID:''+deleted.Process_ID
			+'', ReceivingID:''+CAST(ReceivingID AS VARCHAR(10)),1024) AS Mess1
		, LEFT(''StockLst_Process_Delete trigger'',100) AS cProgram
		, GETDATE() AS ErrorDate
		, LEFT((suser_sname()),40) AS Machine
		FROM deleted 
		WHERE ISNULL(deleted.WO_Detail,0)>0

	PRINT '' WO_Detail Process Deleted from StockLst_Process''
	end

PRINT '' INSERT dbo.Ar_StockLst_Process_History'';
INSERT dbo.Ar_StockLst_Process_History 
	([Who],
	[What],
	[When],
	[SOitem],
	[PO_Item],
	[SalesPerson],
	[StartDate],
	[DueDate],
	[Comment],
	[Process_ID],
	[Processor],
	[AllowSub],
	[PWeight],
	[PPc],
	[PFt],
	[PU],
	[QTY],
	[Ordered_QTY],
	[Ordered_P],

	[Pounds],
	[ID_Detail],
	[ID_Detail_Process],
	[Validated],
	[ReceivingID],
	[WO]
	,[WO_Detail]
	,[InqNumP]
	,[Prc_QTY]
	,[Prc_Form]
	,[Prc_PCs]
	,[Prc_Dim2]
	,[Prc_Dim3]
	,FoundSTK )
SELECT suser_sname() AS [Who],
	''DELETE'' AS [What],
	GETDATE() AS [When],
	[SOitem],
	[PO_Item],
	[SalesPerson],
	[StartDate],
	[DueDate],
	[Comment],
	[Process_ID],
	[Processor],
	[AllowSub],
	[PWeight],
	[PPc],
	[PFt],
	[PU],
	[QTY],
	[Ordered_QTY],
	[Ordered_P],

	[Pounds],
	[ID_Detail],
	[ID_Detail_Process],
	''F'',
	[ReceivingID],
	[WO]
	,[WO_Detail]
	,[InqNumP]
	,[Prc_QTY]
	,[Prc_Form]
	,[Prc_PCs]
	,[Prc_Dim2]
	,[Prc_Dim3]
	,FoundSTK
 FROM Deleted
 
 
PRINT '' Copy to dbo.StockLst_Process_Recv -Keep a Received Record!'';
INSERT dbo.StockLst_Process_Recvd
	( [PO_item]
      ,[SalesPerson]
      ,[StartDate]
      ,[DueDate]
	  ,[RecvDate]
      ,[Comment]
      ,[Process_ID]
      ,[Processor]
      ,[PU]
      ,[QTY]
      ,[Ordered_QTY]
      ,[Ordered_P]
      ,[Pounds]
      ,[ID_Detail]
      ,[ID_Detail_Process]
      ,[ReceivingID]
      ,[WO_Detail]
      ,[Prc_Form]
      ,[Prc_PCs]
      ,[Prc_Dim1]
      ,[Prc_Dim2]
      ,[Prc_Dim3] )

 SELECT 
 	 [PO_item]
      ,[SalesPerson]
      ,[StartDate]
      ,[DueDate]
	  ,GETDATE() AS [RecvDate]
      ,[Comment]
      ,[Process_ID]
      ,[Processor]
      ,[PU]
      ,[QTY]
      ,[Ordered_QTY]
      ,[Ordered_P]
      ,[Pounds]
      ,[ID_Detail]
      ,[ID_Detail_Process]
      ,[ReceivingID]
      ,[WO_Detail]
      ,[Prc_Form]
      ,[Prc_PCs]
      ,[Prc_Dim1]
      ,[Prc_Dim2]
      ,[Prc_Dim3]
  FROM Deleted WHERE Process_ID=''RECEIVED''

-- remove SELECTED in Router
IF (SELECT COUNT(*) FROM deleted WHERE deleted.[Process_ID] = ''SELECTED'') > 0  
	BEGIN
	--UPDATE rtr
	DECLARE @cOrderNumber CHAR(13) = ''''
	DECLARE @nID_Detail_Process INT = 0

	DECLARE @nWO INT = 0
	SELECT TOP 1 @nWO = deleted.WO, @nID_Detail_Process = deleted.ID_Detail_Process 
		FROM deleted WHERE deleted.Process_ID = ''SELECTED'' AND ISNULL(deleted.WO,0) > 0

	IF @nWO > 0 AND @nID_Detail_Process > 0
		begin
		SET @cOrderNumber = CAST(@nWO AS CHAR(10) )
		PRINT ''rtr_Select_Material_Done with WO '' + @cOrderNumber
		EXEC dbo.p_rtr_Select_Material_Done ''WO'', @cOrderNumber, ''S'', @nID_Detail_Process
		end

	DECLARE @nWO_Detail INT = 0
	SELECT TOP 1 @nWO_Detail = deleted.WO_Detail, @nID_Detail_Process = deleted.ID_Detail_Process 
		FROM deleted WHERE deleted.Process_ID = ''SELECTED'' AND ISNULL(deleted.WO_Detail,0) > 0

	IF @nWO_Detail > 0 AND @nID_Detail_Process > 0
		begin
		SET @cOrderNumber = CAST(@nWO_Detail AS CHAR(10) )
		PRINT ''rtr_Select_Material_Done with WO_Detail ''+@cOrderNumber
		EXEC dbo.p_rtr_Select_Material_Done ''WO_Detail'', @cOrderNumber, ''S'', @nID_Detail_Process
		end

	DECLARE @cSOitem CHAR(10) = ''''
	SELECT TOP 1 @cSOitem = deleted.SOitem, @nID_Detail_Process = deleted.ID_Detail_Process 
		FROM deleted WHERE deleted.Process_ID = ''SELECTED'' 
		AND dbo.f_ProperSOitem(ISNULL(deleted.SOitem,'''')) <> dbo.f_ProperSOitem('''')

	IF  dbo.f_ProperSOitem(@cSOitem) <> dbo.f_ProperSOitem('''') AND @nID_Detail_Process > 0
		begin
		--SET @cOrderNumber = CAST(@nWO_Detail AS CHAR(10) )
		PRINT ''rtr_Select_Material_Done with SOitem ''+@cSOitem
		EXEC dbo.p_rtr_Select_Material_Done ''SOitem'', @cSOitem, ''S'', @nID_Detail_Process
		end
	END

-- Mark StockLst_Process_Grab as Gone on Delete of ID_Detail
UPDATE G SET G.Gone=1
	FROM dbo.StockLst_Process_Grab G
	inner join deleted ON G.ID_Detail = deleted.ID_Detail;


 PRINT ''Trigger  End  [StockLst_Process_Delete]'';
' 
GO
ALTER TABLE [dbo].[StockLst_Process] ENABLE TRIGGER [StockLst_Process_Delete]
GO
/****** Object:  Trigger [dbo].[StockLst_Process_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Process_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[StockLst_Process_Insert] ON [dbo].[StockLst_Process] 
  FOR INSERT 
  NOT FOR REPLICATION 
AS

PRINT ''Trigger Start [StockLst_Process_Insert]'';

DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
DECLARE @Body varchar(4000)
DECLARE @badSOitem CHAR(10)

--Send Email alert for Shipped that still exists.
IF (SELECT COUNT(*) FROM inserted 
	WHERE inserted.[Process_ID] = ''Shipped'') > 0  
	BEGIN
		PRINT ''Send Email alert: SOitem was marked as SHIPPED on StockLst_Process ''		

		SELECT TOP 1 @Body = ''SO-Item:''+ISNULL(inserted.SOitem,'''')
			+'' or WO:''+CAST(ISNULL(inserted.WO,0) AS CHAR)
			+'' was marked as SHIPPED ''
			+RTRIM(CAST(inserted.id_detail_process AS CHAR))
			+CHAR(13)+dbo.f_Reportlink_CHAR(''SOitem'',inserted.SOitem)
			+CHAR(13)+''User ''+RTRIM(suser_sname())+'' on ''+RTRIM(CAST(GETDATE() AS CHAR))
			+CHAR(13)+'', but still listed on StockLst.''  
			+CHAR(13)+@@SERVERNAME+'' TRIGGER ''+DB_NAME()+'' StockLst_Process_Insert ''
			FROM inserted
				WHERE inserted.[Process_ID] = ''Shipped''
		
		PRINT ''Send Email alert for Shipped that still exists.''
		
		EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
		 @SubjectEmail = ''Stock marked as Shipped'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''
		 

		 INSERT dbo.NR_UserTrack ([mess1],[cprogram]) 
			SELECT LEFT(''SO-Item:''+ISNULL(inserted.SOitem,'''')
			+'' or WO:''+CAST(ISNULL(inserted.WO,0) AS CHAR)+'' was marked as SHIPPED''
			+RTRIM(CAST(inserted.id_detail_process AS CHAR))+CHAR(13)+'' on ''+RTRIM(CAST(GETDATE()AS CHAR))
			+CHAR(13)+'', but still listed on BrokerLst.''+CHAR(13)
			+''User ''+RTRIM(suser_sname())+'' on ''+RTRIM(CAST(GETDATE()AS CHAR))+'' ''
			+@@SERVERNAME+'' TRIGGER ''+''.dbo.StockLst_Process_Insert '',1024) AS Mess1
			,LEFT(''TRIGGER ERP_2.dbo.StockLst_Process'',100)
			FROM inserted
				WHERE inserted.[Process_ID] = ''Shipped''

	END

--Send Email alert for SOitem ''9999999-99''.
IF (SELECT COUNT(*) FROM inserted WHERE inserted.SOitem = ''9999999-99'') > 0  
	BEGIN
		

		SELECT TOP 1 @Body = ''SO is 9999999-99 on StockLst_Process id_detail_process:''
			+RTRIM(CAST(inserted.id_detail_process AS CHAR))
			+CHAR(13)+ dbo.f_Reportlink_CHAR(''SOitem'',inserted.SOitem)
			+CHAR(13)+ dbo.f_Reportlink_CHAR(''POitem'',inserted.PO_item)
			+CHAR(13)+ ISNULL(inserted.Comment,''Comment NA'')
			+CHAR(13)+''User ''+RTRIM(suser_sname())+'' on ''+RTRIM(CAST(GETDATE() AS CHAR))
			+CHAR(13)+@@SERVERNAME+'' TRIGGER ''+''StockLst_Process_Insert ''
			FROM inserted
			WHERE inserted.SOitem = ''9999999-99''

			PRINT ''Send Email alert for SOitem 9999999-99''
		--PRINT @Body		
		
		EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''David.Kirchner@ERP_1s.com'', 
		 @SubjectEmail = ''SOitem 9999999-99'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''
		 

	END

--- rtr ---
PRINT ''Trigger Start [StockLst_Process_Insert SECTION rtr]'';

IF (SELECT COUNT(*) FROM inserted WHERE inserted.[Process_ID] = ''SELECTED'') > 0  
	BEGIN
	PRINT ''--''
	PRINT ''UPDATE rtr via p_rtr_Select_Material''

	DECLARE @cOrderNumber CHAR(13) = ''''
	DECLARE @nID_Detail_Process INT = 0

	DECLARE @nWO INT = 0;
	SELECT TOP 1 @nWO = inserted.WO, @nID_Detail_Process = inserted.ID_Detail_Process 
		FROM Inserted 
		WHERE inserted.Process_ID = ''SELECTED'' AND ISNULL(inserted.WO,0) > 0;


	IF @nWO > 0 AND @nID_Detail_Process > 0
		begin
		SET @cOrderNumber = CAST(@nWO AS CHAR(10) )
		PRINT ''EXEC dbo.p_rtr_Select_Material  @cOrderType=''''WO'''' ,@cOrderNumber=''+ @cOrderNumber + '', @TBL=''''S'''' ''+'', @ID_Detail_Process=''+CAST(@nID_Detail_Process AS CHAR(10))
		EXEC dbo.p_rtr_Select_Material ''WO'', @cOrderNumber, ''S'', @nID_Detail_Process

		end


	DECLARE @nWO_Detail INT = 0;
	SELECT TOP 1 @nWO_Detail = inserted.WO_Detail, @nID_Detail_Process = inserted.ID_Detail_Process 
		FROM Inserted WHERE inserted.Process_ID = ''SELECTED'' AND ISNULL(inserted.WO_Detail,0) > 0;

	IF @nWO_Detail > 0 AND @nID_Detail_Process > 0
		begin
		SET @cOrderNumber = CAST(@nWO_Detail AS CHAR(10) )
		PRINT ''EXEC dbo.p_rtr_Select_Material  @cOrderType=''''WO_Detail'''' ,@cOrderNumber=''+ @cOrderNumber + '', @TBL=''''S'''' ''+'', @ID_Detail_Process=''+CAST(@nID_Detail_Process AS CHAR(10))
		EXEC dbo.p_rtr_Select_Material ''WO_Detail'', @cOrderNumber, ''S'', @nID_Detail_Process ;

		end

	DECLARE @cSOitem CHAR(10) = '''';
	SELECT TOP 1 @cSOitem = inserted.SOitem, @nID_Detail_Process = inserted.ID_Detail_Process 
		FROM Inserted WHERE inserted.Process_ID = ''SELECTED'' 
		AND NOT dbo.f_ProperSOitem(inserted.SOitem) = dbo.f_ProperSOitem('''');

	IF dbo.f_ProperSOitem(@cSOitem) <> dbo.f_ProperSOitem('''') AND  @nID_Detail_Process > 0
		begin
		--SET @cOrderNumber = CAST(@@cSOitem AS CHAR(10) )
		PRINT ''EXEC dbo.p_rtr_Select_Material  @cOrderType=''''SOitem'''' ,@cOrderNumber=''+ @cOrderNumber + '', @TBL=''''S'''' ''+'', @ID_Detail_Process=''+CAST(@nID_Detail_Process AS CHAR(10))
		EXEC dbo.p_rtr_Select_Material ''SOitem'', @cSOitem, ''S'', @nID_Detail_Process ;

		end
	END
--- rtr ---


PRINT '' [StockLst_Process_Insert] INSERT dbo.Ar_StockLst_Process_History '';

INSERT dbo.Ar_StockLst_Process_History 
	([Who],
	[What],
	[When],
	[SOitem],
	[PO_Item],
	[SalesPerson],
	[StartDate],
	[DueDate],
	[Comment],
	[Process_ID],
	[Processor],
	[AllowSub],
	[PWeight],
	[PPc],
	[PFt],
	[PU],
	[QTY],
	[Ordered_QTY],
	[Ordered_P],

	[Pounds],
	[ID_Detail],
	[ID_Detail_Process],
	[Validated],
	[ReceivingID],
	[WO]
	,[WO_Detail]
	,[InqNumP]
	,[Prc_QTY]
	,[Prc_Form]
	,[Prc_PCs]
	,[Prc_Dim2]
	,[Prc_Dim3]
	,FoundSTK )
SELECT 	suser_sname() AS [Who],
	''ADD'' AS [What],
	GETDATE() AS [When],
	[SOitem],
	[PO_Item],
	[SalesPerson],
	[StartDate],
	[DueDate],
	[Comment],
	[Process_ID],
	[Processor],
	[AllowSub],
	[PWeight],
	[PPc],
	[PFt],
	[PU],
	[QTY],
	[Ordered_QTY],
	[Ordered_P],

	[Pounds],
	[ID_Detail],
	[ID_Detail_Process],
	''F'',
	[ReceivingID],
	[WO]
	,[WO_Detail]
	,[InqNumP]
	,[Prc_QTY]
	,[Prc_Form]
	,[Prc_PCs]
	,[Prc_Dim2]
	,[Prc_Dim3]
	,FoundSTK
 FROM inserted ;
 

PRINT ''Trigger  End  [StockLst_Process_Insert]'';
' 
GO
ALTER TABLE [dbo].[StockLst_Process] ENABLE TRIGGER [StockLst_Process_Insert]
GO
/****** Object:  Trigger [dbo].[StockLst_Process_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Process_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[StockLst_Process_Update] ON [dbo].[StockLst_Process] 
FOR UPDATE NOT FOR REPLICATION
AS

PRINT ''Trigger Start [StockLst_Process_Update]'';

    
---big UPDATES are in error
DECLARE @Count int
SET @Count = @@ROWCOUNT;
   
IF @Count > 1000
BEGIN
	RAISERROR(''Cannot UPDATE more than 1000 records of dbo.Sales_No at one time. trigger Sales_No_Update'',16,1) 
	ROLLBACK TRANSACTION
	RETURN;
END
----------------------

DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
DECLARE @Body varchar(4000)
DECLARE @badSOitem CHAR(10)=''''
DECLARE @badPOitem CHAR(12)=''''

IF EXISTS ( SELECT * FROM inserted WHERE 
		( SUBSTRING(SOitem,1,7) like ''%-%'' 
		OR SUBSTRING(PO_item,1,9) like ''%-%'' ) 
		--AND ISNULL(WO_Detail,0) > 0 
		)
	BEGIN
	--SUBSTRING(SOitem,1,7) Like ''%-%'', Looks for a - in first 7 digits

	PRINT '' Cannot insert into dbo.StockLst_Process, SOitem is not Proper or POitem is not Proper''
	SELECT @Body = ''Cannot insert into dbo.StockLst_Process, SOitem or PO_item is not Proper,''+CHAR(13)
		
	SELECT TOP 1 @badPOitem = ISNULL(PO_item,''null'')  FROM inserted WHERE 
		SUBSTRING(PO_item,1,9) like ''%-%'' 

	SELECT TOP 1 @badSOitem = ISNULL(SOitem,''null'')  FROM inserted WHERE 
		 SUBSTRING(SOitem,1,7) like ''%-%''

	SET @Body = @Body+'' PO item:''+@badPOitem +''.''
		+'' SO item:''+@badSOitem +''.''
		+RTRIM(suser_sname())
		+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.StockLst_Process_Update ''
				
	EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
		 @SubjectEmail = ''a BAD SOitem or POitem'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''
		 	
	SET @Body = ''INSERT dbo.StockLst_Process table failed. POitem:''
		+@badPOitem+'' not Proper.''
		+'' SOitem:''+@badSOitem+'' not Proper.''

--	RAISERROR( @Body, 16, -1)

	END
		
/*		
IF EXISTS ( SELECT * FROM inserted WHERE SUBSTRING(PO_item,1,9) Like ''%-%'')
	BEGIN
		--SUBSTRING(POitem,1,9) Like ''%-%'', Looks for a - in first 9 digits	
	SELECT @Body = ''Cannot insert into dbo.StockLst_Process, POitem is not Proper,''+CHAR(13)
		
	SELECT TOP 1 @badPOitem = PO_item  FROM inserted WHERE SUBSTRING(PO_item,1,9) Like ''%-%''
	SET @Body = @Body+'' PO item:''+@badPOitem +''  ''+RTRIM(suser_sname())
		+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.StockLst_Process_Update ''
			
	PRINT '' INSERT dbo.StockLst_Process table failed. POitem:''+@badPOitem+'' not Proper.''
	EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
		 @SubjectEmail = ''BAD POitem'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''
		 
	SET @Body = ''INSERT dbo.StockLst_Process table failed. POitem:''+@badPOitem+'' not Proper.''
--	RAISERROR( @Body, 16, -1)

	END  */

IF EXISTS ( SELECT * FROM inserted WHERE SUBSTRING(SOitem,1,7) Like ''%-%'')
	BEGIN
		--SUBSTRING(SOitem,1,7) Like ''%-%'', Looks for a - in first 7 digits	
	SELECT @Body = ''Cannot insert into dbo.StockLst_Process, SOitem is not Proper,''+CHAR(13)
		
	SELECT TOP 1 @badSOitem = SOitem FROM inserted WHERE SUBSTRING(SOitem,1,7) Like ''%-%''
	SET @Body = @Body+'' SO item:''+@badSOitem +''  ''+RTRIM(suser_sname())
		+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.StockLst_Process_Update ''
			
	PRINT '' INSERT dbo.StockLst_Process table failed. SOitem:''+@badSOitem+'' not Proper.''
	EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
		 @SubjectEmail = ''BAD POitem'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''
		 
	SET @Body = ''INSERT dbo.StockLst_Process table failed. SOitem:''+@badSOitem+'' not Proper.''
--	RAISERROR( @Body, 16, -1)

	END

---*******************************************
PRINT ''StockLst_Process_Update ERP_1_Archive''


IF (SELECT COUNT(*) FROM inserted, deleted
WHERE inserted.[SOitem]   = deleted.[SOitem] and
   inserted.[PO_Item]     = deleted.[PO_Item] and
   inserted.[SalesPerson] = deleted.[SalesPerson] and
   inserted.[StartDate]   = deleted.[StartDate] and
   inserted.[Comment]     = deleted.[Comment] and
   inserted.[Processor]   = deleted.[Processor]  and
   inserted.[AllowSub]    = deleted.[AllowSub] and
   inserted.[PWeight]     = deleted.[PWeight] and
   inserted.[PPc]         = deleted.[PPc] and
   inserted.[PU]          = deleted.[PU] and
   inserted.[QTY]         = deleted.[QTY] and
   inserted.[Pounds]      = deleted.[Pounds] and
   inserted.[ReceivingID] = deleted.[ReceivingID] and
   inserted.WO_Detail     = deleted.WO_Detail and
   inserted.Prc_QTY       = deleted.Prc_QTY and
   inserted.FoundSTK	  = deleted.FoundSTK
   ) <> 1
BEGIN
--An important field has changed
	PRINT '' An important field has changed, save to dbo.Ar_StockLst_Process_History''
	
   INSERT dbo.Ar_StockLst_Process_History 
	([Who],
	[What],
	[When],
	[SOitem] ,
	[PO_Item],
	[SalesPerson],
	[startdate],
	[DueDate],
	[Comment],
	[Process_ID],
	[Processor],
	[AllowSub],
	[PWeight],
	[PPc],
	[PFt],
	[PU],
	[QTY],
	[Ordered_QTY],
	[Ordered_P],

	[Pounds],
	[ID_Detail],
	[ID_Detail_Process],
	[Validated],
	[ReceivingID],
	[WO]
	,[WO_Detail]
	,[InqNumP]
	,[Prc_QTY]
	,[Prc_Form]
	,[Prc_PCs]
	,[Prc_Dim2]
	,[Prc_Dim3]
	,FoundSTK )
   SELECT 	suser_sname() AS [Who],
	''BEFOREEDIT'' AS [What],
	GETDATE() AS [When],
	inserted.[SOitem] ,
	inserted.[PO_Item],
	inserted.[SalesPerson],
	inserted.[StartDate],
	inserted.[DueDate],
	inserted.[Comment],
	inserted.[Process_ID],
	inserted.[Processor],
	inserted.[AllowSub],
	inserted.[PWeight],
	inserted.[PPc],
	inserted.[PFt],
	inserted.[PU],
	inserted.[QTY],
	inserted.[Ordered_QTY],
	inserted.[Ordered_P],

	inserted.[Pounds],
	inserted.[ID_Detail],
	inserted.[ID_Detail_Process],
	''F'',
	inserted.[ReceivingID],
	inserted.[WO]
	,inserted.[WO_Detail]
	,inserted.[InqNumP]
	,inserted.[Prc_QTY]
	,inserted.[Prc_Form]
	,inserted.[Prc_PCs]
	,inserted.[Prc_Dim2]
	,inserted.[Prc_Dim3]
	,inserted.FoundSTK
    FROM deleted, inserted
	WHERE inserted.[ID_Detail_Process] = deleted.[ID_Detail_Process]
	 and NOT ( inserted.[SOitem] = deleted.[SOitem] 
	   and inserted.[PO_Item]     = deleted.[PO_Item] 
	   and inserted.[SalesPerson] = deleted.[SalesPerson]
	   and inserted.[StartDate]   = deleted.[StartDate]
	   and inserted.[Comment]     = deleted.[Comment]
	   and inserted.[Processor]   = deleted.[Processor]
	   and inserted.[AllowSub]    = deleted.[AllowSub]
	   and inserted.[PWeight]     = deleted.[PWeight]
	   and inserted.[PPc]         = deleted.[PPc]
	   and inserted.[PU]          = deleted.[PU]
	   and inserted.[QTY]         = deleted.[QTY]
	   and inserted.[Pounds]      = deleted.[Pounds] 
	   and inserted.[FoundSTK]    = deleted.[FoundSTK] )
		and ( UPDATE([SOitem]) 
		or UPDATE([PO_Item])
		or UPDATE([SalesPerson])
		or UPDATE([StartDate])
		or UPDATE([Comment])
		or UPDATE([Processor])
		or UPDATE([AllowSub])
		or UPDATE([PWeight])
		or UPDATE([PPc])
		or UPDATE([PU])
		or UPDATE([QTY])
		or UPDATE([Pounds])
		or UPDATE([Prc_QTY])
		or UPDATE([FoundSTK]))

   INSERT dbo.Ar_StockLst_Process_History 
	([Who],
	[What],
	[When],
	[SOitem],
	[PO_Item],
	[SalesPerson],
	[StartDate],
	[DueDate],
	[Comment],
	[Process_ID],
	[Processor],
	[AllowSub],
	[PWeight],
	[PPc],
	[PFt],
	[PU],
	[QTY],
	[Ordered_QTY],
	[Ordered_P],

	[Pounds],
	[ID_Detail],
	[ID_Detail_Process],
	[Validated],
	[ReceivingID],
	[WO]
	,[WO_Detail]
	,[InqNumP]
	,[Prc_QTY]
	,[Prc_Form]
	,[Prc_PCs]
	,[Prc_Dim2]
	,[Prc_Dim3]
	,FoundSTK )
   SELECT suser_sname() AS [Who],
	''AFTER EDIT'' AS [What],
	GETDATE() AS [When],
	deleted.[SOitem],
	deleted.[PO_Item],
	deleted.[SalesPerson],
	deleted.[StartDate],
	deleted.[DueDate],
	deleted.[Comment],
	deleted.[Process_ID],
	deleted.[Processor],
	deleted.[AllowSub],
	deleted.[PWeight],
	deleted.[PPc],
	deleted.[PFt],
	deleted.[PU],
	deleted.[QTY],
	deleted.[Ordered_QTY],
	deleted.[Ordered_P],

	deleted.[Pounds],
	deleted.[ID_Detail],
	deleted.[ID_Detail_Process],
	''F'',
	deleted.[ReceivingID],
	deleted.[WO]
	,deleted.[WO_Detail]
	,deleted.[InqNumP]
	,deleted.[Prc_QTY]
	,deleted.[Prc_Form]
	,deleted.[Prc_PCs]
	,deleted.[Prc_Dim2]
	,deleted.[Prc_Dim3]
	,deleted.FoundSTK
    FROM inserted, deleted
	WHERE inserted.[ID_Detail_Process] = deleted.[ID_Detail_Process]
	 and NOT ( inserted.[SOitem] = deleted.[SOitem] 
	   and inserted.[PO_Item]     = deleted.[PO_Item] 
	   and inserted.[SalesPerson] = deleted.[SalesPerson]
	   and inserted.[StartDate]   = deleted.[StartDate]
	   and inserted.[Comment]     = deleted.[Comment]
	   and inserted.[Processor]   = deleted.[Processor]
	   and inserted.[AllowSub]    = deleted.[AllowSub]
	   and inserted.[PWeight]     = deleted.[PWeight]
	   and inserted.[PPc]         = deleted.[PPc]
	   and inserted.[PU]          = deleted.[PU]
	   and inserted.[QTY]         = deleted.[QTY]
	   and inserted.[Pounds]      = deleted.[Pounds] )
		and ( UPDATE([SOitem]) 
		or UPDATE([PO_Item])
		or UPDATE([SalesPerson])
		or UPDATE([StartDate])
		or UPDATE([Comment])
		or UPDATE([Processor])
		or UPDATE([AllowSub])
		or UPDATE([PWeight])
		or UPDATE([PPc])
		or UPDATE([PU])
		or UPDATE([QTY])
		or UPDATE([Pounds])
		or UPDATE([Prc_QTY])
							)
/*
	   and NOT ( inserted.[SOitem] = deleted.[SOitem] 
	   and inserted.[PO_Item]     = deleted.[PO_Item] 
	   and inserted.[SalesPerson] = deleted.[SalesPerson]
	   and inserted.[StartDate]   = deleted.[StartDate] 
	   and inserted.[Comment]     = deleted.[Comment]
	   and inserted.[Processor]   = deleted.[Processor]
	   and inserted.[AllowSub]    = deleted.[AllowSub]
	   and inserted.[PWeight]     = deleted.[PWeight]
	   and inserted.[PPc]         = deleted.[PPc] 
	   and inserted.[PU]          = deleted.[PU] 
	   and inserted.[QTY]         = deleted.[QTY] 
	   and inserted.[Pounds]      = deleted.[Pounds] )
*/

END


PRINT ''Trigger  End  [StockLst_Process_Update]'';
' 
GO
ALTER TABLE [dbo].[StockLst_Process] ENABLE TRIGGER [StockLst_Process_Update]
GO
/****** Object:  Trigger [dbo].[StockLst_Process_Detail_Delete]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Process_Detail_Delete]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.StockLst_Process_Delete    Script Date: 11/30/2005 3:54:44 PM ******/
Create TRIGGER [dbo].[StockLst_Process_Detail_Delete] ON [dbo].[StockLst_Process_Detail] 
FOR DELETE NOT FOR REPLICATION 
AS

PRINT ''Start trigger [StockLst_Process_Detail_Delete]'';

INSERT dbo.Ar_StockLst_Process_Detail_History 
	([Who],
	[What],
	[When],
	[ID],
	[ID_Detail],
	[ID_Detail_Process],
	[WO],
	[SOitem] )
SELECT [Who],
	[What],
	[When],
	[ID],
	[ID_Detail],
	[ID_Detail_Process],
	[WO],
	[SOitem]
 FROM Deleted

 PRINT ''End trigger [StockLst_Process_Detail_Delete]'';' 
GO
ALTER TABLE [dbo].[StockLst_Process_Detail] ENABLE TRIGGER [StockLst_Process_Detail_Delete]
GO
/****** Object:  Trigger [dbo].[StockLst_Process_Grab_Delete]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Process_Grab_Delete]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.StockLst_Process_Delete    Script Date: 11/30/2005 3:54:44 PM ******/
CREATE TRIGGER [dbo].[StockLst_Process_Grab_Delete] ON [dbo].[StockLst_Process_Grab] 
FOR DELETE NOT FOR REPLICATION 
AS
BEGIN

---big deletes are in error
DECLARE @Count int
SET @Count = @@ROWCOUNT;
        
IF @Count > 100
	BEGIN
		RAISERROR(''Cannot DELETE more than 100 records of Lst_Process at one time.'',16,1) 
		ROLLBACK TRANSACTION
		RETURN;
	END



PRINT '' Updated dbo.Sales with  [StockLst_Process_Grab_Delete]''

END
' 
GO
ALTER TABLE [dbo].[StockLst_Process_Grab] ENABLE TRIGGER [StockLst_Process_Grab_Delete]
GO
/****** Object:  Trigger [dbo].[StockLst_Process_Grab_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Process_Grab_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[StockLst_Process_Grab_Insert]
   ON  [dbo].[StockLst_Process_Grab] 
   FOR INSERT 
   NOT FOR REPLICATION
AS 
BEGIN

SET NOCOUNT ON;

PRINT ''trigger start StockLst_Process_Grab_Insert:'';




PRINT ''trigger end  StockLst_Process_Grab_Insert:'';

END
' 
GO
ALTER TABLE [dbo].[StockLst_Process_Grab] ENABLE TRIGGER [StockLst_Process_Grab_Insert]
GO
/****** Object:  Trigger [dbo].[StockLst_Process_Grab_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Process_Grab_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[StockLst_Process_Grab_Update] ON [dbo].[StockLst_Process_Grab] 
FOR UPDATE NOT FOR REPLICATION
AS
BEGIN

PRINT ''Trigger Start [StockLst_Process_Grab_Update]'';

    
---big UPDATES are in error
DECLARE @Count int
SET @Count = @@ROWCOUNT;
   
IF @Count > 10
	BEGIN
		RAISERROR(''Cannot UPDATE more than 10 records of dbo.StockLst_Process_Grab at one time. trigger StockLst_Process_Grab_Update'',16,1) 
		ROLLBACK TRANSACTION
		RETURN;
	END
	----------------------


END
' 
GO
ALTER TABLE [dbo].[StockLst_Process_Grab] ENABLE TRIGGER [StockLst_Process_Grab_Update]
GO
/****** Object:  Trigger [dbo].[StockLst_Process_Recvd_Delete]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Process_Recvd_Delete]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.StockLst_Process_Delete    Script Date: 11/30/2005 3:54:44 PM ******/
create TRIGGER [dbo].[StockLst_Process_Recvd_Delete] ON [dbo].[StockLst_Process_Recvd] 
FOR DELETE NOT FOR REPLICATION 
AS

---big deletes are in error
DECLARE @Count int
SET @Count = @@ROWCOUNT;
        
IF @Count > 10
BEGIN
    RAISERROR(''Cannot DELETE more than 10 records of StockLst_Process_Recvd at one time.'',16,1) 
    ROLLBACK TRANSACTION
    RETURN;
END


PRINT ''Trigger Start [StockLst_Process_Recvd_Delete]'';
' 
GO
ALTER TABLE [dbo].[StockLst_Process_Recvd] ENABLE TRIGGER [StockLst_Process_Recvd_Delete]
GO
/****** Object:  Trigger [dbo].[StockLst_Process_Recvd_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Process_Recvd_Update]'))
EXEC dbo.sp_executesql @statement = N'create TRIGGER [dbo].[StockLst_Process_Recvd_Update] ON [dbo].[StockLst_Process_Recvd] 
FOR UPDATE NOT FOR REPLICATION
AS

PRINT ''Trigger Start [StockLst_Process_Recvd_Update]'';

    
---big UPDATES are in error
DECLARE @Count int
SET @Count = @@ROWCOUNT;
   
IF @Count > 10
BEGIN
	RAISERROR(''Cannot UPDATE more than 10 records of dbo.StockLst_Process_Recvd at one time. trigger StockLst_Process_Recvd_Update'',16,1) 
	ROLLBACK TRANSACTION
	RETURN;
END
----------------------' 
GO
ALTER TABLE [dbo].[StockLst_Process_Recvd] ENABLE TRIGGER [StockLst_Process_Recvd_Update]
GO
/****** Object:  Trigger [dbo].[StockLst_Value_After_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[StockLst_Value_After_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE  TRIGGER [dbo].[StockLst_Value_After_Update] ON [dbo].[StockLst_Value] 
AFTER UPDATE NOT FOR REPLICATION 
AS

PRINT ''Start [StockLst_Value_After_Update]'';

IF UPDATE(CurrUnitPrice) OR UPDATE(CurrUnits)
	begin

	PRINT ''UPDATE dbo.StockLst_Value SET StockLst_Value.CurrTotal = CurrUnitPrice*CurrUnits'';

	UPDATE dbo.StockLst_Value
		SET StockLst_Value.CurrTotal = inserted.CurrUnitPrice * inserted.CurrUnits
		FROM inserted
		WHERE StockLst_Value.ID = inserted.ID
	end
	
		
PRINT ''End   [StockLst_Value_After_Update]'';
		
/*		
UPDATE dbo.StockLst_Value
	SET LastEdit = GETDATE()
	FROM inserted
	WHERE StockLst_Value.ID = inserted.ID
*/
' 
GO
ALTER TABLE [dbo].[StockLst_Value] ENABLE TRIGGER [StockLst_Value_After_Update]
GO
/****** Object:  Trigger [dbo].[Stocklst_Wants_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Stocklst_Wants_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[Stocklst_Wants_Insert] ON [dbo].[StockLst_Wants]
FOR UPDATE NOT FOR REPLICATION
AS
begin
	UPDATE dbo.Stocklst_Wants
		SET CCSortValue = dbo.f_GetCCSortValue(inserted.[CC])
		,FormSort = dbo.f_FormSort(inserted.[Form])
		FROM [inserted]
		WHERE Stocklst_Wants.ID = inserted.ID
end
' 
GO
ALTER TABLE [dbo].[StockLst_Wants] ENABLE TRIGGER [Stocklst_Wants_Insert]
GO
/****** Object:  Trigger [dbo].[Stocklst_Wants_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Stocklst_Wants_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[Stocklst_Wants_Update] ON [dbo].[StockLst_Wants]
FOR UPDATE NOT FOR REPLICATION
AS

IF ( UPDATE(Form) )
	UPDATE dbo.Stocklst_Wants
		SET FormSort = dbo.f_FormSort(inserted.[Form])
		FROM [inserted]
		WHERE Stocklst_Wants.ID = inserted.ID

IF ( UPDATE(CC) )
	UPDATE dbo.Stocklst_Wants
		SET CCSortValue = dbo.f_GetCCSortValue(inserted.[CC])
		FROM [inserted]
		WHERE Stocklst_Wants.ID = inserted.ID
' 
GO
ALTER TABLE [dbo].[StockLst_Wants] ENABLE TRIGGER [Stocklst_Wants_Update]
GO
/****** Object:  Trigger [dbo].[Swage_Log DELETE history]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Swage_Log DELETE history]'))
EXEC dbo.sp_executesql @statement = N'create TRIGGER [dbo].[Swage_Log DELETE history] ON [dbo].[Swage_Log] 
FOR DELETE 
--NOT FOR REPLICATION
AS


PRINT ''Trigger Start [Swage_Log_Delete]'';

/*
INSERT INTO dbo.Ar_Swage_Log_hist 
	([AlloyName],
	[Heat],
	[Lot],
	[Date],
	[sPiece],
	[sSize],
	[sLength],
	[sWeight],
	[GfmSize],
	[fPiece],
	[fSize],
	[fLength],
	[Condition],
	[HTreat],
	[ColdWork],
	[SalesNum],
	[ItemSO],
	[SOitem],
	[Spec],
	[PO],
	[OvenTemp],
	[Notes],
	[Tensile],
	[Yield],
	[Elongation],
	[Red_Area],
	[tLoc],
	[Rockwell],
	[BHN],
	[Tensile2],
	[Yield2],
	[Elongation2],
	[Red_Area2],
	[tLoc2],
	[Rockwell2],
	[BHN2],
	[Tensile3],
	[Yield3],
	[Elongation3],
	[red_area3],
	[tLoc3],
	[Rockwell3],
	[BHN3],
	[Tensile4],
	[Yield4],
	[Elongation4],
	[Red_Area4],
	[tLoc4],
	[Rockwell4],
	[BHN4],
	[Tensile5],
	[Yield5],
	[Elongation5],
	[Red_Area5],
	[tLoc5] ,
	[Rockwell5],
	[BHN5] ,
	[Tensile6] ,
	[Yield6],
	[Elongation6],
	[Red_Area6],
	[tLoc6],
	[Tensile7],
	[Yield7] ,
	[Elongation7],
	[Red_Area7] ,
	[tLoc7] ,
	[TestPO],
	[TestPOitem],
	[TestItemPO],
	[TestSent] ,
	[Lab] ,
	[Passed] ,
	[TestPO2],
	[TestPOitem2],
	[TestSent2],
	[Lab2],
	[Passed2],
	[CustomerMat],
	[Chart],
	[Minutes],
	[GFMp] ,
	[Ovenp],
	[cgp] ,
	[HTrockwell],
	[HTBHN] ,
	[ChartData],
	[SrvcPO] ,
	[LMA_Practice],
	[LMA_Procedure],
	[SpaceX],
	[ID] ,
	[WO] ,
	[WO_Detail] ,
	[Machine] ,
	[Oper],
	[ProjID], 
	[Who],
	[What],
	[When]
	)
   SELECT [AlloyName],
	[Heat],
	[Lot],
	[Date],
	[sPiece],
	[sSize],
	[sLength],
	[sWeight],
	[GfmSize],
	[fPiece],
	[fSize],
	[fLength],
	[Condition],
	[HTreat],
	[ColdWork],
	[SalesNum],
	[ItemSO],
	[SOitem],
	[Spec],
	[PO],
	[OvenTemp],
	[Notes],
	[Tensile],
	[Yield],
	[Elongation],
	[Red_Area],
	[tLoc],
	[Rockwell],
	[BHN],
	[Tensile2],
	[Yield2],
	[Elongation2],
	[Red_Area2],
	[tLoc2],
	[Rockwell2],
	[BHN2],
	[Tensile3],
	[Yield3],
	[Elongation3],
	[red_area3],
	[tLoc3],
	[Rockwell3],
	[BHN3],
	[Tensile4],
	[Yield4],
	[Elongation4],
	[Red_Area4],
	[tLoc4],
	[Rockwell4],
	[BHN4],
	[Tensile5],
	[Yield5],
	[Elongation5],
	[Red_Area5],
	[tLoc5] ,
	[Rockwell5],
	[BHN5] ,
	[Tensile6] ,
	[Yield6],
	[Elongation6],
	[Red_Area6],
	[tLoc6],
	[Tensile7],
	[Yield7] ,
	[Elongation7],
	[Red_Area7] ,
	[tLoc7] ,
	[TestPO],
	[TestPOitem],
	[TestItemPO],
	[TestSent] ,
	[Lab] ,
	[Passed] ,
	[TestPO2],
	[TestPOitem2],
	[TestSent2],
	[Lab2],
	[Passed2],
	[CustomerMat],
	[Chart],
	[Minutes],
	[GFMp] ,
	[Ovenp],
	[cgp] ,
	[HTrockwell],
	[HTBHN] ,
	[ChartData],
	[SrvcPO] ,
	[LMA_Practice],
	[LMA_Procedure],
	[SpaceX],
	[ID] ,
	[WO] ,
	[WO_Detail] ,
	[Machine] ,
	[Oper] ,
	[ProjID]
	,suser_sname()
	, ''Delete''
	, GETDATE() 
    FROM deleted
	*/
' 
GO
ALTER TABLE [dbo].[Swage_Log] ENABLE TRIGGER [Swage_Log DELETE history]
GO
/****** Object:  Trigger [dbo].[Swage_Log_After_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Swage_Log_After_Update]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.Swage_Log_Update     ******/


CREATE TRIGGER [dbo].[Swage_Log_After_Update] 
ON [dbo].[Swage_Log] 
	AFTER UPDATE 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [Swage_Log_After_Update]'';

IF UPDATE(Passed) 
	begin
	PRINT ''Update the WO_Detail for Test POitem''
		
	UPDATE dbo.WorkOrder_Detail
		SET PassTest = inserted.Passed
		FROM inserted
		INNER JOIN dbo.WorkOrder_Detail WO_D ON inserted.WO_Detail = WO_D.WO_Detail
		WHERE WO_D.WO_Detail = inserted.WO_Detail
		AND WO_D.TestPO = inserted.TestPOitem
		AND ISNULL(inserted.Lot,0) > 0
		AND NOT inserted.Passed IS NULL
		AND UPDATE(Passed);

	end

IF UPDATE(Passed) 
begin
	
	DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
	DECLARE @Body varchar(4000)
	DECLARE @Lot	INT = 0
	DECLARE @SOitem	CHAR(10) = ''''
	DECLARE @TestPOitem CHAR(12) = ''''
	DECLARE @WorkOrder INT = 0
	DECLARE @WorkOrder_Detail INT = 0
	DECLARE @ProjID	INT = 0
		
	SELECT TOP 1 
		 @Lot = inserted.Lot
		,@SOitem = ISNULL(inserted.SOitem,'''')
		,@TestPOitem = ISNULL(inserted.TestPOitem,'''')
		,@WorkOrder = ISNULL(inserted.WO,0)
		,@WorkOrder_Detail = ISNULL(inserted.WO_Detail,0)
		,@ProjID = ISNULL(inserted.ProjID,0)
		FROM inserted, deleted
		WHERE inserted.ID = deleted.ID
			AND ISNULL(inserted.Passed,0) = 1 
			AND ISNULL(deleted.Passed,0) = 0	--Pass is now True and was False
			AND ISNULL(inserted.Lot,0) > 0
--			AND ISNULL(inserted.WO_Detail,0)>0 	

	
	IF @Lot > 0
	begin

		--Found a LOT

		--***--
		IF @WorkOrder_Detail > 0
		begin
			PRINT ''Updated WO_Detail''
			PRINT '' from  [WorkOrder_Detail_Update]''
			UPDATE dbo.WorkOrder_Detail
				SET TestPO = @TestPOitem
				,PassTest = 1
				WHERE WO_Detail = @WorkOrder_Detail

			--WorkOrder_Detail.fCmplt is UPDATED when Received 
		end

		--***--
		PRINT '' Send a -Passed Lab Test- Email''
		
		SET @Body = ''<!DOCTYPE html> <html><head><title>HPA Notice</title></head><body>''
		SET @Body = @Body + RTRIM(SUSER_SNAME())+'' updated the Swage_Log ''+'' on ''+RTRIM(CAST(GETDATE()AS CHAR))
			+CHAR(10)+CHAR(13)+''<br>''+''Swag log test Passed for Lot: ''+CAST(@Lot AS CHAR(10)) +''<br>'';

		--SET @Body = @Body+CHAR(13)+''<br>''+''Needs dbo.f_HTML_link_Swage(@Lot) prgrammed.''
		SET @Body = @Body+CHAR(13)+''<br>''+dbo.f_HTML_link_Swage(@Lot)
		
		IF LEN(LTRIM(@SOitem))>6
			begin
			SET @Body = @Body+CHAR(13)+''<br>''+dbo.f_HTML_link_SOitem(@SOitem);
			--Alert SOitem SalesP
			end

		IF @WorkOrder > 0
			begin
			SET @Body = @Body+CHAR(13)+''<br>''+dbo.f_HTML_link_WO(@WorkOrder);
			--Alert WO person
			end

		IF @WorkOrder_Detail > 0
			begin
			SET @Body = @Body+CHAR(13)+''<br>''+dbo.f_HTML_link_WO_Detail(@WorkOrder_Detail);
			--Alert WO person for this WOD
			end
		ELSE
			SET @Body = @Body+CHAR(13)+''<br>''+''No WorkOrder_Detail was found!''

		IF @ProjID > 0
			begin
			SET @Body = @Body+CHAR(13)+''<br>''+''<a href="''+dbo.f_Reportlink_INT(''ProjID'',@ProjID)+''"> ProjectID: ''+LTRIM(RTRIM(CAST(@ProjID AS CHAR)))+''</a>''+''<br>'';
			--Alert ProjID Person
			end

		--@TestPOitem
		SET @Body = @Body+CHAR(13)+''<br>''+dbo.f_HTML_link_POitem(@TestPOitem);

		--Router
		SET @Body = @Body+CHAR(13)+''<br>''+''rtr''; --dbo.f_HTML_link_rtr(@rtr);

		--OT
		SET @Body = @Body+CHAR(13)+''<br>''+''Order Tracking''; --dbo.f_HTML_link_OT(@TrackID);



		SET @Body = @Body+CHAR(10)+CHAR(13)+''<br>'';
		SET @Body = @Body+''The accounting costing needs to be calculated.<br>'';
		SET @Body = @Body+CHAR(10)+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.Swage_Log_After_Update '';
	
		SET @Body = @Body +''</body>+</HTML>''

		--PRINT @Body
		DECLARE @cSubjectEmail VARCHAR(250)
		SET @cSubjectEmail = ''Swage log ''+RTRIM(CAST(@Lot AS CHAR(10)))+'' test Passsed''

		--IF @WorkOrder_Detail > 0	
			EXEC dbo.p_eMail_Send
				@FromEmail = @cEmailFrom, 
				@ToEmail = ''David.Kirchner@ERP_1s.com; ForgeManager@ERP_1s.com; ProductionAccounting@ERP_1s.com;'',
				@SubjectEmail = @cSubjectEmail,
				@BodyEmail = @Body,
				@BodyType = ''HTML''


	end
	ELSE
	begin

	--No LOT! check for Pass is now False!

	SELECT TOP 1 
		 @Lot = inserted.Lot
		,@SOitem = ISNULL(inserted.SOitem,'''')
		,@TestPOitem = ISNULL(inserted.TestPOitem,'''')
		,@WorkOrder = ISNULL(inserted.WO,0)
		,@WorkOrder_Detail = ISNULL(inserted.WO_Detail,0)
		,@ProjID = ISNULL(inserted.ProjID,0)
		FROM inserted, deleted
		WHERE inserted.ID = deleted.ID
		AND inserted.Passed = 0 
		AND deleted.Passed = 1	--Pass was True and is now False
		AND ISNULL(inserted.Lot,0) > 0
--			AND ISNULL(inserted.WO_Detail,0)>0 	

		IF @Lot > 0
		begin
	
			--***--
			IF @WorkOrder_Detail > 0
			begin
				PRINT ''Update WO_Detail''

				UPDATE dbo.WorkOrder_Detail
					SET PassTest = 0
					WHERE WO_Detail = @WorkOrder_Detail
					AND TestPO = @TestPOitem

			end
		end

	end
end

PRINT ''Trigger  End [Swage_Log_After_Update]'';
' 
GO
ALTER TABLE [dbo].[Swage_Log] ENABLE TRIGGER [Swage_Log_After_Update]
GO
/****** Object:  Trigger [dbo].[Swage_Log_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Swage_Log_Update]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.Swage_Log_Update     ******/


create TRIGGER [dbo].[Swage_Log_Update] 
ON [dbo].[Swage_Log] 
	FOR UPDATE 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [Swage_Log_Update]'';

    
---big UPDATES are in error
DECLARE @Count int
SET @Count = @@ROWCOUNT;
   
IF @Count > 1000
BEGIN
	RAISERROR(''Cannot UPDATE more than 1000 records of dbo.Sales_No at one time. trigger Swage_Log_Update'',16,1) 
	ROLLBACK TRANSACTION
	RETURN;
END
----------------------

PRINT ''Trigger  End [Swage_Log_Update]'';
' 
GO
ALTER TABLE [dbo].[Swage_Log] ENABLE TRIGGER [Swage_Log_Update]
GO
/****** Object:  Trigger [dbo].[TC_Replacement_Employees_Times_After_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TC_Replacement_Employees_Times_After_Insert]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Brandon van de Venter
-- Create date: 06/06/2019
-- Description:	Updates Messenger user table clock status
-- =============================================
CREATE TRIGGER [dbo].[TC_Replacement_Employees_Times_After_Insert] 
   ON [dbo].[TC_Replacement_Employees_Times] 
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	DECLARE @employeeId bigint,
			@timeIn datetime,
			@timeOut datetime

	DECLARE EmployeeTimesUpdateCursor cursor for 
		SELECT i.[EmployeeId], [TimeIn], [TimeOut]
		FROM inserted i
		JOIN [Messenger].[dbo].[Users] u on i.EmployeeId = u.EmployeeId

	open EmployeeTimesUpdateCursor
	FETCH NEXT FROM EmployeeTimesUpdateCursor INTO @employeeId, @timeIn, @timeOut
	while @@FETCH_STATUS = 0 
	BEGIN
		
		DECLARE @clockedIn bit = 0,
				@timeNow datetime = GETDATE()
		
		IF (@timeOut IS NOT NULL AND @timeOut < @timeNow)
			BEGIN
				set @clockedIn = 0;
			END
		ELSE IF (@timeIn IS NOT NULL AND @timeIn < @timeNow)
			BEGIN
				set @clockedIn = 1;
			END

		UPDATE [Messenger].[dbo].[Users]
		SET ClockedIn = @clockedIn
		WHERE EmployeeId = @employeeId

		
		FETCH NEXT FROM EmployeeTimesUpdateCursor INTO @employeeId, @timeIn, @timeOut
	END
	close EmployeeTimesUpdateCursor
	DEALLOCATE EmployeeTimesUpdateCursor
END
' 
GO
ALTER TABLE [dbo].[TC_Replacement_Employees_Times] DISABLE TRIGGER [TC_Replacement_Employees_Times_After_Insert]
GO
/****** Object:  Trigger [dbo].[TC_Replacement_Employees_Times_After_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TC_Replacement_Employees_Times_After_Update]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Brandon van de Venter
-- Create date: 06/06/2019
-- Description:	Updates Messenger user table clock status
-- =============================================
CREATE TRIGGER [dbo].[TC_Replacement_Employees_Times_After_Update] 
   ON [dbo].[TC_Replacement_Employees_Times] 
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	DECLARE @employeeId bigint,
			@timeIn datetime,
			@timeOut datetime

	DECLARE EmployeeTimesInsertCursor cursor for 
		SELECT i.[EmployeeId], [TimeIn], [TimeOut]
		FROM inserted i
		JOIN [Messenger].[dbo].[Users] u on i.EmployeeId = u.EmployeeId

	open EmployeeTimesInsertCursor
	FETCH NEXT FROM EmployeeTimesInsertCursor INTO @employeeId, @timeIn, @timeOut
	while @@FETCH_STATUS = 0 
	BEGIN
		
		DECLARE @clockedIn bit = 0,
				@timeNow datetime = GETDATE()
		
		IF (@timeOut IS NOT NULL AND @timeOut < @timeNow)
			BEGIN
				set @clockedIn = 0;
			END
		ELSE IF (@timeIn IS NOT NULL AND @timeIn < @timeNow)
			BEGIN
				set @clockedIn = 1;
			END

		UPDATE [Messenger].[dbo].[Users]
		SET ClockedIn = @clockedIn
		WHERE EmployeeId = @employeeId

		
		FETCH NEXT FROM EmployeeTimesInsertCursor INTO @employeeId, @timeIn, @timeOut
	END
	close EmployeeTimesInsertCursor
	DEALLOCATE EmployeeTimesInsertCursor
END
' 
GO
ALTER TABLE [dbo].[TC_Replacement_Employees_Times] DISABLE TRIGGER [TC_Replacement_Employees_Times_After_Update]
GO
/****** Object:  Trigger [dbo].[TimeTable_Delete]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TimeTable_Delete]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 3/19/2012
-- Description:	
-- =============================================
CREATE TRIGGER [dbo].[TimeTable_Delete]
   ON  [dbo].[TimeTable] 
   AFTER DELETE NOT FOR REPLICATION 
AS 
BEGIN
	SET NOCOUNT ON;

		INSERT INTO dbo.Ar_TimeTable_Hist
		 ([ID]
		  ,[EmployeeID]
		  ,[SOItem]
		  ,[Process]
		  ,[ClockStart]
		  ,[ClockStop]
		  ,[Minutes]
		  ,[BandsawCuts]
		  ,[Who]
		  ,[What]
		  ,[When])
		SELECT [ID]
		  ,[EmployeeID]
		  ,[SOItem]
		  ,[Process]
		  ,[ClockStart]
		  ,[ClockStop]
		  ,[Minutes]
		  ,[BandsawCuts]
		  ,suser_sname()
		  , ''DELETE''
		  , GETDATE() 
		FROM deleted
END' 
GO
ALTER TABLE [dbo].[TimeTable] ENABLE TRIGGER [TimeTable_Delete]
GO
/****** Object:  Trigger [dbo].[UPSTracking_After_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[UPSTracking_After_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[UPSTracking_After_Insert]
   ON  [dbo].[UPSTracking] 
   AFTER INSERT NOT FOR REPLICATION 
AS 
BEGIN

SET NOCOUNT ON;

UPDATE dbo.Packingslip_No
	SET tracking = TrackID 
	FROM inserted 
	WHERE LEN(LTRIM(RTRIM(inserted.TrackID))) > 0
	AND ISNULL(inserted.PackingSli,0) > 0
	AND ISNULL(inserted.void,''Y'') = ''N''
	AND Packingslip_No.PackingSli = inserted.PackingSli

	

DELETE FROM [dbo].[UPSTracking] WHERE ShipDate < GETDATE()-33
  
END
' 
GO
ALTER TABLE [dbo].[UPSTracking] ENABLE TRIGGER [UPSTracking_After_Insert]
GO
/****** Object:  Trigger [dbo].[UserTrack_After_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[UserTrack_After_Insert]'))
EXEC dbo.sp_executesql @statement = N'

CREATE TRIGGER [dbo].[UserTrack_After_Insert] ON [dbo].[UserTrack] 
AFTER UPDATE NOT FOR REPLICATION
AS

--also see [dbo].[Errors]

DECLARE @Server VARCHAR(50)
SET @Server = @@SERVERNAME

Print ''Server ''+ @Server+''. Moving to dbo.NR_UserTrack''
Print ''dbo.NR_UserTrack has not been used to store data since 2022-11-29''

--PRINT @@SERVERNAME

INSERT dbo.NR_UserTrack
	( [mess1],
	[cprogram],
	[errordate],
	[machine],
	[ID],
	[ServerName] )
SELECT   LEFT([mess1],1024),
	LEFT([cprogram],100),
	[errordate],
	[machine],
	[ID],
	ISNULL([ServerName],@Server)
FROM inserted

--Keep ERP_1 clutter free, move to NR_
DELETE FROM dbo.UserTrack WHERE [ErrorDate] < GETDATE() - 90

-- SELECT top 100 * FROM dbo.NR_UserTrack  ORDER BY errordate DESC
-- SELECT top 100 * FROM dbo.Ar_UserTrack_History ORDER BY errordate DESC

--SELECT @@SERVERNAME AS ''Server Name''  ' 
GO
ALTER TABLE [dbo].[UserTrack] ENABLE TRIGGER [UserTrack_After_Insert]
GO
/****** Object:  Trigger [dbo].[UTLog_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[UTLog_Update]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.Swage_Log_Update     ******/


create TRIGGER [dbo].[UTLog_Update] 
ON [dbo].[UTlog] 
	FOR UPDATE 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [UTLog_Update]'';

    
---big UPDATES are in error
DECLARE @Count int
SET @Count = @@ROWCOUNT;
   
IF @Count > 1000
BEGIN
	RAISERROR(''Cannot UPDATE more than 1000 records of dbo.UTLog at one time. trigger _Update'',16,1) 
	ROLLBACK TRANSACTION
	RETURN;
END
----------------------

PRINT ''Trigger  End [UTLog_Update]'';
' 
GO
ALTER TABLE [dbo].[UTlog] ENABLE TRIGGER [UTLog_Update]
GO
/****** Object:  Trigger [dbo].[Vendor_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Vendor_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[Vendor_Insert] ON [dbo].[Vendor] 
FOR INSERT NOT FOR REPLICATION 
AS

DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email();
DECLARE @Body varchar(4000);

-- 08/10/2023 : Brandon van de Venter
-- Added logic to the Trigger to change the distro if the vendor is a test vendor
DECLARE @companyName varchar(100), @toEmail varchar(100) = ''QA@ERP_1s.com'';

SELECT @companyName = inserted.Company
FROM inserted;

IF (@companyName = ''HPA - POST TEST'' OR @companyName = ''HPA - PATCH UPDATE TEST'')
BEGIN
	SET @toEmail = ''development@ERP_1s.com'';
END

SELECT @Body =''<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 5.0 Strict//EN\">''
	+ ''<html>''
	+ ''<head>''
	+ ''    <title></title>''
	+ ''</head>''
	+ ''<table style="width: 100%;">''
	+ ''<tr>''
	+ ''	<td style="width: 100%; font-weight: normal; text-align: center;">''
	+ ''        <img SRC="https://images.ERP_1s.com/v1/images/HPALogo.png"''
	+ ''            WIDTH="170" HEIGHT="69" alt="HPA Logo"></td>''
	+ ''</tr>''
	+ ''<tr>''
	+ ''	<td style="width: 100%; font-weight: normal; text-align: center; font-size: large;">High Performance Alloys</td>''
	+ ''</tr>''
	+ ''<tr>''
	+ ''	<td style="width: 100%; font-weight: normal; text-align: center;">1985 E 500 N, Windfall, IN 46076</td>''
	+ ''</tr>''
	+ ''<tr>''
	+ ''	<td style="width: 100%; font-weight: normal; text-align: center;"><strong>P</strong> 765-945-8230&nbsp;&nbsp;<strong>F</strong> 765-945-8294</td>''
	+ ''</tr>''
	+ ''<tr>''
	+ ''	<td style="width: 100%; font-weight: normal; text-align: center;">&nbsp;</td>''
	+ ''</tr>''
	+ ''</table><p>Quality Assurance Manager,</p><p>This is a notification that Vendor <strong>''+inserted.Company
	+''</strong> has been added to the vendor database </p>''
	+''<p> by '' + SYSTEM_USER + '' on '' + CONVERT(char, GETDATE()) + ''.</p>''
	+ ''<p> trigger dbo.Vendor_Insert </p>''
	+ ''    <p>Regards,</p>''
	+ ''    <p>Automated System<br />''
	+ ''        <a href="mailto:AdminActionItems@ERP_1s.com">AdminActionItems@ERP_1s.com</a></p>''
	+ ''    <p>High Performance Alloys, Inc.<br />''
	+ ''        PH: (800) 472-5569</p>''
	+ ''    <p>An ISO 9001:2015 Registered Company</p>''
	+ ''</body>''
	+ ''</html>''
		FROM inserted

EXEC dbo.p_eMail_Send
		@FromEmail = @cEmailFrom, 
		@ToEmail = @toEmail, 
		@SubjectEmail = ''New Vendor Added'',
		@BodyEmail = @Body,
		@BodyType = ''HTML''
' 
GO
ALTER TABLE [dbo].[Vendor] ENABLE TRIGGER [Vendor_Insert]
GO
/****** Object:  Trigger [dbo].[Vendor_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Vendor_Update]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 8/22/2012
-- Description:	
-- =============================================
CREATE TRIGGER [dbo].[Vendor_Update] 
   ON  [dbo].[Vendor] 
   AFTER UPDATE NOT FOR REPLICATION
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	IF UPDATE(QASurveyDate) 
	BEGIN
		DECLARE @compareDate DateTime = DATEADD(YEAR, -2, GETDATE());

		-- This should probably be disabled as this process is typically handled by GLaDOS.
		-- Additionally, it checks to see if we have placed any PO''s with the Vendor within 2 years.
		-- If this marks the Vendor as "Inactive", but we''ve placed a PO with the Vendor in the last 2 years,
		-- GLaDOS will likely set the Vendor back to "ACTIVE"
		UPDATE ERP_2.dbo.Vendor 
		SET Inactive = 0
		FROM ERP_2.dbo.Vendor 
		INNER JOIN inserted ON Vendor.VendCode = inserted.VendCode
		WHERE UPDATE(QASurveyDate) 
			AND inserted.QASurveyDate is NOT Null
			AND inserted.QASurveyDate > @compareDate
	END


	IF UPDATE(Company)
		BEGIN
			-- ONLY declare and query if the Company column is updated
			DECLARE @before varchar(30) = (SELECT company FROM deleted)
			DECLARE @after varchar(30) = (SELECT company FROM inserted)
			
			IF (@before != @after)
			BEGIN
				DECLARE @toEmail varchar(60) = ''QA@ERP_1s.com'';
				
				-- added 8/14/2023 - Brandon van de Venter
				-- For testing, we want notifications to go to the Development team rather than QA
				-- Later this will alll be handled by the API
				IF (@before = ''HPA - POST TEST'' OR @after = ''HPA - PATCH UPDATE TEST'')
				BEGIN
					SET @toEmail = ''development@ERP_1s.com'';
				END

				-- Only declare and query if the Company name changes 
				DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
				DECLARE @Body VarChar(Max)

				SELECT @Body =''<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 5.0 Strict//EN\">''
					+ ''<html>''
					+ ''<head>''
					+ ''    <title></title>''
					+ ''</head>''
					+ ''<table style="width: 100%;">''
					+ ''<tr>''
					+ ''	<td style="width: 100%; font-weight: normal; text-align: center;">''
					+ ''        <img SRC="https://images.ERP_1s.com/v1/images/HPALogo.png"''
					+ ''            WIDTH="170" HEIGHT="69" alt="HPA Logo"></td>''
					+ ''</tr>''
					+ ''<tr>''
					+ ''	<td style="width: 100%; font-weight: normal; text-align: center; font-size: large;">High Performance Alloys</td>''
					+ ''</tr>''
					+ ''<tr>''
					+ ''	<td style="width: 100%; font-weight: normal; text-align: center;">1985 E 500 N, Windfall, IN 46076</td>''
					+ ''</tr>''
					+ ''<tr>''
					+ ''	<td style="width: 100%; font-weight: normal; text-align: center;"><strong>P</strong> 765-945-8230&nbsp;&nbsp;<strong>F</strong> 765-945-8294</td>''
					+ ''</tr>''
					+ ''<tr>''
					+ ''	<td style="width: 100%; font-weight: normal; text-align: center;">&nbsp;</td>''
					+ ''</tr>''
					+ ''</table><p>Quality Assurance Manager,</p><p>This is a notification that the vendor <strong>''+ d.Company
					+''</strong> has had its name changed to <strong>''+i.Company
					+''</strong> by '' + SYSTEM_USER + '' on '' + CONVERT(char, GETDATE()) + ''.</p>''
					+ ''    <p>Regards,</p>''
					+ ''    <p>Automated System<br />''
					+ ''        <a href="mailto:AdminActionItems@ERP_1s.com">AdminActionItems@ERP_1s.com</a></p>''
					+ ''    <p>High Performance Alloys, Inc.<br />''
					+ ''        PH: (800) 472-5569</p>''
					+ ''    <p>An ISO 9001:2015 Registered Company</p>''
					+ ''</body>''
					+ ''</html>''
					 FROM inserted i
					 join deleted d on (i.VendCode = d.VendCode) 

				EXEC dbo.p_eMail_Send
					 @FromEmail = @cEmailFrom, 
					 @ToEmail = @toEmail, 
					 @SubjectEmail = ''Vendor Name Change'',
					 @BodyEmail = @Body,
					 @BodyType = ''HTML''
			END
		END
END
' 
GO
ALTER TABLE [dbo].[Vendor] ENABLE TRIGGER [Vendor_Update]
GO
/****** Object:  Trigger [dbo].[WIPLst_Detail_After_Delete]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[WIPLst_Detail_After_Delete]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[WIPLst_Detail_After_Delete] ON [dbo].[WIPLst_Detail] 
	AFTER DELETE 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [WIPLst_Detail_After_Delete]'';

--
PRINT '' UPDATE dbo.WIPLst_Master SET MWeight''

UPDATE dbo.WIPLst_Master 
	SET MWeight = dbo.f_GetMWeight_WIPLst_ID(deleted.ID)
	,mS_QTY  = dbo.f_Calc_mS_QTY_WIPLst_ID(deleted.ID)
	FROM dbo.WIPLst_Master
	INNER JOIN deleted ON WIPLst_Master.ID = deleted.ID
	WHERE WIPLst_Master.ID = deleted.ID;


PRINT ''Trigger  End  [WIPLst_Detail_After_Delete]'';
' 
GO
ALTER TABLE [dbo].[WIPLst_Detail] ENABLE TRIGGER [WIPLst_Detail_After_Delete]
GO
/****** Object:  Trigger [dbo].[WIPLst_Detail_Delete]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[WIPLst_Detail_Delete]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[WIPLst_Detail_Delete] ON [dbo].[WIPLst_Detail] 
	FOR DELETE 
	NOT FOR REPLICATION
AS

DECLARE @Count int
SET @Count = @@ROWCOUNT;
        
IF @Count > 100
BEGIN
    RAISERROR(''Cannot DELETE more than 100 records of Lst_Detail at one time.'',16,1) 
    ROLLBACK TRANSACTION
    RETURN;
END

PRINT ''Start trigger [WIPLst_Detail_Delete]'';

---
PRINT '' SELECT @nID_Detail_Process = ID_Detail_Process FROM dbo.WIPLst_Process_Detail   [WIPLst_Detail_Delete]''
DECLARE @nID_Detail_Process INT = 0

SELECT TOP 1 @nID_Detail_Process = ID_Detail_Process 
  FROM dbo.WIPLst_Process_Detail 
  WHERE Who = SUSER_SNAME()
  AND ( What = ''DELETE'' OR What = ''REMOVED'' OR What = ''CONSUMED'' )

PRINT ''ID_Detail_Process = '' +CAST(@nID_Detail_Process AS CHAR(10))


--Warn other Salesmen their stock is gone.
IF EXISTS( 
	SELECT P.ID_Detail FROM dbo.WIPLst_Process P
	JOIN deleted ON deleted.ID_Detail = P.ID_Detail
	WHERE P.AllowSub = ''N''
	AND P.Process_ID = ''SELECTED''
	AND 
	( NOT
	 ( P.SOitem IN 
	 (SELECT DISTINCT SOitem 
      FROM dbo.Ar_WIPLst_Process_History
      WHERE ID_Detail_Process IN 
	   (SELECT DISTINCT ID_Detail_Process 
        FROM dbo.WIPLst_Process_Detail 
        WHERE Who = SUSER_SNAME() AND ( What = ''DELETE'' OR What = ''REMOVED'' OR What = ''CONSUMED'' )
       )
      )	
	 )
	OR
	 ( P.WO IN 
	 (SELECT DISTINCT WO
      FROM dbo.Ar_WIPLst_Process_History
      WHERE ID_Detail_Process IN 
	   (SELECT DISTINCT ID_Detail_Process 
        FROM dbo.WIPLst_Process_Detail 
        WHERE Who = SUSER_SNAME() AND ( What = ''DELETE'' OR What = ''REMOVED'' OR What = ''CONSUMED'' )
       )
      )	
	 )
	)
)
begin
	PRINT '' Found Selected WIP Process that is dependant on the consumed stock.  [WIPLst_Detail_Delete]''

	SELECT ROW_NUMBER() OVER(ORDER BY ID_Detail_Process) AS RowID
	  ,P.ID_Detail_Process
	  ,P.ID_Detail
	  ,P.PO_item
	  ,P.SOitem
	  ,P.WO
		INTO #tmpWIPLst_Process FROM dbo.WIPLst_Process P
		JOIN deleted ON deleted.ID_Detail = P.ID_Detail
		WHERE P.AllowSub = ''N''
		AND P.Process_ID = ''SELECTED''
		AND NOT P.SOitem IN 
		(SELECT DISTINCT SOitem 
			FROM dbo.Ar_WIPLst_Process_History
			WHERE ID_Detail_Process IN 
			(SELECT DISTINCT ID_Detail_Process 
				FROM dbo.WIPLst_Process_Detail 
				WHERE Who = SUSER_SNAME() AND ( What = ''DELETE'' OR What = ''REMOVED'' OR What = ''CONSUMED'' )
			)
		)		ORDER BY ID_Detail_Process
	
	DECLARE @nTmpID_Detail_Process INT, @nTmpID_Detail INT
	DECLARE @NumberRecords int, @RowCount int
	DECLARE @SOitem CHAR(10)
	DECLARE @POitem CHAR(12)
	DECLARE @WO INT = 0
	--DECLARE @SOitem CHAR(10)
	-- Get the number of records in the temporary table
	SET @NumberRecords = @@ROWCOUNT
	SET @RowCount = 1
	
	-- loop through all records in the temporary table
	-- using the WHILE loop construct
	WHILE @RowCount <= @NumberRecords
	BEGIN
		SELECT @nTmpID_Detail_Process = ID_Detail_Process
			,@nTmpID_Detail = ID_Detail 
			,@SOitem = SOitem
			,@POitem = PO_item
			,@WO = ISNULL(WO,0)
			FROM #tmpWIPLst_Process
			WHERE RowID = @RowCount

		PRINT '' Send Salesman Warning Email that their selected Stock Detail was consumed.  [WIPLst_Detail_Delete]''	
		EXEC dbo.p_Warn_Stk_Deleted @nTmpID_Detail_Process, ''W'', @nTmpID_Detail, @SOitem, @WO
		
		SET @RowCount = @RowCount + 1
	END
	DROP TABLE #tmpWIPLst_Process
end

---
---------------------------------------------
-- Send the Deleted ID to Email for Review.

DECLARE @ID_Detail INT = 0
SELECT TOP 1 @ID_Detail = ID_Detail FROM deleted

DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
DECLARE @Body varchar(4000)
	SET @Body = ''WIP ID_Detail = ''+ CAST(@ID_Detail AS CHAR(10))
	SET @Body=@Body+CHAR(13)+''nID_Detail_Process = ''+CAST(@nID_Detail_Process AS CHAR(10))
	SET @Body=@Body+CHAR(13)+''Entered by ''+RTRIM(suser_sname())+'' on ''+RTRIM(GETDATE())  
	SET @Body=@Body+CHAR(10)+CHAR(13)+@@SERVERNAME+'' TRIGGER dbo.WIPLst_Detail_Delete '' 
	

	EXEC dbo.p_eMail_Send
		@FromEmail = @cEmailFrom, 
		@ToEmail = ''VFPprogramming@ERP_1s.com'', 
		@SubjectEmail = ''WIPLst Detail Deleted.'',
		@BodyEmail = @Body,
		@BodyType = ''TEXT''
		
---
PRINT '' SELECT @nID_Detail_Process = ID_Detail_Process FROM dbo.WIPLst_Process_Detail   [WIPLst_Detail_Delete]''

SELECT @nID_Detail_Process = ID_Detail_Process 
  FROM dbo.WIPLst_Process_Detail 
  WHERE Who = SUSER_SNAME() 
  AND ( What = ''DELETE'' OR What = ''REMOVED'' OR What = ''CONSUMED'' )

PRINT ''remove @nID_Detail_Process = ''+CAST( @nID_Detail_Process AS CHAR(10))

-------
IF EXISTS(SELECT * FROM dbo.WIPLst_Process P INNER JOIN deleted ON deleted.ID_Detail = P.ID_Detail)
	begin
		Print ''Delete Process that belong to the Detail record being DELETED.''

		DELETE FROM dbo.WIPLst_Process 
		WHERE ID_Detail_Process IN 
		(SELECT P.ID_Detail_Process FROM dbo.WIPLst_Process P
			INNER JOIN deleted ON deleted.ID_Detail = P.ID_Detail
		)

	end

---
PRINT '' INSERT dbo.Ar_WIPLst_Detail_History FROM deleted  [WIPLst_Detail_Delete]''
INSERT dbo.Ar_WIPLst_Detail_History 
	([ID_Detail_Process],
	[What],
	[When],
	[ProcessValue],
	[size_h],
	[size_l],
	[pc],
	[dim1],
	[dim2],
	[dim3],
	[length],
	[weight],
	[costvalue],
	[descript],
	[location],
	[floorstatus],
	[class],
	[unit],
	[randlen],
	[InvCheck],
	[id],
	[id_detail],
	[ReceivingID],
	[InvoiceValue],
	[Quarantine],
	[S_QTY],
	[S_P],
	[S_Total],
	[S_PU],
	[Prime],
	[WO],
	sStockLst_ID_Detail,
	fStockLst_ID_Detail
	)
SELECT TOP 1
	BPH.ID_Detail_Process,
	''DELETE'',
	GetDate(),
	-(d.S_QTY * d.S_P),
	d.[size_h],
	d.[size_l],
	d.[pc],
	d.[dim1],
	d.[dim2],
	d.[dim3],
	d.[length],
	d.[weight],
	d.[costvalue],
	d.[descript],
	d.[location],
	d.[floorstatus],
	d.[class],
	d.[unit],
	d.[randlen],
	d.[InvCheck],
	d.[id],
	d.[id_detail],
	d.[ReceivingID],
	d.[InvoiceValue],
	d.[Quarantine],
	d.[S_QTY],
	d.[S_P],
	d.[S_Total],
	d.[S_PU],
	d.[Prime],
	d.[WO],
	d.sStockLst_ID_Detail,
	d.fStockLst_ID_Detail
 FROM deleted d
 	INNER JOIN dbo.Ar_WIPLst_Process_History BPH ON BPH.ID_Detail = d.ID_Detail 
--	WHERE BPH.[WHAT] = ''DELETE''
	ORDER BY BPH.[When] DESC

---************************************************************************************

PRINT '' INSERT dbo.Ar_WIPLst_Process_GS_History   [WIPLst_Detail_Delete]''
INSERT dbo.Ar_WIPLst_Process_GS_History 
	(What,
	[When],
	[SOitem],
	[comment],
	[process_id],
	[PWeight],
	[PPc],
	[id_detail],
	[id_detail_process],
	[Validated],
	[S_QTY],
	[S_P],
	[S_PU])
  SELECT ''DELETE'',
	GetDate(),
	BPH.SOitem,
	''WIPLst_Detail Delete'',
	''GS DELETE'',
	BD.[Weight],
	BD.[Pc],
	bd.[id_detail],
	BPH.ID_Detail_Process,
	0,
	BD.[S_QTY],
	BD.[S_P],
	BD.[S_PU]
    FROM  dbo.WIPLst_Process_Detail BPD 
	INNER JOIN dbo.Ar_WIPLst_Process_History BPH 
		ON BPH.ID_Detail_Process = BPD.ID_Detail_Process 
	INNER JOIN WIPLst_Detail BD 
		ON BD.ID_Detail = BPD.ID_Detail
	WHERE BPD.Who = SUSER_SNAME() AND ( BPD.What = ''DELETE'' OR BPD.What = ''REMOVED'' OR BPD.What = ''CONSUMED'' )

---

PRINT '' DELETE FROM dbo.WIPLst_Process_Detail WHERE Who = SUSER_SNAME()   [WIPLst_Detail_Delete]''
DELETE FROM dbo.WIPLst_Process_Detail 
  WHERE Who = SUSER_SNAME()  AND 
  ( What = ''DELETE'' OR What = ''REMOVED'' OR What = ''CONSUMED'' )

PRINT ''Trigger  End  [WIPLst_Detail_Delete]'';
' 
GO
ALTER TABLE [dbo].[WIPLst_Detail] ENABLE TRIGGER [WIPLst_Detail_Delete]
GO
/****** Object:  Trigger [dbo].[WIPLst_Detail_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[WIPLst_Detail_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[WIPLst_Detail_Insert] 
ON [dbo].[WIPLst_Detail] 
	FOR INSERT 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [WIPLst_Detail_Insert]'';

DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
DECLARE @Body varchar(4000)

IF EXISTS ( SELECT * FROM inserted INNER JOIN dbo.PU ON inserted.S_PU = PU.PU WHERE inserted.S_P > PU.Max_P )
BEGIN
	
	--Found too high of a Unit Price (S_PU), check for $/Lb of 1000, $/FT of 5,000 and $/PC of 500,000
		
	SELECT @Body = ''Cannot insert to dbo.WIPLst_Detail, Found too high of a Unit Price.''+CHAR(13)
		+ RTRIM(PU.Unit) + '' is over the ''+CAST(PU.Max_P AS VARCHAR(25))+ '' max rule set in dbo.pU.'' + CHAR(13)
		+ ''ID= ''+CAST(ID AS CHAR(10))+'' ID_Detail= ''+CAST(ID_Detail AS CHAR(10))+'' PU=''+ CAST(S_PU AS CHAR(1)) +''  S_P=''+CAST(S_P AS VARCHAR(25))+CHAR(13)
		+''. ''+ISNULL([Length],'''') 
		FROM inserted
		INNER JOIN dbo.PU ON inserted.S_PU = PU.PU
			WHERE inserted.S_P > PU.Max_P
		

	SET @Body = @Body+RTRIM(suser_sname())+CHAR(13)
		+@@SERVERNAME+'' TRIGGER ERP_2.dbo.WIPLst_Detial_Insert ''
			
	EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
		 @SubjectEmail = ''BAD Detail PU'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''
		 		
	SET @Body = ''Insert into dbo.WIPLst_Detail table failed. S_PU above limit.''
	RAISERROR( @Body, 16, -1)

END



--- Done After
--PRINT '' UPDATE dbo.StockLst_Master SET MWeight    [StockLst_Detail_Insert]''
--UPDATE dbo.StockLst_Master 
--	SET MWeight = dbo.f_GetMWeight_StockLst_ID(inserted.ID)
--	FROM dbo.StockLst_Master
--	INNER JOIN inserted ON Stocklst_Master.ID = inserted.ID

---
DECLARE @ID INT = 0
DECLARE @WO INT = 0

PRINT ''SELECT TOP 1 ID, WO''
--SELECT TOP 1 ID = @ID, WO = @WO
SET @ID = (SELECT TOP 1 inserted.ID
	FROM inserted )
SET @WO = (SELECT TOP 1 inserted.WO
	FROM inserted )
PRINT @WO

PRINT '' INSERT dbo.Ar_WIPLst_Detail_History FROM inserted.   [WIPLst_Detail_Insert]''
INSERT dbo.Ar_WIPLst_Detail_History 
	([ID_Detail_Process],
	[ProcessValue],
	[What],
	[size_h],
	[size_l],
	[pc],
	[dim1],
	[dim2],
	[dim3],
	[length],
	[weight],
	[costvalue],
	[descript],
	[location],
	[floorstatus],
	[class],
	[unit],
	[RandLen],
	[InvCheck],
	[id],
	[id_detail],
	[ReceivingID],
	[InvoiceValue],
	[AccountingCheck],
	[Quarantine],
	[S_QTY],
	[S_P],
	[S_Total],
	[S_PU],
	[Prime]
	,[WO]
	,sStockLst_ID_Detail
	,fStockLst_ID_Detail
	)
SELECT 	ISNULL(spd.ID_Detail_Process,0),
	(inserted.S_QTY * inserted.S_P),
	''ADD'',
	inserted.[size_h],
	inserted.[size_l],
	inserted.[pc],
	inserted.[dim1],
	inserted.[dim2],
	inserted.[dim3],
	inserted.[length],
	inserted.[weight],
	inserted.[costvalue],
	inserted.[descript],
	inserted.[location],
	inserted.[floorstatus],
	inserted.[class],
	inserted.[unit],
	inserted.[RandLen],
	inserted.[InvCheck],
	inserted.[id],
	inserted.[id_detail],
	inserted.[ReceivingID],
	inserted.[InvoiceValue],
	inserted.[AccountingCheck],
	inserted.[Quarantine],
	inserted.[S_QTY],
	inserted.[S_P],
	inserted.[S_Total],
	inserted.[S_PU],
	inserted.[Prime],
	inserted.[WO],
	inserted.sStockLst_ID_Detail,
	inserted.fStockLst_ID_Detail
 FROM inserted
 LEFT OUTER JOIN dbo.WIPLst_Process_Detail spd ON inserted.ID = spd.ID 
	AND inserted.WO = spd.WO 
		--AND spd.Who = SUSER_SNAME() AND ( spd.What = ''ADD'' OR spd.What = ''Work Order'' )

/*
PRINT '' INSERT dbo.Ar_WIPLst_Process_GS_History    [WIPLst_Detail_Insert]''

 INSERT dbo.Ar_WIPLst_Process_GS_History 
	(What,
	[When],
	[SOitem],
	[comment],
	[process_id],
	[PWeight],
	[PPc],
	[id_detail],
	[id_detail_process],
	[Validated],
	[S_QTY],
	[S_P],
	[S_PU])
  SELECT ''INSERT'',
	GETDATE(),
	spd.SOitem,
	''WIPLst_Detail Insert'',
	''GS INSERT'',
	i.[Weight],
	i.[Pc],
	i.[id_detail],
	ISNULL(spd.ID_Detail_Process,0),
	0,
	i.[S_QTY],
	i.[S_P],
	i.[S_PU]
    FROM inserted i  
	LEFT OUTER JOIN dbo.WIPLst_Process_Detail spd ON i.ID = spd.ID 
		AND spd.Who = SUSER_SNAME() AND spd.What = ''ADD''

*/
---
IF @ID > 0 
begin
	PRINT '' DELETE FROM dbo.WIPLst_Process_Detail WHERE Who = SUSER_SNAME() AND What = ADD    [WIPLst_Detail_Insert]''

	IF @WO > 0
		DELETE FROM dbo.WIPLst_Process_Detail 
			WHERE ID = @ID AND WO = @WO
	ELSE
		DELETE FROM dbo.WIPLst_Process_Detail 
			WHERE ID = @ID 

 end

PRINT ''Trigger  End  [WIPLst_Detail_Insert]'';
' 
GO
ALTER TABLE [dbo].[WIPLst_Detail] ENABLE TRIGGER [WIPLst_Detail_Insert]
GO
/****** Object:  Trigger [dbo].[WIPLst_Master_After_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[WIPLst_Master_After_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[WIPLst_Master_After_Insert] ON [dbo].[WIPLst_Master] 
	AFTER INSERT  
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [WIPLst_Master_After_Insert]'';

INSERT dbo.Ar_WIPLst_Master_History 
	([WHO],[WHAT],[WHEN],
	[alloy],
	[form],
	[cc],
	[CL],
	[size],
	[cond],
	[mweight],
	[specs],
	[heat],
	[lot],
	[Paid],
	[po_item],
	[poduedate],
	[mill],
	[stkdate],
	[history],
	[num],
	[PoStatus],
	[BrandName],MillTrace,
	[FROM_ID],
	[Melt],
	[id],
	[mS_QTY],
	[WO_Detail],
	[ProjID])
SELECT 	suser_sname(),''ADD'',GetDate(),
	[alloy],
	[form],
	[cc],
	[CL],
	[size],
	[cond],
	[mweight],
	[specs],
	[heat],
	[lot],
	[Paid],
	[po_item],
	[poduedate],
	[mill],
	[stkdate],
	[history],
	[num],
	[PoStatus],
	[BrandName],MillTrace,
	[FROM_ID],
	[Melt],
	[id],
	[mS_QTY],
	[WO_Detail],
	[ProjID]
 FROM inserted


INSERT dbo.WIPLst_Master_Inserted
	( Master_ID, [Who], [When]  )
SELECT ID, suser_sname(), GetDate() FROM inserted


PRINT ''Trigger  End  [StockLst_Master_After_Insert]'';
' 
GO
ALTER TABLE [dbo].[WIPLst_Master] ENABLE TRIGGER [WIPLst_Master_After_Insert]
GO
/****** Object:  Trigger [dbo].[WIPLst_Master_After_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[WIPLst_Master_After_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[WIPLst_Master_After_Update] ON [dbo].[WIPLst_Master] 
	AFTER UPDATE 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [WIPLst_Master_After_Update]'';

 IF UPDATE(alloy)
 OR UPDATE(form)
 OR UPDATE(cc)
 OR UPDATE(CL)
 OR UPDATE(size)
 OR UPDATE(cond)
 OR UPDATE(specs) 
 OR UPDATE(heat)
 OR UPDATE(lot)
 OR UPDATE(Paid)
 OR UPDATE(mill)
 OR UPDATE(stkdate)
 OR UPDATE(history)
 OR UPDATE(num)
 OR UPDATE(PoStatus)
begin

	INSERT dbo.Ar_WIPLst_Master_History 
		([Who],[what],[When],
		[alloy],
		[form],
		[cc],
		[CL],
		[size],
		[cond],
		[mweight],
		[specs],
		[heat],
		[lot],
		[Paid],
		[po_item],
		[poduedate],
		[mill],
		[stkdate],
		[history],
		[num],
		[PoStatus],
		[BrandName],MillTrace,
		[FROM_ID],
		[Melt],
		[id],
		[mS_QTY],
		[WO_Detail],
		[ProjID])
	SELECT 	SUSER_SNAME(),''BEFOREEDIT'',GETDATE(),
		[alloy],
		[form],
		[cc],
		[CL],
		[size],
		[cond],
		[mweight],
		[specs],
		[heat],
		[lot],
		[Paid],
		[po_item],
		[poduedate],
		[mill],
		[stkdate],
		[history],
		[num],
		[PoStatus],
		[BrandName],MillTrace,
		[FROM_ID],
		[Melt],
		[id],
		[mS_QTY],
		[WO_Detail],
		[ProjID]
	 FROM Deleted

	INSERT dbo.Ar_WIPLst_Master_History 
		([who],[what],[When],
		[alloy],
		[form],
		[cc],
		[CL],
		[size],
		[cond],
		[mweight],
		[specs],
		[heat],
		[lot],
		[Paid],
		[po_item],
		[poduedate],
		[mill],
		[stkdate],
		[history],
		[num],
		[PoStatus],
		[BrandName],MillTrace,
		[FROM_ID],
		[Melt],
		[id],
		[mS_QTY],
		[WO_Detail],
		[ProjID] )
	SELECT 	SUSER_SNAME(),''AFTER EDIT'',GETDATE(),
		[alloy],
		[form],
		[cc],
		[CL],
		[size],
		[cond],
		[mweight],
		[specs],
		[heat],
		[lot],
		[Paid],
		[po_item],
		[poduedate],
		[mill],
		[stkdate],
		[history],
		[num],
		[PoStatus],
		[BrandName],MillTrace,
		[FROM_ID],
		[Melt],
		[id],
		[mS_QTY],
		[WO_Detail],
		[ProjID]
	 FROM inserted
	 

end

PRINT ''Trigger  End  [WIPLst_Master_After_Update]'';
' 
GO
ALTER TABLE [dbo].[WIPLst_Master] ENABLE TRIGGER [WIPLst_Master_After_Update]
GO
/****** Object:  Trigger [dbo].[WIPLst_Master_Delete]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[WIPLst_Master_Delete]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.StockLst_Master_Delete    Script Date: 7/1/2004 1:57:08 PM ******/


CREATE TRIGGER [dbo].[WIPLst_Master_Delete] ON [dbo].[WIPLst_Master] 
	FOR DELETE 
	NOT FOR REPLICATION
AS
 

---big deletes are in error
DECLARE @Count int
SET @Count = @@ROWCOUNT;
        
IF @Count > 100
BEGIN
    RAISERROR(''Cannot DELETE more than 100 records of Lst_Master at one time.'',16,1) 
    ROLLBACK TRANSACTION
    RETURN;
END


PRINT ''Trigger Start [WIPLst_Master_delete]'';

INSERT dbo.Ar_WIPLst_Master_History 
	([WHO],[WHAT],[WHEN],
	[alloy],
	[cc],
	[CL],
	[form],
	[size],
	[cond],
	[mweight],
	[specs],
	[heat],
	[lot],
	[Paid],
	[po_item],
	[poduedate],
	[mill],
	[stkdate],
	[history],
	[num],
	[PoStatus],
	[BrandName],MillTrace,
	[FROM_ID],
	[Melt],
	[id],
	[mS_QTY],
	[WO_Detail],
	[ProjID]
	)
SELECT 	suser_sname(),''DELETE'',GetDate(),
	[alloy],
	[cc],
	[CL],
	[form],
	[size],
	[cond],
	[mweight],
	[specs],
	[heat],
	[lot],
	[Paid],
	[po_item],
	[poduedate],
	[mill],
	[stkdate],
	[history],
	[num],
	[PoStatus],
	[BrandName],MillTrace,
	[FROM_ID],
	[Melt],
	[id],
	[mS_QTY],
	[WO_Detail],
	[ProjID]
	
 FROM Deleted

PRINT ''Trigger  End  [WIPLst_Master_delete]'';
' 
GO
ALTER TABLE [dbo].[WIPLst_Master] ENABLE TRIGGER [WIPLst_Master_Delete]
GO
/****** Object:  Trigger [dbo].[WIPLst_Master_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[WIPLst_Master_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[WIPLst_Master_Insert] ON [dbo].[WIPLst_Master] 
	FOR INSERT 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [WIPLst_Master_Insert]'';

/*  Could be POitem or WO_Detail
DECLARE @cEmailFrom VARCHAR(30) 
DECLARE @WO_Detail INT = 0

IF EXISTS ( SELECT * FROM inserted WHERE 
		NOT ( SUBSTRING(PO_item,10,1) = ''-'' 
		AND ISNULL(WO_Detail,0) = 0)  )
	BEGIN

	SET @cEmailFrom = ERP_2.dbo.f_GetSQL_Server_Email();

	DECLARE @Body varchar(4000)
	DECLARE @badPOitem CHAR(12) = ''''
		
	SELECT @Body = ''Cannot insert to dbo.WIPLst_Master, SOitem is not Proper and WO_Detail is 0,''+CHAR(13)
		
	SELECT TOP 1 @badPOitem = PO_item  FROM inserted 
		WHERE SUBSTRING(PO_item,1,9) Like ''%-%''

	SET @Body = @Body+'' PO item:''+@badPOitem +''.''
			+''WO_Detail:0.''+CHAR(13)
			+CHAR(13)+(suser_sname())
			+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.WIPLst_Master_Insert ''
			
	EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
		 @SubjectEmail = ''BAD POitem'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''
		 		
	SET @Body = ''Insert into dbo.WIPLst_Master table failed. POitem:''+@badPOitem+'' not Proper.''
	RAISERROR( @Body, 16, -1)

	PRINT '' Insert into dbo.WIPLst_Master table failed. POitem:''+@badPOitem+'' not Proper.  [WIPLst_Master_Insert]''

	END


IF EXISTS ( SELECT * FROM inserted WHERE 
		LEN(PO_Item)=0 AND ISNULL(WO_Detail,0) = 0)
	BEGIN
	--DECLARE @Body varchar(4000)
	DECLARE @badID INT
	
	SET @cEmailFrom = ERP_2.dbo.f_GetSQL_Server_Email();

	SELECT @Body = ''Inserted into dbo.WIPLst_Master whith empty PO and WO_Detail is 0.''+CHAR(13)
		
	SELECT TOP 1 @badID = ID FROM inserted WHERE 
		 LEN(PO_Item)=0 AND ISNULL(WO_Detail,0) = 0

	SET @Body = @Body+'' WIPLst_Master ID=''+CAST(@badID AS CHAR(10))+''.''
			+''WO_Detail:0.''+CHAR(13)
			+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.WIPLst_Master_After_Insert ''
			
	EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
		 @SubjectEmail = ''Check WIPLst_Master Insert  -BAD POitem and WO_Detail'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''
		 		
	RAISERROR( @Body, 16, -1)

	PRINT '' Inserted into dbo.WIPLst_Master whith empty PO.  [WIPLst_Master_Insert]''

	END
*/

PRINT ''Trigger  End  [WIPLst_Master_Insert]'';
' 
GO
ALTER TABLE [dbo].[WIPLst_Master] ENABLE TRIGGER [WIPLst_Master_Insert]
GO
/****** Object:  Trigger [dbo].[WIPLst_Master_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[WIPLst_Master_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE  TRIGGER [dbo].[WIPLst_Master_Update] ON [dbo].[WIPLst_Master] 
	FOR UPDATE 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [WIPLst_Master_Update]'';

IF EXISTS ( SELECT * FROM inserted WHERE 
							NOT SUBSTRING( dbo.f_ProperPOitem( PO_item ),10,1) = ''-''
							AND ISNULL(WO_Detail,0) = 0 )  

	BEGIN
	DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
	DECLARE @Body varchar(4000)
	DECLARE @badPOitem CHAR(10)
	DECLARE @ID INT
	DECLARE @WO_Detail INT = 0
	
	SELECT @Body = ''Cannot update dbo.WIPLst_Master, POitem is not Proper,''+CHAR(13)
	
	SELECT TOP 1 @badPOitem = PO_item, @ID=ID, @WO_Detail=ISNULL(WO_Detail,0)  
		FROM inserted WHERE NOT ( SUBSTRING(PO_item,10,1) = ''-'' 
		AND ISNULL(WO_Detail,0) = 0) 
	
	SET @Body = @Body+'' PO item:''+@badPOitem +''.''
		+'' WO_Detil = 0.''+CHAR(13)
		+CHAR(13)+''WIPLst_Master ID:''+CAST(@ID AS CHAR(10))
		+CHAR(13)+(suser_sname())
		+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.WIPLst_Master_Update ''
		
	EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
		 @SubjectEmail = ''BAD POitem and WO_Detail'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''
					
	SET @Body = ''Update dbo.WIPLst_Master_Update table failed. POitem:''
		+@badPOitem+'' not Proper and WO_Detail = 0.''

--	RAISERROR( @Body, 16, -1)

	PRINT ''Set to pass this time.  Update dbo.WIPLst_Master_Update table failed. POitem:''+@badPOitem+'' not Proper and WO_Detail=0. [WIPLst_Master_Update]''
END

PRINT ''Trigger  End  [WIPLst_Master_Update]'';
' 
GO
ALTER TABLE [dbo].[WIPLst_Master] ENABLE TRIGGER [WIPLst_Master_Update]
GO
/****** Object:  Trigger [dbo].[WIPLst_Process_After_Delete]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[WIPLst_Process_After_Delete]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.StockLst_Process_Delete    Script Date: 11/30/2005 3:54:44 PM ******/
CREATE TRIGGER [dbo].[WIPLst_Process_After_Delete]
ON [dbo].[WIPLst_Process] 
  AFTER DELETE 
  NOT FOR REPLICATION
AS

PRINT ''Trigger Start [WIPLst_Process_After_Delete]'';
IF EXISTS( SELECT * from deleted WHERE LEN(LTRIM(deleted.SOitem)) > 7 )
	begin
	
	PRINT '' SOitem Deleted from WIPLst_Process''
	
	INSERT dbo.NR_UserTrack 
		([mess1],[cprogram])
		SELECT LEFT(''SOitem:''+soitem+'' WIPLst Process was Deleted'',1024) AS Mess1
		, LEFT(''WIPLst_Process_Delete trigger'',100) AS cProgram
		FROM deleted 
		WHERE LEN(LTRIM(SOitem)) > 7
	end
	
PRINT ''Trigger  End  [WIPLst_Process_After_Delete]'';
' 
GO
ALTER TABLE [dbo].[WIPLst_Process] ENABLE TRIGGER [WIPLst_Process_After_Delete]
GO
/****** Object:  Trigger [dbo].[WIPLst_Process_After_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[WIPLst_Process_After_Insert]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.BrokerLst_Process_Insert    Script Date: 11/30/2005 4:02:11 PM ******/
CREATE TRIGGER [dbo].[WIPLst_Process_After_Insert] ON [dbo].[WIPLst_Process] 
  AFTER INSERT 
  NOT FOR REPLICATION
AS


PRINT ''Trigger Start [WIPLst_Process_After_Insert]'';
--Run clean up Process- These Process_ID are designed to be scavanged

IF EXISTS(SELECT * FROM inserted WHERE 
  (inserted.[process_id] = ''RECEIVED'' 
  or inserted.[process_id] = ''Sell Stock''   
  or inserted.[process_id] = ''Shipped'' 
  or inserted.[process_id] = ''Receiving'' 
  or inserted.[process_id] = ''CORRECTION''
  or inserted.[process_id] = ''CANCELLED'')
  and inserted.[id_detail_process] > 0 ) 
	begin
	
	PRINT ''After Insert, some [Process_ID] types will be triggered for Delete''
	PRINT ''Deleting from WIPLst_Process WHERE Process_ID is: RECEIVED, Sell Stock, Shipped, Receiving or Correction.''
	
	DELETE FROM dbo.WIPLst_Process WHERE WIPLst_Process.[id_detail_process] IN 
		( SELECT [id_detail_process] FROM inserted WHERE 
			( inserted.[process_id] = ''RECEIVED''   
			or inserted.[process_id] = ''Sell Stock'' 
			or inserted.[process_id] = ''Shipped'' 
			or inserted.[process_id] = ''Receiving''
			or inserted.[process_id] = ''CORRECTION''
			or inserted.[process_id] = ''CANCELLED'' )
			  and inserted.[id_detail_process] > 0  )
			  
	end

PRINT ''Trigger  End  [WIPLst_Process_After_Insert]'';
' 
GO
ALTER TABLE [dbo].[WIPLst_Process] ENABLE TRIGGER [WIPLst_Process_After_Insert]
GO
/****** Object:  Trigger [dbo].[WIPLst_Process_After_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[WIPLst_Process_After_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[WIPLst_Process_After_Update] 
  ON [dbo].[WIPLst_Process] 
  AFTER UPDATE 
  NOT FOR REPLICATION
AS


PRINT ''Trigger Start [WIPLst_Process_After_Update]'';

DECLARE @Body varchar(4000)

--Send Email alert
IF EXISTS(SELECT * FROM inserted WHERE inserted.[Process_ID] = ''Shipped'') 
	BEGIN
	PRINT ''Send Email as -WIP marked as Shipped, but still on WIPLst''
	DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()	
	SELECT TOP 1 @Body = ''SO-Item:''+inserted.SOitem
		+''"''+dbo.f_Reportlink_CHAR(''SOitem'',inserted.SOitem)+''"''
		+'' was marked as SHIPPED on WIPLst_Process:''
		+RTRIM(CAST(inserted.id_detail_process AS CHAR))
		+CHAR(13)+'' on ''+RTRIM(CAST(GETDATE()AS CHAR))
		+CHAR(13)+'', but still listed on WIPLst''  
		+CHAR(10)+CHAR(13)
		FROM inserted
		WHERE inserted.[Process_ID] = ''Shipped'';

		SET @Body = @Body +ISNULL(@@SERVERNAME,''SRVR '')+'' TRIGGER ERP_2.dbo.WIPLst_Process_After_Update '';
		
		EXEC dbo.p_eMail_Send
		 @FromEmail = cEmailFrom, 
		 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
		 @SubjectEmail = ''Stock marked as Shipped, but still on WIPLst'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''
		 
		 SET @Body = ''Stock marked as Shipped, but still on BrokerLst.''+CHAR(10)+CHAR(13)+@Body;
		 
		INSERT INTO dbo.NR_UserTrack ([mess1],[cprogram]) VALUES ( LEFT(@Body,1024),LEFT(''TRIGGER ERP_2.dbo.WIPLst_Process_After_Update Alert'',100))
	END

--********	

--Delete ENDING process''
IF EXISTS(SELECT * FROM inserted WHERE 
	  (inserted.[Process_ID] = ''RECEIVED'' 
	or inserted.[Process_ID] = ''Sell Stock'' 
	or inserted.[Process_ID] = ''Shipped''
	or inserted.[Process_ID] = ''Receiving''
	or inserted.[Process_ID] = ''CORRECTION''
	or inserted.[Process_ID] = ''CANCELLED'' )
	and inserted.[ID_Detail_Process] > 0 )
	begin
	
	INSERT INTO dbo.NR_UserTrack ([mess1],[cprogram]) 
		SELECT LEFT(''SO-Item:''+inserted.SOitem+'' deleted from WIPLst_Process WHERE Process_ID is:''
			+CHAR(13)+inserted.Process_ID  
			+CHAR(10)+CHAR(13)+ISNULL(@@SERVERNAME,''SRVR '')+'' TRIGGER ERP_2.dbo.WIPLst_Process_After_Update ''
			+CHAR(10)+CHAR(13)+''Deleting from BrokerLst_Process WHERE Process_ID is: RECEIVED, Sell Stock, Shipped, Receiving, Correction or Cancelled.'',1024)
		,LEFT(''TRIGGER ERP_2.dbo.WIPLst_Process_After_Update Delete'',100) 
		FROM inserted
			WHERE (inserted.[Process_ID] =''RECEIVED'' 
			or inserted.[Process_ID] = ''Sell Stock''   
			or inserted.[Process_ID] = ''Shipped'' 
			or inserted.[Process_ID] = ''Receiving'' 
			or inserted.[Process_ID] = ''CORRECTION''
			or inserted.[Process_ID] = ''CANCELLED'')
			and inserted.[ID_Detail_Process] > 0

	PRINT '' Deleting from WIPLst_Process WHERE Process_ID is: RECEIVED, Sell Stock, Shipped, Receiving, Correction or Cancelled.'';

	DELETE FROM dbo.WIPLst_Process WHERE WIPLst_Process.ID_Detail_Process IN
		( SELECT [ID_Detail_Process] FROM inserted  WHERE 
			(  inserted.[Process_ID] = ''RECEIVED'' 
			or inserted.[Process_ID] = ''Sell Stock'' 
			or inserted.[Process_ID] = ''Shipped'' 
			or inserted.[Process_ID] = ''Receiving''
			or inserted.[Process_ID] = ''CORRECTION''
			or inserted.[Process_ID] = ''CANCELLED'' )
			and inserted.[ID_Detail_Process] > 0 )
	end

PRINT ''Trigger  End  [WIPLst_Process_After_Update]'';
' 
GO
ALTER TABLE [dbo].[WIPLst_Process] ENABLE TRIGGER [WIPLst_Process_After_Update]
GO
/****** Object:  Trigger [dbo].[WIPLst_Process_Delete]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[WIPLst_Process_Delete]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.StockLst_Process_Delete    Script Date: 11/30/2005 3:54:44 PM ******/
CREATE TRIGGER [dbo].[WIPLst_Process_Delete]
ON [dbo].[WIPLst_Process] 
  FOR DELETE 
  NOT FOR REPLICATION
AS

---big deletes are in error
DECLARE @Count int
SET @Count = @@ROWCOUNT;
        
IF @Count > 100
BEGIN
    RAISERROR(''Cannot DELETE more than 100 records of Lst_Process at one time.'',16,1) 
    ROLLBACK TRANSACTION
    RETURN;
END


PRINT ''Trigger Begin [WIPLst_Process_Delete]'';

PRINT ''Record to dbo.NR_UserTrack''

IF EXISTS( SELECT * from deleted WHERE LEN(LTRIM(deleted.SOitem)) > 7 AND NOT dbo.f_ProperSOitem(deleted.SOitem)=dbo.f_ProperSOitem('''') )
	begin
	
	INSERT dbo.NR_UserTrack 
	   ([mess1],[cprogram],[errordate],[machine])
		SELECT LEFT(''SOitem:''+deleted.soitem
			+'', WIPLst ID_Detail_Process:''+CAST(deleted.ID_Detail_Process AS VARCHAR(10))+'' was Deleted,''
			+'', ID_Detail:''+CAST(deleted.ID_Detail AS VARCHAR(10))
			+'', Process_ID:''+deleted.Process_ID
			+'', ReceivingID:''+CAST(ReceivingID AS VARCHAR(10)),1024) AS Mess1
		, LEFT(''WIPLst_Process_Delete trigger'',100) AS cProgram
		, GETDATE() AS ErrorDate
		, LEFT((suser_sname()),40) AS Machine
		FROM deleted 
		WHERE LEN(LTRIM(SOitem)) > 7
		AND NOT dbo.f_ProperSOitem(deleted.SOitem)=dbo.f_ProperSOitem('''')

	PRINT ''SOitem Deleted from WIPLst_Process''

	end

IF EXISTS( SELECT * from deleted WHERE LEN(LTRIM(deleted.PO_item)) > 9 AND NOT dbo.f_ProperPOitem(deleted.PO_item)=dbo.f_ProperPOitem('''') )
	begin
	INSERT dbo.NR_UserTrack 
	   ([mess1],[cprogram],[errordate],[machine])
		SELECT LEFT(''POitem:''+deleted.PO_item+'' had selected stock that was deleted.''
			+'', StockLst ID_Detail_Process:''+CAST(deleted.ID_Detail_Process AS VARCHAR(10))+'' was Deleted,''
			+'', ID_Detail:''+CAST(deleted.ID_Detail AS VARCHAR(10))
			+'', Process_ID:''+deleted.Process_ID
			+'', ReceivingID:''+CAST(ReceivingID AS VARCHAR(10)),1024) AS Mess1
		, LEFT(''WIPLst_Process_Delete trigger'',100) AS cProgram
		, GETDATE() AS ErrorDate
		, LEFT((suser_sname()),40) AS Machine
		FROM deleted 
		WHERE LEN(LTRIM(deleted.PO_item)) > 9
		AND NOT dbo.f_ProperPOitem(deleted.SOitem)=dbo.f_ProperPOitem('''')

	PRINT '' POitem Deleted from WIPLst_Process''
	end

IF EXISTS( SELECT * from deleted WHERE ISNULL(deleted.WO,0)>0 )
	begin
	INSERT dbo.NR_UserTrack 
	   ([mess1],[cprogram],[errordate],[machine])
		SELECT LEFT(''WO:''+CAST(deleted.WO AS VARCHAR(10))
			+'', WIPLst ID_Detail_Process:''+CAST(deleted.ID_Detail_Process AS VARCHAR(10))+'' was Deleted,''
			+'', ID_Detail:''+CAST(deleted.ID_Detail AS VARCHAR(10))
			+'', Process_ID:''+deleted.Process_ID
			+'', ReceivingID:''+CAST(ReceivingID AS VARCHAR(10)),1024) AS Mess1
		, LEFT(''WIPLst_Process_Delete trigger'',100) AS cProgram
		, GETDATE() AS ErrorDate
		, LEFT((suser_sname()),40) AS Machine
		FROM deleted 
		WHERE ISNULL(deleted.WO,0)>0
	PRINT '' WO Deleted from WIPLst_Process''

	end

IF EXISTS( SELECT * from deleted WHERE ISNULL(deleted.WO_Detail,0)>0 )
	begin
	INSERT dbo.NR_UserTrack 
	   ([mess1],[cprogram],[errordate],[machine])
		SELECT LEFT(''WO_Detail:''+CAST(deleted.WO_Detail AS VARCHAR(10))
			+'', WIPLst ID_Detail_Process:''+CAST(deleted.ID_Detail_Process AS VARCHAR(10))+'' was Deleted,''
			+'', ID_Detail:''+CAST(deleted.ID_Detail AS VARCHAR(10))
			+'', Process_ID:''+deleted.Process_ID
			+'', ReceivingID:''+CAST(ReceivingID AS VARCHAR(10)),1024) AS Mess1
		, LEFT(''WIPLst_Process_Delete trigger'',100) AS cProgram
		, GETDATE() AS ErrorDate
		, LEFT((suser_sname()),40) AS Machine
		FROM deleted 
		WHERE ISNULL(deleted.WO_Detail,0)>0

	PRINT '' WO_Detail Deleted from WIPLst_Process''
	end

PRINT '' INSERT dbo.Ar_WIPLst_Process_History  [WIPLst_Process_Delete]'';
INSERT dbo.Ar_WIPLst_Process_History
(	[Who],
	[What],
	[When],
	[soitem],
	[po_item],
	[SalesPerson],
	[startdate],
	[duedate],
	[comment],
	[process_id],
	[processor],
	[AllowSub],
	[PWeight],
	[PPc],
	[PU],
	[QTY],
	[Ordered_QTY],
	[Ordered_P],
	[Pounds],
	[id_detail],
	[id_detail_process],
	[Removed],
	[Validated],
	[ReceivingID],
	[WO]
	,[WO_Detail]
	,[InqNumP]
	,[Prc_QTY] 
	,[Prc_Form]
	,[Prc_PCs]
	,[Prc_Dim2]
	,[Prc_Dim3]
	,FoundSTK ) 
SELECT
	suser_sname() AS [Who],
	''Delete Trg'' AS [What],
	GETDATE() AS [When],
	[soitem],
	[po_item],
	[SalesPerson],
	[startdate],
	[duedate],
	[comment],
	[process_id],
	[processor],
	[AllowSub],
	[PWeight],
	[PPc],
	[PU],
	[QTY],
	[Ordered_QTY],
	[Ordered_P],

	[Pounds],
	[id_detail],
	[id_detail_process],
	GETDATE() AS [Removed],
	''F'' AS [Validated],
	[ReceivingID],
	[WO]
	,[WO_Detail]
	,[InqNumP]
	,[Prc_QTY]
	,[Prc_Form]
	,[Prc_PCs]
	,[Prc_Dim2]
	,[Prc_Dim3]
	,FoundSTK
	FROM deleted


IF (SELECT COUNT(*) FROM deleted WHERE deleted.[Process_ID] = ''SELECTED'') > 0  
	BEGIN
	--UPDATE rtr
	DECLARE @cOrderNumber CHAR(13) = ''''
	DECLARE @nID_Detail_Process INT = 0

	DECLARE @nWO INT = 0
	SELECT TOP 1 @nWO = deleted.WO, @nID_Detail_Process = deleted.ID_Detail_Process 
		FROM deleted WHERE deleted.Process_ID = ''SELECTED'' AND ISNULL(deleted.WO,0) > 0

	IF @nWO > 0 AND @nID_Detail_Process > 0
		begin
		SET @cOrderNumber = CAST(@nWO AS CHAR(10) )
		PRINT ''FINISH rtr_Detail with WO '' + @cOrderNumber
		EXEC dbo.p_rtr_Select_Material_Done ''WO'', @cOrderNumber, ''W'', @nID_Detail_Process
		end

	DECLARE @nWO_Detail INT = 0
	SELECT TOP 1 @nWO_Detail = deleted.WO_Detail, @nID_Detail_Process = deleted.ID_Detail_Process 
		FROM deleted WHERE deleted.Process_ID = ''SELECTED'' AND ISNULL(deleted.WO_Detail,0) > 0

	IF @nWO_Detail > 0 AND @nID_Detail_Process > 0
		begin
		SET @cOrderNumber = CAST(@nWO_Detail AS CHAR(10) )
		PRINT ''FINISH rtr_Detail with WO_Detail ''+@cOrderNumber
		EXEC dbo.p_rtr_Select_Material_Done ''WO_Detail'', @cOrderNumber, ''W'', @nID_Detail_Process
		end

	DECLARE @cSOitem CHAR(10) = ''''

	SELECT TOP 1 @cSOitem = deleted.SOitem, @nID_Detail_Process = deleted.ID_Detail_Process 
		FROM deleted WHERE deleted.Process_ID = ''SELECTED'' 
		AND dbo.f_ProperSOitem(ISNULL(deleted.SOitem,'''')) <> dbo.f_ProperSOitem('''')
	
	IF dbo.f_ProperSOitem(ISNULL(@cSOitem,'''')) <> dbo.f_ProperSOitem('''') AND @nID_Detail_Process > 0
		begin
		--SET @cOrderNumber = CAST(@nWO_Detail AS CHAR(10) )
		PRINT ''FINISH rtr_Detail with SOitem ''+@cSOitem
		EXEC dbo.p_rtr_Select_Material_Done ''SOitem'', @cSOitem, ''W'', @nID_Detail_Process
		end
	END


PRINT ''Trigger  End  [WIPLst_Process_Delete]'';
' 
GO
ALTER TABLE [dbo].[WIPLst_Process] ENABLE TRIGGER [WIPLst_Process_Delete]
GO
/****** Object:  Trigger [dbo].[WIPLst_Process_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[WIPLst_Process_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[WIPLst_Process_Insert] ON [dbo].[WIPLst_Process] 
  FOR INSERT 
  NOT FOR REPLICATION 
AS

PRINT ''Trigger Start [WIPLst_Process_Insert]'';

DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
DECLARE @Body varchar(4000)
DECLARE @badSOitem CHAR(10) 

--Send Email alert for Shipped that still exists.
IF (SELECT COUNT(*) FROM inserted 
    WHERE inserted.[Process_ID] = ''Shipped'') > 0  
	BEGIN
		PRINT ''Send Email alert: SOitem was marked as SHIPPED on WIPLst_Process ''

		SELECT TOP 1 @Body = ''SO-Item:''+ISNULL(inserted.SOitem,'''')
			+'' or WO:''+CAST(ISNULL(inserted.WO,0) AS CHAR)
			+'' was marked as SHIPPED''
			+RTRIM(CAST(inserted.id_detail_process AS CHAR))
			+CHAR(13)+dbo.f_Reportlink_CHAR(''SOitem'',inserted.SOitem)
			+CHAR(13)+''User ''+RTRIM(suser_sname())+'' on ''+RTRIM(CAST(GETDATE() AS CHAR))
			+CHAR(13)+'', but still listed on WIPLst.''  
			+CHAR(13)+@@SERVERNAME+'' TRIGGER ''+DB_NAME()+'' WIPLst_Process_After_Insert ''
			FROM inserted
				WHERE inserted.[process_id] = ''Shipped''

		PRINT ''Send Email alert for Shipped that still exists.''

		EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
		 @SubjectEmail = ''Stock marked as Shipped'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''
		 

		INSERT dbo.NR_UserTrack ([mess1],[cprogram]) 
			SELECT LEFT(''SO-Item:''+ISNULL(inserted.SOitem,'''')
			+'' or WO:''+CAST(ISNULL(inserted.WO,0) AS CHAR)+'' was marked as SHIPPED ''
			+RTRIM(CAST(inserted.id_detail_process AS CHAR))+CHAR(13)+'' on ''+RTRIM(CAST(GETDATE()AS CHAR))
			+CHAR(13)+'', but still listed on WIPLst.''+CHAR(13)
			+''User ''+RTRIM(suser_sname())+'' on ''+RTRIM(CAST(GETDATE()AS CHAR))+'' ''
			+@@SERVERNAME+'' TRIGGER ''+''.dbo.WIPLst_Process_Insert '',1024) AS Mess1
			,LEFT(''TRIGGER ERP_2.dbo.WIPLst_Process'',100)
			FROM inserted
				WHERE inserted.[Process_ID] = ''Shipped''

	END

--Send Email alert for SOitem ''9999999-99''.
IF (SELECT COUNT(*) FROM inserted WHERE inserted.SOitem = ''9999999-99'') > 0  
	BEGIN
		

		SELECT TOP 1 @Body = ''SO is 9999999-99 on WIPLst_Process id_detail_process:''
			+RTRIM(CAST(inserted.id_detail_process AS CHAR))
			+CHAR(13)+ dbo.f_Reportlink_CHAR(''SOitem'',inserted.SOitem)
			+CHAR(13)+ dbo.f_Reportlink_CHAR(''POitem'',inserted.PO_item)
			+CHAR(13)+ ISNULL(inserted.Comment,''Comment NA'')
			+CHAR(13)+''User ''+RTRIM(suser_sname())+'' on ''+RTRIM(CAST(GETDATE() AS CHAR))
			+CHAR(13)+@@SERVERNAME+'' TRIGGER ''+''WIPLst_Process_Insert ''
			FROM inserted
			WHERE inserted.SOitem = ''9999999-99''

			PRINT ''Send Email alert for SOitem 9999999-99''
		--PRINT @Body		
		
		EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''David.Kirchner@ERP_1s.com'', 
		 @SubjectEmail = ''SOitem 9999999-99'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''
		 

	END

--- rtr ---
PRINT ''Trigger Start [WIPLst_Process_Insert SECTION rtr]'';

IF (SELECT COUNT(*) FROM inserted WHERE inserted.[Process_ID] = ''SELECTED'') > 0  
	BEGIN
	PRINT ''--''
	PRINT ''UPDATE rtr via p_rtr_Select_Material''

	DECLARE @cOrderNumber CHAR(13) = ''''
	DECLARE @nID_Detail_Process INT = 0

	DECLARE @nWO INT = 0
	SELECT TOP 1 @nWO = inserted.WO, @nID_Detail_Process = inserted.ID_Detail_Process 
		FROM Inserted 
		WHERE inserted.Process_ID = ''SELECTED'' AND ISNULL(inserted.WO,0) > 0

	IF @nWO > 0 AND @nID_Detail_Process > 0
		begin
		SET @cOrderNumber = CAST(@nWO AS CHAR(10) )
		PRINT ''EXEC dbo.p_rtr_Select_Material  @cOrderType=''''WO'''' ,@cOrderNumber=''+ @cOrderNumber + '', @TBL=''''W'''' ''+'', @ID_Detail_Process=''+CAST(@nID_Detail_Process AS CHAR(10))
		EXEC dbo.p_rtr_Select_Material @cOrderType=''WO'',@cOrderNumber=@cOrderNumber, @TBL=''W'', @ID_Detail_Process=@nID_Detail_Process;
		end

	DECLARE @nWO_Detail INT = 0
	SELECT TOP 1 @nWO_Detail = inserted.WO_Detail, @nID_Detail_Process = inserted.ID_Detail_Process 
		FROM Inserted WHERE inserted.Process_ID = ''SELECTED'' AND ISNULL(inserted.WO_Detail,0) > 0

	IF @nWO_Detail > 0 AND @nID_Detail_Process > 0
		begin
		SET @cOrderNumber = CAST(@nWO_Detail AS CHAR(10) )
		PRINT ''EXEC dbo.p_rtr_Select_Material  @cOrderType=''''WO_Detail'''' ,@cOrderNumber=''+ @cOrderNumber + '', @TBL=''''W'''' ''+'', @ID_Detail_Process=''+CAST(@nID_Detail_Process AS CHAR(10))
		EXEC dbo.p_rtr_Select_Material @cOrderType=''WO_Detail'', @cOrderNumber=@cOrderNumber, @TBL=''W'', @ID_Detail_Process=@nID_Detail_Process;
		end

	DECLARE @cSOitem CHAR(10) = ''''
	SELECT TOP 1 @cSOitem = inserted.SOitem, @nID_Detail_Process = inserted.ID_Detail_Process 
		FROM Inserted WHERE inserted.Process_ID = ''SELECTED'' 
		AND NOT dbo.f_ProperSOitem(inserted.SOitem) = dbo.f_ProperSOitem('''')

	IF dbo.f_ProperSOitem(@cSOitem) <> dbo.f_ProperSOitem('''') AND @nID_Detail_Process > 0
		begin
		--SET @cOrderNumber = CAST(@nWO_Detail AS CHAR(10) )
		PRINT ''EXEC dbo.p_rtr_Select_Material  @cOrderType=''''SOitem'''' ,@cOrderNumber=''+ @cOrderNumber + '', @TBL=''''W'''' ''+'', @ID_Detail_Process=''+CAST(@nID_Detail_Process AS CHAR(10))
		EXEC dbo.p_rtr_Select_Material @cOrderType=''SOitem'', @cOrderNumber=@cSOitem, @TBL=''W'', @ID_Detail_Process=@nID_Detail_Process;
		end
	
	PRINT ''Trigger  End  [WIPLst_Process_Insert SECTION rtr]'';
	
	END
--- rtr ---



PRINT '' INSERT dbo.Ar_WIPLst_Process_History  [WIPLst_Process_Insert]'';

INSERT dbo.Ar_WIPLst_Process_History 
	([Who],
	[What],
	[When],
	[SOitem],
	[PO_Item],
	[SalesPerson],
	[StartDate],
	[DueDate],
	[Comment],
	[Process_ID],
	[Processor],
	[AllowSub],
	[PWeight],
	[PPc],
	[PU],
	[QTY],
	[Ordered_QTY],
	[Ordered_P],

	[Pounds],
	[ID_Detail],
	[ID_Detail_Process],
	[Validated],
	[ReceivingID],
	[WO]
	,[WO_Detail]
	,[InqNumP]
	,[Prc_QTY]
	,[Prc_Form]
	,[Prc_PCs]
	,[Prc_Dim2]
	,[Prc_Dim3]
	,FoundSTK )
SELECT 	suser_sname() AS [Who],
	''ADD'' AS [What],
	GETDATE() AS [When],
	[SOitem],
	[PO_Item],
	[SalesPerson],
	[StartDate],
	[DueDate],
	[Comment],
	[Process_ID],
	[Processor],
	[AllowSub],
	[PWeight],
	[PPc],
	[PU],
	[QTY],
	[Ordered_QTY],
	[Ordered_P],

	[Pounds],
	[ID_Detail],
	[ID_Detail_Process],
	''F'',
	[ReceivingID],
	[WO]
	,[WO_Detail]
	,[InqNumP]
	,[Prc_QTY]
	,[Prc_Form]
	,[Prc_PCs]
	,[Prc_Dim2]
	,[Prc_Dim3]
	,FoundSTK
 FROM inserted


 PRINT ''Trigger  End  [WIPLst_Process_Insert]'';
' 
GO
ALTER TABLE [dbo].[WIPLst_Process] ENABLE TRIGGER [WIPLst_Process_Insert]
GO
/****** Object:  Trigger [dbo].[WIPLst_Process_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[WIPLst_Process_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[WIPLst_Process_Update]
   ON  [dbo].[WIPLst_Process] 
   FOR UPDATE 
   NOT FOR REPLICATION
AS

PRINT ''Trigger Begin [WIPLst_Process_Update]'';

-- Removed DueDate on 2011-10-18 so there would be less updates.
-- inserted.[duedate]     = deleted.[duedate] and
-- Removed Process_ID Update on 2011-10-18
-- inserted.[process_id]  = deleted.[process_id] and

-- ''ERP_1_Archive''

DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
DECLARE @Body varchar(4000)
DECLARE @badSOitem CHAR(10)=''''
DECLARE @badPOitem CHAR(12)=''''

IF EXISTS ( SELECT * FROM inserted WHERE 
		( SUBSTRING(SOitem,1,7) like ''%-%'' 
		OR SUBSTRING(PO_item,1,9) like ''%-%'' ) 
		--AND ISNULL(WO_Detail,0) > 0 
		)
	BEGIN
	--SUBSTRING(SOitem,1,7) Like ''%-%'', Looks for a - in first 7 digits

	PRINT '' Cannot insert into dbo.StockLst_Process, SOitem is not Proper or POitem is not Proper''
	SELECT @Body = ''Cannot insert into dbo.StockLst_Process, SOitem or PO_item is not Proper,''+CHAR(13)
		
	SELECT TOP 1 @badPOitem = ISNULL(PO_item,''null'')  FROM inserted WHERE 
		SUBSTRING(PO_item,1,9) like ''%-%'' 

	SELECT TOP 1 @badSOitem = ISNULL(SOitem,''null'')  FROM inserted WHERE 
		 SUBSTRING(SOitem,1,7) like ''%-%''

	SET @Body = @Body+'' PO item:''+@badPOitem +''.''
		+'' SO item:''+@badSOitem +''.''
		+RTRIM(suser_sname())
		+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.StockLst_Process_Update ''
				
	EXEC dbo.p_eMail_Send
		 @FromEmail = @cEmailFrom, 
		 @ToEmail = ''VFPprogramming@ERP_1s.com'', 
		 @SubjectEmail = ''a BAD SOitem or POitem'',
		 @BodyEmail = @Body,
		 @BodyType = ''TEXT''
		 	
	SET @Body = ''INSERT dbo.StockLst_Process table failed. POitem:''
		+@badPOitem+'' not Proper.''
		+'' SOitem:''+@badSOitem+'' not Proper.''

--	RAISERROR( @Body, 16, -1)

	END

IF (SELECT COUNT(*) FROM inserted, deleted
WHERE inserted.[SOitem]   = deleted.[SOitem] and
   inserted.[PO_Item]     = deleted.[PO_Item] and
   inserted.[SalesPerson] = deleted.[SalesPerson] and
   inserted.[StartDate]   = deleted.[StartDate] and
   inserted.[Comment]     = deleted.[Comment] and
   inserted.[Processor]   = deleted.[Processor]  and
   inserted.[AllowSub]    = deleted.[AllowSub] and
   inserted.[PWeight]     = deleted.[PWeight] and
   inserted.[PPc]         = deleted.[PPc] and
   inserted.[PU]          = deleted.[PU] and
   inserted.[QTY]         = deleted.[QTY] and
   inserted.[Pounds]      = deleted.[Pounds] and
   inserted.[ReceivingID] = deleted.[ReceivingID] and
   inserted.WO_Detail     = deleted.WO_Detail and
   inserted.Prc_QTY       = deleted.Prc_QTY and
   inserted.FoundSTK      = deleted.FoundSTK
   ) <> 1
BEGIN
	--Major field has changed
   PRINT '' INSERT dbo.Ar_WIPLst_Process_History  [WIPLst_Process_Update]'';
   INSERT dbo.Ar_WIPLst_Process_History 
	([Who],[What],[When],
	[SOitem],
	[PO_Item],
	[SalesPerson],
	[StartDate],
	[DueDate],
	[Comment],
	[Process_ID],
	[Processor],
	[AllowSub],
	[PWeight],
	[PPc],
	[PFt],
	[PU],
	[QTY],
	[Ordered_QTY],
	[Ordered_P],

	[Pounds],
	[ID_Detail],
	[ID_Detail_Process],
	[Validated],
	[ReceivingID],
	[WO]
	,[WO_Detail]
	,[InqNumP]
	,[Prc_QTY]
	,[Prc_Form]
	,[Prc_PCs]
	,[Prc_Dim2]
	,[Prc_Dim3]
	,FoundSTK)
   SELECT suser_sname() AS [Who],
	''BEFOREEDIT'' AS [What],
	GETDATE() AS [When],
	inserted.[SOitem],
	inserted.[PO_Item],
	inserted.[SalesPerson],
	inserted.[StartDate],
	inserted.[DueDate],
	inserted.[Comment],
	inserted.[Process_ID],
	inserted.[Processor],
	inserted.[AllowSub],
	inserted.[PWeight],
	inserted.[PPc],
	inserted.[PFt],
	inserted.[PU],
	inserted.[QTY],
	inserted.[Ordered_QTY],
	inserted.[Ordered_P],

	inserted.[Pounds],
	inserted.[ID_Detail],
	inserted.[ID_Detail_Process],
	''F'',
	inserted.[ReceivingID],
	inserted.[WO]
	,inserted.[WO_Detail]
	,inserted.[InqNumP]
	,inserted.[Prc_QTY]
	,inserted.[Prc_Form]
	,inserted.[Prc_PCs]
	,inserted.[Prc_Dim2]
	,inserted.[Prc_Dim3]
	,inserted.FoundSTK
    FROM deleted, inserted
	WHERE inserted.[ID_Detail_Process] = deleted.[ID_Detail_Process]
	 and NOT ( inserted.[SOitem] = deleted.[SOitem] 
	   and inserted.[PO_Item]     = deleted.[PO_Item] 
	   and inserted.[SalesPerson] = deleted.[SalesPerson]
	   and inserted.[StartDate]   = deleted.[StartDate]
	   and inserted.[Comment]     = deleted.[Comment]
	   and inserted.[Processor]   = deleted.[Processor]
	   and inserted.[AllowSub]    = deleted.[AllowSub]
	   and inserted.[PWeight]     = deleted.[PWeight]
	   and inserted.[PPc]         = deleted.[PPc]
	   and inserted.[PU]          = deleted.[PU]
	   and inserted.[QTY]         = deleted.[QTY]
	   and inserted.[Pounds]      = deleted.[Pounds]
	   and inserted.[FoundSTK]    = deleted.[FoundSTK] )
		and ( UPDATE([SOitem]) 
		or UPDATE([PO_Item])
		or UPDATE([SalesPerson])
		or UPDATE([StartDate])
		or UPDATE([Comment])
		or UPDATE([Processor])
		or UPDATE([AllowSub])
		or UPDATE([PWeight])
		or UPDATE([PPc])
		or UPDATE([PU])
		or UPDATE([QTY])
		or UPDATE([Pounds])
		or UPDATE([Prc_QTY]) 
		or UPDATE([FoundSTK]) )


   INSERT dbo.Ar_WIPLst_Process_History 
	([Who],[What],[When],
	[SOitem],
	[PO_Item],
	[SalesPerson],
	[StartDate],
	[DueDate],
	[Comment],
	[Process_ID],
	[Processor],
	[AllowSub],
	[PWeight],
	[PPc],
	[PFt],
	[PU],
	[QTY],
	[Ordered_QTY],
	[Ordered_P],

	[Pounds],
	[ID_Detail],
	[ID_Detail_Process],
	[Validated],
	[ReceivingID],
	[WO]
	,[WO_Detail]
	,[InqNumP]
	,[Prc_QTY]
	,[Prc_Form]
	,[Prc_PCs]
	,[Prc_Dim2]
	,[Prc_Dim3]
	,FoundSTK)
   SELECT suser_sname() AS [Who],
	''AFTER EDIT'' AS [What],
	GETDATE() AS [When],
	deleted.[SOitem],
	deleted.[PO_Item],
	deleted.[SalesPerson],
	deleted.[StartDate],
	deleted.[DueDate],
	deleted.[Comment],
	deleted.[Process_ID],
	deleted.[Processor],
	deleted.[AllowSub],
	deleted.[PWeight],
	deleted.[PPc],
	deleted.[PFt],
	deleted.[PU],
	deleted.[QTY],
	deleted.[Ordered_QTY],
	deleted.[Ordered_P],

	deleted.[Pounds],
	deleted.[ID_Detail],
	deleted.[ID_Detail_Process],
	''F'',
	deleted.[ReceivingID],
	deleted.[WO]
	,deleted.[WO_Detail]
	,deleted.[InqNumP]
	,deleted.[Prc_QTY]
	,deleted.[Prc_Form]
	,deleted.[Prc_PCs]
	,deleted.[Prc_Dim2]
	,deleted.[Prc_Dim3]
	,deleted.FoundSTK
    FROM inserted, deleted
	WHERE inserted.[ID_Detail_Process] = deleted.[ID_Detail_Process]
	 and NOT ( inserted.[SOitem] = deleted.[SOitem] 
	   and inserted.[PO_Item]     = deleted.[PO_Item] 
	   and inserted.[SalesPerson] = deleted.[SalesPerson]
	   and inserted.[StartDate]   = deleted.[StartDate]
	   and inserted.[Comment]     = deleted.[Comment]
	   and inserted.[Processor]   = deleted.[Processor]
	   and inserted.[AllowSub]    = deleted.[AllowSub]
	   and inserted.[PWeight]     = deleted.[PWeight]
	   and inserted.[PPc]         = deleted.[PPc]
	   and inserted.[PU]          = deleted.[PU]
	   and inserted.[QTY]         = deleted.[QTY]
	   and inserted.[Pounds]      = deleted.[Pounds] )
		and ( UPDATE([SOitem]) 
		or UPDATE([PO_Item])
		or UPDATE([SalesPerson])
		or UPDATE([StartDate])
		or UPDATE([Comment])
		or UPDATE([Processor])
		or UPDATE([AllowSub])
		or UPDATE([PWeight])
		or UPDATE([PPc])
		or UPDATE([PU])
		or UPDATE([QTY])
		or UPDATE([Pounds])
		or UPDATE([Prc_QTY]) )

END
PRINT ''Trigger  End  [WIPLst_Process_Update]'';
' 
GO
ALTER TABLE [dbo].[WIPLst_Process] ENABLE TRIGGER [WIPLst_Process_Update]
GO
/****** Object:  Trigger [dbo].[Wire_Dies_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Wire_Dies_Update]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.Swage_Log_Update     ******/


create TRIGGER [dbo].[Wire_Dies_Update] 
ON [dbo].[Wire_Dies] 
	FOR UPDATE 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [Wire_Dies_Update]'';

    
---big UPDATES are in error
DECLARE @Count int
SET @Count = @@ROWCOUNT;
   
IF @Count > 1000
BEGIN
	RAISERROR(''Cannot UPDATE more than 1000 records of dbo.Wire_Dies at one time. trigger _Update'',16,1) 
	ROLLBACK TRANSACTION
	RETURN;
END
----------------------

PRINT ''Trigger  End [Wire_Dies_Update]'';
' 
GO
ALTER TABLE [dbo].[Wire_Dies] ENABLE TRIGGER [Wire_Dies_Update]
GO
/****** Object:  Trigger [dbo].[Wire_log_After_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Wire_log_After_Update]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.Wire_log_Update     ******/


CREATE TRIGGER [dbo].[Wire_log_After_Update] 
ON [dbo].[Wire_log] 
	AFTER UPDATE 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [Wire_log_After_Update]'';

DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()

IF UPDATE(Passed) 
	begin
	PRINT ''Update the WO_Detail for Test POitem''
		
	UPDATE dbo.WorkOrder_Detail
		SET PassTest = inserted.Passed
		FROM inserted
		INNER JOIN dbo.WorkOrder_Detail WO_D ON inserted.WO_Detail = WO_D.WO_Detail
		WHERE WO_D.WO_Detail = inserted.WO_Detail
		AND WO_D.TestPO = inserted.TestPOitem
		AND ISNULL(inserted.Lot,0) > 0
		AND NOT inserted.Passed IS NULL
		AND UPDATE(Passed);

	end


IF UPDATE(Passed) 
begin
	BEGIN TRY
	--Send Email
	
		DECLARE @Body varchar(4000)
		DECLARE @Lot	INT = 0
		DECLARE @SOitem	CHAR(10) = ''''
		DECLARE @TestPOitem CHAR(12) = ''''
		DECLARE @WorkOrder INT = 0
		DECLARE @WorkOrder_Detail INT = 0
		DECLARE @ProjID	INT = 0
		DECLARE @Descript VarChar(200) = ''''

		SELECT TOP 1 
			 @Lot = inserted.Lot
			,@SOitem = ISNULL(inserted.SOitem,'''')
			,@TestPOitem = ISNULL(inserted.TestPOitem,'''')
			,@WorkOrder = ISNULL(inserted.WO,0)
			,@WorkOrder_Detail = ISNULL(inserted.WO_Detail,0)
			,@ProjID = ISNULL(inserted.ProjID,0)
			,@Descript = ISNULL(RTRIM(Cast(inserted.fPiece AS CHAR(10)))+''pc ''+RTRIM(inserted.AlloyName)+'' ''+RTRIM(Cast(COALESCE(inserted.DrawSize,inserted.fSize) AS CHAR(10)))+'' Dia x ''+RTRIM(CAST( FLOOR(COALESCE(inserted.fWeight,inserted.sWeight)) AS CHAR(10)))+'' Pounds '' ,''No Description'')
			FROM inserted, deleted
			WHERE inserted.ID = deleted.ID
				AND ISNULL(inserted.Passed,0) = 1 
				AND ISNULL(deleted.Passed,0) = 0	--Pass is now True and was False
				AND ISNULL(inserted.Lot,0) > 0
				AND UPDATE(Passed);

		IF @Lot > 0
			begin
			--Found a Lot to Email
			PRINT ''LOT ''+CAST(@Lot AS CHAR(10));
			PRINT ''Descript ''+@Descript;

			PRINT '' Send a -Passed Lab Test- Email'';
		
			SET @Body = ''<!DOCTYPE html> <html><head><title>HPA Notice</title></head><body>''
			SET @Body = @Body + RTRIM(SUSER_SNAME())+'' updated the Wire_log ''+'' on ''+RTRIM(CAST(GETDATE()AS CHAR))
				+CHAR(10)+CHAR(13)+''<br>''+''Wire log test Passed for Lot: ''+CAST(@Lot AS CHAR(10)) +''<br>'';
		
			SET @Body = @Body+CHAR(13)+''<br>''+@Descript

			--SET @Body = @Body+CHAR(13)+''<br>''+''<a href="''+dbo.f_Reportlink_INT(''Wire_log'',@Lot) +''">Wire Lot: ''+LTRIM(RTRIM(@Lot))+''</a>''+''<br>'';
			SET @Body = @Body+CHAR(13)+''<br>''+dbo.f_HTML_link_Wire(@Lot)
		

			IF LEN(LTRIM(@SOitem))>6
				SET @Body = @Body+CHAR(13)+''<br>''+dbo.f_HTML_link_SOitem(@SOitem);
				--Alert SOitem SalesP
				--end

			IF @WorkOrder > 0
				SET @Body = @Body+CHAR(13)+''<br>''+dbo.f_HTML_link_WO(@WorkOrder);
				--Alert WO person
				--end

			IF @WorkOrder_Detail > 0
				SET @Body = @Body+CHAR(13)+''<br>''+dbo.f_HTML_link_WO_Detail(@WorkOrder_Detail);
				--Alert WO person for this WOD
				--end
			ELSE
				SET @Body = @Body+CHAR(13)+''<br>''+''No WorkOrder_Detail was found!''

			IF @ProjID > 0
				SET @Body = @Body+CHAR(13)+''<br>''+''<a href="''+dbo.f_Reportlink_INT(''ProjID'',@ProjID)+''"> ProjectID: ''+LTRIM(RTRIM(CAST(@ProjID AS CHAR)))+''</a>''+''<br>'';
				--Alert ProjID Person
				--end

			--@TestPOitem
			SET @Body = @Body+CHAR(13)+''<br>''+dbo.f_HTML_link_POitem(@TestPOitem);

			--Router
			SET @Body = @Body+CHAR(13)+''<br>''+''rtr''; --dbo.f_HTML_link_rtr(@rtr);

			--OT
			SET @Body = @Body+CHAR(13)+''<br>''+''Order Tracking''; --dbo.f_HTML_link_OT(@TrackID);



			SET @Body = @Body+CHAR(10)+CHAR(13)+''<br>'';
			SET @Body = @Body+CHAR(10)+CHAR(13)+''<br>'';
			SET @Body = @Body+''The accounting costing needs to be calculated.<br>'';
			SET @Body = @Body+CHAR(10)+CHAR(13)+''<br>'';
			SET @Body = @Body+CHAR(10)+CHAR(13)+@@SERVERNAME+'' TRIGGER ERP_2.dbo.Wire_log_After_Update '';
	
			SET @Body = @Body +''</body>+</HTML>''

			--PRINT @Body
			DECLARE @cSubjectEmail VARCHAR(250)
			SET @cSubjectEmail = ''Wire log ''+RTRIM(CAST(@Lot AS CHAR(10)))+'' test Passed''

			--IF @WorkOrder_Detail > 0	
				EXEC dbo.p_eMail_Send
					@FromEmail = @cEmailFrom, 
					@ToEmail = ''David.Kirchner@ERP_1s.com; ForgeManager@ERP_1s.com; production.costing@ERP_1s.com; QA@ERP_1s.com'',
					@SubjectEmail = @cSubjectEmail,
					@BodyEmail = @Body,
					@BodyType = ''HTML''

			end
--Removed code block, This fires when inserted.Passed = 1 AND deleted.Passed = 1
/*		ELSE
			
			SELECT TOP 1 
				 @Lot = inserted.Lot
				,@SOitem = ISNULL(inserted.SOitem,'''')
				,@TestPOitem = ISNULL(inserted.TestPOitem,'''')
				,@WorkOrder = ISNULL(inserted.WO,0)
				,@WorkOrder_Detail = ISNULL(inserted.WO_Detail,0)
				,@ProjID = ISNULL(inserted.ProjID,0)
				,@Descript = ISNULL(RTRIM(Cast(inserted.fPiece AS CHAR(10)))+''pc ''+RTRIM(inserted.AlloyName)+'' ''+RTRIM(Cast(COALESCE(inserted.fSize,inserted.GFMsize) AS CHAR(10)))+'' Dia x ''+RTRIM(CAST( FLOOR(inserted.sWeight) AS CHAR(10)))+'' Pounds '' ,''No Description'')
				FROM inserted
				WHERE ISNULL(inserted.Lot,0) > 0
					AND UPDATE(Passed);
			
			IF @Lot>0
				begin
				SET @Body = RTRIM(SUSER_SNAME())+'' updated the Wire_log ''+'' on ''+RTRIM(CAST(GETDATE()AS CHAR))
					+CHAR(10)+CHAR(13)+''GFM log for Lot: ''+CAST(@Lot AS CHAR(10)) ;
				SET @Body = @Body+CHAR(13)+@Descript+CHAR(13);
				end
			ELSE
				SET @Body = RTRIM(SUSER_SNAME())+'' updated the Wire_log ''+'' on ''+RTRIM(CAST(GETDATE()AS CHAR))
				+CHAR(10)+CHAR(13)+''GFM log Lot not found ''

			SET @Body = @Body+CHAR(13)+CHAR(13)+''No records found in trigger Wire_log_After_Update WHERE:
	WHERE inserted.ID = deleted.ID
	AND inserted.Passed = 1 
	AND deleted.Passed = 0	--Pass is True and was False
	AND ISNULL(inserted.Lot,0) > 0
	AND UPDATE(Passed);''

			EXEC dbo.p_eMail_Send
				@FromEmail = @cEmailFrom, 
				@ToEmail = ''David.Kirchner@ERP_1s.com;'',
				@SubjectEmail = ''Failed to create text'',
				@BodyEmail = @Body,
				@BodyType = ''TEXT''
*/
	END TRY
	BEGIN CATCH
		EXEC dbo.p_eMail_Send
			@FromEmail = @cEmailFrom, 
			@ToEmail = ''David.Kirchner@ERP_1s.com;'',
			@SubjectEmail = ''Failed to create text'',
			@BodyEmail = ''Failed to create text in trigger Wire_log_After_Update'',
			@BodyType = ''TEXT''

	END CATCH;

/*	ELSE
	begin

	-- check for Pass is now False!
	-- Send Email

	SELECT TOP 1 
		 @Lot = inserted.Lot
		,@SOitem = ISNULL(inserted.SOitem,'''')
		,@TestPOitem = ISNULL(inserted.TestPOitem,'''')
		,@WorkOrder = ISNULL(inserted.WO,0)
		,@WorkOrder_Detail = ISNULL(inserted.WO_Detail,0)
		,@ProjID = ISNULL(inserted.ProjID,0)
		FROM inserted, deleted
		WHERE inserted.ID = deleted.ID
		AND inserted.Passed = 0 
		AND deleted.Passed = 1	--Pass was True and is now False
		AND ISNULL(inserted.Lot,0) > 0
--			AND ISNULL(inserted.WO_Detail,0)>0 	

		

	end
*/
	end


PRINT ''Trigger  End [Wire_log_After_Update]'';
' 
GO
ALTER TABLE [dbo].[Wire_log] ENABLE TRIGGER [Wire_log_After_Update]
GO
/****** Object:  Trigger [dbo].[Wire_Log_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Wire_Log_Update]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.Swage_Log_Update     ******/


create TRIGGER [dbo].[Wire_Log_Update] 
ON [dbo].[Wire_log] 
	FOR UPDATE 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [Wire_Log_Update]'';

    
---big UPDATES are in error
DECLARE @Count int
SET @Count = @@ROWCOUNT;
   
IF @Count > 1000
BEGIN
	RAISERROR(''Cannot UPDATE more than 1000 records of dbo.Wire_Log at one time. trigger _Update'',16,1) 
	ROLLBACK TRANSACTION
	RETURN;
END
----------------------

PRINT ''Trigger  End [Wire_Log_Update]'';
' 
GO
ALTER TABLE [dbo].[Wire_log] ENABLE TRIGGER [Wire_Log_Update]
GO
/****** Object:  Trigger [dbo].[WorkOrder_After_Delete]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[WorkOrder_After_Delete]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.Sales_Delete    Script Date: 7/1/2004 1:57:08 PM ******/


CREATE TRIGGER [dbo].[WorkOrder_After_Delete] ON [dbo].[WorkOrder] 
	AFTER DELETE 
	--NOT FOR REPLICATION
AS

PRINT ''trigger start WorkOrder_After_Delete:'';

UPDATE dbo.Sales SET WO=0
	FROM deleted
	WHERE Sales.WO = deleted.WO

UPDATE dbo.PurchaseOrder SET WO=0
	FROM deleted
	WHERE PurchaseOrder.WO = deleted.WO

DELETE FROM dbo.StockLst_Process 
	FROM deleted
	WHERE StockLst_Process.WO = deleted.WO
	AND ISNULL(deleted.WO,0) > 0
	--AND ( Process_ID = ''IN_Process'' OR Process_ID = ''SELECTED'')

DELETE FROM dbo.WIPLst_Process 
	FROM deleted
	WHERE WIPLst_Process.WO = deleted.WO
	AND ISNULL(deleted.WO,0) > 0
	--AND ( Process_ID = ''IN_Process'' OR Process_ID = ''SELECTED'')

 PRINT ''trigger end WorkOrder_After_Delete:'';
' 
GO
ALTER TABLE [dbo].[WorkOrder] ENABLE TRIGGER [WorkOrder_After_Delete]
GO
/****** Object:  Trigger [dbo].[WorkOrder_After_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[WorkOrder_After_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[WorkOrder_After_Insert] ON [dbo].[WorkOrder] 
AFTER INSERT NOT FOR REPLICATION 
AS

PRINT ''Trigger Start [WorkOrder_After_Insert]'';

INSERT dbo.WorkOrder_Notes (WO,WO_Detail,Notes) 
	SELECT inserted.WO, 0 AS [WO_Detail], +'' Inserted by: ''+TRIM(SUSER_SNAME()) AS [Notes]
	FROM inserted



 --UPDATE WorkOrder_Detail fPRecv when WorkOrder changes.
IF UPDATE(ShopRecv)
	begin

	PRINT ''WorkOrder ShopRecv Updated()''
	UPDATE dbo.WorkOrder_Detail	SET fPRecv = inserted.ShopRecv
		FROM inserted 
		INNER JOIN dbo.WorkOrder_Detail WOD ON inserted.WO = WOD.WO
		WHERE UPDATE(ShopRecv)

	end

--UPDATE WorkOrder_Detail fMod when WorkOrder changes.
IF UPDATE(Changing)
	begin

	PRINT ''WorkOrder Changing Updated()''
	UPDATE dbo.WorkOrder_Detail	SET fMod = inserted.Changing
		FROM inserted 
		INNER JOIN dbo.WorkOrder_Detail WOD ON inserted.WO = WOD.WO
		WHERE UPDATE(Changing)

	end

--Change fPrint back to 0 when Changing = 1
IF UPDATE(Changing)
	begin

	PRINT ''WorkOrder Changing Updated() fPrint = 0 ''
	UPDATE dbo.WorkOrder_Detail	SET fPrint = 0 
		FROM inserted 
		INNER JOIN dbo.WorkOrder_Detail WOD ON inserted.WO = WOD.WO
		WHERE UPDATE(Changing)
		and inserted.Changing = 1
	
	end

PRINT ''Trigger  End  [WorkOrder_After_Insert]'';
' 
GO
ALTER TABLE [dbo].[WorkOrder] ENABLE TRIGGER [WorkOrder_After_Insert]
GO
/****** Object:  Trigger [dbo].[WorkOrder_Delete]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[WorkOrder_Delete]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.WorkOrder_Detail_Update     ******/


create TRIGGER [dbo].[WorkOrder_Delete] 
ON [dbo].[WorkOrder] 
	FOR DELETE 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [WorkOrder_Detail]'';

	
	---big UPDATES are in error
	DECLARE @Count int
	SET @Count = @@ROWCOUNT;
    
	IF @Count > 100
	BEGIN
		RAISERROR(''Cannot UPDATE more than 100 records of dbo.Sales at one time. trigger Sales_Update'',16,1) 
		ROLLBACK TRANSACTION
		RETURN;
	END
	----------------------


PRINT ''Trigger  End [WorkOrder_Delete]'';
' 
GO
ALTER TABLE [dbo].[WorkOrder] ENABLE TRIGGER [WorkOrder_Delete]
GO
/****** Object:  Trigger [dbo].[WorkOrder_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[WorkOrder_Update]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.WorkOrder_Detail_Update     ******/


CREATE TRIGGER [dbo].[WorkOrder_Update] 
ON [dbo].[WorkOrder] 
	FOR UPDATE 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [WorkOrder_Detail_Update]'';

	
	---big UPDATES are in error
	DECLARE @Count int
	SET @Count = @@ROWCOUNT;
    
	IF @Count > 100
	BEGIN
		RAISERROR(''Cannot UPDATE more than 100 records of dbo.Sales at one time. trigger Sales_Update'',16,1) 
		ROLLBACK TRANSACTION
		RETURN;
	END
	----------------------

IF UPDATE(Cncld) 
begin
	PRINT ''Cancel''
	--Cancel master and ALL details are cancelled.

	UPDATE ERP_2.dbo.WorkOrder_Detail SET fCncld = 1 
		FROM inserted 
		WHERE UPDATE(Cncld) 
		AND inserted.Cncld = 1
		AND WorkOrder_Detail.WO = inserted.WO

end

PRINT ''Trigger  End [WorkOrder_Update]'';
' 
GO
ALTER TABLE [dbo].[WorkOrder] ENABLE TRIGGER [WorkOrder_Update]
GO
/****** Object:  Trigger [dbo].[WorkOrder_Detail_After_Delete]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[WorkOrder_Detail_After_Delete]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.Sales_Delete    Script Date: 7/1/2004 1:57:08 PM ******/


CREATE TRIGGER [dbo].[WorkOrder_Detail_After_Delete] ON [dbo].[WorkOrder_Detail] 
	AFTER DELETE 
	--NOT FOR REPLICATION
AS

PRINT ''trigger start WorkOrder_Detail_After_Delete:'';

UPDATE dbo.Sales SET WO_Detail=0
	FROM deleted
	WHERE Sales.WO_Detail = deleted.WO_Detail

UPDATE dbo.PurchaseOrder SET WO_Detail=0
	FROM deleted
	WHERE PurchaseOrder.WO_Detail = deleted.WO_Detail

DELETE FROM dbo.StockLst_Process 
	FROM deleted
	WHERE StockLst_Process.WO_Detail = deleted.WO_Detail
	AND ISNULL(deleted.WO_Detail,0) > 0

DELETE FROM dbo.WIPLst_Process 
	FROM deleted
	WHERE WIPLst_Process.WO_Detail = deleted.WO_Detail
	AND ISNULL(deleted.WO_Detail,0) > 0


 PRINT ''trigger end WorkOrder_Detail_After_Delete:'';
' 
GO
ALTER TABLE [dbo].[WorkOrder_Detail] ENABLE TRIGGER [WorkOrder_Detail_After_Delete]
GO
/****** Object:  Trigger [dbo].[WorkOrder_Detail_After_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[WorkOrder_Detail_After_Update]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.WorkOrder_Detail_Update     ******/


Create TRIGGER [dbo].[WorkOrder_Detail_After_Update] 
ON [dbo].[WorkOrder_Detail] 
	AFTER UPDATE 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [WorkOrder_Detail_After_Update]'';

IF UPDATE(PassTest) 
begin
	PRINT ''PassTest''
	


end

PRINT ''Trigger  End [WorkOrder_Detail_After_Update]'';
' 
GO
ALTER TABLE [dbo].[WorkOrder_Detail] ENABLE TRIGGER [WorkOrder_Detail_After_Update]
GO
/****** Object:  Trigger [dbo].[WorkOrder_Detail_Delete]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[WorkOrder_Detail_Delete]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.WorkOrder_Detail_Update     ******/


CREATE TRIGGER [dbo].[WorkOrder_Detail_Delete] 
ON [dbo].[WorkOrder_Detail] 
	FOR DELETE 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [WorkOrder_Detail_Delete]'';

	
	---big UPDATES are in error
	DECLARE @Count int
	SET @Count = @@ROWCOUNT;
    
	IF @Count > 100
	BEGIN
		RAISERROR(''Cannot UPDATE more than 100 records of dbo.Sales at one time. trigger Sales_Update'',16,1) 
		ROLLBACK TRANSACTION
		RETURN;
	END
	----------------------


IF UPDATE(fCmplt) 
begin
	PRINT ''Complete''
	--SELECT WO.Cncld,WD.fCncld
	--,WO.Cmplt,WD.fCmplt,WO.WO,WD.WO_Detail

	UPDATE dbo.WorkOrder SET Cmplt = 

	CASE WHEN (SELECT Count(*) FROM dbo.WorkOrder_Detail WITH(NOLOCK) WHERE WO = WO.WO) =
		(SELECT Count(*) FROM dbo.WorkOrder_Detail WITH(NOLOCK) WHERE WO = WO.WO AND fCmplt=1) 
	THEN 1 ELSE 0 END

		FROM dbo.WorkOrder WO WITH(NOLOCK) 
		INNER JOIN inserted ON WO.WO = inserted.WO
		INNER JOIN dbo.WorkOrder_Detail WD WITH(NOLOCK) ON WO.WO = WD.WO
		WHERE WO.Cmplt <> WD.fCmplt
		AND UPDATE(fCmplt) 
		AND (SELECT Count(*) FROM dbo.WorkOrder_Detail WITH(NOLOCK) WHERE WO = WO.WO) =
		    (SELECT Count(*) FROM dbo.WorkOrder_Detail WITH(NOLOCK) WHERE WO = WO.WO AND fCmplt=1) 


end

PRINT ''Trigger  End [WorkOrder_Detail_Delete]'';
' 
GO
ALTER TABLE [dbo].[WorkOrder_Detail] ENABLE TRIGGER [WorkOrder_Detail_Delete]
GO
/****** Object:  Trigger [dbo].[WorkOrder_Detail_Insert]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[WorkOrder_Detail_Insert]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.WorkOrder_Detail_Update     ******/


Create TRIGGER [dbo].[WorkOrder_Detail_Insert] 
ON [dbo].[WorkOrder_Detail] 
	FOR INSERT 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [WorkOrder_Detail_Inssert]'';

IF UPDATE(fCmplt) 
begin
	PRINT ''Complete''
	


end

PRINT ''Trigger  End [WorkOrder_Detail_Insert]'';
' 
GO
ALTER TABLE [dbo].[WorkOrder_Detail] ENABLE TRIGGER [WorkOrder_Detail_Insert]
GO
/****** Object:  Trigger [dbo].[WorkOrder_Detail_Update]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[WorkOrder_Detail_Update]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.WorkOrder_Detail_Update     ******/


CREATE TRIGGER [dbo].[WorkOrder_Detail_Update] 
ON [dbo].[WorkOrder_Detail] 
	FOR UPDATE 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [WorkOrder_Detail_Update]'';

IF UPDATE(fCmplt) 
begin
	--see if dbo.WorkOrder needs to be updated as Complete
	PRINT ''Complete''
	--SELECT WO.Cncld,WD.fCncld
	--,WO.Cmplt,WD.fCmplt,WO.WO,WD.WO_Detail

	UPDATE dbo.WorkOrder SET Cmplt = 

	CASE WHEN (SELECT Count(*) FROM dbo.WorkOrder_Detail WITH(NOLOCK) WHERE WO = WO.WO) =
		(SELECT Count(*) FROM dbo.WorkOrder_Detail WITH(NOLOCK) WHERE WO = WO.WO AND fCmplt=1) 
	THEN 1 ELSE 0 END

		FROM dbo.WorkOrder WO WITH(NOLOCK) 
		INNER JOIN inserted ON WO.WO = inserted.WO
		INNER JOIN dbo.WorkOrder_Detail WD WITH(NOLOCK) ON WO.WO = WD.WO
		WHERE WO.Cmplt <> WD.fCmplt
		AND UPDATE(fCmplt) 
		AND (SELECT Count(*) FROM dbo.WorkOrder_Detail WITH(NOLOCK) WHERE WO = WO.WO) =
		    (SELECT Count(*) FROM dbo.WorkOrder_Detail WITH(NOLOCK) WHERE WO = WO.WO AND fCmplt=1) 


end

PRINT ''Trigger  End [WorkOrder_Detail_Update]'';
' 
GO
ALTER TABLE [dbo].[WorkOrder_Detail] ENABLE TRIGGER [WorkOrder_Detail_Update]
GO
/****** Object:  DdlTrigger [DDLTrigger_AuditDB]    Script Date: 12/26/2025 5:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE parent_class_desc = 'DATABASE' AND name = N'DDLTrigger_AuditDB')
EXECUTE dbo.sp_executesql N'

CREATE TRIGGER [DDLTrigger_AuditDB]
    ON DATABASE
    FOR CREATE_PROCEDURE, ALTER_PROCEDURE, DROP_PROCEDURE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @EventData XML ;
    SET @EventData = EVENTDATA();
 
    DECLARE @ip VARCHAR(32) ;
    SET @ip =
        (
            SELECT client_net_address
                FROM sys.dm_exec_connections
                WHERE session_id = @@SPID
        );
 
    INSERT AuditDB.dbo.DDLEvents
    (
        EventType,
        EventDDL,
        EventXML,
        DatabaseName,
        SchemaName,
        ObjectName,
        HostName,
        IPAddress,
        ProgramName,
        LoginName
    )
    SELECT
        @EventData.value(''(/EVENT_INSTANCE/EventType)[1]'',   ''NVARCHAR(100)''), 
        @EventData.value(''(/EVENT_INSTANCE/TSQLCommand)[1]'', ''NVARCHAR(MAX)''),
        @EventData,
        DB_NAME(),
        @EventData.value(''(/EVENT_INSTANCE/SchemaName)[1]'',  ''NVARCHAR(255)''), 
        @EventData.value(''(/EVENT_INSTANCE/ObjectName)[1]'',  ''NVARCHAR(255)''),
        HOST_NAME(),
        @ip,
        PROGRAM_NAME(),
        SUSER_SNAME();
END
'
GO
ENABLE TRIGGER [DDLTrigger_AuditDB] ON DATABASE
GO
