ALTER TABLE [SalesLT].[Product]
    ADD CONSTRAINT [CK_Product_StandardCost] CHECK ([StandardCost]>=(0.00));

