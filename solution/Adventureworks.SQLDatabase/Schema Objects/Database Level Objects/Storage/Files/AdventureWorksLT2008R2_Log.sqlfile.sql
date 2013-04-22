ALTER DATABASE [$(DatabaseName)]
    ADD LOG FILE (NAME = [AdventureWorksLT2008R2_Log], FILENAME = '$(DefaultLogPath)$(DatabaseName)_Log.ldf', MAXSIZE = 2097152 MB, FILEGROWTH = 16384 KB);

