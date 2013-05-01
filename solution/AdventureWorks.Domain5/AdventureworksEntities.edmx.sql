
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 04/30/2013 18:57:13
-- Generated from EDMX file: D:\Repos\GitRepo2\AdventureWorksApp\solution\AdventureWorks.Domain5\AdventureworksEntities.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [AdventureWorks2008R2];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_EmployeeDepartmentHistory_Department_DepartmentID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EmployeeDepartmentHistories] DROP CONSTRAINT [FK_EmployeeDepartmentHistory_Department_DepartmentID];
GO
IF OBJECT_ID(N'[dbo].[FK_Employee_Person_BusinessEntityID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Employees] DROP CONSTRAINT [FK_Employee_Person_BusinessEntityID];
GO
IF OBJECT_ID(N'[dbo].[FK_EmployeeDepartmentHistory_Employee_BusinessEntityID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EmployeeDepartmentHistories] DROP CONSTRAINT [FK_EmployeeDepartmentHistory_Employee_BusinessEntityID];
GO
IF OBJECT_ID(N'[dbo].[FK_EmployeePayHistory_Employee_BusinessEntityID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EmployeePayHistories] DROP CONSTRAINT [FK_EmployeePayHistory_Employee_BusinessEntityID];
GO
IF OBJECT_ID(N'[dbo].[FK_JobCandidate_Employee_BusinessEntityID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[JobCandidates] DROP CONSTRAINT [FK_JobCandidate_Employee_BusinessEntityID];
GO
IF OBJECT_ID(N'[dbo].[FK_PurchaseOrderHeader_Employee_EmployeeID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PurchaseOrderHeaders] DROP CONSTRAINT [FK_PurchaseOrderHeader_Employee_EmployeeID];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesPerson_Employee_BusinessEntityID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesPersons] DROP CONSTRAINT [FK_SalesPerson_Employee_BusinessEntityID];
GO
IF OBJECT_ID(N'[dbo].[FK_EmployeeDepartmentHistory_Shift_ShiftID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EmployeeDepartmentHistories] DROP CONSTRAINT [FK_EmployeeDepartmentHistory_Shift_ShiftID];
GO
IF OBJECT_ID(N'[dbo].[FK_Address_StateProvince_StateProvinceID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Addresses] DROP CONSTRAINT [FK_Address_StateProvince_StateProvinceID];
GO
IF OBJECT_ID(N'[dbo].[FK_BusinessEntityAddress_Address_AddressID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BusinessEntityAddresses] DROP CONSTRAINT [FK_BusinessEntityAddress_Address_AddressID];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesOrderHeader_Address_BillToAddressID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesOrderHeaders] DROP CONSTRAINT [FK_SalesOrderHeader_Address_BillToAddressID];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesOrderHeader_Address_ShipToAddressID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesOrderHeaders] DROP CONSTRAINT [FK_SalesOrderHeader_Address_ShipToAddressID];
GO
IF OBJECT_ID(N'[dbo].[FK_BusinessEntityAddress_AddressType_AddressTypeID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BusinessEntityAddresses] DROP CONSTRAINT [FK_BusinessEntityAddress_AddressType_AddressTypeID];
GO
IF OBJECT_ID(N'[dbo].[FK_BusinessEntityAddress_BusinessEntity_BusinessEntityID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BusinessEntityAddresses] DROP CONSTRAINT [FK_BusinessEntityAddress_BusinessEntity_BusinessEntityID];
GO
IF OBJECT_ID(N'[dbo].[FK_BusinessEntityContact_BusinessEntity_BusinessEntityID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BusinessEntityContacts] DROP CONSTRAINT [FK_BusinessEntityContact_BusinessEntity_BusinessEntityID];
GO
IF OBJECT_ID(N'[dbo].[FK_Person_BusinessEntity_BusinessEntityID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[People] DROP CONSTRAINT [FK_Person_BusinessEntity_BusinessEntityID];
GO
IF OBJECT_ID(N'[dbo].[FK_Store_BusinessEntity_BusinessEntityID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Stores] DROP CONSTRAINT [FK_Store_BusinessEntity_BusinessEntityID];
GO
IF OBJECT_ID(N'[dbo].[FK_Vendor_BusinessEntity_BusinessEntityID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Vendors] DROP CONSTRAINT [FK_Vendor_BusinessEntity_BusinessEntityID];
GO
IF OBJECT_ID(N'[dbo].[FK_BusinessEntityContact_ContactType_ContactTypeID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BusinessEntityContacts] DROP CONSTRAINT [FK_BusinessEntityContact_ContactType_ContactTypeID];
GO
IF OBJECT_ID(N'[dbo].[FK_BusinessEntityContact_Person_PersonID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BusinessEntityContacts] DROP CONSTRAINT [FK_BusinessEntityContact_Person_PersonID];
GO
IF OBJECT_ID(N'[dbo].[FK_CountryRegionCurrency_CountryRegion_CountryRegionCode]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CountryRegionCurrencies] DROP CONSTRAINT [FK_CountryRegionCurrency_CountryRegion_CountryRegionCode];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesTerritory_CountryRegion_CountryRegionCode]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesTerritories] DROP CONSTRAINT [FK_SalesTerritory_CountryRegion_CountryRegionCode];
GO
IF OBJECT_ID(N'[dbo].[FK_StateProvince_CountryRegion_CountryRegionCode]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StateProvinces] DROP CONSTRAINT [FK_StateProvince_CountryRegion_CountryRegionCode];
GO
IF OBJECT_ID(N'[dbo].[FK_EmailAddress_Person_BusinessEntityID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EmailAddresses] DROP CONSTRAINT [FK_EmailAddress_Person_BusinessEntityID];
GO
IF OBJECT_ID(N'[dbo].[FK_Password_Person_BusinessEntityID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Passwords] DROP CONSTRAINT [FK_Password_Person_BusinessEntityID];
GO
IF OBJECT_ID(N'[dbo].[FK_Customer_Person_PersonID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Customers] DROP CONSTRAINT [FK_Customer_Person_PersonID];
GO
IF OBJECT_ID(N'[dbo].[FK_PersonCreditCard_Person_BusinessEntityID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PersonCreditCards] DROP CONSTRAINT [FK_PersonCreditCard_Person_BusinessEntityID];
GO
IF OBJECT_ID(N'[dbo].[FK_PersonPhone_Person_BusinessEntityID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PersonPhones] DROP CONSTRAINT [FK_PersonPhone_Person_BusinessEntityID];
GO
IF OBJECT_ID(N'[dbo].[FK_PersonPhone_PhoneNumberType_PhoneNumberTypeID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PersonPhones] DROP CONSTRAINT [FK_PersonPhone_PhoneNumberType_PhoneNumberTypeID];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesTaxRate_StateProvince_StateProvinceID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesTaxRates] DROP CONSTRAINT [FK_SalesTaxRate_StateProvince_StateProvinceID];
GO
IF OBJECT_ID(N'[dbo].[FK_StateProvince_SalesTerritory_TerritoryID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StateProvinces] DROP CONSTRAINT [FK_StateProvince_SalesTerritory_TerritoryID];
GO
IF OBJECT_ID(N'[dbo].[FK_BillOfMaterials_Product_ComponentID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BillOfMaterials] DROP CONSTRAINT [FK_BillOfMaterials_Product_ComponentID];
GO
IF OBJECT_ID(N'[dbo].[FK_BillOfMaterials_Product_ProductAssemblyID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BillOfMaterials] DROP CONSTRAINT [FK_BillOfMaterials_Product_ProductAssemblyID];
GO
IF OBJECT_ID(N'[dbo].[FK_BillOfMaterials_UnitMeasure_UnitMeasureCode]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BillOfMaterials] DROP CONSTRAINT [FK_BillOfMaterials_UnitMeasure_UnitMeasureCode];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductModelProductDescriptionCulture_Culture_CultureID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductModelProductDescriptionCultures] DROP CONSTRAINT [FK_ProductModelProductDescriptionCulture_Culture_CultureID];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductModelIllustration_Illustration_IllustrationID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductModelIllustrations] DROP CONSTRAINT [FK_ProductModelIllustration_Illustration_IllustrationID];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductInventory_Location_LocationID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductInventories] DROP CONSTRAINT [FK_ProductInventory_Location_LocationID];
GO
IF OBJECT_ID(N'[dbo].[FK_WorkOrderRouting_Location_LocationID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[WorkOrderRoutings] DROP CONSTRAINT [FK_WorkOrderRouting_Location_LocationID];
GO
IF OBJECT_ID(N'[dbo].[FK_Product_ProductModel_ProductModelID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK_Product_ProductModel_ProductModelID];
GO
IF OBJECT_ID(N'[dbo].[FK_Product_ProductSubcategory_ProductSubcategoryID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK_Product_ProductSubcategory_ProductSubcategoryID];
GO
IF OBJECT_ID(N'[dbo].[FK_Product_UnitMeasure_SizeUnitMeasureCode]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK_Product_UnitMeasure_SizeUnitMeasureCode];
GO
IF OBJECT_ID(N'[dbo].[FK_Product_UnitMeasure_WeightUnitMeasureCode]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK_Product_UnitMeasure_WeightUnitMeasureCode];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductCostHistory_Product_ProductID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductCostHistories] DROP CONSTRAINT [FK_ProductCostHistory_Product_ProductID];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductInventory_Product_ProductID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductInventories] DROP CONSTRAINT [FK_ProductInventory_Product_ProductID];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductListPriceHistory_Product_ProductID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductListPriceHistories] DROP CONSTRAINT [FK_ProductListPriceHistory_Product_ProductID];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductProductPhoto_Product_ProductID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductProductPhotoes] DROP CONSTRAINT [FK_ProductProductPhoto_Product_ProductID];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductReview_Product_ProductID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductReviews] DROP CONSTRAINT [FK_ProductReview_Product_ProductID];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductVendor_Product_ProductID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductVendors] DROP CONSTRAINT [FK_ProductVendor_Product_ProductID];
GO
IF OBJECT_ID(N'[dbo].[FK_PurchaseOrderDetail_Product_ProductID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PurchaseOrderDetails] DROP CONSTRAINT [FK_PurchaseOrderDetail_Product_ProductID];
GO
IF OBJECT_ID(N'[dbo].[FK_ShoppingCartItem_Product_ProductID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ShoppingCartItems] DROP CONSTRAINT [FK_ShoppingCartItem_Product_ProductID];
GO
IF OBJECT_ID(N'[dbo].[FK_SpecialOfferProduct_Product_ProductID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SpecialOfferProducts] DROP CONSTRAINT [FK_SpecialOfferProduct_Product_ProductID];
GO
IF OBJECT_ID(N'[dbo].[FK_TransactionHistory_Product_ProductID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TransactionHistories] DROP CONSTRAINT [FK_TransactionHistory_Product_ProductID];
GO
IF OBJECT_ID(N'[dbo].[FK_WorkOrder_Product_ProductID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[WorkOrders] DROP CONSTRAINT [FK_WorkOrder_Product_ProductID];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductSubcategory_ProductCategory_ProductCategoryID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductSubcategories] DROP CONSTRAINT [FK_ProductSubcategory_ProductCategory_ProductCategoryID];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductModelProductDescriptionCulture_ProductDescription_ProductDescriptionID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductModelProductDescriptionCultures] DROP CONSTRAINT [FK_ProductModelProductDescriptionCulture_ProductDescription_ProductDescriptionID];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductModelIllustration_ProductModel_ProductModelID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductModelIllustrations] DROP CONSTRAINT [FK_ProductModelIllustration_ProductModel_ProductModelID];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductModelProductDescriptionCulture_ProductModel_ProductModelID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductModelProductDescriptionCultures] DROP CONSTRAINT [FK_ProductModelProductDescriptionCulture_ProductModel_ProductModelID];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductProductPhoto_ProductPhoto_ProductPhotoID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductProductPhotoes] DROP CONSTRAINT [FK_ProductProductPhoto_ProductPhoto_ProductPhotoID];
GO
IF OBJECT_ID(N'[dbo].[FK_WorkOrder_ScrapReason_ScrapReasonID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[WorkOrders] DROP CONSTRAINT [FK_WorkOrder_ScrapReason_ScrapReasonID];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductVendor_UnitMeasure_UnitMeasureCode]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductVendors] DROP CONSTRAINT [FK_ProductVendor_UnitMeasure_UnitMeasureCode];
GO
IF OBJECT_ID(N'[dbo].[FK_WorkOrderRouting_WorkOrder_WorkOrderID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[WorkOrderRoutings] DROP CONSTRAINT [FK_WorkOrderRouting_WorkOrder_WorkOrderID];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductVendor_Vendor_BusinessEntityID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductVendors] DROP CONSTRAINT [FK_ProductVendor_Vendor_BusinessEntityID];
GO
IF OBJECT_ID(N'[dbo].[FK_PurchaseOrderDetail_PurchaseOrderHeader_PurchaseOrderID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PurchaseOrderDetails] DROP CONSTRAINT [FK_PurchaseOrderDetail_PurchaseOrderHeader_PurchaseOrderID];
GO
IF OBJECT_ID(N'[dbo].[FK_PurchaseOrderHeader_ShipMethod_ShipMethodID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PurchaseOrderHeaders] DROP CONSTRAINT [FK_PurchaseOrderHeader_ShipMethod_ShipMethodID];
GO
IF OBJECT_ID(N'[dbo].[FK_PurchaseOrderHeader_Vendor_VendorID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PurchaseOrderHeaders] DROP CONSTRAINT [FK_PurchaseOrderHeader_Vendor_VendorID];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesOrderHeader_ShipMethod_ShipMethodID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesOrderHeaders] DROP CONSTRAINT [FK_SalesOrderHeader_ShipMethod_ShipMethodID];
GO
IF OBJECT_ID(N'[dbo].[FK_CountryRegionCurrency_Currency_CurrencyCode]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CountryRegionCurrencies] DROP CONSTRAINT [FK_CountryRegionCurrency_Currency_CurrencyCode];
GO
IF OBJECT_ID(N'[dbo].[FK_PersonCreditCard_CreditCard_CreditCardID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PersonCreditCards] DROP CONSTRAINT [FK_PersonCreditCard_CreditCard_CreditCardID];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesOrderHeader_CreditCard_CreditCardID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesOrderHeaders] DROP CONSTRAINT [FK_SalesOrderHeader_CreditCard_CreditCardID];
GO
IF OBJECT_ID(N'[dbo].[FK_CurrencyRate_Currency_FromCurrencyCode]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CurrencyRates] DROP CONSTRAINT [FK_CurrencyRate_Currency_FromCurrencyCode];
GO
IF OBJECT_ID(N'[dbo].[FK_CurrencyRate_Currency_ToCurrencyCode]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CurrencyRates] DROP CONSTRAINT [FK_CurrencyRate_Currency_ToCurrencyCode];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesOrderHeader_CurrencyRate_CurrencyRateID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesOrderHeaders] DROP CONSTRAINT [FK_SalesOrderHeader_CurrencyRate_CurrencyRateID];
GO
IF OBJECT_ID(N'[dbo].[FK_Customer_SalesTerritory_TerritoryID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Customers] DROP CONSTRAINT [FK_Customer_SalesTerritory_TerritoryID];
GO
IF OBJECT_ID(N'[dbo].[FK_Customer_Store_StoreID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Customers] DROP CONSTRAINT [FK_Customer_Store_StoreID];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesOrderHeader_Customer_CustomerID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesOrderHeaders] DROP CONSTRAINT [FK_SalesOrderHeader_Customer_CustomerID];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesOrderDetail_SalesOrderHeader_SalesOrderID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesOrderDetails] DROP CONSTRAINT [FK_SalesOrderDetail_SalesOrderHeader_SalesOrderID];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesOrderDetail_SpecialOfferProduct_SpecialOfferIDProductID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesOrderDetails] DROP CONSTRAINT [FK_SalesOrderDetail_SpecialOfferProduct_SpecialOfferIDProductID];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesOrderHeader_SalesPerson_SalesPersonID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesOrderHeaders] DROP CONSTRAINT [FK_SalesOrderHeader_SalesPerson_SalesPersonID];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesOrderHeader_SalesTerritory_TerritoryID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesOrderHeaders] DROP CONSTRAINT [FK_SalesOrderHeader_SalesTerritory_TerritoryID];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesOrderHeaderSalesReason_SalesOrderHeader_SalesOrderID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesOrderHeaderSalesReasons] DROP CONSTRAINT [FK_SalesOrderHeaderSalesReason_SalesOrderHeader_SalesOrderID];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesOrderHeaderSalesReason_SalesReason_SalesReasonID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesOrderHeaderSalesReasons] DROP CONSTRAINT [FK_SalesOrderHeaderSalesReason_SalesReason_SalesReasonID];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesPerson_SalesTerritory_TerritoryID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesPersons] DROP CONSTRAINT [FK_SalesPerson_SalesTerritory_TerritoryID];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesPersonQuotaHistory_SalesPerson_BusinessEntityID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesPersonQuotaHistories] DROP CONSTRAINT [FK_SalesPersonQuotaHistory_SalesPerson_BusinessEntityID];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesTerritoryHistory_SalesPerson_BusinessEntityID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesTerritoryHistories] DROP CONSTRAINT [FK_SalesTerritoryHistory_SalesPerson_BusinessEntityID];
GO
IF OBJECT_ID(N'[dbo].[FK_Store_SalesPerson_SalesPersonID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Stores] DROP CONSTRAINT [FK_Store_SalesPerson_SalesPersonID];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesTerritoryHistory_SalesTerritory_TerritoryID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesTerritoryHistories] DROP CONSTRAINT [FK_SalesTerritoryHistory_SalesTerritory_TerritoryID];
GO
IF OBJECT_ID(N'[dbo].[FK_SpecialOfferProduct_SpecialOffer_SpecialOfferID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SpecialOfferProducts] DROP CONSTRAINT [FK_SpecialOfferProduct_SpecialOffer_SpecialOfferID];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[DatabaseLogs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DatabaseLogs];
GO
IF OBJECT_ID(N'[dbo].[ErrorLogs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ErrorLogs];
GO
IF OBJECT_ID(N'[dbo].[Departments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Departments];
GO
IF OBJECT_ID(N'[dbo].[Employees]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Employees];
GO
IF OBJECT_ID(N'[dbo].[EmployeeDepartmentHistories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EmployeeDepartmentHistories];
GO
IF OBJECT_ID(N'[dbo].[EmployeePayHistories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EmployeePayHistories];
GO
IF OBJECT_ID(N'[dbo].[JobCandidates]', 'U') IS NOT NULL
    DROP TABLE [dbo].[JobCandidates];
GO
IF OBJECT_ID(N'[dbo].[Shifts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Shifts];
GO
IF OBJECT_ID(N'[dbo].[Addresses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Addresses];
GO
IF OBJECT_ID(N'[dbo].[AddressTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AddressTypes];
GO
IF OBJECT_ID(N'[dbo].[BusinessEntities]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BusinessEntities];
GO
IF OBJECT_ID(N'[dbo].[BusinessEntityAddresses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BusinessEntityAddresses];
GO
IF OBJECT_ID(N'[dbo].[BusinessEntityContacts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BusinessEntityContacts];
GO
IF OBJECT_ID(N'[dbo].[ContactTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ContactTypes];
GO
IF OBJECT_ID(N'[dbo].[CountryRegions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CountryRegions];
GO
IF OBJECT_ID(N'[dbo].[EmailAddresses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EmailAddresses];
GO
IF OBJECT_ID(N'[dbo].[Passwords]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Passwords];
GO
IF OBJECT_ID(N'[dbo].[People]', 'U') IS NOT NULL
    DROP TABLE [dbo].[People];
GO
IF OBJECT_ID(N'[dbo].[PersonPhones]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PersonPhones];
GO
IF OBJECT_ID(N'[dbo].[PhoneNumberTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PhoneNumberTypes];
GO
IF OBJECT_ID(N'[dbo].[StateProvinces]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StateProvinces];
GO
IF OBJECT_ID(N'[dbo].[BillOfMaterials]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BillOfMaterials];
GO
IF OBJECT_ID(N'[dbo].[Cultures]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cultures];
GO
IF OBJECT_ID(N'[dbo].[Illustrations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Illustrations];
GO
IF OBJECT_ID(N'[dbo].[Locations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Locations];
GO
IF OBJECT_ID(N'[dbo].[Products]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Products];
GO
IF OBJECT_ID(N'[dbo].[ProductCategories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductCategories];
GO
IF OBJECT_ID(N'[dbo].[ProductCostHistories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductCostHistories];
GO
IF OBJECT_ID(N'[dbo].[ProductDescriptions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductDescriptions];
GO
IF OBJECT_ID(N'[dbo].[ProductInventories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductInventories];
GO
IF OBJECT_ID(N'[dbo].[ProductListPriceHistories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductListPriceHistories];
GO
IF OBJECT_ID(N'[dbo].[ProductModels]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductModels];
GO
IF OBJECT_ID(N'[dbo].[ProductModelIllustrations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductModelIllustrations];
GO
IF OBJECT_ID(N'[dbo].[ProductModelProductDescriptionCultures]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductModelProductDescriptionCultures];
GO
IF OBJECT_ID(N'[dbo].[ProductPhotoes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductPhotoes];
GO
IF OBJECT_ID(N'[dbo].[ProductProductPhotoes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductProductPhotoes];
GO
IF OBJECT_ID(N'[dbo].[ProductReviews]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductReviews];
GO
IF OBJECT_ID(N'[dbo].[ProductSubcategories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductSubcategories];
GO
IF OBJECT_ID(N'[dbo].[ScrapReasons]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ScrapReasons];
GO
IF OBJECT_ID(N'[dbo].[TransactionHistories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TransactionHistories];
GO
IF OBJECT_ID(N'[dbo].[TransactionHistoryArchives]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TransactionHistoryArchives];
GO
IF OBJECT_ID(N'[dbo].[UnitMeasures]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UnitMeasures];
GO
IF OBJECT_ID(N'[dbo].[WorkOrders]', 'U') IS NOT NULL
    DROP TABLE [dbo].[WorkOrders];
GO
IF OBJECT_ID(N'[dbo].[WorkOrderRoutings]', 'U') IS NOT NULL
    DROP TABLE [dbo].[WorkOrderRoutings];
GO
IF OBJECT_ID(N'[dbo].[ProductVendors]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductVendors];
GO
IF OBJECT_ID(N'[dbo].[PurchaseOrderDetails]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PurchaseOrderDetails];
GO
IF OBJECT_ID(N'[dbo].[PurchaseOrderHeaders]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PurchaseOrderHeaders];
GO
IF OBJECT_ID(N'[dbo].[ShipMethods]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ShipMethods];
GO
IF OBJECT_ID(N'[dbo].[Vendors]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Vendors];
GO
IF OBJECT_ID(N'[dbo].[CountryRegionCurrencies]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CountryRegionCurrencies];
GO
IF OBJECT_ID(N'[dbo].[CreditCards]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CreditCards];
GO
IF OBJECT_ID(N'[dbo].[Currencies]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Currencies];
GO
IF OBJECT_ID(N'[dbo].[CurrencyRates]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CurrencyRates];
GO
IF OBJECT_ID(N'[dbo].[Customers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Customers];
GO
IF OBJECT_ID(N'[dbo].[PersonCreditCards]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PersonCreditCards];
GO
IF OBJECT_ID(N'[dbo].[SalesOrderDetails]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SalesOrderDetails];
GO
IF OBJECT_ID(N'[dbo].[SalesOrderHeaders]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SalesOrderHeaders];
GO
IF OBJECT_ID(N'[dbo].[SalesOrderHeaderSalesReasons]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SalesOrderHeaderSalesReasons];
GO
IF OBJECT_ID(N'[dbo].[SalesPersons]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SalesPersons];
GO
IF OBJECT_ID(N'[dbo].[SalesPersonQuotaHistories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SalesPersonQuotaHistories];
GO
IF OBJECT_ID(N'[dbo].[SalesReasons]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SalesReasons];
GO
IF OBJECT_ID(N'[dbo].[SalesTaxRates]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SalesTaxRates];
GO
IF OBJECT_ID(N'[dbo].[SalesTerritories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SalesTerritories];
GO
IF OBJECT_ID(N'[dbo].[SalesTerritoryHistories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SalesTerritoryHistories];
GO
IF OBJECT_ID(N'[dbo].[ShoppingCartItems]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ShoppingCartItems];
GO
IF OBJECT_ID(N'[dbo].[SpecialOffers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SpecialOffers];
GO
IF OBJECT_ID(N'[dbo].[SpecialOfferProducts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SpecialOfferProducts];
GO
IF OBJECT_ID(N'[dbo].[Stores]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Stores];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'DatabaseLogs'
CREATE TABLE [dbo].[DatabaseLogs] (
    [DatabaseLogID] int IDENTITY(1,1) NOT NULL,
    [PostTime] datetime  NOT NULL,
    [DatabaseUser] nvarchar(128)  NOT NULL,
    [Event] nvarchar(128)  NOT NULL,
    [Schema] nvarchar(128)  NULL,
    [Object] nvarchar(128)  NULL,
    [TSQL] nvarchar(max)  NOT NULL,
    [XmlEvent] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ErrorLogs'
CREATE TABLE [dbo].[ErrorLogs] (
    [ErrorLogID] int IDENTITY(1,1) NOT NULL,
    [ErrorTime] datetime  NOT NULL,
    [UserName] nvarchar(128)  NOT NULL,
    [ErrorNumber] int  NOT NULL,
    [ErrorSeverity] int  NULL,
    [ErrorState] int  NULL,
    [ErrorProcedure] nvarchar(126)  NULL,
    [ErrorLine] int  NULL,
    [ErrorMessage] nvarchar(4000)  NOT NULL
);
GO

-- Creating table 'Departments'
CREATE TABLE [dbo].[Departments] (
    [DepartmentID] smallint IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [GroupName] nvarchar(50)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'Employees'
CREATE TABLE [dbo].[Employees] (
    [BusinessEntityID] int  NOT NULL,
    [NationalIDNumber] nvarchar(15)  NOT NULL,
    [LoginID] nvarchar(256)  NOT NULL,
    [OrganizationLevel] smallint  NULL,
    [JobTitle] nvarchar(50)  NOT NULL,
    [BirthDate] datetime  NOT NULL,
    [MaritalStatus] nchar(1)  NOT NULL,
    [Gender] nchar(1)  NOT NULL,
    [HireDate] datetime  NOT NULL,
    [SalariedFlag] bit  NOT NULL,
    [VacationHours] smallint  NOT NULL,
    [SickLeaveHours] smallint  NOT NULL,
    [CurrentFlag] bit  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'EmployeeDepartmentHistories'
CREATE TABLE [dbo].[EmployeeDepartmentHistories] (
    [BusinessEntityID] int  NOT NULL,
    [DepartmentID] smallint  NOT NULL,
    [ShiftID] tinyint  NOT NULL,
    [StartDate] datetime  NOT NULL,
    [EndDate] datetime  NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'EmployeePayHistories'
CREATE TABLE [dbo].[EmployeePayHistories] (
    [BusinessEntityID] int  NOT NULL,
    [RateChangeDate] datetime  NOT NULL,
    [Rate] decimal(19,4)  NOT NULL,
    [PayFrequency] tinyint  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'JobCandidates'
CREATE TABLE [dbo].[JobCandidates] (
    [JobCandidateID] int IDENTITY(1,1) NOT NULL,
    [BusinessEntityID] int  NULL,
    [Resume] nvarchar(max)  NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'Shifts'
CREATE TABLE [dbo].[Shifts] (
    [ShiftID] tinyint IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [StartTime] time  NOT NULL,
    [EndTime] time  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'Addresses'
CREATE TABLE [dbo].[Addresses] (
    [AddressID] int IDENTITY(1,1) NOT NULL,
    [AddressLine1] nvarchar(60)  NOT NULL,
    [AddressLine2] nvarchar(60)  NULL,
    [City] nvarchar(30)  NOT NULL,
    [StateProvinceID] int  NOT NULL,
    [PostalCode] nvarchar(15)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'AddressTypes'
CREATE TABLE [dbo].[AddressTypes] (
    [AddressTypeID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'BusinessEntities'
CREATE TABLE [dbo].[BusinessEntities] (
    [BusinessEntityID] int IDENTITY(1,1) NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'BusinessEntityAddresses'
CREATE TABLE [dbo].[BusinessEntityAddresses] (
    [BusinessEntityID] int  NOT NULL,
    [AddressID] int  NOT NULL,
    [AddressTypeID] int  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'BusinessEntityContacts'
CREATE TABLE [dbo].[BusinessEntityContacts] (
    [BusinessEntityID] int  NOT NULL,
    [PersonID] int  NOT NULL,
    [ContactTypeID] int  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ContactTypes'
CREATE TABLE [dbo].[ContactTypes] (
    [ContactTypeID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'CountryRegions'
CREATE TABLE [dbo].[CountryRegions] (
    [CountryRegionCode] nvarchar(3)  NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'EmailAddresses'
CREATE TABLE [dbo].[EmailAddresses] (
    [BusinessEntityID] int  NOT NULL,
    [EmailAddressID] int IDENTITY(1,1) NOT NULL,
    [EmailAddress1] nvarchar(50)  NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'Passwords'
CREATE TABLE [dbo].[Passwords] (
    [BusinessEntityID] int  NOT NULL,
    [PasswordHash] varchar(128)  NOT NULL,
    [PasswordSalt] varchar(10)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'People'
CREATE TABLE [dbo].[People] (
    [BusinessEntityID] int  NOT NULL,
    [PersonType] nchar(2)  NOT NULL,
    [NameStyle] bit  NOT NULL,
    [Title] nvarchar(8)  NULL,
    [FirstName] nvarchar(50)  NOT NULL,
    [MiddleName] nvarchar(50)  NULL,
    [LastName] nvarchar(50)  NOT NULL,
    [Suffix] nvarchar(10)  NULL,
    [EmailPromotion] int  NOT NULL,
    [AdditionalContactInfo] nvarchar(max)  NULL,
    [Demographics] nvarchar(max)  NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'PersonPhones'
CREATE TABLE [dbo].[PersonPhones] (
    [BusinessEntityID] int  NOT NULL,
    [PhoneNumber] nvarchar(25)  NOT NULL,
    [PhoneNumberTypeID] int  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'PhoneNumberTypes'
CREATE TABLE [dbo].[PhoneNumberTypes] (
    [PhoneNumberTypeID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'StateProvinces'
CREATE TABLE [dbo].[StateProvinces] (
    [StateProvinceID] int IDENTITY(1,1) NOT NULL,
    [StateProvinceCode] nchar(3)  NOT NULL,
    [CountryRegionCode] nvarchar(3)  NOT NULL,
    [IsOnlyStateProvinceFlag] bit  NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [TerritoryID] int  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'BillOfMaterials'
CREATE TABLE [dbo].[BillOfMaterials] (
    [BillOfMaterialsID] int IDENTITY(1,1) NOT NULL,
    [ProductAssemblyID] int  NULL,
    [ComponentID] int  NOT NULL,
    [StartDate] datetime  NOT NULL,
    [EndDate] datetime  NULL,
    [UnitMeasureCode] nchar(3)  NOT NULL,
    [BOMLevel] smallint  NOT NULL,
    [PerAssemblyQty] decimal(8,2)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'Cultures'
CREATE TABLE [dbo].[Cultures] (
    [CultureID] nchar(6)  NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'Illustrations'
CREATE TABLE [dbo].[Illustrations] (
    [IllustrationID] int IDENTITY(1,1) NOT NULL,
    [Diagram] nvarchar(max)  NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'Locations'
CREATE TABLE [dbo].[Locations] (
    [LocationID] smallint IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [CostRate] decimal(10,4)  NOT NULL,
    [Availability] decimal(8,2)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [ProductID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [ProductNumber] nvarchar(25)  NOT NULL,
    [MakeFlag] bit  NOT NULL,
    [FinishedGoodsFlag] bit  NOT NULL,
    [Color] nvarchar(15)  NULL,
    [SafetyStockLevel] smallint  NOT NULL,
    [ReorderPoint] smallint  NOT NULL,
    [StandardCost] decimal(19,4)  NOT NULL,
    [ListPrice] decimal(19,4)  NOT NULL,
    [Size] nvarchar(5)  NULL,
    [SizeUnitMeasureCode] nchar(3)  NULL,
    [WeightUnitMeasureCode] nchar(3)  NULL,
    [Weight] decimal(8,2)  NULL,
    [DaysToManufacture] int  NOT NULL,
    [ProductLine] nchar(2)  NULL,
    [Class] nchar(2)  NULL,
    [Style] nchar(2)  NULL,
    [ProductSubcategoryID] int  NULL,
    [ProductModelID] int  NULL,
    [SellStartDate] datetime  NOT NULL,
    [SellEndDate] datetime  NULL,
    [DiscontinuedDate] datetime  NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ProductCategories'
CREATE TABLE [dbo].[ProductCategories] (
    [ProductCategoryID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ProductCostHistories'
CREATE TABLE [dbo].[ProductCostHistories] (
    [ProductID] int  NOT NULL,
    [StartDate] datetime  NOT NULL,
    [EndDate] datetime  NULL,
    [StandardCost] decimal(19,4)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ProductDescriptions'
CREATE TABLE [dbo].[ProductDescriptions] (
    [ProductDescriptionID] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(400)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ProductInventories'
CREATE TABLE [dbo].[ProductInventories] (
    [ProductID] int  NOT NULL,
    [LocationID] smallint  NOT NULL,
    [Shelf] nvarchar(10)  NOT NULL,
    [Bin] tinyint  NOT NULL,
    [Quantity] smallint  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ProductListPriceHistories'
CREATE TABLE [dbo].[ProductListPriceHistories] (
    [ProductID] int  NOT NULL,
    [StartDate] datetime  NOT NULL,
    [EndDate] datetime  NULL,
    [ListPrice] decimal(19,4)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ProductModels'
CREATE TABLE [dbo].[ProductModels] (
    [ProductModelID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [CatalogDescription] nvarchar(max)  NULL,
    [Instructions] nvarchar(max)  NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ProductModelIllustrations'
CREATE TABLE [dbo].[ProductModelIllustrations] (
    [ProductModelID] int  NOT NULL,
    [IllustrationID] int  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ProductModelProductDescriptionCultures'
CREATE TABLE [dbo].[ProductModelProductDescriptionCultures] (
    [ProductModelID] int  NOT NULL,
    [ProductDescriptionID] int  NOT NULL,
    [CultureID] nchar(6)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ProductPhotoes'
CREATE TABLE [dbo].[ProductPhotoes] (
    [ProductPhotoID] int IDENTITY(1,1) NOT NULL,
    [ThumbNailPhoto] varbinary(max)  NULL,
    [ThumbnailPhotoFileName] nvarchar(50)  NULL,
    [LargePhoto] varbinary(max)  NULL,
    [LargePhotoFileName] nvarchar(50)  NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ProductProductPhotoes'
CREATE TABLE [dbo].[ProductProductPhotoes] (
    [ProductID] int  NOT NULL,
    [ProductPhotoID] int  NOT NULL,
    [Primary] bit  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ProductReviews'
CREATE TABLE [dbo].[ProductReviews] (
    [ProductReviewID] int IDENTITY(1,1) NOT NULL,
    [ProductID] int  NOT NULL,
    [ReviewerName] nvarchar(50)  NOT NULL,
    [ReviewDate] datetime  NOT NULL,
    [EmailAddress] nvarchar(50)  NOT NULL,
    [Rating] int  NOT NULL,
    [Comments] nvarchar(3850)  NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ProductSubcategories'
CREATE TABLE [dbo].[ProductSubcategories] (
    [ProductSubcategoryID] int IDENTITY(1,1) NOT NULL,
    [ProductCategoryID] int  NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ScrapReasons'
CREATE TABLE [dbo].[ScrapReasons] (
    [ScrapReasonID] smallint IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'TransactionHistories'
CREATE TABLE [dbo].[TransactionHistories] (
    [TransactionID] int IDENTITY(1,1) NOT NULL,
    [ProductID] int  NOT NULL,
    [ReferenceOrderID] int  NOT NULL,
    [ReferenceOrderLineID] int  NOT NULL,
    [TransactionDate] datetime  NOT NULL,
    [TransactionType] nchar(1)  NOT NULL,
    [Quantity] int  NOT NULL,
    [ActualCost] decimal(19,4)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'TransactionHistoryArchives'
CREATE TABLE [dbo].[TransactionHistoryArchives] (
    [TransactionID] int  NOT NULL,
    [ProductID] int  NOT NULL,
    [ReferenceOrderID] int  NOT NULL,
    [ReferenceOrderLineID] int  NOT NULL,
    [TransactionDate] datetime  NOT NULL,
    [TransactionType] nchar(1)  NOT NULL,
    [Quantity] int  NOT NULL,
    [ActualCost] decimal(19,4)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'UnitMeasures'
CREATE TABLE [dbo].[UnitMeasures] (
    [UnitMeasureCode] nchar(3)  NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'WorkOrders'
CREATE TABLE [dbo].[WorkOrders] (
    [WorkOrderID] int IDENTITY(1,1) NOT NULL,
    [ProductID] int  NOT NULL,
    [OrderQty] int  NOT NULL,
    [StockedQty] int  NOT NULL,
    [ScrappedQty] smallint  NOT NULL,
    [StartDate] datetime  NOT NULL,
    [EndDate] datetime  NULL,
    [DueDate] datetime  NOT NULL,
    [ScrapReasonID] smallint  NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'WorkOrderRoutings'
CREATE TABLE [dbo].[WorkOrderRoutings] (
    [WorkOrderID] int  NOT NULL,
    [ProductID] int  NOT NULL,
    [OperationSequence] smallint  NOT NULL,
    [LocationID] smallint  NOT NULL,
    [ScheduledStartDate] datetime  NOT NULL,
    [ScheduledEndDate] datetime  NOT NULL,
    [ActualStartDate] datetime  NULL,
    [ActualEndDate] datetime  NULL,
    [ActualResourceHrs] decimal(9,4)  NULL,
    [PlannedCost] decimal(19,4)  NOT NULL,
    [ActualCost] decimal(19,4)  NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ProductVendors'
CREATE TABLE [dbo].[ProductVendors] (
    [ProductID] int  NOT NULL,
    [BusinessEntityID] int  NOT NULL,
    [AverageLeadTime] int  NOT NULL,
    [StandardPrice] decimal(19,4)  NOT NULL,
    [LastReceiptCost] decimal(19,4)  NULL,
    [LastReceiptDate] datetime  NULL,
    [MinOrderQty] int  NOT NULL,
    [MaxOrderQty] int  NOT NULL,
    [OnOrderQty] int  NULL,
    [UnitMeasureCode] nchar(3)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'PurchaseOrderDetails'
CREATE TABLE [dbo].[PurchaseOrderDetails] (
    [PurchaseOrderID] int  NOT NULL,
    [PurchaseOrderDetailID] int IDENTITY(1,1) NOT NULL,
    [DueDate] datetime  NOT NULL,
    [OrderQty] smallint  NOT NULL,
    [ProductID] int  NOT NULL,
    [UnitPrice] decimal(19,4)  NOT NULL,
    [LineTotal] decimal(19,4)  NOT NULL,
    [ReceivedQty] decimal(8,2)  NOT NULL,
    [RejectedQty] decimal(8,2)  NOT NULL,
    [StockedQty] decimal(9,2)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'PurchaseOrderHeaders'
CREATE TABLE [dbo].[PurchaseOrderHeaders] (
    [PurchaseOrderID] int IDENTITY(1,1) NOT NULL,
    [RevisionNumber] tinyint  NOT NULL,
    [Status] tinyint  NOT NULL,
    [EmployeeID] int  NOT NULL,
    [VendorID] int  NOT NULL,
    [ShipMethodID] int  NOT NULL,
    [OrderDate] datetime  NOT NULL,
    [ShipDate] datetime  NULL,
    [SubTotal] decimal(19,4)  NOT NULL,
    [TaxAmt] decimal(19,4)  NOT NULL,
    [Freight] decimal(19,4)  NOT NULL,
    [TotalDue] decimal(19,4)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ShipMethods'
CREATE TABLE [dbo].[ShipMethods] (
    [ShipMethodID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [ShipBase] decimal(19,4)  NOT NULL,
    [ShipRate] decimal(19,4)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'Vendors'
CREATE TABLE [dbo].[Vendors] (
    [BusinessEntityID] int  NOT NULL,
    [AccountNumber] nvarchar(15)  NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [CreditRating] tinyint  NOT NULL,
    [PreferredVendorStatus] bit  NOT NULL,
    [ActiveFlag] bit  NOT NULL,
    [PurchasingWebServiceURL] nvarchar(1024)  NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'CountryRegionCurrencies'
CREATE TABLE [dbo].[CountryRegionCurrencies] (
    [CountryRegionCode] nvarchar(3)  NOT NULL,
    [CurrencyCode] nchar(3)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'CreditCards'
CREATE TABLE [dbo].[CreditCards] (
    [CreditCardID] int IDENTITY(1,1) NOT NULL,
    [CardType] nvarchar(50)  NOT NULL,
    [CardNumber] nvarchar(25)  NOT NULL,
    [ExpMonth] tinyint  NOT NULL,
    [ExpYear] smallint  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'Currencies'
CREATE TABLE [dbo].[Currencies] (
    [CurrencyCode] nchar(3)  NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'CurrencyRates'
CREATE TABLE [dbo].[CurrencyRates] (
    [CurrencyRateID] int IDENTITY(1,1) NOT NULL,
    [CurrencyRateDate] datetime  NOT NULL,
    [FromCurrencyCode] nchar(3)  NOT NULL,
    [ToCurrencyCode] nchar(3)  NOT NULL,
    [AverageRate] decimal(19,4)  NOT NULL,
    [EndOfDayRate] decimal(19,4)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [CustomerID] int IDENTITY(1,1) NOT NULL,
    [PersonID] int  NULL,
    [StoreID] int  NULL,
    [TerritoryID] int  NULL,
    [AccountNumber] varchar(10)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'PersonCreditCards'
CREATE TABLE [dbo].[PersonCreditCards] (
    [BusinessEntityID] int  NOT NULL,
    [CreditCardID] int  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'SalesOrderDetails'
CREATE TABLE [dbo].[SalesOrderDetails] (
    [SalesOrderID] int  NOT NULL,
    [SalesOrderDetailID] int IDENTITY(1,1) NOT NULL,
    [CarrierTrackingNumber] nvarchar(25)  NULL,
    [OrderQty] smallint  NOT NULL,
    [ProductID] int  NOT NULL,
    [SpecialOfferID] int  NOT NULL,
    [UnitPrice] decimal(19,4)  NOT NULL,
    [UnitPriceDiscount] decimal(19,4)  NOT NULL,
    [LineTotal] decimal(38,6)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'SalesOrderHeaders'
CREATE TABLE [dbo].[SalesOrderHeaders] (
    [SalesOrderID] int IDENTITY(1,1) NOT NULL,
    [RevisionNumber] tinyint  NOT NULL,
    [OrderDate] datetime  NOT NULL,
    [DueDate] datetime  NOT NULL,
    [ShipDate] datetime  NULL,
    [Status] tinyint  NOT NULL,
    [OnlineOrderFlag] bit  NOT NULL,
    [SalesOrderNumber] nvarchar(25)  NOT NULL,
    [PurchaseOrderNumber] nvarchar(25)  NULL,
    [AccountNumber] nvarchar(15)  NULL,
    [CustomerID] int  NOT NULL,
    [SalesPersonID] int  NULL,
    [TerritoryID] int  NULL,
    [BillToAddressID] int  NOT NULL,
    [ShipToAddressID] int  NOT NULL,
    [ShipMethodID] int  NOT NULL,
    [CreditCardID] int  NULL,
    [CreditCardApprovalCode] varchar(15)  NULL,
    [CurrencyRateID] int  NULL,
    [SubTotal] decimal(19,4)  NOT NULL,
    [TaxAmt] decimal(19,4)  NOT NULL,
    [Freight] decimal(19,4)  NOT NULL,
    [TotalDue] decimal(19,4)  NOT NULL,
    [Comment] nvarchar(128)  NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'SalesOrderHeaderSalesReasons'
CREATE TABLE [dbo].[SalesOrderHeaderSalesReasons] (
    [SalesOrderID] int  NOT NULL,
    [SalesReasonID] int  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'SalesPersons'
CREATE TABLE [dbo].[SalesPersons] (
    [BusinessEntityID] int  NOT NULL,
    [TerritoryID] int  NULL,
    [SalesQuota] decimal(19,4)  NULL,
    [Bonus] decimal(19,4)  NOT NULL,
    [CommissionPct] decimal(10,4)  NOT NULL,
    [SalesYTD] decimal(19,4)  NOT NULL,
    [SalesLastYear] decimal(19,4)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'SalesPersonQuotaHistories'
CREATE TABLE [dbo].[SalesPersonQuotaHistories] (
    [BusinessEntityID] int  NOT NULL,
    [QuotaDate] datetime  NOT NULL,
    [SalesQuota] decimal(19,4)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'SalesReasons'
CREATE TABLE [dbo].[SalesReasons] (
    [SalesReasonID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [ReasonType] nvarchar(50)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'SalesTaxRates'
CREATE TABLE [dbo].[SalesTaxRates] (
    [SalesTaxRateID] int IDENTITY(1,1) NOT NULL,
    [StateProvinceID] int  NOT NULL,
    [TaxType] tinyint  NOT NULL,
    [TaxRate] decimal(10,4)  NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'SalesTerritories'
CREATE TABLE [dbo].[SalesTerritories] (
    [TerritoryID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [CountryRegionCode] nvarchar(3)  NOT NULL,
    [Group] nvarchar(50)  NOT NULL,
    [SalesYTD] decimal(19,4)  NOT NULL,
    [SalesLastYear] decimal(19,4)  NOT NULL,
    [CostYTD] decimal(19,4)  NOT NULL,
    [CostLastYear] decimal(19,4)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'SalesTerritoryHistories'
CREATE TABLE [dbo].[SalesTerritoryHistories] (
    [BusinessEntityID] int  NOT NULL,
    [TerritoryID] int  NOT NULL,
    [StartDate] datetime  NOT NULL,
    [EndDate] datetime  NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ShoppingCartItems'
CREATE TABLE [dbo].[ShoppingCartItems] (
    [ShoppingCartItemID] int IDENTITY(1,1) NOT NULL,
    [ShoppingCartID] nvarchar(50)  NOT NULL,
    [Quantity] int  NOT NULL,
    [ProductID] int  NOT NULL,
    [DateCreated] datetime  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'SpecialOffers'
CREATE TABLE [dbo].[SpecialOffers] (
    [SpecialOfferID] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(255)  NOT NULL,
    [DiscountPct] decimal(10,4)  NOT NULL,
    [Type] nvarchar(50)  NOT NULL,
    [Category] nvarchar(50)  NOT NULL,
    [StartDate] datetime  NOT NULL,
    [EndDate] datetime  NOT NULL,
    [MinQty] int  NOT NULL,
    [MaxQty] int  NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'SpecialOfferProducts'
CREATE TABLE [dbo].[SpecialOfferProducts] (
    [SpecialOfferID] int  NOT NULL,
    [ProductID] int  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'Stores'
CREATE TABLE [dbo].[Stores] (
    [BusinessEntityID] int  NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [SalesPersonID] int  NULL,
    [Demographics] nvarchar(max)  NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [DatabaseLogID] in table 'DatabaseLogs'
ALTER TABLE [dbo].[DatabaseLogs]
ADD CONSTRAINT [PK_DatabaseLogs]
    PRIMARY KEY CLUSTERED ([DatabaseLogID] ASC);
GO

-- Creating primary key on [ErrorLogID] in table 'ErrorLogs'
ALTER TABLE [dbo].[ErrorLogs]
ADD CONSTRAINT [PK_ErrorLogs]
    PRIMARY KEY CLUSTERED ([ErrorLogID] ASC);
GO

-- Creating primary key on [DepartmentID] in table 'Departments'
ALTER TABLE [dbo].[Departments]
ADD CONSTRAINT [PK_Departments]
    PRIMARY KEY CLUSTERED ([DepartmentID] ASC);
GO

-- Creating primary key on [BusinessEntityID] in table 'Employees'
ALTER TABLE [dbo].[Employees]
ADD CONSTRAINT [PK_Employees]
    PRIMARY KEY CLUSTERED ([BusinessEntityID] ASC);
GO

-- Creating primary key on [BusinessEntityID], [DepartmentID], [ShiftID], [StartDate] in table 'EmployeeDepartmentHistories'
ALTER TABLE [dbo].[EmployeeDepartmentHistories]
ADD CONSTRAINT [PK_EmployeeDepartmentHistories]
    PRIMARY KEY CLUSTERED ([BusinessEntityID], [DepartmentID], [ShiftID], [StartDate] ASC);
GO

-- Creating primary key on [BusinessEntityID], [RateChangeDate] in table 'EmployeePayHistories'
ALTER TABLE [dbo].[EmployeePayHistories]
ADD CONSTRAINT [PK_EmployeePayHistories]
    PRIMARY KEY CLUSTERED ([BusinessEntityID], [RateChangeDate] ASC);
GO

-- Creating primary key on [JobCandidateID] in table 'JobCandidates'
ALTER TABLE [dbo].[JobCandidates]
ADD CONSTRAINT [PK_JobCandidates]
    PRIMARY KEY CLUSTERED ([JobCandidateID] ASC);
GO

-- Creating primary key on [ShiftID] in table 'Shifts'
ALTER TABLE [dbo].[Shifts]
ADD CONSTRAINT [PK_Shifts]
    PRIMARY KEY CLUSTERED ([ShiftID] ASC);
GO

-- Creating primary key on [AddressID] in table 'Addresses'
ALTER TABLE [dbo].[Addresses]
ADD CONSTRAINT [PK_Addresses]
    PRIMARY KEY CLUSTERED ([AddressID] ASC);
GO

-- Creating primary key on [AddressTypeID] in table 'AddressTypes'
ALTER TABLE [dbo].[AddressTypes]
ADD CONSTRAINT [PK_AddressTypes]
    PRIMARY KEY CLUSTERED ([AddressTypeID] ASC);
GO

-- Creating primary key on [BusinessEntityID] in table 'BusinessEntities'
ALTER TABLE [dbo].[BusinessEntities]
ADD CONSTRAINT [PK_BusinessEntities]
    PRIMARY KEY CLUSTERED ([BusinessEntityID] ASC);
GO

-- Creating primary key on [BusinessEntityID], [AddressID], [AddressTypeID] in table 'BusinessEntityAddresses'
ALTER TABLE [dbo].[BusinessEntityAddresses]
ADD CONSTRAINT [PK_BusinessEntityAddresses]
    PRIMARY KEY CLUSTERED ([BusinessEntityID], [AddressID], [AddressTypeID] ASC);
GO

-- Creating primary key on [BusinessEntityID], [PersonID], [ContactTypeID] in table 'BusinessEntityContacts'
ALTER TABLE [dbo].[BusinessEntityContacts]
ADD CONSTRAINT [PK_BusinessEntityContacts]
    PRIMARY KEY CLUSTERED ([BusinessEntityID], [PersonID], [ContactTypeID] ASC);
GO

-- Creating primary key on [ContactTypeID] in table 'ContactTypes'
ALTER TABLE [dbo].[ContactTypes]
ADD CONSTRAINT [PK_ContactTypes]
    PRIMARY KEY CLUSTERED ([ContactTypeID] ASC);
GO

-- Creating primary key on [CountryRegionCode] in table 'CountryRegions'
ALTER TABLE [dbo].[CountryRegions]
ADD CONSTRAINT [PK_CountryRegions]
    PRIMARY KEY CLUSTERED ([CountryRegionCode] ASC);
GO

-- Creating primary key on [BusinessEntityID], [EmailAddressID] in table 'EmailAddresses'
ALTER TABLE [dbo].[EmailAddresses]
ADD CONSTRAINT [PK_EmailAddresses]
    PRIMARY KEY CLUSTERED ([BusinessEntityID], [EmailAddressID] ASC);
GO

-- Creating primary key on [BusinessEntityID] in table 'Passwords'
ALTER TABLE [dbo].[Passwords]
ADD CONSTRAINT [PK_Passwords]
    PRIMARY KEY CLUSTERED ([BusinessEntityID] ASC);
GO

-- Creating primary key on [BusinessEntityID] in table 'People'
ALTER TABLE [dbo].[People]
ADD CONSTRAINT [PK_People]
    PRIMARY KEY CLUSTERED ([BusinessEntityID] ASC);
GO

-- Creating primary key on [BusinessEntityID], [PhoneNumber], [PhoneNumberTypeID] in table 'PersonPhones'
ALTER TABLE [dbo].[PersonPhones]
ADD CONSTRAINT [PK_PersonPhones]
    PRIMARY KEY CLUSTERED ([BusinessEntityID], [PhoneNumber], [PhoneNumberTypeID] ASC);
GO

-- Creating primary key on [PhoneNumberTypeID] in table 'PhoneNumberTypes'
ALTER TABLE [dbo].[PhoneNumberTypes]
ADD CONSTRAINT [PK_PhoneNumberTypes]
    PRIMARY KEY CLUSTERED ([PhoneNumberTypeID] ASC);
GO

-- Creating primary key on [StateProvinceID] in table 'StateProvinces'
ALTER TABLE [dbo].[StateProvinces]
ADD CONSTRAINT [PK_StateProvinces]
    PRIMARY KEY CLUSTERED ([StateProvinceID] ASC);
GO

-- Creating primary key on [BillOfMaterialsID] in table 'BillOfMaterials'
ALTER TABLE [dbo].[BillOfMaterials]
ADD CONSTRAINT [PK_BillOfMaterials]
    PRIMARY KEY CLUSTERED ([BillOfMaterialsID] ASC);
GO

-- Creating primary key on [CultureID] in table 'Cultures'
ALTER TABLE [dbo].[Cultures]
ADD CONSTRAINT [PK_Cultures]
    PRIMARY KEY CLUSTERED ([CultureID] ASC);
GO

-- Creating primary key on [IllustrationID] in table 'Illustrations'
ALTER TABLE [dbo].[Illustrations]
ADD CONSTRAINT [PK_Illustrations]
    PRIMARY KEY CLUSTERED ([IllustrationID] ASC);
GO

-- Creating primary key on [LocationID] in table 'Locations'
ALTER TABLE [dbo].[Locations]
ADD CONSTRAINT [PK_Locations]
    PRIMARY KEY CLUSTERED ([LocationID] ASC);
GO

-- Creating primary key on [ProductID] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([ProductID] ASC);
GO

-- Creating primary key on [ProductCategoryID] in table 'ProductCategories'
ALTER TABLE [dbo].[ProductCategories]
ADD CONSTRAINT [PK_ProductCategories]
    PRIMARY KEY CLUSTERED ([ProductCategoryID] ASC);
GO

-- Creating primary key on [ProductID], [StartDate] in table 'ProductCostHistories'
ALTER TABLE [dbo].[ProductCostHistories]
ADD CONSTRAINT [PK_ProductCostHistories]
    PRIMARY KEY CLUSTERED ([ProductID], [StartDate] ASC);
GO

-- Creating primary key on [ProductDescriptionID] in table 'ProductDescriptions'
ALTER TABLE [dbo].[ProductDescriptions]
ADD CONSTRAINT [PK_ProductDescriptions]
    PRIMARY KEY CLUSTERED ([ProductDescriptionID] ASC);
GO

-- Creating primary key on [ProductID], [LocationID] in table 'ProductInventories'
ALTER TABLE [dbo].[ProductInventories]
ADD CONSTRAINT [PK_ProductInventories]
    PRIMARY KEY CLUSTERED ([ProductID], [LocationID] ASC);
GO

-- Creating primary key on [ProductID], [StartDate] in table 'ProductListPriceHistories'
ALTER TABLE [dbo].[ProductListPriceHistories]
ADD CONSTRAINT [PK_ProductListPriceHistories]
    PRIMARY KEY CLUSTERED ([ProductID], [StartDate] ASC);
GO

-- Creating primary key on [ProductModelID] in table 'ProductModels'
ALTER TABLE [dbo].[ProductModels]
ADD CONSTRAINT [PK_ProductModels]
    PRIMARY KEY CLUSTERED ([ProductModelID] ASC);
GO

-- Creating primary key on [ProductModelID], [IllustrationID] in table 'ProductModelIllustrations'
ALTER TABLE [dbo].[ProductModelIllustrations]
ADD CONSTRAINT [PK_ProductModelIllustrations]
    PRIMARY KEY CLUSTERED ([ProductModelID], [IllustrationID] ASC);
GO

-- Creating primary key on [ProductModelID], [ProductDescriptionID], [CultureID] in table 'ProductModelProductDescriptionCultures'
ALTER TABLE [dbo].[ProductModelProductDescriptionCultures]
ADD CONSTRAINT [PK_ProductModelProductDescriptionCultures]
    PRIMARY KEY CLUSTERED ([ProductModelID], [ProductDescriptionID], [CultureID] ASC);
GO

-- Creating primary key on [ProductPhotoID] in table 'ProductPhotoes'
ALTER TABLE [dbo].[ProductPhotoes]
ADD CONSTRAINT [PK_ProductPhotoes]
    PRIMARY KEY CLUSTERED ([ProductPhotoID] ASC);
GO

-- Creating primary key on [ProductID], [ProductPhotoID] in table 'ProductProductPhotoes'
ALTER TABLE [dbo].[ProductProductPhotoes]
ADD CONSTRAINT [PK_ProductProductPhotoes]
    PRIMARY KEY CLUSTERED ([ProductID], [ProductPhotoID] ASC);
GO

-- Creating primary key on [ProductReviewID] in table 'ProductReviews'
ALTER TABLE [dbo].[ProductReviews]
ADD CONSTRAINT [PK_ProductReviews]
    PRIMARY KEY CLUSTERED ([ProductReviewID] ASC);
GO

-- Creating primary key on [ProductSubcategoryID] in table 'ProductSubcategories'
ALTER TABLE [dbo].[ProductSubcategories]
ADD CONSTRAINT [PK_ProductSubcategories]
    PRIMARY KEY CLUSTERED ([ProductSubcategoryID] ASC);
GO

-- Creating primary key on [ScrapReasonID] in table 'ScrapReasons'
ALTER TABLE [dbo].[ScrapReasons]
ADD CONSTRAINT [PK_ScrapReasons]
    PRIMARY KEY CLUSTERED ([ScrapReasonID] ASC);
GO

-- Creating primary key on [TransactionID] in table 'TransactionHistories'
ALTER TABLE [dbo].[TransactionHistories]
ADD CONSTRAINT [PK_TransactionHistories]
    PRIMARY KEY CLUSTERED ([TransactionID] ASC);
GO

-- Creating primary key on [TransactionID] in table 'TransactionHistoryArchives'
ALTER TABLE [dbo].[TransactionHistoryArchives]
ADD CONSTRAINT [PK_TransactionHistoryArchives]
    PRIMARY KEY CLUSTERED ([TransactionID] ASC);
GO

-- Creating primary key on [UnitMeasureCode] in table 'UnitMeasures'
ALTER TABLE [dbo].[UnitMeasures]
ADD CONSTRAINT [PK_UnitMeasures]
    PRIMARY KEY CLUSTERED ([UnitMeasureCode] ASC);
GO

-- Creating primary key on [WorkOrderID] in table 'WorkOrders'
ALTER TABLE [dbo].[WorkOrders]
ADD CONSTRAINT [PK_WorkOrders]
    PRIMARY KEY CLUSTERED ([WorkOrderID] ASC);
GO

-- Creating primary key on [WorkOrderID], [ProductID], [OperationSequence] in table 'WorkOrderRoutings'
ALTER TABLE [dbo].[WorkOrderRoutings]
ADD CONSTRAINT [PK_WorkOrderRoutings]
    PRIMARY KEY CLUSTERED ([WorkOrderID], [ProductID], [OperationSequence] ASC);
GO

-- Creating primary key on [ProductID], [BusinessEntityID] in table 'ProductVendors'
ALTER TABLE [dbo].[ProductVendors]
ADD CONSTRAINT [PK_ProductVendors]
    PRIMARY KEY CLUSTERED ([ProductID], [BusinessEntityID] ASC);
GO

-- Creating primary key on [PurchaseOrderID], [PurchaseOrderDetailID] in table 'PurchaseOrderDetails'
ALTER TABLE [dbo].[PurchaseOrderDetails]
ADD CONSTRAINT [PK_PurchaseOrderDetails]
    PRIMARY KEY CLUSTERED ([PurchaseOrderID], [PurchaseOrderDetailID] ASC);
GO

-- Creating primary key on [PurchaseOrderID] in table 'PurchaseOrderHeaders'
ALTER TABLE [dbo].[PurchaseOrderHeaders]
ADD CONSTRAINT [PK_PurchaseOrderHeaders]
    PRIMARY KEY CLUSTERED ([PurchaseOrderID] ASC);
GO

-- Creating primary key on [ShipMethodID] in table 'ShipMethods'
ALTER TABLE [dbo].[ShipMethods]
ADD CONSTRAINT [PK_ShipMethods]
    PRIMARY KEY CLUSTERED ([ShipMethodID] ASC);
GO

-- Creating primary key on [BusinessEntityID] in table 'Vendors'
ALTER TABLE [dbo].[Vendors]
ADD CONSTRAINT [PK_Vendors]
    PRIMARY KEY CLUSTERED ([BusinessEntityID] ASC);
GO

-- Creating primary key on [CountryRegionCode], [CurrencyCode] in table 'CountryRegionCurrencies'
ALTER TABLE [dbo].[CountryRegionCurrencies]
ADD CONSTRAINT [PK_CountryRegionCurrencies]
    PRIMARY KEY CLUSTERED ([CountryRegionCode], [CurrencyCode] ASC);
GO

-- Creating primary key on [CreditCardID] in table 'CreditCards'
ALTER TABLE [dbo].[CreditCards]
ADD CONSTRAINT [PK_CreditCards]
    PRIMARY KEY CLUSTERED ([CreditCardID] ASC);
GO

-- Creating primary key on [CurrencyCode] in table 'Currencies'
ALTER TABLE [dbo].[Currencies]
ADD CONSTRAINT [PK_Currencies]
    PRIMARY KEY CLUSTERED ([CurrencyCode] ASC);
GO

-- Creating primary key on [CurrencyRateID] in table 'CurrencyRates'
ALTER TABLE [dbo].[CurrencyRates]
ADD CONSTRAINT [PK_CurrencyRates]
    PRIMARY KEY CLUSTERED ([CurrencyRateID] ASC);
GO

-- Creating primary key on [CustomerID] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([CustomerID] ASC);
GO

-- Creating primary key on [BusinessEntityID], [CreditCardID] in table 'PersonCreditCards'
ALTER TABLE [dbo].[PersonCreditCards]
ADD CONSTRAINT [PK_PersonCreditCards]
    PRIMARY KEY CLUSTERED ([BusinessEntityID], [CreditCardID] ASC);
GO

-- Creating primary key on [SalesOrderID], [SalesOrderDetailID] in table 'SalesOrderDetails'
ALTER TABLE [dbo].[SalesOrderDetails]
ADD CONSTRAINT [PK_SalesOrderDetails]
    PRIMARY KEY CLUSTERED ([SalesOrderID], [SalesOrderDetailID] ASC);
GO

-- Creating primary key on [SalesOrderID] in table 'SalesOrderHeaders'
ALTER TABLE [dbo].[SalesOrderHeaders]
ADD CONSTRAINT [PK_SalesOrderHeaders]
    PRIMARY KEY CLUSTERED ([SalesOrderID] ASC);
GO

-- Creating primary key on [SalesOrderID], [SalesReasonID] in table 'SalesOrderHeaderSalesReasons'
ALTER TABLE [dbo].[SalesOrderHeaderSalesReasons]
ADD CONSTRAINT [PK_SalesOrderHeaderSalesReasons]
    PRIMARY KEY CLUSTERED ([SalesOrderID], [SalesReasonID] ASC);
GO

-- Creating primary key on [BusinessEntityID] in table 'SalesPersons'
ALTER TABLE [dbo].[SalesPersons]
ADD CONSTRAINT [PK_SalesPersons]
    PRIMARY KEY CLUSTERED ([BusinessEntityID] ASC);
GO

-- Creating primary key on [BusinessEntityID], [QuotaDate] in table 'SalesPersonQuotaHistories'
ALTER TABLE [dbo].[SalesPersonQuotaHistories]
ADD CONSTRAINT [PK_SalesPersonQuotaHistories]
    PRIMARY KEY CLUSTERED ([BusinessEntityID], [QuotaDate] ASC);
GO

-- Creating primary key on [SalesReasonID] in table 'SalesReasons'
ALTER TABLE [dbo].[SalesReasons]
ADD CONSTRAINT [PK_SalesReasons]
    PRIMARY KEY CLUSTERED ([SalesReasonID] ASC);
GO

-- Creating primary key on [SalesTaxRateID] in table 'SalesTaxRates'
ALTER TABLE [dbo].[SalesTaxRates]
ADD CONSTRAINT [PK_SalesTaxRates]
    PRIMARY KEY CLUSTERED ([SalesTaxRateID] ASC);
GO

-- Creating primary key on [TerritoryID] in table 'SalesTerritories'
ALTER TABLE [dbo].[SalesTerritories]
ADD CONSTRAINT [PK_SalesTerritories]
    PRIMARY KEY CLUSTERED ([TerritoryID] ASC);
GO

-- Creating primary key on [BusinessEntityID], [TerritoryID], [StartDate] in table 'SalesTerritoryHistories'
ALTER TABLE [dbo].[SalesTerritoryHistories]
ADD CONSTRAINT [PK_SalesTerritoryHistories]
    PRIMARY KEY CLUSTERED ([BusinessEntityID], [TerritoryID], [StartDate] ASC);
GO

-- Creating primary key on [ShoppingCartItemID] in table 'ShoppingCartItems'
ALTER TABLE [dbo].[ShoppingCartItems]
ADD CONSTRAINT [PK_ShoppingCartItems]
    PRIMARY KEY CLUSTERED ([ShoppingCartItemID] ASC);
GO

-- Creating primary key on [SpecialOfferID] in table 'SpecialOffers'
ALTER TABLE [dbo].[SpecialOffers]
ADD CONSTRAINT [PK_SpecialOffers]
    PRIMARY KEY CLUSTERED ([SpecialOfferID] ASC);
GO

-- Creating primary key on [SpecialOfferID], [ProductID] in table 'SpecialOfferProducts'
ALTER TABLE [dbo].[SpecialOfferProducts]
ADD CONSTRAINT [PK_SpecialOfferProducts]
    PRIMARY KEY CLUSTERED ([SpecialOfferID], [ProductID] ASC);
GO

-- Creating primary key on [BusinessEntityID] in table 'Stores'
ALTER TABLE [dbo].[Stores]
ADD CONSTRAINT [PK_Stores]
    PRIMARY KEY CLUSTERED ([BusinessEntityID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [DepartmentID] in table 'EmployeeDepartmentHistories'
ALTER TABLE [dbo].[EmployeeDepartmentHistories]
ADD CONSTRAINT [FK_EmployeeDepartmentHistory_Department_DepartmentID]
    FOREIGN KEY ([DepartmentID])
    REFERENCES [dbo].[Departments]
        ([DepartmentID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_EmployeeDepartmentHistory_Department_DepartmentID'
CREATE INDEX [IX_FK_EmployeeDepartmentHistory_Department_DepartmentID]
ON [dbo].[EmployeeDepartmentHistories]
    ([DepartmentID]);
GO

-- Creating foreign key on [BusinessEntityID] in table 'Employees'
ALTER TABLE [dbo].[Employees]
ADD CONSTRAINT [FK_Employee_Person_BusinessEntityID]
    FOREIGN KEY ([BusinessEntityID])
    REFERENCES [dbo].[People]
        ([BusinessEntityID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [BusinessEntityID] in table 'EmployeeDepartmentHistories'
ALTER TABLE [dbo].[EmployeeDepartmentHistories]
ADD CONSTRAINT [FK_EmployeeDepartmentHistory_Employee_BusinessEntityID]
    FOREIGN KEY ([BusinessEntityID])
    REFERENCES [dbo].[Employees]
        ([BusinessEntityID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [BusinessEntityID] in table 'EmployeePayHistories'
ALTER TABLE [dbo].[EmployeePayHistories]
ADD CONSTRAINT [FK_EmployeePayHistory_Employee_BusinessEntityID]
    FOREIGN KEY ([BusinessEntityID])
    REFERENCES [dbo].[Employees]
        ([BusinessEntityID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [BusinessEntityID] in table 'JobCandidates'
ALTER TABLE [dbo].[JobCandidates]
ADD CONSTRAINT [FK_JobCandidate_Employee_BusinessEntityID]
    FOREIGN KEY ([BusinessEntityID])
    REFERENCES [dbo].[Employees]
        ([BusinessEntityID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_JobCandidate_Employee_BusinessEntityID'
CREATE INDEX [IX_FK_JobCandidate_Employee_BusinessEntityID]
ON [dbo].[JobCandidates]
    ([BusinessEntityID]);
GO

-- Creating foreign key on [EmployeeID] in table 'PurchaseOrderHeaders'
ALTER TABLE [dbo].[PurchaseOrderHeaders]
ADD CONSTRAINT [FK_PurchaseOrderHeader_Employee_EmployeeID]
    FOREIGN KEY ([EmployeeID])
    REFERENCES [dbo].[Employees]
        ([BusinessEntityID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PurchaseOrderHeader_Employee_EmployeeID'
CREATE INDEX [IX_FK_PurchaseOrderHeader_Employee_EmployeeID]
ON [dbo].[PurchaseOrderHeaders]
    ([EmployeeID]);
GO

-- Creating foreign key on [BusinessEntityID] in table 'SalesPersons'
ALTER TABLE [dbo].[SalesPersons]
ADD CONSTRAINT [FK_SalesPerson_Employee_BusinessEntityID]
    FOREIGN KEY ([BusinessEntityID])
    REFERENCES [dbo].[Employees]
        ([BusinessEntityID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ShiftID] in table 'EmployeeDepartmentHistories'
ALTER TABLE [dbo].[EmployeeDepartmentHistories]
ADD CONSTRAINT [FK_EmployeeDepartmentHistory_Shift_ShiftID]
    FOREIGN KEY ([ShiftID])
    REFERENCES [dbo].[Shifts]
        ([ShiftID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_EmployeeDepartmentHistory_Shift_ShiftID'
CREATE INDEX [IX_FK_EmployeeDepartmentHistory_Shift_ShiftID]
ON [dbo].[EmployeeDepartmentHistories]
    ([ShiftID]);
GO

-- Creating foreign key on [StateProvinceID] in table 'Addresses'
ALTER TABLE [dbo].[Addresses]
ADD CONSTRAINT [FK_Address_StateProvince_StateProvinceID]
    FOREIGN KEY ([StateProvinceID])
    REFERENCES [dbo].[StateProvinces]
        ([StateProvinceID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Address_StateProvince_StateProvinceID'
CREATE INDEX [IX_FK_Address_StateProvince_StateProvinceID]
ON [dbo].[Addresses]
    ([StateProvinceID]);
GO

-- Creating foreign key on [AddressID] in table 'BusinessEntityAddresses'
ALTER TABLE [dbo].[BusinessEntityAddresses]
ADD CONSTRAINT [FK_BusinessEntityAddress_Address_AddressID]
    FOREIGN KEY ([AddressID])
    REFERENCES [dbo].[Addresses]
        ([AddressID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BusinessEntityAddress_Address_AddressID'
CREATE INDEX [IX_FK_BusinessEntityAddress_Address_AddressID]
ON [dbo].[BusinessEntityAddresses]
    ([AddressID]);
GO

-- Creating foreign key on [BillToAddressID] in table 'SalesOrderHeaders'
ALTER TABLE [dbo].[SalesOrderHeaders]
ADD CONSTRAINT [FK_SalesOrderHeader_Address_BillToAddressID]
    FOREIGN KEY ([BillToAddressID])
    REFERENCES [dbo].[Addresses]
        ([AddressID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesOrderHeader_Address_BillToAddressID'
CREATE INDEX [IX_FK_SalesOrderHeader_Address_BillToAddressID]
ON [dbo].[SalesOrderHeaders]
    ([BillToAddressID]);
GO

-- Creating foreign key on [ShipToAddressID] in table 'SalesOrderHeaders'
ALTER TABLE [dbo].[SalesOrderHeaders]
ADD CONSTRAINT [FK_SalesOrderHeader_Address_ShipToAddressID]
    FOREIGN KEY ([ShipToAddressID])
    REFERENCES [dbo].[Addresses]
        ([AddressID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesOrderHeader_Address_ShipToAddressID'
CREATE INDEX [IX_FK_SalesOrderHeader_Address_ShipToAddressID]
ON [dbo].[SalesOrderHeaders]
    ([ShipToAddressID]);
GO

-- Creating foreign key on [AddressTypeID] in table 'BusinessEntityAddresses'
ALTER TABLE [dbo].[BusinessEntityAddresses]
ADD CONSTRAINT [FK_BusinessEntityAddress_AddressType_AddressTypeID]
    FOREIGN KEY ([AddressTypeID])
    REFERENCES [dbo].[AddressTypes]
        ([AddressTypeID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BusinessEntityAddress_AddressType_AddressTypeID'
CREATE INDEX [IX_FK_BusinessEntityAddress_AddressType_AddressTypeID]
ON [dbo].[BusinessEntityAddresses]
    ([AddressTypeID]);
GO

-- Creating foreign key on [BusinessEntityID] in table 'BusinessEntityAddresses'
ALTER TABLE [dbo].[BusinessEntityAddresses]
ADD CONSTRAINT [FK_BusinessEntityAddress_BusinessEntity_BusinessEntityID]
    FOREIGN KEY ([BusinessEntityID])
    REFERENCES [dbo].[BusinessEntities]
        ([BusinessEntityID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [BusinessEntityID] in table 'BusinessEntityContacts'
ALTER TABLE [dbo].[BusinessEntityContacts]
ADD CONSTRAINT [FK_BusinessEntityContact_BusinessEntity_BusinessEntityID]
    FOREIGN KEY ([BusinessEntityID])
    REFERENCES [dbo].[BusinessEntities]
        ([BusinessEntityID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [BusinessEntityID] in table 'People'
ALTER TABLE [dbo].[People]
ADD CONSTRAINT [FK_Person_BusinessEntity_BusinessEntityID]
    FOREIGN KEY ([BusinessEntityID])
    REFERENCES [dbo].[BusinessEntities]
        ([BusinessEntityID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [BusinessEntityID] in table 'Stores'
ALTER TABLE [dbo].[Stores]
ADD CONSTRAINT [FK_Store_BusinessEntity_BusinessEntityID]
    FOREIGN KEY ([BusinessEntityID])
    REFERENCES [dbo].[BusinessEntities]
        ([BusinessEntityID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [BusinessEntityID] in table 'Vendors'
ALTER TABLE [dbo].[Vendors]
ADD CONSTRAINT [FK_Vendor_BusinessEntity_BusinessEntityID]
    FOREIGN KEY ([BusinessEntityID])
    REFERENCES [dbo].[BusinessEntities]
        ([BusinessEntityID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ContactTypeID] in table 'BusinessEntityContacts'
ALTER TABLE [dbo].[BusinessEntityContacts]
ADD CONSTRAINT [FK_BusinessEntityContact_ContactType_ContactTypeID]
    FOREIGN KEY ([ContactTypeID])
    REFERENCES [dbo].[ContactTypes]
        ([ContactTypeID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BusinessEntityContact_ContactType_ContactTypeID'
CREATE INDEX [IX_FK_BusinessEntityContact_ContactType_ContactTypeID]
ON [dbo].[BusinessEntityContacts]
    ([ContactTypeID]);
GO

-- Creating foreign key on [PersonID] in table 'BusinessEntityContacts'
ALTER TABLE [dbo].[BusinessEntityContacts]
ADD CONSTRAINT [FK_BusinessEntityContact_Person_PersonID]
    FOREIGN KEY ([PersonID])
    REFERENCES [dbo].[People]
        ([BusinessEntityID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BusinessEntityContact_Person_PersonID'
CREATE INDEX [IX_FK_BusinessEntityContact_Person_PersonID]
ON [dbo].[BusinessEntityContacts]
    ([PersonID]);
GO

-- Creating foreign key on [CountryRegionCode] in table 'CountryRegionCurrencies'
ALTER TABLE [dbo].[CountryRegionCurrencies]
ADD CONSTRAINT [FK_CountryRegionCurrency_CountryRegion_CountryRegionCode]
    FOREIGN KEY ([CountryRegionCode])
    REFERENCES [dbo].[CountryRegions]
        ([CountryRegionCode])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [CountryRegionCode] in table 'SalesTerritories'
ALTER TABLE [dbo].[SalesTerritories]
ADD CONSTRAINT [FK_SalesTerritory_CountryRegion_CountryRegionCode]
    FOREIGN KEY ([CountryRegionCode])
    REFERENCES [dbo].[CountryRegions]
        ([CountryRegionCode])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesTerritory_CountryRegion_CountryRegionCode'
CREATE INDEX [IX_FK_SalesTerritory_CountryRegion_CountryRegionCode]
ON [dbo].[SalesTerritories]
    ([CountryRegionCode]);
GO

-- Creating foreign key on [CountryRegionCode] in table 'StateProvinces'
ALTER TABLE [dbo].[StateProvinces]
ADD CONSTRAINT [FK_StateProvince_CountryRegion_CountryRegionCode]
    FOREIGN KEY ([CountryRegionCode])
    REFERENCES [dbo].[CountryRegions]
        ([CountryRegionCode])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_StateProvince_CountryRegion_CountryRegionCode'
CREATE INDEX [IX_FK_StateProvince_CountryRegion_CountryRegionCode]
ON [dbo].[StateProvinces]
    ([CountryRegionCode]);
GO

-- Creating foreign key on [BusinessEntityID] in table 'EmailAddresses'
ALTER TABLE [dbo].[EmailAddresses]
ADD CONSTRAINT [FK_EmailAddress_Person_BusinessEntityID]
    FOREIGN KEY ([BusinessEntityID])
    REFERENCES [dbo].[People]
        ([BusinessEntityID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [BusinessEntityID] in table 'Passwords'
ALTER TABLE [dbo].[Passwords]
ADD CONSTRAINT [FK_Password_Person_BusinessEntityID]
    FOREIGN KEY ([BusinessEntityID])
    REFERENCES [dbo].[People]
        ([BusinessEntityID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [PersonID] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [FK_Customer_Person_PersonID]
    FOREIGN KEY ([PersonID])
    REFERENCES [dbo].[People]
        ([BusinessEntityID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Customer_Person_PersonID'
CREATE INDEX [IX_FK_Customer_Person_PersonID]
ON [dbo].[Customers]
    ([PersonID]);
GO

-- Creating foreign key on [BusinessEntityID] in table 'PersonCreditCards'
ALTER TABLE [dbo].[PersonCreditCards]
ADD CONSTRAINT [FK_PersonCreditCard_Person_BusinessEntityID]
    FOREIGN KEY ([BusinessEntityID])
    REFERENCES [dbo].[People]
        ([BusinessEntityID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [BusinessEntityID] in table 'PersonPhones'
ALTER TABLE [dbo].[PersonPhones]
ADD CONSTRAINT [FK_PersonPhone_Person_BusinessEntityID]
    FOREIGN KEY ([BusinessEntityID])
    REFERENCES [dbo].[People]
        ([BusinessEntityID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [PhoneNumberTypeID] in table 'PersonPhones'
ALTER TABLE [dbo].[PersonPhones]
ADD CONSTRAINT [FK_PersonPhone_PhoneNumberType_PhoneNumberTypeID]
    FOREIGN KEY ([PhoneNumberTypeID])
    REFERENCES [dbo].[PhoneNumberTypes]
        ([PhoneNumberTypeID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonPhone_PhoneNumberType_PhoneNumberTypeID'
CREATE INDEX [IX_FK_PersonPhone_PhoneNumberType_PhoneNumberTypeID]
ON [dbo].[PersonPhones]
    ([PhoneNumberTypeID]);
GO

-- Creating foreign key on [StateProvinceID] in table 'SalesTaxRates'
ALTER TABLE [dbo].[SalesTaxRates]
ADD CONSTRAINT [FK_SalesTaxRate_StateProvince_StateProvinceID]
    FOREIGN KEY ([StateProvinceID])
    REFERENCES [dbo].[StateProvinces]
        ([StateProvinceID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesTaxRate_StateProvince_StateProvinceID'
CREATE INDEX [IX_FK_SalesTaxRate_StateProvince_StateProvinceID]
ON [dbo].[SalesTaxRates]
    ([StateProvinceID]);
GO

-- Creating foreign key on [TerritoryID] in table 'StateProvinces'
ALTER TABLE [dbo].[StateProvinces]
ADD CONSTRAINT [FK_StateProvince_SalesTerritory_TerritoryID]
    FOREIGN KEY ([TerritoryID])
    REFERENCES [dbo].[SalesTerritories]
        ([TerritoryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_StateProvince_SalesTerritory_TerritoryID'
CREATE INDEX [IX_FK_StateProvince_SalesTerritory_TerritoryID]
ON [dbo].[StateProvinces]
    ([TerritoryID]);
GO

-- Creating foreign key on [ComponentID] in table 'BillOfMaterials'
ALTER TABLE [dbo].[BillOfMaterials]
ADD CONSTRAINT [FK_BillOfMaterials_Product_ComponentID]
    FOREIGN KEY ([ComponentID])
    REFERENCES [dbo].[Products]
        ([ProductID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BillOfMaterials_Product_ComponentID'
CREATE INDEX [IX_FK_BillOfMaterials_Product_ComponentID]
ON [dbo].[BillOfMaterials]
    ([ComponentID]);
GO

-- Creating foreign key on [ProductAssemblyID] in table 'BillOfMaterials'
ALTER TABLE [dbo].[BillOfMaterials]
ADD CONSTRAINT [FK_BillOfMaterials_Product_ProductAssemblyID]
    FOREIGN KEY ([ProductAssemblyID])
    REFERENCES [dbo].[Products]
        ([ProductID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BillOfMaterials_Product_ProductAssemblyID'
CREATE INDEX [IX_FK_BillOfMaterials_Product_ProductAssemblyID]
ON [dbo].[BillOfMaterials]
    ([ProductAssemblyID]);
GO

-- Creating foreign key on [UnitMeasureCode] in table 'BillOfMaterials'
ALTER TABLE [dbo].[BillOfMaterials]
ADD CONSTRAINT [FK_BillOfMaterials_UnitMeasure_UnitMeasureCode]
    FOREIGN KEY ([UnitMeasureCode])
    REFERENCES [dbo].[UnitMeasures]
        ([UnitMeasureCode])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BillOfMaterials_UnitMeasure_UnitMeasureCode'
CREATE INDEX [IX_FK_BillOfMaterials_UnitMeasure_UnitMeasureCode]
ON [dbo].[BillOfMaterials]
    ([UnitMeasureCode]);
GO

-- Creating foreign key on [CultureID] in table 'ProductModelProductDescriptionCultures'
ALTER TABLE [dbo].[ProductModelProductDescriptionCultures]
ADD CONSTRAINT [FK_ProductModelProductDescriptionCulture_Culture_CultureID]
    FOREIGN KEY ([CultureID])
    REFERENCES [dbo].[Cultures]
        ([CultureID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductModelProductDescriptionCulture_Culture_CultureID'
CREATE INDEX [IX_FK_ProductModelProductDescriptionCulture_Culture_CultureID]
ON [dbo].[ProductModelProductDescriptionCultures]
    ([CultureID]);
GO

-- Creating foreign key on [IllustrationID] in table 'ProductModelIllustrations'
ALTER TABLE [dbo].[ProductModelIllustrations]
ADD CONSTRAINT [FK_ProductModelIllustration_Illustration_IllustrationID]
    FOREIGN KEY ([IllustrationID])
    REFERENCES [dbo].[Illustrations]
        ([IllustrationID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductModelIllustration_Illustration_IllustrationID'
CREATE INDEX [IX_FK_ProductModelIllustration_Illustration_IllustrationID]
ON [dbo].[ProductModelIllustrations]
    ([IllustrationID]);
GO

-- Creating foreign key on [LocationID] in table 'ProductInventories'
ALTER TABLE [dbo].[ProductInventories]
ADD CONSTRAINT [FK_ProductInventory_Location_LocationID]
    FOREIGN KEY ([LocationID])
    REFERENCES [dbo].[Locations]
        ([LocationID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductInventory_Location_LocationID'
CREATE INDEX [IX_FK_ProductInventory_Location_LocationID]
ON [dbo].[ProductInventories]
    ([LocationID]);
GO

-- Creating foreign key on [LocationID] in table 'WorkOrderRoutings'
ALTER TABLE [dbo].[WorkOrderRoutings]
ADD CONSTRAINT [FK_WorkOrderRouting_Location_LocationID]
    FOREIGN KEY ([LocationID])
    REFERENCES [dbo].[Locations]
        ([LocationID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_WorkOrderRouting_Location_LocationID'
CREATE INDEX [IX_FK_WorkOrderRouting_Location_LocationID]
ON [dbo].[WorkOrderRoutings]
    ([LocationID]);
GO

-- Creating foreign key on [ProductModelID] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_Product_ProductModel_ProductModelID]
    FOREIGN KEY ([ProductModelID])
    REFERENCES [dbo].[ProductModels]
        ([ProductModelID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Product_ProductModel_ProductModelID'
CREATE INDEX [IX_FK_Product_ProductModel_ProductModelID]
ON [dbo].[Products]
    ([ProductModelID]);
GO

-- Creating foreign key on [ProductSubcategoryID] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_Product_ProductSubcategory_ProductSubcategoryID]
    FOREIGN KEY ([ProductSubcategoryID])
    REFERENCES [dbo].[ProductSubcategories]
        ([ProductSubcategoryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Product_ProductSubcategory_ProductSubcategoryID'
CREATE INDEX [IX_FK_Product_ProductSubcategory_ProductSubcategoryID]
ON [dbo].[Products]
    ([ProductSubcategoryID]);
GO

-- Creating foreign key on [SizeUnitMeasureCode] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_Product_UnitMeasure_SizeUnitMeasureCode]
    FOREIGN KEY ([SizeUnitMeasureCode])
    REFERENCES [dbo].[UnitMeasures]
        ([UnitMeasureCode])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Product_UnitMeasure_SizeUnitMeasureCode'
CREATE INDEX [IX_FK_Product_UnitMeasure_SizeUnitMeasureCode]
ON [dbo].[Products]
    ([SizeUnitMeasureCode]);
GO

-- Creating foreign key on [WeightUnitMeasureCode] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_Product_UnitMeasure_WeightUnitMeasureCode]
    FOREIGN KEY ([WeightUnitMeasureCode])
    REFERENCES [dbo].[UnitMeasures]
        ([UnitMeasureCode])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Product_UnitMeasure_WeightUnitMeasureCode'
CREATE INDEX [IX_FK_Product_UnitMeasure_WeightUnitMeasureCode]
ON [dbo].[Products]
    ([WeightUnitMeasureCode]);
GO

-- Creating foreign key on [ProductID] in table 'ProductCostHistories'
ALTER TABLE [dbo].[ProductCostHistories]
ADD CONSTRAINT [FK_ProductCostHistory_Product_ProductID]
    FOREIGN KEY ([ProductID])
    REFERENCES [dbo].[Products]
        ([ProductID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ProductID] in table 'ProductInventories'
ALTER TABLE [dbo].[ProductInventories]
ADD CONSTRAINT [FK_ProductInventory_Product_ProductID]
    FOREIGN KEY ([ProductID])
    REFERENCES [dbo].[Products]
        ([ProductID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ProductID] in table 'ProductListPriceHistories'
ALTER TABLE [dbo].[ProductListPriceHistories]
ADD CONSTRAINT [FK_ProductListPriceHistory_Product_ProductID]
    FOREIGN KEY ([ProductID])
    REFERENCES [dbo].[Products]
        ([ProductID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ProductID] in table 'ProductProductPhotoes'
ALTER TABLE [dbo].[ProductProductPhotoes]
ADD CONSTRAINT [FK_ProductProductPhoto_Product_ProductID]
    FOREIGN KEY ([ProductID])
    REFERENCES [dbo].[Products]
        ([ProductID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ProductID] in table 'ProductReviews'
ALTER TABLE [dbo].[ProductReviews]
ADD CONSTRAINT [FK_ProductReview_Product_ProductID]
    FOREIGN KEY ([ProductID])
    REFERENCES [dbo].[Products]
        ([ProductID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductReview_Product_ProductID'
CREATE INDEX [IX_FK_ProductReview_Product_ProductID]
ON [dbo].[ProductReviews]
    ([ProductID]);
GO

-- Creating foreign key on [ProductID] in table 'ProductVendors'
ALTER TABLE [dbo].[ProductVendors]
ADD CONSTRAINT [FK_ProductVendor_Product_ProductID]
    FOREIGN KEY ([ProductID])
    REFERENCES [dbo].[Products]
        ([ProductID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ProductID] in table 'PurchaseOrderDetails'
ALTER TABLE [dbo].[PurchaseOrderDetails]
ADD CONSTRAINT [FK_PurchaseOrderDetail_Product_ProductID]
    FOREIGN KEY ([ProductID])
    REFERENCES [dbo].[Products]
        ([ProductID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PurchaseOrderDetail_Product_ProductID'
CREATE INDEX [IX_FK_PurchaseOrderDetail_Product_ProductID]
ON [dbo].[PurchaseOrderDetails]
    ([ProductID]);
GO

-- Creating foreign key on [ProductID] in table 'ShoppingCartItems'
ALTER TABLE [dbo].[ShoppingCartItems]
ADD CONSTRAINT [FK_ShoppingCartItem_Product_ProductID]
    FOREIGN KEY ([ProductID])
    REFERENCES [dbo].[Products]
        ([ProductID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ShoppingCartItem_Product_ProductID'
CREATE INDEX [IX_FK_ShoppingCartItem_Product_ProductID]
ON [dbo].[ShoppingCartItems]
    ([ProductID]);
GO

-- Creating foreign key on [ProductID] in table 'SpecialOfferProducts'
ALTER TABLE [dbo].[SpecialOfferProducts]
ADD CONSTRAINT [FK_SpecialOfferProduct_Product_ProductID]
    FOREIGN KEY ([ProductID])
    REFERENCES [dbo].[Products]
        ([ProductID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SpecialOfferProduct_Product_ProductID'
CREATE INDEX [IX_FK_SpecialOfferProduct_Product_ProductID]
ON [dbo].[SpecialOfferProducts]
    ([ProductID]);
GO

-- Creating foreign key on [ProductID] in table 'TransactionHistories'
ALTER TABLE [dbo].[TransactionHistories]
ADD CONSTRAINT [FK_TransactionHistory_Product_ProductID]
    FOREIGN KEY ([ProductID])
    REFERENCES [dbo].[Products]
        ([ProductID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TransactionHistory_Product_ProductID'
CREATE INDEX [IX_FK_TransactionHistory_Product_ProductID]
ON [dbo].[TransactionHistories]
    ([ProductID]);
GO

-- Creating foreign key on [ProductID] in table 'WorkOrders'
ALTER TABLE [dbo].[WorkOrders]
ADD CONSTRAINT [FK_WorkOrder_Product_ProductID]
    FOREIGN KEY ([ProductID])
    REFERENCES [dbo].[Products]
        ([ProductID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_WorkOrder_Product_ProductID'
CREATE INDEX [IX_FK_WorkOrder_Product_ProductID]
ON [dbo].[WorkOrders]
    ([ProductID]);
GO

-- Creating foreign key on [ProductCategoryID] in table 'ProductSubcategories'
ALTER TABLE [dbo].[ProductSubcategories]
ADD CONSTRAINT [FK_ProductSubcategory_ProductCategory_ProductCategoryID]
    FOREIGN KEY ([ProductCategoryID])
    REFERENCES [dbo].[ProductCategories]
        ([ProductCategoryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductSubcategory_ProductCategory_ProductCategoryID'
CREATE INDEX [IX_FK_ProductSubcategory_ProductCategory_ProductCategoryID]
ON [dbo].[ProductSubcategories]
    ([ProductCategoryID]);
GO

-- Creating foreign key on [ProductDescriptionID] in table 'ProductModelProductDescriptionCultures'
ALTER TABLE [dbo].[ProductModelProductDescriptionCultures]
ADD CONSTRAINT [FK_ProductModelProductDescriptionCulture_ProductDescription_ProductDescriptionID]
    FOREIGN KEY ([ProductDescriptionID])
    REFERENCES [dbo].[ProductDescriptions]
        ([ProductDescriptionID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductModelProductDescriptionCulture_ProductDescription_ProductDescriptionID'
CREATE INDEX [IX_FK_ProductModelProductDescriptionCulture_ProductDescription_ProductDescriptionID]
ON [dbo].[ProductModelProductDescriptionCultures]
    ([ProductDescriptionID]);
GO

-- Creating foreign key on [ProductModelID] in table 'ProductModelIllustrations'
ALTER TABLE [dbo].[ProductModelIllustrations]
ADD CONSTRAINT [FK_ProductModelIllustration_ProductModel_ProductModelID]
    FOREIGN KEY ([ProductModelID])
    REFERENCES [dbo].[ProductModels]
        ([ProductModelID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ProductModelID] in table 'ProductModelProductDescriptionCultures'
ALTER TABLE [dbo].[ProductModelProductDescriptionCultures]
ADD CONSTRAINT [FK_ProductModelProductDescriptionCulture_ProductModel_ProductModelID]
    FOREIGN KEY ([ProductModelID])
    REFERENCES [dbo].[ProductModels]
        ([ProductModelID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ProductPhotoID] in table 'ProductProductPhotoes'
ALTER TABLE [dbo].[ProductProductPhotoes]
ADD CONSTRAINT [FK_ProductProductPhoto_ProductPhoto_ProductPhotoID]
    FOREIGN KEY ([ProductPhotoID])
    REFERENCES [dbo].[ProductPhotoes]
        ([ProductPhotoID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductProductPhoto_ProductPhoto_ProductPhotoID'
CREATE INDEX [IX_FK_ProductProductPhoto_ProductPhoto_ProductPhotoID]
ON [dbo].[ProductProductPhotoes]
    ([ProductPhotoID]);
GO

-- Creating foreign key on [ScrapReasonID] in table 'WorkOrders'
ALTER TABLE [dbo].[WorkOrders]
ADD CONSTRAINT [FK_WorkOrder_ScrapReason_ScrapReasonID]
    FOREIGN KEY ([ScrapReasonID])
    REFERENCES [dbo].[ScrapReasons]
        ([ScrapReasonID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_WorkOrder_ScrapReason_ScrapReasonID'
CREATE INDEX [IX_FK_WorkOrder_ScrapReason_ScrapReasonID]
ON [dbo].[WorkOrders]
    ([ScrapReasonID]);
GO

-- Creating foreign key on [UnitMeasureCode] in table 'ProductVendors'
ALTER TABLE [dbo].[ProductVendors]
ADD CONSTRAINT [FK_ProductVendor_UnitMeasure_UnitMeasureCode]
    FOREIGN KEY ([UnitMeasureCode])
    REFERENCES [dbo].[UnitMeasures]
        ([UnitMeasureCode])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductVendor_UnitMeasure_UnitMeasureCode'
CREATE INDEX [IX_FK_ProductVendor_UnitMeasure_UnitMeasureCode]
ON [dbo].[ProductVendors]
    ([UnitMeasureCode]);
GO

-- Creating foreign key on [WorkOrderID] in table 'WorkOrderRoutings'
ALTER TABLE [dbo].[WorkOrderRoutings]
ADD CONSTRAINT [FK_WorkOrderRouting_WorkOrder_WorkOrderID]
    FOREIGN KEY ([WorkOrderID])
    REFERENCES [dbo].[WorkOrders]
        ([WorkOrderID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [BusinessEntityID] in table 'ProductVendors'
ALTER TABLE [dbo].[ProductVendors]
ADD CONSTRAINT [FK_ProductVendor_Vendor_BusinessEntityID]
    FOREIGN KEY ([BusinessEntityID])
    REFERENCES [dbo].[Vendors]
        ([BusinessEntityID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductVendor_Vendor_BusinessEntityID'
CREATE INDEX [IX_FK_ProductVendor_Vendor_BusinessEntityID]
ON [dbo].[ProductVendors]
    ([BusinessEntityID]);
GO

-- Creating foreign key on [PurchaseOrderID] in table 'PurchaseOrderDetails'
ALTER TABLE [dbo].[PurchaseOrderDetails]
ADD CONSTRAINT [FK_PurchaseOrderDetail_PurchaseOrderHeader_PurchaseOrderID]
    FOREIGN KEY ([PurchaseOrderID])
    REFERENCES [dbo].[PurchaseOrderHeaders]
        ([PurchaseOrderID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ShipMethodID] in table 'PurchaseOrderHeaders'
ALTER TABLE [dbo].[PurchaseOrderHeaders]
ADD CONSTRAINT [FK_PurchaseOrderHeader_ShipMethod_ShipMethodID]
    FOREIGN KEY ([ShipMethodID])
    REFERENCES [dbo].[ShipMethods]
        ([ShipMethodID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PurchaseOrderHeader_ShipMethod_ShipMethodID'
CREATE INDEX [IX_FK_PurchaseOrderHeader_ShipMethod_ShipMethodID]
ON [dbo].[PurchaseOrderHeaders]
    ([ShipMethodID]);
GO

-- Creating foreign key on [VendorID] in table 'PurchaseOrderHeaders'
ALTER TABLE [dbo].[PurchaseOrderHeaders]
ADD CONSTRAINT [FK_PurchaseOrderHeader_Vendor_VendorID]
    FOREIGN KEY ([VendorID])
    REFERENCES [dbo].[Vendors]
        ([BusinessEntityID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PurchaseOrderHeader_Vendor_VendorID'
CREATE INDEX [IX_FK_PurchaseOrderHeader_Vendor_VendorID]
ON [dbo].[PurchaseOrderHeaders]
    ([VendorID]);
GO

-- Creating foreign key on [ShipMethodID] in table 'SalesOrderHeaders'
ALTER TABLE [dbo].[SalesOrderHeaders]
ADD CONSTRAINT [FK_SalesOrderHeader_ShipMethod_ShipMethodID]
    FOREIGN KEY ([ShipMethodID])
    REFERENCES [dbo].[ShipMethods]
        ([ShipMethodID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesOrderHeader_ShipMethod_ShipMethodID'
CREATE INDEX [IX_FK_SalesOrderHeader_ShipMethod_ShipMethodID]
ON [dbo].[SalesOrderHeaders]
    ([ShipMethodID]);
GO

-- Creating foreign key on [CurrencyCode] in table 'CountryRegionCurrencies'
ALTER TABLE [dbo].[CountryRegionCurrencies]
ADD CONSTRAINT [FK_CountryRegionCurrency_Currency_CurrencyCode]
    FOREIGN KEY ([CurrencyCode])
    REFERENCES [dbo].[Currencies]
        ([CurrencyCode])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CountryRegionCurrency_Currency_CurrencyCode'
CREATE INDEX [IX_FK_CountryRegionCurrency_Currency_CurrencyCode]
ON [dbo].[CountryRegionCurrencies]
    ([CurrencyCode]);
GO

-- Creating foreign key on [CreditCardID] in table 'PersonCreditCards'
ALTER TABLE [dbo].[PersonCreditCards]
ADD CONSTRAINT [FK_PersonCreditCard_CreditCard_CreditCardID]
    FOREIGN KEY ([CreditCardID])
    REFERENCES [dbo].[CreditCards]
        ([CreditCardID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonCreditCard_CreditCard_CreditCardID'
CREATE INDEX [IX_FK_PersonCreditCard_CreditCard_CreditCardID]
ON [dbo].[PersonCreditCards]
    ([CreditCardID]);
GO

-- Creating foreign key on [CreditCardID] in table 'SalesOrderHeaders'
ALTER TABLE [dbo].[SalesOrderHeaders]
ADD CONSTRAINT [FK_SalesOrderHeader_CreditCard_CreditCardID]
    FOREIGN KEY ([CreditCardID])
    REFERENCES [dbo].[CreditCards]
        ([CreditCardID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesOrderHeader_CreditCard_CreditCardID'
CREATE INDEX [IX_FK_SalesOrderHeader_CreditCard_CreditCardID]
ON [dbo].[SalesOrderHeaders]
    ([CreditCardID]);
GO

-- Creating foreign key on [FromCurrencyCode] in table 'CurrencyRates'
ALTER TABLE [dbo].[CurrencyRates]
ADD CONSTRAINT [FK_CurrencyRate_Currency_FromCurrencyCode]
    FOREIGN KEY ([FromCurrencyCode])
    REFERENCES [dbo].[Currencies]
        ([CurrencyCode])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CurrencyRate_Currency_FromCurrencyCode'
CREATE INDEX [IX_FK_CurrencyRate_Currency_FromCurrencyCode]
ON [dbo].[CurrencyRates]
    ([FromCurrencyCode]);
GO

-- Creating foreign key on [ToCurrencyCode] in table 'CurrencyRates'
ALTER TABLE [dbo].[CurrencyRates]
ADD CONSTRAINT [FK_CurrencyRate_Currency_ToCurrencyCode]
    FOREIGN KEY ([ToCurrencyCode])
    REFERENCES [dbo].[Currencies]
        ([CurrencyCode])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CurrencyRate_Currency_ToCurrencyCode'
CREATE INDEX [IX_FK_CurrencyRate_Currency_ToCurrencyCode]
ON [dbo].[CurrencyRates]
    ([ToCurrencyCode]);
GO

-- Creating foreign key on [CurrencyRateID] in table 'SalesOrderHeaders'
ALTER TABLE [dbo].[SalesOrderHeaders]
ADD CONSTRAINT [FK_SalesOrderHeader_CurrencyRate_CurrencyRateID]
    FOREIGN KEY ([CurrencyRateID])
    REFERENCES [dbo].[CurrencyRates]
        ([CurrencyRateID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesOrderHeader_CurrencyRate_CurrencyRateID'
CREATE INDEX [IX_FK_SalesOrderHeader_CurrencyRate_CurrencyRateID]
ON [dbo].[SalesOrderHeaders]
    ([CurrencyRateID]);
GO

-- Creating foreign key on [TerritoryID] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [FK_Customer_SalesTerritory_TerritoryID]
    FOREIGN KEY ([TerritoryID])
    REFERENCES [dbo].[SalesTerritories]
        ([TerritoryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Customer_SalesTerritory_TerritoryID'
CREATE INDEX [IX_FK_Customer_SalesTerritory_TerritoryID]
ON [dbo].[Customers]
    ([TerritoryID]);
GO

-- Creating foreign key on [StoreID] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [FK_Customer_Store_StoreID]
    FOREIGN KEY ([StoreID])
    REFERENCES [dbo].[Stores]
        ([BusinessEntityID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Customer_Store_StoreID'
CREATE INDEX [IX_FK_Customer_Store_StoreID]
ON [dbo].[Customers]
    ([StoreID]);
GO

-- Creating foreign key on [CustomerID] in table 'SalesOrderHeaders'
ALTER TABLE [dbo].[SalesOrderHeaders]
ADD CONSTRAINT [FK_SalesOrderHeader_Customer_CustomerID]
    FOREIGN KEY ([CustomerID])
    REFERENCES [dbo].[Customers]
        ([CustomerID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesOrderHeader_Customer_CustomerID'
CREATE INDEX [IX_FK_SalesOrderHeader_Customer_CustomerID]
ON [dbo].[SalesOrderHeaders]
    ([CustomerID]);
GO

-- Creating foreign key on [SalesOrderID] in table 'SalesOrderDetails'
ALTER TABLE [dbo].[SalesOrderDetails]
ADD CONSTRAINT [FK_SalesOrderDetail_SalesOrderHeader_SalesOrderID]
    FOREIGN KEY ([SalesOrderID])
    REFERENCES [dbo].[SalesOrderHeaders]
        ([SalesOrderID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [SpecialOfferID], [ProductID] in table 'SalesOrderDetails'
ALTER TABLE [dbo].[SalesOrderDetails]
ADD CONSTRAINT [FK_SalesOrderDetail_SpecialOfferProduct_SpecialOfferIDProductID]
    FOREIGN KEY ([SpecialOfferID], [ProductID])
    REFERENCES [dbo].[SpecialOfferProducts]
        ([SpecialOfferID], [ProductID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesOrderDetail_SpecialOfferProduct_SpecialOfferIDProductID'
CREATE INDEX [IX_FK_SalesOrderDetail_SpecialOfferProduct_SpecialOfferIDProductID]
ON [dbo].[SalesOrderDetails]
    ([SpecialOfferID], [ProductID]);
GO

-- Creating foreign key on [SalesPersonID] in table 'SalesOrderHeaders'
ALTER TABLE [dbo].[SalesOrderHeaders]
ADD CONSTRAINT [FK_SalesOrderHeader_SalesPerson_SalesPersonID]
    FOREIGN KEY ([SalesPersonID])
    REFERENCES [dbo].[SalesPersons]
        ([BusinessEntityID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesOrderHeader_SalesPerson_SalesPersonID'
CREATE INDEX [IX_FK_SalesOrderHeader_SalesPerson_SalesPersonID]
ON [dbo].[SalesOrderHeaders]
    ([SalesPersonID]);
GO

-- Creating foreign key on [TerritoryID] in table 'SalesOrderHeaders'
ALTER TABLE [dbo].[SalesOrderHeaders]
ADD CONSTRAINT [FK_SalesOrderHeader_SalesTerritory_TerritoryID]
    FOREIGN KEY ([TerritoryID])
    REFERENCES [dbo].[SalesTerritories]
        ([TerritoryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesOrderHeader_SalesTerritory_TerritoryID'
CREATE INDEX [IX_FK_SalesOrderHeader_SalesTerritory_TerritoryID]
ON [dbo].[SalesOrderHeaders]
    ([TerritoryID]);
GO

-- Creating foreign key on [SalesOrderID] in table 'SalesOrderHeaderSalesReasons'
ALTER TABLE [dbo].[SalesOrderHeaderSalesReasons]
ADD CONSTRAINT [FK_SalesOrderHeaderSalesReason_SalesOrderHeader_SalesOrderID]
    FOREIGN KEY ([SalesOrderID])
    REFERENCES [dbo].[SalesOrderHeaders]
        ([SalesOrderID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [SalesReasonID] in table 'SalesOrderHeaderSalesReasons'
ALTER TABLE [dbo].[SalesOrderHeaderSalesReasons]
ADD CONSTRAINT [FK_SalesOrderHeaderSalesReason_SalesReason_SalesReasonID]
    FOREIGN KEY ([SalesReasonID])
    REFERENCES [dbo].[SalesReasons]
        ([SalesReasonID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesOrderHeaderSalesReason_SalesReason_SalesReasonID'
CREATE INDEX [IX_FK_SalesOrderHeaderSalesReason_SalesReason_SalesReasonID]
ON [dbo].[SalesOrderHeaderSalesReasons]
    ([SalesReasonID]);
GO

-- Creating foreign key on [TerritoryID] in table 'SalesPersons'
ALTER TABLE [dbo].[SalesPersons]
ADD CONSTRAINT [FK_SalesPerson_SalesTerritory_TerritoryID]
    FOREIGN KEY ([TerritoryID])
    REFERENCES [dbo].[SalesTerritories]
        ([TerritoryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesPerson_SalesTerritory_TerritoryID'
CREATE INDEX [IX_FK_SalesPerson_SalesTerritory_TerritoryID]
ON [dbo].[SalesPersons]
    ([TerritoryID]);
GO

-- Creating foreign key on [BusinessEntityID] in table 'SalesPersonQuotaHistories'
ALTER TABLE [dbo].[SalesPersonQuotaHistories]
ADD CONSTRAINT [FK_SalesPersonQuotaHistory_SalesPerson_BusinessEntityID]
    FOREIGN KEY ([BusinessEntityID])
    REFERENCES [dbo].[SalesPersons]
        ([BusinessEntityID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [BusinessEntityID] in table 'SalesTerritoryHistories'
ALTER TABLE [dbo].[SalesTerritoryHistories]
ADD CONSTRAINT [FK_SalesTerritoryHistory_SalesPerson_BusinessEntityID]
    FOREIGN KEY ([BusinessEntityID])
    REFERENCES [dbo].[SalesPersons]
        ([BusinessEntityID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [SalesPersonID] in table 'Stores'
ALTER TABLE [dbo].[Stores]
ADD CONSTRAINT [FK_Store_SalesPerson_SalesPersonID]
    FOREIGN KEY ([SalesPersonID])
    REFERENCES [dbo].[SalesPersons]
        ([BusinessEntityID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Store_SalesPerson_SalesPersonID'
CREATE INDEX [IX_FK_Store_SalesPerson_SalesPersonID]
ON [dbo].[Stores]
    ([SalesPersonID]);
GO

-- Creating foreign key on [TerritoryID] in table 'SalesTerritoryHistories'
ALTER TABLE [dbo].[SalesTerritoryHistories]
ADD CONSTRAINT [FK_SalesTerritoryHistory_SalesTerritory_TerritoryID]
    FOREIGN KEY ([TerritoryID])
    REFERENCES [dbo].[SalesTerritories]
        ([TerritoryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesTerritoryHistory_SalesTerritory_TerritoryID'
CREATE INDEX [IX_FK_SalesTerritoryHistory_SalesTerritory_TerritoryID]
ON [dbo].[SalesTerritoryHistories]
    ([TerritoryID]);
GO

-- Creating foreign key on [SpecialOfferID] in table 'SpecialOfferProducts'
ALTER TABLE [dbo].[SpecialOfferProducts]
ADD CONSTRAINT [FK_SpecialOfferProduct_SpecialOffer_SpecialOfferID]
    FOREIGN KEY ([SpecialOfferID])
    REFERENCES [dbo].[SpecialOffers]
        ([SpecialOfferID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------