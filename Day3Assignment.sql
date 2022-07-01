USE Northwind
GO
--1 List all cities that have both Employees and Customers.
select distinct city
from dbo.Customers 
where city in (select city from dbo.Employees)

--2 List all cities that have Customers but no Employee.

--a.      Use sub-query
select distinct city 
from dbo.Customers 
where city not in (select city from dbo.Employees);
--b.      Do not use sub-query
select distinct t1.city 
from dbo.Customers t1,  dbo.Employees t2 where t1.City != t2.city

--3 List all products and their total order quantities throughout all orders.
select t1.productname , sum(t2.quantity) AS "total order Quantities" 
from dbo.Products t1 
inner join dbo.[Order Details] t2
on t2.ProductID = t1.ProductID 
group by t1.productname

--4 List all Customer Cities and total products ordered by that city.
select t4.city , sum(t1.ProductID) "total products" 
from dbo.Products t1 
inner join dbo.[Order Details] t2
on t2.ProductID = t1.ProductID 
inner join dbo.Orders t3
on t3.OrderID = t2.OrderID
inner join dbo.Customers t4
on t4.CustomerID = t3.CustomerID 
group by t4.City

--5 List all Customer Cities that have at least two customers.

-- a.      Use union
select city 
from dbo.Customers 
group by city 
having count(customerid) = 2
union
select city 
from dbo.Customers 
group by city 
having count(customerid) > 2

--b Subquery and no union
select city 
from dbo.Customers 
where city in (select city 
from dbo.Customers 
group by city 
having count(customerid) >= 2)

--6 List all Customer Cities that have ordered at least two different kinds of products.
select t4.city , count(distinct t1.ProductID) AS "total products" 
from dbo.Products t1 inner join dbo.[Order Details] t2
on t2.ProductID = t1.ProductID inner join dbo.Orders t3 
on t3.OrderID = t2.OrderID inner join dbo.Customers t4
on t4.CustomerID = t3.CustomerID 
group by t4.City 
having count(distinct t1.productid) >= 2

--7 List all Customers who have ordered products, but have the ‘ship city’ on the order different from their own customer cities.
select distinct t2.CompanyName, t2.City ,t1.ShipCity   
from dbo.Orders t1 inner join dbo.Customers t2  
on t2.CustomerID = t1.CustomerID
where t2.City != t1.ShipCity

--8 List 5 most popular products, their average price, and the customer city that ordered most quantity of it.
select top 5  t1.productname, avg(t1.UnitPrice) AS "Average price", t4.city  
from dbo.Products t1 inner join dbo.[Order Details] t2
on t2.ProductID = t1.ProductID inner join dbo.Orders t3 
on t3.OrderID = t2.OrderID inner join dbo.Customers t4  
on t4.CustomerID = t3.CustomerID 
group by t1.ProductName, t4.city 
order by sum(t2.quantity) desc

--9 List all cities that have never ordered something but we have employees there.

--a.      Use sub-query
select city 
from customers 
where city  in (select city  
from customers t1 left join orders t2
on t1.customerid = t2.customerid  and t2.employeeid in (select employeeid 
from orders) 
group by t1.city 
having count(orderid) = 0)
--b.      Do not use sub-query

select t1.city , count(orderid) AS NUM_orderid
from customers t1 left join orders t2 
on t1.customerid  = t2.customerid left join employees t3 
on t3.EmployeeID = t2.EmployeeID  
group by t1.city 
having count(orderid) =0

--10 
select distinct  t2.city 
from orders t1 inner join customers t2 
on t1.CustomerID = t2.CustomerID 
where t2.city in 
(select top 1 t6.city  
from dbo.Products t3 inner join dbo.[Order Details] t4
on t4.ProductID = t3.ProductID inner join dbo.Orders t5 
on t5.OrderID = t4.OrderID inner join dbo.Customers t6 
on t6.CustomerID = t5.CustomerID 
group by t6.City order by count(t5.orderid) desc)
and 
t2.city in (select top 1 t4.city  
from dbo.Products t1 inner join dbo.[Order Details] t2
on t2.ProductID = t1.ProductID inner join dbo.Orders t3 
on t3.OrderID = t2.OrderID
inner join dbo.Customers t4
on t4.CustomerID = t3.CustomerID 
group by t4.City 
order by count(t2.ProductID) desc)

--11
-- I would use Distinct to remove.