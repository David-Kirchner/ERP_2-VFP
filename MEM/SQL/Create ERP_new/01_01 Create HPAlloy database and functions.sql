--01 Create from HPAlloy
USE [master]



/****** Object:  Database [ERP_2]    Script Date: 12/26/2025 5:48:51 PM ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'ERP_2')
BEGIN
CREATE DATABASE [ERP_2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ERP_2', FILENAME = N'E:\Data\ERP_2.mdf' , SIZE = 4354944KB , MAXSIZE = UNLIMITED, FILEGROWTH = 256000KB )
 LOG ON 
( NAME = N'ERP_2_log', FILENAME = N'E:\Data\ERP_2_log.ldf' , SIZE = 1025024KB , MAXSIZE = 10241024KB , FILEGROWTH = 10240KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
END
GO
ALTER DATABASE [ERP_2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [ERP_2] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [ERP_2] SET ANSI_NULLS ON 
GO
ALTER DATABASE [ERP_2] SET ANSI_PADDING ON 
GO
ALTER DATABASE [ERP_2] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [ERP_2] SET ARITHABORT ON 
GO
ALTER DATABASE [ERP_2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ERP_2] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [ERP_2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ERP_2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ERP_2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ERP_2] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [ERP_2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ERP_2] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [ERP_2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ERP_2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ERP_2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ERP_2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ERP_2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ERP_2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ERP_2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ERP_2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ERP_2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ERP_2] SET RECOVERY FULL 
GO
ALTER DATABASE [ERP_2] SET  MULTI_USER 
GO
ALTER DATABASE [ERP_2] SET PAGE_VERIFY TORN_PAGE_DETECTION  
GO
ALTER DATABASE [ERP_2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ERP_2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ERP_2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ERP_2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ERP_2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ERP_2] SET QUERY_STORE = OFF
GO
USE [ERP_2]
GO
/****** Object:  User [NT AUTHORITY\ANONYMOUS LOGON]    Script Date: 12/26/2025 5:48:51 PM ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'NT AUTHORITY\ANONYMOUS LOGON')
CREATE USER [NT AUTHORITY\ANONYMOUS LOGON] FOR LOGIN [NT AUTHORITY\ANONYMOUS LOGON]
GO
/****** Object:  User [BUILTIN\Administrators]    Script Date: 12/26/2025 5:48:51 PM ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'BUILTIN\Administrators')
CREATE USER [BUILTIN\Administrators] FOR LOGIN [BUILTIN\Administrators]
GO

--ALTER ROLE [db_owner] ADD MEMBER [WINDFALL\Sean Lykins]
GO
--ALTER ROLE [db_datareader] ADD MEMBER [WINDFALL\HPA]
GO
--ALTER ROLE [db_owner] ADD MEMBER [SuperMicro\talkt]
GO
--ALTER ROLE [db_datareader] ADD MEMBER [Read4Reports]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [NT AUTHORITY\ANONYMOUS LOGON]
GO
--ALTER ROLE [db_owner] ADD MEMBER [David Kirchner]
GO
ALTER ROLE [db_owner] ADD MEMBER [BUILTIN\Administrators]
GO

/****** Object:  Schema [BUILTIN\Administrators]    Script Date: 12/26/2025 5:48:51 PM ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'BUILTIN\Administrators')
EXEC sys.sp_executesql N'CREATE SCHEMA [BUILTIN\Administrators]'
GO

/****** Object:  Schema [NT AUTHORITY\ANONYMOUS LOGON]    Script Date: 12/26/2025 5:48:51 PM ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'NT AUTHORITY\ANONYMOUS LOGON')
EXEC sys.sp_executesql N'CREATE SCHEMA [NT AUTHORITY\ANONYMOUS LOGON]'
GO

/****** Object:  Default [UW_ZeroDefault]    Script Date: 12/26/2025 5:48:51 PM ******/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UW_ZeroDefault]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[UW_ZeroDefault] AS 0'
GO


/****** Object:  UserDefinedFunction [dbo].[Alloy_Surcharge]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Alloy_Surcharge]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'



/****** Object:  User Defined Function dbo.Alloy_Surcharge    Script Date: 12/6/2005 1:08:34 PM ******/
CREATE  FUNCTION [dbo].[Alloy_Surcharge]
(
@cAlloy char(12)
)
RETURNS REAL
AS

--DECLARE @lnSurcharge REAL
--SELECT @lnSurcharge = dbo.Alloy_Surcharge(@cAlloyStd)
BEGIN
DECLARE @lnSurcharge REAL
DECLARE @lnNiSC DECIMAL(9,6)
DECLARE @lnCoSC DECIMAL(9,6)
DECLARE @lnCrSC DECIMAL(9,6)
DECLARE @lnCuSC DECIMAL(9,6)
DECLARE @lnMoSC DECIMAL(9,6)
DECLARE @lnFeSC DECIMAL(9,6)
DECLARE @lnTiSC DECIMAL(9,6)

SELECT TOP 1 @lnNiSC = [Ni], 
	@lnCoSC = [Co], 
	@lnCrSC = [Cr], 
	@lnCuSC = [Cu],
	@lnMoSC = [Mo], 
	@lnFeSC = [Fe], 
	@lnTiSC = [Ti] 
	FROM [dbo].[AlloySurcharge]

DECLARE @lnNi DECIMAL(9,9)
DECLARE @lnCo DECIMAL(9,9)
DECLARE @lnCr DECIMAL(9,9)
DECLARE @lnCu DECIMAL(9,9)
DECLARE @lnMo DECIMAL(9,9)
DECLARE @lnFe DECIMAL(9,9)
DECLARE @lnTi DECIMAL(9,9)

SELECT TOP 1 @lnNi = [Ni], 
	@lnCo = [Co], 
	@lnCr = [Cr], 
	@lnCu = [Cu], 
	@lnMo = [Mo], 
	@lnFe = [Fe], 
	@lnTi = [Ti] 
	FROM [dbo].[Alloy] 
	WHERE [alloy] = dbo.AlloyName(@cAlloy)
	AND [Surcharge] = 1

DECLARE @lnNiP REAL
DECLARE @lnCoP REAL
DECLARE @lnCrP REAL
DECLARE @lnCuP REAL
DECLARE @lnMoP REAL
DECLARE @lnFeP REAL
DECLARE @lnTiP REAL

SET @lnNiP = @lnNiSC * @lnNi 
SET @lnCoP = @lnCoSC * @lnCo 
SET @lnCrP = @lnCrSC * @lnCr 
SET @lnCuP = @lnCuSC * @lnCu 
SET @lnMoP = @lnMoSC * @lnMo 
SET @lnFeP = @lnFeSC * @lnFe 
SET @lnTiP = @lnTiSC * @lnTi 

SET @lnSurcharge = ISNULL( @lnNiP , 0) 
	+ ISNULL( @lnCoP, 0) 
	+ ISNULL( @lnCrP, 0) 
	+ ISNULL( @lnCuP, 0)
	+ ISNULL( @lnMoP, 0) 
	+ ISNULL( @lnFeP, 0) 
	+ ISNULL( @lnTiP, 0)

RETURN (@lnSurcharge)
END


--GRANT EXECUTE ON [dbo].[Alloy_Surcharge] TO [WINDFALL\HPA] AS [dbo];






' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[AlloyDensity]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AlloyDensity]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[AlloyDensity] 
(
@cAlloy char(12)
)
RETURNS NUMERIC(5,3)
AS
BEGIN
DECLARE @lnDensity NUMERIC(5,3)

SELECT TOP 1 @lnDensity = Density FROM Alloy WHERE alloy = @cAlloy

RETURN (@lnDensity)
END

--GRANT EXECUTE ON [dbo].[AlloyDensity] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[AlloyName]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AlloyName]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[AlloyName] 
(
@cAlloy char(12)
)
RETURNS char(12)
AS
BEGIN
--print dbo.AlloyName(''Ni 200/201'')
--print dbo.AlloyName(''Ni 200'')
--print dbo.AlloyName(''Ni 201'')
--SELECT * FROM dbo.Alloys

--SELECT * FROM dbo.Stocklst_Master WHERE Alloy like ''Ni 20%''
--SELECT * FROM dbo.PriceTable WHERE Alloy like ''Ni 20%''
--UPDATE dbo.PriceTable SET Alloy=''Ni 200/201''  WHERE Alloy like ''Ni 20%''
--SELECT alloy FROM dbo.Alloys WHERE Alloys like ''NI200%''

DECLARE @lcAlloyName char(12)

SELECT TOP 1 @lcAlloyName = alloy FROM dbo.Alloys WITH(NOLOCK) WHERE alloys = @cAlloy

RETURN (@lcAlloyName)
END

--GRANT EXECUTE ON [dbo].[AlloyName] TO [WINDFALL\HPA] AS [dbo];
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[BrokerLstIDform]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BrokerLstIDform]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[BrokerLstIDform] 
(
@ID AS INT
)

RETURNS CHAR(2)
AS
BEGIN

DECLARE @Form AS CHAR(2)
DECLARE @nCount AS INT

SELECT @nCount = COUNT(*) FROM dbo.BrokerLst_Master WHERE ID = @ID

IF @nCount > 0
	SELECT @Form = Form FROM dbo.BrokerLst_Master WHERE ID = @ID
ELSE
	SELECT @Form = Form FROM dbo.Ar_BrokerLst_Master_History WHERE ID = @ID

RETURN @Form 
END

--GRANT EXECUTE ON [dbo].[BrokerLstIDform] TO [WINDFALL\HPA] AS [dbo];



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[convert_dec_to_fraction]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[convert_dec_to_fraction]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[convert_dec_to_fraction]
(
@nInputNumber NUMERIC(15,5)
)
RETURNS VARCHAR(20)
AS
BEGIN
DECLARE @cFRACTION VARCHAR(10)
DECLARE @nInteger INT
DECLARE @nFraction REAL
DECLARE @cInteger VARCHAR(10)

SET @nInteger = CAST(@nInputNumber AS INT)
SET @nFraction = @nInputNumber - @nInteger
SET @cInteger = CASE 
 WHEN @nInteger = 0 THEN ''''
 ELSE CAST( @nInteger AS VARCHAR(10)) + ''-''
 END


SET @cFRACTION = CASE 
WHEN @nFraction = .03125 THEN ''1/32''
WHEN @nFraction = .0625 THEN ''1/16''
WHEN @nFraction = .09375 THEN ''3/32''
WHEN @nFraction = .125 THEN ''1/8''
WHEN @nFraction = .15625 THEN ''5/32''
WHEN @nFraction = .1875 THEN ''3/16''
WHEN @nFraction = .21875 THEN ''7/32''
WHEN @nFraction = .25 THEN ''1/4''
WHEN @nFraction = .28125 THEN ''9/32''
WHEN @nFraction = .3125 THEN ''5/16''
WHEN @nFraction = .34375 THEN ''11/32''
WHEN @nFraction = .375 THEN ''3/8''
WHEN @nFraction = .40625 THEN ''13/32''
WHEN @nFraction = .4375 THEN ''7/16''
WHEN @nFraction = .46875 THEN ''15/32''
WHEN @nFraction = .5 THEN ''1/2''
WHEN @nFraction = .53125 THEN ''17/32''
WHEN @nFraction = .5625 THEN ''9/16''
WHEN @nFraction = .59375 THEN ''19/32''
WHEN @nFraction = .625 THEN ''5/8''
WHEN @nFraction = .65625 THEN ''21/32''
WHEN @nFraction = .6875 THEN ''11/16''
WHEN @nFraction = .71875 THEN ''23/32''
WHEN @nFraction = .75 THEN ''3/4''
WHEN @nFraction = .78125 THEN ''25/32''
WHEN @nFraction = .8125 THEN ''13/16''
WHEN @nFraction = .84375 THEN ''27/32''
WHEN @nFraction = .875 THEN ''7/8''
WHEN @nFraction = .90625 THEN ''29/32''
WHEN @nFraction = .9375 THEN ''15/16''
WHEN @nFraction = .96875 THEN ''31/32''
END
RETURN (@cInteger+@cFraction)
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[ExtractFirstNumber]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExtractFirstNumber]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[ExtractFirstNumber] 
	(@inputString VARCHAR(MAX))
RETURNS FLOAT
AS
BEGIN
    DECLARE @posDecimal INT = PATINDEX(''%.[0-9]%'', @inputString);
    DECLARE @posDigit INT = PATINDEX(''%[0-9]%'', @inputString);
    DECLARE @startPos INT = 0;
    DECLARE @extracted VARCHAR(100);

    -- Determine the earliest valid start position (OR logic via CASE: decimal-start if valid and earlier, else digit-start)
    SET @startPos = CASE 
        WHEN @posDecimal > 0 AND (@posDecimal < @posDigit OR @posDigit = 0) THEN @posDecimal
        WHEN @posDigit > 0 THEN @posDigit
        ELSE 0 
    END;

    IF @startPos = 0 RETURN NULL;  -- No number found

    -- Get substring from start position onward
    DECLARE @subString VARCHAR(MAX) = SUBSTRING(@inputString, @startPos, LEN(@inputString) - @startPos + 1);

    -- Find the end of the numeric sequence (first non-0-9.)
    DECLARE @endPos INT = PATINDEX(''%[^0-9.]%'', @subString);

    -- Extract the candidate number
    SET @extracted = CASE 
        WHEN @endPos > 0 THEN LEFT(@subString, @endPos - 1)
        ELSE @subString 
    END;

    -- Safely cast and return (returns NULL if invalid, like ''.'' or ''1.'')
    RETURN TRY_CAST(@extracted AS FLOAT);
END;

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[ExtractSecondNumber]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExtractSecondNumber]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[ExtractSecondNumber] 
	(@inputString VARCHAR(MAX))
RETURNS FLOAT
AS
BEGIN
    DECLARE @posX INT = CHARINDEX(''X'', @inputString);
    DECLARE @startPos INT = 0;
    DECLARE @extracted VARCHAR(100);

    IF @posX = 0 RETURN NULL;  -- No ''X'' delimiter, so no second number

    -- Get substring after ''X''
    DECLARE @subString VARCHAR(MAX) = SUBSTRING(@inputString, @posX + 1, LEN(@inputString) - @posX);

    -- Find start of the second number: earliest valid position (negative, decimal-start, or digit-start)
    DECLARE @posNegative INT = PATINDEX(''%-[0-9]%'', @subString);  -- For negatives like ''-1.25''
    DECLARE @posDecimal INT = PATINDEX(''%.[0-9]%'', @subString);   -- For decimals like ''.125''
    DECLARE @posDigit INT = PATINDEX(''%[0-9]%'', @subString);      -- For integers like ''125''

    SET @startPos = CASE 
        WHEN @posNegative > 0 AND (@posNegative < @posDecimal OR @posDecimal = 0) AND (@posNegative < @posDigit OR @posDigit = 0) THEN @posNegative
        WHEN @posDecimal > 0 AND (@posDecimal < @posDigit OR @posDigit = 0) THEN @posDecimal
        WHEN @posDigit > 0 THEN @posDigit
        ELSE 0 
    END;

    IF @startPos = 0 RETURN NULL;  -- No valid number after ''X''

    -- Get substring from start position onward
    SET @subString = SUBSTRING(@subString, @startPos, LEN(@subString) - @startPos + 1);

    -- Find the end of the numeric sequence (first non-0-9.-)
    -- Note: Allows one ''.'' and leading ''-'', but stops at other chars
    DECLARE @endPos INT = PATINDEX(''%[^0-9.-]%'', @subString);

    -- Extract the candidate number
    SET @extracted = CASE 
        WHEN @endPos > 0 THEN LEFT(@subString, @endPos - 1)
        ELSE @subString 
    END;

    -- Validate: Ensure at most one ''.'', and not just ''-'' or ''.''
    IF LEN(@extracted) = 0 OR @extracted = ''-'' OR @extracted = ''.'' OR LEN(REPLACE(@extracted, ''.'', '''')) < LEN(@extracted) - 1
        RETURN NULL;

    -- Safely cast and return (returns NULL if invalid)
    RETURN TRY_CAST(@extracted AS FLOAT);
END;
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Alloy_GL_Inv]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Alloy_GL_Inv]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


/****** Object:  User Defined Function dbo.f_Alloy_Surcharge    Script Date: 12/6/2005 1:08:34 PM ******/
CREATE FUNCTION [dbo].[f_Alloy_GL_Inv]
(
@cAlloy char(12)
)
RETURNS INT
AS

--SELECT dbo.f_Alloy_GL_Inv(''HPA N60'')
--[Alloy] ''Misc        '' [GL_Sales] = 44400

BEGIN
DECLARE @GL_Return INT = 0

SELECT @GL_Return = GL_Inv FROM dbo.Alloy_GL WHERE TRIM(Alloy) = TRIM(@cAlloy)

RETURN @GL_Return
END



--GRANT EXECUTE ON [dbo].[f_Alloy_GL_Inv] TO [WINDFALL\HPA] AS [dbo];




' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Alloy_Surcharge]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Alloy_Surcharge]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


/****** Object:  User Defined Function dbo.f_Alloy_Surcharge    Script Date: 12/6/2005 1:08:34 PM ******/
CREATE FUNCTION [dbo].[f_Alloy_Surcharge]
(
@cAlloy char(12)
)
RETURNS REAL
AS

--SELECT dbo.f_Alloy_Surcharge(''HPA N60'')
BEGIN
DECLARE @lnSurcharge REAL
DECLARE @lnNiSC DECIMAL(9,6)
DECLARE @lnCoSC DECIMAL(9,6)
DECLARE @lnCrSC DECIMAL(9,6)
DECLARE @lnCuSC DECIMAL(9,6)
DECLARE @lnMoSC DECIMAL(9,6)
DECLARE @lnFeSC DECIMAL(9,6)
DECLARE @lnTiSC DECIMAL(9,6)

SELECT TOP 1 @lnNiSC = [Ni], 
	@lnCoSC = [Co], 
	@lnCrSC = [Cr], 
	@lnCuSC = [Cu],
	@lnMoSC = [Mo], 
	@lnFeSC = [Fe], 
	@lnTiSC = [Ti] 
	FROM [dbo].[AlloySurcharge]

DECLARE @lnNi DECIMAL(9,9)
DECLARE @lnCo DECIMAL(9,9)
DECLARE @lnCr DECIMAL(9,9)
DECLARE @lnCu DECIMAL(9,9)
DECLARE @lnMo DECIMAL(9,9)
DECLARE @lnFe DECIMAL(9,9)
DECLARE @lnTi DECIMAL(9,9)

SELECT TOP 1 @lnNi = [Ni], 
	@lnCo = [Co], 
	@lnCr = [Cr], 
	@lnCu = [Cu], 
	@lnMo = [Mo], 
	@lnFe = [Fe], 
	@lnTi = [Ti] 
	FROM [dbo].[Alloy] 
	WHERE [alloy] = dbo.AlloyName(@cAlloy)
	--AND [Surcharge] = 1
--The Surcharge flag has not been set yet in the Alloy table.

DECLARE @lnNiP REAL
DECLARE @lnCoP REAL
DECLARE @lnCrP REAL
DECLARE @lnCuP REAL
DECLARE @lnMoP REAL
DECLARE @lnFeP REAL
DECLARE @lnTiP REAL

SET @lnNiP = @lnNiSC * ISNULL(@lnNi,0)
SET @lnCoP = @lnCoSC * ISNULL(@lnCo,0)
SET @lnCrP = @lnCrSC * ISNULL(@lnCr,0)
SET @lnCuP = @lnCuSC * ISNULL(@lnCu,0)
SET @lnMoP = @lnMoSC * ISNULL(@lnMo,0)
SET @lnFeP = @lnFeSC * ISNULL(@lnFe,0)
SET @lnTiP = @lnTiSC * ISNULL(@lnTi,0)

SET @lnSurcharge = ISNULL( @lnNiP , 0) 
	+ ISNULL( @lnCoP, 0) 
	+ ISNULL( @lnCrP, 0) 
	+ ISNULL( @lnCuP, 0)
	+ ISNULL( @lnMoP, 0) 
	+ ISNULL( @lnFeP, 0) 
	+ ISNULL( @lnTiP, 0)

RETURN (@lnSurcharge)
END




--GRANT EXECUTE ON [dbo].[f_Alloy_Surcharge] TO [WINDFALL\HPA] AS [dbo];





' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_AreCertsValid]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_AreCertsValid]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
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
		,@VQS_NotRequired bit = 0
		,@Category nvarchar(50) = ''''

	-- Add the T-SQL statements to compute the return value here
	declare MyCursor cursor STATIC for 
		SELECT TOP 1000 vf.[VendorFileExpirationDate], v.[VQS_NotRequired], vf.[VendorFileCategory]
			FROM [dbo].[NR_VendorFile] vf
			JOIN [dbo].[NR_Vendor] v on vf.VendCode = v.VendCode
			WHERE vf.VendCode = @vendCode
	open MyCursor
	FETCH NEXT FROM MyCursor INTO @expirationDate, @VQS_NotRequired, @Category

	-- Added 03/29/2017 (Brandon van de Venter) - This should set the value to 0 if the Vendor does not have any files. Files should not be considered OK if there are none, as stated by Dave Morrow. 
	if (@@FETCH_STATUS = -1) 
	BEGIN
		SET @filesOK = 0;
	END

	while @@FETCH_STATUS = 0 
	begin
		if (CONVERT(date,@expirationDate) <= CONVERT(date,GETDATE()))
		BEGIN
			if (@Category != ''Vendor Performance Reports'' OR (@Category = ''Vendor Performance Reports'' AND @VQS_NotRequired = 0))
			BEGIN
				SET @filesOK = 0;
				break;
			END
		END
		FETCH NEXT FROM MyCursor INTO @expirationDate, @VQS_NotRequired, @Category
	end
	close MyCursor
	DEALLOCATE MyCursor

	--SELECT @filesOK as ''Files OK?''
	-- Return the result of the function
	RETURN @filesOK

END

--GRANT EXECUTE ON [dbo].[f_AreCertsValid] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_BandSaw_Price]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_BandSaw_Price]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[f_BandSaw_Price]
(
@nDia Decimal(10,4)
)
RETURNS DECIMAL(7,2)
AS
BEGIN


--SELECT dbo.f_BandSaw_Price(1)

declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @nPrice DECIMAL(7,2) = 0

-- $.3 per SQR Inch
IF @nDia > 650
	SET @nPrice = 0
ELSE
IF @nDia > 0
	SET @nPrice = CAST( (3.14156 * (@nDia/2)*(@nDia/2)* .300 ) AS DECIMAL(7,2))


RETURN @nPrice
END



--GRANT EXECUTE ON [dbo].[f_BandSaw_Price] TO [WINDFALL\HPA] AS [dbo];
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_BestDate]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_BestDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_BestDate]
(
@Date1 DateTime
,@Date2 DateTime
)
RETURNS DateTime

--returns the better Date
-- Date1 First
-- If Date1 is empty, returns Date2
-- IF both dates are NULL, returns date=''''	not ''1900-01-01 00:00:00.000''
--Never return NULL

AS
BEGIN

--SELECT dbo.f_BestDate (Due_Min,Due_Max)
--SELECT dbo.f_BestDate (''1900-01-01 00:00:00.000'',''2013-05-13 00:00:00.000'')
--SELECT dbo.f_BestDate ('''',''2013-05-13 00:00:00.000'')
--SELECT dbo.f_BestDate (''1900-01-01 00:00:00.000'',''1900-01-01 00:00:00.000'')
--SELECT dbo.f_BestDate (''2014-05-13 00:00:00.000'',''2013-05-13 00:00:00.000'')
--SELECT dbo.f_BestDate (NULL,''2013-05-13 00:00:00.000'')
--SELECT dbo.f_BestDate (NULL,NULL)

DECLARE @dtReturn DateTime
SET @dtReturn = ''''

declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @lGood1 BIT
SET @lGood1 = 1
DECLARE @lGood2 BIT
SET @lGood2 = 1

IF @Date1 IS NULL
	SET @lGood1 = 0

IF @Date1 = ''1900-01-01 00:00:00.000''
	SET @lGood1 = 0

IF @Date1 = ''''
	SET @lGood1 = 0

IF @Date2 IS NULL
	SET @lGood2 = 0

IF @Date2 = ''1900-01-01 00:00:00.000''
	SET @lGood2 = 0

IF @Date2 = ''''
	SET @lGood2 = 0

IF @lGood1 = 1
	begin
	SET @dtReturn = @Date1
	end
ELSE
	IF @lGood2 = 1
		begin
		SET @dtReturn = @Date2
		end
	ELSE
		begin
		--SET @dtReturn = NULL
		SET @dtReturn = ''''
		end
		
		
RETURN @dtReturn
END

--GRANT EXECUTE ON [dbo].[f_BestDate] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Bracket_Pounds]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Bracket_Pounds]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[f_Bracket_Pounds]
(	
	@Bracket TINYINT
)
RETURNS  INT

AS
BEGIN

--Print dbo.f_Bracket_Pounds(nBracket)
--Print dbo.f_Pound_Bracket(sWeight)

DECLARE @MaxLBS INT = 0

IF @Bracket   = 0
	SET @MaxLBS = 5
ELSE
IF @Bracket = 1
	SET @MaxLBS = 10
ELSE
IF @Bracket = 2
	SET @MaxLBS = 20
ELSE
IF @Bracket   = 3
	SET @MaxLBS = 50
ELSE
IF @Bracket   = 4
	SET @MaxLBS = 100
ELSE
IF @Bracket   = 5
	SET @MaxLBS = 200
ELSE
IF @Bracket   = 6
	SET @MaxLBS = 500
ELSE
IF @Bracket   = 7
	SET @MaxLBS = 1000
ELSE
IF @Bracket   = 8
	SET @MaxLBS = 2000
ELSE
IF @Bracket   = 9
	SET @MaxLBS = 5000
ELSE
	SET @MaxLBS   = 0
	
--Bracket 0 is Bracket 5, the most expensive!
	
RETURN @MaxLBS
END

--GRANT EXECUTE ON [dbo].[f_Bracket_Pounds] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Branch_Form]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Branch_Form]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
Create FUNCTION [dbo].[f_Branch_Form] 
(
@Form char(2)
)
RETURNS char(1)
AS
BEGIN
--Returns Branch Initial by Form

--SELECT dbo.f_Branch_Form(''10'')

DECLARE @cBranch char(1)
SET @cBranch = '' ''

SELECT TOP 1 @cBranch = Branch FROM dbo.Forms WHERE FormNumber = @Form

RETURN (@cBranch)
END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_BrokerLst_Master_ID_exist]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_BrokerLst_Master_ID_exist]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_BrokerLst_Master_ID_exist] 
(
@ID INT
)
RETURNS INT
--SELECT dbo.f_BrockerLst_Master_ID_exist(1000)
AS
BEGIN
DECLARE @nCount INT
SET @nCount=0

IF EXISTS(SELECT * FROM dbo.BrokerLst_Master WHERE ID = @ID)
	SET @nCount=1
	
RETURN (@nCount)
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_BrokerLstIDform]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_BrokerLstIDform]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


create  FUNCTION [dbo].[f_BrokerLstIDform] 
(
@ID AS INT
)

RETURNS CHAR(2)
AS
BEGIN

DECLARE @Form AS CHAR(2)
DECLARE @nCount AS INT

SELECT @nCount = COUNT(*) FROM dbo.BrokerLst_Master WHERE ID = @ID

IF @nCount > 0
	SELECT @Form = Form FROM dbo.BrokerLst_Master WHERE ID = @ID
ELSE
	SELECT @Form = Form FROM dbo.BrokerLst_Master_History WHERE ID = @ID

RETURN @Form 
END




--GRANT EXECUTE ON [dbo].[f_BrokerLstIDform] TO [WINDFALL\HPA] AS [dbo];
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Build_Recollect_DocumentPath]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Build_Recollect_DocumentPath]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'Create FUNCTION [dbo].[f_Build_Recollect_DocumentPath]
 (
         @DocumentID INT
 )
 RETURNS VARCHAR(400)
 AS
 BEGIN
         DECLARE @ReturnPath VARCHAR(400) 
;WITH DirectoryPathCTE(DocumentID, FolderID, ParentFolderID, DocumentName, FolderName, LevelNumber)
         AS
         (
         SELECT
                DocumentID, f.FolderID, ParentFolderID, DocumentName, f.FolderName, 0
         FROM
                dbo.Recolect_Documents d
                INNER JOIN dbo.Recolect_Folders f on d.FolderID = f.FolderID
         WHERE
                DocumentID = @DocumentID
         UNION ALL
         SELECT
                DocumentID, f.FolderID, f.ParentFolderID, DocumentName, f.FolderName, p.LevelNumber + 1
         FROM
                dbo.Recolect_Folders f
                INNER JOIN DirectoryPathCTE p on p.ParentFolderID = f.FolderID
         )
         SELECT @ReturnPath =
         (
                SELECT
                   FolderName + '''' + CASE WHEN LevelNumber = 0 THEN DocumentName ELSE '''' END
                FROM
                        DirectoryPathCTE p
                ORDER BY LevelNumber DESC
                FOR XML PATH('''')
         )      

         RETURN(@ReturnPath)     

 END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Calc_Acct_QTY]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Calc_Acct_QTY]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[f_Calc_Acct_QTY]
(	
	@Alloy CHAR(12)
	,@Form  CHAR(2)
	,@Pieces INT
	,@Thck Decimal(10,4)
	,@Sz2 Decimal(9,3)
	,@Sz3 Decimal(9,3)
	,@OtherFld CHAR(10)

)
RETURNS MONEY	--HPA Acct Stnd
AS
BEGIN


--like Proc_SQL:f_Get_Units
--Print dbo.f_Calc_Acct_QTY(Alloy,Form,Pieces,Thck,Sz2,Sz3,OtherFld)
--Print dbo.f_Calc_Acct_QTY(''L605'',''21'',1000,.125,36,0,'''')
--dbo.f_Calc_Acct_QTY(Alloy,Form,PC,Dim1,Dim2,Dim3,OtherFld) AS f_Calc_QTY
--
declare @err int,
        @RC int

set @err = 0
set @rc = 0


--SELECT TOP 1 @Form=Form, @Pieces=Pieces, @Sz2=Sz2, @Sz3=Sz3, @Weight=[Weight] FROM dbo.AllQuotes WHERE SOitem = @SOitem

DECLARE @PU TinyInt
SELECT @PU = dbo.f_GetFormPU(@Form)
--PRINT  dbo.f_GetFormPU(''21'') --1

DECLARE @ByFoot Money
SET @ByFoot = 
	CASE WHEN dbo.f_GetForm_use3rdDim( @Form ) = 1
		THEN (@Pieces * @Sz3 / 12) 
		ELSE (@Pieces * @Sz2 / 12) 	END



DECLARE @QTY Money
SET @QTY = 0

--PRINT dbo.f_GetWeight(1000,''L605'',''10'',.125,36,0)  --174.6

SET @QTY = 
	CASE WHEN @OtherFld = ''Per Inch'' THEN @ByFoot*12 ELSE 
	 CASE WHEN @OtherFld = ''Per kg'' THEN dbo.f_GetWeight(@Pieces,@Alloy,@Form,@Thck,@Sz2,@Sz3)/2.205 ELSE 
	  CASE WHEN @PU = 1 THEN dbo.f_GetWeight(@Pieces,@Alloy,@Form,@Thck,@Sz2,@Sz3) ELSE 
	   CASE WHEN @PU = 2 THEN @ByFoot ELSE
	    CASE WHEN @PU = 3 THEN @Pieces ELSE
		 CASE WHEN @PU = 4 THEN 1 ELSE
		  CASE WHEN @PU = 5 THEN  @ByFoot*12 ELSE
		   CASE WHEN @PU = 6 THEN dbo.f_GetWeight(@Pieces,@Alloy,@Form,@Thck,@Sz2,@Sz3)/2.205 ELSE
		    CASE WHEN @PU = 7 THEN @ByFoot/3.281 END
		   END
		  END
		 END
	    END
	   END 
	  END 
	 END
	END



IF ISNULL(@QTY,0) = 0
	SET @QTY = 1
				
RETURN @QTY
END

--GRANT EXECUTE ON [dbo].[f_Calc_Acct_QTY] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Calc_Acct_QTY_SOitem]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Calc_Acct_QTY_SOitem]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


Create FUNCTION [dbo].[f_Calc_Acct_QTY_SOitem]	
( @SOitem CHAR(10)
)

RETURNS MONEY	--HPA Acct Stnd
AS
BEGIN


--like Proc_SQL:f_Get_Units
--Print dbo.f_Calc_Acct_QTY(Alloy,Form,Pieces,Thck,Sz2,Sz3,OtherFld)
--Print dbo.f_Calc_Acct_QTY(''L605'',''21'',1000,.125,36,0,'''')
--dbo.f_Calc_Acct_QTY(Alloy,Form,PC,Dim1,Dim2,Dim3,OtherFld) AS f_Calc_QTY
--
declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @QTY DECIMAL(9,2) = 0

SELECT @QTY = dbo.f_Calc_Acct_QTY(Alloy,Form,Pieces,Thck,Sz2,Sz3,OtherFld)
  FROM dbo.AllQuotes WHERE SOitem= @SOitem


IF ISNULL(@QTY,0) = 0
	SET @QTY = 1
				
RETURN @QTY
END

--GRANT EXECUTE ON [dbo].[f_Calc_Acct_QTY_SOitem] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Calc_CW]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Calc_CW]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Calc_CW] 
(
@nDiaIn DECIMAL(10,4),
@nDiaOut DECIMAL(10,4)
)

RETURNS DECIMAL(5,4)
AS
BEGIN
--PRINT dbo.[f_Calc_CW](.3,.25)
--PRINT dbo.[f_Calc_CW](dbo.f_Get_Next_Dia(Dia),Dia)
--Calculate ColdWork on Diameter CW
--SET NOCOUNT ON
--[ A0-Af ] / A0

IF @nDiaIn*@nDiaOut = 0
	RETURN 0

IF @nDiaIn<=@nDiaOut
	RETURN 0

DECLARE @nCW DECIMAL(5,4)

SET @nCW = CAST(((@nDiaIn*@nDiaIn)-(@nDiaOut*@nDiaOut))/ (@nDiaIn*@nDiaIn) AS DECIMAL(5,4))

RETURN ISNULL(@nCW,0)
END


-- GRANT EXECUTE ON [dbo].[f_Calc_CW] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Calc_CW_Input]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Calc_CW_Input]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Calc_CW_Input] 
(
@nWorkSize DECIMAL(10,4),
@nlevel TinyInt
)

RETURNS DECIMAL(10,4)
AS
BEGIN
--PRINT dbo.[f_Calc_CW_Input](0.3,4)  --.4110
--PRINT dbo.[f_Calc_CW_Input](1.3,4)  --.4370
--PRINT dbo.[f_Calc_CW_Input](2.3,4)  --.4760

--Calculate ColdWork and sSize to achieve Level
--Does not return a Standard Dia
--USE dbo.f_Calc_CW_Stand_sSize(2,.05,.42)(WorkDia,+Tol,CW) to get a bar standard Dia

--SET NOCOUNT ON
--[ A0-Af ] / A0

IF @nWorkSize= 0
	RETURN 0

IF @nlevel < 1 or @nlevel > 6
	RETURN 0

DECLARE @nColdWork DECIMAL(4,3) = 0
SET @nColdWork = dbo.f_Calc_CW_Level(@nWorkSize,@nlevel)  --.4110

IF @nColdWork > 0
	-- ColdWork = [ A0-Af ] / A0 = [1 -Af/ A0 ] 
	--                      ColdWork * A0 = 1-Af
	-- StartSize A0 = (1-Af)/ColdWork
	--SET @nCW = CAST(((@nDiaIn*@nDiaIn)-(@nDiaOut*@nDiaOut))/ (@nDiaIn*@nDiaIn) AS DECIMAL(5,4))

	DECLARE @nsSize decimal(10,3) = 0
	--sSize = WorkSize / √(1 - ColdWork)
	SET @nsSize = @nWorkSize / SQRT(1-@nColdWork)

	--@nStandDia = dbo.f_Calc_CW_Stand_sSize(@nsSize,.05,@nColdWork)

RETURN ISNULL(@nsSize,0)
END


-- GRANT EXECUTE ON [dbo].[f_Calc_CW_Input] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Calc_CW_Level]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Calc_CW_Level]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Calc_CW_Level] 
(
@nWorkSize DECIMAL(10,4),
@nlevel TinyInt
)

RETURNS DECIMAL(10,3)
AS
BEGIN
--PRINT dbo.[f_Calc_CW_Level](0.3,4)  --.4110
--PRINT dbo.[f_Calc_CW_Level](1.3,4)  --.4370
--PRINT dbo.[f_Calc_CW_Level](2.3,4)  --.4760

--Calculate ColdWork to achieve Level
--See SELECT dbo.f_Is_GFMlot_toSpec(4800,''HPA-MS-102                    '','''') AS MS_102
-- to list the Level


--SET NOCOUNT ON
--[ A0-Af ] / A0

IF @nWorkSize= 0
	RETURN 0

IF @nlevel < 1 or @nlevel > 6
	RETURN 0

DECLARE @nColdWork DECIMAL(4,3) = 0

IF @nWorkSize < .5
	begin
	--PRINT ''0-0.5''

	IF @nlevel = 1
		SET @nColdWork = .147

	ELSE IF @nlevel = 2
		SET @nColdWork = .279

	ELSE IF @nlevel = 3
		SET @nColdWork = .350

	ELSE IF @nlevel = 4
		SET @nColdWork = .411

	ELSE IF @nlevel = 5
		SET @nColdWork = .542

	ELSE IF @nlevel = 6
		SET @nColdWork = .610

	end
ELSE IF @nWorkSize >= .5 AND @nWorkSize < 1
	begin
	--PRINT ''0.5-1''

	IF @nlevel = 1
		SET @nColdWork = .139

	ELSE IF @nlevel = 2
		SET @nColdWork = .214

	ELSE IF @nlevel = 3
		SET @nColdWork = .326

	ELSE IF @nlevel = 4
		SET @nColdWork = .401

	ELSE IF @nlevel = 5
		SET @nColdWork = .494

	ELSE IF @nlevel = 6
		SET @nColdWork = .540

	end 
ELSE IF @nWorkSize >= 1 AND @nWorkSize < 1.5
	begin
	--PRINT ''1-1.5''

	IF @nlevel = 1
		SET @nColdWork = .120

	ELSE IF @nlevel = 2
		SET @nColdWork = .233

	ELSE IF @nlevel = 3
		SET @nColdWork = .338

	ELSE IF @nlevel = 4
		SET @nColdWork = .437

	ELSE IF @nlevel = 5
		SET @nColdWork = .497

	ELSE IF @nlevel = 6
		SET @nColdWork = .526

	end 
ELSE IF @nWorkSize >= 1.5 AND @nWorkSize < 2
	begin
	--PRINT ''1.5-2''
	
	IF @nlevel = 1
		SET @nColdWork = .148

	ELSE IF @nlevel = 2
		SET @nColdWork = .226

	ELSE IF @nlevel = 3
		SET @nColdWork = .364

	ELSE IF @nlevel = 4
		SET @nColdWork = .486

	ELSE IF @nlevel = 5
		SET @nColdWork = .509

	ELSE IF @nlevel = 6
		SET @nColdWork = .56


	end 
ELSE IF @nWorkSize >= 2 AND @nWorkSize < 2.5
	begin
	--PRINT ''2-2.5''

	IF @nlevel = 1
		SET @nColdWork = .141

	ELSE IF @nlevel = 2
		SET @nColdWork = .270

	ELSE IF @nlevel = 3
		SET @nColdWork = .362

	ELSE IF @nlevel = 4
		SET @nColdWork = .476

	ELSE IF @nlevel = 5
		SET @nColdWork = .51

	ELSE IF @nlevel = 6
		SET @nColdWork = .55


	end 

ELSE IF @nWorkSize >= 2.5 AND @nWorkSize < 3
	begin
	--PRINT ''2.5-3''
	
	IF @nlevel = 1
		SET @nColdWork = .126

	ELSE IF @nlevel = 2
		SET @nColdWork = .265

	ELSE IF @nlevel = 3
		SET @nColdWork = .362

	ELSE IF @nlevel = 4
		SET @nColdWork = .422

	ELSE IF @nlevel = 5
		SET @nColdWork = .48

	ELSE IF @nlevel = 6
		SET @nColdWork = .55


	end 
ELSE IF @nWorkSize >= 3 AND @nWorkSize < 3.5
	begin
	--PRINT ''3-3.5''
	
	IF @nlevel = 1
		SET @nColdWork = .148

	ELSE IF @nlevel = 2
		SET @nColdWork = .240

	ELSE IF @nlevel = 3
		SET @nColdWork = .382

	ELSE IF @nlevel = 4
		SET @nColdWork = .45

	ELSE IF @nlevel = 5
		SET @nColdWork = .49

	ELSE IF @nlevel = 6
		SET @nColdWork = .55

	end 
ELSE IF @nWorkSize >= 3.5 AND @nWorkSize < 4
	begin
	--PRINT ''3.5-4''
	
	IF @nlevel = 1
		SET @nColdWork = .168

	ELSE IF @nlevel = 2
		SET @nColdWork = .28

	ELSE IF @nlevel = 3
		SET @nColdWork = .33

	ELSE IF @nlevel = 4
		SET @nColdWork = .42

	ELSE IF @nlevel = 5
		SET @nColdWork = .48

	ELSE IF @nlevel = 6
		SET @nColdWork = .55

	end 

ELSE IF @nWorkSize >= 4 AND @nWorkSize < 4.5
	begin
	--PRINT ''4-4.5''
	
	IF @nlevel = 1
		SET @nColdWork = .15

	ELSE IF @nlevel = 2
		SET @nColdWork = .206

	ELSE IF @nlevel = 3
		SET @nColdWork = .269

	ELSE IF @nlevel = 4
		SET @nColdWork = .43

	ELSE IF @nlevel = 5
		SET @nColdWork = .48

	ELSE IF @nlevel = 6
		SET @nColdWork = .55

	end 
/*ELSE IF @nWorkSize >= 4.5 AND @nWorkSize < 5
	begin
	--PRINT ''4.5-5''
	end 

ELSE IF @nWorkSize >= 5 AND @nWorkSize < 5.5
	begin
	--PRINT ''5-5.5''
	end 
ELSE IF @nWorkSize >= 5.5 AND @nWorkSize < 6
	begin
	--PRINT ''5.5-6''
	end 
*/



RETURN ISNULL(@nColdWork,0)
END


-- GRANT EXECUTE ON [dbo].[f_Calc_CW_Level] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Calc_CW_Stand_sSize]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Calc_CW_Stand_sSize]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Calc_CW_Stand_sSize] 
(
@nWorkDia DECIMAL(10,3),
@nFinishTol DECIMAL(4,3),
@nColdWork DECIMAL(4,3)
)

RETURNS DECIMAL(10,3)
AS
BEGIN
--PRINT dbo.[f_Calc_CW_Stand_sSize](2,.005,.42)
--PRINT dbo.[f_Calc_CW_Stand_sSize](1,.080,.42)

--get Standard Start Size on (Diameter + Tol) * ColdWork


	DECLARE @nsSize decimal(10,3) = 0
	DECLARE @nsSizeStnd decimal(10,3) = 0
	--sSize = WorkSize / √(1 - ColdWork)
	SET @nsSize = (@nWorkDia+@nFinishTol) / SQRT(1-@nColdWork)
	SET @nsSizeStnd = dbo.f_StandardSizePlus(@nsSize)

RETURN ISNULL(@nsSizeStnd,0)
END


-- GRANT EXECUTE ON [dbo].[f_Calc_CW_Stand_sSize] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Calc_Dia_Work]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Calc_Dia_Work]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Calc_Dia_Work] 
(
@nDiaIn DECIMAL(10,4),
@nDiaOut DECIMAL(10,4)
)

RETURNS DECIMAL(5,4)
AS
BEGIN
--PRINT dbo.f_Calc_Dia_Work(.3,.25)
--PRINT dbo.f_Calc_Dia_Work(dbo.f_Get_Next_Dia(Dia),Dia)

--SET NOCOUNT ON
--[ A0-Af ] / A0

IF @nDiaIn*@nDiaOut = 0
	RETURN 0

IF @nDiaIn<=@nDiaOut
	RETURN 0

DECLARE @nCW DECIMAL(5,4)

SET @nCW = CAST(((@nDiaIn*@nDiaIn)-(@nDiaOut*@nDiaOut))/ (@nDiaIn*@nDiaIn) AS DECIMAL(5,4))

RETURN ISNULL(@nCW,0)
END


-- GRANT EXECUTE ON [dbo].[f_Calc_Dia_Work] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Calc_GFM_CW_Time]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Calc_GFM_CW_Time]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David Kirchner
-- Create date: 7/3/2023
-- Description:	Calculates the GFM Time, Minutes per Pound
-- Charley got data from Russ
-- =============================================
CREATE FUNCTION [dbo].[f_Calc_GFM_CW_Time]
(
	@StartDiameter decimal(6,4)
	,@ColdWork Decimal(3,2)
)
RETURNS decimal(5,2)
--Minutes per Pound

AS

--SELECT dbo.f_Calc_GFM_CW_Time(2,.35) =1.3
--SELECT dbo.f_Calc_GFM_CW_Time(3,.35) =.75
--SELECT dbo.f_Calc_GFM_CW_Time(1.12,.18) =.88


BEGIN
	-- Declare the return variable here
	DECLARE @WorkTime decimal(5,2) = 0

	IF @ColdWork >= 1 or @ColdWork <= 0  --Must be a fraction as percentage
		RETURN @WorkTime

	-- Add the T-SQL statements to compute the return value here
	IF @StartDiameter > 3.1
		SET @WorkTime = 0
	ELSE
	IF @StartDiameter >= 2.75

		begin
		IF @ColdWork <= .10
			SET @WorkTime = .19
		ELSE
		IF @ColdWork <= .15
			SET @WorkTime = .22
		ELSE
		IF @ColdWork <= .20
			SET @WorkTime = .24
		ELSE
		IF @ColdWork <= .25
			SET @WorkTime = .27
		ELSE
		IF @ColdWork <= .30
			SET @WorkTime = .35
		ELSE
		IF @ColdWork <= .35
			SET @WorkTime = .75
		ELSE
		IF @ColdWork <= .40
			SET @WorkTime = 1.2
		ELSE
		IF @ColdWork <= .45
			SET @WorkTime = 1.6
		ELSE
		IF @ColdWork <= .50
			SET @WorkTime = 2
		ELSE
		IF @ColdWork <= .60
			SET @WorkTime = 3

		end
	ELSE
	IF @StartDiameter >= 2.5

		begin
		IF @ColdWork <= .10
			SET @WorkTime = .2
		ELSE
		IF @ColdWork <= .15
			SET @WorkTime = .23
		ELSE
		IF @ColdWork <= .20
			SET @WorkTime = .27
		ELSE
		IF @ColdWork <= .25
			SET @WorkTime = .30
		ELSE
		IF @ColdWork <= .30
			SET @WorkTime = .40
		ELSE
		IF @ColdWork <= .35
			SET @WorkTime = .95
		ELSE
		IF @ColdWork <= .40
			SET @WorkTime = 1.3
		ELSE
		IF @ColdWork <= .45
			SET @WorkTime = 1.9
		ELSE
		IF @ColdWork <= .50
			SET @WorkTime = 2.2
		ELSE
		IF @ColdWork <= .60
			SET @WorkTime = 3.2

		end
	ELSE
	IF @StartDiameter >= 2.25

		begin
		IF @ColdWork <= .10
			SET @WorkTime = .22
		ELSE
		IF @ColdWork <= .15
			SET @WorkTime = .27
		ELSE
		IF @ColdWork <= .20
			SET @WorkTime = .34
		ELSE
		IF @ColdWork <= .25
			SET @WorkTime = .40
		ELSE
		IF @ColdWork <= .30
			SET @WorkTime = .45
		ELSE
		IF @ColdWork <= .35
			SET @WorkTime = 1.05
		ELSE
		IF @ColdWork <= .40
			SET @WorkTime = 1.45
		ELSE
		IF @ColdWork <= .45
			SET @WorkTime = 2.25
		ELSE
		IF @ColdWork <= .50
			SET @WorkTime = 2.45
		ELSE
		IF @ColdWork <= .60
			SET @WorkTime = 3.4

		end
	ELSE
	IF @StartDiameter >= 2

		begin
		IF @ColdWork <= .10
			SET @WorkTime = .3
		ELSE
		IF @ColdWork <= .15
			SET @WorkTime = .35
		ELSE
		IF @ColdWork <= .20
			SET @WorkTime = .44
		ELSE
		IF @ColdWork <= .25
			SET @WorkTime = .58
		ELSE
		IF @ColdWork <= .30
			SET @WorkTime = .65
		ELSE
		IF @ColdWork <= .35
			SET @WorkTime = 1.3
		ELSE
		IF @ColdWork <= .40
			SET @WorkTime = 2
		ELSE
		IF @ColdWork <= .45
			SET @WorkTime = 2.43
		ELSE
		IF @ColdWork <= .50
			SET @WorkTime = 2.75
		ELSE
		IF @ColdWork <= .60
			SET @WorkTime = 3.75

		end
	ELSE
	IF @StartDiameter >= 1.75

		begin
		IF @ColdWork <= .10
			SET @WorkTime = .38
		ELSE
		IF @ColdWork <= .15
			SET @WorkTime = .41
		ELSE
		IF @ColdWork <= .20
			SET @WorkTime = .52
		ELSE
		IF @ColdWork <= .25
			SET @WorkTime = .72
		ELSE
		IF @ColdWork <= .30
			SET @WorkTime = .8
		ELSE
		IF @ColdWork <= .35
			SET @WorkTime = 1.5
		ELSE
		IF @ColdWork <= .40
			SET @WorkTime = 2.2
		ELSE
		IF @ColdWork <= .45
			SET @WorkTime = 2.7
		ELSE
		IF @ColdWork <= .50
			SET @WorkTime = 3.05
		ELSE
		IF @ColdWork <= .60
			SET @WorkTime = 4.05

		end
	ELSE
	IF @StartDiameter >= 1.5

		begin
		IF @ColdWork <= .10
			SET @WorkTime = .43
		ELSE
		IF @ColdWork <= .15
			SET @WorkTime = .47
		ELSE
		IF @ColdWork <= .20
			SET @WorkTime = .61
		ELSE
		IF @ColdWork <= .25
			SET @WorkTime = .90
		ELSE
		IF @ColdWork <= .30
			SET @WorkTime = 1.08
		ELSE
		IF @ColdWork <= .35
			SET @WorkTime = 1.75
		ELSE
		IF @ColdWork <= .40
			SET @WorkTime = 2.5
		ELSE
		IF @ColdWork <= .45
			SET @WorkTime = 3
		ELSE
		IF @ColdWork <= .50
			SET @WorkTime = 3.5
		ELSE
		IF @ColdWork <= .60
			SET @WorkTime = 4.5

		end
	ELSE
	IF @StartDiameter >= 1.25

		begin
		IF @ColdWork <= .10
			SET @WorkTime = .5
		ELSE
		IF @ColdWork <= .15
			SET @WorkTime = .61
		ELSE
		IF @ColdWork <= .20
			SET @WorkTime = .75
		ELSE
		IF @ColdWork <= .25
			SET @WorkTime = 1.1
		ELSE
		IF @ColdWork <= .30
			SET @WorkTime = 1.4
		ELSE
		IF @ColdWork <= .35
			SET @WorkTime = 1.95
		ELSE
		IF @ColdWork <= .40
			SET @WorkTime = 2.8
		ELSE
		IF @ColdWork <= .45
			SET @WorkTime = 3.3
		ELSE
		IF @ColdWork <= .50
			SET @WorkTime = 3.9
		ELSE
		IF @ColdWork <= .60
			SET @WorkTime = 4.9

		end
	ELSE
	IF @StartDiameter >= 1.0

		begin
		IF @ColdWork <= .10
			SET @WorkTime = .6
		ELSE
		IF @ColdWork <= .15
			SET @WorkTime = .72
		ELSE
		IF @ColdWork <= .20
			SET @WorkTime = .88
		ELSE
		IF @ColdWork <= .25
			SET @WorkTime = 1.4
		ELSE
		IF @ColdWork <= .30
			SET @WorkTime = 1.7
		ELSE
		IF @ColdWork <= .35
			SET @WorkTime = 2.25
		ELSE
		IF @ColdWork <= .40
			SET @WorkTime = 3.0
		ELSE
		IF @ColdWork <= .45
			SET @WorkTime = 3.7
		ELSE
		IF @ColdWork <= .50
			SET @WorkTime = 4.35
		ELSE
		IF @ColdWork <= .60
			SET @WorkTime = 5.35

		end
	ELSE
	IF @StartDiameter >= .75

		begin
		IF @ColdWork <= .10
			SET @WorkTime = .7
		ELSE
		IF @ColdWork <= .15
			SET @WorkTime = .85
		ELSE
		IF @ColdWork <= .20
			SET @WorkTime = 1.05
		ELSE
		IF @ColdWork <= .25
			SET @WorkTime = 1.7
		ELSE
		IF @ColdWork <= .30
			SET @WorkTime = 2.1
		ELSE
		IF @ColdWork <= .35
			SET @WorkTime = 2.6
		ELSE
		IF @ColdWork <= .40
			SET @WorkTime = 3.35
		ELSE
		IF @ColdWork <= .45
			SET @WorkTime = 4.09
		ELSE
		IF @ColdWork <= .50
			SET @WorkTime = 4.8
		ELSE
		IF @ColdWork <= .60
			SET @WorkTime = 5.8

		end
	ELSE
	IF @StartDiameter >= .5

		begin
		IF @ColdWork <= .10
			SET @WorkTime = .83
		ELSE
		IF @ColdWork <= .15
			SET @WorkTime = 1.05
		ELSE
		IF @ColdWork <= .20
			SET @WorkTime = 1.23
		ELSE
		IF @ColdWork <= .25
			SET @WorkTime = 2.1
		ELSE
		IF @ColdWork <= .30
			SET @WorkTime = 2.5
		ELSE
		IF @ColdWork <= .35
			SET @WorkTime = 3.0
		ELSE
		IF @ColdWork <= .40
			SET @WorkTime = 3.7
		ELSE
		IF @ColdWork <= .45
			SET @WorkTime = 4.55
		ELSE
		IF @ColdWork <= .50
			SET @WorkTime = 5.4
		ELSE
		IF @ColdWork <= .60
			SET @WorkTime = 6.4

		end
	ELSE
	IF @StartDiameter > 0

		begin
		IF @ColdWork <= .10
			SET @WorkTime = 1.15
		ELSE
		IF @ColdWork <= .15
			SET @WorkTime = 1.4
		ELSE
		IF @ColdWork <= .20
			SET @WorkTime = 1.6
		ELSE
		IF @ColdWork <= .25
			SET @WorkTime = 2.4
		ELSE
		IF @ColdWork <= .30
			SET @WorkTime = 3.0
		ELSE
		IF @ColdWork <= .35
			SET @WorkTime = 3.5
		ELSE
		IF @ColdWork <= .40
			SET @WorkTime = 4.05
		ELSE
		IF @ColdWork <= .45
			SET @WorkTime = 5
		ELSE
		IF @ColdWork <= .50
			SET @WorkTime = 6
		ELSE
		IF @ColdWork <= .60
			SET @WorkTime = 7

		end
	


	-- Return the result of the function
	RETURN @WorkTime

END

--GRANT EXECUTE ON [dbo].[f_Calc_GFM_CW_Time] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Calc_GFM_MaxDiameter]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Calc_GFM_MaxDiameter]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Brandon van de Venter
-- Create date: 5/27/2020
-- Description:	Calculates the GFM Hammer Max Diameter
-- =============================================
CREATE FUNCTION [dbo].[f_Calc_GFM_MaxDiameter]
(
	-- Add the parameters for the function here
	@minDiameter decimal(6,4)
)
RETURNS decimal(6,4)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @maxDiameter decimal(6,4) = @minDiameter,
			@range decimal(6,4) = 0

	-- Add the T-SQL statements to compute the return value here
	SELECT TOP(1) @range = cv.Operational_Range
	FROM [dbo].[GFM_Machines_Operational_CalcValues] cv
	WHERE @minDiameter > cv.[Operational_Min_Size] AND @minDiameter <= cv.[Operational_Max_Size]
	order by cv.[Operational_Min_Size] desc

	SET @maxDiameter = @minDiameter + @range;

	-- Return the result of the function
	RETURN @maxDiameter

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Calc_GFM_MinDiameter]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Calc_GFM_MinDiameter]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Brandon van de Venter
-- Create date: 5/27/2020
-- Description:	Calculates the GFM Hammer Min Diameter
-- =============================================
CREATE FUNCTION [dbo].[f_Calc_GFM_MinDiameter]
(
	-- Add the parameters for the function here
	@dieId uniqueidentifier
)
RETURNS decimal(6,4)
AS
BEGIN

	DECLARE @openingHeight decimal(6,4) = 0,
		@dieHeight decimal(6,4) = [dbo].[f_Get_GFM_DieHeight](@dieId)

	SELECT TOP (1) @openingHeight = m.OpeningHeight
	FROM [dbo].[GFM_Machines_Type_Map] mtp
	JOIN [dbo].[GFM_DieSets_Machine_Type_Map] dmtp ON mtp.MTMapID = dmtp.MTypeId
	JOIN [dbo].[GFM_Machines] m ON mtp.GFMId = m.GFMId
	WHERE dmtp.DieID = @dieId
	order by dmtp.[When] desc

	-- Return the result of the function
	RETURN (@openingHeight - (@dieHeight * 2))

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Calc_mS_QTY_BrokerLst_ID]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Calc_mS_QTY_BrokerLst_ID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'



Create FUNCTION [dbo].[f_Calc_mS_QTY_BrokerLst_ID]
(
@ID INT
)
RETURNS Decimal(18,8)
AS
BEGIN
--Get sum QTY of Details of Master ID
--use to keep MWeight bucket filled.

--SELECT dbo.f_GetMWeight_BrokerLst_ID (12345)
DECLARE @MS_QTY Decimal(18,8)

declare @err int,
        @RC int
set @err = 0
set @rc = 0

SET @MS_QTY = 0
--weight is depricated, use S_QTY
SELECT @MS_QTY = SUM(BrokerLst_Detail.S_QTY) 
	FROM dbo.BrokerLst_Detail 
	WHERE [ID] = @ID

RETURN @MS_QTY
END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Calc_mS_QTY_StockLst_ID]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Calc_mS_QTY_StockLst_ID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'



CREATE FUNCTION [dbo].[f_Calc_mS_QTY_StockLst_ID]
(
@ID INT
)
RETURNS Decimal(18,8)
AS
BEGIN
--Get sum Weight of Details of Master ID
--use to keep MWeight bucket filled.

--SELECT dbo.f_Calc_mS_QTY_StockLst_ID (12345)
--SELECT dbo.f_Calc_mS_QTY_StockLst_ID(15920) AS SumS_QTY

-- trigger StockLst_Detail_After_Update uses f_GetMWeight_StockLst_ID(ID)


DECLARE @mS_QTY Decimal(18,8)

declare @err int,
        @RC int
set @err = 0
set @rc = 0

SET @mS_QTY = 0
--weight is depricated, use S_QTY
SELECT @mS_QTY = SUM(StockLst_Detail.S_QTY) 
	FROM dbo.StockLst_Detail 
	WHERE [ID] = @ID

RETURN @mS_QTY
END



--SELECT * FROM dbo.StockLst_Detail 	WHERE [ID] = 15920
--SELECT dbo.f_Calc_QTY(Alloy,Form,PC,Dim1,Dim2,Dim3) AS f_Calc_QTY ,*
--FROM dbo.StockLst_Master M INNER JOIN dbo.StockLst_Detail D ON M.ID = D.ID AND M.ID = 15920
--CalcDetailPricingUnits() GetWeight(nPC,cAlloy,cForm,nDim1,nDim2,nDim3, nConn) EXEC dbo.p_GetWeight' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Calc_mS_QTY_WIPLst_ID]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Calc_mS_QTY_WIPLst_ID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'



CREATE FUNCTION [dbo].[f_Calc_mS_QTY_WIPLst_ID]
(
@ID INT
)
RETURNS Decimal(18,8)
AS
BEGIN
--Get sum Weight of Details of Master ID
--use to keep MWeight bucket filled.

--SELECT dbo.f_Calc_mS_QTY_WIPLst_ID (12345)
DECLARE @mS_QTY Decimal(18,8)

declare @err int,
        @RC int
set @err = 0
set @rc = 0

SET @mS_QTY = 0
--weight is depricated, use S_QTY
SELECT @mS_QTY = SUM(WIPLst_Detail.S_QTY) 
	FROM dbo.WIPLst_Detail 
	WHERE [ID] = @ID

RETURN @mS_QTY
END



--GRANT EXECUTE ON [dbo].[f_BrokerLstIDform] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Calc_QTY]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Calc_QTY]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[f_Calc_QTY]
(	
	@Alloy CHAR(12)
	,@Form  CHAR(2)
	,@Pieces INT
	,@Thck Decimal(10,4)
	,@Sz2 Decimal(9,3)
	,@Sz3 Decimal(9,3)

)
RETURNS MONEY
AS
BEGIN


--like Proc_SQL:f_Get_Units
--Print dbo.f_Calc_QTY(Alloy,Form,Pieces,Thck,Sz2,Sz3)
--dbo.f_Calc_QTY(Alloy,Form,PC,Dim1,Dim2,Dim3) AS f_Calc_QTY
--Return QTY for correct Form PU

-- Called from dbo.p_GetFullQuoteCL

declare @err int,
        @RC int

set @err = 0
set @rc = 0


--SELECT TOP 1 @Form=Form, @Pieces=Pieces, @Sz2=Sz2, @Sz3=Sz3, @Weight=[Weight] FROM dbo.AllQuotes WHERE SOitem = @SOitem

DECLARE @PU TinyInt = 0
SET @PU = dbo.f_GetFormPU(@Form)

DECLARE @ByFoot Money
SET @ByFoot = 
	CASE WHEN dbo.f_GetForm_use3rdDim( @Form ) = 1
		THEN (@Pieces * @Sz3 / 12) 
		ELSE (@Pieces * @Sz2 / 12) 	END



DECLARE @QTY Money = 0

SET @QTY = 
	CASE WHEN @PU = 1 THEN dbo.f_GetWeight(@Pieces,@Alloy,@Form,@Thck,@Sz2,@Sz3) ELSE 
	CASE WHEN @PU = 2 THEN @ByFoot ELSE
	CASE WHEN @PU = 3 THEN @Pieces END END END
			
IF @QTY = 0
	SET @QTY = 1
				
RETURN @QTY
END

--GRANT EXECUTE ON [dbo].[f_Calc_QTY] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Calc_QTY_SOitem]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Calc_QTY_SOitem]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Calc_QTY_SOitem]
( @SOitem CHAR(10)
)
RETURNS INT

AS
BEGIN
--SELECT dbo.f_Calc_QTY_SOitem('' 137477-01'')
--SELECT dbo.f_Calc_QTY_SOitem('' 102377-01'')
--Return QTY for SOitem

declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @nQTY INT = 0

SELECT @nQTY=S_QTY
	FROM dbo.AllQuotes WITH(NOLOCK) WHERE SOitem = @SOitem

RETURN ISNULL(@nQTY,0)
END



--GRANT EXECUTE ON [dbo].[f_Calc_QTY_SOitem] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Calc_QTY3]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Calc_QTY3]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[f_Calc_QTY3]
(	
	@Alloy CHAR(12)
	,@Form  CHAR(2)
	,@Pieces INT
	,@Thck Decimal(10,4)
	,@Sz2 Decimal(9,3)
	,@Sz3 Decimal(9,3)
	,@OtherFld CHAR(10)

)
RETURNS MONEY
AS
BEGIN
-- Adds OtherFeild to f_Calc_QTY 

--like Proc_SQL:f_Get_Units
--Print dbo.f_Calc_QTY3(Alloy,Form,Pieces,Thck,Sz2,Sz3,OtherFld)
--Print dbo.f_Calc_QTY3(''L605'',''21'',1000,.125,36,0,'''')
--dbo.f_Calc_QTY3(Alloy,Form,PC,Dim1,Dim2,Dim3,OtherFld) AS f_Calc_QTY
--
declare @err int,
        @RC int

set @err = 0
set @rc = 0


--SELECT TOP 1 @Form=Form, @Pieces=Pieces, @Sz2=Sz2, @Sz3=Sz3, @Weight=[Weight] FROM dbo.AllQuotes WHERE SOitem = @SOitem

DECLARE @PU TinyInt
SELECT @PU = dbo.f_GetFormPU(@Form)
--PRINT  dbo.f_GetFormPU(''21'') --1

DECLARE @ByFoot Money
SET @ByFoot = 
	CASE WHEN dbo.f_GetForm_use3rdDim( @Form ) = 1
		THEN (@Pieces * @Sz3 / 12) 
		ELSE (@Pieces * @Sz2 / 12) 	END



DECLARE @QTY Money
SET @QTY = 0

--PRINT dbo.f_GetWeight(1000,''L605'',''10'',.125,36,0)  --174.6

SET @QTY = 
	CASE WHEN @OtherFld = ''Per Inch'' THEN @ByFoot*12 ELSE 
	 CASE WHEN @OtherFld = ''Per kg'' THEN dbo.f_GetWeight(@Pieces,@Alloy,@Form,@Thck,@Sz2,@Sz3)/2.2 ELSE 

	  CASE WHEN @PU = 1 THEN dbo.f_GetWeight(@Pieces,@Alloy,@Form,@Thck,@Sz2,@Sz3) ELSE 
	   CASE WHEN @PU = 2 THEN @ByFoot ELSE
	    CASE WHEN @PU = 3 THEN @Pieces 
	    END
	   END 
	  END 

	 END
	END



IF ISNULL(@QTY,0) = 0
	SET @QTY = 1
				
RETURN @QTY
END

--GRANT EXECUTE ON [dbo].[f_Calc_QTY3] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Calc_S_P]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Calc_S_P]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[f_Calc_S_P]
(	
	@Form  CHAR(2),
	@nS_QTY Money,
	@nPieces INT,
	@nP_lb Numeric(8,2),
	@nP_Pc Numeric(9,2),
	@Sz2 Decimal(9,3),
	@Sz3 Decimal(9,3),
	@nP_Ft Numeric(8,2),
	@nOtherP Numeric(8,2),
	@Q_Total money
)
RETURNS MONEY
AS
BEGIN
--S_P is HPA Acct Standard
--Calculates Price on [form] when sent Customers P_LB or P_Pc or P_Ft 

--nS_P	= IIF(nP_PU=1,nP_lb+(nOtherP/nWeight), IIF(nP_PU=2,nP_Ft+(nOtherP/nFeet), nP_Pc+(nOtherP/nPieces)  ))
--SET S_P = dbo.f_Calc_S_P(Form,S_QTY,Pieces,P_lb,P_Pc,Sz2,Sz3,P_Ft,OtherP,Q_Total)

--like Proc_SQL:f_Get_Units
--Print dbo.f_Calc_S_P(Form,Weight,Pieces,P_lb,P_Pc,Sz2,Sz3,P_Ft,OtherP)

--Print dbo.f_Calc_QTY3(''L605'',''21'',1000,.125,36,0,'''')
--dbo.f_Calc_QTY3(Alloy,Form,PC,Dim1,Dim2,Dim3,OtherFld) AS f_Calc_QTY
--
IF @Q_Total IS NULL
	RETURN 0

IF @Form IS NULL
	RETURN 0

IF @nOtherP IS NULL
	SET @nOtherP = 0

--SELECT TOP 1 @Form=Form, @Pieces=Pieces, @Sz2=Sz2, @Sz3=Sz3, @Weight=[Weight] FROM dbo.AllQuotes WHERE SOitem = @SOitem
DECLARE @nS_P Money = 0
DECLARE @nPlusOtherP Numeric(8,2) = 0

DECLARE @PU TinyInt
SELECT @PU = dbo.f_GetFormPU(@Form)

IF @PU = 1
begin 
	SET @nS_P = @Q_Total/ISNULL(@nS_QTY,1)
	SET @nPlusOtherP = @nOtherP/ISNULL(@nS_QTY,1)
end
ELSE
IF @PU = 2
begin 
	DECLARE @nFeet Money
	SET @nFeet = 
		CASE WHEN dbo.f_GetForm_use3rdDim( @Form ) = 1
		THEN (@nPieces * @Sz3 / 12) 
		ELSE (@nPieces * @Sz2 / 12) 	
		END;

	SET @nS_P = @Q_Total/ISNULL(@nFeet,1)
	SET @nPlusOtherP = @nOtherP/ISNULL(@nFeet,1)

end
ELSE
IF @PU = 3
begin 
	SET @nS_P = @Q_Total/ISNULL(@nPieces,1)
	SET @nPlusOtherP = @nOtherP/ISNULL(@nPieces,1)
end


SET @nS_P = ISNULL(@nS_P,0) + ISNULL(@nPlusOtherP,0)
				
RETURN @nS_P
END


--GRANT EXECUTE ON [dbo].[f_Calc_S_P] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Calc_SS_ACCL]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Calc_SS_ACCL]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
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
create FUNCTION [dbo].[f_Calc_SS_ACCL]
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
-- PRINT ERP_2.dbo.f_StandardSizeMinus(4)
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
/****** Object:  UserDefinedFunction [dbo].[f_Calc_SS_CCL]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Calc_SS_CCL]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
/* 
PRINT ''Calculate Starting Stock using Finish Size and Condition Level''
PRINT dbo.[f_Calc_SS_CCL](1,''7'',''1'')
PRINT dbo.[f_Calc_SS_CCL](1,''7'',''2'')
PRINT dbo.[f_Calc_SS_CCL](1,''7'',''3'')
PRINT dbo.[f_Calc_SS_CCL](1,''7'',''4'')
PRINT dbo.[f_Calc_SS_CCL](1,''7'',''5'')
PRINT dbo.[f_Calc_SS_CCL](1,''7'',''6'')
PRINT dbo.[f_Calc_SS_CCL](2.25,''7'',''4'')
PRINT dbo.f_Calc_SS_CCL (2.375,''L'',''5'')
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
DECLARE @sSize FLOAT = 0

--Leace at least .030 to gind off
--used in dbo.NR_Sales_YrSum_10Yr AS Calc Col ([dbo].[f_Calc_SS_CCL]([Thck],[CC],[CL]))


IF @CC=''7'' OR @CC=''S'' or @CC=''L''
begin
	SET @fSize = @fSize +.040
	IF @CL = ''1'' or @CL = ''A''
		IF @fSize < 1
			SET @sSize = SQRT(@fSize*@fSize*1.12)
		ELSE IF @fSize < 2
			SET @sSize = SQRT(@fSize*@fSize*1.12)
		ELSE IF @fSize < 3
			SET @sSize = SQRT(@fSize*@fSize*1.13)
		ELSE
			SET @sSize = SQRT(@fSize*@fSize*1.13)


	IF @CL = ''2'' or @CL = ''B''
		IF @fSize < 1
			SET @sSize = SQRT(@fSize*@fSize*1.2)
		ELSE IF @fSize < 2
			SET @sSize = SQRT(@fSize*@fSize*1.21)
		ELSE IF @fSize < 3
			SET @sSize = SQRT(@fSize*@fSize*1.23)

	IF @CL = ''3'' or @CL = ''C''
		IF @fSize < 1
			SET @sSize = SQRT(@fSize*@fSize*1.31)
		ELSE IF @fSize < 2
			SET @sSize = SQRT(@fSize*@fSize*1.33)
		ELSE IF @fSize < 3
			SET @sSize = SQRT(@fSize*@fSize*1.36)
		ELSE
			SET @sSize = SQRT(@fSize*@fSize*1.23)

	IF @CL = ''4'' or @CL = ''D''
		IF @fSize < 1
			SET @sSize = SQRT(@fSize*@fSize*1.42)
		ELSE IF @fSize < 2
			SET @sSize = SQRT(@fSize*@fSize*1.44)
		ELSE IF @fSize < 3
			SET @sSize = SQRT(@fSize*@fSize*1.46)
		ELSE
			SET @sSize = SQRT(@fSize*@fSize*1.46)

	IF @CL = ''5'' or @CL = ''E''
		IF @fSize < 1
			SET @sSize = SQRT(@fSize*@fSize*1.49)
		ELSE IF @fSize < 2
			SET @sSize = SQRT(@fSize*@fSize*1.50)
		ELSE IF @fSize < 3
			SET @sSize = SQRT(@fSize*@fSize*1.52)
		ELSE
			SET @sSize = SQRT(@fSize*@fSize*1.52)

	IF @CL = ''6''
		IF @fSize < 1
			SET @sSize = SQRT(@fSize*@fSize*1.52)
		ELSE IF @fSize < 2
			SET @sSize = SQRT(@fSize*@fSize*1.55)
		ELSE IF @fSize < 3
			SET @sSize = SQRT(@fSize*@fSize*1.6)
		ELSE 
			SET @sSize = SQRT(@fSize*@fSize*1.62)
end
--RETURN dbo.f_StandardSizeMinus(@sSize)
RETURN dbo.f_StandardSizePlus(@sSize)
END


--GRANT EXECUTE ON [dbo].[f_Calc_SS_CCL] TO [WINDFALL\HPA] AS [dbo];
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Calc_SS_CL]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Calc_SS_CL]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
/* 
PRINT ''Calculate Starting Stock using Finish Size and Condition Level''
PRINT dbo.[f_Calc_SS_CL](1,1)
PRINT dbo.[f_Calc_SS_CL](1,2)
PRINT dbo.[f_Calc_SS_CL](1,3)
PRINT dbo.[f_Calc_SS_CL](1,4)
PRINT dbo.[f_Calc_SS_CL](1,5)
PRINT dbo.[f_Calc_SS_CL](1,6)
PRINT dbo.[f_Calc_SS_CL](2.375,4)
PRINT dbo.[f_Calc_SS_CL](2.375,5)
*/
CREATE FUNCTION [dbo].[f_Calc_SS_CL]
(	
	@fSize Float,
	@CL CHAR(1)
)
RETURNS Float
--returns standart starting Stock Dia
AS
BEGIN
DECLARE @sSize FLOAT = 0

--Leace at least .030 to gind off
SET @fSize = @fSize +.040

IF @CL = ''1''
	IF @fSize < 1
		SET @sSize = SQRT(@fSize*@fSize*1.12)
	ELSE IF @fSize < 2
		SET @sSize = SQRT(@fSize*@fSize*1.12)
	ELSE IF @fSize < 3
		SET @sSize = SQRT(@fSize*@fSize*1.13)
	ELSE
		SET @sSize = SQRT(@fSize*@fSize*1.13)

IF @CL = ''2''
	IF @fSize < 1
		SET @sSize = SQRT(@fSize*@fSize*1.2)
	ELSE IF @fSize < 2
		SET @sSize = SQRT(@fSize*@fSize*1.21)
	ELSE IF @fSize < 3
		SET @sSize = SQRT(@fSize*@fSize*1.23)
	ELSE
		SET @sSize = SQRT(@fSize*@fSize*1.23)

IF @CL = ''3''
	IF @fSize < 1
		SET @sSize = SQRT(@fSize*@fSize*1.31)
	ELSE IF @fSize < 2
		SET @sSize = SQRT(@fSize*@fSize*1.33)
	ELSE IF @fSize < 3
		SET @sSize = SQRT(@fSize*@fSize*1.36)
	ELSE
		SET @sSize = SQRT(@fSize*@fSize*1.36)

IF @CL = ''4''
	IF @fSize < 1
		SET @sSize = SQRT(@fSize*@fSize*1.42)
	ELSE IF @fSize < 2
		SET @sSize = SQRT(@fSize*@fSize*1.44)
	ELSE IF @fSize < 3
		SET @sSize = SQRT(@fSize*@fSize*1.46)
	ELSE
		SET @sSize = SQRT(@fSize*@fSize*1.46)

IF @CL = ''5''
	IF @fSize < 1
		SET @sSize = SQRT(@fSize*@fSize*1.49)
	ELSE IF @fSize < 2
		SET @sSize = SQRT(@fSize*@fSize*1.50)
	ELSE IF @fSize < 3
		SET @sSize = SQRT(@fSize*@fSize*1.52)
	ELSE
		SET @sSize = SQRT(@fSize*@fSize*1.52)

IF @CL = ''6''
	IF @fSize < 1
		SET @sSize = SQRT(@fSize*@fSize*1.50)
	ELSE IF @fSize < 2
		SET @sSize = SQRT(@fSize*@fSize*1.53)
	ELSE IF @fSize < 3
		SET @sSize = SQRT(@fSize*@fSize*1.55)
	ELSE
		SET @sSize = SQRT(@fSize*@fSize*1.55)

RETURN dbo.f_StandardSizePlus(@sSize)
END


--GRANT EXECUTE ON [dbo].[f_Calc_SS_CL] TO [WINDFALL\HPA] AS [dbo];
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Calc_Stock_CC_CL_QTY]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Calc_Stock_CC_CL_QTY]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Calc_Stock_CC_CL_QTY]
(
@cAlloy CHAR(12),
@cForm CHAR(2),
@CC CHAR(1),
@CL CHAR(1),
@nSize NUMERIC(9,3)
)
RETURNS INT
AS
BEGIN
--SELECT dbo.f_Calc_Stock_CC_QTY(''HPA N60'',''10'',''1'','''',2)
--SELECT dbo.f_Calc_Stock_CC_QTY(Alloy,Form,CC,CL,Size)
-- SELECT dbo.f_CC_Common(SM.CC,SM.Alloy)

--Return Stock QTY

declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @nQTY INT = 0

DECLARE @nQTY_Stock MONEY = 0
DECLARE @nQTY_Sold MONEY = 0

--DECLARE @cNewCCCL CHAR(2)
--SELECT @cNewCCCL = NewCCCL FROM dbo.ConditionCode WHERE CC = @CC




SELECT @nQTY_Stock = SUM(SD.S_QTY)
	
	FROM dbo.StockLst_Master SM
	INNER JOIN dbo.StockLst_Detail SD ON SM.ID = SD.ID
--	LEFT OUTER JOIN dbo.StockLst_Process SP ON SD.ID_Detail = SP.ID_Detail
	WHERE SM.Alloy = @cAlloy
	AND SM.Form = @cForm
	AND SM.CC = @CC
	AND SM.CL = @CL
--	AND dbo.f_CC_Common(SM.CC,SM.Alloy) = @CC
	AND SM.Size = @nSize
	AND SD.Prime = 1
--	AND ISNULL(SP.Process_ID,''SELECTED'') = ''SELECTED'' --Avoid Incoming!
--	AND NOT ISNULL(SP.Process_ID,''SELECTED'') = ''INCOMING'' --Avoid Incoming!


--SET @nQTY = ISNULL(@nQTY_Stock,0) - ISNULL(@nQTY_Sold,0)


RETURN ISNULL(@nQTY_Stock,0)
END


--GRANT EXECUTE ON [dbo].[f_Calc_Stock_CC_CL_QTY] TO [WINDFALL\HPA] AS [dbo];
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Calc_Stock_CC_QTY]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Calc_Stock_CC_QTY]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Calc_Stock_CC_QTY]
(
@cAlloy CHAR(12),
@cForm CHAR(2),
@CC CHAR(1),
--@CL CHAR(1),
@nSize NUMERIC(9,3)
)
RETURNS INT
AS
BEGIN
--SELECT dbo.f_Calc_Stock_CC_QTY(''HPA N60'',''10'',''1'',2)
--SELECT dbo.f_Calc_Stock_CC_QTY(Alloy,Form,CC,Size)
-- SELECT dbo.f_CC_Common(SM.CC,SM.Alloy)

--Return 

declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @nQTY INT = 0

DECLARE @nQTY_Stock MONEY = 0
DECLARE @nQTY_Sold MONEY = 0

--DECLARE @cNewCCCL CHAR(2)
--SELECT @cNewCCCL = NewCCCL FROM dbo.ConditionCode WHERE CC = @CC




SELECT @nQTY_Stock = SUM(SD.S_QTY)
	,@nQTY_Sold = SUM(SP.QTY) 
	FROM dbo.StockLst_Master SM
	INNER JOIN dbo.StockLst_Detail SD ON SM.ID = SD.ID
	LEFT OUTER JOIN dbo.StockLst_Process SP ON SD.ID_Detail = SP.ID_Detail
	WHERE SM.Alloy = @cAlloy
	AND SM.Form = @cForm

	AND dbo.f_CC_Common(SM.CC,SM.Alloy) = @CC
	AND SM.Size = @nSize
	AND SD.Prime = 1
	AND ISNULL(SP.Process_ID,''SELECTED'') = ''SELECTED'' --Avoid Incoming!


SET @nQTY = ISNULL(@nQTY_Stock,0) - ISNULL(@nQTY_Sold,0)


RETURN ISNULL(@nQTY,0)
END

--GRANT EXECUTE ON [dbo].[f_Calc_Stock_CC_QTY] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Calc_Stock_QTY]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Calc_Stock_QTY]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Calc_Stock_QTY]
(
@cAlloy CHAR(12),
@cForm CHAR(2),
--@CC CHAR(1),
--@CL CHAR(1),
@nSize NUMERIC(9,3)
)
RETURNS INT
AS
BEGIN
--SELECT dbo.f_Calc_Stock_QTY(''HPA N60'',''10'',2)
--SELECT dbo.f_Calc_Stock_QTY(Alloy,Form,Size)
--Return Stock QTY

declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @nQTY INT = 0

DECLARE @nQTY_Stock MONEY = 0
DECLARE @nQTY_Selected MONEY = 0

--DECLARE @cNewCCCL CHAR(2)
--SELECT @cNewCCCL = NewCCCL FROM dbo.ConditionCode WHERE CC = @CC




SELECT @nQTY_Stock = SUM(SD.S_QTY)
	,@nQTY_Selected = SUM(SP.QTY) 
	FROM dbo.StockLst_Master SM
	INNER JOIN dbo.StockLst_Detail SD ON SM.ID = SD.ID
	LEFT OUTER JOIN dbo.StockLst_Process SP ON SD.ID_Detail = SP.ID_Detail
	WHERE SM.Alloy = @cAlloy
	AND SM.Form = @cForm
	--AND CASE WHEN SM.CC = 1 THEN ( SM.CC = @CC OR SM.CC = ''R'' ) ELSE SM.CC = @CC END
	AND ( SM.CC = ''1'' OR SM.CC = ''R'' )
	AND SM.Size = @nSize
	AND SD.Prime = 1
	AND ISNULL(SP.Process_ID,''SELECTED'') = ''SELECTED'' --subtract Selected!


SET @nQTY = ISNULL(@nQTY_Stock,0) - ISNULL(@nQTY_Selected,0)


RETURN ISNULL(@nQTY,0)
END

--GRANT EXECUTE ON [dbo].[f_Calc_Stock_QTY] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Calc_Stock_QTY_Process_ID]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Calc_Stock_QTY_Process_ID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Calc_Stock_QTY_Process_ID]
(
@cAlloy CHAR(12),
@cForm CHAR(2),
@cCC CHAR(1),
@cCL CHAR(1),
@nSize NUMERIC(9,3),
@cProcess_ID CHAR(10)
)
RETURNS INT
AS
BEGIN
--SELECT dbo.f_Calc_Stock_QTY_Process_ID(''HPA N60'',''10'',''1'','''',2,''INCOMING'')
--SELECT dbo.f_Calc_Stock_QTY_Process_ID(''HPA N60'',''10'',''1'','''',2,''ELECTRALLO'') AS E_Stock_Due
--SELECT dbo.f_Calc_Stock_QTY_Process_ID(Alloy,Form,CC,CL,Size,''SELECTED'')
--Return 

declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @nQTY INT = 0

DECLARE @nQTY_Stock MONEY = 0
DECLARE @nQTY_Sold MONEY = 0

--DECLARE @cNewCCCL CHAR(2)
--SELECT @cNewCCCL = NewCCCL FROM dbo.ConditionCode WHERE CC = @CC
--SELECT dbo.f_Calc_Stock_QTY_Process_ID(''HPA N60'',''10'',CONVERT(Decimal(9,3),1.125),''ELECTRALLO'')

--IF @cProcess_ID = ''ELECTRALLO'' AND @cAlloy=''HPA N60''
	--SELECT ''@cProcess_ID = ELECTRALL AND @cAlloy=HPA N60'' AS test

	SELECT @nQTY_Stock = SM.MWeight
		FROM dbo.StockLst_Master SM WITH(NOLOCK)
		INNER JOIN dbo.StockLst_Detail SD WITH(NOLOCK) ON SM.ID = SD.ID
		LEFT OUTER JOIN dbo.StockLst_Process SP WITH(NOLOCK) ON SD.ID_Detail = SP.ID_Detail
		WHERE SM.Alloy = @cAlloy
		AND SM.Form = @cForm
		AND SM.CC = @cCC
		AND SM.CL = @cCL
		AND SM.Size = @nSize
		AND ISNULL(SP.Process_ID,'''') = @cProcess_ID;



RETURN ISNULL(@nQTY_Stock,0)
END

--GRANT EXECUTE ON [dbo].[f_Calc_Stock_QTY_Process_ID] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Calc_Weight]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Calc_Weight]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[f_Calc_Weight]
(	
	@Alloy CHAR(12)
	,@Form  CHAR(2)
	,@Pieces INT
	,@Thck Decimal(10,4)
	,@Sz2 Decimal(9,3)
	,@Sz3 Decimal(9,3)

)
RETURNS DECIMAL(9,1)
AS
BEGIN


--like Proc_SQL:f_Get_Units
--Print dbo.f_Calc_QTY(Alloy,Form,Pieces,Thck,Sz2,Sz3)
--dbo.f_Calc_Weight(Alloy,Form,PC,Dim1,Dim2,Dim3) AS f_Calc_Weight

declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @Weight DECIMAL(9,1)
SET @weight = 0

SET @weight = dbo.f_GetWeight(@Pieces,@Alloy,@Form,@Thck,@Sz2,@Sz3) 
				
RETURN @weight
END

--GRANT EXECUTE ON [dbo].[f_Calc_Weight] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CalcBook_P]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CalcBook_P]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[f_CalcBook_P]
(
@cAlloy char(12),
@cForm CHAR(2),
@cCC CHAR(1),
@cCL CHAR(1),
@nStdSize DECIMAL(9,4),
@nSize2 DECIMAL(9,3),
@nPounds DECIMAL(9,1)
)
RETURNS DECIMAL(9,2)
AS

/*
DECLARE @cAlloy char(12),@cForm CHAR(2),@cCC CHAR(1),@cCL CHAR(1), @nStdSize DECIMAL(9,4),@nSize2 DECIMAL(9,3),@nPounds DECIMAL(9,1)
SELECT dbo.f_CalcBook_P( @cAlloy=''400'',@cForm=''10'',@cCC=''1'',@cCL='''',@nStdSize=1,@nSize2=0,@nPounds=10)
--SELECT dbo.f_CalcBook_P(@cAlloy=''HPA N50'',@cForm=''10'',@cCC=''8'',@cCL=''2'',@nStdSize=1,@nSize2=0,@nPounds=10)
--SELECT dbo.f_CalcBook_P(@cAlloy=''HPA N60'',@cForm=''10'',@cCC=''2'',@cCL='''',@nStdSize=1,@nSize2=0,@nPounds=10)

SELECT dbo.f_CalcBook_P(@cAlloy,@cForm,@cCC,@cCL,@nStdSize,@nSize2,@nPounds) AS nPrice

*/


--RETURNS:
--@nPrice= Price per Quantity.
--@nBracket= Price bracket used.
--@cMessage= Empty or ''Price not found in table.''
--@bActivePrice= Active Price

BEGIN
---SET NOCOUNT ON
declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @cCCorig CHAR(1)
SET @cCCorig = @cCC

--Check User login
--IF UserName, sesionID Parameter = UserName, SesionID stored in users table and Login limit date not expired
DECLARE @cMessage VARCHAR(MAX) = ''''


DECLARE @bActivePrice BIT
SET @bActivePrice = 0
--Find Thickness used in PriceTable

DECLARE @cCCAdjust CHAR(1)
SET @cCCAdjust = ''0''

---------------------------------------------------
DECLARE @nAdjust SmallMoney
SET @nAdjust = dbo.f_Price_Adjust( @cCC, @cCL, @nStdSize )
--PRINT ''The Price Adjustment''
--PRINT @nAdjust

---------------------------------------------------

DECLARE @cAdjustCC char(1)
SET @cAdjustCC = dbo.f_Price_AdjustCC( @cCC, @cCL, @nStdSize )
--PRINT ''Returns the CC to Search in PriceTable''
--PRINT @cAdjustCC

---------------------------------------------------

DECLARE @cUsePriceTable char(1)
SET @cUsePriceTable = dbo.f_Price_Table_Use( @cCC, @cCL, @nStdSize )
--PRINT ''cUsePriceTable = dbo.f_Price_Table_Use''
--PRINT ''if F is PriceTable needs an adjustment''
--PRINT @cUsePriceTable

IF @cUsePriceTable = ''F''
	begin
	--the CC CL is not set in the Price Table
	--search for Alloy Form and the AdjustedCC
	--SET @cMessage = RTRIM(@cMessage) +'' Alloy ''+@cAlloy+'', Form ''+@cForm+'',  CC=''+@cCC+'' CL=''+@cCL+'', not in the Price Table''
	SET @cMessage = RTRIM(@cMessage) +'' Alloy ''+@cAlloy+'', Form ''+@cForm+'',  CC=''+@cCC+'' CL=''+@cCL+'', ''+LTRIM(RTRIM(CAST(@nStdSize AS CHAR(10) )))+'' not in the Price Table''
	SET @cCC = @cAdjustCC
	SET @cCL = ''''
	
	end

If @cUsePriceTable = ''T''
--	begin
--	PRINT ''the PricingTable is ready to be searched by Alloy, Form, CC and CL''
--	SET @cMessage = RTRIM(@cMessage) + '' PricingTable: Alloy ''+@cAlloy+'', Form ''+@cForm+'', CC ''+@cCc+'', and CL ''+@cCL
--	PRINT ''@cMessage=''+@cMessage
--	end


---------------------------------------------------
DECLARE @nPrice NUMERIC(8,2)
SET @nPrice=0
--@nPrice
IF @nPounds < 5
  BEGIN
	SELECT TOP 1 @nPrice = w0, @bActivePrice = ActivePric 
		FROM dbo.pricetable 
		WHERE Alloy = @cAlloy AND Form = @cForm AND CC = @cCC AND CL = @cCL AND (Thk = @nStdSize OR Size = @nStdSize )

   END
ELSE 
IF @nPounds >= 5 AND @nPounds < 10
  BEGIN
	SELECT TOP 1 @nPrice = w5, @bActivePrice = ActivePric 
		FROM dbo.pricetable 
		WHERE Alloy = @cAlloy AND Form = @cForm AND CC = @cCC AND CL = @cCL AND (Thk = @nStdSize OR Size = @nStdSize )

   END
ELSE 
IF @nPounds >= 10 AND @nPounds < 25
  BEGIN
	SELECT TOP 1 @nPrice = w10, @bActivePrice = ActivePric 
		FROM dbo.pricetable 
		WHERE Alloy = @cAlloy AND Form = @cForm AND CC = @cCC AND CL = @cCL AND (Thk = @nStdSize OR Size = @nStdSize )

   END
ELSE 
IF @nPounds >= 25 AND @nPounds < 50
  BEGIN
	SELECT TOP 1 @nPrice = w25, @bActivePrice = ActivePric 
		FROM dbo.pricetable 
		WHERE Alloy = @cAlloy AND Form = @cForm AND CC = @cCC AND CL = @cCL AND (Thk = @nStdSize OR Size = @nStdSize )

   END
ELSE 
IF @nPounds >= 50 AND @nPounds < 100
  BEGIN
	SELECT TOP 1 @nPrice = w50, @bActivePrice = ActivePric 
		FROM dbo.pricetable 
		WHERE Alloy = @cAlloy AND Form = @cForm AND CC = @cCC AND CL = @cCL AND (Thk = @nStdSize OR Size = @nStdSize )

   END
ELSE 
IF @nPounds >= 100 AND @nPounds < 200
  BEGIN
	SELECT TOP 1 @nPrice = w100, @bActivePrice = ActivePric 
		FROM dbo.pricetable 
		WHERE Alloy = @cAlloy AND Form = @cForm AND CC = @cCC AND CL = @cCL AND (Thk = @nStdSize OR Size = @nStdSize )

   END
ELSE 
IF @nPounds >= 200 AND @nPounds < 500
  BEGIN
	SELECT TOP 1 @nPrice = w200, @bActivePrice = ActivePric 
		FROM dbo.pricetable 
		WHERE Alloy = @cAlloy AND Form = @cForm AND CC = @cCC AND CL = @cCL AND (Thk = @nStdSize OR Size = @nStdSize )

   END
ELSE 
IF @nPounds >= 500 AND @nPounds < 1000
  BEGIN
	SELECT TOP 1 @nPrice = w500, @bActivePrice = ActivePric 
		FROM dbo.pricetable 
		WHERE Alloy = @cAlloy AND Form = @cForm AND CC = @cCC AND CL = @cCL AND (Thk = @nStdSize OR Size = @nStdSize )

   END
ELSE 
IF @nPounds >= 1000 AND @nPounds < 2000
  BEGIN
	SELECT TOP 1 @nPrice = w1000, @bActivePrice = ActivePric 
		FROM dbo.pricetable 
		WHERE Alloy = @cAlloy AND Form = @cForm AND CC = @cCC AND CL = @cCL AND (Thk = @nStdSize OR Size = @nStdSize )

   END
ELSE 
IF @nPounds >= 2000 AND @nPounds < 5000
  BEGIN
	SELECT TOP 1 @nPrice = w2000, @bActivePrice = ActivePric 
		FROM dbo.pricetable 
		WHERE Alloy = @cAlloy AND Form = @cForm AND CC = @cCC AND CL = @cCL AND (Thk = @nStdSize OR Size = @nStdSize )

   END
ELSE
IF @nPounds >= 5000
  BEGIN
	SELECT TOP 1 @nPrice = wBase, @bActivePrice = ActivePric 
		FROM dbo.pricetable 
		WHERE Alloy = @cAlloy AND Form = @cForm AND CC = @cCC AND CL = @cCL AND (Thk = @nStdSize OR Size = @nStdSize )
	IF @nPrice = 0
		SELECT TOP 1 @nPrice = w2000, @bActivePrice = ActivePric 
			FROM dbo.pricetable 
			WHERE Alloy = @cAlloy AND Form = @cForm AND CC = @cCC AND CL = @cCL AND (Thk = @nStdSize OR Size = @nStdSize )

   END
ELSE
	SET @cMessage = ''Weight Bracket Price not found in table. ''+RTRIM(@cMessage)


IF @cCCAdjust != ''0''
	SET @nPrice = @nPrice * @nAdjust

DECLARE @nSurcharge FLOAT =0
SET @nSurcharge = dbo.f_Alloy_Surcharge(@cAlloy)


RETURN @nPrice
END




--GRANT EXECUTE ON [dbo].[f_CalcBook_P] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CalcBook_P_SOitem]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CalcBook_P_SOitem]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_CalcBook_P_SOitem]
( @SOitem CHAR(10)
)
RETURNS Numeric(8,2)

AS
BEGIN
--SELECT dbo.f_CalcBook_P_SOitem('' 137477-01'')
--SELECT dbo.f_CalcBook_P_SOitem('' 102377-01'')
--Return Current Book P for SOitem

declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @Book_P Numeric(8,2) = 0.00
							

--dbo.f_Calc_QTY(Alloy,Form,PC,Dim1,Dim2,Dim3) AS f_Calc_QTY
--dbo.f_Calc_Weight(Alloy,Form,PC,Dim1,Dim2,Dim3) AS f_Calc_Weight


SELECT @Book_P = dbo.f_CalcBook_P(Alloy,Form,CC,CL,Thck,Sz2,[Weight]) 
	FROM dbo.AllQuotes WITH(NOLOCK) WHERE SOitem = @SOitem

RETURN ISNULL(@Book_P,0)
END



--GRANT EXECUTE ON [dbo].[f_CalcBook_P_SOitem] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CalcItemSale_SOitem]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CalcItemSale_SOitem]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_CalcItemSale_SOitem]
( @SOitem CHAR(10)
)
RETURNS MONEY
AS
BEGIN
--SELECT dbo.f_CalcSale_SOitem(''  78703-01'')
--SELECT dbo.f_CalcItemSale_SOitem('' 141538-01'')
--Return SO Quote Total / Sale From SOitem

/*
DECLARE @SOitem CHAR(10) = '' 103598-01''
SELECT dbo.f_Calc_QTY(Alloy,Form,Pieces,Thck,Sz2,Sz3) AS ''Calc_QTY''
	, dbo.f_Calc_Weight(Alloy,Form,Pieces,Thck,Sz2,Sz3) AS ''Calc_Weight''
	, ISNULL(Form,'''') AS ''Form''
	, ISNULL(Pieces,1) AS ''Pieces''
	, ISNULL(Sz2,0) AS ''Sz2''
	, ISNULL(Sz3,0) AS ''Sz3''
	, ISNULL([Weight],0) AS ''weight''
	, ISNULL(p_lb,0) AS ''P_Lb''
	, ISNULL(p_pc,0) AS ''P_Pc''
	, ISNULL(p_ft,0) AS ''P_Ft''
	, ISNULL(LotP,0) AS ''LotP''
	, ISNULL(Q_P,0) AS ''Q_P''
	, ISNULL(Q_QTY,0) AS ''Q_QTY''
	, ISNULL(OtherP,0) AS ''OtherP''
	, ISNULL(Cuts,0) AS ''Cuts''
	, dbo.f_GetForm_use3rdDim(Form) AS ''Use3rdDim''
	, dbo.f_CalcSale_SOitem(@SOitem) AS ''f_CalcSale_SOitem''
	FROM dbo.AllQuotes WHERE SOitem = @SOitem
*/

DECLARE @Sale MONEY = 0.0000
DECLARE @P MONEY = 0
DECLARE @QTY MONEY = 0
DECLARE @OtherFld CHAR(10)
DECLARE @OtherP MONEY = 0
DECLARE @CutsP Numeric(9,2) = 0

--SELECT @P = ISNULL(Q_P,0)	, @QTY = ISNULL(Q_QTY,0)	, @OtherP = ISNULL(OtherP,0)	, @Cuts = ISNULL(Cuts,0)	FROM dbo.AllQuotes WHERE SOitem = @SOitem


--dbo.f_Calc_QTY(Alloy,Form,PC,Dim1,Dim2,Dim3) AS f_Calc_QTY
--dbo.f_Calc_Weight(Alloy,Form,PC,Dim1,Dim2,Dim3) AS f_Calc_Weight

DECLARE @nItemSale MONEY, @S_PU TinyINT, @S_QTY MONEY, @S_P MONEY, @S_Total MONEY
SELECT TOP 1 @nItemSale=ItemSale, @S_PU=S_PU, @S_QTY=S_QTY, @S_P=S_P, @S_Total=S_Total, @OtherP=Quoted_OtherP, @CutsP=Quoted_CutsP 
	FROM dbo.Sales WHERE SOitem = @SOitem

IF @nItemSale>0
	begin

--	PRINT ''ItemSale=''+CAST(@nItemSale AS CHAR(10))
--	PRINT ''@S_QTY*@S_P ''+CAST(@S_QTY*@S_P AS CHAR(10))

	IF ROUND(@S_QTY*@S_P,2) = ROUND(@nItemSale,2)
	   	RETURN ISNULL( ROUND(@nItemSale,2) ,0)

	IF ROUND(@S_QTY*@S_P,1) = ROUND(@nItemSale,1)
	   	RETURN ISNULL( ROUND(@nItemSale,1) ,0)

--	IF FLOOR(@S_QTY*@S_P) = FLOOR(@nItemSale)
--	   	RETURN ISNULL(FLOOR(@nItemSale),0)

	end
--**********************************
--PRINT ''Do Old School''


DECLARE @Calc_QTY MONEY, @Calc_Weight MONEY
DECLARE @cForm CHAR(2), @nPieces INT, @nSz2 NUMERIC(9,3), @nSz3 NUMERIC(9,3)
--use money to avoid rounding error.
--DECLARE @nWeight NUMERIC(7,1), @P_Lb Numeric(10,1), @P_Pc Numeric(10,1),@P_Ft Numeric(10,1),@LotP Numeric(10,1)
DECLARE @nWeight MONEY, @P_Lb MONEY, @P_Pc MONEY, @P_Ft MONEY, @LotP MONEY
DECLARE @nUse3rdDim BIT

SELECT @Calc_QTY = dbo.f_Calc_QTY(Alloy,Form,Pieces,Thck,Sz2,Sz3) 
	, @Calc_Weight = dbo.f_Calc_Weight(Alloy,Form,Pieces,Thck,Sz2,Sz3) 
	, @cForm = ISNULL(Form,'''')
	, @nPieces = ISNULL(Pieces,1) 
	, @nSz2 = ISNULL(Sz2,0)
	, @nSz3 = ISNULL(Sz3,0)
	, @nWeight = ISNULL([Weight],0)
	, @P_Lb = ISNULL(p_lb,0)
	, @P_Pc = ISNULL(p_pc,0)
	, @P_Ft = ISNULL(p_ft,0)
	, @LotP = ISNULL(LotP,0)
	, @P = ISNULL(Q_P,0)
	, @QTY = ISNULL(Q_QTY,0)
	, @OtherFld = ISNULL(OtherFld,'''')
	, @OtherP = ISNULL(OtherP,0)
	, @CutsP = ISNULL(Cuts,0)
	, @nUse3rdDim = dbo.f_GetForm_use3rdDim(Form)
	FROM dbo.AllQuotes WHERE SOitem = @SOitem

-----
IF @nPieces = 0
	SET @nPieces = 1

-----
IF @LotP > 0
	SET @Sale = @LotP
ELSE
	IF @P_Pc > 0
		SET @Sale = @P_Pc * @nPieces
	ELSE
		begin

		IF @P_Ft > 0
			IF @nUse3rdDim = 1
				SET @Sale = @P_Ft * @nPieces * @nSz3 / 12
			ELSE
				SET @Sale = @P_Ft * @nPieces * @nSz2 / 12

		IF @P_Lb > 0
			IF @nWeight > 0
				SET @Sale = @P_Lb * @nWeight
			ELSE
				SET @Sale = @P_Lb * @Calc_Weight

		end

		/*PRINT ''LotP ''+CAST(@LotP AS CHAR(10))
		PRINT ''P_PC ''+CAST(@P_FT AS CHAR(10))
		PRINT ''P_Ft ''+CAST(@P_Ft AS CHAR(10))
		PRINT ''Use3rdDim ''+CAST(nUse3rdDim AS CHAR(10))
		PRINT ''P_LB '' +CAST(@P_LB AS CHAR(10))
		PRINT ''@P_Lb * @nWeight ''+CAST((@P_Lb * @nWeight) AS CHAR(20))
		PRINT ''@P_Lb * @Calc_Weight ''+CAST((@P_Lb * @Calc_Weight) AS CHAR(20))

--		PRINT ''''+CAST((@P_Ft * @nPieces * @nSz2 / 12) AS CHAR(20))
--		PRINT ''@P_Ft * @nPieces * @nSz3 / 12''+CAST((@P_Ft * @nPieces * @nSz3 / 12) AS CHAR(20))

		PRINT ''Sale ''+CAST(@Sale AS CHAR(10))
		*/

/*
DECLARE @PU TinyInt
SELECT @PU = dbo.f_GetFormPU(@cForm)
	--1Lb, 2Ft 3Pc

IF @PU = 1
	SET @Sale = @P_Lb * @Calc_Weight
ELSE
	begin
	IF @PU = 3
		SET @Sale = @P_Pc * @nPieces
	ELSE
		begin
		IF @P_Ft > 0
			--Feet
			IF @nUse3rdDim = 1
				SET @Sale = @P_Ft * @nPieces * @nSz3 / 12
			ELSE
				SET @Sale = @P_Ft * @nPieces * @nSz2 / 12
		ELSE
			SET @Sale = 0
		end
	end
*/

DECLARE @NewQTY Money = 0

-------------------------------------------------------------------
IF @Sale = 0
	IF LEN(@OtherFld) > 0
	begin
		IF @OtherFld = ''Per Inch''
			begin
			--Inch
			IF @nUse3rdDim = 1
				begin
				SET @Sale = @OtherP * @nPieces * @nSz3 
				SET @NewQTY = @nPieces * @nSz3 
				end
			ELSE
				begin
				SET @Sale = @OtherP * @nPieces * @nSz2 
				SET @NewQTY = @nPieces * @nSz2 
				end

			--UPDATE dbo.AllQuotes SET Q_P=@OtherP, Q_QTY=@NewQTY WHERE SOitem = @SOitem

			end
		--IF @OtherFld = ''Per Hr''
		--	begin
		--	SET @Sale = @OtherP * 
		--	--UPDATE dbo.AllQuotes SET Q_P=@OtherP, Q_QTY= WHERE SOitem = @SOitem
		--	end

		IF @OtherFld = ''Per kg''
			begin
			SET @Sale = @OtherP * @Calc_Weight / 2.2

			--UPDATE dbo.AllQuotes SET Q_P=@OtherP, Q_QTY=@Calc_Weight/2.2 WHERE SOitem = @SOitem

			end

	end

-------------------------------------------------------------------
IF @Sale = 0
	SET @Sale = @P * @QTY


-------------------------------------------------------------------
--Add OtherPrice to Sale
IF @Sale > 0
	IF NOT ( @OtherFld = ''Per Inch'' OR @OtherFld = ''Per Hr'' OR @OtherFld = ''Per kg'' )
		SET @Sale = @Sale + @OtherP + @CutsP
	ELSE
		SET @Sale = @Sale + @CutsP

RETURN ISNULL(@Sale,0)
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CalcPOCost]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CalcPOCost]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_CalcPOCost]
(
@cForm CHAR(2),
@nPieces INT,
@nSz2 Float,
@nSz3 Float,
@nWeight Float,
@nServices BIT,
@nStockLst_P Money,
@nStockLst_QTY Money
)
RETURNS MONEY
AS
BEGIN


-- USE [f_CalcPOCost_POitem] because it uses the InvoiceCost !


--SELECT dbo.f_CalcPOCost(''10'',1,0,0,10,0,2,3)
--SELECT dbo.f_CalcPOCost(Form,PCs,Sz2,Sz3,nWeight,bService,nP,nQTY)
--Return PO Cost summary Form type

declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @nCost MONEY
SET @nCost = 0

IF @nServices > 0
	RETURN ISNULL( @nStockLst_P, 0)

SET @nCost = @nStockLst_P * @nStockLst_QTY
IF @nCost > 0
	RETURN ISNULL( @nCost, 0)

DECLARE @nForm Int
SELECT @nForm = CAST(@cForm AS Int)

DECLARE @nUse3rdDim BIT
SELECT @nUse3rdDim = dbo.f_GetForm_use3rdDim(@cForm)

DECLARE @cPriceUnit CHAR(2)
SELECT @cPriceUnit = dbo.f_GetFormUnitPrice(@cForm)



	begin
	IF @cPriceUnit = ''LB''
		begin
		--If you are buying more Lbs than Sold, just cost the amount sold
		IF @nStockLst_QTY > @nWeight
			SET @nCost = @nStockLst_P * @nWeight
		ELSE
			SET @nCost = @nStockLst_P * @nStockLst_QTY
		end
	ELSE
		begin
		IF @cPriceUnit = ''PC''
			begin
			--If you are buying more Pcs than Sold, just cost the amount sold
			IF @nStockLst_QTY > @nPieces
				SET @nCost = @nStockLst_P * @nPieces
			ELSE
				SET @nCost = @nStockLst_P * @nStockLst_QTY
			end
		ELSE
			begin
			--If you are buying more Pcs than Sold, just cost the amount sold
			IF @nStockLst_QTY > @nPieces * @nSz3 / 12
				SET @nCost = @nStockLst_P * @nPieces * @nSz3 / 12
			ELSE
				SET @nCost = @nStockLst_P * @nStockLst_QTY
			end
		end
	end
	

RETURN ISNULL(@nCost,0)
END

--GRANT EXECUTE ON [dbo].[f_CalcPOCost] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CalcPOCost_PO]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CalcPOCost_PO]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
Create FUNCTION [dbo].[f_CalcPOCost_PO]
(
@nPO	INT
)
RETURNS MONEY
AS
BEGIN
--SELECT dbo.f_CalcPOCost_PO(508604)
--Return PO Cost summary or ReconcileTotal

declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @nPO_Cost MONEY
SET @nPO_Cost = 0


SELECT @nPO_Cost = SUM( 
	case when ISNULL(ReconcileTotal,0)>0 then ReconcileTotal 
	else ISNULL(StockLst_Total,0)+ISNULL(OtherP,0)  
	 end ) 
FROM dbo.PurchaseOrder 
	WHERE HPApo = @nPO

RETURN ISNULL(@nPO_Cost,0)
END


--GRANT EXECUTE ON [dbo].[f_CalcPOCost_PO] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CalcPOCost_POi]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CalcPOCost_POi]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_CalcPOCost_POi]
(
@cPOitem CHAR(12)
)
RETURNS MONEY
AS
BEGIN
--SELECT dbo.f_CalcPOCost_POi(POitem)
--SELECT dbo.f_CalcPOCost_POi(POitem)

declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @nCost MONEY
SET @nCost = 0

--IF @nServices > 0
--	RETURN ISNULL( @nStockLst_P, 0)

DECLARE @nReconcileTotal_Dist MONEY = 0

SELECT @nReconcileTotal_Dist = ISNULL( CASE WHEN PSD.ReconcileTotal > 0 THEN PSD.ReconcileTotal ELSE PSD.Total END ,0)
	FROM dbo.PO_SOdist PSD 
	WHERE PSD.POitem = @cPOitem

IF @nReconcileTotal_Dist > 0
	RETURN @nReconcileTotal_Dist


--***************************************************************
DECLARE @nReconcileTotal MONEY = 0
SELECT @nReconcileTotal = ISNULL(ReconcileTotal,0) FROM dbo.PurchaseOrder WHERE POitem = @cPOitem
IF @nReconcileTotal > 0
	RETURN @nReconcileTotal

DECLARE @nStockLst_Total Money


--SELECT (StockLst_P * StockLst_QTY ) AS Cost, StockLst_Total FROM dbo.PurchaseOrder WHERE POitem = @cPOitem
SELECT @nStockLst_Total = ISNULL(StockLst_Total,0) FROM dbo.PurchaseOrder WHERE POitem = @cPOitem

IF @nStockLst_Total > 0
	RETURN @nStockLst_Total

--***************************************************************
SELECT @nCost = ISNULL(StockLst_P * StockLst_QTY ,0) FROM dbo.PurchaseOrder WHERE POitem = @cPOitem

IF @nCost > 0
	RETURN @nCost


--***************************************************************
DECLARE @cForm CHAR(2),@nPieces INT,@nSz2 Float,@nSz3 Float,@nWeight Float
DECLARE @nStockLst_P Money,@nStockLst_QTY Money
--,@SOitem CHAR(10)

SELECT @cForm = ISNULL(Form,'''')
	,@nPieces = ISNULL(Pieces,0)
	,@nSz2 = ISNULL(Sz2,0) 
	,@nSz3 = ISNULL(Sz3,0) 
	,@nWeight = ISNULL(Pounds,0) 
	,@nStockLst_P = ISNULL(StockLst_P,0)
	,@nStockLst_QTY = ISNULL(StockLst_QTY,0) 
		FROM dbo.PurchaseOrder WHERE POitem = @cPOitem

DECLARE @nUse3rdDim BIT
SELECT @nUse3rdDim = dbo.f_GetForm_use3rdDim(@cForm)

DECLARE @cPriceUnit CHAR(2)
SELECT @cPriceUnit = dbo.f_GetFormUnitPrice(@cForm)


	begin
	IF @cPriceUnit = ''LB''
		begin
		--If you are buying more Lbs than Sold, just cost the amount sold
		IF @nStockLst_QTY > @nWeight
			SET @nCost = @nStockLst_P * @nWeight
		ELSE
			SET @nCost = @nStockLst_P * @nStockLst_QTY
		end
	ELSE
		begin
		IF @cPriceUnit = ''PC''
			begin
			--If you are buying more Pcs than Sold, just cost the amount sold
			IF @nStockLst_QTY > @nPieces
				SET @nCost = @nStockLst_P * @nPieces
			ELSE
				SET @nCost = @nStockLst_P * @nStockLst_QTY
			end
		ELSE
			begin
			--If you are buying more Pcs than Sold, just cost the amount sold
			IF @nStockLst_QTY > @nPieces * @nSz3 / 12
				SET @nCost = @nStockLst_P * @nPieces * @nSz3 / 12
			ELSE
				SET @nCost = @nStockLst_P * @nStockLst_QTY
			end
		end
	end
	

RETURN ISNULL(@nCost,0)
END


--GRANT EXECUTE ON [dbo].[f_CalcPOCost_POi] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CalcPOCost_POitem]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CalcPOCost_POitem]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_CalcPOCost_POitem]
(
@cForm CHAR(2),
@nPieces INT,
@nSz2 Float,
@nSz3 Float,
@nWeight Float,
@nServices BIT,
@nStockLst_P Money,
@nStockLst_QTY Money,
@cPOitem CHAR(12),
@SOitem CHAR(10)
)
RETURNS MONEY
AS
BEGIN
--SELECT dbo.f_CalcPOCost_POitem(''10'',1,0,0,10,0,2,3)
--SELECT dbo.f_CalcPOCost_POitem(Form,PCs,Sz2,Sz3,nWeight,bService,nP,nQTY)
--Return PO Cost summary Form type, f_CalcPOCost Does not use ReconcileTotal

declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @nCost MONEY
SET @nCost = 0

--IF @nServices > 0
--	RETURN ISNULL( @nStockLst_P, 0)

DECLARE @nReconcileTotal_Dist MONEY = 0
SELECT @nReconcileTotal_Dist = ISNULL( CASE WHEN PSD.ReconcileTotal > 0 THEN PSD.ReconcileTotal ELSE PSD.Total END ,0)
FROM dbo.PO_SOdist PSD 
WHERE PSD.POitem = @cPOitem
IF @nReconcileTotal_Dist > 0
	RETURN @nReconcileTotal_Dist


--***************************************************************
DECLARE @nReconcileTotal MONEY = 0
SELECT @nReconcileTotal = ISNULL(ReconcileTotal,0) FROM dbo.PurchaseOrder WHERE POitem = @cPOitem
IF @nReconcileTotal > 0
	RETURN @nReconcileTotal


--***************************************************************
SET @nCost = @nStockLst_P * @nStockLst_QTY
IF @nCost > 0
	RETURN @nCost


--***************************************************************
DECLARE @nForm Int
SELECT @nForm = CAST(@cForm AS Int)

DECLARE @nUse3rdDim BIT
SELECT @nUse3rdDim = dbo.f_GetForm_use3rdDim(@cForm)

DECLARE @cPriceUnit CHAR(2)
SELECT @cPriceUnit = dbo.f_GetFormUnitPrice(@cForm)



	begin
	IF @cPriceUnit = ''LB''
		begin
		--If you are buying more Lbs than Sold, just cost the amount sold
		IF @nStockLst_QTY > @nWeight
			SET @nCost = @nStockLst_P * @nWeight
		ELSE
			SET @nCost = @nStockLst_P * @nStockLst_QTY
		end
	ELSE
		begin
		IF @cPriceUnit = ''PC''
			begin
			--If you are buying more Pcs than Sold, just cost the amount sold
			IF @nStockLst_QTY > @nPieces
				SET @nCost = @nStockLst_P * @nPieces
			ELSE
				SET @nCost = @nStockLst_P * @nStockLst_QTY
			end
		ELSE
			begin
			--If you are buying more Pcs than Sold, just cost the amount sold
			IF @nStockLst_QTY > @nPieces * @nSz3 / 12
				SET @nCost = @nStockLst_P * @nPieces * @nSz3 / 12
			ELSE
				SET @nCost = @nStockLst_P * @nStockLst_QTY
			end
		end
	end
	

RETURN ISNULL(@nCost,0)
END

--GRANT EXECUTE ON [dbo].[f_CalcPOCost_POitem] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CalcPOCost_SOitem]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CalcPOCost_SOitem]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_CalcPOCost_SOitem]
( @SOitem CHAR(10)
)
RETURNS MONEY
AS
BEGIN
--SELECT dbo.f_CalcPOCost_SOitem(''  78703-01'')
--Return PO Cost summary Form type from SOitem

declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @POCost MONEY
SET @POCost = 0
							
SELECT @POCost = SUM( dbo.f_CalcPOCost_POitem(AQ.Form,AQ.Pieces,AQ.Sz2,AQ.Sz3,AQ.Weight,PO.services,PO.StockLst_P,PO.StockLst_QTY,PO.POitem,@SOitem) )
	FROM dbo.AllQuotes AQ 
	INNER JOIN dbo.PurchaseOrder PO ON PO.SOitem = AQ.SOitem
--	LEFT OUTER JOIN dbo.StockLst_Process SP ON SP.PO_item = PO.POitem
	WHERE AQ.SOitem = dbo.ProperSO(@SOitem)
	AND ISNULL(PO.cancelled,0) < 1
--	AND (SP.Process_ID = ''INCOMING  '' OR SP.Process_ID = ''PARTRECV'')
	
RETURN ISNULL(@POCost,0)
END


--GRANT EXECUTE ON [dbo].[f_CalcPOCost_SOitem] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CalcQtyDue_POitem]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CalcQtyDue_POitem]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_CalcQtyDue_POitem]
(
@cPOitem CHAR(12)
)
RETURNS INT
AS
BEGIN
--SELECT dbo.f_CalcQtyDue_POitem(''   510478-01'')

declare @err int,
        @RC int

set @err = 0
set @rc = 0

--DECLARE @nQtyDue INT
--SET @nQtyDue = 0

--IF @nServices > 0
--	RETURN ISNULL( @nStockLst_P, 0)

DECLARE @nQtyDue MONEY = 0

SELECT @nQtyDue = SUM(R.ActualW) 
	FROM dbo.Receiving R WITH(NOLOCK)
	INNER JOIN dbo.PurchaseOrder PO on R.POitem = PO.POitem
	WHERE R.POitem = @cPOitem
	AND PO.Cancelled = 0
	AND PO.Cmplt = 1

IF @nQtyDue IS NULL
	
	SELECT @nQtyDue=PO.Order_QTY
	FROM dbo.PurchaseOrder PO WITH(NOLOCK)
	WHERE PO.POitem = @cPOitem
		AND PO.Cancelled = 0
	

RETURN ISNULL(@nQtyDue,0)
END

--GRANT EXECUTE ON [dbo].[f_CalcQtyDue_POitem] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CalcS_PfromQ_Total]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CalcS_PfromQ_Total]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE  FUNCTION [dbo].[f_CalcS_PfromQ_Total]
(	
	@nS_QTY Money,
	@nQ_Total money
)
RETURNS MONEY
AS
BEGIN

--nS_P	= IIF(nP_PU=1,nP_lb+(nOtherP/nWeight), IIF(nP_PU=2,nP_Ft+(nOtherP/nFeet), nP_Pc+(nOtherP/nPieces)  ))

--Print dbo.f_CalcS_PfromQ_Total(S_QTY,Q_Total)
--Print dbo.f_Calc_S_P(Form,Weight,Pieces,P_lb,P_Pc,Sz2,Sz3,P_Ft,OtherP)

--Print dbo.f_Calc_QTY3(''L605'',''21'',1000,.125,36,0,'''')


--SELECT TOP 1 @Form=Form, @Pieces=Pieces, @Sz2=Sz2, @Sz3=Sz3, @Weight=[Weight] FROM dbo.AllQuotes WHERE SOitem = @SOitem
DECLARE @nS_P Money = 0


SET @nS_P = Case WHEN ISNULL(@nQ_Total,0) = 0  
	then 0 
	else @nQ_Total/@nS_QTY 
	end ;

/*	
DECLARE @nPlusOtherP Numeric(8,2) = 0
SET @nPlusOtherP = 
	CASE WHEN @PU = 1 THEN @nOtherP/@nS_QTY
	WHEN @PU = 2 THEN @nOtherP/@nFeet 
	WHEN @PU = 3 THEN @nOtherP/@nPieces 
	END;

SET @nS_P = ISNULL(@nS_P,0) + ISNULL(@nPlusOtherP,0)
*/

RETURN @nS_P
END


--GRANT EXECUTE ON [dbo].[f_CalcS_PfromQ_Total] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CalcSale_SOitem]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CalcSale_SOitem]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_CalcSale_SOitem]
( @SOitem CHAR(10)
)
RETURNS MONEY
AS
BEGIN
--SELECT dbo.f_CalcSale_SOitem(''  78703-01'')
--SELECT dbo.f_CalcSale_SOitem('' 102377-01'')
--Return SO Quote Total / Sale From SOitem

/*
DECLARE @SOitem CHAR(10) = '' 103598-01''
SELECT dbo.f_Calc_QTY(Alloy,Form,Pieces,Thck,Sz2,Sz3) AS ''Calc_QTY''
	, dbo.f_Calc_Weight(Alloy,Form,Pieces,Thck,Sz2,Sz3) AS ''Calc_Weight''
	, ISNULL(Form,'''') AS ''Form''
	, ISNULL(Pieces,1) AS ''Pieces''
	, ISNULL(Sz2,0) AS ''Sz2''
	, ISNULL(Sz3,0) AS ''Sz3''
	, ISNULL([Weight],0) AS ''weight''
	, ISNULL(p_lb,0) AS ''P_Lb''
	, ISNULL(p_pc,0) AS ''P_Pc''
	, ISNULL(p_ft,0) AS ''P_Ft''
	, ISNULL(LotP,0) AS ''LotP''
	, ISNULL(Q_P,0) AS ''Q_P''
	, ISNULL(Q_QTY,0) AS ''Q_QTY''
	, ISNULL(OtherP,0) AS ''OtherP''
	, ISNULL(Cuts,0) AS ''Cuts''
	, dbo.f_GetForm_use3rdDim(Form) AS ''Use3rdDim''
	, dbo.f_CalcSale_SOitem(@SOitem) AS ''f_CalcSale_SOitem''
	FROM dbo.AllQuotes WHERE SOitem = @SOitem
*/

declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @Sale MONEY = 0.0000
							
DECLARE @P MONEY = 0
DECLARE @QTY MONEY = 0
DECLARE @OtherFld CHAR(10)
DECLARE @OtherP MONEY = 0
DECLARE @Cuts Numeric(10,2) = 0

--SELECT @P = ISNULL(Q_P,0)	, @QTY = ISNULL(Q_QTY,0)	, @OtherP = ISNULL(OtherP,0)	, @Cuts = ISNULL(Cuts,0)	FROM dbo.AllQuotes WHERE SOitem = @SOitem


--dbo.f_Calc_QTY(Alloy,Form,PC,Dim1,Dim2,Dim3) AS f_Calc_QTY
--dbo.f_Calc_Weight(Alloy,Form,PC,Dim1,Dim2,Dim3) AS f_Calc_Weight

DECLARE @Calc_QTY MONEY, @Calc_Weight MONEY
DECLARE @cForm CHAR(2), @nPieces INT, @nSz2 NUMERIC(9,3), @nSz3 NUMERIC(9,3)
--use money to avoid rounding error.
--DECLARE @nWeight NUMERIC(7,1), @P_Lb Numeric(10,1), @P_Pc Numeric(10,1),@P_Ft Numeric(10,1),@LotP Numeric(10,1)
DECLARE @nWeight MONEY, @P_Lb MONEY, @P_Pc MONEY, @P_Ft MONEY, @LotP MONEY
DECLARE @nUse3rdDim BIT

SELECT @Calc_QTY = dbo.f_Calc_QTY(Alloy,Form,Pieces,Thck,Sz2,Sz3) 
	, @Calc_Weight = dbo.f_Calc_Weight(Alloy,Form,Pieces,Thck,Sz2,Sz3) 
	, @cForm = ISNULL(Form,'''')
	, @nPieces = ISNULL(Pieces,1) 
	, @nSz2 = ISNULL(Sz2,0)
	, @nSz3 = ISNULL(Sz3,0)
	, @nWeight = ISNULL([Weight],0)
	, @P_Lb = ISNULL(p_lb,0)
	, @P_Pc = ISNULL(p_pc,0)
	, @P_Ft = ISNULL(p_ft,0)
	, @LotP = ISNULL(LotP,0)
	, @P = ISNULL(Q_P,0)
	, @QTY = ISNULL(Q_QTY,0)
	, @OtherFld = ISNULL(OtherFld,'''')
	, @OtherP = ISNULL(OtherP,0)
	, @Cuts = ISNULL(Cuts,0)
	, @nUse3rdDim = dbo.f_GetForm_use3rdDim(Form)
	FROM dbo.AllQuotes WHERE SOitem = @SOitem

-----
IF @nPieces = 0
	SET @nPieces = 1

-----
IF @LotP > 0
	SET @Sale = @LotP
ELSE
	IF @P_Pc > 0
		SET @Sale = @P_Pc * @nPieces
	ELSE
		begin

		IF @P_Ft > 0
			IF @nUse3rdDim = 1
				SET @Sale = @P_Ft * @nPieces * @nSz3 / 12
			ELSE
				SET @Sale = @P_Ft * @nPieces * @nSz2 / 12

		IF @P_Lb > 0
			IF @nWeight > 0
				SET @Sale = @P_Lb * @nWeight
			ELSE
				SET @Sale = @P_Lb * @Calc_Weight

		end


/*
DECLARE @PU TinyInt
SELECT @PU = dbo.f_GetFormPU(@cForm)
	--1Lb, 2Ft 3Pc

IF @PU = 1
	SET @Sale = @P_Lb * @Calc_Weight
ELSE
	begin
	IF @PU = 3
		SET @Sale = @P_Pc * @nPieces
	ELSE
		begin
		IF @P_Ft > 0
			--Feet
			IF @nUse3rdDim = 1
				SET @Sale = @P_Ft * @nPieces * @nSz3 / 12
			ELSE
				SET @Sale = @P_Ft * @nPieces * @nSz2 / 12
		ELSE
			SET @Sale = 0
		end
	end
*/

DECLARE @NewQTY Money = 0

-------------------------------------------------------------------
IF @Sale = 0
	IF LEN(@OtherFld) > 0
	begin
		IF @OtherFld = ''Per Inch''
			begin
			--Inch
			IF @nUse3rdDim = 1
				begin
				SET @Sale = @OtherP * @nPieces * @nSz3 
				SET @NewQTY = @nPieces * @nSz3 
				end
			ELSE
				begin
				SET @Sale = @OtherP * @nPieces * @nSz2 
				SET @NewQTY = @nPieces * @nSz2 
				end

			--UPDATE dbo.AllQuotes SET Q_P=@OtherP, Q_QTY=@NewQTY WHERE SOitem = @SOitem

			end
		--IF @OtherFld = ''Per Hr''
		--	begin
		--	SET @Sale = @OtherP * 
		--	--UPDATE dbo.AllQuotes SET Q_P=@OtherP, Q_QTY= WHERE SOitem = @SOitem
		--	end

		IF @OtherFld = ''Per kg''
			begin
			SET @Sale = @OtherP * @Calc_Weight / 2.2

			--UPDATE dbo.AllQuotes SET Q_P=@OtherP, Q_QTY=@Calc_Weight/2.2 WHERE SOitem = @SOitem

			end

	end

-------------------------------------------------------------------
IF @Sale = 0
	SET @Sale = @P * @QTY


-------------------------------------------------------------------
--Add OtherPrice to Sale
IF @Sale > 0
	IF NOT ( @OtherFld = ''Per Inch'' OR @OtherFld = ''Per Hr'' OR @OtherFld = ''Per kg'' )
		SET @Sale = @Sale + @OtherP + @Cuts
	ELSE
		SET @Sale = @Sale + @Cuts

RETURN ISNULL(@Sale,0)
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CalcStkCost]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CalcStkCost]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_CalcStkCost]
(
@cForm CHAR(2),
@nPieces INT,
@nSz2 Float,
@nSz3 Float,
@nWeight Float,
--@nS_QTY Money,
@nStockLst_P Money
)
RETURNS MONEY
AS
BEGIN
--Old School-  Just use S_P * S_QTY to find Cost!!!
--This finds Price with WEIGHT

--SELECT dbo.f_CalcStkCost(''10'',1,0,0,10,2)
--SELECT dbo.f_CalcStkCost(Form,PCs,Sz2,Sz3,nQTY,nP)
--Return PO Cost summary Form type

declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @nCost MONEY
SET @nCost = 0

DECLARE @nUse3rdDim BIT
SELECT @nUse3rdDim = dbo.f_GetForm_use3rdDim(@cForm)


DECLARE @PU TinyInt
SELECT @PU = dbo.f_GetFormPU(@cForm)
--1Lb, 2Ft 3Pc

IF @PU = 1
	SET @nCost = @nStockLst_P * @nWeight
ELSE
	begin
	IF @PU = 3
		SET @nCost = @nStockLst_P * @nPieces
	ELSE
		begin
		--Feet
		IF @nUse3rdDim = 1
			SET @nCost = @nStockLst_P * @nPieces * @nSz3 / 12
		ELSE
			SET @nCost = @nStockLst_P * @nPieces * @nSz2 / 12
		end
	end

	

RETURN ISNULL(@nCost,0)
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CalcStkCost_Sales_Stock]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CalcStkCost_Sales_Stock]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_CalcStkCost_Sales_Stock]
( @SOitem CHAR(10)
)
RETURNS MONEY
AS
BEGIN
--SELECT dbo.f_CalcStkCost_Sales_Stock(''  78703-01'')
--Return Stk Cost summary from Sales_Stock by SOitem

declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @StkCost_Sales MONEY
SET @StkCost_Sales = 0
--IIF(Orig_QTY > StockLst_QTY, Orig_QTY, StockLst_QTY) AS StockLst_QTY

SELECT @StkCost_Sales = SUM(IIF(Orig_QTY > StockLst_QTY, Orig_QTY, StockLst_QTY) * IIF(Orig_P > StockLst_P, Orig_P, StockLst_P) ) 
FROM dbo.Sales_Stock WITH(NOLOCK)
WHERE SOitem = dbo.ProperSO(@SOitem)
AND TBL = ''S''

/*
DECLARE @StkCost_Select MONEY
SELECT @StkCost_Select = dbo.f_CalcStkCost_SOitem(@SOitem)

UPDATE dbo.Sales
	SET ItemCost = 
	StkCost = (@StkCost_Select + @StkCost_Sales)
	WHERE SOitem = dbo.ProperSO(@SOitem)
	AND TBL = ''S''
*/

RETURN ISNULL(@StkCost_Sales,0)
END

--GRANT EXECUTE ON [dbo].[f_CalcStkCost_Sales_Stock] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CalcStkCost_Sales_Stock_WO]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CalcStkCost_Sales_Stock_WO]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_CalcStkCost_Sales_Stock_WO]
( @WO INT
)
RETURNS MONEY
AS
BEGIN
--SELECT dbo.f_CalcStkCost_Sales_Stock_WO(1034)
--Return Stk Cost summary from dbo.Sales_Stock by WO

declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @StkCost_Sales MONEY
SET @StkCost_Sales = 0

--IIF(Orig_QTY > StockLst_QTY, Orig_QTY, StockLst_QTY) AS StockLst_QTY
SELECT @StkCost_Sales = SUM( IIF(Orig_QTY > StockLst_QTY, Orig_QTY, StockLst_QTY) * IIF(Orig_P > StockLst_P, Orig_P, StockLst_P) ) 
	FROM dbo.Sales_Stock WITH(NOLOCK) 
	WHERE WO = @WO

RETURN ISNULL(@StkCost_Sales,0)
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CalcStkCost_Selected_WO]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CalcStkCost_Selected_WO]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
Create FUNCTION [dbo].[f_CalcStkCost_Selected_WO]
( @WO INT
)
RETURNS MONEY
AS
BEGIN
--SELECT dbo.f_CalcStkCost_Selected_WO(1034)
--Return Stock Cost total for WO Selected in Stock, 
--use f_CalcStkCost_Sales_Stock  to get Completed Cost

declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @StkCost MONEY
SET @StkCost = 0

IF EXISTS(SELECT * FROM dbo.WorkOrder WHERE WO = @WO AND Cmplt = 0)
	begin
	--Get from StockLst_Detail, StockLst_Process when not Complete
	--Use CostValue if not Reconciled, S_P is 0     -- must use SUM(SP.QTY * SD.S_P) in this query
	SELECT @StkCost = CASE WHEN ISNULL(SUM(SP.QTY * SD.S_P) ,0) > 0 THEN SUM(SP.QTY * SD.S_P ) ELSE SUM(SP.QTY * SD.CostValue) END 
		FROM dbo.StockLst_Process SP
		INNER JOIN dbo.StockLst_Detail SD ON SD.ID_Detail = SP.ID_Detail
		WHERE SP.WO = @WO
		AND SP.Process_ID = ''SELECTED''
		--AND NOT ISNULL(dist.POitem,''-'') = ISNULL(SP.PO_item,''.'')  --Do not count Its own incoming Stock

	end

RETURN ISNULL(@StkCost,0)
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CalcStkCost_SOitem]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CalcStkCost_SOitem]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_CalcStkCost_SOitem]
( @SOitem CHAR(10)
)
RETURNS MONEY
AS
BEGIN
--SELECT dbo.f_CalcStkCost_SOitem(''  78703-01'')
--SELECT dbo.f_CalcStkCost_SOitem(''  89708-01'') AS StkCost 
--Return Stock Cost total for SOitem Selected in Stock, 
--use f_CalcStkCost_Sales_Stock  to get Completed Cost

declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @StkCost MONEY
SET @StkCost = 0

--IIF(Orig_QTY > StockLst_QTY, Orig_QTY, StockLst_QTY) AS StockLst_QTY

IF EXISTS(SELECT * FROM dbo.Sales WITH(NOLOCK) WHERE SOitem = dbo.ProperSO(@SOitem) AND Cmplt = 0)
	begin
	--Get from StockLst_Detail, StockLst_Process when not Complete
	--Use CostValue if not Reconciled, S_P is 0     -- must use SUM(SP.QTY * SD.S_P) in this query
	SELECT @StkCost = CASE WHEN ISNULL(SUM(SP.QTY * SD.S_P) ,0) > 0 THEN SUM(SP.QTY * SD.S_P ) ELSE SUM(SP.QTY * SD.CostValue) END 
		FROM dbo.StockLst_Process SP WITH(NOLOCK)
		INNER JOIN dbo.StockLst_Detail SD WITH(NOLOCK) ON SD.ID_Detail = SP.ID_Detail
		LEFT OUTER JOIN dbo.PO_SOdist dist ON dist.SOitem = SP.SOitem
		WHERE SP.SOitem = dbo.ProperSO(@SOitem)
		AND SP.Process_ID = ''SELECTED''
		AND NOT ISNULL(dist.POitem,''-'') = ISNULL(SP.PO_item,''.'')  --Do not count Its own incoming Stock

	end

/*
	begin
	--Get from Sales_Detail when Complete
	SELECT @StkCost = SUM(SD.StockLst_Qty * SD.StockLst_P ) 
		FROM dbo.Sales_Detail SD
		WHERE SD.SOitem =dbo.ProperSO(@SOitem)

	end
ELSE
*/

RETURN ISNULL(@StkCost,0)
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CalcStkPaid_SOitem]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CalcStkPaid_SOitem]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_CalcStkPaid_SOitem]
( @SOitem CHAR(10)
)
RETURNS MONEY
AS
BEGIN

--SELECT dbo.f_CalcStkPaid_SOitem('' 110912-01'') AS StkPaid 
--Return Stock Paid Total for SOitem

declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @StkPaid MONEY
SET @StkPaid = 0

IF EXISTS(SELECT * FROM dbo.Sales WHERE SOitem = dbo.f_ProperSOitem(@SOitem) AND Cmplt = 1)
	begin
	--Get from Sales_Detail when Complete
	SELECT @StkPaid = SUM(SD.StockLst_Qty * SD.StkPaid_P ) 
		FROM dbo.Sales_Detail SD
		WHERE SD.SOitem = dbo.f_ProperSOitem(@SOitem)
		--WHERE SD.SOitem = dbo.ProperSO(@SOitem)

	end
ELSE
	begin
	--Get from StockLst_Detail, StockLst_Process when not Complete
	--SELECT @StkPaid = SUM(SP.QTY * SD.InvoiceValue ) 
	SELECT @StkPaid = SUM( 
			CASE WHEN SP.Prc_QTY > 0 THEN SP.Prc_QTY ELSE SP.QTY END
				* 
			CASE WHEN SD.S_P > 0 THEN SD.S_P ELSE SD.InvoiceValue END
				)
		FROM dbo.StockLst_Process SP
		INNER JOIN dbo.StockLst_Detail SD ON SD.ID_Detail = SP.ID_Detail
		WHERE SP.SOitem = dbo.f_ProperSOitem(@SOitem)
	end

RETURN ISNULL(@StkPaid,0)
END

--GRANT EXECUTE ON [dbo].[f_CalcStkPaid_SOitem] TO [WINDFALL\HPA] AS [dbo];
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CalculateDaysLate]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CalculateDaysLate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2015 10 26
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_CalculateDaysLate] 
(
	-- Add the parameters for the function here
	@HPA_Due_Max date
	,@received date
)
RETURNS int
AS
BEGIN
DECLARE @daysLate int = 0
	,@holiday date
	,@HPADueMaxDay int
	,@recievedDay int
SET @daysLate = DATEDIFF(day, @HPA_Due_Max, @received)
SET @HPADueMaxDay = datepart(dw, @HPA_Due_Max)
SET @recievedDay = datepart(dw, @received)
declare MyCursor cursor STATIC for 
	SELECT TOP 1000 [HolidayDate]
		--,[HolidayName]
	FROM [dbo].[NR_HPA_Holidays]
open MyCursor
FETCH NEXT FROM MyCursor INTO @holiday
while @@FETCH_STATUS = 0 
begin
	if(@holiday >= @HPA_Due_Max
		AND @holiday <= @received)
	BEGIN
		SET @daysLate -= 1
	END
	FETCH NEXT FROM MyCursor INTO @holiday
end
close MyCursor
DEALLOCATE MyCursor
IF (@HPADueMaxDay != 6 OR @HPADueMaxDay != 7)
AND (@recievedDay != 6 OR @recievedDay != 7)
BEGIN
	IF(@HPADueMaxDay > @recievedDay)
	BEGIN
		SET @HPA_Due_Max = DATEADD(day, -(@HPADueMaxDay - @recievedDay), @HPA_Due_Max)
	END
	SET @daysLate -= DATEDIFF(week, @HPA_Due_Max, @received)*2
END

--ELSE IF datepart(dw, @Christmas) = 7
--BEGIN
--	SET @ThursdayBeforeChristmas = DATEADD(day, -3, @Christmas)
--	SET @FridayBeforeChristmas = DATEADD(day, -2, @Christmas)
--END

--SELECT @daysLate [Days Late]
return @daysLate

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CC_Adjust]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CC_Adjust]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_CC_Adjust]
(
@cAlloy char(12),
@cForm CHAR(2),
@cCC CHAR(1)
)

RETURNS NUMERIC(18,8)
AS
BEGIN
-- Adjusts Price from Anneal to cold work level or/and testing
--PRINT dbo.f_CC_Adjust(''HPA N60'',''10'',''A'')
--Print dbo.f_CC_Adjust(Alloy,Form,cc)


--SET NOCOUNT ON
----------------------



DECLARE @cCCAdjust CHAR(1)
SET @cCCAdjust = ''0''
DECLARE @nAdjust NUMERIC(18,8)
SET @nAdjust = 1

IF @cCC = ''A''
	SELECT TOP 1 @nAdjust = [A] FROM dbo.ConditionCodeAdjust
ELSE
IF @cCC = ''B''
	SELECT TOP 1 @nAdjust = [B] FROM dbo.ConditionCodeAdjust
ELSE
IF @cCC = ''C''
	SELECT TOP 1 @nAdjust = [C] FROM dbo.ConditionCodeAdjust
ELSE
IF @cCC = ''D''
	SELECT TOP 1 @nAdjust = [D] FROM dbo.ConditionCodeAdjust
ELSE
IF @cCC = ''E''
	SELECT TOP 1 @nAdjust = [E] FROM dbo.ConditionCodeAdjust
ELSE
IF @cCC = ''F''
	SELECT TOP 1 @nAdjust = [F] FROM dbo.ConditionCodeAdjust
ELSE
IF @cCC = ''R''
	SET @nAdjust = 1
ELSE
IF @cCC = ''S''
	SELECT TOP 1 @nAdjust = [S] FROM dbo.ConditionCodeAdjust
ELSE
IF @cCC = ''T''
	SELECT TOP 1 @nAdjust = [T] FROM dbo.ConditionCodeAdjust
ELSE
IF @cCC = ''U''
	SELECT TOP 1 @nAdjust = [U] FROM dbo.ConditionCodeAdjust
ELSE
IF @cCC = ''V''
	SELECT TOP 1 @nAdjust = [V] FROM dbo.ConditionCodeAdjust
ELSE
IF @cCC = ''W''
	SELECT TOP 1 @nAdjust = [W] FROM dbo.ConditionCodeAdjust
ELSE
IF @cCC = ''X''
	SELECT TOP 1 @nAdjust = [X] FROM dbo.ConditionCodeAdjust
ELSE	
IF @cCC = ''Y''
	SELECT TOP 1 @nAdjust = [Y] FROM dbo.ConditionCodeAdjust


---------------------------------------------------

RETURN @nAdjust
END

--GRANT EXECUTE ON [dbo].[f_CC_Adjust] TO [WINDFALL\HPA] AS [dbo];

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CC_CL_Avg_Cw]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CC_CL_Avg_Cw]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_CC_CL_Avg_Cw] 
(
	@cAlloy char(12),
	@cCC CHAR(1),
	@cCL CHAR(1),
	@nfSize Decimal(9,3)
)
RETURNS TinyInt
AS
BEGIN
-- RETURN ColdWork

--SELECT dbo.f_CC_CL_Avg_Cw(''HPA N60'',''7'',''4'',1.5)
--SELECT dbo.f_CC_CL_Avg_Cw(Alloy,CC,CL,Size)

DECLARE @ReturnTinyInt TinyInt = 0

	SELECT TOP 1 @ReturnTinyInt =

		AVG(G.ColdWork) * 100
		FROM dbo.GFMlog G 
		INNER JOIN dbo.NR_AlloyCodeLevel l ON G.AlloyName = l.Alloy 
			AND l.CC = @cCC
			AND l.CL = @cCL
			AND G.Tensile > (ISNULL(l.UTS,0)+1)*1000 
			AND G.Yield > (ISNULL(l.Yld,0)+1)*1000 
			AND G.Elongation > (ISNULL(l.EL,0)+.5)
			AND G.Red_Area > (ISNULL(l.RA,0)+.5) 
			AND G.Tensile < (ISNULL(l.UTS_Max,999))*1000 
			AND G.Yield < (ISNULL(l.Yld_Max,999))*1000

		WHERE G.AlloyName = @cAlloy
		AND ISNULL(G.sSize,0) > 0 
		AND ISNULL(G.ColdWork,0) > 0 
		AND ( fSize > @nfSize-.1 AND fSize < @nfSize+.1 )
	
		AND NOT (G.Notes LIKE ''%Hot%'' or G.Notes LIKE ''%From%'' OR G.Notes LIKE ''%HW %'' OR G.Notes LIKE ''%Anneal%'' )

/*
		Select Top 1 Data
		From   (
				Select Top 50 Percent Data
				From	@Temp
				Where	Data Is NOT NULL
				Order By Data
				) As A
		Order By Data DESC
*/

RETURN @ReturnTinyInt
END

--GRANT EXECUTE ON [dbo].[f_CC_CL_Avg_Cw] TO [WINDFALL\HPA] AS [dbo];

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CC_CL_Cnt]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CC_CL_Cnt]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_CC_CL_Cnt] 
(
@cAlloy char(12),
	@cCC CHAR(1),
	@cCL CHAR(1),
	@nfSize Decimal(9,3)
)
RETURNS Int
AS
BEGIN


--SELECT dbo.f_CC_CL_Cnt(''HPA N60'',''7'',''2'',1)
DECLARE @ReturnInt Int = 0

DECLARE @sql VarChar(MAX)
		

	SELECT @ReturnInt = SUM(t.CNTD)
	 FROM (
		SELECT COUNT(*) AS CNTD
		FROM dbo.GFMlog G 
		INNER JOIN dbo.NR_AlloyCodeLevel l ON G.AlloyName = l.Alloy 
			AND l.CC = @cCC
			AND l.CL = @cCL
			AND G.Tensile > (ISNULL(l.UTS,0)+1)*1000 
			AND G.Yield > (ISNULL(l.Yld,0)+1)*1000 
			AND G.Elongation > (ISNULL(l.EL,0)+.5)
			AND G.Red_Area > (ISNULL(l.RA,0)+.5) 
			AND G.Tensile < (ISNULL(l.UTS_Max,999))*1000 
			AND G.Yield < (ISNULL(l.Yld_Max,999))*1000

		WHERE G.AlloyName = @cAlloy
		AND ISNULL(G.sSize,0) > 0 
		AND ISNULL(G.ColdWork,0) > 0 
		AND ( fSize > @nfSize-.1 AND fSize < @nfSize+.1 )
	
		AND NOT (G.Notes LIKE ''%Hot%'' or G.Notes LIKE ''%From%'' OR G.Notes LIKE ''%HW %'' OR G.Notes LIKE ''%Anneal%'' )
		Group By sSize 
		) t 


RETURN @ReturnInt
END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CC_CL_DiaMax]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CC_CL_DiaMax]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_CC_CL_DiaMax] 
(
	@cAlloy char(12),
	@cCC CHAR(1),
	@cCL CHAR(1)
)
RETURNS Numeric(9,3)
AS
BEGIN

--SELECT dbo.f_CC_CL_DiaMax(''HPA N60'',''7'',''6'')
DECLARE @ReturnNumeric Numeric(9,3) = 0

--DECLARE @cAlloy CHAR(12)=''HPA N60''
--DECLARE @cCC CHAR(1) = ''7''
--DECLARE @cCL CHAR(1) = ''6''

SELECT @ReturnNumeric = DiaMax
--SELECT *
FROM dbo.NR_AlloyCodeLevel l 
	WHERE l.Alloy = @cAlloy 
	AND l.CC = @cCC
	AND l.CL = @cCL

RETURN @ReturnNumeric
END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CC_CL_Max_Cw]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CC_CL_Max_Cw]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_CC_CL_Max_Cw] 
(
	@cAlloy char(12),
	@cCC CHAR(1),
	@cCL CHAR(1),
	@nfSize Decimal(9,3)
)
RETURNS TinyInt
AS
BEGIN


--SELECT dbo.f_CC_CL_Max_Cw(''HPA N60'',''7'',''2'',1)
DECLARE @ReturnTinyInt TinyInt = 0
		

	SELECT @ReturnTinyInt =
		Max(t.MaxCW) * 100
	 FROM (
		SELECT 
		Max(G.ColdWork) AS MaxCW
		FROM dbo.GFMlog G 
		INNER JOIN dbo.NR_AlloyCodeLevel l ON G.AlloyName = l.Alloy 
			AND l.CC = @cCC
			AND l.CL = @cCL
			AND G.Tensile > (ISNULL(l.UTS,0)+1)*1000 
			AND G.Yield > (ISNULL(l.Yld,0)+1)*1000 
			AND G.Elongation > (ISNULL(l.EL,0)+.5)
			AND G.Red_Area > (ISNULL(l.RA,0)+.5) 
			AND G.Tensile < (ISNULL(l.UTS_Max,999))*1000 
			AND G.Yield < (ISNULL(l.Yld_Max,999))*1000

		WHERE G.AlloyName = @cAlloy
		AND ISNULL(G.sSize,0) > 0 
		AND ISNULL(G.ColdWork,0) > 0 
		AND ( fSize > @nfSize-.1 AND fSize < @nfSize+.1 )
	
		AND NOT (G.Notes LIKE ''%Hot%'' or G.Notes LIKE ''%From%'' OR G.Notes LIKE ''%HW %'' OR G.Notes LIKE ''%Anneal%'' )
		Group By sSize 
		) t 


RETURN @ReturnTinyInt
END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CC_CL_Median_Cw]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CC_CL_Median_Cw]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_CC_CL_Median_Cw] 
(
	@cAlloy char(12),
	@cCC CHAR(1),
	@cCL CHAR(1),
	@nfSize Decimal(9,3)
)
RETURNS TinyInt
AS
BEGIN


--SELECT dbo.f_CC_CL_Median_Cw(''HPA N60'',''7'',''2'',1)
--SELECT dbo.f_CC_CL_Median_Cw(Alloy,CC,CL,Size)

DECLARE @ReturnTinyInt TinyInt = 0

	SELECT TOP 1 @ReturnTinyInt =
	 t.Median * 100
	 FROM (
		SELECT 
		TOP 50 Percent G.ColdWork AS Median
		FROM dbo.GFMlog G 
		INNER JOIN dbo.NR_AlloyCodeLevel l ON G.AlloyName = l.Alloy 
			AND l.CC = @cCC
			AND l.CL = @cCL
			AND G.Tensile > (ISNULL(l.UTS,0)+1)*1000 
			AND G.Yield > (ISNULL(l.Yld,0)+1)*1000 
			AND G.Elongation > (ISNULL(l.EL,0)+.5)
			AND G.Red_Area > (ISNULL(l.RA,0)+.5) 
			AND G.Tensile < (ISNULL(l.UTS_Max,999))*1000 
			AND G.Yield < (ISNULL(l.Yld_Max,999))*1000

		WHERE G.AlloyName = @cAlloy
		AND ISNULL(G.sSize,0) > 0 
		AND ISNULL(G.ColdWork,0) > 0 
		AND ( fSize > @nfSize-.1 AND fSize < @nfSize+.1 )
	
		AND NOT (G.Notes LIKE ''%Hot%'' or G.Notes LIKE ''%From%'' OR G.Notes LIKE ''%HW %'' OR G.Notes LIKE ''%Anneal%'' )
		ORDER BY G.ColdWork DESC 
		) t 

/*
		Select Top 1 Data
		From   (
				Select Top 50 Percent Data
				From	@Temp
				Where	Data Is NOT NULL
				Order By Data
				) As A
		Order By Data DESC
*/

RETURN @ReturnTinyInt
END

--GRANT EXECUTE ON [dbo].[f_CC_CL_Median_Cw] TO [WINDFALL\HPA] AS [dbo];

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CC_CL_Min_Cw]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CC_CL_Min_Cw]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_CC_CL_Min_Cw] 
(
	@cAlloy char(12),
	@cCC CHAR(1),
	@cCL CHAR(1),
	@nfSize Decimal(9,3)
)
RETURNS TinyInt
AS
BEGIN


--SELECT dbo.f_CC_CL_Min_Cw(''HPA N60'',''7'',''2'',1)
DECLARE @ReturnTinyInt TinyInt = 0

	SELECT @ReturnTinyInt =
	 MIN(t.MinCW) * 100
	 FROM (
		SELECT 
		MIN(G.ColdWork) AS MinCW 
		FROM dbo.GFMlog G 
		INNER JOIN dbo.NR_AlloyCodeLevel l ON G.AlloyName = l.Alloy 
			AND l.CC = @cCC
			AND l.CL = @cCL
			AND G.Tensile > (ISNULL(l.UTS,0)+1)*1000 
			AND G.Yield > (ISNULL(l.Yld,0)+1)*1000 
			AND G.Elongation > (ISNULL(l.EL,0)+.5)
			AND G.Red_Area > (ISNULL(l.RA,0)+.5) 
			AND G.Tensile < (ISNULL(l.UTS_Max,999))*1000 
			AND G.Yield < (ISNULL(l.Yld_Max,999))*1000

		WHERE G.AlloyName = @cAlloy
		AND ISNULL(G.sSize,0) > 0 
		AND ISNULL(G.ColdWork,0) > 0 
		AND ( fSize > @nfSize-.1 AND fSize < @nfSize+.1 )
	
		AND NOT (G.Notes LIKE ''%Hot%'' or G.Notes LIKE ''%From%'' OR G.Notes LIKE ''%HW %'' OR G.Notes LIKE ''%Anneal%'' )
		Group By sSize 
		) t 


RETURN @ReturnTinyInt
END


--GRANT EXECUTE ON [dbo].[f_CC_CL_Min_Cw] TO [WINDFALL\HPA] AS [dbo];
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CC_CL_Start]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CC_CL_Start]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_CC_CL_Start] 
(
@cAlloy char(12),
	@cCC CHAR(1),
	@cCL CHAR(1),
	@nfSize Decimal(9,3)
)
RETURNS Decimal(9,3)

AS
BEGIN
--RETURNS Starting Stock Dia

--SELECT dbo.f_CC_CL_Start(''HPA N60'',''7'',''2'',1)
--SELECT dbo.f_CC_CL_Start(''HPA N60'',''7'',''1'',1.625)
--SELECT dbo.f_CC_CL_Start(''HPA N60'',''7'',''2'',3.5)

DECLARE @ReturnDec Decimal(9,3) = 0

DECLARE @sql VarChar(MAX)
		
SET @cCC = CASE WHEN @cCC = ''S'' THEN ''7'' WHEN @cCC = ''L'' THEN ''7'' ELSE @cCC END;
SET @cCL = (CASE WHEN (@cCL = ''A'') THEN ''1'' WHEN (@cCL = ''B'') THEN ''2'' WHEN (@cCL = ''C'') THEN ''3'' WHEN (@cCL = ''D'') THEN ''4'' WHEN (@cCL = ''E'') THEN ''5'' WHEN (@cCL = ''G'') THEN ''6'' ELSE @cCL END) ;

		SELECT @ReturnDec = AVG(sSize)
		FROM dbo.GFMlog G 
		INNER JOIN dbo.NR_AlloyCodeLevel l ON G.AlloyName = l.Alloy 
			AND l.CC = @cCC
			AND l.CL = @cCL
			AND G.Tensile > (ISNULL(l.UTS,0)+1)*1000 
			AND G.Yield > (ISNULL(l.Yld,0)+1)*1000 
			AND G.Elongation > (ISNULL(l.EL,0)+.5)
			AND G.Red_Area > (ISNULL(l.RA,0)+.5) 
			AND G.Tensile < (ISNULL(l.UTS_Max,999))*1000 
			AND G.Yield < (ISNULL(l.Yld_Max,999))*1000

		WHERE G.AlloyName = @cAlloy
		AND ISNULL(G.sSize,0) > 0 
		AND ISNULL(G.ColdWork,0) > 0 
		AND ( (fSize*1.2) > @nfSize-.1 AND (fSize*.8) < @nfSize+.3 )
	
		AND NOT (G.Notes LIKE ''%Hot%'' or G.Notes LIKE ''%From%'' OR G.Notes LIKE ''%HW %'' OR G.Notes LIKE ''%Anneal%'' )

RETURN @ReturnDec
END



--GRANT EXECUTE ON [dbo].[f_CC_CL_Start] TO [WINDFALL\HPA] AS [dbo];
/*
CC	CL	CCCL2	Thck
7	1	71		4.75
7	4	74		4.121
7	4	74		4.15
7	4	74		4.156
7	4	74		4.34
7	5	75		2.5
7	5	75		4
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CC_CL_Start_Avg]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CC_CL_Start_Avg]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_CC_CL_Start_Avg] 
(
@cAlloy char(12),
	@cCC CHAR(1),
	@cCL CHAR(1),
	@nfSize Decimal(9,3)
)
RETURNS Decimal(9,3)

AS
BEGIN


--SELECT dbo.f_CC_CL_Start_AVG(''HPA N60'',''7'',''2'',1)

DECLARE @ReturnDec Decimal(9,3) = 0

DECLARE @sql VarChar(MAX)
		
		
SET @cCC = CASE WHEN @cCC = ''S'' THEN ''7'' WHEN @cCC = ''L'' THEN ''7'' ELSE @cCC END;
SET @cCL = (CASE WHEN (@cCL = ''A'') THEN ''1'' WHEN (@cCL = ''B'') THEN ''2'' WHEN (@cCL = ''C'') THEN ''3'' WHEN (@cCL = ''D'') THEN ''4'' WHEN (@cCL = ''E'') THEN ''5'' WHEN (@cCL = ''G'') THEN ''6'' ELSE @cCL END) ;


		SELECT @ReturnDec = AVG(sSize)
		FROM dbo.GFMlog G 
		INNER JOIN dbo.NR_AlloyCodeLevel l ON G.AlloyName = l.Alloy 
			AND l.CC = @cCC
			AND l.CL = @cCL
			AND G.Tensile > (ISNULL(l.UTS,0)+1)*1000 
			AND G.Yield > (ISNULL(l.Yld,0)+1)*1000 
			AND G.Elongation > (ISNULL(l.EL,0)+.5)
			AND G.Red_Area > (ISNULL(l.RA,0)+.5) 
			AND G.Tensile < (ISNULL(l.UTS_Max,999))*1000 
			AND G.Yield < (ISNULL(l.Yld_Max,999))*1000

		WHERE G.AlloyName = @cAlloy
		AND ISNULL(G.sSize,0) > 0 
		AND ISNULL(G.ColdWork,0) > 0 
		--AND ( (fSize*1.2) > @nfSize-.1 AND (fSize*.8) < @nfSize+.3 )
		AND ( (fSize*1.1) > @nfSize-.1 AND (fSize*.9) < @nfSize+.3 )
	
		AND NOT (G.Notes LIKE ''%Hot%'' or G.Notes LIKE ''%From%'' OR G.Notes LIKE ''%HW %'' OR G.Notes LIKE ''%Anneal%'' )

RETURN @ReturnDec
END



--GRANT EXECUTE ON [dbo].[f_CC_CL_Start_Avg] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CC_CL_Start_Avg_Cnt]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CC_CL_Start_Avg_Cnt]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_CC_CL_Start_Avg_Cnt] 
(
@cAlloy char(12),
	@cCC CHAR(1),
	@cCL CHAR(1),
	@nfSize Decimal(9,3)
)
RETURNS INT
AS
BEGIN


--SELECT dbo.f_CC_CL_Start(''HPA N60'',''7'',''2'',1)
DECLARE @Return INT
DECLARE @Start_Min_Dia DECIMAL(9,3) = 0
DECLARE @Start_Avg_Dia DECIMAL(9,3) = 0
DECLARE @Start_Max_Dia DECIMAL(9,3) = 0

		
SET @cCC = CASE WHEN @cCC = ''S'' THEN ''7'' WHEN @cCC = ''L'' THEN ''7'' ELSE @cCC END;
SET @cCL = (CASE WHEN (@cCL = ''A'') THEN ''1'' WHEN (@cCL = ''B'') THEN ''2'' WHEN (@cCL = ''C'') THEN ''3'' WHEN (@cCL = ''D'') THEN ''4'' WHEN (@cCL = ''E'') THEN ''5'' WHEN (@cCL = ''G'') THEN ''6'' ELSE @cCL END) ;

SET @Start_Min_Dia = dbo.f_CC_CL_Start_Min(@cAlloy, @cCC, @cCL, @nfSize)
SET @Start_Avg_Dia = dbo.f_CC_CL_Start_Avg(@cAlloy, @cCC, @cCL, @nfSize)
SET @Start_Max_Dia = dbo.f_CC_CL_Start_Max(@cAlloy, @cCC, @cCL, @nfSize)

DECLARE @sql VarChar(MAX)
		

		SELECT @Return = COUNT(sSize)
		FROM dbo.GFMlog G 
		INNER JOIN dbo.NR_AlloyCodeLevel l ON G.AlloyName = l.Alloy 
			AND l.CC = @cCC
			AND l.CL = @cCL
			AND G.Tensile > (ISNULL(l.UTS,0)+1)*1000 
			AND G.Yield > (ISNULL(l.Yld,0)+1)*1000 
			AND G.Elongation > (ISNULL(l.EL,0)+.5)
			AND G.Red_Area > (ISNULL(l.RA,0)+.5) 
			AND G.Tensile < (ISNULL(l.UTS_Max,999))*1000 
			AND G.Yield < (ISNULL(l.Yld_Max,999))*1000

		WHERE G.AlloyName = @cAlloy
		AND ISNULL(G.sSize,0) > 0 
		AND ISNULL(G.ColdWork,0) > 0 
		
		AND (G.sSize >= @Start_Min_Dia+.1 AND G.sSize <= @Start_Max_Dia-.1 )
		--AND ( fSize > @nfSize-.1 AND fSize < @nfSize+.1 )
		AND ( (fSize*1.1) > @nfSize-.1 AND (fSize*.9) < @nfSize+.3 )

		AND NOT (G.Notes LIKE ''%Hot%'' or G.Notes LIKE ''%From%'' OR G.Notes LIKE ''%HW %'' OR G.Notes LIKE ''%Anneal%'' )

RETURN @Return
END



--GRANT EXECUTE ON [dbo].[f_CC_CL_Start_Avg_Cnt] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CC_CL_Start_Max]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CC_CL_Start_Max]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_CC_CL_Start_Max] 
(
@cAlloy char(12),
	@cCC CHAR(1),
	@cCL CHAR(1),
	@nfSize Decimal(9,3)
)
RETURNS Decimal(9,3)

AS
BEGIN


--SELECT dbo.f_CC_CL_Start(''HPA N60'',''7'',''2'',1)
DECLARE @ReturnDec Decimal(9,3) = 0

DECLARE @sql VarChar(MAX)
		
		
SET @cCC = CASE WHEN @cCC = ''S'' THEN ''7'' WHEN @cCC = ''L'' THEN ''7'' ELSE @cCC END;
SET @cCL = (CASE WHEN (@cCL = ''A'') THEN ''1'' WHEN (@cCL = ''B'') THEN ''2'' WHEN (@cCL = ''C'') THEN ''3'' WHEN (@cCL = ''D'') THEN ''4'' WHEN (@cCL = ''E'') 
                   THEN ''5'' WHEN (@cCL = ''G'') THEN ''6'' ELSE @cCL END) ;

		SELECT @ReturnDec = MAX(sSize)
		FROM dbo.GFMlog G 
		INNER JOIN dbo.NR_AlloyCodeLevel l ON G.AlloyName = l.Alloy 
			AND l.CC = @cCC
			AND l.CL = @cCL
			AND G.Tensile > (ISNULL(l.UTS,0)+1)*1000 
			AND G.Yield > (ISNULL(l.Yld,0)+1)*1000 
			AND G.Elongation > (ISNULL(l.EL,0)+.5)
			AND G.Red_Area > (ISNULL(l.RA,0)+.5) 
			AND G.Tensile < (ISNULL(l.UTS_Max,999))*1000 
			AND G.Yield < (ISNULL(l.Yld_Max,999))*1000

		WHERE G.AlloyName = @cAlloy
		AND ISNULL(G.sSize,0) > 0 
		AND ISNULL(G.ColdWork,0) > 0 
		AND ( fSize > @nfSize-.1 AND fSize < @nfSize+.1 )
	
		AND NOT (G.Notes LIKE ''%Hot%'' or G.Notes LIKE ''%From%'' OR G.Notes LIKE ''%HW %'' OR G.Notes LIKE ''%Anneal%'' )

RETURN @ReturnDec
END



--GRANT EXECUTE ON [dbo].[f_CC_CL_Start_Max] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CC_CL_Start_Max_Cnt]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CC_CL_Start_Max_Cnt]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_CC_CL_Start_Max_Cnt] 
(
@cAlloy char(12),
	@cCC CHAR(1),
	@cCL CHAR(1),
	@nfSize Decimal(9,3)
)
RETURNS INT
AS
BEGIN


--SELECT dbo.f_CC_CL_Start(''HPA N60'',''7'',''2'',1)
DECLARE @Return INT
DECLARE @Start_Max_Dia DECIMAL(9,3) = 0

		
SET @cCC = CASE WHEN @cCC = ''S'' THEN ''7'' WHEN @cCC = ''L'' THEN ''7'' ELSE @cCC END;
SET @cCL = (CASE WHEN (@cCL = ''A'') THEN ''1'' WHEN (@cCL = ''B'') THEN ''2'' WHEN (@cCL = ''C'') THEN ''3'' WHEN (@cCL = ''D'') THEN ''4'' WHEN (@cCL = ''E'') 
                   THEN ''5'' WHEN (@cCL = ''G'') THEN ''6'' ELSE @cCL END) ;

SET @Start_Max_Dia = dbo.f_CC_CL_Start_Max(@cAlloy, @cCC, @cCL, @nfSize);

DECLARE @sql VarChar(MAX)

		SELECT @Return = COUNT(sSize)
		FROM dbo.GFMlog G 
		INNER JOIN dbo.NR_AlloyCodeLevel l ON G.AlloyName = l.Alloy 
			AND l.CC = @cCC
			AND l.CL = @cCL
			AND G.Tensile > (ISNULL(l.UTS,0)+1)*1000 
			AND G.Yield > (ISNULL(l.Yld,0)+1)*1000 
			AND G.Elongation > (ISNULL(l.EL,0)+.5)
			AND G.Red_Area > (ISNULL(l.RA,0)+.5) 
			AND G.Tensile < (ISNULL(l.UTS_Max,999))*1000 
			AND G.Yield < (ISNULL(l.Yld_Max,999))*1000

		WHERE G.AlloyName = @cAlloy
		AND ISNULL(G.sSize,0) > 0 
		AND ISNULL(G.ColdWork,0) > 0 
		
		AND (G.sSize = @Start_Max_Dia )
		AND ( fSize > @nfSize-.1 AND fSize < @nfSize+.1 )
	
		AND NOT (G.Notes LIKE ''%Hot%'' or G.Notes LIKE ''%From%'' OR G.Notes LIKE ''%HW %'' OR G.Notes LIKE ''%Anneal%'' )

RETURN @Return
END



--GRANT EXECUTE ON [dbo].[f_CC_CL_Start_Max_Cnt] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CC_CL_Start_Min]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CC_CL_Start_Min]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_CC_CL_Start_Min] 
(
@cAlloy char(12),
	@cCC CHAR(1),
	@cCL CHAR(1),
	@nfSize Decimal(9,3)
)
RETURNS Decimal(9,3)

AS
BEGIN


--SELECT dbo.f_CC_CL_Start(''HPA N60'',''7'',''2'',1)
DECLARE @ReturnDec Decimal(9,3) = 0

DECLARE @sql VarChar(MAX)

		
SET @cCC = CASE WHEN @cCC = ''S'' THEN ''7'' WHEN @cCC = ''L'' THEN ''7'' ELSE @cCC END;
SET @cCL = (CASE WHEN (@cCL = ''A'') THEN ''1'' WHEN (@cCL = ''B'') THEN ''2'' WHEN (@cCL = ''C'') THEN ''3'' WHEN (@cCL = ''D'') THEN ''4'' WHEN (@cCL = ''E'') 
                   THEN ''5'' WHEN (@cCL = ''G'') THEN ''6'' ELSE @cCL END) ;		

		SELECT @ReturnDec = MIN(sSize)
		FROM dbo.GFMlog G 
		INNER JOIN dbo.NR_AlloyCodeLevel l ON G.AlloyName = l.Alloy 
			AND l.CC = @cCC
			AND l.CL = @cCL
			AND G.Tensile > (ISNULL(l.UTS,0)+1)*1000 
			AND G.Yield > (ISNULL(l.Yld,0)+1)*1000 
			AND G.Elongation > (ISNULL(l.EL,0)+.5)
			AND G.Red_Area > (ISNULL(l.RA,0)+.5) 
			AND G.Tensile < (ISNULL(l.UTS_Max,999))*1000 
			AND G.Yield < (ISNULL(l.Yld_Max,999))*1000

		WHERE G.AlloyName = @cAlloy
		AND ISNULL(G.sSize,0) > 0 
		AND ISNULL(G.ColdWork,0) > 0 
		AND ( fSize > @nfSize-.1 AND fSize < @nfSize+.1 )
	
		AND NOT (G.Notes LIKE ''%Hot%'' or G.Notes LIKE ''%From%'' OR G.Notes LIKE ''%HW %'' OR G.Notes LIKE ''%Anneal%'' )

RETURN @ReturnDec
END



--GRANT EXECUTE ON [dbo].[f_CC_CL_Start_Min] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CC_CL_Start_Min_Cnt]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CC_CL_Start_Min_Cnt]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_CC_CL_Start_Min_Cnt] 
(
@cAlloy char(12),
	@cCC CHAR(1),
	@cCL CHAR(1),
	@nfSize Decimal(9,3)
)
RETURNS INT
AS
BEGIN


--SELECT dbo.f_CC_CL_Start(''HPA N60'',''7'',''2'',1)
DECLARE @Return INT = 0
DECLARE @Start_Min_Dia DECIMAL(9,3) = 0

		
SET @cCC = CASE WHEN @cCC = ''S'' THEN ''7'' WHEN @cCC = ''L'' THEN ''7'' ELSE @cCC END;
SET @cCL = (CASE WHEN (@cCL = ''A'') THEN ''1'' WHEN (@cCL = ''B'') THEN ''2'' WHEN (@cCL = ''C'') THEN ''3'' WHEN (@cCL = ''D'') THEN ''4'' WHEN (@cCL = ''E'') 
                   THEN ''5'' WHEN (@cCL = ''G'') THEN ''6'' ELSE @cCL END) ;

SET @Start_Min_Dia = dbo.f_CC_CL_Start_Min(@cAlloy, @cCC, @cCL, @nfSize)

DECLARE @sql VarChar(MAX)
		

		SELECT @Return = COUNT(sSize)
		FROM dbo.GFMlog G 
		INNER JOIN dbo.NR_AlloyCodeLevel l ON G.AlloyName = l.Alloy 
			AND l.CC = @cCC
			AND l.CL = @cCL
			AND G.Tensile > (ISNULL(l.UTS,0)+1)*1000 
			AND G.Yield > (ISNULL(l.Yld,0)+1)*1000 
			AND G.Elongation > (ISNULL(l.EL,0)+.5)
			AND G.Red_Area > (ISNULL(l.RA,0)+.5) 
			AND G.Tensile < (ISNULL(l.UTS_Max,999))*1000 
			AND G.Yield < (ISNULL(l.Yld_Max,999))*1000

		WHERE G.AlloyName = @cAlloy
		AND ISNULL(G.sSize,0) > 0 
		AND ISNULL(G.ColdWork,0) > 0 
		
		AND (G.sSize = @Start_Min_Dia )
		AND ( fSize > @nfSize-.1 AND fSize < @nfSize+.1 )
	
		AND NOT (G.Notes LIKE ''%Hot%'' or G.Notes LIKE ''%From%'' OR G.Notes LIKE ''%HW %'' OR G.Notes LIKE ''%Anneal%'' )

RETURN @Return
END



--GRANT EXECUTE ON [dbo].[f_CC_CL_Start_Min_Cnt] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CC_CLsort]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CC_CLsort]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_CC_CLsort]
(
@cCC CHAR(1),
@cCL CHAR(1)
)
RETURNS CHAR(2)
AS
BEGIN
-- SELECT dbo.f_CC_CLsort(''7'',''2'') AS [NewCCCL]
-- SELECT dbo.f_CC_CLsort(CC,CL) AS [NewCCCL]

declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @cCC_CL CHAR(2)
SET @cCC_CL = ''  ''

SELECT @cCC_CL=newCCCL FROM dbo.ConditionCode WHERE CC = @cCC

DECLARE @cReturnCC_CL CHAR(2)
SET @cReturnCC_CL = ''  '' 
IF LEN(RTRIM(@cCL)) > 0
	IF LEN(RTRIM(@cCC_CL)) = 1
		SET @cReturnCC_CL = RTRIM(@cCC_CL) + @cCL
	ELSE
		SET @cReturnCC_CL = @cCC_CL
ELSE
	SET @cReturnCC_CL = @cCC_CL


--select @RC = @@ROWCOUNT, @err = @@ERROR

RETURN @cReturnCC_CL
END




--GRANT EXECUTE ON [dbo].[f_CC_CLsort] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CC_Common]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CC_Common]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_CC_Common]
(
@cCC CHAR(1),
@cAlloy CHAR(12)
)
RETURNS CHAR(1)
AS
BEGIN
-- USE SELECT dbo.f_CC_Common(''7'',''HPA N60'')
--Return ''Typ'' if CC Alloy is Common
--PRINT dbo.f_CC_Common (ISNULL(CC,''''),''HPA N60'')
--PRINT dbo.f_CC_Common (''2'',''HPA N60'')
--PRINT dbo.f_CC_Common (''5'',''HPA N60'')

DECLARE @cCC_Common CHAR(1)

declare @err int,
        @RC int

set @err = 0
set @rc = 0

--SET @cCC_Common = '' ''
--SELECT TOP 1 @cCC_Common = ''*''
/*
IF EXISTS( SELECT *
			FROM dbo.AllQuotes AQ 
			WHERE AQ.Alloy = @cAlloy
			AND AQ.CC = @cCC
			AND AQ.SalesNum > 0)
	SET @cCC_Common = ''*'' 
ELSE
	SET @cCC_Common = '' '' 
*/
IF EXISTS( SELECT *
			FROM dbo.PriceTable WITH(NOLOCK) 
			WHERE Alloy = @cAlloy
			AND CC = @cCC
			)
	SET @cCC_Common = ''*'' 
ELSE
	SET @cCC_Common = '' '' 

--select @RC = @@ROWCOUNT, @err = @@ERROR

RETURN @cCC_Common
END


--GRANT EXECUTE ON [dbo].[f_CC_Common] TO [WINDFALL\HPA] AS [dbo];
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CC_ESR]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CC_ESR]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_CC_ESR] 
(
@pcCC char(1)
)
RETURNS char(1)
AS
BEGIN

--SELECT dbo.f_CC_ESR(''R'') AS CC
--SELECT * FROM dbo.ConditionCode

DECLARE @lcCCSort char(1)

IF @pcCC = ''R''
	SET @lcCCSort = ''1''
--ELSE IF @pcCC = ''L''
--	SET @lcCCSort = ''7''
ELSE
	SET @lcCCSort = @pcCC

--IF @pcCC = ''S''
--	SET @lcCCSort = ''7''
--ELSE


RETURN (@lcCCSort)
END



--GRANT EXECUTE ON [dbo].[f_CC_ESR] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CCCLtoOldCC]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CCCLtoOldCC]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_CCCLtoOldCC]
(
@cCC CHAR(1)
,@cCL CHAR(1)
)
RETURNS CHAR(1)
AS
BEGIN
-- PRINT SELECT dbo.f_CCCLtoOldCC(''8'',''2'')

DECLARE @cCCStandard CHAR(1)

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @cCCStandard = ''1''

SET @cCCStandard = 
	CASE @cCC 
	WHEN ''7'' THEN ( 
		CASE @cCL 
		WHEN ''1'' THEN ''T''
		WHEN ''2'' THEN ''U''
		WHEN ''3'' THEN ''V''
		WHEN ''4'' THEN ''W''
		WHEN ''5'' THEN ''X''
		WHEN ''6'' THEN ''Y''	
		END
		)
	WHEN ''S'' THEN ( 
		CASE @cCL 
		WHEN ''1'' THEN ''T''
		WHEN ''2'' THEN ''U''
		WHEN ''3'' THEN ''V''
		WHEN ''4'' THEN ''W''
		WHEN ''5'' THEN ''X''
		WHEN ''6'' THEN ''Y''
		END	
		)
	WHEN ''L'' THEN ( 
		CASE @cCL 
		WHEN ''1'' THEN ''A''
		WHEN ''2'' THEN ''B''
		WHEN ''3'' THEN ''C''
		WHEN ''4'' THEN ''D''
		WHEN ''5'' THEN ''E''
		END	
		)
	ELSE @cCC END
	
--select @RC = @@ROWCOUNT, @err = @@ERROR

RETURN @cCCStandard
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CCSort]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CCSort]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_CCSort] 
(
@pcCC char(1)
)
RETURNS char(1)
AS
BEGIN

--SELECT dbo.f_CCSort(''R'')
--SELECT dbo.f_CCSort(''4'')
--SET @CCSort = dbo.f_CCSort(inserted.[CC])
--SELECT CCSort,* FROM dbo.ConditionCode

DECLARE @lcCCSort char(1)

SELECT TOP 1 @lcCCSort = CCSort FROM dbo.ConditionCode WHERE CC = @pcCC

RETURN (@lcCCSort)
END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CCStandard]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CCStandard]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_CCStandard]
(
@cCC CHAR(1)
)
RETURNS CHAR(1)
AS
BEGIN
-- USE SELECT dbo.f_GetCCSortDefault(''E'')

--PRINT dbo.f_CCStandard (ISNULL(CC,''''))

DECLARE @cCCStandard CHAR(1)

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @cCCStandard = ''1''

SET @cCCStandard = CASE @cCC
	WHEN ''1'' THEN ''1''
	WHEN ''2'' THEN ''2''
	WHEN ''A'' THEN ''2''
	WHEN ''B'' THEN ''2''
	WHEN ''C'' THEN ''2''
	WHEN ''D'' THEN ''2''
	WHEN ''E'' THEN ''2''
	WHEN ''F'' THEN ''2''
	WHEN ''3'' THEN ''3''
	WHEN ''4'' THEN ''4''
	WHEN ''5'' THEN ''5''
	WHEN ''6'' THEN ''6''
	WHEN ''7'' THEN ''7''
	WHEN ''8'' THEN ''8''
	WHEN ''9'' THEN ''9''
	WHEN ''R'' THEN ''1''

	WHEN ''T'' THEN ''2''
	WHEN ''U'' THEN ''2''
	WHEN ''V'' THEN ''2''
	WHEN ''W'' THEN ''2''
	WHEN ''X'' THEN ''2''
	WHEN ''Y'' THEN ''2''

	ELSE ''1''
	END

--select @RC = @@ROWCOUNT, @err = @@ERROR

RETURN @cCCStandard
END

--GRANT EXECUTE ON [dbo].[f_GetCCSortDefault] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CCStandard_as_HS]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CCStandard_as_HS]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_CCStandard_as_HS]
(
@cCC CHAR(1)
)
RETURNS CHAR(1)
AS
BEGIN
-- USE SELECT dbo.f_CCStandard_as_HS(''E'')

--PRINT dbo.f_CCStandard (ISNULL(CC,''''))

DECLARE @cCCStandard CHAR(1)

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @cCCStandard = ''1''

SET @cCCStandard = CASE @cCC
	WHEN ''1'' THEN ''1''
	WHEN ''2'' THEN ''2''
	WHEN ''A'' THEN ''7''
	WHEN ''B'' THEN ''7''
	WHEN ''C'' THEN ''7''
	WHEN ''D'' THEN ''7''
	WHEN ''E'' THEN ''7''

	WHEN ''F'' THEN ''7''
	WHEN ''3'' THEN ''3''
	WHEN ''4'' THEN ''4''
	WHEN ''5'' THEN ''5''
	WHEN ''6'' THEN ''6''
	WHEN ''7'' THEN ''7''
	WHEN ''8'' THEN ''8''
	WHEN ''9'' THEN ''9''
	WHEN ''R'' THEN ''1''

	WHEN ''T'' THEN ''7''
	WHEN ''U'' THEN ''7''
	WHEN ''V'' THEN ''7''
	WHEN ''W'' THEN ''7''
	WHEN ''X'' THEN ''7''
	WHEN ''Y'' THEN ''7''

	ELSE ''1''
	END

/*
SET @cCCStandard = CASE @cCC
	WHEN ''1'' THEN ''1''
	WHEN ''2'' THEN ''2''
	WHEN ''A'' THEN ''T''
	WHEN ''B'' THEN ''U''
	WHEN ''C'' THEN ''V''
	WHEN ''D'' THEN ''W''
	WHEN ''E'' THEN ''X''

	WHEN ''F'' THEN ''2''
	WHEN ''3'' THEN ''3''
	WHEN ''4'' THEN ''4''
	WHEN ''5'' THEN ''5''
	WHEN ''6'' THEN ''6''
	WHEN ''7'' THEN ''7''
	WHEN ''8'' THEN ''8''
	WHEN ''9'' THEN ''9''
	WHEN ''R'' THEN ''1''

	WHEN ''T'' THEN ''T''
	WHEN ''U'' THEN ''U''
	WHEN ''V'' THEN ''V''
	WHEN ''W'' THEN ''W''
	WHEN ''X'' THEN ''X''
	WHEN ''Y'' THEN ''Y''

	ELSE ''1''
	END
	*/

--select @RC = @@ROWCOUNT, @err = @@ERROR

RETURN @cCCStandard
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Cert_Machine_Name]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Cert_Machine_Name]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2015 08 04
-- Description:	Checks to see if all vendor documents are valid
-- =============================================
CREATE FUNCTION [dbo].[f_Cert_Machine_Name] 
(
	-- Add the parameters for the function here
	@nMachineNumber TinyInt
)
RETURNS VARCHAR(12)

--SELECT dbo.f_Cert_Machine_Name(2) AS [Machine Name]

AS
BEGIN
	-- Declare the return variable here
	DECLARE @cMachineName VarChar(12)

	SELECT @cMachineName = CASE
		when @nMachineNumber=1 then ''''
		when @nMachineNumber=2 then ''GFM''
		when @nMachineNumber=3 then ''Rolled''
		when @nMachineNumber=4 then ''Press Forge''
		when @nMachineNumber=5 then ''Wire drawn''
		when @nMachineNumber=6 then ''Rotary Swage''
		when @nMachineNumber=7 then ''Draw Bench''
		else ''''
		END

	-- Return the result of the function
	RETURN @cMachineName

END

--GRANT EXECUTE ON [dbo].[f_Cert_Machine_Name] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CheckSet_Sales_No_Cancled]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CheckSet_Sales_No_Cancled]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[f_CheckSet_Sales_No_Cancled]
(
@nSalesNum INT
)
RETURNS TinyInt 
AS

--UPDATE db.Sales_No SET cncld = dbo.f_CheckSet_Sales_No_Cancled( SalesNum )

 
BEGIN
declare @err int,
        @RC int
set @err = 0
set @rc = 0

DECLARE @tCancled TinyInt

DECLARE @nCount INT
DECLARE @Cncled_Count INT
DECLARE @nNotCncld_Count INT


SELECT @nCount = COUNT( * ) FROM dbo.Sales WITH (NOLOCK) WHERE SalesNum = @nSalesNum;
SELECT @Cncled_Count = COUNT( * ) FROM dbo.Sales WITH (NOLOCK) WHERE SalesNum = @nSalesNum AND Cncld = 1;
SELECT @nNotCncld_Count = COUNT( * ) FROM dbo.Sales WITH (NOLOCK) WHERE SalesNum = @nSalesNum AND Cncld = 0;

IF @nCount = @Cncled_Count
	SET @tCancled = 1
	--UPDATE dbo.Sales_No Set cncld = 1 WHERE SalesNum = @nSalesNum
		
IF @nNotCncld_Count != @nCount 
	SET @tCancled = 0
	--UPDATE dbo.Sales_No Set cncld = 0 WHERE SalesNum = @nSalesNum


RETURN @tCancled
END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CheckSet_Sales_No_Cmplt]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CheckSet_Sales_No_Cmplt]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[f_CheckSet_Sales_No_Cmplt]
(
@nSalesNum INT
)
RETURNS TinyInt 
AS

--UPDATE dbo.Sales_No SET Cmplt = dbo.f_CheckSet_Sales_No_Cmplt( SalesNum )

 
BEGIN
declare @err int,
        @RC int
set @err = 0
set @rc = 0

DECLARE @tCmplt TinyInt

DECLARE @nCount INT
DECLARE @nCncled_Count INT
DECLARE @nNotCncld_Count INT


SELECT @nCount = COUNT( * ) FROM dbo.Sales WITH (NOLOCK) WHERE SalesNum = @nSalesNum;
SELECT @nCncled_Count = COUNT( * ) FROM dbo.Sales WITH (NOLOCK) WHERE SalesNum = @nSalesNum AND ISNULL(Cmplt,0) = 1 
	OR (ISNULL(Cmplt,0) = 0 AND ISNULL(Cncld,0) = 1 ) ;  --Count Cncld as Complete
SELECT @nNotCncld_Count = COUNT( * ) FROM dbo.Sales WITH (NOLOCK) WHERE SalesNum = @nSalesNum AND ISNULL(Cmplt,0) = 0;

IF @nCount = @nCncled_Count
	SET @tCmplt = 1
	--UPDATE dbo.Sales_No Set cncld = 1 WHERE SalesNum = @nSalesNum
		
IF @nNotCncld_Count != @nCount 
	SET @tCmplt = 0
	--UPDATE dbo.Sales_No Set cncld = 0 WHERE SalesNum = @nSalesNum


RETURN @tCmplt
END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Clean_Lot]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Clean_Lot]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[f_Clean_Lot]
(
@cLot VARCHAR(10)
)
RETURNS VARCHAR(10)
AS 
BEGIN
--Also see f_HeatLot_Heat
--Also see f_HeatLot_Lot

DECLARE @cNewLot VARCHAR(10)

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @cNewLot = LTRIM(RTRIM(@cLot))

DECLARE @nPos INT = 0
SELECT @nPos = CHARINDEX(''HPA'',@cNewLot)
--AND @nPos < LEN(@cHeat)
IF @nPos > 0 
	SET @cNewLot = LTRIM(RTRIM( RIGHT(@cNewLot,LEN(@cNewLot)-@nPos-2) ))

IF ISNUMERIC(LEFT(@cNewLot,1)) = 0 AND LEN(@cNewLot)>1
	SET @cNewLot = LTRIM(RTRIM( RIGHT(@cNewLot,LEN(@cNewLot)-1) ))


IF ISNUMERIC(LEFT(@cNewLot,1)) = 0  AND LEN(@cNewLot)>1
	SET @cNewLot = LTRIM(RTRIM( RIGHT(@cNewLot,LEN(@cNewLot)-1) ))



RETURN @cNewLot

END

--GRANT EXECUTE ON [dbo].[f_Clean_Lot] TO [WINDFALL\HPA] AS [dbo];


--SELECT Heat, dbo.f_HeatLot_Heat(Heat) AS Heat1 FROM dbo.PackingSlip WHERE LEN(Heat) >0' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_ColdSaw_Price]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_ColdSaw_Price]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[f_ColdSaw_Price]
(
@nDia Decimal(10,4)
)
RETURNS DECIMAL(7,2)
AS
BEGIN


--SELECT dbo.f_ColdSaw_Price(1)

declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @nPrice DECIMAL(7,2) = 0

-- $3 per SQR Inch
IF @nDia > 0
	SET @nPrice = CAST( (3.14156 * (@nDia/2)*(@nDia/2) * 3.00 ) AS DECIMAL(7,2))


RETURN @nPrice
END



--GRANT EXECUTE ON [dbo].[f_ColdSaw_Price] TO [WINDFALL\HPA] AS [dbo];
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Common_CC_CL]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Common_CC_CL]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Common_CC_CL]
(
@cCC char(1),
@cCL char(1)
)
RETURNS CHAR(1)
AS
BEGIN
--RETURNS a Common Code 
--SET @cCommon_CC_CL = dbo.f_Common_CC_CL( @cCC, @cCL)


--If the CL is not found, return the CC that was input with the 0 character
DECLARE @cCommon_CC_CL char(1) = ''''
SET @cCommon_CC_CL = @cCC+''0''

--SELECT Common_Code,CC,CL FROM dbo.ConditionLevel
--dbo.f_Common_CC_CL(CC,CL) AS CCCL

SELECT TOP 1 @cCommon_CC_CL = Common_Code
	FROM [dbo].ConditionLevel
		WHERE CC=@cCC 
		and CL=@cCL

RETURN (@cCommon_CC_CL)
END



--GRANT EXECUTE ON [dbo].[f_Common_CC_CL] TO [WINDFALL\HPA] AS [dbo];







' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Company_CustomerID]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Company_CustomerID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Company_CustomerID]
(
@cCustomerID char(20)
)
RETURNS CHAR(100)
AS
BEGIN

--PRINT dbo.f_Company_CustomerID(''LYNCHBU'' )


DECLARE @cCustomerName varchar(100) = ''NA''

--SELECT  [type],[StandTerms],[CODTerms],[Prepaid],[DueDays],[dtDATE]
--,[CreditLimit],[CurrentBalance],[CreditLimit]-[CurrentBalance] AS [CreditLeft]
--	FROM dbo.CUSTOMER_LIST
--	WHERE CustomerID = @cCustomerID

SELECT TOP 1 @cCustomerName = ISNULL(CustomerName,''NA'')
	FROM dbo.CUSTOMER_LIST
	WHERE CustomerID = @cCustomerID

RETURN (@cCustomerName)
END



--GRANT EXECUTE ON [dbo].[f_Company_CustomerID] TO [WINDFALL\HPA] AS [dbo];







' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Company_NoNoiseName]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Company_NoNoiseName]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
Create FUNCTION [dbo].[f_Company_NoNoiseName]
(
@cNoNoiseName char(30)
)
RETURNS CHAR(100)
AS
BEGIN

--PRINT dbo.f_Company_NoNoiseName(''LYNCHBU'' )
--Print dbo.f_Company_NoNoiseName(''LAKELTECHNOLOGY'')

DECLARE @cCustomerName varchar(100) = ''NA''

--SELECT  [type],[StandTerms],[CODTerms],[Prepaid],[DueDays],[dtDATE]
--,[CreditLimit],[CurrentBalance],[CreditLimit]-[CurrentBalance] AS [CreditLeft]
--	FROM dbo.CUSTOMER_LIST
--	WHERE CustomerID = @cCustomerID

SELECT TOP 1 @cCustomerName = ISNULL(Company,''NA'')
	FROM dbo.AllQuotes
	WHERE NoNoiseName = @cNoNoiseName
	ORDER BY InqDate DESC

RETURN (@cCustomerName)
END



--GRANT EXECUTE ON [dbo].[f_Company_NoNoiseName] TO [WINDFALL\HPA] AS [dbo];







' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CompanyStandard]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CompanyStandard]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_CompanyStandard]
(
-- Send in dirty name to get cleaned.
@Company char(30)
)
RETURNS CHAR(30)
AS
BEGIN

--
-- FUNCTION [dbo].[f_NoNoiseName] is used to clean and fill the NoNoise column in tables:
-- Allquotes, Shipaddr, SoldAddr, SalesP_Customer
--
--SELECT dbo.f_CompanyStandard (''AMERICAN STAINLESS CORP. '')
--SELECT dbo.f_CompanyStandard (''YYYYYYYYYYYYYYYYYYYYYYYYYYYYY '')

DECLARE @cReturn CHAR(30)

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @cReturn = ''''

SET @Company = ISNULL(@Company, '''')
SET @Company = LTRIM(@Company)

--Remove words that are not a significant part of name when only 3 parts are considered.
SET @Company = REPLACE(@Company,'' & '','' '')
SET @Company = REPLACE(@Company,''&'','' '')
SET @Company = REPLACE(@Company,'' AND '','' '')

SET @Company = REPLACE(@Company,'', INC. '','' '')
SET @Company = REPLACE(@Company,'', INC '','' '')
SET @Company = REPLACE(@Company,'',INC. '','' '')
SET @Company = REPLACE(@Company,'',INC '','' '')
SET @Company = REPLACE(@Company,'' INC. '','' '')
SET @Company = REPLACE(@Company,'' INC '','' '')

SET @Company = REPLACE(@Company,'', LLC. '','' '')
SET @Company = REPLACE(@Company,'', LLC '','' '')
SET @Company = REPLACE(@Company,'',LLC. '','' '')
SET @Company = REPLACE(@Company,'',LLC '','' '')
SET @Company = REPLACE(@Company,'' LLC. '','' '')
SET @Company = REPLACE(@Company,'' LLC '','' '')

SET @Company = REPLACE(@Company,'', CO. '','' '')
SET @Company = REPLACE(@Company,'', CO '','' '')
SET @Company = REPLACE(@Company,'',CO. '','' '')
SET @Company = REPLACE(@Company,'',CO '','' '')
SET @Company = REPLACE(@Company,'' CO. '','' '')
SET @Company = REPLACE(@Company,'' CO '','' '')

SET @Company = REPLACE(@Company,'', GMBH. '','' '')
SET @Company = REPLACE(@Company,'', GMBH '','' '')
SET @Company = REPLACE(@Company,'',GMBH. '','' '')
SET @Company = REPLACE(@Company,'',GMBH '','' '')
SET @Company = REPLACE(@Company,'' GMBH. '','' '')
SET @Company = REPLACE(@Company,'' GMBH '','' '')

SET @Company = REPLACE(@Company,'', CA. '','' '')
SET @Company = REPLACE(@Company,'', C.A. '','' '')
SET @Company = REPLACE(@Company,'', C.A '','' '')
SET @Company = REPLACE(@Company,'', CA '','' '')
SET @Company = REPLACE(@Company,'',CA. '','' '')
SET @Company = REPLACE(@Company,'',C.A. '','' '')
SET @Company = REPLACE(@Company,'',C.A '','' '')
SET @Company = REPLACE(@Company,'',CA. '','' '')
SET @Company = REPLACE(@Company,'',CA '','' '')
SET @Company = REPLACE(@Company,'' CA. '','' '')
SET @Company = REPLACE(@Company,'' C.A. '','' '')
SET @Company = REPLACE(@Company,'' CA '','' '')
SET @Company = REPLACE(@Company,'' C.A '','' '')

SET @Company = REPLACE(@Company,'', Company '','' '')
SET @Company = REPLACE(@Company,'',Company '','' '')
SET @Company = REPLACE(@Company,'' Company '','' '')

SET @Company = REPLACE(@Company,'', CORP. '','' '')
SET @Company = REPLACE(@Company,'', CORP '','' '')
SET @Company = REPLACE(@Company,'',CORP. '','' '')
SET @Company = REPLACE(@Company,'',CORP '','' '')
SET @Company = REPLACE(@Company,'' CORP. '','' '')
SET @Company = REPLACE(@Company,'' CORP '','' '')

SET @Company = REPLACE(@Company,'', CORPORATION '','' '')
SET @Company = REPLACE(@Company,'',CORPORATION '','' '')
SET @Company = REPLACE(@Company,'' CORPORATION '','' '')

SET @Company = REPLACE(@Company,'' , '','' '')
SET @Company = REPLACE(@Company,'', '','' '')
SET @Company = REPLACE(@Company,''\'','' '')
SET @Company = REPLACE(@Company,''/'','' '')
SET @Company = REPLACE(@Company,'' + '','' '')
SET @Company = REPLACE(@Company,'' +'','' '')
SET @Company = REPLACE(@Company,''+'','' '')

--Check position to see if relevent
IF LEFT(@Company,1) = ''-''    --A begin ''-'' is not relavent
	SET @Company = REPLACE(@Company,''-'','''') 

SET @Company = REPLACE(@Company,''-'','' '')

--Remove Characters
SET @Company = REPLACE(@Company,''0'','''')
SET @Company = REPLACE(@Company,''1'','''')
SET @Company = REPLACE(@Company,''2'','''')
SET @Company = REPLACE(@Company,''3'','''')
SET @Company = REPLACE(@Company,''4'','''')
SET @Company = REPLACE(@Company,''5'','''')
SET @Company = REPLACE(@Company,''6'','''')
SET @Company = REPLACE(@Company,''7'','''')
SET @Company = REPLACE(@Company,''8'','''')
SET @Company = REPLACE(@Company,''9'','''')

SET @Company = REPLACE(@Company,''('','''')
SET @Company = REPLACE(@Company,'')'','''')
SET @Company = REPLACE(@Company,''. '','''')
SET @Company = REPLACE(@Company,''.'','''')
SET @Company = REPLACE(@Company,''`'','''')
SET @Company = REPLACE(@Company,''~'','''')
SET @Company = REPLACE(@Company,''!'','''')
SET @Company = REPLACE(@Company,''@'','''')
SET @Company = REPLACE(@Company,''#'','''')
SET @Company = REPLACE(@Company,''$'','''')
SET @Company = REPLACE(@Company,''%'','''')
SET @Company = REPLACE(@Company,''^'','''')
SET @Company = REPLACE(@Company,''&'','''')
SET @Company = REPLACE(@Company,''*'','''')
SET @Company = REPLACE(@Company,''_!'','''')
SET @Company = REPLACE(@Company,''='','''')
SET @Company = REPLACE(@Company,''+'','''')
SET @Company = REPLACE(@Company,'';'','''')
SET @Company = REPLACE(@Company,'':'','''')
SET @Company = REPLACE(@Company,''"'','''')
SET @Company = REPLACE(@Company,''{'','''')
SET @Company = REPLACE(@Company,''}'','''')
SET @Company = REPLACE(@Company,''['','''')
SET @Company = REPLACE(@Company,'']'','''')
SET @Company = REPLACE(@Company,''|'','''')

SET @Company = LTRIM(@Company) --Remove begining blanks again

DECLARE @nLen INT
SET @nLen = LEN(@Company)

IF @nLen < 30
	SET @Company = @Company + REPLICATE('' '',30-@nLen)
	

RETURN @Company
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_ConditionCodeLevelText]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_ConditionCodeLevelText]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_ConditionCodeLevelText]
(
@cCC CHAR(1)
,@cCL CHAR(1)
)
RETURNS CHAR(28)
AS
BEGIN
--PRINT dbo.f_ConditionCodeLevelText(''1'','''')
--SELECT CC,CL ,dbo.f_ConditionCodeLevelText(CC,CL) AS text FROM dbo.ConditionLevel

DECLARE @cConditionCodeText CHAR(28)

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @cConditionCodeText = '' ''

SELECT @cConditionCodeText=
( (CASE WHEN CC.useText = 1 THEN RTRIM(CC.[text])+'' '' ELSE '''' END) + RTRIM(ISNULL(CL.[Text],'''')) ) 
	FROM dbo.ConditionCode CC
	LEFT OUTER JOIN dbo.ConditionLevel CL ON CC.CC = CL.CC
	WHERE CC.CC = @cCC
	AND CL.CL = @cCL


--select @RC = @@ROWCOUNT, @err = @@ERROR

RETURN @cConditionCodeText
END


--GRANT EXECUTE ON [dbo].[f_ConditionCodeLevelText] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_ConditionCodeText]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_ConditionCodeText]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_ConditionCodeText]
(
@cCC CHAR(1)
)
RETURNS CHAR(13)
AS
BEGIN
--PRINT dbo.f_ConditionCodeText(''1'')

DECLARE @cConditionCodeText CHAR(13)

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @cConditionCodeText = '' ''

SELECT @cConditionCodeText=[text] FROM dbo.ConditionCode WHERE [cc]= @cCC
--SELECT [CC],[text] FROM dbo.ConditionCode


--select @RC = @@ROWCOUNT, @err = @@ERROR

RETURN @cConditionCodeText
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_ConvertIntToDateTime]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_ConvertIntToDateTime]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2013 03 08
-- Description:	Convert Int to DateTime
-- =============================================
CREATE FUNCTION [dbo].[f_ConvertIntToDateTime] 
(
	-- Add the parameters for the function here
	@int int
)
RETURNS DATETIME
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result datetime

	-- Add the T-SQL statements to compute the return value here
	SELECT @Result = CONVERT(datetime,(CONVERT(int, @int)))
	--Return the result of the function
	RETURN @Result

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CountIDinBrokerLst_Detail]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CountIDinBrokerLst_Detail]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_CountIDinBrokerLst_Detail] 
(
@ID INT
)
RETURNS INT
AS
BEGIN
DECLARE @nCount INT

SELECT @nCount = COUNT(ID_Detail) FROM dbo.BrokerLst_Detail WHERE ID = @ID

RETURN (@nCount)
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CountIDinLst_Detail]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CountIDinLst_Detail]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
create FUNCTION [dbo].[f_CountIDinLst_Detail] 
(
@ID INT,
@TBL CHAR(1)
)
RETURNS INT
AS
BEGIN
DECLARE @nCount INT = 0


IF @TBL = ''S''
	SELECT @nCount = COUNT(ID_Detail) 
	FROM dbo.StockLst_Detail 
	WHERE ID = @ID

IF @TBL = ''B''
	SELECT @nCount = COUNT(ID_Detail) 
	FROM dbo.BrokerLst_Detail 
	WHERE ID = @ID

IF @TBL = ''W''
	SELECT @nCount = COUNT(ID_Detail) 
	FROM dbo.WIPLst_Detail 
	WHERE ID = @ID

RETURN (@nCount)
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CountIDinStockLst_Detail]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CountIDinStockLst_Detail]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_CountIDinStockLst_Detail] 
(
@ID INT
)
RETURNS INT
AS
BEGIN
DECLARE @nCount INT

SELECT @nCount = COUNT(ID_Detail) FROM dbo.StockLst_Detail WHERE ID = @ID

RETURN (@nCount)
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Customer_Discount]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Customer_Discount]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_Customer_Discount]
(
@cCustID CHAR(20)
)
RETURNS Numeric(3,2)

AS
BEGIN
--  SELECT dbo.f_Customer_Discount(''ATLAMA              '') AS [DISC%]

--PRINT dbo.f_Customer_Discount (''EUROMA              '')

DECLARE @nCustDiscount Numeric(3,2)
declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @nCustDiscount = 0

SELECT @nCustDiscount = [Disc%] FROM dbo.Customer_Discount WHERE CustomerID = @cCustID

--select @RC = @@ROWCOUNT, @err = @@ERROR

RETURN @nCustDiscount
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Customer_Terms]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Customer_Terms]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Customer_Terms]
(
@cCustomerID char(20)
)
RETURNS CHAR(20)
AS
BEGIN

--PRINT dbo.f_Customer_Terms(''LYNCHBU'' )
--IF dbo.f_Customer_Terms(''LYNCHBU'' ) = ''STD TERMS''

DECLARE @cStdTerms char(10) = ''none''
DECLARE @nType INT = 0

--SELECT  [type],[StandTerms],[CODTerms],[Prepaid],[DueDays],[dtDATE]
--,[CreditLimit],[CurrentBalance],[CreditLimit]-[CurrentBalance] AS [CreditLeft]
--	FROM dbo.CUSTOMER_LIST
--	WHERE CustomerID = @cCustomerID

SELECT TOP 1 @nType = ISNULL([TYPE],0)
	FROM dbo.CUSTOMER_LIST
	WHERE CustomerID = @cCustomerID

SET @cStdTerms = CASE
	WHEN @nType = 1 THEN ''STD TERMS'' 
	WHEN @nType = 2 THEN ''COD'' 
	WHEN @nType = 3 THEN ''PREPAID'' 
	WHEN @nType = 4 THEN ''STD TERMS'' 
	WHEN @nType = 5 THEN ''COD'' 
	WHEN @nType = 6 THEN ''PREPAID'' 
	WHEN @nType = 7 THEN ''STD TERMS'' 
	WHEN @nType = 8 THEN ''COD'' 
	WHEN @nType = 9 THEN ''PREPAID'' 
	ELSE ''none'' END

/*
--SELECT DISTINCT PayType FROM dbo.Sales_No ORDER BY PayType
PayType:
NULL
          
CANADA PP 
CANADA STD
COD       
CREDIT CRD
FOREIGN PP
FOREIGNCOD
FOREIGNSTD
HOLD 4 PAY
LINKPOINT 
PAYPAL    
PREPAID   
STD TERMS 
WIRE TRANS
*/

RETURN (@cStdTerms)
END



--GRANT EXECUTE ON [dbo].[f_Customer_Terms] TO [WINDFALL\HPA] AS [dbo];







' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CustomerID_NoNoiseName]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CustomerID_NoNoiseName]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_CustomerID_NoNoiseName]
(
@NoNoiseName VarChar(100)
)
RETURNS CHAR(20)
AS
BEGIN
--CustID

--PRINT dbo.f_CustomerID_NoNoiseName(''METALS4U                      '')
--SELECT *, dbo.f_NoNoiseName( CL.CustomerName ) FROM dbo.Customer_List CL
--UPDATE dbo.Customer_List SET NoNoiseName = dbo.f_NoNoiseName(CustomerName)

DECLARE @CustID char(20) = ''''

SELECT TOP 1 @CustID = ISNULL(CL.CustomerID,'''')
	FROM dbo.Customer_List CL WITH(NOLOCK)
	--WHERE dbo.f_NoNoiseName( CL.CustomerName ) = @NoNoiseName
	WHERE CL.NoNoiseName = @NoNoiseName
		
IF LEN(@CustID) = 0
SELECT TOP 1 @CustID = ISNULL(CL.CustomerID,'''')
	FROM dbo.Customer_List CL WITH(NOLOCK)
	WHERE CL.CustomerName = @NoNoiseName



RETURN ISNULL(@CustID,'''')
END



--GRANT EXECUTE ON [dbo].[f_CustomerID_NoNoiseName] TO [WINDFALL\HPA] AS [dbo];







' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_CustomerID_SalesNum]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_CustomerID_SalesNum]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_CustomerID_SalesNum]
(
@SalesNum INT
)
RETURNS CHAR(20)
AS
BEGIN
--CustID

--PRINT dbo.f_CustomerID_SalesNum(114478)
--PRINT dbo.f_Customer_Terms(dbo.f_CustomerID_SalesNum(114478))
--IF dbo.f_Customer_Terms(dbo.f_CustomerID_SalesNum(114478)) = ''STD TERMS''

DECLARE @CustID char(20) = ''''

SELECT TOP 1 @CustID = ISNULL([CustID],'''')
	FROM dbo.AllQuotes
	WHERE SalesNum = @SalesNum 
	AND LEN(ISNULL([CustID],'''')) > 0

--See if Address has it!
IF LEN(ISNULL(@CustID,'''')) = 0
	SELECT TOP 1 @CustID = ISNULL(SA.customer,'''')
		FROM dbo.Sales_No SN
		INNER JOIN dbo.SoldAddr SA ON SN.psoldaddr = SA.soldcode
		WHERE SN.SalesNum = @SalesNum 
		AND LEN(ISNULL(SA.customer,'''')) > 0

RETURN ISNULL(@CustID,'''')
END



--GRANT EXECUTE ON [dbo].[f_CustomerID_SalesNum] TO [WINDFALL\HPA] AS [dbo];







' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Date_30_60_90]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Date_30_60_90]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Date_30_60_90] 
(
@dDateTime DateTime
)
RETURNS CHAR(5)
AS
BEGIN
--PRINT dbo.[f_Date_30_60_90](GetDate())
--Returns string 

DECLARE @cDays CHAR(5)
DECLARE @dCurrDate DateTime

SET @dCurrDate = GetDate()

SELECT @cDays = case 
when @dDateTime < @dCurrDate then ''-''
when @dDateTime < @dCurrDate+30 then ''0-30''
when @dDateTime < @dCurrDate+60 then ''30-60''
when @dDateTime < @dCurrDate+90 then ''60-90''
 ELSE ''90+''
end


RETURN @cDays
END


/*
GRANT EXECUTE ON [dbo].[f_Date_30_60_90] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_Date_30_60_90] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_Date_30_60_90] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Date_30_60_90_180]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Date_30_60_90_180]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Date_30_60_90_180] 
(
@dDateTime DateTime
)
RETURNS CHAR(6)
AS
BEGIN
--PRINT dbo.[f_Date_30_60_90_180](GetDate())
--Returns string 

DECLARE @cDays CHAR(6)
DECLARE @dCurrDate DateTime

SET @dCurrDate = GetDate()

SELECT @cDays = case 
 when @dDateTime < @dCurrDate then ''0 late''
 when @dDateTime <= @dCurrDate+30 then ''0-30''
 when @dDateTime < @dCurrDate+60 then ''30-60''
 when @dDateTime < @dCurrDate+90 then ''60-90''
 when @dDateTime < @dCurrDate+180 then ''90-180''
 ELSE ''x 180+''
end


RETURN @cDays
END


/*
GRANT EXECUTE ON [dbo].[f_Date_30_60_90_180] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_Date_30_60_90_180] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_Date_30_60_90_180] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Date_Min]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Date_Min]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_Date_Min]
(
@Date1 DateTime
,@Date2 DateTime
)
RETURNS DateTime

--returns the Min Date, or Max is Min is empty
-- IF both dates are NULL, returns date=''Jan  1 1900 12:00AM''	not ''1900-01-01 00:00:00.000''
--Never return NULL
--also check dbo.f_BestDate()

AS
BEGIN

--SELECT dbo.f_Date_Min(Due_Min,Due_Max)
--SELECT dbo.f_Date_Min (''1900-01-01 00:00:00.000'',''2013-05-13 00:00:00.000'')
--SELECT dbo.f_Date_Min ('''',''2013-05-13 00:00:00.000'')
--SELECT dbo.f_Date_Min (''1900-01-01 00:00:00.000'',''1900-01-01 00:00:00.000'')
--SELECT dbo.f_Date_Min (''2014-05-13 00:00:00.000'',''2013-05-13 00:00:00.000'')
--SELECT dbo.f_Date_Min (NULL,''2013-05-13 00:00:00.000'')
--SELECT dbo.f_Date_Min (NULL,NULL)

DECLARE @dtReturn DateTime
SET @dtReturn = ''''

declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @lGood1 BIT
SET @lGood1 = 1
DECLARE @lGood2 BIT
SET @lGood2 = 1

IF @Date1 IS NULL
	SET @lGood1 = 0

IF @Date1 = ''1900-01-01 00:00:00.000''
	SET @lGood1 = 0

IF @Date1 = ''''
	SET @lGood1 = 0

IF @Date2 IS NULL
	SET @lGood2 = 0

IF @Date2 = ''1900-01-01 00:00:00.000''
	SET @lGood2 = 0

IF @Date2 = ''''
	SET @lGood2 = 0

IF @lGood1 = 1
	begin
	SET @dtReturn = @Date1
	end
ELSE
	IF @lGood2 = 1
		begin
		SET @dtReturn = @Date2
		end
	ELSE
		begin
		--SET @dtReturn = NULL
		SET @dtReturn = ''''
		end
		
		
RETURN @dtReturn
END

--GRANT EXECUTE ON [dbo].[f_Date_Min] TO [WINDFALL\HPA] AS [dbo];
--GRANT EXECUTE ON [dbo].[f_Date_Min] TO [HPA_Service] AS [dbo];

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Date2_30_60_90]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Date2_30_60_90]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
Create FUNCTION [dbo].[f_Date2_30_60_90] 
(
@dDateTime DateTime
)
RETURNS CHAR(5)
AS
BEGIN
--PRINT dbo.[f_Date2_30_60_90](GetDate())

DECLARE @cDays CHAR(5)
DECLARE @dCurrDate DateTime

SET @dCurrDate = GetDate()

SELECT @cDays = case 
when @dDateTime > @dCurrDate then ''+''
when @dDateTime > @dCurrDate-30 then ''0-30''
when @dDateTime > @dCurrDate-60 then ''30-60''
when @dDateTime > @dCurrDate-90 then ''60-90''
 ELSE ''90+''
end


RETURN @cDays
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Descript]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Descript]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[f_Descript] 
(
  @cAlloy AS CHAR(12)
, @cCC as CHAR(1)
, @cForm AS CHAR(2)
, @nSZ1 AS NUMERIC(18,4)
, @nSZ2 AS NUMERIC(18,3)
, @nSZ3 AS NUMERIC(18,3)
, @nWeight AS FLOAT
, @lRL AS BIT
)


RETURNS VARCHAR(100)
AS
BEGIN
-- test
--SELECT dbo.f_Descript(''C-276'',''B'',''40'',.25,36,120,0,0)
--dbo.f_Descript(Alloy,CC,Form,Thck,Sz2,Sz3,Weight,RandLen)
--,dbo.f_Descript(AQ.Alloy,AQ.CC,AQ.Form,AQ.Thck,AQ.Sz2,AQ.Sz3,AQ.Q_QTY,AQ.RandLen) AS Descript
-- C-276 BAR 1.125"Dia x 12 FT  R/L

-- ALSO SEE f_ItemDescription
--dbo.f_ItemDescription(@cForm,@nSz1,@nSz2,@nSz3,@nWeight,@lRL)
--SELECT dbo.f_ItemDescription(Form,Thck,Sz2,Sz3,Weight,RandLen)

-- ALSO SEE dbo.f_DescriptCL
--ALSO See f_DescriptionMetricReport
--SELECT dbo.f_DescriptionMetricReport(Pieces, Form, Thck, SZ2, SZ3, Weight, RandLen, Metric, Sz1orig, Sz2orig, Sz3orig)
--SELECT dbo.f_DescriptionMetricReport(1, 40, .25, 36, 120, 999, 0, 0, '''', '''', '''')
--1 Pc 0.25" Thick x 36" x 120" 

--DECLARE @cAlloy AS CHAR(12), @cCC as CHAR(1), @cForm AS CHAR(2), @nSZ1 AS NUMERIC(18,4), @nSZ2 AS NUMERIC(18,3), @nSZ3 AS NUMERIC(18,3), @nWeight AS FLOAT, @lRL AS BIT
--SET @cAlloy = ''718''; SET @cCC = ''2'';SET @cForm = ''10'';SET @nSZ1 = 0.5512;SET @nSZ2 = 354;SET @nSZ3 = 0;SET @nWeight = 0;SET @lRL = 1

DECLARE @lMetric AS Bit
, @nSz1orig AS Float
, @nSz2orig AS Float
, @nSz3orig AS Float

DECLARE @cDescript VARCHAR(100)
SET @cDescript = ISNULL(RTRIM(@cAlloy),'''')+'' ''

-- Print  dbo.f_ConditionCodeText(''B'')
DECLARE @cConditionCodeText CHAR(15)
SET @cConditionCodeText = ISNULL(RTRIM( dbo.f_ConditionCodeText(@cCC)),'''')
IF LEN(@cConditionCodeText) > 0
	SET	@cDescript = @cDescript + ''(''+TRIM(@cConditionCodeText)+'')'' + '' ''

/*
SET	@cDescript = CASE 
	WHEN @cCC = ''1'' THEN @cDescript 
	WHEN @cCC = ''2'' THEN @cDescript + ''('' + ISNULL(RTRIM( dbo.f_ConditionCodeText(@cCC)),'''')+ '')'' + '' ''
	WHEN @cCC = ''3'' THEN @cDescript + ''('' + ISNULL(RTRIM( dbo.f_ConditionCodeText(@cCC)),'''')+ '')'' + '' ''
	WHEN @cCC = ''4'' THEN @cDescript + ''('' + ISNULL(RTRIM( dbo.f_ConditionCodeText(@cCC)),'''')+ '')'' + '' ''
	ELSE @cDescript + ''( High Strength ) ''
END
*/
	
SET @cDescript = @cDescript + ISNULL(RTRIM(dbo.FormDescription(@cForm,@nSZ1)),'''') + '' ''

SET @cDescript = @cDescript + ISNULL(dbo.f_ItemDescription(@cForm,@nSz1,@nSz2,@nSz3,@nWeight,@lRL),'''')


RETURN RTRIM(@cDescript)
END


--GRANT EXECUTE ON [dbo].[f_Descript] TO [WINDFALL\HPA] AS [dbo];


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_DescriptCL]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_DescriptCL]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[f_DescriptCL] 
(
  @cAlloy AS CHAR(12)
, @cCC as CHAR(1)
, @cCL as CHAR(1)
, @cForm AS CHAR(2)
, @nSZ1 AS NUMERIC(18,4)
, @nSZ2 AS NUMERIC(18,3)
, @nSZ3 AS NUMERIC(18,3)
, @nWeight AS FLOAT
, @lRL AS BIT
)


RETURNS VARCHAR(100)
AS
BEGIN
-- test
--SELECT dbo.f_DescriptCL(''C-276'',''B'','''',''40'',.25,36,120,0,0)
--SELECT dbo.f_DescriptCL(''HPA N60'',''L'',''C'',''10'',1.25,36,0,0,0)
--dbo.f_DescriptCL(Alloy,CC,CL,Form,Thck,Sz2,Sz3,Weight,RandLen)
--SELECT dbo.f_DescriptCL(M.Alloy,M.CC,M.CL,M.Form,D.Dim1,D.Dim2,D.Dim3,D.[Weight],D.RandLen)
--,dbo.f_DescriptCL(AQ.Alloy,AQ.CC,AQ.CL,AQ.Form,AQ.Thck,AQ.Sz2,AQ.Sz3,AQ.Q_QTY,AQ.RandLen) AS DescriptCL
--,dbo.f_DescriptCL(P.Alloy,P.CC,P.CL,P.Form,P.Thck,P.Sz2,P.Sz3,P.StockLst_QTY,P.RandLen) AS DescriptCL
-- C-276 BAR 1.125"Dia x 12 FT  R/L
--, dbo.f_DescriptCL(WD.fAlloy,WD.fCC,WD.fCL,WD.fForm,WD.fThck,WD.fSz2,WD.fSz3,WD.fWeight,1) AS DescriptCL
--SELECT dbo.f_DescriptCL(WO.sAlloy,WO.sCC,WO.sCL,WO.sForm,WO.sThck,WO.sSz2,WO.sSz3,WO.sWeight,1) AS DescriptCL

-- ALSO SEE f_ItemDescription
--dbo.f_ItemDescription(@cForm,@nSz1,@nSz2,@nSz3,@nWeight,@lRL)
--SELECT dbo.f_ItemDescription(Form,Thck,Sz2,Sz3,Weight,RandLen)
--SELECT dbo.f_ItemDescription(10,1.75,144,0,110,.F.)

--ALSO See f_DescriptionMetricReport
--SELECT dbo.f_DescriptionMetricReport(Pieces, Form, Thck, SZ2, SZ3, Weight, RandLen, Metric, Sz1orig, Sz2orig, Sz3orig)
--SELECT dbo.f_DescriptionMetricReport(1, 40, .25, 36, 120, 999, 0, 0, '''', '''', '''')
--1 Pc 0.25" Thick x 36" x 120" 

--DECLARE @cAlloy AS CHAR(12), @cCC as CHAR(1), @cForm AS CHAR(2), @nSZ1 AS NUMERIC(18,4), @nSZ2 AS NUMERIC(18,3), @nSZ3 AS NUMERIC(18,3), @nWeight AS FLOAT, @lRL AS BIT
--SET @cAlloy = ''718''; SET @cCC = ''2'';SET @cForm = ''10'';SET @nSZ1 = 0.5512;SET @nSZ2 = 354;SET @nSZ3 = 0;SET @nWeight = 0;SET @lRL = 1

DECLARE @lMetric AS Bit
, @nSz1orig AS Float
, @nSz2orig AS Float
, @nSz3orig AS Float

DECLARE @cDescript VARCHAR(100)
SET @cDescript = ISNULL(RTRIM(@cAlloy),'''')+'' ''

-- Print  dbo.f_ConditionCodeText(''B'')

DECLARE @cConditionCodeText CHAR(15)
SET @cConditionCodeText = ISNULL(RTRIM(dbo.f_ConditionCodeText(@cCC)),'''')
IF LEN(@cConditionCodeText) > 0
	begin
	SET	@cDescript = @cDescript + ''(''+TRIM(@cConditionCodeText)
	IF LEN(TRIM(@cCL)) > 0
		SET	@cDescript = @cDescript +'' ''+@cCL
	
	SET	@cDescript = @cDescript +'')'' + '' ''
	end

SET @cDescript = @cDescript + ISNULL(RTRIM(dbo.FormDescription(@cForm,@nSZ1)),'''') + '' ''

SET @cDescript = @cDescript + ISNULL(dbo.f_ItemDescription(@cForm,@nSz1,@nSz2,@nSz3,@nWeight,@lRL),'''')


RETURN TRIM(@cDescript)
END





' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_DescriptID]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_DescriptID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_DescriptID] 
(
  @cAlloy AS CHAR(12)
, @cForm AS CHAR(2)
, @cCC as CHAR(1)
, @cCL as CHAR(1)
, @nSZ1 AS NUMERIC(18,4)
)


RETURNS VARCHAR(28)
AS
BEGIN
--
-- DescriptID is a Computed field stored with different table to make reports faster
--
--SELECT dbo.f_DescriptID(''C-276'',''40'',''1'','' '',0.25)
--SELECT dbo.f_DescriptID(Alloy,Form,cc,cl,Size) AS DescriptID FROM dbo.StockLst_Master WHERE ID > 1000

--SELECT dbo.f_DescriptID(Alloy,Form,cc,cl,Size) AS DescriptID, LEN(dbo.f_DescriptID(Alloy,Form,cc,cl,Size)) AS LEN FROM dbo.StockLst_Master WHERE ID > 1000


--DECLARE @cAlloy AS CHAR(12), @cForm AS CHAR(2), @cCC as CHAR(1),  @cCL as CHAR(1), @nSZ1 AS NUMERIC(18,4)
--SET @cAlloy = ''718''; SET @cForm = ''10'';SET @cCC = ''2''; SET @cCL = '' ''; SET @nSZ1 = 0.5;

-- SELECT ISNULL(Alloy,''            '')+ISNULL(Form,''  '')+ISNULL(CC,'' '')+ISNULL(CL,'' '')+CONVERT(varchar(12), CONVERT(decimal(9,3), StandardSize)) AS DescriptID FROM dbo.AllQuotes



RETURN ISNULL(@cAlloy,''            '')
     + ISNULL(@cForm,''  '')
     + ISNULL(@cCC,'' '')
     + ISNULL(@cCL,'' '')
     + CONVERT(varchar(12), CONVERT(decimal(9,3), @nSZ1))

END



--GRANT EXECUTE ON [f_DescriptID] TO [WINDFALL\HPA];
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_DescriptionMetricReport]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_DescriptionMetricReport]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[f_DescriptionMetricReport] 
(
  @nPieces AS INT
, @cForm AS CHAR(2)
, @nSZ1 AS NUMERIC(18,4)
, @nSZ2 AS NUMERIC(18,4)
, @nSZ3 AS NUMERIC(18,4)
, @nWeight AS Float
, @lRandLen AS BIT
, @lMetric AS BIT
, @cSz1orig AS VarChar(20)
, @cSz2orig AS VarChar(20)
, @cSz3orig AS VarChar(20)
)


RETURNS VARCHAR(100)
AS
BEGIN
--SELECT dbo.f_DescriptionMetricReport(Pieces, Form, Thck, SZ2, SZ3, [Weight], RandLen, Metric, Sz1orig, Sz2orig, Sz3orig)
--SELECT dbo.f_DescriptionMetricReport(1, ''10'', 2, 144, 0, 100, 1, 0, '''', '''', '''')
--dbo.f_DescriptionMetricReport(AQ.Pieces, AQ.Form, AQ.Thck, AQ.SZ2, AQ.SZ3, AQ.[Weight], AQ.RandLen, AQ.Metric, AQ.Sz1orig, AQ.Sz2orig, AQ.Sz3orig) AS Descript
--dbo.f_DescriptionMetricReport(p.Pieces, P.Form, P.Thck, P.SZ2, P.SZ3, P.Pounds, P.RandLen, P.Metric, P.Sz1orig, P.Sz2orig, P.Sz3orig) AS Descript

DECLARE @cDescript VARCHAR(100)
SET @cDescript = ''''

-- Add Pieces to Description

IF @nPieces > 0
	IF @nPieces = 1
		SET @cDescript = ''1 Pc ''
	ELSE
		SET @cDescript = LTRIM(CAST(@nPieces AS VARCHAR(10))) + '' Pcs ''

/*
DECLARE @cConditionCodeText CHAR(15)
SET @cConditionCodeText = ISNULL(RTRIM( dbo.f_ConditionCodeText(@cCC)),'''')
IF LEN(@cConditionCodeText) > 0
	SET	@cDescript = @cDescript + ''(''+@cConditionCodeText+'')'' + '' ''
*/

SET @cDescript = @cDescript + ISNULL(dbo.f_ItemDescriptionMetric(@cForm,@nSz1,@nSz2,@nSz3, @nWeight, @lRandLen, @lMetric, @cSz1orig, @cSz2orig, @cSz3orig),'''')

RETURN @cDescript
END

--GRANT EXECUTE ON [dbo].[f_DescriptionMetricReport] TO [HPA_Service]' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Disp_ifNextDay]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Disp_ifNextDay]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_Disp_ifNextDay]
(
@Number INT
,@Date DATE
 )
RETURNS INT
AS
BEGIN

--SELECT dbo.f_Disp_ifNextDay (10,''2015-06-20'')

--Stop using data over 10 days old

DECLARE @nReturn INT

SET @nReturn = 0

IF @Date <= GETDATE()+1 AND @Date > GETDATE()-11
	SET @nReturn = @Number

RETURN @nReturn
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Est_Ft]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Est_Ft]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[f_Est_Ft] 
(
@nLBS Decimal(9,1) = 0,
@cForm CHAR(2),
@nThickness DECIMAL(9,4) = 0,
@cAlloy CHAR(12) = ''DEFAULT'',
@nSize2 DECIMAL(9,3) = 0,
@nPieces INT = 1
)

RETURNS Decimal(9,0)
AS
BEGIN
--PRINT dbo.f_Est_Ft(1000,''40'',1,''C-276'',36,null)
--PRINT dbo.f_Est_Ft(1000,''10'',1,Null,Null,Null)
--PRINT dbo.f_Est_Ft(Null,''72'',1,Null,Null,10)
--PRINT dbo.f_Est_Ft(LBS,Form,Thck,Alloy,Size2,PC)
--SET NOCOUNT ON

DECLARE @nFt AS Decimal(9,0)
DECLARE @cMessage as VARCHAR(2000)
SET @cMessage = ''''

IF @nThickness = 0
	RETURN @nFt

DECLARE @nDensity DECIMAL(9,4)
IF @cAlloy  = ''DEFAULT''
	SET @nDensity = .3
ELSE
	SET @nDensity = IsNull(dbo.AlloyDensity( dbo.AlloyName(@cAlloy) ),0)
	IF @nDensity = 0
	   BEGIN
		SET @nDensity = .29
		SET @cMessage = RTRIM(@cMessage)+'' Alloy Density not found!''
	   END
	ELSE
	   SET @cMessage = RTRIM(@cMessage)+''Used Density of ''+STR(@nDensity,5,3)

--Find Thickness used in PriceTable

SET @nFt = 0

IF @nSize2 = 0
	SET @nSize2 = 0.001
	
IF @cForm = ''10'' --BAR
   BEGIN
	IF @nThickness = 0
		SET @nFt = 0
	ELSE
	IF @nThickness < 3
		SET @nFt = @nLBS / (POWER(@nThickness+.01,2)* 3.23 * 12 * @nDensity/4)
	ELSE
	IF @nThickness < 6
		SET @nFt = @nLBS / (POWER(@nThickness+.02,2)* 3.23 * 12 *@nDensity/4)
	ELSE
		SET @nFt = @nLBS / (POWER(@nThickness+.032,2)* 3.23 * 12 *@nDensity/4)
   END
ELSE
IF @cForm = ''11'' --FLAT BAR
	SET @nFt = @nLBS / (@nDensity* @nThickness* 1.03* @nSize2 * 12)
ELSE
IF @cForm = ''12'' --HEX
	SET @nFt = @nLBS / (@nDensity * @nThickness * @nThickness * .866 * @nSize2 * 12)
ELSE
IF @cForm = ''13'' --SQAURE BAR
	SET @nFt = @nLBS / (@nDensity* @nThickness* 1.03 * @nSize2 * 12 )
ELSE
IF @cForm = ''20'' --WIRE
	SET @nFt = @nLBS / (POWER(@nThickness+.01,2)* 3.23 * 12 * @nDensity/4)
ELSE
IF @cForm = ''21'' --WIRE CUTS
	SET @nFt = @nLBS / (POWER(@nThickness+.01,2)* 3.23 * 12 * @nDensity/4)  
ELSE
--IF @cForm = ''22'' --LOOSE COIL
--	SET @nFt = @nSize2* @nPieces 
--ELSE
--IF @cForm = ''23'' --WIRE REEL  
--	SET @nFt = @nSize2* @nPieces 
--ELSE
--IF @cForm = ''30'' --COATED ELEC
--	SET @nFt = @nSize2* @nPieces 
--ELSE
IF @cForm = ''40'' --PLATE
	SET @nFt = @nLBS / (@nDensity * @nThickness * 1.015 * @nSize2 * 12 )
ELSE
IF @cForm = ''50'' --SHEET
	SET @nFt = @nLBS / (@nDensity * @nThickness * 1.015 * @nSize2 * 12 )
ELSE
IF @cForm = ''51'' --STRIP
	SET @nFt = @nLBS / (@nDensity * @nThickness * 1.015 * @nSize2 * 12 )
ELSE
IF @cForm = ''52'' -- COIL
	SET @nFt = @nLBS / (@nDensity * @nThickness * 1.015 * @nSize2 * 12 )
ELSE
IF @cForm = ''53'' -- Hot Band
	SET @nFt = @nLBS / (@nDensity * @nThickness * 1.015 * @nSize2 * 12 )
ELSE
--IF @cForm = ''60'' --TUBE
--	begin
--	--Twice wall thickness should never be mor than Dia
--	IF @nSize2*2 > @nThickness
--		SET @nFt = 0
--	ELSE
--		SET @nFt = @nDensity *@nSize3*@nSize2*3.23* (@nThickness-@nSize2)* @nPieces 
--	end
--ELSE
--IF @cForm = ''65'' --PIPE
--   BEGIN
--	DECLARE @nPipeWeight DECIMAL(9,4)
--	SET @nPipeWeight = IsNull(dbo.PipeWeight(@nThickness,@nSize2),0)
-- 	IF @nPipeWeight = 0
--		   SET @cMessage = RTRIM(@cMessage)+'' Pipe Weight not found!''
--
--	SET @nFt = (@nDensity* @nPipeWeight* @nSize3* @nPieces )
--
--   END
--ELSE
IF @cForm = ''66'' --NIPPLE     
	SET @nFt = @nPieces 
ELSE
IF @cForm = ''67'' --ELBOW      
	SET @nFt = @nPieces 
ELSE
IF @cForm = ''68'' --TEE      
	SET @nFt = @nPieces 
ELSE
IF @cForm = ''69'' --REDUCER      
	SET @nFt = @nPieces 
ELSE
IF @cForm = ''70'' --FITTINGS      
	SET @nFt = @nPieces 
ELSE
IF @cForm = ''71'' --COUPLING      
	SET @nFt = @nPieces 
ELSE
IF @cForm = ''72'' --FLANGE      
	SET @nFt = @nPieces 
ELSE
IF @cForm = ''75'' --FASTENER      
	SET @nFt = @nPieces 
ELSE
--IF @cForm = ''80'' --DISK
--	SET @nFt = (@nDensity * @nThickness * 1.03 * @nSize2 * @nSize2 * @nPieces )
--IF @cForm = ''90'' --MACHINED        
--	SET @nFt = @nPieces 
--ELSE
IF @cForm = ''95'' --FORGE     
	SET @nFt = @nPieces 
ELSE
IF @cForm = ''96'' --SLAB
	SET @nFt = @nLBS / (@nDensity * @nThickness * 1.015 * @nSize2 * 12 )
ELSE
IF @cForm = ''97'' --BILLET
	SET @nFt = @nLBS / (POWER(@nThickness+.032,2)* 3.23* @nDensity* @nSize2* 12 /4)
ELSE
IF @cForm = ''98'' --RCS 
	SET @nFt = @nLBS / (@nDensity* @nThickness* 1.015* @nThickness* @nSize2* 12 )
ELSE
IF @cForm = ''99'' --INGOT
	SET @nFt = @nLBS / (POWER(@nThickness+.032,2)* 3.23* @nDensity* @nSize2* 12 /4)

RETURN ISNULL(@nFt,0)
END


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_find_CustomerEmail]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_find_CustomerEmail]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Brandon van de Venter
-- Create date: 11/23/2020
-- Description:	Retrieve Customer Email for Sales Order
-- =============================================
CREATE FUNCTION [dbo].[f_find_CustomerEmail] 
(
	-- Add the parameters for the function here
	@salesnum int
)
RETURNS varchar (100)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @email varchar (100)

	-- Add the T-SQL statements to compute the return value here
	SELECT TOP (1) @email = RTRIM(ISNULL(aq.Email, ''''))
	FROM [dbo].[AllQuotes] aq
	WHERE aq.SalesNum = @salesnum

	IF (@email = '''') -- email not retrieved, check [dbo].[SoldAddr] for the email
	BEGIN
		SELECT TOP(1) @email = RTRIM(ISNULL(email, ''''))
		FROM [dbo].[Sales_No] sn
		JOIN [dbo].[SoldAddr] sa on sa.soldcode = sn.psoldaddr
		WHERE sn.salesnum =  @salesnum
	END

	IF (@email = '''') -- email not retrieved, check [dbo].[ShipAddr] for the email
	BEGIN
		SELECT TOP(1) @email = RTRIM(ISNULL(email, ''''))
		FROM [dbo].[Sales_No] sn
		JOIN [dbo].[ShipAddr] sa on sa.shipcode = sn.pshipaddr
		WHERE sn.salesnum = @salesnum
	END

	-- Return the result of the function
	RETURN @email

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Find_Sales_Owner_Of_Customer_Email]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Find_Sales_Owner_Of_Customer_Email]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Brandon van de Venter
-- Create date: 03/28/2019
-- Description:	Attempts to locate which sales person owns a customer email address
-- =============================================
CREATE FUNCTION [dbo].[f_Find_Sales_Owner_Of_Customer_Email]
(
	@email varchar(256)
)
RETURNS varchar(30)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @sp_initial varchar(30)
	DECLARE @rtEmail varchar(256) = RTRIM(@email)
	DECLARE @emailDomain varchar(256) = SUBSTRING(@rtEmail, CHARINDEX(''@'', @rtEmail), LEN(@rtEmail))
	DECLARE @compareDate dateTime = (GETDATE() - 2000)

	-- Add the T-SQL statements to compute the return value here
	SELECT TOP (1) @sp_initial = RTRIM(su.SP_Initial)
	FROM [dbo].[EmailService_Email_Log] el
	JOIN [dbo].[EmailService_SalesUsers] su on el.ForwardToId = su.Id
	where RTRIM([EmailFrom]) = @rtEmail
	and ForwardTime > @compareDate
	order by ForwardTime desc

	IF (@sp_initial is null) -- User Not Found User, check email domain instead
	BEGIN
		SELECT TOP (1) @sp_initial = RTRIM(su.SP_Initial)
		FROM [dbo].[EmailService_Email_Log] el
		JOIN [dbo].[EmailService_SalesUsers] su on el.ForwardToId = su.Id
		where RTRIM([EmailFrom]) like @emailDomain
		and ForwardTime > @compareDate
		order by ForwardTime desc
	END

	IF (@sp_initial is null) -- User Not Found User, check AllQuotes table
	BEGIN
		SELECT TOP (1) @sp_initial = RTRIM(AQ.SalesP) --, AQ.Cover -- Do we care about cover?
		FROM ERP_2.dbo.AllQuotes AQ
		WHERE AQ.InqDate > @compareDate
		AND RTRIM(AQ.Email) = @rtEmail
		ORDER BY AQ.SalesNum DESC, InqDate DESC
	END

	IF (@sp_initial is null) -- User Not Found User, check AllQuotes table by email domain
	BEGIN
		SELECT TOP (1) @sp_initial = RTRIM(AQ.SalesP) --, AQ.Cover -- Do we care about cover?
		FROM ERP_2.dbo.AllQuotes AQ
		WHERE AQ.InqDate > @compareDate
		AND RTRIM(AQ.Email) LIKE @emailDomain
		ORDER BY AQ.SalesNum DESC, InqDate DESC
	END

	-- Return the result of the function
	RETURN @sp_initial

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Find_Sales_Owner_Of_Customer_Email_Advanced]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Find_Sales_Owner_Of_Customer_Email_Advanced]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Brandon van de Venter
-- Create date: 12/30/2019
-- Description:	Attempts to locate which sales person owns a customer email address. If the domain is exempt, only an exact match is accepted
-- =============================================
Create FUNCTION [dbo].[f_Find_Sales_Owner_Of_Customer_Email_Advanced]
(
	@email varchar(256),
	@domainExempt bit
)
RETURNS varchar(30)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @sp_initial varchar(30)
	DECLARE @rtEmail varchar(256) = RTRIM(@email)
	DECLARE @emailDomain varchar(256) = SUBSTRING(@rtEmail, CHARINDEX(''@'', @rtEmail), LEN(@rtEmail))
	DECLARE @compareDate dateTime = (GETDATE() - 2000)

	-- Add the T-SQL statements to compute the return value here
	SELECT TOP (1) @sp_initial = RTRIM(su.SP_Initial)
	FROM [dbo].[EmailService_Email_Log] el
	JOIN [dbo].[EmailService_SalesUsers] su on el.ForwardToId = su.Id
	where RTRIM([EmailFrom]) = @rtEmail
	and ForwardTime > @compareDate
	order by ForwardTime desc

	IF (@sp_initial is null AND @domainExempt = 0) -- User Not Found User, check email domain instead
	BEGIN
		SELECT TOP (1) @sp_initial = RTRIM(su.SP_Initial)
		FROM [dbo].[EmailService_Email_Log] el
		JOIN [dbo].[EmailService_SalesUsers] su on el.ForwardToId = su.Id
		where RTRIM([EmailFrom]) like @emailDomain
		and ForwardTime > @compareDate
		order by ForwardTime desc
	END

	IF (@sp_initial is null) -- User Not Found User, check AllQuotes table
	BEGIN
		SELECT TOP (1) @sp_initial = RTRIM(AQ.SalesP) --, AQ.Cover -- Do we care about cover?
		FROM ERP_2.dbo.AllQuotes AQ
		WHERE AQ.InqDate > @compareDate
		AND RTRIM(AQ.Email) = @rtEmail
		ORDER BY AQ.SalesNum DESC, InqDate DESC
	END

	IF (@sp_initial is null AND @domainExempt = 0) -- User Not Found User, check AllQuotes table by email domain
	BEGIN
		SELECT TOP (1) @sp_initial = RTRIM(AQ.SalesP) --, AQ.Cover -- Do we care about cover?
		FROM ERP_2.dbo.AllQuotes AQ
		WHERE AQ.InqDate > @compareDate
		AND RTRIM(AQ.Email) LIKE @emailDomain
		ORDER BY AQ.SalesNum DESC, InqDate DESC
	END

	-- Return the result of the function
	RETURN @sp_initial

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_FiveYrPOcostAvg]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_FiveYrPOcostAvg]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2013 7 25
-- Description:	5 yr PO Cost weighted moving avg for a month
-- =============================================
CREATE FUNCTION [dbo].[f_FiveYrPOcostAvg] 
(
	-- Add the parameters for the function here
	@month int
	,@daysDueIn int

)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @avg float

	-- Add the T-SQL statements to compute the return value here
	DECLARE @5Y float
	SET @5Y = dbo.f_POCostForMonth(@month, year(getdate())-5, @daysDueIn)
	DECLARE @4Y float
	SET @4Y = dbo.f_POCostForMonth(@month, year(getdate())-4, @daysDueIn)
	DECLARE @3Y float
	SET @3Y = dbo.f_POCostForMonth(@month, year(getdate())-3, @daysDueIn)
	DECLARE @2Y float
	SET @2Y = dbo.f_POCostForMonth(@month, year(getdate())-2, @daysDueIn)
	DECLARE @1Y float
	SET @1Y = dbo.f_POCostForMonth(@month, year(getdate())-1, @daysDueIn)
	DECLARE @0Y float
	SET @0Y = dbo.f_POCostForMonth(@month, year(getdate())-0, @daysDueIn)
	
	IF @month < MONTH(GETDATE())
	BEGIN
		SELECT @avg = 1*(.25*@0Y + .25*@1Y + .20*@2Y + .15*@3Y + .15*@4Y)
	END
	ELSE
	BEGIN
		SELECT @avg = 1*(.25*@1Y + .25*@2Y + .20*@3Y + .15*@4Y + .15*@5Y)
	END

	-- Return the result of the function
	RETURN @avg

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_FiveYrPOcostAvgMonthToDate]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_FiveYrPOcostAvgMonthToDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2013 7 30
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_FiveYrPOcostAvgMonthToDate] 
(
	-- Add the parameters for the function here
	@month int
	,@daysDueIn int
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @avg float

	-- Add the T-SQL statements to compute the return value here
	DECLARE @5Y float
	SET @5Y = dbo.f_POCostToDateForMonth(@month, year(getdate())-5, @daysDueIn)
	DECLARE @4Y float
	SET @4Y = dbo.f_POCostToDateForMonth(@month, year(getdate())-4, @daysDueIn)
	DECLARE @3Y float
	SET @3Y = dbo.f_POCostToDateForMonth(@month, year(getdate())-3, @daysDueIn)
	DECLARE @2Y float
	SET @2Y = dbo.f_POCostToDateForMonth(@month, year(getdate())-2, @daysDueIn)
	DECLARE @1Y float
	SET @1Y = dbo.f_POCostToDateForMonth(@month, year(getdate())-1, @daysDueIn)
	DECLARE @0Y float
	SET @0Y = dbo.f_POCostToDateForMonth(@month, year(getdate())-0, @daysDueIn)
	
	IF @month < MONTH(GETDATE())
	BEGIN
		SELECT @avg = 1*(.25*@0Y + .25*@1Y + .20*@2Y + .15*@3Y + .15*@4Y)
	END
	ELSE
	BEGIN
		SELECT @avg = 1*(.25*@1Y + .25*@2Y + .20*@3Y + .15*@4Y + .15*@5Y)
	END

	-- Return the result of the function
	RETURN @avg

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_FiveYrPOcostAvgYearToDate]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_FiveYrPOcostAvgYearToDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2013 7 30
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_FiveYrPOcostAvgYearToDate] 
(
	-- Add the parameters for the function here
	@month int
	,@daysDueIn int
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @avg float

	-- Add the T-SQL statements to compute the return value here
	DECLARE @5Y float
	SET @5Y = dbo.f_POCostToDateForYear(year(getdate())-5, @daysDueIn)
	DECLARE @4Y float
	SET @4Y = dbo.f_POCostToDateForYear(year(getdate())-4, @daysDueIn)
	DECLARE @3Y float
	SET @3Y = dbo.f_POCostToDateForYear(year(getdate())-3, @daysDueIn)
	DECLARE @2Y float
	SET @2Y = dbo.f_POCostToDateForYear(year(getdate())-2, @daysDueIn)
	DECLARE @1Y float
	SET @1Y = dbo.f_POCostToDateForYear(year(getdate())-1, @daysDueIn)
	DECLARE @0Y float
	SET @0Y = dbo.f_POCostToDateForYear(year(getdate())-0, @daysDueIn)
	
	IF @month < MONTH(GETDATE())
	BEGIN
		SELECT @avg = 1*(.25*@0Y + .25*@1Y + .20*@2Y + .15*@3Y + .15*@4Y)
	END
	ELSE
	BEGIN
		SELECT @avg = 1*(.25*@1Y + .25*@2Y + .20*@3Y + .15*@4Y + .15*@5Y)
	END

	-- Return the result of the function
	RETURN @avg

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_FiveYrSOpoundsAvg]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_FiveYrSOpoundsAvg]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2013 7 30
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_FiveYrSOpoundsAvg] 
(
	-- Add the parameters for the function here
	@month int
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @avg float

	DECLARE @5Y float
	SET @5Y = dbo.f_SOPoundsForMonth(@month, year(getdate())-5)
	DECLARE @4Y float
	SET @4Y = dbo.f_SOPoundsForMonth(@month, year(getdate())-4)
	DECLARE @3Y float
	SET @3Y = dbo.f_SOPoundsForMonth(@month, year(getdate())-3)
	DECLARE @2Y float
	SET @2Y = dbo.f_SOPoundsForMonth(@month, year(getdate())-2)
	DECLARE @1Y float
	SET @1Y = dbo.f_SOPoundsForMonth(@month, year(getdate())-1)
	DECLARE @0Y float
	SET @0Y = dbo.f_SOPoundsForMonth(@month, year(getdate())-0)
	
	IF @month < MONTH(GETDATE())
	BEGIN
		SELECT @avg = 1*(.25*@0Y + .25*@1Y + .20*@2Y + .15*@3Y + .15*@4Y)
	END
	ELSE
	BEGIN
		SELECT @avg = 1*(.25*@1Y + .25*@2Y + .20*@3Y + .15*@4Y + .15*@5Y)
	END

	-- Return the result of the function
	RETURN @avg

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_FiveYrSOpoundsAvgMonthToDate]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_FiveYrSOpoundsAvgMonthToDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2013 7 30
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_FiveYrSOpoundsAvgMonthToDate] 
(
	-- Add the parameters for the function here
	@month int
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @avg float

	-- Add the T-SQL statements to compute the return value here
	DECLARE @5Y float
	SET @5Y = dbo.f_SOPoundsToDateForMonth(@month, year(getdate())-5)
	DECLARE @4Y float
	SET @4Y = dbo.f_SOPoundsToDateForMonth(@month, year(getdate())-4)
	DECLARE @3Y float
	SET @3Y = dbo.f_SOPoundsToDateForMonth(@month, year(getdate())-3)
	DECLARE @2Y float
	SET @2Y = dbo.f_SOPoundsToDateForMonth(@month, year(getdate())-2)
	DECLARE @1Y float
	SET @1Y = dbo.f_SOPoundsToDateForMonth(@month, year(getdate())-1)
	DECLARE @0Y float
	SET @0Y = dbo.f_SOPoundsToDateForMonth(@month, year(getdate())-0)
	
	IF @month < MONTH(GETDATE())
	BEGIN
		SELECT @avg = 1*(.25*@0Y + .25*@1Y + .20*@2Y + .15*@3Y + .15*@4Y)
	END
	ELSE
	BEGIN
		SELECT @avg = 1*(.25*@1Y + .25*@2Y + .20*@3Y + .15*@4Y + .15*@5Y)
	END

	-- Return the result of the function
	RETURN @avg

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_FiveYrSOpoundsAvgYearToDate]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_FiveYrSOpoundsAvgYearToDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2013 7 30
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_FiveYrSOpoundsAvgYearToDate] 
(
	-- Add the parameters for the function here
	@month int
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @avg float

	-- Add the T-SQL statements to compute the return value here
	DECLARE @5Y float
	SET @5Y = dbo.f_SOPoundsToDateForYear(year(getdate())-5)
	DECLARE @4Y float
	SET @4Y = dbo.f_SOPoundsToDateForYear(year(getdate())-4)
	DECLARE @3Y float
	SET @3Y = dbo.f_SOPoundsToDateForYear(year(getdate())-3)
	DECLARE @2Y float
	SET @2Y = dbo.f_SOPoundsToDateForYear(year(getdate())-2)
	DECLARE @1Y float
	SET @1Y = dbo.f_SOPoundsToDateForYear(year(getdate())-1)
	DECLARE @0Y float
	SET @0Y = dbo.f_SOPoundsToDateForYear(year(getdate())-0)
	
	IF @month < MONTH(GETDATE())
	BEGIN
		SELECT @avg = 1*(.25*@0Y + .25*@1Y + .20*@2Y + .15*@3Y + .15*@4Y)
	END
	ELSE
	BEGIN
		SELECT @avg = 1*(.25*@1Y + .25*@2Y + .20*@3Y + .15*@4Y + .15*@5Y)
	END

	-- Return the result of the function
	RETURN @avg

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_FiveYrSOsalesAvg]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_FiveYrSOsalesAvg]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2013 7 26
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_FiveYrSOsalesAvg] 
(
	-- Add the parameters for the function here
	@month int
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @avg float

	DECLARE @5Y float
	SET @5Y = dbo.f_SOSalesForMonth(@month, year(getdate())-5)
	DECLARE @4Y float
	SET @4Y = dbo.f_SOSalesForMonth(@month, year(getdate())-4)
	DECLARE @3Y float
	SET @3Y = dbo.f_SOSalesForMonth(@month, year(getdate())-3)
	DECLARE @2Y float
	SET @2Y = dbo.f_SOSalesForMonth(@month, year(getdate())-2)
	DECLARE @1Y float
	SET @1Y = dbo.f_SOSalesForMonth(@month, year(getdate())-1)
	DECLARE @0Y float
	SET @0Y = dbo.f_SOSalesForMonth(@month, year(getdate())-0)
	
	IF @month < MONTH(GETDATE())
	BEGIN
		SELECT @avg = 1*(.25*@0Y + .25*@1Y + .20*@2Y + .15*@3Y + .15*@4Y)
	END
	ELSE
	BEGIN
		SELECT @avg = 1*(.25*@1Y + .25*@2Y + .20*@3Y + .15*@4Y + .15*@5Y)
	END

	-- Return the result of the function
	RETURN @avg

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_FiveYrSOsalesAvgMonthToDate]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_FiveYrSOsalesAvgMonthToDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2013 7 30
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_FiveYrSOsalesAvgMonthToDate] 
(
	-- Add the parameters for the function here
	@month int
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @avg float

	-- Add the T-SQL statements to compute the return value here
	DECLARE @5Y float
	SET @5Y = dbo.f_SOSalesToDateForMonth(@month, year(getdate())-5)
	DECLARE @4Y float
	SET @4Y = dbo.f_SOSalesToDateForMonth(@month, year(getdate())-4)
	DECLARE @3Y float
	SET @3Y = dbo.f_SOSalesToDateForMonth(@month, year(getdate())-3)
	DECLARE @2Y float
	SET @2Y = dbo.f_SOSalesToDateForMonth(@month, year(getdate())-2)
	DECLARE @1Y float
	SET @1Y = dbo.f_SOSalesToDateForMonth(@month, year(getdate())-1)
	DECLARE @0Y float
	SET @0Y = dbo.f_SOSalesToDateForMonth(@month, year(getdate())-0)
	
	IF @month < MONTH(GETDATE())
	BEGIN
		SELECT @avg = 1*(.25*@0Y + .25*@1Y + .20*@2Y + .15*@3Y + .15*@4Y)
	END
	ELSE
	BEGIN
		SELECT @avg = 1*(.25*@1Y + .25*@2Y + .20*@3Y + .15*@4Y + .15*@5Y)
	END

	-- Return the result of the function
	RETURN @avg

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_FiveYrSOsalesAvgYearToDate]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_FiveYrSOsalesAvgYearToDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2013 7 30
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_FiveYrSOsalesAvgYearToDate] 
(
	-- Add the parameters for the function here
	@month int
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @avg float

	-- Add the T-SQL statements to compute the return value here
	DECLARE @5Y float
	SET @5Y = dbo.f_SOSalesToDateForYear(year(getdate())-5)
	DECLARE @4Y float
	SET @4Y = dbo.f_SOSalesToDateForYear(year(getdate())-4)
	DECLARE @3Y float
	SET @3Y = dbo.f_SOSalesToDateForYear(year(getdate())-3)
	DECLARE @2Y float
	SET @2Y = dbo.f_SOSalesToDateForYear(year(getdate())-2)
	DECLARE @1Y float
	SET @1Y = dbo.f_SOSalesToDateForYear(year(getdate())-1)
	DECLARE @0Y float
	SET @0Y = dbo.f_SOSalesToDateForYear(year(getdate())-0)
	
	IF @month < MONTH(GETDATE())
	BEGIN
		SELECT @avg = 1*(.25*@0Y + .25*@1Y + .20*@2Y + .15*@3Y + .15*@4Y)
	END
	ELSE
	BEGIN
		SELECT @avg = 1*(.25*@1Y + .25*@2Y + .20*@3Y + .15*@4Y + .15*@5Y)
	END

	-- Return the result of the function
	RETURN @avg

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Form_Name]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Form_Name]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[f_Form_Name] 
( @cForm AS CHAR(2)
)

RETURNS CHAR(11)
AS
BEGIN
-- test
--SELECT dbo.f_Form_Name(''40'')

DECLARE @cFormDescription CHAR(11)

SELECT @cFormDescription = ISNULL(FormDescription,'''')
	FROM dbo.Forms WITH(NOLOCK)
	WHERE FormNumber = @cForm

RETURN @cFormDescription
END





--GRANT EXECUTE ON [dbo].[f_Form_Name] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Format_Survey_Purpose_HTML]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Format_Survey_Purpose_HTML]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Brandon van de Venter
-- Create date: 07/14/2022
-- Description:	Returns Formated User Survey HTML (FOR DEV)
-- =============================================
CREATE FUNCTION [dbo].[f_Format_Survey_Purpose_HTML] 
(
	-- Add the parameters for the function here
	@surveyAssignmentID uniqueidentifier,
	@surveyPurpose varchar(50)
)
RETURNS varchar(max)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @returnHTML varchar(MAX) = '''',
		@_URL varchar(MAX) = '''',
		@_surveyID uniqueidentifier,
		@_assignmentID uniqueidentifier


	-- Add the T-SQL statements to compute the return value here
	
	select @_URL = [dbo].[f_Format_User_Survey_URL] (@surveyAssignmentID)

	set @returnHTML = 
			''<table cellpadding="0" cellspacing="0" style="border-collapse:separate;border-spacing:0 5px;mso-table-lspace:0pt;mso-table-rspace:5px;width:auto;border:2px solid black;padding:10px 20px;margin:5px;text-align:center;background-color:white;color:black;">''
		+		''<tr><td>''
		+			''<img style="width: 150px; height: auto;" src="data:image/png;base64,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dG9zaG9wOmY3ZDg5NjJjLTVlN2UtNTI0Ni1iZjExLWQ3MWY4MjVkNjhmZCIKICAgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo1ZDRhZTczYy1mMjZlLTRjMjktODEzNS00Y2FlNzFjNDgwNzAiCiAgIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo2NmY5ZDc3My1iY2NiLTdkNGEtODZiZi0wYTFlY2M2ZGZmMTgiCiAgIGRjOmZvcm1hdD0iYXBwbGljYXRpb24vdm5kLmFkb2JlLnBob3Rvc2hvcCIKICAgR0lNUDpBUEk9IjIuMCIKICAgR0lNUDpQbGF0Zm9ybT0iV2luZG93cyIKICAgR0lNUDpUaW1lU3RhbXA9IjE3MjA1NTgwMDcwMDExOTgiCiAgIEdJTVA6VmVyc2lvbj0iMi4xMC4zOCIKICAgcGhvdG9zaG9wOkNvbG9yTW9kZT0iMyIKICAgcGhvdG9zaG9wOklDQ1Byb2ZpbGU9InNSR0IgSUVDNjE5NjYtMi4xIgogICB0aWZmOk9yaWVudGF0aW9uPSIxIgogICB4bXA6Q3JlYXRlRGF0ZT0iMjAyMy0xMi0xNFQyMDoxOTo0NS0wNTowMCIKICAgeG1wOkNyZWF0b3JUb29sPSJHSU1QIDIuMTAiCiAgIHhtcDpNZXRhZGF0YURhdGU9IjIwMjQ6MDc6MDlUMTY6NDY6MjgtMDQ6MDAiCiAgIHhtcDpNb2RpZnlEYXRlPSIyMDI0OjA3OjA5VDE2OjQ2OjI4LTA0OjAwIj4KICAgPHhtcE1NOkhpc3Rvcnk+CiAgICA8cmRmOlNlcT4KICAgICA8cmRmOmxpCiAgICAgIHN0RXZ0OmFjdGlvbj0iY3JlYXRlZCIKICAgICAgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDo2NmY5ZDc3My1iY2NiLTdkNGEtODZiZi0wYTFlY2M2ZGZmMTgiCiAgICAgIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCAyNS4yIChXaW5kb3dzKSIKICAgICAgc3RFdnQ6d2hlbj0iMjAyMy0xMi0xNFQyMDoxOTo0NS0wNTowMCIvPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJzYXZlZCIKICAgICAgc3RFdnQ6Y2hhbmdlZD0iLyIKICAgICAgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDpkNjhhOTYxYi1lODVjLTFmNDctYmYxYy1hOTI3M2Q2ZmU4NTIiCiAgICAgIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCAyNS4yIChXaW5kb3dzKSIKICAgICAgc3RFdnQ6d2hlbj0iMjAyMy0xMi0xNFQyMDo1MTowNS0wNTowMCIvPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJzYXZlZCIKICAgICAgc3RFdnQ6Y2hhbmdlZD0iLyIKICAgICAgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDo5NmRmM2UwZC01ZDA1LWFiNDctYjEwZS0zOWE4YzJhOTk0OWQiCiAgICAgIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCAyNS45IChXaW5kb3dzKSIKICAgICAgc3RFdnQ6d2hlbj0iMjAyNC0wNy0wOVQxNTo1MzoyNi0wNDowMCIvPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJzYXZlZCIKICAgICAgc3RFdnQ6Y2hhbmdlZD0iLyIKICAgICAgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDoxY2NmZWM4NC0xY2MyLTQyMmYtYjk3MS1hOTI4YjkwMzAwNGMiCiAgICAgIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkdpbXAgMi4xMCAoV2luZG93cykiCiAgICAgIHN0RXZ0OndoZW49IjIwMjQtMDctMDlUMTY6NDY6NDciLz4KICAgIDwvcmRmOlNlcT4KICAgPC94bXBNTTpIaXN0b3J5PgogICA8cGhvdG9zaG9wOkRvY3VtZW50QW5jZXN0b3JzPgogICAgPHJkZjpCYWc+CiAgICAgPHJkZjpsaT4wQzRCNjhDQUNDRkFEOTFDODJCODcyMDM3OTNDMUEwNjwvcmRmOmxpPgogICAgIDxyZGY6bGk+eG1wLmRpZDo2NmY5ZDc3My1iY2NiLTdkNGEtODZiZi0wYTFlY2M2ZGZmMTg8L3JkZjpsaT4KICAgIDwvcmRmOkJhZz4KICAgPC9waG90b3Nob3A6RG9jdW1lbnRBbmNlc3RvcnM+CiAgPC9yZGY6RGVzY3JpcHRpb24+CiA8L3JkZjpSREY+CjwveDp4bXBtZXRhPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg''
		+			''ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgCjw/eHBhY2tldCBlbmQ9InciPz4wNYzkAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAC4jAAAuIwF4pT92AAAAB3RJTUUH6AcJFC4uNRWvmgAAIABJREFUeNrsvXmcZFV5//8+595be/U23T09W88Mwz6sCi4sLqCYsIVEiXsMRlCjxmjiN4kSiMvX7RfF5evXjYASTb4mYgQxEhdABQdFENlmYGYYZu3pfavq6qp77zm/P85SVbPIDAIK9Hm9xpGequpb957nPM/zeT7P5xEsrMd9aa0l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" />''
		+			''<p style="font-weight:bold;">''
		+			''One important benefit of our quality system registration is facilitating opportunities to enhance customer satisfaction.''
		+			'' To assist us in this effort, we ask that you take a few minutes to complete a quick survey about your '' + @surveyPurpose 
		+			'' experience as we strive to provide our customers the best quality products and services.</p>''
		+			''<table border="0" cellpadding="0" cellspacing="0" align="center" style="border-collapse:separate;mso-table-lspace:0pt;mso-table-rspace:0pt;width:auto;">''
		+				''<tr><td style="font-family:sans-serif;font-size:14px;vertical-align:top;background-color:#007bff;border-radius:3px;text-align:center;display:inline-block;" align="center">''
		+					''<a href="<%URL%>" target="_blank" style="display:inline-block;color:#ffffff;background-color:#007bff;border:solid 1px #007bff;box-sizing:border-box;cursor:pointer;text-decoration:none;font-size:14px;font-weight:bold;margin:0;padding:12px 25px;text-transform:capitalize;border-radius:3px;" title="Click here to take survey">Take Survey</a>''
		+			''</td></tr></table>''
		+	''</td></tr></table>'';

	-- Return the result of the function
	RETURN REPLACE(@returnHTML, ''<%URL%>'', @_URL);

END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Format_User_Survey_HTML]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Format_User_Survey_HTML]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Brandon van de Venter
-- Create date: 12/06/2021
-- Description:	Returns Formated User Survey HTML
-- UPDATES:
-- 01/26/2022 - Updated HTML to work for Outlook. Apparently Outlook still to this day uses MS WORD to render HTML. Word uses a cut down ancient version of HTML 4.
-- =============================================
CREATE FUNCTION [dbo].[f_Format_User_Survey_HTML] 
(
	-- Add the parameters for the function here
	@surveyAssignmentID uniqueidentifier
)
RETURNS varchar(max)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @returnHTML varchar(MAX) = '''',
		@_URL varchar(MAX) = '''',
		@_surveyID uniqueidentifier,
		@_assignmentID uniqueidentifier


	-- Add the T-SQL statements to compute the return value here
	
	select @_URL = [dbo].[f_Format_User_Survey_URL] (@surveyAssignmentID)

	set @returnHTML = 
			''<table cellpadding="0" cellspacing="0" style="border-collapse:separate;border-spacing:0 5px;mso-table-lspace:0pt;mso-table-rspace:5px;width:auto;border:2px solid black;padding:10px 20px;margin:5px;text-align:center;background-color:white;color:black;">''
		+		''<tr><td>''
		+			''<img style="width: 150px; height: auto;" src="data:image/png;base64,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dG9zaG9wOmY3ZDg5NjJjLTVlN2UtNTI0Ni1iZjExLWQ3MWY4MjVkNjhmZCIKICAgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo1ZDRhZTczYy1mMjZlLTRjMjktODEzNS00Y2FlNzFjNDgwNzAiCiAgIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo2NmY5ZDc3My1iY2NiLTdkNGEtODZiZi0wYTFlY2M2ZGZmMTgiCiAgIGRjOmZvcm1hdD0iYXBwbGljYXRpb24vdm5kLmFkb2JlLnBob3Rvc2hvcCIKICAgR0lNUDpBUEk9IjIuMCIKICAgR0lNUDpQbGF0Zm9ybT0iV2luZG93cyIKICAgR0lNUDpUaW1lU3RhbXA9IjE3MjA1NTgwMDcwMDExOTgiCiAgIEdJTVA6VmVyc2lvbj0iMi4xMC4zOCIKICAgcGhvdG9zaG9wOkNvbG9yTW9kZT0iMyIKICAgcGhvdG9zaG9wOklDQ1Byb2ZpbGU9InNSR0IgSUVDNjE5NjYtMi4xIgogICB0aWZmOk9yaWVudGF0aW9uPSIxIgogICB4bXA6Q3JlYXRlRGF0ZT0iMjAyMy0xMi0xNFQyMDoxOTo0NS0wNTowMCIKICAgeG1wOkNyZWF0b3JUb29sPSJHSU1QIDIuMTAiCiAgIHhtcDpNZXRhZGF0YURhdGU9IjIwMjQ6MDc6MDlUMTY6NDY6MjgtMDQ6MDAiCiAgIHhtcDpNb2RpZnlEYXRlPSIyMDI0OjA3OjA5VDE2OjQ2OjI4LTA0OjAwIj4KICAgPHhtcE1NOkhpc3Rvcnk+CiAgICA8cmRmOlNlcT4KICAgICA8cmRmOmxpCiAgICAgIHN0RXZ0OmFjdGlvbj0iY3JlYXRlZCIKICAgICAgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDo2NmY5ZDc3My1iY2NiLTdkNGEtODZiZi0wYTFlY2M2ZGZmMTgiCiAgICAgIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCAyNS4yIChXaW5kb3dzKSIKICAgICAgc3RFdnQ6d2hlbj0iMjAyMy0xMi0xNFQyMDoxOTo0NS0wNTowMCIvPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJzYXZlZCIKICAgICAgc3RFdnQ6Y2hhbmdlZD0iLyIKICAgICAgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDpkNjhhOTYxYi1lODVjLTFmNDctYmYxYy1hOTI3M2Q2ZmU4NTIiCiAgICAgIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCAyNS4yIChXaW5kb3dzKSIKICAgICAgc3RFdnQ6d2hlbj0iMjAyMy0xMi0xNFQyMDo1MTowNS0wNTowMCIvPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJzYXZlZCIKICAgICAgc3RFdnQ6Y2hhbmdlZD0iLyIKICAgICAgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDo5NmRmM2UwZC01ZDA1LWFiNDctYjEwZS0zOWE4YzJhOTk0OWQiCiAgICAgIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCAyNS45IChXaW5kb3dzKSIKICAgICAgc3RFdnQ6d2hlbj0iMjAyNC0wNy0wOVQxNTo1MzoyNi0wNDowMCIvPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJzYXZlZCIKICAgICAgc3RFdnQ6Y2hhbmdlZD0iLyIKICAgICAgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDoxY2NmZWM4NC0xY2MyLTQyMmYtYjk3MS1hOTI4YjkwMzAwNGMiCiAgICAgIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkdpbXAgMi4xMCAoV2luZG93cykiCiAgICAgIHN0RXZ0OndoZW49IjIwMjQtMDctMDlUMTY6NDY6NDciLz4KICAgIDwvcmRmOlNlcT4KICAgPC94bXBNTTpIaXN0b3J5PgogICA8cGhvdG9zaG9wOkRvY3VtZW50QW5jZXN0b3JzPgogICAgPHJkZjpCYWc+CiAgICAgPHJkZjpsaT4wQzRCNjhDQUNDRkFEOTFDODJCODcyMDM3OTNDMUEwNjwvcmRmOmxpPgogICAgIDxyZGY6bGk+eG1wLmRpZDo2NmY5ZDc3My1iY2NiLTdkNGEtODZiZi0wYTFlY2M2ZGZmMTg8L3JkZjpsaT4KICAgIDwvcmRmOkJhZz4KICAgPC9waG90b3Nob3A6RG9jdW1lbnRBbmNlc3RvcnM+CiAgPC9yZGY6RGVzY3JpcHRpb24+CiA8L3JkZjpSREY+CjwveDp4bXBtZXRhPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg''
		+			''ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgCjw/eHBhY2tldCBlbmQ9InciPz4wNYzkAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAC4jAAAuIwF4pT92AAAAB3RJTUUH6AcJFC4uNRWvmgAAIABJREFUeNrsvXmcZFV5//8+595be/U23T09W88Mwz6sCi4sLqCYsIVEiXsMRlCjxmjiN4kSiMvX7RfF5evXjYASTb4mYgQxEhdABQdFENlmYGYYZu3pfavq6qp77zm/P85SVbPIDAIK9Hm9xpGequpb957nPM/zeT7P5xEsrMd9aa0l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" />''
		+			''<p style="font-weight:bold;">We at High Performance Alloys value your feedback!  Please take a minute to complete a 1 question survey.</p>''
		+			''<table border="0" cellpadding="0" cellspacing="0" align="center" style="border-collapse:separate;mso-table-lspace:0pt;mso-table-rspace:0pt;width:auto;">''
		+				''<tr><td style="font-family:sans-serif;font-size:14px;vertical-align:top;background-color:#007bff;border-radius:3px;text-align:center;display:inline-block;" align="center">''
		+					''<a href="<%URL%>" target="_blank" style="display:inline-block;color:#ffffff;background-color:#007bff;border:solid 1px #007bff;box-sizing:border-box;cursor:pointer;text-decoration:none;font-size:14px;font-weight:bold;margin:0;padding:12px 25px;text-transform:capitalize;border-radius:3px;" title="Click here to take survey">Take Survey</a>''
		+			''</td></tr></table>''
		+	''</td></tr></table>'';

	-- Return the result of the function
	RETURN REPLACE(@returnHTML, ''<%URL%>'', @_URL);

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Format_User_Survey_Url]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Format_User_Survey_Url]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Brandon van de Venter
-- Create date: 07/29/2021
-- Description:	Returns Formated User Survey URL
-- =============================================
CREATE FUNCTION [dbo].[f_Format_User_Survey_Url] 
(
	-- Add the parameters for the function here
	@surveyAssignmentID uniqueidentifier
)
RETURNS varchar(MAX)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @returnURL varchar(MAX) = '''',
		@_surveyID uniqueidentifier,
		@_assignmentID uniqueidentifier


	-- Add the T-SQL statements to compute the return value here
	SELECT TOP (1) @_surveyID = [SurveyID], @_assignmentID = [ID]
	FROM [dbo].[Survey_Assignments]
	WHERE [ID] = @surveyAssignmentID

	IF (@_surveyID IS NOT NULL AND @_assignmentID IS NOT NULL)
	BEGIN
		SET @returnURL = ''https://Surveys.HighPerformanceAlloys.com/Surveys/'' + CAST(@_surveyID AS char(36)) + ''/'' + CAST(@_assignmentID AS char(36))
	END

	-- Return the result of the function
	RETURN @returnURL

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Format_User_Survey_Url_DEV]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Format_User_Survey_Url_DEV]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Brandon van de Venter
-- Create date: 07/14/2022
-- Description:	Returns Formated User Survey URL (FOR DEV)
-- =============================================
CREATE FUNCTION [dbo].[f_Format_User_Survey_Url_DEV] 
(
	-- Add the parameters for the function here
	@surveyAssignmentID uniqueidentifier
)
RETURNS varchar(MAX)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @returnURL varchar(MAX) = '''',
		@_surveyID uniqueidentifier,
		@_assignmentID uniqueidentifier


	-- Add the T-SQL statements to compute the return value here
	SELECT TOP (1) @_surveyID = [SurveyID], @_assignmentID = [ID]
	FROM [dbo].[Survey_Assignments]
	WHERE [ID] = @surveyAssignmentID

	IF (@_surveyID IS NOT NULL AND @_assignmentID IS NOT NULL)
	BEGIN
		SET @returnURL = ''https://Surveys.HighPerformanceAlloys.com/Surveys/'' + CAST(@_surveyID AS char(36)) + ''/'' + CAST(@_assignmentID AS char(36))
	END

	-- Return the result of the function
	RETURN @returnURL

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_FormSort]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_FormSort]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_FormSort] 
(
@pcFormNumber char(2)
)
RETURNS char(2)
AS
BEGIN

--SELECT dbo.f_FormSort(''51'')
--SET @FormSort = dbo.f_FormSort(inserted.[Form])

DECLARE @lcFormSort char(2)

SELECT TOP 1 @lcFormSort = FormSort 
 FROM dbo.Forms 
 WITH(NOLOCK)
 WHERE FormNumber = @pcFormNumber

RETURN (@lcFormSort)
END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Get_Alloy_GL_Inv]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Get_Alloy_GL_Inv]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


/****** Object:  User Defined Function dbo.f_Alloy_Surcharge    Script Date: 12/6/2005 1:08:34 PM ******/
CREATE FUNCTION [dbo].[f_Get_Alloy_GL_Inv]
(
@nGL INT
)
RETURNS CHAR(12)
AS

--SELECT dbo.f_Get_Alloy_GL_Inv(41000)
--SELECT dbo.f_Alloy_GL_Inv(''R405'')
--[Alloy] ''Misc        '' [GL_Sales] = 44400

BEGIN
DECLARE @cAlloy CHAR(12) = ''''

SELECT @cAlloy = Alloy FROM dbo.Alloy_GL WHERE GL_Inv = @nGL AND @nGL>0

RETURN @cAlloy
END



--GRANT EXECUTE ON [dbo].[f_Get_Alloy_GL_Inv] TO [WINDFALL\HPA] AS [dbo];




' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Get_AlloyGL]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Get_AlloyGL]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_Get_AlloyGL]
(
@cAlloy char(12)
)
RETURNS BIT
AS
BEGIN

--SELECT dbo.f_Is_HPAStock (''C-276'')
--SELECT dbo.f_Is_HPAStock (''C-276'') AS [Stk]
DECLARE @nGLReturn INT

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @nGLReturn = 0

SELECT @nGLReturn=GL FROM dbo.Alloy 	WHERE Alloy = @cAlloy 

RETURN @nGLReturn
END


-- GRANT EXECUTE ON [dbo].[f_Get_AlloyGL] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Get_BCC]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Get_BCC]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[f_Get_BCC]
(

)
RETURNS CHAR(30)
AS
BEGIN

--SET @BCC = dbo.f_Get_BCC()

DECLARE @cReturn VARCHAR(100)

SET @cReturn = ''''--''4012785@bcc.hubspot.com''

RETURN @cReturn
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Get_BrokerLst_ID]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Get_BrokerLst_ID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


Create FUNCTION [dbo].[f_Get_BrokerLst_ID]
(
	@nID_Detail INT
)
RETURNS INT
AS
BEGIN

--SELECT dbo.f_Get_BrokerLst_ID(11000)

DECLARE @nID INT
SET @nID = 0

SELECT @nID = ID FROM dbo.BrokerLst_Detail WHERE ID_Detail = @nID_Detail


RETURN @nID

END' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Get_Email_Profile_Name]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Get_Email_Profile_Name]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Get_Email_Profile_Name] 
(
	@Profile_Name VarChar(20)
)

RETURNS VARCHAR(30)
AS
BEGIN
--SET NOCOUNT ON
--PRINT dbo.f_Get_Email_Profile_Name(''David Kirchner'')

DECLARE @SpEmail AS VARCHAR(30)

SELECT @SpEmail = ISNULL([EMAIL],''Admin@ERP_1s.com'') FROM dbo.Profile_Names WHERE Profile_Name = @Profile_Name

IF @SpEmail = ''Admin@ERP_1s.com''
	begin
		
	EXEC msdb.dbo.sp_send_dbmail 
		 @profile_name = ''ERP_1s''
		 ,@recipients = @SpEmail
		 ,@from_address = ''Admin@ERP_1s.com''
		 ,@subject = ''Admin@ERP_1s.com was used because Profile was not found.''
		 ,@body = ''ERP_2.dbo.f_Get_Email_Profile_Name(@Profile_Name) ''--+@Profile_Name
		 ,@body_format = ''TEXT'' ;

	end

RETURN @SpEmail;
END




/*
GRANT EXECUTE ON [dbo].f_Get_Email_Profile_Name TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].f_Get_Email_Profile_Name TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].f_Get_Email_Profile_Name TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Get_EmailService_User_ClockedIn]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Get_EmailService_User_ClockedIn]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Brandon van de Venter
-- Create date: 08/17/2020
-- Description:	Retreives ClockedIn Status from Messenger Users table
-- =============================================
CREATE FUNCTION [dbo].[f_Get_EmailService_User_ClockedIn] 
(
	-- Add the parameters for the function here
	@firstName varchar(25),
	@lastName varchar(25)
)
RETURNS bit
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result bit

	-- Add the T-SQL statements to compute the return value here
	Select TOP (1) @Result = ClockedIn 
	FROM [Messenger].[dbo].[Users] u 
	where u.UserName = (RTRIM(@firstName) + '' '' + RTRIM(@lastName))

	-- Return the result of the function
	RETURN ISNULL(@Result, CONVERT(bit, 0))

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Get_GFM_DieHeight]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Get_GFM_DieHeight]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Brandon van de Venter
-- Create date: 5/27/2020
-- Description:	Retreives the latest Die Heihgt for a Die Set
-- =============================================
CREATE FUNCTION [dbo].[f_Get_GFM_DieHeight] 
(
	-- Add the parameters for the function here
	@DieId uniqueidentifier
)
RETURNS decimal(6,4)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @DieHeight decimal(6,4) = 0;

	SELECT TOP(1) @DieHeight = dsh.DieHeight 
	FROM [dbo].[GFM_DieSets_Height] dsh 
	WHERE dsh.DieID = @DieId
	Order by dsh.[When] desc

	-- Return the result of the function
	RETURN @DieHeight

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Get_HTML_Header]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Get_HTML_Header]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[f_Get_HTML_Header]
(	
)
RETURNS varchar(4000)

AS
BEGIN


-- Print dbo.f_Get_HTML_Header()
--
DECLARE @HTMLHead varchar(4000)

SELECT @HTMLHead = ''<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 5.0 Strict//EN\">''
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
    + ''</table><p><body>''

RETURN @HTMLHead

END
--GRANT EXECUTE ON [dbo].[f_Get_HTML_Header] TO [WINDFALL\HPA] AS [dbo];

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Get_LOG_fromLot]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Get_LOG_fromLot]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[f_Get_LOG_fromLot]
(
@cString VARCHAR( 10 )
)
RETURNS INT
AS
BEGIN
--Return Machine and Lot without HPA 

--SELECT dbo.f_Get_LOG_fromLot(''G5781'')
--SELECT dbo.f_Get_LOG_fromLot(''HPA R800'')
--SELECT dbo.f_Get_Machine_fromLot(''G5781'') --=''G''
--SELECT dbo.f_Get_Machine_fromLot(''HPA R800'') -=''R''

--SELECT dbo.f_Get_MLot_fromLot(''HPA G5781'')  =''G5781''

declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @nLog INT = 0
DECLARE @cLog CHAR(10) = ''''

--Locate ''HPA '' and remove from string
IF @cString LIKE ''%HPA %''
	SET @cString = TRIM(SUBSTRING(@cString,PATINDEX(''%HPA %'',@cString)+4,6))
ELSE
IF @cString LIKE ''%HPA%''
	SET @cString = TRIM(SUBSTRING(@cString,PATINDEX(''%HPA%'',@cString)+3,6))

SET @cString = LTRIM(RTRIM(@cString))

DECLARE @cMachine CHAR(1) = ''''
IF @cString LIKE ''[A-Z]%''
	begin
	SET @cMachine = TRIM(SUBSTRING(@cString,PATINDEX(''[A-Z]%'',@cString),1))
	SET @cString = RTRIM(SUBSTRING(@cString,2,10))
	end

--See if Initial is possible, return ''''
IF LEN(dbo.f_GetMachine_Table(@cMachine)) = 0
	RETURN ''''

SET @cLog = LTRIM(RTRIM(@cString))
SET @nLog = CAST(@cLog AS INT)




RETURN @nLog
END



--GRANT EXECUTE ON dbo.[f_Get_LOG_fromLot] TO [WINDFALL\HPA] AS [dbo];
--GRANT EXECUTE ON dbo.[f_Get_LOG_fromLot] TO [WINDFALL\HPA Reports] AS [dbo];
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Get_Machine_fromLot]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Get_Machine_fromLot]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[f_Get_Machine_fromLot]
(
@cString VARCHAR( MAX )
)
RETURNS VARCHAR(50)
AS
BEGIN
--Return Machine and Lot without HPA 

--SELECT dbo.f_Get_Machine_fromLot(''G5781'') --''G''
--SELECT dbo.f_Get_Machine_fromLot(''HPA R800'') --''R''

--SELECT dbo.f_Get_LOG_fromLot(''G5781'') -- 5781
--SELECT dbo.f_Get_LOG_fromLot(''HPA R800'') --800


declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @cMachine VARCHAR(10) = ''''

--Locate ''HPA '' and remove from string
IF @cString LIKE ''%HPA %''
	SET @cString = TRIM(SUBSTRING(@cString,PATINDEX(''%HPA %'',@cString)+4,6))
ELSE
IF @cString LIKE ''%HPA%''
	SET @cString = TRIM(SUBSTRING(@cString,PATINDEX(''%HPA%'',@cString)+3,6))


IF @cString LIKE ''[A-Z]%''
	SET @cMachine = TRIM(SUBSTRING(@cString,PATINDEX(''[A-Z]%'',@cString),1))




--See if Initial is possible, return ''''
IF LEN(dbo.f_GetMachine_Table(@cMachine)) = 0
	RETURN ''''


RETURN @cMachine
END



--GRANT EXECUTE ON dbo.[f_Get_Machine_fromLot] TO [WINDFALL\HPA] AS [dbo];
--GRANT EXECUTE ON dbo.[f_Get_Machine_fromLot] TO [WINDFALL\HPA Reports] AS [dbo];
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Get_MLot_fromLot]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Get_MLot_fromLot]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[f_Get_MLot_fromLot]
(
@cString VARCHAR( MAX )
)
RETURNS VARCHAR(50)
AS
BEGIN
--Return Machine+Lot AS MLot without HPA 
--SELECT dbo.f_Get_MLot_fromLot(''HPA G5781'') --''G5781''

--Also see dbo.f_Get_Machine_fromLot(''G5781'')
--Also see dbo.f_Get_LOG_fromLot(''HPA R800'') --800


declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @cMLot	CHAR(10) = ''''
DECLARE @cMachine VARCHAR(10) = ''''
DECLARE @cMachineInit VARCHAR(1) = ''''
DECLARE @nLot INT = 0

--PRINT ''HPA Lot ''+@cString
SET @cMachine = dbo.f_Get_Machine_fromLot(@cString)
--PRINT ''Machine ''+@cMachine
SET @cMachineInit = dbo.f_GetMachine_Table(@cMachine)
--PRINT ''MachineInit ''+@cMachineInit

--See if Initial is possible, return ''''
IF LEN(@cMachineInit) = 0
	RETURN ''''

SET @nLot = dbo.f_Get_LOG_fromLot(@cString)
--PRINT ''nLot ''+RTRIM(CAST(@nLot AS CHAR(10)))

SET @cMLot = @cMachineInit+RTRIM(CAST(@nLot AS CHAR(10)))
--PRINT ''cMLot ''+@cMLot

RETURN @cMLot
END



--GRANT EXECUTE ON dbo.[f_Get_MLot_fromLot] TO [WINDFALL\HPA] AS [dbo];
--GRANT EXECUTE ON dbo.[f_Get_MLot_fromLot] TO [WINDFALL\HPA Reports] AS [dbo];
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_get_Month_Next_Month]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_get_Month_Next_Month]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David Kirchner
-- Create date: 2015 11 11
-- Description:	
-- =============================================
Create FUNCTION [dbo].[f_get_Month_Next_Month] 
(
	@DateTime AS DateTime
)
RETURNS TinyInt
AS
BEGIN

--PRINT dbo.f_get_Month_Next_Month( GetDate() )
--PRINT dbo.f_get_Month_Next_Month( ''2015-01-05'' )
--PRINT dbo.f_get_Month_Next_Month( ''2015-01-05'' )

-- Declare the return variable here
DECLARE @nReturn TinyInt
SET @nReturn = MONTH( @DateTime+31 )


SET @nReturn = ISNULL(@nReturn,0)
RETURN @nReturn

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_get_Month_Prev_Month]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_get_Month_Prev_Month]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David Kirchner
-- Create date: 2015 11 11
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_get_Month_Prev_Month] 
(
	@DateTime AS DateTime
)
RETURNS TinyInt
AS
BEGIN

--PRINT dbo.f_get_Month_Prev_Month( GetDate() )
--PRINT dbo.f_get_Month_Prev_Month( ''2015-01-05'' )
--PRINT dbo.f_get_Year_Prev_Month( ''2015-01-05'' )

-- Declare the return variable here
DECLARE @nReturn TinyInt
SET @nReturn = MONTH( @DateTime-31 )


SET @nReturn = ISNULL(@nReturn,0)
RETURN @nReturn

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Get_Next_Dia]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Get_Next_Dia]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Get_Next_Dia] 
(
@nDiaIn DECIMAL(10,4)
,@cTable VARCHAR(50)
)
RETURNS DECIMAL(10,4)
AS
BEGIN

--PRINT dbo.f_Get_Next_Dia(.3)

DECLARE @nNextDia DECIMAL(10,4) = 0

IF @cTable IS NULL
	RETURN 0
ELSE
IF @cTable = ''Wire_Dies''
begin
	IF @nDiaIn = 0
		RETURN 20

	SET @nNextDia = (SELECT TOP 1 [Dia] FROM dbo.Wire_Dies WHERE Dia > @nDiaIn ORDER BY DIA) 
end
ELSE
IF @cTable = ''Draw_Dies''
begin
	IF @nDiaIn = 0
		RETURN 20

	SET @nNextDia = (SELECT TOP 1 [Dia] FROM dbo.Draw_Dies WHERE Dia > @nDiaIn ORDER BY DIA) 
end


RETURN ISNULL(@nNextDia,0)
END


-- GRANT EXECUTE ON [dbo].[f_Get_Next_Dia] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Get_nPU_Form]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Get_nPU_Form]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Get_nPU_Form]
(
 @cForm CHAR(2)
)
RETURNS TinyINT

AS
BEGIN
--SELECT dbo.f_Get_nPU_Form(''10'')
--Return nPU for HPA Acct Standard

--Check Data with dbo.Forms

DECLARE @nPU TinyInt

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @nPU = 0

---Test Parameters
IF ISNULL(@cForm,'''') < 1
	RETURN @nPU	

SELECT @nPU = PU FROM dbo.Forms 
	WHERE FormNumber = @cForm

IF @nPU = 0
	SET @nPU = 0




RETURN @nPU
END

--GRANT EXECUTE ON [dbo].[f_Get_nPU_Form] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_get_Order_Description]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_get_Order_Description]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_get_Order_Description]
(
@cOrderType CHAR(10)
,@nOrderNumber INT
,@cOrderNumber CHAR(13)
)
RETURNS VARCHAR(2000)
AS
BEGIN

--SELECT dbo.f_get_Order_Description(''WO'',1020,'''')
--SELECT dbo.f_get_Order_Description(''WO_Detail'',1020,'''')
--SELECT dbo.f_get_Order_Description(''POitem'',0,''507113-01'')
--SELECT dbo.f_get_Order_Description(''SOitem'',0,''105000-01'')


DECLARE @cReturnString VarChar(2000)
SET @cReturnString = ''''


IF @cOrderType = ''SOitem_RMA''
	SELECT TOP 1 @cReturnString = RTRIM(Alloy)+'' ''+dbo.f_ItemDescriptionMetric(Form,Thck,SZ2,SZ3,Weight,RandLen,Metric,Sz1orig,Sz2orig,Sz3orig)
		+'' ''+RTRIM(ISNULL(Company,'''')) FROM dbo.AllQuotes WHERE SOitem = dbo.f_ProperSOitem( @cOrderNumber )
ELSE
IF @cOrderType = ''SOitem''
	SELECT TOP 1 @cReturnString = RTRIM(Alloy)+'' ''+dbo.f_ItemDescriptionMetric(Form,Thck,SZ2,SZ3,Weight,RandLen,Metric,Sz1orig,Sz2orig,Sz3orig)
		+'' ''+RTRIM(ISNULL(Company,'''')) FROM dbo.AllQuotes WHERE SOitem = dbo.f_ProperSOitem( @cOrderNumber )
ELSE
IF @cOrderType = ''SO''
	SELECT TOP 1 @cReturnString = RTRIM(Alloy)+'' ''+dbo.f_ItemDescriptionMetric(Form,Thck,SZ2,SZ3,Weight,RandLen,Metric,Sz1orig,Sz2orig,Sz3orig)
		+'' ''+RTRIM(ISNULL(Company,'''')) FROM dbo.AllQuotes WHERE SalesNum = @nOrderNumber
ELSE	
IF @cOrderType = ''POitem_RMA''
	SELECT TOP 1 @cReturnString = RTRIM(Alloy)+'' ''+dbo.f_ItemDescriptionMetric(Form,Thck,SZ2,SZ3,Order_QTY,RandLen,Metric,Sz1orig,Sz2orig,Sz3orig) 
		+'' ''+RTRIM(ISNULL(Company,'''')) FROM dbo.PurchaseOrder WHERE POitem = dbo.f_ProperPOitem( @cOrderNumber )
ELSE
IF @cOrderType = ''POitem''
	SELECT TOP 1 @cReturnString = RTRIM(Alloy)+'' ''+dbo.f_ItemDescriptionMetric(Form,Thck,SZ2,SZ3,Order_QTY,RandLen,Metric,Sz1orig,Sz2orig,Sz3orig) 
		+'' ''+RTRIM(ISNULL(Company,'''')) FROM dbo.PurchaseOrder WHERE POitem = dbo.f_ProperPOitem( @cOrderNumber )
ELSE
IF @cOrderType = ''PO''
	SELECT TOP 1 @cReturnString = RTRIM(Alloy)+'' ''+dbo.f_ItemDescriptionMetric(Form,Thck,SZ2,SZ3,Order_QTY,RandLen,Metric,Sz1orig,Sz2orig,Sz3orig) 
		+'' ''+RTRIM(ISNULL(Company,'''')) FROM dbo.PurchaseOrder WHERE SalesNum = @nOrderNumber
ELSE
IF @cOrderType = ''WO_Detail''
	SELECT TOP 1 @cReturnString = RTRIM(fAlloy)+'' ''+dbo.f_ItemDescriptionMetric(fForm,fThck,fSZ2,fSZ3,fWeight,1,0,'''','''','''') 
		+''''  FROM dbo.WorkOrder_Detail  WHERE WO_Detail = @nOrderNumber
ELSE
IF @cOrderType = ''WO''
	SELECT TOP 1 @cReturnString = RTRIM(sAlloy)+'' ''+dbo.f_ItemDescriptionMetric(sForm,sThck,sSZ2,sSZ3,sWeight,1,0,'''','''','''') 
		+''''  FROM dbo.WorkOrder  WHERE WO = @nOrderNumber



RETURN @cReturnString
END

/*
GRANT EXECUTE ON [dbo].[f_get_Order_Description] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_get_Order_Description] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_get_Order_Description] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Get_Price_ID_Detail]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Get_Price_ID_Detail]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


create FUNCTION [dbo].[f_Get_Price_ID_Detail]
(
	@cTBL CHAR(1),
	@nID_Detail INT
)
RETURNS MONEY
AS
BEGIN

--SELECT dbo.f_Get_Price_ID_Detail(''B'',nID_Detail)
--like Proc_SQL:Get_Quote_QTY


DECLARE @nReturnPrice MONEY
SET @nReturnPrice = 0

IF @cTBL = ''S''
	begin
	SELECT @nReturnPrice=ISNULL(S_P,0) FROM dbo.StockLst_Detail WHERE ID_Detail = @nID_Detail
	IF @nReturnPrice=0
		SELECT TOP 1 @nReturnPrice=ISNULL(S_P,0) FROM dbo.Ar_StockLst_Detail_History WHERE ID_Detail = @nID_Detail AND S_P>0
	end
ELSE
IF @cTBL = ''B''
	begin
	SELECT @nReturnPrice=ISNULL(S_P,0) FROM dbo.BrokerLst_Detail WHERE ID_Detail = @nID_Detail
	IF @nReturnPrice=0
		SELECT TOP 1 @nReturnPrice=ISNULL(S_P,0) FROM dbo.Ar_BrokerLst_Detail_History WHERE ID_Detail = @nID_Detail AND S_P>0
	end
ELSE
IF @cTBL = ''W''
	begin
	SELECT @nReturnPrice=ISNULL(S_P,0) FROM dbo.StockLst_Detail WHERE ID_Detail = @nID_Detail
	IF @nReturnPrice=0
		SELECT TOP 1 @nReturnPrice=ISNULL(S_P,0) FROM dbo.Ar_StockLst_Detail_History WHERE ID_Detail = @nID_Detail AND S_P>0
	end


RETURN @nReturnPrice

END

--GRANT EXECUTE ON [dbo].[f_Get_Price_ID_Detail] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Get_Price_LB]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Get_Price_LB]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Get_Price_LB]
(
@cAlloy char(12),
@cForm CHAR(2),
@cCC CHAR(1),
@cCL CHAR(1),
@nThickness DECIMAL(9,4),
@nSize2 DECIMAL(9,3),
@nSize3 DECIMAL(9,3),
@nWeight DECIMAL(7,1)
)

RETURNS DECIMAL(7,2)
AS
BEGIN
--PRINT dbo.f_Get_Price_LB(''C-276'',''40'',''1'','''',1,12,48,10)
--Print dbo.f_Get_Price_LB(Alloy,Form,CC,CL, dbo.f_SizeStandard(Thck),Sz2,Sz3,Weight)
--PRINT dbo.f_GetWeight(''1'',''C-276'',''40'',1,12,48)

--SET NOCOUNT ON

DECLARE @nUnitPrice as DECIMAL(7,2)
DECLARE @Bracket Int
DECLARE @cMessage as VARCHAR(2000)
SET @cMessage = ''''

----------------------
DECLARE @cCCorig CHAR(1)
SET @cCCorig = @cCC

DECLARE @cCCAdjust CHAR(1)
SET @cCCAdjust = ''0''
DECLARE @nAdjust NUMERIC(18,9)

IF @cCC = ''A''
	begin
	SET @cCCAdjust = ''A''
	SELECT TOP 1 @nAdjust = [A] FROM dbo.ConditionCodeAdjust WITH(NOLOCK) 
	SET @cCC = ''2''
	end
ELSE
IF @cCC = ''B''
	begin
	SET @cCCAdjust = ''B''
	SELECT TOP 1 @nAdjust = [B] FROM dbo.ConditionCodeAdjust WITH(NOLOCK) 
	SET @cCC = ''2''
	end
IF @cCC = ''C''
	begin
	SET @cCCAdjust = ''C''
	SELECT TOP 1 @nAdjust = [C] FROM dbo.ConditionCodeAdjust WITH(NOLOCK) 
	SET @cCC = ''2''
	end
ELSE
IF @cCC = ''D''
	begin
	SET @cCCAdjust = ''D''
	SELECT TOP 1 @nAdjust = [D] FROM dbo.ConditionCodeAdjust WITH(NOLOCK) 
	SET @cCC = ''2''
	end
ELSE
IF @cCC = ''E''
	begin
	SET @cCCAdjust = ''E''
	SELECT TOP 1 @nAdjust = [E] FROM dbo.ConditionCodeAdjust WITH(NOLOCK) 
	SET @cCC = ''2''
	end
IF @cCC = ''F''
	begin
	SET @cCCAdjust = ''F''
	SELECT TOP 1 @nAdjust = [F] FROM dbo.ConditionCodeAdjust WITH(NOLOCK) 
	SET @cCC = ''2''
	end
IF @cCC = ''S''
	begin
	SET @cCCAdjust = ''S''
	SELECT TOP 1 @nAdjust = [S] FROM dbo.ConditionCodeAdjust WITH(NOLOCK) 
	SET @cCC = ''2''
	end
IF @cCC = ''T''
	begin
	SET @cCCAdjust = ''T''
	SELECT TOP 1 @nAdjust = [T] FROM dbo.ConditionCodeAdjust WITH(NOLOCK) 
	SET @cCC = ''2''
	end
IF @cCC = ''U''
	begin
	SET @cCCAdjust = ''U''
	SELECT TOP 1 @nAdjust = [U] FROM dbo.ConditionCodeAdjust WITH(NOLOCK) 
	SET @cCC = ''2''
	end
IF @cCC = ''V''
	begin
	SET @cCCAdjust = ''V''
	SELECT TOP 1 @nAdjust = [V] FROM dbo.ConditionCodeAdjust WITH(NOLOCK) 
	SET @cCC = ''2''
	end
IF @cCC = ''W''
	begin
	SET @cCCAdjust = ''W''
	SELECT TOP 1 @nAdjust = [W] FROM dbo.ConditionCodeAdjust WITH(NOLOCK) 
	SET @cCC = ''2''
	end
IF @cCC = ''X''
	begin
	SET @cCCAdjust = ''X''
	SELECT TOP 1 @nAdjust = [X] FROM dbo.ConditionCodeAdjust WITH(NOLOCK) 
	SET @cCC = ''2''
	end

---------------------------------------------------
--Use the N60 Cold Work Chart for N50 Cold Work
IF @cAlloy = ''HPA N50''
	SELECT @cAlloy = ''HPA N60'' 
		WHERE @cCCorig = ''T'' 
		OR @cCCorig = ''U'' 
		OR @cCCorig = ''V'' 
		OR @cCCorig = ''W'' 
		OR @cCCorig = ''X'' 

---------------------------------------------------

IF @nWeight < 5
	begin
	SELECT @nUnitPrice = w0 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and thk=@nThickness
	SET @Bracket   = 1
	end
ELSE
IF @nWeight >= 5 AND @nWeight < 10
	begin
	SELECT @nUnitPrice = w5 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and thk=@nThickness
	SET @Bracket   = 2
	end
ELSE
IF @nWeight >= 10 AND @nWeight < 20
	begin
	SELECT @nUnitPrice = w10 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and thk=@nThickness
	SET @Bracket   = 3
	end
ELSE
IF @nWeight >= 20 AND @nWeight < 50
	begin
	SELECT @nUnitPrice = w25 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and thk=@nThickness
	SET @Bracket   = 4
	end
ELSE
IF @nWeight >= 50 AND @nWeight < 100
	begin
	SELECT @nUnitPrice = w50 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and thk=@nThickness
	SET @Bracket   = 5
	end
ELSE
IF @nWeight >= 100 AND @nWeight < 200
	begin
	SELECT @nUnitPrice = w100 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and thk=@nThickness
	SET @Bracket   = 6
	end
ELSE
IF @nWeight >= 200 AND @nWeight < 500
	begin
	SELECT @nUnitPrice = w200 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and thk=@nThickness
	SET @Bracket   = 7
	end
ELSE
IF @nWeight >= 500 AND @nWeight < 1000
	begin
	SELECT @nUnitPrice = w500 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and thk=@nThickness
	SET @Bracket   = 8
	end
ELSE
IF @nWeight >= 1000 AND @nWeight < 2000
	begin
	SELECT @nUnitPrice = w1000 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and thk=@nThickness
	SET @Bracket   = 9
	end
ELSE
IF @nWeight >= 2000 AND @nWeight < 5000
	begin
	SELECT @nUnitPrice = w2000 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and thk=@nThickness
	SET @Bracket   = 0
	end
ELSE
	begin
	SET @nUnitPrice = 0
	SET @Bracket   = 0
	end

--*************************************************************************************
--dbo.f_SizeStandard(
IF @nUnitPrice = 0
begin
	--retry with f_SizeStandard
	SET @nThickness = dbo.f_SizeStandard(@nThickness)

	IF @nWeight < 5
		begin
		SELECT @nUnitPrice = w0 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and thk=@nThickness
		SET @Bracket   = 1
		end
	ELSE
	IF @nWeight >= 5 AND @nWeight < 10
		begin
		SELECT @nUnitPrice = w5 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and thk=@nThickness
		SET @Bracket   = 2
		end
	ELSE
	IF @nWeight >= 10 AND @nWeight < 20
		begin
		SELECT @nUnitPrice = w10 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and thk=@nThickness
		SET @Bracket   = 3
		end
	ELSE
	IF @nWeight >= 20 AND @nWeight < 50
		begin
		SELECT @nUnitPrice = w25 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and thk=@nThickness
		SET @Bracket   = 4
		end
	ELSE
	IF @nWeight >= 50 AND @nWeight < 100
		begin
		SELECT @nUnitPrice = w50 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and thk=@nThickness
		SET @Bracket   = 5
		end
	ELSE
	IF @nWeight >= 100 AND @nWeight < 200
		begin
		SELECT @nUnitPrice = w100 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and thk=@nThickness
		SET @Bracket   = 6
		end
	ELSE
	IF @nWeight >= 200 AND @nWeight < 500
		begin
		SELECT @nUnitPrice = w200 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and thk=@nThickness
		SET @Bracket   = 7
		end
	ELSE
	IF @nWeight >= 500 AND @nWeight < 1000
		begin
		SELECT @nUnitPrice = w500 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and thk=@nThickness
		SET @Bracket   = 8
		end
	ELSE
	IF @nWeight >= 1000 AND @nWeight < 2000
		begin
		SELECT @nUnitPrice = w1000 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and thk=@nThickness
		SET @Bracket   = 9
		end
	ELSE
	IF @nWeight >= 2000 AND @nWeight < 5000
		begin
		SELECT @nUnitPrice = w2000 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and thk=@nThickness
		SET @Bracket   = 0
		end
	ELSE
		begin
		SET @nUnitPrice = 0
		SET @Bracket   = 0
		end

END




RETURN @nUnitPrice
END



--GRANT EXECUTE ON [dbo].[f_GetPriceCC_CL] TO [WINDFALL\Quotes] AS [dbo];
--GRANT EXECUTE ON [dbo].[f_GetPriceCC_CL] TO [WINDFALL\HPA] AS [dbo];
--GRANT EXECUTE ON [dbo].[f_GetPriceCC_CL] TO [HPA_Service] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Get_Price_Lot]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Get_Price_Lot]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[f_Get_Price_Lot]
(	
	@iPieces INT
	,@cAlloy CHAR(12)
	,@cForm  CHAR(2)
	,@nThck Decimal(10,4)
	,@nSz2 Decimal(9,3)
	,@nSz3 Decimal(9,3)
	,@nWeight Decimal(9,1)
	,@mP_LB Money
	,@mP_Pc Money
	,@mP_Ft Money
	,@mLotP Money

)
RETURNS MONEY
AS
BEGIN

--depricated ; use [f_GetPriceQuote] 

--use f_GetPrice_lot for McMaster

-- Print dbo.f_get_P(@Pieces,@Alloy,@Form,@Thck,@Sz2,@Sz3,@Weight,@P_LB,@P_Pc,@P_Ft,@LotP)
-- Print dbo.f_get_P( Pieces, Alloy, Form, Thck, Sz2, Sz3, Weight, P_LB, P_Pc, P_Ft, LotP)
--like dbo.f_Calc_QTY(Alloy,Form,Pieces,Thck,Sz2,Sz3)
--

declare @err int,
        @RC int

set @err = 0
set @rc = 0


DECLARE @tiSigDim TinyInt
DECLARE @iFtLen INT
SET @tiSigDim = 0
SET @iFtLen = 0

IF @mLotP = 0
	begin
	-- get Universal LotP

	
	IF @mP_LB > 0
		begin

		IF @nWeight = 0
			SET @nWeight = dbo.f_Calc_Weight(@cAlloy,@cForm,@iPieces,@nThck,@nSz2,@nSz3) 
		
		
		IF @nWeight > 0
			SET @mLotP = @mP_LB * @nWeight
		ELSE
			SET @mLotP = -1
		
		end

	IF @mP_Ft > 0
		begin

		If @iPieces < 1 
				SET @iPieces = 1

		SET @tiSigDim = dbo.f_getSigDim( @cForm )

		IF @tiSigDim = 2
			SET @iFtLen = @iPieces * @nSz2/12
		
		IF @tiSigDim = 3 OR @tiSigDim = 6
			SET @iFtLen = @iPieces * @nSz3/12
		
		IF @iFtLen > 0
			SET @mLotP = @mP_Ft * @iFtLen
		ELSE
			SET @mLotP = -1
		
		end

	IF @mP_Pc > 0
		IF @iPieces > 0
			SET @mLotP = @mP_Pc * @iPieces
		ELSE
			SET @mLotP = -1

	end
------------


DECLARE @mNew_P MONEY
DECLARE @tiPU TinyInt

SET @mNew_P	= 0
SET @tiPU	=  dbo.f_GetFormPU( @cForm )

IF @tiPU = 1
	-- $/Lb
	IF @mP_LB > 0
		SET @mNew_P = @mP_LB
	ELSE
		begin

		--*Convert to $/Lb
		IF @nWeight = 0
			SET @nWeight = dbo.f_Calc_Weight(@cAlloy,@cForm,@iPieces,@nThck,@nSz2,@nSz3) 
		

		IF @nWeight > 0
			IF @mLotP > 0
				SET @mNew_P = ROUND( @mLotP / @nWeight, 4)
			
		end

IF @tiPU = 2
	--* $/Ft
	IF @mP_Ft > 0
		SET @mNew_P = @mP_Ft
	ELSE
		begin

		--*Convert to $/Ft
		IF @iFtLen = 0
			begin

			If @iPieces < 1 
				SET @iPieces = 1

			SET @tiSigDim = dbo.f_getSigDim(@cForm)

			IF @tiSigDim = 2
				SET @iFtLen = @iPieces * @nSz2/12
			
			IF @tiSigDim = 3 OR @tiSigDim = 6
				SET @iFtLen = @iPieces * @nSz3/12
			
			end

		IF @iFtLen > 0
			IF @mLotP > 0
				SET @mNew_P = ROUND( @mLotP / @iFtLen, 4)
		
		end
		
IF @tiPU = 3
	--* $/Pc
	IF @mP_Pc > 0
		SET @mNew_P = @mP_Pc
	ELSE
		IF @iPieces > 0
			IF @mLotP > 0
				SET @mNew_P = ROUND( @mLotP / @iPieces, 4)
			
RETURN @mNew_P
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Get_profile_name]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Get_profile_name]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[f_Get_profile_name] 
(
@Email VarChar(50)
)
RETURNS varchar(50)
AS
BEGIN
-- PRINT dbo.f_Get_profile_name(''David@ERP_1s.com'')
-- PRINT dbo.f_Get_profile_name('''')

DECLARE @lcProfile_Name varchar(50)
SET @lcProfile_Name = @@SERVERNAME
--SET @lcProfile_Name = ''HPA-NotSpam''

--INSERT INTO dbo.AppSetup (UN,PRP,ANS) VALUES (UserName,''Profile_Name'',Email)

--INSERT INTO dbo.Profile_Names (Profile_Name, EMAIL) Values (''AutoWeb'', ''AutoWeb@ERP_1s.com'')
--INSERT INTO dbo.AppSetup (UN,PRP,ANS) VALUES (''AutoWeb'',''AutoWeb'',''AutoWeb@ERP_1s.com'')
--SELECT * FROM dbo.Profile_Names WHERE EMAIL = ''AutoWeb@ERP_1s.com''

SELECT @lcProfile_Name = Profile_Name 
 FROM dbo.Profile_Names WHERE EMAIL = @Email

IF TRIM(@lcProfile_Name) = TRIM(@@SERVERNAME)
	begin
	DECLARE @lcUserName VARCHAR(20) 
	SET @lcUserName=''''

	SELECT TOP 1 @lcUserName=UN FROM dbo.AppSetup WITH(NOLOCK) WHERE PRP=''E-mail'' AND ANS=@Email

	IF LEN(@lcUserName)>1
		SELECT TOP 1 @lcProfile_Name=UN FROM dbo.AppSetup WITH(NOLOCK) WHERE PRP = ''Profile_Name'' AND ANS=@lcUserName
	
	end

SET @lcProfile_Name = RTRIM(@lcProfile_Name)


RETURN (@lcProfile_Name)
END






' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Get_PU_Caption]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Get_PU_Caption]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Get_PU_Caption]
(
 @nPU TinyInt
)
RETURNS Char(3)

AS
BEGIN
--SELECT dbo.f_Get_PU_Caption(2)
--SELECT dbo.f_Get_PU_Caption(6) AS CapStr
--Return Price unit number as String

--Check Data with dbo.PU
--SELECT dbo.f_Get_PU_Price_String(PU,QTY,P)
--SELECT dbo.f_Get_Unit_nPU(7)

DECLARE @cReturn Char(3)

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @cReturn = ''''

---Test Parameters
--IF ISNULL(@nPU,0) < 1
--	RETURN @cReturn	

--- Start Function

SELECT @cReturn=[Unit] FROM dbo.PU WHERE PU=@nPU

/*IF @nPU < 1
	SET @cReturn = ''''
ELSE
IF @nPU = 1
	SET @cReturn = ''/#''
ELSE 
IF @nPU = 2
	SET @cReturn = ''/FT''
ELSE 
IF @nPU = 3
	SET @cReturn = ''/PC''
ELSE 
IF @nPU = 4
	SET @cReturn =''Lot''
ELSE 
IF @nPU = 5
	SET @cReturn = ''/In''
ELSE 
IF @nPU = 6
	SET @cReturn = ''/Kg''
ELSE 
IF @nPU > 6
	SET @cReturn = ''''
*/

RETURN ISNULL(@cReturn,'''')
END

--GRANT EXECUTE ON [dbo].[f_Get_PU_Caption] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Get_PU_Price_String]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Get_PU_Price_String]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Get_PU_Price_String]
(
 @nPU TinyInt, 
 @nQty Money, 
 @nP Money
)
RETURNS VarChar(25)

AS
BEGIN
--SELECT dbo.f_Get_PU_Price_String(PU,QTY,P)
--Return PO price as String
--SELECT dbo.f_Get_PU_Caption(2)
--SELECT dbo.f_Get_Unit_nPU(7)

--Check Data with dbo.PU

DECLARE @cReturn VarChar(25)

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @cReturn = ''''

---Test Parameters
IF ISNULL(@nPU,0) < 0
	RETURN @cReturn	

IF ISNULL(@nQty,0) = 0
	RETURN @cReturn	

IF ISNULL(@nP,0) = 0
	SET @nP = 0

--- get labels

DECLARE @cUnit CHAR(4) = '''', @cLabel CHAR(7) = '''', @cUOM CHAR(4) = ''''

SELECT @cUnit=[Unit], @cLabel=[Label], @cUOM=[UOM] FROM dbo.PU WHERE PU= @nPU

--- Start Function


IF @nPU = 0
	begin

	--nQTY is Lot
	SET @cReturn = ''''
	SET @cReturn = @cReturn + ''$0''
	SET @cReturn = @cReturn + '' No Charge''

	end

IF @nPU = 1
	begin

	--nQTY is Weight in LBS
	IF @nQty <= 1
		SET @cReturn = dbo.f_Remove0_Money(@nQTY,18,1)+'' LB ''
	ELSE
		SET @cReturn = dbo.f_Remove0_Money(@nQTY,18,1)+'' Lbs ''

	SET @cReturn = @cReturn + '' @ $''+dbo.f_Remove0_Money(@nP,18,4)
	SET @cReturn = @cReturn + ''/#''

	end
	
IF @nPU = 2
	begin

	--nQTY is Feet
	IF @nQty <= 1
		SET @cReturn = dbo.f_Remove0_Money(@nQTY,18,1)+'' Foot ''
	ELSE
		SET @cReturn = dbo.f_Remove0_Money(@nQTY,18,1)+'' Feet ''

	SET @cReturn = @cReturn + '' @ $''+dbo.f_Remove0_Money(@nP,18,4)
	SET @cReturn = @cReturn + ''/FT''

	end

IF @nPU = 3
	begin

	--nQTY is PC
	IF @nQty <= 1
		SET @cReturn = dbo.f_Remove0_Money(@nQTY,18,1)+'' Pc ''
	ELSE
		SET @cReturn = dbo.f_Remove0_Money(@nQTY,18,1)+'' PCs ''

	SET @cReturn = @cReturn + ''@ $''+dbo.f_Remove0_Money(@nP,18,4)
	SET @cReturn = @cReturn + ''/PC''

	end

IF @nPU = 4
	begin

	--nQTY is Lot
	SET @cReturn = ''''
	SET @cReturn = @cReturn + ''$''+dbo.f_Remove0_Money(@nP,18,4)
	SET @cReturn = @cReturn + '' Lot Price''

	end

IF @nPU = 5
	begin

	--nQTY is Inch
	IF @nQty <= 1
		SET @cReturn = dbo.f_Remove0_Money(@nQTY,18,1)+'' Inch ''
	ELSE
		SET @cReturn = dbo.f_Remove0_Money(@nQTY,18,1)+'' Inch ''

	SET @cReturn = @cReturn + '' @ $''+dbo.f_Remove0_Money(@nP,18,4)
	SET @cReturn = @cReturn + ''/In''

	end

IF @nPU = 6
	begin

	--nQTY is Weight in Kg
	IF @nQty <= 1
		SET @cReturn = dbo.f_Remove0_Money(@nQTY,18,1)+'' Kg ''
	ELSE
		SET @cReturn = dbo.f_Remove0_Money(@nQTY,18,1)+'' Kgs ''

	SET @cReturn = @cReturn + '' @ $''+dbo.f_Remove0_Money(@nP,18,4)
	SET @cReturn = @cReturn + ''/Kg''

	end
	
IF @nPU = 7
	begin

	--nQTY is Meter length
	IF @nQty <= 1
		SET @cReturn = dbo.f_Remove0_Money(@nQTY,18,1)+'' Mtr ''
	ELSE
		SET @cReturn = dbo.f_Remove0_Money(@nQTY,18,1)+'' Mtrs ''

	SET @cReturn = @cReturn + '' @ $''+dbo.f_Remove0_Money(@nP,18,4)
	SET @cReturn = @cReturn + ''/Mr''

	end

IF @nPU = 8
	begin

	--nQTY is Hours
	IF @nQty <= 1
		SET @cReturn = dbo.f_Remove0_Money(@nQTY,18,1)+'' Hour ''
	ELSE
		SET @cReturn = dbo.f_Remove0_Money(@nQTY,18,1)+'' Hrs ''

	SET @cReturn = @cReturn + '' @ $''+dbo.f_Remove0_Money(@nP,18,4)
	SET @cReturn = @cReturn + ''/Hr''

	end

IF @nPU = 9
	begin

	--nQTY is Days
	IF @nQty <= 1
		SET @cReturn = dbo.f_Remove0_Money(@nQTY,18,1)+'' Day ''
	ELSE
		SET @cReturn = dbo.f_Remove0_Money(@nQTY,18,1)+'' Days ''

	SET @cReturn = @cReturn + '' @ $''+dbo.f_Remove0_Money(@nP,18,4)
	SET @cReturn = @cReturn + ''/Dy''

	end

IF @nPU < 0 OR @nPU > 9 
	SET @cReturn = ''''

RETURN @cReturn
END

--GRANT EXECUTE ON [dbo].[f_Get_PU_Price_String] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Get_PU_Quoted]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Get_PU_Quoted]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Get_PU_Quoted]
(
 @nP_lb Money, 
 @nP_pc Money, 
 @nP_ft Money, 
 @nLotP Money,
 @cOtherFld CHAR(10),
 @nOtherP Money
)
RETURNS Numeric(1)

AS
BEGIN
--SELECT dbo.f_Get_PU_Quoted (nP_lb, nP_pc, nP_ft, nLotP, cOtherFld, nOtherP)
--Return PU Quoted with

--Check Data with dbo.PU

DECLARE @nQ_PU NUMERIC(1)

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @nQ_PU = 0

--- Start Function
--1.@nP_lb ,  3.@nP_pc ,  2.@nP_ft , 4.@nLotP , @cOtherFld , @nOtherP 5.PerIn 6.PerKg

IF @cOtherFld LIKE ''Free%'' or @cOtherFld LIKE ''No Cost%'' or @cOtherFld LIKE ''No Charge%''--AND @nOtherP > 0
	RETURN 0

IF @cOtherFld LIKE ''Lot%'' AND @nOtherP > 0
	RETURN 4

IF @cOtherFld LIKE ''PER INCH%'' AND @nOtherP > 0
	RETURN 5

IF @cOtherFld LIKE ''PER KG%'' AND @nOtherP > 0
	RETURN 6

IF @cOtherFld LIKE ''PER Mtr%'' AND @nOtherP > 0
	RETURN 7

IF @cOtherFld LIKE ''PER Hr%'' AND @nOtherP > 0
	RETURN 8

IF @cOtherFld LIKE ''PER Day%'' AND @nOtherP > 0
	RETURN 9

--IF @cOtherFld LIKE ''PER Ft%'' AND @nP_ft < 0
--	RETURN 2

IF @nP_lb > 0
	RETURN 1

IF @nP_ft > 0
	RETURN 2

IF @nP_pc > 0
	RETURN 3

IF @nLotP > 0
	RETURN 4



RETURN 0
END

--GRANT EXECUTE ON [dbo].[f_Get_PU_Quoted] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_get_PU_SOitem]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_get_PU_SOitem]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_get_PU_SOitem]
( @SOitem CHAR(10)
)
RETURNS tinyINT
AS
BEGIN
--SELECT dbo.f_CalcSale_SOitem(''  78703-01'')
--SELECT dbo.f_CalcSale_SOitem('' 102377-01'')
--Return SO Quote Total / Sale From SOitem

/*
DECLARE @SOitem CHAR(10) = '' 103598-01''
SELECT dbo.f_get_PU_SOitem(@SOitem) AS S_PU
*/


--dbo.f_Calc_QTY(Alloy,Form,PC,Dim1,Dim2,Dim3) AS f_Calc_QTY
--dbo.f_Calc_Weight(Alloy,Form,PC,Dim1,Dim2,Dim3) AS f_Calc_Weight

DECLARE @cForm CHAR(2) = ''''

SELECT @cForm = ISNULL(Form,'''')	FROM dbo.AllQuotes WHERE SOitem = @SOitem

DECLARE @PU TinyInt = 1
SELECT @PU = dbo.f_GetFormPU(@cForm)
	--1Lb, 2Ft 3Pc

RETURN @PU
END

--GRANT EXECUTE ON [dbo].[f_get_PU_SOitem] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Get_Q_Total]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Get_Q_Total]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Get_Q_Total]
(	 @nQ_P Money
	,@nQ_QTY Money 
	,@nQ_PU TINYINT 
	,@cForm CHAR(2)
 	,@nPieces INT
	,@nThck Decimal(10,4)
	,@nSz2 Decimal(9,3)
	,@nSz3 Decimal(9,3)
	,@cOtherFld CHAR(10)
	,@nOtherP MONEY
)
RETURNS MONEY

AS
BEGIN
--SELECT dbo.f_Get_Q_Total (Q_P,Q_QTY,Q_PU,Form,Pieces,Thck,Sz2,Sz3,OtherFld,OtherP)
--Return Quoted Total

DECLARE @nQ_Total MONEY = 0
DECLARE @nUse3rdDim BIT
SET @nUse3rdDim = ISNULL( dbo.f_GetForm_use3rdDim(@cForm) ,0)

declare @err int,
        @RC int

set @err = 0
set @rc = 0

IF ISNULL(@nQ_PU,0) = 0
	SET @nQ_PU = dbo.f_GetFormPU(@cForm)

--- Start Function
--1.@nP_lb ,  3.@nP_pc ,  2.@nP_ft , 4.@nLotP , @cOtherFld , @nOtherP 5.PerIn 6.PerKg

IF @nQ_PU = 1	--P_LB
	SET @nQ_Total = @nQ_P * @nQ_QTY
ELSE
IF @nQ_PU = 2	--P_FT
	begin
	IF @nUse3rdDim = 1
		SET @nQ_Total = @nQ_P * @nPieces * @nSz3 / 12
	ELSE
		SET @nQ_Total = @nQ_P * @nPieces * @nSz2 / 12

	end
ELSE
IF @nQ_PU = 3 --P_PC
	SET @nQ_Total = @nQ_P * @nPieces
IF @nQ_PU = 4	--Lot
	SET @nQ_Total = @nQ_P * 1
IF @nQ_PU = 5	--P_Inch
	begin
	IF @nUse3rdDim = 1
		SET @nQ_Total = @nQ_P * @nPieces * @nSz3 
	ELSE
		SET @nQ_Total = @nQ_P * @nPieces * @nSz2 

	end
IF @nQ_PU = 6	--P_Kg
	SET @nQ_Total = @nQ_P * @nQ_QTY / 2.2





RETURN @nQ_Total
END

/*
GRANT EXECUTE ON [dbo].[f_Get_Q_Total] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_Get_Q_Total] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_Get_Q_Total] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Get_QTY]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Get_QTY]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[f_Get_QTY]
(
	@cAlloy CHAR(12),
	@cForm CHAR(2),
	@iPieces INT,
	@nThck NUMERIC(9,4),
	@nSz2 Numeric(8,3),
	@nSz3 NUMERIC(8,3)
)
RETURNS MONEY
AS
BEGIN

--SELECT dbo.f_Get_QTY(Alloy,Form,Pieces,Thck,Sz2,Sz3)
--like Proc_SQL:Get_Quote_QTY


--*** dbo.f_Calc_QTY(Alloy,Form,Pieces,Thck,Sz2,Sz3) **

DECLARE @mQTY MONEY
SET @mQTY = 0

DECLARE @tiSigDim TinyInt
DECLARE @iFtLen INT
SET @tiSigDim = 0
SET @iFtLen = 0


DECLARE @tiPU TinyInt
SET @tiPU = dbo.f_GetFormPU(@cForm)

IF @tiPU = 1		--*nQTY is Weight in LBS
	SET @mQTY = dbo.f_Calc_Weight(@cAlloy,@cForm,@iPieces,@nThck,@nSz2,@nSz3)

IF @tiPU = 2		--*nQTY = Feet
	begin

	If @iPieces < 1 
		SET @iPieces = 1

	SET @tiSigDim = dbo.f_getSigDim( @cForm )

	IF @tiSigDim = 2
		SET @iFtLen = @iPieces * @nSz2/12

	IF @tiSigDim = 2
		SET @iFtLen = @iPieces * @nSz2/12
		
	IF @tiSigDim = 3 OR @tiSigDim = 6
		SET @iFtLen = @iPieces * @nSz3/12
		
	IF @iFtLen > 0
		SET @mQTY = @iFtLen
	ELSE
		SET @mQTY = -1
		
	end

IF @tiPU = 3		--*nQTY is PCs
		SET @mQTY = @iPieces


RETURN @mQTY

END

--GRANT EXECUTE ON [dbo].[f_Get_QTY] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Get_QTY_SOitem]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Get_QTY_SOitem]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[f_Get_QTY_SOitem]
(
@SOitem CHAR(10)
)
RETURNS MONEY
AS
BEGIN

--SELECT dbo.f_Get_QTY_SOitem(''  72149-01'')
--like Proc_SQL:f_Get_Units
--
--Also see f_Calc_QTY
--
declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @Form  CHAR(2)
DECLARE @Pieces INT
DECLARE @Sz2 Float
DECLARE @Sz3 Float
DECLARE @Weight FLOAT

SELECT TOP 1 @Form=Form, @Pieces=Pieces, @Sz2=Sz2, @Sz3=Sz3, @Weight=[Weight] 
	FROM dbo.AllQuotes  WITH(NOLOCK)
	WHERE SOitem = @SOitem

DECLARE @PU TinyInt
SELECT @PU = dbo.f_GetFormPU(@Form)

DECLARE @ByFoot Money
SET @ByFoot = 
	CASE WHEN dbo.f_GetForm_use3rdDim( @Form ) = 1
		THEN (@Pieces * @Sz3 / 12) 
		ELSE (@Pieces * @Sz2 / 12) 	END



DECLARE @QTY Money
SET @QTY = 0

SET @QTY = 
	CASE WHEN @PU = 1 THEN @Weight ELSE 
	CASE WHEN @PU = 2 THEN @ByFoot ELSE
	CASE WHEN @PU = 3 THEN @Pieces END END END
			
IF @QTY = 0
	SET @QTY = 1
				
RETURN @QTY
END

--GRANT EXECUTE ON [dbo].[f_Get_QTY_SOitem] TO [HPA_Service]
--GRANT EXECUTE ON [dbo].[f_Get_QTY_SOitem] TO [WINDFALL\HPA]' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Get_Quote_LBS]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Get_Quote_LBS]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[f_Get_Quote_LBS] 
(
@nPieces INT,
@cAlloy char(12),
@cForm CHAR(2),
@cCC CHAR(1),
@nThickness DECIMAL(11,4),
@nSize2 DECIMAL(10,3),
@nSize3 DECIMAL(10,3),
@nForceBracket INT
)
--RETURNS DECIMAL(7,1) --Pounds
RETURNS REAL
AS
BEGIN
--PRINT dbo.[f_Get_Quote_LBS](''1'',''C-276'',''40'',''1'',1,12,48,0)
--PRINT dbo.[f_Get_Quote_LBS](Pieces,Alloy,Form,CC,thck,Sz2,Sz3,0)
--SET NOCOUNT ON

DECLARE @nTestPounds as float(53)
DECLARE @nPounds as REAL
SET @nPounds = 0

DECLARE @cMessage as VARCHAR(2000)
SET @cMessage = ''''

IF @nPieces < 1
	SET @nPieces = 1

DECLARE @nDensity DECIMAL(9,4)
SET @nDensity = IsNull(dbo.AlloyDensity( dbo.AlloyName(@cAlloy) ),0)
IF @nDensity = 0
   BEGIN
    SET @nDensity = .29
    SET @cMessage = RTRIM(@cMessage)+'' Alloy Density not found!''
   END
ELSE
   SET @cMessage = RTRIM(@cMessage)+''Used Density of ''+STR(@nDensity,5,3)
--Find Thickness used in PriceTable

SET @nPounds = 0

IF @cForm = ''10'' 
   BEGIN
	--CHANGE FROM @nThickness*1.023 2-9-94
	--USING CASE STRUCTURE WITH ERIKS INFO
  	IF @nThickness = 0
		SET @nPounds = 0
	ELSE
	IF @nThickness < .2
		begin
		SET @nTestPounds = (POWER(@nThickness+.001,2)* 3.23 * @nDensity* @nSize2* @nPieces /4)
		IF @nTestPounds > 9999999.9
			SET @nPounds = 9999999.9
		ELSE
			begin
			SET @nPounds = (POWER(@nThickness+.001,2)* 3.23 * @nDensity* @nSize2* @nPieces /4)
			end
		end
	ELSE
		IF @nThickness < 1
		begin
		SET @nTestPounds = (POWER(@nThickness+.005,2)* 3.23 * @nDensity* @nSize2* @nPieces /4)
		IF @nTestPounds > 9999999.9
			SET @nPounds = 9999999.9
		ELSE
			begin
			SET @nPounds = (POWER(@nThickness+.005,2)* 3.23 * @nDensity* @nSize2* @nPieces /4)
			end
		end
	ELSE
		IF @nThickness < 3
		begin
		SET @nTestPounds = (POWER(@nThickness+.01,2)* 3.23 * @nDensity* @nSize2* @nPieces /4)
		IF @nTestPounds > 9999999.9
			SET @nPounds = 9999999.9
		ELSE
			begin
			SET @nPounds = (POWER(@nThickness+.01,2)* 3.23 * @nDensity* @nSize2* @nPieces /4)
			end
		end
	ELSE
	IF @nThickness < 6
		begin
		SET @nPounds = (POWER(@nThickness+.020,2)* 3.23* @nDensity* @nSize2* @nPieces /4)
		end
	ELSE
		begin
		SET @nPounds = (POWER(@nThickness+.032,2)* 3.23* @nDensity* @nSize2* @nPieces /4)
		end
   END 
ELSE
IF @cForm = ''11'' 
	SET @nPounds = (@nDensity* @nThickness* 1.03* @nSize2* @nSize3* @nPieces )
ELSE
IF @cForm = ''12''
	SET @nPounds = @nDensity*@nThickness*@nThickness*.866*@nSize2* @nPieces
ELSE
IF @cForm = ''13'' 
	SET @nPounds = (@nDensity* @nThickness* 1.03* @nSize2* @nSize3* @nPieces )
ELSE
IF @cForm = ''20'' --WIRE 
	SET @nPounds = @nSize2* @nPieces 
ELSE
IF @cForm = ''21'' --WIRE CUTS --by 10 Pounds tubes 2019
	SET @nPounds = @nSize3 * @nPieces 
ELSE
IF @cForm = ''22'' --LOOSE COIL
	SET @nPounds = @nSize2* @nPieces 
ELSE
IF @cForm = ''23'' --WIRE REEL  
	SET @nPounds = @nSize2* @nPieces 
ELSE
IF @cForm = ''30'' 
	SET @nPounds = @nSize3* @nPieces 
ELSE
IF @cForm = ''40'' 
	SET @nPounds = (@nDensity* @nThickness* 1.015* @nSize2* @nSize3* @nPieces )
ELSE
IF @cForm = ''60''
	SET @nPounds = @nDensity *@nSize3*@nSize2*3.23* (@nThickness-@nSize2)* @nPieces 
ELSE
IF @cForm = ''65''
   BEGIN
	DECLARE @nPipeWeight DECIMAL(9,4)
	SET @nPipeWeight = IsNull(dbo.PipeWeight(@nThickness,@nSize2),0)
	IF @nPipeWeight = 0
		   SET @cMessage = RTRIM(@cMessage)+'' Pipe Weight not found!''

	SET @nPounds = (@nDensity* @nPipeWeight* @nSize3* @nPieces )

   END
ELSE
IF @cForm = ''80''
	SET @nPounds = (@nDensity * @nThickness * 1.03 * @nSize2 * @nSize2 * @nPieces )


RETURN @nPounds
END




' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_get_Quoted_Price]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_get_Quoted_Price]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

/****** Object:  Stored Procedure dbo.p_StandardSize    Script Date: 12/2/2005 2:04:26 PM ******/


CREATE FUNCTION [dbo].[f_get_Quoted_Price]
(
@nLotP		Money
,@nP_Lb		Money
,@nP_Pc		Money
,@nP_Ft		Money
,@nOtherP	Money
,@nCut		Money
,@nOrder_QTY	Money

)
RETURNS Money

AS
BEGIN

--SELECT dbo.f_get_Quoted_Price(LotP,P_Lb,@P_Pc,P_Ft,OtherP,Cut,Order_QTY )

DECLARE @nTotal MONEY

declare @err int,
        @RC int

set @err = 0
set @rc = 0


SET @nTotal =
	CASE WHEN ISNULL(@nLotP,0) > 0 THEN @nLotP ELSE 
	CASE WHEN ISNULL(@nP_Lb,0) > 0 AND ISNULL(@nOrder_QTY,0)>0 THEN @nOrder_QTY*@nP_Lb+ISNULL(@nOtherP,0) ELSE 
	CASE WHEN ISNULL(@nP_Pc,0) > 0 AND ISNULL(@nOrder_QTY,0)>0 THEN @nOrder_QTY*@nP_Pc+ISNULL(@nOtherP,0) ELSE
	CASE WHEN ISNULL(@nP_Ft,0) > 0 AND ISNULL(@nOrder_QTY,0)>0 THEN @nOrder_QTY*@nP_Ft+ISNULL(@nOtherP,0) ELSE 0
	END END END END 


RETURN @nTotal
END

--GRANT EXECUTE ON [dbo].[f_get_Quoted_Price] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_get_Receive_From]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_get_Receive_From]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_get_Receive_From]
(	@POitem CHAR(12)
	,@SOitem CHAR(10)
	,@WO_Detail INT
)
RETURNS VARCHAR(60)
AS

BEGIN
--SELECT dbo.f_get_Receive_From('''',''  78703-01'',0)
--SELECT dbo.f_get_Receive_From( @POitem, @SOitem, @WO_Detail )

--Return Senders Name from POitem, SOitem, WO_Detail


DECLARE @cCompany VARCHAR(60) = ''''

SELECT @cCompany = ISNULL(Company,'''')	FROM dbo.PurchaseOrder WHERE POitem = dbo.f_ProperPOitem(@POitem)
IF LEN(@cCompany) > 0
	RETURN @cCompany

SELECT @cCompany = ISNULL(Company,'''')	FROM dbo.AllQuotes WHERE SOitem = dbo.f_ProperSOitem(@SOitem)
IF LEN(@cCompany) > 0
	RETURN @cCompany

SELECT @cCompany = ''WO ''+STR(ISNULL(WO,0))	FROM dbo.WorkOrder_Detail WHERE WO_Detail = ISNULL(@WO_Detail,0)

RETURN @cCompany
END

--GRANT EXECUTE ON [dbo].[f_get_Receive_From] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_get_S_P_SOitem]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_get_S_P_SOitem]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[f_get_S_P_SOitem]
--f_get_S_P_SOitem]
(
@SOitem CHAR(10)
)
RETURNS MONEY
AS
BEGIN

--SELECT dbo.[f_get_S_P_SOitem]('' 140726-01'')

--
DECLARE @S_P money = 0

SELECT @S_P = S_P
FROM dbo.AllQuotes WITH(NOLOCK)
	WHERE SOitem = @SOitem
				
RETURN ISNULL(@S_P,0)
END

--GRANT EXECUTE ON [dbo].[f_get_S_P_SOitem] TO [HPA_Service]
--GRANT EXECUTE ON [dbo].[f_get_S_P_SOitem] TO [WINDFALL\HPA]' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Get_SalesP_Email]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Get_SalesP_Email]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Get_SalesP_Email] 
(
	@SalesP char(1)
)

RETURNS VARCHAR(30)
AS
BEGIN
--SET NOCOUNT ON
--PRINT dbo.SalesPEmail(''D'')

	DECLARE @SpDescript AS VARCHAR(20)
	DECLARE @SpEmail AS VARCHAR(30)

	IF @SalesP = ''0''
		SET @SpDescript = ''Production Order    ''
	ELSE
		SELECT @SpDescript=[Un] FROM dbo.AppSetup WHERE [Prp] = ''SalesP'' AND [Ans] = @SalesP AND [UN]!=[Ans]

	SELECT @SpEmail = [ANS] FROM dbo.AppSetup WHERE [Prp] = ''E-mail'' AND [UN] = @SpDescript

	RETURN @SpEmail
END




/*
GRANT EXECUTE ON [dbo].f_Get_SalesP_Email TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].f_Get_SalesP_Email TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].f_Get_SalesP_Email TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Get_ShipAddr]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Get_ShipAddr]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[f_Get_ShipAddr]
(
	@nAddrCode INT
)
RETURNS VARCHAR(4000)

AS
BEGIN

--SELECT dbo.f_Get_ShipAddr(83696)

--SET @BCC = dbo.f_Get_BCC()
DECLARE @Body varchar(4000) = ''''
DECLARE @cReturn VARCHAR(4000)

DECLARE @shipcode INT
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

SELECT TOP 1 @shipcode=shipcode, @Company=Company, @Addr1=Addr1, @Addr2=Addr2, @City=City, @ST=ST, @Zip=Zip, @Country=Country, @Contact=Contact, @Telephone=Telephone, @Fax_Number=Fax_Number, @Email=Email, @Customer=Customer 
	FROM dbo.ShipAddr WITH(NOLOCK)
	WHERE ShipCode = @nAddrCode

/*SET @Body = @body + CHAR(13)+''Shipping Address:''+CHAR(13)
SET @Body = @body + ''shipcode=''+CHAR(9)+ ISNULL(CAST(@shipcode AS CHAR),''No Code'')+CHAR(13)
SET @Body = @body + ''Company=''+CHAR(9)+ ISNULL(@Company,''No Company'')+CHAR(13)
SET @Body = @body + ''Addr1=''+CHAR(9)+CHAR(9)+ ISNULL(@Addr1,''No Addr'')+CHAR(13)
SET @Body = @body + ''Addr2=''+CHAR(9)+CHAR(9)+ ISNULL(@Addr2,'''')+CHAR(13)
SET @Body = @body + ''City=''+CHAR(9)+CHAR(9)+ ISNULL(@City,'''')+CHAR(13)
SET @Body = @body + ''ST=''+CHAR(9)+CHAR(9)+ ISNULL(@ST,'''')+CHAR(13)
SET @Body = @body + ''Zip=''+CHAR(9)+CHAR(9)+ ISNULL(@Zip,'''')+CHAR(13)
SET @Body = @body + ''Country=''+CHAR(9)+ ISNULL(@Country,'''')+CHAR(13)
SET @Body = @body + ''Contact=''+CHAR(9)+ ISNULL(@Contact,'''')+CHAR(13)
SET @Body = @body + ''Telephone=''+CHAR(9)+ ISNULL(@Telephone,'''')+CHAR(13)
SET @Body = @body + ''Fax_Number=''+CHAR(9)+ ISNULL(@Fax_Number,'''')+CHAR(13)
SET @Body = @body + ''Email=''+CHAR(9)+CHAR(9)+ ISNULL(@Email,'''')+CHAR(13)+CHAR(13)
*/

SET @Body = @body + ISNULL(@Company,''No Company'')+'', ''
SET @Body = @body + ISNULL(@Addr1,''No Addr'')+'', ''
SET @Body = @body + ISNULL(@Addr2,'''')+'', ''
SET @Body = @body + ISNULL(@City,'''')+'', ''
SET @Body = @body + ISNULL(@ST,'''')+'', ''
SET @Body = @body + ISNULL(@Zip,'''')

SET @cReturn = ISNULL(@body,''No Address'')

RETURN @cReturn
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Get_StockLst_ID]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Get_StockLst_ID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[f_Get_StockLst_ID]
(
	@nID_Detail INT
)
RETURNS INT
AS
BEGIN
	-- USE f_Lst_IDfrom_ID_Detail  
	--depricate this in luse of All Tabl f_Lst

	--SELECT dbo.f_Get_StockLst_ID(11000)

	DECLARE @nID INT
	SET @nID = 0

	SELECT TOP 1 @nID = ID FROM dbo.StockLst_Detail WHERE ID_Detail = @nID_Detail 
		AND ISNULL(ID,0) > 0

	IF ISNULL(@nID,0) = 0
		SELECT TOP 1 @nID = ID FROM dbo.Ar_StockLst_Detail_History WHERE ID_Detail = @nID_Detail 

	RETURN ISNULL(@nID, 0)

END

--GRANT EXECUTE ON [dbo].[f_Get_StockLst_ID] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Get_Survey_CorrectiveAction_User_Sugguestion]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Get_Survey_CorrectiveAction_User_Sugguestion]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Brandon van de Venter
-- Create date: 09/29/2021
-- Description:	Returns a user sugguestion for a survey Corrective Action
-- =============================================
CREATE FUNCTION [dbo].[f_Get_Survey_CorrectiveAction_User_Sugguestion] 
(
	-- Add the parameters for the function here
	@AssignmentID uniqueidentifier
)
RETURNS VARCHAR(100)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @SugguestedUser varchar(100)

	-- Add the T-SQL statements to compute the return value here
	DECLARE @AssignmentType smallint
		,@DoNotContact bit = 1
		,@SalesOrder varchar(15)
		,@Quote varchar(15)
		,@NoQuote bit
		,@ContactInfoID uniqueidentifier
		,@TargetIdentifier varchar(50)
		,@SalesP varchar(1)

	SELECT TOP (1) 
		@ContactInfoID = Survey_Assignment_ContactInfoID
		,@ContactInfoID = Survey_Assignment_ContactInfoID
		,@AssignmentType = AssignmentType
		,@TargetIdentifier = LTRIM(RTRIM(TargetIdentifier))
	FROM [dbo].[Survey_Assignments]
	WHERE ID = @AssignmentID

	SELECT TOP (1) 
		@DoNotContact = DoNotContact
		,@SalesOrder = LTRIM(RTRIM(SalesOrder))
		,@Quote = LTRIM(RTRIM(Quote))
		,@NoQuote = NoQuote
	FROM [dbo].[Survey_Assignment_ContactInfos]
	WHERE ID = @ContactInfoID

	IF (@DoNotContact = 0)
	BEGIN
		-- (AssignmentType) 1: Employee, 2: Quote, 3: Sales Order, 4: Purchase Order, 5: General Customer Survey
		-- WE DO NOT CARE ABOUT PO''s YET

		IF (@AssignmentType = 5) -- General Customer Survey: CHECK WITH THE SUPPLIED CONTACT INFO
		BEGIN
			IF (@SalesOrder IS NOT NULL)
			BEGIN
				SELECT TOP (1) @SalesP = SalesP
				FROM [dbo].[AllQuotes]
				where
				(
					ISNUMERIC(@SalesOrder) = 1 AND SalesNum = (CASE WHEN ISNUMERIC(@SalesOrder) = 1 THEN CONVERT(int, @SalesOrder) ELSE NULL END) 
					OR LTRIM(RTRIM(SOitem)) = LTRIM(RTRIM(REPLACE(@SalesOrder, ''SO'', '''')))
				)

				SELECT TOP (1) @SugguestedUser = LTRIM(RTRIM([un]))
				FROM [dbo].[AppSetup]
				where prp = ''SalesP'' AND ans = @SalesP
			END

			ELSE IF (@Quote IS NOT NULL)
			BEGIN
				SELECT TOP (1) @SalesP = SalesP
				FROM [dbo].[AllQuotes]
				where LTRIM(RTRIM([InqNumP])) = LTRIM(RTRIM(@Quote))

				SELECT TOP (1) @SugguestedUser = LTRIM(RTRIM([un]))
				FROM [dbo].[AppSetup]
				where prp = ''SalesP'' AND ans = @SalesP
			END

			ELSE IF (@NoQuote = 1)
			BEGIN
				Set @SugguestedUser = ''David Kirchner'';
			END
		END

		ELSE IF (@AssignmentType = 2) -- Quote
		BEGIN
			SELECT TOP (1) @SalesP = SalesP
			FROM [dbo].[AllQuotes]
			where LTRIM(RTRIM([InqNumP])) = LTRIM(RTRIM(@TargetIdentifier))

			SELECT TOP (1) @SugguestedUser = LTRIM(RTRIM([un]))
			FROM [dbo].[AppSetup]
			where prp = ''SalesP'' AND ans = @SalesP
		END
	
		ELSE IF (@AssignmentType = 3) -- Sales Order
		BEGIN
			SELECT TOP (1) @SalesP = SalesP
			FROM [dbo].[AllQuotes]
			where
			(
				ISNUMERIC(@TargetIdentifier) = 1 AND SalesNum = (CASE WHEN ISNUMERIC(@TargetIdentifier) = 1 THEN CONVERT(int, @TargetIdentifier) ELSE NULL END) 
				OR LTRIM(RTRIM(SOitem)) = LTRIM(RTRIM(REPLACE(@TargetIdentifier, ''SO'', '''')))
			)

			SELECT TOP (1) @SugguestedUser = LTRIM(RTRIM([un]))
			FROM [dbo].[AppSetup]
			where prp = ''SalesP'' AND ans = @SalesP
		END

		ELSE IF (@AssignmentType = 1) -- Employee
		BEGIN
			Set @SugguestedUser = ''Sutton Krogstie'';
		END

	END


	-- Return the result of the function
	RETURN @SugguestedUser

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Get_Unit_nPU]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Get_Unit_nPU]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Get_Unit_nPU]
(
 @nPU Tinyint
)
RETURNS CHAR(4)

AS
BEGIN
--SELECT dbo.f_Get_Unit_nPU(7)  ''$/Mr'' or Meters

--Check Data with dbo.PU
--SELECT dbo.f_Get_PU_Price_String(PU,QTY,P)
--SELECT dbo.f_Get_PU_Caption(2)

DECLARE @cUnit CHAR(4) = ''''

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SELECT @cUnit = [Unit]
  FROM dbo.[PU]
  WHERE PU = @nPU


RETURN @cUnit
END

--GRANT EXECUTE ON [dbo].[f_Get_Unit_nPU] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Get_Units]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Get_Units]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[f_Get_Units] 
(
@nPieces SmallInt,
@cAlloy CHAR(12),
@cForm CHAR(2),
@nThickness DECIMAL(9,4),
@nSize2 DECIMAL(9,3),
@nSize3 DECIMAL(9,3)
)
--RETURNS DECIMAL(7,1)
RETURNS DECIMAL(7,1)
AS
BEGIN
--PRINT dbo.f_Get_Units(''1'',''C-276'',''40'',1,12,48)
--PRINT dbo.f_Get_Units(''1'',''C-276'',''65'',1,40,240)
--PRINT dbo.f_Get_Units(Pieces,Alloy,Form,Thickness,nSize2,nSize3)
--SELECT dbo.f_Get_Units(Pieces,Alloy,Form,Thck,Sz2,Sz3) AS QTY ,Weight FROM dbo.AllQuotes WHERE SOItem = dbo.f_ProperSOitem(''

--like Proc_SQL:get_QTY


DECLARE @nUnits Decimal (7,1)
SET @nUnits = 0
DECLARE @nPU TINYINT

SET @nPU = 0
--1Lb, 2Ft 3Pc
SELECT TOP 1 @nPU = PU FROM dbo.Forms WHERE FormNumber = @cForm

IF @nPU = 1
begin
	--LBS
	SET @nUnits = dbo.f_GetWeight(@nPieces,@cAlloy,@cForm,@nThickness,@nSize2,@nSize3)
end

-----------------
IF @nPU = 2
begin
	--Ft
	Declare @lUse3rdDim BIT
	SELECT TOP 1 @lUse3rdDim = Use3rdDim FROM dbo.Forms WHERE FormNumber = @cForm

	IF @lUse3rdDim = 1
		SET @nUnits = @nPieces * @nSize3 /12
	ELSE
		SET @nUnits = @nPieces * @nSize2 /12
	
end

-----------------
IF @nPU = 3
begin
	-- PC
	SET @nUnits = @nPieces
end


RETURN @nUnits
END


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Get_Weight]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Get_Weight]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[f_Get_Weight] 
(
@nPieces INT,
@cAlloy char(12),
@cForm CHAR(2),
@cCC CHAR(1),
@nThickness DECIMAL(11,4),
@nSize2 DECIMAL(10,3),
@nSize3 DECIMAL(10,3),
@nForceBracket INT
)
--RETURNS DECIMAL(7,1)
--Min of 0.1
RETURNS REAL
AS
BEGIN
--PRINT dbo.[f_Get_Weight](1,''C-276'',''40'',1,1,12,48,0)
--PRINT dbo.f_Get_Weight(Pieces,Alloy,Form,CC,Thck,Sz2,Sz3,0)
-- also see [f_GetWeight], f_Get_Weight has a Force Bracket parameter
--called by VIEW dbo.Forcast 
--SET NOCOUNT ON
--@nForceBracket is depricated.

DECLARE @nTestPounds as float
DECLARE @nPounds as REAL
SET @nPounds = 0.1
DECLARE @nSetZero tinyint = 0

DECLARE @cMessage as VARCHAR(2000)
SET @cMessage = ''''

IF @nPieces < 1
	SET @nPieces = 1

DECLARE @nDensity DECIMAL(9,4)
SET @nDensity = IsNull(dbo.AlloyDensity( dbo.AlloyName(@cAlloy) ),0)
IF @nDensity = 0
   BEGIN
    SET @nDensity = .29
    SET @cMessage = RTRIM(@cMessage)+'' Alloy Density not found!''
   END
ELSE
   SET @cMessage = RTRIM(@cMessage)+''Used Density of ''+STR(@nDensity,5,3)
--Find Thickness used in PriceTable


IF @cForm = ''10'' 
   BEGIN
	--CHANGE FROM @nThickness*1.023 2-9-94
	--USING CASE STRUCTURE WITH ERIKS INFO
  	IF @nThickness = 0
		SET @nSetZero = 1
	ELSE
	IF @nThickness < .2
		begin
		SET @nTestPounds = (POWER(@nThickness+.001,2)* 3.23 * @nDensity* @nSize2* @nPieces /4)
		IF @nTestPounds > 9999999.9
			SET @nPounds = 9999999.9
		ELSE
			begin
			SET @nPounds = (POWER(@nThickness+.001,2)* 3.23 * @nDensity* @nSize2* @nPieces /4)
			end
		end
	ELSE
		IF @nThickness < 1
		begin
		SET @nTestPounds = (POWER(@nThickness+.005,2)* 3.23 * @nDensity* @nSize2* @nPieces /4)
		IF @nTestPounds > 9999999.9
			SET @nPounds = 9999999.9
		ELSE
			begin
			SET @nPounds = (POWER(@nThickness+.005,2)* 3.23 * @nDensity* @nSize2* @nPieces /4)
			end
		end
	ELSE
		IF @nThickness < 3
		begin
		SET @nTestPounds = (POWER(@nThickness+.01,2)* 3.23 * @nDensity* @nSize2* @nPieces /4)
		IF @nTestPounds > 9999999.9
			SET @nPounds = 9999999.9
		ELSE
			begin
			SET @nPounds = (POWER(@nThickness+.01,2)* 3.23 * @nDensity* @nSize2* @nPieces /4)
			end
		end
	ELSE
	IF @nThickness < 6
		begin
		SET @nPounds = (POWER(@nThickness+.020,2)* 3.23* @nDensity* @nSize2* @nPieces /4)
		end
	ELSE
		begin
		SET @nPounds = (POWER(@nThickness+.032,2)* 3.23* @nDensity* @nSize2* @nPieces /4)
		end
   END 
ELSE
IF @cForm = ''11'' --FLAT BAR
	SET @nPounds = (@nDensity* @nThickness* 1.03* @nSize2* @nSize3* @nPieces )
ELSE
IF @cForm = ''12'' --HEX
	SET @nPounds = @nDensity*@nThickness*@nThickness*.866*@nSize2* @nPieces
ELSE
IF @cForm = ''13'' --SQAURE BAR
	SET @nPounds = (@nDensity* @nThickness* 1.03* @nSize2* @nSize3* @nPieces )
ELSE
IF @cForm = ''20'' --WIRE
	SET @nPounds = @nSize2* @nPieces 
ELSE
IF @cForm = ''21'' --WIRE CUTS --by 10 Pounds tubes 2019
	SET @nPounds = @nSize3* @nPieces 
	--SET @nPounds = (POWER(@nThickness+.001,2)* 3.23 * @nDensity* @nSize2* @nPieces /4)
ELSE
IF @cForm = ''22'' --LOOSE COIL
	SET @nPounds = @nSize2* @nPieces 
ELSE
IF @cForm = ''23'' --WIRE REEL  
	SET @nPounds = @nSize2* @nPieces 
ELSE
IF @cForm = ''30'' --COATED ELEC
	SET @nPounds = @nSize3* @nPieces 
ELSE
IF @cForm = ''40'' --PLATE
	SET @nPounds = (@nDensity* @nThickness* 1.015* @nSize2* @nSize3* @nPieces )
ELSE
IF @cForm = ''50'' --SHEET
	SET @nPounds = (@nDensity* @nThickness* 1.015* @nSize2* @nSize3* @nPieces )
ELSE
IF @cForm = ''51'' --STRIP
	SET @nPounds = (@nSize3 * @nPieces )
ELSE
IF @cForm = ''52'' -- COIL
	SET @nPounds = (@nSize3 * @nPieces )
ELSE
IF @cForm = ''53'' -- Hot Band
	SET @nPounds = (@nSize3 * @nPieces )
ELSE
IF @cForm = ''60'' --TUBE
	begin
	--Twice wall thickness should never be mor than Dia
	IF @nSize2*2 > @nThickness
		SET @nPounds = 0.1
	ELSE
		SET @nPounds = @nDensity *@nSize3*@nSize2*3.23* (@nThickness-@nSize2)* @nPieces 
	end
ELSE
IF @cForm = ''65''
   BEGIN
	DECLARE @nPipeWeight DECIMAL(9,4)
	SET @nPipeWeight = IsNull(dbo.PipeWeight(@nThickness,@nSize2),0)
	IF @nPipeWeight = 0
		begin
		SET @cMessage = RTRIM(@cMessage)+'' Pipe Weight not found!''
		SET @nSetZero = 1
		end

	SET @nPounds = (@nDensity* @nPipeWeight* @nSize3* @nPieces )

   END
ELSE
IF @cForm = ''66'' --NIPPLE     
	begin
	SET @cMessage = RTRIM(@cMessage)+'' Weight not found!''
	SET @nSetZero = 1
	end
ELSE
IF @cForm = ''67'' --ELBOW      
	begin
	SET @cMessage = RTRIM(@cMessage)+'' Weight not found!''
	SET @nSetZero = 1
	end
ELSE
IF @cForm = ''68'' --TEE      
	begin
	SET @cMessage = RTRIM(@cMessage)+'' Weight not found!''
	SET @nSetZero = 1
	end
ELSE
IF @cForm = ''69'' --REDUCER      
	begin
	SET @cMessage = RTRIM(@cMessage)+'' Weight not found!''
	SET @nSetZero = 1
	end
ELSE
IF @cForm = ''70'' --FITTINGS      
	begin
	SET @cMessage = RTRIM(@cMessage)+'' Weight not found!''
	SET @nSetZero = 1
	end
ELSE
IF @cForm = ''71'' --COUPLING      
	begin
	SET @cMessage = RTRIM(@cMessage)+'' Weight not found!''
	SET @nSetZero = 1
	end
ELSE
IF @cForm = ''72'' --FLANGE      
	begin
	SET @cMessage = RTRIM(@cMessage)+'' Weight not found!''
	SET @nSetZero = 1
	end
ELSE
IF @cForm = ''75'' --FASTENER      
	begin
	SET @cMessage = RTRIM(@cMessage)+'' Weight not found!''
	SET @nSetZero = 1
	end
ELSE
IF @cForm = ''80'' --DISK
	SET @nPounds = (@nDensity * @nThickness * 1.03 * @nSize2 * @nSize2 * @nPieces )
	--Weight of Square used
IF @cForm = ''90'' --MACHINED        
	begin
	SET @nPounds = (@nDensity* @nThickness* 1.015* @nSize2* @nSize3* @nPieces )
	IF @nPounds = 0
		SET @cMessage = RTRIM(@cMessage)+'' Weight not found!''
	end
ELSE
IF @cForm = ''95'' --FORGE 
	begin
	SET @nPounds = (@nDensity* @nThickness* 1.015* @nSize2* @nSize3* @nPieces )
	IF @nPounds = 0
		SET @cMessage = RTRIM(@cMessage)+'' Weight not found!''
	end
ELSE
IF @cForm = ''96'' --SLAB
	SET @nPounds = (@nDensity* @nThickness* 1.015* @nSize2* @nSize3* @nPieces )
ELSE
IF @cForm = ''97'' --BILLET
	SET @nPounds = (POWER(@nThickness+.032,2)* 3.23* @nDensity* @nSize2* @nPieces /4)
ELSE
IF @cForm = ''98'' --RCS 
	SET @nPounds = (@nDensity* @nThickness* 1.015* @nThickness* @nSize2* @nPieces )
ELSE
IF @cForm = ''99'' --INGOT
	IF @nSize3 > 0   --Not Round
		SET @nPounds = (@nDensity* @nThickness* 1.015* @nSize2* @nSize3* @nPieces )
	ELSE
		SET @nPounds = (POWER(@nThickness+.032,2)* 3.23* @nDensity* @nSize2* @nPieces /4)

IF @nSetZero = 1
	SET @nPounds = 0
ELSE
	IF @nPounds < 0.1
		SET @nPounds = 0.1
	--use 0.1 as Min

RETURN @nPounds

END




--GRANT EXECUTE ON [dbo].[f_Get_Weight] TO [WINDFALL\HPA] AS [dbo];
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_get_Year_Month]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_get_Year_Month]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David Kirchner
-- Create date: 2015 11 11
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_get_Year_Month] 
(
	@DateTime AS DateTime
)
RETURNS Int
AS
BEGIN
--Returns year*100 and month
--PRINT dbo.f_get_Year_Month( GETDATE() )
-- 202001 YEARMO

-- Declare the return variable here
DECLARE @nReturn Int
DECLARE @nYear SmallInt
DECLARE @nMonth SmallInt
SET @nYear = YEAR( @DateTime )
SET @nMonth = Month( @DateTime )

SET @nReturn = @nYear * 100 + @nMonth

RETURN ISNULL(@nReturn,0)

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_get_Year_Next_Month]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_get_Year_Next_Month]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David Kirchner
-- Create date: 2015 11 11
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_get_Year_Next_Month] 
(
	@DateTime AS DateTime
)
RETURNS SmallInt
AS
BEGIN
--Returns year and month
--PRINT dbo.f_get_Year_Next_Month( GETDATE() )

-- Declare the return variable here
DECLARE @nReturn SmallInt
SET @nReturn = YEAR( @DateTime+31 )


SET @nReturn = ISNULL(@nReturn,0)
RETURN @nReturn

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_get_Year_Prev_Month]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_get_Year_Prev_Month]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David Kirchner
-- Create date: 2015 11 11
-- Description:	
-- =============================================
Create FUNCTION [dbo].[f_get_Year_Prev_Month] 
(
	@DateTime AS DateTime
)
RETURNS SmallInt
AS
BEGIN

--PRINT dbo.f_get_Year_Prev_Month( GETDATE() )

-- Declare the return variable here
DECLARE @nReturn SmallInt
SET @nReturn = YEAR( @DateTime-31 )


SET @nReturn = ISNULL(@nReturn,0)
RETURN @nReturn

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_get_Year_Qtr]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_get_Year_Qtr]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David Kirchner
-- Create date: 2015 11 11
-- Description:	
-- =============================================
Create FUNCTION [dbo].[f_get_Year_Qtr] 
(
	@DateTime AS DateTime
)
RETURNS Int
AS
BEGIN
--Returns year*10 and Qtr
--PRINT dbo.f_get_Year_Qtr( GETDATE() )
-- 20201 YearQ

-- Declare the return variable here
DECLARE @nReturn Int
DECLARE @nYear SmallInt = YEAR( @DateTime );
DECLARE @nQuarter SmallInt = DATEPART(QUARTER,  @DateTime );

SET @nReturn = @nYear * 10 + @nQuarter

RETURN ISNULL(@nReturn,0)

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetBasicStockForm]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetBasicStockForm]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_GetBasicStockForm]
(
@cForm CHAR(2)
)
RETURNS CHAR(2)
AS
BEGIN

--SELECT dbo.[f_GetBasicStockForm](''11'')
DECLARE @returnForm CHAR(2)

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @returnForm = ''10''

SET @returnForm = CASE @cForm
	WHEN ''10'' THEN ''10''
	WHEN ''11'' THEN ''10''
	WHEN ''12'' THEN ''10''
	WHEN ''13'' THEN ''10''
	WHEN ''20'' THEN ''20''
	WHEN ''21'' THEN ''20''
	WHEN ''30'' THEN ''30''
	WHEN ''40'' THEN ''40''
	WHEN ''51'' THEN ''40''
	WHEN ''60'' THEN ''60''
	WHEN ''65'' THEN ''65''
	WHEN ''66'' THEN ''70''
	WHEN ''67'' THEN ''70''
	WHEN ''68'' THEN ''70''
	WHEN ''69'' THEN ''70''
	WHEN ''70'' THEN ''70''
	WHEN ''71'' THEN ''70''
	WHEN ''72'' THEN ''70''
	WHEN ''75'' THEN ''75''
	WHEN ''80'' THEN ''40''
	WHEN ''90'' THEN ''90''
	WHEN ''95'' THEN ''95''
	WHEN ''99'' THEN ''99''
	
	ELSE ''10''
	END

--select @RC = @@ROWCOUNT, @err = @@ERROR

RETURN @returnForm
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetCCSort]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetCCSort]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_GetCCSort]
(
@cCC CHAR(1)
)
RETURNS CHAR(1)
AS
BEGIN

--SELECT dbo.f_GetCCSort(''A'')
DECLARE @cCCSort CHAR(1)

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @cCCSort =''''

SELECT @cCCSort = [CCSort]
  FROM dbo.ConditionCode
  WHERE CC = @cCC

--select @RC = @@ROWCOUNT, @err = @@ERROR

RETURN @cCCSort
END

--GRANT EXECUTE ON [dbo].[f_GetCCSort] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetCCSortDefault]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetCCSortDefault]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_GetCCSortDefault]
(
@cCC CHAR(1)
)
RETURNS CHAR(1)
AS
BEGIN

--SELECT dbo.f_GetCCSortDefault(''E'')
DECLARE @cCCSortDefault CHAR(1)

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @cCCSortDefault = ''''

SELECT TOP 1 @cCCSortDefault = CC 
FROM dbo.ConditionCode 
WHERE CCSortDefault = 1 AND CCSortValue = ( SELECT dbo.f_GetCCSortValue(@cCC) )
ORDER BY CC

--select @RC = @@ROWCOUNT, @err = @@ERROR

RETURN @cCCSortDefault
END

--SELECT  CC,CCSortDefault FROM dbo.ConditionCode WHERE CCSortDefault = 1 AND CCSortValue = 20 ORDER BY CC
 --SELECT dbo.f_GetCCSortValue(''8'')' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetCCSortValue]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetCCSortValue]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_GetCCSortValue]
(
@cCC CHAR(1)
)
RETURNS Numeric(2,0)
AS
BEGIN

--SELECT dbo.f_GetCCSortValue(''A'')
DECLARE @nCCSortValue Numeric(2,0)

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @nCCSortValue = 0

SELECT @nCCSortValue = [CCSortValue]
  FROM dbo.ConditionCode
  WHERE CC = @cCC

--select @RC = @@ROWCOUNT, @err = @@ERROR

RETURN @nCCSortValue
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetCompany_from_VendCode]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetCompany_from_VendCode]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'



CREATE FUNCTION [dbo].[f_GetCompany_from_VendCode]
(
@nVendCode INT
)
RETURNS VARCHAR(30)
AS
BEGIN

--SELECT dbo.f_GetCompany_from_VendCode(10212)
DECLARE @cCompany VARCHAR(30)

declare @err int,
        @RC int
set @err = 0
set @rc = 0

SET @cCompany = ''''

SELECT @cCompany = Company FROM dbo.Vendor WHERE VendCode = @nVendCode

RETURN @cCompany
END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetDistrict]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetDistrict]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'



CREATE FUNCTION [dbo].[f_GetDistrict]
(
@cST CHAR(2)
)
RETURNS CHAR(1)
AS
BEGIN
--Get District by State
--use    to convert District to SalesP

--SELECT dbo.[f_GetDistrict](''IN'')
DECLARE @cDistrict CHAR(1)

declare @err int,
        @RC int
set @err = 0
set @rc = 0

SET @cDistrict = ''0 ''

SELECT @cDistrict = District FROM dbo.District WHERE [State] = @cST

RETURN @cDistrict
END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetDistrict_CustID]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetDistrict_CustID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'



CREATE FUNCTION [dbo].[f_GetDistrict_CustID]
(
@cCustID VARCHAR(20)
)
RETURNS CHAR(1)
AS
BEGIN
--Get District by CustID - ''Peachtree Customer ID''

--SELECT dbo.f_GetDistrict_CustID(''ACTION '')
DECLARE @cDistrict CHAR(1)
DECLARE @cST CHAR(2)

declare @err int,
        @RC int
set @err = 0
set @rc = 0

SET @cST = ''  ''
SELECT @cST = ST FROM dbo.SoldAddr WHERE Customer = @cCustID AND ( Country = ''US'' OR Country = ''USA'' OR Country = '' USA'' OR Country = ''U.S.'' OR Country = ''U.S.A.'' OR Country = '' '' OR Country = ''UNITED STATES'' )


SET @cDistrict = ''0''
SELECT @cDistrict = District FROM dbo.District WHERE [State] = @cST

RETURN @cDistrict
END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetDistrict_State]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetDistrict_State]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'



Create FUNCTION [dbo].[f_GetDistrict_State]
(
@cST CHAR(2)
)
RETURNS CHAR(1)
AS
BEGIN
--Get District by State
--use    to convert District to SalesP

--SELECT dbo.[f_GetDistrict](''IN'')
DECLARE @cDistrict CHAR(1)

declare @err int,
        @RC int
set @err = 0
set @rc = 0

SET @cDistrict = ''0 ''

SELECT @cDistrict = District FROM dbo.District WHERE [State] = @cST

RETURN @cDistrict
END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetForm_StockBySZ2]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetForm_StockBySZ2]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

Create FUNCTION [dbo].[f_GetForm_StockBySZ2]
(
@cForm CHAR(2)
)
RETURNS BIT
AS
BEGIN

--SELECT dbo.f_GetForm_StockBySZ2(''10'')
DECLARE @lStockBySZ2 bit

SET @lStockBySZ2 = 0

SELECT @lStockBySZ2 = StockBySZ2 FROM dbo.Forms WHERE FormNumber = @cForm

RETURN @lStockBySZ2
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetForm_use3rdDim]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetForm_use3rdDim]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[f_GetForm_use3rdDim]
(
@cForm CHAR(2)
)
RETURNS BIT
AS
BEGIN

--SELECT dbo.f_GetForm_use3rdDim(''10'')
DECLARE @luse3rdDim bit

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @luse3rdDim = 0

SELECT @luse3rdDim = use3rdDim 
	FROM dbo.Forms WITH(NOLOCK)
	WHERE FormNumber = @cForm

RETURN @luse3rdDim
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetFormDescription]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetFormDescription]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[f_GetFormDescription]
(
@cForm CHAR(2)
)
RETURNS CHAR(11)
AS
BEGIN

--SELECT dbo.f_GetFormDescription(''10'')
--Use form to get Common Description

DECLARE @cDescription CHAR(11)

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @cDescription = '' ''

SELECT @cDescription = FormDescription FROM dbo.Forms WHERE FormNumber = @cForm

IF @cDescription = ''SHEET''
	SET @cDescription = ''Sheet/Plate''

IF @cDescription = ''FORGE''
	SET @cDescription = ''FORGE STK''

RETURN @cDescription
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetFormDim1Caption]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetFormDim1Caption]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.p_StandardSize    Script Date: 12/2/2005 2:04:26 PM ******/


CREATE FUNCTION [dbo].[f_GetFormDim1Caption]
(
@cForm CHAR(2)
)
RETURNS CHAR(10)
AS
BEGIN

--SELECT dbo.f_GetFormDim1Caption(''10'')
DECLARE @cFormCaption CHAR(10)

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @cFormCaption = '' ''

SELECT @cFormCaption = txt1 FROM dbo.Forms WHERE FormNumber = @cForm

--select @RC = @@ROWCOUNT, @err = @@ERROR
--SELECT thk FROM pricetbl WHERE Alloy = @cAlloy AND Form = @cForm AND Thk > @nThickness-.010 AND Thk < @nThickness +.010

--REPLACE Quotes.descript WITH ThisFormSet.QuotesDescription( @cForm, @nThickness, @nSize2, @nSize3 )

RETURN @cFormCaption
END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetFormDim2Caption]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetFormDim2Caption]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.p_StandardSize    Script Date: 12/2/2005 2:04:26 PM ******/


CREATE FUNCTION [dbo].[f_GetFormDim2Caption]
(
@cForm CHAR(2)
)
RETURNS CHAR(10)
AS
BEGIN

--SELECT dbo.f_GetFormDim1Caption(''10'')
DECLARE @cFormCaption CHAR(10)

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @cFormCaption = '' ''

SELECT @cFormCaption = txt2 FROM dbo.Forms WHERE FormNumber = @cForm

--select @RC = @@ROWCOUNT, @err = @@ERROR
--SELECT thk FROM pricetbl WHERE Alloy = @cAlloy AND Form = @cForm AND Thk > @nThickness-.010 AND Thk < @nThickness +.010

--REPLACE Quotes.descript WITH ThisFormSet.QuotesDescription( @cForm, @nThickness, @nSize2, @nSize3 )

RETURN @cFormCaption
END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetFormDim3Caption]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetFormDim3Caption]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.p_StandardSize    Script Date: 12/2/2005 2:04:26 PM ******/


CREATE FUNCTION [dbo].[f_GetFormDim3Caption]
(
@cForm CHAR(2)
)
RETURNS CHAR(10)
AS
BEGIN

--SELECT dbo.f_GetFormDim1Caption(''10'')
DECLARE @cFormCaption CHAR(10)

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @cFormCaption = '' ''

SELECT @cFormCaption = txt3 FROM dbo.Forms WHERE FormNumber = @cForm

--select @RC = @@ROWCOUNT, @err = @@ERROR
--SELECT thk FROM pricetbl WHERE Alloy = @cAlloy AND Form = @cForm AND Thk > @nThickness-.010 AND Thk < @nThickness +.010

--REPLACE Quotes.descript WITH ThisFormSet.QuotesDescription( @cForm, @nThickness, @nSize2, @nSize3 )

RETURN @cFormCaption
END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetFormDim4Caption]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetFormDim4Caption]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.p_StandardSize    Script Date: 12/2/2005 2:04:26 PM ******/


CREATE FUNCTION [dbo].[f_GetFormDim4Caption]
(
@cForm CHAR(2)
)
RETURNS CHAR(10)
AS
BEGIN

--SELECT dbo.f_GetFormDim1Caption(''10'')
DECLARE @cFormCaption CHAR(10)

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @cFormCaption = '' ''

SELECT @cFormCaption = txt4 FROM dbo.Forms WHERE FormNumber = @cForm

--select @RC = @@ROWCOUNT, @err = @@ERROR
--SELECT thk FROM pricetbl WHERE Alloy = @cAlloy AND Form = @cForm AND Thk > @nThickness-.010 AND Thk < @nThickness +.010

--REPLACE Quotes.descript WITH ThisFormSet.QuotesDescription( @cForm, @nThickness, @nSize2, @nSize3 )

RETURN @cFormCaption
END

--GRANT EXECUTE ON [dbo].[f_GetFormDim4Caption] TO [WINDFALL\HPA] AS [dbo];

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetFormPU]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetFormPU]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[f_GetFormPU]
(
@cForm CHAR(2)
)
RETURNS CHAR(2)
AS
BEGIN
--Also see f_GetPU_Unit

--SELECT dbo.f_GetFormPU(''10'')
DECLARE @nPriceUnit TINYINT

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @nPriceUnit = 0
--1Lb, 2Ft 3Pc, 4Lot, 5Inch
SELECT @nPriceUnit = PU 
	FROM dbo.Forms WITH(NOLOCK)
	WHERE FormNumber = @cForm

--SELECT TOP 1 @nPriceUnit = PU FROM dbo.PU 

RETURN @nPriceUnit
END

--GRANT EXECUTE ON [dbo].[f_GetFormPU] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetFormUnit]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetFormUnit]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_GetFormUnit]
(
@cForm CHAR(2)
)
RETURNS CHAR(4)
AS
BEGIN

--SELECT dbo.f_GetFormUnit(''10'')
--Returns Unit ($/#) defined in Forms table for that form

DECLARE @cUnit CHAR(4)

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @cUnit = ''''

SELECT @cUnit = Unit FROM dbo.Forms WHERE FormNumber = @cForm

RETURN @cUnit
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetFormUnitPrice]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetFormUnitPrice]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

/****** Object:  Stored Procedure dbo.f_GetFormUnitPrice    Script Date: 12/2/2005 2:04:26 PM ******/


CREATE FUNCTION [dbo].[f_GetFormUnitPrice]
(
@cForm CHAR(2)
)
RETURNS CHAR(2)
AS
BEGIN
--Called from Proc_SQL:FormUnitPrice
--SELECT dbo.f_GetFormUnitPrice(''10'')
--Use form to get Price Units, ex.. LB

DECLARE @cFormUnitPrice CHAR(2)

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @cFormUnitPrice = '' ''

SELECT @cFormUnitPrice = price FROM dbo.Forms WHERE FormNumber = @cForm

--select @RC = @@ROWCOUNT, @err = @@ERROR
--SELECT thk FROM pricetbl WHERE Alloy = @cAlloy AND Form = @cForm AND Thk > @nThickness-.010 AND Thk < @nThickness +.010

--REPLACE Quotes.descript WITH ThisFormSet.QuotesDescription( @cForm, @nThickness, @nSize2, @nSize3 )

RETURN @cFormUnitPrice
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetItemDescription]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetItemDescription]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2023 05 10
-- Copied from the Commerce Db
-- Original Created date: 2015 01 20
-- Description:	Get Item Description
-- =============================================
CREATE FUNCTION [dbo].[f_GetItemDescription] 
(
	-- Add the parameters for the function here
  @cForm AS CHAR(2)
, @nSZ1 AS NUMERIC(18,4)
, @nSZ2 AS NUMERIC(18,4)
, @nSZ3 AS NUMERIC(18,4)
, @nWeight AS FLOAT
, @lRL AS BIT
)
RETURNS VARCHAR(100)
AS
BEGIN
DECLARE @lMetric AS Bit
, @nSz1orig AS Float
, @nSz2orig AS Float
, @nSz3orig AS Float

DECLARE @cDs VARCHAR(100)
--10,Bar,11,Flat Bar,12,Hex Bar,13,Square Bar,20,Wire Spool,21,Wire Cut,30,Coat Elect,
--40,Plate/Sheet,51,Strip,60,Tube,65,Pipe,66,Nipple,67,Elbow,68,Tee,69,Reducer,70,Fittings,72,Flange,75,Fastener,80,Disk
IF @cForm = ''0''
	SET @cDs = '' ''
	
IF @cForm = ''10'' 
	begin
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''"Dia x ''
	IF @nSZ2 > 110 AND @nSZ2%12 = 0
		SET @cDs = @cDs + LTRIM( STR( @nSZ2/12 ,8,0)) + '' FT '' 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) + ''" '' 
	
	IF @nSZ3 > 0
		begin
		IF @nSZ3 > 110 AND @nSZ3%12 = 0
			SET @cDs = @cDs + '' x ''+LTRIM( STR( @nSZ3/12 ,8,0)) + '' FT '' 
		ELSE
			SET @cDs = @cDs + '' x ''+dbo.Remove0(@nSZ3,8,3) + ''" ''	
		end
	end

IF @cForm = ''11''  
	begin --Flat Bar
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" Flat bar x '' + dbo.Remove0(@nSZ2,8,3)+''" Wide x ''
	IF @nSZ3 > 0
		begin
		IF @nSZ3 > 110 AND @nSZ3%12 = 0
			SET @cDs = @cDs + LTRIM( STR( @nSZ3/12 ,8,0)) + '' FT '' 
		ELSE
			SET @cDs = @cDs + dbo.Remove0(@nSZ3,8,3) + ''" ''
		end
	SET @cDs = @cDs + '' Long''
	end

IF @cForm = ''12'' 
	begin --Hex Bar
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"HEX x ''
	IF @nSZ2 > 110 AND @nSZ2%12 = 0
		SET @cDs = @cDs + LTRIM( STR( @nSZ2/12 ,8,0)) + '' FT '' 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) + ''" '' 
	
	IF @nSZ3 > 0
		begin
		IF @nSZ3 > 110 AND @nSZ3%12 = 0
			SET @cDs = @cDs + '' x ''+LTRIM( STR( @nSZ3/12 ,8,0)) + '' FT '' 
		ELSE
			SET @cDs = @cDs + '' x ''+dbo.Remove0(@nSZ3,8,3) + ''" ''
		end
	end

IF @cForm = ''13'' 
	begin --Square Bar
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''" x ''+dbo.Remove0(@nSZ2,8,3)+''" x ''
	IF @nSZ3 > 110 AND @nSZ3%12 = 0
		SET @cDs = @cDs + LTRIM( STR( @nSZ3/12 ,8,0)) + '' FT '' 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ3,8,3) + ''" ''
	end	

IF @cForm = ''20''  
	begin --Wire
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Dia x ''+dbo.Remove0(@nSZ2,8,3)+''# Spool ''
	end

IF @cForm = ''21''  
	begin --CUT WIRE
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Dia x ''
	IF @nSZ2 > 110 AND @nSZ2%12 = 0
		SET @cDs = @cDs + LTRIM( STR( @nSZ2/12 ,8,0)) + '' FT '' 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) + ''" ''
	end

IF @cForm = ''22''  
	begin --LOOSE COIL 
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Dia x ''+dbo.Remove0(@nSZ2,8,3)+''# Coil ''
	end

IF @cForm = ''22''  
	begin --WIRE REEL 
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Dia x ''+dbo.Remove0(@nSZ2,8,3)+''# Reel ''
	end

IF @cForm = ''30''  
	begin --Coated Electrodes
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Dia x ''+dbo.Remove0(@nSZ2,8,3)+''" Coated Electrodes ''
	IF @nSZ3 > 0
		SET @cDs = @cDs + dbo.Remove0(@nSZ3,8,3) + ''# Can''
	end

IF @cForm = ''40''  
	begin --Plate Sheet
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''" Thick x ''+dbo.Remove0(@nSZ2,8,3) 
	IF @nSZ3 > 0
		SET @cDs = @cDs+''" x ''+dbo.Remove0(@nSZ3,8,3) 
	
	SET @cDs = @cDs+''" ''
	end

IF @cForm = ''51''  
	begin --Strip
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Thick x ''+dbo.Remove0(@nSZ2,8,3)+''" x ''+dbo.Remove0(@nSZ3,8,3)+'' Pounds Strip ''
	end

IF @cForm = ''52''  
	begin --Coil
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Thick x ''+dbo.Remove0(@nSZ2,8,3)+''" Wide ''+dbo.Remove0(@nWeight,10,1)+'' Pounds Coil ''
	end

IF @cForm = ''60''  
	begin -- Tube
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"OD x ''+dbo.Remove0(@nSZ2,8,3)+''"Wall x ''
	IF @nSZ3 > 110 AND @nSZ3%12 = 0
		SET @cDs = @cDs + LTRIM( STR( @nSZ3/12 ,8,0))+'' FT '' 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ3,8,3)+''" ''
	end

IF @cForm = ''65''  
	begin -- Pipe
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" SCH ''
	IF @nSZ2 = 0
		SET @cDs = @cDs + LTRIM(@nSZ2orig) 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) 
	
	SET @cDs = @cDs + '' x ''
	IF @nSZ3 > 110 AND @nSZ3%12 = 0
		SET @cDs = @cDs + LTRIM( STR( @nSZ3/12 ,8,0)) + '' FT '' 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ3,8,3) + ''" ''
	end

IF @cForm = ''66''  
	begin -- Nipple
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" SCH ''
	IF @nSZ2 = 0
		SET @cDs = @cDs + LTRIM(@nSZ2orig) 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) 
	
	IF @nSZ3 > 0
		SET @cDs = @cDs + '' x '' + dbo.Remove0(@nSZ3,8,3) + ''"''
	
	SET @cDs = @cDs + '' Nipple''
	end

IF @cForm = ''67''  
	begin --Elbow
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" SCH ''
	IF @nSZ2 = 0
		SET @cDs = @cDs + LTRIM(@nSZ2orig) 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) 
	
	IF @nSZ3>0
		SET @cDs = @cDs + '' x ''+ LTRIM(STR(@nSZ3,8,0)) + '' Deg''
	
	SET @cDs = @cDs + '' Elbow ''
	end

IF @cForm = ''68''  
	begin --Tee
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" SCH ''
	IF @nSZ2 = 0
		SET @cDs = @cDs + LTRIM(@nSZ2orig) 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) 
	
	SET @cDs = @cDs + '' Tee''
	end

IF @cForm = ''69''  
	begin -- Reducer
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" x ''
	IF @nSZ2 = 0
		SET @cDs = @cDs + LTRIM(@nSZ2orig) 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) 
	
	SET @cDs = @cDs + ''" Sch '' + dbo.Remove0(@nSZ3,8,3) + '' Reducer''
	end

IF @cForm = ''70''  
	begin --Fittings
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" SCH ''
	IF @nSZ2 = 0
		SET @cDs = @cDs + LTRIM(@nSZ2orig) 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) 
	
	IF @nSZ3 > 0
		SET @cDs = @cDs+'' x ''+dbo.Remove0(@nSZ3,8,3)+''"''
	
	SET @cDs = @cDs + '' Pipe Fitting''
	end

IF @cForm = ''71'' 
	begin --Coupling
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" IPS ''
	IF @nSZ2 > 0
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) + ''# Pounds''
	
	IF @nSZ3 > 0
		SET @cDs = @cDs + '' x '' + dbo.Remove0(@nSZ3,8,3) + ''" Long''
	
	SET @cDs = @cDs + '' Coupling''
	end

IF @cForm = ''72''  
	begin --Flange
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" SCH ''
	IF @nSZ2 = 0
		SET @cDs = @cDs + LTRIM(@nSZ2orig) 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) 
	
	IF @nSZ3 > 0
		SET @cDs = @cDs+'' x ''+dbo.Remove0(@nSZ3,8,3) + ''# Pounds''
	
	SET @cDs = @cDs + '' Flange''
	end

IF @cForm = ''75'' 
	begin --Fasteners
	IF @lMetric = 1
		SET @cDs = ''M'' + dbo.Remove0(@nSZ1,9,4) 
	ELSE
		SET @cDs = dbo.Remove0(@nSZ1,9,4) 	
	
	IF @nSZ2 > 0
		SET @cDs = @cDs + '' - '' + dbo.Remove0(@nSZ2,8,3) 
	
	IF @nSZ3 > 0
		SET @cDs = @cDs + '' x '' + dbo.Remove0(@nSZ3,8,3) + ''" long''
	
	SET @cDs = @cDs + '' Fastener''
	end

IF @cForm = ''80''  
	begin --Disk
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''" Thick x ''+dbo.Remove0(@nSZ2,8,3)+''"OD ''
	IF @nSZ3 > 0
		SET @cDs = @cDs + ''x '' + dbo.Remove0(@nSZ3,8,3) + ''"ID Disk''
	end

IF @cForm = ''90''  
	begin --Machined
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''" x ''+dbo.Remove0(@nSZ2,8,3)+''" x '' + dbo.Remove0(@nSZ3,8,3) + ''"''
	end

IF @cForm = ''95''  
	begin --Forge
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''" x ''+dbo.Remove0(@nSZ2,8,3)+''" x '' + dbo.Remove0(@nSZ3,8,3) + ''"''
	end

IF @cForm = ''96''  
	begin --SLAB
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''" Thick x ''+dbo.Remove0(@nSZ2,8,3) 
	IF @nSZ3 > 0
		SET @cDs = @cDs+''" x ''+dbo.Remove0(@nSZ3,8,3) 
	
	SET @cDs = @cDs+''" ''
	end

IF @cForm = ''97'' 
	begin  --Billet
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''"Dia x ''
	IF @nSZ2 > 110 AND @nSZ2%12 = 0
		SET @cDs = @cDs + LTRIM( STR( @nSZ2/12 ,8,0)) + '' FT '' 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) + ''" '' 
	
	IF @nSZ3 > 0
		begin
		IF @nSZ3 > 110 AND @nSZ3%12 = 0
			SET @cDs = @cDs + '' x ''+LTRIM( STR( @nSZ3/12 ,8,0)) + '' FT '' 
		ELSE
			SET @cDs = @cDs + '' x ''+dbo.Remove0(@nSZ3,8,3) + ''" ''	
		end
	end

IF @cForm = ''98''  
	begin --RCS
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''" Thick x ''+dbo.Remove0(@nSZ2,8,3) 
	IF @nSZ3 > 0
		SET @cDs = @cDs+''" x ''+dbo.Remove0(@nSZ3,8,3) 
	
	SET @cDs = @cDs+''" ''
	end

IF @cForm = ''96''  
	begin --INGOT
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''" Thick x ''+dbo.Remove0(@nSZ2,8,3) 
	IF @nSZ3 > 0
		SET @cDs = @cDs+''" x ''+dbo.Remove0(@nSZ3,8,3) 
	
	SET @cDs = @cDs+''" ''
	end


IF @lRL = 1
	SET @cDs = @cDs + '' R/L''



RETURN @cDs 
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetLastCall_CustomerID]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetLastCall_CustomerID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

Create FUNCTION [dbo].[f_GetLastCall_CustomerID] 
(
@cCustomerID char(20)
)

RETURNS SmallDateTime
AS
BEGIN

DECLARE @dLastCall SmallDateTime
SELECT TOP 1 @dLastCall = [Date] FROM dbo.Customer_List_Call WHERE CustomerID = @cCustomerID ORDER BY [DATE] DESC


RETURN (@dLastCall)
END


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetLastFailedMailItemID]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetLastFailedMailItemID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2013 8 6
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_GetLastFailedMailItemID] 
(

)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result int

    -- Add the T-SQL statements to compute the return value here

    SELECT @Result = (SELECT TOP 1 [mailitem_id] FROM [msdb].[dbo].[sysmail_faileditems] ORDER BY [mailitem_id] DESC)

    -- Return the result of the function

    RETURN @Result

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetMachine_Caption]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetMachine_Caption]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[f_GetMachine_Caption]
(
@cInit CHAR(1)
)
RETURNS CHAR(20)
AS
BEGIN


--SELECT dbo.f_GetMachine_Caption(''G'')
--Also See:
--SELECT dbo.f_GetMachine_Log(''GFM'')
--SELECT dbo.f_GetMachine_Table( dbo.f_GetMachine_init(''GFM'') )
--SELECT dbo.f_GetMachine_LogList() AS [Typs of Machines]

--SELECT dbo.f_GetMachine_init(''GFM'')
--SELECT dbo.f_GetMachine_List()
--See dbo.f_HeatLot_lot(Heat)

--dbo.Sales has fields Inv, GFM, Roll, Press, Mach, CG, Plasma, WJet

declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @cMachine CHAR(20) = ''''
SET @cMachine = (
            CASE
                WHEN @cInit = ''G'' THEN ''GFM''
                WHEN @cInit = ''H'' THEN ''Heat Treat'' 
				WHEN @cInit = ''L'' THEN ''Open Die''
				WHEN @cInit = ''R'' THEN ''Rolling'' 
				--WHEN @cInit = ''H'' THEN ''Hallden'' 
				WHEN @cInit = ''D'' THEN ''Draw Bench'' 
				WHEN @cInit = ''W'' THEN ''Wire Draw'' 
				WHEN @cInit = ''S'' THEN ''Swage'' 
                ELSE ''''
            END
        )

RETURN @cMachine
END



--GRANT EXECUTE ON dbo.f_GetMachine_Caption TO [WINDFALL\HPA] AS [dbo];
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetMachine_init]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetMachine_init]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[f_GetMachine_init]
(
@cMachine CHAR(20)
)
RETURNS CHAR(1)
AS
BEGIN

-- LEFT( dbo.f_HeatLot_lot(Lot),1 ) AS Mach_Init
--Also See:
--SELECT dbo.f_GetMachine_Log(''GFM'')
--SELECT dbo.f_GetMachine_Table( dbo.f_GetMachine_init(''GFM'') )
--SELECT dbo.f_GetMachine_LogList() AS [Typs of Machines]

--SELECT dbo.f_GetMachine_init(''GFM'')
--SELECT dbo.f_GetMachine_List()
--See dbo.f_HeatLot_lot(Heat)
--SELECT dbo.f_GetMachine_Caption(''G'')

--dbo.Sales has fields Inv, GFM, Roll, Press, Mach, CG, Plasma, WJet

declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @cInit CHAR(1) = ''''
SET @cInit = (
            CASE
                WHEN @cMachine = ''GFM'' THEN ''G''
                WHEN @cMachine = ''HT'' THEN ''H''
				WHEN @cMachine = ''Heat Treat'' THEN ''H''
				WHEN @cMachine = ''Open Die'' THEN ''L''
				WHEN @cMachine = ''LakeErie'' THEN ''L''
				WHEN @cMachine = ''Rolling'' THEN ''R''
				--WHEN @cMachine = ''Hallden'' THEN ''H''
				WHEN @cMachine = ''Draw Bench'' THEN ''D''
				WHEN @cMachine = ''Wire Draw'' THEN ''W''
				WHEN @cMachine = ''Wire'' THEN ''W''
				WHEN @cMachine = ''Swage'' THEN ''S''
				WHEN @cMachine = ''Hallden'' THEN ''S''
                ELSE ''''
            END
        )

RETURN @cInit
END



--GRANT EXECUTE ON [dbo].[f_GetMachine_init] TO [WINDFALL\HPA] AS [dbo];
--GRANT EXECUTE ON dbo.f_GetMachine_init TO [WINDFALL\HPA Reports] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetMachine_Log]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetMachine_Log]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[f_GetMachine_Log]
(
@cMachine CHAR(20)
)
RETURNS VARCHAR(50)
AS
BEGIN
--Return Log Table for Machine Name

--SELECT dbo.f_GetMachine_Log(''GFM'')
--Also See:
--SELECT dbo.f_GetMachine_Log(''GFM'')
--SELECT dbo.f_GetMachine_Table( dbo.f_GetMachine_init(''GFM'') )
--SELECT dbo.f_GetMachine_LogList() AS [Typs of Machines]

--SELECT dbo.f_GetMachine_init(''GFM'')
--SELECT dbo.f_GetMachine_Caption(''G'')
--SELECT dbo.f_GetMachine_List()
--See dbo.f_HeatLot_lot(Heat)

declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @cMachineTable VARCHAR(50) = ''''
IF @cMachine = ''GFM''
	SET @cMachineTable = ''dbo.GFMlog''
ELSE IF @cMachine = ''HT''
	SET @cMachineTable = ''dbo.HT_log'' 
ELSE IF @cMachine = ''Heat Treat''
	SET @cMachineTable = ''dbo.HT_log'' 
ELSE IF @cMachine = ''Open Die'' OR @cMachine = ''LakeErie''
	SET @cMachineTable = ''dbo.LakeErie_log''
ELSE IF @cMachine = ''Rolling''
	SET @cMachineTable = ''dbo.Roll_log'' 

ELSE IF @cMachine = ''Draw Bench'' OR @cMachine = ''Draw''
	SET @cMachineTable = ''dbo.Draw_log'' 

ELSE IF @cMachine = ''Wire Draw'' OR @cMachine = ''Wire''
	SET @cMachineTable = ''dbo.Wire_log'' 
ELSE IF @cMachine = ''Swage''
	SET @cMachineTable = ''dbo.Swage_log'' 
        
RETURN @cMachineTable
END



--GRANT EXECUTE ON dbo.f_GetMachine_Log TO [WINDFALL\HPA] AS [dbo];
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetMachine_Log_Parse]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetMachine_Log_Parse]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[f_GetMachine_Log_Parse]
(
@cString VARCHAR( MAX )
)
RETURNS VARCHAR(50)
AS
BEGIN
--Return Machine and Lot without HPA 

--SELECT dbo.f_GetMachine_Log_Parse(Misc_Purch)
--SELECT dbo.f_GetMachine_Log_Parse(''NOTE: NADCAP REQUIREMENTS APPLY TO THIS ORDER!    1. Perform tensile, hardness, grain size, and IGC testing IAW AMS 5656, ASTM A276, and ASTM A479 as applicable   Heat#: 65537-1R; Lot#: HPA G5739.      2. Report shall include tensile, elongation (2"), reduction of area, hardness, grain size, IGC, and location of fracture.  Report shall also include actual strain rate (NADCAP), location of tensile sample taken (i.e., center, mid-radius, in accordance with AMS 2371) as well as stress-strain curves.  Target values shall conform to AMS 5656, ASTM A276 (COND A), and ASTM A479 (COND A).    3. Current revisions af all applicable specifications are to be used.    4. Delivery shall be STANDARD.    5.  E-mail report when completed to:    labresults@ERP_1s.com    6. Return samples and test specimens when finished to:    444 Wilson St.  Tipton, IN 46072  UPS ACCT NO. 4F942R                                                           '')
--G5739.
--SELECT dbo.f_GetMachine_Log_Parse(''NOTE: NADCAP REQUIREMENTS APPLY TO THIS ORDER!    REVISED TO UPGRADE DELIVERY TO NEXT-DAY EXPEDITED - DLM 10/16/2012    1. Perform chemical analysis, tensile, and Brinell hardness testing in accordance with ASTM A276, ASTM A479, and AMS 5848.  Heat#: HPA ET 3; Lot#: HPA G2884.  Sample as provided is ANNEALED.    2.  Perform grain size testing in accordance with ASTM A479.  Heat#: HPA ET 3; Lot#: HPA G2884.  Sample as provided is ANNEALED.    3.  Perform intergranular corrosion testing (ASTM A262) in accordance with ASTM A479 and AMS 5848.  Heat#: HPA ET 3; Lot#: HPA G2884.  Sample as provided is ANNEALED.         4. Report shall include chemistry data, tensile, elongation, reduction of area, hardness (Brinell), location of fracture, grain size, and IGC results.  Microanalysis photos must be included.  Test results shall conform to ASTM A276 (ANNEALED), ASTM A479 (ANNEALED), and AMS 5848 (ANNEALED) as applicable.    5. Current revisions af all applicable specifications are to be used unless otherwise specified.    6. Delivery shall be NEXT-DAY EXPEDITED.  HPA authorizes upcharge.    7. Return samples and test specimens when finished to:    444 Wilson St.  Tipton, IN 46072  UPS ACCT NO. 4F942R '')
--SELECT dbo.f_GetMachine_Log_Parse(''G12345 G1234'')
declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @cMachineLog VARCHAR(10) = ''''
SET @cString = TRIM(@cString)

DECLARE @nLen INT = LEN(@cString)
DECLARE @nRight INT = PATINDEX(''%HPA%'',@cString)+3

IF @cString LIKE ''%HPA%'' AND @nLen-@nRight > 4
	begin
--	Print ''Removes the HPA A''
--	PRINT @cString
	SET @cString = LTRIM(RIGHT(@cString,@nLen-@nRight) )
--	PRINT @cString
	end

--Check again for HPA
--Locate ''HPA '' and remove from string
IF @cString LIKE ''%HPA %''
	begin
--	Print ''Removes the HPA B Space''
--	PRINT @cString
	SET @cString = TRIM(SUBSTRING(@cString,PATINDEX(''%HPA %'',@cString)+4,5))
--	PRINT @cString
	end

/*IF @cString LIKE ''%HPA%''
	begin
--	Print ''Removes the HPA C again''
--	PRINT @cString
	SET @cString = TRIM(SUBSTRING(@cString,PATINDEX(''%HPA%'',@cString)+3,5))
--	PRINT @cString
	end */


IF @cString LIKE ''[DGHLRSW]%''
	begin
--	PRINT ''[DGHLRSW]--first letter is Machine Init''
	
	SET @cString = @cString + '' ''
	IF @cString LIKE ''[DGHLRSW][0-9][0-9][0-9][0-9] %''
		begin
--		PRINT ''[DGHLRSW][0-9][0-9][0-9][0-9]% --first letter is Machine Init with Space''
--		PRINT ''cSTRING :''+@cString

		SET @nLen = LEN(@cString)
--		PRINT @nLen
		SET @nRight = PATINDEX(''[DGHLRSW][0-9][0-9][0-9][0-9] %'',@cString)+4
--		PRINT @nRight
		SET @cMachineLog = TRIM( LEFT(@cString,@nRight) )
--		PRINT ''cMachineLog ''+@cMachineLog
		end
	ELSE
	IF @cString LIKE ''[DGHLRSW][0-9][0-9][0-9][0-9]%''
		begin
--		PRINT ''[DGHLRSW][0-9][0-9][0-9][0-9]% --first letter is Machine Init without space''
--		PRINT ''cSTRING :''+@cString
		--SET @cMachineLog = TRIM(SUBSTRING(@cString,PATINDEX(''[DGHLRSW][0-9][0-9][0-9][0-9]%'',@cString)+9,6))
		SET @nLen = LEN(@cString)
--		PRINT @nLen
		SET @nRight = PATINDEX(''[DGHLRSW][0-9][0-9][0-9][0-9]%'',@cString)+4
--		PRINT @nRight
		SET @cMachineLog = TRIM( LEFT(@cString,@nRight) )
--		PRINT ''cMachineLog ''+@cMachineLog
		end

	end
ELSE
	IF @cString LIKE ''%HPA %''
		begin
		--Check again for HPA
		--Locate ''HPA '' and remove from string
	--	Print ''Removes the HPA B Space''
	--	PRINT @cString
		SET @cString = TRIM(SUBSTRING(@cString,PATINDEX(''%HPA %'',@cString)+4,5))
	--	PRINT @cString
		end

SET @cString = @cString+'' ''
IF @cString LIKE ''%[DGHLRSW][0-9][0-9][0-9][0-9] %''
	begin
--	PRINT ''[DGHLRSW][0-9][0-9][0-9][0-9] % --Machine Init is not first letter''
--	PRINT @cString
	SET @nLen = LEN(@cString)
--	PRINT @nLen
	IF LEN(@cString) > 5
		begin
		SET @nRight = PATINDEX(''[DGHLRSW][0-9][0-9][0-9][0-9] %'',@cString)+4
--		PRINT @nRight
--		PRINT RIGHT(@cString,@nLen-@nRight)

		SET @cMachineLog = TRIM( RIGHT(@cString,@nLen-@nRight) )
--		PRINT ''cMachineLog ''+@cMachineLog
		end

	ELSE	
		SET @cMachineLog = TRIM( @cString )
	end


--See if Initial is possible, return ''''
IF LEN(dbo.f_GetMachine_Table(LEFT(@cMachineLog,1))) = 0
	RETURN ''''

--whitle down the Log number
IF RIGHT(@cMachineLog,1) NOT LIKE ''[0-9]'' AND LEN(@cMachineLog) > 2
	SET @cMachineLog = LEFT(@cMachineLog,LEN(@cMachineLog)-1)

IF RIGHT(@cMachineLog,1) NOT LIKE ''[0-9]'' AND LEN(@cMachineLog) > 2
	SET @cMachineLog = LEFT(@cMachineLog,LEN(@cMachineLog)-1)

IF RIGHT(@cMachineLog,1) NOT LIKE ''[0-9]'' AND LEN(@cMachineLog) > 2
	SET @cMachineLog = LEFT(@cMachineLog,LEN(@cMachineLog)-1)

IF RIGHT(@cMachineLog,1) NOT LIKE ''[0-9]'' AND LEN(@cMachineLog) > 2
	SET @cMachineLog = LEFT(@cMachineLog,LEN(@cMachineLog)-1)


RETURN @cMachineLog
END



--GRANT EXECUTE ON dbo.f_GetMachine_Log_Parse TO [WINDFALL\HPA] AS [dbo];
--GRANT EXECUTE ON dbo.f_GetMachine_Log_Parse TO [WINDFALL\HPA Reports] AS [dbo];
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetMachine_LogList]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetMachine_LogList]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[f_GetMachine_LogList]
(
)
RETURNS VARCHAR(255)
AS
BEGIN


--SELECT dbo.f_GetMachine_LogList() AS [ANS]

--SELECT dbo.f_GetMachine_Table( dbo.f_GetMachine_init(''GFM'') ) --''GFMlog''

-- was "SELECT ANS,UN FROM dbo.AppSetup WITH(NOLOCK) 
-- WHERE PRP = ''Production Machine''"

--dbo.Sales has fields Inv, GFM, Roll, Press, Mach, CG, Plasma, WJet

declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @cMachineList VARCHAR(255) = ''''
SET @cMachineList =					''Draw Bench''
SET @cMachineList = @cMachineList + '',GFM''
SET @cMachineList = @cMachineList + '',HT'' 
SET @cMachineList = @cMachineList + '',LakeErie''
SET @cMachineList = @cMachineList + '',Roll'' 

SET @cMachineList = @cMachineList + '',Wire'' 
SET @cMachineList = @cMachineList + '',Swage'' 
                
        
RETURN @cMachineList
END
 


--GRANT EXECUTE ON dbo.f_GetMachine_LogList TO [WINDFALL\HPA] AS [dbo];
--GRANT EXECUTE ON dbo.f_GetMachine_LogList TO [WINDFALL\HPA Reports] AS [dbo];



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetMachine_Lot]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetMachine_Lot]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[f_GetMachine_Lot]
(
	@cMachine CHAR(20)
	,@Lot INT
)
RETURNS CHAR(7)
AS
BEGIN

--CAST( RIGHT(dbo.f_HeatLot_lot(Lot),LEN(dbo.f_HeatLot_lot(Lot))-1) AS INT ) AS Mach_Log


--SELECT dbo.f_GetMachine_Lot(''Machine'',''Lot'') AS [ANS] --for Report use
--SELECT dbo.f_GetMachine_Lot(''GFM'',2000) = ''G2000''
--SELECT dbo.f_GetMachine_Table( dbo.f_GetMachine_init(''GFM'') ) = ''GFMlog''

-- was "SELECT ANS,UN FROM dbo.AppSetup WITH(NOLOCK) WHERE PRP = ''Production Machine''"

--dbo.Sales has fields Inv, GFM, Roll, Press, Mach, CG, Plasma, WJet

--dbo.f_ProperLot(Lot)

--SELECT dbo.f_Get_LOG_fromLot(''G5781'') -- 5781
--SELECT dbo.f_Get_Machine_fromLot(''G5781'') --''G''

declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @cMachineLot CHAR(7) = ''''

IF ISNULL(@Lot,0) = 0
	SET @cMachineLot = ''''
ELSE
	SET @cMachineLot = dbo.f_GetMachine_init(@cMachine) + TRIM(CAST(@Lot AS CHAR(6)))


RETURN @cMachineLot
END
 


--GRANT EXECUTE ON dbo.f_GetMachine_Lot TO [WINDFALL\HPA] AS [dbo];
--GRANT EXECUTE ON dbo.f_GetMachine_Lot TO [WINDFALL\HPA Reports] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetMachine_Table]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetMachine_Table]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[f_GetMachine_Table]
(
@cInit CHAR(1)
)
RETURNS CHAR(20)
AS
BEGIN


--SELECT dbo.f_GetMachine_Table(''G'')
--SELECT dbo.f_GetMachine_Table( dbo.f_GetMachine_init(''GFM'') )

--SELECT dbo.f_GetMachine_Log()
--SELECT dbo.f_GetMachine_LogList() AS [ANS]

--dbo.Sales has fields Inv, GFM, Roll, Press, Mach, CG, Plasma, WJet

declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @cMachine CHAR(20) = ''''
SET @cMachine = (
            CASE
				WHEN @cInit = ''D'' THEN ''Draw_log''
                WHEN @cInit = ''G'' THEN ''GFMlog''
                WHEN @cInit = ''H'' THEN ''HT_log'' 
				WHEN @cInit = ''L'' THEN ''LakeErie_log''
				WHEN @cInit = ''R'' THEN ''Roll_log''  
				WHEN @cInit = ''W'' THEN ''Wire_log'' 
				WHEN @cInit = ''S'' THEN ''Swage_log'' 

				ELSE ''''
            END
        )

RETURN @cMachine
END



--GRANT EXECUTE ON dbo.f_GetMachine_Table TO [WINDFALL\HPA] AS [dbo];
--GRANT EXECUTE ON dbo.f_GetMachine_Table TO [WINDFALL\HPA Reports] AS [dbo];
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetMWeight_BrokerLst_ID]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetMWeight_BrokerLst_ID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'



CREATE FUNCTION [dbo].[f_GetMWeight_BrokerLst_ID]
(
@ID INT
)
RETURNS Decimal(18,8)
AS
BEGIN
--Get sum Weight of Details of Master ID
--use to keep MWeight bucket filled.

--SELECT dbo.f_GetMWeight_BrokerLst_ID (12345)
DECLARE @MWeight Decimal(18,8)

declare @err int,
        @RC int
set @err = 0
set @rc = 0

SET @MWeight = 0
--weight is depricated, use S_QTY
SELECT @MWeight = SUM( IIF(BrokerLst_Detail.Weight=0,BrokerLst_Detail.S_QTY,BrokerLst_Detail.Weight) )
	FROM dbo.BrokerLst_Detail 
	WHERE [ID] = @ID

RETURN @MWeight
END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetMWeight_StockLst_ID]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetMWeight_StockLst_ID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'



CREATE FUNCTION [dbo].[f_GetMWeight_StockLst_ID]
(
@ID INT
)
RETURNS Decimal(18,8)
AS
BEGIN
--Get sum Weight of Details of Master ID
--use to keep MWeight bucket filled.

--SELECT dbo.f_GetMWeight_StockLst_ID(23428)
--SELECT dbo.f_GetMWeight_StockLst-ID (12345)
-- trigger StockLst_Detail_After_Update uses f_GetMWeight_StockLst_ID(ID)

--Also see: dbo.f_Calc_mS_QTY_StockLst_ID(ID)

/*  Find problems
SELECT ID, MWeight, dbo.f_Calc_mS_QTY_StockLst_ID(ID) AS SumS_QTY
FROM dbo.Stocklst_Master 
WHERE (MWeight+10)*1.2 < dbo.f_Calc_mS_QTY_StockLst_ID(ID)+10
OR MWeight+10 > (dbo.f_Calc_mS_QTY_StockLst_ID(ID)+10)*1.2
*/

DECLARE @MWeight Decimal(18,8)

declare @err int,
        @RC int
set @err = 0
set @rc = 0

SET @MWeight = 0
--weight is depricated, use S_QTY
--SELECT @MWeight = SUM( IIF(StockLst_Detail.Weight=0, StockLst_Detail.S_QTY, StockLst_Detail.Weight) ) 
SELECT @MWeight = SUM( StockLst_Detail.S_QTY ) 
	FROM dbo.StockLst_Detail 
	WHERE [ID] = @ID

RETURN @MWeight
END



--GRANT EXECUTE ON [dbo].[f_GetMWeight_StockLst_ID] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetMWeight_WIPLst_ID]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetMWeight_WIPLst_ID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'



create FUNCTION [dbo].[f_GetMWeight_WIPLst_ID]
(
@ID INT
)
RETURNS Decimal(18,8)
AS
BEGIN
--Get sum Weight of Details of Master ID
--use to keep MWeight bucket filled.

--SELECT dbo.f_GetMWeight_WIPLst_ID(12345)
DECLARE @MWeight Decimal(18,8)

declare @err int,
        @RC int
set @err = 0
set @rc = 0

SET @MWeight = 0
--weight is depricated, use S_QTY
SELECT @MWeight = SUM( IIF(WIPLst_Detail.Weight=0, WIPLst_Detail.S_QTY, WIPLst_Detail.Weight) ) 
	FROM dbo.WIPLst_Detail 
	WHERE [ID] = @ID

RETURN @MWeight
END



--GRANT EXECUTE ON [dbo].[f_GetMWeight_WIPLst_ID] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetPcsShipped_SOitem]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetPcsShipped_SOitem]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_GetPcsShipped_SOitem]
(
@SOitem CHAR(10)
)
RETURNS INT
AS
BEGIN
--SELECT dbo.f_GetPcsShipped_SOitem(''  69028-02'')
--Return PCS shipped in PackingSlip for this SOitem.

DECLARE @nPCS INT

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @nPCS = 0

SELECT @nPCS = SUM(PCs) 
	FROM dbo.PackingSlip p 
	WHERE p.SOitem = @SOitem
		AND ISNULL(p.Cancld,0) = 0 

RETURN ISNULL(@nPCS,0)
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetPOCost_SOitem]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetPOCost_SOitem]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_GetPOCost_SOitem]
(
@SOitem CHAR(10)
)
RETURNS MONEY
AS
BEGIN
--SELECT dbo.f_GetPOCost_SOitem(''  69028-02'')
--Return PO summary for all PO item for this SOitem.

DECLARE @nCost MONEY

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @nCost = 0

SELECT @nCost = SUM(dbo.f_GetPOItem_Total(p.POitem)) 
	FROM dbo.PurchaseOrder p 
	WHERE p.SOitem = @SOitem
		--AND ISNULL(p.Equipment,0) = 0 
		AND p.cancelled = 0

RETURN ISNULL(@nCost,0)
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetPOItem_P_Unit]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetPOItem_P_Unit]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[f_GetPOItem_P_Unit]
(
@cPOitem CHAR(12)
)
RETURNS Money

AS
BEGIN

--SELECT dbo.f_GetPOItem_Total(''498024-01'')
DECLARE @nReturnP_Unit MONEY

declare @err int,
        @RC int

set @err = 0
set @rc = 0


SELECT @nReturnP_Unit =
	CASE WHEN ISNULL(Lotp,0) > 0 THEN Lotp ELSE 
	CASE WHEN ISNULL(P_LB,0) > 0 THEN P_LB ELSE 
	CASE WHEN ISNULL(P_PC,0) > 0 THEN P_PC ELSE
	CASE WHEN ISNULL(P_FT,0) > 0 THEN P_FT ELSE 0
	END END END END 
	FROM dbo.PurchaseOrder
	WHERE POitem = dbo.ProperPO( @cPOitem )


RETURN @nReturnP_Unit
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetPOItem_TBL]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetPOItem_TBL]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[f_GetPOItem_TBL]
(
@cPOitem CHAR(12)
)
RETURNS CHAR(1)

AS
BEGIN

--SELECT dbo.f_GetPOItem_TBL(''498024-01'')
DECLARE @cTBL CHAR(1)

declare @err int,
        @RC int

set @err = 0
set @rc = 0



SELECT TOP 1 @cTBL = def.TBL
	FROM dbo.PurchaseOrder P
	INNER JOIN dbo.PO_StockLst_Def def ON def.Stock = P.Stock AND def.ShipWhere = P.ShipWhere
		WHERE P.POitem = dbo.ProperPO( @cPOitem )
	 

/*

IF lServicesPO
	IF cTBL = "N"
		lOK = .T.
		RETURN lOK
	ENDIF
ENDIF

IF lEquipment
	IF cTBL = "N"
		lOK = .T.
		RETURN lOK
	ENDIF
ENDIF

IF lIntP		&&depricated
	IF cTBL = "N"
		lOK = .T.
		RETURN lOK
	ENDIF
ENDIF

IF lConvServ
	*ConvServ would be of Stock, Service has no stock
	IF cTBL = "N"
		lOK = .F.
		RETURN lOK
	ENDIF
ENDIF



SELECT @cTBL =
	CASE WHEN ISNULL(Lotp,0) > 0 THEN Lotp ELSE 
	CASE WHEN ISNULL(P_LB,0) > 0 THEN P_LB ELSE 
	CASE WHEN ISNULL(P_PC,0) > 0 THEN P_PC ELSE
	CASE WHEN ISNULL(P_FT,0) > 0 THEN P_FT ELSE 0
	END END END END 
	FROM dbo.PurchaseOrder
	WHERE POitem = dbo.ProperPO( @cPOitem )
*/

RETURN @cTBL
END

-- GRANT EXECUTE ON [dbo].[f_GetPOItem_P_Unit] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetPOItem_Total]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetPOItem_Total]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

/****** Object:  Stored Procedure dbo.p_StandardSize    Script Date: 12/2/2005 2:04:26 PM ******/


CREATE FUNCTION [dbo].[f_GetPOItem_Total]
(
@cPOitem CHAR(12)
)
RETURNS Money

AS
BEGIN
--Depreciated. 
--use PurchaseOrder.StockLst_Qty * PurchaseOrder.StockLst_P
-- Lotp, P_LB, P_Pc, P_Ft is only used for Vendor pricing- Not HPA Standard pricing

--SELECT dbo.f_GetPOItem_Total(''498024-01'')

DECLARE @nPOitemTotal MONEY

declare @err int,
        @RC int

set @err = 0
set @rc = 0


SELECT @nPOitemTotal =
	CASE WHEN ISNULL(ReconcileTotal,0) > 0 THEN ReconcileTotal ELSE
		CASE WHEN ISNULL(Order_Qty*Order_P,0) > 0 THEN (Order_Qty*Order_P) ELSE 
			CASE WHEN ISNULL(Lotp,0) > 0 THEN Lotp ELSE 
				CASE WHEN ISNULL(P_LB,0) > 0 AND ISNULL(Order_Qty,0)>0 THEN Order_Qty*P_LB+ISNULL(OtherP,0) ELSE 
					CASE WHEN ISNULL(P_PC,0) > 0 AND ISNULL(Order_Qty,0)>0 THEN Order_Qty*P_PC+ISNULL(OtherP,0) ELSE
						CASE WHEN ISNULL(P_FT,0) > 0 AND ISNULL(Order_Qty,0)>0 THEN Order_Qty*P_FT+ISNULL(OtherP,0) ELSE 0
	END END END END END END
	FROM dbo.PurchaseOrder
	WHERE POitem = dbo.ProperPO( @cPOitem )


RETURN @nPOitemTotal
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetPrice]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetPrice]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_GetPrice]
(
@cAlloy char(12),
@cForm CHAR(2),
@nThickness DECIMAL(9,4),
@nSize2 DECIMAL(9,3),
@nSize3 DECIMAL(9,3),
@nWeight DECIMAL(7,1)
)

RETURNS DECIMAL(7,2)  --Price per LB
AS
BEGIN
--PRINT dbo.f_GetPrice(''C-276'',''40'',1,12,48,10)
--Print dbo.f_GetPrice(Alloy,Form, dbo.f_SizeStandard(Thck),Sz2,Sz3,Weight)
--dbo.f_GetPrice(Alloy,Form,Thck,Sz2,Sz3,Weight) --Return P_LB
--PRINT dbo.f_GetWeight(''1'',''C-276'',''40'',1,12,48,Weight)
--*** INGNORES Condition Code CC ***
-- use dbo.f_GetPriceCC for CC

--SET NOCOUNT ON

DECLARE @nUnitPrice as DECIMAL(7,2)
DECLARE @Bracket Int
DECLARE @cMessage as VARCHAR(2000)
SET @cMessage = ''''

IF @nWeight < 5
	begin
	SELECT @nUnitPrice = w0 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm and thk=@nThickness
	SET @Bracket   = 1
	end
ELSE
IF @nWeight >= 5 AND @nWeight < 10
	begin
	SELECT @nUnitPrice = w5 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm and thk=@nThickness
	SET @Bracket   = 2
	end
ELSE
IF @nWeight >= 10 AND @nWeight < 20
	begin
	SELECT @nUnitPrice = w10 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm and thk=@nThickness
	SET @Bracket   = 3
	end
ELSE
IF @nWeight >= 20 AND @nWeight < 50
	begin
	SELECT @nUnitPrice = w25 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm and thk=@nThickness
	SET @Bracket   = 4
	end
ELSE
IF @nWeight >= 50 AND @nWeight < 100
	begin
	SELECT @nUnitPrice = w50 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm and thk=@nThickness
	SET @Bracket   = 5
	end
ELSE
IF @nWeight >= 100 AND @nWeight < 200
	begin
	--w100
	SET @Bracket   = 6
	end
ELSE
IF @nWeight >= 200 AND @nWeight < 500
	begin
	--w200
	SET @Bracket   = 7
	end
ELSE
IF @nWeight >= 500 AND @nWeight < 1000
	begin
	--w500
	SET @Bracket   = 8
	end
ELSE
IF @nWeight >= 1000 AND @nWeight < 2000
	begin
	--w1000
	SET @Bracket   = 9
	end
ELSE
IF @nWeight >= 2000 AND @nWeight < 5000
	begin
	--w2000
	SET @Bracket   = 0
	end
ELSE
	begin
	SET @nUnitPrice = 0
	SET @Bracket   = 0
	end



RETURN @nUnitPrice
END

-- GRANT EXECUTE ON [dbo].[f_GetPrice] TO [WINDFALL\HPA] AS [dbo];

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetPrice_ID_Detail]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetPrice_ID_Detail]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_GetPrice_ID_Detail]
( @nID_Detail INT
)
/*@cAlloy char(12),
@cForm CHAR(2),
@cCC CHAR(1),
@cCL CHAR(1),
@nThickness DECIMAL(9,4),
@nSize2 DECIMAL(9,3),
@nSize3 DECIMAL(9,3),
@nWeight DECIMAL(7,1)
*/

RETURNS DECIMAL(7,2)
AS
BEGIN
--PRINT dbo.f_GetPrice_ID_Detail(8997) 
--PRINT dbo.f_GetPrice_ID_Detail(6181) 
--used in StockLst_Detail Edit to verify against PriceTable.

--SET NOCOUNT ON

DECLARE @nBook_P as DECIMAL(7,2)

SELECT @nBook_P = dbo.f_GetPriceCC_CL(M.Alloy,M.Form,M.CC,M.CL, dbo.f_SizeStandard(M.Size),D.Dim2,D.Dim3,D.S_QTY )
	FROM dbo.StockLst_Detail D
	INNER JOIN dbo.StockLst_Master M ON D.ID = M.ID
	AND D.ID_Detail = @nID_Detail


RETURN ISNULL(@nBook_P,0)
END



--GRANT EXECUTE ON [dbo].[f_GetPrice_ID_Detail] TO [WINDFALL\Quotes] AS [dbo];
--GRANT EXECUTE ON [dbo].[f_GetPrice_ID_Detail] TO [WINDFALL\HPA] AS [dbo];
--GRANT EXECUTE ON [dbo].[f_GetPrice_ID_Detail] TO [HPA_Service] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetPrice_Lot]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetPrice_Lot]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[f_GetPrice_Lot] 
(
@nPieces INT,
@cAlloy char(12),
@cForm CHAR(2),
@cCC CHAR(1),
@cCL CHAR(1),
@nThickness DECIMAL(11,4),
@nSize2 DECIMAL(10,3),
@nSize3 DECIMAL(10,3)
)
--RETURNS DECIMAL(7,1)
RETURNS REAL
AS
BEGIN
--PRINT dbo.[f_GetPrice_Lot](''1'',''C-276'',''10'',''7'',4,1.25,72)
--PRINT dbo.[f_GetPrice_Lot](Pieces,Alloy,Form,CC,CL,StndThck,Sz2,Sz3)
--CALLS f_Get_Weight
--CALLS f_GetPriceCC_CL
-- Returns LotP of P*LBS  --usefull for McMaster
--SET NOCOUNT ON

DECLARE @nPriceLot MONEY = 0
DECLARE @nPounds as REAL = 0

DECLARE @cMessage as VARCHAR(2000)
SET @cMessage = ''''

IF @nPieces < 1
	SET @nPieces = 1


SET @nPounds = ISNULL( dbo.f_Get_Weight(@nPieces,@cAlloy,@cForm,@cCC,@nThickness,@nSize2,@nSize3,0) ,0)
 
DECLARE @lnSurcharge REAL
SELECT @lnSurcharge = dbo.Alloy_Surcharge(@cAlloy)

DECLARE @nStdSize DECIMAL(9,4)
SET @nStdSize = dbo.f_PriceTableStandard(@cAlloy,@cForm,@cCC,@nThickness)

DECLARE @nPrice MONEY = 0
SET @nPrice = dbo.f_GetPriceCC_CL(@cAlloy,@cForm,@cCC,@cCL,@nStdSize,@nSize2,@nSize3,@nPounds)

SET @nPriceLot = ISNULL(@nPounds,1) * ISNULL(@nPrice,0)

RETURN @nPriceLot

END

--GRANT EXECUTE ON [dbo].[f_GetPrice_Lot] TO [WINDFALL\HPA] AS [dbo];



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetPrice_PC]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetPrice_PC]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[f_GetPrice_PC] 
(
@nPieces INT,
@cAlloy char(12),
@cForm CHAR(2),
@cCC CHAR(1),
@cCL CHAR(1),
@nThickness DECIMAL(11,4),
@nSize2 DECIMAL(10,3),
@nSize3 DECIMAL(10,3)
)
--RETURNS DECIMAL(7,1)
RETURNS REAL
AS
BEGIN
--PRINT dbo.[f_GetPrice_PC](''1'',''C-276'',''10'',''7'',4,1.25,72)
--PRINT dbo.[f_GetPrice_PC](Pieces,Alloy,Form,CC,CL,StndThck,Sz2,Sz3)
--CALLS f_Get_Weight
--CALLS f_GetPriceCC_CL
-- Returns Price/PC  --usefull for McMaster
--SET NOCOUNT ON

DECLARE @nPrice_PC MONEY = 0
DECLARE @nPriceLot MONEY = 0
DECLARE @nPounds as REAL = 0

DECLARE @cMessage as VARCHAR(2000)
SET @cMessage = ''''

IF @nPieces < 1
	SET @nPieces = 1


SET @nPounds = ISNULL( dbo.f_Get_Weight(@nPieces,@cAlloy,@cForm,@cCC,@nThickness,@nSize2,@nSize3,0) ,0)
 
DECLARE @lnSurcharge REAL
SELECT @lnSurcharge = dbo.Alloy_Surcharge(@cAlloy)

DECLARE @nStdSize DECIMAL(9,4)
SET @nStdSize = dbo.f_PriceTableStandard(@cAlloy,@cForm,@cCC,@nThickness)

DECLARE @nPrice MONEY = 0
SET @nPrice = dbo.f_GetPriceCC_CL(@cAlloy,@cForm,@cCC,@cCL,@nStdSize,@nSize2,@nSize3,@nPounds)

SET @nPriceLot = ISNULL(@nPounds,1) * ISNULL(@nPrice,0)
SET @nPrice_PC = @nPriceLot/@nPieces

RETURN @nPrice_PC

END

--GRANT EXECUTE ON [dbo].[f_GetPrice_PC] TO [WINDFALL\HPA] AS [dbo];



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetPriceCC]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetPriceCC]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_GetPriceCC]
(
@cAlloy char(12),
@cForm CHAR(2),
@cCC CHAR(1),
@nThickness DECIMAL(9,4),
@nSize2 DECIMAL(9,3),
@nSize3 DECIMAL(9,3),
@nWeight DECIMAL(7,1)
)

RETURNS DECIMAL(7,2)
AS
BEGIN
--PRINT dbo.f_GetPriceCC(''C-276'',''40'',''1'',1,12,48,10)
--Print dbo.f_GetPriceCC(Alloy,Form,cc, dbo.f_SizeStandard(Thck),Sz2,Sz3,Weight)
--PRINT dbo.f_GetWeight(''1'',''C-276'',''40'',1,12,48)

--PRINT dbo.f_GetPriceCC(''6B   '',''10'',''1'', .375,6,0,.25) 

--SET NOCOUNT ON

DECLARE @nUnitPrice as DECIMAL(7,2)
DECLARE @Bracket Int
DECLARE @cMessage as VARCHAR(2000)
SET @cMessage = ''''

----------------------
DECLARE @cCCorig CHAR(1)
SET @cCCorig = @cCC

DECLARE @cCCAdjust CHAR(1)
SET @cCCAdjust = ''0''
DECLARE @nAdjust NUMERIC(18,9)

IF @cCC = ''A''
	begin
	SET @cCCAdjust = ''A''
	SELECT TOP 1 @nAdjust = [A] FROM dbo.ConditionCodeAdjust WITH(NOLOCK) 
	SET @cCC = ''2''
	end
ELSE
IF @cCC = ''B''
	begin
	SET @cCCAdjust = ''B''
	SELECT TOP 1 @nAdjust = [B] FROM dbo.ConditionCodeAdjust WITH(NOLOCK) 
	SET @cCC = ''2''
	end
IF @cCC = ''C''
	begin
	SET @cCCAdjust = ''C''
	SELECT TOP 1 @nAdjust = [C] FROM dbo.ConditionCodeAdjust WITH(NOLOCK) 
	SET @cCC = ''2''
	end
ELSE
IF @cCC = ''D''
	begin
	SET @cCCAdjust = ''D''
	SELECT TOP 1 @nAdjust = [D] FROM dbo.ConditionCodeAdjust WITH(NOLOCK) 
	SET @cCC = ''2''
	end
ELSE
IF @cCC = ''E''
	begin
	SET @cCCAdjust = ''E''
	SELECT TOP 1 @nAdjust = [E] FROM dbo.ConditionCodeAdjust WITH(NOLOCK) 
	SET @cCC = ''2''
	end
IF @cCC = ''F''
	begin
	SET @cCCAdjust = ''F''
	SELECT TOP 1 @nAdjust = [F] FROM dbo.ConditionCodeAdjust WITH(NOLOCK) 
	SET @cCC = ''2''
	end
IF @cCC = ''S''
	begin
	SET @cCCAdjust = ''S''
	SELECT TOP 1 @nAdjust = [S] FROM dbo.ConditionCodeAdjust WITH(NOLOCK) 
	SET @cCC = ''2''
	end
IF @cCC = ''T''
	begin
	SET @cCCAdjust = ''T''
	SELECT TOP 1 @nAdjust = [T] FROM dbo.ConditionCodeAdjust WITH(NOLOCK) 
	SET @cCC = ''2''
	end
IF @cCC = ''U''
	begin
	SET @cCCAdjust = ''U''
	SELECT TOP 1 @nAdjust = [U] FROM dbo.ConditionCodeAdjust WITH(NOLOCK) 
	SET @cCC = ''2''
	end
IF @cCC = ''V''
	begin
	SET @cCCAdjust = ''V''
	SELECT TOP 1 @nAdjust = [V] FROM dbo.ConditionCodeAdjust WITH(NOLOCK) 
	SET @cCC = ''2''
	end
IF @cCC = ''W''
	begin
	SET @cCCAdjust = ''W''
	SELECT TOP 1 @nAdjust = [W] FROM dbo.ConditionCodeAdjust WITH(NOLOCK) 
	SET @cCC = ''2''
	end
IF @cCC = ''X''
	begin
	SET @cCCAdjust = ''X''
	SELECT TOP 1 @nAdjust = [X] FROM dbo.ConditionCodeAdjust WITH(NOLOCK) 
	SET @cCC = ''2''
	end

---------------------------------------------------
--Use the N60 Cold Work Chart for N50 Cold Work
IF @cAlloy = ''HPA N50''
	SELECT @cAlloy = ''HPA N60'' 
		WHERE @cCCorig = ''T'' 
		OR @cCCorig = ''U'' 
		OR @cCCorig = ''V'' 
		OR @cCCorig = ''W'' 
		OR @cCCorig = ''X'' 

---------------------------------------------------

IF @nWeight < 5
	begin
	SELECT @nUnitPrice = w0 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC and [Size]=@nThickness
	SET @Bracket   = 1
	end
ELSE
IF @nWeight >= 5 AND @nWeight < 10
	begin
	SELECT @nUnitPrice = w5 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC and [Size]=@nThickness
	SET @Bracket   = 2
	end
ELSE
IF @nWeight >= 10 AND @nWeight < 20
	begin
	SELECT @nUnitPrice = w10 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC and [Size]=@nThickness
	SET @Bracket   = 3
	end
ELSE
IF @nWeight >= 20 AND @nWeight < 50
	begin
	SELECT @nUnitPrice = w25 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC and [Size]=@nThickness
	SET @Bracket   = 4
	end
ELSE
IF @nWeight >= 50 AND @nWeight < 100
	begin
	SELECT @nUnitPrice = w50 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC and [Size]=@nThickness
	SET @Bracket   = 5
	end
ELSE
IF @nWeight >= 100 AND @nWeight < 200
	begin
	SELECT @nUnitPrice = w100 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC and [Size]=@nThickness
	SET @Bracket   = 6
	end
ELSE
IF @nWeight >= 200 AND @nWeight < 500
	begin
	SELECT @nUnitPrice = w200 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC and [Size]=@nThickness
	SET @Bracket   = 7
	end
ELSE
IF @nWeight >= 500 AND @nWeight < 1000
	begin
	SELECT @nUnitPrice = w500 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC and [Size]=@nThickness
	SET @Bracket   = 8
	end
ELSE
IF @nWeight >= 1000 AND @nWeight < 2000
	begin
	SELECT @nUnitPrice = w1000 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC and [Size]=@nThickness
	SET @Bracket   = 9
	end
ELSE
IF @nWeight >= 2000 AND @nWeight < 5000
	begin
	SELECT @nUnitPrice = w2000 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC and [Size]=@nThickness
	SET @Bracket   = 0
	end
ELSE
	begin
	SET @nUnitPrice = 0
	SET @Bracket   = 0
	end



RETURN @nUnitPrice
END





--GRANT EXECUTE ON [dbo].[f_GetPriceCC] TO [WINDFALL\Quotes] AS [dbo];
--GRANT EXECUTE ON [dbo].[f_GetPriceCC] TO [HPA_Service] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetPriceCC_CL]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetPriceCC_CL]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_GetPriceCC_CL]
(
@cAlloy char(12),
@cForm CHAR(2),
@cCC CHAR(1),
@cCL CHAR(1),
@nThickness DECIMAL(9,4),
@nSize2 DECIMAL(9,3),
@nSize3 DECIMAL(9,3),
@nWeight DECIMAL(7,1)
)

RETURNS DECIMAL(7,2) --Unit Price -- $/PC --called from p_McMaster
AS
BEGIN
--PRINT dbo.f_GetPriceCC_CL(''C-276'',''40'',''1'','''',1,12,48,10)
--Print dbo.f_GetPriceCC_CL(Alloy,Form,CC,CL, dbo.f_SizeStandard(Thck),Sz2,Sz3,Weight)
--PRINT dbo.f_GetWeight(''1'',''C-276'',''40'',1,12,48)

--SET NOCOUNT ON

DECLARE @nUnitPrice as DECIMAL(7,2)
DECLARE @Bracket Int
DECLARE @cMessage as VARCHAR(2000)
SET @cMessage = ''''

----------------------
DECLARE @cCCorig CHAR(1)
SET @cCCorig = @cCC

DECLARE @cCCAdjust CHAR(1)
SET @cCCAdjust = ''0''
DECLARE @nAdjust NUMERIC(18,9)

--******************************************
--Use to fix Alloy
--SET @cAlloy = dbo.f_Price_Alloy(@cAlloy)


IF @cCC = ''A''
	begin
	SET @cCCAdjust = ''A''
	SELECT TOP 1 @nAdjust = [A] FROM dbo.ConditionCodeAdjust WITH(NOLOCK) 
	SET @cCC = ''2''
	end
ELSE
IF @cCC = ''B''
	begin
	SET @cCCAdjust = ''B''
	SELECT TOP 1 @nAdjust = [B] FROM dbo.ConditionCodeAdjust WITH(NOLOCK) 
	SET @cCC = ''2''
	end
IF @cCC = ''C''
	begin
	SET @cCCAdjust = ''C''
	SELECT TOP 1 @nAdjust = [C] FROM dbo.ConditionCodeAdjust WITH(NOLOCK) 
	SET @cCC = ''2''
	end
ELSE
IF @cCC = ''D''
	begin
	SET @cCCAdjust = ''D''
	SELECT TOP 1 @nAdjust = [D] FROM dbo.ConditionCodeAdjust WITH(NOLOCK) 
	SET @cCC = ''2''
	end
ELSE
IF @cCC = ''E''
	begin
	SET @cCCAdjust = ''E''
	SELECT TOP 1 @nAdjust = [E] FROM dbo.ConditionCodeAdjust WITH(NOLOCK) 
	SET @cCC = ''2''
	end
IF @cCC = ''F''
	begin
	SET @cCCAdjust = ''F''
	SELECT TOP 1 @nAdjust = [F] FROM dbo.ConditionCodeAdjust WITH(NOLOCK) 
	SET @cCC = ''2''
	end
IF @cCC = ''S''
	begin
	SET @cCCAdjust = ''S''
	SELECT TOP 1 @nAdjust = [S] FROM dbo.ConditionCodeAdjust WITH(NOLOCK) 
	SET @cCC = ''2''
	end
IF @cCC = ''T''
	begin
	SET @cCCAdjust = ''T''
	SELECT TOP 1 @nAdjust = [T] FROM dbo.ConditionCodeAdjust WITH(NOLOCK) 
	SET @cCC = ''2''
	end
IF @cCC = ''U''
	begin
	SET @cCCAdjust = ''U''
	SELECT TOP 1 @nAdjust = [U] FROM dbo.ConditionCodeAdjust WITH(NOLOCK) 
	SET @cCC = ''2''
	end
IF @cCC = ''V''
	begin
	SET @cCCAdjust = ''V''
	SELECT TOP 1 @nAdjust = [V] FROM dbo.ConditionCodeAdjust WITH(NOLOCK) 
	SET @cCC = ''2''
	end
IF @cCC = ''W''
	begin
	SET @cCCAdjust = ''W''
	SELECT TOP 1 @nAdjust = [W] FROM dbo.ConditionCodeAdjust WITH(NOLOCK) 
	SET @cCC = ''2''
	end
IF @cCC = ''X''
	begin
	SET @cCCAdjust = ''X''
	SELECT TOP 1 @nAdjust = [X] FROM dbo.ConditionCodeAdjust WITH(NOLOCK) 
	SET @cCC = ''2''
	end

---------------------------------------------------
--Use the N60 Cold Work Chart for N50 Cold Work
IF @cAlloy = ''HPA N50''
	SELECT @cAlloy = ''HPA N60'' 
		WHERE @cCCorig = ''T'' 
		OR @cCCorig = ''U'' 
		OR @cCCorig = ''V'' 
		OR @cCCorig = ''W'' 
		OR @cCCorig = ''X'' 

---------------------------------------------------

IF @nWeight < 5
	begin
	SELECT @nUnitPrice = w0 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and [Size]=@nThickness
	SET @Bracket   = 1
	end
ELSE
IF @nWeight >= 5 AND @nWeight < 10
	begin
	SELECT @nUnitPrice = w5 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and [Size]=@nThickness
	SET @Bracket   = 2
	end
ELSE
IF @nWeight >= 10 AND @nWeight < 20
	begin
	SELECT @nUnitPrice = w10 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and [Size]=@nThickness
	SET @Bracket   = 3
	end
ELSE
IF @nWeight >= 20 AND @nWeight < 50
	begin
	SELECT @nUnitPrice = w25 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and [Size]=@nThickness
	SET @Bracket   = 4
	end
ELSE
IF @nWeight >= 50 AND @nWeight < 100
	begin
	SELECT @nUnitPrice = w50 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and [Size]=@nThickness
	SET @Bracket   = 5
	end
ELSE
IF @nWeight >= 100 AND @nWeight < 200
	begin
	SELECT @nUnitPrice = w100 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and [Size]=@nThickness
	SET @Bracket   = 6
	end
ELSE
IF @nWeight >= 200 AND @nWeight < 500
	begin
	SELECT @nUnitPrice = w200 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and [Size]=@nThickness
	SET @Bracket   = 7
	end
ELSE
IF @nWeight >= 500 AND @nWeight < 1000
	begin
	SELECT @nUnitPrice = w500 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and [Size]=@nThickness
	SET @Bracket   = 8
	end
ELSE
IF @nWeight >= 1000 AND @nWeight < 2000
	begin
	SELECT @nUnitPrice = w1000 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and [Size]=@nThickness
	SET @Bracket   = 9
	end
ELSE
IF @nWeight >= 2000 AND @nWeight < 5000
	begin
	SELECT @nUnitPrice = w2000 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and [Size]=@nThickness
	SET @Bracket   = 0
	end
ELSE
	begin
	SET @nUnitPrice = 0
	SET @Bracket   = 0
	end

--*************************************************************************************
--dbo.f_SizeStandard(
IF @nUnitPrice = 0
begin
	--retry with f_SizeStandard
	SET @nThickness = dbo.f_SizeStandard(@nThickness)

	IF @nWeight < 5
		begin
		SELECT @nUnitPrice = w0 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and [Size]=@nThickness
		SET @Bracket   = 1
		end
	ELSE
	IF @nWeight >= 5 AND @nWeight < 10
		begin
		SELECT @nUnitPrice = w5 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and [Size]=@nThickness
		SET @Bracket   = 2
		end
	ELSE
	IF @nWeight >= 10 AND @nWeight < 20
		begin
		SELECT @nUnitPrice = w10 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and [Size]=@nThickness
		SET @Bracket   = 3
		end
	ELSE
	IF @nWeight >= 20 AND @nWeight < 50
		begin
		SELECT @nUnitPrice = w25 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and [Size]=@nThickness
		SET @Bracket   = 4
		end
	ELSE
	IF @nWeight >= 50 AND @nWeight < 100
		begin
		SELECT @nUnitPrice = w50 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and [Size]=@nThickness
		SET @Bracket   = 5
		end
	ELSE
	IF @nWeight >= 100 AND @nWeight < 200
		begin
		SELECT @nUnitPrice = w100 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and [Size]=@nThickness
		SET @Bracket   = 6
		end
	ELSE
	IF @nWeight >= 200 AND @nWeight < 500
		begin
		SELECT @nUnitPrice = w200 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and [Size]=@nThickness
		SET @Bracket   = 7
		end
	ELSE
	IF @nWeight >= 500 AND @nWeight < 1000
		begin
		SELECT @nUnitPrice = w500 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and [Size]=@nThickness
		SET @Bracket   = 8
		end
	ELSE
	IF @nWeight >= 1000 AND @nWeight < 2000
		begin
		SELECT @nUnitPrice = w1000 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and [Size]=@nThickness
		SET @Bracket   = 9
		end
	ELSE
	IF @nWeight >= 2000 AND @nWeight < 5000
		begin
		SELECT @nUnitPrice = w2000 FROM dbo.PriceTable WITH(NOLOCK) WHERE Alloy=@cAlloy and Form=@cForm AND CC = @cCC AND CL = @cCL and [Size]=@nThickness
		SET @Bracket   = 0
		end
	ELSE
		begin
		SET @nUnitPrice = 0
		SET @Bracket   = 0
		end

END




RETURN @nUnitPrice
END



--GRANT EXECUTE ON [dbo].[f_GetPriceCC_CL] TO [WINDFALL\Quotes] AS [dbo];
--GRANT EXECUTE ON [dbo].[f_GetPriceCC_CL] TO [WINDFALL\HPA] AS [dbo];
--GRANT EXECUTE ON [dbo].[f_GetPriceCC_CL] TO [HPA_Service] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetPriceQuote]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetPriceQuote]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[f_GetPriceQuote] 
(
@nPieces INT,
@cAlloy char(12),
@cForm CHAR(2),
@cCC CHAR(1),
@nThickness DECIMAL(11,4),
@nSize2 DECIMAL(10,3),
@nSize3 DECIMAL(10,3),
@nForceBracket INT
)
--RETURNS DECIMAL(7,1)
RETURNS REAL
AS
BEGIN
--PRINT dbo.[f_GetFullQuote](''1'',''C-276'',''40'',''1'',1,12,48,0)
--PRINT dbo.[f_GetFullQuote](Pieces,Alloy,Form,CC,thck,Sz2,Sz3,0)
--SET NOCOUNT ON

DECLARE @nPrice_PC REAL = 0
DECLARE @nTestPounds as float(53)
DECLARE @nPounds as REAL
SET @nPounds = 0

DECLARE @cMessage as VARCHAR(2000)
SET @cMessage = ''''

IF @nPieces < 1
	SET @nPieces = 1

DECLARE @nDensity DECIMAL(9,4)
SET @nDensity = IsNull(dbo.AlloyDensity( dbo.AlloyName(@cAlloy) ),0)
IF @nDensity = 0
   BEGIN
    SET @nDensity = .29
    SET @cMessage = RTRIM(@cMessage)+'' Alloy Density not found!''
   END
ELSE
   SET @cMessage = RTRIM(@cMessage)+''Used Density of ''+STR(@nDensity,5,3)
--Find Thickness used in PriceTable

SET @nPounds = 0

IF @cForm = ''10'' 
   BEGIN
	--CHANGE FROM @nThickness*1.023 2-9-94
	--USING CASE STRUCTURE WITH ERIKS INFO
  	IF @nThickness = 0
		SET @nPounds = 0
	ELSE
	IF @nThickness < .2
		begin
		SET @nTestPounds = (POWER(@nThickness+.001,2)* 3.23 * @nDensity* @nSize2* @nPieces /4)
		IF @nTestPounds > 9999999.9
			SET @nPounds = 9999999.9
		ELSE
			begin
			SET @nPounds = (POWER(@nThickness+.001,2)* 3.23 * @nDensity* @nSize2* @nPieces /4)
			end
		end
	ELSE
		IF @nThickness < 1
		begin
		SET @nTestPounds = (POWER(@nThickness+.005,2)* 3.23 * @nDensity* @nSize2* @nPieces /4)
		IF @nTestPounds > 9999999.9
			SET @nPounds = 9999999.9
		ELSE
			begin
			SET @nPounds = (POWER(@nThickness+.005,2)* 3.23 * @nDensity* @nSize2* @nPieces /4)
			end
		end
	ELSE
		IF @nThickness < 3
		begin
		SET @nTestPounds = (POWER(@nThickness+.01,2)* 3.23 * @nDensity* @nSize2* @nPieces /4)
		IF @nTestPounds > 9999999.9
			SET @nPounds = 9999999.9
		ELSE
			begin
			SET @nPounds = (POWER(@nThickness+.01,2)* 3.23 * @nDensity* @nSize2* @nPieces /4)
			end
		end
	ELSE
	IF @nThickness < 6
		begin
		SET @nPounds = (POWER(@nThickness+.020,2)* 3.23* @nDensity* @nSize2* @nPieces /4)
		end
	ELSE
		begin
		SET @nPounds = (POWER(@nThickness+.032,2)* 3.23* @nDensity* @nSize2* @nPieces /4)
		end
   END 
ELSE
IF @cForm = ''11'' 
	SET @nPounds = (@nDensity* @nThickness* 1.03* @nSize2* @nSize3* @nPieces )
ELSE
IF @cForm = ''12''
	SET @nPounds = @nDensity*@nThickness*@nThickness*.866*@nSize2* @nPieces
ELSE
IF @cForm = ''13'' 
	SET @nPounds = (@nDensity* @nThickness* 1.03* @nSize2* @nSize3* @nPieces )
ELSE
IF @cForm = ''20'' --WIRE 
	SET @nPounds = @nSize2* @nPieces 
ELSE
IF @cForm = ''21'' --WIRE CUTS --by 10 Pounds tubes 2019
	SET @nPounds = @nSize3 * @nPieces 
ELSE
IF @cForm = ''22'' --LOOSE COIL
	SET @nPounds = @nSize2* @nPieces 
ELSE
IF @cForm = ''23'' --WIRE REEL  
	SET @nPounds = @nSize2* @nPieces 
ELSE
IF @cForm = ''30'' 
	SET @nPounds = @nSize3* @nPieces 
ELSE
IF @cForm = ''40'' 
	SET @nPounds = (@nDensity* @nThickness* 1.015* @nSize2* @nSize3* @nPieces )
ELSE
IF @cForm = ''51'' 
	begin
	SET @nPounds = (@nDensity* @nThickness* 1.015* @nSize2* @nSize3* @nPieces )
	end
ELSE
IF @cForm = ''60''
	SET @nPounds = @nDensity *@nSize3*@nSize2*3.23* (@nThickness-@nSize2)* @nPieces 
ELSE
IF @cForm = ''65''
   BEGIN
	DECLARE @nPipeWeight DECIMAL(9,4)
	SET @nPipeWeight = IsNull(dbo.PipeWeight(@nThickness,@nSize2),0)
	IF @nPipeWeight = 0
		   SET @cMessage = RTRIM(@cMessage)+'' Pipe Weight not found!''

	SET @nPounds = (@nDensity* @nPipeWeight* @nSize3* @nPieces )

   END
ELSE
IF @cForm = ''80''
	SET @nPounds = (@nDensity * @nThickness * 1.03 * @nSize2 * @nSize2 * @nPieces )


--RETURN @nPounds


DECLARE @lnSurcharge REAL
SELECT @lnSurcharge = dbo.Alloy_Surcharge(@cAlloy)


--SELECT @cAlloy=''400'',@cForm=''10'',@nStdSize=1,@nSize2=0,@nPounds=10
DECLARE @nStdSize DECIMAL(9,4)
SET @nStdSize = dbo.f_PriceTableStandard(@cAlloy,@cForm,@cCC,@nThickness)

--OUTPUT @nPrice, @nBracket, @cPTMessage, @bActivePrice
DECLARE @nPrice DECIMAL(9,2), @nBracket TinyInt, @cPTMessage CHAR(2000), @bActivePrice BIT

--IF @cForm = ''80''
--	EXEC [dbo].[p_CalcPrice] @cAlloy,''40'',@cCC,@nStdSize,@nSize2,@nPounds,@nForceBracket, @nPrice OUTPUT,@nBracket OUTPUT, @cPTMessage OUTPUT, @bActivePrice OUTPUT
--ELSE
--	EXEC [dbo].[p_CalcPrice] @cAlloy,@cForm,@cCC,@nStdSize,@nSize2,@nPounds,@nForceBracket, @nPrice OUTPUT,@nBracket OUTPUT, @cPTMessage OUTPUT, @bActivePrice OUTPUT


--DECLARE @CommSpec CHAR(20)
--SET @CommSpec = dbo.f_PriceTable_CommSpec(@cAlloy,@cForm,@cCC,@nStdSize)

SET @nPrice_PC = @nPounds * @nPrice 
RETURN @nPrice_PC

END




' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetPU_Unit]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetPU_Unit]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[f_GetPU_Unit]
(
@nPU TinyInt
)
RETURNS CHAR(4)
AS
BEGIN

--SELECT dbo.f_GetPU_Unit(3)
-- Return Unit like ''$/#''

--Also see dbo.f_GetFormPU
--duplicate of dbo.f_Get_Unit_nPU

DECLARE @cUnit CHAR(4)

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @cUnit = ''''
--1Lb, 2Ft 3Pc
--SELECT TOP 1 @cUnit = Unit FROM dbo.Forms WHERE PU = @nPU
SELECT TOP 1 @cUnit = Unit FROM dbo.PU WHERE PU = @nPU

RETURN @cUnit
END

--GRANT EXECUTE ON [dbo].[f_GetPU_Unit] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetPUstrPU]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetPUstrPU]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


Create FUNCTION [dbo].[f_GetPUstrPU]
(
@nPU TINYINT

)
RETURNS CHAR(4)
AS
BEGIN
--Also see f_GetPU_Unit

--SELECT dbo.f_GetPUstrPU(1)

--SELECT dbo.f_GetFormPU(''10'')
DECLARE @cPriceSTR CHAR(4)

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @cPriceSTR = 0
--1Lb, 2Ft 3Pc, 4Lot, 5Inch
SELECT @cPriceSTR = UNIT 
	FROM dbo.Forms WHERE PU = @nPU


--SELECT TOP 1 @nPriceUnit = PU FROM dbo.PU 

RETURN @cPriceSTR
END

--GRANT EXECUTE ON [dbo].[f_GetPUstrPU] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetQuote]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetQuote]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_GetQuote] 
(
@nPieces TinyINT,
@cAlloy char(12),
@cForm CHAR(2),
@nThickness DECIMAL(9,4),
@nSize2 DECIMAL(9,3),
@nSize3 DECIMAL(9,3)
)
--RETURNS DECIMAL(7,1)
RETURNS DECIMAL(7,1)
AS
BEGIN
--PRINT dbo.GetWeight(''1'',''C-276'',''40'',1,12,48)
--SET NOCOUNT ON

DECLARE @nPounds as DECIMAL(7,1)
DECLARE @cMessage as VARCHAR(2000)
SET @cMessage = ''''

IF @nPieces < 1
	SET @nPieces = 1

DECLARE @nDensity DECIMAL(9,4)
SET @nDensity = IsNull(dbo.AlloyDensity( dbo.AlloyName(@cAlloy) ),0)
IF @nDensity = 0
   BEGIN
    SET @nDensity = .29
    SET @cMessage = RTRIM(@cMessage)+'' Alloy Density not found!''
   END
ELSE
   SET @cMessage = RTRIM(@cMessage)+''Used Density of ''+STR(@nDensity,5,3)
--Find Thickness used in PriceTable

SET @nPounds = 0

IF @cForm = ''10'' 
   BEGIN
	--CHANGE FROM @nThickness*1.023 2-9-94
	--USING CASE STRUCTURE WITH ERIKS INFO
	IF @nThickness = 0
		SET @nPounds = 0
	ELSE
	IF @nThickness < 3
		SET @nPounds = (POWER(@nThickness+.01,2)* 3.23 * @nDensity* @nSize2* @nPieces /4)
	ELSE
	IF @nThickness < 6
		SET @nPounds = (POWER(@nThickness+.020,2)* 3.23* @nDensity* @nSize2* @nPieces /4)
	ELSE
		SET @nPounds = (POWER(@nThickness+.032,2)* 3.23* @nDensity* @nSize2* @nPieces /4)
   END
ELSE
IF @cForm = ''11'' 
	SET @nPounds = (@nDensity* @nThickness* 1.03* @nSize2* @nSize3* @nPieces )
ELSE
IF @cForm = ''12''
	SET @nPounds = @nDensity*@nThickness*@nThickness*.866*@nSize2* @nPieces
ELSE
IF @cForm = ''13'' 
	SET @nPounds = (@nDensity* @nThickness* 1.03* @nSize2* @nSize3* @nPieces )
ELSE
IF @cForm = ''20'' 
	SET @nPounds = @nSize2* @nPieces 
ELSE
IF @cForm = ''21'' --WIRE CUTS --by 10 Pounds tubes 2019
	SET @nPounds = @nSize3 * @nPieces 
ELSE
IF @cForm = ''22'' --LOOSE COIL
	SET @nPounds = @nSize2* @nPieces 
ELSE
IF @cForm = ''23'' --WIRE REEL  
	SET @nPounds = @nSize2* @nPieces 
ELSE
IF @cForm = ''30'' 
	SET @nPounds = @nSize3* @nPieces 
ELSE
IF @cForm = ''40'' 
	SET @nPounds = (@nDensity* @nThickness* 1.015* @nSize2* @nSize3* @nPieces )
ELSE
IF @cForm = ''60''
	SET @nPounds = @nDensity *@nSize3*@nSize2*3.23* (@nThickness-@nSize2)* @nPieces 
ELSE
IF @cForm = ''65''
   BEGIN
	DECLARE @nPipeWeight DECIMAL(9,4)
	SET @nPipeWeight = IsNull(dbo.PipeWeight(@nThickness,@nSize2),0)
	IF @nPipeWeight = 0
		   SET @cMessage = RTRIM(@cMessage)+'' Pipe Weight not found!''

	SET @nPounds = (@nDensity* @nPipeWeight* @nSize3* @nPieces )

   END
ELSE
IF @cForm = ''80''
	SET @nPounds = (@nDensity * @nThickness * 1.03 * @nSize2 * @nSize2 * @nPieces )


RETURN @nPounds
END




' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetQuoted_LBS_report]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetQuoted_LBS_report]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[f_GetQuoted_LBS_report]
(
 @InqDate DateTime
,@Alloy CHAR(12)
,@Form CHAR(2)
,@CC CHAR(1)
,@thck NUMERIC(11,4)
)

RETURNS FLOAT
AS
BEGIN
--PRINT dbo.f_GetQuoted_LBS_report ( InqDate,Alloy,Form,CC,thck )

--PRINT dbo.f_GetQuoted_LBS_report ( ''2014-08-11T00:00:00'',''HPA N60     '',''10'',1,0.375 )
----PRINT dbo.f_GetQuoted_LBS_report ( CONVERT(smalldatetime,  CONVERT(nvarchar(12), InqDate, 127)+''0:00:00'' ),''HPA N60     '',''10'',1,0.375 )


--Used by reports to remove similair quotes (Just returns the Average LBS in AM or PM)
--where they have quoted many times so customer can find the price break.

DECLARE @nLBS AS INT
SET @nLBS = 0


SELECT 
	TOP 1 @nLBS = AQ2.[weight]
--	@nLBS = AVG(AQ2.[weight])
	
	FROM ERP_2.dbo.AllQuotes AQ2 
	WHERE CONVERT(nvarchar(12), AQ2.InqDate, 127) = CONVERT(nvarchar(12), @InqDate, 127) 
	AND AQ2.Alloy = @Alloy
	AND AQ2.form = @Form
	AND AQ2.CC = @CC
	AND AQ2.[thck] = @thck

RETURN @nLBS
END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetQuotedPriceTotal]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetQuotedPriceTotal]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[f_GetQuotedPriceTotal]
(
@Pieces	INT,
@Sz3	FLOAT,
@P_Lb	FLOAT,
@P_Pc	FLOAT,
@P_Ft	FLOAT,
@Cuts	FLOAT,
@OtherP	FLOAT,
@lotP	FLOAT,
@Weight FLOAT,
@cLotP	FLOAT
)

RETURNS FLOAT
AS
BEGIN
--PRINT dbo.[f_GetQuotedPriceTotal](1,0,10.215,0,0,0,0,0,13)
--PRINT dbo.f_GetQuotedPriceTotal(Pieces,Sz3,P_Lb,P_Pc,P_Ft,Cuts,OtherP,lotP,Weight)

DECLARE @nQuotePrice as FLOAT

SET @Pieces	= ISNULL(@Pieces,0)
SET @P_Lb	= ISNULL(@P_Lb,0)
SET @P_Pc	= ISNULL(@P_Pc,0)
SET @P_Ft	= ISNULL(@P_Ft,0)
SET @Cuts	= ISNULL(@Cuts,0)
SET @lotP	= ISNULL(@lotP,0)
SET @Weight	= ISNULL(@Weight,0)
SET @cLotP	= ISNULL(@cLotP,0)


IF @P_Lb > 0 AND @Weight > 0
	SELECT @nQuotePrice = @P_LB * @Weight
	
IF @P_Pc > 0 AND @Pieces > 0
	SELECT @nQuotePrice = @P_Pc * @Pieces
	
IF @P_Ft > 0 AND @Sz3 > 0
	SELECT @nQuotePrice = @P_Ft * @Sz3 / 12


--Overwrite if using LotP
IF ISNULL(@LotP,0) > 0
	SELECT @nQuotePrice = @LotP
	
-- Add Cutting
IF ISNULL(@Cuts,0) > 0
	SELECT @nQuotePrice = @nQuotePrice + @Cuts

-- Add Other Price
IF ISNULL(@OtherP,0) > 0
	SELECT @nQuotePrice = @nQuotePrice + @OtherP

-- use computer over 0
IF ISNULL(@nQuotePrice,0) = 0
	SELECT @nQuotePrice = @cLotP

-- remove the float decimals
--SET @nQuotePrice = CAST(@nQuotePrice AS Decimal(10,2))
SET @nQuotePrice = ROUND(@nQuotePrice ,2)

RETURN @nQuotePrice
END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetSales_TYP_SOitem]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetSales_TYP_SOitem]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
Create FUNCTION [dbo].[f_GetSales_TYP_SOitem]
(
@SOitem CHAR(10)
)
RETURNS CHAR(1)
AS
BEGIN
--SELECT dbo.f_GetSales_TYP_SOitem(''  69028-02'')
--Return TYP in SALES for this SOitem.

DECLARE @cTYP CHAR(1)

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @cTYP = ''''

SELECT @cTYP = ISNULL(TYP,'''') 
	FROM dbo.Sales 
	WHERE SOitem = @SOitem
		
RETURN @cTYP
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_getSalesNum_SOitem]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_getSalesNum_SOitem]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[f_getSalesNum_SOitem] 
(
@cSOitem CHAR(10)
)

RETURNS INT
AS
BEGIN
--Returns the SalesNum from SOitem

--PRINT dbo.f_getSalesNum_SOitem(''12345-01'')
--PRINT dbo.f_getSalesNum_SOitem(''   12345-01'')
--PRINT dbo.f_getSalesNum_SOitem(''   12345-012'')
--PRINT dbo.f_getSalesNum_SOitem(''STOCK'')

--SET NOCOUNT ON
DECLARE @nSalesNum INT
DECLARE @cSO AS VARCHAR(10)

SET @cSO = @cSOitem
SET @nSalesNum = 0

--remove spaces
SET @cSO = RTRIM(@cSO)
SET @cSO = LTRIM(@cSO)


-- drop the ''-''
IF CHARINDEX(''-'',@cSO) > 0
	SET @cSO = LEFT(@cSO, CHARINDEX(''-'',@cSO)-1 )

--Convert to number
--IF ISNUMERIC(@cSO) = 1
--	SET @nSalesNum = CAST(@cSO AS INT)

SET @nSalesNum = Try_Cast(@cSO AS INT)


RETURN @nSalesNum
END


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetSalesP_State]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetSalesP_State]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'



Create FUNCTION [dbo].[f_GetSalesP_State]
(
@cST CHAR(2)
)
RETURNS CHAR(1)
AS
BEGIN
--Get District by State, Then SalesP by District

--SELECT dbo.f_GetSalesP_State(''IN'')

--DECLARE @cDistrict CHAR(1)
DECLARE @cSalesP CHAR(1)

declare @err int,
        @RC int
set @err = 0
set @rc = 0

--SET @cDistrict = ''0 ''
SET @cSalesP = ''''

SELECT @cSalesP = SP.SalesP 
	FROM dbo.District_St ST 
	INNER JOIN dbo.District_SalesP SP ON SP.ST = ST.State
	WHERE ST.State = @cST

RETURN @cSalesP
END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_getSigDim]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_getSigDim]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[f_getSigDim]
(
@cForm CHAR(2)
)
RETURNS TinyInt

AS
BEGIN
--Also see f_GetPU_Unit
--SELECT dbo.f_getSigDim(''10'')
--SELECT dbo.f_GetFormPU(''10'')

DECLARE @nSigDim TINYINT

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @nSigDim = 0

SELECT @nSigDim = SigDim FROM dbo.Forms WHERE FormNumber = @cForm

RETURN @nSigDim
END

-- GRANT EXECUTE ON [dbo].[f_getSigDim] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetSQL_Report_Server]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetSQL_Report_Server]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'



CREATE FUNCTION [dbo].[f_GetSQL_Report_Server]
(
)
RETURNS VARCHAR(100)
AS
BEGIN

--SELECT ERP_2.dbo.f_GetSQL_Report_Server()
--DECLARE @cReport_Server VARCHAR(100) = ERP_2.dbo.f_GetSQL_Report_Server()
--    SET @cReport_Server              =''https://PEREGRINE/ReportServer/Pages/ReportViewer.aspx''

DECLARE @cReport_Server VARCHAR(100)

declare @err int,
        @RC int
set @err = 0
set @rc = 0

SET @cReport_Server =''https://''+@@SERVERNAME+''/ReportServer/Pages/ReportViewer.aspx''


RETURN @cReport_Server
END



--GRANT EXECUTE ON [dbo].[f_GetSQL_Report_Server] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetSQL_Server_Email]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetSQL_Server_Email]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'



CREATE FUNCTION [dbo].[f_GetSQL_Server_Email]
(
)
RETURNS VARCHAR(30)
AS
BEGIN

--SELECT ERP_2.dbo.f_GetSQL_Server_Email()
--DECLARE @cEmailFrom VARCHAR(30) = ERP_2.dbo.f_GetSQL_Server_Email()
--Also see dbo.f_Get_Email_Profile_Name(''David Kirchner'')  
--an ddbo.SalesPEmail(@SalesP)

DECLARE @cEmailName VARCHAR(30)

declare @err int,
        @RC int
set @err = 0
set @rc = 0

SET @cEmailName = @@SERVERNAME+''@ERP_1s.com''
--Do not use ERP_1s as that domain is expensive commpared to ERP_1

RETURN @cEmailName
END



--GRANT EXECUTE ON [dbo].[f_GetSQL_Server_Email] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetStockLst_Detail_CurrentCost]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetStockLst_Detail_CurrentCost]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[f_GetStockLst_Detail_CurrentCost]
(
@Unit CHAR(6)
,@PC DECIMAL(18,4)
,@dim3 DECIMAL(18,4)
,@Weight DECIMAL(9,2)
,@CostValue MONEY

)
RETURNS Money

AS
BEGIN

--SELECT dbo.f_GetStockLst_Detail_CurrentCost (Unit,PC,dim3,Weight,CostValue) AS CCost,Unit,PC,dim3,Weight,CostValue FROM dbo.StockLst_Detail
DECLARE @nReturnCost MONEY

declare @err int,
        @RC int

set @err = 0
set @rc = 0


SELECT @nReturnCost =
	CASE @Unit 
		WHEN ''$/#'' THEN @Weight * @CostValue
		WHEN ''$/PC'' THEN @PC * @CostValue
		WHEN ''$/FT'' THEN @dim3 / 12 * @CostValue
		ELSE 0
	END 


RETURN @nReturnCost
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_getStockLstStandardSize]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_getStockLstStandardSize]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[f_getStockLstStandardSize] 
(
@nThickness DECIMAL(9,4)
,@Alloy CHAR(12)
,@Form CHAR(2)

)

RETURNS DECIMAL(9,4)
AS
BEGIN
--PRINT dbo.[f_getStockLstStandardSize](.5,''HPA N60'',''10'')
--Also SEE getStockLstStandardSize, does not use Alloy or Form!

--SET NOCOUNT ON

DECLARE @returnThickness as DECIMAL(9,4)
DECLARE @cMessage as VARCHAR(2000)
SET @cMessage = ''''
SET @returnThickness = 0

--SELECT DISTINCT Thk FROM dbo.PriceTable ORDER BY Thk

SELECT @returnThickness=ISNULL([Size],0)
	FROM dbo.PriceTable WITH(NOLOCK) 
	WHERE [Size] = @nThickness
	AND [Alloy] = @Alloy
	AND [Form] = @Form
 
IF @returnThickness = 0
	begin

	DECLARE @ThicknessOver as DECIMAL(9,4)
	DECLARE @ThicknessUnder as DECIMAL(9,4)

	SELECT TOP 1 @ThicknessOver=ISNULL([SIZE],@nThickness) 
		FROM dbo.PriceTable WITH(NOLOCK) 
		WHERE [Size] > @nThickness AND [Alloy] = @Alloy AND [Form] = @Form 
		ORDER BY [SIZE] ASC

	SELECT TOP 1 @ThicknessUnder=ISNULL([SIZE],0) 
		FROM dbo.PriceTable WITH(NOLOCK) 
		WHERE [Size] < @nThickness AND [Alloy] = @Alloy AND [Form] = @Form
		ORDER BY [SIZE] DESC

	IF ( @ThicknessOver - @nThickness) <= ( @nThickness - @ThicknessUnder) 
		SET @returnThickness = @ThicknessOver
	ELSE
		SET @returnThickness = @ThicknessUnder

	end

RETURN @returnThickness
END


--GRANT EXECUTE ON dbo.f_getStockLstStandardSize TO [WINDFALL\ReportReader];
--GRANT EXECUTE ON dbo.f_getStockLstStandardSize TO [WINDFALL\HPA];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetTopPOitem_SOitem]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetTopPOitem_SOitem]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
Create FUNCTION [dbo].[f_GetTopPOitem_SOitem]
(
@SOitem CHAR(10)
)
RETURNS CHAR(12)
AS
BEGIN
--SELECT dbo.f_GetTopPOitem_SOitem(''  69028-02'')
--Returns top 1 POitem for this SOitem.

DECLARE @POitem CHAR(12)

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @POitem = ''''

SELECT TOP 1 @POitem = p.POitem
	FROM dbo.PurchaseOrder p 
	WHERE p.SOitem = @SOitem
		AND ISNULL(p.Equipment,0) = 0 
		AND p.cancelled = 0
	ORDER BY dbo.f_GetPOItem_Total(p.POitem) DESC
	
RETURN @POitem
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_getVendorCompany]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_getVendorCompany]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
create FUNCTION [dbo].[f_getVendorCompany] 
(
@nVendCode INT
)
RETURNS VarChar(30)
AS
BEGIN

--SELECT dbo.f_getVendorCompany(1130)

DECLARE @cCompany VarChar(30)

SELECT TOP 1 @cCompany = ISNULL(Company,'''') FROM dbo.Vendor WHERE VendCode = @nVendCode

RETURN @cCompany
END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetWeight]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetWeight]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_GetWeight] 
(
@nPieces Int,
@cAlloy CHAR(12),
@cForm CHAR(2),
@nThickness DECIMAL(9,4),
@nSize2 DECIMAL(9,3),
@nSize3 DECIMAL(9,3)
)
--RETURNS DECIMAL(7,1)
RETURNS DECIMAL(8,1)
AS
BEGIN
--PRINT dbo.f_GetWeight(''1'',''C-276'',''40'',1,12,48)
--PRINT dbo.f_GetWeight(Pieces,Alloy,Form,Thck,Sz2,Sz3)
--also see [f_Get_Weight] it has a Force Bracket parameter

--Used by Proc_SQL:CalcWeight 
--
--SET NOCOUNT ON

DECLARE @nPounds as DECIMAL(8,1)
DECLARE @nSetZero tinyint = 0
DECLARE @cMessage as VARCHAR(2000)
SET @cMessage = ''''

IF @nPieces < 1
	SET @nPieces = 1

DECLARE @nDensity DECIMAL(9,4)
SET @nDensity = IsNull(dbo.AlloyDensity( dbo.AlloyName(@cAlloy) ),0)
IF @nDensity = 0
   BEGIN
    SET @nDensity = .29
    SET @cMessage = RTRIM(@cMessage)+'' Alloy Density not found!''
   END
ELSE
   SET @cMessage = RTRIM(@cMessage)+''Used Density of ''+STR(@nDensity,5,3)
--Find Thickness used in PriceTable

SET @nPounds = 0

IF @cForm = ''10'' --BAR
   BEGIN
	--CHANGE FROM @nThickness*1.023 2-9-94
	--USING CASE STRUCTURE WITH ERIKS INFO
	IF @nThickness = 0
		SET @nPounds = 0
	ELSE
	IF @nThickness < 3
		SET @nPounds = (POWER(@nThickness+.01,2)* 3.23 * @nDensity* @nSize2* @nPieces /4)
	ELSE
	IF @nThickness < 6
		SET @nPounds = (POWER(@nThickness+.020,2)* 3.23* @nDensity* @nSize2* @nPieces /4)
	ELSE
		SET @nPounds = (POWER(@nThickness+.032,2)* 3.23* @nDensity* @nSize2* @nPieces /4)
   END
ELSE
IF @cForm = ''11'' --FLAT BAR
	SET @nPounds = (@nDensity* @nThickness* 1.03* @nSize2* @nSize3* @nPieces )
ELSE
IF @cForm = ''12'' --HEX
	SET @nPounds = @nDensity*@nThickness*@nThickness*.866*@nSize2* @nPieces
ELSE
IF @cForm = ''13'' --SQAURE BAR
	SET @nPounds = (@nDensity* @nThickness* 1.03* @nSize2* @nSize3* @nPieces )
ELSE
IF @cForm = ''20'' --WIRE
	SET @nPounds = @nSize2* @nPieces 
ELSE
IF @cForm = ''21'' --WIRE CUTS  --by 10 Pounds Tubes!
	SET @nPounds = @nSize3* @nPieces 
	--SET @nPounds = (POWER(@nThickness+.01,2)* 3.23 * @nDensity* @nSize2* @nPieces /4)
ELSE
IF @cForm = ''22'' --LOOSE COIL
	SET @nPounds = @nSize2* @nPieces 
ELSE
IF @cForm = ''23'' --WIRE REEL  
	SET @nPounds = @nSize2* @nPieces 
ELSE
IF @cForm = ''30'' --COATED ELEC
	SET @nPounds = @nSize2* @nPieces 
ELSE
IF @cForm = ''40'' --PLATE
	SET @nPounds = (@nDensity* @nThickness* 1.015* @nSize2* @nSize3* @nPieces )
ELSE
IF @cForm = ''50'' --SHEET
	SET @nPounds = (@nDensity* @nThickness* 1.015* @nSize2* @nSize3* @nPieces )
ELSE
IF @cForm = ''51'' --STRIP
	SET @nPounds = (@nSize3 * @nPieces )
ELSE
IF @cForm = ''52'' -- COIL
	SET @nPounds = (@nSize3 * @nPieces )
ELSE
IF @cForm = ''53'' -- Hot Band
	SET @nPounds = (@nSize3 * @nPieces )
ELSE
IF @cForm = ''60'' --TUBE
	begin
	--Twice wall thickness should never be mor than Dia
	IF @nSize2*2 > @nThickness
		SET @nPounds = 0
	ELSE
		SET @nPounds = @nDensity *@nSize3*@nSize2*3.23* (@nThickness-@nSize2)* @nPieces 
	end
ELSE
IF @cForm = ''65'' --PIPE
   BEGIN
	DECLARE @nPipeWeight DECIMAL(9,4)
	SET @nPipeWeight = IsNull(dbo.PipeWeight(@nThickness,@nSize2),0)
	IF @nPipeWeight = 0
		begin
		SET @cMessage = RTRIM(@cMessage)+'' Pipe Weight not found!''
		SET @nSetZero = 1
		end
	SET @nPounds = (@nDensity* @nPipeWeight* @nSize3* @nPieces )

   END
ELSE
IF @cForm = ''66'' --NIPPLE     
	begin
	SET @cMessage = RTRIM(@cMessage)+'' Weight not found!''
	SET @nSetZero = 1
	end
ELSE
IF @cForm = ''67'' --ELBOW      
	begin
	SET @cMessage = RTRIM(@cMessage)+'' Weight not found!''
	SET @nSetZero = 1
	end
ELSE
IF @cForm = ''68'' --TEE      
	begin
	SET @cMessage = RTRIM(@cMessage)+'' Weight not found!''
	SET @nSetZero = 1
	end
ELSE
IF @cForm = ''69'' --REDUCER      
	begin
	SET @cMessage = RTRIM(@cMessage)+'' Weight not found!''
	SET @nSetZero = 1
	end
ELSE
IF @cForm = ''70'' --FITTINGS      
	begin
	SET @cMessage = RTRIM(@cMessage)+'' Weight not found!''
	SET @nSetZero = 1
	end
ELSE
IF @cForm = ''71'' --COUPLING      
	begin
	SET @cMessage = RTRIM(@cMessage)+'' Weight not found!''
	SET @nSetZero = 1
	end
ELSE
IF @cForm = ''72'' --FLANGE      
	begin
	SET @cMessage = RTRIM(@cMessage)+'' Weight not found!''
	SET @nSetZero = 1
	end
ELSE
IF @cForm = ''75'' --FASTENER      
	begin
	SET @cMessage = RTRIM(@cMessage)+'' Weight not found!''
	SET @nSetZero = 1
	end
ELSE
IF @cForm = ''80'' --DISK
	SET @nPounds = (@nDensity * @nThickness * 1.03 * @nSize2 * @nSize2 * @nPieces )
	--Weight of Square used.
IF @cForm = ''90'' --MACHINED        
	SET @nPounds = (@nDensity* @nThickness* 1.015* @nSize2* @nSize3* @nPieces )
ELSE
IF @cForm = ''95'' --FORGE     
	SET @nPounds = (@nDensity* @nThickness* 1.015* @nSize2* @nSize3* @nPieces )
ELSE
IF @cForm = ''96'' --SLAB
	SET @nPounds = (@nDensity* @nThickness* 1.015* @nSize2* @nSize3* @nPieces )
ELSE
IF @cForm = ''97'' --BILLET
	SET @nPounds = (POWER(@nThickness+.032,2)* 3.23* @nDensity* @nSize2* @nPieces /4)
ELSE
IF @cForm = ''98'' --RCS 
	SET @nPounds = (@nDensity* @nThickness* 1.015* @nThickness* @nSize2* @nPieces )
ELSE
IF @cForm = ''99'' --INGOT
	IF @nSize3 > 0   --Not Round
		SET @nPounds = (@nDensity* @nThickness* 1.015* @nSize2* @nSize3* @nPieces )
	ELSE
		SET @nPounds = (POWER(@nThickness+.032,2)* 3.23* @nDensity* @nSize2* @nPieces /4)

IF @nSetZero = 1
	SET @nPounds = 0
ELSE
	IF @nPounds < 0.1
		SET @nPounds = 0.1
	--use 0.1 as Min

RETURN @nPounds
END


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetWeightDisk]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetWeightDisk]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[f_GetWeightDisk] 
(
@nPieces SmallInt,
@cAlloy CHAR(12),
@cForm CHAR(2),
@nThickness DECIMAL(9,4),
@nSize2 DECIMAL(9,3),
@nSize3 DECIMAL(9,3)
)
--RETURNS DECIMAL(7,1)
RETURNS DECIMAL(8,1)
AS
BEGIN
--PRINT dbo.f_GetWeightDisk(''1'',''C-276'',''80'',1,20,10)
--PRINT dbo.f_GetWeightDisk(Pieces,Alloy,Form,Thck,Sz2,Sz3)

--Used by Proc_SQL:CalcWeight 
--
--SET NOCOUNT ON

DECLARE @nPounds as DECIMAL(8,1)
DECLARE @cMessage as VARCHAR(2000)
SET @cMessage = ''''

IF @nPieces < 1
	SET @nPieces = 1

DECLARE @nDensity DECIMAL(9,4)
SET @nDensity = IsNull(dbo.AlloyDensity( dbo.AlloyName(@cAlloy) ),0)
IF @nDensity = 0
   BEGIN
    SET @nDensity = .29
    SET @cMessage = RTRIM(@cMessage)+'' Alloy Density not found!''
   END
ELSE
   SET @cMessage = RTRIM(@cMessage)+''Used Density of ''+STR(@nDensity,5,3)
--Find Thickness used in PriceTable

SET @nPounds = 0

DECLARE @nOD_Lbs Float
DECLARE @nID_Lbs Float
SET @nOD_Lbs = 0
SET @nID_Lbs = 0


IF @cForm = ''80'' 
   BEGIN
	IF @nThickness = 0
		SET @nPounds = 0
	ELSE
	IF @nSize2 > 0
		SET @nOD_Lbs = (POWER(@nSize2,2)* 3.23 * @nDensity*@nThickness+.01* @nPieces /4)

	IF @nSize3 > 0
		SET @nID_Lbs = (POWER(@nSize3,2)* 3.23* @nDensity* @nThickness+.01* @nPieces /4)

   END

IF @nOD_Lbs > 0
	IF @nID_Lbs > 0
		SET @nPounds = @nOD_Lbs - @nID_Lbs
	ELSE
		SET @nPounds = @nOD_Lbs


RETURN @nPounds
END


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetWho_CustomerID]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetWho_CustomerID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

Create FUNCTION [dbo].[f_GetWho_CustomerID] 
(
@cCustomerID char(20)
)

RETURNS VARCHAR(255)
AS
BEGIN

DECLARE @cWho VARCHAR(255)
SELECT TOP 1 @cWho = [WHO] FROM dbo.Customer_List_Call WHERE CustomerID = @cCustomerID ORDER BY [DATE] DESC


RETURN (@cWho)
END


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_GetxCompName]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_GetxCompName]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'



/****** Object:  Stored Procedure dbo.p_StandardSize    Script Date: 12/2/2005 2:04:26 PM ******/


CREATE FUNCTION [dbo].[f_GetxCompName]
(
@cPhone	CHAR(10)
,@cCompany CHAR(30)
,@cName	CHAR(25)
)
RETURNS CHAR(18)
AS
BEGIN

--SELECT dbo.[f_GetxCompName](''4409376804'',''LIBERTY METALS'',''SUE SIMMONS '')
DECLARE @cxCompName CHAR(18)

SET @cxCompName = ISNULL(@cPhone,SPACE(10))+ISNULL(SOUNDEX(@cCompany),SPACE(4))+SOUNDEX(ISNULL(REPLACE(@cName,'' '',''''),SPACE(4))) 

RETURN @cxCompName
END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_HeatLot_Heat]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_HeatLot_Heat]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[f_HeatLot_Heat]
(
@cHeatLot VARCHAR(50)

)
RETURNS VARCHAR(50)
AS 
BEGIN
--Also see f_HeatLot_Lot

DECLARE @cHeat VARCHAR(50)

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @cHeat = LTRIM(RTRIM(@cHeatLot))

DECLARE @nPos INT = 0
SELECT @nPos = CHARINDEX(''HPA'',@cHeat)

IF @nPos > 0
	SET @cHeat = LEFT(@cHeat,@nPos-1)

--IF @cHeatLot LIKE ''%HPA%''
	

RETURN @cHeat

END

--GRANT EXECUTE ON [dbo].[f_HeatLot_Heat] TO [WINDFALL\HPA] AS [dbo];

--SELECT Heat, dbo.f_HeatLot_Heat(Heat) AS Heat1 FROM dbo.PackingSlip WHERE LEN(Heat) >0' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_HeatLot_Lot]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_HeatLot_Lot]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[f_HeatLot_Lot]
(
@cHeatLot VARCHAR(50)

)
RETURNS VARCHAR(10)
--Lot String
AS 
BEGIN
--Also see f_HeatLot_Heat
--SELECT Heat, dbo.f_HeatLot_lot(Heat) AS Lot1 FROM dbo.PackingSlip WHERE LEN(Heat) >0
--SELECT dbo.f_HeatLot_lot(''526932 HPAR951'') AS Lot1;
--SELECT dbo.f_HeatLot_lot(''531088-AAD60803-A HPA R987'');
--SELECT dbo.f_HeatLot_lot(''526671-03 HPA R 893'');

--Also See:
--SELECT dbo.f_GetMachine_Log(''GFM'')
--SELECT dbo.f_GetMachine_Table( dbo.f_GetMachine_init(''GFM'') )
--SELECT dbo.f_GetMachine_LogList() AS [Typs of Machines]

--SELECT dbo.f_GetMachine_init(''GFM'')
--SELECT dbo.f_GetMachine_Caption(''G'')
--SELECT dbo.f_GetMachine_List()
--See dbo.f_HeatLot_lot(Heat)

DECLARE @cLot VARCHAR(10)
DECLARE @cHeat VARCHAR(50)

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @cHeat = LTRIM(RTRIM(@cHeatLot))

DECLARE @nPos INT = 0
SELECT @nPos = CHARINDEX(''HPA'',@cHeat)

IF @nPos > 0 
	begin
	SET @cLot = RIGHT(@cHeat,LEN(@cHeat)-@nPos-2)
	SET @cLot = LTRIM(RTRIM(@cLot))
	end

IF LEN(@cLot) > 2
	begin
	DECLARE @cMachine CHAR(1)=''''
	DECLARE @cLotText CHAR(9)

	SET @cMachine = LEFT( @cLot, 1)
	SET @cLotText = RTRIM(LTRIM( RIGHT( @cLot,LEN(@cLot)-1) ))

	--Check Machine
	DECLARE @cMachine_Caption CHAR(20) = ''''
	SET @cMachine_Caption = dbo.f_GetMachine_Caption(@cMachine)
	IF LEN(RTRIM(@cMachine_Caption)) > 2
		begin
		IF LEFT(@cLot,1) = @cMachine
			SET @cLotText = RTRIM(LTRIM( RIGHT( @cLot, LEN(@cLot)-1) ))

		SET @cLot = @cMachine + @cLotText;
		end

	end
ELSE
	SET @cLot = ''      ''

RETURN @cLot

END

--GRANT EXECUTE ON [dbo].[f_HeatLot_Lot] TO [WINDFALL\HPA] AS [dbo];


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_HTML_HPA_Footer]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_HTML_HPA_Footer]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_HTML_HPA_Footer]
(@Detail BIT)

RETURNS VARCHAR(2000)
AS
BEGIN

--SET @Body= @Body + dbo.f_HTML_HPA_Footer(0) --Use 1 to get Address

DECLARE @cRS VarChar(2000)
SET @cRS=''''
SET @cRS = @cRS +''<footer>''

IF @Detail = 1
begin
	SET @cRS = @cRS +''<div id="Div12" style="bottom:0; height: 12pt; width: 450pt; margin-left: 15pt;">''
	SET @cRS = @cRS +''<table style="border: thin none #000000; width: 450pt;">''
	SET @cRS = @cRS +''<tr>''
	SET @cRS = @cRS +''<td class="styleTextAlignCenter" colspan="3">''
	SET @cRS = @cRS +''<hr />''
	SET @cRS = @cRS +''</td>''
	SET @cRS = @cRS +''</tr>''
	SET @cRS = @cRS +''<tr>''
	SET @cRS = @cRS +''<td style="width: 138pt; vertical-align: top; text-align: center;">''
	SET @cRS = @cRS +''                        Windfall Production Center<br />''
	SET @cRS = @cRS +''                        1985 E 500 N<br />''
	SET @cRS = @cRS +''                        Windfall, IN 46076<br />''
	SET @cRS = @cRS +''                        United States of America<br />''
	SET @cRS = @cRS +''                        P 765-945-8230<br />''
	SET @cRS = @cRS +''                        P 800-472-5569<br />''
	SET @cRS = @cRS +''                        F 765-945-8294''
	SET @cRS = @cRS +''</td>''
	SET @cRS = @cRS +''<td style="width: 126pt; vertical-align: top; text-align: center;">''
	SET @cRS = @cRS +''                        Tipton Production Center<br />''
	SET @cRS = @cRS +''                        444 Wilson St<br />''
	SET @cRS = @cRS +''                        Tipton, IN 46072<br />''
	SET @cRS = @cRS +''                        United States of America<br />''
	SET @cRS = @cRS +''                        P 765-675-8875<br />''
	SET @cRS = @cRS +''                        P 800-479-5569<br />''
	SET @cRS = @cRS +''                        F 765-945-8294''
	SET @cRS = @cRS +''</td>''
	SET @cRS = @cRS +''<td style="width: 126pt; vertical-align: top; text-align: center;">''
	SET @cRS = @cRS +''                        Remit to<br />''
	SET @cRS = @cRS +''                        P.O. Box 40<br />''
	SET @cRS = @cRS +''                        Tipton, IN 46072<br />''
	SET @cRS = @cRS +''                        United States of America<br />''
	SET @cRS = @cRS +''                        P 765-945-8230<br />''
	SET @cRS = @cRS +''                        P 800-472-5569<br />''
	SET @cRS = @cRS +''                        F 765-945-8294''
	SET @cRS = @cRS +''</td>''
	SET @cRS = @cRS +''</tr>''
	SET @cRS = @cRS +''<tr>''
	SET @cRS = @cRS +''<td class="styleTextAlignCenter" colspan="2">''
	SET @cRS = @cRS +''<a href="http://www.ERP_1s.com">www.ERP_1s.com</a>''
	SET @cRS = @cRS +''</td>''
	SET @cRS = @cRS +''</tr>''
	SET @cRS = @cRS +''<tr>''
	SET @cRS = @cRS +''<td class="styleTextAlignCenter" colspan="2"> ''
--	SET @cRS = @cRS +''<a href=" http://www.facebook.com/HighPerformanceAlloys" target="_blank">''
--	SET @cRS = @cRS +''<img src="http://www.buttonshut.com/Facebook-Buttons/Facebook-Buttons-51-88-.png" title=" High Performance Alloys’ Facebook Page" alt="High Performance Alloys’ Facebook Page" width="34" /></a> ''
--	SET @cRS = @cRS +''<a href=" https://twitter.com/#!/ERP_1" target="_blank">''
--	SET @cRS = @cRS +''<img src="http://www.buttonshut.com/Twitter-Buttons/Twitter-Buttons-69-72-.png" title=" High Performance Alloys’ Twitter Page" alt=" High Performance Alloys’ Twitter Page" width="34" /></a>''
--	SET @cRS = @cRS +''<a href=" http://www.linkedin.com/company/2335867?trk=tyah" target="_blank">''
--	SET @cRS = @cRS +''<img src="http://www.buttonshut.com/LinkedIn-Buttons/linkedin-tiny-square2.png" title=" High Performance Alloys’ LinkedIn Page" alt=" High Performance Alloys’ LinkedIn Page" width="32" /></a>''
--	SET @cRS = @cRS +''<a href=" http://highperformancealloy.blogspot.com/" target="_blank"><img src="https://www.blogger.com/img/start/icon.png" title=" High Performance Alloys’ Blog Page" alt=" High Performance Alloys’ Blog Page" width="32" /></a>''
--	SET @cRS = @cRS +''<a href=" http://www.youtube.com/user/ERP_1" target="_blank">''
--	SET @cRS = @cRS +''<img src="http://s.ytimg.com/yt/img/creators_corner/YouTube/youtube_32x32.png" title=" High Performance Alloys’ YouTube Channel" alt=" High Performance Alloys’ YouTube Channel" width="32" /></a>''
	SET @cRS = @cRS +''</td>''
	SET @cRS = @cRS +''</tr>''
	SET @cRS = @cRS +''</table>''
	SET @cRS = @cRS +''</div>''
end

SET @cRS = @cRS +''</footer>''

RETURN @cRS

END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_HTML_HPA_Header]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_HTML_HPA_Header]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_HTML_HPA_Header]
()
--Could Pass Title and Detail Parameter!

RETURNS VARCHAR(2000)
AS
BEGIN

DECLARE @cRS VarChar(2000)
SET @cRS = ''''

--SET @cRS = ''<a href='' + dbo.f_Reportlink_INT(''ProjID'',@ProjID)+''<br>'';


SET @cRS = @cRS +''<!DOCTYPE html> ''
SET @cRS = @cRS +''<html>''
SET @cRS = @cRS +''<head>''
SET @cRS = @cRS +''<title>HPA Quotation</title>''
SET @cRS = @cRS +''<style type=''''text/css''''>''
SET @cRS = @cRS +''.styleRightAlign{text-align: right;}''
SET @cRS = @cRS +''.styleTableHeadersRow{background-color: #4D5079;color: #FFFFFF;}''
SET @cRS = @cRS +''.styleTextAlignCenter{text-align: center;}''
SET @cRS = @cRS +''</style>''
SET @cRS = @cRS +''</head>''
SET @cRS = @cRS +''<body>''
SET @cRS = @cRS +''<header>''
--SET @cRS = @cRS +''<table style=''''border: thin none #000000; width: 480pt; ''''>''
--SET @cRS = @cRS +''<tr>''
--SET @cRS = @cRS +''<td style=''''width: 165pt; vertical-align: top;''''>''
SET @cRS = @cRS +''<img alt=''''High Performance Alloys Logo'''' ''
SET @cRS = @cRS +'' src=''''https://images.ERP_1s.com/v1/images/HPALogo.png'''' ''
SET @cRS = @cRS +''height=''''69''''/>''
--SET @cRS = @cRS +''</td>''
--SET @cRS = @cRS +''<td style=''''width: 192pt; vertical-align: top;''''>''
--SET @cRS = @cRS +''<h1>''
--SET @cRS = @cRS +'' </h1>''
--SET @cRS = @cRS +''</td>''
--SET @cRS = @cRS +''<td style=''''width: 123pt; text-align: left; vertical-align: top;''''>''
SET @cRS = @cRS +''<br />''
--SET @cRS = @cRS +''<br /><br />''
--SET @cRS = @cRS +''''
--SET @cRS = @cRS +''</td>''
--SET @cRS = @cRS +''</tr>''
--SET @cRS = @cRS +''</table>''
SET @cRS = @cRS +''</header>''
--SET @cRS = @cRS +''<br />''
--SET @cRS = @cRS +''<br />''
--SET @cRS = @cRS +''<table style=''''border: thin none #000000; width: 480pt; ''''>''
--SET @cRS = @cRS +''<tr>''
--SET @cRS = @cRS +''<td style=''''width: 32pt; vertical-align: top;''''></td>''
--SET @cRS = @cRS +''<td style=''''width: 54pt; vertical-align: top;''''>''
--SET @cRS = @cRS +''<strong> </strong>''
--SET @cRS = @cRS +''</td>''
--SET @cRS = @cRS +''<td style=''''width: 150pt; vertical-align: top;''''>''
--SET @cRS = @cRS +''<br />''
--SET @cRS = @cRS +''<br />''
--SET @cRS = @cRS +''<br />''
--SET @cRS = @cRS +''<br />''
--SET @cRS = @cRS +''</td>''
--SET @cRS = @cRS +''<td style=''''width: 72pt; text-align: left; vertical-align: top;''''>''
--SET @cRS = @cRS +''<strong> </strong>''
--SET @cRS = @cRS +''</td>''
--SET @cRS = @cRS +''<td style=''''width: 150pt; vertical-align: top;''''>''
--SET @cRS = @cRS +''<br />''
--SET @cRS = @cRS +''1985 E 500 N<br />''
--SET @cRS = @cRS +''Windfall, IN 46076<br />''
--SET @cRS = @cRS +''United States of America<br />''
--SET @cRS = @cRS +''P 800-472-5569<br />''
--SET @cRS = @cRS +''F 765-945-8294''
--SET @cRS = @cRS +''</td>''
--SET @cRS = @cRS +''</tr>]''
--SET @cRS = @cRS +''</table>''
--SET @cRS = @cRS +''<br />''
SET @cRS = @cRS +''<br />''

RETURN @cRS

END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_HTML_link_Company_Info]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_HTML_link_Company_Info]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_HTML_link_Company_Info]
(
@cCompany VARCHAR(20)
)
RETURNS VARCHAR(2000)
AS
BEGIN

--SELECT dbo.f_HTML_link_Company_Info()
--SELECT dbo.f_HTML_link_Company_Info(''LAKELAND TECHNOLOGY'')

DECLARE @cReturnString VarChar(2000)
DECLARE @cCleanPara	VarChar(1000)
SET @cCleanPara = REPLACE(@cCompany,'' '', ''+'');

--https://PEREGRINE/ReportServer
SET @cReturnString = ''<a href='' 
SET @cReturnString = @cReturnString + dbo.f_Reportlink_CHAR(''CompanyInfo'',@cCleanPara)
SET @cReturnString = @cReturnString + ''> Company Info ''+LTRIM(@cCompany)+''</a>''

RETURN @cReturnString
END


/*
GRANT EXECUTE ON [dbo].[f_HTML_link_Company_Info] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_Company_Info] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_Company_Info] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_HTML_link_Company_Info_NoNoise]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_HTML_link_Company_Info_NoNoise]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'Create FUNCTION [dbo].[f_HTML_link_Company_Info_NoNoise]
(
@cCompany VARCHAR(20)
)
RETURNS VARCHAR(2000)
AS
BEGIN

--SELECT dbo.f_HTML_link_Company_Info_NoNoise()
--SELECT dbo.f_HTML_link_Company_Info_NoNoise(''LAKELAND TECHNOLOGY'')
--SELECT dbo.f_Reportlink_CHAR(''CustomerInfo_NoNoise'',@cCHAR)

DECLARE @cReturnString VarChar(2000)
DECLARE @cCleanPara	VarChar(1000)
SET @cCleanPara = dbo.f_NoNoiseName( @cCompany )
--CustomerInfo_NoNoise

--https://PEREGRINE/ReportServer
SET @cReturnString = ''<a href='' 
SET @cReturnString = @cReturnString + dbo.f_Reportlink_CHAR(''CustomerInfo_NoNoise'',@cCleanPara)
SET @cReturnString = @cReturnString + ''> Company Info ''+LTRIM(@cCompany)+''</a>''

RETURN @cReturnString
END


/*
GRANT EXECUTE ON [dbo].[f_HTML_link_Company_Info_NoNoise] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_Company_Info_NoNoise] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_Company_Info_NoNoise] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_HTML_link_CustomerID]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_HTML_link_CustomerID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_HTML_link_CustomerID]
(
@cCustomerID VARCHAR(20)
)
RETURNS VARCHAR(2000)
AS
BEGIN

--SELECT dbo.f_HTML_link_CustomerID(@cCustomerID)

DECLARE @cReturnString VarChar(2000)

--https://PEREGRINE/ReportServer
SET @cReturnString = ''<a href='' 
SET @cReturnString = @cReturnString + dbo.f_Reportlink_CHAR(''CustomerID'',@cCustomerID)
SET @cReturnString = @cReturnString + ''> Customer ID ''+LTRIM(@cCustomerID)+''</a>''

RETURN @cReturnString
END


/*
GRANT EXECUTE ON [dbo].[f_HTML_link_CustomerID] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_CustomerID] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_CustomerID] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_HTML_link_CustomerInfo_NoNoise]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_HTML_link_CustomerInfo_NoNoise]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create FUNCTION [dbo].[f_HTML_link_CustomerInfo_NoNoise]
(
@cNoNoiseCompany CHAR(30)
)
RETURNS VARCHAR(2000)
AS
BEGIN


--SELECT dbo.f_HTML_link_CustomerInfo_NoNoise(''LAKELAND TECHNOLOGY'')
--f_HTML_link_CustomerID


DECLARE @cReturnString VarChar(2000)

--https://PEREGRINE/ReportServer
SET @cReturnString = ''<a href='' 
SET @cReturnString = @cReturnString + dbo.f_Reportlink_CHAR(''CustomerInfo_NoNoise'',@cNoNoiseCompany)
SET @cReturnString = @cReturnString + ''> Company Info ''+LTRIM(@cNoNoiseCompany)+''</a>''

RETURN @cReturnString
END


/*
GRANT EXECUTE ON [dbo].[f_HTML_link_CustomerInfo_NoNoise] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_CustomerInfo_NoNoise] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_CustomerInfo_NoNoise] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_HTML_link_Draw]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_HTML_link_Draw]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_HTML_link_Draw]
(
@nLot INT
)
RETURNS VARCHAR(2000)
AS
BEGIN

--SELECT dbo.f_HTML_link_Draw(1002)

DECLARE @cReturnString VarChar(2000)


SET @cReturnString = ''<a href='' 
SET @cReturnString = @cReturnString + dbo.f_Reportlink_INT(''Draw_log'',@nLot)
SET @cReturnString = @cReturnString + ''> Draw Lot ''+LTRIM(RTRIM(STR(@nLot)))+''</a>''

RETURN @cReturnString
END


/*
GRANT EXECUTE ON [dbo].[f_HTML_link_Wire] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_Wire] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_Wire] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_HTML_link_GFM]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_HTML_link_GFM]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create FUNCTION [dbo].[f_HTML_link_GFM]
(
@nLot INT
)
RETURNS VARCHAR(2000)
AS
BEGIN

--SELECT dbo.f_HTML_link_GFM(2000)

DECLARE @cReturnString VarChar(2000)


SET @cReturnString = ''<a href='' 
SET @cReturnString = @cReturnString + dbo.f_Reportlink_INT(''GFMlog'',@nLot)
SET @cReturnString = @cReturnString + ''> GFM Lot ''+LTRIM(RTRIM(STR(@nLot)))+''</a>''

RETURN @cReturnString
END


/*
GRANT EXECUTE ON [dbo].[f_HTML_link_GFM] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_GFM] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_GFM] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_HTML_link_OTrack]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_HTML_link_OTrack]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_HTML_link_OTrack]
(
@nTrackID INT
)
RETURNS VARCHAR(2000)
AS
BEGIN

--SELECT dbo.f_HTML_link_OTrack(44000)

DECLARE @cReturnString VarChar(2000)


SET @cReturnString = ''<a href='' 
SET @cReturnString = @cReturnString + dbo.f_Reportlink_INT(''OTrack'',@nTrackID)
SET @cReturnString = @cReturnString + ''> TrackID ''+LTRIM(RTRIM(STR(@nTrackID)))+''</a>''

RETURN @cReturnString
END


/*
GRANT EXECUTE ON [dbo].[f_HTML_link_OTrack] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_OTrack] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_OTrack] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_HTML_link_POitem]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_HTML_link_POitem]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_HTML_link_POitem]
(
@cPOitem CHAR(12)
)
RETURNS VARCHAR(2000)
AS
BEGIN

--SELECT dbo.f_HTML_link_POitem(''507183-01'')

DECLARE @cReturn VarChar(2000)

SET @cPOitem = dbo.f_ProperPOitem( @cPOitem )
--DECLARE @cCleanPara	VarChar(1000)
--SET @cCleanPara = REPLACE(@cPOitem,'' '', ''+'');

SET @cReturn = ''<a href='' 
SET @cReturn = @cReturn + dbo.f_Reportlink_CHAR(''POitem'',@cPOitem)
SET @cReturn = @cReturn + ''> PurchaseOrder ''+@cPOitem+''</a>''


RETURN @cReturn
END

/*
GRANT EXECUTE ON [dbo].[f_HTML_link_POitem] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_POitem] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_POitem] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_HTML_link_Receiving_POitem]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_HTML_link_Receiving_POitem]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_HTML_link_Receiving_POitem]
(
@cPOitem CHAR(12)
)
RETURNS VARCHAR(2000)
AS
BEGIN

--SELECT dbo.f_HTML_link_Receiving_POitem('' 508423-01'')
--SELECT dbo.f_Reportlink_CHAR(''Receiving_POitem'','' 508423-01'')

DECLARE @cReturn VarChar(2000)

SET @cPOitem = dbo.f_ProperPOitem( @cPOitem )

--https://peregrine/reports/report/Receiving/Receiving%20POitem

SET @cReturn = ''<a href='' 
--+ ERP_2.dbo.f_GetSQL_Report_Server() 
SET @cReturn = @cReturn + dbo.f_Reportlink_CHAR(''Receiving_POitem'',@cPOitem)
SET @cReturn = @cReturn + ''> Receiving of PO item ''+@cPOitem+''</a>''

RETURN @cReturn


/*
GRANT EXECUTE ON [dbo].[f_HTML_link_Receiving_POitem] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_Receiving_POitem] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_Receiving_POitem] TO [WINDFALL\HPA] AS [dbo];
*/
END' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_HTML_link_ReceivingID]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_HTML_link_ReceivingID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_HTML_link_ReceivingID]
(
@nID INT
)
RETURNS VARCHAR(2000)
AS
BEGIN

--SELECT dbo.f_HTML_link_ReceivingID()
--Print dbo.f_HTML_link_ReceivingID(24544); Print dbo.f_HTML_link_StockLstID(11920)
--Print dbo.f_Reportlink_INT(''ReceivingID'',24544)

DECLARE @cReturnString VarChar(2000)

--DECLARE @cReport_Server VARCHAR(100) = ERP_2.dbo.f_GetSQL_Report_Server()
--    SET @cReport_Server              =''https://PEREGRINE/ReportServer/Pages/ReportViewer.aspx''

SET @cReturnString = ''<a href=''
SET @cReturnString = @cReturnString + dbo.f_Reportlink_INT(''ReceivingID'',@nID)
SET @cReturnString = @cReturnString + ''> Receiving ''+LTRIM(RTRIM(STR(@nID)))+''</a>''

RETURN @cReturnString


/*
GRANT EXECUTE ON [dbo].[f_HTML_link_ReceivingID] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_ReceivingID] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_ReceivingID] TO [WINDFALL\HPA] AS [dbo];
*/
END' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_HTML_link_Roll]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_HTML_link_Roll]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'Create FUNCTION [dbo].[f_HTML_link_Roll]
(
@nLot INT
)
RETURNS VARCHAR(2000)
AS
BEGIN

--SELECT dbo.f_HTML_link_Roll(955)

DECLARE @cReturnString VarChar(2000)


SET @cReturnString = ''<a href='' 
SET @cReturnString = @cReturnString + dbo.f_Reportlink_INT(''Roll_log'',@nLot)
SET @cReturnString = @cReturnString + ''> Roll Lot ''+LTRIM(RTRIM(STR(@nLot)))+''</a>''

RETURN @cReturnString
END


/*
GRANT EXECUTE ON [dbo].[f_HTML_link_Roll] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_Roll] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_Roll] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_HTML_link_rtr]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_HTML_link_rtr]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_HTML_link_rtr]
(
@nrtr_ID BIGINT
)
RETURNS VARCHAR(2000)
AS
BEGIN

--SELECT dbo.f_HTML_link_WO()

DECLARE @cReturnString VarChar(2000)

--DECLARE @cReport_Server VARCHAR(100) = ERP_2.dbo.f_GetSQL_Report_Server()
--    SET @cReport_Server              =''https://PEREGRINE/ReportServer/Pages/ReportViewer.aspx''

SET @cReturnString = ''<a href=''
SET @cReturnString = @cReturnString + dbo.f_Reportlink_INT(''rtr'',@nrtr_ID)
SET @cReturnString = @cReturnString + ''> ID '' +CAST(@nrtr_ID AS CHAR(20))+''</a>''

RETURN @cReturnString
END

/*
GRANT EXECUTE ON [dbo].[f_HTML_link_rtr] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_rtr] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_rtr] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_HTML_link_SO]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_HTML_link_SO]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_HTML_link_SO]
(
@nSO INT
)
RETURNS VARCHAR(2000)
AS
BEGIN

--SELECT dbo.f_HTML_link_SO()

DECLARE @cReturnString VarChar(2000)


SET @cReturnString = ''<a href='' 
SET @cReturnString = @cReturnString + dbo.f_Reportlink_INT(''SO'',@nSO)
SET @cReturnString = @cReturnString + ''> SO ''+LTRIM(RTRIM(STR(@nSO)))+''</a>''

RETURN @cReturnString
END


/*
GRANT EXECUTE ON [dbo].[f_HTML_link_SO] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_SO] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_SO] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_HTML_link_SO_OnHold_History]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_HTML_link_SO_OnHold_History]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_HTML_link_SO_OnHold_History]
(
@nSO INT
)
RETURNS VARCHAR(2000)
AS
BEGIN

--SELECT dbo.f_HTML_link_SO_OnHold_History(129638)

DECLARE @cReturnString VarChar(2000)


SET @cReturnString = ''<a href='' 
SET @cReturnString = @cReturnString + dbo.f_Reportlink_INT(''SO_OnHold_Hist'',@nSO)
SET @cReturnString = @cReturnString + ''> SO OnHold History ''+LTRIM(RTRIM(STR(@nSO)))+''</a>''

RETURN @cReturnString
END


/*
GRANT EXECUTE ON [dbo].[f_HTML_link_SO_OnHold_History] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_SO_OnHold_History] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_SO_OnHold_History] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_HTML_link_SO_Status]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_HTML_link_SO_Status]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_HTML_link_SO_Status]
(
@nSO INT
)
RETURNS VARCHAR(2000)
AS
BEGIN

--SELECT dbo.f_HTML_link_SO_Status(114456)

DECLARE @cReturnString VarChar(2000)


SET @cReturnString = ''<a href='' 
SET @cReturnString = @cReturnString + dbo.f_Reportlink_INT(''SO_Status'',@nSO)
SET @cReturnString = @cReturnString + ''> SO Status ''+LTRIM(RTRIM(STR(@nSO)))+''</a>''

RETURN @cReturnString
END


/*
GRANT EXECUTE ON [dbo].[f_HTML_link_SO_Status] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_SO_Status] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_SO_Status] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_HTML_link_SOitem]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_HTML_link_SOitem]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_HTML_link_SOitem]
(
@cSOitem CHAR(10)
)
RETURNS VARCHAR(2000)
AS
BEGIN

--SELECT dbo.f_HTML_link_SOitem(''  508488-01'')

DECLARE @cReturnString VarChar(2000)

SET @cSOitem = dbo.f_ProperSOitem( @cSOitem )
DECLARE @cCleanPara	VarChar(1000)
SET @cCleanPara = REPLACE(@cSOitem,'' '', ''%20'');

SET @cReturnString = ''<a href=''
SET @cReturnString = @cReturnString +  dbo.f_Reportlink_CHAR(''SOitem'',@cSOitem)
SET @cReturnString = @cReturnString + ''> SOitem ''+@cSOitem+''</a>''


RETURN @cReturnString
END

/*
GRANT EXECUTE ON [dbo].[f_HTML_link_SOitem] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_SOitem] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_SOitem] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_HTML_link_SOitem_onHold]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_HTML_link_SOitem_onHold]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_HTML_link_SOitem_onHold]
(
@cSOitem CHAR(10)
)
RETURNS VARCHAR(2000)
AS
BEGIN

--SELECT dbo.f_HTML_link_SOitem_onHold(''  508488-01'')

DECLARE @cReturnString VarChar(2000)

SET @cSOitem = dbo.f_ProperSOitem( @cSOitem )
--DECLARE @cCleanPara	VarChar(1000)
--SET @cCleanPara = REPLACE(@cSOitem,'' '', ''%20'');

SET @cReturnString = ''<a href=''
SET @cReturnString = @cReturnString +  dbo.f_Reportlink_CHAR(''Internal.onHoldSales'',@cSOitem)
SET @cReturnString = @cReturnString + ''> SOitem onHold''+@cSOitem+''</a>''


RETURN @cReturnString
END

/*
GRANT EXECUTE ON [dbo].[f_HTML_link_SOitem_onHold] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_SOitem_onHold] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_SOitem_onHold] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_HTML_link_StockLstID]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_HTML_link_StockLstID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_HTML_link_StockLstID]
(
@nID INT
)
RETURNS VARCHAR(2000)
AS
BEGIN

--SELECT dbo.f_HTML_link_StockLstID(ID)

DECLARE @cReturnString VarChar(2000)
SET @cReturnString = ''<a href=''
SET @cReturnString = @cReturnString + dbo.f_Reportlink_INT(''StockLstID'',@nID)
SET @cReturnString = @cReturnString + ''> Stock ID ''+LTRIM(RTRIM(STR(@nID)))+''</a>''

RETURN @cReturnString


/*
GRANT EXECUTE ON [dbo].[f_HTML_link_StockLstID] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_StockLstID] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_StockLstID] TO [WINDFALL\HPA] AS [dbo];
*/
END' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_HTML_link_StockLstID_Detail]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_HTML_link_StockLstID_Detail]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'Create FUNCTION [dbo].[f_HTML_link_StockLstID_Detail]
(
@nID_Detail INT
)
RETURNS VARCHAR(2000)
AS
BEGIN

--SELECT dbo.f_HTML_link_StockLstID_Detail()

DECLARE @cReturnString VarChar(2000)
SET @cReturnString = ''<a href=''
SET @cReturnString = @cReturnString + dbo.f_Reportlink_INT(''StockLstID_Detail'',@nID_Detail)
SET @cReturnString = @cReturnString + ''> Stock ID_Detail ''+LTRIM(RTRIM(STR(@nID_Detail)))+''</a>''

RETURN @cReturnString


/*
GRANT EXECUTE ON [dbo].[f_HTML_link_StockLstID_Detail] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_StockLstID_Detail] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_StockLstID_Detail] TO [WINDFALL\HPA] AS [dbo];
*/
END' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_HTML_link_Swage]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_HTML_link_Swage]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_HTML_link_Swage]
(
@nLot INT
)
RETURNS VARCHAR(2000)
AS
BEGIN

--SELECT dbo.f_HTML_link_Swage(1000)

DECLARE @cReturnString VarChar(2000)


SET @cReturnString = ''<a href='' 
SET @cReturnString = @cReturnString + dbo.f_Reportlink_INT(''Swage_log'',@nLot)
SET @cReturnString = @cReturnString + ''> Swage Lot ''+LTRIM(RTRIM(STR(@nLot)))+''</a>''

RETURN @cReturnString
END


/*
GRANT EXECUTE ON [dbo].[f_HTML_link_Swage] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_Swage] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_Swage] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_HTML_link_Wire]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_HTML_link_Wire]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create FUNCTION [dbo].[f_HTML_link_Wire]
(
@nLot INT
)
RETURNS VARCHAR(2000)
AS
BEGIN

--SELECT dbo.f_HTML_link_Wire(2000)

DECLARE @cReturnString VarChar(2000)


SET @cReturnString = ''<a href='' 
SET @cReturnString = @cReturnString + dbo.f_Reportlink_INT(''Wire_log'',@nLot)
SET @cReturnString = @cReturnString + ''> Wire Lot ''+LTRIM(RTRIM(STR(@nLot)))+''</a>''

RETURN @cReturnString
END


/*
GRANT EXECUTE ON [dbo].[f_HTML_link_Wire] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_Wire] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_Wire] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_HTML_link_WO]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_HTML_link_WO]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_HTML_link_WO]
(
@nWO INT
)
RETURNS VARCHAR(2000)
AS
BEGIN

--SELECT dbo.f_HTML_link_WO()

DECLARE @cReturnString VarChar(2000)

--DECLARE @cReport_Server VARCHAR(100) = ERP_2.dbo.f_GetSQL_Report_Server()
--    SET @cReport_Server              =''https://PEREGRINE/ReportServer/Pages/ReportViewer.aspx''

SET @cReturnString = ''<a href=''
SET @cReturnString = @cReturnString + dbo.f_Reportlink_INT(''WO'',@nWO)
SET @cReturnString = @cReturnString + ''> WO '' +CAST(@nWO AS CHAR(10))+''</a>''

RETURN @cReturnString
END

/*
GRANT EXECUTE ON [dbo].[f_HTML_link_WO] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_WO] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_WO] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_HTML_link_WO_Detail]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_HTML_link_WO_Detail]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_HTML_link_WO_Detail]
(
@nWO_Detail INT
)
RETURNS VARCHAR(2000)
AS
BEGIN

--SELECT dbo.f_HTML_link_WO_Detail()

DECLARE @cReturnString VarChar(2000)


SET @cReturnString = ''<a href=''
SET @cReturnString = @cReturnString + dbo.f_Reportlink_INT(''WO_Detail'',@nWO_Detail)
SET @cReturnString = @cReturnString + ''> WO Detail ''+CAST(@nWO_Detail AS CHAR(10))+''</a>''

RETURN @cReturnString
END

/*
GRANT EXECUTE ON [dbo].[f_HTML_link_WO_Detail] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_WO_Detail] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_WO_Detail] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_HTML_Roll_Wire]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_HTML_Roll_Wire]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CReATE FUNCTION [dbo].[f_HTML_Roll_Wire]
(
@nLot INT
)
RETURNS VARCHAR(2000)
AS
BEGIN

--SELECT dbo.f_HTML_link_Roll(200)

DECLARE @cReturnString VarChar(2000)


SET @cReturnString = ''<a href='' 
SET @cReturnString = @cReturnString + dbo.f_Reportlink_INT(''Roll_log'',@nLot)
SET @cReturnString = @cReturnString + ''> Roll Lot ''+LTRIM(RTRIM(STR(@nLot)))+''</a>''

RETURN @cReturnString
END


/*
GRANT EXECUTE ON [dbo].[f_HTML_link_Wire] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_Wire] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_HTML_link_Wire] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_IND_ContainsType]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_IND_ContainsType]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_IND_ContainsType] 
(
@nIND_Type INT
,@nFind_Type INT
)
RETURNS BIT
AS
BEGIN
	--SET NOCOUNT ON
	--Reads IND_Type and does math to see if the Find Type is in it
	--SELECT dbo.f_IND_ContainsType( SolddAddr.IND_Type,1024 )
	--SELECT dbo.f_IND_ContainsType( 1025,1024 )
	--Table dbo.SolddAddr has IND_Type!
	
	--Also see f_IND_Type, f_Is_IND_Complete_Type
	--Also See p_IND_Number, p_IND_Type
	

	DECLARE @ReturnTrue BIT = 0

	DECLARE @nCurrentInt INT
	SET @nCurrentInt = @nIND_Type



	IF @nCurrentInt >= 262144
		begin
		IF @nFind_Type = 262144
			RETURN 1
			--''Hydro ''

		SET @nCurrentInt = @nCurrentInt - 262144
		end

	IF @nCurrentInt >= 131072
		begin
		IF @nFind_Type = 131072
			RETURN 1
			--''Government ''

		SET @nCurrentInt = @nCurrentInt - 131072
		end

	IF @nCurrentInt >= 65536
		begin
		IF @nFind_Type = 65536
			RETURN 1
			--''GOV_Sub ''

		SET @nCurrentInt = @nCurrentInt - 65536
		end

	IF @nCurrentInt >= 32768
		begin
		IF @nFind_Type = 32768
			RETURN 1
			--''Food ''

		SET @nCurrentInt = @nCurrentInt - 32768
		end

	IF @nCurrentInt >= 16384
		begin
		IF @nFind_Type = 16384
			RETURN 1
			--Fabricator ''
		
		SET @nCurrentInt = @nCurrentInt - 16384
		end

	IF @nCurrentInt >= 8192
		begin
		IF @nFind_Type = 8192
			RETURN 1
			--''Medical ''

		SET @nCurrentInt = @nCurrentInt - 8192
		end

	IF @nCurrentInt >= 4096
		begin
		IF @nFind_Type = 4096
			RETURN 1
			--''Service ''

		SET @nCurrentInt = @nCurrentInt - 4096
		end
		
	IF @nCurrentInt >= 2048
		begin
		IF @nFind_Type = 2048
			RETURN 1
			--''Nuclear ''

		SET @nCurrentInt = @nCurrentInt - 2048
		end
		
	IF @nCurrentInt >= 1024
		begin
		IF @nFind_Type = 1024
			RETURN 1
			--''Nuclear ''

		SET @nCurrentInt = @nCurrentInt - 1024
		end
		
	IF @nCurrentInt >= 512
		begin
		IF @nFind_Type = 512
			RETURN 1
			--''Military ''

		SET @nCurrentInt = @nCurrentInt - 512
		end
		
	IF @nCurrentInt >= 256
		begin
		IF @nFind_Type = 256
			RETURN 1
			--''Pharma ''

		SET @nCurrentInt = @nCurrentInt - 256
		end
	
	IF @nCurrentInt >= 128
		begin
		IF @nFind_Type = 128
			RETURN 1
			--''Oil Gas 

		SET @nCurrentInt = @nCurrentInt - 128
		end
		
	IF @nCurrentInt >= 64
		begin
		IF @nFind_Type = 64
			RETURN 1
			--''Chemical ''

		SET @nCurrentInt = @nCurrentInt - 64
		end
		
	IF @nCurrentInt >= 32
		begin
		IF @nFind_Type = 32
			RETURN 1
			--''AeroSpace ''

		SET @nCurrentInt = @nCurrentInt - 32
		end

	IF @nCurrentInt >= 16
		begin
		IF @nFind_Type = 16
			RETURN 1
			--''HighTemp ''

		SET @nCurrentInt = @nCurrentInt - 16
		end
		
	IF @nCurrentInt >= 8
		begin
		IF @nFind_Type = 8
			RETURN 1
			--''Wear ''

		SET @nCurrentInt = @nCurrentInt - 8
		end

	IF @nCurrentInt >= 4
		begin
		IF @nFind_Type = 4
			RETURN 1
			--''Corrosion ''

		SET @nCurrentInt = @nCurrentInt - 4
		end

	IF @nCurrentInt >= 2
		begin
		IF @nFind_Type = 2
			RETURN 1
			--''Competitor ''

		SET @nCurrentInt = @nCurrentInt - 2
		end

	IF @nCurrentInt >= 1
		begin
		IF @nFind_Type = 1
			RETURN 1
			--''Consumer ''

		SET @nCurrentInt = @nCurrentInt - 1
		end

	RETURN 0

END
/*
GRANT EXECUTE ON [dbo].[f_IND_Type] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_IND_Type] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_IND_Type] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_IND_Type]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_IND_Type]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_IND_Type] 
(
@nIND_Type INT
)
RETURNS VARCHAR(254)
AS
BEGIN
	--SET NOCOUNT ON
	--SELECT dbo.f_IND_Type( 3 )
	--SELECT dbo.f_IND_Type( SolddAddr.IND_Type ) or ( Customer_List_Notes.IND_Type )
	--Table dbo.SolddAddr has IND_Type!
	
	--Also see f_IND_Type, f_Is_IND_Complete_Type
	--Also See p_IND_Number, p_IND_Type
	
	DECLARE @cReturn VARCHAR(254)
	SET @cReturn = ''''
	

	DECLARE @nCurrentInt INT
	SET @nCurrentInt = @nIND_Type



	IF @nCurrentInt >= 131072
		begin
		SET @nCurrentInt = @nCurrentInt - 131072
		--SET @cReturn = @cReturn + ''Government ''
		SELECT @cReturn = @cReturn + RTRIM(Industry) + '' '' FROM dbo.IND_type WHERE Number = 131072
		end

	IF @nCurrentInt >= 65536
		begin
		SET @nCurrentInt = @nCurrentInt - 65536
		--SET @cReturn = @cReturn + ''GOV_Sub ''
		SELECT @cReturn = @cReturn + RTRIM(Industry) + '' '' FROM dbo.IND_type WHERE Number = 65536
		end

	IF @nCurrentInt >= 32768
		begin
		SET @nCurrentInt = @nCurrentInt - 32768
		--SET @cReturn = @cReturn + ''Food ''
		SELECT @cReturn = @cReturn + RTRIM(Industry) + '' '' FROM dbo.IND_type WHERE Number = 32768
		end

	IF @nCurrentInt >= 16384
		begin
		SET @nCurrentInt = @nCurrentInt - 16384
		--SET @cReturn = @cReturn + ''Fabricator ''
		SELECT @cReturn = @cReturn + RTRIM(Industry) + '' '' FROM dbo.IND_type WHERE Number = 16384
		end

	IF @nCurrentInt >= 8192
		begin
		SET @nCurrentInt = @nCurrentInt - 8192
		--SET @cReturn = @cReturn + ''Medical ''
		SELECT @cReturn = @cReturn + RTRIM(Industry) + '' '' FROM dbo.IND_type WHERE Number = 8192
		end

	IF @nCurrentInt >= 4096
		begin
		SET @nCurrentInt = @nCurrentInt - 4096
		--SET @cReturn = @cReturn + ''Service ''
		SELECT @cReturn = @cReturn + RTRIM(Industry) + '' '' FROM dbo.IND_type WHERE Number = 4096
		end
		
	IF @nCurrentInt >= 2048
		begin
		SET @nCurrentInt = @nCurrentInt - 2048
		--SET @cReturn = @cReturn + ''Conversion ''
		SELECT @cReturn = @cReturn + RTRIM(Industry) + '' '' FROM dbo.IND_type WHERE Number = 2048
		end
		
	IF @nCurrentInt >= 1024
		begin
		SET @nCurrentInt = @nCurrentInt - 1024
		--SET @cReturn = @cReturn + ''Nuclear ''
		SELECT @cReturn = @cReturn + RTRIM(Industry) + '' '' FROM dbo.IND_type WHERE Number = 1024
		end
		
	IF @nCurrentInt >= 512
		begin
		SET @nCurrentInt = @nCurrentInt - 512
		--SET @cReturn = @cReturn + ''Military ''
		SELECT @cReturn = @cReturn + RTRIM(Industry) + '' '' FROM dbo.IND_type WHERE Number = 512
		end
		
	IF @nCurrentInt >= 256
		begin
		SET @nCurrentInt = @nCurrentInt - 256
		--SET @cReturn = @cReturn + ''Pharma ''
		SELECT @cReturn = @cReturn + RTRIM(Industry) + '' '' FROM dbo.IND_type WHERE Number = 256
		end
	
	IF @nCurrentInt >= 128
		begin
		SET @nCurrentInt = @nCurrentInt - 128
		--SET @cReturn = @cReturn + ''Oil Gas ''
		SELECT @cReturn = @cReturn + RTRIM(Industry) + '' '' FROM dbo.IND_type WHERE Number = 128
		end
		
	IF @nCurrentInt >= 64
		begin
		SET @nCurrentInt = @nCurrentInt - 64
		--SET @cReturn = @cReturn + ''Chemical ''
		SELECT @cReturn = @cReturn + RTRIM(Industry) + '' '' FROM dbo.IND_type WHERE Number = 64
		end
		
	IF @nCurrentInt >= 32
		begin
		SET @nCurrentInt = @nCurrentInt - 32
		--SET @cReturn = @cReturn + ''AeroSpace ''
		SELECT @cReturn = @cReturn + RTRIM(Industry) + '' '' FROM dbo.IND_type WHERE Number = 32
		end

	IF @nCurrentInt >= 16
		begin
		SET @nCurrentInt = @nCurrentInt - 16
		--SET @cReturn = @cReturn + ''HighTemp ''
		SELECT @cReturn = @cReturn + RTRIM(Industry) + '' '' FROM dbo.IND_type WHERE Number = 16
		end
		
	IF @nCurrentInt >= 8
		begin
		SET @nCurrentInt = @nCurrentInt - 8
		--SET @cReturn = @cReturn + ''Wear ''
		SELECT @cReturn = @cReturn + RTRIM(Industry) + '' '' FROM dbo.IND_type WHERE Number = 8
		end

	IF @nCurrentInt >= 4
		begin
		SET @nCurrentInt = @nCurrentInt - 4
		--SET @cReturn = @cReturn + ''Corrosion ''
		SELECT @cReturn = @cReturn + RTRIM(Industry) + '' '' FROM dbo.IND_type WHERE Number = 4
		end

	IF @nCurrentInt >= 2
		begin
		SET @nCurrentInt = @nCurrentInt - 2
		--SET @cReturn = @cReturn + ''Competitor ''
		SELECT @cReturn = @cReturn + RTRIM(Industry) + '' '' FROM dbo.IND_type WHERE Number = 2
		end

	IF @nCurrentInt >= 1
		begin
		SET @nCurrentInt = @nCurrentInt - 1
		--SET @cReturn = @cReturn + ''Consumer ''
		SELECT @cReturn = @cReturn + RTRIM(Industry) + '' '' FROM dbo.IND_type WHERE Number = 1
		end

	RETURN @cReturn

END
/*
GRANT EXECUTE ON [dbo].[f_IND_Type] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_IND_Type] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_IND_Type] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Industry_CustID]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Industry_CustID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
Create FUNCTION [dbo].[f_Industry_CustID] 
(
@cCustID CHAR(20)
--,@nSoldAddr INT
)

RETURNS VARCHAR(254)
AS
BEGIN
	
	--SELECT dbo.f_Industry_CustID( cCustID,SoldAddr )  try CustID First
	--Table dbo.Customer_List_Notes has IND_Type!
	
	--Also see f_IND_Type, f_Is_IND_Complete_Type
	--Also See p_IND_Number, p_IND_Type
	
	DECLARE @nIND_Type INT = 0

	SELECT @nIND_Type = IND_Type FROM dbo.Customer_List_Notes WHERE CustomerID = @cCustID

--	IF @nIND_Type = 0
	--	IF @nSoldAddr > 0
		--	SELECT @nIND_Type = IND_Type FROM dbo.SoldAddr WHERE soldcode = @nSoldAddr


	RETURN @nIND_Type

END
/*
GRANT EXECUTE ON [dbo].[f_Industry_CustID] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_Industry_CustID] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_Industry_CustID] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Is_Country_Restricted]    Script Date: 12/26/2025 5:48:51 PM ******/
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

--SELECT dbo.f_Is_Country_Restricted (''Congo'')
--SELECT dbo.f_Is_Country_Restricted (''Switzerland'') 
DECLARE @lReturn BIT

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @lReturn = 0

SELECT @lReturn=Restricted FROM ERP_2.dbo.Countries WHERE CountryCode = @cISO2 
	

RETURN @lReturn
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Is_GFMlot_toSpec]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Is_GFMlot_toSpec]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Is_GFMlot_toSpec]
(
 @GFMlot INT
,@HPAspec VARCHAR(30)
,@SpecRev CHAR(10)
)
RETURNS BIT
AS

BEGIN
--SELECT Lot Spec,sSize, GFMsize, fSize, ColdWork, Tensile,Yield,Elongation,Red_Area,tLoc, BHN, Rockwell FROM dbo.GFMlog WHERE Lot=4800
--SELECT [Description], Diamax, Diamin,UTSmax,UTSmin,YLDmax, YLDmin, ELmin, RAmin,BHNmax,BHNmin, RCmax, RCmin, RBmax, RBmin FROM dbo.Spec_Check WHERE spec = ''HPA-MS-105                    '' AND Rev = ''B''

--SELECT dbo.f_Is_GFMlot_toSpec(4800,''HPA-MS-105'',''B'') AS MeetsAll7
--SELECT dbo.f_Is_GFMlot_toSpec(4800,''HPA-MS-102                    '','''') AS MS_102

--** function GFM lot meets spec HPA-MS
--DECLARE @GFMlot INT = 4800
--DECLARE @HPAspec VARCHAR(30) = ''HPA-MS-105                    '' ,@SpecRev CHAR(10) = ''B''


--Also See:
--SELECT dbo.f_HeatLot_lot(Heat)
--SELECT dbo.f_GetMachine_Log(''GFM'')
--SELECT dbo.f_GetMachine_Table( dbo.f_GetMachine_init(''GFM'') )
--SELECT dbo.f_GetMachine_LogList() AS [Typs of Machines]

--SELECT dbo.f_GetMachine_init(''GFM'')
--SELECT dbo.f_GetMachine_Caption(''G'')
--SELECT dbo.f_GetMachine_List()

----------------------------------------------------------------------------
/* SELECT dbo.f_HeatLot_Lot(lot),* FROM dbo.Stocklst_Master 
WHERE dbo.f_HeatLot_Lot(lot) IN
(SELECT Distinct ''G''+CAST(Lot AS CHAR(10)) FROM dbo.gfmlog WHERE
AlloyName = ''HPA N60'' 
AND dbo.f_Is_GFMlot_toSpec(lot,''HPA-MS-104                    '','''')=1 ) 
*/
----------------------------------------------------------------------------


SET @SpecRev = NULLIF(@SpecRev,'''')

DECLARE @Spec CHAR(50)
, @sSize Decimal(9,3)
, @GFMsize Decimal(9,3)
, @fSize Decimal(9,3)
, @ColdWork Decimal(3,3)
, @Tensile	INT
, @Yield	INT
, @Elongation INT
, @Red_Area	INT
, @tLoc	CHAR(1)
, @BHN	SmallInt
, @cRockwell CHAR(4)

SELECT TOP 1 @Spec=Spec,@sSize=sSize, @GFMsize=GFMsize, @fSize=fSize, @ColdWork=ColdWork
	, @Tensile=Tensile,@Yield=Yield,@Elongation=Elongation,@Red_Area=Red_Area
	,@tLoc=tLoc, @BHN=BHN, @cRockwell=Rockwell 
	FROM dbo.GFMlog WHERE Lot=@GFMlot

DECLARE @Description CHAR(60)
, @Diamax Decimal(7,3)
, @Diamin Decimal(7,3)
, @UTSmax INT
, @UTSmin INT
, @YLDmax INT
, @YLDmin INT
, @ELmin  INT
, @RAmin  INT
, @BHNmax Decimal(3,0)
, @BHNMin Decimal(3,0)
, @RCmax Decimal(3,0)
, @RCmin Decimal(3,0)
, @RBmax Decimal(3,0)
, @RBmin Decimal(3,0)

--***************************************************
IF (@SpecRev IS NULL)
	begin
	-- No Rev, use lateast
	SELECT TOP 1 @Description=[Description], @Diamax=Diamax, @Diamin=Diamin
		,@UTSmax=UTSmax,@UTSmin=UTSmin,@YLDmax=YLDmax, @YLDmin=YLDmin, @ELmin=ELmin, @RAmin=RAmin
		,@BHNmax=BHNmax,@BHNMin=BHNMin, @RCmax=RCmax, @RCmin=RCmin, @RBmax=RBmax, @RBmin=RBmin 
		FROM dbo.Spec_Check WHERE spec = @HPAspec
		ORDER BY rev

/*	SELECT TOP 1 [Description], Diamax, Diamin
		,UTSmax, UTSmin, YLDmax, YLDmin, ELmin, RAmin
		, BHNmax, BHNMin, RCmax, RCmin, RBmax, RBmin 
		,Spec , Rev
		FROM dbo.Spec_Check WHERE spec = @HPAspec
		ORDER BY rev
		*/
	end
ELSE
	begin
	SELECT TOP 1 @Description=[Description], @Diamax=Diamax, @Diamin=Diamin
		,@UTSmax=UTSmax,@UTSmin=UTSmin,@YLDmax=YLDmax, @YLDmin=YLDmin, @ELmin=ELmin, @RAmin=RAmin
		,@BHNmax=BHNmax,@BHNMin=BHNMin, @RCmax=RCmax, @RCmin=RCmin, @RBmax=RBmax, @RBmin=RBmin 
		FROM dbo.Spec_Check WHERE spec = @HPAspec AND Rev = @SpecRev

/*	SELECT TOP 1 [Description], Diamax, Diamin
		,UTSmax, UTSmin, YLDmax, YLDmin, ELmin, RAmin
		, BHNmax, BHNMin, RCmax, RCmin, RBmax, RBmin 
		,Spec , Rev
		FROM dbo.Spec_Check WHERE spec = @HPAspec AND Rev = @SpecRev 
		*/
	end


--Dia check
--PRINT ''fSize ''+CAST(@fSize AS CHAR(10))
DECLARE @DiaOK BIT = 0
IF @fSize > 0
	begin
	--Found a fSize
	SET @DiaOK = 1
	
	IF @Diamin > 0
		begin

		IF @Diamax > 0
			IF @fSize > @Diamin AND @fSize < @Diamax
				SET @DiaOK = 1
			ELSE 
				SET @DiaOK = 0
		ELSE
			IF @fSize > @Diamin 
				SET @DiaOK = 1
			ELSE
				SET @DiaOK = 0
		end
	ELSE
		IF @Diamax > 0
			IF @fSize < @Diamax
				SET @DiaOK = 1
			ELSE
				SET @DiaOK = 0

	end
--PRINT CONCAT(''@DiaOK '',@DiaOK)

--Tensile Check
--PRINT ''Tensile ''+CAST(@Tensile AS CHAR(10))
DECLARE @TensileOK BIT = 0
IF @Tensile > 0
	begin
	--Found a fSize
	SET @TensileOK = 1
	
	IF @UTSmin > 0
		begin

		IF @Diamax > 0
			IF @Tensile > @UTSmin AND @Tensile < @UTSmax
				SET @TensileOK = 1
			ELSE 
				SET @TensileOK = 0
		ELSE
			IF @Tensile > @UTSmin 
				SET @TensileOK = 1
			ELSE
				SET @TensileOK = 0
		end
	ELSE
		IF @UTSmax > 0
			IF @Tensile < @UTSmax
				SET @TensileOK = 1
			ELSE
				SET @TensileOK = 0

	end
--PRINT CONCAT(''@TensileOK '',@TensileOK)

--Yeild check
--PRINT ''Yield ''+CAST(@Yield AS CHAR(10))
DECLARE @YieldOK BIT = 0
IF @Yield > 0
	begin
	--Found a Yield
	SET @YieldOK = 1
	
	IF @Diamin > 0
		begin

		IF @Diamax > 0
			IF @Yield > @YLDmin AND @Yield < @YLDmax
				SET @YieldOK = 1
			ELSE 
				SET @YieldOK = 0
		ELSE
			IF @Yield > @YLDmin 
				SET @YieldOK = 1
			ELSE
				SET @YieldOK = 0
		end
	ELSE
		IF @Diamax > 0
			IF @Yield < @YLDmax
				SET @YieldOK = 1
			ELSE
				SET @YieldOK = 0
	end
--PRINT CONCAT(''@YieldOK '',@YieldOK)

--PRINT ''Elongation ''+CAST(@Elongation AS CHAR(10))
--@Elongation check
DECLARE @ElOK BIT = 0
IF @Elongation > 0
	begin
	--Found a @Elongation
	SET @ElOK = 1
	
	IF @ELmin > 0
		begin

		IF @ELmin > 0
			IF @Elongation > @ELmin 
				SET @ElOK = 1
			ELSE
				SET @ElOK = 0
		end

	end
--PRINT CONCAT(''@ElOK '',@ElOK)

--@RA check
DECLARE @RAOK BIT = 0
IF @Red_Area > 0
	begin
	--Found a @Elongation
	--PRINT ''RA ''+CAST(@Red_Area AS CHAR(10))

	SET @RAOK = 1
	
	IF @RAmin > 0
		begin

		IF @RAmin > 0
			IF @Red_Area > @RAmin 
				SET @RAOK = 1
			ELSE
				SET @RAOK = 0
		end

	end
--PRINT CONCAT(''@RAOK '',@RAOK)

--BHN check
DECLARE @BHNOK BIT = 1
IF @BHN > 0
	begin
	--Found a BHN
	--PRINT ''BHN ''+CAST(@BHN AS CHAR(3))
	SET @BHNOK = 1
	
	IF @BHNmin > 0
		begin

		IF @BHNmax > 0
			IF @BHN > @BHNmin AND @BHN < @BHNmax
				SET @BHNOK = 1
			ELSE 
				SET @BHNOK = 0
		ELSE
			IF @BHN > @YLDmin 
				SET @BHNOK = 1
			ELSE
				SET @BHNOK = 0
		end
	ELSE
		IF @BHNmax > 0
			IF @BHN < @BHNmax
				SET @BHNOK = 1
			ELSE
				SET @BHNOK = 0
	end

--PRINT CONCAT(''@BHNOK '',@BHNOK)

------, @BHN	SmallInt , @cRockwell CHAR(4)
------,@BHNmax=BHNmax,@BHNMin=BHNMin, @RCmax=RCmax, @RCmin=RCmin, @RBmax=RBmax, @RBmin=RBmin 

--Rockwell check
--PRINT ''Rockwell ''+TRIM(@cRockwell)
--PRINT ''RCmin ''+CAST( ISNULL(@RCmin,0) AS CHAR(3))
--PRINT ''RCmax ''+CAST( ISNULL(@RCmax,0) AS CHAR(3))

SET @cRockwell = TRIM(@cRockwell)
DECLARE @cRCmin AS CHAR(5), @cRCmax AS CHAR(5)
SET @cRCmin = RTRIM( LTRIM(CAST( ISNULL(@RCmin,0) AS CHAR(10) ) ))
SET @cRCmax = RTRIM( LTRIM(CAST( ISNULL(@RCmax,0) AS CHAR(10) ) ))

IF @cRCmin = 0
	SET @cRCmin = ''''
ELSE
	SET @cRCmin = ''R''+@cRCmin

IF @cRCmax = 0
	SET @cRCmax = ''''
ELSE
	SET @cRCmax = ''R''+@cRCmax

DECLARE @RcOK BIT = 1
IF LEN(@cRockwell) > 0
	begin
	--Found a Rc
	SET @RcOK = 1
	
	IF @RCmin > 0
		begin

		IF @RCmax > 0
			IF @cRockwell > @cRCmin AND @BHN < @cRCmax
				SET @RcOK = 1
			ELSE 
				SET @RcOK = 0
		ELSE
			IF @cRockwell > @cRCmin 
				SET @RcOK = 1
			ELSE
				SET @RcOK = 0
		end
	ELSE
		IF @RCmax > 0
			IF @cRockwell < @cRCmax
				SET @RcOK = 1
			ELSE
				SET @RcOK = 0
	end


--PRINT CONCAT(''@RcOK '',@RcOK)

--PRINT ''------- Complete --------------''


--RETURN ( SELECT @DiaOK AS DiaOK, @TensileOK AS TensileOK, @YieldOK AS YieldOK, @RAOK AS RAOK, @ElOK AS ElOK, @BHNOK AS BHNOK, @RcOK AS RcOK )

RETURN @DiaOK& @TensileOK& @YieldOK& @RAOK& @ElOK& @BHNOK& @RcOK
END

--GRANT EXECUTE ON [dbo].[f_Is_GFMlot_toSpec] TO [HPA_Service] AS [dbo];
--GRANT EXECUTE ON [dbo].[f_Is_GFMlot_toSpec] TO [WINDFALL\HPA Reports] AS [dbo];
--GRANT EXECUTE ON [dbo].[f_Is_GFMlot_toSpec] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Is_HPA_Cert]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Is_HPA_Cert]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_Is_HPA_Cert]
(
@cSOitem CHAR(10)

)
RETURNS BIT
AS
BEGIN

--SELECT dbo.f_Is_HPA_Cert('''')

DECLARE @lReturn BIT

declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @nCount INT

SELECT @nCount = COUNT(PS.Packingsli)
	FROM dbo.PackingSlip PS WITH(NOLOCK)
	WHERE PS.SOitem = @cSOitem
	AND Heat LIKE ''%HPA%''

SET @lReturn = 0
IF @nCount > 0
	SET @lReturn = 1

	
RETURN @lReturn
END
/*
SELECT PS.Packingsli,Heat, case when Heat LIKE ''%HPA %'' then ''Space'' else ''NoSpc'' end
	FROM dbo.PackingSlip PS WITH(NOLOCK)
	WHERE  Heat LIKE ''%HPA%''
*/
--f_Is_HPA_Cert

/*
GRANT EXECUTE ON [dbo].[f_Is_HPA_Cert] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_Is_HPA_Cert] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_Is_HPA_Cert] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Is_HPAcore]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Is_HPAcore]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'Create FUNCTION [dbo].[f_Is_HPAcore]
(
@cAlloy char(12)
)
RETURNS BIT
AS
BEGIN

--SELECT dbo.f_Is_HPAcore (''C-276'')
--SELECT dbo.f_Is_HPAcore (''C-276'') AS [Stk]
DECLARE @lReturn BIT

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @lReturn = 0

IF EXISTS( SELECT * FROM dbo.Alloy 
		WHERE Alloy = @cAlloy 
		AND HPAcore = 1 )
	SET @lReturn = 1

RETURN @lReturn
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Is_HPAStock]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Is_HPAStock]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_Is_HPAStock]
(
@cAlloy char(12)
)
RETURNS BIT
AS
BEGIN

--SELECT dbo.f_Is_HPAStock (''C-276'')
--SELECT dbo.f_Is_HPAStock (''C-276'') AS [Stk]
DECLARE @lReturn BIT

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @lReturn = 0

IF EXISTS( SELECT * FROM dbo.Alloy 	WHERE Alloy = @cAlloy AND HPAstock = 1 )
	SET @lReturn = 1

RETURN @lReturn
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Is_IND_Complete_Type]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Is_IND_Complete_Type]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Is_IND_Complete_Type] 
(
@nVendCode INT,
@nIND_Type INT
)
RETURNS BIT
AS
BEGIN
--Is the Vendor of a certain Type
--SELECT dbo.f_Is_IND_Type( 8888, 3 )

--Also see f_IND_Type, f_Is_IND_Complete_Type
--Also See p_IND_Number, p_IND_Type

DECLARE @lReturn BIT
SET @lReturn = 0

DECLARE @nCurrentInt2 INT
SELECT @nCurrentInt2 = Ind_type FROM dbo.Vendor WHERE VendCode = @nVendCode

DECLARE @nCurrentInt INT
SET @nCurrentInt = @nIND_Type

DECLARE @Consumer BIT
SET @Consumer = 0
Declare @Competitor BIT
SET @Competitor = 0
DECLARE @Corrosion BIT
SET @Corrosion = 0
DECLARE @Wear BIT
SET @Wear = 0
DECLARE @HighTemp BIT
SET @HighTemp = 0
DECLARE @AeroSpace BIT
SET @AeroSpace = 0
DECLARE @Chemical BIT
SET @Chemical = 0
DECLARE @oil BIT
SET @Oil = 0
DECLARE @Pharm BIT
SET @Pharm = 0
DECLARE @Military BIT
SET @Military = 0
DECLARE @Nuclear BIT
SET @Nuclear = 0
DECLARE @Medical BIT
SET @Medical = 0

DECLARE @Conversion BIT
SET @Conversion = 0
DECLARE @Service BIT
SET @Service = 0
DECLARE @Fabricator BIT
SET @Fabricator = 0

DECLARE @Food BIT
SET @Food = 0
DECLARE @Gov BIT
SET @Gov = 0
DECLARE @GovSub BIT
SET @GovSub = 0

IF @nCurrentInt >= 65536
	begin
	SET @Gov = 1
	SET @nCurrentInt = @nCurrentInt - 65536
	end

IF @nCurrentInt >= 65536
	begin
	SET @GovSub = 1
	SET @nCurrentInt = @nCurrentInt - 65536
	end

IF @nCurrentInt >= 32768
	begin
	SET @Food = 1
	SET @nCurrentInt = @nCurrentInt - 32768
	end

IF @nCurrentInt >= 16384
	begin
	SET @Fabricator = 1
	SET @nCurrentInt = @nCurrentInt - 16384
	end

IF @nCurrentInt >= 8192
	begin
	SET @Medical = 1
	SET @nCurrentInt = @nCurrentInt - 8192
	end
		
IF @nCurrentInt >= 4096
	begin
	SET @Service = 1
	SET @nCurrentInt = @nCurrentInt - 4096
	end

IF @nCurrentInt >= 2048
	begin
	SET @Conversion = 1
	SET @nCurrentInt = @nCurrentInt - 2048
	end
		
IF @nCurrentInt >= 1024
	begin
	SET @Nuclear = 1
	SET @nCurrentInt = @nCurrentInt - 1024
	end
		
IF @nCurrentInt >= 512
	begin
	SET @Military = 1
	SET @nCurrentInt = @nCurrentInt - 512
	end
		
IF @nCurrentInt >= 256
	begin
	SET @Pharm = 1
	SET @nCurrentInt = @nCurrentInt - 256
	end
	
IF @nCurrentInt >= 128
	begin
	SET @oil = 1
	SET @nCurrentInt = @nCurrentInt - 128
	end
		
IF @nCurrentInt >= 64
	begin
	SET @Chemical = 1
	SET @nCurrentInt = @nCurrentInt - 64
	end
		
IF @nCurrentInt >= 32
	begin
	SET @AeroSpace = 1
	SET @nCurrentInt = @nCurrentInt - 32
	end

IF @nCurrentInt >= 16
	begin
	SET @HighTemp = 1
	SET @nCurrentInt = @nCurrentInt - 16
	end
		
IF @nCurrentInt >= 8
	begin
	SET @Wear = 1
	SET @nCurrentInt = @nCurrentInt - 8
	end

IF @nCurrentInt >= 4
	begin
	SET @Corrosion = 1
	SET @nCurrentInt = @nCurrentInt - 4
	end

IF @nCurrentInt >= 2
	begin
	SET @Competitor = 1
	SET @nCurrentInt = @nCurrentInt - 2
	end

IF @nCurrentInt >= 1
	begin
	SET @Consumer = 1
	SET @nCurrentInt = @nCurrentInt - 1
	end

---------------------------------

DECLARE @Consumer2 BIT
SET @Consumer2 = 0
Declare @Competitor2 BIT
SET @Competitor2 = 0
DECLARE @Corrosion2 BIT
SET @Corrosion2 = 0
DECLARE @Wear2 BIT
SET @Wear2 = 0
DECLARE @HighTemp2 BIT
SET @HighTemp2 = 0
DECLARE @AeroSpace2 BIT
SET @AeroSpace2 = 0
DECLARE @Chemical2 BIT
SET @Chemical2 = 0
DECLARE @oil2 BIT
SET @Oil2 = 0
DECLARE @Pharm2 BIT
SET @Pharm2 = 0
DECLARE @Military2 BIT
SET @Military2 = 0
DECLARE @Nuclear2 BIT
SET @Nuclear2 = 0
DECLARE @Medical2 BIT
SET @Medical2 = 0
DECLARE @Conversion2 BIT
SET @Conversion2 = 0
DECLARE @Service2 BIT
SET @Service2 = 0
DECLARE @Fabricator2 BIT
SET @Fabricator2 = 0
DECLARE @Food2 BIT
SET @Food2 = 0

DECLARE @GovSub2 BIT
SET @GovSub2 = 0
DECLARE @Gov2 BIT
SET @Gov2 = 0


IF @nCurrentInt2 >= 131072
	begin
	SET @Gov2 = 1
	SET @nCurrentInt2 = @nCurrentInt2 - 131072
	end

IF @nCurrentInt2 >= 65536
	begin
	SET @GovSub2 = 1
	SET @nCurrentInt2 = @nCurrentInt2 - 65536
	end

IF @nCurrentInt2 >= 32768
	begin
	SET @Food2 = 1
	SET @nCurrentInt2 = @nCurrentInt2 - 32768
	end

IF @nCurrentInt2 >= 16384
	begin
	SET @Fabricator2 = 1
	SET @nCurrentInt2 = @nCurrentInt2 - 16384
	end
		
IF @nCurrentInt2 >= 8192
	begin
	SET @Medical2 = 1
	SET @nCurrentInt2 = @nCurrentInt2 - 8192
	end

IF @nCurrentInt2 >= 4096
	begin
	SET @Service2 = 1
	SET @nCurrentInt2 = @nCurrentInt2 - 4096
	end

IF @nCurrentInt2 >= 2048
	begin
	SET @Conversion2 = 1
	SET @nCurrentInt2 = @nCurrentInt2 - 2048
	end
		
IF @nCurrentInt2 >= 1024
	begin
	SET @Nuclear2 = 1
	SET @nCurrentInt2 = @nCurrentInt2 - 1024
	end
		
IF @nCurrentInt2 >= 512
	begin
	SET @Military2 = 1
	SET @nCurrentInt2 = @nCurrentInt2 - 512
	end
		
IF @nCurrentInt2 >= 256
	begin
	SET @Pharm = 1
	SET @nCurrentInt2 = @nCurrentInt2 - 256
	end
	
IF @nCurrentInt2 >= 128
	begin
	SET @oil2 = 1
	SET @nCurrentInt2 = @nCurrentInt2 - 128
	end
		
IF @nCurrentInt2 >= 64
	begin
	SET @Chemical2 = 1
	SET @nCurrentInt2 = @nCurrentInt2 - 64
	end
		
IF @nCurrentInt2 >= 32
	begin
	SET @AeroSpace2 = 1
	SET @nCurrentInt2 = @nCurrentInt2 - 32
	end

IF @nCurrentInt2 >= 16
	begin
	SET @HighTemp2 = 1
	SET @nCurrentInt2 = @nCurrentInt2 - 16
	end
		
IF @nCurrentInt2 >= 8
	begin
	SET @Wear2 = 1
	SET @nCurrentInt2 = @nCurrentInt2 - 8
	end

IF @nCurrentInt2 >= 4
	begin
	SET @Corrosion2 = 1
	SET @nCurrentInt2 = @nCurrentInt2 - 4
	end

IF @nCurrentInt2 >= 2
	begin
	SET @Competitor2 = 1
	SET @nCurrentInt2 = @nCurrentInt2 - 2
	end

IF @nCurrentInt2 >= 1
	begin
	SET @Consumer2 = 1
	SET @nCurrentInt2 = @nCurrentInt2 - 1
	end

----------------------

IF @Consumer2 = @Consumer
	AND @Competitor2 = @Competitor
	AND @Corrosion2 = @Corrosion
	AND @Wear2 = @Wear
	AND @HighTemp2 = @HighTemp
	AND @AeroSpace2 = @AeroSpace
	AND @Chemical2 = @Chemical
	AND @Oil2 = @Oil
	AND @Pharm2 = @Pharm
	AND @Military2 = @Military
	AND @Nuclear2 = @Nuclear
	AND @Medical2 = @Medical
	AND @Conversion2 = @Conversion
	AND @Service2 = @Service
	AND @Fabricator2 = @Fabricator
	AND @Food2 = @Food
	AND @GovSub2 = @GovSub
	AND @Gov2 = @Gov
	begin

	SET @lReturn = 1
	
	end


RETURN @lReturn

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Is_IND_Type]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Is_IND_Type]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Is_IND_Type] 
(
@nVendCode INT,
@nIND_Type INT
)
RETURNS BIT
AS
BEGIN
--Is the Vendor of a certain IND_Type
--SELECT dbo.f_Is_IND_Type( 10012, 2 ) AS IsType

--Also see f_IND_Type, f_Is_IND_Complete_Type
--Also See p_IND_Number, p_IND_Type

DECLARE @lReturn BIT
SET @lReturn = 0

DECLARE @nInd_Type2 INT
SELECT @nInd_Type2 = Ind_Type FROM dbo.Vendor WHERE VendCode = @nVendCode

IF @nInd_Type2 >= 131072
	begin
	IF @nIND_Type = 131072
		RETURN 1
		--''Government ''

	SET @nInd_Type2 = @nInd_Type2 - 131072
	end

IF @nInd_Type2 >= 65536
	begin
	IF @nIND_Type = 65536
		RETURN 1
		--''GOV_Sub ''

	SET @nInd_Type2 = @nInd_Type2 - 65536
	end

IF @nInd_Type2 >= 32768
	begin
	--Food
	IF @nIND_Type = 32768
		SET @lReturn = 1
	
	SET @nInd_Type2 = @nInd_Type2 - 32768

	end

IF @nInd_Type2 >= 16384
	begin
	--Fabricator
	IF @nIND_Type = 16384
		SET @lReturn = 1
	
	SET @nInd_Type2 = @nInd_Type2 - 16384

	end
IF @nInd_Type2 >= 8192
	begin
	--Medical
	IF @nIND_Type = 8192
		SET @lReturn = 1
	
	SET @nInd_Type2 = @nInd_Type2 - 8192

	end

IF @nInd_Type2 >= 4096
	begin
	--Service
	IF @nIND_Type = 4096
		SET @lReturn = 1
	
	SET @nInd_Type2 = @nInd_Type2 - 4096

	end
		
IF @nInd_Type2 >= 2048
	begin
	--Conversion
	IF @nIND_Type = 2048
		SET @lReturn = 1
	
	SET @nInd_Type2 = @nInd_Type2 - 2048

	end
		
IF @nInd_Type2 >= 1024
	begin
	--Nuclear
	IF @nIND_Type = 1024
		SET @lReturn = 1
	
	SET @nInd_Type2 = @nInd_Type2 - 1024

	end
		
IF @nInd_Type2 >= 512
	begin
	--Military
	IF @nIND_Type = 512
		SET @lReturn = 1
	
	SET @nInd_Type2 = @nInd_Type2 - 512

	end
		
IF @nInd_Type2 >= 256
	begin
	--Pharm
	IF @nIND_Type = 256
		SET @lReturn = 1
	
	SET @nInd_Type2 = @nInd_Type2 - 256

	end
	
IF @nInd_Type2 >= 128
	begin
	--oil
	IF @nIND_Type = 128
		SET @lReturn = 1
	
	SET @nInd_Type2 = @nInd_Type2 - 128

	end
		
IF @nInd_Type2 >= 64
	--Chemical
	begin
	IF @nIND_Type = 64
		SET @lReturn = 1
	
	SET @nInd_Type2 = @nInd_Type2 - 64

	end
	
IF @nInd_Type2 >= 32
	begin
	--AeroSpace
	IF @nIND_Type = 32
		SET @lReturn = 1
	
	SET @nInd_Type2 = @nInd_Type2 - 32

	end
		
IF @nInd_Type2 >= 16
	begin
	--HighTemp
	IF @nIND_Type = 16
		SET @lReturn = 1
	
	SET @nInd_Type2 = @nInd_Type2 - 16

	end
		
IF @nInd_Type2 >= 8
	begin
	--Wear
	IF @nIND_Type = 8
		SET @lReturn = 1
	
	SET @nInd_Type2 = @nInd_Type2 - 8

	end

IF @nInd_Type2 >= 4
	begin
	--Corrosion
	IF @nIND_Type = 4
		SET @lReturn = 1
	
	SET @nInd_Type2 = @nInd_Type2 - 4

	end

IF @nInd_Type2 >= 2
	begin
	--Competitor
	IF @nIND_Type = 2
		SET @lReturn = 1
	
	SET @nInd_Type2 = @nInd_Type2 - 2
	
	end

IF @nInd_Type2 >= 1
	begin
	--Consumer
	IF @nIND_Type = 1
		SET @lReturn = 1
	
	SET @nInd_Type2 = @nInd_Type2 - 1
	
	end


RETURN @lReturn

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Is_POitem_NOT_Stock]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Is_POitem_NOT_Stock]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David Kirchner
-- Create date: 03/12/2021
-- =============================================
Create FUNCTION [dbo].[f_Is_POitem_NOT_Stock] 
(
	@POitem char(12)
)
RETURNS bit
AS
BEGIN

	DECLARE @IsNOTStock bit = 0;

	SELECT @IsNOTStock = 1
		FROM [dbo].[PurchaseOrder] p 
		WHERE p.POitem = dbo.f_ProperPOitem(@POitem)
		AND ( ISNULL([Services],0) = 1
		  OR ISNULL(ConvServ,0) = 1
		  OR ISNULL(Equipment,0) = 1  )
		AND NOT ( Stock = ''All for Stock'' or Stock = ''Some Stock'' ) 
		

RETURN ISNULL(@IsNOTStock,0)

END

/*
GRANT EXECUTE ON [dbo].[f_Is_POitem_NOT_Stock] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_Is_POitem_NOT_Stock] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_Is_POitem_NOT_Stock] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Is_POitem_Stock]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Is_POitem_Stock]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David Kirchner
-- Create date: 03/12/2021
-- =============================================
Create FUNCTION [dbo].[f_Is_POitem_Stock] 
(
	@POitem char(12)
)
RETURNS bit
AS
BEGIN

	DECLARE @IsStock bit = 0;

	SELECT @IsStock = 1
		FROM [dbo].[PurchaseOrder] p 
		WHERE p.POitem = dbo.f_ProperPOitem(@POitem)
		AND ISNULL([Services],0) = 0
		AND ISNULL(ConvServ,0) = 0
		AND ISNULL(Equipment,0) = 0
		AND Stock <> ''No Stock''

RETURN ISNULL(@IsStock,0)

END

/*
GRANT EXECUTE ON [dbo].[f_Is_POitem_Stock] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_Is_POitem_Stock] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_Is_POitem_Stock] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Is_POitemHeld]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Is_POitemHeld]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Brandon van de Venter
-- Create date: 05/06/2020
-- Description:	Checks if a POitem has been held
-- UPDATES:
-- 10/02/2020 - PO''s are not as complicated as SO''s. PurchaseOrder will track the hold status while [Sales_Hold_Status] is used as History tracking.
-- =============================================
CREATE FUNCTION [dbo].[f_Is_POitemHeld] 
(
	-- Add the parameters for the function here
	@POitem char(12)
)
RETURNS bit
AS
BEGIN
	-- SELECT Hold, dbo.f_Is_SOitemHeld(SOitem),SOitem FROM dbo.Sales WITH(NOLOCK) WHERE SalesNum =  117046
	-- SELECT @Hold = dbo.f_Is_POitemHeld(POitem) FROM dbo.PurchaseOrder WITH(NOLOCK) WHERE POitem = 

	DECLARE @held bit = 0;

	SELECT TOP(1) @held = p.Hold
	FROM [dbo].[PurchaseOrder] p 
	WHERE p.POitem = dbo.f_ProperPOitem(@POitem)

	--SELECT TOP(1) @held = s2.Hold_Value
	--FROM [dbo].[Sales_Hold_Status] as s
	--CROSS APPLY
	--(
	--	SELECT TOP(1) Hold_Value, [When]
	--	FROM [dbo].[Sales_Hold_Status] AS s2
	--	WHERE s2.POitem = s.POitem AND s2.Hold_Type = s.Hold_Type
	--	order by s2.[When] desc
	--) AS s2
	--where POitem = @POitem
	--AND RTRIM(Hold_Type) in (''PO'')
	--AND s2.Hold_Value = 1

	-- Return the result of the function
	RETURN ISNULL(@held,0)

END

/*
GRANT EXECUTE ON [dbo].[f_Is_POitemHeld] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_Is_POitemHeld] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_Is_POitemHeld] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Is_Sales_No_Chn_BadTerms]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Is_Sales_No_Chn_BadTerms]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Is_Sales_No_Chn_BadTerms] 
(
	@nSO INT
)
RETURNS BIT
AS
BEGIN
--SELECT dbo.f_Is_Sales_No_Chn_BadTerms( 113000 )


DECLARE @lReturn BIT
SET @lReturn = 0

SELECT TOP 1 @lReturn = BadTerms FROM dbo.Sales_No_Chng WHERE SalesNum = @nSO


RETURN @lReturn

END
/*
GRANT EXECUTE ON [dbo].[f_Is_Sales_No_Chn_BadTerms] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_Is_Sales_No_Chn_BadTerms] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_Is_Sales_No_Chn_BadTerms] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Is_SalesP_NoNoiseName]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Is_SalesP_NoNoiseName]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
Create FUNCTION [dbo].[f_Is_SalesP_NoNoiseName] 
(
@cSalesP CHAR(1),
@cNoNoiseName VarChar(30)
)
RETURNS BIT
AS
BEGIN
--SELECT dbo.f_Is_SalesP_NoNoiseName(''G'',''FASTENAL   '') 
DECLARE @lReturn BIT
SET @lReturn = 0

IF EXISTS( SELECT * FROM dbo.SalesP_Customer
	WHERE SalesP = @cSalesP
		AND NoNoiseName = @cNoNoiseName )
	SET @lReturn = 1

RETURN @lReturn

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Is_SO_OnHold]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Is_SO_OnHold]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David Kirchner
-- Create date: 05/06/2020
-- Description:	Checks if a Any SOitems of SO has been held
-- =============================================
CREATE FUNCTION [dbo].[f_Is_SO_OnHold] 
(
	
	@SalesNum INT
)
RETURNS bit
AS
BEGIN
	--PRINT dbo.f_Is_SO_OnHold(118307)
	--SELECT SUM( CAST(Hold AS TinyInt) ) FROM dbo.Sales WHERE SalesNum = 118306
	--SELECT * FROM dbo.Sales WHERE SalesNum = 118306

	DECLARE @held bit = 0;
	DECLARE @Holds INT = 0

	SELECT @Holds = SUM( CAST(Hold AS TinyInt) )
		FROM dbo.Sales 
		WHERE SalesNum = @SalesNum AND ISNULL(cncld,0)=0  AND ISNULL(cmplt,0)=0

	IF @Holds > 0
		SET @held = 1

	RETURN ISNULL(@held,0)

END

/*
GRANT EXECUTE ON [dbo].[f_Is_SO_OnHold] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_Is_SO_OnHold] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_Is_SO_OnHold] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Is_SOitem_Type_OnHold]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Is_SOitem_Type_OnHold]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David Kirchner
-- Create date: 05/06/2020
-- Description:	Checks if a SOitem has been held
-- =============================================
CREATE FUNCTION [dbo].[f_Is_SOitem_Type_OnHold] 
(
	-- Add the parameters for the function here
	@SOitem char(10)
	,@Type Char(10)
)
RETURNS bit
AS
BEGIN
	-- SELECT Hold, dbo.f_Is_SOitem_Type_OnHold(SOitem,''AR''),SOitem FROM dbo.Sales WITH(NOLOCK) WHERE SalesNum =  117046
	-- SELECT @Hold = dbo.f_Is_SOitem_Type_OnHold(SOitem,''QA'') FROM dbo.Sales WITH(NOLOCK) WHERE SalesNum =  117046
	--PRINT dbo.f_Is_SOitem_Type_OnHold(@SOitem,@Type)

	DECLARE @held bit = 0;

	SELECT TOP(1) @held = s2.Hold_Value
	FROM [dbo].[Sales_Hold_Status] as s
	CROSS APPLY
	(
		SELECT TOP(1) Hold_Value, [When]
		FROM [dbo].[Sales_Hold_Status] AS s2
		WHERE s2.SOitem = s.SOitem AND s2.Hold_Type = s.Hold_Type
		order by s2.[When] desc
	) AS s2
	where SOitem = @SOitem
	AND RTRIM(Hold_Type) = @Type
	AND s2.Hold_Value = 1

	-- Return the result of the function
	RETURN ISNULL(@held,0)

END

/*
GRANT EXECUTE ON [dbo].[f_Is_SOitem_Type_OnHold] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_Is_SOitem_Type_OnHold] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_Is_SOitem_Type_OnHold] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Is_SOitemHeld]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Is_SOitemHeld]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Brandon van de Venter
-- Create date: 05/06/2020
-- Description:	Checks if a SOitem has been held
-- =============================================
CREATE FUNCTION [dbo].[f_Is_SOitemHeld] 
(
	-- Add the parameters for the function here
	@SOitem char(10)
)
RETURNS bit
AS
BEGIN
	-- SELECT Hold, dbo.f_Is_SOitemHeld(SOitem),SOitem FROM dbo.Sales WITH(NOLOCK) WHERE SalesNum =  117046
	-- SELECT @Hold = dbo.f_Is_SOitemHeld(SOitem) FROM dbo.Sales WITH(NOLOCK) WHERE SalesNum =  117046
	--PRINT dbo.f_Is_SOitemHeld(@SOitem)

	DECLARE @held bit = 0;

	SELECT TOP(1) @held = s2.Hold_Value
	FROM [dbo].[Sales_Hold_Status] as s
	CROSS APPLY
	(
		SELECT TOP(1) Hold_Value, [When]
		FROM [dbo].[Sales_Hold_Status] AS s2
		WHERE s2.SOitem = s.SOitem AND s2.Hold_Type = s.Hold_Type
		order by s2.[When] desc
	) AS s2
	where SOitem = @SOitem
	AND RTRIM(Hold_Type) in (''QA'', ''AR'', ''INV'', ''EQP'', ''CSTR'', ''RCV'' )
	AND s2.Hold_Value = 1

	-- Return the result of the function
	RETURN ISNULL(@held,0)

END

/*
GRANT EXECUTE ON [dbo].[f_Is_SOitemHeld] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_Is_SOitemHeld] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_Is_SOitemHeld] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Is_Stock]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Is_Stock]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_Is_Stock]
(
@cAlloy char(12),
@cForm CHAR(2),
@cCC CHAR(1),
@nThickness DECIMAL(9,4),
@nSize2 DECIMAL(18,4),
@nSize3 DECIMAL(18,4)
)
RETURNS BIT
AS
BEGIN

--SELECT dbo.f_Is_Stock (''C-276'',''40'',''1'',.5,48,120)
--SELECT dbo.f_Is_Stock (''C-276'',''65'',''1'',1,40,240) AS [Stk]
DECLARE @lReturn BIT

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @lReturn = 0

DECLARE @nSize NUMERIC(9,3)
SET @nSize = CAST(@nThickness AS NUMERIC(9,3) )

DECLARE @SizeHigh NUMERIC(9,4)
DECLARE @SizeLow NUMERIC(9,4)
SET @SizeHigh = @nThickness * 1.15
SET @SizeLow = @nThickness * .9

IF EXISTS( SELECT * 
	FROM dbo.Stocklst_Master M 
	INNER JOIN dbo.Stocklst_Detail D ON M.[id]=D.[id]
	LEFT OUTER JOIN dbo.StockLst_Process P ON D.ID_Detail = P.ID_Detail
	
	  WHERE m.Alloy = @cAlloy
	  AND m.Form = @cForm 
	  AND m.CC = @cCC
	  AND (M.[Size] = @nSize OR 
	   ( dbo.f_Return_Lower_Num (ISNULL(D.size_h,99),D.Dim1) <= @SizeHigh AND dbo.f_Return_Higher_Num (ISNULL(D.size_H,99),D.Dim1) >= @SizeLow )  OR
	   (dbo.f_Return_Lower_Num (ISNULL(D.size_l,.001),D.Dim1) <= @SizeHigh AND dbo.f_Return_Higher_Num (ISNULL(D.size_l,.001),D.Dim2) >= @SizeLow ) )
	  AND D.Dim2 >= @nSize2
	)
	RETURN 1

RETURN @lReturn
END

--GRANT EXECUTE ON [dbo].[f_Is_Stock] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_IsAMS2750D]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_IsAMS2750D]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_IsAMS2750D]
(
@HpaName VARCHAR(50)
)
RETURNS BIT
AS
BEGIN

--SELECT dbo.[f_IsAMS2750D] (''A1'')
DECLARE @lReturn BIT

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @lReturn = 1

DECLARE @Above2300Use INT
SELECT @Above2300Use = COUNT(*) FROM dbo.ThermalCoupleUse WHERE HPAName = @HpaName AND Temp >= 2300

IF @Above2300Use >= 1
	Return 0

DECLARE @Above2200Use INT
SELECT @Above2200Use = COUNT(*) FROM dbo.ThermalCoupleUse WHERE HPAName = @HpaName AND Temp >= 2200 AND Temp < 2300

IF @Above2200Use >= 10
	Return 0

DECLARE @Above1801Use INT
DECLARE @Above1801Hours INT
SELECT @Above1801Use = COUNT(*), @Above1801Hours = SUM(Hours) FROM dbo.ThermalCoupleUse WHERE HPAName = @HpaName AND Temp >= 1801 AND Temp < 2200

IF @Above1801Use >= 30
	Return 0

IF @Above1801Hours >= 30*24
	Return 0

DECLARE @Above1200Use INT
DECLARE @Above1200Hours INT
SELECT @Above1200Use = COUNT(*), @Above1200Hours = SUM(Hours) FROM dbo.ThermalCoupleUse WHERE HPAName = @HpaName AND Temp >= 1200 AND Temp < 1801

IF @Above1200Use >= 180
	Return 0

IF @Above1200Hours >= 90*24
	Return 0

DECLARE @Below1200Use INT
DECLARE @Below1200Hours INT
SELECT @Below1200Use = COUNT(*), @Below1200Hours = SUM(Hours) FROM dbo.ThermalCoupleUse WHERE HPAName = @HpaName AND Temp < 1200

IF @Below1200Use >= 270
	Return 0

IF @Below1200Hours >= 90*24
	Return 0



RETURN @lReturn
END

--GRANT EXECUTE ON [dbo].[f_IsAMS2750D] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_IsNot_SalesP_NoNoiseName]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_IsNot_SalesP_NoNoiseName]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_IsNot_SalesP_NoNoiseName] 
(
@cSalesP CHAR(1),
@cNoNoiseName VarChar(30)
)
RETURNS BIT
AS
BEGIN
--SELECT dbo.f_IsNot_SalesP_NoNoiseName(''G'',''FASTENAL   '') 
DECLARE @lReturn BIT
SET @lReturn = 0

IF EXISTS( SELECT * FROM dbo.SalesP_Customer
	WHERE SalesP != @cSalesP
		AND NoNoiseName = @cNoNoiseName )
	SET @lReturn = 1

RETURN @lReturn

END

--GRANT EXECUTE ON [dbo].[f_IsNot_SalesP_NoNoiseName] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_IsUSA_State]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_IsUSA_State]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- =============================================
CREATE FUNCTION [dbo].[f_IsUSA_State] 
(
		@State VARCHAR(50)
)
RETURNS bit

--SELECT dbo.f_IsUSA_State(''IN'')

AS
BEGIN
	-- Declare the return variable here
	DECLARE @Return bit = 0

	SELECT @Return = 1 WHERE @State IN 
	(''AL'', ''AK'', ''AZ'', ''AR'', ''CA'', ''CO'', ''CT'', ''DE'', ''FL'', ''GA'', ''HI'', ''ID'', ''IL'', ''IN'', ''IA'', ''KS'', ''KY'', ''LA'', ''ME'', ''MD'', ''MA'', ''MI'', ''MN'', ''MS'', ''MO'', ''MT'', ''NE'', ''NV'', ''NH'', ''NJ'', ''NM'', ''NY'', ''NC'', ''ND'', ''OH'', ''OK'', ''OR'', ''PA'', ''RI'', ''SC'', ''SD'', ''TN'', ''TX'', ''UT'', ''VT'', ''VA'', ''WA'', ''WV'', ''WI'', ''WY'', ''DC'', ''AS'', ''GU'', ''MP'', ''PR'', ''VI'', ''UM'', ''FM'', ''MH'', ''PW''	)
/*
	IF EXISTS(SELECT [State] FROM dbo.District WHERE [State] = @State)
		RETURN 1
	ELSE 
		RETURN 0
*/
	-- Return the result of the function
	RETURN @Return

END

--GRANT EXECUTE ON [dbo].[f_IsUSA_State] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_IsVendorAppr]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_IsVendorAppr]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2015 8 4
-- Description:	This function returns a small int to represent the approval status of a vendor.  
--	1 for approved, 2 for conditionally approved and 3 for unapproved

-- UPDATED:		02/08/2017 - Added check for inactive
-- UPDATED:		03/31/2017 - Added to base approval on parent company if parent company files are used
-- UPDATED:		05/19/2018 - Added a check for if the vendor is registered, for the requirement for filesOK
-- UPDATED:		10/17/2019 - Moved Inactive check to the top of the if/else block as an inactive vendor should always be unapproved
-- UPDATED:		09/01/2020 - Removed [Conflict Minerals Approved] Check. Hardcoded approved. (Requested by Dave Morrow as temporary fix)
-- UPDATED:		04/15/2021 - Moved Custom/Manual (QAApproval) Approval out of below if/else bracket, Manual Approvals should overide regardless of below 
-- UPDATED:		10/19/2022 - Added check for if VQS is approved 
-- =============================================
CREATE FUNCTION [dbo].[f_IsVendorAppr] 
(
	-- Add the parameters for the function here
	@vendCode int
)
RETURNS smallint
AS
BEGIN
	-- Declare the return variable here
	DECLARE @customAppr smallint = 0
		,@inActive bit = 0
		,@filesOK bit = 0
		,@Registered bit = 0
		,@VQS_Approved bit = 0
		,@calculatedAppr smallint = 3
		,@parentCompany int = null
		,@useParentCompany bit = 0
		,@VQS_NotRequired bit = 0
		,@TwoYearCutoff datetime = DATEADD(YEAR, -2, GETDATE())
		,@lastSurveyDate datetime
		,@minDate datetime = CONVERT(DATETIME, -53690)

	-- Add the T-SQL statements to compute the return value here
	declare MyCursor cursor STATIC for 
		SELECT TOP 1000 ISNULL(v.QAApproved, 0) as [Custom Approved]
				, ISNULL(v.Inactive, 0) as [InActive]
				, dbo.f_AreCertsValid(v.VendCode) as FilesOK
				, ISNULL(vqs.[Registered], 1) as Registered
				, ISNULL(vqs.[Approved], 0) as Approved
				, v.[subsidiary of]
				, v.[Use_Parent_Files]
				, v.[VQS_NotRequired]
				, ISNULL(v.[QASurveyDate], @minDate) as [QASurveyDate]
			FROM [dbo].[Vendor] v
			LEFT OUTER JOIN ERP_2.dbo.VendorQualitySurvey vqs on v.VendCode = vqs.VendCode
			LEFT OUTER JOIN ERP_2.dbo.VendorConflictMineralsFree vcmf on v.VendCode = vcmf.VendCode
			WHERE v.VendCode = @vendCode
	open MyCursor
	FETCH NEXT FROM MyCursor INTO @customAppr, @inActive, @filesOK, @Registered, @VQS_Approved, @parentCompany, @useParentCompany, @VQS_NotRequired, @lastSurveyDate
	while @@FETCH_STATUS = 0 
	begin
		SET @calculatedAppr = 3

		IF (@customAppr != 0 AND @customAppr is NOT null) -- Manual Override Approval Status should overide regardless of below 
		BEGIN
			SET @calculatedAppr = @customAppr
		END

		ELSE IF (@parentCompany IS NOT NULL AND ISNULL(@useParentCompany, 0) = 1) -- If a Vendor should use the parent company, then use the parent company''s "Approval Status."
		BEGIN
			SET @calculatedAppr = [dbo].[f_IsVendorAppr](@parentCompany)
		END

		-- If the Vendor is not a Metal vendor, they are used for misc purchases such as PC''s and do not follow the QMS process for the products we sell.
		ELSE IF (@VQS_NotRequired = 1) 
		BEGIN
			SET @calculatedAppr = 1
		END

		ELSE 
		BEGIN
			-- If the Vendor is "Inactive", they are unapproved and require a new VQS to be completed before they can start the process to become Active and Approved.
			IF (@inActive = 1) 
			BEGIN
				SET @calculatedAppr = 3
			END

			-- If the Vendor is still "Active", then the following will mark the Vendor as "Conditionally Approved" as long as they have PO''s within the last 2 years
			ELSE IF(@lastSurveyDate < @TwoYearCutoff OR (@filesOK = 0 AND @Registered = 1) OR @VQS_Approved = 0)
			BEGIN
				SET @calculatedAppr = 2
			END

			-- No issues found, Vendor is "Approved"
			ELSE
			BEGIN
				SET @calculatedAppr = 1
			END
		END
		break;
		FETCH NEXT FROM MyCursor INTO @customAppr, @inActive, @filesOK, @Registered, @parentCompany, @useParentCompany, @VQS_NotRequired, @lastSurveyDate
	end
	close MyCursor
	DEALLOCATE MyCursor

	-- Return the result of the function
	RETURN @calculatedAppr

END

--GRANT EXECUTE ON [dbo].[f_IsVendorAppr] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_IsVendorDLA_BMS]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_IsVendorDLA_BMS]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_IsVendorDLA_BMS]
(
@VendCode INT
)
RETURNS BIT
AS
BEGIN

--SELECT dbo.[f_IsVendorDLA_BMS] (''10785'')
DECLARE @lReturn BIT




IF (SELECT COUNT(*) FROM dbo.Vendor WHERE VendCode = @VendCode AND ISNULL(DLA_BMS,0) = 1) = 1
	SET @lReturn = 1
ELSE
	SET @lReturn = 0
	
RETURN @lReturn
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_ItemDescription]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_ItemDescription]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[f_ItemDescription] 
(
  @cForm AS CHAR(2)
, @nSZ1 AS NUMERIC(18,4)
, @nSZ2 AS NUMERIC(18,4)
, @nSZ3 AS NUMERIC(18,4)
, @nWeight AS FLOAT
, @lRL AS BIT
)


RETURNS VARCHAR(100)
AS
BEGIN
--SELECT dbo.f_ItemDescription(''10'',1.875,120,0,0,0)
--SELECT dbo.f_ItemDescription(''52'',.25,36,0,100,0)
--dbo.f_ItemDescription(Form,Sz1,Sz2,Sz3,Weight,RandLen)
--dbo.f_ItemDescription(AQ.Form,AQ.Thck,AQ.Sz2,AQ.Sz3,AQ.Q_QTY,AQ.RandLen) AS ItemDescription
--FoxPro PROC ItemDescription(cForm, nSZ1, nSZ2, nSZ3, nWeight, lRL, lMetric, nSz1orig, nSz2orig, nSz3orig)
----------- ALSO SEE f_Descript --------------
----------- ALSO SEE f_DescriptCL --------------
----------- ALSO SEE f_DescriptionMetricReport -------------

DECLARE @lMetric AS Bit
, @nSz1orig AS Float
, @nSz2orig AS Float
, @nSz3orig AS Float

DECLARE @cDs VARCHAR(100)
--10,Bar,11,Flat Bar,12,Hex Bar,13,Square Bar,20,Wire Spool,21,Wire Cut,30,Coat Elect,
--40,Plate/Sheet,51,Strip,60,Tube,65,Pipe,66,Nipple,67,Elbow,68,Tee,69,Reducer,70,Fittings,72,Flange,75,Fastener,80,Disk
IF @cForm = ''0''
	SET @cDs = '' ''
	
IF @cForm = ''10'' 
	begin
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''"Dia x ''
	IF @nSZ2 > 110 AND @nSZ2%12 = 0
		SET @cDs = @cDs + LTRIM( STR( @nSZ2/12 ,8,0)) + '' FT '' 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) + ''" '' 
	
	IF @nSZ3 > 0
		begin
		IF @nSZ3 > 110 AND @nSZ3 = 0
			SET @cDs = @cDs + '' x ''+LTRIM( STR( @nSZ3/12 ,8,0)) + '' FT '' 
		ELSE
			SET @cDs = @cDs + '' x ''+dbo.Remove0(@nSZ3,8,3) + ''" ''	
		end
	end

IF @cForm = ''11''  
	begin --Flat Bar
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" Flat bar x '' + dbo.Remove0(@nSZ2,8,3)+''" Wide x ''
	IF @nSZ3 > 0
		begin
		IF @nSZ3 > 110 AND @nSZ3 = 0
			SET @cDs = @cDs + LTRIM( STR( @nSZ3/12 ,8,0)) + '' FT '' 
		ELSE
			SET @cDs = @cDs + dbo.Remove0(@nSZ3,8,3) + ''" ''
		end
	SET @cDs = @cDs + '' Long''
	end

IF @cForm = ''12'' 
	begin --Hex Bar
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"HEX x ''
	IF @nSZ2 > 110 AND @nSZ2 = 0
		SET @cDs = @cDs + LTRIM( STR( @nSZ2/12 ,8,0)) + '' FT '' 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) + ''" '' 
	
	IF @nSZ3 > 0
		begin
		IF @nSZ3 > 110 AND @nSZ3 = 0
			SET @cDs = @cDs + '' x ''+LTRIM( STR( @nSZ3/12 ,8,0)) + '' FT '' 
		ELSE
			SET @cDs = @cDs + '' x ''+dbo.Remove0(@nSZ3,8,3) + ''" ''
		end
	end

IF @cForm = ''13'' 
	begin --Square Bar
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''" x ''+dbo.Remove0(@nSZ2,8,3)+''" x ''
	IF @nSZ3 > 110 AND @nSZ3 = 0
		SET @cDs = @cDs + LTRIM( STR( @nSZ3/12 ,8,0)) + '' FT '' 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ3,8,3) + ''" ''
	end	

IF @cForm = ''20''  
	begin --Wire
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Dia x ''+dbo.Remove0(@nSZ2,8,3)+''# Spool ''
	end

IF @cForm = ''21''  
	begin --CUT WIRE
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Dia x ''
	IF @nSZ2 > 110 AND @nSZ2 = 0
		SET @cDs = @cDs + LTRIM( STR( @nSZ2/12 ,8,0)) + '' FT '' 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) + ''" ''

	SET @cDs = @cDs + ''TIG WIRE ''

	IF @nSZ3 > 0
		SET @cDs = @cDs + LTRIM( STR( @nSZ3 ,8,0)) + '' Pounder '' 
	
	end

IF @cForm = ''22''  
	begin --LOOSE COIL 
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Dia x ''+dbo.Remove0(@nSZ2,8,3)+''# Loose Coil ''
	end

IF @cForm = ''23''  
	begin --WIRE REEL 
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Dia x ''+dbo.Remove0(@nSZ2,8,3)+''# Reel ''
	end

IF @cForm = ''30''  
	begin --Coated Electrodes
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Dia x ''+dbo.Remove0(@nSZ2,8,3)+''" Coated Electrodes ''
	IF @nSZ3 > 0
		SET @cDs = @cDs + dbo.Remove0(@nSZ3,8,3) + ''# Can''
	end

IF @cForm = ''40''  
	begin --Plate Sheet
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''" Thick x ''+dbo.Remove0(@nSZ2,8,3) 
	IF @nSZ3 > 0
		SET @cDs = @cDs+''" x ''+dbo.Remove0(@nSZ3,8,3) 
	
	SET @cDs = @cDs+''" ''
	end

IF @cForm = ''51''  
	begin --Strip
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Thick x ''+dbo.Remove0(@nSZ2,8,3)+''" x ''+dbo.Remove0(@nSZ3,8,3)+'' Pounds Strip ''
	end

IF @cForm = ''52''  
	begin --Coil
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Thick x ''+dbo.Remove0(@nSZ2,8,3)+''" Wide ''+dbo.Remove0(@nWeight,10,1)+'' Pounds Coil ''
	end

IF @cForm = ''53''  
	begin --Hot Band
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Thick x ''+dbo.Remove0(@nSZ2,8,3)+''" Wide ''+dbo.Remove0(@nWeight,10,1)+'' Pounds Coil ''
	end

IF @cForm = ''60''  
	begin -- Tube
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"OD x ''+dbo.Remove0(@nSZ2,8,3)+''"Wall x ''
	IF @nSZ3 > 110 AND @nSZ3%12 = 0
		SET @cDs = @cDs + LTRIM( STR( @nSZ3/12 ,8,0))+'' FT '' 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ3,8,3)+''" ''
	end

IF @cForm = ''65''  
	begin -- Pipe
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" SCH ''
	IF @nSZ2 = 0
		SET @cDs = @cDs + LTRIM(@nSZ2orig) 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) 
	
	SET @cDs = @cDs + '' x ''
	IF @nSZ3 > 110 AND @nSZ3%12 = 0
		SET @cDs = @cDs + LTRIM( STR( @nSZ3/12 ,8,0)) + '' FT '' 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ3,8,3) + ''" ''
	end

IF @cForm = ''66''  
	begin -- Nipple
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" SCH ''
	IF @nSZ2 = 0
		SET @cDs = @cDs + LTRIM(@nSZ2orig) 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) 
	
	IF @nSZ3 > 0
		SET @cDs = @cDs + '' x '' + dbo.Remove0(@nSZ3,8,3) + ''"''
	
	SET @cDs = @cDs + '' Nipple''
	end

IF @cForm = ''67''  
	begin --Elbow
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" SCH ''
	IF @nSZ2 = 0
		SET @cDs = @cDs + LTRIM(@nSZ2orig) 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) 
	
	IF @nSZ3>0
		SET @cDs = @cDs + '' x ''+ LTRIM(STR(@nSZ3,8,0)) + '' Deg''
	
	SET @cDs = @cDs + '' Elbow ''
	end

IF @cForm = ''68''  
	begin --Tee
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" SCH ''
	IF @nSZ2 = 0
		SET @cDs = @cDs + LTRIM(@nSZ2orig) 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) 
	
	SET @cDs = @cDs + '' Tee''
	end

IF @cForm = ''69''  
	begin -- Reducer
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" x ''
	IF @nSZ2 = 0
		SET @cDs = @cDs + LTRIM(@nSZ2orig) 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) 
	
	SET @cDs = @cDs + ''" Sch '' + dbo.Remove0(@nSZ3,8,3) + '' Reducer''
	end

IF @cForm = ''70''  
	begin --Fittings
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" SCH ''
	IF @nSZ2 = 0
		SET @cDs = @cDs + LTRIM(@nSZ2orig) 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) 
	
	IF @nSZ3 > 0
		SET @cDs = @cDs+'' x ''+dbo.Remove0(@nSZ3,8,3)+''"''
	
	SET @cDs = @cDs + '' Pipe Fitting''
	end

IF @cForm = ''71'' 
	begin --Coupling
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" IPS ''
	IF @nSZ2 > 0
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) + ''# Pounds''
	
	IF @nSZ3 > 0
		SET @cDs = @cDs + '' x '' + dbo.Remove0(@nSZ3,8,3) + ''" Long''
	
	SET @cDs = @cDs + '' Coupling''
	end

IF @cForm = ''72''  
	begin --Flange
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" SCH ''
	IF @nSZ2 = 0
		SET @cDs = @cDs + LTRIM(@nSZ2orig) 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) 
	
	IF @nSZ3 > 0
		SET @cDs = @cDs+'' x ''+dbo.Remove0(@nSZ3,8,3) + ''# Pounds''
	
	SET @cDs = @cDs + '' Flange''
	end

IF @cForm = ''75'' 
	begin --Fasteners
	IF @lMetric = 1
		SET @cDs = ''M'' + dbo.Remove0(@nSZ1,9,4) 
	ELSE
		SET @cDs = dbo.Remove0(@nSZ1,9,4) 	
	
	IF @nSZ2 > 0
		SET @cDs = @cDs + '' - '' + dbo.Remove0(@nSZ2,8,3) 
	
	IF @nSZ3 > 0
		SET @cDs = @cDs + '' x '' + dbo.Remove0(@nSZ3,8,3) + ''" long''
	
	SET @cDs = @cDs + '' Fastener''
	end

IF @cForm = ''80''  
	begin --Disk
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''" Thick x ''+dbo.Remove0(@nSZ2,8,3)+''"OD ''
	IF @nSZ3 > 0
		SET @cDs = @cDs + ''x '' + dbo.Remove0(@nSZ3,8,3) + ''"ID Disk''
	end

IF @cForm = ''90''  
	begin --Machined
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''" x ''+dbo.Remove0(@nSZ2,8,3)+''" x '' + dbo.Remove0(@nSZ3,8,3) + ''"''
	end

IF @cForm = ''95''  
	begin --Forge
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''" x ''+dbo.Remove0(@nSZ2,8,3)+''" x '' + dbo.Remove0(@nSZ3,8,3) + ''"''
	end

IF @cForm = ''96''  
	begin --SLAB
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''" Thick x ''+dbo.Remove0(@nSZ2,8,3) 
	IF @nSZ3 > 0
		SET @cDs = @cDs+''" x ''+dbo.Remove0(@nSZ3,8,3) 
	
	SET @cDs = @cDs+''" ''
	end

IF @cForm = ''97'' 
	begin  --Billet
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''"Dia x ''
	IF @nSZ2 > 110 AND @nSZ2%12 = 0
		SET @cDs = @cDs + LTRIM( STR( @nSZ2/12 ,8,0)) + '' FT '' 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) + ''" '' 
	
	IF @nSZ3 > 0
		begin
		IF @nSZ3 > 110 AND @nSZ3%12 = 0
			SET @cDs = @cDs + '' x ''+LTRIM( STR( @nSZ3/12 ,8,0)) + '' FT '' 
		ELSE
			SET @cDs = @cDs + '' x ''+dbo.Remove0(@nSZ3,8,3) + ''" ''	
		end
	end

IF @cForm = ''98''  
	begin --RCS
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''" Thick x ''+dbo.Remove0(@nSZ2,8,3) 
	IF @nSZ3 > 0
		SET @cDs = @cDs+''" x ''+dbo.Remove0(@nSZ3,8,3) 
	
	SET @cDs = @cDs+''" ''
	end

IF @cForm = ''99''  
	begin --INGOT
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''" Thick x ''+dbo.Remove0(@nSZ2,8,3) 
	IF @nSZ3 > 0
		SET @cDs = @cDs+''" x ''+dbo.Remove0(@nSZ3,8,3) 
	
	SET @cDs = @cDs+''" ''
	end


IF @lRL = 1
	SET @cDs = @cDs + '' R/L''



RETURN @cDs 
END

--GRANT EXECUTE ON [dbo].[f_ItemDescription] TO [WINDFALL\HPA] AS [dbo];




' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_ItemDescriptionMetric]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_ItemDescriptionMetric]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[f_ItemDescriptionMetric] 
(
  @cForm AS CHAR(2)
, @nSZ1 AS NUMERIC(18,4)
, @nSZ2 AS NUMERIC(18,4)
, @nSZ3 AS NUMERIC(18,4)
, @nWeight AS Float
, @lRandLen AS BIT
, @lMetric AS BIT
, @cSz1orig AS VarChar(20)
, @cSz2orig AS VarChar(20)
, @cSz3orig AS VarChar(20)
)


RETURNS VARCHAR(100)
AS
BEGIN
--FoxPro PROC ItemDescriptionMetric(cForm, nSZ1, nSZ2, nSZ3, nWeight, lRL, lMetric, nSz1orig, nSz2orig, nSz3orig)
--SELECT dbo.f_ItemDescriptionMetric(Form, Thck, SZ2, SZ3, Weight, RandLen, Metric, Sz1orig, Sz2orig, Sz3orig) FROM dbo.AllQuotes WHERE ID = 1000
--SELECT dbo.f_ItemDescriptionMetric(M.Form, M.Size, D.Dim2, D.Dim3, D.Weight, D.RandLen, '''', '''', '''', '''')  AS ItemDescriptionMetric FROM dbo.StockLst_Detail D INNER JOIN dbo.StockLst_Master M ON D.ID = M.ID
--SELECT dbo.f_ItemDescriptionMetric(''10'', 3.25, 18.5, 0, 0, 0, 0, '''', '''', '''')
--ALSO SEE 
--SELECT dbo.f_DescriptionMetricReport to ADD Pieces to Decription line
-- ALSO SEE dbo.f_DescriptCL

DECLARE @cDs VARCHAR(100)
--10,Bar,11,Flat Bar,12,Hex Bar,13,Square Bar,20,Wire Spool,21,Wire Cut,30,Coat Elect,
--40,Plate/Sheet,51,Strip,60,Tube,65,Pipe,66,Nipple,67,Elbow,68,Tee,69,Reducer,70,Fittings,72,Flange,75,Fastener,80,Disk

IF @cForm = ''0''
	SET @cDs = '' ''
	
IF @cForm = ''10'' 
	begin
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''"Dia x ''
	IF @nSZ2 > 110 AND @nSZ2%12 = 0
		SET @cDs = @cDs + LTRIM( STR( @nSZ2/12 ,8,0)) + '' FT '' 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) + ''" '' 
	
	IF @nSZ3 > 0
		begin
		IF @nSZ3 > 110 AND @nSZ3%12 = 0
			SET @cDs = @cDs + '' x ''+LTRIM( STR( @nSZ3/12 ,8,0)) + '' FT '' 
		ELSE
			SET @cDs = @cDs + '' x ''+dbo.Remove0(@nSZ3,8,3) + ''" ''	
		end
	end

IF @cForm = ''11''  
	begin --Flat Bar
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" Flat bar x '' + dbo.Remove0(@nSZ2,8,3)+''" Wide x ''
	IF @nSZ3 > 0
		begin
		IF @nSZ3 > 110 AND @nSZ3%12 = 0
			SET @cDs = @cDs + LTRIM( STR( @nSZ3/12 ,8,0)) + '' FT '' 
		ELSE
			SET @cDs = @cDs + dbo.Remove0(@nSZ3,8,3) + ''" ''
		end
	SET @cDs = @cDs + '' Long''
	end

IF @cForm = ''12'' 
	begin --Hex Bar
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"HEX x ''
	IF @nSZ2 > 110 AND @nSZ2%12 = 0
		SET @cDs = @cDs + LTRIM( STR( @nSZ2/12 ,8,0)) + '' FT '' 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) + ''" '' 
	
	IF @nSZ3 > 0
		begin
		IF @nSZ3 > 110 AND @nSZ3%12 = 0
			SET @cDs = @cDs + '' x ''+LTRIM( STR( @nSZ3/12 ,8,0)) + '' FT '' 
		ELSE
			SET @cDs = @cDs + '' x ''+dbo.Remove0(@nSZ3,8,3) + ''" ''
		end
	end

IF @cForm = ''13'' 
	begin --Square Bar
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''" x ''+dbo.Remove0(@nSZ2,8,3)+''" x ''
	IF @nSZ3 > 110 AND @nSZ3%12 = 0
		SET @cDs = @cDs + LTRIM( STR( @nSZ3/12 ,8,0)) + '' FT '' 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ3,8,3) + ''" ''
	end	

IF @cForm = ''20''  
	begin --Wire
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Dia x ''+dbo.Remove0(@nSZ2,8,3)+''# Spool ''
	end

IF @cForm = ''21''  
	begin --CUT WIRE
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Dia x ''
	IF @nSZ2 > 110 AND @nSZ2%12 = 0
		SET @cDs = @cDs + LTRIM( STR( @nSZ2/12 ,8,0)) + '' FT '' 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) + ''" ''

	SET @cDs = @cDs + ''TIG WIRE ''

	IF @nSZ3 > 0
		SET @cDs = @cDs + LTRIM( STR( @nSZ3 ,8,0)) + '' Pounder '' 
	
	end

IF @cForm = ''22''  
	begin --LOOSE COIL 
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Dia x ''+dbo.Remove0(@nSZ2,8,3)+''# Loose Coil ''
	end

IF @cForm = ''23''  
	begin --WIRE REEL 
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Dia x ''+dbo.Remove0(@nSZ2,8,3)+''# Reel ''
	end

IF @cForm = ''30''  
	begin --Coated Electrodes
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Dia x ''+dbo.Remove0(@nSZ2,8,3)+''" Coated Electrodes ''
	IF @nSZ3 > 0
		SET @cDs = @cDs + dbo.Remove0(@nSZ3,8,3) + ''# Can''
	end

IF @cForm = ''40''  
	begin --Plate Sheet
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''" Thick x ''+dbo.Remove0(@nSZ2,8,3) 
	IF @nSZ3 > 0
		SET @cDs = @cDs+''" x ''+dbo.Remove0(@nSZ3,8,3) 
	
	SET @cDs = @cDs+''" ''
	end

IF @cForm = ''51''  
	begin --Strip
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Thick x ''+dbo.Remove0(@nSZ2,8,3)+''" x ''+dbo.Remove0(@nSZ3,8,3)+'' Pounds Strip ''
	end

IF @cForm = ''52''  
	begin --Coil
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Thick x ''+dbo.Remove0(@nSZ2,8,3)+''" Wide ''+dbo.Remove0(@nWeight,10,1)+'' Pounds Coil ''
	end

IF @cForm = ''53''  
	begin --Hot Band
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Thick x ''+dbo.Remove0(@nSZ2,8,3)+''" Wide ''+dbo.Remove0(@nWeight,10,1)+'' Pounds Coil ''
	end

IF @cForm = ''60''  
	begin -- Tube
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"OD x ''+dbo.Remove0(@nSZ2,8,3)+''"Wall x ''
	IF @nSZ3 > 110 AND @nSZ3%12 = 0
		SET @cDs = @cDs + LTRIM( STR( @nSZ3/12 ,8,0))+'' FT '' 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ3,8,3)+''" ''
	end

IF @cForm = ''65''  
	begin -- Pipe
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" SCH ''
	IF @nSZ2 = 0
		SET @cDs = @cDs + LTRIM(@cSZ2orig) 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) 
	
	SET @cDs = @cDs + '' x ''
	IF @nSZ3 > 110 AND @nSZ3%12 = 0
		SET @cDs = @cDs + LTRIM( STR( @nSZ3/12 ,8,0)) + '' FT '' 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ3,8,3) + ''" ''
	end

IF @cForm = ''66''  
	begin -- Nipple
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" SCH ''
	IF @nSZ2 = 0
		SET @cDs = @cDs + LTRIM(@cSZ2orig) 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) 
	
	IF @nSZ3 > 0
		SET @cDs = @cDs + '' x '' + dbo.Remove0(@nSZ3,8,3) + ''"''
	
	SET @cDs = @cDs + '' Nipple''
	end

IF @cForm = ''67''  
	begin --Elbow
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" SCH ''
	IF @nSZ2 = 0
		SET @cDs = @cDs + LTRIM(@cSZ2orig) 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) 
	
	IF @nSZ3>0
		SET @cDs = @cDs + '' x ''+ LTRIM(STR(@nSZ3,8,0)) + '' Deg''
	
	SET @cDs = @cDs + '' Elbow ''
	end

IF @cForm = ''68''  
	begin --Tee
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" SCH ''
	IF @nSZ2 = 0
		SET @cDs = @cDs + LTRIM(@cSZ2orig) 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) 
	
	SET @cDs = @cDs + '' Tee''
	end

IF @cForm = ''69''  
	begin -- Reducer
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" x ''
	IF @nSZ2 = 0
		SET @cDs = @cDs + LTRIM(@cSZ2orig) 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) 
	
	SET @cDs = @cDs + ''" Sch '' + dbo.Remove0(@nSZ3,8,3) + '' Reducer''
	end

IF @cForm = ''70''  
	begin --Fittings
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" SCH ''
	IF @nSZ2 = 0
		SET @cDs = @cDs + LTRIM(@cSZ2orig) 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) 
	
	IF @nSZ3 > 0
		SET @cDs = @cDs+'' x ''+dbo.Remove0(@nSZ3,8,3)+''"''
	
	SET @cDs = @cDs + '' Pipe Fitting''
	end

IF @cForm = ''71'' 
	begin --Coupling
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" IPS ''
	IF @nSZ2 > 0
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) + ''# Pounds''
	
	IF @nSZ3 > 0
		SET @cDs = @cDs + '' x '' + dbo.Remove0(@nSZ3,8,3) + ''" Long''
	
	SET @cDs = @cDs + '' Coupling''
	end

IF @cForm = ''72''  
	begin --Flange
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" SCH ''
	IF @nSZ2 = 0
		SET @cDs = @cDs + LTRIM(@cSZ2orig) 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) 
	
	IF @nSZ3 > 0
		SET @cDs = @cDs+'' x ''+dbo.Remove0(@nSZ3,8,3) + ''# Pounds''
	
	SET @cDs = @cDs + '' Flange''
	end

IF @cForm = ''75'' 
	begin --Fasteners
	IF @lMetric = 1
		SET @cDs = ''M'' + dbo.Remove0(@nSZ1,9,4) 
	ELSE
		SET @cDs = dbo.Remove0(@nSZ1,9,4) 	
	
	IF @nSZ2 > 0
		SET @cDs = @cDs + '' - '' + dbo.Remove0(@nSZ2,8,3) 
	
	IF @nSZ3 > 0
		SET @cDs = @cDs + '' x '' + dbo.Remove0(@nSZ3,8,3) + ''" long''
	
	SET @cDs = @cDs + '' Fastener''
	end

IF @cForm = ''80''  
	begin --Disk
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''" Thick x ''+dbo.Remove0(@nSZ2,8,3)+''"OD ''
	IF @nSZ3 > 0
		SET @cDs = @cDs + ''x '' + dbo.Remove0(@nSZ3,8,3) + ''"ID Disk''
	end

IF @cForm = ''90''  
	begin --Machined
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''" x ''+dbo.Remove0(@nSZ2,8,3)+''" x '' + dbo.Remove0(@nSZ3,8,3) + ''"''
	end

IF @cForm = ''95''  
	begin --Forge
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''" x ''+dbo.Remove0(@nSZ2,8,3)+''" x '' + dbo.Remove0(@nSZ3,8,3) + ''"''
	end

IF @cForm = ''96''  
	begin --SLAB
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''" Thick x ''+dbo.Remove0(@nSZ2,8,3) 
	IF @nSZ3 > 0
		SET @cDs = @cDs+''" x ''+dbo.Remove0(@nSZ3,8,3) 
	
	SET @cDs = @cDs+''" ''
	end

IF @cForm = ''97'' 
	begin  --Billet
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''"Dia x ''
	IF @nSZ2 > 110 AND @nSZ2%12 = 0
		SET @cDs = @cDs + LTRIM( STR( @nSZ2/12 ,8,0)) + '' FT '' 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) + ''" '' 
	
	IF @nSZ3 > 0
		begin
		IF @nSZ3 > 110 AND @nSZ3%12 = 0
			SET @cDs = @cDs + '' x ''+LTRIM( STR( @nSZ3/12 ,8,0)) + '' FT '' 
		ELSE
			SET @cDs = @cDs + '' x ''+dbo.Remove0(@nSZ3,8,3) + ''" ''	
		end
	end

IF @cForm = ''98''  
	begin --RCS
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''" Thick x ''+dbo.Remove0(@nSZ2,8,3) 
	IF @nSZ3 > 0
		SET @cDs = @cDs+''" x ''+dbo.Remove0(@nSZ3,8,3) 
	
	SET @cDs = @cDs+''" ''
	end

IF @cForm = ''99''  
	begin --INGOT
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''" Thick x ''+dbo.Remove0(@nSZ2,8,3) 
	IF @nSZ3 > 0
		SET @cDs = @cDs+''" x ''+dbo.Remove0(@nSZ3,8,3) 
	
	SET @cDs = @cDs+''" ''
	end

IF @lRandLen = 1
	SET @cDs = @cDs + '' R/L''



RETURN @cDs 
END

--GRANT EXECUTE ON [dbo].[f_ItemDescriptionMetric] TO [WINDFALL\HPA] AS [dbo];



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_LBS_At_Location]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_LBS_At_Location]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


create FUNCTION [dbo].[f_LBS_At_Location]
(	
	@Location CHAR(10)
)
RETURNS  INT

AS
BEGIN



DECLARE @MaxLBS INT = 0

SELECT @MaxLBS= SUM( ISNULL(S_QTY,0) )
	FROM dbo.StockLst_Detail
	WHERE [Location] = @Location

RETURN @MaxLBS
END

--GRANT EXECUTE ON [dbo].[f_MaxLBS_Location] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_LMA_Gr]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_LMA_Gr]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_LMA_Gr] 
(
@cCC char(1),
@cCL CHAR(1),
@cDescript VARCHAR(50),
@cComments VarChar(MAX)
)
RETURNS TinyInt
AS
BEGIN

--SELECT dbo.f_LMA_Gr(@CC,@CL,@cDescript,@cComments)
--SELECT dbo.f_LMA_Gr(AQ.CC,AQ.CL,AQ.Descript,AQ.Comments)

--SELECT dbo.f_SPX_Gr(@CC,@CL,@cDescript,@cComments)
--SELECT * FROM dbo.ConditionCode
-- LMA M7060

DECLARE @LMA TinyInt = 0

IF @cCC=''L''
	begin
	IF @cCL = ''1''
		SET @LMA = 1
	ELSE
	IF @cCL = ''2''
		SET @LMA = 2
	ELSE
	IF @cCL = ''3''
		SET @LMA = 3
	ELSE
	IF @cCL = ''4''
		SET @LMA = 4
	ELSE
	IF @cCL = ''5''
		SET @LMA = 5
	ELSE
	IF @cCL = ''6''
		SET @LMA = 6
	
	IF @LMA>0
		RETURN (@LMA)

	end


-- CC is not ''L'' and CL not 1-6
-- ignore CC, check Descript

DECLARE @FoundLMA BIT = 0
IF @cDescript LIKE ''%LMA%''
	begin
	SET @FoundLMA = 1

	IF @cCL = ''1''
		SET @LMA = 1
	ELSE
	IF @cCL = ''2''
		SET @LMA = 2
	ELSE
	IF @cCL = ''3''
		SET @LMA = 3
	ELSE
	IF @cCL = ''4''
		SET @LMA = 4
	ELSE
	IF @cCL = ''5''
		SET @LMA = 5
	ELSE
	IF @cCL = ''6''
		SET @LMA = 6
	
	IF @LMA > 0
		RETURN (@LMA)

	end

--Exit if not LMA
--IF @FoundLMA = 0
--	RETURN 0

DECLARE @cGrade CHAR(5) = ''''
DECLARE @nGradeAt TinyInt = 0
DECLARE @nGradeNum TinyInt = 0

--Locate Grade GRADE
SET @nGradeAt =  CHARINDEX(''GRADE'',@cDescript)
IF @nGradeAt > 0 AND @FoundLMA = 1
	begin

	SET @cGrade = SUBSTRING ( @cDescript, @nGradeAt+6, 2 ) 
	SET @cGrade = LTRIM(RTRIM(@cGrade))

	IF LEN(@cGrade) > 0
		begin
		IF @cGrade like ''1%''
			SET @LMA = 1
		ELSE
		IF @cGrade like ''2%''
			SET @LMA = 2
		ELSE
		IF @cGrade like ''3%''
			SET @LMA = 3
		ELSE
		IF @cGrade like ''4%''
			SET @LMA = 4
		ELSE
		IF @cGrade like ''5%''
			SET @LMA = 5
		ELSE
		IF @cGrade like ''6%''
			SET @LMA = 6
	
		IF @LMA > 0
			RETURN (@LMA)


		end
		--ELSE
		-- Check Comments
		

	end

--
--Locate Grade GR.
SET @nGradeAt =  CHARINDEX(''GR. '',@cDescript)
IF @nGradeAt > 0 AND @FoundLMA = 1
	begin

	SET @cGrade = SUBSTRING ( @cDescript, @nGradeAt+4, 2 ) 
	SET @cGrade = LTRIM(RTRIM(@cGrade))

	IF LEN(@cGrade) > 0
		begin
		IF @cGrade like ''1%''
			SET @LMA = 1
		ELSE
		IF @cGrade like ''2%''
			SET @LMA = 2
		ELSE
		IF @cGrade like ''3%''
			SET @LMA = 3
		ELSE
		IF @cGrade like ''4%''
			SET @LMA = 4
		ELSE
		IF @cGrade like ''5%''
			SET @LMA = 5
		ELSE
		IF @cGrade like ''6%''
			SET @LMA = 6
	
		IF @LMA > 0
			RETURN (@LMA)


		end
		--ELSE
		-- Check Comments
		

	end

--Locate Grade GR
SET @nGradeAt =  CHARINDEX(''GR '',@cDescript)
IF @nGradeAt > 0 AND @FoundLMA = 1
	begin

	SET @cGrade = SUBSTRING ( @cDescript, @nGradeAt+3, 2 ) 
	SET @cGrade = LTRIM(RTRIM(@cGrade))

	IF LEN(@cGrade) > 0
		begin
		IF @cGrade like ''1%''
			SET @LMA = 1
		ELSE
		IF @cGrade like ''2%''
			SET @LMA = 2
		ELSE
		IF @cGrade like ''3%''
			SET @LMA = 3
		ELSE
		IF @cGrade like ''4%''
			SET @LMA = 4
		ELSE
		IF @cGrade like ''5%''
			SET @LMA = 5
		ELSE
		IF @cGrade like ''6%''
			SET @LMA = 6
	
		IF @LMA > 0
			RETURN (@LMA)


		end
		--ELSE
		--check comments
		--	RETURN 0
	
	end

--Locate Grade LEVEL
SET @nGradeAt =  CHARINDEX(''LEVEL'',@cDescript)
IF @nGradeAt > 0 AND @FoundLMA = 1
	begin

	SET @cGrade = SUBSTRING ( @cDescript, @nGradeAt+5, 2 ) 
	SET @cGrade = LTRIM(RTRIM(@cGrade))

	IF LEN(@cGrade) > 0
		begin
		IF @cGrade like ''1%''
			SET @LMA = 1
		ELSE
		IF @cGrade like ''2%''
			SET @LMA = 2
		ELSE
		IF @cGrade like ''3%''
			SET @LMA = 3
		ELSE
		IF @cGrade like ''4%''
			SET @LMA = 4
		ELSE
		IF @cGrade like ''5%''
			SET @LMA = 5
		ELSE
		IF @cGrade like ''6%''
			SET @LMA = 6
	
		IF @LMA > 0
			RETURN (@LMA)


		end
		--ELSE
		--Check Comments
			
	end

--------------------------------
--------------------------------
--------------------------------
-- CC is not ''L'' and CL not 1-6
-- ignore CC, checking comments

SET @FoundLMA = 0
IF @cComments LIKE ''%LMA%''
	begin
	SET @FoundLMA = 1

	IF @cCL = ''1''
		SET @LMA = 1
	ELSE
	IF @cCL = ''2''
		SET @LMA = 2
	ELSE
	IF @cCL = ''3''
		SET @LMA = 3
	ELSE
	IF @cCL = ''4''
		SET @LMA = 4
	ELSE
	IF @cCL = ''5''
		SET @LMA = 5
	ELSE
	IF @cCL = ''6''
		SET @LMA = 6
	
	IF @LMA > 0
		RETURN (@LMA)

	end

--------------------------------
--Exit if not LMA or Descript
IF @FoundLMA = 0
	RETURN 0

SET @cGrade = ''''
SET @nGradeAt = 0
SET @nGradeNum = 0

--Locate Grade
SET @nGradeAt =  CHARINDEX(''GRADE'',@cComments)
IF @nGradeAt > 0 SET @FoundLMA = 1
	begin

	SET @cGrade = SUBSTRING ( @cComments, @nGradeAt+6, 2 ) 
	--SET @nGradeNum = CAST(@cGrade AS TinyInt )
	--SET @nGradeNum = CONVERT(INT, REPLACE(@cGrade, CHAR(0), ''''))
	SET @cGrade = LTRIM(RTRIM(@cGrade))

	IF LEN(@cGrade) > 0
		begin
		IF @cGrade like ''1%''
			SET @LMA = 1
		ELSE
		IF @cGrade like ''2%''
			SET @LMA = 2
		ELSE
		IF @cGrade like ''3%''
			SET @LMA = 3
		ELSE
		IF @cGrade like ''4%''
			SET @LMA = 4
		ELSE
		IF @cGrade like ''5%''
			SET @LMA = 5
		ELSE
		IF @cGrade like ''6%''
			SET @LMA = 6
	
		IF @LMA > 0
			RETURN (@LMA)


		end
		ELSE
			RETURN 0

	end

--
--Locate Grade
SET @nGradeAt =  CHARINDEX(''GR. '',@cComments)
IF @nGradeAt > 0
	begin

	SET @cGrade = SUBSTRING ( @cComments, @nGradeAt+4, 2 ) 
	SET @cGrade = LTRIM(RTRIM(@cGrade))

	IF LEN(@cGrade) > 0
		begin
		IF @cGrade like ''1%''
			SET @LMA = 1
		ELSE
		IF @cGrade like ''2%''
			SET @LMA = 2
		ELSE
		IF @cGrade like ''3%''
			SET @LMA = 3
		ELSE
		IF @cGrade like ''4%''
			SET @LMA = 4
		ELSE
		IF @cGrade like ''5%''
			SET @LMA = 5
		ELSE
		IF @cGrade like ''6%''
			SET @LMA = 6
	
		IF @LMA > 0
			RETURN (@LMA)


		end
		ELSE
			RETURN 0
	end

--Locate Grade
SET @nGradeAt =  CHARINDEX(''GR '',@cComments)
IF @nGradeAt > 0
	begin

	SET @cGrade = SUBSTRING ( @cComments, @nGradeAt+3, 2 ) 
	SET @cGrade = LTRIM(RTRIM(@cGrade))

	IF LEN(@cGrade) > 0
		begin
		IF @cGrade like ''1%''
			SET @LMA = 1
		ELSE
		IF @cGrade like ''2%''
			SET @LMA = 2
		ELSE
		IF @cGrade like ''3%''
			SET @LMA = 3
		ELSE
		IF @cGrade like ''4%''
			SET @LMA = 4
		ELSE
		IF @cGrade like ''5%''
			SET @LMA = 5
		ELSE
		IF @cGrade like ''6%''
			SET @LMA = 6
	
		IF @LMA > 0
			RETURN (@LMA)


		end
		ELSE
			RETURN 0
	
	end

--Locate Grade
SET @nGradeAt =  CHARINDEX(''LEVEL'',@cComments)
IF @nGradeAt > 0
	begin

	SET @cGrade = SUBSTRING ( @cComments, @nGradeAt+5, 2 ) 
	--SET @nGradeNum = CAST(@cGrade AS TinyInt )
	--SET @nGradeNum = CONVERT(INT, REPLACE(@cGrade, CHAR(0), ''''))
	SET @cGrade = LTRIM(RTRIM(@cGrade))

	IF LEN(@cGrade) > 0
		begin
		IF @cGrade like ''1%''
			SET @LMA = 1
		ELSE
		IF @cGrade like ''2%''
			SET @LMA = 2
		ELSE
		IF @cGrade like ''3%''
			SET @LMA = 3
		ELSE
		IF @cGrade like ''4%''
			SET @LMA = 4
		ELSE
		IF @cGrade like ''5%''
			SET @LMA = 5
		ELSE
		IF @cGrade like ''6%''
			SET @LMA = 6
	
		IF @LMA > 0
			RETURN (@LMA)


		end
		ELSE
			RETURN 0

	end


RETURN @LMA

END



--GRANT EXECUTE ON [dbo].[f_LMA_Gr] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Lst_IDfrom_ID_Detail]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Lst_IDfrom_ID_Detail]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


create FUNCTION [dbo].[f_Lst_IDfrom_ID_Detail]
(
	@nID_Detail INT
)
RETURNS INT
AS
BEGIN
	-- USE f_Lst_IDfrom_ID_Detail  
	--depricate f_Get_StockLst_ID and use of All Table  f_Lst

	--SELECT dbo.f_Get_StockLst_ID(11000)

	DECLARE @nID INT
	SET @nID = 0

	SELECT TOP 1 @nID = ID FROM dbo.StockLst_Detail WHERE ID_Detail = @nID_Detail 
		AND ISNULL(ID,0) > 0

	IF ISNULL(@nID,0) = 0
		SELECT TOP 1 @nID = ID FROM dbo.Ar_StockLst_Detail_History WHERE ID_Detail = @nID_Detail 

	RETURN ISNULL(@nID, 0)

END' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Lst_Master_ID_exist]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Lst_Master_ID_exist]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
Create FUNCTION [dbo].[f_Lst_Master_ID_exist] 
(
@ID INT,
@TBL CHAR(1)
)
RETURNS INT
--SELECT dbo.f_StockLst_Master_ID_exist(1000)
AS
BEGIN
DECLARE @nCount INT
SET @nCount=0

IF @TBL=''S''
	IF EXISTS(SELECT * FROM dbo.StockLst_Master WHERE ID = @ID)
		SET @nCount=1
	
IF @TBL=''B''
	IF EXISTS(SELECT * FROM dbo.BrokerLst_Master WHERE ID = @ID)
		SET @nCount=1

IF @TBL=''W''
	IF EXISTS(SELECT * FROM dbo.WIPLst_Master WHERE ID = @ID)
		SET @nCount=1

RETURN (@nCount)
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_MaxLBS_Location]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_MaxLBS_Location]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


create FUNCTION [dbo].[f_MaxLBS_Location]
(	
	@Location CHAR(10)
)
RETURNS  INT

AS
BEGIN



DECLARE @MaxLBS INT = 0

SELECT @MaxLBS=ISNULL(MaxLBS,0) 
	FROM dbo.StockLst_Location 
	WHERE [Location] = @Location

RETURN @MaxLBS
END

--GRANT EXECUTE ON [dbo].[f_MaxLBS_Location] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_McMaster_ID]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_McMaster_ID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_McMaster_ID]
(
	@Alloy CHAR(12)
	,@Form  CHAR(2)
	,@CC	CHAR(1)
	,@Thck Decimal(9,3)
	,@Sz2 Decimal(9,3)
	,@Sz3 Decimal(9,3)

)
RETURNS CHAR(31)

--HPA_N60_____101,__1.000,__1,__1 
--C-276_______101,__0.500,__0,_72 
AS
BEGIN

--SELECT dbo.[f_McMaster_ID] (Alloy,Form,CC,Thck,PI_Width,PI_Length)
--SELECT dbo.[f_McMaster_ID] (''HPA N60     '',''10'',''1'',	1.0000,	1.000,	1.0000)
--SELECT dbo.[f_McMaster_ID] (''C-276       '',''10'',''1'',	0.5000,	0.000,	72.000)

DECLARE @dtReturn DateTime
SET @dtReturn = ''''

declare @err int,
        @RC int

set @err = 0
set @rc = 0


SET @Thck = CAST(@Thck AS Numeric(9,3))

DECLARE @cMcMaster_ID CHAR(31)

SET @cMcMaster_ID = 
REPLACE(@Alloy,'' '',''_'')+@Form+@CC

+'',''+CASE When @Thck < 10 Then ''__''+CAST(CAST(@Thck AS Numeric(9,3)) AS CHAR(5) ) 
		  When @Thck < 100 Then ''_''+CAST(CAST(@Thck AS Numeric(9,3)) AS CHAR(6) ) 
                               Else CAST(CAST(@Thck AS Numeric(9,3)) AS CHAR(7) ) End

+'',''+CASE When @Sz2 < 10 Then ''__''+CAST(CAST(@Sz2 AS INT) AS CHAR(1) ) 		  
		  When @Sz2 < 100 Then ''_''+CAST(CAST(@Sz2 AS INT) AS CHAR(2) ) 
						      Else CAST(CAST(@Sz2 AS INT) AS CHAR(3) ) end

+'',''+CASE When @Sz3 < 10 Then ''__''+CAST(CAST(@Sz3 AS INT) AS CHAR(1) ) 		  
		  When @Sz3 < 100 Then ''_''+CAST(CAST(@Sz3 AS INT) AS CHAR(2) ) 
				    	      Else CAST(CAST(@Sz3 AS INT) AS CHAR(3) ) end
;
		
RETURN @cMcMaster_ID
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_McMasterDuplicate]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_McMasterDuplicate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[f_McMasterDuplicate]
(	
	@Period	SmallDateTime,
	@Alloy	CHAR(12),
	@Form	CHAR(2),
	@cc		CHAR(1),
	@Thck		Numeric(7,4),
	@PI_Width	Numeric(8,3),
	@PI_Length 	Numeric(8,3),
	@PriceBreak	TinyInt, 
	@P_Pc		Numeric(8,2)

)
--RETURNS  BIT
RETURNS INT

--PRINT dbo.f_McMasterDuplicate( [Period],[Alloy],[Form],[cc],[Thck],[PI_Width],[PI_Length],@PBreak,[P_Pc] )

--Used to find increasing Price Breaks that are duplicate
/*
DELETE dbo.McMaster_Quotes 
	WHERE McMaster_Quotes.[Period] = @Period AND McMaster_Quotes.Alloy = @Alloy
	AND dbo.f_McMasterDuplicate([Period],[Alloy],[Form],[cc],[Thck],[PI_Width],[PI_Length],@PBreak,[P_Pc])
*/
AS
BEGIN

IF @PriceBreak < 1
	RETURN 0

DECLARE @lFound BIT = 0
DECLARE @nCount INT = 0

SELECT @lFound=1
,@nCount = COUNT(*)
	FROM dbo.McMaster_Quotes WITH(NOLOCK)
	WHERE McMaster_Quotes.[Period]	= @Period 
			AND McMaster_Quotes.Alloy	= @Alloy
			AND McMaster_Quotes.Form	= @Form
			AND McMaster_Quotes.CC		= @cc
			AND McMaster_Quotes.[Thck]	= @Thck
			AND McMaster_Quotes.PI_Width = @PI_Width
			AND McMaster_Quotes.PI_Length = @PI_Length
			AND McMaster_Quotes.PriceBreak < @PriceBreak
			AND McMaster_Quotes.P_Pc = @P_Pc

--RETURN @lFound
RETURN @nCount
END

--GRANT EXECUTE ON [dbo].[f_McMasterDuplicate] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_NoNoiseName]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_NoNoiseName]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 1/28/2013
-- Description:	Reconcile''s Name -- idea is sort of like soundx
-- =============================================
CREATE FUNCTION [dbo].[f_NoNoiseName] 
(
	-- Send in dirty company name to be cleaned.
	@name VarChar(30)
)
RETURNS char(30)
AS
BEGIN
	--USED IN Allquotes, Shipaddr, SoldAddr, SalesP_Customer
	--UPDATE dbo.allQuotes SET NoNoiseName = dbo.f_NoNoiseName(Company) WHERE Company IS NOT NULL
	--UPDATE dbo.Shipaddr SET NoNoiseName = dbo.f_NoNoiseName(Company) WHERE Company IS NOT NULL
	--UPDATE dbo.SoldAddr SET NoNoiseName = dbo.f_NoNoiseName(Company) WHERE Company IS NOT NULL
	--UPDATE dbo.SalesP_Customer SET NoNoiseName = dbo.f_NoNoiseName(Customer) WHERE Customer IS NOT NULL
	--UPDATE dbo.CUSTOMER_LIST SET NoNoiseName = dbo.f_NoNoiseName(CustomerName) WHERE Customer IS NOT NULL

	--PRINT dbo.f_NoNoiseName (''HIGH PERFORMANCE A'')

	-- Declare the return variable here
	DECLARE @Result char(30)

	DECLARE @NewName char(30)
	DECLARE @nNameLen Int
	SET @nNameLen = LEN(@name)

	--If the normal 30 Characters are name passed in as the Company name, find what is missing.
	--Some SQL reports trim to 18 charaters!
	IF @nNameLen > 16  AND @nNameLen < 30 
		begin
		
		SELECT TOP 1 @NewName = Company 
			FROM dbo.AllQuotes 
			WHERE ID > 2200000 
			AND LEFT( AllQuotes.Company, @nNameLen) = @name
			--AND ID > 2200000
			ORDER BY ID DESC

		IF LEN(@NewName) > @nNameLen
			Set @name = @NewName
		end

	
	IF(@name LIKE ''%INC.%'') BEGIN SET @name = REPLACE(@name, ''INC.'', '''') END
	IF(@name LIKE ''% INC%'') BEGIN SET @name = REPLACE(@name, '' INC'', '''') END
	IF(@name LIKE ''%,INC%'') BEGIN SET @name = REPLACE(@name, '',INC'', '''') END
	
	IF(@name LIKE ''%LLC.%'') BEGIN SET @name = REPLACE(@name, ''LLC.'', '''') END
	IF(@name LIKE ''% LLC%'') BEGIN SET @name = REPLACE(@name, '' LLC'', '''') END
	IF(@name LIKE ''%,LLC%'') BEGIN SET @name = REPLACE(@name, '',LLC'', '''') END
	
	IF(@name LIKE ''%MFG.%'') BEGIN SET @name = REPLACE(@name, ''MFG.'', '''') END
	IF(@name LIKE ''% MFG%'') BEGIN SET @name = REPLACE(@name, '' MFG'', '''') END
	IF(@name LIKE ''%,MFG%'') BEGIN SET @name = REPLACE(@name, '',MFG'', '''') END
	
	IF(@name LIKE ''%LTD.%'') BEGIN SET @name = REPLACE(@name, ''LTD.'', '''') END
	IF(@name LIKE ''% LTD%'') BEGIN SET @name = REPLACE(@name, '' LTD'', '''') END
	IF(@name LIKE ''%,LTD%'') BEGIN SET @name = REPLACE(@name, '',LTD'', '''') END

	IF(@name LIKE ''% CO.%'') BEGIN SET @name = REPLACE(@name, '' CO.'', '''') END
	IF(@name LIKE ''%,CO %'') BEGIN SET @name = REPLACE(@name, '',CO '', '''') END
	IF(@name LIKE ''% CO %'') BEGIN SET @name = REPLACE(@name, '' CO '', '''') END
	
	--IF(@name LIKE ''% COMPANY%'') BEGIN SET @name = REPLACE(@name, '' COMPANY'', '''') END
	IF(@name LIKE ''% CORP.%'') BEGIN SET @name = REPLACE(@name, '' CORP.'', '''') END
	IF(@name LIKE ''% CORP%'') BEGIN SET @name = REPLACE(@name, '' CORP'', '''') END
	IF(@name LIKE ''%,CORP%'') BEGIN SET @name = REPLACE(@name, '',CORP'', '''') END
	IF(@name LIKE ''% CORPORATION%'') BEGIN SET @name = REPLACE(@name, '' CORPORATION'', '''') END

	IF(@name LIKE ''% GMBH.%'') BEGIN SET @name = REPLACE(@name, '' GMBH.'', '''') END
	IF(@name LIKE ''% GMBH%'') BEGIN SET @name = REPLACE(@name, '' GMBH'', '''') END
	IF(@name LIKE ''%,GMBH%'') BEGIN SET @name = REPLACE(@name, '',GMBH'', '''') END

	IF(@name LIKE ''%SPECIAL ALLOYS SERVICE%'') BEGIN SET @name = REPLACE(@name, ''SPECIAL ALLOYS SERVICE'', ''SAS'') END
	IF(@name LIKE ''SPACEX'') BEGIN SET @name = REPLACE(@name, ''SPACEX'', ''SPACEEXPLORATIONTECHNOLOGIES'') END
	
	IF(@name LIKE ''%&%'') BEGIN SET @name = REPLACE(@name, ''&'', '''') END
	IF(@name LIKE ''%AND%'') BEGIN SET @name = REPLACE(@name, ''AND'', '''') END

	IF(@name LIKE ''%.%'') BEGIN SET @name = REPLACE(@name, ''.'', '''') END
	IF(@name LIKE ''%,%'') BEGIN SET @name = REPLACE(@name, '','', '''') END
	
	IF(@name LIKE ''%(%'' AND @name LIKE ''%)%'') 
	BEGIN 
		--Remover contens of brackets (IL)
		DECLARE @name1 Char(30)
		DECLARE @name2 Char(30)
		
		SET @name1 = LEFT(@name, CHARINDEX(''('',@name)-1 )
		SET @name2 = RIGHT(@name, DATALENGTH(@name)-CHARINDEX('')'',@name) )
		
		SET @name = LEFT( RTRIM(@Name1)+LTRIM(@name2) ,30)
	END
	
	IF(@name LIKE ''%-%'') BEGIN SET @name = REPLACE(@name, ''-'', '''') END
	IF(@name LIKE ''% %'') BEGIN SET @name = REPLACE(@name, '' '', '''') END
	IF(@name LIKE ''%"%'') BEGIN SET @name = REPLACE(@name, ''"'', '''') END
	SET @name =	REPLACE(@name, '''''''', '''')
	
	SELECT @Result = UPPER(@name)

	-- Return the result of the function
	RETURN @Result
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_NoNoiseName_Company]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_NoNoiseName_Company]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 1/28/2013
-- Description:	Reconcile''s Name -- idea is sort of like soundx
-- =============================================
CREATE FUNCTION [dbo].[f_NoNoiseName_Company] 
(
	-- Send the NoNoiseName in to find common company of AllQuotes
	@name char(30)
)
RETURNS char(30)
AS
BEGIN
	--USED IN Allquotes, Shipaddr, SoldAddr, SalesP_Customer
	
	-- Declare the return variable here
	DECLARE @Result char(30)
--	SELECT @Result = dbo.f_CompanyStandard(@name)
	-- Add the T-SQL statements to compute the return value here
	
	SELECT TOP 1 @Result = UPPER(Company) FROM dbo.AllQuotes WHERE AllQuotes.NoNoiseName = @name

	-- Return the result of the function
	RETURN @Result
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_OT_GetTotalTime_Adv]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OT_GetTotalTime_Adv]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2014 10 30
-- Modified date: 2014 11 03
-- Description:	Calculates the time a job took in order tracking based on employee timeclock punches
-- =============================================
CREATE FUNCTION [dbo].[f_OT_GetTotalTime_Adv] 
(
	-- Add the parameters for the function here
	@trackID int
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	declare @totalMin float = 0
		,@startStatus int
		,@startTime datetime
		,@stopStatus int
		,@stopTime datetime
		,@clockIn datetime
		,@clockOut datetime
		,@empTotalJobTime float = 0
		,@priorClockIn datetime
		,@priorClockOut datetime
	declare ottCursor cursor for 
		SELECT TOP 1000 --[trackTimeID],
			[Start_StatusId]
			,[StartTime]
			,[Stop_StatusId]
			,[StopTime]
			--,[TrackId]
		FROM [dbo].[OT_Times]
		WHERE [TrackId] = @trackID
		ORDER BY StartTime
	open ottCursor
	FETCH NEXT FROM ottCursor INTO @startStatus, @startTime, @stopStatus, @stopTime
	while @@FETCH_STATUS = 0 
	begin
		if (@stopStatus is not null AND @stopTime is not null)
			begin
				declare CursorEmpTimeClocks cursor for 
					SELECT TOP 1000 [TimeIn]
						,[TimeOut]
					FROM [dbo].[TC_Replacement_Employees_Times]
					WHERE ((TimeIn > @startTime
							AND TimeIn < @stopTime)
						OR (TimeOut > @startTime
							AND TimeOut < @stopTime))
					AND EmployeeId IN (SELECT TOP 1000 [EmployeeId]
											FROM [dbo].[OT_Times_Employees]
											WHERE TrackId = @trackID)
				ORDER BY TimeIn
				open CursorEmpTimeClocks
				FETCH NEXT FROM CursorEmpTimeClocks INTO @clockIn, @clockOut
				while @@FETCH_STATUS = 0 
				begin
					--SET @totalMin += 1
					if(@clockIn < @priorClockOut)
					begin
						if(@clockOut > @priorClockOut)
						begin
							--undo prior time because another employee is extending the continuous job time
							SET @empTotalJobTime -= ERP_2.dbo.f_OT_GetTotalTime_GetEmpTime(@priorClockIn, @priorClockOut, @startTime, @stopTime)--changed 2015 05 08 -- was not ClockIn and CLockOut, not priors
							--calculate job time with new end time
							SET @empTotalJobTime += ERP_2.dbo.f_OT_GetTotalTime_GetEmpTime(@priorClockIn, @clockOut, @startTime, @stopTime)
						end
						--else another employees shift is included within that of another''s... so do not add to the total
					end
					else
					begin
						SET @empTotalJobTime += ERP_2.dbo.f_OT_GetTotalTime_GetEmpTime(@clockIn, @clockOut, @startTime, @stopTime)
					end
					SET @priorClockIn = @clockIn
					SET @priorClockOut = @clockOut
					FETCH NEXT FROM CursorEmpTimeClocks INTO @clockIn, @clockOut
				end
				close CursorEmpTimeClocks
				DEALLOCATE CursorEmpTimeClocks
				
				if(@empTotalJobTime != 0)
				begin
					--this is if the employee clocked in/out of timeclock during an open job
					SET @totalMin += @empTotalJobTime
				end
				else
				begin
					--this is if the employee did not clocked in/out of timeclock during an open job
					SET @totalMin += DATEDIFF(mi, @startTime, @stopTime)
				end

			end
		FETCH NEXT FROM ottCursor INTO @startStatus, @startTime, @stopStatus, @stopTime
	end
	close ottCursor
	DEALLOCATE ottCursor
	--SELECT @totalMin as [Total Minutes]

	-- Return the result of the function
	RETURN @totalMin
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_OT_GetTotalTime_Adv_Per_Employee]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OT_GetTotalTime_Adv_Per_Employee]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Brandon van de Venter
-- Create date: 2019 02 24
-- Modified date: 
-- Description:	Calculates the time a job took in order tracking based on employee timeclock punches PER employee
-- =============================================
CREATE FUNCTION [dbo].[f_OT_GetTotalTime_Adv_Per_Employee] 
(
	-- Add the parameters for the function here
	@trackID int,
	@employeeId int
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	declare @totalMin float = 0
		,@startStatus int
		,@startTime datetime
		,@stopStatus int
		,@stopTime datetime
		,@clockIn datetime
		,@clockOut datetime
		,@empTotalJobTime float = 0
		,@priorClockIn datetime
		,@priorClockOut datetime
	declare ottEmpCursor cursor for 
		SELECT TOP 1000 --[trackTimeID],
			[Start_StatusId]
			,[StartTime]
			,[Stop_StatusId]
			,[StopTime]
			--,[TrackId]
		FROM [dbo].[OT_Times] ott
		JOIN [dbo].[OT_Times_Employees] otte on ott.TimeId = otte.TimeId
		WHERE ott.[TrackId] = @trackID
		AND otte.EmployeeId = @employeeId
		ORDER BY StartTime
	open ottEmpCursor
	FETCH NEXT FROM ottEmpCursor INTO @startStatus, @startTime, @stopStatus, @stopTime
	while @@FETCH_STATUS = 0 
	begin
		if (@stopStatus is not null AND @stopTime is not null)
			begin
				declare CursorPerEmpTimeClocks cursor for 
					SELECT TOP 1000 [TimeIn]
						,[TimeOut]
					FROM [dbo].[TC_Replacement_Employees_Times]
					WHERE (([TimeIn] > @startTime
							AND [TimeIn] < @stopTime)
						OR ([TimeOut] > @startTime
							AND [TimeOut] < @stopTime))
					AND EmployeeId IN (SELECT TOP 1000 [EmployeeId]
											FROM [dbo].[OT_Times_Employees]
											WHERE TrackId = @trackID
											AND EmployeeId = @employeeId)
					ORDER BY TimeIn
				open CursorPerEmpTimeClocks
				FETCH NEXT FROM CursorPerEmpTimeClocks INTO @clockIn, @clockOut
				while @@FETCH_STATUS = 0 
				begin
					--SET @totalMin += 1
					if(@clockIn < @priorClockOut)
					begin
						if(@clockOut > @priorClockOut)
						begin
							--undo prior time because another employee is extending the continuous job time
							SET @empTotalJobTime -= ERP_2.dbo.f_OT_GetTotalTime_GetEmpTime(@priorClockIn, @priorClockOut, @startTime, @stopTime)--changed 2015 05 08 -- was not ClockIn and CLockOut, not priors
							--calculate job time with new end time
							SET @empTotalJobTime += ERP_2.dbo.f_OT_GetTotalTime_GetEmpTime(@priorClockIn, @clockOut, @startTime, @stopTime)
						end
						--else another employees shift is included within that of another''s... so do not add to the total
					end
					else
					begin
						SET @empTotalJobTime += ERP_2.dbo.f_OT_GetTotalTime_GetEmpTime(@clockIn, @clockOut, @startTime, @stopTime)
					end
					SET @priorClockIn = @clockIn
					SET @priorClockOut = @clockOut
					FETCH NEXT FROM CursorPerEmpTimeClocks INTO @clockIn, @clockOut
				end
				close CursorPerEmpTimeClocks
				DEALLOCATE CursorPerEmpTimeClocks
				
				if(@empTotalJobTime != 0)
				begin
					--this is if the employee clocked in/out of timeclock during an open job
					SET @totalMin += @empTotalJobTime
				end
				else
				begin
					--this is if the employee did not clocked in/out of timeclock during an open job
					SET @totalMin += DATEDIFF(mi, @startTime, @stopTime)
				end

			end
		FETCH NEXT FROM ottEmpCursor INTO @startStatus, @startTime, @stopStatus, @stopTime
	end
	close ottEmpCursor
	DEALLOCATE ottEmpCursor
	--SELECT @totalMin as [Total Minutes]

	-- Return the result of the function
	RETURN @totalMin
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_OT_GetTotalTime_GetEmpTime]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OT_GetTotalTime_GetEmpTime]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2014 11 3
-- Description:	To be only used in the function f_OT_GetTotalTime_Adv
-- =============================================
CREATE FUNCTION [dbo].[f_OT_GetTotalTime_GetEmpTime] 
(
	-- Add the parameters for the function here
	@clockIn datetime
	,@clockOut datetime
	,@startDate datetime
	,@time datetime
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @empTotalJobTime float = 0

	-- Add the T-SQL statements to compute the return value here
	if(@clockOut IS NOT NULL)
	begin
		if(@clockOut < @time)
		begin
			if(@clockIn > @startDate)
			begin
				--this is when a job is started before the employee clocked in and was not ended until after the employee clocked out
				SET @empTotalJobTime += DATEDIFF(mi, @clockIn, @clockOut)
			end
			else
			begin
				--this is when a job is started after the employee clocked in and was not ended until after the employee clocked out
				SET @empTotalJobTime += DATEDIFF(mi, @startDate, @clockOut)
			end
		end
		else
		begin
			if(@clockIn > @startDate)
			begin
				--this is when a job is started before the employee clocked in and was ended before the employee clocked out
				SET @empTotalJobTime += DATEDIFF(mi, @clockIn, @time)
			end
			else
			begin
				--this is when a job is started after the employee clocked in and was ended before the employee clocked out
				SET @empTotalJobTime += DATEDIFF(mi, @startDate, @time)
			end
		end
	end
	else --@clockOut = NULL so employee has not clocked out yet
	begin
		--this is when a job is started before the employee clocked in and employee has not clocked out yet
		SET @empTotalJobTime += DATEDIFF(mi, @clockIn, @time)
	end

	-- Return the result of the function
	RETURN @empTotalJobTime

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_OT_Descript]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OT_Descript]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David M Kirchner
-- Create date: 2019 10 07
-- Modified date: 
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_OT_Descript] 
(
	@OType_Num  CHAR(15)
)
RETURNS VarChar(100)
AS

BEGIN
	-- SELECT dbo.f_OT_Descript(OType_Num) AS Descript 

/*  dbo.OT_OrderType
--1	SET @cOType_Num = ''WO''+@cOrderNumber
--2	SET @cOType_Num = ''SO''+@cOrderNumber
--3	SET @cOType_Num = ''PI''+@cOrderNumber
--4	SET @cOType_Num = ''SI''+@cOrderNumber
--5	SET @cOType_Num = ''WD''+@cOrderNumber
--6	SET @cOType_Num = ''MT''+@cOrderNumber
--7	SET @cOType_Num = ''PO''+@cOrderNumber
--8	SET @cOType_Num = ''RA''+@cOrderNumber
--9	SET @cOType_Num = ''RD''+@cOrderNumber
*/

	DECLARE @cOType CHAR(2);
	DECLARE @cOrderNum CHAR(13) = '''';
	--DECLARE @nOrder INT = 0;

	SET @cOType = LEFT(@OType_Num,2)
	SET @cOrderNum = LTRIM(RIGHT(@OType_Num,13))
	--SET @nOrder = CAST(@OrderNum AS INT)

	DECLARE @cSalesRep CHAR(20) = ''''
	DECLARE @cAlloy CHAR(12) = ''''
	DECLARE @cDescript VarChar(100) = '''';
	DECLARE @cDescriptID VarChar(25) = '''';
	--((((isnull([Alloy],''            '')+isnull([Form],''  ''))+isnull([CC],'' ''))+isnull([CL],'' ''))+str(round([Thck],(9),(3)),(9),(3)))
	DECLARE @cCompany CHAR(15) = ''''


	IF @cOType = ''WO''
		begin
		--@nOrderTypeID = 1
		SELECT TOP 1 @cSalesRep = WO.SalesRep
			,@cAlloy = WO.sAlloy
			,@cDescript = ERP_2.dbo.f_ItemDescription(WO.sForm,WO.sThck,WO.sSz2,WO.sSz3,WO.sWeight,0) 
			,@cDescriptID = dbo.f_DescriptID(WO.sAlloy,WO.sForm,WO.sCC,WO.sCL,WO.sThck) 
			,@cCompany = ''HPA Production ''
			FROM dbo.WorkOrder WO
			WHERE WO.WO = CAST(@cOrderNum AS INT)
		end
	ELSE
	IF @cOType = ''SO''
		begin
		--@nOrderTypeID = 2
		SELECT TOP 1 @cSalesRep = SN.SalesRep 
			,@cAlloy = AQ.Alloy
			,@cDescript = ERP_2.dbo.f_ItemDescription(AQ.Form,AQ.Thck,AQ.Sz2,AQ.Sz3,AQ.[Weight],AQ.RandLen) 
			,@cDescriptID = AQ.DescriptID
			,@cCompany = LEFT(AQ.Company,15)
			FROM dbo.Sales_No SN 
			INNER JOIN dbo.AllQuotes AQ ON SN.SalesNum = AQ.SalesNum
			WHERE SN.SalesNum = CAST(@cOrderNum AS INT)
		end
	ELSE
	IF @cOType = ''PI''
		begin
		--@nOrderTypeID = 3
		SELECT @cSalesRep = dbo.f_SalesPDescription( PO.SalesP,PO.Cover) 
			,@cAlloy = PO.Alloy
			,@cDescript = ERP_2.dbo.f_ItemDescription(PO.Form,PO.Thck,PO.Sz2,PO.Sz3,PO.Pounds,0) 
			,@cDescriptID = PO.DescriptID
			,@cCompany = LEFT(PO.Company,15)
			FROM dbo.PurchaseOrder PO 
			WHERE PO.POitem = dbo.f_Proper_OrderItem(''PI'', @cOrderNum )
			--WHERE POitem = dbo.f_ProperPOitem( @OrderNum )
		end
	ELSE
	IF @cOType = ''SI''
		begin
		--@nOrderTypeID = 4
		SELECT @cSalesRep = dbo.f_SalesPDescription( AQ.SalesP,AQ.Cover) 
			,@cAlloy = AQ.Alloy
			,@cDescript = ERP_2.dbo.f_ItemDescription(AQ.Form,AQ.Thck,AQ.Sz2,AQ.Sz3,AQ.[Weight],AQ.RandLen) 
			,@cDescriptID = AQ.DescriptID
			,@cCompany = LEFT(AQ.Company,15)
			FROM dbo.AllQuotes AQ
			WHERE AQ.SOitem = dbo.f_Proper_OrderItem(''SI'', @cOrderNum )
		end
	ELSE
	IF @cOType = ''WD''
		begin
		--@nOrderTypeID = 5
		SELECT TOP 1 @cSalesRep = WO.SalesRep 
			,@cAlloy = WOD.fAlloy
			,@cDescript = ERP_2.dbo.f_ItemDescription(WOD.fForm,WOD.fThck,WOD.fSz2,WOD.fSz3,WOD.fWeight,0) 
			,@cDescriptID = dbo.f_DescriptID(WOD.fAlloy,WOD.fForm,WOD.fcc,WOD.fcl,WOD.fThck) 
			,@cCompany = ''HPA            ''
			FROM dbo.WorkOrder WO 
			INNER JOIN dbo.WorkOrder_Detail WOD ON WO.WO = WOD.WO
			WHERE WOD.WO_Detail = CAST(@cOrderNum AS INT)
		end
	ELSE
	IF @cOType = ''MT''
		begin
		--@nOrderTypeID = 6
		SET @cSalesRep = ''Maintanance''
		SET @cAlloy = ''''
		SET @cDescript = ''''
		SET @cDescriptID = ''''
		SET @cCompany = ''HPA Maintanence''
		end
	ELSE
	IF @cOType = ''PO''
		begin
		--@nOrderTypeID = 7
		SELECT TOP 1 @cSalesRep = dbo.f_SalesPDescription(PO.SalesP,PO.Cover)
			,@cAlloy = PO.Alloy
			,@cDescript = ERP_2.dbo.f_ItemDescription(PO.Form,PO.Thck,PO.Sz2,PO.Sz3,PO.Pounds,0) 
			,@cDescriptID = PO.DescriptID
			,@cCompany = LEFT(PO.Company,15)
			FROM dbo.PurchaseOrder PO
			WHERE PO.HPApo = CAST(@cOrderNum AS INT)
		end
	ELSE
	IF @cOType = ''RA''
		begin
		--@nOrderTypeID = 8
		SELECT TOP 1 @cSalesRep = dbo.f_SalesPDescription(AQ.SalesP,AQ.Cover) 
			,@cAlloy = AQ.Alloy
			,@cDescript = ERP_2.dbo.f_ItemDescription(AQ.Form,AQ.Thck,AQ.Sz2,AQ.Sz3,AQ.[Weight],AQ.RandLen) 
			,@cDescriptID = AQ.DescriptID
			,@cCompany = LEFT(AQ.Company,15)
			FROM dbo.AllQuotes AQ 
			INNER JOIN dbo.RMA_Detail RMAD ON AQ.SOitem = RMAD.SO_item
			INNER JOIN dbo.RMA RMA ON RMAD.RMA_NO = RMA.RMA_No
			WHERE RMA.RMA_No = CAST(@cOrderNum AS INT)

		SET @cSalesRep = ''RMA '' + @cSalesRep
		end
	ELSE
	IF @cOType = ''RD''
		begin
		--@nOrderTypeID = 9
		SELECT TOP 1 @cSalesRep = dbo.f_SalesPDescription(AQ.SalesP,AQ.Cover) 
			,@cAlloy = AQ.Alloy
			,@cDescript = ERP_2.dbo.f_ItemDescription(AQ.Form,AQ.Thck,AQ.Sz2,AQ.Sz3,AQ.[Weight],AQ.RandLen) 
			,@cDescriptID = AQ.DescriptID
			,@cCompany = LEFT(AQ.Company,15)
			FROM dbo.AllQuotes AQ 
			INNER JOIN dbo.RMA_Detail RMAD ON AQ.SOitem = RMAD.SO_item
			WHERE RMAD.RMA_Detail_ID = CAST(@cOrderNum AS INT)

		SET @cSalesRep = ''RMA '' + @cSalesRep
		end
	ELSE
		begin	
		SET @cSalesRep = ''''
		SET @cDescript = ''''
		SET @cAlloy = ''''
		SET @cDescriptID = ''''
		SET @cCompany = ''               ''
		end



	--@cDescriptID 
	--RETURN @cDescriptID+'' ''+@cSalesRep+''[''+@cAlloy+''] ''+@cDescript 
	--RETURN ISNULL(@cSalesRep+''[''+@cAlloy+''] ''+@cDescript ,'''')
	--RETURN ISNULL(RTRIM(@cCompany)+'' ''+@cAlloy+'' ''+@cDescript+'' @''+@cSalesRep ,'''')
	RETURN ISNULL(@cCompany+''. ''+@cAlloy+'' ''+@cDescript+'' @''+@cSalesRep ,'''')
END

--GRANT EXECUTE ON [dbo].[f_OT_Descript] TO [WINDFALL\HPA] AS [dbo];
--GRANT EXECUTE ON [dbo].[f_OT_Descript] TO [HPA_Service] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_OT_DueDate]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OT_DueDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David M Kirchner
-- Create date: 2020 04 09
-- Modified date: 
-- Description:	returns Date that OType_Num is Due.
-- =============================================
CREATE FUNCTION [dbo].[f_OT_DueDate] 
(
	@OType_Num  CHAR(15)
)
RETURNS Date
AS

BEGIN
	-- SELECT dbo.f_OT_DueDate(OType_Num) AS DueDate 

/*  dbo.OT_OrderType
--1	SET @cOType_Num = ''WO''+@cOrderNumber
--2	SET @cOType_Num = ''SO''+@cOrderNumber
--3	SET @cOType_Num = ''PI''+@cOrderNumber
--4	SET @cOType_Num = ''SI''+@cOrderNumber
--5	SET @cOType_Num = ''WD''+@cOrderNumber
--6	SET @cOType_Num = ''MT''+@cOrderNumber
--7	SET @cOType_Num = ''PO''+@cOrderNumber
--8	SET @cOType_Num = ''RA''+@cOrderNumber
--9	SET @cOType_Num = ''RD''+@cOrderNumber
*/

	DECLARE @cOType CHAR(2);
	DECLARE @cOrderNum CHAR(13) = '''';
	--DECLARE @nOrder INT = 0;

	SET @cOType = LEFT(@OType_Num,2)
	SET @cOrderNum = LTRIM(RIGHT(@OType_Num,13))
	--SET @nOrder = CAST(@OrderNum AS INT)

	DECLARE @dReturnDate AS DATE = GETDATE()

	IF @cOType = ''WO''
		begin
		--@nOrderTypeID = 1
		SELECT TOP 1 @dReturnDate=dbo.f_BestDate(WO.DueDate,dbo.f_BestDate(WOD.fDueDate,GetDate()+30))
			FROM dbo.WorkOrder WO
			INNER JOIN dbo.WorkOrder_Detail WOD ON WO.WO = WOD.WO 
				AND NOT WOD.fDueDate IS NULL 
				AND ISNULL(WOD.fCmplt,0) = 0
				AND ISNULL(WOD.fCncld,0) = 0
			WHERE WO.WO = CAST(@cOrderNum AS INT)
			ORDER BY WOD.fDueDate
		end
	ELSE
	IF @cOType = ''SO''
		begin
		--@nOrderTypeID = 2
		SELECT TOP 1 @dReturnDate=dbo.f_BestDate(S.ShipDue,S.Shipped)
			FROM dbo.Sales_No SN 
			INNER JOIN dbo.Sales S ON SN.SalesNum = S.SalesNum 
				AND NOT S.ShipDue IS NULL 
				AND ISNULL(S.Cmplt,0) = 0
				AND ISNULL(S.Cncld,0) = 0
			WHERE SN.SalesNum = CAST(@cOrderNum AS INT)
			ORDER BY S.ShipDue

		end
	ELSE
	IF @cOType = ''PI''
		begin
		--@nOrderTypeID = 3
		SELECT @dReturnDate=dbo.f_BestDate(PO.HPA_Due_Min,dbo.f_BestDate(PO.HPA_Due_Max,dbo.f_BestDate(PO.Due_Min,PO.Due_Max)))
			FROM dbo.PurchaseOrder PO 
			WHERE PO.POitem = dbo.f_Proper_OrderItem(''PI'', @cOrderNum )
			--WHERE POitem = dbo.f_ProperPOitem( @OrderNum )
		end
	ELSE
	IF @cOType = ''SI''
		begin
		--@nOrderTypeID = 4
		SELECT @dReturnDate=dbo.f_BestDate(S.ShipDue,dbo.f_BestDate(S.Shipped,AQ.ShipDate))
			FROM dbo.Sales S
			INNER JOIN dbo.AllQuotes AQ ON S.SOitem = AQ.SOitem
			WHERE S.SOitem = dbo.f_Proper_OrderItem(''SI'', @cOrderNum )
			--WHERE SOitem = dbo.f_ProperSOitem( @OrderNum )
		end
	ELSE
	IF @cOType = ''WD''
		begin
		--@nOrderTypeID = 5
		SELECT TOP 1 @dReturnDate=dbo.f_BestDate(WOD.fDueDate,dbo.f_BestDate(WOD.fFinishDate,WO.DueDate))
			FROM dbo.WorkOrder WO 
			INNER JOIN dbo.WorkOrder_Detail WOD ON WO.WO = WOD.WO
			WHERE WOD.WO_Detail = CAST(@cOrderNum AS INT)
		end
	ELSE
	IF @cOType = ''MT''
		begin
		--@nOrderTypeID = 6
		SET @dReturnDate=GetDate()
		end
	ELSE
	IF @cOType = ''PO''
		begin
		--@nOrderTypeID = 7
		SELECT TOP 1 @dReturnDate=dbo.f_BestDate(PO.HPA_Due_Min,dbo.f_BestDate(PO.HPA_Due_Max,dbo.f_BestDate(PO.Due_Min,PO.Due_Max)))
			FROM dbo.PurchaseOrder PO
			WHERE PO.HPApo = CAST(@cOrderNum AS INT)
			ORDER BY ISNULL(PO.Cancelled,0), ISNULL(PO.Delivered,0)
				, dbo.f_BestDate(PO.HPA_Due_Min,dbo.f_BestDate(PO.HPA_Due_Max,dbo.f_BestDate(PO.Due_Min,PO.Due_Max)))
			--Find an item Not Cancelled and Not Delivered
		end
	ELSE
	IF @cOType = ''RA''
		begin
		--@nOrderTypeID = 8
		SELECT TOP 1 @dReturnDate=dbo.f_BestDate(RMA.aprv_date,dbo.f_BestDate(RCD.WhenAdd,dbo.f_BestDate(RCA.WhenAdd,GetDate() )))
			FROM dbo.AllQuotes AQ 
			INNER JOIN dbo.RMA_Detail RMAD ON AQ.SOitem = RMAD.SO_item
			INNER JOIN dbo.RMA RMA ON RMAD.RMA_NO = RMA.RMA_No
			LEFT OUTER JOIN dbo.Receiving RCA ON RMA.RMA_No = RCA.RMA_No 
			LEFT OUTER JOIN dbo.Receiving RCD ON RMAD.RMA_Detail_ID = RCD.RMA_Detail
			WHERE RMA.RMA_No = CAST(@cOrderNum AS INT)

		--SET @cSalesRep = ''RMA '' + @cSalesRep
		end
	ELSE
	IF @cOType = ''RD''
		begin
		--@nOrderTypeID = 9
		--SELECT TOP 1 @dReturnDate=dbo.f_BestDate(GetDate(),GetDate())
		--	FROM dbo.AllQuotes AQ 
		--	INNER JOIN dbo.RMA_Detail RMAD ON AQ.SOitem = RMAD.SO_item
		--	WHERE RMAD.RMA_Detail_ID = CAST(@cOrderNum AS INT)
		SELECT TOP 1 @dReturnDate=dbo.f_BestDate(RMAD.returned,dbo.f_BestDate(RCD.WhenAdd,GetDate() ))
			FROM dbo.AllQuotes AQ 
			INNER JOIN dbo.RMA_Detail RMAD ON AQ.SOitem = RMAD.SO_item
			INNER JOIN dbo.RMA RMA ON RMAD.RMA_NO = RMA.RMA_No
			LEFT OUTER JOIN dbo.Receiving RCD ON RMAD.RMA_Detail_ID = RCD.RMA_Detail
			WHERE RMA.RMA_No = CAST(@cOrderNum AS INT)
		end
	ELSE
		begin	
		SET @dReturnDate=GetDate()
		end


	RETURN ISNULL(@dReturnDate,GetDate())
END

--GRANT EXECUTE ON [dbo].[f_OT_DueDate] TO [WINDFALL\HPA] AS [dbo];
--GRANT EXECUTE ON [dbo].[f_OT_DueDate] TO [HPA_Service] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_OT_JobClassID]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OT_JobClassID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David Kirchner
-- Create date: ???
-- Description:	<>
-- 
-- =============================================
CREATE FUNCTION [dbo].[f_OT_JobClassID] 
(
@JobID TINYINT

)

--RETURNS Job Class Description

RETURNS nCHAR(11)
AS

BEGIN
--SET @JobClass = dbo.f_OT_JobClassID(JobClassID)

DECLARE @JobClass nCHAR(11) =''''

SELECT @JobClass = [Name]
FROM [dbo].[OT_Job_Class]
WHERE [ClassId] = @JobID

RETURN @JobClass
END


/*
GRANT EXECUTE ON [dbo].[f_OT_JobClassID] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_OT_JobClassID] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_OT_JobClassID] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_OT_Num_Valid]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OT_Num_Valid]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David M Kirchner
-- Create date: 2019 10 07
-- Modified date: 
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_OT_Num_Valid]
(
	@cOType_Num char(15)
)
RETURNS BIT
AS
BEGIN

--SELECT dbo.f_OT_Num_Valid(''SI 115068-01   '')
--SELECT dbo.f_OT_Num_Valid(''WD1147         '') 

DECLARE @lReturn BIT

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @lReturn = 0


/*  dbo.OT_OrderType
--1	SET @cOType_Num = ''WO''+@cOrderNumber
--2	SET @cOType_Num = ''SO''+@cOrderNumber
--3	SET @cOType_Num = ''PI''+@cOrderNumber
--4	SET @cOType_Num = ''SI''+@cOrderNumber
--5	SET @cOType_Num = ''WD''+@cOrderNumber
--6	SET @cOType_Num = ''MT''+@cOrderNumber
--7	SET @cOType_Num = ''PO''+@cOrderNumber
--8	SET @cOType_Num = ''RA''+@cOrderNumber
--9	SET @cOType_Num = ''RD''+@cOrderNumber
*/

	DECLARE @cOType CHAR(2);
	DECLARE @cOrderNum CHAR(13) = '''';

	SET @cOType = LEFT(@cOType_Num,2)
	SET @cOrderNum = LTRIM(RIGHT(@cOType_Num,13))

	IF @cOType = ''WO''
		begin
		--@nOrderTypeID = 1
		--PRINT ''Work Order''
		IF EXISTS( 	SELECT *
			FROM dbo.WorkOrder WO
			WHERE WO.WO = CAST(@cOrderNum AS INT) 
			)
			SET @lReturn = 1
		end
	ELSE
	IF @cOType = ''SO''
		begin
		--@nOrderTypeID = 2
		--PRINT ''Sales Order''
		IF EXISTS( 	SELECT *
			FROM dbo.Sales_No SN 
			INNER JOIN dbo.AllQuotes AQ ON SN.SalesNum = AQ.SalesNum
			WHERE SN.SalesNum = CAST(@cOrderNum AS INT)
			)
			SET @lReturn = 1
		end
	ELSE
	IF @cOType = ''PI''
		begin
		--@nOrderTypeID = 3
		--PRINT ''PO Item''
		IF EXISTS( 	SELECT *
			FROM dbo.PurchaseOrder PO 
			WHERE PO.POitem = dbo.f_Proper_OrderItem(''PI'', @cOrderNum )
			--WHERE POitem = dbo.f_ProperPOitem( @OrderNum )
			)
			SET @lReturn = 1
		end
	ELSE
	IF @cOType = ''SI''
		begin
		--@nOrderTypeID = 4
		--PRINT ''SO Item''
		IF EXISTS( 	SELECT *
			FROM dbo.AllQuotes AQ
			WHERE AQ.SOitem = dbo.f_Proper_OrderItem(''SI'', @cOrderNum )
			)
			SET @lReturn = 1
		end
	ELSE
	IF @cOType = ''WD''
		begin
		--@nOrderTypeID = 5
		--PRINT ''WO Detail''
		IF EXISTS( 	SELECT *
			FROM dbo.WorkOrder WO 
			INNER JOIN dbo.WorkOrder_Detail WOD ON WO.WO = WOD.WO
			WHERE WOD.WO_Detail = CAST(@cOrderNum AS INT)
			)
			SET @lReturn = 1
		end
	ELSE
	IF @cOType = ''MT''
		begin
		--@nOrderTypeID = 6
		--PRINT ''Maintenance''
		SET @lReturn = 0
		end
	ELSE
	IF @cOType = ''PO''
		begin
		--@nOrderTypeID = 7
		--PRINT ''HPA PO''
		IF EXISTS( 	SELECT *
			FROM dbo.PurchaseOrder PO
			WHERE PO.HPApo = CAST(@cOrderNum AS INT)
			)
			SET @lReturn = 1
		end
	ELSE
	IF @cOType = ''RA''
		begin
		--@nOrderTypeID = 8
		--PRINT '' Returm Material Auth RMA)
		IF EXISTS( 	SELECT *
			FROM dbo.AllQuotes AQ 
			INNER JOIN dbo.RMA_Detail RMAD ON AQ.SOitem = RMAD.SO_item
			INNER JOIN dbo.RMA RMA ON RMAD.RMA_NO = RMA.RMA_No
			WHERE RMA.RMA_No = CAST(@cOrderNum AS INT)
			)
			SET @lReturn = 1
		end
	ELSE
	IF @cOType = ''RD''

		begin
		--@nOrderTypeID = 9
		--PRINT ''RMA Detail''
		IF EXISTS( 	SELECT *
			FROM dbo.AllQuotes AQ 
			INNER JOIN dbo.RMA_Detail RMAD ON AQ.SOitem = RMAD.SO_item
			WHERE RMAD.RMA_Detail_ID = CAST(@cOrderNum AS INT)
			)
			SET @lReturn = 1
		end




RETURN @lReturn
END

--GRANT EXECUTE ON [dbo].[f_OT_Num_Valid] TO [WINDFALL\HPA] AS [dbo];
--GRANT EXECUTE ON [dbo].[f_OT_Num_Valid] TO [HPA_Service] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_OT_Oper_ID_JobID]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OT_Oper_ID_JobID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David Kirchner
-- Create date: ???
-- Description:	<Returns Job Oper_ID when provided a JobID>
-- Updated: 04/06/2020 - Brandon: changed from ''WHERE Oper_ID = @JobID'' to ''WHERE JobID = @JobID''
-- =============================================
CREATE FUNCTION [dbo].[f_OT_Oper_ID_JobID] 
(
@JobID INT

)
--get @Oper_ID from OT_Job  with JobID
--RETURNS @Oper_ID

RETURNS INT
AS

BEGIN
--SET @Oper_ID = dbo.f_OT_Oper_ID_JobID(JobID)

DECLARE @Oper_ID INT = 0

SELECT TOP 1 @Oper_ID = Oper_ID 
	FROM dbo.OT_Job
	WHERE JobID = @JobID

	
RETURN ISNULL(@Oper_ID,0)
END


/*
GRANT EXECUTE ON [dbo].[f_OT_Oper_ID_JobID] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_OT_Oper_ID_JobID] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_OT_Oper_ID_JobID] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_OT_SalesRep]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OT_SalesRep]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David M Kirchner
-- Create date: 2019 10 07
-- Modified date: 
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_OT_SalesRep] 
(
	-- Add the parameters for the function here
	@OrderNum VARCHAR(15),
	@OrderTypeID int
)
RETURNS VarChar(50)
AS

BEGIN
	-- Declare the return variable here
	declare @cSalesRep VarChar(20) = ''''
--	DECLARE @nOrderNum INT = 0
--	DECLARE @cOrderNum VARCHAR(15) = ''''

/*  dbo.OT_OrderType
1 WorkOrder
2 Sales Order
3 PO Item
4 SO Item
5 WO Detail
6 Maintenance
7 Purchase Order
8 Return Merchandise Authorization
9 RMA Detail
*/

	IF @OrderTypeID = 1
		SELECT @cSalesRep = SalesRep FROM dbo.WorkOrder WHERE WO = CAST(@OrderNum AS INT)
	ELSE
	IF @OrderTypeID = 2
		SELECT @cSalesRep = SalesRep FROM dbo.Sales_No WHERE SalesNum = CAST(@OrderNum AS INT)
	ELSE
	IF @OrderTypeID = 3
		SELECT @cSalesRep = dbo.f_SalesPDescription( SalesP,Cover) FROM dbo.PurchaseOrder 
			WHERE POitem = dbo.f_Proper_OrderItem(''PI'', @OrderNum )
			--WHERE POitem = dbo.f_ProperPOitem( @OrderNum )
	ELSE
	IF @OrderTypeID = 4
		SELECT @cSalesRep = dbo.f_SalesPDescription( SalesP,Cover) FROM dbo.AllQuotes 
			WHERE SOitem = dbo.f_Proper_OrderItem(''SI'', @OrderNum )
	ELSE
	IF @OrderTypeID = 5
		SELECT @cSalesRep = WO.SalesRep FROM dbo.WorkOrder WO 
			INNER JOIN dbo.WorkOrder_Detail WOD ON WO.WO = WOD.WO
			WHERE WOD.WO_Detail = CAST(@OrderNum AS INT)
	ELSE
	IF @OrderTypeID = 6
		SET @cSalesRep = ''Maintanance''
	ELSE
	IF @OrderTypeID = 7
		SELECT @cSalesRep = dbo.f_SalesPDescription( SalesP,Cover) FROM dbo.PurchaseOrder WHERE HPApo = CAST(@OrderNum AS INT)
	ELSE
	IF @OrderTypeID = 8
		begin
		SELECT TOP 1 @cSalesRep = dbo.f_SalesPDescription( AQ.SalesP,AQ.Cover) FROM dbo.AllQuotes AQ 
			INNER JOIN dbo.RMA_Detail RMAD ON AQ.SOitem = RMAD.SO_item
			INNER JOIN dbo.RMA RMA ON RMAD.RMA_NO = RMA.RMA_No
			WHERE RMA.RMA_No = CAST(@OrderNum AS INT)

		SET @cSalesRep = ''RMA '' + @cSalesRep
		end
	ELSE
	IF @OrderTypeID = 9
		begin
		SELECT TOP 1 @cSalesRep = dbo.f_SalesPDescription( AQ.SalesP,AQ.Cover) FROM dbo.AllQuotes AQ 
			INNER JOIN dbo.RMA_Detail RMAD ON AQ.SOitem = RMAD.SO_item
			WHERE RMAD.RMA_Detail_ID = CAST(@OrderNum AS INT)

		SET @cSalesRep = ''RMA '' + @cSalesRep
		end
	ELSE	
		SET @cSalesRep = ''''
	 
	RETURN @cSalesRep
END

--GRANT EXECUTE ON [dbo].[f_OT_SalesRep] TO [WINDFALL\HPA] AS [dbo];
--GRANT EXECUTE ON [dbo].[f_OT_SalesRep] TO [HPA_Service] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_OT_StartDate]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OT_StartDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David M Kirchner
-- Create date: 2020 04 09
-- Modified date: 
-- Description:	returns Date that OType_Num was started.
-- =============================================
CREATE FUNCTION [dbo].[f_OT_StartDate] 
(
	@OType_Num  CHAR(15)
)
RETURNS Date
AS

BEGIN
	-- SELECT dbo.f_OT_StartDate(OType_Num) AS StartDate 

/*  dbo.OT_OrderType
--1	SET @cOType_Num = ''WO''+@cOrderNumber
--2	SET @cOType_Num = ''SO''+@cOrderNumber
--3	SET @cOType_Num = ''PI''+@cOrderNumber
--4	SET @cOType_Num = ''SI''+@cOrderNumber
--5	SET @cOType_Num = ''WD''+@cOrderNumber
--6	SET @cOType_Num = ''MT''+@cOrderNumber
--7	SET @cOType_Num = ''PO''+@cOrderNumber
--8	SET @cOType_Num = ''RA''+@cOrderNumber
--9	SET @cOType_Num = ''RD''+@cOrderNumber
*/
	DECLARE @cOType CHAR(2);
	DECLARE @cOrderNum CHAR(13) = '''';
	--DECLARE @nOrder INT = 0;

	SET @cOType = LEFT(@OType_Num,2)
	SET @cOrderNum = LTRIM(RIGHT(@OType_Num,13))
	--SET @nOrder = CAST(@OrderNum AS INT)

	DECLARE @dReturnDate AS DATE = GETDATE()

	IF @cOType = ''WO''
		begin
		--@nOrderTypeID = 1
		SELECT TOP 1 @dReturnDate=dbo.f_BestDate(WO.StartDate,WO.EnterDate)
			FROM dbo.WorkOrder WO
			WHERE WO.WO = CAST(@cOrderNum AS INT)
		end
	ELSE
	IF @cOType = ''SO''
		begin
		--@nOrderTypeID = 2
		SELECT TOP 1 @dReturnDate=dbo.f_BestDate(AQ.SaleDate,SN.CreateDate)
			FROM dbo.Sales_No SN 
			INNER JOIN dbo.AllQuotes AQ ON SN.SalesNum = AQ.SalesNum
			WHERE SN.SalesNum = CAST(@cOrderNum AS INT)
		end
	ELSE
	IF @cOType = ''PI''
		begin
		--@nOrderTypeID = 3
		SELECT @dReturnDate=dbo.f_BestDate(PO.OrderDate,GetDate())
			FROM dbo.PurchaseOrder PO 
			WHERE PO.POitem = dbo.f_Proper_OrderItem(''PI'', @cOrderNum )
			--WHERE POitem = dbo.f_ProperPOitem( @OrderNum )
		end
	ELSE
	IF @cOType = ''SI''
		begin
		--@nOrderTypeID = 4
		SELECT @dReturnDate=dbo.f_BestDate(AQ.SaleDate,AQ.InqDate)
			FROM dbo.AllQuotes AQ
			WHERE AQ.SOitem = dbo.f_Proper_OrderItem(''SI'', @cOrderNum )
			--WHERE SOitem = dbo.f_ProperSOitem( @OrderNum )
		end
	ELSE
	IF @cOType = ''WD''
		begin
		--@nOrderTypeID = 5
		SELECT TOP 1 @dReturnDate=dbo.f_BestDate(WOD.fStartDate,dbo.f_BestDate(WO.StartDate,WO.EnterDate))
			FROM dbo.WorkOrder WO 
			INNER JOIN dbo.WorkOrder_Detail WOD ON WO.WO = WOD.WO
			WHERE WOD.WO_Detail = CAST(@cOrderNum AS INT)
		end
	ELSE
	IF @cOType = ''MT''
		begin
		--@nOrderTypeID = 6
		SET @dReturnDate=GetDate()
		end
	ELSE
	IF @cOType = ''PO''
		begin
		--@nOrderTypeID = 7
		SELECT TOP 1 @dReturnDate=dbo.f_BestDate(PO.OrderDate,GetDate())
			FROM dbo.PurchaseOrder PO
			WHERE PO.HPApo = CAST(@cOrderNum AS INT)
		end
	ELSE
	IF @cOType = ''RA''
		begin
		--@nOrderTypeID = 8
		SELECT TOP 1 @dReturnDate=dbo.f_BestDate(RMA.notified,dbo.f_BestDate(RMA.aprv_date,GetDate()))
			FROM dbo.AllQuotes AQ 
			INNER JOIN dbo.RMA_Detail RMAD ON AQ.SOitem = RMAD.SO_item
			INNER JOIN dbo.RMA RMA ON RMAD.RMA_NO = RMA.RMA_No
			WHERE RMA.RMA_No = CAST(@cOrderNum AS INT)

		--SET @cSalesRep = ''RMA '' + @cSalesRep
		end
	ELSE
	IF @cOType = ''RD''
		begin
		--@nOrderTypeID = 9
		--SELECT TOP 1 @dReturnDate=dbo.f_BestDate(GetDate(),GetDate())
		--	FROM dbo.AllQuotes AQ 
		--	INNER JOIN dbo.RMA_Detail RMAD ON AQ.SOitem = RMAD.SO_item
		--	WHERE RMAD.RMA_Detail_ID = CAST(@cOrderNum AS INT)
		SELECT TOP 1 @dReturnDate=dbo.f_BestDate(RMA.notified,dbo.f_BestDate(RMA.aprv_date,GetDate()))
			FROM dbo.AllQuotes AQ 
			INNER JOIN dbo.RMA_Detail RMAD ON AQ.SOitem = RMAD.SO_item
			INNER JOIN dbo.RMA RMA ON RMAD.RMA_NO = RMA.RMA_No
			WHERE RMA.RMA_No = CAST(@cOrderNum AS INT)
		end
	ELSE
		begin	
		SET @dReturnDate=GetDate()
		end


	RETURN ISNULL(@dReturnDate,GetDate())
END

--GRANT EXECUTE ON [dbo].[f_OT_StartDate] TO [WINDFALL\HPA] AS [dbo];
--GRANT EXECUTE ON [dbo].[f_OT_StartDate] TO [HPA_Service] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Payment_Type_str]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Payment_Type_str]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Payment_Type_str]
(
@cType char(1)
)
RETURNS CHAR(20)
AS
BEGIN

--PRINT dbo.f_Payment_Type_str(''1'')

--PRINT dbo.f_Customer_Terms(''LYNCHBU'' )
--IF dbo.f_Customer_Terms(''LYNCHBU'' ) = ''STD TERMS''

DECLARE @cStdTermsStr char(10) = ''none''
DECLARE @nType INT = 0

SET @cStdTermsStr = CASE
	WHEN @cType = 1 THEN ''STD TERMS'' 
	WHEN @cType = 2 THEN ''COD'' 
	WHEN @cType = 3 THEN ''PREPAID'' 
	WHEN @cType = 4 THEN ''STD TERMS'' 
	WHEN @cType = 5 THEN ''COD'' 
	WHEN @cType = 6 THEN ''PREPAID'' 
	WHEN @cType = 7 THEN ''STD TERMS'' 
	WHEN @cType = 8 THEN ''COD'' 
	WHEN @cType = 9 THEN ''PREPAID'' 
	ELSE ''none'' END

/*
--SELECT DISTINCT PayType FROM dbo.Sales_No ORDER BY PayType
PayType:
NULL
          
CANADA PP 
CANADA STD
COD       
CREDIT CRD
FOREIGN PP
FOREIGNCOD
FOREIGNSTD
HOLD 4 PAY
LINKPOINT 
PAYPAL    
PREPAID   
STD TERMS 
WIRE TRANS
*/

RETURN (@cStdTermsStr)
END



--GRANT EXECUTE ON [dbo].[f_Payment_Type_str] TO [WINDFALL\HPA] AS [dbo];







' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_POCostForMonth]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_POCostForMonth]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2013 7 25
-- Description:	purchase order cost for a certain month of a certain year
-- =============================================
CREATE FUNCTION [dbo].[f_POCostForMonth]
(
	-- Add the parameters for the function here
	@month int
	,@year int
	,@daysDueIn int
)
RETURNS float
AS
BEGIN
	--SELECT dbo.f_POCostForMonth(MONTH(GetDate())-1, year(getdate())-0, 30)
	--SET @0Y1M = dbo.f_POCostForMonth(1, year(getdate())-0, 30)

	-- Declare the return variable here
	DECLARE @cost float

	SELECT @cost = SUM(dbo.f_CalcPOCost_POitem(Form,Pieces,Sz2,Sz3,Pounds,Services,Order_P,Order_QTY,POitem,SOitem))
			FROM      PurchaseOrder AS p
			WHERE YEAR(ISNULL(p.received,CONVERT(Datetime, ''1990-01-01 00:00:00.000'')) + @daysDueIn) = @year
				AND MONTH(ISNULL(p.received,CONVERT(Datetime, ''1990-01-01 00:00:00.000'')) + @daysDueIn) = @month
--				AND p.received + @daysDueIn <= DATEADD(YEAR, @year - YEAR(GETDATE()), GETDATE())
				AND ISNULL(p.cancelled,0) = 0 

	/*
	-- Add the T-SQL statements to compute the return value here
	SELECT @cost = (SELECT SUM(CASE ISNULL(p.p_lb,0)
			WHEN 0 
			THEN (CASE ISNULL(p_pc,0) 
					WHEN 0 
					THEN (CASE ISNULL(p_ft,0)
							WHEN 0 
							THEN (CASE ISNULL(lotp,0) 
									WHEN 0 
									THEN ISNULL(otherp,0) * order_qty
									ELSE ISNULL(lotp,0) * order_qty END)
							ELSE ISNULL(p_ft,0) * order_qty END)
					ELSE ISNULL(p_pc,0) * order_qty END)
			ELSE ISNULL(p.p_lb,0) * order_qty END) AS Cost
			FROM      PurchaseOrder AS p
			WHERE YEAR(ISNULL(p.received,CONVERT(Datetime, ''1990-01-01 00:00:00.000'')) + @daysDueIn) = @year 
				AND MONTH(ISNULL(p.received,CONVERT(Datetime, ''1990-01-01 00:00:00.000'')) + @daysDueIn) = @month
				AND ISNULL(p.cancelled,0) = 0 
				AND poitem != ''    31906-01'')
	*/

	-- Return the result of the function
	RETURN @cost

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_POCostToDateForMonth]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_POCostToDateForMonth]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2013 7 30
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_POCostToDateForMonth] 
(
	-- Add the parameters for the function here
	@month int
	,@year int
	,@daysDueIn int
)
RETURNS float
AS
BEGIN
	--SELECT dbo.f_POCostToDateForMonth(MONTH(GetDate())-1, year(getdate())-0, 30)

	-- Declare the return variable here
	DECLARE @cost float

	SELECT @cost = SUM(dbo.f_CalcPOCost_POitem(Form,Pieces,Sz2,Sz3,Pounds,Services,Order_P,Order_QTY,POitem,SOitem))
			FROM      PurchaseOrder AS p
			WHERE YEAR(ISNULL(p.received,CONVERT(Datetime, ''1990-01-01 00:00:00.000'')) + @daysDueIn) = @year
				AND MONTH(ISNULL(p.received,CONVERT(Datetime, ''1990-01-01 00:00:00.000'')) + @daysDueIn) = @month
				AND p.received + @daysDueIn <= DATEADD(YEAR, @year - YEAR(GETDATE()), GETDATE())
				AND ISNULL(p.cancelled,0) = 0 

	/*
	-- Add the T-SQL statements to compute the return value here
	SELECT @cost = (SELECT SUM(CASE ISNULL(p.p_lb,0)
			WHEN 0 
			THEN (CASE ISNULL(p_pc,0) 
					WHEN 0 
					THEN (CASE ISNULL(p_ft,0)
							WHEN 0 
							THEN (CASE ISNULL(lotp,0) 
									WHEN 0 
									THEN ISNULL(otherp,0) 
									ELSE ISNULL(lotp,0) + ISNULL(otherp,0) END)
							ELSE ISNULL(p_ft,0) * order_qty END)
					ELSE ISNULL(p_pc,0) * order_qty END)
			ELSE ISNULL(p.p_lb,0) * order_qty END) AS Cost
			FROM      PurchaseOrder AS p
			WHERE YEAR(ISNULL(p.received,CONVERT(Datetime, ''1990-01-01 00:00:00.000'')) + @daysDueIn) = @year
				AND MONTH(ISNULL(p.received,CONVERT(Datetime, ''1990-01-01 00:00:00.000'')) + @daysDueIn) = @month
				AND p.received + @daysDueIn <= DATEADD(YEAR, @year - YEAR(GETDATE()), GETDATE())
				AND ISNULL(p.cancelled,0) = 0 
				AND poitem != ''    31906-01'')

	-- Return the result of the function
	*/

	RETURN @cost

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_POCostToDateForYear]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_POCostToDateForYear]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2013 7 30
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_POCostToDateForYear] 
(
	-- Add the parameters for the function here
	@year int
	,@daysDueIn int
)
RETURNS float
AS
BEGIN
	--SELECT dbo.f_POCostToDateForYear( year(getdate())-0, 30)
	--SELECT dbo.f_POCostToDateForYear( 2015, 30)

	-- Declare the return variable here
	DECLARE @cost float

		SELECT @cost = SUM(dbo.f_CalcPOCost_POitem(Form,Pieces,Sz2,Sz3,Pounds,Services,Order_P,Order_QTY,POitem,SOitem))
			FROM PurchaseOrder AS p
			WHERE YEAR(ISNULL(p.received,CONVERT(Datetime, ''1990-01-01 00:00:00.000'')) + @daysDueIn) = @year
--				AND MONTH(ISNULL(p.received,CONVERT(Datetime, ''1990-01-01 00:00:00.000'')) + @daysDueIn) = @month
				AND p.received + @daysDueIn <= DATEADD(YEAR, @year - YEAR(GETDATE()), GETDATE())
				AND ISNULL(p.cancelled,0) = 0 

	/*
	-- Add the T-SQL statements to compute the return value here

	SELECT @cost = (SELECT SUM(CASE ISNULL(p.p_lb,0)
			WHEN 0 
			THEN (CASE ISNULL(p_pc,0) 
					WHEN 0 
					THEN (CASE ISNULL(p_ft,0)
							WHEN 0 
							THEN (CASE ISNULL(lotp,0) 
									WHEN 0 
									THEN ISNULL(otherp,0) * order_qty
									ELSE ISNULL(lotp,0) * order_qty END)
							ELSE ISNULL(p_ft,0) * order_qty END)
					ELSE ISNULL(p_pc,0) * order_qty END)
			ELSE ISNULL(p.p_lb,0) * order_qty END) AS Cost
			FROM      PurchaseOrder AS p
			WHERE YEAR(ISNULL(p.received,CONVERT(Datetime, ''1990-01-01 00:00:00.000'')) + @daysDueIn) = @year
				AND p.received + @daysDueIn <= DATEADD(YEAR, @year - YEAR(GETDATE()), GETDATE())
				AND ISNULL(p.cancelled,0) = 0 
				AND poitem != ''    31906-01'')
	*/

	-- Return the result of the function
	RETURN @cost

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_POnum_POitem]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_POnum_POitem]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

/****** Object:  User Defined Function dbo.ProperPO    Script Date: 10/17/2005 1:08:28 PM ******/

CREATE FUNCTION [dbo].[f_POnum_POitem]
(
@SOitem CHAR(12)
)

RETURNS INT
-- 9 digit PO 
-- 2 Digit item
-- Return 0 for NULL
-- PRINT dbo.[f_POnum_POitem](''  10000-1'')
AS
BEGIN
DECLARE @SalesNum INT
DECLARE @vcSalesNum VARCHAR(20)

DECLARE @nTest INT
DECLARE @nTestOrderI INT

SET @SalesNum = 0

SET @nTest = CHARINDEX ( ''-'',@SOitem) 
IF @nTest > 0	
	begin
	SET @vcSalesNum = LTRIM( RTRIM( LEFT( @SOitem, CHARINDEX ( ''-'',@SOitem) -1 )))
	SET @nTestOrderI = CAST( @vcSalesNum AS Int )

	IF @nTestOrderI < 1000000000	-- 9 digits are OK
		SET @SalesNum =  CAST( @vcSalesNum AS Int )
	ELSE
		SET @SalesNum = 0

	end
ELSE
	SET @SalesNum =  CAST( @vcSalesNum AS Int )

RETURN ISNULL(@SalesNum,0)
END






--GRANT EXECUTE ON [dbo].[f_POnum_POitem] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_POScheduledCostForMonth]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_POScheduledCostForMonth]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2013 80 13
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_POScheduledCostForMonth] 
(
	-- Add the parameters for the function here
	@month int
	,@year int
	,@daysDueIn int
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @cost float

	-- Add the T-SQL statements to compute the return value here
	SELECT @cost = (SELECT CASE
	ISNULL((SELECT SUM(CASE ISNULL(p.p_lb,0)
			WHEN 0 
			THEN (CASE ISNULL(p_pc,0) 
					WHEN 0 
					THEN (CASE ISNULL(p_ft,0)
							WHEN 0 
							THEN (CASE ISNULL(lotp,0) 
									WHEN 0 
									THEN ISNULL(otherp,0) * order_qty
									ELSE ISNULL(lotp,0) * order_qty END)
							ELSE ISNULL(p_ft,0) * order_qty END)
					ELSE ISNULL(p_pc,0) * order_qty END)
			ELSE ISNULL(p.p_lb,0) * order_qty END) AS Cost
			FROM      PurchaseOrder AS p
			WHERE YEAR(p.HPA_Due_Max + @daysDueIn) = @year 
				AND MONTH(p.HPA_Due_Max + @daysDueIn) = @month
				AND ISNULL(p.cancelled,0) = 0 
				AND ISNULL(p.received,CONVERT(Datetime, ''1990-01-01 00:00:00.000'')) <= CONVERT(Datetime, ''1990-01-01 00:00:00.000'')
				AND poitem != ''    31906-01''),0)
	WHEN 0
	THEN
	(SELECT SUM(CASE ISNULL(p.p_lb,0)
			WHEN 0 
			THEN (CASE ISNULL(p_pc,0) 
					WHEN 0 
					THEN (CASE ISNULL(p_ft,0)
							WHEN 0 
							THEN (CASE ISNULL(lotp,0) 
									WHEN 0 
									THEN ISNULL(otherp,0) * order_qty
									ELSE ISNULL(lotp,0) * order_qty END)
							ELSE ISNULL(p_ft,0) * order_qty END)
					ELSE ISNULL(p_pc,0) * order_qty END)
			ELSE ISNULL(p.p_lb,0) * order_qty END) AS Cost
			FROM      PurchaseOrder AS p
			WHERE YEAR(p.due_max + @daysDueIn) = @year 
				AND MONTH(p.due_max + @daysDueIn) = @month
				AND ISNULL(p.cancelled,0) = 0 
				AND ISNULL(p.received,CONVERT(Datetime, ''1990-01-01 00:00:00.000'')) <= CONVERT(Datetime, ''1990-01-01 00:00:00.000'')
				AND poitem != ''    31906-01'')
	ELSE
	(SELECT SUM(CASE ISNULL(p.p_lb,0)
			WHEN 0 
			THEN (CASE ISNULL(p_pc,0) 
					WHEN 0 
					THEN (CASE ISNULL(p_ft,0)
							WHEN 0 
							THEN (CASE ISNULL(lotp,0) 
									WHEN 0 
									THEN ISNULL(otherp,0) * order_qty
									ELSE ISNULL(lotp,0) * order_qty END)
							ELSE ISNULL(p_ft,0) * order_qty END)
					ELSE ISNULL(p_pc,0) * order_qty END)
			ELSE ISNULL(p.p_lb,0) * order_qty END) AS Cost
			FROM      PurchaseOrder AS p
			WHERE YEAR(p.HPA_Due_Max + @daysDueIn) = @year 
				AND MONTH(p.HPA_Due_Max + @daysDueIn) = @month
				AND ISNULL(p.cancelled,0) = 0 
				AND ISNULL(p.received,CONVERT(Datetime, ''1990-01-01 00:00:00.000'')) <= CONVERT(Datetime, ''1990-01-01 00:00:00.000'')
				AND poitem != ''    31906-01'')
	END  AS Cost)

	-- Return the result of the function
	RETURN @cost

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Pound_Bracket]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Pound_Bracket]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[f_Pound_Bracket]
(	
	@nWeight NUMERIC(11,2)
)
RETURNS TINYINT
AS
BEGIN

--Print dbo.f_Pound_Bracket(Weight)
--Print dbo.f_Bracket_Pounds(nBracket)

DECLARE @Bracket TINYINT = 0

IF @nWeight < 5
	SET @Bracket   = 0
ELSE
IF @nWeight >= 5 AND @nWeight < 10
	SET @Bracket   = 1
ELSE
IF @nWeight >= 10 AND @nWeight < 20
	SET @Bracket   = 2
ELSE
IF @nWeight >= 20 AND @nWeight < 50
	SET @Bracket   = 3
ELSE
IF @nWeight >= 50 AND @nWeight < 100
	SET @Bracket   = 4
ELSE
IF @nWeight >= 100 AND @nWeight < 200
	SET @Bracket   = 5
ELSE
IF @nWeight >= 200 AND @nWeight < 500
	SET @Bracket   = 6
ELSE
IF @nWeight >= 500 AND @nWeight < 1000
	SET @Bracket   = 7
ELSE
IF @nWeight >= 1000 AND @nWeight < 2000
	SET @Bracket   = 8
ELSE
IF @nWeight >= 2000 AND @nWeight < 5000
	SET @Bracket   = 9
ELSE
	SET @Bracket   = 0
	
--Bracket 0 is Bracket 10, the highest
	
RETURN @Bracket
END

--GRANT EXECUTE ON [dbo].[f_Pound_Bracket] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Price_Adjust]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Price_Adjust]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Price_Adjust]
(
@cCC char(1),
@cCL char(1),
@nStdSize DECIMAL(9,4)
)
RETURNS SmallMoney
AS
BEGIN
--SET @nAdjust = dbo.f_Price_Adjust( @cCC, @cCL, @nStdSize )

DECLARE @nAdjust SmallMoney

SET @nAdjust = 1

SELECT TOP 1 @nAdjust = ISNULL(Adjust,0)
	FROM [dbo].ConditionLevel
		WHERE cc=@cCC and CL=@cCL

RETURN (@nAdjust)
END









' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Price_AdjustCC]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Price_AdjustCC]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Price_AdjustCC]
(
@cCC char(1),
@cCL char(1),
@nStdSize DECIMAL(9,4)
)
RETURNS CHAR(1)
AS
BEGIN
--RETURNS a Common Adjusted Code that the Price Table would have.
--SET @nAdjust = dbo.f_Price_AdjustCC( @cCC, @cCL, @nStdSize )


--If the CL is not found, return the CC that was input!
DECLARE @cAdjustCC char(1) = ''''
SET @cAdjustCC = @cCC

--SELECT Adjust_Code,CC,CL,isPriceTable FROM dbo.ConditionLevel

SELECT TOP 1 @cAdjustCC = Adjust_Code
	FROM [dbo].ConditionLevel
		WHERE CC=@cCC and CL=@cCL
		AND isPriceTable = 0

RETURN (@cAdjustCC)
END









' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Price_Alloy]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Price_Alloy]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Price_Alloy]
(
@cAlloy char(12)
)
RETURNS CHAR(12)
AS
BEGIN
--SET @cAlloy = dbo.f_Price_Alloy( @cAlloy )
--PRINT dbo.f_Price_Alloy(''Ni 200'')
--PRINT dbo.f_Price_Alloy(''Ni 201'')
--PRINT dbo.f_Price_Alloy(''Ni 200 / 201'')
--PRINT dbo.AlloyName(''Ni 200 / 201'') --gets standard name
--SELECT * FROM dbo.Alloy WHERE Alloy = ''Ni 200 / 201''
--SELECT * FROM dbo.Alloy WHERE ''Ni 200 / 201'' = Alloy  
--SELECT * FROM dbo.Alloy WHERE Alloy = ''Ni 200 ''

DECLARE @cPriceAlloy char(12) = @cAlloy

SELECT @cPriceAlloy = PriceName
	FROM [dbo].Alloy
		WHERE Alloy = @cAlloy

RETURN ISNULL(@cPriceAlloy,@cAlloy)
END


--GRANT EXECUTE ON [dbo].[f_Price_Alloy] TO [WINDFALL\HPA] AS [dbo];







' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Price_Table_Use]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Price_Table_Use]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
Create FUNCTION [dbo].[f_Price_Table_Use]
(
@cCC char(1),
@cCL char(1),
@nStdSize DECIMAL(9,4)
)
RETURNS CHAR(1)
AS
BEGIN
--SET @cAdjust = dbo.f_Price_Table_Use( @cCC, @cCL, @nStdSize )


DECLARE @cusePriceTable char(1)
SET @cusePriceTable = ''T''

SELECT @cusePriceTable = ''F''
	FROM [dbo].ConditionLevel
		WHERE CC=@cCC and CL=@cCL
		AND isPriceTable = 0

RETURN (@cusePriceTable)
END









' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Price_Use_Adjust]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Price_Use_Adjust]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Price_Use_Adjust]
(
@cCC char(1),
@cCL char(1),
@nStdSize DECIMAL(9,4)
)
RETURNS CHAR(1)
AS
BEGIN
--SET @cAdjust = dbo.f_Price_Use_Adjust( @cCC, @cCL, @nStdSize )


DECLARE @cisPriceTable char(1)
SET @cisPriceTable = ''T''

SELECT @cisPriceTable = ''F''
	FROM [dbo].ConditionLevel
		WHERE CC=@cCC and CL=@cCL
		AND isPriceTable = 0

RETURN (@cisPriceTable)
END









' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_PriceTable_CommSpec]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_PriceTable_CommSpec]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[f_PriceTable_CommSpec] 
(
@cAlloy char(12),
@cForm CHAR(2),
@cCC CHAR(1),
@nThickness DECIMAL(9,4)
)
RETURNS CHAR(20)
AS
BEGIN
--PRINT dbo.[PriceTable_CommSpec](''C-276'',''10'',''1'',.99)
--SELECT CommSpec from dbo.PriceTable WHERE Alloy = ''6B''
--UPDATE dbo.PriceTable SET CommSpec = ''AMS 5894'' WHERE Alloy = ''6B'' AND CommSpec = ''AMS 5894, PWA 1196A ''

DECLARE @cCommSpec CHAR(20)
SET @cCommSpec = ''''
DECLARE @nCount INT

SELECT @nCount = COUNT(*) FROM [dbo].[PriceTable] WITH(NOLOCK) 
	WHERE [Alloy] = @cAlloy AND [Form] = @cForm AND [CC] = @cCC AND [Size] = @nThickness

IF @nCount > 0
	SELECT TOP 1 @cCommSpec = [CommSpec] 
		FROM [dbo].[PriceTable] WITH(NOLOCK) 
		WHERE [Alloy] = @cAlloy
		AND [Form] = @cForm
		AND [Size] = @nThickness
ELSE
begin
	-- 0 for Alloy,Form and Size

	SELECT @nCount = COUNT(*) FROM [dbo].[PriceTable] WITH(NOLOCK) 
		WHERE [Alloy] = @cAlloy AND [Form] = @cForm 

	IF @nCount > 0  --Found Alloy Form, finetune Thickness
			SELECT TOP 1 @cCommSpec = [CommSpec] 
			FROM [dbo].[PriceTable] WITH(NOLOCK) 
			WHERE [Alloy] = @cAlloy
			AND [Form] = @cForm
			AND [CommSpec] IS NOT NULL
end

SET @cCommSpec = ISNULL(@cCommSpec,'' '')

RETURN (@cCommSpec)
END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_PriceTableStandard]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_PriceTableStandard]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[f_PriceTableStandard] 
(
@cAlloy char(12),
@cForm CHAR(2),
@cCC CHAR(1),
@nThickness DECIMAL(9,4)
)
RETURNS DECIMAL(9,4)
AS
BEGIN
--PRINT dbo.f_PriceTableStandard(''C-276'',''10'',''1'',.99)
--Used by [p_GetFullQuote]

DECLARE @nStandardSize DECIMAL(9,4)
SET @nStandardSize = @nThickness
DECLARE @nCloseSize DECIMAL(9,4)
DECLARE @nCurrentSize DECIMAL(9,4)
DECLARE @nCount AS INT

SELECT @nCount = COUNT(*) FROM [dbo].[PriceTable] WITH(NOLOCK)
	WHERE [Alloy] = @cAlloy AND [Form] = @cForm AND [CC] = @cCC AND [Size] = @nThickness

IF @nCount > 0
	SELECT TOP 1 @nStandardSize = [Size] 
		FROM [dbo].[PriceTable] 
		WHERE [Alloy] = @cAlloy
		AND [Form] = @cForm
		AND [CC] = @cCC
		AND [Size] = @nThickness
ELSE
	begin

	-- Did not find Size, loop to get best size.

	SELECT @nCount = COUNT(*) FROM [dbo].[PriceTable] WITH(NOLOCK)
		WHERE [Alloy] = @cAlloy AND [Form] = @cForm AND [CC] = @cCC

	IF @nCount > 0  --Found Alloy Form, CC, now finetune Thickness
		begin
		DECLARE #tmpThickness CURSOR READ_ONLY FOR 
		SELECT [Size] FROM [dbo].[PriceTable] WITH(NOLOCK)
		WHERE [Alloy] = @cAlloy AND [Form] = @cForm AND [CC] = @cCC
		ORDER BY [SIZE]
	
		OPEN #tmpThickness

		FETCH NEXT FROM #tmpThickness INTO @nCurrentSize
		WHILE (@@fetch_status <> -1)
		BEGIN
			IF (@@fetch_status <> -2)
			BEGIN
				IF @nCurrentSize < @nThickness
					begin
					  SET @nCloseSize = @nCurrentSize
					  SET @nStandardSize = @nCurrentSize
					end
				ELSE  --Finally over Thickness
					IF @nCurrentSize-@nThickness <= @nThickness-@nCloseSize --See if Close is better than Current
						begin
						  SET @nStandardSize = @nCurrentSize
						  SET @nCloseSize = @nCurrentSize
						end
					ELSE
						SET @nStandardSize = @nCloseSize
			END
			FETCH NEXT FROM #tmpThickness INTO @nCurrentSize
		END
	
		CLOSE #tmpThickness
		DEALLOCATE #tmpThickness

		end
	end

-----------------
IF @nCount = 0
	begin

	-- Check for a standard size with Alloy and Form

	SELECT @nCount = COUNT(*) FROM [dbo].[PriceTable] WITH(NOLOCK)
		WHERE [Alloy] = @cAlloy AND [Form] = @cForm AND [Size] = @nThickness

	IF @nCount > 0  --Found Alloy Form, now finetune Thickness
		begin
		DECLARE #tmpThickness CURSOR READ_ONLY FOR 
		SELECT [Size] FROM [dbo].[PriceTable] WITH(NOLOCK)
		WHERE [Alloy] = @cAlloy AND [Form] = @cForm 
		ORDER BY [SIZE]
	
		OPEN #tmpThickness

		FETCH NEXT FROM #tmpThickness INTO @nCurrentSize
		WHILE (@@fetch_status <> -1)
		BEGIN
			IF (@@fetch_status <> -2)
			BEGIN
				IF @nCurrentSize < @nThickness
					begin
					  SET @nCloseSize = @nCurrentSize
					  SET @nStandardSize = @nCurrentSize
					end
				ELSE  --Finally over Thickness
					IF @nCurrentSize-@nThickness <= @nThickness-@nCloseSize --See if Close is better than Current
						begin
						  SET @nStandardSize = @nCurrentSize
						  SET @nCloseSize = @nCurrentSize
						end
					ELSE
						SET @nStandardSize = @nCloseSize
			END
			FETCH NEXT FROM #tmpThickness INTO @nCurrentSize
		END
	
		CLOSE #tmpThickness
		DEALLOCATE #tmpThickness

		end
	end

-----------------
IF @nCount = 0
	begin

	-- Check for a standard size with form

	SELECT @nCount = COUNT(*) FROM [dbo].[PriceTable] WITH(NOLOCK)
		WHERE [Form] = @cForm 

	IF @nCount > 0  --Found Form, now finetune Thickness
		begin
		DECLARE #tmpThickness CURSOR READ_ONLY FOR 
		SELECT [Size] FROM [dbo].[PriceTable] WITH(NOLOCK)
		WHERE  [Form] = @cForm 
		ORDER BY [SIZE]
	
		OPEN #tmpThickness

		FETCH NEXT FROM #tmpThickness INTO @nCurrentSize
		WHILE (@@fetch_status <> -1)
		BEGIN
			IF (@@fetch_status <> -2)
			BEGIN
				IF @nCurrentSize < @nThickness
					begin
					  SET @nCloseSize = @nCurrentSize
					  SET @nStandardSize = @nCurrentSize
					end
				ELSE  --Finally over Thickness
					IF @nCurrentSize-@nThickness <= @nThickness-@nCloseSize --See if Close is better than Current
						begin
						  SET @nStandardSize = @nCurrentSize
						  SET @nCloseSize = @nCurrentSize
						end
					ELSE
						SET @nStandardSize = @nCloseSize
			END
			FETCH NEXT FROM #tmpThickness INTO @nCurrentSize
		END
	
		CLOSE #tmpThickness
		DEALLOCATE #tmpThickness

		end
	end

----------


RETURN (@nStandardSize)
END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_PriceTableStandardCL]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_PriceTableStandardCL]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[f_PriceTableStandardCL] 
(
@cAlloy char(12),
@cForm CHAR(2),
@cCC CHAR(1),
@cCL CHAR(1),
@nThickness DECIMAL(9,4)
)
RETURNS DECIMAL(9,4)
AS
BEGIN
--PRINT dbo.f_PriceTableStandardCL(''C-276'',''10'',''1'','''',.99)
--SELECT dbo.f_PriceTableStandardCL( ''HPA N60'',''40'',''1'','''',    0.125 ) AS StndSize
--SELECT dbo.f_PriceTableStandardCL( ''HPA N60'',''10'',''1'','''',    3.625 ) AS StndSize
--Used by [p_GetFullQuoteCL]

DECLARE @nStandardSize DECIMAL(9,4)
SET @nStandardSize = @nThickness
DECLARE @nCloseSize DECIMAL(9,4)
DECLARE @nCurrentSize DECIMAL(9,4)
DECLARE @nCount AS INT

/*
SELECT @nCount = COUNT(*) FROM [dbo].[PriceTable] 
	WHERE [Alloy] = @cAlloy 
	AND [Form] = @cForm 
	AND [CC] = @cCC 
	AND [CL] = @cCL
	AND [Size] = @nThickness

IF @nCount > 0
	SELECT TOP 1 @nStandardSize = [Size] 
		FROM [dbo].[PriceTable] 
		WHERE [Alloy] = @cAlloy
		AND [Form] = @cForm
		AND [CC] = @cCC
		AND [CL] = @cCL
		AND [Size] = @nThickness
*/
---------------------------------------------------------

DECLARE @cAdjustCC CHAR(1) = ''''
SET @cAdjustCC = dbo.f_Price_AdjustCC( @cCC, @cCL, @nThickness )
--RETURNS a Common Adjusted Code that the Price Table would have.
--SELECT Adjust_Code FROM dbo.ConditionLevel where isPriceTable = 0

--IF @nCount = 0 AND LEN(@cAdjustCC)>0
	
SELECT @nCount = COUNT(*) FROM [dbo].[PriceTable] WITH(NOLOCK)
	WHERE [Alloy] = @cAlloy 
	AND [Form] = @cForm 
	AND [CC] = @cAdjustCC 
	AND [CL] = @cCL
	AND [Size] = @nThickness

IF @nCount > 0
	SELECT TOP 1 @nStandardSize = [Size] 
		FROM [dbo].[PriceTable] WITH(NOLOCK)
		WHERE [Alloy] = @cAlloy
		AND [Form] = @cForm
		AND [CC] = @cAdjustCC
		AND [CL] = @cCL
		AND [Size] = @nThickness
		


---------------------------------------------------------
-- Did not find Size, loop to get best size.


IF NOT @nStandardSize > 0
	begin

	SELECT @nCount = COUNT(*) FROM [dbo].[PriceTable] WITH(NOLOCK)
		WHERE [Alloy] = @cAlloy AND [Form] = @cForm AND [CC] = @cAdjustCC AND [CL] = @cCL

	IF @nCount > 0  --Found Alloy Form, CC, now finetune Thickness
		begin
		DECLARE #tmpThickness1 CURSOR READ_ONLY FOR 
		SELECT [Size] FROM [dbo].[PriceTable] WITH(NOLOCK)
		WHERE [Alloy] = @cAlloy AND [Form] = @cForm AND [CC] =  @cAdjustCC AND [CL] = @cCL
		ORDER BY [SIZE]
	
		OPEN #tmpThickness1

		FETCH NEXT FROM #tmpThickness1 INTO @nCurrentSize
		WHILE (@@fetch_status <> -1)
			BEGIN
			IF (@@fetch_status <> -2)
				BEGIN

				IF @nCurrentSize < @nThickness
					begin
					  SET @nCloseSize = @nCurrentSize
					  SET @nStandardSize = @nCurrentSize
					end
				ELSE  --Finally over Thickness
					IF @nCurrentSize-@nThickness <= @nThickness-@nCloseSize --See if Close is better than Current
						begin
						  SET @nStandardSize = @nCurrentSize
						  SET @nCloseSize = @nCurrentSize
						end
					ELSE
						SET @nStandardSize = @nCloseSize
				END
			END
			FETCH NEXT FROM #tmpThickness1 INTO @nCurrentSize
	
		CLOSE #tmpThickness1
		DEALLOCATE #tmpThickness1

		end
	end

-----------------
IF @nCount = 0
	begin

	-- Check for a standard size with Alloy and Form

	SELECT @nCount = COUNT(*) FROM [dbo].[PriceTable] WITH(NOLOCK)
		WHERE [Alloy] = @cAlloy AND [Form] = @cForm AND [Size] = @nThickness

	IF @nCount > 0  --Found Alloy Form, now finetune Thickness
		begin
		DECLARE #tmpThickness2 CURSOR READ_ONLY FOR 
		SELECT [Size] FROM [dbo].[PriceTable] WITH(NOLOCK)
		WHERE [Alloy] = @cAlloy 
		AND [Form] = @cForm 
		ORDER BY [SIZE]
	
		OPEN #tmpThickness2

		FETCH NEXT FROM #tmpThickness2 INTO @nCurrentSize
		WHILE (@@fetch_status <> -1)
		BEGIN
			IF (@@fetch_status <> -2)
			BEGIN
				IF @nCurrentSize < @nThickness
					begin
					  SET @nCloseSize = @nCurrentSize
					  SET @nStandardSize = @nCurrentSize
					end
				ELSE  --Finally over Thickness
					IF @nCurrentSize-@nThickness <= @nThickness-@nCloseSize --See if Close is better than Current
						begin
						  SET @nStandardSize = @nCurrentSize
						  SET @nCloseSize = @nCurrentSize
						end
					ELSE
						SET @nStandardSize = @nCloseSize
			END
			FETCH NEXT FROM #tmpThickness2 INTO @nCurrentSize
		END
	
		CLOSE #tmpThickness2
		DEALLOCATE #tmpThickness2

		end
	end

-----------------
IF @nCount = 0
	begin

	-- Check for a standard size with form

	SELECT @nCount = COUNT(*) FROM [dbo].[PriceTable] WITH(NOLOCK)
		WHERE [Form] = @cForm 

	IF @nCount > 0  --Found Form, now finetune Thickness
		begin
		DECLARE #tmpThickness3 CURSOR READ_ONLY FOR 
		SELECT [Size] FROM [dbo].[PriceTable] WITH(NOLOCK)
		WHERE  [Form] = @cForm 
		ORDER BY [SIZE]
	
		OPEN #tmpThickness3

		FETCH NEXT FROM #tmpThickness3 INTO @nCurrentSize
		WHILE (@@fetch_status <> -1)
		BEGIN
			IF (@@fetch_status <> -2)
			BEGIN
				IF @nCurrentSize < @nThickness
					begin
					  SET @nCloseSize = @nCurrentSize
					  SET @nStandardSize = @nCurrentSize
					end
				ELSE  --Finally over Thickness
					IF @nCurrentSize-@nThickness <= @nThickness-@nCloseSize --See if Close is better than Current
						begin
						  SET @nStandardSize = @nCurrentSize
						  SET @nCloseSize = @nCurrentSize
						end
					ELSE
						SET @nStandardSize = @nCloseSize
			END
			FETCH NEXT FROM #tmpThickness3 INTO @nCurrentSize
		END
	
		CLOSE #tmpThickness3
		DEALLOCATE #tmpThickness3

		end
	end

----------


RETURN (@nStandardSize)
END



--GRANT EXECUTE ON [dbo].[f_PriceTableStandardCL] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Proper_OrderItem]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Proper_OrderItem]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE  FUNCTION [dbo].[f_Proper_OrderItem]
(
@cOrderType CHAR(2),
@vcOrderItem VARCHAR(20)
)
RETURNS CHAR(13)

--EXEC ERP_2.dbo.f_Proper_OrderItem ''SI'',''104476-01''
--SELECT ERP_2.dbo.f_Proper_OrderItem(''SI'',''104476-01'')
--SELECT ERP_2.dbo.f_Proper_OrderItem(''SI'',''112263'')

AS
BEGIN

DECLARE @cProper_OrderItem CHAR(13) = ''''
DECLARE @lIsInterger BIT = 0

IF @cOrderType IS NULL
	SET @cProper_OrderItem = ''''
ELSE
	IF @cOrderType =''SI''
		SET @cProper_OrderItem = dbo.f_ProperSOitem(@vcOrderItem)
	ELSE
	IF @cOrderType =''SO''
		SET @lIsInterger = 1
	ELSE
	IF @cOrderType =''PI''
		SET @cProper_OrderItem = dbo.f_ProperPOitem(@vcOrderItem)
	ELSE
	IF @cOrderType =''PO''
		SET @lIsInterger = 1
	ELSE
	IF @cOrderType =''WO''
		SET @lIsInterger = 1
	ELSE
	IF @cOrderType =''WD''
		SET @lIsInterger = 1
	ELSE
		SET @cProper_OrderItem = ''''
		

IF @lIsInterger = 1
	begin
	--Drop anything with a dash
	SET @vcOrderItem =  RTRIM(LTRIM(@vcOrderItem))
	IF @vcOrderItem LIKE ''%-%''
		SET @vcOrderItem = LEFT(@vcOrderItem, CHARINDEX(''-'',@vcOrderItem) -1 )


	SET @cProper_OrderItem = @vcOrderItem

	end
ELSE
	begin
	--Add item if not passed
	SET @vcOrderItem =  RTRIM(LTRIM(@vcOrderItem))
	IF NOT @vcOrderItem LIKE ''%-%''
		SET @vcOrderItem = @vcOrderItem + ''-01''


	IF @cOrderType =''SI''
		SET @cProper_OrderItem = dbo.f_ProperSOitem(@vcOrderItem)
	ELSE
	IF @cOrderType =''PI''
		SET @cProper_OrderItem = dbo.f_ProperPOitem(@vcOrderItem)
	

	end


RETURN (@cProper_OrderItem) --Do not trim this!
END




--GRANT EXECUTE ON [dbo].[f_Proper_OrderItem] TO [WINDFALL\HPA] AS [dbo];
--GRANT EXECUTE ON [dbo].[f_Proper_OrderItem] TO [WINDFALL\ReportReader] AS [dbo];
--GRANT EXECUTE ON [dbo].[f_Proper_OrderItem] TO [HPA_Service] AS [dbo];
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_ProperInqNumP]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_ProperInqNumP]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE  FUNCTION [dbo].[f_ProperInqNumP]
(
@vcInqNumP VARCHAR(20)
)
RETURNS CHAR(9)

AS
BEGIN

--SELECT dbo.f_ProperInqNumP(''12345678X'')
--SELECT dbo.f_ProperInqNumP(''42729M'')

IF @vcInqNumP IS NULL
	RETURN ''0''

DECLARE @nCount INT=0
DECLARE @nInqNum Numeric (8,0)
DECLARE @cInqNum CHAR(8)
DECLARE @cSalesP CHAR(1)
DECLARE @cReturn CHAR(9)

SET @cSalesP = RIGHT(@vcInqNumP,1)
--PRINT @cSalesP

--IF @cSalesP LIKE ''a-z''

SET @cInqNum = LEFT( @vcInqNumP, LEN(@vcInqNumP)-1 ) 
--PRINT @cInqNum

SET @nCount = 8-LEN(@cInqNum)
--PRINT @nCount

SET @cInqNum = REPLICATE('' '',@nCount)+@cInqNum
--PRINT @cInqNum

--SET @cInqNum = CAST(@cInqNum AS NUMERIC(8,0))

SET @cReturn = @cInqNum + @cSalesP

RETURN @cReturn

END


--GRANT EXECUTE ON [dbo].[f_ProperInqNumP] TO [WINDFALL\HPA] AS [dbo];




' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_ProperLot]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_ProperLot]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[f_ProperLot]
(
@vcLot VARCHAR(20)
)
RETURNS CHAR(10)
--Strips Lot to basics
AS
BEGIN

--SELECT distinct dbo.f_ProperLot(Lot) FROM dbo.Receiving order by LOT

IF @vcLot IS NULL
	RETURN ''''

DECLARE @cCleanLot CHAR(10) = ''''

IF LEFT(@vcLot,4) = ''HPA ''
	SET @cCleanLot = SUBSTRING( @vcLot,5,15)
ELSE
IF LEFT(@vcLot,3) = ''HPA''
	SET @cCleanLot = SUBSTRING( @vcLot,5,15)
ELSE
	SET @cCleanLot = @vcLot

DECLARE @cInit CHAR(1) = LEFT(@cCleanLot,1)

--check for extra blank
IF @cInit='' ''
	begin
	SET @cInit = SUBSTRING( @cCleanLot,2,1)
	SET @cCleanLot = SUBSTRING( @cCleanLot,2,10)
	end


IF NOT (@cInit=''G'' 
	Or @cInit=''H'' 
	Or @cInit=''L'' 
	Or @cInit=''R'' 
	Or @cInit=''D'' 
	Or @cInit=''W'' 
	Or @cInit=''S'')
	SET @cCleanLot = ''''



RETURN @cCleanLot

END


--GRANT EXECUTE ON [dbo].[f_ProperLot] TO [WINDFALL\HPA] AS [dbo];




' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_ProperPO]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_ProperPO]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE  FUNCTION [dbo].[f_ProperPO]
(
@vcOrderItem VARCHAR(20)
)
RETURNS INT
--Strips Item off PO
AS
BEGIN

--SELECT dbo.f_ProperPO(POitem) FROM dbo.PurchaseOrder 

IF @vcOrderItem IS NULL
	RETURN 0

DECLARE @nReturn INT

SET @vcOrderItem =  RTRIM(LTRIM(@vcOrderItem))
IF @vcOrderItem LIKE ''%-%''
	SET @vcOrderItem = LEFT(@vcOrderItem, CHARINDEX(''-'',@vcOrderItem) -1 )

RETURN CAST(@vcOrderItem AS INT)

END


--GRANT EXECUTE ON [dbo].[f_ProperPO] TO [WINDFALL\HPA] AS [dbo];




' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_ProperPO+item]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_ProperPO+item]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE  FUNCTION [dbo].[f_ProperPO+item]
(
@HPAPO	INT,
@PO_Item TinyInt

)
RETURNS CHAR(12)

AS
BEGIN
--PRINT dbo.[f_ProperPO+item]([HPA PO],[Item])
--PRINT dbo.[f_ProperPO+item](511234,1)


DECLARE @cReturnOderItem CHAR(12)
SET @cReturnOderItem = dbo.f_ProperPOitem( CONCAT(RTRIM(CAST(@HPAPO as CHAR(10))),''-'',RTRIM(CAST(@PO_Item as VarCHAR(2)))))
--SET @cReturnOderItem = RTRIM(CAST(@HPAPO as CHAR(10)))+''-''
--SET @cReturnOderItem = RTRIM(CAST(@PO_Item as VarCHAR(2)))
--SET @cReturnOderItem = @cReturnOderItem + RTRIM(CAST(@PO_Item as VarCHAR(2)))
--SET @cReturnOderItem = dbo.f_ProperPOitem( @cReturnOderItem )

RETURN (@cReturnOderItem)
END




--GRANT EXECUTE ON [dbo].[f_ProperPO+item] TO [WINDFALL\HPA] AS [dbo];
--GRANT EXECUTE ON [dbo].[f_ProperPO+item] TO [WINDFALL\ReportReader] AS [dbo];
--GRANT EXECUTE ON [dbo].[f_ProperPO+item] TO [HPA_Service] AS [dbo];

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_ProperPOitem]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_ProperPOitem]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE  FUNCTION [dbo].[f_ProperPOitem]
(
@vcOrderItem VARCHAR(20)
)
RETURNS CHAR(12)
-- 9 digit PO ****** Changed back to 9 on Oct 1 2014- Not sure when was set to 10!?!
-- 2 Digit item
-- 1 digit for dash -

-- SEE dbo.OT_Def for Definitions

-- Return ''         0-00'' for NULL
-- PRINT dbo.ProperPO(''   10000-1'')
-- PRINT dbo.ProperPO(''          1-01'')
AS
BEGIN


DECLARE @cReturnOderItem CHAR(12)
IF LEN(@vcOrderItem)> 3 AND @vcOrderItem IS NOT NULL
	begin
	IF LTRIM(@vcOrderItem) LIKE ''-1-%''
		SET @vcOrderItem = RIGHT(@vcOrderItem, LEN(@vcOrderItem)-1 )
		
	IF LTRIM(@vcOrderItem) = ''-1-01''
		SET @vcOrderItem = ''          0-00''

	IF LTRIM(@vcOrderItem) = ''1-01''
		SET @vcOrderItem = ''         0-00''
		
	IF LTRIM(@vcOrderItem) = ''1-00''
		SET @vcOrderItem = ''         0-00''

	end
	
IF LEN(@vcOrderItem)> 3 AND @vcOrderItem IS NOT NULL
    begin
	SET @vcOrderItem = RTRIM(@vcOrderItem)
	DECLARE @nOrder NUMERIC(10,0)
	DECLARE @vcOrder VARCHAR(20)
	DECLARE @nItem NUMERIC(2,0)
	DECLARE @nTest INT
	DECLARE @vcTestOrder VARCHAR(20)
	DECLARE @nTestOrderI INT
	DECLARE @nTestItem NUMERIC(2,0)
	DECLARE @vcTestItem VARCHAR(20)

	SET @nTest = CHARINDEX ( ''-'',@vcOrderItem) 
	IF @nTest > 0	
	    begin
		SET @vcTestOrder = LTRIM( RTRIM( LEFT( @vcOrderItem, CHARINDEX ( ''-'',@vcOrderItem) -1 )))
		SET @nTestOrderI = CAST( @vcTestOrder AS Int )
		IF @nTestOrderI < 10000000000	-- 10 digits are OK
		    Begin
			SET @vcOrder = LTRIM( RTRIM( LEFT( @vcOrderItem, CHARINDEX ( ''-'',@vcOrderItem) -1 ) ))
			SET @nOrder = CAST(@vcOrder AS NUMERIC(10,0) )
		    End
		ELSE
			SET @nOrder = 0

		SET @vcTestItem = LTRIM( RTRIM( RIGHT( @vcOrderItem, LEN(@vcOrderItem) - CHARINDEX ( ''-'',@vcOrderItem) )))
		SET @nTestItem = 0

		IF ISNUMERIC(@vcTestItem) = 1
			SET @nTestItem = CAST( @vcTestItem AS NUMERIC(2,0) )
		ELSE
			SET @nTestItem = 0			

		IF @nTestItem < 100	--2 digits are OK
			SET @nItem = @nTestItem
		ELSE
			SET @nItem = 0
	
		IF @nItem > 9	--Place an 0 before item
			SET @cReturnOderItem = STR( @nOrder,9 )+''-''+STR(@nItem,2)
		ELSE
			SET @cReturnOderItem = STR( @nOrder,9 )+''-0''+STR(@nItem,1) 
		
		--Place empty string at begining
		IF LEN(@cReturnOderItem) < 12
			SET @cReturnOderItem = '' ''+@cReturnOderItem

		IF LEN(@cReturnOderItem) < 12
			SET @cReturnOderItem = '' ''+@cReturnOderItem

		IF LEN(@cReturnOderItem) < 12
			SET @cReturnOderItem = '' ''+@cReturnOderItem

	    end
	ELSE	--No DASH
		SET @cReturnOderItem = ''999999999-99''

    end
ELSE
	IF @vcOrderItem IS NULL	
		SET @cReturnOderItem = @vcOrderItem	--Return the Null
	ELSE
		SET @cReturnOderItem = ''        0-00''	--Less than 3 digits

RETURN (@cReturnOderItem)
END




--GRANT EXECUTE ON [dbo].[f_ProperPOitem] TO [WINDFALL\HPA] AS [dbo];
--GRANT EXECUTE ON [dbo].[f_ProperPOitem] TO [WINDFALL\ReportReader] AS [dbo];
--GRANT EXECUTE ON [dbo].[f_ProperPOitem] TO [HPA_Service] AS [dbo];

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_ProperSO]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_ProperSO]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[f_ProperSO]
(
@vcOrderItem VARCHAR(20)
)
RETURNS INT
-- Returns just SO from SOitem

AS
BEGIN

--SELECT dbo.f_ProperSO(SOitem) AS [SalesNum] FROM dbo.Sales

IF @vcOrderItem IS NULL
	RETURN 0

DECLARE @nReturn INT

SET @vcOrderItem =  RTRIM(LTRIM(@vcOrderItem))
IF @vcOrderItem LIKE ''%-%''
	SET @vcOrderItem = LEFT(@vcOrderItem, CHARINDEX(''-'',@vcOrderItem) -1 )
ELSE
IF @vcOrderItem LIKE ''STOCK''
	SET @vcOrderItem = 0

RETURN CAST(@vcOrderItem AS INT)

END


--GRANT EXECUTE ON [dbo].[f_ProperSO] TO [WINDFALL\HPA] AS [dbo];




' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_ProperSOitem]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_ProperSOitem]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

/****** Object:  User Defined Function dbo.ProperPO    Script Date: 10/17/2005 1:08:28 PM ******/

CREATE FUNCTION [dbo].[f_ProperSOitem]
(
@vcOrderItem VARCHAR(20)
)
RETURNS CHAR(10)
-- 7 digit SO 
-- 2 Digit item
-- Return ''       0-00'' for NULL

-- SEE NR_.dbo.OT_Def for Definitions

-- PRINT dbo.[ProperSO](''  10000-1'')
AS
BEGIN

IF LEN(@vcOrderItem)> 3 AND @vcOrderItem IS NOT NULL
	begin
	IF LTRIM(@vcOrderItem) LIKE ''-1-%''
		SET @vcOrderItem = RIGHT(@vcOrderItem, LEN(@vcOrderItem)-1 )
	IF LTRIM(@vcOrderItem) = ''-1-01''
		SET @vcOrderItem = ''       0-00''
	IF LTRIM(@vcOrderItem) = ''1-01''
		SET @vcOrderItem = ''      0-00''
	IF LTRIM(@vcOrderItem) = ''1-00''
		SET @vcOrderItem = ''      0-00''
	end

	
DECLARE @cReturnOderItem CHAR(10)
IF LEN(@vcOrderItem)> 3 AND @vcOrderItem IS NOT NULL
    begin
	SET @vcOrderItem = RTRIM(@vcOrderItem)
	DECLARE @nOrder NUMERIC(7,0)
	DECLARE @vcOrder VARCHAR(20)
	DECLARE @nItem NUMERIC(2,0)
	DECLARE @nTest INT
	DECLARE @vcTestOrder VARCHAR(20)
	DECLARE @nTestOrderI INT
	DECLARE @nTestItem NUMERIC(2,0)
	DECLARE @vcTestItem VARCHAR(20)

	SET @nTest = CHARINDEX ( ''-'',@vcOrderItem) 
	IF @nTest > 0	
	    begin
		SET @vcTestOrder = LTRIM( RTRIM( LEFT( @vcOrderItem, CHARINDEX ( ''-'',@vcOrderItem) -1 )))
		SET @nTestOrderI = CAST( @vcTestOrder AS Int )
		IF @nTestOrderI < 10000000	-- 7 digits are OK
		    Begin
			SET @vcOrder = LTRIM( RTRIM( LEFT( @vcOrderItem, CHARINDEX ( ''-'',@vcOrderItem) -1 ) ))
			SET @nOrder = CAST(@vcOrder AS NUMERIC(7,0) )
		    End
		ELSE
			SET @nOrder = 0

		SET @vcTestItem = LTRIM( RTRIM( RIGHT( @vcOrderItem, LEN(@vcOrderItem) - CHARINDEX ( ''-'',@vcOrderItem) )))
		SET @nTestItem = 0

		IF ISNUMERIC(@vcTestItem) = 1
			SET @nTestItem = CAST( @vcTestItem AS NUMERIC(2,0) )
		ELSE
			SET @nTestItem = 0			

		IF @nTestItem < 100	--2 digits are OK
			SET @nItem = @nTestItem
		ELSE
			SET @nItem = 0
	
		IF @nItem > 9	--Place an 0 before item
			SET @cReturnOderItem = STR( @nOrder,7 )+''-''+STR(@nItem,2)
		ELSE
			SET @cReturnOderItem = STR( @nOrder,7 )+''-0''+STR(@nItem,1) 

		--Place empty string at begining
		IF LEN(@cReturnOderItem) < 10
			SET @cReturnOderItem = '' ''+@cReturnOderItem

		IF LEN(@cReturnOderItem) < 10
			SET @cReturnOderItem = '' ''+@cReturnOderItem

	    end
	ELSE	--No DASH
		begin
		
		--SELECT DISTINCT SOitem FROM dbo.PurchaseOrder ORDER BY SOitem

		IF @vcOrderItem = ''STOCK''
			SET @cReturnOderItem = ''      0-00''
		ELSE
			IF @vcOrderItem = ''ConvertSVC''
				SET @cReturnOderItem = ''      0-00''
			ELSE
				IF @vcOrderItem = ''Equipment''
					SET @cReturnOderItem = ''      0-00''
				ELSE
					IF @vcOrderItem = ''LabService''
						SET @cReturnOderItem = ''      0-00''
					ELSE
						SET @cReturnOderItem = ''9999999-99''


		end
    end
ELSE
	IF @vcOrderItem IS NULL	
		SET @cReturnOderItem = @vcOrderItem	--Return the Null
	ELSE
		SET @cReturnOderItem = ''      0-00''	--Less than 3 digits

RETURN (@cReturnOderItem)
END



--GRANT EXECUTE ON [dbo].[f_ProperSOitem] TO [WINDFALL\HPA] AS [dbo];


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_ProperTHK]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_ProperTHK]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[f_ProperTHK]
(
@pFloatPara float
)
RETURNS FLOAT

AS
BEGIN



--@pFloatPara
-- Correct float to Numeric(7,3)
RETURN dbo.Remove0(CAST(@pFloatPara AS Numeric(7,4) ),7,4) 





/*	
	--************************
	--**  Convert to SQL --if Cast is broken
	--************************

	PROCEDURE Proper_Thk

	PARAMETER pnNumberWithZero
	*Proper_Thk(nSize)

	*from Remove0.prg
	*PARAMETER pnNumberWithZero,pnNumberLength,pnNumberDecimals,plForcePennies

	PRIVATE cNumbasCharK,nLastDigits
	*, pnNumberWithZero,pnNumberLength,pnNumberDecimals
	***remove0(nNumber_With_Zero,nLength,nDecimals,.F.)

	IF VARTYPE(pnNumberWithZero) != "N" AND VARTYPE(pnNumberWithZero) != "Y"
		pnNumberWithZero = 0
	ENDIF
	PRIVAT pnNumberLength, pnNumberDecimals
	pnNumberLength = 9
	pnNumberDecimals = 3

	PRIVATE nOrigDecimal
	nOrigDecimal = SET(''DECIMAL'')

	PRIVATE cReturnChar
	cReturnChar = ''''
	cNumbasCharK = FLOOR(pnNumberWithZero*1000)
	cNumbasChar = STR(pnNumberWithZero,pnNumberLength+pnNumberDecimals+1,pnNumberDecimals)

	PRIVATE cOnlyWholeNum
	IF AT(".",cNumbasChar) = 0
		*cOnlyWholeNum = STR(pnNumberWithZero,pnNumberLength,0)
		cOnlyWholeNum = cNumbasChar
	ELSE
		cOnlyWholeNum = LEFT(cNumbasChar, AT(".",cNumbasChar)-1)
	ENDIF

	SET DECIMALS TO 0
	nOnlyWholeNum = VAL(cOnlyWholeNum)

	PRIVATE nNewDecimal,nNewDecimalasWhole,nTestDecimals
	*Have Decimals to deal with!
	PRIVATE nDecimals,nLastDigit
	SET DECIMALS TO (pnNumberDecimals)
	cNumbasChar = STR(FLOOR(pnNumberWithZero*1000)/1000 ,9,3)

	nDecimalasWhole = VAL(RIGHT(cNumbasChar,pnNumberDecimals))

	IF RIGHT(cNumbasChar,1) != ''0''
		*No Zero to remove
		cReturnChar = LTRIM(cNumbasChar)

	ELSE	
		*Remove Zero
		nDecimals	= VAL(RIGHT(cNumbasChar,pnNumberDecimals))/10^pnNumberDecimals
		IF nDecimals < .1
			IF nDecimals = 0
				*Drop the decimals
				*cReturnChar = ALLTRIM(cNumbasChar)
				cReturnChar = LTRIM(STR(nOnlyWholeNum,pnNumberLength,0))
			ELSE
				*First Decimal is 0, Consider all decimals significant up to 3 places.
				IF pnNumberDecimals <= 3
					cReturnChar = LTRIM(cNumbasChar)
					*cReturnChar = LTRIM(STR(nOnlyWholeNum,pnNumberLength,0))
				ELSE
					IF RIGHT(cNumbasChar,1) = ''0''
						*Remove 0 till 3 decimal places.
						nTestDecimals = pnNumberDecimals
						DO WHILE nTestDecimals > 3
							nNewDecimalasWhole = nDecimalasWhole / 10
							nTestDecimals = nTestDecimals -1
							IF RIGHT(STR(nNewDecimalasWhole,nTestDecimals,0),1) != ''0''
								EXIT
							ENDIF

						ENDDO
						SET DECIMALS TO nTestDecimals
						nNewDecimal = nNewDecimalasWhole/10^nTestDecimals
						cReturnChar = LTRIM(STR(nOnlyWholeNum+nNewDecimal,pnNumberLength+nTestDecimals+1,nTestDecimals ))
					ENDIF
				ENDIF
			ENDIF
		ELSE  &&nDecimals < .1
			*So Decimals are over  .0999999


			nNewDecimalasWhole = nDecimalasWhole
			FOR nTestDecimals = pnNumberDecimals TO 0 STEP -1

				IF RIGHT(STR(nNewDecimalasWhole,nTestDecimals,0),1) = ''0''
					SET DECIMALS TO 0
					nNewDecimalasWhole = nNewDecimalasWhole / 10
				ELSE
					EXIT
				ENDIF
				IF nNewDecimalasWhole < 1
					EXIT
				ENDIF
			NEXT nTestDecimals

			SET DECIMALS TO (nTestDecimals)
			nNewDecimal = nNewDecimalasWhole/ 10^nTestDecimals
			cReturnChar = LTRIM(STR(nOnlyWholeNum+nNewDecimal,pnNumberLength+nTestDecimals+1,nTestDecimals))

		ENDIF	&&nDecimals < .1
	ENDIF	&&No Zero to remove



	SET DECIMALS TO (nOrigDecimal)

	RETURN LTRIM(cReturnChar)
*/




END


--GRANT EXECUTE ON [dbo].[f_ProperTHK] TO [WINDFALL\HPA] AS [dbo];




' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_RC_Loc]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_RC_Loc]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_RC_Loc] 
(
@nCertID INT
,@cLoc CHAR(5)
)
RETURNS Numeric(4,1)

AS
BEGIN

-- select dbo.f_RC_Loc(9940,''P0375'')
--select *  from dbo.vSpaceX_RC_Profile

DECLARE @nRC_Val Numeric(4,1)
DECLARE @nInchPos Numeric(5,3)

/*
SET @nInchPos = 0.375 
DECLARE @nID2 INT = 9940

SELECT RockC,* FROM dbo.Cert_RC_profile WHERE [Inch] = @nInchPos AND CertID=@nID2
*/


SET @nInchPos = CASE 
WHEN @cLoc = ''P0000'' THEN 0.000
WHEN @cLoc = ''P0125'' THEN 0.125
WHEN @cLoc = ''P0250'' THEN 0.250
WHEN @cLoc = ''P0375'' THEN 0.375
WHEN @cLoc = ''P0500'' THEN 0.500
WHEN @cLoc = ''P0625'' THEN 0.625
WHEN @cLoc = ''P0750'' THEN 0.750
WHEN @cLoc = ''P0875'' THEN 0.875

WHEN @cLoc = ''P1000'' THEN 1.000
WHEN @cLoc = ''P1125'' THEN 1.125
WHEN @cLoc = ''P2250'' THEN 1.250
WHEN @cLoc = ''P1375'' THEN 1.375
WHEN @cLoc = ''P1500'' THEN 1.500
WHEN @cLoc = ''P1625'' THEN 1.625
WHEN @cLoc = ''P1750'' THEN 1.750
WHEN @cLoc = ''P1875'' THEN 1.875

WHEN @cLoc = ''P2000'' THEN 2.000
WHEN @cLoc = ''P2125'' THEN 2.125
WHEN @cLoc = ''P2250'' THEN 2.250
WHEN @cLoc = ''P2375'' THEN 2.375
WHEN @cLoc = ''P2500'' THEN 2.500
WHEN @cLoc = ''P2625'' THEN 2.625
WHEN @cLoc = ''P2750'' THEN 2.750
WHEN @cLoc = ''P2875'' THEN 2.875

WHEN @cLoc = ''P3000'' THEN 3.000
WHEN @cLoc = ''P3125'' THEN 3.125
WHEN @cLoc = ''P3250'' THEN 3.250
WHEN @cLoc = ''P3375'' THEN 3.375
WHEN @cLoc = ''P3500'' THEN 3.500
WHEN @cLoc = ''P3625'' THEN 3.625
WHEN @cLoc = ''P3750'' THEN 3.750
WHEN @cLoc = ''P3875'' THEN 3.875

END;

--PRINT @nCertID
--PRINT @nInchPos

SELECT TOP 1 @nRC_Val = RockC FROM dbo.[Cert_RC_profile] WITH(NOLOCK) WHERE CertID = @nCertID AND Inch = @nInchPos

RETURN (@nRC_Val)-- AS [RC]

END

--GRANT EXECUTE ON [dbo].[f_RC_Loc] TO [WINDFALL\HPA] AS [dbo];
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Rc_to_BHN]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Rc_to_BHN]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_Rc_to_BHN]
(
   @HRc_value CHAR(4)

)
RETURNS SmallInt
AS BEGIN


--SELECT dbo.[f_Rc_to_BHN](''RC42'')

	DECLARE @BHN_value SmallInt = 0
    DECLARE @conversion_factor DECIMAL(10,2);
	DECLARE @nRC TinyInt = 0


	--DECLARE @HRc_value char(4) = ''RC42'';
	DECLARE @numeric_value varchar(2);

	SET @numeric_value = SUBSTRING(@HRc_value, PATINDEX(''%[0-9]%'', @HRc_value), LEN(@HRc_value) - PATINDEX(''%[0-9]%'', @HRc_value) + 1);

	SET @nRC = CAST(@numeric_value AS INT) ;




    -- Check if the HRC value is within a reasonable range (typically 20-70 for HRC)
    IF @nRC >= 20 AND @nRC <= 70 
		begin
        SET @conversion_factor = 13000;
        SET @BHN_value = @conversion_factor / (@nRC - 20);
		end
--    ELSE
--        THROW 50001, ''HRc value must be between 20 and 70'', 1;
   
RETURN @BHN_value
END

/*
GRANT EXECUTE ON [dbo].[f_Rc_to_BHN] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_Rc_to_BHN] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_Rc_to_BHN] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Remove0]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Remove0]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<David Kirchner>
-- Description:	<Done in FoxPro>
-- =============================================
Create FUNCTION [dbo].[f_Remove0]
(
@nIN AS Float
,@nINT AS INT
,@nDec AS INT
)
RETURNS VARCHAR(20)
AS
BEGIN
--PRINT dbo.Remove0(100.0,5,2)
--PRINT dbo.Remove0(100.1110,5,2)



----------------------------
--Work in progress
----------------------------


DECLARE @cOUT VARCHAR(20)

SET @cOUT = RTRIM(LTRIM(CONVERT( VARCHAR(20), @nIN )))

RETURN @cOUT

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Remove0_Money]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Remove0_Money]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<David Kirchner>
-- Description:	<Done in FoxPro>
-- =============================================
CREATE FUNCTION [dbo].[f_Remove0_Money]
(
	@nIN AS Money
	,@nINT AS INT
	,@nDec AS INT
)
RETURNS VARCHAR(20)
AS
BEGIN

--PRINT dbo.f_Remove0_Money(100.0,5,2)
--PRINT dbo.f_Remove0_Money(100.1110,5,2)
--PRINT dbo.f_Remove0_Money(500,18,4)
--PRINT dbo.f_Remove0_Money(500,18,6)

--Similar to dbo.f_Remove0

----------------------------
--Work in progress
----------------------------


DECLARE @cOUT VARCHAR(20)
DECLARE @nPennies INT

SET @cOUT = CONVERT( VARCHAR(20), CONVERT( DECIMAL(18,4), @nIN))
SET @cOUT = RTRIM(LTRIM( @cOUT ))

IF CHARINDEX(''.'',@cOUT) > 0 
	begin
	--found decimal
	IF @nDec = 0
		SET @cOut = LEFT( @cOut, LEN(@cOut)-CHARINDEX(''.'',@cOUT) )

	IF @nDec > 0
		SET @cOut = LEFT( @cOut, LEN(@cOut)-(4-@nDec) )
	
	--look at decimal value (Pennies)
	SET @nPennies = CAST( RIGHT( @cOUT, LEN(@cOut)-CHARINDEX(''.'',@cOUT) )AS INT)
	IF @nPennies = 0
		IF CHARINDEX(''.'',@cOUT) > 0 
			SET @cOut = LEFT( @cOut, CHARINDEX(''.'',@cOUT) -1)


	--Evan with Money, if the last 2 of 4 are 00, remove 00
	IF @nDec >= 4
		IF RIGHT( @cOUT, 2 ) = ''00'' AND CHARINDEX(''.'',@cOUT) > 0 
			SET @cOUT = LEFT( @cOut, LEN(@cOut) -2)

			
	end

RETURN @cOUT

END' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Report_1YrBroker]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Report_1YrBroker]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David Kirchner
-- Create date: 2015 08 12
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_Report_1YrBroker] 
(
	@Alloy CHAR(12)
	,@Form CHAR(2)
	,@CC CHAR(1)
	,@Size DECIMAL (11,4)
)
RETURNS INT
AS
BEGIN

--PRINT dbo.f_Report_1YrBroker ( Alloy,Form,CC,Size )
--PRINT dbo.f_Report_1YrBroker ( ''HPA N60'',''10'',''1'',3.0 )

-- Declare the return variable here
DECLARE @nReturn INT
SET @nReturn = 0

SELECT @nReturn = SUM(S.Quoted_QTY)  --MatlWt
FROM ERP_2.dbo.AllQuotes AQ
INNER JOIN ERP_2.dbo.Sales S ON S.SOitem = AQ.SOitem
 WHERE AQ.Inqdate >= GETDATE()-365
 --AND AQ.SalesNum > 0
 --AND AQ.HPApo > 0
 AND S.Typ = ''B''
 AND AQ.Alloy = @Alloy
 AND AQ.Form = @Form
 AND dbo.f_GetCCSortValue(AQ.CC) = dbo.f_GetCCSortValue(@CC)
 AND AQ.StandardSize = ERP_2.dbo.f_SizeStandard(@Size)
 AND S.cncld = 0

SET @nReturn = ISNULL(@nReturn,0)
RETURN @nReturn

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Report_1YrQuoted]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Report_1YrQuoted]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David Kirchner
-- Create date: 2015 08 12
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_Report_1YrQuoted] 
(
	@Alloy CHAR(12)
	,@Form CHAR(2)
	,@CC CHAR(1)
	,@Size DECIMAL (11,4)
)
RETURNS INT
AS
BEGIN

--PRINT dbo.f_Report_1YrQuoted ( Alloy,Form,CC,Size )
--PRINT dbo.f_Report_1YrQuoted(''HPA N60'',''10'',''1'',3.0 )

-- Declare the return variable here
DECLARE @nReturn INT
SET @nReturn = 0

--SELECT @nReturn = SUM( ERP_2.dbo.f_GetQuoted_LBS_report (Inqdate,Alloy,Form,CC, Thck ) )
SELECT @nReturn = SUM( ERP_2.dbo.f_GetQuoted_LBS_report ( 
CONVERT(datetime,  CONVERT(nvarchar(12), Inqdate, 127)+''0:00:00''),Alloy,Form,CC,Thck) 
)

FROM ERP_2.dbo.AllQuotes AQ
 WHERE AQ.Inqdate >= GETDATE()-365
 AND AQ.Alloy = @Alloy
 AND AQ.Form = @Form
 AND AQ.CC = @CC
 AND AQ.StandardSize = ERP_2.dbo.f_SizeStandard(@Size)
SET @nReturn = ISNULL(@nReturn,0)
RETURN @nReturn

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Report_1yrSales]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Report_1yrSales]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David Kirchner
-- Create date: 2015 08 12
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_Report_1yrSales] 
(
	@Alloy CHAR(12)
	,@Form CHAR(2)
	,@CC CHAR(1)
	,@Size DECIMAL (11,4)
)
RETURNS INT
AS
BEGIN

--PRINT dbo.f_Report_1yrSales (	@Alloy,@Form,@CC,@Size )
--PRINT dbo.f_Report_1yrSales (	''HPA N60'',''10'',''1'',3.0 )

-- Declare the return variable here
DECLARE @nReturn INT
SET @nReturn = 0

SELECT @nReturn = SUM(Sales_Summary.MatlWt)
 FROM dbo.NR_Sales_Summary
 WHERE Sales_Summary.Year >= (YEAR(GETDATE())-1)
 AND Sales_Summary.Alloy = @Alloy
 AND Sales_Summary.Form = @Form
 AND Sales_Summary.CC = @CC
 AND Sales_Summary.Size = ERP_2.dbo.f_SizeStandard(@Size)

SET @nReturn = ISNULL(@nReturn,0)
RETURN @nReturn

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Report_1YrStock]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Report_1YrStock]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David Kirchner
-- Create date: 2015 08 12
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_Report_1YrStock] 
(
	@Alloy CHAR(12)
	,@Form CHAR(2)
	,@CC CHAR(1)
	,@Size DECIMAL (11,4)
)
RETURNS INT
AS
BEGIN

--PRINT dbo.f_Report_1YrStock (	Alloy,Form,CC,Size )
--PRINT dbo.f_Report_1YrStock (	''HPA N60'',''10'',''1'',3.0 )

-- Declare the return variable here
DECLARE @nReturn INT
SET @nReturn = 0

SELECT @nReturn = AVG([MWeight])
 FROM [dbo].[NR_StockLst_Totals]
WHERE StockLst_Totals.Year >= (YEAR(GETDATE())-3)
 AND StockLst_Totals.Alloy = @Alloy
 AND StockLst_Totals.Form = @Form
 AND StockLst_Totals.CC = @CC
 AND StockLst_Totals.Size = ERP_2.dbo.f_SizeStandard(@Size)

SET @nReturn = ISNULL(@nReturn,0)
RETURN @nReturn

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Report_3yrSales]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Report_3yrSales]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David Kirchner
-- Create date: 2015 08 12
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_Report_3yrSales] 
(
	@Alloy CHAR(12)
	,@Form CHAR(2)
	,@CC CHAR(1)
	,@Size DECIMAL (11,4)
)
RETURNS INT
AS
BEGIN

--PRINT dbo.f_Report_3yrSales (	@Alloy,@Form,@CC,@Size )
--PRINT dbo.f_Report_3yrSales (	''HPA N60'',''10'',''2'',3.0 )

-- Declare the return variable here
DECLARE @nReturn INT
SET @nReturn = 0

SELECT @nReturn = SUM(Sales_Summary.MatlWt)
 FROM dbo.NR_Sales_Summary
 WHERE Sales_Summary.Year >= (YEAR(GETDATE())-3)
 AND Sales_Summary.Alloy = @Alloy
 AND Sales_Summary.Form = @Form
 AND Sales_Summary.CC = @CC
 AND Sales_Summary.Size = @Size

SET @nReturn = ISNULL(@nReturn,0)
RETURN @nReturn

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Report_CurrStock]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Report_CurrStock]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David Kirchner
-- Create date: 2015 08 12
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_Report_CurrStock] 
(
	@Alloy CHAR(12)
	,@Form CHAR(2)
	,@CC CHAR(1)
	,@Size DECIMAL (11,4)
)
RETURNS INT
AS
BEGIN

--PRINT dbo.f_Report_CurrStock(Alloy,Form,CC,Size )
--PRINT dbo.f_Report_CurrStock(''HPA N60'',''10'',''1'',3.0 )

--PRINT dbo.[getStockLstCurrentLbs](''C-276'',''40'',''1'',.5)
--getStockLstCurrentLbs uses live StockLst_Master reads.


-- Declare the return variable here
DECLARE @nReturn INT
SET @nReturn = 0

SELECT @nReturn = SUM([MWeight])
 FROM [dbo].[NR_StockLst_Totals]
WHERE YEAR(StockLst_Totals.EOM) = YEAR(GETDATE())
 AND MONTH(EOM) = MONTH(GETDATE())-1
 AND StockLst_Totals.Alloy = @Alloy
 AND StockLst_Totals.Form = @Form
 AND StockLst_Totals.CC = @CC
 AND StockLst_Totals.Size = ERP_2.dbo.f_SizeStandard(@Size)

SET @nReturn = ISNULL(@nReturn,0)
RETURN @nReturn
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Report_FormDescription_Order]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Report_FormDescription_Order]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[f_Report_FormDescription_Order]
(
@cForm CHAR(2)
)
RETURNS CHAR(14)
AS
BEGIN

--SELECT dbo.f_Report_FormDescription_Order(''10'')
--Use form to get Ordered Common Description
-- used in RS Inventory -Stock Summary for Customer

DECLARE @cOrder CHAR(14)

declare @err int,
        @RC int

set @err = 0
set @rc = 0
--SELECT * from dbo.Forms

SET @cOrder = CASE
	WHEN @cForm = ''10'' THEN ''1 Bar  round''
	WHEN @cForm = ''11'' THEN ''1 Bar  round'' --Flat
	WHEN @cForm = ''12'' THEN ''1 Bar  round'' --Hex
	WHEN @cForm = ''13'' THEN ''1 Bar  round'' --Square

	WHEN @cForm = ''20'' THEN ''5 Wire & Weld''
	WHEN @cForm = ''21'' THEN ''5 Wire & Weld''
	WHEN @cForm = ''22'' THEN ''5 Wire & Weld'' --loose coil
	WHEN @cForm = ''23'' THEN ''5 Wire & Weld''
	WHEN @cForm = ''30'' THEN ''5 Wire & Weld''

	WHEN @cForm = ''40'' THEN ''2 Plate &Sheet''
	WHEN @cForm = ''50'' THEN ''2 Plate &Sheet''
	WHEN @cForm = ''51'' THEN ''3 Flat Coil''
	WHEN @cForm = ''52'' THEN ''3 Flat Coil''
	WHEN @cForm = ''53'' THEN ''3 Flat Coil'' --hot band
	--''4
	WHEN @cForm = ''60'' THEN ''6 Tube & Pipe''
	WHEN @cForm = ''65'' THEN ''6 Tube & Pipe''
	WHEN @cForm = ''66'' THEN ''6 Tube & Pipe''
	WHEN @cForm = ''67'' THEN ''6 Tube & Pipe''
	WHEN @cForm = ''68'' THEN ''6 Tube & Pipe''
	WHEN @cForm = ''69'' THEN ''6 Tube & Pipe''
	WHEN @cForm = ''70'' THEN ''6 Tube & Pipe''
	WHEN @cForm = ''71'' THEN ''6 Tube & Pipe''
	WHEN @cForm = ''72'' THEN ''6 Tube & Pipe''
	WHEN @cForm = ''75'' THEN ''6 Tube & Pipe''
	--''7
	--''8
	WHEN @cForm = ''90'' THEN ''9 Forge Stock''
	WHEN @cForm = ''91'' THEN ''9 Forge Stock''
	WHEN @cForm = ''95'' THEN ''9 Forge Stock''
	WHEN @cForm = ''96'' THEN ''2 Plate &Sheet''
	WHEN @cForm = ''97'' THEN ''9 Forge Stock''
	WHEN @cForm = ''98'' THEN ''9 Forge Stock''
	WHEN @cForm = ''99'' THEN ''9 Forge Stock''
		ELSE ''9 Forge Stock''
	end


RETURN @cOrder
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Report_GetMWeight_Due]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Report_GetMWeight_Due]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'



CREATE FUNCTION [dbo].[f_Report_GetMWeight_Due]
(
 @Alloy CHAR(12), @Form CHAR(2), @CC CHAR(1), @Thck NUMERIC(11,4)
)
RETURNS Decimal(9,1)
AS
BEGIN

--SELECT dbo.f_Report_GetMWeight_Due(''6B'',''10'',''1'', 3)

DECLARE @MWeight Decimal(18,8)

declare @err int,
        @RC int
set @err = 0
set @rc = 0

SET @MWeight = 0

SELECT @MWeight = SUM( ISNULL(SM.MWeight,0) )
	FROM ERP_2.dbo.StockLst_Master SM
	WHERE SM.Alloy = @Alloy 
	AND SM.Form = @Form 
	AND SM.CC = @CC 
	AND SM.Size = @Thck 
	AND ( SM.POStatus = ''D''
	OR (SM.StkDate=''1900-01-01'' AND SM.POStatus IS NULL ) )

RETURN ISNULL(@MWeight,0)
END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Report_StockDue]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Report_StockDue]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David Kirchner
-- Create date: 2015 08 12
-- Description:	
-- =============================================
Create FUNCTION [dbo].[f_Report_StockDue] 
(
	@Alloy CHAR(12)
	,@Form CHAR(2)
	,@CC CHAR(1)
	,@Size DECIMAL (11,4)
)
RETURNS INT
AS
BEGIN

--PRINT dbo.f_Report_StockDue(Alloy,Form,CC,Size )
--PRINT dbo.f_Report_StockDue(''HPA N60'',''10'',''1'',3.0 )

-- Declare the return variable here
DECLARE @nReturn INT
SET @nReturn = 0


SELECT @nReturn = SUM([MWeight])
 FROM [dbo].[Stocklst_Master]
WHERE Stocklst_Master.Alloy = @Alloy
 AND Stocklst_Master.Form = @Form
 AND Stocklst_Master.CC = @CC
 AND Stocklst_Master.Size = @Size
 AND ( Stocklst_Master.Heat = ''Due In'' OR Stocklst_Master.POStatus = ''D'' )

SET @nReturn = ISNULL(@nReturn,0)
RETURN @nReturn
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Reportlink_CHAR]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Reportlink_CHAR]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_Reportlink_CHAR]
(
@cReport Char(20)
,@cCHAR VARCHAR(100)
)
RETURNS VARCHAR(2000)
AS
BEGIN

--SELECT dbo.f_Reportlink_CHAR(''CompanyInfo'',@cCHAR)
--SELECT dbo.f_Reportlink_CHAR(''CustomerID'',@cCHAR)
--SELECT dbo.f_Reportlink_CHAR(''CustomerInfo_NoNoise'',@cCHAR)
--SELECT dbo.f_Reportlink_CHAR(''POitem'','' 508423-01'')
--SELECT dbo.f_Reportlink_CHAR(''Receiving_POitem'',@cCHAR)
--SELECT dbo.f_Reportlink_CHAR(''SOitem'','' 114609-01'')
--SELECT dbo.f_Reportlink_CHAR(''Receiving_POitem'','' 508423-01'')
--SELECT dbo.f_Reportlink_CHAR(''Internal.onHoldSales'',@cCHAR)
--SELECT ERP_2.dbo.f_GetSQL_Report_Server()

DECLARE @cReturnString VarChar(2000)
SET @cReturnString = ERP_2.dbo.f_GetSQL_Report_Server()
--PRINT ERP_2.dbo.f_GetSQL_Report_Server()
--''/Pages/ReportViewer.aspx?''
DECLARE @cCleanPara	VarChar(1000) = '''';
SET @cCHAR = RTRIM(@cCHAR);
SET @cCleanPara = REPLACE(@cCHAR,'' '', ''+'');

IF LEN(@cReport) < 1
	SET @cReturnString = ''''
ELSE
IF @cReport = ''CompanyInfo''
	SET @cReturnString = @cReturnString+ ''?%2fCustomer%2fCustomer+Info&rs:Command=Render&customer=''+ @cCHAR
ELSE
IF @cReport = ''CustomerID''
	SET @cReturnString = @cReturnString+ ''?%2fCustomer%2fCustomer+Info+CustID&rs:Command=Render&CustomerID=''+ @cCHAR
ELSE
IF @cReport = ''CustomerInfo_NoNoise''
	SET @cReturnString = @cReturnString+ ''?%2fCustomer%2fCustomer+Info+NoNoise&rs:Command=Render&NoNoiseName=''+ @cCHAR
ELSE
IF @cReport = ''POitem''
	SET @cReturnString = @cReturnString+ ''?%2fHPA+Purchasing+Reports%2fPurchaseOrders+POitem&rs:Command=Render&cHPAPOItem='' + @cCleanPara
ELSE
IF @cReport = ''Receiving_POitem''
	SET @cReturnString = @cReturnString+ ''?%2fReceiving%2fReceiving+POitem&rs:Command=Render&cPOitem='' + @cCleanPara
ELSE
IF @cReport = ''SOitem''
	SET @cReturnString = @cReturnString+ ''?%2fHPA+Sales+Reports%2fSalesOrder+SOitem&rs:Command=Render&cSOitem=''+ @cCleanPara
ELSE
IF @cReport = ''Internal.onHoldSales''
	SET @cReturnString = ''https://internal.highperformancealloys.com/onHoldSales/''+TRIM(@cCHAR)
ELSE
	SET @cReturnString = ''Parameter @cReport NOT found with IF CASE in dbo.f_Reportlink_CHAR''



RETURN @cReturnString
END


/*
GRANT EXECUTE ON [dbo].[f_Reportlink_CHAR] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_Reportlink_CHAR] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_Reportlink_CHAR] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Reportlink_INT]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Reportlink_INT]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_Reportlink_INT]
(
@cReport Char(20)
,@nNumber INT
)
RETURNS VARCHAR(2000)
AS
BEGIN

--SELECT dbo.f_Reportlink_INT(''ReceivingID'',@nID)
--SELECT dbo.f_Reportlink_INT(''SO'',@nSO)	--called from  dbo.f_HTML_link_SO(@nSO)
--SELECT dbo.f_Reportlink_INT(''SO_OnHold_Hist'',@nSO)	--called from  dbo.f_HTML_link_SO_OnHold_History(@nSO)
--SELECT dbo.f_Reportlink_INT(''BrokerLstID'',@nID)
--SELECT dbo.f_Reportlink_INT(''BrokerLstID_Detail'',@nID_Detail)
--SELECT dbo.f_Reportlink_INT(''StockLstID'',21654)	--https://RAPTOR/ReportServer/Pages/ReportViewer.aspx?%2fInventory%2fStockID%2fStockLst+ID&rs:Command=Render&nID=21654
--SELECT dbo.f_Reportlink_INT(''StockLstID_Detail'',@nID_Detail)

--SELECT dbo.f_Reportlink_INT(''WO'',@nWO)
--SELECT dbo.f_Reportlink_INT(''WO_Detail'',@nWO_Detail)
--SELECT dbo.f_Reportlink_INT(''ProjID'',@ProjID)
--SELECT dbo.f_Reportlink_INT(''Draw_log'',1002)
--SELECT dbo.f_Reportlink_INT(''GFMlog'',@GFMlog_Lot)
--SELECT dbo.f_Reportlink_INT(''Roll_log'',223)
--SELECT dbo.f_Reportlink_INT(''Wire_log'',@Wire_log_Lot)
--SELECT dbo.f_Reportlink_INT(''Swage_log'',@Swage_Lot)

--SELECT dbo.f_Reportlink_INT(''HPAPO'',@HpaPo)
--SELECT dbo.f_Reportlink_INT(''OTrack'',@nTrackID)
--SELECT dbo.f_Reportlink_INT(''rtr'',@n)

--SELECT ERP_2.dbo.f_GetSQL_Report_Server()

DECLARE @cReturnString VarChar(2000)
SET @cReturnString = ERP_2.dbo.f_GetSQL_Report_Server()
--PRINT ERP_2.dbo.f_GetSQL_Report_Server() --https://PEREGRINE/ReportServer now https://RAPTOR/ReportServer/Pages/ReportViewer.aspx
--''/Pages/ReportViewer.aspx''
----SET @cReturnString = @cReturnString+ ''?%2fReceiving%2fReceiving+ReceivingID&rs:Command=Render&ReceivingID=''+ LTRIM(RTRIM(STR(@nNumber))) --DID NOT WORK

IF LEN(@cReport) < 1
	SET @cReturnString = ''''
ELSE
IF @cReport = ''XYZ''
	SET @cReturnString = @cReturnString+ ''?%2fPages%2fReportViewer.aspx?%2fReceiving%2fReceiving+ReceivingID&rs:Command=Render&ReceivingID=''
		+LTRIM(RTRIM(STR(@nNumber)))
ELSE
IF @cReport = ''ProjID''
	SET @cReturnString = @cReturnString+ ''?%2fWorkOrder%2fWO+by+ProjID&rs:Command=Render&ProjID=''+LTRIM(RTRIM(STR(@nNumber))) 
ELSE
IF @cReport = ''ReceivingID''
	SET @cReturnString = @cReturnString+ ''?%2fReceiving%2fReceiving+ReceivingID&rs:Command=Render&ReceivingID=''+ LTRIM(RTRIM(STR(@nNumber)))
ELSE
IF @cReport = ''SO_Status''
	SET @cReturnString = @cReturnString+ ''?%2fHPA+Sales+Reports%2fSalesNum+Status&rs:Command=Render&SalesNum=''+ LTRIM(RTRIM(STR(@nNumber))) 
ELSE
IF @cReport = ''SO''
	SET @cReturnString = @cReturnString+ ''?%2fHPA+Sales+Reports%2fSalesOrders&rs:Command=Render&soNum=''+ LTRIM(RTRIM(STR(@nNumber))) 
ELSE



--Sales%20Reports/On%20HOLD%20Sales%20-%20History
IF @cReport = ''SO_OnHold_Hist''
	SET @cReturnString = @cReturnString+ ''?%2fSales+Reports/SO%20On%20HOLD%20History&rs:Command=Render&SalesNum=''+ LTRIM(RTRIM(STR(@nNumber))) 
--	--SET @cReturnString = @cReturnString+ ''http://raptor/ReportS/report/Sales%20Reports/SO%20On%20HOLD%20History&rs:Command=Render&SalesNum=''+ LTRIM(RTRIM(STR(@nNumber))) 
	--SET @cReturnString = @cReturnString+ ''?%2fSales+Reports%2fSO%20On%20HOLD%20Sales%20-%20History&rs:Command=Render&SalesNum=''+ LTRIM(RTRIM(STR(@nNumber))) 
ELSE


--Added %2fStockID
IF @cReport = ''BrokerLstID''
	SET @cReturnString = @cReturnString+ ''?%2fInventory%2fStockID%2fBrokerLst+ID&rs:Command=Render&nID=''+ LTRIM(RTRIM(STR(@nNumber))) 
ELSE
IF @cReport = ''BrokerLstID_Detail''
	SET @cReturnString = @cReturnString+ ''?%2fInventory%2fStockID%2fBrokerLst+ID_Detail&rs:Command=Render&nID_Detail=''+ LTRIM(RTRIM(STR(@nNumber))) 
ELSE
IF @cReport = ''StockLstID''
	SET @cReturnString = @cReturnString+ ''?%2fInventory%2fStockID%2fStockLst+ID&rs:Command=Render&nID=''+ LTRIM(RTRIM(STR(@nNumber))) 
ELSE
IF @cReport = ''StockLstID_Detail''
	SET @cReturnString = @cReturnString+ ''?%2fInventory%2fStockID%2fStockLst+ID_Detail&rs:Command=Render&nID_Detail=''+ LTRIM(RTRIM(STR(@nNumber))) 
ELSE
IF @cReport = ''WO''
	SET @cReturnString = @cReturnString+ ''?%2fWorkOrder%2fWorkOrder&rs:Command=Render&WO=''+ LTRIM(RTRIM(STR(@nNumber))) 
ELSE
IF @cReport = ''WO_Detail''
	SET @cReturnString = @cReturnString+ ''?%2fWorkOrder%2fWorkOrder+WOD&rs:Command=Render&WO_Detail=''+ LTRIM(RTRIM(STR(@nNumber)))
ELSE

IF @cReport = ''Draw_log''
	SET @cReturnString = @cReturnString+ ''?%2fMFG+Log%2fDraw_log&rs:Command=Render&Lot=''+RTRIM(LTRIM(CAST(@nNumber AS CHAR))) 
ELSE
IF @cReport = ''GFMlog''
	SET @cReturnString = @cReturnString+ ''?%2fMFG+Log%2fGFMlog&rs:Command=Render&Lot=''+RTRIM(LTRIM(CAST(@nNumber AS CHAR))) 
ELSE
IF @cReport = ''Roll_log''
	SET @cReturnString = @cReturnString+ ''?%2fMFG+Log%2fRoll_log&rs:Command=Render&Lot=''+RTRIM(LTRIM(CAST(@nNumber AS CHAR))) 
ELSE
IF @cReport = ''Wire_log''
	SET @cReturnString = @cReturnString+ ''?%2fMFG+Log%2fWire_log&rs:Command=Render&Lot=''+RTRIM(LTRIM(CAST(@nNumber AS CHAR))) 
ELSE
IF @cReport = ''Swage_log''
	SET @cReturnString = @cReturnString+ ''?%2fMFG+Log%2fSwage_log&rs:Command=Render&Lot=''+RTRIM(LTRIM(CAST(@nNumber AS CHAR))) 
ELSE

IF @cReport = ''HPAPO''
	SET @cReturnString = @cReturnString+ ''?%2fHPA+Purchasing+Reports%2fPurchaseOrders&amp;rs:Command=Render&hpapo=''+ LTRIM(RTRIM(STR(@nNumber)))
ELSE
IF @cReport = ''OTrack''
	SET @cReturnString = @cReturnString+ ''?%2fOrder+Tracking%2fOrder+Tracking+TrackID&rs:Command=Render&TrackID=''+LTRIM(RTRIM(STR(@nNumber))) 
ELSE
IF @cReport = ''rtr''
	SET @cReturnString = @cReturnString+ ''?%2fRouter%2fRouter+ID&rs:Command=Render&ID=''+LTRIM(RTRIM(STR(@nNumber))) 
ELSE
	SET @cReturnString = ''Parameter @cReport NOT found with IF CASE in dbo.f_Reportlink_INT''

RETURN @cReturnString
END

--https://PEREGRINE/ReportServer/Pages/ReportViewer.aspx?%2fHPA+Sales+Reports%2fSalesOrders&rs:Command=Render&soNum=113001
/*
GRANT EXECUTE ON [dbo].[f_Reportlink_INT] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_Reportlink_INT] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_Reportlink_INT] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Return_Higher_INT]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Return_Higher_INT]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_Return_Higher_INT]
(
@INT1 INT
,@INT2 INT
)
RETURNS INT

--returns the Higher INT
--Never return NULL

AS
BEGIN

--SELECT dbo.f_Return_Higher_INT (Min,Max)

DECLARE @ReturnInt INT
SET @ReturnInt = 0

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @INT1 = ISNULL(@INT1,0)
SET @INT2 = ISNULL(@INT2,0)

IF @INT1 > @INT2
	SET @ReturnInt = @INT1
ELSE
	IF @INT1 < @INT2
		SET @ReturnInt = @INT2
		
RETURN ISNULL(@ReturnInt,0)
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Return_Higher_Num]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Return_Higher_Num]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_Return_Higher_Num]
(
@INT1 Numeric (10,4)
,@INT2 Numeric (10,4)
)
RETURNS Numeric (10,4)

--returns the Higher Num
--Never return NULL, 0 before null

AS
BEGIN

--SELECT dbo.f_Return_Higher_INT (Min,Max)

DECLARE @ReturnInt Numeric (10,4)
SET @ReturnInt = 0

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @INT1 = ISNULL(@INT1,0)
SET @INT2 = ISNULL(@INT2,0)

IF @INT1 > @INT2
	SET @ReturnInt = @INT1
ELSE
	IF @INT1 < @INT2
		SET @ReturnInt = @INT2
		
RETURN ISNULL(@ReturnInt,0)
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Return_Lbs_if_kg]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Return_Lbs_if_kg]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David Kirchner
-- Create date: 2018 07 09
-- Description:	For PackingSlip that uses kg
-- =============================================
CREATE FUNCTION [dbo].[f_Return_Lbs_if_kg] 
(
	@nPounds Numeric (9,1)
	,@lkg	bit
)
RETURNS  Numeric (9,1)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @nReturn Numeric (9,1) = 0

	SET @nReturn = CASE WHEN @lkg IS NULL THEN @nPounds
					WHEN @lkg =1 THEN @nPounds/2.2
					ELSE @nPounds END
					 


	-- Return the result of the function
	RETURN ISNULL(@nReturn,0)

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Return_Lower_INT]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Return_Lower_INT]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_Return_Lower_INT]
(
@INT1 INT
,@INT2 INT
)
RETURNS INT

--returns the Higher INT
--Never return NULL
--Do not use 0 as lowest!

AS
BEGIN

--SELECT dbo.f_Return_Lower_INT (2,3) ; SELECT dbo.f_Return_Lower_INT (3,2) ;SELECT dbo.f_Return_Lower_INT (1,0) ; SELECT dbo.f_Return_Lower_INT (0,1)

DECLARE @ReturnInt INT
SET @ReturnInt = 9

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @INT1 = ISNULL(@INT1,0)
SET @INT2 = ISNULL(@INT2,0)

IF @INT1 > 0
	IF @INT1 < @INT2
		SET @ReturnInt = @INT1
	ELSE
		IF @INT1 > @INT2
			IF @INT2 = 0			
				SET @ReturnInt = @INT1
			ELSE
				SET @ReturnInt = @INT2
IF @INT1 = 0
	IF @INT2 > 0
		SET @ReturnInt = @INT2
		
		
RETURN ISNULL(@ReturnInt,0)
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Return_Lower_Num]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Return_Lower_Num]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_Return_Lower_Num]
(
@INT1 Numeric (10,4)
,@INT2 Numeric (10,4)
)
RETURNS Numeric (10,4)

--returns the Lower INT
--Never return NULL
--Do not use 0 as lowest!

AS
BEGIN

--SELECT dbo.f_Return_Lower_Num (2,3) ; SELECT dbo.f_Return_Lower_Num (3,2) ;SELECT dbo.f_Return_Lower_Num (1,0) ; SELECT dbo.f_Return_Lower_Num (0,1)

DECLARE @ReturnInt Numeric (10,4)
SET @ReturnInt = 0

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @INT1 = ISNULL(@INT1,0)
SET @INT2 = ISNULL(@INT2,0)

IF @INT1 > 0
	IF @INT1 < @INT2
		SET @ReturnInt = @INT1
	ELSE
		IF @INT1 > @INT2
			IF @INT2 = 0			
				SET @ReturnInt = @INT1
			ELSE
				SET @ReturnInt = @INT2
IF @INT1 = 0
	IF @INT2 > 0
		SET @ReturnInt = @INT2
		
		
RETURN ISNULL(@ReturnInt,0)
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_RMA_QTY_Rcvd]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_RMA_QTY_Rcvd]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2015 08 04
-- Description:	Checks to see if all vendor documents are valid
-- =============================================
CREATE FUNCTION [dbo].[f_RMA_QTY_Rcvd] 
(
	-- Add the parameters for the function here
	@SOitem CHAR(10)
)
RETURNS Numeric(9,1)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @QTY Numeric(9,1) = 0

	SELECT @QTY = SUM( ISNULL(R.R_QTY,0) )
		FROM RMA_Detail RD
		inner join dbo.Receiving R ON RD.ReceivingID = R.ID
		WHERE RD.cancelled=0 --AND ISNULL(RD.CncSO_item,0) = 0
		AND RD.so_item = @SOitem
	--,R.R_P, R.R_Total ,R.ID AS RID

	-- Return the result of the function
	RETURN @QTY

END

--GRANT EXECUTE ON [dbo].[f_RMA_QTY_Rcvd] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Rockwell_to]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Rockwell_to]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_Rockwell_to]
(
   @HRc_value CHAR(5)
   ,@cTO CHAR(10)
)
RETURNS SmallInt
AS BEGIN


--SELECT dbo.[f_Rockwell_to](''RC42'',''RC'')
--SELECT dbo.[f_Rockwell_to](''RB92'',''RB'')
--SELECT dbo.[f_Rockwell_to](''c37 '',''RC'')
--SELECT dbo.[f_Rockwell_to](''    '',''RC'')
--SELECT dbo.[f_Rockwell_to](''RC42'',''BHN'')
--SELECT dbo.[f_Rockwell_to](''RB92'',''BHN'')

	DECLARE @BHN_value SmallInt = 0
    DECLARE @conversion_factor DECIMAL(10,3);
	DECLARE @nRockwell TinyInt = 0

	--DECLARE @HRc_value char(4) = ''RC42'';
	SET @HRc_value = NULLIF(@HRc_value,'''')

	DECLARE @numeric_value varchar(2);
	SET @numeric_value = SUBSTRING(@HRc_value, PATINDEX(''%[0-9]%'', @HRc_value), LEN(@HRc_value) - PATINDEX(''%[0-9]%'', @HRc_value) + 1);
	SET @nRockwell = CAST(@numeric_value AS INT) ;

	DECLARE @isRC TinyInt = 0
	IF @HRc_value LIKE ''%C%''
		SET @isRC = 1

-------------------------
	IF @cTO = ''RC'' 
		BEGIN
		--drop the Characters
		RETURN @nRockwell
		--
		END
	
-------------------------
	IF @cTO = ''RB'' 
		BEGIN
		--drop the Characters
		RETURN @nRockwell
		--
		END

-------------------------
	IF @cTO = ''BHN'' 
		BEGIN
	    -- Check if the HRC value is within a reasonable range (typically 20-70 for HRC)

			IF @isRC=1
			begin
				--Rockwell C
				IF @nRockwell >= 20 AND @nRockwell <= 30
					begin
					SET @conversion_factor = 5.970;
					SET @BHN_value = (@conversion_factor * @nRockwell) + 104.7;
					RETURN @BHN_value
					end

				IF @nRockwell >= 31 AND @nRockwell <= 40
					begin
					SET @conversion_factor = 8.570;
					SET @BHN_value = (@conversion_factor * @nRockwell) + 27.6;
					RETURN @BHN_value
					end

				IF @nRockwell >= 41 AND @nRockwell <= 50
					begin
					SET @conversion_factor = 11.158;
					SET @BHN_value = (@conversion_factor * @nRockwell) - 79.6;
					RETURN @BHN_value
					end


				IF @nRockwell >= 51 AND @nRockwell <= 60
					begin
					SET @conversion_factor = 17.515;
					SET @BHN_value = (@conversion_factor * @nRockwell) -401;
					RETURN @BHN_value
					end


				IF @nRockwell >= 31 AND @nRockwell <= 40
					begin
					SET @conversion_factor = 8.570;
					SET @BHN_value = (@conversion_factor * @nRockwell) + 27.6;
					RETURN @BHN_value
					end
	
		/*		IF @nRockwell >= 20 AND @nRockwell <= 70 
					begin
					SET @BHN_value = 13000 / (@nRockwell - 20);
					RETURN @BHN_value
					end
		*/
				--end Rockwell C
			end
		
		IF @isRC=0
			begin
				--Rockwell B
				IF @nRockwell >= 55 AND @nRockwell <= 69
					begin
					SET @conversion_factor = 1.646;
					SET @BHN_value = (@conversion_factor * @nRockwell) + 8.7;
					RETURN @BHN_value
					end

				IF @nRockwell >= 70 AND @nRockwell <= 79
					begin
					SET @conversion_factor = 2.394;
					SET @BHN_value = (@conversion_factor * @nRockwell) -42.7;
					RETURN @BHN_value
					end

				IF @nRockwell >= 80 AND @nRockwell <= 89
					begin
					SET @conversion_factor = 3.297;
					SET @BHN_value = (@conversion_factor * @nRockwell) -114;
					RETURN @BHN_value
					end

				IF @nRockwell >= 90 AND @nRockwell <= 100
					begin
					SET @conversion_factor = 5.582;
					SET @BHN_value = (@conversion_factor * @nRockwell) -319;
					RETURN @BHN_value
					end

				-- end Rockwell B
			end
		END

	RETURN 0
END

/*
GRANT EXECUTE ON [dbo].[f_Rockwell_to] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_Rockwell_to] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_Rockwell_to] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_RoundUp]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_RoundUp]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2015 01 19
-- Description:	Rounds Up
-- =============================================
CREATE FUNCTION [dbo].[f_RoundUp] 
(
	-- Add the parameters for the function here
	@value float
	,@precision int
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result float

	-- Add the T-SQL statements to compute the return value here
	SELECT @Result = CEILING(@value * POWER(10, @precision)) / POWER(10, @precision)


	-- Return the result of the function
	RETURN ISNULL(@Result,0)

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_rtr_getDetail_Oper_ID]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_rtr_getDetail_Oper_ID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_rtr_getDetail_Oper_ID]
(
	@nOper_ID INT
)
RETURNS INT


AS
BEGIN

--SELECT dbo.f_rtr_getDetail_Oper_ID(535) AS StdDetail;
--SELECT dbo.f_rtr_getDetail_Oper_ID(528);

DECLARE @nStdDetail INT = 0

SELECT @nStdDetail = StdDetail 
	FROM dbo.rtr_Operation WITH(NOLOCK)
	WHERE Oper_ID = @nOper_ID ;


RETURN @nStdDetail
END


/*
GRANT EXECUTE ON [dbo].f_rtr_getDetail_Oper_ID TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].f_rtr_getDetail_Oper_ID TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].f_rtr_getDetail_Oper_ID TO [WINDFALL\HPA] AS [dbo];
*/
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_rtr_getOperation_Oper_ID]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_rtr_getOperation_Oper_ID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_rtr_getOperation_Oper_ID]
(
	@nOper_ID INT
)
RETURNS CHAR(20)


AS
BEGIN

--SELECT dbo.f_rtr_getOperation_Oper_ID(535) AS Operation;
--SELECT dbo.f_rtr_getOperation_Oper_ID(528);

DECLARE @cOperation CHAR(20) = ''''

SELECT @cOperation = Operation 
	FROM dbo.rtr_Operation WITH(NOLOCK)
	WHERE Oper_ID = @nOper_ID


RETURN @cOperation


END
/*
GRANT EXECUTE ON [dbo].f_rtr_getOperation_Oper_ID TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].f_rtr_getOperation_Oper_ID TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].f_rtr_getOperation_Oper_ID TO [WINDFALL\HPA] AS [dbo];
*/

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_rtr_Last_Finished]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_rtr_Last_Finished]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_rtr_Last_Finished]
(
@ID INT
)
RETURNS INT


AS
BEGIN

--SELECT dbo.f_rtr_Last_Finished(10123);

--SET @ID = ISNULL(@ID,0)
--SET @Detail = ISNULL(@Detail,0)

--IF @ID = 0 AND @Detail = 0
--	RETURN 0


DECLARE @LastDetail INT = 0
SELECT TOP 1 @LastDetail = ISNULL([Detail],0) 
	FROM dbo.rtr_Detail 
	WHERE rtr_ID = @ID
		AND ISNULL([Started],0) = 1 
		AND ISNULL([Finished],0) = 1
	ORDER BY Detail DESC

RETURN @LastDetail

END
/*
GRANT EXECUTE ON [dbo].f_rtr_Last_Finished TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].f_rtr_Last_Finished TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].f_rtr_Last_Finished TO [WINDFALL\HPA] AS [dbo];
*/
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_rtr_Last_Started]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_rtr_Last_Started]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_rtr_Last_Started]
(
@ID INT
)
RETURNS INT


AS
BEGIN

--SELECT dbo.f_rtr_Last_Started(10123);

--SET @ID = ISNULL(@ID,0)
--SET @Detail = ISNULL(@Detail,0)

--IF @ID = 0 AND @Detail = 0
--	RETURN 0


DECLARE @LastDetail INT = 0
SELECT TOP 1 @LastDetail = ISNULL([Detail],0) 
	FROM dbo.rtr_Detail 
	WHERE rtr_ID = @ID
		AND ISNULL([Started],0) = 1 
	ORDER BY Detail 

RETURN @LastDetail

END
/*
GRANT EXECUTE ON [dbo].f_rtr_Last_Started TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].f_rtr_Last_Started TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].f_rtr_Last_Started TO [WINDFALL\HPA] AS [dbo];
*/
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_rtr_MAX_Detail]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_rtr_MAX_Detail]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_rtr_MAX_Detail]
(
@ID INT
)
RETURNS INT


AS
BEGIN


--SELECT dbo.f_rtr_MAX_Detail (10123);

--SET @ID = ISNULL(@ID,0)
--SET @Detail = ISNULL(@Detail,0)

--IF @ID = 0 AND @Detail = 0
--	RETURN 0

DECLARE @Max INT = 0

SELECT @Max = MAX(Detail)
	FROM dbo.rtr_Detail WHERE rtr_ID= @ID 

RETURN @Max
END

/*
GRANT EXECUTE ON [dbo].[f_rtr_MAX_Detail] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_rtr_MAX_Detail] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_rtr_MAX_Detail] TO [WINDFALL\HPA] AS [dbo];
*/
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_rtr_Max_Finished]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_rtr_Max_Finished]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_rtr_Max_Finished]
(
@ID INT
,@Detail INT
)
RETURNS BIT


AS
BEGIN


--SELECT dbo.f_rtr_Max_Finished (10123,300);

--SET @ID = ISNULL(@ID,0)
--SET @Detail = ISNULL(@Detail,0)

--IF @ID = 0 AND @Detail = 0
--	RETURN 0

DECLARE @Finished BIT

SELECT @Finished = ISNULL([Finished],0) FROM dbo.rtr_Detail WHERE rtr_ID= @ID AND Detail = @Detail

RETURN @Finished
END

/*
GRANT EXECUTE ON [dbo].[f_rtr_Max_Finished] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_rtr_Max_Finished] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_rtr_Max_Finished] TO [WINDFALL\HPA] AS [dbo];
*/
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_rtr_MIN_Detail]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_rtr_MIN_Detail]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_rtr_MIN_Detail]
(
@ID INT
)
RETURNS INT


AS
BEGIN


--SELECT dbo.f_rtr_MIN_Detail (10123);

--SET @ID = ISNULL(@ID,0)
--SET @Detail = ISNULL(@Detail,0)

--IF @ID = 0 AND @Detail = 0
--	RETURN 0

DECLARE @Min INT = 0

SELECT @Min = MIN(Detail)
	FROM dbo.rtr_Detail WHERE rtr_ID= @ID 

RETURN @Min
END

/*
GRANT EXECUTE ON [dbo].[f_rtr_MIN_Detail] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_rtr_MIN_Detail] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_rtr_MIN_Detail] TO [WINDFALL\HPA] AS [dbo];
*/
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_rtr_Min_Started]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_rtr_Min_Started]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_rtr_Min_Started]
(
@ID INT
,@Detail INT
)
RETURNS BIT


AS
BEGIN

--SELECT dbo.f_rtr_Min_Started (10123,300);
--SELECT  ISNULL([Started],0) FROM dbo.rtr_Detail WHERE rtr_ID =10137 AND Detail = 100

--SET @ID = ISNULL(@ID,0)
--SET @Detail = ISNULL(@Detail,0)

--IF @ID = 0 AND @Detail = 0
--	RETURN 0


DECLARE @Started BIT 
SELECT @Started = ISNULL([Started],0) FROM dbo.rtr_Detail WHERE rtr_ID = @ID AND Detail = @Detail

RETURN @Started

END
/*
GRANT EXECUTE ON [dbo].[f_rtr_Min_Started] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_rtr_Min_Started] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_rtr_Min_Started] TO [WINDFALL\HPA] AS [dbo];
*/

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_rtr_Need_POitem]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_rtr_Need_POitem]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_rtr_Need_POitem]
(
	@cPOitem CHAR(12)
)
RETURNS BIT


AS
BEGIN

--SELECT dbo.f_rtr_Need_POitem('' 1-01'');

DECLARE @iCntd TinyInt = 0
DECLARE @iSOitem TinyInt = 0
DECLARE @bCancelled BIT = 0
DECLARE @bService BIT = 0
DECLARE @bConvServ BIT = 0
DECLARE @iWO	TinyInt = 0
DECLARE @iWO_Detail	TinyInt = 0
DECLARE @bReconciled BIT = 0

DECLARE @bNeed BIT = 0

SELECT @iCntd = 1 
	, @iSOitem = CASE WHEN ISNULL(SOitem,'''') = '''' THEN 0 ELSE 1 END
	, @bCancelled = CASE WHEN ISNULL([Cancelled],0) = 0 THEN 0 ELSE 1 END
	, @bService = CASE WHEN ISNULL([Services],0) = 0 THEN 0 ELSE 1 END
	, @bConvServ = CASE WHEN ISNULL(ConvServ,0) = 0 THEN 0 ELSE 1 END
	, @iWO = CASE WHEN ISNULL(WO,0) = 0 THEN 0 ELSE 1 END
	, @iWO_Detail = CASE WHEN ISNULL(WO_Detail,0) = 0 THEN 0 ELSE 1 END
	, @bReconciled = CASE WHEN ISNULL(Reconciled,0) = 0 THEN 0 ELSE 1 END

FROM dbo.PurchaseOrder WITH(NOLOCK)
WHERE POitem = @cPOitem

SET @bNeed = CASE WHEN 
	@bConvServ
	> 0 THEN 0 ELSE 1 END

IF @iCntd = 0
	SET @bNeed = 0
ELSE 
IF @bCancelled=1
	SET @bNeed = 0
ELSE 
IF @bReconciled=1
	SET @bNeed = 0

RETURN @bNeed


END
/*
GRANT EXECUTE ON [dbo].f_rtr_Need_POitem TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].f_rtr_Need_POitem TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].f_rtr_Need_POitem TO [WINDFALL\HPA] AS [dbo];
*/

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_rtr_Need_SOitem]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_rtr_Need_SOitem]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_rtr_Need_SOitem]
(
	@cSOitem CHAR(10)
)
RETURNS BIT


AS
BEGIN

--SELECT dbo.f_rtr_Need_SOitem('' 115633-01'');
--SELECT dbo.f_rtr_Need_SOitem('' 115625-01'');

DECLARE @iCntd TinyInt = 0
DECLARE @iINV TinyInt = 0
DECLARE @iGfm TinyInt = 0
DECLARE @iRoll TinyInt = 0
DECLARE @iPress TinyInt = 0
DECLARE @iMach TinyInt = 0
DECLARE @iCG TinyInt = 0
DECLARE @iPlasma TinyInt = 0
DECLARE @iWJet TinyInt = 0
DECLARE @iConverPo TinyInt = 0
DECLARE @bcncld BIT = 0
DECLARE @bcmplt BIT = 0
DECLARE @iWO_Detail TinyInt = 0
DECLARE @iProductionWO TinyInt = 0

DECLARE @bNeed BIT = 0

SELECT @iCntd = 1 
	, @iINV = CASE WHEN ISNULL([Inv],0) = 0 THEN 0 ELSE 1 END
	, @iGfm = CASE WHEN ISNULL([Gfm],0) = 0 THEN 0 ELSE 1 END
	, @iRoll = CASE WHEN ISNULL([Roll],0) = 0 THEN 0 ELSE 1 END
	, @iPress = CASE WHEN ISNULL([Press],0) = 0 THEN 0 ELSE 1 END
	, @iMach = CASE WHEN ISNULL([Mach],0) = 0 THEN 0 ELSE 1 END
	, @iCG = CASE WHEN ISNULL([CG],0) = 0 THEN 0 ELSE 1 END
	, @iPlasma = CASE WHEN ISNULL([Plasma],0) = 0 THEN 0 ELSE 1 END
	, @iWJet = CASE WHEN ISNULL([WJet],0) = 0 THEN 0 ELSE 1 END
	, @iConverPo = CASE WHEN ISNULL(ConverPo,'''') = '''' THEN 0 ELSE 1 END
	, @bcncld = CASE WHEN ISNULL([cncld],0) = 0 THEN 0 ELSE 1 END
	, @bcmplt = CASE WHEN ISNULL([cmplt],0) = 0 THEN 0 ELSE 1 END
	, @iWO_Detail = CASE WHEN ISNULL([WO_Detail],0) = 0 THEN 0 ELSE 1 END
	, @iProductionWO = CASE WHEN ISNULL(ProductionWO,0) = 0 THEN 0 ELSE 1 END
FROM dbo.Sales WITH(NOLOCK)
WHERE SOitem = @cSOitem

SET @bNeed = CASE WHEN 
	--@iINV +
	@iGfm +
	@iRoll +
	@iPress +
	@iMach +
	@iCG +
	@iPlasma +
	@iWJet +
	@iConverPo +
	@iWO_Detail +
	@iProductionWO 
	> 0 THEN 0 ELSE 1 END


IF @iCntd = 0
	SET @bNeed = 0
ELSE
IF @bcmplt=1
	SET @bNeed = 0
ELSE 
IF @bcncld=1
	SET @bNeed = 0

RETURN @bNeed


END
/*
GRANT EXECUTE ON [dbo].f_rtr_Need_SOitem TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].f_rtr_Need_SOitem TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].f_rtr_Need_SOitem TO [WINDFALL\HPA] AS [dbo];
*/

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_rtr_Need_WO_Detail]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_rtr_Need_WO_Detail]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_rtr_Need_WO_Detail]
(
	@nWO_Detail INT
)
RETURNS BIT


AS
BEGIN

--SELECT dbo.f_rtr_Need_WO_Detail('' 115633-01'');

DECLARE @iCntd TinyInt = 0
DECLARE @ifPOitem TinyInt = 0
DECLARE @bfCmplt BIT = 0
DECLARE @bfCncld BIT = 0
DECLARE @bPassTest BIT = 0

DECLARE @bNeed BIT = 0

SELECT @iCntd = 1 
	, @ifPOitem = CASE WHEN ISNULL([fPOitem],'''') = '''' THEN 0 ELSE 1 END
	, @bfCmplt = CASE WHEN ISNULL([fCmplt],0) = 0 THEN 0 ELSE 1 END
	, @bfCncld = CASE WHEN ISNULL([fCncld],0) = 0 THEN 0 ELSE 1 END
	, @bPassTest = CASE WHEN ISNULL([PassTest],0) = 0 THEN 0 ELSE 1 END
FROM dbo.WorkOrder_Detail WITH(NOLOCK)
WHERE WO_Detail = @nWO_Detail

SET @bNeed = CASE WHEN 
	@ifPOitem
	> 0 THEN 0 ELSE 1 END

IF @iCntd = 0
	SET @bNeed = 0
ELSE
IF @bfCmplt=1
	SET @bNeed = 0
ELSE 
IF @bfCncld=1
	SET @bNeed = 0

RETURN @bNeed


END
/*
GRANT EXECUTE ON [dbo].f_rtr_Need_WO_Detail TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].f_rtr_Need_WO_Detail TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].f_rtr_Need_WO_Detail TO [WINDFALL\HPA] AS [dbo];
*/

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_rtr_Next_Detail_Allowed]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_rtr_Next_Detail_Allowed]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_rtr_Next_Detail_Allowed]
(
	@nID INT
	,@nDetail INT
)
RETURNS INT


AS
BEGIN

--SELECT dbo.f_rtr_Next_Detail_Allowed(10123,300);
--SELECT dbo.f_rtr_Next_Detail_Allowed(19033,300);

--SET @ID = ISNULL(@ID,0)
--SET @Detail = ISNULL(@Detail,0)

--IF @ID = 0 AND @Detail = 0
--	RETURN 0


DECLARE @NextDetail INT = @nDetail
DECLARE @FoundDetail INT = 0

SELECT TOP 1 @FoundDetail = ISNULL([Detail],0) 
	FROM dbo.rtr_Detail 
	WHERE rtr_ID = @nID
		AND Detail = @nDetail
		ORDER BY Detail 

IF @FoundDetail = 0	--did not find. Good to use.
	SET @NextDetail = @nDetail
ELSE
	begin

	SET @NextDetail = @nDetail

	while @FoundDetail < 1
		begin

		SELECT TOP 1 @FoundDetail = ISNULL([Detail],0) 
			FROM dbo.rtr_Detail 
			WHERE rtr_ID = @nID
				AND Detail = @NextDetail
				ORDER BY Detail 

		IF @FoundDetail = 0
			SET @NextDetail = @NextDetail + 1
		ELSE
			SET @FoundDetail = @NextDetail	--use so while @FoundDetail ends

		end
	end

RETURN @NextDetail


END
/*
GRANT EXECUTE ON [dbo].f_rtr_Next_Detail_Allowed TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].f_rtr_Next_Detail_Allowed TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].f_rtr_Next_Detail_Allowed TO [WINDFALL\HPA] AS [dbo];
*/

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_rtr_Next_Detail_Finish]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_rtr_Next_Detail_Finish]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_rtr_Next_Detail_Finish]
(
@ID INT
,@nLastDetail INT
)
RETURNS INT


AS
BEGIN

--SELECT dbo.f_rtr_Next_Detail_Finish(10123,300);

--SET @ID = ISNULL(@ID,0)
--SET @Detail = ISNULL(@Detail,0)

--IF @ID = 0 AND @Detail = 0
--	RETURN 0


DECLARE @NextDetail INT = 0
SELECT TOP 1 @NextDetail = ISNULL([Detail],0) 
	FROM dbo.rtr_Detail 
	WHERE rtr_ID = @ID
		AND ISNULL([Started],0) = 1
		AND ISNULL([Finished],0) = 0
		AND Detail > @nLastDetail
	ORDER BY Detail 

RETURN @NextDetail
END

/*
GRANT EXECUTE ON [dbo].f_rtr_Next_Detail_Finish TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].f_rtr_Next_Detail_Finish TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].f_rtr_Next_Detail_Finish TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_rtr_Next_Detail_Start]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_rtr_Next_Detail_Start]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_rtr_Next_Detail_Start]
(
@ID INT
,@nLastDetail INT
)
RETURNS INT


AS
BEGIN

--SELECT dbo.f_rtr_Next_Detail_Start(10123,300);

--SET @ID = ISNULL(@ID,0)
--SET @Detail = ISNULL(@Detail,0)

--IF @ID = 0 AND @Detail = 0
--	RETURN 0


DECLARE @NextDetail INT = 0
SELECT TOP 1 @NextDetail = ISNULL([Detail],0) 
	FROM dbo.rtr_Detail 
	WHERE rtr_ID = @ID
		AND ISNULL([Started],0) = 0 
		AND ISNULL([Finished],0) = 0
		AND Detail > @nLastDetail
	ORDER BY Detail 

RETURN @NextDetail


END
/*
GRANT EXECUTE ON [dbo].f_rtr_Next_Detail_Start TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].f_rtr_Next_Detail_Start TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].f_rtr_Next_Detail_Start TO [WINDFALL\HPA] AS [dbo];
*/

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_rtr_OrderNumber_OrderTypeId]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_rtr_OrderNumber_OrderTypeId]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[f_rtr_OrderNumber_OrderTypeId] 
(
@nOrderTypeId SmallInt,
@cOrderNumber CHAR(15)
)
--RETURNS correct OrderNumber where clause
RETURNS VarChar(255)
AS
BEGIN
--PRINT dbo.f_rtr_OrderNumber_OrderTypeId(1,1110)


DECLARE @cWhereStr VarChar(255) = ''''

--IF @nOrderTypeId <=0
--	print ''No @nOrderTypeId''
--ELSE
IF @nOrderTypeId = 1
	SET @cWhereStr = '' WO = ''+@cOrderNumber
ELSE
IF @nOrderTypeId = 2
	SET @cWhereStr = '' SalesNum = ''+@cOrderNumber
ELSE
IF @nOrderTypeId = 3
	SET @cWhereStr = '' POitem = ''+@cOrderNumber	--+ERP_2.dbo.f_ProperPOitem(''+@cOrderNumber+'')''
ELSE
IF @nOrderTypeId = 4
	SET @cWhereStr = '' SOitem = ''+@cOrderNumber	--+ERP_2.dbo.f_ProperSOitem(''+@cOrderNumber+'')''
ELSE
IF @nOrderTypeId = 5
	SET @cWhereStr = '' WO_Detail = ''+@cOrderNumber
ELSE
IF @nOrderTypeId = 6
	SET @cWhereStr = '' Maint = ''+@cOrderNumber
ELSE
IF @nOrderTypeId = 7
	SET @cWhereStr = '' HPAPO = ''+@cOrderNumber
ELSE
IF @nOrderTypeId = 8
	SET @cWhereStr = '' RMA = ''+@cOrderNumber
ELSE
IF @nOrderTypeId = 9
	SET @cWhereStr = '' RMA_Detail = ''+@cOrderNumber

RETURN @cWhereStr
END


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_rtr_OType_Num]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_rtr_OType_Num]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_rtr_OType_Num] 
(
@cOrderType CHAR(2),
@cOrderNumber CHAR(15)
)
--RETURNS correct OrderType + OrderNuber string
RETURNS VarChar(17)
AS
BEGIN
--PRINT dbo.f_rtr_OType_Num(''WO'',1110)
--PRINT dbo.f_rtr_OType_Num(''SI'','' 112123-01'')

DECLARE @cOType_Num Char(15) = ''''

IF @cOrderType = ''WO''
	SET @cOType_Num = ''WO''+@cOrderNumber
ELSE
IF @cOrderType = ''SO''
	SET @cOType_Num = ''SO''+@cOrderNumber
ELSE
IF @cOrderType = ''PI''
	SET @cOType_Num = ''PI''+@cOrderNumber
ELSE
IF @cOrderType = ''SI''
	SET @cOType_Num = ''SI''+@cOrderNumber
ELSE
IF @cOrderType = ''WD''
	SET @cOType_Num = ''WD''+@cOrderNumber
ELSE
IF @cOrderType = ''MT''
	SET @cOType_Num = ''MT''+@cOrderNumber
ELSE
IF @cOrderType = ''PO''
	SET @cOType_Num = ''PO''+@cOrderNumber
ELSE
IF @cOrderType = ''RA''
	SET @cOType_Num = ''RA''+@cOrderNumber
ELSE
IF @cOrderType = ''RD''
	SET @cOType_Num = ''RD''+@cOrderNumber

RETURN @cOType_Num
END


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_rtr_OType_Num_OrderTypeID]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_rtr_OType_Num_OrderTypeID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_rtr_OType_Num_OrderTypeID] 
(

@nOrderTypeID INT,
@cOrderNumber CHAR(15)
)
--RETURNS correct OrderType + OrderNuber string
--
RETURNS VarChar(17)
AS
BEGIN
--PRINT dbo.f_rtr_OType_Num(''WO'',1110)
--PRINT dbo.f_rtr_OType_Num(''SI'','' 112123-01'')

--CASE WHEN inserted.[OrderTypeID]=4 THEN inserted.OrderNumber ELSE '''' END AS SOitem
--	,CASE WHEN inserted.[OrderTypeID]=1 THEN inserted.OrderNumber ELSE 0 END AS WO
--	,CASE WHEN inserted.[OrderTypeID]=5 THEN inserted.OrderNumber ELSE 0 END AS WO_Detail
/*
OrderTypeId	TypeName	TypeAbr
1	WorkOrder	WO
2	Sales Order	SO
3	PO Item	PI
4	SO Item	SI
5	WO Detail	WD
6	Maintenance	MT
7	Purchase Order	PO
8	Return Merchandise Authorization	RA
9	RMA Detail	RD
*/
DECLARE @cOType_Num Char(15) = '''',
	@cType_Abr varchar(4) = '''';

SELECT @cType_Abr = [TypeAbr]
FROM [dbo].[OT_OrderType]
WHERE [OrderTypeId] = @nOrderTypeID

--SET @cOType_Num = (@cType_Abr + @cOrderNumber)

IF @nOrderTypeID = 1
	SET @cOType_Num = ''WO''+@cOrderNumber
ELSE
IF @nOrderTypeID = 2
	SET @cOType_Num = ''SO''+@cOrderNumber
ELSE
IF @nOrderTypeID = 3
	SET @cOType_Num = ''PI''+right(''            ''+ rtrim(@cOrderNumber), 12)
ELSE
IF @nOrderTypeID = 4
	SET @cOType_Num = ''SI''+right(''          ''+ rtrim(@cOrderNumber), 10)
ELSE
IF @nOrderTypeID = 5
	SET @cOType_Num = ''WD''+@cOrderNumber
ELSE
IF @nOrderTypeID = 6
	SET @cOType_Num = ''MT''+@cOrderNumber
ELSE
IF @nOrderTypeID = 7
	SET @cOType_Num = ''PO''+@cOrderNumber
ELSE
IF @nOrderTypeID = 8
	SET @cOType_Num = ''RA''+@cOrderNumber
ELSE
IF @nOrderTypeID = 9
	SET @cOType_Num = ''RD''+@cOrderNumber

RETURN @cOType_Num
END


--GRANT EXECUTE ON [dbo].[f_rtr_OType_Num_OrderTypeID] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_rtr_RelyOn_Start]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_rtr_RelyOn_Start]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_rtr_RelyOn_Start]
(
@ID INT
,@nLastDetail INT
)
RETURNS INT


AS
BEGIN

--SELECT dbo.f_rtr_RelyOn_Start(10123,300);

--SET @ID = ISNULL(@ID,0)
--SET @Detail = ISNULL(@Detail,0)

--IF @ID = 0 AND @Detail = 0
--	RETURN 0


DECLARE @NextDetail INT = 0
SELECT TOP 1 @NextDetail = ISNULL(Detail,0) 
	FROM dbo.rtr_Detail 
	WHERE rtr_ID = @ID
		AND ISNULL([Started],0) = 0 
		AND ISNULL([Finished],0) = 0
		AND Rely_On = @nLastDetail
	ORDER BY Detail DESC 

RETURN @NextDetail


END
/*
GRANT EXECUTE ON [dbo].f_rtr_RelyOn_Start TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].f_rtr_RelyOn_Start TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].f_rtr_RelyOn_Start TO [WINDFALL\HPA] AS [dbo];
*/

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_rtr_StdDetail_Oper_ID]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_rtr_StdDetail_Oper_ID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_rtr_StdDetail_Oper_ID] 
(
@Oper_ID INT

)
--SET @Detail = 0 --get from rtr_Operation StdDetail with Oper_ID
--RETURNS StdDetail
RETURNS INT
AS

BEGIN
--PRINT dbo.f_rtr_StdDetail_Oper_ID(500)

DECLARE @StdDetail INT = 0

SELECT TOP 1 @StdDetail = StdDetail 
	FROM dbo.rtr_Operation
	WHERE Oper_ID = @Oper_ID

	
RETURN ISNULL(@StdDetail,0)
END


/*
GRANT EXECUTE ON [dbo].[f_rtr_StdDetail_Oper_ID] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_rtr_StdDetail_Oper_ID] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_rtr_StdDetail_Oper_ID] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_rtrID_TrackID]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_rtrID_TrackID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_rtrID_TrackID] 
(
@TrackID INT

)
--RETURNS rtr ID that matches TrackingID
RETURNS BIGINT
AS

BEGIN
--PRINT dbo.f_rtrID-TrackID(34854)

DECLARE @rtrID BIGINT = 0,
		@OType_Num CHAR(15) = '''';

SELECT TOP(1) @OType_Num = dbo.f_rtr_OType_Num_OrderTypeID(ot.[OrderTypeID],ot.[OrderNumber])
FROM [dbo].[OT] ot
WHERE ot.TrackID = @TrackID

SELECT TOP 1 @rtrID = rtr.ID 
	FROM dbo.rtr 
	WHERE rtr.OType_Num = @OType_Num
	ORDER BY ID DESC

	----WHERE OType_Num = ''SI114377-01    ''

RETURN ISNULL(@rtrID,0)
END


/*
GRANT EXECUTE ON [dbo].[f_rtrID_TrackID] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_rtrID_TrackID] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_rtrID_TrackID] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_rtrID-TrackID]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_rtrID-TrackID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_rtrID-TrackID] 
(
@TrackID INT

)
--RETURNS rtr ID that matches TrackingID
RETURNS BIGINT
AS

BEGIN
--PRINT dbo.f_rtrID-TrackID(34854)

DECLARE @rtrID BIGINT = 0

SELECT TOP 1 @rtrID = rtr.ID 
	FROM dbo.rtr 
	INNER JOIN dbo.OT O ON rtr.OType_Num = dbo.[f_rtr_OType_Num_OrderTypeID]( O.OrderTypeID,O.OrderNumber)  --O.OType_Num
	WHERE O.TrackID = @TrackID
	ORDER BY ID DESC

	----WHERE OType_Num = ''SI114377-01    ''

RETURN ISNULL(@rtrID,0)
END


/*
GRANT EXECUTE ON [dbo].[f_rtrID-TrackID] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_rtrID-TrackID] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_rtrID-TrackID] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_SaleRep_Email_SO]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_SaleRep_Email_SO]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David Kirchner
-- Create date: 02/28/2020
-- Description:	Attempts to locate which sales person email address
-- =============================================
CREATE FUNCTION [dbo].[f_SaleRep_Email_SO]
(
	@nSO INT
)
RETURNS varchar(30)
AS
BEGIN

	--PRINT dbo.f_SaleRep_Email_SO(121372)
	--SELECT TOP 1 SalesP FROM dbo.AllQuotes WHERE SalesNum = 121372 
	--SELECT * FROM dbo.AppSetup WHERE PRP = ''SalesP'' AND ANS = ''O''
	--DELETE FROM dbo.AppSetup WHERE UN = ''David Hayes'' AND prp = ''SalesP''

	-- Declare the return variable here
	DECLARE @SP_Email varchar(30) = ''''
	DECLARE @SalesP CHAR(1) = ''''

	SELECT TOP 1 @SalesP=SalesP FROM dbo.AllQuotes WHERE SalesNum = @nSO
		AND LEN(SalesP)>0

	IF LEN(@SalesP)>0
		SELECT TOP 1 @SP_Email = ANS
			FROM dbo.AppSetup 
			WHERE PRP= ''E-mail'' 
			AND UN = (SELECT UN FROM dbo.AppSetup
					 WHERE PRP = ''SalesP'' 
					 AND ANS = @SalesP )
			
	RETURN TRIM( ISNULL(@SP_Email,'''') )

END
/*
GRANT EXECUTE ON [dbo].[f_SaleRep_Email_SO] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_SaleRep_Email_SO] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_SaleRep_Email_SO] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_SaleRep_Email_SP]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_SaleRep_Email_SP]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David Kirchner
-- Create date: 02/28/2020
-- Description:	Attempts to locate which sales person email address
-- =============================================
CREATE FUNCTION [dbo].[f_SaleRep_Email_SP]
(
	@cSalesP CHAR(1)
)
RETURNS varchar(30)
AS
BEGIN
	-- SET SP_Email = dbo.f_SaleRep_Email_SP(''D'')

	DECLARE @SP_Email varchar(30) = ''''
	--DECLARE @SalesP CHAR(1) = ''''

	SELECT TOP 1 @SP_Email = ANS
		FROM dbo.AppSetup 
		WHERE PRP= ''E-mail'' 
		AND UN = (SELECT UN FROM dbo.AppSetup
				 WHERE PRP = ''SalesP'' 
				 AND ANS = @cSalesP )
			
	RETURN TRIM( ISNULL(@SP_Email,'''') )

END
/*
GRANT EXECUTE ON [dbo].[f_SaleRep_Email_SP] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_SaleRep_Email_SP] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_SaleRep_Email_SP] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_SaleRep_SP]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_SaleRep_SP]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David Kirchner
-- Create date: 02/28/2020
-- Description:	Returns Sales Rep from SalesP
-- =============================================
CREATE FUNCTION [dbo].[f_SaleRep_SP]
(
	@cSP CHAR(1)
)
RETURNS varchar(30)
AS
BEGIN
	--SET @cSalesRep = dbo.f_SaleRep_SP(@cSalesP)
	 
	-- Declare the return variable here
	DECLARE @SalesRep VARCHAR(30) = ''''
	DECLARE @cSalesRep VARCHAR(30) = ''''

	IF LEN(@cSP)>0
		SELECT TOP 1 @SalesRep = UN 
			FROM dbo.AppSetup
			WHERE PRP = ''SalesP'' 
			AND ANS = @cSP 
			
	RETURN TRIM( ISNULL(@SalesRep,'''') )

END
/*
GRANT EXECUTE ON [dbo].[f_SaleRep_SP] TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].[f_SaleRep_SP] TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].[f_SaleRep_SP] TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Sales_for_Company_Year]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Sales_for_Company_Year]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David Kirchner
-- Create date: 2024 08 12
-- Description:	Company for Year
-- =============================================
CREATE FUNCTION [dbo].[f_Sales_for_Company_Year] 
(
    -- Add the parameters for the function here
    @cCompany CHAR(30), 
    @nYear SmallINT
)
--SELECT * FROM dbo.f_Sales_for_Company_Year(''SpaceX'',2023)
RETURNS  @rtnTable TABLE

(-- Add the column definitions for the TABLE variable here
 Company CHAR(30) NULL
,PO_num VARCHAR(20) NULL
,DescriptCL VARCHAR(100) NULL
,Descript VarCHAR(50) null
,LeadTime varchar(15) null
,SOitem CHAR(10) null
,QuoteDate Date null
,Q_Total Decimal(7,2) null
,cthk Decimal(6,3) null
,Form CHAR(2) null
,CC CHAR(1) null
,CL	CHAR(1) null
)

--Company,PO_num,DescriptCL,Descript,LeadTime,SOitem,QuoteDate,Q_Total,cthk,Form,CC,CL
AS
BEGIN
DECLARE @TempTable table (Company CHAR(30) NULL
						,PO_num VARCHAR(20) NULL
						,DescriptCL VARCHAR(100) NULL
						,Descript VarCHAR(50) null
						,LeadTime varchar(15) null
						,SOitem CHAR(10) null
						,QuoteDate DATE null
						,Q_Total Decimal(7,2) null
						,cthk Decimal(6,3) null
						,Form CHAR(2) null
						,CC CHAR(1) null
						,CL	CHAR(1) null )
-- SELECT * FROM dbo.f_Sales_for_Company_Year(''SpaceX'',2023)

/*IF @cCompany=''SpaceX''
	SET @cCompany = '' ''''SpaceX'''' OR Company = ''''Space X'''' ''
	--SET @cCompany = '' SpaceX'' OR NoNoiseName = ''SPACEEXPLORATIONTECHNOLOGIES  ''
*/

INSERT into @TempTable
	SELECT Company, PO_num, dbo.f_DescriptCL(Alloy,CC,CL,Form,Thck,Sz2,Sz3,Weight,RandLen) AS DescriptCL,Descript,LeadTime
	,SOitem
	-- PRINT CONVERT(INT, CONVERT(DATETIME,''2023-09-14 18:47:20.930''))
	--,CONVERT(INT, ''QuoteDate'') AS QuoteDate
	,QuoteDate
	,Q_Total,cthk,Form,CC,CL 
	FROM dbo.AllQuotes 
	--WHERE (Company = @cCompany )
	WHERE  NoNoiseName = dbo.f_NoNoiseName(@cCompany)
	--NoNoiseName = ''SPACEEXPLORATIONTECHNOLOGIES  ''
	AND YEAR(InqDate) >= @nYear 
	AND SalesNum > 0
	ORDER BY SOitem DESC

--This select returns data
insert into @rtnTable
	SELECT Company, PO_num, DescriptCL,Descript,LeadTime,SOitem,QuoteDate,Q_Total,cthk,Form,CC,CL 
	FROM @TempTable

return
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Sales_Item_P]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Sales_Item_P]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Sales_Item_P]
(
@SOitem CHAR(10)
)
RETURNS MONEY
AS
BEGIN
--SELECT dbo.f_Sales_Item_P('' 139170-01'')

--Return Item Sales Unit Price


DECLARE @nUnitCost MONEY = 0


SELECT @nUnitCost = S_P FROM dbo.Sales WITH(NOLOCK) WHERE SOitem = @SOitem

IF ISNULL(@nUnitCost,0) = 0
	SELECT @nUnitCost = S_P FROM dbo.AllQuotes WITH(NOLOCK) WHERE SOitem = @SOitem

IF ISNULL(@nUnitCost,0) = 0
	SELECT @nUnitCost = (Q_Total/ COALESCE([S_QTY],[Weight],[cWeight]) ) FROM dbo.AllQuotes WITH(NOLOCK) WHERE SOitem = @SOitem

--SELECT S_P FROM dbo.AllQuotes WITH(NOLOCK) WHERE SOitem = '' 139170-01''
--SELECT Q_Total/S_QTY FROM dbo.AllQuotes WITH(NOLOCK) WHERE SOitem = '' 139170-01''
--SELECT * FROM dbo.AllQuotes WITH(NOLOCK) WHERE SOitem = '' 139170-01''

RETURN ISNULL(@nUnitCost,0)
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Sales_Item_ShpPTot]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Sales_Item_ShpPTot]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Sales_Item_ShpPTot]
(
@SOitem CHAR(10)
)
RETURNS MONEY
AS
BEGIN
--SELECT dbo.f_Sales_Item_ShpPTot('' 139170-01'')

--Return Item Sales Unit Price


DECLARE @nUnitCost MONEY = 0

SELECT 
--TOP 1 
@nUnitCost = SUM(COALESCE(PT_QTY,[Weight]) * dbo.f_Sales_Item_P(@SOitem) ) FROM dbo.PackingSlip WHERE SOitem = @SOitem

--SELECT S_P FROM dbo.AllQuotes WITH(NOLOCK) WHERE SOitem = '' 139170-01''
--SELECT Q_Total/S_QTY FROM dbo.AllQuotes WITH(NOLOCK) WHERE SOitem = '' 139170-01''
--SELECT * FROM dbo.AllQuotes WITH(NOLOCK) WHERE SOitem = '' 139170-01''

RETURN ISNULL(@nUnitCost,0)
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Sales_ItemCost]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Sales_ItemCost]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Sales_ItemCost]
(
@GS_Cost Money,
@ItemCost Money,
@POCost Money,
@StkCost Money
)
RETURNS MONEY
AS
BEGIN
--SELECT dbo.f_Sales_ItemCost(0,0,3,0)
--SELECT dbo.f_Sales_ItemCost(Sales.GS_Cost,Sales.ItemCost,Sales.POCost,Sales.StkCost)
--Return Item Sales best Costing 

declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @nCost MONEY = 0


DECLARE @nPO_Stk_Cost MONEY

SELECT @GS_Cost = CASE WHEN @GS_Cost = 0 THEN NULL ELSE @GS_Cost END
SELECT @ItemCost = CASE WHEN @ItemCost = 0 THEN NULL ELSE @ItemCost END

SET @nPO_Stk_Cost = ISNULL(@POCost,0) + ISNULL(@StkCost,0)
SELECT @nPO_Stk_Cost = CASE WHEN @nPO_Stk_Cost = 0 THEN NULL ELSE @nPO_Stk_Cost END

SET @nCost = COALESCE(@GS_Cost, @ItemCost, @nPO_Stk_Cost)

RETURN ISNULL(@nCost,0)
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Sales_ItemSale]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Sales_ItemSale]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Sales_ItemSale]
(
@GS_Sale Money,
@ItemSale Money,
@Quoted_Total Money
)
RETURNS MONEY
AS
BEGIN
--SELECT dbo.f_Sales_ItemSales(0,1,3)
--SELECT dbo.f_Sales_ItemSales(Sales.GS_Sale,Sales.ItemSale,Sales.Quoted_Total)
--Return Item Sales best value 

declare @err int,
        @RC int

set @err = 0
set @rc = 0

DECLARE @nsale MONEY
SET @nSale = 0

SELECT @GS_Sale = CASE WHEN @GS_Sale = 0 THEN NULL ELSE @GS_Sale END
SELECT @ItemSale = CASE WHEN @ItemSale = 0 THEN NULL ELSE @ItemSale END
SELECT @Quoted_Total = CASE WHEN @Quoted_Total = 0 THEN NULL ELSE @Quoted_Total END

SET @nSale = COALESCE(@GS_Sale,@ItemSale,@Quoted_Total)

RETURN ISNULL(@nSale,0)
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Sales_TYP]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Sales_TYP]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_Sales_TYP] 
(
@cTYP CHAR(1)
)
RETURNS VARCHAR(10)
AS
BEGIN
	--SET NOCOUNT ON
	--SELECT dbo.f_Sales_TYP( ''I'' )
	
	
	--Sales Order Type: Stock, Broker, Mill, Production, Service

	DECLARE @cReturn VARCHAR(10)
	SET @cReturn = ''''
	
	IF @cTYP = ''I''
		SET @cReturn = ''Inventory''

	IF @cTYP = ''B''
		SET @cReturn = ''Broker ''

	IF @cTYP = ''M''
		SET @cReturn = ''Mill ''
		--Waiting for Mill
	IF @cTYP = ''P''
		SET @cReturn = ''Production ''
		--Order must wait for Forge Production
	IF @cTYP = ''S''
		SET @cReturn = ''Service ''
		--Order is for Customers material and HPA Cutting, Straightning, Machining Service
	IF @cTYP = ''C''
		SET @cReturn = ''Conversion ''
		--Order is for Customers material and Forging Conversion

	RETURN @cReturn

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_SalesNum_SOitem]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_SalesNum_SOitem]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

/****** Object:  User Defined Function dbo.ProperPO    Script Date: 10/17/2005 1:08:28 PM ******/

CREATE FUNCTION [dbo].[f_SalesNum_SOitem]
(
@SOitem CHAR(10)
)

RETURNS INT
-- 7 digit SO 
-- 2 Digit item
-- Return 0 for NULL
-- PRINT dbo.f_SalesNum_SOitem(''  10000-1'')
AS
BEGIN
DECLARE @SalesNum INT
DECLARE @vcSalesNum VARCHAR(20)

DECLARE @nTest INT
DECLARE @nTestOrderI INT

SET @SalesNum = 0

SET @nTest = CHARINDEX ( ''-'',@SOitem) 
IF @nTest > 0	
	begin
	SET @vcSalesNum = LTRIM( RTRIM( LEFT( @SOitem, CHARINDEX ( ''-'',@SOitem) -1 )))
	SET @nTestOrderI = CAST( @vcSalesNum AS Int )

	IF @nTestOrderI < 10000000	-- 7 digits are OK
		SET @SalesNum =  CAST( @vcSalesNum AS Int )
	ELSE
		SET @SalesNum = 0

	end
ELSE
	SET @SalesNum =  CAST( @vcSalesNum AS Int )

RETURN ISNULL(@SalesNum,0)
END






' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_SalesP_District_NoNoiseName]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_SalesP_District_NoNoiseName]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
Create FUNCTION [dbo].[f_SalesP_District_NoNoiseName] 
(
@cNoNoiseName VarChar(30)
)
RETURNS VarChar(10)

AS
BEGIN
--SELECT dbo.f_SalesP_District_NoNoiseName(''FASTENAL   '') AS Top10
 
DECLARE @cReturn VarChar(10)
SET @cReturn = ''''
DECLARE @cSalesP1 Char(1)
SET @cSalesP1 = ''''
DECLARE @cSalesP2 Char(1)
SET @cSalesP2 = ''''
DECLARE @cSalesP3 Char(1)
SET @cSalesP3 = ''''
DECLARE @cSalesP4 Char(1)
SET @cSalesP4 = ''''
DECLARE @cSalesP5 Char(1)
SET @cSalesP5 = ''''
DECLARE @cSalesP6 Char(1)
SET @cSalesP6 = ''''
DECLARE @cSalesP7 Char(1)
SET @cSalesP7 = ''''
DECLARE @cSalesP8 Char(1)
SET @cSalesP8 = ''''
DECLARE @cSalesP9 Char(1)
SET @cSalesP9 = ''''
DECLARE @cSalesP10 Char(1)
SET @cSalesP10 = ''''

SELECT TOP 1 @cSalesP1 = dbo.f_GetSalesP_State(ST)
	FROM dbo.ShipAddr
	WHERE NoNoiseName = @cNoNoiseName

IF LEN(@cSalesP1) > 0
	begin
	SET @cReturn = @cSalesP1

	SELECT TOP 1 @cSalesP2 = dbo.f_GetSalesP_State(ST)
		FROM dbo.ShipAddr
		WHERE NoNoiseName = @cNoNoiseName
		AND dbo.f_GetSalesP_State(ST) != @cSalesP1

	end

IF LEN(@cSalesP2) > 0
	begin
	SET @cReturn = @cReturn + @cSalesP2

	SELECT TOP 1 @cSalesP3 = dbo.f_GetSalesP_State(ST)
		FROM dbo.ShipAddr
		WHERE NoNoiseName = @cNoNoiseName
		AND dbo.f_GetSalesP_State(ST) != @cSalesP1
		AND dbo.f_GetSalesP_State(ST) != @cSalesP2

	end

IF LEN(@cSalesP3) > 0
	begin
	SET @cReturn = @cReturn + @cSalesP3

	SELECT TOP 1 @cSalesP4 = dbo.f_GetSalesP_State(ST)
		FROM dbo.ShipAddr
		WHERE NoNoiseName = @cNoNoiseName
		AND dbo.f_GetSalesP_State(ST) != @cSalesP1
		AND dbo.f_GetSalesP_State(ST) != @cSalesP2
		AND dbo.f_GetSalesP_State(ST) != @cSalesP3

	end

IF LEN(@cSalesP4) > 0
	begin
	SET @cReturn = @cReturn + @cSalesP4

	SELECT TOP 1 @cSalesP5 = dbo.f_GetSalesP_State(ST)
		FROM dbo.ShipAddr
		WHERE NoNoiseName = @cNoNoiseName
		AND dbo.f_GetSalesP_State(ST) != @cSalesP1
		AND dbo.f_GetSalesP_State(ST) != @cSalesP2
		AND dbo.f_GetSalesP_State(ST) != @cSalesP3
		AND dbo.f_GetSalesP_State(ST) != @cSalesP4

	end

IF LEN(@cSalesP5) > 0
	begin
	SET @cReturn = @cReturn + @cSalesP5

	SELECT TOP 1 @cSalesP6 = dbo.f_GetSalesP_State(ST)
		FROM dbo.ShipAddr
		WHERE NoNoiseName = @cNoNoiseName
		AND dbo.f_GetSalesP_State(ST) != @cSalesP1
		AND dbo.f_GetSalesP_State(ST) != @cSalesP2
		AND dbo.f_GetSalesP_State(ST) != @cSalesP3
		AND dbo.f_GetSalesP_State(ST) != @cSalesP4
		AND dbo.f_GetSalesP_State(ST) != @cSalesP5

	end

IF LEN(@cSalesP6) > 0
	begin
	SET @cReturn = @cReturn + @cSalesP6

	SELECT TOP 1 @cSalesP7 = dbo.f_GetSalesP_State(ST)
		FROM dbo.ShipAddr
		WHERE NoNoiseName = @cNoNoiseName
		AND dbo.f_GetSalesP_State(ST) != @cSalesP1
		AND dbo.f_GetSalesP_State(ST) != @cSalesP2
		AND dbo.f_GetSalesP_State(ST) != @cSalesP3
		AND dbo.f_GetSalesP_State(ST) != @cSalesP4
		AND dbo.f_GetSalesP_State(ST) != @cSalesP5
		AND dbo.f_GetSalesP_State(ST) != @cSalesP6

	end

IF LEN(@cSalesP7) > 0
	begin
	SET @cReturn = @cReturn + @cSalesP7

	SELECT TOP 1 @cSalesP8 = dbo.f_GetSalesP_State(ST)
		FROM dbo.ShipAddr
		WHERE NoNoiseName = @cNoNoiseName
		AND dbo.f_GetSalesP_State(ST) != @cSalesP1
		AND dbo.f_GetSalesP_State(ST) != @cSalesP2
		AND dbo.f_GetSalesP_State(ST) != @cSalesP3
		AND dbo.f_GetSalesP_State(ST) != @cSalesP4
		AND dbo.f_GetSalesP_State(ST) != @cSalesP5
		AND dbo.f_GetSalesP_State(ST) != @cSalesP6
		AND dbo.f_GetSalesP_State(ST) != @cSalesP7

	end

IF LEN(@cSalesP8) > 0
	begin
	SET @cReturn = @cReturn + @cSalesP8

	SELECT TOP 1 @cSalesP9 = dbo.f_GetSalesP_State(ST)
		FROM dbo.ShipAddr
		WHERE NoNoiseName = @cNoNoiseName
		AND dbo.f_GetSalesP_State(ST) != @cSalesP1
		AND dbo.f_GetSalesP_State(ST) != @cSalesP2
		AND dbo.f_GetSalesP_State(ST) != @cSalesP3
		AND dbo.f_GetSalesP_State(ST) != @cSalesP4
		AND dbo.f_GetSalesP_State(ST) != @cSalesP5
		AND dbo.f_GetSalesP_State(ST) != @cSalesP6
		AND dbo.f_GetSalesP_State(ST) != @cSalesP7
		AND dbo.f_GetSalesP_State(ST) != @cSalesP8

	end

IF LEN(@cSalesP9) > 0
	begin
	SET @cReturn = @cReturn + @cSalesP9

	SELECT TOP 1 @cSalesP10 = dbo.f_GetSalesP_State(ST)
		FROM dbo.ShipAddr
		WHERE NoNoiseName = @cNoNoiseName
		AND dbo.f_GetSalesP_State(ST) != @cSalesP1
		AND dbo.f_GetSalesP_State(ST) != @cSalesP2
		AND dbo.f_GetSalesP_State(ST) != @cSalesP3
		AND dbo.f_GetSalesP_State(ST) != @cSalesP4
		AND dbo.f_GetSalesP_State(ST) != @cSalesP5
		AND dbo.f_GetSalesP_State(ST) != @cSalesP6
		AND dbo.f_GetSalesP_State(ST) != @cSalesP7
		AND dbo.f_GetSalesP_State(ST) != @cSalesP8
		AND dbo.f_GetSalesP_State(ST) != @cSalesP9
	
	end

IF LEN(@cSalesP10) > 0
	SET @cReturn = @cReturn + @cSalesP10


RETURN @cReturn

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_SalesP_NoNoiseName]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_SalesP_NoNoiseName]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_SalesP_NoNoiseName] 
(
@cNoNoiseName VarChar(30)
)
RETURNS VarChar(10)

AS
BEGIN
--SELECT dbo.f_SalesP_NoNoiseName(''FASTENAL   '') AS Top10
 
DECLARE @cReturn VarChar(10)
SET @cReturn = ''''
DECLARE @cSalesP1 Char(1)
SET @cSalesP1 = ''''
DECLARE @cSalesP2 Char(1)
SET @cSalesP2 = ''''
DECLARE @cSalesP3 Char(1)
SET @cSalesP3 = ''''
DECLARE @cSalesP4 Char(1)
SET @cSalesP4 = ''''
DECLARE @cSalesP5 Char(1)
SET @cSalesP5 = ''''
DECLARE @cSalesP6 Char(1)
SET @cSalesP6 = ''''
DECLARE @cSalesP7 Char(1)
SET @cSalesP7 = ''''
DECLARE @cSalesP8 Char(1)
SET @cSalesP8 = ''''
DECLARE @cSalesP9 Char(1)
SET @cSalesP9 = ''''
DECLARE @cSalesP10 Char(1)
SET @cSalesP10 = ''''

SELECT TOP 1 @cSalesP1 = SalesP FROM dbo.SalesP_Customer
	WHERE NoNoiseName = @cNoNoiseName
	ORDER BY ID DESC 
	
IF LEN(@cSalesP1) > 0
	begin
	SET @cReturn = @cSalesP1

	SELECT TOP 1 @cSalesP2 = SalesP FROM dbo.SalesP_Customer
		WHERE NoNoiseName = @cNoNoiseName
		AND SalesP != @cSalesP1
	end

IF LEN(@cSalesP2) > 0
	begin
	SET @cReturn = @cReturn + @cSalesP2

	SELECT TOP 1 @cSalesP3 = SalesP FROM dbo.SalesP_Customer
		WHERE NoNoiseName = @cNoNoiseName
		AND SalesP != @cSalesP1 
		AND SalesP != @cSalesP2
	end

IF LEN(@cSalesP3) > 0
	begin
	SET @cReturn = @cReturn + @cSalesP3

	SELECT TOP 1 @cSalesP4 = SalesP FROM dbo.SalesP_Customer
		WHERE NoNoiseName = @cNoNoiseName
		AND SalesP != @cSalesP1 
		AND SalesP != @cSalesP2
		AND SalesP != @cSalesP3
	end

IF LEN(@cSalesP4) > 0
	begin
	SET @cReturn = @cReturn + @cSalesP4

	SELECT TOP 1 @cSalesP5 = SalesP FROM dbo.SalesP_Customer
		WHERE NoNoiseName = @cNoNoiseName
		AND SalesP != @cSalesP1 
		AND SalesP != @cSalesP2
		AND SalesP != @cSalesP3
		AND SalesP != @cSalesP4
	end

IF LEN(@cSalesP5) > 0
	begin
	SET @cReturn = @cReturn + @cSalesP5

	SELECT TOP 1 @cSalesP6 = SalesP FROM dbo.SalesP_Customer
		WHERE NoNoiseName = @cNoNoiseName
		AND SalesP != @cSalesP1 
		AND SalesP != @cSalesP2
		AND SalesP != @cSalesP3
		AND SalesP != @cSalesP4
		AND SalesP != @cSalesP5
	end

IF LEN(@cSalesP6) > 0
	begin
	SET @cReturn = @cReturn + @cSalesP6

	SELECT TOP 1 @cSalesP7 = SalesP FROM dbo.SalesP_Customer
		WHERE NoNoiseName = @cNoNoiseName
		AND SalesP != @cSalesP1 
		AND SalesP != @cSalesP2
		AND SalesP != @cSalesP3
		AND SalesP != @cSalesP4
		AND SalesP != @cSalesP5
		AND SalesP != @cSalesP6
	end

IF LEN(@cSalesP7) > 0
	begin
	SET @cReturn = @cReturn + @cSalesP7

	SELECT TOP 1 @cSalesP8 = SalesP FROM dbo.SalesP_Customer
		WHERE NoNoiseName = @cNoNoiseName
		AND SalesP != @cSalesP1 
		AND SalesP != @cSalesP2
		AND SalesP != @cSalesP3
		AND SalesP != @cSalesP4
		AND SalesP != @cSalesP5
		AND SalesP != @cSalesP6
		AND SalesP != @cSalesP7
	end

IF LEN(@cSalesP8) > 0
	begin
	SET @cReturn = @cReturn + @cSalesP8

	SELECT TOP 1 @cSalesP9 = SalesP FROM dbo.SalesP_Customer
		WHERE NoNoiseName = @cNoNoiseName
		AND SalesP != @cSalesP1 
		AND SalesP != @cSalesP2
		AND SalesP != @cSalesP3
		AND SalesP != @cSalesP4
		AND SalesP != @cSalesP5
		AND SalesP != @cSalesP6
		AND SalesP != @cSalesP7
		AND SalesP != @cSalesP8
	end

IF LEN(@cSalesP9) > 0
	begin
	SET @cReturn = @cReturn + @cSalesP9

	SELECT TOP 1 @cSalesP10 = SalesP FROM dbo.SalesP_Customer
		WHERE NoNoiseName = @cNoNoiseName
		AND SalesP != @cSalesP1 
		AND SalesP != @cSalesP2
		AND SalesP != @cSalesP3
		AND SalesP != @cSalesP4
		AND SalesP != @cSalesP5
		AND SalesP != @cSalesP6
		AND SalesP != @cSalesP7
		AND SalesP != @cSalesP8
		AND SalesP != @cSalesP9
	end

IF LEN(@cSalesP10) > 0
	SET @cReturn = @cReturn + @cSalesP10


RETURN @cReturn

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_SalesP_SOitem]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_SalesP_SOitem]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

/****** Object:  User Defined Function dbo.ProperPO    Script Date: 10/17/2005 1:08:28 PM ******/

Create FUNCTION [dbo].[f_SalesP_SOitem]
(
@SOitem CHAR(10)
)

RETURNS CHAR(1)
-- 7 digit SO 
-- 2 Digit item
-- Return 0 for NULL
-- PRINT dbo.f_SalesNum_SOitem(''  10000-1'')
AS
BEGIN
DECLARE @SalesP CHAR(1)
SET @SalesP = ''''

IF dbo.f_ProperSOitem(@SOitem) <> dbo.f_ProperSOitem('''')
	SELECT @SalesP = AQ.SalesP FROM dbo.AllQuotes AQ WITH(NOLOCK) WHERE AQ.SOitem = @SOitem

RETURN ISNULL(@SalesP,'''')
END


/*
GRANT EXECUTE ON [dbo].f_SalesP_SOitem TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].f_SalesP_SOitem TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].f_SalesP_SOitem TO [WINDFALL\HPA] AS [dbo];
*/


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_SalesPDescription]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_SalesPDescription]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_SalesPDescription] 
(
@SalesP char(1)
,@Cover char(1)
)

RETURNS CHAR(20)
AS
BEGIN
--SET NOCOUNT ON
--PRINT dbo.f_SalesPDescription(''Z'',''C'')
--PRINT dbo.f_SalesPDescription(''X'','''')

DECLARE @SpDescript AS VARCHAR(20)

IF LEN(LTRIM(@Cover)) > 0
	begin
	
	SELECT @SpDescript=[Un] FROM dbo.AppSetup WHERE [Prp] = ''SalesP'' AND [Ans] = @Cover AND [UN]!=[Ans] AND LEN([UN]) > 0
	
	IF @SalesP = ''0''
		SET @SpDescript = LEFT(@SpDescript,14) + '' Prodx''

	IF @SalesP = ''1''
		SET @SpDescript = LEFT(@SpDescript,14) + '' House''

	IF @SalesP = ''X''
		SET @SpDescript = LEFT(@SpDescript,14) + '' House''

	IF @SalesP = ''Z''
		SET @SpDescript = LEFT(@SpDescript,16) + '' Web''

	end
ELSE
	SELECT @SpDescript=[Un] FROM dbo.AppSetup WHERE [Prp] = ''SalesP'' AND [Ans] = @SalesP AND [UN]!=[Ans] AND LEN([UN]) > 0

RETURN @SpDescript
END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Selected_Stock]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Selected_Stock]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[f_Selected_Stock] 
(
@SOitem CHAR(10)
)

RETURNS VARCHAR(250)
AS
BEGIN
--PRINT dbo.f_Selected_Stock('' 129679-01'')
--SELECT dbo.f_Selected_Stock('' 129679-01'')
--TR11F  32% CGLMA/SPX 178, 150, 22, 64, Rc3759422-2RBAHPA G4771 

DECLARE @cReturn VarCHAR(300) = '' ''

SELECT TOP 1 @cReturn = LEFT(
 RTRIM(ISNULL(SD.[Location],''''))+'' ''
+RTRIM(ISNULL(SD.FloorStatus,''''))+'' ''
+RTRIM(ISNULL(SD.Class,''''))+'' ''
+RTRIM(ISNULL(SM.Cond,''''))+'' [''
+RTRIM(ISNULL(SM.Specs,''''))+''] Heat ''
+RTRIM(ISNULL(SM.Heat,''''))+'' ''
+RTRIM(ISNULL(SM.Lot,''''))+'''' 
,300)
FROM dbo.StockLst_Process SP 
inner JOIN dbo.StockLst_Detail SD ON SP.ID_Detail = SD.ID_Detail 
inner JOIN dbo.StockLst_Master SM ON SD.ID = SM.ID 

WHERE SP.SOitem = @SOitem
AND ( SP.Process_ID = ''SELECTED'' OR SP.Process_ID=''PARTSELECT'' )
 AND SP.AllowSub = ''N'' 

RETURN @cReturn
END


/*
GRANT EXECUTE ON [dbo].f_Selected_Stock TO [HPA_Service] AS [dbo];
GRANT EXECUTE ON [dbo].f_Selected_Stock TO [WINDFALL\HPA Reports] AS [dbo];
GRANT EXECUTE ON [dbo].f_Selected_Stock TO [WINDFALL\HPA] AS [dbo];
*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_SizeStandard]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_SizeStandard]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_SizeStandard] (
@nThickness DECIMAL(9,4)
)
RETURNS DECIMAL(9,3)
AS
--Name is backwards, use StandadSize

-- PRINT dbo.f_SizeStandard(.060)
-- Returns value from a Size case statement
-- Used in Reports for conformity
--
--Also See: f_StandardSize  -- Returns value from StandardSize table
--
-- Tables like NR:
--UPDATE dbo.NR_Sales_Summary SET Size=ERP_2.dbo.f_SizeStandard(Size) WHERE Size<>ERP_2.dbo.f_SizeStandard(Size)


--UPDATE dbo.NR_StockLst_Totals SET Size=ERP_2.dbo.f_SizeStandard(Size) WHERE Size<>ERP_2.dbo.f_SizeStandard(Size)
--    SQL Server Agent job [End of Month Stock Totals] EXEC dbo.p_StockLst_Make_Totals

--UPDATE ERP_2.dbo.StockLst_Mins SET Thck=dbo.f_SizeStandard(Thck) WHERE Thck<>dbo.f_SizeStandard(Thck)

--UPDATE ERP_2.dbo.AllQuotes SET StandardSize=dbo.f_SizeStandard(Thck) WHERE StandardSize<>dbo.f_SizeStandard(Thck)
--SELECT Thck,StandardSize,dbo.f_SizeStandard(Thck) FROM ERP_2.dbo.AllQuotes  WHERE StandardSize<>dbo.f_SizeStandard(Thck)
--

BEGIN

DECLARE @nSizeStandard NUMERIC(9,3)
SET @nSizeStandard = 0

--Find Thickness In Case statement
SET @nSizeStandard = 
CASE ROUND(@nThickness,10,3)
		WHEN 0.0108 THEN 0.011

		WHEN 0.02  THEN 0.020
--	    WHEN 0.03  THEN 0.031
--	    WHEN 0.030 THEN 0.031
--		WHEN 0.032 THEN 0.031
		WHEN 0.060 THEN 0.062 
		WHEN 0.061 THEN 0.062 
--		WHEN 0.0625 THEN 0.062
		WHEN 0.063 THEN 0.063
		WHEN 0.066 THEN 0.065
		WHEN 0.077 THEN 0.078
--		WHEN 0.0785 THEN 0.078
--		WHEN 0.0787 THEN 0.078
		WHEN 0.120 THEN 0.125
		WHEN 0.121 THEN 0.125
		WHEN 0.122 THEN 0.125
		WHEN 0.123 THEN 0.125
		WHEN 0.124 THEN 0.125
		WHEN 0.126 THEN 0.125
		WHEN 0.157 THEN 0.156
		WHEN 0.158 THEN 0.156
		WHEN 0.18  THEN 0.187
--		WHEN 0.1875 THEN 0.187
--		WHEN 0.1876 THEN 0.187
--		WHEN 0.1877 THEN 0.187
		WHEN 0.188 THEN 0.187
		WHEN 0.237 THEN 0.236
		WHEN 0.251 THEN 0.25
		WHEN 0.252 THEN 0.25
		WHEN 0.253 THEN 0.25
		WHEN 0.254 THEN 0.25
		WHEN 0.255 THEN 0.25
		WHEN 0.26 THEN 0.25
		WHEN 0.261 THEN 0.25
		WHEN 0.275 THEN 0.276
		WHEN 0.280 THEN 0.276
--		WHEN 0.3125 THEN 0.312
		WHEN 0.313 THEN 0.312
		WHEN 0.314 THEN 0.312
		WHEN 0.315 THEN 0.312
		--WHEN 0.344 THEN 0.343
		WHEN 0.373 THEN 0.375
		WHEN 0.374 THEN 0.375
		WHEN 0.376 THEN 0.375
		WHEN 0.377 THEN 0.375
		WHEN 0.393 THEN 0.394
		WHEN 0.395 THEN 0.394
		WHEN 0.396 THEN 0.394
		WHEN 0.395 THEN 0.396
		WHEN 0.438 THEN 0.437
--		WHEN 0.4380 THEN 0.437
		WHEN 0.452 THEN 0.450
		WHEN 0.453 THEN 0.450
		WHEN 0.472 THEN 0.475
		WHEN 0.495 THEN 0.500
		WHEN 0.501 THEN 0.500
		WHEN 0.502 THEN 0.500
		WHEN 0.503 THEN 0.500
		WHEN 0.56  THEN 0.562
--		WHEN 0.5625 THEN 0.562
		WHEN 0.563 THEN 0.562
		WHEN 0.626 THEN 0.625
		WHEN 0.627 THEN 0.625
		WHEN 0.628 THEN 0.625
		WHEN 0.629 THEN 0.625
		WHEN 0.630 THEN 0.625
		WHEN 0.631 THEN 0.625
		WHEN 0.632 THEN 0.625
		WHEN 0.688 THEN 0.687
		WHEN 0.755 THEN 0.75
		WHEN 0.752 THEN 0.75
		WHEN 0.780 THEN 0.787
		WHEN 0.781 THEN 0.787
		WHEN 0.788 THEN 0.787
		WHEN 0.811 THEN 0.812
--		WHEN 0.8125 THEN 0.812
		WHEN 0.813 THEN 0.812
		WHEN 0.825 THEN 0.826
		WHEN 0.827 THEN 0.826
--		WHEN 0.8661 THEN 0.867
		WHEN 0.871 THEN 0.875
		WHEN 0.872 THEN 0.875
		WHEN 0.873 THEN 0.875
		WHEN 0.874 THEN 0.875
		WHEN 0.879 THEN 0.875
		WHEN 0.880 THEN 0.875
		WHEN 0.9 THEN 0.93
		WHEN 1.001 THEN 1
--		WHEN 1.0625 THEN 1.062
		WHEN 1.065 THEN 1.062
		WHEN 1.119 THEN 1.125
		WHEN 1.120 THEN 1.125
		WHEN 1.121 THEN 1.125
		WHEN 1.122 THEN 1.125
		WHEN 1.123 THEN 1.125
		WHEN 1.124 THEN 1.125
		WHEN 1.126 THEN 1.125
		WHEN 1.127 THEN 1.125
		WHEN 1.128 THEN 1.125
		WHEN 1.13 THEN 1.312
		WHEN 1.131 THEN 1.312
		WHEN 1.182 THEN 1.181
		WHEN 1.258 THEN 1.25
		WHEN 1.261 THEN 1.26
		WHEN 1.27 THEN 1.26
--		WHEN 1.3125 THEN 1.312
		WHEN 1.31 THEN 1.312
		WHEN 1.313 THEN 1.312
		WHEN 1.317 THEN 1.312
		WHEN 1.377 THEN 1.375
		WHEN 1.38 THEN 1.375
		WHEN 1.504 THEN 1.5
		WHEN 1.51 THEN 1.5
		WHEN 1.561 THEN 1.562
		WHEN 1.563 THEN 1.562
		WHEN 1.752 THEN 1.75
		WHEN 1.755 THEN 1.75
		WHEN 1.762 THEN 1.75
		WHEN 1.969 THEN 2
		WHEN 2.013 THEN 2
		WHEN 2.047 THEN 2.04
		WHEN 2.097 THEN 2.125
		WHEN 2.255 THEN 2.25
		WHEN 2.26 THEN 2.25
		WHEN 2.36 THEN 2.363
		WHEN 2.362 THEN 2.363
		WHEN 2.3622 THEN 2.363
		WHEN 2.376 THEN 2.375
		WHEN 2.401 THEN 2.4
		WHEN 2.495 THEN 2.5
		WHEN 2.527 THEN 2.53
		WHEN 2.62 THEN 2.625
		WHEN 2.995 THEN 3.0
		WHEN 3.149 THEN 3.150
		WHEN 3.278 THEN 3.25
		WHEN 3.53 THEN 3.50
		WHEN 3.532 THEN 3.50
		WHEN 3.535 THEN 3.50
		WHEN 3.536 THEN 3.50
		--WHEN 3.60 THEN 3.50
		WHEN 3.63 THEN 3.625
--		WHEN 3.79 THEN 3.75
--		WHEN 3.794 THEN 3.75
--		WHEN 3.8 THEN 3.83
--		WHEN 3.93 THEN 3.937
		WHEN 4.252 THEN 4.250
		WHEN 5.041 THEN 5.0
		WHEN 5.04 THEN 5.0
		WHEN 5.51 THEN 5.5
		WHEN 5.54 THEN 5.5
		WHEN 5.543 THEN 5.5
		WHEN 6.108 THEN 6.0
		WHEN 6.52 THEN 6.5
		WHEN 7.072 THEN 7.0
		WHEN 7.51 THEN 7.50
		WHEN 8.76 THEN 8.75
		WHEN 9.138 THEN 9.125
		WHEN 10.118 THEN 10.125
		WHEN 10.126 THEN 10.125
		WHEN 12.006 THEN 12
		WHEN 12.007 THEN 12
		WHEN 12.175 THEN 12
		ELSE dbo.f_StandardSize(@nThickness) END

RETURN @nSizeStandard

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_SOitem_Prod_txt]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_SOitem_Prod_txt]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_SOitem_Prod_txt] (
@cSOitem CHAR(10)
)
RETURNS VARCHAR(100)
AS
-- PRINT dbo.f_SOitem_Prod_txt(120100-01)

BEGIN

Declare @cReturnText VARCHAR(100) = ''''

IF EXISTS( SELECT * FROM dbo.Sales WHERE SOitem = @cSOitem AND Typ = ''P'' )
	begin
	
	IF EXISTS( SELECT * FROM dbo.Sales WHERE SOitem = @cSOitem AND Typ=''P'' AND GFM = 1)
		SET @cReturnText = @cReturnText + ''GFM '';

	IF EXISTS( SELECT * FROM dbo.Sales WHERE SOitem=@cSOitem AND Typ=''P'' AND Roll=1 )
		SET @cReturnText = @cReturnText + ''Roll '';

	IF EXISTS( SELECT * FROM dbo.Sales WHERE SOitem = @cSOitem AND Typ=''P'' AND Press = 1)
		SET @cReturnText = @cReturnText + ''Press '';

	IF EXISTS( SELECT * FROM dbo.Sales WHERE SOitem = @cSOitem AND Typ=''P'' AND Mach = 1)
		SET @cReturnText = @cReturnText + ''Machined '';

	IF EXISTS( SELECT * FROM dbo.Sales WHERE SOitem = @cSOitem AND Typ=''P'' AND CG = 1)
		SET @cReturnText = @cReturnText + ''CG '';

	IF EXISTS( SELECT * FROM dbo.Sales WHERE SOitem = @cSOitem AND Typ=''P'' AND Plasma = 1)
		SET @cReturnText = @cReturnText + ''Plasma '';

	IF EXISTS( SELECT * FROM dbo.Sales WHERE SOitem = @cSOitem AND Typ=''P'' AND WJet = 1)
		SET @cReturnText = @cReturnText + ''WJet '';

	--Print @cReturnText;
	end
		

RETURN @cReturnText

END
--GRANT EXECUTE ON [dbo].[f_SOitem_Prod_txt] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_SOitem_Type]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_SOitem_Type]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_SOitem_Type] (
@cSOitem CHAR(10)
)
RETURNS CHAR(1)
AS
-- PRINT dbo.f_SO_Type(80555)
-- Returns value 

-- I Inv, B Broker, M Mill, P Production, S Service
BEGIN

DECLARE @cType CHAR(1)
SET @cType = ''I''

IF EXISTS( SELECT * FROM dbo.AllQuotes WHERE SOitem = @cSOitem AND Services=1 )
	begin
	SET @cType = ''S''
	GOTO END1
	end

IF EXISTS( SELECT * FROM dbo.Sales WHERE SOitem = @cSOitem AND
		 INV=1 )
	begin
	SET @cType = ''I''
	GOTO END1
	end

IF EXISTS( SELECT * FROM dbo.PurchaseOrder WHERE SOitem = @cSOitem AND Stock = ''No Stock'' )
	SET @cType = ''B''

IF EXISTS( SELECT * FROM dbo.Sales WHERE SOitem = @cSOitem AND
		( GFM=1 OR Roll=1 OR Press=1 OR MACH=1 )	)
	begin
	SET @cType = ''P''
	GOTO END1
	end


END1:

RETURN @cType

END' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_SOPoundsForMonth]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_SOPoundsForMonth]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2013 7 30
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_SOPoundsForMonth] 
(
	-- Add the parameters for the function here
	@month int
	,@year int
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @pounds float

	-- Add the T-SQL statements to compute the return value here
	SELECT @pounds = 
	(SELECT SUM(S.matlwt) AS Pounds
		FROM Sales AS s
			INNER JOIN Sales_No AS sn ON sn.salesnum = S.salesnum
		WHERE YEAR(s.shipped) = @year
			AND MONTH(s.shipped) = @month
			AND ISNULL(S.cncld,0) = 0
			AND ISNULL(S.cmplt,0) = 1)

	-- Return the result of the function
	RETURN @pounds

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_SOPoundsToDateForMonth]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_SOPoundsToDateForMonth]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2013 7 30
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_SOPoundsToDateForMonth]
(
	-- Add the parameters for the function here
	@month int
	,@year int
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @sales float

	-- Add the T-SQL statements to compute the return value here
	SELECT @sales = 
	(SELECT SUM(S.matlwt) AS Sales
		FROM Sales AS s
			INNER JOIN Sales_No AS sn ON sn.salesnum = S.salesnum
		WHERE YEAR(s.shipped) = @year
			AND MONTH(s.shipped) = @month
			AND s.shipped <= DATEADD(YEAR, @year - YEAR(GETDATE()), GETDATE())
			AND ISNULL(S.cncld,0) = 0
			AND ISNULL(S.cmplt,0) = 1)

	-- Return the result of the function
	RETURN @sales

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_SOPoundsToDateForYear]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_SOPoundsToDateForYear]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2013 7 30
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_SOPoundsToDateForYear]
(
	-- Add the parameters for the function here
	@year int
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @sales float

	-- Add the T-SQL statements to compute the return value here
	SELECT @sales = 
	(SELECT SUM(S.matlwt) AS Sales
		FROM Sales AS s
			INNER JOIN Sales_No AS sn ON sn.salesnum = S.salesnum
		WHERE YEAR(s.shipped) = @year
			AND s.shipped <= DATEADD(YEAR, @year - YEAR(GETDATE()), GETDATE())
			AND ISNULL(S.cncld,0) = 0
			AND ISNULL(S.cmplt,0) = 1)

	-- Return the result of the function
	RETURN @sales

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_SOSales3MonthMovingAvg]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_SOSales3MonthMovingAvg]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2013 7 31
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_SOSales3MonthMovingAvg]
(
	-- Add the parameters for the function here
	@month int
	,@year int
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @avg float

	-- Add the T-SQL statements to compute the return value here
	SELECT @avg =(	dbo.f_SOSalesForMonth
					(
						MONTH(DATEADD(MONTH,-3, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
						, YEAR(DATEADD(MONTH,-3, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
					)
					+
					dbo.f_SOSalesForMonth
					(
						MONTH(DATEADD(MONTH,-2, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
						, YEAR(DATEADD(MONTH,-2, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
					)
					+
					dbo.f_SOSalesForMonth
					(
						MONTH(DATEADD(MONTH,-1, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
						, YEAR(DATEADD(MONTH,-1, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
					)
					)/3

	-- Return the result of the function
	RETURN @avg

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_SOSales3MonthWeightedMovingAvg]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_SOSales3MonthWeightedMovingAvg]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2013 7 31
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_SOSales3MonthWeightedMovingAvg]
(
	-- Add the parameters for the function here
	@month int
	,@year int
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @avg float

	-- Add the T-SQL statements to compute the return value here
	SELECT @avg =	.40 * dbo.f_SOSalesForMonth
					(
						MONTH(DATEADD(MONTH,-3, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
						, YEAR(DATEADD(MONTH,-3, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
					)
					+
					.33 * dbo.f_SOSalesForMonth
					(
						MONTH(DATEADD(MONTH,-2, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
						, YEAR(DATEADD(MONTH,-2, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
					)
					+
					.27 * dbo.f_SOSalesForMonth
					(
						MONTH(DATEADD(MONTH,-1, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
						, YEAR(DATEADD(MONTH,-1, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
					)
					

	-- Return the result of the function
	RETURN @avg

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_SOSales4MonthMovingAvg]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_SOSales4MonthMovingAvg]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2013 7 31
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_SOSales4MonthMovingAvg]
(
	-- Add the parameters for the function here
	@month int
	,@year int
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @avg float

	-- Add the T-SQL statements to compute the return value here
	SELECT @avg =(	dbo.f_SOSalesForMonth
					(
						MONTH(DATEADD(MONTH,-4, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
						, YEAR(DATEADD(MONTH,-4, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
					)
					+
					dbo.f_SOSalesForMonth
					(
						MONTH(DATEADD(MONTH,-3, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
						, YEAR(DATEADD(MONTH,-3, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
					)
					+
					dbo.f_SOSalesForMonth
					(
						MONTH(DATEADD(MONTH,-2, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
						, YEAR(DATEADD(MONTH,-2, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
					)
					+
					dbo.f_SOSalesForMonth
					(
						MONTH(DATEADD(MONTH,-1, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
						, YEAR(DATEADD(MONTH,-1, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
					)
					)/4

	-- Return the result of the function
	RETURN @avg

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_SOSales4MonthWeightedMovingAvg]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_SOSales4MonthWeightedMovingAvg]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2013 7 31
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_SOSales4MonthWeightedMovingAvg]
(
	-- Add the parameters for the function here
	@month int
	,@year int
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @avg float

	-- Add the T-SQL statements to compute the return value here
	SELECT @avg =	.29 * dbo.f_SOSalesForMonth
					(
						MONTH(DATEADD(MONTH,-4, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
						, YEAR(DATEADD(MONTH,-4, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
					)
					+
					.26 * dbo.f_SOSalesForMonth
					(
						MONTH(DATEADD(MONTH,-3, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
						, YEAR(DATEADD(MONTH,-3, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
					)
					+
					.24 * dbo.f_SOSalesForMonth
					(
						MONTH(DATEADD(MONTH,-2, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
						, YEAR(DATEADD(MONTH,-2, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
					)
					+
					.21 * dbo.f_SOSalesForMonth
					(
						MONTH(DATEADD(MONTH,-1, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
						, YEAR(DATEADD(MONTH,-1, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
					)
					

	-- Return the result of the function
	RETURN @avg

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_SOSales5MonthMovingAvg]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_SOSales5MonthMovingAvg]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2013 7 31
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_SOSales5MonthMovingAvg]
(
	-- Add the parameters for the function here
	@month int
	,@year int
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @avg float

	-- Add the T-SQL statements to compute the return value here
	SELECT @avg =(	dbo.f_SOSalesForMonth
					(
						MONTH(DATEADD(MONTH,-5, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
						, YEAR(DATEADD(MONTH,-5, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
					)
					+
					dbo.f_SOSalesForMonth
					(
						MONTH(DATEADD(MONTH,-4, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
						, YEAR(DATEADD(MONTH,-4, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
					)
					+
					dbo.f_SOSalesForMonth
					(
						MONTH(DATEADD(MONTH,-3, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
						, YEAR(DATEADD(MONTH,-3, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
					)
					+
					dbo.f_SOSalesForMonth
					(
						MONTH(DATEADD(MONTH,-2, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
						, YEAR(DATEADD(MONTH,-2, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
					)
					+
					dbo.f_SOSalesForMonth
					(
						MONTH(DATEADD(MONTH,-1, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
						, YEAR(DATEADD(MONTH,-1, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
					)
					)/5

	-- Return the result of the function
	RETURN @avg

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_SOSales5MonthWeightedMovingAvg]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_SOSales5MonthWeightedMovingAvg]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2013 7 31
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_SOSales5MonthWeightedMovingAvg]
(
	-- Add the parameters for the function here
	@month int
	,@year int
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @avg float

	-- Add the T-SQL statements to compute the return value here
	SELECT @avg =	.25 * dbo.f_SOSalesForMonth
					(
						MONTH(DATEADD(MONTH,-5, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
						, YEAR(DATEADD(MONTH,-5, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
					)
					+
					.25 * dbo.f_SOSalesForMonth
					(
						MONTH(DATEADD(MONTH,-4, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
						, YEAR(DATEADD(MONTH,-4, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
					)
					+
					.20 * dbo.f_SOSalesForMonth
					(
						MONTH(DATEADD(MONTH,-3, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
						, YEAR(DATEADD(MONTH,-3, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
					)
					+
					.15 * dbo.f_SOSalesForMonth
					(
						MONTH(DATEADD(MONTH,-2, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
						, YEAR(DATEADD(MONTH,-2, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
					)
					+
					.15 * dbo.f_SOSalesForMonth
					(
						MONTH(DATEADD(MONTH,-1, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
						, YEAR(DATEADD(MONTH,-1, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
					)
					

	-- Return the result of the function
	RETURN @avg

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_SOSalesForecast5MonthWeightedMovingAvg]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_SOSalesForecast5MonthWeightedMovingAvg]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 
-- Description:	2013 8 1
-- =============================================
CREATE FUNCTION [dbo].[f_SOSalesForecast5MonthWeightedMovingAvg] 
(
	-- Add the parameters for the function here
	@month1Prior float
	,@month2Prior float
	,@month3Prior float
	,@month4Prior float
	,@month5Prior float
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @avg float

	-- Add the T-SQL statements to compute the return value here
	SELECT @avg =	.25 * @month1Prior
					+
					.25 * @month2Prior
					+
					.20 * @month3Prior
					+
					.15 * @month4Prior
					+
					.15 * @month5Prior
					

	-- Return the result of the function
	RETURN @avg

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_SOSalesForMonth]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_SOSalesForMonth]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2013 7 26
-- Description:	returns the sales for a certain month
-- =============================================
CREATE FUNCTION [dbo].[f_SOSalesForMonth] 
(
	-- Add the parameters for the function here
	@month int
	,@year int
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @sales float

	-- Add the T-SQL statements to compute the return value here
	SELECT @sales = 
	(SELECT SUM(S.itemsale) AS Sales
		FROM Sales AS s
			INNER JOIN Sales_No AS sn ON sn.salesnum = S.salesnum
		WHERE YEAR(s.shipped) = @year
			AND MONTH(s.shipped) = @month
			AND ISNULL(S.cncld,0) = 0
			AND ISNULL(S.cmplt,0) = 1)

	-- Return the result of the function
	RETURN @sales

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_SOSalesGetForecast]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_SOSalesGetForecast]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 
-- Description:	2013 8 1
-- =============================================
CREATE FUNCTION [dbo].[f_SOSalesGetForecast]
(
	-- Add the parameters for the function here
	@month int
	,@year int
	,@month1Prior float
	,@month2Prior float
	,@month3Prior float
	,@month4Prior float
	,@month5Prior float
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @forecast float

	-- Add the T-SQL statements to compute the return value here
	IF(CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1'' <= CONVERT(date,GETDATE()))
	BEGIN
		SET @forecast =	dbo.f_SOSales5MonthWeightedMovingAvg(@month, @year)
	END		
	ELSE
	BEGIN
		IF(DATEADD(MONTH, -1, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1'') < CONVERT(date,GETDATE()))
		BEGIN
			SET @month1Prior =	dbo.f_SOSalesForMonth(
													MONTH(DATEADD(MONTH, -1, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
													, YEAR(DATEADD(MONTH, -1, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
													)
		END		
		IF(DATEADD(MONTH, -2, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1'') < CONVERT(date,GETDATE()))
		BEGIN
			SET @month2Prior =	dbo.f_SOSalesForMonth(
													MONTH(DATEADD(MONTH, -2, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
													, YEAR(DATEADD(MONTH, -2, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
													)
		END		
		IF(DATEADD(MONTH, -3, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1'') < CONVERT(date,GETDATE()))
		BEGIN
			SET @month3Prior =	dbo.f_SOSalesForMonth(
													MONTH(DATEADD(MONTH, -3, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
													, YEAR(DATEADD(MONTH, -3, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
													)
		END		
		IF(DATEADD(MONTH, -4, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1'') < CONVERT(date,GETDATE()))
		BEGIN
			SET @month4Prior =	dbo.f_SOSalesForMonth(
													MONTH(DATEADD(MONTH, -4, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
													, YEAR(DATEADD(MONTH, -4, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
													)
		END		
		IF(DATEADD(MONTH, -5, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1'') < CONVERT(date,GETDATE()))
		BEGIN
			SET @month5Prior =	dbo.f_SOSalesForMonth(
													MONTH(DATEADD(MONTH, -5, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
													, YEAR(DATEADD(MONTH, -5, CONVERT(char(4),@year) + ''/'' + CONVERT(char(2),@month) + ''/1''))
													)
		END		
		SET @forecast =	dbo.f_SOSalesForecast5MonthWeightedMovingAvg(@month1Prior, @month2Prior, @month3Prior, @month4Prior, @month5Prior)
	END			

	-- Return the result of the function
	RETURN @forecast

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_SOSalesToDateForMonth]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_SOSalesToDateForMonth]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2013 7 30
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_SOSalesToDateForMonth] 
(
	-- Add the parameters for the function here
	@month int
	,@year int
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @sales float

	-- Add the T-SQL statements to compute the return value here
	SELECT @sales = 
	(SELECT SUM(S.itemsale) AS Sales
		FROM Sales AS s
			INNER JOIN Sales_No AS sn ON sn.salesnum = S.salesnum
		WHERE YEAR(s.shipped) = @year
			AND MONTH(s.shipped) = @month
			AND s.shipped <= DATEADD(YEAR, @year - YEAR(GETDATE()), GETDATE())
			AND ISNULL(S.cncld,0) = 0
			AND ISNULL(S.cmplt,0) = 1)

	-- Return the result of the function
	RETURN @sales

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_SOSalesToDateForYear]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_SOSalesToDateForYear]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2013 7 30
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_SOSalesToDateForYear] 
(
	-- Add the parameters for the function here
	@year int
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @sales float

	-- Add the T-SQL statements to compute the return value here
	SELECT @sales = 
	(SELECT SUM(S.itemsale) AS Sales
		FROM Sales AS s
			INNER JOIN Sales_No AS sn ON sn.salesnum = S.salesnum
		WHERE YEAR(s.shipped) = @year
			AND s.shipped <= DATEADD(YEAR, @year - YEAR(GETDATE()), GETDATE())
			AND ISNULL(S.cncld,0) = 0
			AND ISNULL(S.cmplt,0) = 1)

	-- Return the result of the function
	RETURN @sales

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_SoundexCompany]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_SoundexCompany]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[f_SoundexCompany]
(
@Company char(30)
)
RETURNS CHAR(12)
AS
BEGIN

--SELECT dbo.f_SoundexCompany (''AMERICAN STAINLESS CORP. '')
--SELECT dbo.f_SoundexCompany (''YYYYYYYYYYYYYYYYYYYYYYYYYYYYY '')

DECLARE @cReturn CHAR(12)

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @cReturn = ''''

SET @Company = ISNULL(@Company, '''')
SET @Company = LTRIM(@Company)

--Remove words that are not a significant part of name when only 3 parts are considered.
SET @Company = REPLACE(@Company,'' & '','' '')
SET @Company = REPLACE(@Company,''&'','' '')
SET @Company = REPLACE(@Company,'', INC. '','' '')
SET @Company = REPLACE(@Company,'', INC '','' '')
SET @Company = REPLACE(@Company,'',INC. '','' '')
SET @Company = REPLACE(@Company,'',INC '','' '')
SET @Company = REPLACE(@Company,'' INC. '','' '')
SET @Company = REPLACE(@Company,'' INC '','' '')

SET @Company = REPLACE(@Company,'', LLC. '','' '')
SET @Company = REPLACE(@Company,'', LLC '','' '')
SET @Company = REPLACE(@Company,'',LLC. '','' '')
SET @Company = REPLACE(@Company,'',LLC '','' '')
SET @Company = REPLACE(@Company,'' LLC. '','' '')
SET @Company = REPLACE(@Company,'' LLC '','' '')

SET @Company = REPLACE(@Company,'', CO. '','' '')
SET @Company = REPLACE(@Company,'', CO '','' '')
SET @Company = REPLACE(@Company,'',CO. '','' '')
SET @Company = REPLACE(@Company,'',CO '','' '')
SET @Company = REPLACE(@Company,'' CO. '','' '')
SET @Company = REPLACE(@Company,'' CO '','' '')
SET @Company = REPLACE(@Company,'' , '','' '')
SET @Company = REPLACE(@Company,'', '','' '')
SET @Company = REPLACE(@Company,''\'','' '')
SET @Company = REPLACE(@Company,''/'','' '')
SET @Company = REPLACE(@Company,'' + '','' '')
SET @Company = REPLACE(@Company,'' +'','' '')
SET @Company = REPLACE(@Company,''+'','' '')

--Check position to see if relevent
IF LEFT(@Company,1) = ''-''    --A begin ''-'' is not relavent
	SET @Company = REPLACE(@Company,''-'','''') 

SET @Company = REPLACE(@Company,''-'','' '')

--Remove Characters
SET @Company = REPLACE(@Company,''0'','''')
SET @Company = REPLACE(@Company,''1'','''')
SET @Company = REPLACE(@Company,''2'','''')
SET @Company = REPLACE(@Company,''3'','''')
SET @Company = REPLACE(@Company,''4'','''')
SET @Company = REPLACE(@Company,''5'','''')
SET @Company = REPLACE(@Company,''6'','''')
SET @Company = REPLACE(@Company,''7'','''')
SET @Company = REPLACE(@Company,''8'','''')
SET @Company = REPLACE(@Company,''9'','''')

SET @Company = REPLACE(@Company,''('','''')
SET @Company = REPLACE(@Company,'')'','''')
SET @Company = REPLACE(@Company,''. '','''')
SET @Company = REPLACE(@Company,''.'','''')
SET @Company = REPLACE(@Company,''`'','''')
SET @Company = REPLACE(@Company,''~'','''')
SET @Company = REPLACE(@Company,''!'','''')
SET @Company = REPLACE(@Company,''@'','''')
SET @Company = REPLACE(@Company,''#'','''')
SET @Company = REPLACE(@Company,''$'','''')
SET @Company = REPLACE(@Company,''%'','''')
SET @Company = REPLACE(@Company,''^'','''')
SET @Company = REPLACE(@Company,''&'','''')
SET @Company = REPLACE(@Company,''*'','''')
SET @Company = REPLACE(@Company,''_!'','''')
SET @Company = REPLACE(@Company,''='','''')
SET @Company = REPLACE(@Company,''+'','''')
SET @Company = REPLACE(@Company,'';'','''')
SET @Company = REPLACE(@Company,'':'','''')
SET @Company = REPLACE(@Company,''"'','''')
SET @Company = REPLACE(@Company,''{'','''')
SET @Company = REPLACE(@Company,''}'','''')
SET @Company = REPLACE(@Company,''['','''')
SET @Company = REPLACE(@Company,'']'','''')
SET @Company = REPLACE(@Company,''|'','''')

SET @Company = LTRIM(@Company) --Remove begining blanks again

DECLARE @nLen INT
SET @nLen = LEN(@Company)

IF @nLen < 30
	SET @Company = @Company + REPLICATE('' '',30-@nLen)
	
DECLARE @c1Name VARCHAR(30)
DECLARE @c2Name VARCHAR(30)
DECLARE @c3Name VARCHAR(30)

DECLARE @n1Space INT
DECLARE @n2Space INT
DECLARE @n3Space INT

SET @n1Space = CHARINDEX('' '',@Company)
IF @n1Space = 0 OR @n1Space = 30
	SELECT @n1Space = 10 

SET @c1Name = LEFT(@Company, @n1Space)
	
SET @n2Space = CHARINDEX('' '',@Company,@n1Space+1)
IF @n2Space = 0 OR @n2Space = 30
	SET @n2Space = 18

SET @c2Name = SUBSTRING (@Company, @n1Space+1, @n2Space-@n1Space )


SET @n3Space = CHARINDEX('' '',@Company,@n2Space+1)
IF @n3Space = 0 OR @n3Space = 30
	IF @n2Space < 24
		SET @n3Space = 24
	ELSE
		SET @n3Space = @n2Space + 1
		
SET @c3Name = SUBSTRING (@Company, @n2Space+1, @n3Space-@n2Space )
--PRINT @c1Name
--PRINT @c2Name
--PRINT @c3Name

SET @cReturn = SOUNDEX(@c1Name)+SOUNDEX(@c2Name)+SOUNDEX(@c3Name)
--PRINT ''Return Soundex:''+@cReturn

RETURN @cReturn
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_SPX_Gr]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_SPX_Gr]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_SPX_Gr] 
(
@cCC char(1),
@cCL CHAR(1),
@cDescript VARCHAR(50),
@cComments VarChar(MAX)
)
RETURNS TinyInt
AS
BEGIN

--SELECT dbo.f_SPX_Gr(@CC,@CL,@cDescript,@cComments)

DECLARE @SPX TinyInt = 0

IF @cCC=''S''
	begin
	IF @cCL = ''1''
		SET @SPX = 1
	ELSE
	IF @cCL = ''2''
		SET @SPX = 2
	ELSE
	IF @cCL = ''3''
		SET @SPX = 3
	ELSE
	IF @cCL = ''4''
		SET @SPX = 4
	ELSE
	IF @cCL = ''5''
		SET @SPX = 5
	ELSE
	IF @cCL = ''6''
		SET @SPX = 6
	
	IF @SPX>0
		RETURN (@SPX)

	end


-- CC is not ''S'' and CL not 1-5
-- ignore CC, check Descript

DECLARE @FoundSPX BIT = 0
IF @cDescript LIKE ''%SPX%''
	begin
	SET @FoundSPX = 1

	IF @cCL = ''1''
		SET @SPX = 1
	ELSE
	IF @cCL = ''2''
		SET @SPX = 2
	ELSE
	IF @cCL = ''3''
		SET @SPX = 3
	ELSE
	IF @cCL = ''4''
		SET @SPX = 4
	ELSE
	IF @cCL = ''5''
		SET @SPX = 5
	ELSE
	IF @cCL = ''6''
		SET @SPX = 6
	
	IF @SPX > 0
		RETURN (@SPX)

	end

--Exit if not SPX
--IF @FoundSPX = 0
--	RETURN 0

DECLARE @cGrade CHAR(5) = ''''
DECLARE @nGradeAt TinyInt = 0
DECLARE @nGradeNum TinyInt = 0

--Locate Grade
SET @nGradeAt =  CHARINDEX(''GRADE'',@cDescript)
IF @nGradeAt > 0 AND @FoundSPX = 1
	begin

	SET @cGrade = SUBSTRING ( @cDescript, @nGradeAt+6, 2 ) 
	SET @cGrade = LTRIM(RTRIM(@cGrade))

	IF LEN(@cGrade) > 0
		begin
		IF @cGrade like ''1%''
			SET @SPX = 1
		ELSE
		IF @cGrade like ''2%''
			SET @SPX = 2
		ELSE
		IF @cGrade like ''3%''
			SET @SPX = 3
		ELSE
		IF @cGrade like ''4%''
			SET @SPX = 4
		ELSE
		IF @cGrade like ''5%''
			SET @SPX = 5
		ELSE
		IF @cGrade like ''6%''
			SET @SPX = 6

		IF @SPX > 0
			RETURN (@SPX)


		end
		--ELSE
		-- Check Comments
		

	end

--
--Locate Grade
SET @nGradeAt =  CHARINDEX(''GR. '',@cDescript)
IF @nGradeAt > 0 AND @FoundSPX = 1
	begin

	SET @cGrade = SUBSTRING ( @cDescript, @nGradeAt+4, 2 ) 
	SET @cGrade = LTRIM(RTRIM(@cGrade))

	IF LEN(@cGrade) > 0
		begin
		IF @cGrade like ''1%''
			SET @SPX = 1
		ELSE
		IF @cGrade like ''2%''
			SET @SPX = 2
		ELSE
		IF @cGrade like ''3%''
			SET @SPX = 3
		ELSE
		IF @cGrade like ''4%''
			SET @SPX = 4
		ELSE
		IF @cGrade like ''5%''
			SET @SPX = 5
		ELSE
		IF @cGrade like ''6%''
			SET @SPX = 6
	
		IF @SPX > 0
			RETURN (@SPX)


		end
		--ELSE
		-- Check Comments
		

	end

--Locate Grade
SET @nGradeAt =  CHARINDEX(''GR '',@cDescript)
IF @nGradeAt > 0 AND @FoundSPX = 1
	begin

	SET @cGrade = SUBSTRING ( @cDescript, @nGradeAt+3, 2 ) 
	SET @cGrade = LTRIM(RTRIM(@cGrade))

	IF LEN(@cGrade) > 0
		begin
		IF @cGrade like ''1%''
			SET @SPX = 1
		ELSE
		IF @cGrade like ''2%''
			SET @SPX = 2
		ELSE
		IF @cGrade like ''3%''
			SET @SPX = 3
		ELSE
		IF @cGrade like ''4%''
			SET @SPX = 4
		ELSE
		IF @cGrade like ''5%''
			SET @SPX = 5
		ELSE
		IF @cGrade like ''6%''
			SET @SPX = 6
	
		IF @SPX > 0
			RETURN (@SPX)


		end
		--ELSE
		--check comments
		--	RETURN 0
	
	end

--Locate Grade
SET @nGradeAt =  CHARINDEX(''LEVEL'',@cDescript)
IF @nGradeAt > 0 AND @FoundSPX = 1
	begin

	SET @cGrade = SUBSTRING ( @cDescript, @nGradeAt+5, 2 ) 
	SET @cGrade = LTRIM(RTRIM(@cGrade))

	IF LEN(@cGrade) > 0
		begin
		IF @cGrade like ''1%''
			SET @SPX = 1
		ELSE
		IF @cGrade like ''2%''
			SET @SPX = 2
		ELSE
		IF @cGrade like ''3%''
			SET @SPX = 3
		ELSE
		IF @cGrade like ''4%''
			SET @SPX = 4
		ELSE
		IF @cGrade like ''5%''
			SET @SPX = 5
		ELSE
		IF @cGrade like ''6%''
			SET @SPX = 6
	
		IF @SPX > 0
			RETURN (@SPX)


		end
		--ELSE
		--Check Comments
			
	end

--------------------------------
--------------------------------
--------------------------------
-- CC is not ''S'' and CL not 1-5
-- ignore CC, checking comments

SET @FoundSPX = 0
IF @cComments LIKE ''%SPX%''
	begin
	SET @FoundSPX = 1

	IF @cCL = ''1''
		SET @SPX = 1
	ELSE
	IF @cCL = ''2''
		SET @SPX = 2
	ELSE
	IF @cCL = ''3''
		SET @SPX = 3
	ELSE
	IF @cCL = ''4''
		SET @SPX = 4
	ELSE
	IF @cCL = ''5''
		SET @SPX = 5
	ELSE
	IF @cCL = ''6''
		SET @SPX = 6
	
	IF @SPX > 0
		RETURN (@SPX)

	end

--------------------------------
--Exit if not SPX or Descript
IF @FoundSPX = 0
	RETURN 0

SET @cGrade = ''''
SET @nGradeAt = 0
SET @nGradeNum = 0

--Locate Grade
SET @nGradeAt =  CHARINDEX(''GRADE'',@cComments)
IF @nGradeAt > 0 SET @FoundSPX = 1
	begin

	SET @cGrade = SUBSTRING ( @cComments, @nGradeAt+6, 2 ) 
	--SET @nGradeNum = CAST(@cGrade AS TinyInt )
	--SET @nGradeNum = CONVERT(INT, REPLACE(@cGrade, CHAR(0), ''''))
	SET @cGrade = LTRIM(RTRIM(@cGrade))

	IF LEN(@cGrade) > 0
		begin
		IF @cGrade like ''1%''
			SET @SPX = 1
		ELSE
		IF @cGrade like ''2%''
			SET @SPX = 2
		ELSE
		IF @cGrade like ''3%''
			SET @SPX = 3
		ELSE
		IF @cGrade like ''4%''
			SET @SPX = 4
		ELSE
		IF @cGrade like ''5%''
			SET @SPX = 5
		ELSE
		IF @cGrade like ''6%''
			SET @SPX = 6
	
		IF @SPX > 0
			RETURN (@SPX)


		end
		ELSE
			RETURN 0

	end

--
--Locate Grade
SET @nGradeAt =  CHARINDEX(''GR. '',@cComments)
IF @nGradeAt > 0
	begin

	SET @cGrade = SUBSTRING ( @cComments, @nGradeAt+4, 2 ) 
	SET @cGrade = LTRIM(RTRIM(@cGrade))

	IF LEN(@cGrade) > 0
		begin
		IF @cGrade like ''1%''
			SET @SPX = 1
		ELSE
		IF @cGrade like ''2%''
			SET @SPX = 2
		ELSE
		IF @cGrade like ''3%''
			SET @SPX = 3
		ELSE
		IF @cGrade like ''4%''
			SET @SPX = 4
		ELSE
		IF @cGrade like ''5%''
			SET @SPX = 5
		ELSE
		IF @cGrade like ''6%''
			SET @SPX = 6
	
		IF @SPX > 0
			RETURN (@SPX)


		end
		ELSE
			RETURN 0
	end

--Locate Grade
SET @nGradeAt =  CHARINDEX(''GR '',@cComments)
IF @nGradeAt > 0
	begin

	SET @cGrade = SUBSTRING ( @cComments, @nGradeAt+3, 2 ) 
	SET @cGrade = LTRIM(RTRIM(@cGrade))

	IF LEN(@cGrade) > 0
		begin
		IF @cGrade like ''1%''
			SET @SPX = 1
		ELSE
		IF @cGrade like ''2%''
			SET @SPX = 2
		ELSE
		IF @cGrade like ''3%''
			SET @SPX = 3
		ELSE
		IF @cGrade like ''4%''
			SET @SPX = 4
		ELSE
		IF @cGrade like ''5%''
			SET @SPX = 5
		ELSE
		IF @cGrade like ''6%''
			SET @SPX = 6
	
		IF @SPX > 0
			RETURN (@SPX)


		end
		ELSE
			RETURN 0
	
	end

--Locate Grade
SET @nGradeAt =  CHARINDEX(''LEVEL'',@cComments)
IF @nGradeAt > 0
	begin

	SET @cGrade = SUBSTRING ( @cComments, @nGradeAt+5, 2 ) 
	--SET @nGradeNum = CAST(@cGrade AS TinyInt )
	--SET @nGradeNum = CONVERT(INT, REPLACE(@cGrade, CHAR(0), ''''))
	SET @cGrade = LTRIM(RTRIM(@cGrade))

	IF LEN(@cGrade) > 0
		begin
		IF @cGrade like ''1%''
			SET @SPX = 1
		ELSE
		IF @cGrade like ''2%''
			SET @SPX = 2
		ELSE
		IF @cGrade like ''3%''
			SET @SPX = 3
		ELSE
		IF @cGrade like ''4%''
			SET @SPX = 4
		ELSE
		IF @cGrade like ''5%''
			SET @SPX = 5
		ELSE
		IF @cGrade like ''6%''
			SET @SPX = 6
	
		IF @SPX > 0
			RETURN (@SPX)


		end
		ELSE
			RETURN 0

	end


RETURN @SPX

END
--GRANT EXECUTE ON [dbo].[f_SPX_Gr] TO [WINDFALL\HPA] AS [dbo];



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Standard_POCompany]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Standard_POCompany]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE Function [dbo].[f_Standard_POCompany]
(
@cCompany varchar(30)
)
RETURNS VarChar(30)
AS
-- PRINT dbo.f_Standard_POCompany('''')
-- Returns value from Standard

BEGIN

DECLARE @cStandardCompany VarChar(30)
SET @cStandardCompany = ''''

--Find Thickness used in PriceTable
SELECT @cStandardCompany = Company FROM dbo.NR_PurchaseOrder_Company WHERE AKA = @cCompany 

IF @cStandardCompany = ''''
	SET @cStandardCompany = @cCompany



RETURN @cStandardCompany

END
--GRANT EXECUTE ON [dbo].[f_StockLstIDform] TO [WINDFALL\HPA] AS [dbo];
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_StandardSize]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_StandardSize]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE Function [dbo].[f_StandardSize]
(
@nThickness DECIMAL(9,4)
)
RETURNS DECIMAL(9,3)
AS
-- PRINT dbo.f_StandardSize(.043)
-- Returns value from StandardSize table
-- also see:
-- dbo.f_SizeStandard(.060) Returns value from a Size case statement

BEGIN

DECLARE @nStandardSize NUMERIC(9,3)
SET @nStandardSize = 0

--Find Thickness used in PriceTable
SELECT @nStandardSize = thck FROM dbo.StandardSize WHERE Thck = @nThickness 

IF @nStandardSize = 0
begin
	DECLARE @nGreaterThan DECIMAL(9,3)
	DECLARE @nLessThan DECIMAL(9,3)

	SELECT @nGreaterThan = ISNULL(MIN(thck),0) FROM dbo.StandardSize WHERE Thck > @nThickness
	SELECT @nLessThan = ISNULL(MAX(thck),0) FROM dbo.StandardSize WHERE Thck < @nThickness
	
	--Get rid of over numbers
	IF @nLessThan = 0
		Return @nGreaterThan

	--Get rid of under numbers
	IF @nGreaterThan = 0
		RETURN @nLessThan

	DECLARE @nDiffOver DECIMAL(9,3)
	DECLARE @nDiffUnder DECIMAL(9,3)		

	SET @nDiffOver = @nGreaterThan - @nThickness
	SET @nDiffUnder = @nThickness - @nLessThan

	--Use the Lesser Number, unless only .002 less than nThickness
	IF @nThickness <= 1.5
		IF @nDiffOver <= .002 
			RETURN @nGreaterThan
		ELSE
			RETURN @nLessThan 

	IF @nThickness <= 3.5
		IF @nDiffOver <= .003
			RETURN @nGreaterThan
		ELSE
			RETURN @nLessThan 

	IF @nThickness <= 6.5
		IF @nDiffOver <= .005
			RETURN @nGreaterThan
		ELSE
			RETURN @nLessThan 

/*
	--IF Difference Over is less than twice Difference Under, Use the Greater Number
	IF @nDiffOver < @nDiffUnder*2
		RETURN @nGreaterThan

	--IF (2/3) the Difference Over is less than Difference Under, Use the GreaterNumber
	IF @nDiffOver*(2/3) < @nDiffUnder
		RETURN @nGreaterThan
	ELSE
		RETURN @nLessThan
*/

end


RETURN @nStandardSize

END
--GRANT EXECUTE ON [dbo].[f_StockLstIDform] TO [WINDFALL\HPA] AS [dbo];
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_StandardSize_AlloyForm]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_StandardSize_AlloyForm]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE Function [dbo].[f_StandardSize_AlloyForm]
(
@Alloy CHAR(12),
@Form CHAR(2),
@CC CHAR(1),
@CL CHAR(1),
@nThickness DECIMAL(9,4)
)

RETURNS DECIMAL(9,3)
AS
-- PRINT dbo.f_StandardSize_AlloyForm( @Alloy CHAR(12),@Form CHAR(2),@CC CHAR(1),@CL CHAR(1),@nThickness DECIMAL(9,4) )
-- PRINT dbo.f_StandardSize_AlloyForm(Alloy,Form,CC,CL,Thck)
-- pass CC=''1'', CL='''' to just get annealed sizes
-- Returns Standard Size value from PriceTable table
-- also see:
-- dbo.f_SizeStandard(.060) Returns value from a Size case statement

BEGIN

DECLARE @nStandardSize NUMERIC(9,3)
SET @nStandardSize = 0

--Find Thickness used in PriceTable
SELECT @nStandardSize = MIN(Size) FROM dbo.PriceTable 
	WHERE Alloy = @Alloy AND Form = @Form AND Size >= @nThickness 
	



RETURN @nStandardSize

END

--GRANT EXECUTE ON [dbo].[f_StandardSize_AlloyForm] TO [HPA_Service] AS [dbo];
--GRANT EXECUTE ON [dbo].[f_StandardSize_AlloyForm] TO [WINDFALL\HPA Reports] AS [dbo];
--GRANT EXECUTE ON [dbo].[f_StandardSize_AlloyForm] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_StandardSizeMinus]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_StandardSizeMinus]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE Function [dbo].[f_StandardSizeMinus]
(
@nThickness DECIMAL(9,4)
)
RETURNS DECIMAL(9,3)
AS
-- PRINT dbo.f_StandardSizeMinus(.043)
-- PRINT dbo.f_StandardSizeMinus(2.33)
-- SELECT MIN(thck) FROM dbo.StandardSize WHERE Thck >= 2.33
--SELECT * FROM dbo.StandardSize 
--SELECT DISTINCT size FROM dbo.PriceTable WHERE Alloy = ''HPA N60'' AND (Form = ''10'' or Form = ''20'') ORDER BY Size
-- Returns value from StandardSize table
-- also see:
-- dbo.f_SizeStandard(.060) Returns value from a Size case statement

BEGIN

DECLARE @nStandardSize NUMERIC(9,3)
SET @nStandardSize = 0

--Find Thickness used in PriceTable

SELECT @nStandardSize = MAX(thck) FROM dbo.StandardSize WHERE Thck <= @nThickness 
--PRINT CONCAT(''nStandardSize '',@nStandardSize)

IF @nStandardSize = 0
begin
	DECLARE @nLessThan DECIMAL(9,3)
	--DECLARE @nLessThan DECIMAL(9,3)
	SELECT @nLessThan = ISNULL(MAX(size),0) FROM dbo.PriceTable WHERE Alloy = ''HPA N60'' AND (Form = ''10'' or Form = ''20'') AND Size <= @nThickness
	--SELECT @nLessThan = ISNULL(MAX(thck),0) FROM dbo.StandardSize WHERE Thck <= @nThickness
	--SELECT @nLessThan = ISNULL(MAX(thck),0) FROM dbo.StandardSize WHERE Thck < @nThickness
	
	--Get rid of over numbers
	--IF @nLessThan = 0
		--Return @nLessThan

	--Get rid of under numbers
	--IF @nLessThan = 0
		--RETURN @nLessThan

	DECLARE @nDiffUnder DECIMAL(9,3)
	--DECLARE @nDiffUnder DECIMAL(9,3)		

	SET @nDiffUnder = @nThickness - @nLessThan
	--SET @nDiffUnder = @nThickness - @nLessThan

	--Use the Lesser Number, unless only .002 less than nThickness
	IF @nThickness <= 1.5
		IF @nDiffUnder <= .002 
			RETURN @nLessThan
		--ELSE
			--RETURN @nLessThan 

	IF @nThickness <= 3.5
		IF @nDiffUnder <= .003
			RETURN @nLessThan
		--ELSE
			--RETURN @nLessThan 

	IF @nThickness <= 6.5
		IF @nDiffUnder <= .005
			RETURN @nLessThan
		--ELSE
			--RETURN @nLessThan 


end
--GRANT EXECUTE ON [dbo].[f_StandardSizeMinus] TO [WINDFALL\HPA] AS [dbo];


RETURN @nStandardSize

END

--GRANT EXECUTE ON [dbo].[f_StandardSizeMinus] TO [HPA_Service] AS [dbo];
--GRANT EXECUTE ON [dbo].[f_StandardSizeMinus] TO [WINDFALL\HPA Reports] AS [dbo];
--GRANT EXECUTE ON [dbo].[f_StandardSizeMinus] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_StandardSizePlus]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_StandardSizePlus]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE Function [dbo].[f_StandardSizePlus]
(
@nThickness DECIMAL(9,4)
)
RETURNS DECIMAL(9,3)
AS
-- PRINT dbo.f_StandardSizePlus(.043)
-- PRINT dbo.f_StandardSizePlus(2.33)
-- SELECT MIN(thck) FROM dbo.StandardSize WHERE Thck >= 2.33
-- Returns value from StandardSize table
-- also see:
-- dbo.f_SizeStandard(.060) Returns value from a Size case statement
-- PRINT ERP_2.dbo.f_StandardSizePlus(.96)
-- SELECT ISNULL(MIN(PT.size),0) FROM dbo.PriceTable PT WHERE PT.Alloy = ''HPA N60'' AND (PT.Form = ''10'' or PT.Form = ''20'') AND PT.Size > .96
-- SELECT MIN(thck) FROM dbo.StandardSize WHERE Thck > .96
BEGIN

DECLARE @nStandardSize NUMERIC(9,3)
SET @nStandardSize = 0

--Find Thickness used in PriceTable
--SELECT @nStandardSize = MIN(thck) FROM dbo.StandardSize WHERE Thck > @nThickness 

--Find Thickness used in PriceTable
SELECT @nStandardSize = ISNULL(MIN(PT.size),0) FROM dbo.PriceTable PT WHERE PT.Alloy = ''HPA N60'' AND (PT.Form = ''10'' or PT.Form = ''20'') AND PT.Size > @nThickness

IF @nStandardSize = 0
begin
	DECLARE @nGreaterThan DECIMAL(9,3)
	--DECLARE @nLessThan DECIMAL(9,3)

	SELECT @nGreaterThan = MIN(thck) FROM dbo.StandardSize WHERE Thck > @nThickness 
	--SELECT @nGreaterThan = ISNULL(MIN(PT.size),0) FROM dbo.PriceTable PT WHERE PT.Alloy = ''HPA N60'' AND (PT.Form = ''10'' or PT.Form = ''20'') AND PT.Size > @nThickness
	--SELECT @nGreaterThan = ISNULL(MIN(thck),0) FROM dbo.StandardSize WHERE Thck >= @nThickness
	--SELECT @nLessThan = ISNULL(MAX(thck),0) FROM dbo.StandardSize WHERE Thck < @nThickness
	RETURN @nGreaterThan

/*	--Get rid of over numbers
	--IF @nLessThan = 0
		--Return @nGreaterThan

	--Get rid of under numbers
	--IF @nGreaterThan = 0
		--RETURN @nLessThan

	DECLARE @nDiffOver DECIMAL(9,3)
	--DECLARE @nDiffUnder DECIMAL(9,3)		

	SET @nDiffOver = 0 ---@nGreaterThan - @nThickness
	--SET @nDiffUnder = @nThickness - @nLessThan

	--Use the Lesser Number, unless only .002 less than nThickness
	IF @nThickness <= 1.5
		IF @nDiffOver <= .002 
			RETURN @nGreaterThan
		--ELSE
			--RETURN @nLessThan 

	IF @nThickness <= 3.5
		IF @nDiffOver <= .003
			RETURN @nGreaterThan
		--ELSE
			--RETURN @nLessThan 

	IF @nThickness <= 6.5
		IF @nDiffOver <= .005
			RETURN @nGreaterThan
		--ELSE
			--RETURN @nLessThan 
*/

end
--GRANT EXECUTE ON [dbo].[f_StockLstIDform] TO [WINDFALL\HPA] AS [dbo];


RETURN @nStandardSize

END' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_State_Sold]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_State_Sold]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_State_Sold] 
(
@nID INT
)
RETURNS char(2)
AS
BEGIN
--Returns State for InqNum

--SELECT dbo.f_State_Sold(2711258) AS State;

DECLARE @cState char(2) = '' ''
DECLARE @cNoNoiseName CHAR(30) = ''''
DECLARE @cCustID CHAR(20) = ''''

IF @nID = 0
	RETURN ''''

SELECT TOP 1 @cState = SA.St, @cNoNoiseName = AQ.NoNoiseName, @cCustID = AQ.CustID
FROM dbo.AllQuotes AQ WITH(NOLOCK) 
left outer JOIN dbo.Sales_No SN ON AQ.SalesNum = SN.SalesNum
left outer join dbo.ShipAddr SA ON SN.pshipaddr = SA.shipcode
WHERE AQ.ID = @nID

IF LEN(@cState) < 2 AND LEN(@cCustID) > 6
	SELECT TOP 1 @cState = CL.St
	FROM dbo.CUSTOMER_LIST CL WITH(NOLOCK) 
	WHERE CL.CustomerID = @cCustID


RETURN (@cState)
END

--GRANT EXECUTE ON [dbo].[f_StockLstIDform] TO [WINDFALL\HPA] AS [dbo];


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_StockLst_Master_ID_exist]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_StockLst_Master_ID_exist]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[f_StockLst_Master_ID_exist] 
(
@ID INT
)
RETURNS INT
--SELECT dbo.f_StockLst_Master_ID_exist(1000)
AS
BEGIN
DECLARE @nCount INT
SET @nCount=0

IF EXISTS(SELECT * FROM dbo.StockLst_Master WHERE ID = @ID)
	SET @nCount=1
	
RETURN (@nCount)
END

--GRANT EXECUTE ON [dbo].[f_StockLstIDform] TO [WINDFALL\HPA] AS [dbo];
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_StockLstIDform]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_StockLstIDform]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


Create FUNCTION [dbo].[f_StockLstIDform] 
(
@ID AS INT
)

RETURNS CHAR(2)
AS
BEGIN

DECLARE @Form AS CHAR(2)
DECLARE @nCount AS INT

SELECT @nCount = COUNT(*) FROM dbo.StockLst_Master WHERE ID = @ID

IF @nCount > 0
	SELECT @Form = Form FROM dbo.StockLst_Master WHERE ID = @ID
ELSE
	SELECT @Form = Form FROM dbo.Ar_StockLst_Master_History WHERE ID = @ID

RETURN @Form 
END




--GRANT EXECUTE ON [dbo].[f_StockLstIDform] TO [WINDFALL\HPA] AS [dbo];
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_SumSalesOrderSales]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_SumSalesOrderSales]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2015 10 14
-- Description: Sums the sales for a sales order
-- =============================================
CREATE FUNCTION [dbo].[f_SumSalesOrderSales] 
(
	-- Add the parameters for the function here
	@salesnum int
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result int

	-- Add the T-SQL statements to compute the return value here
	SELECT @Result = (SELECT SUM(sc.ItemSale) 
								FROM ERP_2.dbo.Sales sc 
								WHERE sc.SalesNum = @salesnum)

	-- Return the result of the function
	RETURN @Result

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_TableID_Detail_ReceivingID]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_TableID_Detail_ReceivingID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[f_TableID_Detail_ReceivingID]
(
@nReceivingID INT
)
RETURNS INT
AS
BEGIN
-- Returns StockLst or BrokerLst ID from ReceivingID

--SELECT dbo.f_TableID_ReceivingID(8001)
DECLARE @nTableID_Detail INT

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @nTableID_Detail = 0

SELECT TOP 1 @nTableID_Detail = (
	SELECT TOP 1 ID_Detail FROM dbo.StockLst_Detail WHERE ReceivingID = @nReceivingID
	UNION
	SELECT TOP 1 ID_Detail FROM dbo.BrokerLst_Detail WHERE ReceivingID = @nReceivingID
	UNION
	SELECT TOP 1 ID_Detail FROM dbo.StockLst_Process WHERE ReceivingID = @nReceivingID
	UNION
	SELECT TOP 1 ID_Detail FROM dbo.BrokerLst_Process WHERE ReceivingID = @nReceivingID

--	UNION
--	select ID_Detail from StockLst_Detail_History WHERE ReceivingID = @nReceivingID
--	UNION
--	select ID_Detail from BrokerLst_detail_history  WHERE ReceivingID = @nReceivingID
	 )



RETURN ISNULL(@nTableID_Detail,0)
END


--GRANT EXECUTE ON [dbo].[f_TableID_Detail_ReceivingID] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_TableID_ReceivingID]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_TableID_ReceivingID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[f_TableID_ReceivingID]
(
@nReceivingID INT
)
RETURNS INT
AS
BEGIN
-- Returns Lst ID from ReceivingID

--SELECT dbo.f_TableID_ReceivingID(21621)
DECLARE @nTableID INT

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @nTableID = 0

--SELECT TOP 1 @nTableID = (
--	SELECT TOP 1 ID from dbo.StockLst_Detail WHERE ReceivingID = @nReceivingID
--	UNION SELECT TOP 1 ID from dbo.BrokerLst_Detail WHERE ReceivingID = @nReceivingID )

IF EXISTS(SELECT * FROM dbo.StockLst_Detail WHERE ReceivingID = @nReceivingID)
	SELECT TOP 1 @nTableID=ID  FROM dbo.StockLst_Detail WHERE ReceivingID = @nReceivingID

IF EXISTS(SELECT * FROM dbo.BrokerLst_Detail WHERE ReceivingID = @nReceivingID)
	SELECT TOP 1 @nTableID=ID  FROM dbo.BrokerLst_Detail WHERE ReceivingID = @nReceivingID

IF EXISTS(SELECT * FROM dbo.WIPLst_Detail WHERE ReceivingID = @nReceivingID)
	SELECT TOP 1 @nTableID=ID  FROM dbo.WIPLst_Detail WHERE ReceivingID = @nReceivingID
	


RETURN ISNULL(@nTableID,0)
END

--GRANT EXECUTE ON [dbo].[f_TableID_ReceivingID] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_TableName_ReceivingID]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_TableName_ReceivingID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[f_TableName_ReceivingID]
(
@nReceivingID INT
)
RETURNS CHAR(1)
AS
BEGIN
-- Returns StockLst or BrokerLst name from ReceivingID

--SELECT dbo.f_TableName_ReceivingID(21621)
DECLARE @cTableName CHAR(1)

declare @err int,
        @RC int

set @err = 0
set @rc = 0

SET @cTableName = ''''

IF EXISTS(SELECT * FROM dbo.StockLst_Detail WHERE ReceivingID = @nReceivingID)
	SET @cTableName = ''S''

IF EXISTS(SELECT * FROM dbo.BrokerLst_Detail WHERE ReceivingID = @nReceivingID)
	SET @cTableName = ''B''

IF EXISTS(SELECT * FROM dbo.WIPLst_Detail WHERE ReceivingID = @nReceivingID)
	SET @cTableName = ''W''
	
RETURN @cTableName
END

--GRANT EXECUTE ON [dbo].[f_TableName_ReceivingID] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_udf_nthWeekDay]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_udf_nthWeekDay]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 12/11/2012
-- Description:	Useful for calculating holidays
-- =============================================
CREATE FUNCTION [dbo].[f_udf_nthWeekDay]
(
  @n       INT, 
  @weekDay CHAR(3),
  @year    INT, 
  @month   INT
)
RETURNS DATETIME
AS
BEGIN
  DECLARE @date    DATETIME,
    @dow         INT,
    @offset      INT,
    @wd          INT;
    
  SELECT @wd = CASE @weekDay
      WHEN ''SUN'' THEN 0
      WHEN ''MON'' THEN 1
      WHEN ''TUE'' THEN 2
      WHEN ''WED'' THEN 3
      WHEN ''THU'' THEN 4
      WHEN ''FRI'' THEN 5
      WHEN ''SAT'' THEN 6
    END,
    @date = CAST
    (
      CAST(@year AS VARCHAR(4)) +
      RIGHT
      (
        ''0'' + CAST
        (
          @month AS VARCHAR(2)
        ), 2
      ) +
      ''01'' AS DATETIME
    )
    , @dow = DATEPART(dw, @date)
    , @offset = @wd - @dow
    , @date = DATEADD(day, @offset + (@n - CASE WHEN @offset >= 0 THEN 1 ELSE 0 END) * 7, @date);
  RETURN @date;
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Vendor_QAType_Calibration]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Vendor_QAType_Calibration]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 12/21/2011
-- Description:	Decipher Calibration from QAType
-- =============================================
CREATE FUNCTION [dbo].[f_Vendor_QAType_Calibration] 
(
	-- Add the parameters for the function here
	@typeNum bigint
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result int

	-- Add the T-SQL statements to compute the return value here
	DECLARE @Calibration BIT
	SET @Calibration = 0
	DECLARE @MaterialTesting BIT
	SET @MaterialTesting = 0
	DECLARE @GageEquipment BIT
	SET @GageEquipment = 0
	DECLARE @Other BIT
	SET @Other = 0
	
	IF @typeNum >= 64
		begin
		SET @Other = 1
		SET @typeNum -= 64
		end
		
	IF @typeNum >= 32
		begin
		SET @GageEquipment = 1
		SET @typeNum -= 32
		end

	IF @typeNum >= 16
		begin
		SET @MaterialTesting = 1
		SET @typeNum -= 16
		end
		
	IF @typeNum >= 8
		begin
		SET @Calibration = 1
		SET @typeNum -= 8
		SELECT @Result = 1
		end
	ELSE
		begin
		SELECT @Result = 0
		end

	-- Return the result of the function
	RETURN @Result

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Vendor_QAType_Distibutor]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Vendor_QAType_Distibutor]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 12/21/2011
-- Description:	Decipher Distibutor from QAType
-- =============================================
CREATE FUNCTION [dbo].[f_Vendor_QAType_Distibutor] 
(
	-- Add the parameters for the function here
	@typeNum bigint
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result int

	-- Add the T-SQL statements to compute the return value here
	Declare @Distributor BIT
	SET @Distributor = 0
	DECLARE @Service BIT
	SET @Service = 0
	DECLARE @Calibration BIT
	SET @Calibration = 0
	DECLARE @MaterialTesting BIT
	SET @MaterialTesting = 0
	DECLARE @GageEquipment BIT
	SET @GageEquipment = 0
	DECLARE @Other BIT
	SET @Other = 0
	
	IF @typeNum >= 64
		begin
		SET @Other = 1
		SET @typeNum -= 64
		end
		
	IF @typeNum >= 32
		begin
		SET @GageEquipment = 1
		SET @typeNum -= 32
		end

	IF @typeNum >= 16
		begin
		SET @MaterialTesting = 1
		SET @typeNum -= 16
		end
		
	IF @typeNum >= 8
		begin
		SET @Calibration = 1
		SET @typeNum -= 8
		end

	IF @typeNum >= 4
		begin
		SET @Service = 1
		SET @typeNum -= 4
		end

	IF @typeNum >= 2
		begin
		SET @Distributor = 1
		SET @typeNum -= 2
		SELECT @Result = 1
		end
	ELSE
		begin
		SELECT @Result = 0
		end

	-- Return the result of the function
	RETURN @Result

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Vendor_QAType_GageEquipment]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Vendor_QAType_GageEquipment]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 12/21/2011
-- Description:	Decipher GageEquipment from QAType
-- =============================================
CREATE FUNCTION [dbo].[f_Vendor_QAType_GageEquipment] 
(
	-- Add the parameters for the function here
	@typeNum bigint
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result int

	-- Add the T-SQL statements to compute the return value here
	DECLARE @GageEquipment BIT
	SET @GageEquipment = 0
	DECLARE @Other BIT
	SET @Other = 0
	
	IF @typeNum >= 64
		begin
		SET @Other = 1
		SET @typeNum -= 64
		end
		
	IF @typeNum >= 32
		begin
		SET @GageEquipment = 1
		SET @typeNum -= 32
		SELECT @Result = 1
		end
	ELSE
		begin
		SELECT @Result = 0
		end

	-- Return the result of the function
	RETURN @Result

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Vendor_QAType_Manufacturer]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Vendor_QAType_Manufacturer]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 12/21/2011
-- Description:	Decipher manufacturer from QAType
-- =============================================
CREATE FUNCTION [dbo].[f_Vendor_QAType_Manufacturer] 
(
	-- Add the parameters for the function here
	@typeNum bigint
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result int

	-- Add the T-SQL statements to compute the return value here
	DECLARE @Manufacturer BIT
	SET @Manufacturer = 0
	Declare @Distributor BIT
	SET @Distributor = 0
	DECLARE @Service BIT
	SET @Service = 0
	DECLARE @Calibration BIT
	SET @Calibration = 0
	DECLARE @MaterialTesting BIT
	SET @MaterialTesting = 0
	DECLARE @GageEquipment BIT
	SET @GageEquipment = 0
	DECLARE @Other BIT
	SET @Other = 0
	
	IF @typeNum >= 64
		begin
		SET @Other = 1
		SET @typeNum -= 64
		end
		
	IF @typeNum >= 32
		begin
		SET @GageEquipment = 1
		SET @typeNum -= 32
		end

	IF @typeNum >= 16
		begin
		SET @MaterialTesting = 1
		SET @typeNum -= 16
		end
		
	IF @typeNum >= 8
		begin
		SET @Calibration = 1
		SET @typeNum -= 8
		end

	IF @typeNum >= 4
		begin
		SET @Service = 1
		SET @typeNum -= 4
		end

	IF @typeNum >= 2
		begin
		SET @Distributor = 1
		SET @typeNum -= 2
		end

	IF @typeNum >= 1
		begin
		SET @Manufacturer = 1
		SET @typeNum -= 1
		SELECT @Result = 1
		end
	ELSE
		begin
		SELECT @Result = 0
		end

	-- Return the result of the function
	RETURN @Result

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Vendor_QAType_MaterialTesting]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Vendor_QAType_MaterialTesting]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 12/21/2011
-- Description:	Decipher MaterialTesting from QAType
-- =============================================
CREATE FUNCTION [dbo].[f_Vendor_QAType_MaterialTesting] 
(
	-- Add the parameters for the function here
	@typeNum bigint
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result int

	-- Add the T-SQL statements to compute the return value here
	DECLARE @MaterialTesting BIT
	SET @MaterialTesting = 0
	DECLARE @GageEquipment BIT
	SET @GageEquipment = 0
	DECLARE @Other BIT
	SET @Other = 0
	
	IF @typeNum >= 64
		begin
		SET @Other = 1
		SET @typeNum -= 64
		end
		
	IF @typeNum >= 32
		begin
		SET @GageEquipment = 1
		SET @typeNum -= 32
		end

	IF @typeNum >= 16
		begin
		SET @MaterialTesting = 1
		SET @typeNum -= 16
		SELECT @Result = 1
		end
	ELSE
		begin
		SELECT @Result = 0
		end

	-- Return the result of the function
	RETURN @Result

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Vendor_QAType_Other]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Vendor_QAType_Other]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 12/21/2011
-- Description:	Decipher Other from QAType
-- =============================================
CREATE FUNCTION [dbo].[f_Vendor_QAType_Other] 
(
	-- Add the parameters for the function here
	@typeNum bigint
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result int

	-- Add the T-SQL statements to compute the return value here
	DECLARE @Other BIT
	SET @Other = 0
	
	IF @typeNum >= 64
		begin
		SET @Other = 1
		SET @typeNum -= 64
		SELECT @Result = 1
		end
	ELSE
		begin
		SELECT @Result = 0
		end

	-- Return the result of the function
	RETURN @Result

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Vendor_QAType_Service]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Vendor_QAType_Service]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 12/21/2011
-- Description:	Decipher Service from QAType
-- =============================================
CREATE FUNCTION [dbo].[f_Vendor_QAType_Service] 
(
	@typeNum bigint
)
RETURNS int
AS
BEGIN

	DECLARE @Result int

	DECLARE @Service BIT = 0
	DECLARE @Calibration BIT = 0
	DECLARE @MaterialTesting BIT = 0
	DECLARE @GageEquipment BIT = 0
	DECLARE @Other BIT = 0
	
	IF @typeNum >= 64
		begin
		SET @Other = 1
		SET @typeNum -= 64
		end
		
	IF @typeNum >= 32
		begin
		SET @GageEquipment = 1
		SET @typeNum -= 32
		end

	IF @typeNum >= 16
		begin
		SET @MaterialTesting = 1
		SET @typeNum -= 16
		end
		
	IF @typeNum >= 8
		begin
		SET @Calibration = 1
		SET @typeNum -= 8
		end

	IF @typeNum >= 4
		begin
		SET @Service = 1
		SET @typeNum -= 4
		SELECT @Result = 1
		end
	ELSE
		begin
		SELECT @Result = 0
		end

	RETURN @Result

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_VendorApprovalNote]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_VendorApprovalNote]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2015 08 10
-- Description:	
--
-- UPDATED:		05/19/2018 - Added a check for if the vendor is registered, for the requirement for filesOK
-- =============================================
CREATE FUNCTION [dbo].[f_VendorApprovalNote] 
(
	-- Add the parameters for the function here
	@vendCode int
)
RETURNS nvarchar(150)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @customAppr smallint = 0
		,@inActive bit = 0
		,@customApprNote nvarchar(150) = ''''
		,@vqsAppr bit = 0
		,@conflictBound bit = 0
		,@conflictAppr bit = 0
		,@hasConflictMineralsFile bit = 0
		,@filesOK bit = 0
		,@Registered bit = 0
		,@calcApprNote nvarchar(150) = ''''
		,@parentCompany int = null
		,@useParentCompany bit = 0
		,@VQS_NotRequired bit = 0
		,@TwoYearCutoff datetime = DATEADD(YEAR, -2, GETDATE())
		,@lastSurveyDate datetime
		,@minDate datetime = CONVERT(DATETIME, -53690)

	-- Add the T-SQL statements to compute the return value here
	declare MyCursor cursor STATIC for 
		SELECT TOP 1000 ISNULL(v.QAApproved, 0) as [Custom Approved]
				, ISNULL(v.Inactive, 0) as [InActive]
				, ISNULL(v.QAApprovalNotes, '''') as [Custom Approval Notes]
				, ISNULL(vqs.Approved, 0) as [VQS Approved]
				, dbo.f_AreCertsValid(v.VendCode) as FilesOK
				, vqs.[Registered] as Registered
				, v.[subsidiary of]
				, v.[Use_Parent_Files]
				, v.[VQS_NotRequired]
				, ISNULL(v.[QASurveyDate], @minDate) as [QASurveyDate]
			FROM [dbo].[Vendor] v
			LEFT OUTER JOIN ERP_2.dbo.VendorQualitySurvey vqs on v.VendCode = vqs.VendCode
			LEFT OUTER JOIN ERP_2.dbo.VendorConflictMineralsFree vcmf on v.VendCode = vcmf.VendCode
			WHERE v.VendCode = @vendCode
	open MyCursor
	FETCH NEXT FROM MyCursor INTO @customAppr, @inActive, @customApprNote, @vqsAppr, @filesOK, @Registered, @parentCompany, @useParentCompany, @VQS_NotRequired, @lastSurveyDate
	while @@FETCH_STATUS = 0 
	begin
		SET @calcApprNote = ''''

		IF (@customAppr != 0)
		BEGIN
			SET @calcApprNote = @customApprNote;
		END

		ELSE IF (@parentCompany IS NOT NULL AND ISNULL(@useParentCompany, 0) = 1)
		BEGIN
			SET @calcApprNote = [dbo].[f_VendorApprovalNote](@parentCompany);
		END

		-- If the Vendor is not a Metal vendor, they are used for misc purchases such as PC''s and do not follow the QMS process for the products we sell.
		ELSE IF (@VQS_NotRequired = 1) 
		BEGIN
			SET @calcApprNote = ''Used for MISC purchases and is not part of QMS.''
		END

		ELSE
		BEGIN
			-- If the Vendor is "Inactive", they are unapproved and require a new VQS to be completed before they can start the process to become Active and Approved.
			IF (@inActive = 1) 
			BEGIN
				SET @calcApprNote = ''''''Inactive'''' requires a VQS to be completed to be reactivated.''
			END

			ELSE IF (@lastSurveyDate < @TwoYearCutoff OR @vqsAppr != 1)
			BEGIN
				SET @calcApprNote = ''Has not provided an up-to-date Vendor Quality Survey.'';
			END
			
			ELSE IF (@filesOK = 0 AND @Registered = 1)
			BEGIN
				SET @calcApprNote = ''Has not provided an up-to-date certificate or file.'';
			END
		END
		break;
		FETCH NEXT FROM MyCursor INTO @customAppr, @inActive, @customApprNote, @vqsAppr, @filesOK, @Registered, @parentCompany, @useParentCompany, @VQS_NotRequired, @lastSurveyDate
	end
	close MyCursor
	DEALLOCATE MyCursor

	--SELECT @calcApprNote as ''Calculated Approval Note''

	-- Return the result of the function
	RETURN @calcApprNote

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_Who_Held_SOitem]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Who_Held_SOitem]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Brandon van de Venter
-- Create date: 05/13/2020
-- Description:	Checks if a SOitem has been held and returns who held
-- =============================================
CREATE FUNCTION [dbo].[f_Who_Held_SOitem] 
(
	-- Add the parameters for the function here
	@SOitem char(12)
)
RETURNS varchar(255)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @holdPerson varchar(255) = null;

	SELECT TOP(1) @holdPerson = s2.Who
	FROM [dbo].[Sales_Hold_Status] as s
	CROSS APPLY
	(
		SELECT TOP(1) Hold_Value, [When], [Who]
		FROM [dbo].[Sales_Hold_Status] AS s2
		WHERE s2.SOitem = s.SOitem AND s2.Hold_Type = s.Hold_Type
		order by s2.[When] desc
	) AS s2
	where SOitem = @SOitem
	AND UPPER(LTRIM(RTRIM(Hold_Type))) != ''PO''
	AND s2.Hold_Value = 1

	-- Return the result of the function
	RETURN @holdPerson

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_WIPLstIDform]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_WIPLstIDform]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


Create FUNCTION [dbo].[f_WIPLstIDform] 
(
@ID AS INT
)

RETURNS CHAR(2)
AS
BEGIN

DECLARE @Form AS CHAR(2)
DECLARE @nCount AS INT

SELECT @nCount = COUNT(*) FROM dbo.WIPLst_Master WHERE ID = @ID

IF @nCount > 0
	SELECT @Form = Form FROM dbo.WIPLst_Master WHERE ID = @ID
ELSE
	SELECT @Form = Form FROM dbo.Ar_WIPLst_Master_History WHERE ID = @ID

RETURN @Form 
END


--GRANT EXECUTE ON [dbo].[f_WIPLstIDform] TO [WINDFALL\HPA] AS [dbo];


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_YearMn]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_YearMn]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David Kirchner
-- Create date: 2015 11 11
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[f_YearMn] 
(
	@DateTime AS DateTime
)
RETURNS Int
AS
BEGIN
--Returns year*100 and month value
--PRINT dbo.f_get_Year_Month( GETDATE() )
-- 202001 YEARMO
-- Also see f_get_Year_Month

-- Declare the return variable here
DECLARE @nReturn Int
DECLARE @nYear SmallInt
DECLARE @nMonth SmallInt
SET @nYear = YEAR( @DateTime )
SET @nMonth = Month( @DateTime )

SET @nReturn = @nYear * 100 + @nMonth

RETURN ISNULL(@nReturn,0)

END

--GRANT EXECUTE ON [dbo].[f_YearMn] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_YearQuarter]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_YearQuarter]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
Create FUNCTION [dbo].[f_YearQuarter] 
(
@dDateTime DateTime
)
RETURNS NUMERIC(5)
AS
BEGIN
--PRINT dbo.[f_YearQuarter](GetDate())

DECLARE @nYearQuarter NUMERIC(5)

SELECT @nYearQuarter = DATENAME(year, @dDateTime) * 10 + DATENAME(quarter, @dDateTime) 

RETURN @nYearQuarter
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_StringToTable]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_StringToTable]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fn_StringToTable] (@String varchar(100))
RETURNS @Values TABLE (ID int primary key)
AS
BEGIN
/*
You would execute this function, 
passing it a comma-delimited string like this: 

SELECT * FROM fn_StringToTable( ''100, 200, 333, 444, 555'') 

Now you can join this table to any other table, view, or table UDF, 
and get maximum performance with minimal disk reads. 
*/
DECLARE @pos int
DECLARE @value int
WHILE @string > ''''
BEGIN
SET @pos = CHARINDEX('','', @string)
IF @pos > 0
BEGIN
SET @value = SUBSTRING( @string, 1, @pos - 1)
select @string = LTRIM(SUBSTRING( @string, @pos + 1, LEN(@string)-@pos+1))
INSERT @Values SELECT @value
END
ELSE
IF LEN(@string) > 0
BEGIN
SET @value = @string
INSERT @Values SELECT @value
SET @string = ''''
END
ELSE
SET @string = ''''
END
RETURN
END 




' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnWorkDayDueDate]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnWorkDayDueDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fnWorkDayDueDate] (@NthDay int, @calcDate datetime)
/********************************************************************************************************** 
USAGE:     returns the nth work day past any given date. If the nth payment due date falls
        on a weekend the function will default to the following monday
PARAMETERS:     INPUT    (the nth day of the month for the due date, 
                        calculation Date)
                 OUTPUT (the due date based on the Nth day of the month from the calculation date 
                        - if the nthDay is on a weekend this function will 
                        return the following Monday as the alternative date)
RETURNS: smalldatetime
**********************************************************************************************************/
--SELECT [dbo].[fnWorkDayDueDate](3,GETDATE()) AS WorkingDate

RETURNS smalldatetime
AS 
BEGIN 
	DECLARE @DueDate smalldatetime
--	SET @NthDay = @NthDay - 1

	SELECT @DueDate =
		CASE DATENAME(dw,DATEADD(dd,@NthDay,@calcDate))
			-- if the payment due date falls on a Saturday or Sunday the 
			-- following Monday will be used as the due date
			WHEN ''Saturday'' THEN DATEADD(dd,@NthDay+2,@calcDate)
			WHEN ''Sunday'' THEN DATEADD(dd,@NthDay+1,@calcDate)
			-- add n-1 days to the first day of the month to derive the nth day 
			ELSE DATEADD(dd,@NthDay,@calcDate)
		END
	
Return @DueDate
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnWorkdaysDueDate]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnWorkdaysDueDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fnWorkdaysDueDate] (@NthDay int, @calcDate datetime)
/********************************************************************************************************** 
USAGE:     returns the nth payment due day of the month for any given date. If the nth payment due date falls
        on a weekend the function will default to the following monday
PARAMETERS:     INPUT    (the nth day of the month for the due date, 
                        calculation Date)
                 OUTPUT (the due date based on the Nth day of the month from the calculation date 
                        - if the nthDay is on a weekend this function will 
                        return the following Monday as the alternative date)
RETURNS: smalldatetime
**********************************************************************************************************/
--SELECT [dbo].[fnWorkdaysDueDate](3,GETDATE()) AS WorkingDate

RETURNS smalldatetime
AS 
BEGIN 
	DECLARE @firstDayOfMonth smalldatetime
	DECLARE @payDueDate smalldatetime
	-- calculate the first day of month for the passed in calcDate
	SET @firstDayOfMonth = DATEADD(mm,DATEDIFF(mm,0,@calcDate),0)
	-- subtract 1 day to account for the first day of the month
	SET @NthDay = @NthDay - 1

	SELECT @payDueDate =
		CASE DATENAME(dw,DATEADD(dd,@NthDay,@firstDayOfMonth))
			-- if the payment due date falls on a Saturday or Sunday the 
			-- following Monday will be used as the due date
			WHEN ''Saturday'' THEN DATEADD(dd,@NthDay+2,@firstDayOfMonth)
			WHEN ''Sunday'' THEN DATEADD(dd,@NthDay+1,@firstDayOfMonth)
			-- add n-1 days to the first day of the month to derive the nth day 
			ELSE DATEADD(dd,@NthDay,@firstDayOfMonth)
		END
	
Return @payDueDate
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[FormDescription]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FormDescription]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

/****** Object:  User Defined Function dbo.FormDescription    Script Date: 12/6/2005 1:04:49 PM ******/

/****** Object:  User Defined Function dbo.FormDescription    Script Date: 12/6/2005 1:02:55 PM ******/
CREATE   FUNCTION [dbo].[FormDescription] 
(
@pcFormNumber char(2),
@pnThck numeric(9,4) = 0
)
RETURNS varchar(11)
AS
BEGIN
DECLARE @lcFormDescription varchar(11)
--SELECT @lcFormDescription = dbo.FormDescription(@cForm,@pnThck)
--SELECT dbo.FormDescription(''40'',.1)
-- SELECT FormNumber,FormDescription,Thickness_Min,Thickness_Max FROM dbo.Forms  WHERE Thickness_Min <= .1 AND .1 <= Thickness_Max AND ( FormNumber = ''40'' OR FormNumber = ''50'' )

IF @pcFormNumber = ''40''
   BEGIN
	SELECT TOP 1 @lcFormDescription = FormDescription FROM dbo.Forms WHERE Thickness_Min <= @pnThck AND @pnThck <= Thickness_Max
		AND ( FormNumber = ''40'' OR FormNumber = ''50'' )
   END
ELSE
   BEGIN
	SELECT TOP 1 @lcFormDescription = FormDescription FROM Forms WHERE FormNumber = @pcFormNumber
   END


RETURN (@lcFormDescription)
END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fvSales_Grab_QTY]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fvSales_Grab_QTY]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
create FUNCTION [dbo].[fvSales_Grab_QTY]
( @SOitem CHAR(10)
)
RETURNS MONEY
AS
BEGIN
--SELECT dbo.fvSales_Grab_QTY('' 140304-01'')

DECLARE @QTY_Total MONEY = 0

SELECT @QTY_Total = SUM(tQTY)
FROM (
	
	SELECT SUM(QTY) AS tQTY
		FROM dbo.StockLst_Process_Grab WITH(NOLOCK)
		WHERE SOItem = @SOitem
	UNION

	SELECT SUM(QTY) AS tQTY
		FROM dbo.BrokerLst_Process_Grab WITH(NOLOCK)
		WHERE SOItem = @SOitem
	UNION

	SELECT SUM(QTY) AS tQTY
		FROM dbo.WIPLst_Process_Grab WITH(NOLOCK)
		WHERE SOItem = @SOitem
	)t

RETURN ISNULL(@QTY_Total,0)
END

--GRANT EXECUTE ON [dbo].[fvSales_Grab_QTY] TO [WINDFALL\HPA] AS [dbo];

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fvSales_Grab_Total]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fvSales_Grab_Total]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[fvSales_Grab_Total]
( @SOitem CHAR(10)
)
RETURNS MONEY
AS
BEGIN
--SELECT dbo.fvSales_Grab_Total('' 140304-01'')

DECLARE @Total MONEY = 0

SELECT @Total = SUM(Total)
FROM (
	
	SELECT SUM(QTY*S_P) AS Total
		FROM dbo.StockLst_Process_Grab WITH(NOLOCK)
		WHERE SOItem = @SOitem
	UNION

	SELECT SUM(QTY*S_P) AS Total
		FROM dbo.BrokerLst_Process_Grab WITH(NOLOCK)
		WHERE SOItem = @SOitem
	UNION

	SELECT SUM(QTY*S_P) AS Total
		FROM dbo.WIPLst_Process_Grab WITH(NOLOCK)
		WHERE SOItem = @SOitem
	)t

RETURN ISNULL(@Total,0)
END

--GRANT EXECUTE ON [dbo].[fvSales_Grab_Total] TO [WINDFALL\HPA] AS [dbo];

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fvSales_PORecv]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fvSales_PORecv]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[fvSales_PORecv]
( @POitem CHAR(12)
)
RETURNS MONEY
AS
BEGIN
--SELECT dbo.fvSales_PORecv('' 140304-01'')

DECLARE @Total MONEY = 0

SELECT @Total = SUM(R.R_QTY*R.R_P)
	FROM dbo.Receiving R WITH(NOLOCK) 
	WHERE R.POitem = @POitem



RETURN ISNULL(@Total,0)
END

--GRANT EXECUTE ON [dbo].[fvSales_PORecv] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fvSales_PORecv_QTY]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fvSales_PORecv_QTY]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[fvSales_PORecv_QTY]
( @POitem CHAR(12)
)
RETURNS NUMERIC(9,2)
AS
BEGIN
--SELECT dbo.fvSales_PORecv_QTY(''   510359-01'')

DECLARE @Total Decimal(9,2) = 0


SELECT @Total = SUM(R.R_QTY)
	FROM dbo.Receiving R WITH(NOLOCK) 
	WHERE R.POitem = @POitem



RETURN ISNULL(@Total,0)
END

--GRANT EXECUTE ON [dbo].[fvSales_PORecv_QTY] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fvSales_PORecv_Total]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fvSales_PORecv_Total]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[fvSales_PORecv_Total]
( @SOitem CHAR(10)
)
RETURNS MONEY
AS
BEGIN
--SELECT dbo.fvSales_PS_QTY('' 140304-01'')

DECLARE @Total MONEY = 0

SELECT @Total = (SRP.QTY * SRP.Ordered_P )
	FROM dbo.Stock_Recv_Process SRP WITH(NOLOCK) 
	WHERE SRP.SOitem = @SOitem




RETURN ISNULL(@Total,0)
END

--GRANT EXECUTE ON [dbo].[fvSales_PORecv_Total] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fvSales_PS_QTY]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fvSales_PS_QTY]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[fvSales_PS_QTY]
( @SOitem CHAR(10)
)
RETURNS MONEY
AS
BEGIN
--SELECT dbo.fvSales_PS_QTY('' 140304-01'')

DECLARE @QTY MONEY = 0

SELECT @QTY= SUM( SPS.Acct_QTY )
	FROM dbo.Sales_PS SPS WITH(NOLOCK)
	WHERE SPS.SOitem = @SOitem
	AND SPS.Cncld = 0


RETURN ISNULL(@QTY,0)
END

--GRANT EXECUTE ON [dbo].[fvSales_PS_QTY] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fvSales_PS_QTY_Year_Month]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fvSales_PS_QTY_Year_Month]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[fvSales_PS_QTY_Year_Month]
( @SOitem CHAR(10)
 ,@YearMn INT
)
RETURNS MONEY
AS
BEGIN
--SELECT dbo.fvSales_PS_QTY('' 140304-01'')
--SELECT dbo.fvSales_PS_QTY_Year_Month('' 140726-01'', 202504)

DECLARE @QTY MONEY = 0

SELECT @QTY= SUM( SPS.Acct_QTY )
	FROM dbo.Sales_PS SPS WITH(NOLOCK)
	WHERE SPS.SOitem = @SOitem
	AND SPS.Cncld = 0
	AND dbo.[f_get_Year_Month](SPS.PS_Date) = @YearMn


RETURN ISNULL(@QTY,0)
END

--GRANT EXECUTE ON [dbo].[fvSales_PS_QTY_Year_Month] TO [WINDFALL\HPA] AS [dbo];
/*
SELECT SPS.Acct_QTY, dbo.[f_get_Year_Month](SPS.PS_Date) 
,*
FROM dbo.Sales_PS SPS WITH(NOLOCK)
	WHERE SPS.Cncld = 0
	AND SPS.SOitem = '' 140726-01''
	AND dbo.[f_get_Year_Month](SPS.PS_Date)=202504
	ORDER By SOitem
	*/' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fvSales_PS_Total]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fvSales_PS_Total]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[fvSales_PS_Total]
( @SOitem CHAR(10)
)
RETURNS MONEY
AS
BEGIN
--SELECT dbo.fvSales_PS_QTY('' 140304-01'')

DECLARE @Total MONEY = 0
/*
SELECT @Total = ( dbo.fvSales_PS_QTY(@SOitem) * AQ.S_P )   80.60
	FROM dbo.AllQuotes AQ WITH(NOLOCK) 
	WHERE AQ.SOitem = @SOitem
*/

SELECT @Total = SUM( SPS.Acct_Total ) 
	FROM dbo.Sales_PS SPS WITH(NOLOCK)
	WHERE SPS.Cncld = 0
	AND SPS.SOitem = @SOitem


RETURN ISNULL(@Total,0)
END

--GRANT EXECUTE ON [dbo].[fvSales_PS_Total] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fvSales_RMA_QTY]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fvSales_RMA_QTY]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[fvSales_RMA_QTY]
( @SOitem CHAR(10)
)
RETURNS MONEY
AS
BEGIN
--SELECT dbo.fvSales_RMA_QTY('' 140304-01'')

DECLARE @QTY MONEY = 0

SELECT @QTY = SUM(RMA_QTY) 
	FROM dbo.RMA_Detail WITH(NOLOCK)
	WHERE SO_Item = @SOitem
	


RETURN ISNULL(@QTY,0)
END

--GRANT EXECUTE ON [dbo].[fvSales_RMA_QTY] TO [WINDFALL\HPA] AS [dbo];

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fvSales_SORecv]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fvSales_SORecv]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
create FUNCTION [dbo].[fvSales_SORecv]
( @SOitem CHAR(10)
)
RETURNS MONEY
AS
BEGIN
--SELECT dbo.fvSales_PS_QTY('' 140304-01'')

DECLARE @Total MONEY = 0

SELECT @Total = (SRP.QTY * SRP.Ordered_P )
	FROM dbo.Stock_Recv_Process SRP WITH(NOLOCK) 
	WHERE SRP.SOitem = @SOitem




RETURN ISNULL(@Total,0)
END

--GRANT EXECUTE ON [dbo].[fvSales_SORecv] TO [WINDFALL\HPA] AS [dbo];' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[GetDensity]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetDensity]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[GetDensity] 
(
@cAlloy char(12)
)
--RETURNS DECIMAL(7,1)
RETURNS DECIMAL(9,4)
AS
BEGIN

DECLARE @nDensity DECIMAL(9,4)
SET @nDensity = IsNull(dbo.AlloyDensity( dbo.AlloyName(@cAlloy) ),.29)

RETURN (@nDensity)
END


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[GetLastCall_CustomerID]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetLastCall_CustomerID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[GetLastCall_CustomerID] 
(
@cCustomerID char(20)
)

RETURNS SmallDateTime
AS
BEGIN

DECLARE @dLastCall SmallDateTime
SELECT TOP 1 @dLastCall = [Date] FROM dbo.Customer_List_Call WHERE CustomerID = @cCustomerID ORDER BY [DATE] DESC


RETURN (@dLastCall)
END


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[getStockLstCurrentLbs]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getStockLstCurrentLbs]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[getStockLstCurrentLbs] 
(
@cAlloy char(12),
@cForm CHAR(2),
@cCC CHAR(1),
@nThickness DECIMAL(9,4)
)

RETURNS DECIMAL(7,1)
AS
BEGIN
--PRINT dbo.[getStockLstCurrentLbs](''C-276'',''40'',''1'',.5)
--SET NOCOUNT ON

DECLARE @nPounds as DECIMAL(7,1)
DECLARE @cMessage as VARCHAR(2000)
SET @cMessage = ''''
SET @nPounds = 0


--SET @cCC = dbo.f_GetCCSortValue(@cCC)

SELECT @nPounds=SUM(mWeight) FROM dbo.StockLst_Master 
	WHERE Alloy = @cAlloy
	AND dbo.f_GetBasicStockForm(Form) = dbo.f_GetBasicStockForm(@cForm)
	AND dbo.f_GetCCSortValue(CC) = dbo.f_GetCCSortValue(@cCC)
	AND [Size] = dbo.[getStockLstStandardSize](@nThickness)
 
RETURN ISNULL(@nPounds,0)
END


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[getStockLstIncomingLbs]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getStockLstIncomingLbs]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[getStockLstIncomingLbs] 
(
@cAlloy char(12),
@cForm CHAR(2),
@cCC CHAR(1),
@nThickness DECIMAL(9,4)
)

RETURNS DECIMAL(7,1)
AS
BEGIN
--PRINT dbo.[getStockLstIncomingLbs](''C-276'',''40'',''1'',.5)
--SET NOCOUNT ON

DECLARE @nPounds as DECIMAL(7,1)
DECLARE @cMessage as VARCHAR(2000)
SET @cMessage = ''''
SET @nPounds = 0


/*
SELECT @nPounds=ISNULL(SUM(SP.Pweight),0)
	FROM dbo.StockLst_Process SP, dbo.StockLst_Detail SD, dbo.StockLst_Master SM 
	WHERE (Process_ID = ''INCOMING''  OR Process_ID = ''PARTRECV'')
	AND SP.ID_Detail = SD.ID_Detail
	AND SD.ID = SM.ID
	AND dbo.f_GetBasicStockForm(Form) = dbo.f_GetBasicStockForm(@cForm)
	AND dbo.f_GetCCSortValue(CC) = dbo.f_GetCCSortValue(@cCC)
	AND [Size] = dbo.[getStockLstStandardSize](@nThickness)
 */

 SELECT @nPounds=SUM(ISNULL(SM.mS_QTY,0))
	FROM dbo.StockLst_Master SM 
	WHERE SM.Heat = ''Due In''
	AND dbo.f_GetBasicStockForm(Form) = dbo.f_GetBasicStockForm(@cForm)
	AND dbo.f_GetCCSortValue(CC) = dbo.f_GetCCSortValue(@cCC)
	AND [Size] = dbo.[getStockLstStandardSize](@nThickness)
 
 
RETURN @nPounds
END


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[getStockLstSoldLBS]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getStockLstSoldLBS]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[getStockLstSoldLBS] 
(
@cAlloy char(12),
@cForm CHAR(2),
@cCC CHAR(1),
@nThickness DECIMAL(9,4)
)

RETURNS DECIMAL(7,1)
AS
BEGIN
--PRINT dbo.[getStockLstSoldLBS](''C-276'',''40'',''1'',.5)
--SET NOCOUNT ON

DECLARE @nPounds as DECIMAL(7,1)
DECLARE @cMessage as VARCHAR(2000)
SET @cMessage = ''''
SET @nPounds = 0



SELECT @nPounds=ISNULL(SUM(SP.Pweight),0)
	FROM dbo.StockLst_Process SP, dbo.StockLst_Detail SD, dbo.StockLst_Master SM 
	WHERE Process_ID = ''SELECTED''
	AND SP.ID_Detail = SD.ID_Detail
	AND SD.ID = SM.ID
	AND dbo.f_GetBasicStockForm(Form) = dbo.f_GetBasicStockForm(@cForm)
	AND dbo.f_GetCCSortValue(CC) = dbo.f_GetCCSortValue(@cCC)
	AND [Size] = dbo.[getStockLstStandardSize](@nThickness)
 
 
RETURN @nPounds
END


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[getStockLstStandardSize]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getStockLstStandardSize]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[getStockLstStandardSize] 
(
@nThickness DECIMAL(9,4)
)

RETURNS DECIMAL(9,4)
AS
BEGIN
--PRINT dbo.[getStockLstStandardSize](.5)
--SET NOCOUNT ON

DECLARE @returnThickness as DECIMAL(9,4)
DECLARE @cMessage as VARCHAR(2000)
SET @cMessage = ''''
SET @returnThickness = 0

--SELECT DISTINCT Thk FROM dbo.PriceTable ORDER BY Thk

SELECT @returnThickness=ISNULL([Size],0)
	FROM dbo.PriceTable
	WHERE [Size] = @nThickness
 
IF @returnThickness = 0
	begin

	DECLARE @ThicknessOver as DECIMAL(9,4)
	DECLARE @ThicknessUnder as DECIMAL(9,4)

	SELECT TOP 1 @ThicknessOver=ISNULL([SIZE],@nThickness) FROM dbo.PriceTable WHERE [Size] > @nThickness ORDER BY [SIZE] ASC
	SELECT TOP 1 @ThicknessUnder=ISNULL([SIZE],0) FROM dbo.PriceTable WHERE [Size] < @nThickness ORDER BY [SIZE] DESC

	IF ( @ThicknessOver - @nThickness) <= ( @nThickness - @ThicknessUnder) 
		SET @returnThickness = @ThicknessOver
	ELSE
		SET @returnThickness = @ThicknessUnder

	end

RETURN @returnThickness
END


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[Inventory_Form]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Inventory_Form]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[Inventory_Form] 
(
@cFormNumber char(2)
)
RETURNS char(2)
AS
BEGIN 
-- Use to convert Quotes Forms to Forms used by Inventory
--10,Bar,11,Flat Bar,12,Hex Bar,13,Square Bar,20,Wire Spool,21,Wire Cut,30,Coat Elect,40,Plate/Sheet,51,Strip,60,Tube,65,Pipe,66,Nipple,67,Elbow,68,Tee,69,Reducer,70,Fittings,72,Flange,75,Fastener,80,Disk
-- Also use dbo.Forms.FormSort

DECLARE @cInvForm CHAR(2)

SET @cInvForm = CASE
WHEN @cFormNumber = ''10'' THEN ''10''-- bar
WHEN @cFormNumber = ''11'' THEN ''10''-- Flat bar
WHEN @cFormNumber = ''12'' THEN ''10'' -- Hex bar
WHEN @cFormNumber = ''13'' THEN ''10'' -- Square bar
WHEN @cFormNumber = ''20'' THEN ''20'' -- Wire Spool
WHEN @cFormNumber = ''21'' THEN ''20'' -- TIG Can
WHEN @cFormNumber = ''22'' THEN ''20'' -- LOOSE COIL 
WHEN @cFormNumber = ''23'' THEN ''20'' -- Wire Reel
WHEN @cFormNumber = ''30'' THEN ''30'' -- Coated Electrodes
WHEN @cFormNumber = ''40'' THEN ''40'' -- Plate/Sheet
WHEN @cFormNumber = ''50'' THEN ''40'' -- Sheet
WHEN @cFormNumber = ''51'' THEN ''40'' -- Strip
WHEN @cFormNumber = ''52'' THEN ''40'' -- Coil
WHEN @cFormNumber = ''53'' THEN ''40'' -- HotBand
WHEN @cFormNumber = ''60'' THEN ''60'' -- Tube
WHEN @cFormNumber = ''65'' THEN ''65'' -- Pipe
WHEN @cFormNumber = ''66'' THEN ''65'' -- Nipple
WHEN @cFormNumber = ''67'' THEN ''65'' -- Elbow
WHEN @cFormNumber = ''68'' THEN ''65'' -- tee
WHEN @cFormNumber = ''69'' THEN ''65'' -- reducer
WHEN @cFormNumber = ''70'' THEN ''70'' -- Flanges
WHEN @cFormNumber = ''72'' THEN ''10'' -- Machined
WHEN @cFormNumber = ''75'' THEN ''75'' -- Fasteners
WHEN @cFormNumber = ''80'' THEN ''40''  --Cut Disk
ELSE @cFormNumber
END

RETURN @cInvForm 

END


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[ItemDescription]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ItemDescription]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
--**************
-- Do not use
-- Use f_ItemDescription or f_ItemDescriptionMetric
---************

CREATE FUNCTION [dbo].[ItemDescription] 
(
  @cForm AS CHAR(2)
, @nSZ1 AS NUMERIC(12,4)
, @nSZ2 AS NUMERIC(12,4)
, @nSZ3 AS NUMERIC(12,4)
, @lRL AS BIT
)


RETURNS VARCHAR(100)
AS
BEGIN
--dbo.ItemDescription(''10'',1.875,120,0,0)
--dbo.ItemDescription(Form,Sz1,Sz2,Sz3,RandLen)
--FoxPro PROC ItemDescription(cForm, nSZ1, nSZ2, nSZ3, lRL, lMetric, nSz1orig, nSz2orig, nSz3orig)
DECLARE @lMetric AS Bit
, @nSz1orig AS Float
, @nSz2orig AS Float
, @nSz3orig AS Float

DECLARE @cDs VARCHAR(100)
--10,Bar,11,Flat Bar,12,Hex Bar,13,Square Bar,20,Wire Spool,21,Wire Cut,30,Coat Elect,
--40,Plate/Sheet,51,Strip,60,Tube,65,Pipe,66,Nipple,67,Elbow,68,Tee,69,Reducer,70,Fittings,72,Flange,75,Fastener,80,Disk

IF @cForm = ''10'' 
	begin
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''"Dia x ''
	IF @nSZ2 > 110 AND @nSZ2%12 = 0
		SET @cDs = @cDs + LTRIM( STR( @nSZ2/12 ,8,0)) + '' FT '' 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) + ''" '' 
	
	IF @nSZ3 > 0
		begin
		IF @nSZ3 > 110 AND @nSZ3%12 = 0
			SET @cDs = @cDs + '' x ''+LTRIM( STR( @nSZ3/12 ,8,0)) + '' FT '' 
		ELSE
			SET @cDs = @cDs + '' x ''+dbo.Remove0(@nSZ3,8,3) + ''" ''	
		end
	end

IF @cForm = ''11''  
	begin --Flat Bar
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" Flat bar x '' + dbo.Remove0(@nSZ2,8,3)+''" Wide x ''
	IF @nSZ3 > 0
		begin
		IF @nSZ3 > 110 AND @nSZ3%12 = 0
			SET @cDs = @cDs + LTRIM( STR( @nSZ3/12 ,8,0)) + '' FT '' 
		ELSE
			SET @cDs = @cDs + dbo.Remove0(@nSZ3,8,3) + ''" ''
		end
	SET @cDs = @cDs + '' Long''
	end

IF @cForm = ''12'' 
	begin --Hex Bar
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"HEX x ''
	IF @nSZ2 > 110 AND @nSZ2%12 = 0
		SET @cDs = @cDs + LTRIM( STR( @nSZ2/12 ,8,0)) + '' FT '' 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) + ''" '' 
	
	IF @nSZ3 > 0
		begin
		IF @nSZ3 > 110 AND @nSZ3%12 = 0
			SET @cDs = @cDs + '' x ''+LTRIM( STR( @nSZ3/12 ,8,0)) + '' FT '' 
		ELSE
			SET @cDs = @cDs + '' x ''+dbo.Remove0(@nSZ3,8,3) + ''" ''
		end
	end

IF @cForm = ''13'' 
	begin --Square Bar
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''" x ''+dbo.Remove0(@nSZ2,8,3)+''" x ''
	IF @nSZ3 > 110 AND @nSZ3%12 = 0
		SET @cDs = @cDs + LTRIM( STR( @nSZ3/12 ,8,0)) + '' FT '' 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ3,8,3) + ''" ''
	end	

IF @cForm = ''20''  
	begin --Wire
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Dia x ''+dbo.Remove0(@nSZ2,8,3)+''# Spool ''
	end

IF @cForm = ''21''  
	begin --CUT WIRE
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Dia x ''
	IF @nSZ2 > 110 AND @nSZ2%12 = 0
		SET @cDs = @cDs + LTRIM( STR( @nSZ2/12 ,8,0)) + '' FT '' 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) + ''" ''

	IF @nSZ3 > 0
		SET @cDs = @cDs + LTRIM( STR( @nSZ3 ,8,0)) + '' Pounder '' 

	end

IF @cForm = ''22''  
	begin --LOOSE COIL 
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Dia x ''+dbo.Remove0(@nSZ2,8,3)+''# Coil ''
	end

IF @cForm = ''23''  
	begin --WIRE REEL 
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Dia x ''+dbo.Remove0(@nSZ2,8,3)+''# Reel ''
	end

IF @cForm = ''30''  
	begin --Coated Electrodes
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Dia x ''+dbo.Remove0(@nSZ2,8,3)+''" Coated Electrodes ''
	IF @nSZ3 > 0
		SET @cDs = @cDs + dbo.Remove0(@nSZ3,8,3) + ''# Can''
	end

IF @cForm = ''40''  
	begin --Plate Sheet
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''" Thick x ''+dbo.Remove0(@nSZ2,8,3) 
	IF @nSZ3 > 0
		SET @cDs = @cDs+''" x ''+dbo.Remove0(@nSZ3,8,3) 
	
	SET @cDs = @cDs+''" ''
	end

IF @cForm = ''51''  
	begin --Strip
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Thick x ''+dbo.Remove0(@nSZ2,8,3)+''" x ''+dbo.Remove0(@nSZ3,8,3)+'' Pounds Strip ''
	end

IF @cForm = ''52''  
	begin --Coil
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Thick x ''+dbo.Remove0(@nSZ2,8,3)+''" x ''+dbo.Remove0(@nSZ3,8,3)+'' Pounds Strip ''
	end

IF @cForm = ''53''  
	begin --Hot Band
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Thick x ''+dbo.Remove0(@nSZ2,8,3)+''" x ''+dbo.Remove0(@nSZ3,8,3)+'' Pounds Strip ''
	end

IF @cForm = ''60''  
	begin -- Tube
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"OD x ''+dbo.Remove0(@nSZ2,8,3)+''"Wall x ''
	IF @nSZ3 > 110 AND @nSZ3%12 = 0
		SET @cDs = @cDs + LTRIM( STR( @nSZ3/12 ,8,0))+'' FT '' 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ3,8,3)+''" ''
	end

IF @cForm = ''65''  
	begin -- Pipe
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" SCH ''
	IF @nSZ2 = 0
		SET @cDs = @cDs + LTRIM(@nSZ2orig) 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) 
	
	SET @cDs = @cDs + '' x ''
	IF @nSZ3 > 110 AND @nSZ3%12 = 0
		SET @cDs = @cDs + LTRIM( STR( @nSZ3/12 ,8,0)) + '' FT '' 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ3,8,3) + ''" ''
	end

IF @cForm = ''66''  
	begin -- Nipple
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" SCH ''
	IF @nSZ2 = 0
		SET @cDs = @cDs + LTRIM(@nSZ2orig) 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) 
	
	IF @nSZ3 > 0
		SET @cDs = @cDs + '' x '' + dbo.Remove0(@nSZ3,8,3) + ''"''
	
	SET @cDs = @cDs + '' Nipple''
	end

IF @cForm = ''67''  
	begin --Elbow
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" SCH ''
	IF @nSZ2 = 0
		SET @cDs = @cDs + LTRIM(@nSZ2orig) 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) 
	
	IF @nSZ3>0
		SET @cDs = @cDs + '' x ''+ LTRIM(STR(@nSZ3,8,0)) + '' Deg''
	
	SET @cDs = @cDs + '' Elbow ''
	end

IF @cForm = ''68''  
	begin --Tee
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" SCH ''
	IF @nSZ2 = 0
		SET @cDs = @cDs + LTRIM(@nSZ2orig) 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) 
	
	SET @cDs = @cDs + '' Tee''
	end

IF @cForm = ''69''  
	begin -- Reducer
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" x ''
	IF @nSZ2 = 0
		SET @cDs = @cDs + LTRIM(@nSZ2orig) 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) 
	
	SET @cDs = @cDs + ''" Sch '' + dbo.Remove0(@nSZ3,8,3) + '' Reducer''
	end

IF @cForm = ''70''  
	begin --Fittings
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" SCH ''
	IF @nSZ2 = 0
		SET @cDs = @cDs + LTRIM(@nSZ2orig) 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) 
	
	IF @nSZ3 > 0
		SET @cDs = @cDs+'' x ''+dbo.Remove0(@nSZ3,8,3)+''"''
	
	SET @cDs = @cDs + '' Pipe Fitting''
	end

IF @cForm = ''71'' 
	begin --Coupling
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" IPS ''
	IF @nSZ2 > 0
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) + ''# Pounds''
	
	IF @nSZ3 > 0
		SET @cDs = @cDs + '' x '' + dbo.Remove0(@nSZ3,8,3) + ''" Long''
	
	SET @cDs = @cDs + '' Coupling''
	end

IF @cForm = ''72''  
	begin --Flange
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" SCH ''
	IF @nSZ2 = 0
		SET @cDs = @cDs + LTRIM(@nSZ2orig) 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) 
	
	IF @nSZ3 > 0
		SET @cDs = @cDs+'' x ''+dbo.Remove0(@nSZ3,8,3) + ''# Pounds''
	
	SET @cDs = @cDs + '' Flange''
	end

IF @cForm = ''75'' 
	begin --Fasteners
	IF @lMetric = 1
		SET @cDs = ''M'' + dbo.Remove0(@nSZ1,9,4) 
	ELSE
		SET @cDs = dbo.Remove0(@nSZ1,9,4) 	
	
	IF @nSZ2 > 0
		SET @cDs = @cDs + '' - '' + dbo.Remove0(@nSZ2,8,3) 
	
	IF @nSZ3 > 0
		SET @cDs = @cDs + '' x '' + dbo.Remove0(@nSZ3,8,3) + ''" long''
	
	SET @cDs = @cDs + '' Fastener''
	end

IF @cForm = ''80''  
	begin --Disk
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''" Thick x ''+dbo.Remove0(@nSZ2,8,3)+''"OD ''
	IF @nSZ3 > 0
		SET @cDs = @cDs + ''x '' + dbo.Remove0(@nSZ3,8,3) + ''"ID Disk''
	end

IF @cForm = ''90''  
	begin --Machined
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''" x ''+dbo.Remove0(@nSZ2,8,3)+''" x '' + dbo.Remove0(@nSZ3,8,3) + ''"''
	end
/*ELSE 
	begin
	SET @cDs = dbo.Remove0(@nSZ1,9,4) 
	SET @cDs = @cDs + ''" x ''
	IF @nSZ2 = 0
		SET @cDs = @cDs + LTRIM(@nSZ2orig) 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) 
	
	SET @cDs = @cDs + ''" x ''
	IF @nSZ3 = 0
		SET @cDs = @cDs + LTRIM(@nSZ3orig) 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ3,8,3) 
	
	SET @cDs = @cDs + ''"''
	end
*/

IF @lRL = 1
	SET @cDs = @cDs + '' R/L''



RETURN @cDs 
END





' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[ItemDescriptionSO]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ItemDescriptionSO]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
--****
-- Dot not use
-- please remove after 12/2011
-- use f_ItemDescriptionMetric
--**

CREATE FUNCTION [dbo].[ItemDescriptionSO] 
(
  @cForm AS CHAR(2)
, @nSZ1 AS NUMERIC(8,4)
, @nSZ2 AS NUMERIC(8,4)
, @nSZ3 AS NUMERIC(8,4)
, @nWeight AS Float
, @lRandLen AS BIT
, @lMetric AS BIT
, @cSz1orig AS VarChar(20)
, @cSz2orig AS VarChar(20)
, @cSz3orig AS VarChar(20)
)


RETURNS VARCHAR(100)
AS
BEGIN
--dbo.ItemDescription(''10'',1.875,120,0,0)
--dbo.ItemDescription(Form,Sz1,Sz2,Sz3,RandLen)
--FoxPro PROC ItemDescription(cForm, nSZ1, nSZ2, nSZ3, lRL, lMetric, nSz1orig, nSz2orig, nSz3orig)

DECLARE @cDs VARCHAR(100)
--10,Bar,11,Flat Bar,12,Hex Bar,13,Square Bar,20,Wire Spool,21,Wire Cut,30,Coat Elect,
--40,Plate/Sheet,51,Strip,60,Tube,65,Pipe,66,Nipple,67,Elbow,68,Tee,69,Reducer,70,Fittings,72,Flange,75,Fastener,80,Disk

IF @cForm = ''10'' 
	begin
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''"Dia x ''
	IF @nSZ2 > 110 AND @nSZ2%12 = 0
		SET @cDs = @cDs + LTRIM( STR( @nSZ2/12 ,8,0)) + '' FT '' 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) + ''" '' 
	
	IF @nSZ3 > 0
		begin
		IF @nSZ3 > 110 AND @nSZ3%12 = 0
			SET @cDs = @cDs + '' x ''+LTRIM( STR( @nSZ3/12 ,8,0)) + '' FT '' 
		ELSE
			SET @cDs = @cDs + '' x ''+dbo.Remove0(@nSZ3,8,3) + ''" ''	
		end
	end

IF @cForm = ''11''  
	begin --Flat Bar
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" Flat bar x '' + dbo.Remove0(@nSZ2,8,3)+''" Wide x ''
	IF @nSZ3 > 0
		begin
		IF @nSZ3 > 110 AND @nSZ3%12 = 0
			SET @cDs = @cDs + LTRIM( STR( @nSZ3/12 ,8,0)) + '' FT '' 
		ELSE
			SET @cDs = @cDs + dbo.Remove0(@nSZ3,8,3) + ''" ''
		end
	SET @cDs = @cDs + '' Long''
	end

IF @cForm = ''12'' 
	begin --Hex Bar
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"HEX x ''
	IF @nSZ2 > 110 AND @nSZ2%12 = 0
		SET @cDs = @cDs + LTRIM( STR( @nSZ2/12 ,8,0)) + '' FT '' 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) + ''" '' 
	
	IF @nSZ3 > 0
		begin
		IF @nSZ3 > 110 AND @nSZ3%12 = 0
			SET @cDs = @cDs + '' x ''+LTRIM( STR( @nSZ3/12 ,8,0)) + '' FT '' 
		ELSE
			SET @cDs = @cDs + '' x ''+dbo.Remove0(@nSZ3,8,3) + ''" ''
		end
	end

IF @cForm = ''13'' 
	begin --Square Bar
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''" x ''+dbo.Remove0(@nSZ2,8,3)+''" x ''
	IF @nSZ3 > 110 AND @nSZ3%12 = 0
		SET @cDs = @cDs + LTRIM( STR( @nSZ3/12 ,8,0)) + '' FT '' 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ3,8,3) + ''" ''
	end	

IF @cForm = ''20''  
	begin --Wire
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Dia x ''+dbo.Remove0(@nSZ2,8,3)+''# Spool ''
	end

IF @cForm = ''21''  
	begin --CUT WIRE
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Dia x ''
	IF @nSZ2 > 110 AND @nSZ2%12 = 0
		SET @cDs = @cDs + LTRIM( STR( @nSZ2/12 ,8,0)) + '' FT '' 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) + ''" ''

	IF @nSZ3 > 0
		SET @cDs = @cDs + LTRIM( STR( @nSZ3 ,8,0)) + '' Pounder '' 

	end

IF @cForm = ''22''  
	begin --LOOSE COIL 
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Dia x ''+dbo.Remove0(@nSZ2,8,3)+''# Coil ''
	end

IF @cForm = ''22''  
	begin --WIRE REEL 
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Dia x ''+dbo.Remove0(@nSZ2,8,3)+''# Reel ''
	end

IF @cForm = ''30''  
	begin --Coated Electrodes
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Dia x ''+dbo.Remove0(@nSZ2,8,3)+''" Coated Electrodes ''
	IF @nSZ3 > 0
		SET @cDs = @cDs + dbo.Remove0(@nSZ3,8,3) + ''# Can''
	end

IF @cForm = ''40''  
	begin --Plate Sheet
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''" Thick x ''+dbo.Remove0(@nSZ2,8,3) 
	IF @nSZ3 > 0
		SET @cDs = @cDs+''" x ''+dbo.Remove0(@nSZ3,8,3) 
	
	SET @cDs = @cDs+''" ''
	end

IF @cForm = ''51''  
	begin --Strip
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Thick x ''+dbo.Remove0(@nSZ2,8,3)+''" x ''+dbo.Remove0(@nSZ3,8,3)+'' Pounds Strip ''
	end

IF @cForm = ''52''  
	begin --Coil
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Thick x ''+dbo.Remove0(@nSZ2,8,3)+''" x ''+dbo.Remove0(@nSZ3,8,3)+'' Pounds Strip ''
	end

IF @cForm = ''53''  
	begin --Hot Band
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"Thick x ''+dbo.Remove0(@nSZ2,8,3)+''" x ''+dbo.Remove0(@nSZ3,8,3)+'' Pounds Strip ''
	end

IF @cForm = ''60''  
	begin -- Tube
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''"OD x ''+dbo.Remove0(@nSZ2,8,3)+''"Wall x ''
	IF @nSZ3 > 110 AND @nSZ3%12 = 0
		SET @cDs = @cDs + LTRIM( STR( @nSZ3/12 ,8,0))+'' FT '' 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ3,8,3)+''" ''
	end

IF @cForm = ''65''  
	begin -- Pipe
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" SCH ''
	IF @nSZ2 = 0
		SET @cDs = @cDs + LTRIM(@cSZ2orig) 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) 
	
	SET @cDs = @cDs + '' x ''
	IF @nSZ3 > 110 AND @nSZ3%12 = 0
		SET @cDs = @cDs + LTRIM( STR( @nSZ3/12 ,8,0)) + '' FT '' 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ3,8,3) + ''" ''
	end

IF @cForm = ''66''  
	begin -- Nipple
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" SCH ''
	IF @nSZ2 = 0
		SET @cDs = @cDs + LTRIM(@cSZ2orig) 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) 
	
	IF @nSZ3 > 0
		SET @cDs = @cDs + '' x '' + dbo.Remove0(@nSZ3,8,3) + ''"''
	
	SET @cDs = @cDs + '' Nipple''
	end

IF @cForm = ''67''  
	begin --Elbow
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" SCH ''
	IF @nSZ2 = 0
		SET @cDs = @cDs + LTRIM(@cSZ2orig) 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) 
	
	IF @nSZ3>0
		SET @cDs = @cDs + '' x ''+ LTRIM(STR(@nSZ3,8,0)) + '' Deg''
	
	SET @cDs = @cDs + '' Elbow ''
	end

IF @cForm = ''68''  
	begin --Tee
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" SCH ''
	IF @nSZ2 = 0
		SET @cDs = @cDs + LTRIM(@cSZ2orig) 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) 
	
	SET @cDs = @cDs + '' Tee''
	end

IF @cForm = ''69''  
	begin -- Reducer
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" x ''
	IF @nSZ2 = 0
		SET @cDs = @cDs + LTRIM(@cSZ2orig) 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) 
	
	SET @cDs = @cDs + ''" Sch '' + dbo.Remove0(@nSZ3,8,3) + '' Reducer''
	end

IF @cForm = ''70''  
	begin --Fittings
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" SCH ''
	IF @nSZ2 = 0
		SET @cDs = @cDs + LTRIM(@cSZ2orig) 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) 
	
	IF @nSZ3 > 0
		SET @cDs = @cDs+'' x ''+dbo.Remove0(@nSZ3,8,3)+''"''
	
	SET @cDs = @cDs + '' Pipe Fitting''
	end

IF @cForm = ''71'' 
	begin --Coupling
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" IPS ''
	IF @nSZ2 > 0
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) + ''# Pounds''
	
	IF @nSZ3 > 0
		SET @cDs = @cDs + '' x '' + dbo.Remove0(@nSZ3,8,3) + ''" Long''
	
	SET @cDs = @cDs + '' Coupling''
	end

IF @cForm = ''72''  
	begin --Flange
	SET @cDs = dbo.Remove0(@nSZ1,9,4) + ''" SCH ''
	IF @nSZ2 = 0
		SET @cDs = @cDs + LTRIM(@cSZ2orig) 
	ELSE
		SET @cDs = @cDs + dbo.Remove0(@nSZ2,8,3) 
	
	IF @nSZ3 > 0
		SET @cDs = @cDs+'' x ''+dbo.Remove0(@nSZ3,8,3) + ''# Pounds''
	
	SET @cDs = @cDs + '' Flange''
	end

IF @cForm = ''75'' 
	begin --Fasteners
	IF @lMetric = 1
		SET @cDs = ''M'' + dbo.Remove0(@nSZ1,9,4) 
	ELSE
		SET @cDs = dbo.Remove0(@nSZ1,9,4) 	
	
	IF @nSZ2 > 0
		SET @cDs = @cDs + '' - '' + dbo.Remove0(@nSZ2,8,3) 
	
	IF @nSZ3 > 0
		SET @cDs = @cDs + '' x '' + dbo.Remove0(@nSZ3,8,3) + ''" long''
	
	SET @cDs = @cDs + '' Fastener''
	end

IF @cForm = ''80''  
	begin --Disk
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''" Thick x ''+dbo.Remove0(@nSZ2,8,3)+''"OD ''
	IF @nSZ3 > 0
		SET @cDs = @cDs + ''x '' + dbo.Remove0(@nSZ3,8,3) + ''"ID Disk''
	end

IF @cForm = ''90''  
	begin --Machined
	SET @cDs = dbo.Remove0(@nSZ1,9,4)+''" x ''+dbo.Remove0(@nSZ2,8,3)+''" x '' + dbo.Remove0(@nSZ3,8,3) + ''"''
	end

IF @lRandLen = 1
	SET @cDs = @cDs + '' R/L''



RETURN @cDs 
END





' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[OT_GetTotalTime]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OT_GetTotalTime]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Sean Lykins
-- Create date: 2013 10 25
-- Description:	Calculates the time a job took in order tracking
-- =============================================
Create FUNCTION [dbo].[OT_GetTotalTime]
(
	-- Add the parameters for the function here
	@trackID int
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	declare @totalMin float = 0
		,@startStatus int
		,@startTime datetime
		,@stopStatus int
		,@stopTime datetime
	declare MyCursor cursor STATIC for 
		SELECT TOP 1000 --[trackTimeID],
			[Start_StatusId]
			,[StartTime]
			,[Stop_StatusId]
			,[StopTime]
			--,[trackID]
		FROM [dbo].[OT_Times]
		WHERE trackID = @trackID
		ORDER BY StartTime
	open MyCursor
	FETCH NEXT FROM MyCursor INTO @startStatus, @startTime, @stopStatus, @stopTime
	while @@FETCH_STATUS = 0 
	begin
		if (@stopStatus is not null AND @stopTime is not null)
			begin 
				SET @totalMin += DATEDIFF(mi, @startTime, @stopTime)
			end

		FETCH NEXT FROM MyCursor INTO @startStatus, @startTime, @stopStatus, @stopTime
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
/****** Object:  UserDefinedFunction [dbo].[PipeWeight]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PipeWeight]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[PipeWeight]
(
@nThickness DECIMAL(9,4),
@nSize2 DECIMAL(9,3)
)
RETURNS DECIMAL(9,6)
AS
BEGIN
--dbo.PipeWeight(@nThickness,@nSize2)
--PRINT dbo.PipeWeight(8.0000,.500)
--Used by [p_GetFullQuote]

DECLARE @Schedule CHAR(3) --''XX''
IF @nSize2 < 1
	SET @Schedule = ''XX''
ELSE
	SET @Schedule = CAST( CAST(@nSize2 AS INT) AS VARCHAR)

DECLARE @nPoundsPerInch DECIMAL(9,6)

SELECT TOP 1 @nPoundsPerInch = [lbs_in] FROM [dbo].[WPipe] WHERE [nPipeSize] = @nThickness AND [Schedule] = @Schedule

RETURN (@nPoundsPerInch)
END




' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[PriceTableThckStd]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PriceTableThckStd]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

-- Not Finished
CREATE    FUNCTION [dbo].[PriceTableThckStd]
(
@cAlloy char(12),
@cForm	CHAR(2),
@cC	CHAR(1),
@nThick DECIMAL(9,4),
@nSize2	DECIMAL(9,3),
@nSize3	DECIMAL(9,3)
)
--RETURNS DECIMAL(9,4)
--RETURNS CHAR(5)
RETURNS CHAR(2000)

AS

--Print dbo.PriceTableThckStd(''C-276'',''10'',''1'',1.125,1,1)
BEGIN
DECLARE @cThckStd CHAR(5)
DECLARE @nThckStd DECIMAL(9,4)

SET @cC = ISNULL(@cC,''1'')
SET @nSize2 = ISNULL(@nSize2,0)
SET @nSize3 = ISNULL(@nSize3,0)

DECLARE @nMatch REAL
SET @nMatch = 0

IF (SELECT COUNT(*) FROM dbo.PriceTable WHERE Alloy=@cAlloy and Form=@cForm and cC = @cC and thk=@nThick ) = 1
	begin
	SELECT @cThckStd = thk FROM dbo.PriceTable WHERE Alloy=@cAlloy and Form=@cForm and cC = @cC and thk=@nThick
	SET @nThckStd   = @nThick
	SET @nMatch	= 7	
	end
ELSE
IF (SELECT COUNT(*) FROM dbo.PriceTable WHERE Alloy=@cAlloy and Form=@cForm and cC = @cC and thk=@nThick ) > 1
	begin
	SET @nThckStd = @nThick
	SET @nMatch	= -7
	end
ELSE
IF (SELECT COUNT(*) FROM dbo.PriceTable WHERE Alloy=@cAlloy and Form=@cForm and cC = @cC and ROUND(CAST( thk AS REAL),3,1)=ROUND(@nThick,3,1)) = 1
	begin
	SELECT @cThckStd = thk FROM dbo.PriceTable WHERE Alloy=@cAlloy and Form=@cForm and cC = @cC and ROUND(CAST( thk AS REAL),3,1)=ROUND(@nThick,3,1)
	SET @nThckStd	= ROUND(@nThick,3)
	SET @nMatch	= 6
	end
ELSE
IF (SELECT COUNT(*) FROM dbo.PriceTable WHERE Alloy=@cAlloy and Form=@cForm and cC = @cC and ROUND(CAST( thk AS REAL),3,1)=ROUND(@nThick,3,1)) > 1
	begin
	SET @nThckStd	= ROUND(@nThick,3)
	SET @nMatch	= -6
	end
ELSE
IF (SELECT COUNT(*) FROM dbo.PriceTable WHERE Alloy=@cAlloy and Form=@cForm and cC = @cC and ROUND(CAST( thk AS REAL),2,1)=ROUND(@nThick,2,1)) = 1
	begin
	SELECT @cThckStd = thk FROM dbo.PriceTable WHERE Alloy=@cAlloy and Form=@cForm and cC = @cC and ROUND(CAST( thk AS REAL),2,1)=ROUND(@nThick,2,1)
	SET @nThckStd	= ROUND(@nThick,2)
	SET @nMatch	= 5
	end
ELSE
IF (SELECT COUNT(*) FROM dbo.PriceTable WHERE Alloy=@cAlloy and Form=@cForm and cC = @cC and ROUND(CAST( thk AS REAL),2,1)=ROUND(@nThick,2,1)) > 1
	begin
	SET @nThckStd	= ROUND(@nThick,2)
	SET @nMatch	= -5
	end
ELSE
IF (SELECT COUNT(*) FROM dbo.PriceTable WHERE Alloy=@cAlloy and Form=@cForm and cC = @cC and ROUND(CAST( thk AS REAL),1,1)=ROUND(@nThick,1,1)) = 1
	begin	
	SELECT @cThckStd = thk FROM dbo.PriceTable WHERE Alloy=@cAlloy and Form=@cForm and cC = @cC and ROUND(CAST( thk AS REAL),1,1)=ROUND(@nThick,1,1)
	SET @nThckStd	= ROUND(@nThick,1)
	SET @nMatch	= 4
	end
ELSE
IF (SELECT COUNT(*) FROM dbo.PriceTable WHERE Alloy=@cAlloy and Form=@cForm and cC = @cC and ROUND(CAST( thk AS REAL),1,1)=ROUND(@nThick,1,1)) > 1
	begin	
	SET @nThckStd	= ROUND(@nThick,1)
	SET @nMatch	= -4
	end
ELSE
IF (SELECT COUNT(*) FROM dbo.PriceTable WHERE Alloy=@cAlloy and Form=@cForm and cC = @cC and ROUND(CAST( thk AS REAL),0,1)=ROUND(@nThick,0,1)) = 1
	begin
	SELECT @cThckStd = thk FROM dbo.PriceTable WHERE Alloy=@cAlloy and Form=@cForm and cC = @cC and ROUND(CAST( thk AS REAL),0,1)=ROUND(@nThick,0,1)
	SET @nThckStd	= ROUND(@nThick,0) 
	SET @nMatch	= 3
	end
ELSE
IF (SELECT COUNT(*) FROM dbo.PriceTable WHERE Alloy=@cAlloy and Form=@cForm and cC = @cC and ROUND(CAST( thk AS REAL),0,1)=ROUND(@nThick,0,1)) > 1
	begin
	SET @nThckStd	= ROUND(@nThick,0) 
	SET @nMatch	= -3
	end
ELSE
IF (SELECT COUNT(*) FROM dbo.PriceTable WHERE Alloy=@cAlloy and Form=@cForm and cC = @cC and ROUND(CAST( thk AS REAL),-1,1)=ROUND(@nThick,-1,1)) = 1
	begin
	SELECT @cThckStd = thk FROM dbo.PriceTable WHERE Alloy=@cAlloy and Form=@cForm and cC = @cC and ROUND(CAST( thk AS REAL),-1,1)=ROUND(@nThick,-1,1)
	SET @nThckStd	= ROUND(@nThick,-1) 
	SET @nMatch	= -2
	--Round -1 is not close enough, set to Negative
	end
ELSE
IF (SELECT COUNT(*) FROM dbo.PriceTable WHERE Alloy=@cAlloy and Form=@cForm and cC = @cC and ROUND(CAST( thk AS REAL),-1,1)=ROUND(@nThick,-1,1)) > 1
	begin
	SET @nThckStd	= ROUND(@nThick,-1) 
	SET @nMatch	= -2
	end
ELSE
IF (SELECT COUNT(*) FROM dbo.PriceTable WHERE Alloy=@cAlloy and Form=@cForm and cC = @cC and ROUND(CAST( thk AS REAL),-2,1)=ROUND(@nThick,-2,1)) = 1
	begin
	SELECT @cThckStd = thk FROM dbo.PriceTable WHERE Alloy=@cAlloy and Form=@cForm and cC = @cC and ROUND(CAST( thk AS REAL),-2,1)=ROUND(@nThick,-2,1)
	SET @nThckStd	= ROUND(@nThick,-2) 
	SET @nMatch	= -1
	--Round -2 is not close enough, set to Negative
	end
ELSE
IF (SELECT COUNT(*) FROM dbo.PriceTable WHERE Alloy=@cAlloy and Form=@cForm and cC = @cC and ROUND(CAST( thk AS REAL),-2,1)=ROUND(@nThick,-2,1)) > 1
	begin
	SET @nThckStd	= ROUND(@nThick,-2) 
	SET @nMatch	= -1
	end
ELSE
IF (SELECT COUNT(*) FROM dbo.PriceTable WHERE Alloy=@cAlloy and Form=@cForm and cC = @cC ) > 0
	begin
	SET @nThckStd	= -1
	SET @nMatch	= 0
	end
	--Found Alloy,Form,CC Only
ELSE
IF (SELECT COUNT(*) FROM dbo.PriceTable WHERE Alloy=@cAlloy and Form=@cForm ) > 0
	begin
	SET @nThckStd	= -2
	SET @nMatch	= 0
	end
	--Found Alloy,Form Only
ELSE
IF (SELECT COUNT(*) FROM dbo.PriceTable WHERE Alloy=@cAlloy ) > 0
	begin
	SET @nThckStd	= -3
	SET @nMatch	= 0
	end
	--Found Alloy Only
ELSE
	begin	
	SET @nThckStd	= -4
	SET @nMatch	= 0
	end
	--Could not find Alloy,Form,CC,Thck

IF @nMatch < 0
	begin	
	--look for Closer match
	SET @nThckStd =  @nThckStd	
	end
	

IF @nThckStd > 0
begin
   --IF @cForm = ''10'' Or @cForm = ''12'' Or @cForm = ''13'' Or @cForm = ''20'' Or @cForm = ''30'' Or @cForm = ''40'' 
    --These do not use Size2 or Size3

    IF @cForm = ''11'' Or @cForm = ''60'' Or @cForm = ''65'' Or @cForm = ''66'' Or @cForm = ''68'' Or @cForm = ''72'' Or @cForm = ''80'' 
	--check Size2
	SET @nThckStd =  @nThckStd


   
    IF @cForm = ''67'' Or @cForm = ''69'' Or @cForm = ''70'' Or @cForm = ''71'' Or @cForm = ''72'' 
	--Check Size3
	SET @nThckStd =  @nThckStd
end

IF @nMatch < 1
	SET @cThckStd = CAST( @nThckStd AS CHAR )
	--@nMatch

--CAST( @nMatch AS CHAR)


RETURN (@cThckStd)
END




' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[ProperPO]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProperPO]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
/****** Object:  User Defined Function dbo.ProperPO    Script Date: 10/17/2005 1:08:28 PM ******/

CREATE  FUNCTION [dbo].[ProperPO]
(
@vcOrderItem VARCHAR(20)
)
RETURNS CHAR(12)
-- 9 digit PO 
-- 2 Digit item
-- Return 0 for NULL

--DEPRICATED  use dbo.f_ProperSOitem


-- PRINT dbo.ProperPO(''  10000-1'')
-- PRINT dbo.ProperPO(''         1-01'')
AS
BEGIN


DECLARE @cReturnOderItem CHAR(12)
IF LEN(@vcOrderItem)> 3 AND @vcOrderItem IS NOT NULL
	begin
	IF LTRIM(@vcOrderItem) LIKE ''-1-%''
		SET @vcOrderItem = RIGHT(@vcOrderItem, LEN(@vcOrderItem)-1 )
		
	IF LTRIM(@vcOrderItem) = ''-1-01''
		SET @vcOrderItem = ''         0-00''

	IF LTRIM(@vcOrderItem) = ''1-01''
		SET @vcOrderItem = ''        0-00''
		
	IF LTRIM(@vcOrderItem) = ''1-00''
		SET @vcOrderItem = ''        0-00''

	end
	
IF LEN(@vcOrderItem)> 3 AND @vcOrderItem IS NOT NULL
    begin
	SET @vcOrderItem = RTRIM(@vcOrderItem)
	DECLARE @nOrder NUMERIC(9,0)
	DECLARE @vcOrder VARCHAR(20)
	DECLARE @nItem NUMERIC(2,0)
	DECLARE @nTest INT
	DECLARE @vcTestOrder VARCHAR(20)
	DECLARE @nTestOrderI INT
	DECLARE @nTestItem NUMERIC(2,0)
	DECLARE @vcTestItem VARCHAR(20)

	SET @nTest = CHARINDEX ( ''-'',@vcOrderItem) 
	IF @nTest > 0	
	    begin
		SET @vcTestOrder = LTRIM( RTRIM( LEFT( @vcOrderItem, CHARINDEX ( ''-'',@vcOrderItem) -1 )))
		SET @nTestOrderI = CAST( @vcTestOrder AS Int )
		IF @nTestOrderI < 1000000000	-- 9 digits are OK
		    Begin
			SET @vcOrder = LTRIM( RTRIM( LEFT( @vcOrderItem, CHARINDEX ( ''-'',@vcOrderItem) -1 ) ))
			SET @nOrder = CAST(@vcOrder AS NUMERIC(9,0) )
		    End
		ELSE
			SET @nOrder = 0

		SET @vcTestItem = LTRIM( RTRIM( RIGHT( @vcOrderItem, LEN(@vcOrderItem) - CHARINDEX ( ''-'',@vcOrderItem) )))
		SET @nTestItem = 0

		IF ISNUMERIC(@vcTestItem) = 1
			SET @nTestItem = CAST( @vcTestItem AS NUMERIC(2,0) )
		ELSE
			SET @nTestItem = 0			

		IF @nTestItem < 100	--2 digits are OK
			SET @nItem = @nTestItem
		ELSE
			SET @nItem = 0
	
		IF @nItem > 9	--Place an 0 before item
			SET @cReturnOderItem = STR( @nOrder,9 )+''-''+STR(@nItem,2)
		ELSE
			SET @cReturnOderItem = STR( @nOrder,9 )+''-0''+STR(@nItem,1) 

	    end
	ELSE	--No DASH
		SET @cReturnOderItem = ''999999999-99''

    end
ELSE
	IF @vcOrderItem IS NULL	
		SET @cReturnOderItem = @vcOrderItem	--Return the Null
	ELSE
		SET @cReturnOderItem = ''        0-00''	--Less than 3 digits

RETURN (@cReturnOderItem)
END







' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[ProperSO]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProperSO]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

/****** Object:  User Defined Function dbo.ProperPO    Script Date: 10/17/2005 1:08:28 PM ******/

CREATE FUNCTION [dbo].[ProperSO]
(
@vcOrderItem VARCHAR(20)
)
RETURNS CHAR(10)
-- 7 digit SO 
-- 2 Digit item

--DEPRICATED use dbo.f_ProperPOitem

-- Return 0 for NULL
-- PRINT dbo.[ProperSO](''  10000-1'')
AS
BEGIN

IF LEN(@vcOrderItem)> 3 AND @vcOrderItem IS NOT NULL
	begin
	IF LTRIM(@vcOrderItem) LIKE ''-1-%''
		SET @vcOrderItem = RIGHT(@vcOrderItem, LEN(@vcOrderItem)-1 )
	IF LTRIM(@vcOrderItem) = ''-1-01''
		SET @vcOrderItem = ''       0-00''
	IF LTRIM(@vcOrderItem) = ''1-01''
		SET @vcOrderItem = ''      0-00''
	IF LTRIM(@vcOrderItem) = ''1-00''
		SET @vcOrderItem = ''      0-00''
	end

	
DECLARE @cReturnOderItem CHAR(10)
IF LEN(@vcOrderItem)> 3 AND @vcOrderItem IS NOT NULL
    begin
	SET @vcOrderItem = RTRIM(@vcOrderItem)
	DECLARE @nOrder NUMERIC(7,0)
	DECLARE @vcOrder VARCHAR(20)
	DECLARE @nItem NUMERIC(2,0)
	DECLARE @nTest INT
	DECLARE @vcTestOrder VARCHAR(20)
	DECLARE @nTestOrderI INT
	DECLARE @nTestItem NUMERIC(2,0)
	DECLARE @vcTestItem VARCHAR(20)

	SET @nTest = CHARINDEX ( ''-'',@vcOrderItem) 
	IF @nTest > 0	
	    begin
		SET @vcTestOrder = LTRIM( RTRIM( LEFT( @vcOrderItem, CHARINDEX ( ''-'',@vcOrderItem) -1 )))
		SET @nTestOrderI = CAST( @vcTestOrder AS Int )
		IF @nTestOrderI < 10000000	-- 7 digits are OK
		    Begin
			SET @vcOrder = LTRIM( RTRIM( LEFT( @vcOrderItem, CHARINDEX ( ''-'',@vcOrderItem) -1 ) ))
			SET @nOrder = CAST(@vcOrder AS NUMERIC(7,0) )
		    End
		ELSE
			SET @nOrder = 0

		SET @vcTestItem = LTRIM( RTRIM( RIGHT( @vcOrderItem, LEN(@vcOrderItem) - CHARINDEX ( ''-'',@vcOrderItem) )))
		SET @nTestItem = 0

		IF ISNUMERIC(@vcTestItem) = 1
			SET @nTestItem = CAST( @vcTestItem AS NUMERIC(2,0) )
		ELSE
			SET @nTestItem = 0			

		IF @nTestItem < 100	--2 digits are OK
			SET @nItem = @nTestItem
		ELSE
			SET @nItem = 0
	
		IF @nItem > 9	--Place an 0 before item
			SET @cReturnOderItem = STR( @nOrder,7 )+''-''+STR(@nItem,2)
		ELSE
			SET @cReturnOderItem = STR( @nOrder,7 )+''-0''+STR(@nItem,1) 

	    end
	ELSE	--No DASH
		SET @cReturnOderItem = ''9999999-99''

    end
ELSE
	IF @vcOrderItem IS NULL	
		SET @cReturnOderItem = @vcOrderItem	--Return the Null
	ELSE
		SET @cReturnOderItem = ''      0-00''	--Less than 3 digits

RETURN (@cReturnOderItem)
END






' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[Remove0]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Remove0]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<David Kirchner>
-- Description:	<Done in FoxPro>
-- =============================================


--Depricated, use f_Remove0
CREATE FUNCTION [dbo].[Remove0]
(
@nIN AS Float
,@nINT AS INT
,@nDec AS INT
)
RETURNS VARCHAR(20)
AS
BEGIN
--PRINT dbo.Remove0(100.0,5,2)
--PRINT dbo.Remove0(100.1110,5,2)



----------------------------
--Work in progress
----------------------------


DECLARE @cOUT VARCHAR(20)

SET @cOUT = RTRIM(LTRIM(CONVERT( VARCHAR(20), @nIN )))

RETURN @cOUT

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[SalesP_Name]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SalesP_Name]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[SalesP_Name] 
(
@SalesP CHAR(1)
)

RETURNS VARCHAR(20)

AS
BEGIN
--SET NOCOUNT ON
--PRINT dbo.SalesP_Name(''D'')
--Returns full name from Inital

DECLARE @SpDescript VARCHAR(20)

IF @SalesP = ''0''
	SET @SpDescript = ''Production Order    ''
ELSE
	SELECT @SpDescript=[Un] FROM dbo.AppSetup WHERE [Prp] = ''SalesP'' AND [Ans] = @SalesP AND [UN]!=[Ans]

RETURN @SpDescript
END' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[SalesPDescription]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SalesPDescription]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[SalesPDescription] 
(
@SalesP char(1)
)

RETURNS VARCHAR(20)
AS
BEGIN
----------------




--depricated
-- use f_SalesPDescription





--
--SET NOCOUNT ON
--PRINT dbo.SalesPDescription(''D'')

DECLARE @SpDescript AS VARCHAR(20)

IF @SalesP = ''0''
	SET @SpDescript = ''Production Order    ''
ELSE
	SELECT @SpDescript=[Un] FROM dbo.AppSetup WHERE [Prp] = ''SalesP'' AND [Ans] = @SalesP AND [UN]!=[Ans] AND LEN([UN]) > 0

RETURN @SpDescript
END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[SalesPEmail]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SalesPEmail]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[SalesPEmail] 
(
@SalesP char(1)
)

RETURNS VARCHAR(30)
AS
BEGIN
--SET NOCOUNT ON
--PRINT dbo.SalesPEmail(''D'')

	DECLARE @SpDescript AS VARCHAR(20)
	DECLARE @SpEmail AS VARCHAR(30)

	IF @SalesP = ''0''
		SET @SpDescript = ''Production Order    ''
	ELSE
		SELECT @SpDescript=[Un] FROM dbo.AppSetup WHERE [Prp] = ''SalesP'' AND [Ans] = @SalesP AND [UN]!=[Ans]

	SELECT @SpEmail = [ANS] FROM dbo.AppSetup WHERE [Prp] = ''E-mail'' AND [UN] = @SpDescript

	RETURN @SpEmail
END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[SalesPInit]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SalesPInit]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[SalesPInit] 
(
@SpDescript VARCHAR(20)
)

RETURNS CHAR(1)
AS
BEGIN
--SET NOCOUNT ON
--PRINT dbo.SalesPInit(''David Kirchner'')

DECLARE @SalesP AS CHAR(1)

SELECT @SalesP= [Ans] FROM dbo.AppSetup WHERE [Prp] = ''SalesP'' AND [Un]=@SpDescript

SET @SalesP = ISNULL(@SalesP,'' '')

RETURN @SalesP
END



' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[ShipWhereDescription]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShipWhereDescription]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[ShipWhereDescription] 
( @nValue AS TinyInt
)

RETURNS CHAR(12)
AS
BEGIN
--dbo.[ShipWhereDescription](1)

DECLARE @cReturn AS CHAR(8)
SET @cReturn = ''Tipton''


IF @nValue = 1
	SET @cReturn = ''Tipton''
	
IF @nValue = 2
	SET @cReturn = ''Direct''
	
IF @nValue = 3
	SET @cReturn = ''Blind''
	
IF @nValue = 4
	SET @cReturn = ''Service''
	
IF @nValue = 5
	SET @cReturn = ''Windfall''
	
RETURN @cReturn 
END





' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[StockLstIDform]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StockLstIDform]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[StockLstIDform] 
(
@ID AS INT
)

RETURNS CHAR(2)
AS
BEGIN

DECLARE @Form AS CHAR(2)
DECLARE @nCount AS INT

SELECT @nCount = COUNT(*) FROM dbo.StockLst_Master WHERE ID = @ID

IF @nCount > 0
	SELECT @Form = Form FROM dbo.StockLst_Master WHERE ID = @ID
ELSE
	SELECT @Form = Form FROM dbo.Ar_StockLst_Master_History WHERE ID = @ID

RETURN @Form 
END





' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[UDF_ParseAlphaChars]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UDF_ParseAlphaChars]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[UDF_ParseAlphaChars]
 (
 @string VARCHAR(8000)
 )
 RETURNS VARCHAR(8000)
 AS
 BEGIN
 
 /*
 --SELECT dbo.UDF_ParseAlphaChars(''ABC”_I+{D[]}4|:e;””5,<.F>/?6'')
 */
 
 DECLARE @IncorrectCharLoc SMALLINT
 SET @IncorrectCharLoc = PATINDEX(''%[^0-9A-Za-z]%'', @string)
 
 WHILE @IncorrectCharLoc > 0
	BEGIN
	SET @string = STUFF(@string, @IncorrectCharLoc, 1, '''')
	SET @IncorrectCharLoc = PATINDEX(''%[^0-9A-Za-z]%'', @string)
 END
 SET @string = @string
 
 RETURN @string
 END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[UDF_ParseChars_Int]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UDF_ParseChars_Int]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[UDF_ParseChars_Int]
 (
 @string VARCHAR(8000)
 )
 RETURNS INT
 AS
 BEGIN
 /*
 --SELECT dbo.UDF_ParseChars_Int(''ABC”_I+{D[]}4|:e;””5,<.F>/?6'')
 --Stops looking after ''-''
 */
 
 DECLARE @ReturnInt INT
 
 DECLARE @IncorrectCharLoc SMALLINT
 SET @IncorrectCharLoc = PATINDEX(''%[^0-9]%'', @string)
 
 WHILE @IncorrectCharLoc > 0
	BEGIN
	SET @string = STUFF(@string, @IncorrectCharLoc, 1, '''')
	SET @IncorrectCharLoc = PATINDEX(''%[^0-9]%'', @string)
	IF SUBSTRING( @string,@IncorrectCharLoc, 1) = ''-''
		SET @string = LEFT( @string, @IncorrectCharLoc )
		
	END
	
 SET @ReturnInt = CAST(LEFT(@string,9) AS INT)
 
 RETURN @ReturnInt
 
 END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[WeightBracket]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WeightBracket]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[WeightBracket] 
(
@nWeight Float
)

RETURNS CHAR(4)
AS
BEGIN
--SELECT dbo.WeightBracket(48) AS [WeightBracket]


DECLARE @cMessage as CHAR(4)
SET @cMessage = ''''

SELECT @cMessage = 
(CASE WHEN @nWeight <= 5 THEN ''0'' 
			WHEN @nWeight < 10 THEN ''5''
			WHEN @nWeight < 25 THEN ''10''
			WHEN @nWeight < 50 THEN ''25''
			WHEN @nWeight < 100 THEN ''50''
			WHEN @nWeight < 200 THEN ''100''
			WHEN @nWeight < 500 THEN ''200''
			WHEN @nWeight < 1000 THEN ''500''
			WHEN @nWeight < 2000 THEN ''1000''
			WHEN @nWeight < 4000 THEN ''2000''
			ELSE ''BASE''  END) 


RETURN @cMessage
END


' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[Whos_Sales_Order]    Script Date: 12/26/2025 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Whos_Sales_Order]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[Whos_Sales_Order]
(
@nSO INT
)
RETURNS CHAR(11)
-- 10 digit SO + SalesP
-- Only 7 Digit SO used at present 2003
-- Return 0 for NULL
AS
BEGIN
--PRINT dbo.Whos_Sales_Order(55000)
DECLARE @cSalesP CHAR(1)
DECLARE @cCover CHAR(1)
DECLARE @nCntSO	DECIMAL(10,0)

SET @nCntSO = 0

IF @nSO > 0
	SELECT @nCntSO = COUNT(*), @cSalesP = AQ.SalesP, @cCover = AQ.Cover FROM dbo.AllQuotes AQ WHERE SalesNum = @nSO GROUP BY SalesP, Cover

IF LEN(@cSalesP) > 0
	IF @cSalesP = ''1''
		IF LEN(@cCover) > 0
			SET @cSalesP = @cCover

DECLARE @cReturn CHAR(11)
SET @cReturn = CAST( ISNULL(@nCntSO,0) AS CHAR(10) ) + ISNULL(@cSalesP,'' '')

RETURN (@cReturn)
END





' 
END
GO
