ALTER TABLE [SalesLT].[CustomerAddress]
    ADD CONSTRAINT [DF_CustomerAddress_rowguid] DEFAULT (newid()) FOR [rowguid];


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of NEWID()', @level0type = N'SCHEMA', @level0name = N'SalesLT', @level1type = N'TABLE', @level1name = N'CustomerAddress', @level2type = N'CONSTRAINT', @level2name = N'DF_CustomerAddress_rowguid';

