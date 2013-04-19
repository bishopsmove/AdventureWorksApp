ALTER TABLE [SalesLT].[CustomerAddress]
    ADD CONSTRAINT [DF_CustomerAddress_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];

