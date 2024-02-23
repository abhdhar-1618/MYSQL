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





/*
*/



















