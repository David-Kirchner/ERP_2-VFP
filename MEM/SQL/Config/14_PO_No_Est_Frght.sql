/* PO_No.Est_Frght — estimated freight (header), not PurchaseOrder.OtherP. */
USE [ERP_2];
GO

IF COL_LENGTH('dbo.PO_No', 'Est_Frght') IS NULL
    ALTER TABLE dbo.PO_No ADD Est_Frght MONEY NULL;
GO

PRINT 'dbo.PO_No.Est_Frght ready.';
GO
