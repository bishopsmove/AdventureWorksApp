ALTER TABLE [SalesLT].[ProductModelProductDescription]
    ADD CONSTRAINT [DF_ProductModelProductDescription_rowguid] DEFAULT (newid()) FOR [rowguid];

