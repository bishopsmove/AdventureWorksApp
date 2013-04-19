CREATE TRIGGER [SalesLT].[uSalesOrderHeader] ON [SalesLT].[SalesOrderHeader] 
AFTER UPDATE AS 
BEGIN
DECLARE @Count int;
SET @Count = @@ROWCOUNT;
IF @Count = 0 
RETURN;
SET NOCOUNT ON;
BEGIN TRY
IF NOT (UPDATE([Status]) OR UPDATE([RevisionNumber]))
BEGIN
UPDATE [SalesLT].[SalesOrderHeader]
SET [SalesLT].[SalesOrderHeader].[RevisionNumber] = 
[SalesLT].[SalesOrderHeader].[RevisionNumber] + 1
WHERE [SalesLT].[SalesOrderHeader].[SalesOrderID] IN 
(SELECT inserted.[SalesOrderID] FROM inserted);
END;
END TRY
BEGIN CATCH
EXECUTE [dbo].[uspPrintError];
IF @@TRANCOUNT > 0
BEGIN
ROLLBACK TRANSACTION;
END
EXECUTE [dbo].[uspLogError];
END CATCH;
END;

GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'AFTER UPDATE trigger that updates the RevisionNumber and ModifiedDate columns in the SalesOrderHeader table.', @level0type = N'SCHEMA', @level0name = N'SalesLT', @level1type = N'TABLE', @level1name = N'SalesOrderHeader', @level2type = N'TRIGGER', @level2name = N'uSalesOrderHeader';

