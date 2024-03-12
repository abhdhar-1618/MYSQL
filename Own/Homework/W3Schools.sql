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

































































































































































































































































/*
*/



















