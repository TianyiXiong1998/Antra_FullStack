USE Northwind
GO
--1.      Create a view named “view_product_order_[your_last_name]”, list all products and total ordered quantity for that product.
CREATE VIEW view_product_order_Tianyi as 
SELECT t1.ProductID, t1.ProductName, SUM(t2.Quantity) AS totalQty --I add a ID column for next question.
FROM dbo.Products t1 INNER JOIN dbo.[Order Details] t2
ON t1.ProductID = t2.ProductID
GROUP BY t1.ProductID,t1.ProductName
GO

SELECT * FROM view_product_order_Tianyi
GO
--2.      Create a stored procedure “sp_product_order_quantity_[your_last_name]” that accept product id as an input and total quantities of order as output parameter.
CREATE PROC sp_product_order_quantity_Tianyi
@id INT,
@total_qty INT OUT
AS
BEGIN
SELECT 
@total_qty = view_product_order_Tianyi.totalQty
FROM view_product_order_Tianyi
WHERE view_product_order_Tianyi.ProductID = @id
END
GO


DECLARE
@total INT
EXEC sp_product_order_quantity_Tianyi 1, @total out
print(@total)
GO

--3.      Create a stored procedure “sp_product_order_city_[your_last_name]” that accept product name as an input and top 5 cities that ordered most that product combined with the total quantity of that product ordered from that city as output.
CREATE PROC sp_product_order_city_Tianyi 
@product_name VARCHAR(20), 
@order_city VARCHAR(20) OUT,
@order_qty INT OUT
AS
BEGIN
SELECT TOP 5 @order_city = t4.City,
@order_qty = SUM(t2.Quantity)
FROM Products t1 INNER JOIN [Order Details] t2
ON t1.ProductID = t2.ProductID
INNER JOIN Orders t3
ON t2.OrderID = t3.OrderID
INNER JOIN Customers t4
ON t3.CustomerID = t4.CustomerID
WHERE t1.ProductName = @product_name
GROUP BY t4.City
ORDER BY SUM(t2.Quantity) DESC
END
GO
DECLARE
@City VARCHAR(20),
@total_quantity INT
EXEC sp_product_order_city_Tianyi 'Chang', @City out, @total_quantity out
print(@City)
PRINT(@total_quantity)
GO
--Verification part for Q3
SELECT TOP 5 t4.City,SUM(t2.Quantity)
FROM Products t1 INNER JOIN [Order Details] t2
ON t1.ProductID = t2.ProductID
INNER JOIN Orders t3
ON t2.OrderID = t3.OrderID
INNER JOIN Customers t4
ON t3.CustomerID = t4.CustomerID
WHERE t1.ProductName = 'Chang'
GROUP BY t4.City
ORDER BY SUM(t2.Quantity) DESC

DROP PROC sp_product_order_city_Tianyi


--4.      Create 2 new tables “people_your_last_name” “city_your_last_name”. City table has two records: {Id:1, City: Seattle}, {Id:2, City: Green Bay}. People has three records: {id:1, Name: Aaron Rodgers, City: 2}, {id:2, Name: Russell Wilson, City:1}, {Id: 3, Name: Jody Nelson, City:2}. Remove city of Seattle.
-- If there was anyone from Seattle, put them into a new city “Madison”. Create a view “Packers_your_name” lists all people from Green Bay. If any error occurred, no changes should be made to DB. (after test) Drop both tables and view.
CREATE TABLE people_tianyi(id int,name CHAR(30),cityId int)
CREATE TABLE city_tianyi(cityId int,city char(15))
INSERT INTO people_tianyi VALUES(1,'Aaron Rodgers',2)
INSERT INTO people_tianyi VALUES(2,'Russell Wilson',1)
INSERT INTO people_tianyi VALUES(3,'Jody Nelson',2)
INSERT INTO city_tianyi VALUES(1,'Settle')
INSERT INTO city_tianyi VALUES(2,'Green Bay')
GO
UPDATE city_tianyi
SET city = 
CASE city
    WHEN 'Settle'
    THEN 'Madison'
    ElSE city
    END

Go

CREATE VIEW Packers_tianyi
AS
SELECT t1.id,t1.name
FROM people_tianyi t1 INNER JOIN city_tianyi t2
ON t1.cityId = t2.cityId
WHERE t2.city = 'Green Bay'
GO

DROP TABLE people_tianyi
DROP TABLE city_tianyi
DROP VIEW Packers_tianyi

GO
--5.       Create a stored procedure “sp_birthday_employees_[you_last_name]” that creates a new table “birthday_employees_your_last_name” and fill it with all employees that have a birthday on Feb. (Make a screen shot) drop the table. Employee table should not be affected.
CREATE PROC sp_birthday_employees_tianyi
AS
BEGIN
    SELECT EmployeeID,LastName,FirstName,Title,TitleOfCourtesy,BirthDate,HireDate,Address,City,Region,PostalCode,Country,HomePhone,Extension,Photo,Notes,ReportsTo,PhotoPath
    INTO birthday_employees_tianyi
    FROM Employees
    WHERE MONTH(BirthDate) = 2
END 
GO
EXEC sp_birthday_employees_tianyi
GO
ALTER TABLE Employees WITH CHECK CHECK CONSTRAINT ALL
    
DROP TABLE Employees

SELECT *
FROM
dbo.birthday_employees_tianyi
--6.      How do you make sure two tables have the same data?
-- method1:
-- USE UNION to check out. Firstly record the rows of each table, and then add them.
-- Then do a Union to check the result, if the result of union operation is different
-- with the result of the sum rows of 2 tables, it means there are same data.
-- method2:
-- USE intersection, if there is any record in the intersection of select statement,
-- it means there is a same data.