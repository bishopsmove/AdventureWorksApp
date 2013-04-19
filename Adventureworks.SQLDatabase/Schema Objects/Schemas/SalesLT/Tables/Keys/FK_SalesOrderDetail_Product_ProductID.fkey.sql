ALTER TABLE [SalesLT].[SalesOrderDetail]
    ADD CONSTRAINT [FK_SalesOrderDetail_Product_ProductID] FOREIGN KEY ([ProductID]) REFERENCES [SalesLT].[Product] ([ProductID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

