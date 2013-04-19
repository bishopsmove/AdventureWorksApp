ALTER TABLE [dbo].[BuildVersion]
    ADD CONSTRAINT [DF_BuildVersion_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BuildVersion', @level2type = N'CONSTRAINT', @level2name = N'DF_BuildVersion_ModifiedDate';

