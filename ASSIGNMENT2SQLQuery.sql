Use AdventureWorks2019
GO

--1. How many products can you find in the Production.Product table?
SELECT COUNT(*) as num_prod
FROM Production.Product

--2. Write a query that retrieves the number of products in the Production.
--Product table that are included in a subcategory. 
--The rows that have NULL in column ProductSubcategoryID are considered to not be a part of any subcategory.

SELECT COUNT(ProductSubcategoryID) AS num_sub_cate
FROM Production.Product
WHERE ProductSubcategoryID IS NOT NULL

--3 How many Products reside in each SubCategory? 
--Write a query to display the results with the following titles.
SELECT ProductSubcategoryID,COUNT(1) as CountedProducts
FROM Production.Product
GROUP BY ProductSubcategoryID

--4  How many products that do not have a product subcategory.
SELECT COUNT(1) as no_subcat
FROM Production.Product
WHERE ProductSubcategoryID is NULL

--5 Write a query to list the sum of products quantity in the Production.ProductInventory table.
SELECT SUM(Quantity) as total_quantity
FROM Production.ProductInventory

--6 Write a query to list the sum of products in the Production.ProductInventory table 
--and LocationID set to 40 and limit the result to include just summarized quantities less than 100.
SELECT ProductID, SUM(Quantity) as [The sum]
FROM Production.ProductInventory
WHERE LocationID = 40
GROUP BY ProductID
HAVING SUM(Quantity) < 100

--7 Write a query to list the sum of products with the shelf information 
--in the Production.ProductInventory table and LocationID set to 40 
--and limit the result to include just summarized quantities less than 100
SELECT Shelf,ProductID, COUNT(*) AS [The SUM]
FROM Production.ProductInventory
WHERE LocationID = 40
GROUP BY Shelf,ProductID
HAVING SUM(Quantity) < 100

--8. Write the query to list the average quantity for products 
--where column LocationID has the value of 10 from the table Production.ProductInventory table.
SELECT AVG(Quantity) as avg_quantity
FROM Production.ProductInventory
WHERE LocationID = 10

--9 Write query  to see the average quantity  of  products by shelf  from the table Production.ProductInventory
SELECT ProductID, Shelf, AVG(Quantity) as [THE AVG]
FROM Production.ProductInventory
GROUP by ProductID,Shelf

--10 Write query  to see the average quantity  of  products by shelf excluding rows that has the value of N/A in the column Shelf from the table Production.ProductInventory
SELECT ProductID, Shelf, AVG(Quantity) as [THE AVG]
FROM Production.ProductInventory
WHERE Shelf != 'N/A'
GROUP by ProductID,Shelf

--11 List the members (rows) and average list price in the Production.Product table. This should be grouped independently over the Color and the Class column. Exclude the rows where Color or Class are null.
SELECT Color,Class, COUNT(*) as TheCount, AVG(ListPrice) as AVGPRICE
FROM Production.Product
WHERE Class IS NOT NULL and Color is not null
GROUP BY Color,Class
--12 Write a query that lists the country and province names from person. CountryRegion and person. StateProvince tables. Join them and produce a result set similar to the following.

SELECT t2.Name as Country,t1.Name as Province
FROM Person.StateProvince t1 INNER JOIN Person.CountryRegion t2
ON t1.CountryRegionCode = t2.CountryRegionCode

--13 filter by German and Canada

SELECT t2.Name as Country,t1.Name as Province
FROM Person.StateProvince t1 INNER JOIN Person.CountryRegion t2
ON t1.CountryRegionCode = t2.CountryRegionCode
Where t2.Name IN ('Germany','Canada') -- OR NOT IN ('Germany','Canada') I am not sure about the filter means including or excluding.

USE Northwind
GO
--14  List all Products that has been sold at least once in last 25 years.
SELECT DISTINCT t3.ProductName
FROM Orders t1 INNER join [Order Details] t2
ON t1.OrderID = t2.OrderID
INNER JOIN Products t3
ON t2.ProductID = t3.ProductID
WHERE 2022-YEAR(t1.OrderDate)<=25

--15. List top 5 locations (Zip Code) where the products sold most
SELECT TOP 5 ShipPostalCode AS TOP5
From Orders
GROUP BY ShipPostalCode
Order by COUNT(ShipPostalCode) DESC


--16 List top 5 locations (Zip Code) where the products sold most in last 25 years.
SELECT TOP 5 ShipPostalCode AS TOP5
From Orders
WHERE 2022-YEAR(OrderDate)<=25
GROUP BY ShipPostalCode
Order by COUNT(ShipPostalCode) DESC

--17 List all city names and number of customers in that city. 
SELECT City,COUNT(ContactName) AS NUM_CUST
FROM Customers
GROUP BY City

--18 List city names which have more than 2 customers, and number of customers in that city
SELECT City,COUNT(ContactName) as 'NUM_CUST_FOR_CITY'
FROM Customers
GROUP by City
having COUNT(ContactName) > 10

--19 List the names of customers who placed orders after 1/1/98 with order date.
SELECT DISTINCT t2.ContactName
FROM Orders t1 INNER join Customers t2
ON t1.CustomerID = t2.CustomerID
WHERE OrderDate BETWEEN '1998-01-01' and '2022-06-30'

--20 List the names of all customers with most recent order dates
SELECT CustomerID,OrderDate
FROM (SELECT DISTINCT CustomerID,OrderDate,RANK() over(PARTITION BY CustomerID order by OrderDate DESC) drk FROM Orders) dt
WHERE dt.drk = 1

--21 Display the names of all customers  along with the  count of products they bought
SELECT t2.ContactName,COUNT(t2.ContactName)
FROM Orders t1 inner join Customers t2
ON t1.CustomerID = t2.CustomerID
GROUP BY t2.ContactName
ORDER BY COUNT(t2.ContactName) DESC

--22 Display the customer ids who bought more than 100 Products with count of products.
SELECT t2.ContactName,SUM(t3.Quantity)
FROM Orders t1 INNER JOIN Customers t2
ON t1.CustomerID = t2.CustomerID
INNER JOIN [Order Details] t3
ON t3.OrderID = t1.OrderID
GROUP BY t2.ContactName
having SUM(t3.Quantity) > 100
ORDER BY sum(t3.Quantity) DESC

--23 List all of the possible ways that suppliers can ship their products. Display the results as below

SELECT t2.CompanyName,t1.CompanyName
FROM Shippers t1 CROSS JOIN Suppliers t2

--24.  Display the products order each day. Show Order date and Product Name.
SELECT DISTINCT t3.OrderDate,t1.ProductName
FROM Products t1 
inner join [Order Details] t2
ON t1.ProductID = t2.ProductID
INNER JOIN Orders t3
ON t3.OrderID = t2.OrderID
--25.  Displays pairs of employees who have the same job title.
SELECT *
FROM Employees t1
INNER JOIN Employees t2
ON t1.title= t2.title
--26.  Display all the Managers who have more than 2 employees reporting to them.
SELECT t1.EmployeeID,t1.LastName,t1.FirstName
FROM Employees t1 inner join Employees t2
on t1.EmployeeID = t2.ReportsTo
WHERE t1.title LIKE '%manager%'
GROUP BY t1.EmployeeID,t1.LastName,t1.FirstName
having COUNT(t2.ReportsTo) >2
--27.  Display the customers and suppliers by city. The results should have the following columns
SELECT city,ContactName,'Customer' as [type]
FROM Customers
UNION
SELECT city,ContactName,'Supplier' as [type]
FROM Suppliers