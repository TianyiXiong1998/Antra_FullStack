USE AdventureWorks2019
GO

--1 Write a query that retrieves the columns ProductID, 
--Name, Color and ListPrice from the Production.Product table, with no filter. 

SELECT ProductID,Name,Color,ListPrice
FROM Production.Product

--2 Write a query that retrieves the columns ProductID, Name, 
--Color and ListPrice from the Production.Product table, excludes the rows that ListPrice is 0.
SELECT ProductID,Name,Color,ListPrice
FROM Production.Product
WHERE ListPrice != 0

--3 Write a query that retrieves the columns ProductID, 
--Name, Color and ListPrice from the Production.Product table, the rows that are NULL for the Color column.
SELECT ProductID,Name,Color,ListPrice
FROM Production.Product
WHERE Color is NULL

--4 Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, 
--the rows that are not NULL for the Color column.
SELECT ProductID,Name,Color,ListPrice
FROM Production.Product
WHERE Color is NOT NULL

--5 Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, 
--the rows that are not NULL for the column Color, and the column ListPrice has a value greater than zero.
SELECT ProductID,Name,Color,ListPrice
FROM Production.Product
WHERE Color is NOT NULL AND ListPrice > 0

--6 Write a query that concatenates the columns Name and Color from the Production.
--Product table by excluding the rows that are null for color.
SELECT Name + ' ' + Color as 'Name and Color'
FROM Production.Product
WHERE Color is not NULL

--7 Write a query that generates the following result set  from Production.Product:
SELECT 'NAME: ' + NAME + ' -- ' + 'COLOR: ' + Color AS 'output'
FROM Production.Product
WHERE NAME like '%Crankarm' or Name like 'Chainring%'

--8 Write a query to retrieve the to the columns ProductID and Name from the Production.
--Product table filtered by ProductID from 400 to 500
SELECT ProductID,Name
FROM Production.Product
WHERE ProductID BETWEEN 400 and 500

--9 Write a query to retrieve the to the columns  ProductID, Name and color from the Production.
--Product table restricted to the colors black and blue
SELECT ProductID,Name,Color
FROM Production.Product
WHERE Color in ('black','blue')

--10 Write a query to get a result set on products that begins with the letter S.
Select Name
FROM Production.Product
Where Name LIKE 'S%'

--11 Write a query that retrieves the columns Name and ListPrice from the Production.Product table. 
--Your result set should look something like the following. Order the result set by the Name column. 
SELECT Name,ListPrice
FROM Production.Product
WHERE Name like 'Seat%' or Name ='Short-Sleeve Classic Jersey, L' OR Name = 'Short-Sleeve Classic Jersey, M'
ORDER BY Name

--12 Write a query that retrieves the columns Name and ListPrice from the Production.Product table. 
--Your result set should look something like the following. 
--Order the result set by the Name column. The products name should start with either 'A' or 'S'
SELECT Name,ListPrice
FROM Production.Product
WHERE Name LIKE 'A%' or Name LIKE 'S%'
ORDER BY Name

--13 Write a query so you retrieve rows that have a Name that begins with the letters SPO,
--but is then not followed by the letter K. After this zero or more letters can exists. Order the result set by the Name column.
SELECT Name
FROM Production.Product
WHERE Name like 'SPO[^k]%'
ORDER BY Name

--14 Write a query that retrieves unique colors from the table Production.Product.
-- Order the results  in descending  manner
SELECT DISTINCT Color
FROM Production.Product
WHERE Color is NOT NULL -- I am not sure this should be included or not...
ORDER BY Color DESC

--15 Write a query that retrieves the unique combination of columns ProductSubcategoryID and Color from the Production.
--Product table. Format and sort so the result set accordingly to the following.
-- We do not want any rows that are NULL.in any of the two columns in the result.
SELECT DISTINCT ProductSubcategoryID,Color
FROM Production.Product
GROUP BY ProductSubcategoryID,Color
HAVING ProductSubcategoryID IS NOT NULL and Color IS NOT NULL
