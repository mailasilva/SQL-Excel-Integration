--Class 27: SQL And EXCEL 

--VIEW INTERNET_SALES for year 2013: 52.801 ROWS

USE AdventureWorksDW2014

SELECT * FROM FactInternetSales WHERE YEAR(OrderDate) = 2013

GO
ALTER VIEW INTERNET_SALES AS 
SELECT 
    SalesOrderNumber AS 'ORDER_NUMBER',
    OrderDate AS 'ORDER DATE',
    EnglishProductCategoryName 'CATEGORY',
    FIRSTNAME + ' ' + LASTNAME AS 'CUSTOMER_NAME',
    GENDER AS 'GENDER',
    SALESTERRITORYCOUNTRY AS 'COUNTRY',
    OrderQuantity AS 'ORDER_QTY',
    TotalProductCost AS 'PRODUCT_COST',
    SALESAMOUNT AS 'SALES_AMOUNT'
FROM 
    FactInternetSales
        INNER JOIN DimCustomer
            ON FactInternetSales.CustomerKey = DimCustomer.CustomerKey
                INNER JOIN DimSalesTerritory
                    ON FACTINTERNETSALES.SalesTerritoryKey = DimSalesTerritory.SalesTerritoryKey
INNER JOIN DimProduct
    ON FactInternetSales.ProductKey = DimProduct.ProductKey
        INNER JOIN DimProductSubcategory 
            ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey 
                INNER JOIN DimProductCategory 
                    ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey
WHERE YEAR(OrderDate) = 2013 
GO