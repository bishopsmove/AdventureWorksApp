ALTER DATABASE [$(DatabaseName)]
    ADD FILE (NAME = [AdventureWorksLT2008R2_Data], FILENAME = '$(DefaultDataPath)$(DatabaseName)_Data.mdf', FILEGROWTH = 16384 KB) TO FILEGROUP [PRIMARY];


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary data file for the AdventureWorks sample database.', @level0type = N'FILEGROUP', @level0name = N'PRIMARY', @level1type = N'LOGICAL FILE NAME', @level1name = N'AdventureWorksLT2008R2_Data';

