--03 Create from HPAlloyNR 
USE [ERP_1]




/****** Object:  UserDefinedFunction [dbo].[f_Calc_SS_CCL]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Calc_SS_CCL]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
/* 
PRINT ''Calculate Starting Stock using Finish Size and Condition Level''
PRINT dbo.[f_Calc_SS_CCL](.875,''7'',''1'')
PRINT dbo.[f_Calc_SS_CCL](.875,''7'',''2'')
PRINT dbo.[f_Calc_SS_CCL](1,''7'',''3'')
PRINT dbo.[f_Calc_SS_CCL](1,''7'',''4'')
PRINT dbo.[f_Calc_SS_CCL](1,''7'',''5'')
PRINT dbo.[f_Calc_SS_CCL](1,''7'',''6'')
PRINT dbo.[f_Calc_SS_CCL](3.125,''7'','''')
PRINT dbo.[f_Calc_SS_CCL](3.125,''7'',''1'')
PRINT dbo.[f_Calc_SS_CCL](3.125,''7'',''4'')
PRINT dbo.f_Calc_SS_CCL (3.125,''L'',''5'')
*/
CREATE FUNCTION [dbo].[f_Calc_SS_CCL]
(	
	@fSize Float,
	@CC CHAR(1),
	@CL CHAR(1)
)
RETURNS Float
--returns standard starting Stock Dia for CC,CL
AS
BEGIN

DECLARE @sSize FLOAT = @fSize

--Leace at least .030 to gind off
--used in dbo.NR_Sales_YrSum_10Yr AS computed [dbo].[f_Calc_SS_CCL]([Thck],[CC],[CL])
--DECLARE @fSize Float =.875,	@CC CHAR(1)=''7'',	@CL CHAR(1)=''1''
-- print ([dbo].[f_Calc_SS_CCL](,''7'',''1''))
--PRINT CONCAT(''@fSize '',@fSize)

IF NOT (@CC=''7'' OR @CC=''S'' or @CC=''L'')
	RETURN @sSize
ELSE
begin
	
	IF @CL = '' ''
		RETURN @sSize


	IF @CL = ''1'' or @CL = ''A''
	begin
		SET @fSize = @fSize +.040
		IF @fSize < 1
			SET @sSize = SQRT(@fSize*@fSize*1.12)
		ELSE IF @fSize < 2
			SET @sSize = SQRT(@fSize*@fSize*1.12)
		ELSE IF @fSize < 3
			SET @sSize = SQRT(@fSize*@fSize*1.13)
		ELSE
			SET @sSize = SQRT(@fSize*@fSize*1.13)
	end

	IF @CL = ''2'' or @CL = ''B''
	begin
		SET @fSize = @fSize +.040
		IF @fSize < 1
			SET @sSize = SQRT(@fSize*@fSize*1.2)
		ELSE IF @fSize < 2
			SET @sSize = SQRT(@fSize*@fSize*1.21)
		ELSE IF @fSize < 3
			SET @sSize = SQRT(@fSize*@fSize*1.23)
		ELSE
			SET @sSize = SQRT(@fSize*@fSize*1.24)
	end

	IF @CL = ''3'' or @CL = ''C''
	begin
		SET @fSize = @fSize +.040
		IF @fSize < 1
			SET @sSize = SQRT(@fSize*@fSize*1.31)
		ELSE IF @fSize < 2
			SET @sSize = SQRT(@fSize*@fSize*1.33)
		ELSE IF @fSize < 3
			SET @sSize = SQRT(@fSize*@fSize*1.36)
		ELSE
			SET @sSize = SQRT(@fSize*@fSize*1.37)
	end

	IF @CL = ''4'' or @CL = ''D''
	begin
		SET @fSize = @fSize +.040
		IF @fSize < 1
			SET @sSize = SQRT(@fSize*@fSize*1.42)
		ELSE IF @fSize < 2
			SET @sSize = SQRT(@fSize*@fSize*1.44)
		ELSE IF @fSize < 3
			SET @sSize = SQRT(@fSize*@fSize*1.46)
		ELSE
			SET @sSize = SQRT(@fSize*@fSize*1.46)
	end

	IF @CL = ''5'' or @CL = ''E''
	begin
		SET @fSize = @fSize +.040
		IF @fSize < 1
			SET @sSize = SQRT(@fSize*@fSize*1.49)
		ELSE IF @fSize < 2
			SET @sSize = SQRT(@fSize*@fSize*1.50)
		ELSE IF @fSize < 3
			SET @sSize = SQRT(@fSize*@fSize*1.52)
		ELSE
			SET @sSize = SQRT(@fSize*@fSize*1.52)
	end

	IF @CL = ''6''
	begin
		SET @fSize = @fSize +.040
		IF @fSize < 1
			SET @sSize = SQRT(@fSize*@fSize*1.52)
		ELSE IF @fSize < 2
			SET @sSize = SQRT(@fSize*@fSize*1.55)
		ELSE IF @fSize < 3
			SET @sSize = SQRT(@fSize*@fSize*1.60)
		ELSE 
			SET @sSize = SQRT(@fSize*@fSize*1.62)
	end

end
--RETURN dbo.f_StandardSizeMinus(@sSize)
--PRINT CONCAT(''@fSize '',@fSize)
--PRINT CONCAT(''@sSize '',@sSize)
--PRINT CONCAT(''dbo.f_StandardSizePlus(@sSize) '',dbo.f_StandardSizePlus(@sSize))
--PRINT CONCAT(''dbo.f_StandardSizeMinus(@sSize)'',dbo.f_StandardSizeMinus(@sSize))

--SELECT PT.size FROM dbo.PriceTable PT WHERE PT.Alloy = ''HPA N60'' AND (PT.Form = ''10'' or PT.Form = ''20'') AND @sSize > 0

RETURN dbo.f_StandardSizePlus(@sSize)

END




--GRANT EXECUTE ON [dbo].[f_Calc_SS_CCL] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Is_Country_Restricted]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Is_Country_Restricted]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'Create FUNCTION [dbo].[f_Is_Country_Restricted]
(
@cISO2 char(2)
)
RETURNS BIT
AS
BEGIN

--SELECT dbo.f_Is_Country_Restricted (''CG'') --''Congo''
--SELECT dbo.f_Is_Country_Restricted (''CH'') --''Switzerland''
DECLARE @lReturn BIT

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @lReturn = 0

SELECT @lReturn=Restricted FROM dbo.Countries WHERE CountryCode = @cISO2 
	

RETURN @lReturn
END

' 
END
GO



/****** Object:  UserDefinedFunction [dbo].[f_NR_AreCertsValid]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_NR_AreCertsValid]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		 
-- Create date: 2015 08 04
-- Description:	Checks to see if all vendor documents are valid
-- =============================================
CREATE FUNCTION [dbo].[f_NR_AreCertsValid] 
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
/****** Object:  UserDefinedFunction [dbo].[f_NR_Calc_SS_ACCL]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_NR_Calc_SS_ACCL]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
/* 
PRINT ''Calculate Starting Stock using Finish Size and Condition Level''
PRINT dbo.[f_Calc_SS_ACCL](1,''HPA N60'',''7'',''1'')
PRINT dbo.[f_Calc_SS_ACCL](1,''HPA N60'',''7'',''2'')
PRINT dbo.[f_Calc_SS_ACCL](1,''HPA N60'',''7'',''3'')
PRINT dbo.[f_Calc_SS_ACCL](1,''HPA N60'',''7'',''4'')
PRINT dbo.[f_Calc_SS_ACCL](1,''HPA N60'',''7'',''5'')
PRINT dbo.[f_Calc_SS_ACCL](1,''HPA N60'',''7'',''6'')
PRINT dbo.[f_Calc_SS_ACCL](2.25,''HPA N60'',''7'',''4'')
PRINT dbo.f_Calc_SS_ACCL (2.375,''HPA N60'',''L'',''5'')
*/
CREATE FUNCTION [dbo].[f_NR_Calc_SS_ACCL]
(	
	@fSize Float,
	@Alloy CHAR(12),
	@CC CHAR(1),
	@CL CHAR(1)
)
RETURNS Float
--returns standart starting Stock Dia
AS
BEGIN
DECLARE @sSize FLOAT = @fSize
-- PRINT dbo.f_StandardSizeMinus(4)
--Leace at least .030 to gind off


IF @Alloy = ''HPA N30     '' or @Alloy = ''HPA N40     '' or @Alloy = ''HPA N50     '' or @Alloy = ''HPA N60     '' or @Alloy = ''C-276       '' or @Alloy = ''L605        '' or @Alloy = ''MP35N       ''
IF @CC=''7'' OR @CC=''S'' or @CC=''L''
begin
	--SET @fSize = @fSize +.050
	
	IF @CL = ''1'' or @CL = ''A''
		SET @sSize = dbo.f_Calc_SS_CCL (@fSize,''7'',''1'')

	IF @CL = ''2'' or @CL = ''B''
		SET @sSize = dbo.f_Calc_SS_CCL (@fSize,''7'',''2'')

	IF @CL = ''3'' or @CL = ''C''
		SET @sSize = dbo.f_Calc_SS_CCL (@fSize,''7'',''3'')

	IF @CL = ''4'' or @CL = ''D''
		SET @sSize = dbo.f_Calc_SS_CCL (@fSize,''7'',''4'')

	IF @CL = ''5'' or @CL = ''E''
		SET @sSize = dbo.f_Calc_SS_CCL (@fSize,''7'',''5'')
	
	IF @CL = ''6''
		SET @sSize = dbo.f_Calc_SS_CCL (@fSize,''7'',''6'')

end

RETURN dbo.f_StandardSizePlus(@sSize)
--RETURN dbo.f_StandardSizeMinus(@sSize)
END


--GRANT EXECUTE ON [dbo].[f_Calc_SS_ACCL] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Calc_SS_CCL]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Calc_SS_CCL]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
/* 
PRINT ''Calculate Starting Stock using Finish Size and Condition Level''
PRINT dbo.[f_Calc_SS_CCL](.875,''7'',''1'')
PRINT dbo.[f_Calc_SS_CCL](.875,''7'',''2'')
PRINT dbo.[f_Calc_SS_CCL](1,''7'',''3'')
PRINT dbo.[f_Calc_SS_CCL](1,''7'',''4'')
PRINT dbo.[f_Calc_SS_CCL](1,''7'',''5'')
PRINT dbo.[f_Calc_SS_CCL](1,''7'',''6'')
PRINT dbo.[f_Calc_SS_CCL](3.125,''7'','''')
PRINT dbo.[f_Calc_SS_CCL](3.125,''7'',''1'')
PRINT dbo.[f_Calc_SS_CCL](3.125,''7'',''4'')
PRINT dbo.f_Calc_SS_CCL (3.125,''L'',''5'')
*/
Create FUNCTION [dbo].[f_Calc_SS_CCL]
(	
	@fSize Float,
	@CC CHAR(1),
	@CL CHAR(1)
)
RETURNS Float
--returns standard starting Stock Dia for CC,CL
AS
BEGIN

DECLARE @sSize FLOAT = @fSize

--Leace at least .030 to gind off
--used in dbo.NR_Sales_YrSum_10Yr AS computed [dbo].[f_Calc_SS_CCL]([Thck],[CC],[CL])
--DECLARE @fSize Float =.875,	@CC CHAR(1)=''7'',	@CL CHAR(1)=''1''
-- print ([dbo].[f_Calc_SS_CCL](,''7'',''1''))
--PRINT CONCAT(''@fSize '',@fSize)

IF NOT (@CC=''7'' OR @CC=''S'' or @CC=''L'')
	RETURN @sSize
ELSE
begin
	
	IF @CL = '' ''
		RETURN @sSize


	IF @CL = ''1'' or @CL = ''A''
	begin
		SET @fSize = @fSize +.040
		IF @fSize < 1
			SET @sSize = SQRT(@fSize*@fSize*1.12)
		ELSE IF @fSize < 2
			SET @sSize = SQRT(@fSize*@fSize*1.12)
		ELSE IF @fSize < 3
			SET @sSize = SQRT(@fSize*@fSize*1.13)
		ELSE
			SET @sSize = SQRT(@fSize*@fSize*1.13)
	end

	IF @CL = ''2'' or @CL = ''B''
	begin
		SET @fSize = @fSize +.040
		IF @fSize < 1
			SET @sSize = SQRT(@fSize*@fSize*1.2)
		ELSE IF @fSize < 2
			SET @sSize = SQRT(@fSize*@fSize*1.21)
		ELSE IF @fSize < 3
			SET @sSize = SQRT(@fSize*@fSize*1.23)
		ELSE
			SET @sSize = SQRT(@fSize*@fSize*1.24)
	end

	IF @CL = ''3'' or @CL = ''C''
	begin
		SET @fSize = @fSize +.040
		IF @fSize < 1
			SET @sSize = SQRT(@fSize*@fSize*1.31)
		ELSE IF @fSize < 2
			SET @sSize = SQRT(@fSize*@fSize*1.33)
		ELSE IF @fSize < 3
			SET @sSize = SQRT(@fSize*@fSize*1.36)
		ELSE
			SET @sSize = SQRT(@fSize*@fSize*1.37)
	end

	IF @CL = ''4'' or @CL = ''D''
	begin
		SET @fSize = @fSize +.040
		IF @fSize < 1
			SET @sSize = SQRT(@fSize*@fSize*1.42)
		ELSE IF @fSize < 2
			SET @sSize = SQRT(@fSize*@fSize*1.44)
		ELSE IF @fSize < 3
			SET @sSize = SQRT(@fSize*@fSize*1.46)
		ELSE
			SET @sSize = SQRT(@fSize*@fSize*1.46)
	end

	IF @CL = ''5'' or @CL = ''E''
	begin
		SET @fSize = @fSize +.040
		IF @fSize < 1
			SET @sSize = SQRT(@fSize*@fSize*1.49)
		ELSE IF @fSize < 2
			SET @sSize = SQRT(@fSize*@fSize*1.50)
		ELSE IF @fSize < 3
			SET @sSize = SQRT(@fSize*@fSize*1.52)
		ELSE
			SET @sSize = SQRT(@fSize*@fSize*1.52)
	end

	IF @CL = ''6''
	begin
		SET @fSize = @fSize +.040
		IF @fSize < 1
			SET @sSize = SQRT(@fSize*@fSize*1.52)
		ELSE IF @fSize < 2
			SET @sSize = SQRT(@fSize*@fSize*1.55)
		ELSE IF @fSize < 3
			SET @sSize = SQRT(@fSize*@fSize*1.60)
		ELSE 
			SET @sSize = SQRT(@fSize*@fSize*1.62)
	end

end
--RETURN dbo.f_StandardSizeMinus(@sSize)
--PRINT CONCAT(''@fSize '',@fSize)
--PRINT CONCAT(''@sSize '',@sSize)
--PRINT CONCAT(''dbo.f_StandardSizePlus(@sSize) '',dbo.f_StandardSizePlus(@sSize))
--PRINT CONCAT(''dbo.f_StandardSizeMinus(@sSize)'',dbo.f_StandardSizeMinus(@sSize))

--SELECT PT.size FROM dbo.PriceTable PT WHERE PT.Alloy = ''HPA N60'' AND (PT.Form = ''10'' or PT.Form = ''20'') AND @sSize > 0

RETURN dbo.f_StandardSizePlus(@sSize)

END




--GRANT EXECUTE ON [dbo].[f_Calc_SS_CCL] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_NR_EstimateCutDistanceBar]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_NR_EstimateCutDistanceBar]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		 
-- Create date: 2015 07 17
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_NR_EstimateCutDistanceBar] 
(
	-- Add the parameters for the function here
	@alloy varchar(15)
	,@form char(2)
	,@cc char(2)
	,@size decimal
	,@length decimal
)
RETURNS decimal
AS
BEGIN
	-- Declare the return variable here
DECLARE @cutDistance decimal = 0
,@piecesNeeded decimal = 10
,@piecesThatFit decimal = 10
,@invLength decimal = 0
,@width decimal = 0
,@fetchedAlloy varchar(15)
,@fetchedForm char(2)
,@fetchedCC char(2)
,@fetchedSize decimal
,@fetchedDim2 decimal
,@fetchedDim3 decimal


declare MyCursor cursor STATIC for 
	SELECT
	m.alloy
	,m.form
	,m.cc
	,m.Size
	--,d.Dim1
	,d.Dim2
	,d.Dim3
	FROM  dbo.stocklst_master AS m
		INNER JOIN dbo.stocklst_detail AS d ON m.id = d.id 
		LEFT JOIN dbo.Receiving r ON d.ReceivingID = r.ID
		LEFT OUTER JOIN dbo.stockLst_process AS p ON d.id_detail = p.id_detail
	WHERE ISNULL(StockTable, ''S'') = ''S''
		AND ISNULL(RMA_No,0) = 0
		AND @alloy = m.Alloy
		AND @form = m.Form
		AND @cc = m.CC
		AND @size = m.Size
		AND (
				(@width <= d.Dim2 AND @length <= d.Dim3)
				OR
				(@width <= d.Dim3 AND @length <= d.Dim2)
			)
	AND ISNULL(p.Process_ID,'''') NOT LIKE ''%SELECTED%''
	open MyCursor
	FETCH NEXT FROM MyCursor INTO @fetchedAlloy, @fetchedForm, @fetchedCC, @fetchedSize, @fetchedDim2, @fetchedDim3
	while @@FETCH_STATUS = 0 
	begin
		SET @invLength = ISNULL(@fetchedDim2, 0)
        if (@length * @piecesNeeded <= @invLength)--step 2
        BEGIN--this means that the one inv piece was big enough to cover the quoted amount (or possibly the remainer if the loop has already executed)
            if (@invLength - (@length * @piecesNeeded) > 5)
			BEGIN
                SET @cutDistance = (@piecesNeeded) * @size;
			END
            else
			BEGIN
                SET @cutDistance = (@piecesNeeded - 1) * @size;
			END
            SET @piecesNeeded = 0;
        END
        else
        BEGIN--this means that the one inv piece will not be big enough to cover the entire quote
			SET @piecesThatFit = @piecesNeeded - 1;
            while (@piecesThatFit > 0 AND @piecesNeeded > 0)
            BEGIN
                if (@length * @piecesThatFit <= @invLength)
                BEGIN
                    if (@invLength - (@length * @piecesThatFit) > 5)
                        SET @cutDistance = (@piecesThatFit) * @size;
                    else
                        SET @cutDistance = (@piecesThatFit - 1) * @size;
                    SET @piecesNeeded -= @piecesThatFit;
                END
				SET @piecesThatFit -= 1;
            END
        END
		if (@piecesNeeded <= 0)
        BEGIN
            break;
        END
		FETCH NEXT FROM MyCursor INTO @fetchedAlloy, @fetchedForm, @fetchedCC, @fetchedSize, @fetchedDim2, @fetchedDim3
	end
	close MyCursor
	DEALLOCATE MyCursor
while(@piecesNeeded > 0)
BEGIN
    /* for plate
        * thck <= .032
        *      use 36 x 120
        * thck .032 < x <= .25
        *      use 48 x 120
        *      
        * for bar
        * length = 12
        * created by   2015/7/13
        * yes, I''m the only developer, but some day I may not be!
        */
    SET @invLength = 12;
    if (@length > @invLength)
    BEGIN--this means that the one inv piece was not big enough to cover one quoted piece
        SET @invLength = 999;
        if (@length > @invLength)
        BEGIN--this means that the one inv piece was not big enough to cover one quoted piece, too big to bother with cutting charges
            break;
        END
    END
    if (@length * @piecesNeeded <= @invLength)--step 2
    BEGIN--this means that the one inv piece was big enough to cover the quoted amount (or possibly the remainer if the loop has already executed)
        if (@invLength - (@length * @piecesNeeded) > 5)
		BEGIN
            SET @cutDistance = (@piecesNeeded) * @size;
		END
        else
		BEGIN
            SET @cutDistance = (@piecesNeeded - 1) * @size;
		END
        SET @piecesNeeded = 0;
    END
    else
    BEGIN--this means that the one inv piece will not be big enough to cover the entire quote
		SET @piecesThatFit = @piecesNeeded - 1;
        while (@piecesThatFit > 0 AND @piecesNeeded > 0)
        BEGIN
            if (@length * @piecesThatFit <= @invLength)
            BEGIN
                if (@invLength - (@length * @piecesThatFit) > 5)
                    SET @cutDistance = (@piecesThatFit) * @size;
                else
                    SET @cutDistance = (@piecesThatFit - 1) * @size;
                SET @piecesNeeded -= @piecesThatFit;
            END
			SET @piecesThatFit -= 1;
        END
    END
END

	--SELECT @cutDistance as [Cut Distance]

	-- Return the result of the function
	RETURN @cutDistance
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_NR_EstimateCutDistancePlateSheet]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_NR_EstimateCutDistancePlateSheet]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		 
-- Create date: 2015 07 17
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_NR_EstimateCutDistancePlateSheet] 
(
	-- Add the parameters for the function here
	@alloy varchar(15)
	,@form char(2)
	,@cc char(2)
	,@size decimal
	,@length decimal
	,@width decimal
)
RETURNS decimal
AS
BEGIN
	-- Declare the return variable here
DECLARE @cutDistance decimal = 0
,@piecesNeeded decimal = 10
,@piecesThatFit decimal = 10
,@invLength decimal = 0
,@invWidth decimal = 0
,@invPlaceHolder decimal = 0
,@fetchedAlloy varchar(15)
,@fetchedForm char(2)
,@fetchedCC char(2)
,@fetchedSize decimal
,@fetchedDim2 decimal
,@fetchedDim3 decimal


if (@width > @length)
BEGIN
    SET @invPlaceHolder = @width;
    SET @width = @length;
    SET @length = @invPlaceHolder;
END

declare MyCursor cursor STATIC for 
	SELECT
	m.alloy
	,m.form
	,m.cc
	,m.Size
	--,d.Dim1
	,d.Dim2
	,d.Dim3
	FROM  dbo.stocklst_master AS m
		INNER JOIN dbo.stocklst_detail AS d ON m.id = d.id 
		LEFT JOIN dbo.Receiving r ON d.ReceivingID = r.ID
		LEFT OUTER JOIN dbo.stockLst_process AS p ON d.id_detail = p.id_detail
	WHERE ISNULL(StockTable, ''S'') = ''S''
		AND ISNULL(RMA_No,0) = 0
		AND @alloy = m.Alloy
		AND @form = m.Form
		AND @cc = m.CC
		AND @size = m.Size
		AND (
				(@width <= d.Dim2 AND @length <= d.Dim3)
				OR
				(@width <= d.Dim3 AND @length <= d.Dim2)
			)
	AND ISNULL(p.Process_ID,'''') NOT LIKE ''%SELECTED%''

	open MyCursor
	FETCH NEXT FROM MyCursor INTO @fetchedAlloy, @fetchedForm, @fetchedCC, @fetchedSize, @fetchedDim2, @fetchedDim3
	while @@FETCH_STATUS = 0 
	begin
		SET @invWidth = ISNULL(@fetchedDim2, 0)
		SET @invLength = ISNULL(@fetchedDim3, 0)
		if (@invWidth > @invLength)
		BEGIN
			SET @invPlaceHolder = @invWidth;
			SET @invWidth = @invLength;
			SET @invLength = @invPlaceHolder;
		END
        if (@length * @width * @piecesNeeded <= @invWidth * @invLength)--step 2
        BEGIN--this means that the one inv piece was big enough to cover the quoted amount (or possibly the remainer if the loop has already executed)
            SET @cutDistance = Floor(((@invLength / @length) - 1)) * @invLength + Floor(((@invWidth / @width) - 1)) * @invWidth;
            SET @piecesNeeded = 0;
        END
        else
        BEGIN--this means that the one inv piece will not be big enough to cover the entire quote
			SET @piecesThatFit = @piecesNeeded - 1;
            while (@piecesThatFit > 0 AND @piecesNeeded > 0)
            BEGIN
                if (@length * @width * @piecesThatFit <= @invWidth * @invLength)
                BEGIN
                    SET @cutDistance = Floor(((@invLength / @length) - 1)) * @invLength + Floor(((@invWidth / @width) - 1)) * @invWidth;
                SET @piecesNeeded -= @piecesThatFit;
                END
				SET @piecesThatFit -= 1;
            END
        END
		if (@piecesNeeded <= 0)
        BEGIN
            break;
        END
		FETCH NEXT FROM MyCursor INTO @fetchedAlloy, @fetchedForm, @fetchedCC, @fetchedSize, @fetchedDim2, @fetchedDim3
	end
	close MyCursor
	DEALLOCATE MyCursor
while(@piecesNeeded > 0)
BEGIN
    /* for plate
        * thck <= .032
        *      use 36 x 120
        * thck .032 < x <= .25
        *      use 48 x 120
        *      
        * for bar
        * length = 12
        * created by   2015/7/13
        * yes, I''m the only developer, but some day I may not be!
        */
        if (@size <= .032)
        BEGIN
            SET @invWidth = 36;
            SET @invLength = 120;
            if (@length * @width > @invWidth * @invLength)
            BEGIN--this means that the one inv piece was not big enough to cover one quoted piece
                SET @invWidth = 48;
                SET @invLength = 120;
            END
        END
        else
        BEGIN
            SET @invWidth = 48;
            SET @invLength = 120;
        END
        if (@length * @width > @invWidth * @invLength)
        BEGIN--this means that the one inv piece was not big enough to cover one quoted piece
            SET @invWidth = 999;
            SET @invLength = 999;
            if (@length * @width > @invWidth * @invLength)
            BEGIN--this means that the one inv piece was not big enough to cover one quoted piece, too big to bother with cutting charges
                break;
            END
        END
        if (@length * @width * @piecesNeeded <= @invWidth * @invLength)--step 2
        BEGIN--this means that the one inv piece was big enough to cover the quoted amount (or possibly the remainer if the loop has already executed)
            SET @cutDistance = Floor(((@invLength / @length) - 1)) * @invLength + Floor(((@invWidth / @width) - 1)) * @invWidth;
            SET @piecesNeeded = 0;
        END
        else
        BEGIN--this means that the one inv piece will not be big enough to cover the entire quote
			SET @piecesThatFit = @piecesNeeded - 1;
            while (@piecesThatFit > 0 AND @piecesNeeded > 0)
            BEGIN
                if (@length * @width * @piecesThatFit <= @invWidth * @invLength)
                BEGIN
                    SET @cutDistance = Floor(((@invLength / @length) - 1)) * @invLength + Floor(((@invWidth / @width) - 1)) * @invWidth;
                SET @piecesNeeded -= @piecesThatFit;
                END
				SET @piecesThatFit -= 1;
            END
        END
END

	--SELECT @cutDistance as [Cut Distance]

	-- Return the result of the function
	RETURN @cutDistance
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_NR_EstimateCuttingRate]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_NR_EstimateCuttingRate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		 
-- Create date: 2015 07 16
-- Description:	calculates an estimate of the cutting rate for an alloy group at a certain thck
-- =============================================
CREATE FUNCTION [dbo].[f_NR_EstimateCuttingRate] 
(
	-- Add the parameters for the function here
	@jobName char(50),
	@alloy char(12),
	@form CHAR(2),
	@cc CHAR(1),
	@thickness DECIMAL(11,4),
	@length DECIMAL(11,4),
	@width DECIMAL(11,4)
)
RETURNS DECIMAL(10,6)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result DECIMAL(10,6)

	-- Add the T-SQL statements to compute the return value here
	SET @Result = 
	(
	SELECT TOP 1000 
		  --otj.jobDescription
		  (AVG(CONVERT(decimal,dbo.f_NR_OT_GetTotalTime_Adv(ot.trackID))) / CONVERT(decimal,60)) 
		  / CASE WHEN @form = ''40'' THEN dbo.f_NR_EstimateCutDistancePlateSheet(@alloy, @form, @cc, @thickness, @length, @width) 
			WHEN @form = ''50'' THEN dbo.f_NR_EstimateCutDistancePlateSheet(@alloy, @form, @cc, @thickness, @length, @width) 
			WHEN @form = ''10'' THEN dbo.f_NR_EstimateCutDistanceBar(@alloy, @form, @cc, @thickness, @length) 
			WHEN @form = ''11'' THEN dbo.f_NR_EstimateCutDistanceBar(@alloy, @form, @cc, @thickness, @length) 
			WHEN @form = ''12'' THEN dbo.f_NR_EstimateCutDistanceBar(@alloy, @form, @cc, @thickness, @length) 
			WHEN @form = ''13'' THEN dbo.f_NR_EstimateCutDistanceBar(@alloy, @form, @cc, @thickness, @length) 
			ELSE 0
			END as [Rate (hr/in)] --time/distance
		  --,aq.alloy
	  FROM dbo.Alloy_AlloyCategory aac0
	  INNER JOIN dbo.Alloy_AlloyCategory aac on aac0.AlloyCategoryID = aac.AlloyCategoryID
	  INNER JOIN dbo.AllQuotes aq on aac.alloy = aq.alloy
	  INNER JOIN dbo.NR_OT ot on ot.orderItem = LTRIM(aq.SOitem)
	  INNER JOIN dbo.NR_OT_Job otj on ot.jobID = otj.jobID
	  INNER JOIN dbo.NR_OT_Time ott on ot.trackID = ott.trackID
	  WHERE aac0.alloy = @alloy
	  AND aq.form = @form
	  AND aq.cc = @cc
	  AND aq.thck = @thickness
	  AND RTRIM(otj.jobDescription) = RTRIM(@jobName)
	  AND ott.time > DATEADD(year, -1, GETDATE())
	  AND ott.status = ''finish''
	)

	-- Return the result of the function
	RETURN @Result

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_NR_HasConflictMineralsFile]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_NR_HasConflictMineralsFile]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		 
-- Create date: 2015 8 4
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_NR_HasConflictMineralsFile] 
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
/****** Object:  UserDefinedFunction [dbo].[f_NR_Is_Holiday]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_NR_Is_Holiday]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David Kirchner
-- Create date: 2015 08 04
-- Description:	Checks to see if all vendor documents are valid
-- =============================================
CREATE FUNCTION [dbo].[f_NR_Is_Holiday] 
(
	@Date DateTime
)
RETURNS Bit

--PRINT dbo.f_NR_Is_Holiday(''01/01/2016'')
--PRINT dbo.f_NR_Is_Holiday(''2016-01-01'')
--PRINT dbo.f_NR_Is_Holiday(GetDate())

AS
BEGIN
	-- Declare the return variable here
	DECLARE @Is_Holiday bit = 0

	-- Add the T-SQL statements to compute the return value here
	IF EXISTS( SELECT * FROM dbo.NR_HPA_Holidays WHERE [HolidayDate] = @Date )
		SET @Is_Holiday = 1
	ELSE
		SET @Is_Holiday = 0

	
	RETURN @Is_Holiday

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_NR_MachineTracking_GetTotalMinutes]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_NR_MachineTracking_GetTotalMinutes]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		 
-- Create date: 2015 11 02
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_NR_MachineTracking_GetTotalMinutes] 
(
	-- Add the parameters for the function here
	@datemin datetime
	,@datemax datetime
	,@sensorID smallint
)
RETURNS int
AS
BEGIN
	declare @startDate datetime
		,@totalMin float = 0
		,@isON bit
		,@time datetime
	declare MyInnerCursor cursor STATIC for 
		SELECT [MachineTrackingDetail_Date]
				,ISNULL([MachineTrackingDetail_Value], 0) [MachineTrackingDetail_Value]
				--,[MachineTrackingDetail_SensorID]
			FROM [dbo].[NR_MachineTrackingDetail]
			WHERE [MachineTrackingDetail_Date] > @datemin
			AND  [MachineTrackingDetail_Date] <= @datemax
			AND [MachineTrackingDetail_SensorID] = @sensorID
		ORDER BY [MachineTrackingDetail_Date]
	open MyInnerCursor
	FETCH NEXT FROM MyInnerCursor INTO @time, @isON
	while @@FETCH_STATUS = 0 
	begin
		if(@isON = 1)
		begin
			if(@startDate IS NOT NULL)
			begin
				SET @totalMin += DATEDIFF(MINUTE, @startDate, @time)
			end
			SET @startDate = @time
		end
		else if(@isON = 0)
		begin
			SET @startDate = NULL
		end
		FETCH NEXT FROM MyInnerCursor INTO @time, @isON
	end
	close MyInnerCursor
	DEALLOCATE MyInnerCursor
	--SELECT @totalMin as [Total Minutes]

	-- Return the result of the function
	RETURN @totalMin
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_NR_OT_GetTotalTime]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_NR_OT_GetTotalTime]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		 
-- Create date: 2013 10 25
-- Description:	Calculates the time a job took in order tracking
-- =============================================
CREATE FUNCTION [dbo].[f_NR_OT_GetTotalTime] 
(
	-- Add the parameters for the function here
	@trackID uniqueidentifier
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	declare @startDate datetime
		,@totalMin float = 0
		,@status nchar(15)
		,@time datetime
	declare MyCursor cursor STATIC for 
		SELECT TOP 1000 --[trackTimeID],
			[status]
			,[time]
			--,[trackID]
		FROM [dbo].[NR_OT_Time]
		WHERE trackID = @trackID
		ORDER BY time
	open MyCursor
	FETCH NEXT FROM MyCursor INTO @status, @time
	while @@FETCH_STATUS = 0 
	begin
		if(RTRIM(@status) = ''start''
			OR RTRIM(@status) = ''resume'')
		begin
			SET @startDate = @time
		end
		else if(RTRIM(@status) = ''pause''
			OR RTRIM(@status) = ''finish'')
		begin
			if(@startDate IS NOT NULL)
			begin
				SET @totalMin += DATEDIFF(mi, @startDate, @time)
				SET @startDate = NULL
			end
		end
		FETCH NEXT FROM MyCursor INTO @status, @time
	end
	close MyCursor
	DEALLOCATE MyCursor
	--SELECT @totalMin as [Total Minutes]

	-- Return the result of the function
	RETURN @totalMin

END
' 
END
GO
/****** Object:  Table [dbo].[NR_OT_Time]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_OT_Time]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_OT_Time](
	[trackTimeID] [uniqueidentifier] NOT NULL,
	[status] [nchar](15) NOT NULL,
	[time] [datetime] NOT NULL,
	[trackID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_NR_OT_Time] PRIMARY KEY CLUSTERED 
(
	[trackTimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NR_OT_Job]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_OT_Job]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_OT_Job](
	[jobID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[jobDescription] [nchar](50) NOT NULL,
	[MaintenanceID] [int] NULL,
	[jobClass] [nchar](11) NOT NULL,
	[jobType] [nchar](50) NOT NULL,
	[Machine] [bit] NULL,
 CONSTRAINT [PK_NR_OT_Job] PRIMARY KEY NONCLUSTERED 
(
	[jobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_NR_OT_Job_job_class]    Script Date: 12/26/2025 4:00:41 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[NR_OT_Job]') AND name = N'IX_NR_OT_Job_job_class')
CREATE CLUSTERED INDEX [IX_NR_OT_Job_job_class] ON [dbo].[NR_OT_Job]
(
	[jobClass] ASC,
	[jobType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NR_OT]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_OT]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_OT](
	[trackID] [uniqueidentifier] NOT NULL,
	[orderItem] [char](15) NOT NULL,
	[jobID] [uniqueidentifier] NOT NULL,
	[isPO] [bit] NULL,
	[orderType] [uniqueidentifier] NULL,
 CONSTRAINT [PK_NR_OTracking] PRIMARY KEY CLUSTERED 
(
	[trackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[NR_OT_TimeView]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NR_OT_TimeView]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[NR_OT_TimeView]
AS
SELECT        TOP (100) PERCENT ot.trackID, ot.orderItem, otj.jobID, otj.jobDescription, ott.trackTimeID, ott.status, ott.time, ot.isPO
FROM            dbo.NR_OT AS ot INNER JOIN
                         dbo.NR_OT_Time AS ott ON ot.trackID = ott.trackID INNER JOIN
                         dbo.NR_OT_Job AS otj ON ot.jobID = otj.jobID
WHERE        (ott.time > GETDATE() - 365)
ORDER BY ott.time
' 
GO
/****** Object:  Table [dbo].[NR_OT_Employee]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_OT_Employee]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_OT_Employee](
	[trackEmpID] [uniqueidentifier] NOT NULL,
	[EmployeeId] [float] NOT NULL,
	[trackID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_OT_Employee] PRIMARY KEY CLUSTERED 
(
	[trackEmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NR_Sales_YrSum_10Yr]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_Sales_YrSum_10Yr]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_Sales_YrSum_10Yr](
	[Alloy] [char](12) NOT NULL,
	[form] [char](2) NOT NULL,
	[CC] [char](1) NOT NULL,
	[CL] [char](1) NOT NULL,
	[SS]  AS ([dbo].[f_Calc_SS_CCL]([Thck],[CC],[CL])),
	[Thck] [float] NULL,
	[Yr] [int] NOT NULL,
	[TotQtyYr] [int] NULL,
	[QTY_AvYr] [int] NULL,
	[CNT_AvYr] [int] NULL,
	[Comment] [char](10) NULL,
	[When] [date] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  UserDefinedFunction [dbo].[TVF_NR_Sales_YrSum_Pivot]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TVF_NR_Sales_YrSum_Pivot]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<David Kirchner>
-- Create date: <2025-01-18>
-- Description:	<Forcasting>
-- =============================================
CREATE FUNCTION [dbo].[TVF_NR_Sales_YrSum_Pivot]
(	
@Yrs TINYINT
)
RETURNS TABLE 
AS
--SELECT * FROM dbo.TVF_Sales_YrSum_Pivot(6)


--build the table first EXEC [dbo].[p_NR_FILL_Sales_YrSum_10Yr]; SELECT * FROM dbo.NR_Sales_YrSum_10Yr ;
RETURN 
(


SELECT [Alloy]
      ,[form]
      ,[CC]
      ,[CL]
	  ,[ss]
      ,[Thck]
	,Y18
	,Y19
	,Y20
	,Y21
	,Y22
	,Y23
	,Y24
--	,Y25

,(tmp.Y18+tmp.Y19+tmp.Y20+tmp.Y21+tmp.Y22+tmp.Y23+tmp.Y24)/6 AS Yr6_Avg
,(tmp.Y22+tmp.Y23+tmp.Y24)/3 AS Yr3_Avg
-- SELECT dbo.f_Calc_Stock_CC_CL_QTY( ''HPA N60'',''10'',''7'',''3'',1 ) AS LBS_Stock
, dbo.f_Calc_Stock_CC_CL_QTY( Alloy,Form,CC,CL,Thck ) AS LBS_Stock
, dbo.f_Calc_Stock_QTY_Process_ID(Alloy,Form,CC,CL,SS,''INCOMING'') AS LBS_Due_In
, dbo.f_Calc_Stock_QTY_Process_ID(Alloy,Form,CC,CL,SS,''ELECTRALLO'') AS LBS_Due_In_E

FROM 

(
SELECT [Alloy]
      ,[form]
      ,[CC]
      ,[CL]
      ,[SS]
	  ,[Thck]
	,ISNULL([2018],0) AS Y18
	,ISNULL([2019],0) AS Y19
	,ISNULL([2020],0) AS Y20
	,ISNULL([2021],0) AS Y21
	,ISNULL([2022],0) AS Y22
	,ISNULL([2023],0) AS Y23
	,ISNULL([2024],0) AS Y24
--	,ISNULL([2025],0) AS Y25
FROM 
(SELECT [Alloy]
      ,[form]
      ,[CC]
      ,[CL]
      ,[SS]
	  ,[thck]
	  ,[Yr]
      ,[TotQtyYr]
      --,[QTY_AvYr]
      --,[CNT_AvYr]
	  
  FROM [dbo].[NR_Sales_YrSum_10Yr]
  WHERE [Thck]>0
) AS src
PIVOT
(	SUM([TotQtyYr])
	FOR [Yr] IN ([2018],[2019],[2020],[2021],[2022],[2023],[2024]--,[2025]
	)
) AS pvt

) tmp
--ORDER BY [Alloy],[form],[CC],[CL],[Thck]

) ' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[TVF_NR_Sales_Sum_Pivot]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TVF_NR_Sales_Sum_Pivot]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<David Kirchner>
-- Create date: <2025-01-18>
-- Description:	<Forcasting>
-- =============================================
create FUNCTION [dbo].[TVF_NR_Sales_Sum_Pivot]
(	
@Yrs TINYINT
)
RETURNS TABLE 
AS
--SELECT * FROM dbo.TVF_Sales_Sum_Pivot(6)

--build the table first EXEC 
--build the table first EXEC [dbo].[p_NR_FILL_Sales_Sum_10Yr]; SELECT * FROM dbo.NR_Sales_YrSum_10Yr ;
RETURN 
(


SELECT [Alloy]
      ,[form]
      ,[CC]
      ,[CL]
	  ,[ss]
      ,[Thck]
	,Y19
	,Y20
	,Y21
	,Y22
	,Y23
	,Y24
--	,Y25

,(tmp.Y19+tmp.Y20+tmp.Y21+tmp.Y22+tmp.Y23+tmp.Y24)/6 AS Yr6_Avg
,(tmp.Y22+tmp.Y23+tmp.Y24)/3 AS Yr3_Avg
-- SELECT dbo.f_Calc_Stock_CC_CL_QTY( ''HPA N60'',''10'',''7'',''3'',1 ) AS LBS_Stock
, dbo.f_Calc_Stock_CC_CL_QTY( Alloy,Form,CC,CL,Thck ) AS LBS_Stock
, dbo.f_Calc_Stock_QTY_Process_ID(Alloy,Form,CC,CL,SS,''INCOMING'') AS LBS_Due_In
, dbo.f_Calc_Stock_QTY_Process_ID(Alloy,Form,CC,CL,SS,''ELECTRALLO'') AS LBS_Due_In_E

FROM 

(
SELECT [Alloy]
      ,[form]
      ,[CC]
      ,[CL]
      ,[SS]
	  ,[Thck]

	,ISNULL([2019],0) AS Y19
	,ISNULL([2020],0) AS Y20
	,ISNULL([2021],0) AS Y21
	,ISNULL([2022],0) AS Y22
	,ISNULL([2023],0) AS Y23
	,ISNULL([2024],0) AS Y24
--	,ISNULL([2025],0) AS Y25
FROM 
(SELECT [Alloy]
      ,[form]
      ,[CC]
      ,[CL]
      ,[SS]
	  ,[thck]
	  ,[Yr]
      ,[TotQtyYr]
      --,[QTY_AvYr]
      --,[CNT_AvYr]
	  
  FROM [dbo].[NR_Sales_YrSum_10Yr]
  WHERE [Thck]>0
) AS src
PIVOT
(	SUM([TotQtyYr])
	FOR [Yr] IN ([2019],[2020],[2021],[2022],[2023],[2024]--,[2025]
	)
) AS pvt

) tmp
--ORDER BY [Alloy],[form],[CC],[CL],[Thck]

) ' 
END
GO
/****** Object:  Table [dbo].[NR_Web_Inquiry_Items]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_Web_Inquiry_Items]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_Web_Inquiry_Items](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[WebInqID] [int] NOT NULL,
	[Alloy] [varchar](150) NULL,
	[Specification] [varchar](150) NULL,
	[Description] [varchar](150) NULL,
	[Quantity] [varchar](150) NULL,
 CONSTRAINT [PK_NR_Web_Inquiry_Items] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NR_Web_Inquiry]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_Web_Inquiry]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_Web_Inquiry](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](110) NOT NULL,
	[Company] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](50) NULL,
	[Fax] [nvarchar](50) NULL,
	[Email] [nvarchar](256) NULL,
	[Alloy] [nvarchar](50) NULL,
	[Pieces] [nvarchar](50) NULL,
	[Description] [nvarchar](1000) NULL,
	[Comments] [nvarchar](1000) NULL,
	[Title] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[City] [nvarchar](100) NULL,
	[State] [nvarchar](50) NULL,
	[Zip] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[SalesP] [char](1) NULL,
	[IPAddr] [nvarchar](100) NULL,
	[InquiryDate] [datetime] NOT NULL,
	[LastName] [nvarchar](100) NULL,
	[Phone2] [nvarchar](50) NULL,
	[EmailBody] [varchar](max) NULL,
	[SourcePage] [varchar](max) NULL,
 CONSTRAINT [PK_NR_Web_Inquiry] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[v_NR_WebInq_Items]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_NR_WebInq_Items]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_NR_WebInq_Items]
AS
SELECT        WI.Name, WI.Company, WI.Phone, WI.Fax, WI.Email, WI.Description AS [Old Description], WI.Comments, WI.Title, WI.Address, WI.City, WI.State, WI.Zip, WI.Country, WI.SalesP, WI.IPAddr, WI.InquiryDate, WI.LastName, 
                         WI.Phone2, WI.EmailBody, WI.SourcePage, WII.WebInqID, WII.Alloy, WII.Specification, WII.Description, WII.Quantity
FROM            dbo.NR_Web_Inquiry AS WI INNER JOIN
                         dbo.NR_Web_Inquiry_Items AS WII ON WI.ID = WII.WebInqID
' 
GO
/****** Object:  View [dbo].[NR_OT_ShopRecv]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NR_OT_ShopRecv]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[NR_OT_ShopRecv]
AS
SELECT        TOP (100) PERCENT RTRIM(LTRIM(CONVERT(char(7), sn.salesnum))) AS salesnum, RTRIM(CONVERT(char, CONVERT(date, MAX(s.ShipDue)))) AS MaxShipDue
FROM            dbo.Sales_No AS sn LEFT OUTER JOIN
                         dbo.Sales AS s ON sn.salesnum = s.SalesNum LEFT OUTER JOIN
                         dbo.NR_OT AS o ON LTRIM(RTRIM(s.SOitem)) = LTRIM(RTRIM(o.orderItem)) LEFT OUTER JOIN
                         dbo.NR_OT_Time AS ott ON o.trackID = ott.trackID LEFT OUTER JOIN
                         dbo.PackingSlip AS p ON s.SOitem = p.SOitem
WHERE        (ISNULL(sn.cncld, 0) = 0) AND (p.SOitem IS NULL) AND (ISNULL(sn.cmplt, 0) = 0) AND (sn.salesnum > 50000) AND (ISNULL(s.Shipped, ''1900-01-01 00:00:00.000'') = ''1900-01-01 00:00:00.000'') AND (ISNULL(s.cncld, 0) = 0) AND 
                         (ISNULL(sn.ShopRecv, 0) = 1) AND (ott.trackTimeID IS NULL)
GROUP BY sn.salesnum
ORDER BY MaxShipDue
' 
GO
/****** Object:  View [dbo].[NR_OT_PackingSlip]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NR_OT_PackingSlip]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[NR_OT_PackingSlip]
AS
SELECT        o.trackID, LTRIM(RTRIM(s.SOitem)) AS soitem, CONVERT(char, CONVERT(date, MAX(pn.ps_date))) AS psDate
FROM            dbo.Sales_No AS sn INNER JOIN
                         dbo.Sales AS s ON sn.salesnum = s.SalesNum LEFT OUTER JOIN
                         dbo.PackingSlip AS p ON s.SOitem = p.SOitem INNER JOIN
                         dbo.NR_OT AS o ON LTRIM(RTRIM(o.orderItem)) = LTRIM(RTRIM(s.SOitem)) INNER JOIN
                         dbo.NR_OT_Time AS ott ON o.trackID = ott.trackID INNER JOIN
                         dbo.PackingSlip_No AS pn ON p.Packingsli = pn.packingsli
WHERE        (ISNULL(sn.cncld, 0) = 0) AND (p.SOitem IS NOT NULL) AND (sn.salesnum > 50000) AND (sn.ShopRecv = 1) AND (pn.ps_date > DATEADD(day, - 30, GETDATE())) AND (ISNULL(p.Cancld, 0) = 0) AND (ott.status = ''finish'')
GROUP BY s.SOitem, o.trackID
HAVING        (SUM(CONVERT(int, ISNULL(s.cncld, 0))) <> COUNT(s.SOitem))
' 
GO
/****** Object:  Table [dbo].[NR_OT_OrderType]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_OT_OrderType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_OT_OrderType](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[OrderTypeName] [varchar](50) NOT NULL,
	[OrderType] [varchar](5) NULL,
	[Type] [varchar](20) NOT NULL,
	[Proper] [varchar](100) NULL,
	[Notes] [varchar](max) NULL,
 CONSTRAINT [PK_NR_OT_OrderType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[NR_OT_View]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NR_OT_View]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[NR_OT_View]
AS
/* Sales Orders*/ SELECT o.trackID, otot.OrderType, o.orderItem, o.jobID, otj.jobDescription,
                             (SELECT        TOP (1) status
                               FROM            dbo.NR_OT_Time AS ott
                               WHERE        (time > GETDATE() - 365) AND (trackID = o.trackID)
                               ORDER BY time DESC) AS status,
                             (SELECT        TOP (1) time
                               FROM            dbo.NR_OT_Time AS ott
                               WHERE        (time > GETDATE() - 365) AND (trackID = o.trackID)
                               ORDER BY time DESC) AS time
FROM            dbo.NR_OT AS o LEFT JOIN
                         dbo.NR_OT_OrderType AS otot ON o.orderType = otot.Id INNER JOIN
                         dbo.NR_OT_Job AS otj ON o.jobID = otj.jobID INNER JOIN
                         dbo.Sales AS s ON LTRIM(RTRIM(o.orderItem)) = LTRIM(RTRIM(s.SOitem)) INNER JOIN
                         dbo.Sales_No AS sn ON sn.salesnum = s.SalesNum
WHERE        ((ISNULL(s.cncld, 0) = 0) AND (ISNULL(sn.cncld, 0) = 0) AND (s.ShipDue > GETDATE() - 365) AND (ISNULL(s.cmplt, 0) = 0)) AND (otot.OrderType = ''SI'' OR
                         otot.OrderType = ''SO'')
GROUP BY o.orderItem, o.jobID, otj.jobDescription, o.trackID, otot.OrderType
HAVING        (SUM(CONVERT(int, ISNULL(s.cncld, 0))) <> COUNT(s.SOitem))
UNION
/* Purchase Orders*/ SELECT o.trackID, otot.OrderType, o.orderItem, o.jobID, otj.jobDescription,
                             (SELECT        TOP (1) status
                               FROM            dbo.NR_OT_Time AS ott
                               WHERE        (time > GETDATE() - 365) AND (trackID = o.trackID)
                               ORDER BY time DESC) AS status,
                             (SELECT        TOP (1) time
                               FROM            dbo.NR_OT_Time AS ott
                               WHERE        (time > GETDATE() - 365) AND (trackID = o.trackID)
                               ORDER BY time DESC) AS time
FROM            dbo.NR_OT AS o LEFT JOIN
                         dbo.NR_OT_OrderType AS otot ON o.orderType = otot.Id INNER JOIN
                         dbo.NR_OT_Job AS otj ON o.jobID = otj.jobID INNER JOIN
                         dbo.PurchaseOrder po ON LTRIM(RTRIM(o.orderItem)) = LTRIM(RTRIM(po.POitem))
WHERE        ((ISNULL(po.Cancelled, 0) = 0) AND (ISNULL(po.Received, GETDATE()) > GETDATE() - 90)) AND (otot.OrderType = ''PI'' OR
                         otot.OrderType = ''PO'')
GROUP BY o.orderItem, o.jobID, otj.jobDescription, o.trackID, otot.OrderType
HAVING        (SUM(CONVERT(int, ISNULL(po.Cancelled, 0))) <> COUNT(po.POitem))
UNION
/* Work Order Details*/ SELECT o.trackID, otot.OrderType, o.orderItem, o.jobID, otj.jobDescription,
                             (SELECT        TOP (1) status
                               FROM            dbo.NR_OT_Time AS ott
                               WHERE        (time > GETDATE() - 365) AND (trackID = o.trackID)
                               ORDER BY time DESC) AS status,
                             (SELECT        TOP (1) time
                               FROM            dbo.NR_OT_Time AS ott
                               WHERE        (time > GETDATE() - 365) AND (trackID = o.trackID)
                               ORDER BY time DESC) AS time
FROM            dbo.NR_OT AS o LEFT JOIN
                         dbo.NR_OT_OrderType AS otot ON o.orderType = otot.Id INNER JOIN
                         dbo.NR_OT_Job AS otj ON o.jobID = otj.jobID INNER JOIN
                         dbo.WorkOrder_Detail AS wod ON LTRIM(RTRIM(o.orderItem)) = LTRIM(RTRIM(wod.WO_Detail))
WHERE        wod.fCmplt != 1 AND wod.fCncld != 1 AND otot.OrderType = ''WD''
GROUP BY o.orderItem, o.jobID, otj.jobDescription, o.trackID, otot.OrderType
UNION
/* Work Orders*/ SELECT o.trackID, otot.OrderType, o.orderItem, o.jobID, otj.jobDescription,
                             (SELECT        TOP (1) status
                               FROM            dbo.NR_OT_Time AS ott
                               WHERE        (time > GETDATE() - 365) AND (trackID = o.trackID)
                               ORDER BY time DESC) AS status,
                             (SELECT        TOP (1) time
                               FROM            dbo.NR_OT_Time AS ott
                               WHERE        (time > GETDATE() - 365) AND (trackID = o.trackID)
                               ORDER BY time DESC) AS time
FROM            dbo.NR_OT AS o LEFT JOIN
                         dbo.NR_OT_OrderType AS otot ON o.orderType = otot.Id INNER JOIN
                         dbo.NR_OT_Job AS otj ON o.jobID = otj.jobID INNER JOIN
                         dbo.WorkOrder AS wo ON LTRIM(RTRIM(o.orderItem)) = LTRIM(RTRIM(wo.WO))
WHERE        wo.Cmplt != 1 AND wo.Cncld != 1 AND otot.OrderType = ''WO''
GROUP BY o.orderItem, o.jobID, otj.jobDescription, o.trackID, otot.OrderType
UNION
/* Maintenance Orders*/ SELECT o.trackID, otot.OrderType, o.orderItem, o.jobID, otj.jobDescription,
                             (SELECT        TOP (1) status
                               FROM            dbo.NR_OT_Time AS ott
                               WHERE        (time > GETDATE() - 365) AND (trackID = o.trackID)
                               ORDER BY time DESC) AS status,
                             (SELECT        TOP (1) time
                               FROM            dbo.NR_OT_Time AS ott
                               WHERE        (time > GETDATE() - 365) AND (trackID = o.trackID)
                               ORDER BY time DESC) AS time
FROM            dbo.NR_OT AS o LEFT JOIN
                         dbo.NR_OT_OrderType AS otot ON o.orderType = otot.Id INNER JOIN
                         dbo.NR_OT_Job AS otj ON o.jobID = otj.jobID
WHERE        o.orderItem LIKE ''%[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]%'' AND otot.OrderType IS NULL
GROUP BY o.orderItem, o.jobID, otj.jobDescription, o.trackID, otot.OrderType
' 
GO
/****** Object:  Table [dbo].[NR_VendorFile]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_VendorFile]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_VendorFile](
	[VendorFilesID] [int] IDENTITY(1,1) NOT NULL,
	[VendCode] [int] NOT NULL,
	[VendorFileName] [nvarchar](150) NOT NULL,
	[VendorFileRevision] [smallint] NOT NULL,
	[VendorFileExpirationDate] [datetime] NOT NULL,
	[VendorFileCategory] [nvarchar](50) NOT NULL,
	[VendorFileActive] [bit] NOT NULL,
	[VendorFileBytes] [varbinary](max) NOT NULL,
	[VendorFileUploadDate] [datetime] NOT NULL,
	[VendorFileExpiringNoticeSent] [bit] NOT NULL,
	[VendorFileExpiredNoticeSent] [bit] NOT NULL,
 CONSTRAINT [PK_NR_VendorFile] PRIMARY KEY CLUSTERED 
(
	[VendorFilesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_ExpiringOrExpiredVendorFiles]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_ExpiringOrExpiredVendorFiles]
AS
SELECT v.VendCode, v.Company, ISNULL(vc.Contact, ''[No default quality contact]'') AS contactName, ISNULL(vc.Email, ''QA@ERP_1s.com'') AS contactEmail, vf.VendorFilesID, vf.VendorFileName, vf.VendorFileExpirationDate, 
                  vf.VendorFileExpiringNoticeSent, vf.VendorFileExpiredNoticeSent
FROM     dbo.Vendor AS v INNER JOIN
                  dbo.NR_VendorFile AS vf ON v.VendCode = vf.VendCode LEFT OUTER JOIN
                  dbo.VendorContact AS vc ON v.QASurveyContactID = vc.ContactID
WHERE  (v.Inactive = 0) AND (v.[subsidiary of] IS NULL) AND (CONVERT(date, vf.VendorFileExpirationDate) <= CONVERT(date, DATEADD(DAY, 7, GETDATE()))) AND (vf.VendorFileExpiredNoticeSent = 0) AND (RTRIM(vf.VendorFileCategory) 
                  <> ''Vendor Performance Reports'')
' 
GO

/****** Object:  View [dbo].[v_NR_VendorFile]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_NR_VendorFile]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_NR_VendorFile]
AS
SELECT        vf.VendorFilesID, vf.VendCode, v.Company, vf.VendorFileName, vf.VendorFileRevision, vf.VendorFileExpirationDate, vf.VendorFileCategory, vf.VendorFileActive, vf.VendorFileBytes, vf.VendorFileUploadDate, 
                         vf.VendorFileExpiringNoticeSent, vf.VendorFileExpiredNoticeSent
FROM            dbo.NR_VendorFile AS vf INNER JOIN
                         dbo.Vendor AS v ON vf.VendCode = v.VendCode
' 
GO
/****** Object:  View [dbo].[v_NR_VendorFiles_SurveyDisplay]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_NR_VendorFiles_SurveyDisplay]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_NR_VendorFiles_SurveyDisplay]
AS
SELECT        vf.VendorFilesID, vf.VendCode, v.Company, vf.VendorFileName, vf.VendorFileRevision, vf.VendorFileExpirationDate, vf.VendorFileCategory, vf.VendorFileActive, vf.VendorFileUploadDate
FROM            dbo.NR_VendorFile AS vf INNER JOIN
                         dbo.Vendor AS v ON vf.VendCode = v.VendCode
WHERE        (vf.VendorFileActive = 1) AND (vf.VendorFileCategory = ''ISO'' OR
                         vf.VendorFileCategory = ''AS'' OR
                         vf.VendorFileCategory = ''NADCAP'' OR
                         vf.VendorFileCategory = ''Quality Manual'' OR
                         vf.VendorFileCategory = ''Brochure'' OR
                         vf.VendorFileCategory = ''Conflict Mineral'' OR
                         vf.VendorFileCategory = ''Other'')
' 
GO
/****** Object:  Table [dbo].[NR_EmailTracker]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_EmailTracker]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_EmailTracker](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[emailKey] [varchar](255) NULL,
	[dateEntered] [datetime] NULL,
	[userInfo] [varchar](255) NULL,
	[ipaddress] [varchar](250) NULL,
	[quoteID] [int] NULL,
	[poID] [char](12) NULL,
	[vendorID] [int] NULL,
 CONSTRAINT [PK_NR_EmailTracker] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[NR_EmailTrackerDistinct]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NR_EmailTrackerDistinct]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[NR_EmailTrackerDistinct]
AS
SELECT DISTINCT TOP (100) PERCENT emailKey, userInfo, ipaddress, quoteID, poID, vendorID
FROM            dbo.NR_EmailTracker
' 
GO
/****** Object:  View [dbo].[NR_Open Sale Items]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NR_Open Sale Items]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[NR_Open Sale Items]
AS
SELECT        TOP (100) PERCENT LTRIM(RTRIM(s.SOitem)) AS soitem, s.SalesNum, sn.salesrep, RTRIM(CONVERT(char(30), CONVERT(date, CASE shipdue WHEN ''1900-01-01 00:00:00.000'' THEN NULL ELSE shipdue END))) 
                         AS shipdue, RTRIM(CONVERT(char(30), CONVERT(date, CASE shipped WHEN ''1900-01-01 00:00:00.000'' THEN NULL ELSE shipped END))) AS shipped, ISNULL(s.cncld, 0) AS itemCancelled, 
                         s.cmplt AS itemComplete, sn.cncld AS orderCancelled, sn.cmplt AS orderComplete, pn.packingsli, pn.packedby, pn.shippedvia, pn.tracking, p.Heat
FROM            dbo.Sales AS s INNER JOIN
                         dbo.Sales_No AS sn ON s.SalesNum = sn.salesnum LEFT OUTER JOIN
                         dbo.PackingSlip AS p ON s.SOitem = p.SOitem LEFT OUTER JOIN
                         dbo.PackingSlip_No AS pn ON p.Packingsli = pn.packingsli
WHERE        (s.ShipDue > GETDATE() - 365)
ORDER BY s.SOitem DESC, pn.tracking DESC
' 
GO
/****** Object:  View [dbo].[NR_OrderNotes]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NR_OrderNotes]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[NR_OrderNotes]
AS
SELECT     n.SOitem, n.Notes
FROM         dbo.SO_ProcessNotes AS n INNER JOIN
                      dbo.Sales AS s ON LTRIM(RTRIM(n.SOitem)) = LTRIM(RTRIM(s.soitem))
WHERE     (ISNULL(s.cmplt, 0) = 0) AND (ISNULL(s.cncld, 0) = 0) AND (s.salesnum > 50000)
' 
GO

/****** Object:  Table [dbo].[NR_AddressTwo_Data]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_AddressTwo_Data]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_AddressTwo_Data](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Action] [nchar](10) NOT NULL,
	[GroupID] [int] NOT NULL,
	[ContactID] [nvarchar](250) NULL,
	[ContactFirstName] [nvarchar](250) NOT NULL,
	[CurrentFirstName] [nvarchar](250) NULL,
	[UpdateFirstName] [bit] NOT NULL,
	[ContactLastName] [nvarchar](250) NOT NULL,
	[CurrentLastName] [nvarchar](250) NULL,
	[UpdateLastName] [bit] NOT NULL,
	[ContactEmail] [nvarchar](250) NOT NULL,
	[CurrentEmail] [nvarchar](250) NULL,
	[UpdateEmail] [bit] NOT NULL,
	[ContactPhone1] [nvarchar](250) NOT NULL,
	[CurrentPhone1] [nvarchar](250) NULL,
	[UpdatePhone1] [bit] NOT NULL,
	[AccountID] [nvarchar](250) NULL,
	[AccountName] [nvarchar](250) NOT NULL,
	[CurrentName] [nvarchar](250) NULL,
	[UpdateName] [bit] NOT NULL,
	[AccountAddress1] [nvarchar](250) NOT NULL,
	[CurrentAddress1] [nvarchar](250) NULL,
	[UpdateAddress1] [bit] NOT NULL,
	[AccountCity] [nvarchar](250) NOT NULL,
	[CurrentCity] [nvarchar](250) NULL,
	[UpdateCity] [bit] NOT NULL,
	[AccountState] [nvarchar](250) NOT NULL,
	[CurrentState] [nvarchar](250) NULL,
	[UpdateState] [bit] NOT NULL,
	[AccountZip] [nvarchar](250) NOT NULL,
	[CurrentZip] [nvarchar](250) NULL,
	[UpdateZip] [bit] NOT NULL,
	[AccountCountry] [nvarchar](250) NOT NULL,
	[CurrentCountry] [nvarchar](250) NULL,
	[UpdateCountry] [bit] NOT NULL,
	[AccountWebsite] [nvarchar](250) NOT NULL,
	[CurrentWebsite] [nvarchar](250) NULL,
	[UpdateWebsite] [bit] NOT NULL,
 CONSTRAINT [PK_NR_AddressTwo_Data_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NR_AddressTwo_Group]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_AddressTwo_Group]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_AddressTwo_Group](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_NR_AddressTwo_Group] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NR_AlloyCodeLevel]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_AlloyCodeLevel]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_AlloyCodeLevel](
	[Alloy] [char](12) NOT NULL,
	[CC] [char](1) NOT NULL,
	[CL] [char](1) NOT NULL,
	[UTS] [int] NULL,
	[Yld] [int] NULL,
	[EL] [tinyint] NULL,
	[RA] [tinyint] NULL,
	[RC] [tinyint] NULL,
	[BHN] [tinyint] NULL,
	[DiaMax] [numeric](5, 3) NULL,
	[Spec] [char](10) NULL,
	[Text] [varchar](50) NULL,
	[UTS_Max] [int] NULL,
	[YLD_Max] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_NR_AlloyCodeLevel]    Script Date: 12/26/2025 4:00:41 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[NR_AlloyCodeLevel]') AND name = N'IX_NR_AlloyCodeLevel')
CREATE UNIQUE CLUSTERED INDEX [IX_NR_AlloyCodeLevel] ON [dbo].[NR_AlloyCodeLevel]
(
	[Alloy] ASC,
	[CC] ASC,
	[CL] ASC,
	[Spec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NR_AreaCodes]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_AreaCodes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_AreaCodes](
	[AC] [char](3) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[ST] [char](2) NOT NULL,
	[Largest cities/towns covered] [nvarchar](255) NULL,
 CONSTRAINT [PK_NR_AreaCodes_1] PRIMARY KEY CLUSTERED 
(
	[AC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NR_Country Data]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_Country Data]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_Country Data](
	[Fips] [nvarchar](255) NULL,
	[Iso2] [nvarchar](255) NULL,
	[Iso3] [nvarchar](255) NOT NULL,
	[Un] [float] NULL,
	[Name] [nvarchar](255) NULL,
	[Area] [float] NULL,
	[Pop2005] [float] NULL,
	[Region] [float] NULL,
	[Subregion] [float] NULL,
	[Lon] [float] NULL,
	[Lat] [float] NULL,
	[DO NOT SELL] [bit] NOT NULL,
	[Restricted]  AS ([dbo].[f_Is_Country_Restricted]([ISO2])),
 CONSTRAINT [PK_NR_Country Data] PRIMARY KEY CLUSTERED 
(
	[Iso3] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NR_CountryCodes]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_CountryCodes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_CountryCodes](
	[Country Name] [nvarchar](255) NULL,
	[CountryCode] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NR_CW_Matrix]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_CW_Matrix]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_CW_Matrix](
	[Alloy] [char](12) NOT NULL,
	[Form] [char](2) NULL,
	[CC] [char](1) NULL,
	[CL] [char](1) NULL,
	[WorkSize] [float] NULL,
	[sSize] [float] NULL,
	[fSize] [float] NULL,
	[CW] [tinyint] NULL,
	[mach] [char](10) NULL,
	[lot] [int] NULL,
	[Spec] [varchar](30) NULL,
	[Ver] [char](10) NULL,
	[LogDate] [date] NULL,
	[when] [date] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NR_DateLookup]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_DateLookup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_DateLookup](
	[DateKey] [char](8) NOT NULL,
	[FullDate] [datetime] NOT NULL,
	[DayNumberOfMonth] [tinyint] NOT NULL,
	[DayNumberOfYear] [smallint] NOT NULL,
	[WeekNumberOfYear] [tinyint] NOT NULL,
	[MonthNumberOfYear] [tinyint] NOT NULL,
	[CalendarQuarter] [tinyint] NOT NULL,
	[CalendarYear] [smallint] NOT NULL,
 CONSTRAINT [PK_NR_DateLookup] PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NR_DBMail_Resend_Log]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_DBMail_Resend_Log]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_DBMail_Resend_Log](
	[mailitem_id] [int] NOT NULL,
	[send_request_date] [datetime] NOT NULL,
	[retryCount] [smallint] NOT NULL,
	[sendStatus] [bit] NOT NULL,
	[datesent] [datetime] NULL,
 CONSTRAINT [PK_NR_DBMail_Resend_Log] PRIMARY KEY CLUSTERED 
(
	[mailitem_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NR_DimGeography]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_DimGeography]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_DimGeography](
	[GeographyKey] [int] NOT NULL,
	[City] [nvarchar](30) NULL,
	[StateProvinceCode] [nvarchar](3) NULL,
	[StateProvinceName] [nvarchar](50) NULL,
	[CountryRegionCode] [nvarchar](3) NULL,
	[EnglishCountryRegionName] [nvarchar](50) NULL,
	[SpanishCountryRegionName] [nvarchar](50) NULL,
	[FrenchCountryRegionName] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](15) NULL,
	[SalesTerritoryKey] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NR_email_DoNotUse]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_email_DoNotUse]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_email_DoNotUse](
	[email] [varchar](255) NOT NULL,
	[DateUnsubscribed] [datetime] NOT NULL,
 CONSTRAINT [PK_NR_email_DoNotUse] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NR_email_Marketing]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_email_Marketing]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_email_Marketing](
	[email] [varchar](255) NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_NR_email_Marketing] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NR_GFM_N60_fact]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_GFM_N60_fact]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_GFM_N60_fact](
	[AlloyName] [char](12) NULL,
	[Heat] [char](50) NULL,
	[Lot] [int] NOT NULL,
	[MLot] [char](10) NULL,
	[Date] [datetime] NULL,
	[sPiece] [decimal](5, 1) NULL,
	[sSize] [decimal](9, 3) NULL,
	[sLength] [decimal](9, 3) NULL,
	[sWeight] [decimal](8, 1) NULL,
	[WorkSize] [decimal](9, 3) NULL,
	[fPiece] [decimal](5, 0) NULL,
	[fSize] [decimal](9, 3) NULL,
	[fLength] [decimal](9, 3) NULL,
	[Condition] [char](10) NULL,
	[HTreat] [char](16) NULL,
	[ColdWork] [decimal](3, 3) NULL,
	[MS_101] [bit] NULL,
	[MS_102] [bit] NULL,
	[MS_103] [bit] NULL,
	[MS_104] [bit] NULL,
	[MS_105] [bit] NULL,
	[MS_106] [bit] NULL,
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
	[SrvcPO] [int] NULL,
	[LMA_Practice] [varchar](7) NULL,
	[LMA_Procedure] [varchar](12) NULL,
	[GrainSize] [varchar](10) NULL,
	[ID] [int] NOT NULL,
	[WO] [int] NULL,
	[WO_Detail] [int] NULL,
	[Machine] [char](1) NULL,
	[Oper] [varchar](10) NULL,
	[ProjID] [int] NULL,
	[R] [char](1) NULL,
	[WhoInsert] [varchar](254) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NR_GlobalSpec]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_GlobalSpec]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_GlobalSpec](
	[LeadType] [nvarchar](255) NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[FullName] [nvarchar](255) NULL,
	[Company] [nvarchar](255) NULL,
	[Address1] [nvarchar](255) NULL,
	[Address2] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Country] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[Industry] [nvarchar](255) NULL,
	[IPAddress] [nvarchar](255) NULL,
	[Date] [datetime] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NR_HPA_Holidays]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_HPA_Holidays]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_HPA_Holidays](
	[HolidayDate] [date] NOT NULL,
	[HolidayName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_NR_HPA_Holidays] PRIMARY KEY CLUSTERED 
(
	[HolidayDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NR_MachineTrackingDetail]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_MachineTrackingDetail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_MachineTrackingDetail](
	[MachineTrackingDetail_ID] [int] IDENTITY(1,1) NOT NULL,
	[MachineTrackingDetail_Date] [datetime] NOT NULL,
	[MachineTrackingDetail_Value] [bit] NULL,
	[MachineTrackingDetail_SensorID] [smallint] NOT NULL,
 CONSTRAINT [PK_NR_MachineTrackingDetail] PRIMARY KEY CLUSTERED 
(
	[MachineTrackingDetail_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NR_MachineTrackingSensors]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_MachineTrackingSensors]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_MachineTrackingSensors](
	[MachineTrackingSensors_SensorID] [smallint] IDENTITY(1,1) NOT NULL,
	[MachineTrackingSensors_SensorName] [varchar](75) NOT NULL,
	[MachineTrackingSensors_Web600ID] [smallint] NOT NULL,
	[MachineTrackingSensors_Description] [varchar](75) NOT NULL,
 CONSTRAINT [PK_NR_MachineTrackingSensors] PRIMARY KEY CLUSTERED 
(
	[MachineTrackingSensors_SensorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NR_MachineTrackingSummary]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_MachineTrackingSummary]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_MachineTrackingSummary](
	[MachineTrackingSummary_ID] [int] IDENTITY(1,1) NOT NULL,
	[MachineTrackingSummary_Date] [date] NOT NULL,
	[MachineTrackingSummary_Runtime] [smallint] NOT NULL,
	[MachineTrackingSummary_SensorID] [smallint] NOT NULL,
 CONSTRAINT [PK_NR_MachineTrackingSummary] PRIMARY KEY CLUSTERED 
(
	[MachineTrackingSummary_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NR_MachineTrackingWeb600]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_MachineTrackingWeb600]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_MachineTrackingWeb600](
	[MachineTrackingWeb600_ID] [smallint] IDENTITY(1,1) NOT NULL,
	[MachineTrackingWeb600_Name] [varchar](150) NOT NULL,
 CONSTRAINT [PK_NR_MachineTrackingWeb600] PRIMARY KEY CLUSTERED 
(
	[MachineTrackingWeb600_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NR_OT_Employee_OT_Time]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_OT_Employee_OT_Time]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_OT_Employee_OT_Time](
	[EmplyeeTimeID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[trackEmpID] [uniqueidentifier] NOT NULL,
	[trackTimeID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_NR_OT_Employee_OT_Time] PRIMARY KEY CLUSTERED 
(
	[EmplyeeTimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NR_OT_EmployeeJobTime]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_OT_EmployeeJobTime]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_OT_EmployeeJobTime](
	[TrackJobTotalID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[trackID] [uniqueidentifier] NOT NULL,
	[orderItem] [char](15) NOT NULL,
	[status] [nchar](15) NULL,
	[jobDescription] [nchar](50) NOT NULL,
	[EmployeeId] [float] NULL,
	[empTotalMinutesOnJob] [int] NULL,
	[JobEndTime] [datetime] NULL,
 CONSTRAINT [PK_NR_OT_EmployeeJobTime2] PRIMARY KEY CLUSTERED 
(
	[TrackJobTotalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NR_OT_Maintenance]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_OT_Maintenance]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_OT_Maintenance](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[jobID] [uniqueidentifier] NOT NULL,
	[CurrentMaintJob] [int] NOT NULL,
 CONSTRAINT [PK_NR_OT_Maintenance] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NR_PurchaseOrder_Company]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_PurchaseOrder_Company]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_PurchaseOrder_Company](
	[Company] [varchar](30) NOT NULL,
	[AKA] [varchar](30) NOT NULL,
 CONSTRAINT [PK_NR_PurchaseOrder_Company] PRIMARY KEY CLUSTERED 
(
	[AKA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NR_Sales_Summary]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_Sales_Summary]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_Sales_Summary](
	[Shipped] [date] NOT NULL,
	[Mnth] [tinyint] NOT NULL,
	[Qtr] [tinyint] NOT NULL,
	[Year] [smallint] NOT NULL,
	[Alloy] [char](12) NULL,
	[form] [char](2) NULL,
	[CC] [char](1) NULL,
	[CL] [char](1) NOT NULL,
	[Size] [float] NULL,
	[Sz2] [float] NULL,
	[Pc] [smallint] NULL,
	[MatlWt] [decimal](9, 1) NULL,
	[MatlFt] [decimal](9, 0) NULL,
	[Typ] [char](1) NULL,
	[ItemCost] [decimal](9, 2) NULL,
	[ItemSales] [decimal](9, 2) NULL,
	[SOitem] [char](10) NOT NULL,
	[Q_P] [money] NULL,
	[Q_QTY] [money] NULL,
	[DescriptID]  AS ((((isnull([Alloy],'            ')+isnull([Form],'  '))+isnull([CC],' '))+isnull([CL],' '))+str(round([Size],(9),(3)),(9),(3))) PERSISTED,
	[fPS_QTY] [int] NULL,
	[fInv_QTY] [int] NULL,
	[fRMA_QTY] [int] NULL,
	[fPS_total] [int] NULL,
	[fInv_Cost] [int] NULL,
	[fSORecv_Total] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NR_Sales_Summary_ps]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_Sales_Summary_ps]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_Sales_Summary_ps](
	[Shipped] [date] NOT NULL,
	[Mnth] [tinyint] NOT NULL,
	[Qtr] [tinyint] NOT NULL,
	[Year] [smallint] NOT NULL,
	[Alloy] [char](12) NULL,
	[form] [char](2) NULL,
	[CC] [char](1) NULL,
	[CL] [char](1) NOT NULL,
	[Size] [float] NULL,
	[Sz2] [float] NULL,
	[PCs] [smallint] NULL,
	[PT_QTY] [int] NULL,
	[PT_P] [money] NULL,
	[SO_QTY] [int] NULL,
	[MatlWt] [decimal](9, 1) NULL,
	[MatlFt] [decimal](9, 0) NULL,
	[Typ] [char](1) NULL,
	[ItemCost] [decimal](9, 2) NULL,
	[ItemSales] [decimal](9, 2) NULL,
	[SOitem] [char](10) NOT NULL,
	[Q_P] [money] NULL,
	[Q_QTY] [int] NULL,
	[DescriptID]  AS ((((isnull([Alloy],'            ')+isnull([Form],'  '))+isnull([CC],' '))+isnull([CL],' '))+str(round([Size],(9),(3)),(9),(3))) PERSISTED,
	[PackingSli] [int] NULL,
	[TBL] [char](1) NULL,
	[ID_Detail] [int] NULL,
	[Book_P] [money] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Index [IX_Sales_Summary_ps]    Script Date: 12/26/2025 4:00:41 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[NR_Sales_Summary_ps]') AND name = N'IX_Sales_Summary_ps')
CREATE CLUSTERED INDEX [IX_Sales_Summary_ps] ON [dbo].[NR_Sales_Summary_ps]
(
	[Shipped] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NR_SalesDistrictStates]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_SalesDistrictStates]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_SalesDistrictStates](
	[ST] [nchar](2) NOT NULL,
	[State] [nchar](75) NOT NULL,
	[SalesP] [nchar](1) NOT NULL,
	[Sales Associate] [nchar](50) NOT NULL,
 CONSTRAINT [PK_NR_SalesDistrictStates] PRIMARY KEY CLUSTERED 
(
	[ST] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NR_States]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_States]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_States](
	[State] [varchar](20) NOT NULL,
	[ST] [char](2) NOT NULL,
 CONSTRAINT [PK_NR_States] PRIMARY KEY CLUSTERED 
(
	[ST] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NR_Stock_YrSum]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_Stock_YrSum]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_Stock_YrSum](
	[Alloy] [char](12) NULL,
	[form] [char](2) NULL,
	[CC] [char](1) NULL,
	[CL] [char](1) NULL,
	[Thck] [float] NULL,
	[Yr] [int] NULL,
	[LBS_Stock] [int] NULL,
	[LBS_Due_In] [int] NULL,
	[LBS_Due_In_E] [int] NULL,
	[When] [date] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NR_StockLst_Totals]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_StockLst_Totals]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_StockLst_Totals](
	[EoM] [smalldatetime] NOT NULL,
	[Alloy] [char](12) NOT NULL,
	[Form] [char](2) NOT NULL,
	[CC] [char](1) NOT NULL,
	[CL] [char](1) NOT NULL,
	[Size] [decimal](9, 3) NOT NULL,
	[MWeight] [int] NOT NULL,
	[TotalCost] [money] NOT NULL,
	[Mnth] [tinyint] NOT NULL,
	[Year] [smallint] NOT NULL,
	[mS_QTY] [int] NULL,
	[mS_Total] [int] NULL,
	[DescriptID]  AS ((((isnull([Alloy],'            ')+isnull([Form],'  '))+isnull([CC],' '))+isnull([CL],' '))+str(round([Size],(9),(3)),(9),(3))) PERSISTED
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_NR_StockLst_Totals]    Script Date: 12/26/2025 4:00:41 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[NR_StockLst_Totals]') AND name = N'IX_NR_StockLst_Totals')
CREATE CLUSTERED INDEX [IX_NR_StockLst_Totals] ON [dbo].[NR_StockLst_Totals]
(
	[EoM] DESC,
	[Alloy] ASC,
	[Form] ASC,
	[CC] ASC,
	[Size] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NR_TC_Replacement_Employees]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_TC_Replacement_Employees]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_TC_Replacement_Employees](
	[EmployeeId] [bigint] NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Pin] [nvarchar](8) NULL,
	[Position] [nvarchar](50) NULL,
	[DateLeft] [datetime] NULL,
	[IsSuspended] [bit] NULL,
 CONSTRAINT [PK_NR_TC_ReplacementEmployees] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NR_TimeClock_JobCode]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_TimeClock_JobCode]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_TimeClock_JobCode](
	[JobCode] [tinyint] NOT NULL,
	[Descript] [nchar](15) NOT NULL,
 CONSTRAINT [PK_NR_TimeClock_JobCode] PRIMARY KEY CLUSTERED 
(
	[JobCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NR_UserTrack]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_UserTrack]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_UserTrack](
	[mess1] [varchar](1024) NULL,
	[cprogram] [varchar](100) NULL,
	[errordate] [datetime] NOT NULL,
	[machine] [char](40) NULL,
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ServerName] [varchar](50) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NR_web_User_Group]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_web_User_Group]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_web_User_Group](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[LogTime] [datetime] NOT NULL,
 CONSTRAINT [PK_NR_web_User_Group] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NR_Web_User_Info]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_Web_User_Info]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_Web_User_Info](
	[InfoID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [int] NOT NULL,
	[comment] [nvarchar](50) NOT NULL,
	[creationDate] [datetime] NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[isApproved] [bit] NOT NULL,
	[isLockedOut] [bit] NOT NULL,
	[isOnline] [bit] NOT NULL,
	[lastActivityDate] [datetime] NOT NULL,
	[lastLockoutDate] [datetime] NOT NULL,
	[lastLoginDate] [datetime] NOT NULL,
	[lastPasswordChangedDate] [datetime] NOT NULL,
	[passwordQuestion] [nvarchar](50) NOT NULL,
	[providerName] [nvarchar](50) NOT NULL,
	[providerUserKey] [nvarchar](50) NOT NULL,
	[userName] [nvarchar](256) NOT NULL,
	[when] [datetime] NULL,
	[Who] [varchar](255) NULL,
 CONSTRAINT [PK_NR_web_User_Info] PRIMARY KEY CLUSTERED 
(
	[InfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NR_WebQuoteTracker]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_WebQuoteTracker]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_WebQuoteTracker](
	[CustomerID] [int] NOT NULL,
	[SessionID] [nvarchar](100) NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_NR_WebQuoteTracker] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC,
	[SessionID] ASC,
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NR_WebQuoteTracker_New]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NR_WebQuoteTracker_New]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NR_WebQuoteTracker_New](
	[SessionID] [nvarchar](100) NOT NULL,
	[CustomerID] [nvarchar](100) NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_NR_WebQuoteTracker_New] PRIMARY KEY CLUSTERED 
(
	[SessionID] ASC,
	[CustomerID] ASC,
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_NR_CW_Matrix]    Script Date: 12/26/2025 4:00:41 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[NR_CW_Matrix]') AND name = N'IX_NR_CW_Matrix')
CREATE NONCLUSTERED INDEX [IX_NR_CW_Matrix] ON [dbo].[NR_CW_Matrix]
(
	[Alloy] ASC,
	[CC] ASC,
	[CL] ASC,
	[fSize] ASC,
	[CW] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_NR_EmailTracker]    Script Date: 12/26/2025 4:00:41 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[NR_EmailTracker]') AND name = N'IX_NR_EmailTracker')
CREATE NONCLUSTERED INDEX [IX_NR_EmailTracker] ON [dbo].[NR_EmailTracker]
(
	[quoteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_NR_OT_Time]    Script Date: 12/26/2025 4:00:41 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[NR_OT_Time]') AND name = N'_dta_index_NR_OT_Time')
CREATE NONCLUSTERED INDEX [_dta_index_NR_OT_Time] ON [dbo].[NR_OT_Time]
(
	[trackID] ASC,
	[time] ASC
)
INCLUDE([status]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_NR_AFCS]    Script Date: 12/26/2025 4:00:41 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[NR_Sales_Summary]') AND name = N'IX_NR_AFCS')
CREATE NONCLUSTERED INDEX [IX_NR_AFCS] ON [dbo].[NR_Sales_Summary]
(
	[Alloy] ASC,
	[form] ASC,
	[CC] ASC,
	[Size] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_NR_Sales_Summary-Shipped]    Script Date: 12/26/2025 4:00:41 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[NR_Sales_Summary]') AND name = N'IX_NR_Sales_Summary-Shipped')
CREATE NONCLUSTERED INDEX [IX_NR_Sales_Summary-Shipped] ON [dbo].[NR_Sales_Summary]
(
	[Shipped] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_NR_StockLst_Totals_AFCSYM]    Script Date: 12/26/2025 4:00:41 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[NR_StockLst_Totals]') AND name = N'IX_NR_StockLst_Totals_AFCSYM')
CREATE NONCLUSTERED INDEX [IX_NR_StockLst_Totals_AFCSYM] ON [dbo].[NR_StockLst_Totals]
(
	[Alloy] ASC,
	[Form] ASC,
	[CC] ASC,
	[Size] ASC,
	[Year] ASC,
	[Mnth] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_NR_StockLst_Totals-AFCS]    Script Date: 12/26/2025 4:00:41 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[NR_StockLst_Totals]') AND name = N'IX_NR_StockLst_Totals-AFCS')
CREATE NONCLUSTERED INDEX [IX_NR_StockLst_Totals-AFCS] ON [dbo].[NR_StockLst_Totals]
(
	[Alloy] ASC,
	[Form] ASC,
	[CC] ASC,
	[Size] ASC,
	[EoM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_NR_StockLst_Totals-EOM]    Script Date: 12/26/2025 4:00:41 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[NR_StockLst_Totals]') AND name = N'IX_NR_StockLst_Totals-EOM')
CREATE NONCLUSTERED INDEX [IX_NR_StockLst_Totals-EOM] ON [dbo].[NR_StockLst_Totals]
(
	[EoM] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserTrack-ErrorDate]    Script Date: 12/26/2025 4:00:41 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[NR_UserTrack]') AND name = N'IX_UserTrack-ErrorDate')
CREATE NONCLUSTERED INDEX [IX_UserTrack-ErrorDate] ON [dbo].[NR_UserTrack]
(
	[errordate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_AddressTwo_Data_UpdateFirstName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_AddressTwo_Data] ADD  CONSTRAINT [DF_NR_AddressTwo_Data_UpdateFirstName]  DEFAULT ((1)) FOR [UpdateFirstName]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_AddressTwo_Data_UpdateLastName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_AddressTwo_Data] ADD  CONSTRAINT [DF_NR_AddressTwo_Data_UpdateLastName]  DEFAULT ((1)) FOR [UpdateLastName]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_AddressTwo_Data_UpdateEmail]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_AddressTwo_Data] ADD  CONSTRAINT [DF_NR_AddressTwo_Data_UpdateEmail]  DEFAULT ((1)) FOR [UpdateEmail]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_AddressTwo_Data_UpdatePhone1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_AddressTwo_Data] ADD  CONSTRAINT [DF_NR_AddressTwo_Data_UpdatePhone1]  DEFAULT ((1)) FOR [UpdatePhone1]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_AddressTwo_Data_UpdateName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_AddressTwo_Data] ADD  CONSTRAINT [DF_NR_AddressTwo_Data_UpdateName]  DEFAULT ((1)) FOR [UpdateName]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_AddressTwo_Data_UpdateAddress1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_AddressTwo_Data] ADD  CONSTRAINT [DF_NR_AddressTwo_Data_UpdateAddress1]  DEFAULT ((1)) FOR [UpdateAddress1]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_AddressTwo_Data_UpdateCity]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_AddressTwo_Data] ADD  CONSTRAINT [DF_NR_AddressTwo_Data_UpdateCity]  DEFAULT ((1)) FOR [UpdateCity]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_AddressTwo_Data_UpdateState]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_AddressTwo_Data] ADD  CONSTRAINT [DF_NR_AddressTwo_Data_UpdateState]  DEFAULT ((1)) FOR [UpdateState]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_AddressTwo_Data_UpdateZip]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_AddressTwo_Data] ADD  CONSTRAINT [DF_NR_AddressTwo_Data_UpdateZip]  DEFAULT ((1)) FOR [UpdateZip]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_AddressTwo_Data_UpdateCountry]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_AddressTwo_Data] ADD  CONSTRAINT [DF_NR_AddressTwo_Data_UpdateCountry]  DEFAULT ((1)) FOR [UpdateCountry]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_AddressTwo_Data_UpdateWebsite]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_AddressTwo_Data] ADD  CONSTRAINT [DF_NR_AddressTwo_Data_UpdateWebsite]  DEFAULT ((1)) FOR [UpdateWebsite]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_AddressTwo_Group_CreationDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_AddressTwo_Group] ADD  CONSTRAINT [DF_NR_AddressTwo_Group_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_AlloyCodeLevel_CC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_AlloyCodeLevel] ADD  CONSTRAINT [DF_NR_AlloyCodeLevel_CC]  DEFAULT ('') FOR [CC]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_AlloyCodeLevel_CL]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_AlloyCodeLevel] ADD  CONSTRAINT [DF_NR_AlloyCodeLevel_CL]  DEFAULT ('') FOR [CL]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_AlloyCodeLevel_UTS]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_AlloyCodeLevel] ADD  CONSTRAINT [DF_NR_AlloyCodeLevel_UTS]  DEFAULT ((0)) FOR [UTS]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_AlloyCodeLevel_Yld]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_AlloyCodeLevel] ADD  CONSTRAINT [DF_NR_AlloyCodeLevel_Yld]  DEFAULT ((0)) FOR [Yld]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_AlloyCodeLevel_EL]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_AlloyCodeLevel] ADD  CONSTRAINT [DF_NR_AlloyCodeLevel_EL]  DEFAULT ((0)) FOR [EL]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_AlloyCodeLevel_RA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_AlloyCodeLevel] ADD  CONSTRAINT [DF_NR_AlloyCodeLevel_RA]  DEFAULT ((0)) FOR [RA]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_AlloyCodeLevel_RC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_AlloyCodeLevel] ADD  CONSTRAINT [DF_NR_AlloyCodeLevel_RC]  DEFAULT ((0)) FOR [RC]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_AlloyCodeLevel_BHN]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_AlloyCodeLevel] ADD  CONSTRAINT [DF_NR_AlloyCodeLevel_BHN]  DEFAULT ((0)) FOR [BHN]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_AlloyCodeLevel_DiaMax]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_AlloyCodeLevel] ADD  CONSTRAINT [DF_NR_AlloyCodeLevel_DiaMax]  DEFAULT ((0)) FOR [DiaMax]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_AlloyCodeLevel_Spec]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_AlloyCodeLevel] ADD  CONSTRAINT [DF_NR_AlloyCodeLevel_Spec]  DEFAULT ('') FOR [Spec]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_AlloyCodeLevel_Text]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_AlloyCodeLevel] ADD  CONSTRAINT [DF_NR_AlloyCodeLevel_Text]  DEFAULT ('') FOR [Text]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_AlloyCodeLevel_UTS2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_AlloyCodeLevel] ADD  CONSTRAINT [DF_NR_AlloyCodeLevel_UTS2]  DEFAULT ((0)) FOR [UTS_Max]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_AlloyCodeLevel_YLD2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_AlloyCodeLevel] ADD  CONSTRAINT [DF_NR_AlloyCodeLevel_YLD2]  DEFAULT ((0)) FOR [YLD_Max]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_Country Data_DO NOT SELL]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Country Data] ADD  CONSTRAINT [DF_NR_Country Data_DO NOT SELL]  DEFAULT ((0)) FOR [DO NOT SELL]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_CW_Matrix_when]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_CW_Matrix] ADD  CONSTRAINT [DF_NR_CW_Matrix_when]  DEFAULT (getdate()) FOR [when]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_DBMail_Resend_Log_retryCount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_DBMail_Resend_Log] ADD  CONSTRAINT [DF_NR_DBMail_Resend_Log_retryCount]  DEFAULT ((0)) FOR [retryCount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_DBMail_Resend_Log_sendStatus]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_DBMail_Resend_Log] ADD  CONSTRAINT [DF_NR_DBMail_Resend_Log_sendStatus]  DEFAULT ((0)) FOR [sendStatus]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_email_DoNotUse_DateUnsubscribed]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_email_DoNotUse] ADD  CONSTRAINT [DF_NR_email_DoNotUse_DateUnsubscribed]  DEFAULT (getdate()) FOR [DateUnsubscribed]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_HTreat]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_HTreat]  DEFAULT ('') FOR [HTreat]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_PO]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_PO]  DEFAULT ('') FOR [PO]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_OvenTemp]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_OvenTemp]  DEFAULT ((0)) FOR [OvenTemp]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_Tensile]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_Tensile]  DEFAULT ((0)) FOR [Tensile]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_Yield]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_Yield]  DEFAULT ((0)) FOR [Yield]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_Elongation]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_Elongation]  DEFAULT ((0)) FOR [Elongation]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_Red_Area]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_Red_Area]  DEFAULT ((0)) FOR [Red_Area]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_tLoc]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_tLoc]  DEFAULT ('') FOR [tLoc]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_Rockwell]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_Rockwell]  DEFAULT ('') FOR [Rockwell]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_BHN]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_BHN]  DEFAULT ((0)) FOR [BHN]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_Tensile2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_Tensile2]  DEFAULT ((0)) FOR [Tensile2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_Yield2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_Yield2]  DEFAULT ((0)) FOR [Yield2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_Elongation2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_Elongation2]  DEFAULT ((0)) FOR [Elongation2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_Red_Area2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_Red_Area2]  DEFAULT ((0)) FOR [Red_Area2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_tLoc2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_tLoc2]  DEFAULT ('') FOR [tLoc2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_Rockwell2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_Rockwell2]  DEFAULT ('') FOR [Rockwell2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_BHN2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_BHN2]  DEFAULT ((0)) FOR [BHN2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_Tensile3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_Tensile3]  DEFAULT ((0)) FOR [Tensile3]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_Yield3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_Yield3]  DEFAULT ((0)) FOR [Yield3]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_Elongation3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_Elongation3]  DEFAULT ((0)) FOR [Elongation3]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_red_area3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_red_area3]  DEFAULT ((0)) FOR [red_area3]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_tLoc3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_tLoc3]  DEFAULT ('') FOR [tLoc3]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_Rockwell3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_Rockwell3]  DEFAULT ('') FOR [Rockwell3]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_BHN3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_BHN3]  DEFAULT ((0)) FOR [BHN3]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_Tensile4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_Tensile4]  DEFAULT ((0)) FOR [Tensile4]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_Yield4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_Yield4]  DEFAULT ((0)) FOR [Yield4]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_Elongation4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_Elongation4]  DEFAULT ((0)) FOR [Elongation4]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_Red_Area4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_Red_Area4]  DEFAULT ((0)) FOR [Red_Area4]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_tLoc4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_tLoc4]  DEFAULT ('') FOR [tLoc4]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_Rockwell4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_Rockwell4]  DEFAULT ('') FOR [Rockwell4]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_BHN4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_BHN4]  DEFAULT ((0)) FOR [BHN4]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_Tensile5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_Tensile5]  DEFAULT ((0)) FOR [Tensile5]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_Yield5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_Yield5]  DEFAULT ((0)) FOR [Yield5]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_Elongation5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_Elongation5]  DEFAULT ((0)) FOR [Elongation5]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_Red_Area5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_Red_Area5]  DEFAULT ((0)) FOR [Red_Area5]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_tLoc5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_tLoc5]  DEFAULT ('') FOR [tLoc5]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_Rockwell5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_Rockwell5]  DEFAULT ('') FOR [Rockwell5]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_BHN5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_BHN5]  DEFAULT ((0)) FOR [BHN5]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_Tensile6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_Tensile6]  DEFAULT ((0)) FOR [Tensile6]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_Yield6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_Yield6]  DEFAULT ((0)) FOR [Yield6]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_Elongation6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_Elongation6]  DEFAULT ((0)) FOR [Elongation6]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_Red_Area6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_Red_Area6]  DEFAULT ((0)) FOR [Red_Area6]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_tLoc6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_tLoc6]  DEFAULT ('') FOR [tLoc6]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_Tensile7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_Tensile7]  DEFAULT ((0)) FOR [Tensile7]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_Yield7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_Yield7]  DEFAULT ((0)) FOR [Yield7]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_Elongation7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_Elongation7]  DEFAULT ((0)) FOR [Elongation7]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_Red_Area7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_Red_Area7]  DEFAULT ((0)) FOR [Red_Area7]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_tLoc7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_tLoc7]  DEFAULT ('') FOR [tLoc7]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_TestPO]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_TestPO]  DEFAULT ((0)) FOR [TestPO]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_TestPOitem]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_TestPOitem]  DEFAULT ('') FOR [TestPOitem]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_TestItemPO]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_TestItemPO]  DEFAULT ((0)) FOR [TestItemPO]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_Lab]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_Lab]  DEFAULT ('') FOR [Lab]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_TestPO2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_TestPO2]  DEFAULT ((0)) FOR [TestPO2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_TestPOitem2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_TestPOitem2]  DEFAULT ('') FOR [TestPOitem2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_Minutes]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_Minutes]  DEFAULT ((0)) FOR [Minutes]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_LMA_Practice]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_LMA_Practice]  DEFAULT ('') FOR [LMA_Practice]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_LMA_Procedure]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_LMA_Procedure]  DEFAULT ('') FOR [LMA_Procedure]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_WO]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_WO]  DEFAULT ((0)) FOR [WO]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_WO_Detail]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_WO_Detail]  DEFAULT ((0)) FOR [WO_Detail]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_Machine]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_Machine]  DEFAULT ('') FOR [Machine]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_Oper]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_Oper]  DEFAULT ('') FOR [Oper]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_ProjID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_ProjID]  DEFAULT ((0)) FOR [ProjID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_GFM_N60_fact_WhoInsert]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_GFM_N60_fact] ADD  CONSTRAINT [DF_NR_GFM_N60_fact_WhoInsert]  DEFAULT (suser_sname()) FOR [WhoInsert]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_MachineTrackingSensors_MachineTrackingSensors_Description]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_MachineTrackingSensors] ADD  CONSTRAINT [DF_NR_MachineTrackingSensors_MachineTrackingSensors_Description]  DEFAULT ('') FOR [MachineTrackingSensors_Description]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_OT_trackID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_OT] ADD  CONSTRAINT [DF_NR_OT_trackID]  DEFAULT (newid()) FOR [trackID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_OT_isPO]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_OT] ADD  CONSTRAINT [DF_NR_OT_isPO]  DEFAULT ((0)) FOR [isPO]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_OT_orderType]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_OT] ADD  CONSTRAINT [DF_NR_OT_orderType]  DEFAULT ('B800C7C2-15A7-4B01-962B-50DBD0C7ADB8') FOR [orderType]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_OT_Employee_trackEmpID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_OT_Employee] ADD  CONSTRAINT [DF_NR_OT_Employee_trackEmpID]  DEFAULT (newid()) FOR [trackEmpID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NROT_Employee_OT_Time_EmplyeeTimeID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_OT_Employee_OT_Time] ADD  CONSTRAINT [DF_NROT_Employee_OT_Time_EmplyeeTimeID]  DEFAULT (newid()) FOR [EmplyeeTimeID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_OT_EmployeeJobTime2_TrackJobTotalID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_OT_EmployeeJobTime] ADD  CONSTRAINT [DF_NR_OT_EmployeeJobTime2_TrackJobTotalID]  DEFAULT (newid()) FOR [TrackJobTotalID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_OT_Job_jobID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_OT_Job] ADD  CONSTRAINT [DF_NR_OT_Job_jobID]  DEFAULT (newid()) FOR [jobID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_OT_Maintenance_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_OT_Maintenance] ADD  CONSTRAINT [DF_NR_OT_Maintenance_ID]  DEFAULT (newid()) FOR [ID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_OT_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_OT_OrderType] ADD  CONSTRAINT [DF_NR_OT_ID]  DEFAULT (newid()) FOR [Id]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_OT_OrderType_Type]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_OT_OrderType] ADD  CONSTRAINT [DF_NR_OT_OrderType_Type]  DEFAULT ('OrderNumber') FOR [Type]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_OT_OrderType_Proper]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_OT_OrderType] ADD  CONSTRAINT [DF_NR_OT_OrderType_Proper]  DEFAULT ('Integer') FOR [Proper]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_OT_Time_trackTimeID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_OT_Time] ADD  CONSTRAINT [DF_NR_OT_Time_trackTimeID]  DEFAULT (newid()) FOR [trackTimeID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_OT_Time_time]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_OT_Time] ADD  CONSTRAINT [DF_NR_OT_Time_time]  DEFAULT (getdate()) FOR [time]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_Sales_Summary_Alloy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Sales_Summary] ADD  CONSTRAINT [DF_NR_Sales_Summary_Alloy]  DEFAULT (' ') FOR [Alloy]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_Sales_Summary_form]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Sales_Summary] ADD  CONSTRAINT [DF_NR_Sales_Summary_form]  DEFAULT ('  ') FOR [form]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_Sales_Summary_CC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Sales_Summary] ADD  CONSTRAINT [DF_NR_Sales_Summary_CC]  DEFAULT (' ') FOR [CC]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_Sales_Summary_CL]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Sales_Summary] ADD  CONSTRAINT [DF_NR_Sales_Summary_CL]  DEFAULT ('') FOR [CL]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_Sales_Summary_Size]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Sales_Summary] ADD  CONSTRAINT [DF_NR_Sales_Summary_Size]  DEFAULT ((0)) FOR [Size]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_Sales_Summary_Pc]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Sales_Summary] ADD  CONSTRAINT [DF_NR_Sales_Summary_Pc]  DEFAULT ((0)) FOR [Pc]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_Sales_Summary_MatlWt]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Sales_Summary] ADD  CONSTRAINT [DF_NR_Sales_Summary_MatlWt]  DEFAULT ((0)) FOR [MatlWt]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_Sales_Summary_MatFt]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Sales_Summary] ADD  CONSTRAINT [DF_NR_Sales_Summary_MatFt]  DEFAULT ((0)) FOR [MatlFt]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_Sales_Summary_ItemCost]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Sales_Summary] ADD  CONSTRAINT [DF_NR_Sales_Summary_ItemCost]  DEFAULT ((0)) FOR [ItemCost]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_Sales_Summary_ItemSales]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Sales_Summary] ADD  CONSTRAINT [DF_NR_Sales_Summary_ItemSales]  DEFAULT ((0)) FOR [ItemSales]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_Sales_Summary_Q_P]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Sales_Summary] ADD  CONSTRAINT [DF_NR_Sales_Summary_Q_P]  DEFAULT ((0)) FOR [Q_P]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_Sales_Summary_Q_QTY]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Sales_Summary] ADD  CONSTRAINT [DF_NR_Sales_Summary_Q_QTY]  DEFAULT ((0)) FOR [Q_QTY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_Summary_ps_Alloy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Sales_Summary_ps] ADD  CONSTRAINT [DF_Sales_Summary_ps_Alloy]  DEFAULT (' ') FOR [Alloy]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_Summary_ps_form]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Sales_Summary_ps] ADD  CONSTRAINT [DF_Sales_Summary_ps_form]  DEFAULT ('  ') FOR [form]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_Summary_ps_CC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Sales_Summary_ps] ADD  CONSTRAINT [DF_Sales_Summary_ps_CC]  DEFAULT (' ') FOR [CC]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_Summary_ps_CL]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Sales_Summary_ps] ADD  CONSTRAINT [DF_Sales_Summary_ps_CL]  DEFAULT ('') FOR [CL]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_Summary_ps_Size]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Sales_Summary_ps] ADD  CONSTRAINT [DF_Sales_Summary_ps_Size]  DEFAULT ((0)) FOR [Size]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_Summary_ps_Pc]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Sales_Summary_ps] ADD  CONSTRAINT [DF_Sales_Summary_ps_Pc]  DEFAULT ((0)) FOR [PCs]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_Summary_ps_MatlWt]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Sales_Summary_ps] ADD  CONSTRAINT [DF_Sales_Summary_ps_MatlWt]  DEFAULT ((0)) FOR [MatlWt]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_Summary_ps_MatFt]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Sales_Summary_ps] ADD  CONSTRAINT [DF_Sales_Summary_ps_MatFt]  DEFAULT ((0)) FOR [MatlFt]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_Summary_ps_ItemCost]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Sales_Summary_ps] ADD  CONSTRAINT [DF_Sales_Summary_ps_ItemCost]  DEFAULT ((0)) FOR [ItemCost]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_Summary_ps_ItemSales]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Sales_Summary_ps] ADD  CONSTRAINT [DF_Sales_Summary_ps_ItemSales]  DEFAULT ((0)) FOR [ItemSales]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_Summary_ps_Q_P]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Sales_Summary_ps] ADD  CONSTRAINT [DF_Sales_Summary_ps_Q_P]  DEFAULT ((0)) FOR [Q_P]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sales_Summary_ps_Q_QTY]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Sales_Summary_ps] ADD  CONSTRAINT [DF_Sales_Summary_ps_Q_QTY]  DEFAULT ((0)) FOR [Q_QTY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_Sales_YrSum_10Yr_Alloy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Sales_YrSum_10Yr] ADD  CONSTRAINT [DF_NR_Sales_YrSum_10Yr_Alloy]  DEFAULT (' ') FOR [Alloy]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_Sales_YrSum_10Yr_form]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Sales_YrSum_10Yr] ADD  CONSTRAINT [DF_NR_Sales_YrSum_10Yr_form]  DEFAULT ('  ') FOR [form]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_Sales_YrSum_10Yr_CC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Sales_YrSum_10Yr] ADD  CONSTRAINT [DF_NR_Sales_YrSum_10Yr_CC]  DEFAULT (' ') FOR [CC]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_Sales_YrSum_10Yr_Size]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Sales_YrSum_10Yr] ADD  CONSTRAINT [DF_NR_Sales_YrSum_10Yr_Size]  DEFAULT ((0)) FOR [Thck]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_Sales_YrSum_10Yr_Comment]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Sales_YrSum_10Yr] ADD  CONSTRAINT [DF_NR_Sales_YrSum_10Yr_Comment]  DEFAULT (' ') FOR [Comment]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_Sales_YrSum_10Yr_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Sales_YrSum_10Yr] ADD  CONSTRAINT [DF_NR_Sales_YrSum_10Yr_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_Stock_YrSum_Alloy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Stock_YrSum] ADD  CONSTRAINT [DF_NR_Stock_YrSum_Alloy]  DEFAULT ('') FOR [Alloy]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_Stock_YrSum_form]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Stock_YrSum] ADD  CONSTRAINT [DF_NR_Stock_YrSum_form]  DEFAULT ('') FOR [form]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_Stock_YrSum_CC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Stock_YrSum] ADD  CONSTRAINT [DF_NR_Stock_YrSum_CC]  DEFAULT ('') FOR [CC]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_Stock_YrSum_Size]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Stock_YrSum] ADD  CONSTRAINT [DF_NR_Stock_YrSum_Size]  DEFAULT ((0)) FOR [Thck]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_Stock_YrSum_When]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Stock_YrSum] ADD  CONSTRAINT [DF_NR_Stock_YrSum_When]  DEFAULT (getdate()) FOR [When]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_StockLst_Totals_CL]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_StockLst_Totals] ADD  CONSTRAINT [DF_NR_StockLst_Totals_CL]  DEFAULT ('') FOR [CL]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_TC_Replacement_Employees_Position]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_TC_Replacement_Employees] ADD  CONSTRAINT [DF_NR_TC_Replacement_Employees_Position]  DEFAULT ('Shop') FOR [Position]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_TC_Replacement_Employees_IsSuspended]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_TC_Replacement_Employees] ADD  CONSTRAINT [DF_NR_TC_Replacement_Employees_IsSuspended]  DEFAULT ((0)) FOR [IsSuspended]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_usertrack_errordate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_UserTrack] ADD  CONSTRAINT [DF_NR_usertrack_errordate]  DEFAULT (getdate()) FOR [errordate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_UserTrack_machine]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_UserTrack] ADD  CONSTRAINT [DF_NR_UserTrack_machine]  DEFAULT (left(suser_sname(),(40))) FOR [machine]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_UserTrack_ServerName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_UserTrack] ADD  CONSTRAINT [DF_NR_UserTrack_ServerName]  DEFAULT (@@servername) FOR [ServerName]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_VendorFile_VendorFileActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_VendorFile] ADD  CONSTRAINT [DF_NR_VendorFile_VendorFileActive]  DEFAULT ((1)) FOR [VendorFileActive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_VendorFile_VendorFileUploadDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_VendorFile] ADD  CONSTRAINT [DF_NR_VendorFile_VendorFileUploadDate]  DEFAULT (getdate()) FOR [VendorFileUploadDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_VendorFile_VendorFileExpiringNoticeSent]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_VendorFile] ADD  CONSTRAINT [DF_NR_VendorFile_VendorFileExpiringNoticeSent]  DEFAULT ((0)) FOR [VendorFileExpiringNoticeSent]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_VendorFile_VendorFileExpiredNoticeSent]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_VendorFile] ADD  CONSTRAINT [DF_NR_VendorFile_VendorFileExpiredNoticeSent]  DEFAULT ((0)) FOR [VendorFileExpiredNoticeSent]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_Web_Inquiry_InquiryDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Web_Inquiry] ADD  CONSTRAINT [DF_NR_Web_Inquiry_InquiryDate]  DEFAULT (getdate()) FOR [InquiryDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_Web_Inquiry_Items_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Web_Inquiry_Items] ADD  CONSTRAINT [DF_NR_Web_Inquiry_Items_ID]  DEFAULT (newid()) FOR [ID]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_web_User_Info_when]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Web_User_Info] ADD  CONSTRAINT [DF_NR_web_User_Info_when]  DEFAULT (getdate()) FOR [when]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_web_User_Info_Who]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_Web_User_Info] ADD  CONSTRAINT [DF_NR_web_User_Info_Who]  DEFAULT (suser_sname()) FOR [Who]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NR_WebQuoteTracker_New_Date]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NR_WebQuoteTracker_New] ADD  CONSTRAINT [DF_NR_WebQuoteTracker_New_Date]  DEFAULT (getdate()) FOR [Date]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NR_AddressTwo_Data_AddressTwo_Group]') AND parent_object_id = OBJECT_ID(N'[dbo].[NR_AddressTwo_Data]'))
ALTER TABLE [dbo].[NR_AddressTwo_Data]  WITH CHECK ADD  CONSTRAINT [FK_NR_AddressTwo_Data_AddressTwo_Group] FOREIGN KEY([GroupID])
REFERENCES [dbo].[NR_AddressTwo_Group] ([GroupID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NR_AddressTwo_Data_AddressTwo_Group]') AND parent_object_id = OBJECT_ID(N'[dbo].[NR_AddressTwo_Data]'))
ALTER TABLE [dbo].[NR_AddressTwo_Data] CHECK CONSTRAINT [FK_NR_AddressTwo_Data_AddressTwo_Group]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NR_MachineTrackingDetail_MachineTrackingSensors]') AND parent_object_id = OBJECT_ID(N'[dbo].[NR_MachineTrackingDetail]'))
ALTER TABLE [dbo].[NR_MachineTrackingDetail]  WITH CHECK ADD  CONSTRAINT [FK_NR_MachineTrackingDetail_MachineTrackingSensors] FOREIGN KEY([MachineTrackingDetail_SensorID])
REFERENCES [dbo].[NR_MachineTrackingSensors] ([MachineTrackingSensors_SensorID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NR_MachineTrackingDetail_MachineTrackingSensors]') AND parent_object_id = OBJECT_ID(N'[dbo].[NR_MachineTrackingDetail]'))
ALTER TABLE [dbo].[NR_MachineTrackingDetail] CHECK CONSTRAINT [FK_NR_MachineTrackingDetail_MachineTrackingSensors]
GO
--IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NR_MachineTrackingSensors_MachineTrackingWeb600]') AND parent_object_id = OBJECT_ID(N'[dbo].[NR_MachineTrackingSensors]'))
--ALTER TABLE [dbo].[NR_MachineTrackingSensors]  WITH CHECK ADD  CONSTRAINT [FK_NR_MachineTrackingSensors_MachineTrackingWeb600] FOREIGN KEY([MachineTrackingSensors_Web600ID])
--REFERENCES [dbo].[NR_MachineTrackingWeb600] ([MachineTrackingWeb600_ID])
--ON UPDATE CASCADE
--GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NR_MachineTrackingSensors_MachineTrackingWeb600]') AND parent_object_id = OBJECT_ID(N'[dbo].[NR_MachineTrackingSensors]'))
ALTER TABLE [dbo].[NR_MachineTrackingSensors] CHECK CONSTRAINT [FK_NR_MachineTrackingSensors_MachineTrackingWeb600]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NR_MachineTrackingSummary_MachineTrackingSensors]') AND parent_object_id = OBJECT_ID(N'[dbo].[NR_MachineTrackingSummary]'))
ALTER TABLE [dbo].[NR_MachineTrackingSummary]  WITH CHECK ADD  CONSTRAINT [FK_NR_MachineTrackingSummary_MachineTrackingSensors] FOREIGN KEY([MachineTrackingSummary_SensorID])
REFERENCES [dbo].[NR_MachineTrackingSensors] ([MachineTrackingSensors_SensorID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NR_MachineTrackingSummary_MachineTrackingSensors]') AND parent_object_id = OBJECT_ID(N'[dbo].[NR_MachineTrackingSummary]'))
ALTER TABLE [dbo].[NR_MachineTrackingSummary] CHECK CONSTRAINT [FK_NR_MachineTrackingSummary_MachineTrackingSensors]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NR_OT_OrderType]') AND parent_object_id = OBJECT_ID(N'[dbo].[NR_OT]'))
ALTER TABLE [dbo].[NR_OT]  WITH CHECK ADD  CONSTRAINT [FK_NR_OT_OrderType] FOREIGN KEY([orderType])
REFERENCES [dbo].[NR_OT_OrderType] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NR_OT_OrderType]') AND parent_object_id = OBJECT_ID(N'[dbo].[NR_OT]'))
ALTER TABLE [dbo].[NR_OT] CHECK CONSTRAINT [FK_NR_OT_OrderType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NR_OT_OTJob]') AND parent_object_id = OBJECT_ID(N'[dbo].[NR_OT]'))
ALTER TABLE [dbo].[NR_OT]  WITH CHECK ADD  CONSTRAINT [FK_NR_OT_OTJob] FOREIGN KEY([jobID])
REFERENCES [dbo].[NR_OT_Job] ([jobID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NR_OT_OTJob]') AND parent_object_id = OBJECT_ID(N'[dbo].[NR_OT]'))
ALTER TABLE [dbo].[NR_OT] CHECK CONSTRAINT [FK_NR_OT_OTJob]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OT_Employee_OT_]') AND parent_object_id = OBJECT_ID(N'[dbo].[NR_OT_Employee]'))
ALTER TABLE [dbo].[NR_OT_Employee]  WITH CHECK ADD  CONSTRAINT [FK_OT_Employee_OT_] FOREIGN KEY([trackID])
REFERENCES [dbo].[NR_OT] ([trackID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OT_Employee_OT_]') AND parent_object_id = OBJECT_ID(N'[dbo].[NR_OT_Employee]'))
ALTER TABLE [dbo].[NR_OT_Employee] CHECK CONSTRAINT [FK_OT_Employee_OT_]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NR_OT_Employee_OT__OT_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[NR_OT_Employee_OT_Time]'))
ALTER TABLE [dbo].[NR_OT_Employee_OT_Time]  WITH CHECK ADD  CONSTRAINT [FK_NR_OT_Employee_OT__OT_Employee] FOREIGN KEY([trackEmpID])
REFERENCES [dbo].[NR_OT_Employee] ([trackEmpID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NR_OT_Employee_OT__OT_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[NR_OT_Employee_OT_Time]'))
ALTER TABLE [dbo].[NR_OT_Employee_OT_Time] CHECK CONSTRAINT [FK_NR_OT_Employee_OT__OT_Employee]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NR_OT_Employee_OT_Time_OT_Time]') AND parent_object_id = OBJECT_ID(N'[dbo].[NR_OT_Employee_OT_Time]'))
ALTER TABLE [dbo].[NR_OT_Employee_OT_Time]  WITH CHECK ADD  CONSTRAINT [FK_NR_OT_Employee_OT_Time_OT_Time] FOREIGN KEY([trackTimeID])
REFERENCES [dbo].[NR_OT_Time] ([trackTimeID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NR_OT_Employee_OT_Time_OT_Time]') AND parent_object_id = OBJECT_ID(N'[dbo].[NR_OT_Employee_OT_Time]'))
ALTER TABLE [dbo].[NR_OT_Employee_OT_Time] CHECK CONSTRAINT [FK_NR_OT_Employee_OT_Time_OT_Time]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NR_OT_Maintenance_OT_Job]') AND parent_object_id = OBJECT_ID(N'[dbo].[NR_OT_Maintenance]'))
ALTER TABLE [dbo].[NR_OT_Maintenance]  WITH CHECK ADD  CONSTRAINT [FK_NR_OT_Maintenance_OT_Job] FOREIGN KEY([jobID])
REFERENCES [dbo].[NR_OT_Job] ([jobID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NR_OT_Maintenance_OT_Job]') AND parent_object_id = OBJECT_ID(N'[dbo].[NR_OT_Maintenance]'))
ALTER TABLE [dbo].[NR_OT_Maintenance] CHECK CONSTRAINT [FK_NR_OT_Maintenance_OT_Job]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NR_OT_Time_OT_]') AND parent_object_id = OBJECT_ID(N'[dbo].[NR_OT_Time]'))
ALTER TABLE [dbo].[NR_OT_Time]  WITH CHECK ADD  CONSTRAINT [FK_NR_OT_Time_OT_] FOREIGN KEY([trackID])
REFERENCES [dbo].[NR_OT] ([trackID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NR_OT_Time_OT_]') AND parent_object_id = OBJECT_ID(N'[dbo].[NR_OT_Time]'))
ALTER TABLE [dbo].[NR_OT_Time] CHECK CONSTRAINT [FK_NR_OT_Time_OT_]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NR_Web_Inquiry_Items_Web_Inquiry]') AND parent_object_id = OBJECT_ID(N'[dbo].[NR_Web_Inquiry_Items]'))
ALTER TABLE [dbo].[NR_Web_Inquiry_Items]  WITH CHECK ADD  CONSTRAINT [FK_NR_Web_Inquiry_Items_Web_Inquiry] FOREIGN KEY([WebInqID])
REFERENCES [dbo].[NR_Web_Inquiry] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NR_Web_Inquiry_Items_Web_Inquiry]') AND parent_object_id = OBJECT_ID(N'[dbo].[NR_Web_Inquiry_Items]'))
ALTER TABLE [dbo].[NR_Web_Inquiry_Items] CHECK CONSTRAINT [FK_NR_Web_Inquiry_Items_Web_Inquiry]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NR_web_User_Info_NR_web_User_Group]') AND parent_object_id = OBJECT_ID(N'[dbo].[NR_Web_User_Info]'))
ALTER TABLE [dbo].[NR_Web_User_Info]  WITH CHECK ADD  CONSTRAINT [FK_NR_web_User_Info_NR_web_User_Group] FOREIGN KEY([GroupID])
REFERENCES [dbo].[NR_web_User_Group] ([GroupID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NR_web_User_Info_NR_web_User_Group]') AND parent_object_id = OBJECT_ID(N'[dbo].[NR_Web_User_Info]'))
ALTER TABLE [dbo].[NR_Web_User_Info] CHECK CONSTRAINT [FK_NR_web_User_Info_NR_web_User_Group]
GO
/****** Object:  StoredProcedure [dbo].[p_NR_CalculateHolidays]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_NR_CalculateHolidays]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_NR_CalculateHolidays] AS' 
END
GO
-- =============================================
-- Author:		 
-- Create date: 2015 10 26
-- Description:	Cacluates the holidays for the given year and inserts them into the HPA_Holiday table
-- =============================================
ALTER PROCEDURE [dbo].[p_NR_CalculateHolidays] 
	-- Add the parameters for the stored procedure here
	@year int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	set datefirst 1
	declare @sdate datetime,
			@edate datetime,
			@EpactCalc INT,  
			@PaschalDaysCalc INT, 
			@NumOfDaysToSunday INT, 
			@EasterMonth INT, 
			@EasterDay INT, 
			@Y INT 
        
	--Good Friday
	SET @Y = @year
	SET @EpactCalc = (24 + 19 * (@Y % 19)) % 30 
	SET @PaschalDaysCalc = @EpactCalc - (@EpactCalc / 28) 
	SET @NumOfDaysToSunday = @PaschalDaysCalc - ( 
	(@Y + @Y / 4 + @PaschalDaysCalc - 13) % 7 
	) 
	SET @EasterMonth = 3 + (@NumOfDaysToSunday + 40) / 44 
	SET @EasterDay = @NumOfDaysToSunday + 28 - ( 
	31 * (@EasterMonth / 4) 
	) 

	--all dates below are in yyyy/mm/dd
	DECLARE @NewYearsDay date = CONVERT(date, CONVERT(CHAR, @year) + '/01/01')
		,@GoodFriday date = CONVERT(date, CONVERT(CHAR, @year) + '/' + CONVERT(CHAR, @EasterMonth) + '/' + CONVERT(CHAR, @EasterDay))
		,@MemorialDay date = CONVERT(date, CONVERT(CHAR, @year) + '/05/31')--fixed later on
		,@IndependenceDay date = CONVERT(date, CONVERT(CHAR, @year) + '/07/04')
		,@LaborDay date = CONVERT(date, CONVERT(CHAR, @year) + '/09/01')--fixed later on
		,@Thanksgiving date = CONVERT(date, CONVERT(CHAR, @year) + '/11/30')--fixed later on
		,@BlackFriday date = CONVERT(date, CONVERT(CHAR, @year) + '/11/29')--fixed later on
		,@ChristmasEve date = CONVERT(date, CONVERT(CHAR, @year) + '/12/24')
		,@Christmas date = CONVERT(date, CONVERT(CHAR, @year) + '/12/25')

	DECLARE @FridayBeforeNewYearsDay date = null
		,@FridayBeforeIndependenceDay date = null
		,@ThursdayBeforeChristmas date = null
		,@FridayBeforeChristmas date = null

	DECLARE @MemorialDay_DayofWeek int = datepart(dw, @MemorialDay)
		,@LaborDay_DayofWeek int = datepart(dw, @LaborDay)
		,@Thanksgiving_DayofWeek int = datepart(dw, @Thanksgiving)
		,@BlackFriday_DayofWeek int = datepart(dw, @BlackFriday)
	--Memorial Day Fix
	IF datepart(dw, @MemorialDay) = 2
	BEGIN
		SET @MemorialDay = DATEADD(day, -1, @MemorialDay)
	END
	ELSE IF datepart(dw, @MemorialDay) = 3
	BEGIN
		SET @MemorialDay = DATEADD(day, -2, @MemorialDay)
	END
	ELSE IF datepart(dw, @MemorialDay) = 4
	BEGIN
		SET @MemorialDay = DATEADD(day, -3, @MemorialDay)
	END
	ELSE IF datepart(dw, @MemorialDay) = 5
	BEGIN
		SET @MemorialDay = DATEADD(day, -4, @MemorialDay)
	END
	ELSE IF datepart(dw, @MemorialDay) = 6
	BEGIN
		SET @MemorialDay = DATEADD(day, -5, @MemorialDay)
	END
	ELSE IF datepart(dw, @MemorialDay) = 7
	BEGIN
		SET @MemorialDay = DATEADD(day, -6, @MemorialDay)
	END
	--Labor Day Fix
	IF datepart(dw, @LaborDay) = 2
	BEGIN
		SET @LaborDay = DATEADD(day, 6, @LaborDay)
	END
	ELSE IF datepart(dw, @LaborDay) = 3
	BEGIN
		SET @LaborDay = DATEADD(day, 5, @LaborDay)
	END
	ELSE IF datepart(dw, @LaborDay) = 4
	BEGIN
		SET @LaborDay = DATEADD(day, 4, @LaborDay)
	END
	ELSE IF datepart(dw, @LaborDay) = 5
	BEGIN
		SET @LaborDay = DATEADD(day, 3, @LaborDay)
	END
	ELSE IF datepart(dw, @LaborDay) = 6
	BEGIN
		SET @LaborDay = DATEADD(day, 2, @LaborDay)
	END
	ELSE IF datepart(dw, @LaborDay) = 7
	BEGIN
		SET @LaborDay = DATEADD(day, 1, @LaborDay)
	END
	--Thanksgiving Day Fix
	IF datepart(dw, @Thanksgiving) = 5
	BEGIN
		SET @Thanksgiving = DATEADD(day, -1, @Thanksgiving)
	END
	ELSE IF datepart(dw, @Thanksgiving) = 6
	BEGIN
		SET @Thanksgiving = DATEADD(day, -2, @Thanksgiving)
	END
	ELSE IF datepart(dw, @Thanksgiving) = 7
	BEGIN
		SET @Thanksgiving = DATEADD(day, -3, @Thanksgiving)
	END
	ELSE IF datepart(dw, @Thanksgiving) = 1
	BEGIN
		SET @Thanksgiving = DATEADD(day, -4, @Thanksgiving)
	END
	ELSE IF datepart(dw, @Thanksgiving) = 2
	BEGIN
		SET @Thanksgiving = DATEADD(day, -5, @Thanksgiving)
	END
	ELSE IF datepart(dw, @Thanksgiving) = 3
	BEGIN
		SET @Thanksgiving = DATEADD(day, -6, @Thanksgiving)
	END
	SET @BlackFriday = DATEADD(day, 1, @Thanksgiving)
	--The Friday Before NewYear Fix
	IF datepart(dw, @NewYearsDay) = 6
	BEGIN
		SET @FridayBeforeNewYearsDay = DATEADD(day, -1, @NewYearsDay)
	END
	ELSE IF datepart(dw, @NewYearsDay) = 7
	BEGIN
		SET @FridayBeforeNewYearsDay = DATEADD(day, -2, @NewYearsDay)
	END
	IF datepart(dw, @IndependenceDay) = 6
	BEGIN
		SET @FridayBeforeIndependenceDay = DATEADD(day, -1, @IndependenceDay)
	END
	ELSE IF datepart(dw, @IndependenceDay) = 7
	BEGIN
		SET @FridayBeforeIndependenceDay = DATEADD(day, -2, @IndependenceDay)
	END
	IF datepart(dw, @Christmas) = 6
	BEGIN
		SET @ThursdayBeforeChristmas = DATEADD(day, -2, @Christmas)
		SET @FridayBeforeChristmas = DATEADD(day, -1, @Christmas)
	END
	ELSE IF datepart(dw, @Christmas) = 7
	BEGIN
		SET @ThursdayBeforeChristmas = DATEADD(day, -3, @Christmas)
		SET @FridayBeforeChristmas = DATEADD(day, -2, @Christmas)
	END

	--Main Query
	insert into dbo.NR_HPA_Holidays
	SELECT q.[Holiday Date]
			,q.[Holiday Name]
	FROM
	(
	SELECT 'Friday before New Years Day' [Holiday Name]
		,@FridayBeforeNewYearsDay [Holiday Date]
	UNION
	SELECT 'New Years Day' [Holiday Name]
		,@NewYearsDay [Holiday Date]
	UNION
	SELECT 'Good Friday' [Holiday Name]
		,@GoodFriday [Holiday Date]
	UNION
	SELECT 'Memorial Day' [Holiday Name]
		,@MemorialDay [Holiday Date]
	UNION
	SELECT 'Friday before Independence Day' [Holiday Name]
		,@FridayBeforeIndependenceDay [Holiday Date]
	UNION
	SELECT 'Independence Day' [Holiday Name]
		,@IndependenceDay [Holiday Date]
	UNION
	SELECT 'Labor Day' [Holiday Name]
		,@LaborDay [Holiday Date]
	UNION
	SELECT 'Thanksgiving' [Holiday Name]
		,@Thanksgiving [Holiday Date]
	UNION
	SELECT 'Black Friday' [Holiday Name]
		,@BlackFriday [Holiday Date]
	UNION
	SELECT 'Thursday before Christmas' [Holiday Name]
		,@ThursdayBeforeChristmas [Holiday Date]
	UNION
	SELECT 'Friday before Christmas' [Holiday Name]
		,@FridayBeforeChristmas [Holiday Date]
	UNION
	SELECT 'Christmas Eve' [Holiday Name]
		,@ChristmasEve [Holiday Date]
	UNION
	SELECT 'Christmas' [Holiday Name]
		,@Christmas [Holiday Date]
	) q
	WHERE q.[Holiday Date] NOT IN (SELECT HolidayDate FROM dbo.NR_HPA_Holidays)
		AND q.[Holiday Date] IS NOT null
	ORDER BY [Holiday Date]
END
GO
/****** Object:  StoredProcedure [dbo].[p_NR_EstimateCuttingRatePerMethod]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_NR_EstimateCuttingRatePerMethod]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_NR_EstimateCuttingRatePerMethod] AS' 
END
GO
-- =============================================
-- Author:		 
-- Create date: 2015 07 16
-- Description:	Gets the cutting rate estimate of the different cutting methods
-- =============================================
ALTER PROCEDURE [dbo].[p_NR_EstimateCuttingRatePerMethod] 
	-- Add the parameters for the stored procedure here
	@alloy char(12),
	@form CHAR(2),
	@cc CHAR(1),
	@thickness DECIMAL(11,4),
	@length DECIMAL(11,4),
	@width DECIMAL(11,4)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE 
	@jobName1 char(50) = 'Band Saw',
	@jobName2 char(50) = 'Shear - Bar',
	@jobName3 char(50) = 'Shear - Flat Sheet',
	@jobName4 char(50) = 'Plasma',
	@jobName5 char(50) = 'Waterjet Mach 2',
	@jobName6 char(50) = 'Waterjet Mach 3'

    -- Insert statements for procedure here
	SELECT [dbo].[f_NR_EstimateCuttingRate] (
			   @jobName1
			  ,@alloy
			  ,@form
			  ,@cc
			  ,@thickness
			  ,@length
			  ,@width) as [Band Saw Cut Rate (hr/in)]
		,[dbo].[f_NR_EstimateCuttingRate] (
			   @jobName2
			  ,@alloy
			  ,@form
			  ,@cc
			  ,@thickness
			  ,@length
			  ,@width) as [Shear - Bar Cut Rate (hr/in)]
		,[dbo].[f_NR_EstimateCuttingRate] (
			   @jobName3
			  ,@alloy
			  ,@form
			  ,@cc
			  ,@thickness
			  ,@length
			  ,@width) as [Shear - Flat Sheet (hr/in)]
		,[dbo].[f_NR_EstimateCuttingRate] (
			   @jobName4
			  ,@alloy
			  ,@form
			  ,@cc
			  ,@thickness
			  ,@length
			  ,@width) as [Plasma (hr/in)]
		,[dbo].[f_NR_EstimateCuttingRate] (
			   @jobName5
			  ,@alloy
			  ,@form
			  ,@cc
			  ,@thickness
			  ,@length
			  ,@width) as [Waterjet Mach 2 (hr/in)]
		,[dbo].[f_NR_EstimateCuttingRate] (
			   @jobName6
			  ,@alloy
			  ,@form
			  ,@cc
			  ,@thickness
			  ,@length
			  ,@width) as [Waterjet Mach 3 (hr/in)]
END
GO
/****** Object:  StoredProcedure [dbo].[p_NR_FILL_CW_Matrix]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_NR_FILL_CW_Matrix]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_NR_FILL_CW_Matrix] AS' 
END
GO
-- =============================================
-- Author:		<David Kirchner>
-- Create date: <2025-01-15>
-- Description:	<Forcasting>
-- =============================================
ALTER PROCEDURE [dbo].[p_NR_FILL_CW_Matrix]

(
	@cAlloy CHAR(12),
	@cCC CHAR(1), 
	@cCL CHAR(1)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	-- SET NOCOUNT ON;
	
	-- EXEC [dbo].[p_NR_FILL_CW_Matrix] 'HPA N60','7','1' ;  SELECT * FROM dbo.NR_CW_Matrix WHERE Alloy='HPA N60' AND CC='7' AND CL='1'
	-- EXEC [dbo].[p_NR_FILL_CW_Matrix] 'HPA N60','7','2' ;  SELECT * FROM dbo.NR_CW_Matrix WHERE Alloy='HPA N60' AND CC='7' AND CL='2'
	-- EXEC [dbo].[p_NR_FILL_CW_Matrix] 'HPA N60','7','3' ;  SELECT * FROM dbo.NR_CW_Matrix WHERE Alloy='HPA N60' AND CC='7' AND CL='3'  
	-- EXEC [dbo].[p_NR_FILL_CW_Matrix] 'HPA N60','7','4' ;  SELECT * FROM dbo.NR_CW_Matrix WHERE Alloy='HPA N60' AND CC='7' AND CL='4'
	-- EXEC [dbo].[p_NR_FILL_CW_Matrix] 'HPA N60','7','5' ;  SELECT * FROM dbo.NR_CW_Matrix WHERE Alloy='HPA N60' AND CC='7' AND CL='5'
	-- EXEC [dbo].[p_NR_FILL_CW_Matrix] 'HPA N60','7','6' ;  SELECT * FROM dbo.NR_CW_Matrix WHERE Alloy='HPA N60' AND CC='7' AND CL='6'

	-- SELECT dbo.f_CC_ESR('R') --'1'
	-- DELETE FROM [dbo].[NR_CW_matrix]  WHERE Alloy = 'HPA N60 ';
	
		--SELECT * FROM dbo.Spec_Check WHERE Alloy = 'HPA N60' AND [Group] = 'HPA '
		--UPDATE dbo.Spec_Check  SET CC='7', CL='6' WHERE Alloy = 'HPA N60' AND [Group] = 'HPA ' AND Spec='HPA-MS-106                    ' AND CC IS NULL

	--DECLARE @cAlloy CHAR(12) = 'HPA N60', 

--DECLARE 	@cAlloy CHAR(12)='HPA N60',	@cCC CHAR(1)='7', 	@cCL CHAR(1)='2'
--@bUseSpec BIT 'false'
	DECLARE @Spec VARCHAR(30) --= 'HPA-MS-106                    '
	DECLARE @cVer CHAR(10) --= 'B '
	--DECLARE @cCC CHAR(1)= '7', @cCL CHAR(1)='6'

--/*	IF @bUseSpec = 'true'
	SELECT TOP 1 @Spec= Spec, @cVer=Rev  
		FROM dbo.Spec_Check 
		WHERE Alloy = @cAlloy AND [Group] = 'HPA ' AND CC=@cCC AND CL=@cCL 
		ORDER BY Rev DESC

	PRINT '@cAlloy '+@cAlloy+' CC='+@cCC+' CL='+@cCL 
	PRINT '@Spec '+ @Spec
	PRINT '@cVer '+ @cVer

	IF @Spec IS NULL AND @cVer IS NULL
		RETURN

		--SET @bUseSpec = 'false'


	DECLARE @bUseAlloy BIT = 'false'

	DECLARE @Mach CHAR(10)='GFM'

/*	IF @Spec IS NULL AND @cVer IS NULL
		begin
		SET @Spec = 'HPA-MS-102                    '
		SET @cVer = 'B '
		SET	@cAlloy = 'HPA N60  '
		SET @cCC ='7'
		SET @cCL='2'
		end */

	
	INSERT INTO [dbo].[NR_CW_matrix] 
	([Alloy],[form],[CC],[CL],[sSize],[WorkSize],[fSize], [CW], [Mach],[Lot] ,[Spec],[Ver],[LogDate]  )

--	IF @Mach = 'GFM'
	SELECT --@cAlloy AS Alloy
		AlloyName AS Alloy
		, '10' AS Form
		, @cCC AS CC
		, @cCL AS CL
		,M.sSize, M.GFMsize 
		,( CASE WHEN ISNULL(M.fSize,0)=0 then dbo.f_StandardSizeMinus(M.GFMsize-.03) else M.fSize end) AS fSize
		
		,CAST(M.ColdWork*100 AS TinyInt ) AS CW
		, @Mach AS [Mach]
		, M.[Lot] 
		, @Spec AS [Spec]
		, @cVer AS [Ver]
		,M.[Date] AS [LogDate]
		FROM dbo.GFMlog M

		--Make sure it does not already existy
		left outer join [dbo].[NR_CW_matrix] CW 
			on M.AlloyName	= CW.Alloy 	
			AND M.sSize	= CW.sSize
			AND M.GFMSize = CW.WorkSize
--			AND M.fSize	= CW.fSize  --fSize can be created
			AND CAST(M.ColdWork*100 AS TinyInt ) = CW.CW

			AND @Mach	= CW.[mach]
			AND M.Lot	= CW.Lot
			
			AND @cCC = CW.CC AND @cCL = CW.CL
			AND @Spec = CW.[Spec]
			AND @cVer = CW.[Ver]
			AND M.[Date] = CW.LogDate

		WHERE M.AlloyName = @cAlloy 
		AND M.sSize>0		--AND sSize<5
		AND (M.fSize>0 OR M.GFMsize>0)
		AND M.ColdWork>0
		AND dbo.f_Is_GFMlot_toSpec(M.Lot,@Spec,@cVer)=1 
	
		AND M.R=1

		AND CW.Alloy IS NULL ;  --Means CW was not found

	--	ORDER BY Alloy, Form, CC ,CL, fSize, CW;
	
--INDEX Alloy (ASC), CC (ASC), CL (ASC), fSize (ASC), CW (ASC)

	--PRINT @@ROWCOUNT

	

END
GO
/****** Object:  StoredProcedure [dbo].[p_NR_FILL_Sales_YrSum_10Yr]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_NR_FILL_Sales_YrSum_10Yr]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_NR_FILL_Sales_YrSum_10Yr] AS' 
END
GO
-- =============================================
-- Author:		<David Kirchner>
-- Create date: <2025-01-15>
-- Description:	<Forcasting>
-- =============================================
ALTER PROCEDURE [dbo].[p_NR_FILL_Sales_YrSum_10Yr]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	--SELECT * FROM dbo.TVF_Sales_YrSum_Pivot(6)

	-- EXEC [dbo].[p_NR_FILL_Sales_YrSum_10Yr]; SELECT * FROM dbo.Sales_YrSum_10Yr ;
	-- SELECT dbo.f_CC_ESR('R') --'1'
	-- DELETE [dbo].[NR_Sales_YrSum_10Yr]  WHERE Comment='test Elect'
	DECLARE @Comment CHAR(10) = 'test Elect'

	
	INSERT INTO [dbo].[NR_Sales_YrSum_10Yr] 
	([Alloy]      ,[form]      ,[CC]      ,[CL]      ,[Thck]      ,[Yr]      ,[TotQtyYr]      ,[QTY_AvYr]      ,[CNT_AvYr]      ,[Comment])
	
	SELECT Distinct Alloy, Form, CC,CL, Thck, Yr, TotQtyYr, QTY_AvYr ,CNT_AvYr, 'test Elect' AS Comment --@Comment AS Comment
	--, dbo.f_Calc_Stock_QTY( Alloy,Form,CONVERT(Decimal(9,3),Thck) ) AS LBS_Stock
	--, dbo.f_Calc_Stock_QTY_Process_ID(Alloy,Form,CONVERT(Decimal(9,3),Thck),'INCOMING') AS LBS_Due_In
	--, dbo.f_Calc_Stock_QTY_Process_ID(Alloy,Form,CONVERT(Decimal(9,3),Thck),'ELECTRALLO') AS LBS_Due_In
	FROM (
	SELECT 
	AQ.Alloy, AQ.Form, dbo.f_CC_ESR(AQ.CC) AS CC, AQ.CL, dbo.f_StandardSize(AQ.Thck) AS Thck
	--,AQ.InqDate, AQ.S_QTY
	, DATEPART(yy,AQ.InqDate) AS Yr
	--, CONVERT(INT,AVG(AQ.S_QTY) OVER (ORDER BY AQ.InqDate ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)) as SMA 
	, CONVERT(INT,SUM(AQ.S_QTY) OVER (PARTITION BY AQ.Alloy, AQ.Form, dbo.f_CC_ESR(AQ.CC), dbo.f_StandardSize(AQ.Thck) ORDER BY DATEPART(yy,AQ.InqDate))) as TotQtyYr 
	, CONVERT(INT,AVG(AQ.S_QTY) OVER (PARTITION BY AQ.Alloy, AQ.Form, dbo.f_CC_ESR(AQ.CC), dbo.f_StandardSize(AQ.Thck) ORDER BY DATEPART(yy,AQ.InqDate))) as QTY_AvYr 
	, CONVERT(INT,COUNT(AQ.S_QTY) OVER (PARTITION BY AQ.Alloy, AQ.Form, dbo.f_CC_ESR(AQ.CC), dbo.f_StandardSize(AQ.Thck) ORDER BY DATEPART(yy,AQ.InqDate))) as CNT_AvYr 
	
	FROM dbo.AllQuotes AQ WITH(NOLOCK) 
	inner join dbo.Sales S WITH(NOLOCK) ON AQ.SOitem = S.SOitem AND S.cmplt=1
	--inner join dbo.PurchaseOrder PO WITH(NOLOCK) ON AQ.Alloy = PO.Alloy AND AQ.Form=PO.Form AND AQ.Thck=PO.Thck
	INNER JOIN dbo.Alloy ON AQ.Alloy = Alloy.alloy 
	INNER JOIN .dbo.Forms ON AQ.Form = Forms.FormNumber		

	WHERE AQ.SalesNum>0
	AND YEAR(AQ.InqDate) > YEAR(GETDATE()-3650)
	AND AQ.Q_Total > 0
	AND AQ.Form IN ('10','11','12','13','20','21','22','23','40','50','51','52','53','91','95','96','97','98','99' )  --SELECT * FROM dbo.Forms
	--AND (LEN(TRIM(Alloy)) > 0) AND (PO.Thck > 0)
	--AND (PO.Company LIKE '%CARLSON%' OR PO.Company LIKE '%Electra%') 
	--AND (LEN(TRIM(PO.Alloy)) > 0) AND (PO.Thck > 0)
	--AND AQ.Alloy = 'HPA N60'  --@Alloy
	) t ORDER BY Alloy, Form, CC ,CL, Thck;

--  SELECT SOitem, Alloy, Form,CC,CL,Thck,Weight,Descript FROM dbo.AllQuotes WHERE SalesNum > 0 AND CC='7' and CL NOT IN ('1','2','3','4','5','6')
--UPDATE dbo.AllQuotes Set CC='2',CL='' WHERE SOitem IN (SELECT SOitem FROM dbo.AllQuotes WHERE SalesNum > 0 AND CC='7' and CL='')

-- SELECT SOitem, Alloy, Form,CC,CL,Thck,Weight,Descript FROM dbo.AllQuotes WHERE SalesNum > 0 AND Alloy = 'HPA N60' AND CC='5' AND CL='' 
--UPDATE dbo.AllQuotes Set CC='7',CL='1' WHERE SOitem IN (SELECT SOitem FROM dbo.AllQuotes WHERE SalesNum > 0 AND Alloy = 'HPA N60' AND CC='5' AND CL='' )
--UPDATE dbo.AllQuotes Set CC='L',CL='E' WHERE SOitem ='  56832-01'
--SELECT SOitem , Alloy, Form,CC,CL,Thck,Weight,Descript,Company FROM Alloy2024.dbo.AllQuotes WHERE SalesNum > 0 AND Alloy = 'HPA N60' AND CC='Y' AND NOT Descript like '%SPX%'
--UPDATE dbo.AllQuotes Set CC='7',CL='5' WHERE SOitem IN (SELECT SOitem FROM HPAlloy2024.dbo.AllQuotes WHERE SalesNum > 0 AND Alloy = 'HPA N60' AND CC='X' AND NOT Descript like '%SPX%')
--UPDATE dbo.AllQuotes Set CC='7',CL='3' WHERE SOitem =' 109449-01'



END
GO
/****** Object:  StoredProcedure [dbo].[p_NR_FILL_Stock_YrSum]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_NR_FILL_Stock_YrSum]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_NR_FILL_Stock_YrSum] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[p_NR_FILL_Stock_YrSum] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--EXEC [dbo].[p_NR_FILL_Stock_YrSum] 

	INSERT INTO [dbo].[NR_Stock_YrSum] 
	([Alloy] ,[form] ,[CC] ,[CL] ,[Thck] ,[Yr] ,[LBS_Stock] )
	--([Alloy] ,[form] ,[CC] ,[CL] ,[Thck] ,[Yr] ,[LBS_Stock] ,[LBS_Due_In], [LBS_Due_In_E] )


	SELECT Distinct Alloy, Form, CC,CL, Thck, 2024 AS Yr
	, dbo.f_Calc_Stock_QTY( Alloy,Form,CONVERT(Decimal(9,3),Thck) ) AS LBS_Stock
--	, dbo.f_Calc_Stock_QTY_Process_ID(Alloy,Form,CONVERT(Decimal(9,3),Thck),'INCOMING') AS LBS_Due_In
--	, dbo.f_Calc_Stock_QTY_Process_ID(Alloy,Form,CONVERT(Decimal(9,3),Thck),'ELECTRALLO') AS LBS_Due_In_E
	FROM (

	SELECT DISTINCT
	S.Alloy, S.Form, S.CC, S.CL, S.Thck

	FROM dbo.NR_Sales_YrSum_10Yr S
	WHERE S.[When] = '2025-01-18'
	) t ORDER BY Alloy, Form, CC ,CL, Thck ;

END
GO
/****** Object:  StoredProcedure [dbo].[p_NR_GetTrackedEmails]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_NR_GetTrackedEmails]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_NR_GetTrackedEmails] AS' 
END
GO
-- =============================================
-- Author:		 
-- Create date: 2015 02 04
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[p_NR_GetTrackedEmails] 
	-- Add the parameters for the stored procedure here
	@InqNumP char(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
DECLARE @AllQuoteID int
 SET @AllQuoteID =
 (SELECT TOP 1 [ID]
  FROM [dbo].[AllQuotes]
  WHERE LTRIM(RTRIM(InqNumP)) = LTRIM(RTRIM(@InqNumP)))

SELECT TOP 1000 [ID]
      ,[emailKey]
      ,[dateEntered]
      ,[userInfo]
      ,[ipaddress]
      ,[quoteID]
      ,[poID]
      ,[vendorID]
  FROM [dbo].[NR_EmailTracker]
  WHERE quoteID = @AllQuoteID
  ORDER BY dateEntered desc
END
GO
/****** Object:  StoredProcedure [dbo].[p_NR_Is_Holiday]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_NR_Is_Holiday]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_NR_Is_Holiday] AS' 
END
GO
-- =============================================
-- Author:		David Kirchner
-- Create date: 2015 08 04
-- Description:	Checks to see if all vendor documents are valid
-- =============================================
ALTER Procedure [dbo].[p_NR_Is_Holiday] 
(
	@Date DateTime
)
--RETURNS Bit

--EXEC dbo.p_NR_Is_Holiday  '01/01/2016'
--EXEC dbo.p_NR_Is_Holiday  '2016-01-01' 
--EXEC dbo.p_NR_Is_Holiday @date='  /  /    ' --Error converting data type varchar to datetime.

AS
BEGIN
	-- Declare the return variable here
	DECLARE @Is_Holiday bit = 0

	-- Add the T-SQL statements to compute the return value here
	IF EXISTS( SELECT * FROM dbo.NR_HPA_Holidays WHERE [HolidayDate] = @Date )
		SET @Is_Holiday = 1
	ELSE
		SET @Is_Holiday = 0

	
	SELECT @Is_Holiday AS Holiday

END
GO
/****** Object:  StoredProcedure [dbo].[p_NR_MachineTracking_HoursDetail]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_NR_MachineTracking_HoursDetail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_NR_MachineTracking_HoursDetail] AS' 
END
GO
-- =============================================
-- Author:		 
-- Create date: 2015 11 2
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[p_NR_MachineTracking_HoursDetail] 
	-- Add the parameters for the stored procedure here
	@overalldatemin date
	,@overalldatemax date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
set datefirst 1

CREATE TABLE #MyTempTable_MachineHoursBreakDown(
[Hours of UpTime] float
, [Total Hours] float
, [% of UpTime Hours] float
, [SensorID] smallint
, [Sensor Name] varchar(75)
, [Year] int
, [Month] int
, [Day] int
, [Shift] varchar(75)
)

WHILE (@overalldatemin <= @overalldatemax)
BEGIN
	--IF datepart(dw, @overalldatemin) != 6 AND datepart(dw, @overalldatemin) != 7
	--AND @overalldatemin NOT IN (SELECT h.HolidayDate FROM dbo.NR_HPA_Holidays h)
	--BEGIN
		DECLARE @counter int = 0
		WHILE (@counter < 3)
		BEGIN
			DECLARE @timemin datetime = DATEADD(HOUR, @counter * 8, CONVERT(datetime,@overalldatemin))
			DECLARE @timemax datetime = DATEADD(HOUR, 8, @timemin)
			insert into #MyTempTable_MachineHoursBreakDown
			SELECT q.[Hours of UpTime]
				,q.[Total Hours]
				,(q.[Hours of UpTime] / q.[Total Hours]) * CONVERT(float,100) [% of UpTime Hours]
				,q.MachineTrackingSensors_SensorID
				,q.MachineTrackingSensors_SensorName
				,YEAR(@overalldatemin)
				,MONTH(@overalldatemin)
				,DAY(@overalldatemin)
				,CASE @counter 
					WHEN 0 THEN '3rd shift'--'3rd shift, 12am - 8am'
					WHEN 1 THEN '1st shift'--'1st shift, 8am - 4pm'
					ELSE '2nd shift'--'2nd shift, 4pm - 12am'
				 END
			FROM
			(
				SELECT CONVERT(float,
								dbo.f_NR_MachineTracking_GetTotalMinutes(
									@timemin
									, @timemax
									, [MachineTrackingSensors_SensorID])
								) / CONVERT(float,60) [Hours of UpTime]
						, CONVERT(float,DATEDIFF(MINUTE, @timemin, @timemax)) / CONVERT(float,60) [Total Hours]
						,[MachineTrackingSensors_SensorID]
						,[MachineTrackingSensors_SensorName]
						--,[MachineTrackingSensors_Web600ID]
					FROM [dbo].[NR_MachineTrackingSensors]
			) q
			SET @counter += 1
		END
	--END
	SET @overalldatemin = DATEADD(DAY, 1, @overalldatemin)
END

SELECT *
FROM #MyTempTable_MachineHoursBreakDown t
order by t.Year, t.Month, t.Day
drop table #MyTempTable_MachineHoursBreakDown
END
GO
/****** Object:  StoredProcedure [dbo].[p_NR_SetEmployee_DateLeft]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_NR_SetEmployee_DateLeft]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_NR_SetEmployee_DateLeft] AS' 
END
GO
-- =============================================
-- Author:		Brandon van de Venter
-- Create date: 08/06/2018
-- Description:	Created a simple proceedure to set an employee's dateleft value to remove them from ordertracking views
-- =============================================
ALTER PROCEDURE [dbo].[p_NR_SetEmployee_DateLeft] 
	-- Add the parameters for the stored procedure here
	@empId bigint = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	if exists(select * from dbo.TC_Replacement_Employees where EmployeeId = @empId)
	begin
		update dbo.TC_Replacement_Employees
		set DateLeft = GETDATE()
		where EmployeeId = @empId
	end
END
GO
END
GO
/****** Object:  StoredProcedure [dbo].[p_NR_Web_Inquiry_ins]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_NR_Web_Inquiry_ins]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_NR_Web_Inquiry_ins] AS' 
END
GO
-- =============================================
-- Author:		 
-- Create date: 5/4/2012
-- Description:	Insert Web_Inquiry and returns ID
-- =============================================
ALTER PROCEDURE [dbo].[p_NR_Web_Inquiry_ins] 
	-- Add the parameters for the stored procedure here
	@Name nvarchar(100)
      ,@Company nvarchar(100)
      ,@Phone nvarchar(50)
      ,@Fax nvarchar(50)
      ,@Email nvarchar(100)
      ,@Alloy nvarchar(50)
      ,@Pieces nvarchar(50)
      ,@Description nvarchar(50)
      ,@Comments nvarchar(1000)
      ,@Title nvarchar(50)
      ,@Address nvarchar(100)
      ,@City nvarchar(100)
      ,@State nvarchar(50)
      ,@Zip nvarchar(50)
      ,@Country nvarchar(50)
      ,@SalesP char(1)
      ,@IPAddr nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @ID int
	INSERT INTO dbo.NR_Web_Inquiry
	(
		Name
		,Company
		,Phone
		,Fax 
		,Email 
		,Alloy 
		,Pieces 
		,Description 
		,Comments 
		,Title 
		,Address 
		,City 
		,State 
		,Zip 
		,Country
		,SalesP 
		,IPAddr
	)
	Values
	(
		@Name
		,@Company
		,@Phone
		,@Fax 
		,@Email 
		,@Alloy 
		,@Pieces 
		,@Description 
		,@Comments 
		,@Title 
		,@Address 
		,@City 
		,@State 
		,@Zip 
		,@Country
		,@SalesP
		,@IPAddr
	)
		
	SET @ID = SCOPE_IDENTITY()
	
	SELECT @ID
END
GO
/****** Object:  StoredProcedure [dbo].[p_NR_Web_Inquiry_ins_Updated]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_NR_Web_Inquiry_ins_Updated]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_NR_Web_Inquiry_ins_Updated] AS' 
END
GO
-- =============================================
-- Author:		Brandon van de Venter
-- Create date: 03/29/2017
-- Description:	Insert Web_Inquiry_New and returns ID
-- =============================================
ALTER PROCEDURE [dbo].[p_NR_Web_Inquiry_ins_Updated] 
	-- Add the parameters for the stored procedure here
	@Name nvarchar(100)
      ,@Title nvarchar(50)
      ,@Company nvarchar(100)
      ,@Phone nvarchar(50)
      ,@Phone2 nvarchar(50)
      ,@Email nvarchar(100)
      ,@Address nvarchar(100)
      ,@City nvarchar(100)
      ,@State nvarchar(50)
      ,@Zip nvarchar(50)
      ,@Country nvarchar(50)
      ,@Fax nvarchar(50)
      ,@Comments nvarchar(1000)
      ,@SalesP char(1)
      ,@IPAddr nvarchar(100)
      ,@EmailBody varchar(MAX)
	  ,@SourcePage varchar(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @ID int
	INSERT INTO dbo.NR_Web_Inquiry
	(
		Name
		,Title 
		,Company
		,Phone
		,Phone2
		,Email 
		,Address 
		,City 
		,State 
		,Zip 
		,Country
		,Fax 
		,Comments 
		,SalesP 
		,IPAddr
		,EmailBody
		,SourcePage
	)
	Values
	(
		@Name
		,@Title 
		,@Company
		,@Phone
		,@Phone2
		,@Email 
		,@Address 
		,@City 
		,@State 
		,@Zip 
		,@Country
		,@Fax 
		,@Comments 
		,@SalesP
		,@IPAddr
		,@EmailBody
		,@SourcePage
	)
		
	SET @ID = SCOPE_IDENTITY()
	
	return @ID
END
GO
/****** Object:  StoredProcedure [dbo].[p_NR_Web_Inquiry_ins2]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_NR_Web_Inquiry_ins2]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_NR_Web_Inquiry_ins2] AS' 
END
GO
-- =============================================
-- Author:		Brandon van de Venter
-- Create date: 03/28/2017
-- Description:	Insert Web_Inquiry_New and returns ID
-- =============================================
ALTER PROCEDURE [dbo].[p_NR_Web_Inquiry_ins2] 
	-- Add the parameters for the stored procedure here
	@Name nvarchar(100)
      ,@Title nvarchar(50)
      ,@Company nvarchar(100)
      ,@Phone nvarchar(50)
      ,@Phone2 nvarchar(50)
      ,@Email nvarchar(100)
      ,@Address nvarchar(100)
      ,@City nvarchar(100)
      ,@State nvarchar(50)
      ,@Zip nvarchar(50)
      ,@Country nvarchar(50)
      ,@Fax nvarchar(50)
      ,@Comments nvarchar(1000)
      ,@SalesP char(1)
      ,@IPAddr nvarchar(100)
      ,@EmailBody varchar(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @ID int
	INSERT INTO dbo.NR_Web_Inquiry
	(
		Name
		,Title 
		,Company
		,Phone
		,Phone2
		,Email 
		,Address 
		,City 
		,State 
		,Zip 
		,Country
		,Fax 
		,Comments 
		,SalesP 
		,IPAddr
		,EmailBody
	)
	Values
	(
		@Name
		,@Title 
		,@Company
		,@Phone
		,@Phone2
		,@Email 
		,@Address 
		,@City 
		,@State 
		,@Zip 
		,@Country
		,@Fax 
		,@Comments 
		,@SalesP
		,@IPAddr
		,@EmailBody
	)
		
	SET @ID = SCOPE_IDENTITY()
	
	return @ID
END
GO
/****** Object:  StoredProcedure [dbo].[p_NR_Web_Inquiry_Items_ins]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_NR_Web_Inquiry_Items_ins]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_NR_Web_Inquiry_Items_ins] AS' 
END
GO
-- =============================================
-- Author:		Brandon van de Venter
-- Create date: 03/28/2017
-- Description:	Insert Web_Inquiry_Items and returns ID
-- =============================================
ALTER PROCEDURE [dbo].[p_NR_Web_Inquiry_Items_ins] 
	-- Add the parameters for the stored procedure here
	  @WebInqID int
      ,@Alloy varchar(150)
      ,@Specification varchar(150)
      ,@Description varchar(150)
      ,@Quantity varchar(150)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Declare @ID uniqueidentifier = newid()

	INSERT INTO dbo.NR_Web_Inquiry_Items
	(
		ID
		,WebInqID
		,Alloy
		,Specification
		,Description
		,Quantity
	)
	Values
	(
		@ID
		,@WebInqID 
		,@Alloy
		,@Specification
		,@Description
		,@Quantity
	)
	
	select @ID
END
GO
/****** Object:  Trigger [dbo].[NR_OT_Job_After_Insert]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[NR_OT_Job_After_Insert]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<David Kirchner>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create TRIGGER [dbo].[NR_OT_Job_After_Insert]
   ON  [dbo].[NR_OT_Job]
   AFTER INSERT
   NOT FOR REPLICATION
AS 
BEGIN

	PRINT ''Trigger Start [OT_Job_After_Insert]'';

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	INSERT INTO dbo.rtr_Operation
		([Operation]
		--,[jobClass]=[jobClass]
		,[jobType]) 
		(SELECT [jobDescription],[jobType]
		FROM inserted WHERE ISNULL(inserted.[Machine],0) = 0 )

	PRINT ''Trigger  End  [OT_Job_After_Insert]'';
END
' 
GO
ALTER TABLE [dbo].[NR_OT_Job] ENABLE TRIGGER [NR_OT_Job_After_Insert]
GO
/****** Object:  Trigger [dbo].[NR_OT_Time_After_Insert]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[NR_OT_Time_After_Insert]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create TRIGGER [dbo].[NR_OT_Time_After_Insert]
   ON  [dbo].[NR_OT_Time]
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @status nchar(15) = (SELECT inserted.[status] FROM inserted)
	DECLARE @trackID uniqueIdentifier = (SELECT inserted.[trackID] FROM inserted)
	DECLARE @endTime datetime = (SELECT inserted.[time] FROM inserted)

	IF (RTRIM(@status) = ''finish'')
	BEGIN
		IF not exists(select 1 from [dbo].[NR_OT_EmployeeJobTime] where [trackID] = @trackID and [status] = @status)
		BEGIN
			insert into [dbo].[NR_OT_EmployeeJobTime] ([trackID], [orderItem], [status], [jobDescription], [EmployeeId], [empTotalMinutesOnJob], [JobEndTime])
			SELECT trackID, orderItem, [status], jobDescription, EmployeeId, [Total Time], @endTime FROM
			(
				SELECT o.trackID
						, o.orderItem
						, (SELECT     TOP (1) status
							FROM          dbo.NR_OT_Time AS ott
							WHERE (trackID = o.trackID)
							ORDER BY time DESC) AS [status]
						, otj.jobDescription
						, ote.EmployeeId
						,dbo.f_NR_OT_GetTotalTime_Adv(o.trackID) AS [Total Time]
				FROM dbo.NR_OT AS o
					INNER JOIN dbo.NR_OT_Job AS otj ON o.jobID = otj.jobID
					INNER JOIN dbo.NR_OT_Employee ote on ote.trackID = o.trackID
			) as inner_table
			WHERE status = @status
			and trackID = @trackID
		END

		else if exists(select 1 from [dbo].[NR_OT_EmployeeJobTime] where [trackID] = @trackID and [status] = @status)
		BEGIN
			update [dbo].[NR_OT_EmployeeJobTime]
			set [empTotalMinutesOnJob] = dbo.f_NR_OT_GetTotalTime_Adv(@trackID)
			, [JobEndTime] = @endTime
			where trackID = @trackID and [status] = @status
		END
	end	

    -- Insert statements for trigger here

END
' 
GO
ALTER TABLE [dbo].[NR_OT_Time] ENABLE TRIGGER [NR_OT_Time_After_Insert]
GO
/****** Object:  Trigger [dbo].[TC_NR_Replacement_Employees_insert]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TC_NR_Replacement_Employees_insert]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create TRIGGER [dbo].[TC_NR_Replacement_Employees_insert] ON [dbo].[NR_TC_Replacement_Employees] 
FOR INSERT NOT FOR REPLICATION
   
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

/*
	DECLARE @id bigint = 1122,
		@firstName nvarchar(50) = ''Lori'',
		@lastName nvarchar(50) = ''Cash''


Insert into [dbo].[TC_Replacement_Employees] ([EmployeeId]
      ,[FirstName]
      ,[LastName]
      ,[Pin]
      ,[Position]
      ,[DateLeft]
      ,[IsSuspended])
values (@id, @firstName, @lastName, @id, ''Shop'', null, 0)
*/
END
' 
GO
ALTER TABLE [dbo].[NR_TC_Replacement_Employees] ENABLE TRIGGER [TC_NR_Replacement_Employees_insert]
GO
/****** Object:  Trigger [dbo].[NR_UserTrack_After_Insert]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[NR_UserTrack_After_Insert]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.UserTrack_Delete    Script Date: 7/1/2004 1:57:08 PM ******/


create TRIGGER [dbo].[NR_UserTrack_After_Insert] ON [dbo].[NR_UserTrack] 
AFTER UPDATE NOT FOR REPLICATION
AS

/*
INSERT dbo.NR_UserTrack
	( [mess1],
	[cprogram],
	[errordate],
	[machine],
	[ID] )
SELECT   [mess1],
	[cprogram],
	[errordate],
	[machine],
	[ID]
FROM inserted
*/

PRINT ''Delete from dbo.NR_UserTrack records Older than 5 Years''
DELETE FROM dbo.NR_UserTrack WHERE [ErrorDate] < GETDATE() - 1825
--5yr
' 
GO
ALTER TABLE [dbo].[NR_UserTrack] ENABLE TRIGGER [NR_UserTrack_After_Insert]
GO
/****** Object:  Trigger [dbo].[NR_UserTrack_Delete]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[NR_UserTrack_Delete]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.UserTrack_Delete    Script Date: 7/1/2004 1:57:08 PM ******/


create TRIGGER [dbo].[NR_UserTrack_Delete] ON [dbo].[NR_UserTrack] 
FOR DELETE
AS


INSERT dbo.AR_UserTrack_History
	( [mess1],
	[cprogram],
	[errordate],
	[machine],
	[ID] )
SELECT   [mess1],
	[cprogram],
	[errordate],
	[machine],
	[ID]
FROM deleted
' 
GO
ALTER TABLE [dbo].[NR_UserTrack] ENABLE TRIGGER [NR_UserTrack_Delete]
GO
/****** Object:  Trigger [dbo].[NR_UserTrack_Insert]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[NR_UserTrack_Insert]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.UserTrack_Insert     ******/


create TRIGGER [dbo].[NR_UserTrack_Insert] 
ON [dbo].[NR_UserTrack] 
	FOR INSERT
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [UserTrack_Insert]'';

/*
--*********************************************************************************
-- Errors are stored on dbo.Errors
--*********************************************************************************
DECLARE @cEmailFrom VARCHAR(30) = dbo.f_GetSQL_Server_Email()

BEGIN TRY
--Send Email
	
	DECLARE @Body varchar(4000) = ''''
	DECLARE @Mess1 VarChar(1024) = ''''
	DECLARE @cProgram VarChar(100) = ''''
	DECLARE @ErrorDate DateTime = GetDate()
	DECLARE @Machine Char(40) = ''''
	DECLARE @ID BigInt = 0
	DECLARE @ServerName VarChar(50) = ''''
		
	SELECT TOP 1 
		 @Mess1 = LEFT(TRIM(inserted.Mess1),1024)
		,@cProgram = ISNULL(inserted.cProgram,'''')
		,@ErrorDate = ISNULL(inserted.ErrorDate,GetDate() )
		,@Machine = ISNULL(inserted.Machine,'''')
		,@ID = inserted.ID 
		,@ServerName = ISNULL(inserted.ServerName,'''')
		
		FROM inserted
		WHERE ISNULL(inserted.cProgram,'''') LIKE ''%TrackError%'';


	IF LEN(TRIM(@Mess1)) > 10
	begin
		
		DECLARE @cErrorDate VARCHAR(12) = CONVERT(VARCHAR(12), @ErrorDate, 101 )
		DECLARE @cID VARCHAR(20) = CAST(@ID AS VarChar(20) )

--		PRINT ''     cMess: ''+@Mess1;
--		PRINT ''  cProgram: ''+@cProgram;
--		PRINT ''   Machine: ''+@Machine;
----		PRINT @ErrorDate;
--		PRINT '' ErrorDate: ''+@cErrorDate;
----		PRINT @ID;
--		PRINT ''        ID: = ''+@cID;
--		PRINT ''ServerName: ''+ @ServerName;

		SET @Body = TRIM(@Mess1)						+''</Br>''+CHAR(13)
		SET @Body = @Body +''  cProgram: ''+@cProgram+'' ''	+''</Br>''+CHAR(13)
		SET @Body = @Body +''   Machine: ''+@Machine+'' ''	+''</Br>''+CHAR(13)
		SET @Body = @Body +'' ErrorDate: ''+@cErrorDate	+''</Br>''+CHAR(13)
		SET @Body = @Body +''        ID: ''+@cID			+''</Br>''+CHAR(13)
		SET @Body = @Body +''ServerName: ''+@ServerName

		--SET @Body = @Body+CHAR(10)+CHAR(13)+''<br>'';
		PRINT ''Body: ''+@Body;
		

		EXEC dbo.p_eMail_Send
			@FromEmail = @cEmailFrom, 
			@ToEmail = ''VFP@com'',
			@SubjectEmail = ''Track Error, dbo.[NR_UserTrack_Insert]'',
			@BodyEmail = @Body,
			@BodyType = ''HTML'';
			--@BodyType = ''TEXT'';
	end

	END TRY
	BEGIN CATCH
		EXEC dbo.p_eMail_Send
			@FromEmail = @cEmailFrom, 
			@ToEmail = ''DavidKirchner@yahoo.com;'',
			@SubjectEmail = ''Track Error, dbo.[NR_UserTrack_Insert]'',
			@BodyEmail = ''Failed to send text in trigger UserTrack_Insert'',
			@BodyType = ''TEXT''

	END CATCH;
*/	
/*
INSERT INTO dbo.NR_UserTrack 
([mess1], [cprogram]) Values
(''Test insert in UserTrack'', ''HPA:Proc_HPA.prg'');
*/
PRINT ''Trigger  End  [UserTrack_Insert]'';

--ROLLBACK TRANSACTION;' 
GO
ALTER TABLE [dbo].[NR_UserTrack] ENABLE TRIGGER [NR_UserTrack_Insert]
GO
/****** Object:  Trigger [dbo].[NR_web_User_Info_After_Update]    Script Date: 12/26/2025 4:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[NR_web_User_Info_After_Update]'))
EXEC dbo.sp_executesql @statement = N'/****** Object:  Trigger dbo.web_User_Info_After_Update    Script Date: 12/16/2005 10:36:30 AM ******/
/****** Object:  Trigger dbo.web_User_Info_After_Update    Script Date: 7/1/2004 1:57:08 PM ******/



create TRIGGER [dbo].[NR_web_User_Info_After_Update] ON [dbo].[NR_Web_User_Info] 
	AFTER UPDATE 
	NOT FOR REPLICATION
AS

PRINT ''Trigger Start [web_User_Info_After_Update]'';

IF UPDATE(isLockedOut)
begin
	
--	UPDATE [ASP.NET_MSDN].[dbo].[aspnet_Membership] SET FailedPasswordAttemptCount=0, IsLockedOut=0 WHERE UserID= ''8401F32B-9607-4F08-90A6-4E12BFEE0F22''
	PRINT ''Trigger isLockedOut [web_User_Info_After_Update]'';


end

PRINT ''Trigger  End  [StockLst_Master_After_Update]'';' 
GO
ALTER TABLE [dbo].[NR_Web_User_Info] ENABLE TRIGGER [NR_web_User_Info_After_Update]
GO
/****** Object:  DdlTrigger [DDLTrigger_AuditDB]    Script Date: 12/26/2025 4:00:41 PM ******/
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
 
    INSERT dbo.DDLEvents
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
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_AlloyCodeLevel', N'COLUMN',N'EL'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Min Elongation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_AlloyCodeLevel', @level2type=N'COLUMN',@level2name=N'EL'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_AlloyCodeLevel', N'COLUMN',N'RA'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Min Reduction of Area' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_AlloyCodeLevel', @level2type=N'COLUMN',@level2name=N'RA'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_AlloyCodeLevel', N'COLUMN',N'RC'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Rockwell C Hardness Max' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_AlloyCodeLevel', @level2type=N'COLUMN',@level2name=N'RC'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_AlloyCodeLevel', N'COLUMN',N'BHN'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Brinnel Hardness Max' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_AlloyCodeLevel', @level2type=N'COLUMN',@level2name=N'BHN'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_AlloyCodeLevel', N'COLUMN',N'Spec'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Spec Specific, usually empty' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_AlloyCodeLevel', @level2type=N'COLUMN',@level2name=N'Spec'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_Country Data', N'COLUMN',N'Restricted'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'f_Is_Country_Restricted  dbo.NR_Country' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_Country Data', @level2type=N'COLUMN',@level2name=N'Restricted'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_CW_Matrix', N'COLUMN',N'CC'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Condition Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_CW_Matrix', @level2type=N'COLUMN',@level2name=N'CC'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_CW_Matrix', N'COLUMN',N'CL'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Condition Level' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_CW_Matrix', @level2type=N'COLUMN',@level2name=N'CL'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_CW_Matrix', N'COLUMN',N'WorkSize'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'MachSize' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_CW_Matrix', @level2type=N'COLUMN',@level2name=N'WorkSize'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_CW_Matrix', N'COLUMN',N'sSize'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Start Size' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_CW_Matrix', @level2type=N'COLUMN',@level2name=N'sSize'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_CW_Matrix', N'COLUMN',N'fSize'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Finish Size' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_CW_Matrix', @level2type=N'COLUMN',@level2name=N'fSize'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_CW_Matrix', N'COLUMN',N'CW'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cold Work Percentage' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_CW_Matrix', @level2type=N'COLUMN',@level2name=N'CW'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_CW_Matrix', N'COLUMN',N'mach'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Machine' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_CW_Matrix', @level2type=N'COLUMN',@level2name=N'mach'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_CW_Matrix', N'COLUMN',N'lot'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Machine Lot' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_CW_Matrix', @level2type=N'COLUMN',@level2name=N'lot'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_CW_Matrix', N'COLUMN',N'Spec'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Spec_Check dbo.f_Is_GFMlot_toSpec(Lot,@Spec,@Version)=1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_CW_Matrix', @level2type=N'COLUMN',@level2name=N'Spec'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_CW_Matrix', N'COLUMN',N'Ver'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Spec_Check' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_CW_Matrix', @level2type=N'COLUMN',@level2name=N'Ver'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_CW_Matrix', N'COLUMN',N'LogDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'log Date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_CW_Matrix', @level2type=N'COLUMN',@level2name=N'LogDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_DateLookup', N'CONSTRAINT',N'PK_NR_DateLookup'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date as Key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_DateLookup', @level2type=N'CONSTRAINT',@level2name=N'PK_NR_DateLookup'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_DBMail_Resend_Log', N'COLUMN',N'sendStatus'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 - none, 1 - sending, 2 - failed, 3 - success' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_DBMail_Resend_Log', @level2type=N'COLUMN',@level2name=N'sendStatus'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_GFM_N60_fact', N'COLUMN',N'MS_101'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.f_Is_GFMlot_toSpec(Lot,''HPA-MS-101 '','''')' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_GFM_N60_fact', @level2type=N'COLUMN',@level2name=N'MS_101'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_GFM_N60_fact', N'COLUMN',N'PO'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer PO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_GFM_N60_fact', @level2type=N'COLUMN',@level2name=N'PO'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_GFM_N60_fact', N'COLUMN',N'tLoc'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Test Location: Center, MidRadius, Outer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_GFM_N60_fact', @level2type=N'COLUMN',@level2name=N'tLoc'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_GFM_N60_fact', N'COLUMN',N'tLoc2'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Test Location: Center, MidRadius, Outer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_GFM_N60_fact', @level2type=N'COLUMN',@level2name=N'tLoc2'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_GFM_N60_fact', N'COLUMN',N'tLoc3'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Test Location: Center, MidRadius, Outer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_GFM_N60_fact', @level2type=N'COLUMN',@level2name=N'tLoc3'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_GFM_N60_fact', N'COLUMN',N'tLoc4'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Test Location: Center, MidRadius, Outer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_GFM_N60_fact', @level2type=N'COLUMN',@level2name=N'tLoc4'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_GFM_N60_fact', N'COLUMN',N'tLoc5'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Test Location: Center, MidRadius, Outer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_GFM_N60_fact', @level2type=N'COLUMN',@level2name=N'tLoc5'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_GFM_N60_fact', N'COLUMN',N'GFMp'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GFM Price' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_GFM_N60_fact', @level2type=N'COLUMN',@level2name=N'GFMp'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_GFM_N60_fact', N'COLUMN',N'Ovenp'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Oven Price' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_GFM_N60_fact', @level2type=N'COLUMN',@level2name=N'Ovenp'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_GFM_N60_fact', N'COLUMN',N'SrvcPO'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Conversion or Service HPA PO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_GFM_N60_fact', @level2type=N'COLUMN',@level2name=N'SrvcPO'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_GFM_N60_fact', N'COLUMN',N'GrainSize'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'LMA requires grain size to listed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_GFM_N60_fact', @level2type=N'COLUMN',@level2name=N'GrainSize'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_GFM_N60_fact', N'COLUMN',N'ProjID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'From dbo.Stock_Projected' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_GFM_N60_fact', @level2type=N'COLUMN',@level2name=N'ProjID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_GFM_N60_fact', N'COLUMN',N'R'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Report Quality' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_GFM_N60_fact', @level2type=N'COLUMN',@level2name=N'R'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_MachineTrackingSummary', N'COLUMN',N'MachineTrackingSummary_Runtime'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is an estimate of runtime, of a machine, in minutes for each day ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_MachineTrackingSummary', @level2type=N'COLUMN',@level2name=N'MachineTrackingSummary_Runtime'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_OT_Employee', N'COLUMN',N'trackEmpID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique ID for the EmployeeID and TrackID --Add new Employees to TC_Replacement_Employees' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_OT_Employee', @level2type=N'COLUMN',@level2name=N'trackEmpID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_OT_Employee', N'COLUMN',N'EmployeeId'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'was related to dbo.TimeClock  --Add new Employees to TC_Replacement_Employees' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_OT_Employee', @level2type=N'COLUMN',@level2name=N'EmployeeId'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_OT_Employee_OT_Time', N'COLUMN',N'trackEmpID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique ID for the EmployeeID and TrackID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_OT_Employee_OT_Time', @level2type=N'COLUMN',@level2name=N'trackEmpID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_OT_EmployeeJobTime', N'COLUMN',N'trackID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'related to dbo.OT.trackID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_OT_EmployeeJobTime', @level2type=N'COLUMN',@level2name=N'trackID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_OT_EmployeeJobTime', N'COLUMN',N'status'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'start          ,pause          ,resume         ,finish         ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_OT_EmployeeJobTime', @level2type=N'COLUMN',@level2name=N'status'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_OT_Job', N'COLUMN',N'MaintenanceID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bad use, should have used start maint, finish maint as a status.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_OT_Job', @level2type=N'COLUMN',@level2name=N'MaintenanceID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_OT_Job', N'COLUMN',N'jobClass'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Overall Classification' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_OT_Job', @level2type=N'COLUMN',@level2name=N'jobClass'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_OT_Job', N'COLUMN',N'jobType'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A Job Type can be selected without selecting the actual jobID.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_OT_Job', @level2type=N'COLUMN',@level2name=N'jobType'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_OT_Job', N'COLUMN',N'Machine'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Is this the Machine or a Type of Machine.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_OT_Job', @level2type=N'COLUMN',@level2name=N'Machine'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_OT_Time', N'COLUMN',N'status'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'start          ,pause          ,resume         ,finish         ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_OT_Time', @level2type=N'COLUMN',@level2name=N'status'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_OT_Time', N'COLUMN',N'trackID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Related to dbo.OT.trackID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_OT_Time', @level2type=N'COLUMN',@level2name=N'trackID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_PurchaseOrder_Company', N'COLUMN',N'Company'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Used by dbo.f_Standard_POCompany' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_PurchaseOrder_Company', @level2type=N'COLUMN',@level2name=N'Company'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_Sales_Summary', N'COLUMN',N'Sz2'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'For Tube, Pipe, Fittings, Fasteners' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_Sales_Summary', @level2type=N'COLUMN',@level2name=N'Sz2'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_Sales_Summary', N'COLUMN',N'Pc'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Used for forms like fasteners' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_Sales_Summary', @level2type=N'COLUMN',@level2name=N'Pc'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_Sales_Summary', N'COLUMN',N'MatlFt'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.f_Est_Ft(LBS,Form,Thck,Alloy,Size2,PC)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_Sales_Summary', @level2type=N'COLUMN',@level2name=N'MatlFt'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_Sales_Summary', N'COLUMN',N'Typ'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sales Order Type; Inventory, Broker, Mill, Production, Service,Conversion.  dbo.f_Sales_TYP()' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_Sales_Summary', @level2type=N'COLUMN',@level2name=N'Typ'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_Sales_Summary', N'COLUMN',N'DescriptID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'DescriptID or ProductID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_Sales_Summary', @level2type=N'COLUMN',@level2name=N'DescriptID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_Sales_Summary', N'COLUMN',N'fSORecv_Total'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'QTY*P FROM dbo.Stock_Recv_Process for SOitem' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_Sales_Summary', @level2type=N'COLUMN',@level2name=N'fSORecv_Total'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_Sales_Summary_ps', N'COLUMN',N'Shipped'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PS_Date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_Sales_Summary_ps', @level2type=N'COLUMN',@level2name=N'Shipped'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_Sales_Summary_ps', N'COLUMN',N'Size'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.f_SizeStandard(AQ.Thck)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_Sales_Summary_ps', @level2type=N'COLUMN',@level2name=N'Size'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_Sales_Summary_ps', N'COLUMN',N'Sz2'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'For Tube, Pipe, Fittings, Fasteners' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_Sales_Summary_ps', @level2type=N'COLUMN',@level2name=N'Sz2'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_Sales_Summary_ps', N'COLUMN',N'PCs'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PS.PCs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_Sales_Summary_ps', @level2type=N'COLUMN',@level2name=N'PCs'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_Sales_Summary_ps', N'COLUMN',N'MatlFt'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dbo.f_Est_Ft(LBS,Form,Thck,Alloy,Size2,PC)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_Sales_Summary_ps', @level2type=N'COLUMN',@level2name=N'MatlFt'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_Sales_Summary_ps', N'COLUMN',N'Typ'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sales Order Type; Inventory, Broker, Mill, Production, Service,Conversion.  dbo.f_Sales_TYP()' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_Sales_Summary_ps', @level2type=N'COLUMN',@level2name=N'Typ'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_Sales_Summary_ps', N'COLUMN',N'Q_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quotes Q_P' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_Sales_Summary_ps', @level2type=N'COLUMN',@level2name=N'Q_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_Sales_Summary_ps', N'COLUMN',N'Q_QTY'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quotes Qty' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_Sales_Summary_ps', @level2type=N'COLUMN',@level2name=N'Q_QTY'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_Sales_Summary_ps', N'COLUMN',N'DescriptID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'DescriptID or ProductID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_Sales_Summary_ps', @level2type=N'COLUMN',@level2name=N'DescriptID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_Sales_Summary_ps', N'COLUMN',N'ID_Detail'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Recorded by Packing Slip. The StockLst_Detail.ID_Detail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_Sales_Summary_ps', @level2type=N'COLUMN',@level2name=N'ID_Detail'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_Sales_Summary_ps', N'COLUMN',N'Book_P'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Packing Slip enters the current book price' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_Sales_Summary_ps', @level2type=N'COLUMN',@level2name=N'Book_P'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_Sales_YrSum_10Yr', N'COLUMN',N'SS'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Starting stock used to make that CCL dbo.f_Calc_SS_CCL (Thck,CC,CL)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_Sales_YrSum_10Yr', @level2type=N'COLUMN',@level2name=N'SS'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_States', N'COLUMN',N'ST'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'abbreviation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_States', @level2type=N'COLUMN',@level2name=N'ST'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_Stock_YrSum', N'COLUMN',N'LBS_Due_In_E'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Due from Electralloy' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_Stock_YrSum', @level2type=N'COLUMN',@level2name=N'LBS_Due_In_E'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_StockLst_Totals', N'COLUMN',N'DescriptID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'DescriptID or ProductID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_StockLst_Totals', @level2type=N'COLUMN',@level2name=N'DescriptID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'NR_UserTrack', N'COLUMN',N'ServerName'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'@@SERVERNAME' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NR_UserTrack', @level2type=N'COLUMN',@level2name=N'ServerName'
GO


/****** Object:  View [dbo].[BI_Date]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[BI_Date]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[BI_Date]
AS
SELECT   DateKey, FullDate, DayNumberOfMonth, DayNumberOfYear, WeekNumberOfYear, MonthNumberOfYear, CalendarQuarter, CalendarYear, dbo.f_get_Year_Month(FullDate) AS YearMn, 
                         dbo.f_get_Year_Qtr(FullDate) AS YearQ
FROM         dbo.NR_DateLookup WITH (NOLOCK)
WHERE     (CalendarYear > 1999) AND (CalendarYear <= YEAR(GETDATE()) + 4)
' 
GO
/****** Object:  View [dbo].[email_DoNotUse]    Script Date: 12/26/2025 5:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[email_DoNotUse]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[email_DoNotUse]
AS
SELECT        email
FROM            dbo.NR_email_DoNotUse AS email_DoNotUse_1 WITH (NOLOCK)
' 
GO