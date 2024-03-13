SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'classicmodels' AND table_type = 'BASE TABLE';

SET sql_mode = 'STRICT_TRANS_TABLES';


UPDATE Customers
SET PostalCode = NULL
WHERE PostalCode = '';

SELECT * FROM Customers
WHERE CustomerID = 37;

SELECT * FROM Customers
WHERE PostalCode IS NULL;

UPDATE Suppliers
SET Phone = ''
WHERE SupplierID IN (1, 4, 11, 19, 27);

SELECT * FROM suppliers
WHERE SupplierID = 11;

SELECT * FROM suppliers
WHERE SupplierID IN (1, 4, 11, 19, 27);

UPDATE suppliers
SET Phone = NULL
WHERE Phone = '';

SELECT * FROM suppliers
WHERE Phone IS NULL;

-- W3 Schools SQL Lessons start point


-- Return data from the Customers table:

SELECT CustomerName, City FROM Customers;

/*
SYNTAX:

SELECT column1, column2, ...
FROM table_name;

Here, column1, column2, ... are the field names of the table you want to select data from.
The table_name represents the name of the table you want to select data from.
*/

-- Select ALL columns

SELECT * FROM Customers;

-- The SQL SELECT DISTINCT Statement
-- The SELECT DISTINCT statement is used to return only distinct (different) values.
-- Q. Select all the different countries from the "Customers" table:

SELECT DISTINCT Country FROM Customers;

/*
Syntax:

SELECT DISTINCT column1, column2, ...
FROM table_name;

*/

-- Count Distinct
-- By using the DISTINCT keyword in a function called COUNT, we can return the number of different countries.

SELECT COUNT(DISTINCT Country) FROM Customers;


-- The SQL WHERE Clause

/*
The WHERE clause is used to filter records.
It is used to extract only those records that fulfill a specified condition.
*/

-- Example: Select all customers from Mexico:

SELECT * FROM Customers
WHERE Country='Mexico';

-- Example: Select all customers from Berlin and Germany:
SELECT * FROM Customers WHERE City = 'Berlin';
SELECT * FROM Customers WHERE Country LIKE '%Germany%';

/*
SYNTAX:

SELECT column1, column2, ...
FROM table_name
WHERE condition;
*/

-- Retrieve all customers from Germany:
SELECT * FROM Customers 
WHERE Country = 'Germany';

-- Retrieve all products with a price greater than 20: [ > greater than sign ]
SELECT * FROM Products 
WHERE Price > 20;

-- Retrieve all orders made after July 1, 1996:

SELECT * FROM Orders 
WHERE OrderDate > '1996-07-01';

-- Retrieve all orders with OrderID between 10250 and 10260:

SELECT * FROM Orders 
WHERE OrderID BETWEEN 10250 AND 10260;

-- Retrieve all employees born before January 1, 1960:

SELECT * FROM Employees 
WHERE BirthDate < '1960-01-01';

-- Retrieve all customers whose names start with 'A':

SELECT * FROM Customers 
WHERE CustomerName LIKE 'A%';

-- Retrieve all orders shipped by Speedy Express:

SELECT * FROM Orders 
WHERE ShipperID = 1;

SELECT *
FROM Shippers
LEFT JOIN Orders ON Orders.ShipperID = Shippers.ShipperID
WHERE Orders.ShipperID = 1;


SELECT *
FROM Shippers
RIGHT JOIN Orders ON Orders.ShipperID = Shippers.ShipperID
WHERE Orders.ShipperID = 1;

-- Retrieve all products with a price less than or equal to 15:

SELECT * FROM Products 
WHERE Price <= 15;


-- Retrieve all orders with OrderDate equal to July 4, 1996:

SELECT * FROM Orders; 
-- WHERE OrderDate = '1996-07-04';

UPDATE Orders
SET OrderDate = DATE_FORMAT(STR_TO_DATE(OrderDate, '%m/%d/%Y'), '%d/%m/%Y');

SELECT * FROM Orders;


SELECT * FROM Orders 
WHERE OrderDate = '04/07/1996';


SELECT * FROM employees;

UPDATE employees
SET BirthDate = DATE_FORMAT(STR_TO_DATE(BirthDate, '%m/%d/%Y'), '%d/%m/%Y');

-- Retrieve all customers located in the USA or Canada:

SELECT * FROM Customers WHERE Country IN ('USA', 'Canada');

-- Retrieve all employees except those with the LastName 'Davolio':

SELECT * FROM Employees WHERE LastName <> 'Davolio';

-- Retrieve all orders with ShipperID not equal to 2:

SELECT * FROM Orders WHERE ShipperID != 2;

/*
SYNTAX OF [ ORDER BY ] 

SELECT column1, column2, ...
FROM table_name
ORDER BY column1 [ASC|DESC], column2 [ASC|DESC], ...;
*/

-- Retrieve all customers ordered alphabetically by their names:

SELECT * FROM Customers ORDER BY CustomerName; 

-- Sort the products by ProductName in reverse order:

SELECT * FROM Products
ORDER BY ProductName DESC;

-- ORDER BY Several Columns

SELECT * FROM Customers
ORDER BY Country, CustomerName;

SELECT * FROM Customers
WHERE Country LIKE '%Mexico%';


SELECT * FROM Customers;

SELECT * FROM Customers
WHERE Country='Mexico';

-- Select only the customers that are NOT from Spain:

SELECT * FROM Customers
WHERE NOT Country = 'Spain';

-- Select customers that does not start with the letter 'A':

SELECT * FROM Customers
WHERE CustomerName NOT LIKE 'A%';

-- Select customers with a customerID not between 10 and 60:

SELECT * FROM Customers
WHERE CustomerID NOT BETWEEN 10 AND 60;

-- Select customers that are not from Paris or London:

SELECT * FROM Customers
WHERE City NOT IN ('Paris', 'London');

-- Select customers with a CustomerId not greater than 50:

SELECT * FROM Customers
WHERE CustomerID <= 50;

-- Select customers with a CustomerID not less than 50:

SELECT * FROM Customers
WHERE NOT CustomerId < 50;

-- INSERT INTO Example

INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');

-- To insert multiple rows of data, we use the same INSERT INTO statement, but with multiple values:


INSERT INTO Customers (CustomerID,CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES
('92','Greasy Burger', 'Per Olsen', 'Gateveien 15', 'Sandnes', '4306', 'Norway'),
('93','Tasty Tee', 'Finn Egan', 'Streetroad 19B', 'Liverpool', 'L1 0AA', 'UK');

-- Find all null addresses in Customers table:-

SELECT CustomerName, ContactName, Address
FROM Customers
WHERE Address IS NULL;

SELECT * FROM Customers;

SELECT * FROM Customers
WHERE CustomerName IN ('Cardinal','Greasy Burger','Tasty Tee');

UPDATE Customers
SET CustomerID = 92
WHERE CustomerName = 'Cardinal';

UPDATE Customers
SET CustomerID = 93
WHERE CustomerName = 'Greasy Burger';

UPDATE Customers
SET CustomerID = 94
WHERE CustomerName = 'Tasty Tee';


-- Select only the first 3 records of the Customers table:

SELECT * FROM Customers
LIMIT 3;

-- Select the first 3 records of the Customers table:

SELECT * FROM Customers
ORDER BY CustomerName ASC
LIMIT 3;

-- Find the lowest price in the Price column:

SELECT MIN(Price)
FROM Products;

-- Find the highest price in the Price column:

SELECT MAX(Price)
FROM Products;

-- Setting column name while fetching minimum price

SELECT MIN(Price) AS Smallest_Price  
FROM Products;

-- Here we use the `MIN()` function and the `GROUP BY` clause, to return the smallest price for each category in the Products table:

SELECT MIN(Price) AS SmallestPrice, CategoryID
FROM Products
GROUP BY CategoryID;

-- Find the total number of rows in the `Products` table:

SELECT COUNT(*)
FROM Products;

-- Find the number of products where the `ProductName` is not null:

SELECT * FROM products;

SELECT COUNT(ProductName)
FROM Products;

-- Find the number of products where `Price` is higher than 20:

SELECT COUNT(ProductID)
FROM Products
WHERE Price > 20;

-- How many different prices are there in the Products table:

SELECT COUNT(DISTINCT Price)
FROM Products;

-- Name the column "Number of records":

SELECT COUNT(*) AS 'Number of records' 
FROM Products;

/* Here we use the COUNT() function and the GROUP BY clause, 
to return the number of records for each category in the Products table: */

SELECT COUNT(*) 'AS Number of records', CategoryID
FROM Products
GROUP BY CategoryID;

-- Return the sum of all Quantity fields in the OrderDetails table:

SELECT SUM(Quantity)
FROM OrderDetails;

-- Return the sum of the `Quantity` field for the product with `ProductID` 11:

SELECT SUM(Quantity)
FROM OrderDetails
WHERE ProductId = 11;

-- give the Name "total" to the new summarized column :

SELECT SUM(Quantity) AS total
FROM OrderDetails;

/* Here we use the SUM() function and the GROUP BY clause, 
 to return the Quantity for each OrderID in the OrderDetails table: */

SELECT OrderID, SUM(Quantity) AS 'Total Quantity'
FROM OrderDetails
GROUP BY OrderID;

-- Use an expression inside the `SUM()` function:

SELECT SUM(Quantity * 10)
FROM OrderDetails;

-- Join `OrderDetails` with `Products`, and use `SUM()` to find the total amount:
SELECT SUM(Price * Quantity)
FROM OrderDetails
LEFT JOIN Products ON OrderDetails.ProductID = Products.ProductID;

-- Find the average price of all products:

SELECT AVG(Price)
FROM Products;

-- Return the average price of products in category 1:

SELECT AVG(Price)
FROM Products
WHERE CategoryID = 1;

-- Name the column "average price":

SELECT AVG(Price) AS 'average price'
FROM Products;

-- Return all products with a higher price than the average price:

SELECT * FROM Products
WHERE price > (SELECT AVG(price) FROM Products);

-- Here we use the AVG() function and the GROUP BY clause, to return the average price for each category in the Products table:

SELECT AVG(Price) AS AveragePrice, CategoryID
FROM Products
GROUP BY CategoryID;


-- Select all customers that starts with the letter "a":

SELECT * FROM Customers
WHERE CustomerName LIKE 'a%';


/* Return all customers from a city that starts with 'L' 
followed by one wildcard character, then 'nd' and then two wildcard characters:
*/

SELECT * FROM Customers
WHERE city LIKE 'L_nd__';

-- Return all customers from a city that contains the letter 'L':

SELECT * FROM Customers
WHERE city LIKE '%L%';

-- Return all customers who's name starts with 'La':

SELECT * FROM Customers
WHERE CustomerName LIKE 'La%';

-- Return all customers that starts with 'a' or starts with 'b':

SELECT * FROM Customers
WHERE CustomerName LIKE 'a%' OR CustomerName LIKE 'b%';

-- Return all customers that ends with 'a':

SELECT * FROM Customers
WHERE CustomerName LIKE '%a';

-- Return all customers that starts with "b" and ends with "s":

SELECT * FROM Customers
WHERE CustomerName LIKE 'b%s';


-- Return all customers that contains the phrase 'or'

SELECT * FROM Customers
WHERE CustomerName LIKE '%or%';

-- Return all customers that starts with "a" and are at least 3 characters in length:

SELECT * FROM Customers
WHERE CustomerName LIKE 'a__%';

-- Return all customers that have "r" in the second position:

SELECT * FROM Customers
WHERE CustomerName LIKE '_r%';

-- Return all customers from Spain:

SELECT * FROM Customers
WHERE Country LIKE 'Spain';

-- Return all customers that starts with the letter 'a':

SELECT * FROM Customers
WHERE CustomerName LIKE 'a%';

-- Return all customers that ends with the pattern 'es':

SELECT * FROM Customers
WHERE CustomerName LIKE '%es';


-- Return all customers that contains the pattern 'mer':

SELECT * FROM Customers
WHERE CustomerName LIKE '%mer%';


-- Return all customers with a `City` starting with any character, followed by "ondon":

SELECT * FROM Customers
WHERE City LIKE '_ondon';

-- Return all customers with a `City` starting with "L", followed by any 3 characters, ending with "on":

SELECT * FROM Customers
WHERE City LIKE 'L___on';

-- Return all customers that starts with "a" and are at least 3 characters in length:

SELECT * FROM Customers
WHERE CustomerName LIKE 'a__%';

-- Return all customers that have "r" in the second position:

SELECT * FROM Customers
WHERE CustomerName LIKE '_r%';

-- Return all customers from Spain:

SELECT * FROM Customers
WHERE Country LIKE 'Spain';

-- Return all customers from 'Germany', 'France', or 'UK'

SELECT * FROM Customers
WHERE Country IN ('Germany', 'France', 'UK');

-- Return all customers that are NOT from 'Germany', 'France', or 'UK':

SELECT * FROM Customers
WHERE Country NOT IN ('Germany', 'France', 'UK');

-- Return all customers that have an order in the Orders table:

SELECT * FROM Customers
WHERE CustomerID IN (SELECT CustomerID FROM Orders);

-- Return all customers that have NOT placed any orders in the Orders table:

SELECT * FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders);

-- Selects all products with a price between 10 and 20:

SELECT * FROM Products
WHERE Price BETWEEN 10 AND 20;

-- To display the products outside the range of the previous example, use NOT BETWEEN:

SELECT * FROM Products
WHERE Price NOT BETWEEN 10 AND 20;

-- Find products where they are priced between 10 and 20 and their category is either 1,2 or 3

SELECT * FROM Products
WHERE Price BETWEEN 10 AND 20
AND CategoryID IN (1,2,3);

-- select all products with a ProductName alphabetically between Carnarvon Tigers and Mozzarella di Giovanni:

SELECT * FROM Products
WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY ProductName;

-- select all products with a ProductName between Carnarvon Tigers and Chef Anton's Cajun Seasoning:

SELECT * FROM Products
WHERE ProductName BETWEEN "Carnarvon Tigers" AND "Chef Anton's Cajun Seasoning"
ORDER BY ProductName;

-- select all products with a ProductName not between Carnarvon Tigers and Mozzarella di Giovanni:

SELECT * FROM Products
WHERE ProductName NOT BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY ProductName;

-- show all orders with an OrderDate between '01-July-1996' and '31-July-1996':

SELECT * FROM Orders
WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';

-- Usage of Aliases

SELECT CustomerID Cust_ID
FROM Customers;

-- The following SQL statement creates an alias named "Address" that combine four columns (Address, PostalCode, City and Country):

SELECT CustomerName, CONCAT(Address,', ',PostalCode,', ',City,', ',Country) AS Address
FROM Customers;

/*
The following SQL statement selects all the orders from the customer 
with CustomerID=4 (Around the Horn). We use the "Customers" and "Orders" tables, 
and give them the table aliases of "c" and "o" respectively 
(Here we use aliases to make the SQL shorter):
*/

SELECT o.OrderID, o.OrderDate, c.CustomerName
FROM Customers AS c, Orders AS o
WHERE c.CustomerName='Around the Horn' AND c.CustomerID=o.CustomerID;



-- INNER JOIN

SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

-- Join Products and Categories with the INNER JOIN keyword:

SELECT ProductID, ProductName, CategoryName
FROM Products
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID;

-- Specify the table names while joining:

SELECT Products.ProductID, Products.ProductName, Categories.CategoryName
FROM Products
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID;

-- JOIN is the same as INNER JOIN:

SELECT Products.ProductID, Products.ProductName, Categories.CategoryName
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID;


-- Inner joining with more than two tables

SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName
FROM ((Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)
INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID);


-- LEFT JOIN EXAMPLE

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;


-- RIGHT JOIN EXAMPLE

SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID;

-- The following SQL statement selects all customers, and all orders:


/* CAN'T USE FULL JOIN IN MYSQL
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName;
*/

-- The following SQL statement matches customers that are from the same city:

SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City
ORDER BY A.City;

-- The following SQL statement returns the cities (only distinct values) from both the "Customers" and the "Suppliers" table:

SELECT City FROM Customers
UNION
SELECT City FROM Suppliers
ORDER BY City;

/* The following SQL statement returns the cities (duplicate values also) 
from both the "Customers" and the "Suppliers" table: */

SELECT City FROM Customers
UNION ALL
SELECT City FROM Suppliers
ORDER BY City;

/* The following SQL statement returns the German cities (only distinct values) 
from both the "Customers" and the "Suppliers" table: */

SELECT City, Country FROM Customers
WHERE Country='Germany'
UNION
SELECT City, Country FROM Suppliers
WHERE Country='Germany'
ORDER BY City;


/*The following SQL statement returns the German cities (duplicate values also) 
from both the "Customers" and the "Suppliers" table:*/

SELECT City, Country FROM Customers
WHERE Country='Germany'
UNION ALL
SELECT City, Country FROM Suppliers
WHERE Country='Germany'
ORDER BY City;

-- The following SQL statement lists all customers and suppliers:

SELECT 'Customer' AS Type, ContactName, City, Country
FROM Customers
UNION
SELECT 'Supplier', ContactName, City, Country
FROM Suppliers;


-- The following SQL statement lists the number of customers in each country:

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country;

-- The following SQL statement lists the number of customers in each country, sorted high to low:

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
ORDER BY COUNT(CustomerID) DESC;

-- The following SQL statement lists the number of orders sent by each shipper:

SELECT Shippers.ShipperName, COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders
LEFT JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID
GROUP BY ShipperName;

/*The following SQL statement lists the number of customers
in each country. Only include countries with more than 5 customers:*/

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5;

/* The following SQL statement lists the number of customers
 in each country, sorted high to low 
 (Only include countries with more than 5 customers):*/

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5
ORDER BY COUNT(CustomerID) DESC;


-- The following SQL statement lists the employees that have registered more than 10 orders:

SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM (Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID)
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 10;

-- The following SQL statement lists if the employees "Davolio" or "Fuller" have registered more than 25 orders:

SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE LastName = 'Davolio' OR LastName = 'Fuller'
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 25;

-- The following SQL statement returns TRUE and lists the suppliers with a product price less than 20:

SELECT SupplierName
FROM Suppliers
WHERE EXISTS (SELECT ProductName FROM Products WHERE Products.SupplierID = Suppliers.supplierID AND Price < 20);


-- The following SQL statement returns TRUE and lists the suppliers with a product price equal to 22:

SELECT SupplierName
FROM Suppliers
WHERE EXISTS (SELECT ProductName FROM Products WHERE Products.SupplierID = Suppliers.supplierID AND Price = 22);


/*The following SQL statement lists the ProductName 
if it finds ANY records in the OrderDetails table has 
Quantity equal to 10 (this will return TRUE because 
the Quantity column has some values of 10):*/

SELECT ProductName
FROM Products
WHERE ProductID = ANY
  (SELECT ProductID
  FROM OrderDetails
  WHERE Quantity = 10);
  
  /*The following SQL statement lists the ProductName 
  if it finds ANY records in the OrderDetails table has 
  Quantity larger than 99 (this will return TRUE because 
  the Quantity column has some values larger than 99):*/

SELECT ProductName
FROM Products
WHERE ProductID = ANY
  (SELECT ProductID
  FROM OrderDetails
  WHERE Quantity > 99);
  
  
/*The following SQL statement lists the ProductName if it finds ANY records in the OrderDetails table has Quantity larger than 1000 (this will return FALSE because the Quantity column has no values larger than 1000):*/

SELECT ProductName
FROM Products
WHERE ProductID = ANY
  (SELECT ProductID
  FROM OrderDetails
  WHERE Quantity > 1000);

/*The following SQL statement lists the ProductName if ALL the records in the OrderDetails table has Quantity equal to 10. This will of course return FALSE because the Quantity column has many different values (not only the value of 10):*/

SELECT ProductName
FROM Products
WHERE ProductID = ALL
  (SELECT ProductID
  FROM OrderDetails
  WHERE Quantity = 10);
  
  
 /* The following SQL goes through conditions and returns a value when the first condition is met:*/
 
 SELECT OrderID, Quantity,
CASE
    WHEN Quantity > 30 THEN 'The quantity is greater than 30'
    WHEN Quantity = 30 THEN 'The quantity is 30'
    ELSE 'The quantity is under 30'
END AS QuantityText
FROM OrderDetails;



-- The following SQL will order the customers by City. However, if City is NULL, then order by Country:

SELECT CustomerName, City, Country
FROM Customers
ORDER BY
(CASE
    WHEN City IS NULL THEN Country
    ELSE City
END);


































































































































































































































































































/*
*/



















