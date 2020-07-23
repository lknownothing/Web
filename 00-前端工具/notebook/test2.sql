
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = N'testData'
)
CREATE DATABASE testData

-- 创建数据库需要进入相应的数据库
USE testData

-- Create a new table called 'products' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.products', 'U') IS NOT NULL
DROP TABLE dbo.products

-- Create the table in the specified schema
CREATE TABLE dbo.products
(
    productsId INT NOT NULL PRIMARY KEY, -- primary key column
     ProductName varchar(25) NOT NULL,  
     Price money NULL,  
    -- specify more columns here
);

-- 增加一行内容
INSERT dbo.products
(productsId,ProductName,Price)
VALUES
(50,'汉堡包',3.98),
(30,'肌肉卷',6.98),
(100,'女朋友',99.98)


-- 更新满足条件的数据
UPDATE dbo.products
SET ProductName='Flat head'
    WHERE productsId=50

-- 选取所有的列
SELECT * FROM products


-- 从表中读取产品名字数据
SELECT ProductName FROM dbo.products

SELECT productsId,price FROM dbo.products 
WHERE productsId<70
GO

-- 创建试图和存储过程
-- 使用create view创建一个试图，该视图仅仅选择products表中的两列。

-- Create a new view called 'vm_Names' in schema 'dbo'
-- Drop the view if it already exists
IF EXISTS (
SELECT *
    FROM sys.views
    JOIN sys.schemas
    ON sys.views.schema_id = sys.schemas.schema_id
    WHERE sys.schemas.name = N'dbo'
    AND sys.views.name = N'vm_Names'
)
DROP VIEW dbo.vm_Names
GO

-- Create the view in the specified schema
CREATE VIEW dbo.vm_Names
AS
    -- body of the view
    SELECT [ProductName],
        [Price]
    FROM dbo.products
GO

--访问视图
select * from vm_Names
GO



