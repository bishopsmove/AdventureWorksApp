CREATE TABLE [SalesLT].[ProductModel] (
    [ProductModelID]     INT                                                         IDENTITY (1, 1) NOT NULL,
    [Name]               [dbo].[Name]                                                NOT NULL,
    [CatalogDescription] XML(CONTENT [SalesLT].[ProductDescriptionSchemaCollection]) NULL,
    [rowguid]            UNIQUEIDENTIFIER                                            ROWGUIDCOL NOT NULL,
    [ModifiedDate]       DATETIME                                                    NOT NULL
);

