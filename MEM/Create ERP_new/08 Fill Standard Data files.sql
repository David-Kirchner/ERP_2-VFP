-- Created by GitHub Copilot in SSMS - review carefully before executing
/*
=========================================================================
Script: Copy Master Data from HPAlloy to ERP_1 (Without WaterJetMachines)
Purpose: Copy reference/master data from HPAlloy database to ERP_1
=========================================================================
IMPORTANT: 
- This script will DELETE existing data in target tables (FKs disabled)
- Handles identity columns with IDENTITY_INSERT + explicit column lists
- EXCLUDES computed columns from INSERT statements
- EXCLUDES WaterJetMachines (FK dependency on EquipmentMachineType)
- Uses three-part names for cross-database operations
- Review carefully before executing
- Consider backing up ERP_1 before running
=========================================================================
*/

BEGIN TRANSACTION;

BEGIN TRY
    PRINT 'Starting master data copy process...';
    PRINT '';

    -- Disable all foreign key constraints in ERP_1
    PRINT 'Disabling foreign key constraints...';
    DECLARE @sql NVARCHAR(MAX) = '';
    SELECT @sql = @sql + 'ALTER TABLE [ERP_1].' + QUOTENAME(s.name) + '.' + QUOTENAME(t.name) + ' NOCHECK CONSTRAINT ALL;' + CHAR(13)
    FROM [ERP_1].sys.tables t
    INNER JOIN [ERP_1].sys.schemas s ON t.schema_id = s.schema_id;
    EXEC sp_executesql @sql;
    PRINT 'Foreign key constraints disabled.';
    PRINT '';

    -- Clear existing data using DELETE (dependent tables first)
    PRINT 'Deleting existing data from target tables...';
    
    -- Delete from dependent tables first
    DELETE FROM [ERP_1].[dbo].[Alloy_AlloyCategory];
    DELETE FROM [ERP_1].[dbo].[rtr_Machine];
    -- WaterJetMachines removed from script
    
    -- Delete from parent/independent tables
    DELETE FROM [ERP_1].[dbo].[Alloy];
    DELETE FROM [ERP_1].[dbo].[Alloy_GL];
    DELETE FROM [ERP_1].[dbo].[Alloy_Spec];
    DELETE FROM [ERP_1].[dbo].[AlloyCategory];
    DELETE FROM [ERP_1].[dbo].[Alloys];
    DELETE FROM [ERP_1].[dbo].[AlloySurcharge];
    DELETE FROM [ERP_1].[dbo].[ConditionCode];
    DELETE FROM [ERP_1].[dbo].[ConditionCodeAdjust];
    DELETE FROM [ERP_1].[dbo].[ConditionLevel];
    DELETE FROM [ERP_1].[dbo].[Countries];
    DELETE FROM [ERP_1].[dbo].[District];
    DELETE FROM [ERP_1].[dbo].[District_SalesP];
    DELETE FROM [ERP_1].[dbo].[District_St];
    DELETE FROM [ERP_1].[dbo].[Forms];
    DELETE FROM [ERP_1].[dbo].[GFM_Machines];
    DELETE FROM [ERP_1].[dbo].[Hardness];
    DELETE FROM [ERP_1].[dbo].[Hardwood];
    DELETE FROM [ERP_1].[dbo].[IND_Type];
    DELETE FROM [ERP_1].[dbo].[Mach_Type];
    DELETE FROM [ERP_1].[dbo].[Melt_Type];
    DELETE FROM [ERP_1].[dbo].[PO_StockLst_Def];
    DELETE FROM [ERP_1].[dbo].[POstatusDef];
    DELETE FROM [ERP_1].[dbo].[prc_Equipment];
    DELETE FROM [ERP_1].[dbo].[prc_Equipment_Extra_Barcodes];
    DELETE FROM [ERP_1].[dbo].[prc_ScanName];
    DELETE FROM [ERP_1].[dbo].[PU];
    DELETE FROM [ERP_1].[dbo].[rtr_Operation];
    DELETE FROM [ERP_1].[dbo].[Scan_Code];
    DELETE FROM [ERP_1].[dbo].[Spec_Check];
    DELETE FROM [ERP_1].[dbo].[Spec_tol];
    DELETE FROM [ERP_1].[dbo].[StandardSize];
    DELETE FROM [ERP_1].[dbo].[UPSshiproute];
    DELETE FROM [ERP_1].[dbo].[UPSStdShiproute];
    DELETE FROM [ERP_1].[dbo].[Weight_Flanges];
    DELETE FROM [ERP_1].[dbo].[wPipe];
    
    PRINT 'Existing data deleted successfully.';
    PRINT '';

    -- =====================================================================
    -- Copy data: parent/independent tables first
    -- =====================================================================
    PRINT 'Copying data from HPAlloy...';

    -- Alloy (no identity)
    INSERT INTO [ERP_1].[dbo].[Alloy]
        SELECT * FROM [HPAlloy].[dbo].[Alloy];
    PRINT 'Copied Alloy: ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' rows';

    -- AlloyCategory (identity: AlloyCategoryID)
    SET IDENTITY_INSERT [ERP_1].[dbo].[AlloyCategory] ON;
    INSERT INTO [ERP_1].[dbo].[AlloyCategory]
        ([AlloyCategoryID], [AlloyCategoryName])
    SELECT  [AlloyCategoryID], [AlloyCategoryName]
    FROM    [HPAlloy].[dbo].[AlloyCategory];
    SET IDENTITY_INSERT [ERP_1].[dbo].[AlloyCategory] OFF;
    PRINT 'Copied AlloyCategory: ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' rows';

    -- Alloys (no identity)
    INSERT INTO [ERP_1].[dbo].[Alloys]
        SELECT * FROM [HPAlloy].[dbo].[Alloys];
    PRINT 'Copied Alloys: ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' rows';

    -- Alloy_GL (no identity)
    INSERT INTO [ERP_1].[dbo].[Alloy_GL]
        SELECT * FROM [HPAlloy].[dbo].[Alloy_GL];
    PRINT 'Copied Alloy_GL: ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' rows';

    -- Alloy_Spec (identity: ID)
    SET IDENTITY_INSERT [ERP_1].[dbo].[Alloy_Spec] ON;
    INSERT INTO [ERP_1].[dbo].[Alloy_Spec]
        ([ID], [Alloy], [Forms], [MinThk], [MaxThk], [Group], [Spec], [Rev], [Title], [Scope], [InActive])
    SELECT  [ID], [Alloy], [Forms], [MinThk], [MaxThk], [Group], [Spec], [Rev], [Title], [Scope], [InActive]
    FROM    [HPAlloy].[dbo].[Alloy_Spec];
    SET IDENTITY_INSERT [ERP_1].[dbo].[Alloy_Spec] OFF;
    PRINT 'Copied Alloy_Spec: ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' rows';

    -- AlloySurcharge (identity: ID - EXCLUDING computed columns Co, Cr, Cu, Fe, Ni, Mo, Ti)
    SET IDENTITY_INSERT [ERP_1].[dbo].[AlloySurcharge] ON;
    INSERT INTO [ERP_1].[dbo].[AlloySurcharge]
        ([Co_Base], [Co_Now], [Cr_Base], [Cr_Now],
         [Cu_Base], [Cu_Now], [Fe_Base], [Fe_Now],
         [Ni_Base], [Ni_Now], [Mo_Base], [Mo_Now],
         [Ti_Base], [Ti_Now], [ID])
    SELECT  [Co_Base], [Co_Now], [Cr_Base], [Cr_Now],
            [Cu_Base], [Cu_Now], [Fe_Base], [Fe_Now],
            [Ni_Base], [Ni_Now], [Mo_Base], [Mo_Now],
            [Ti_Base], [Ti_Now], [ID]
    FROM    [HPAlloy].[dbo].[AlloySurcharge];
    SET IDENTITY_INSERT [ERP_1].[dbo].[AlloySurcharge] OFF;
    PRINT 'Copied AlloySurcharge: ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' rows';

    -- ConditionCode (no identity)
    INSERT INTO [ERP_1].[dbo].[ConditionCode]
        SELECT * FROM [HPAlloy].[dbo].[ConditionCode];
    PRINT 'Copied ConditionCode: ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' rows';

    -- ConditionCodeAdjust (identity: ID - last column)
    SET IDENTITY_INSERT [ERP_1].[dbo].[ConditionCodeAdjust] ON;
    INSERT INTO [ERP_1].[dbo].[ConditionCodeAdjust]
        ([A], [B], [C], [D], [E], [F], [S], [T], [U], [V], [W], [X], [Y], [ID])
    SELECT  [A], [B], [C], [D], [E], [F], [S], [T], [U], [V], [W], [X], [Y], [ID]
    FROM    [HPAlloy].[dbo].[ConditionCodeAdjust];
    SET IDENTITY_INSERT [ERP_1].[dbo].[ConditionCodeAdjust] OFF;
    PRINT 'Copied ConditionCodeAdjust: ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' rows';

    -- ConditionLevel (no identity)
    INSERT INTO [ERP_1].[dbo].[ConditionLevel]
        SELECT * FROM [HPAlloy].[dbo].[ConditionLevel];
    PRINT 'Copied ConditionLevel: ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' rows';

    -- Countries (no identity)
    INSERT INTO [ERP_1].[dbo].[Countries]
        SELECT * FROM [HPAlloy].[dbo].[Countries];
    PRINT 'Copied Countries: ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' rows';

    -- District (identity: ID)
    SET IDENTITY_INSERT [ERP_1].[dbo].[District] ON;
    INSERT INTO [ERP_1].[dbo].[District]
        ([ID], [District], [State])
    SELECT  [ID], [District], [State]
    FROM    [HPAlloy].[dbo].[District];
    SET IDENTITY_INSERT [ERP_1].[dbo].[District] OFF;
    PRINT 'Copied District: ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' rows';

    -- District_SalesP (no identity)
    INSERT INTO [ERP_1].[dbo].[District_SalesP]
        SELECT * FROM [HPAlloy].[dbo].[District_SalesP];
    PRINT 'Copied District_SalesP: ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' rows';

    -- District_St (no identity)
    INSERT INTO [ERP_1].[dbo].[District_St]
        SELECT * FROM [HPAlloy].[dbo].[District_St];
    PRINT 'Copied District_St: ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' rows';

    -- Forms (no identity)
    INSERT INTO [ERP_1].[dbo].[Forms]
        SELECT * FROM [HPAlloy].[dbo].[Forms];
    PRINT 'Copied Forms: ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' rows';

    -- GFM_Machines (identity: GFMId)
    SET IDENTITY_INSERT [ERP_1].[dbo].[GFM_Machines] ON;
    INSERT INTO [ERP_1].[dbo].[GFM_Machines]
        ([GFMId], [GFM], [OpeningHeight])
    SELECT  [GFMId], [GFM], [OpeningHeight]
    FROM    [HPAlloy].[dbo].[GFM_Machines];
    SET IDENTITY_INSERT [ERP_1].[dbo].[GFM_Machines] OFF;
    PRINT 'Copied GFM_Machines: ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' rows';

    -- Hardness (no identity)
    INSERT INTO [ERP_1].[dbo].[Hardness]
        SELECT * FROM [HPAlloy].[dbo].[Hardness];
    PRINT 'Copied Hardness: ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' rows';

    -- Hardwood (identity: ID)
    SET IDENTITY_INSERT [ERP_1].[dbo].[Hardwood] ON;
    INSERT INTO [ERP_1].[dbo].[Hardwood]
        ([ID], [country], [abv], [summary], [webpage], [printout], [inactive])
    SELECT  [ID], [country], [abv], [summary], [webpage], [printout], [inactive]
    FROM    [HPAlloy].[dbo].[Hardwood];
    SET IDENTITY_INSERT [ERP_1].[dbo].[Hardwood] OFF;
    PRINT 'Copied Hardwood: ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' rows';

    -- IND_Type (no identity)
    INSERT INTO [ERP_1].[dbo].[IND_Type]
        SELECT * FROM [HPAlloy].[dbo].[IND_Type];
    PRINT 'Copied IND_Type: ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' rows';

    -- Mach_Type (identity: ID)
    SET IDENTITY_INSERT [ERP_1].[dbo].[Mach_Type] ON;
    INSERT INTO [ERP_1].[dbo].[Mach_Type]
        ([ID], [Mach_Type], [Machine])
    SELECT  [ID], [Mach_Type], [Machine]
    FROM    [HPAlloy].[dbo].[Mach_Type];
    SET IDENTITY_INSERT [ERP_1].[dbo].[Mach_Type] OFF;
    PRINT 'Copied Mach_Type: ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' rows';

    -- Melt_Type (no identity)
    INSERT INTO [ERP_1].[dbo].[Melt_Type]
        SELECT * FROM [HPAlloy].[dbo].[Melt_Type];
    PRINT 'Copied Melt_Type: ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' rows';

    -- PO_StockLst_Def (no identity)
    INSERT INTO [ERP_1].[dbo].[PO_StockLst_Def]
        SELECT * FROM [HPAlloy].[dbo].[PO_StockLst_Def];
    PRINT 'Copied PO_StockLst_Def: ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' rows';

    -- POstatusDef (no identity)
    INSERT INTO [ERP_1].[dbo].[POstatusDef]
        SELECT * FROM [HPAlloy].[dbo].[POstatusDef];
    PRINT 'Copied POstatusDef: ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' rows';

    -- prc_Equipment (no identity)
    INSERT INTO [ERP_1].[dbo].[prc_Equipment]
        SELECT * FROM [HPAlloy].[dbo].[prc_Equipment];
    PRINT 'Copied prc_Equipment: ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' rows';

    -- prc_Equipment_Extra_Barcodes (identity: ID)
    SET IDENTITY_INSERT [ERP_1].[dbo].[prc_Equipment_Extra_Barcodes] ON;
    INSERT INTO [ERP_1].[dbo].[prc_Equipment_Extra_Barcodes]
        ([ID], [Description], [Location], [ScanName])
    SELECT  [ID], [Description], [Location], [ScanName]
    FROM    [HPAlloy].[dbo].[prc_Equipment_Extra_Barcodes];
    SET IDENTITY_INSERT [ERP_1].[dbo].[prc_Equipment_Extra_Barcodes] OFF;
    PRINT 'Copied prc_Equipment_Extra_Barcodes: ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' rows';

    -- prc_ScanName (no identity)
    INSERT INTO [ERP_1].[dbo].[prc_ScanName]
        SELECT * FROM [HPAlloy].[dbo].[prc_ScanName];
    PRINT 'Copied prc_ScanName: ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' rows';

    -- PU (no identity)
    INSERT INTO [ERP_1].[dbo].[PU]
        SELECT * FROM [HPAlloy].[dbo].[PU];
    PRINT 'Copied PU: ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' rows';

    -- rtr_Operation (identity: Oper_ID - EXCLUDING computed column jobClass)
    SET IDENTITY_INSERT [ERP_1].[dbo].[rtr_Operation] ON;
    INSERT INTO [ERP_1].[dbo].[rtr_Operation]
        ([Oper_ID], [Operation], [jobClassID], [jobType], [StdDetail], [Better_ID], [CreateUser])
    SELECT  [Oper_ID], [Operation], [jobClassID], [jobType], [StdDetail], [Better_ID], [CreateUser]
    FROM    [HPAlloy].[dbo].[rtr_Operation];
    SET IDENTITY_INSERT [ERP_1].[dbo].[rtr_Operation] OFF;
    PRINT 'Copied rtr_Operation: ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' rows';

    -- Scan_Code (identity: ID)
    SET IDENTITY_INSERT [ERP_1].[dbo].[Scan_Code] ON;
    INSERT INTO [ERP_1].[dbo].[Scan_Code]
        ([ID], [Code], [Descript], [Min], [Max], [Base])
    SELECT  [ID], [Code], [Descript], [Min], [Max], [Base]
    FROM    [HPAlloy].[dbo].[Scan_Code];
    SET IDENTITY_INSERT [ERP_1].[dbo].[Scan_Code] OFF;
    PRINT 'Copied Scan_Code: ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' rows';

    -- Spec_Check (identity: ID - col 98)
    SET IDENTITY_INSERT [ERP_1].[dbo].[Spec_Check] ON;
    INSERT INTO [ERP_1].[dbo].[Spec_Check]
        ([alloy], [group], [CC], [CL], [spec], [rev], [description],
         [diamax], [diamin], [utsmax], [utsmin], [yldmax], [yldmin], [elmin], [ramin],
         [bhnmax], [bhnmin], [rcmax], [rcmin], [rbmax], [rbmin],
         [grainmax], [grainmin], [almax], [almin], [alrem],
         [bmax], [bmin], [bemax], [bemin], [cmax], [cmin], [cbmax], [cbmin],
         [comax], [comin], [corem], [crmax], [crmin], [cumax], [cumin], [curem],
         [femax], [femin], [ferem], [hmax], [hmin], [mgmax], [mgmin], [mgrem],
         [mnmax], [mnmin], [momax], [momin], [morem], [nmax], [nmin],
         [namax], [namin], [nbmax], [nbmin], [nimax], [nimin], [nirem],
         [omin], [omax], [pmax], [pmin], [pbmax], [pbmin], [pbrem],
         [smax], [smin], [simax], [simin], [tamax], [tamin],
         [timax], [timin], [tirem], [vmax], [vmin], [wmax], [wmin], [wrem],
         [ymax], [ymin], [cbtamax], [cbtamin], [nicomax], [nicomin],
         [fecrnimax], [fecrnimin], [stabilize], [stabilize2],
         [memo], [exception], [ID], [Who], [When])
    SELECT  [alloy], [group], [CC], [CL], [spec], [rev], [description],
            [diamax], [diamin], [utsmax], [utsmin], [yldmax], [yldmin], [elmin], [ramin],
            [bhnmax], [bhnmin], [rcmax], [rcmin], [rbmax], [rbmin],
            [grainmax], [grainmin], [almax], [almin], [alrem],
            [bmax], [bmin], [bemax], [bemin], [cmax], [cmin], [cbmax], [cbmin],
            [comax], [comin], [corem], [crmax], [crmin], [cumax], [cumin], [curem],
            [femax], [femin], [ferem], [hmax], [hmin], [mgmax], [mgmin], [mgrem],
            [mnmax], [mnmin], [momax], [momin], [morem], [nmax], [nmin],
            [namax], [namin], [nbmax], [nbmin], [nimax], [nimin], [nirem],
            [omin], [omax], [pmax], [pmin], [pbmax], [pbmin], [pbrem],
            [smax], [smin], [simax], [simin], [tamax], [tamin],
            [timax], [timin], [tirem], [vmax], [vmin], [wmax], [wmin], [wrem],
            [ymax], [ymin], [cbtamax], [cbtamin], [nicomax], [nicomin],
            [fecrnimax], [fecrnimin], [stabilize], [stabilize2],
            [memo], [exception], [ID], [Who], [When]
    FROM    [HPAlloy].[dbo].[Spec_Check];
    SET IDENTITY_INSERT [ERP_1].[dbo].[Spec_Check] OFF;
    PRINT 'Copied Spec_Check: ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' rows';

    -- Spec_tol (identity: ID - last column)
    SET IDENTITY_INSERT [ERP_1].[dbo].[Spec_tol] ON;
    INSERT INTO [ERP_1].[dbo].[Spec_tol]
        ([uns], [form], [spec], [rev], [revy], [toltable], [condition], [finish],
         [size1], [size2], [width1], [width2], [plus], [minus], [ooround],
         [straight], [straightnum], [flat], [flatnum], [camber], [cambernum],
         [cut_p], [cut_pnum], [cut_m], [cut_mnum],
         [len_p], [len_pnum], [len_m], [len_mnum],
         [abrasive_p], [abrasive_m], [plasma_p], [plasma_m], [comment], [ID])
    SELECT  [uns], [form], [spec], [rev], [revy], [toltable], [condition], [finish],
            [size1], [size2], [width1], [width2], [plus], [minus], [ooround],
            [straight], [straightnum], [flat], [flatnum], [camber], [cambernum],
            [cut_p], [cut_pnum], [cut_m], [cut_mnum],
            [len_p], [len_pnum], [len_m], [len_mnum],
            [abrasive_p], [abrasive_m], [plasma_p], [plasma_m], [comment], [ID]
    FROM    [HPAlloy].[dbo].[Spec_tol];
    SET IDENTITY_INSERT [ERP_1].[dbo].[Spec_tol] OFF;
    PRINT 'Copied Spec_tol: ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' rows';

    -- StandardSize (no identity)
    INSERT INTO [ERP_1].[dbo].[StandardSize]
        SELECT * FROM [HPAlloy].[dbo].[StandardSize];
    PRINT 'Copied StandardSize: ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' rows';

    -- UPSshiproute (no identity)
    INSERT INTO [ERP_1].[dbo].[UPSshiproute]
        SELECT * FROM [HPAlloy].[dbo].[UPSshiproute];
    PRINT 'Copied UPSshiproute: ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' rows';

    -- UPSStdShiproute (no identity)
    INSERT INTO [ERP_1].[dbo].[UPSStdShiproute]
        SELECT * FROM [HPAlloy].[dbo].[UPSStdShiproute];
    PRINT 'Copied UPSStdShiproute: ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' rows';

    -- Weight_Flanges (identity: ID - last column)
    SET IDENTITY_INSERT [ERP_1].[dbo].[Weight_Flanges] ON;
    INSERT INTO [ERP_1].[dbo].[Weight_Flanges]
        ([type], [LB], [Size], [lbs], [ID])
    SELECT  [type], [LB], [Size], [lbs], [ID]
    FROM    [HPAlloy].[dbo].[Weight_Flanges];
    SET IDENTITY_INSERT [ERP_1].[dbo].[Weight_Flanges] OFF;
    PRINT 'Copied Weight_Flanges: ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' rows';

    -- wPipe (identity: ID - last column)
    SET IDENTITY_INSERT [ERP_1].[dbo].[wPipe] ON;
    INSERT INTO [ERP_1].[dbo].[wPipe]
        ([pipesize], [schedule], [lbs_in], [nPipeSize], [ID])
    SELECT  [pipesize], [schedule], [lbs_in], [nPipeSize], [ID]
    FROM    [HPAlloy].[dbo].[wPipe];
    SET IDENTITY_INSERT [ERP_1].[dbo].[wPipe] OFF;
    PRINT 'Copied wPipe: ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' rows';

    -- =====================================================================
    -- Dependent tables (parent tables must be loaded first)
    -- =====================================================================

    -- Alloy_AlloyCategory (no identity) - depends on Alloy, AlloyCategory
    INSERT INTO [ERP_1].[dbo].[Alloy_AlloyCategory]
        SELECT * FROM [HPAlloy].[dbo].[Alloy_AlloyCategory];
    PRINT 'Copied Alloy_AlloyCategory: ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' rows';

    -- rtr_Machine (identity: Mach_ID) - depends on rtr_Operation
    SET IDENTITY_INSERT [ERP_1].[dbo].[rtr_Machine] ON;
    INSERT INTO [ERP_1].[dbo].[rtr_Machine]
        ([Mach_ID], [Oper_ID], [Asset_No], [Serial_No], [Model], [Location],
         [IEQ_Code], [EQ_Code], [EQ_Short_Description], [EQ_Long_Description],
         [Tag_Date], [Year_made], [New_Cost], [Value], [Replacement_Cost],
         [Date_Installed], [Date_Retired], [CreateUser])
    SELECT  [Mach_ID], [Oper_ID], [Asset_No], [Serial_No], [Model], [Location],
            [IEQ_Code], [EQ_Code], [EQ_Short_Description], [EQ_Long_Description],
            [Tag_Date], [Year_made], [New_Cost], [Value], [Replacement_Cost],
            [Date_Installed], [Date_Retired], [CreateUser]
    FROM    [HPAlloy].[dbo].[rtr_Machine];
    SET IDENTITY_INSERT [ERP_1].[dbo].[rtr_Machine] OFF;
    PRINT 'Copied rtr_Machine: ' + CAST(@@ROWCOUNT AS VARCHAR(10)) + ' rows';

    -- WaterJetMachines - REMOVED FROM SCRIPT (FK dependency on EquipmentMachineType)

    PRINT '';
    PRINT 'All data copied successfully.';
    PRINT '';

    -- Re-enable all foreign key constraints
    PRINT 'Re-enabling foreign key constraints...';
    SET @sql = '';
    SELECT @sql = @sql + 'ALTER TABLE [ERP_1].' + QUOTENAME(s.name) + '.' + QUOTENAME(t.name) + ' WITH CHECK CHECK CONSTRAINT ALL;' + CHAR(13)
    FROM [ERP_1].sys.tables t
    INNER JOIN [ERP_1].sys.schemas s ON t.schema_id = s.schema_id;
    EXEC sp_executesql @sql;
    PRINT 'Foreign key constraints re-enabled.';
    PRINT '';

    COMMIT TRANSACTION;
    PRINT '=========================================================================';
    PRINT 'Master data copy completed successfully!';
    PRINT '=========================================================================';

END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    PRINT '';
    PRINT '=========================================================================';
    PRINT 'ERROR: Master data copy failed!';
    PRINT 'Error Message : ' + ERROR_MESSAGE();
    PRINT 'Error Line    : ' + CAST(ERROR_LINE() AS VARCHAR(10));
    PRINT '=========================================================================';

    -- Re-enable constraints even on error
    DECLARE @sqlErr NVARCHAR(MAX) = '';
    SELECT @sqlErr = @sqlErr + 'ALTER TABLE [ERP_1].' + QUOTENAME(s.name) + '.' + QUOTENAME(t.name) + ' WITH CHECK CHECK CONSTRAINT ALL;' + CHAR(13)
    FROM [ERP_1].sys.tables t
    INNER JOIN [ERP_1].sys.schemas s ON t.schema_id = s.schema_id;
    EXEC sp_executesql @sqlErr;

    THROW;
END CATCH;
