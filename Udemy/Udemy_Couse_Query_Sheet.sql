-- Show whole data of the table
SELECT * FROM products;

-- Show specific columns from a table
SELECT firstName,email,jobTitle,officeCode
FROM 
employees;

-- Show data for a specific employee

SELECT *
FROM employees
WHERE employeeNumber=1286;

-- show data for employees where office code is 6

SELECT * 
FROM employees
WHERE officeCode=6;

-- show the last name, first name and email id's of employees having job title of "Sales Rep"

SELECT lastName,firstName,email,jobTitle
FROM employees
WHERE jobTitle='Sales Rep'
LIMIT 5;

-- show all the customers IN US,Spain & Germany

SELECT * FROM customers
WHERE country='USA' OR country='France' OR country='Spain' OR country='Germany'
ORDER BY country DESC;

-- Same query as above without multiple usage of OR statements:

SELECT *
FROM customers
WHERE country IN ('USA', 'France', 'Spain', 'Germany')
ORDER BY country DESC;

-- show all the customers who are not in US,Spain,France & Germany

SELECT *
FROM customers
WHERE country NOT IN ('USA', 'France', 'Spain', 'Germany')
ORDER BY country DESC;

-- Show the count of top 7 distinct countries in customers table

SELECT country, COUNT(*) AS total_count
FROM customers
GROUP BY country
ORDER BY total_count DESC
LIMIT 7;

-- show all customers who has a credit limit between 10000 and 90000

SELECT *
FROM customers
WHERE creditLimit BETWEEN 10000 AND 91000
ORDER BY creditLimit DESC;

-- what are the unique office codes in the employees table

SELECT DISTINCT officeCode
FROM employees;

DESCRIBE employees;

/* Renaming a column for dispaly purpose has been desribed in
"Display data with Column Alias" video at 3:00 Minute mark*/

/* Column data concatanation or merging columns have been discussed in
video Display data with Column Alias" video at 4:55 Minute mark*/

/* Data sorting is discussed in video "Display data in Sorting order" full video*/


-- Find all the employee details starting with "A"[Pattern Matching][Wildcards and RegEx:- "%" & "_"]

SELECT * 
FROM employees
WHERE firstName LIKE 'A%';

-- Find all the employee details where employee last name starts with "P"

SELECT *
FROM employees
WHERE lastName LIKE 'P%';

-- Find all the customer names which ended with "co."

SELECT *
FROM customers
WHERE customerName LIKE '%co.'

-- Find all the customer names started with "C" and ended with "co."

SELECT *
FROM customers
WHERE customerName LIKE 'c%co.';

-- Find all the addresses where it contains the number '56'
SELECT *
FROM customers
WHERE addressLine1 LIKE '%56%';

-- Find all the customer names contain two "E's" anywhere in the name

SELECT *
FROM customers
WHERE customerName LIKE '%E%E%';

-- customer name starts with A and have E's anywhere in the customer name

SELECT *
FROM customers
WHERE customerName LIKE 'A%E%E%';

-- Find customer names where the 2nd character of the customer name is "A"
SELECT *
FROM customers
WHERE customerName LIKE '_A%';

-- customer name starts with "C" and 2nd last character is "o" and last charachter can be anything

SELECT *
FROM customers
WHERE customerName LIKE 'C%O_';

-- Fetch all the records where contactFirstName having 2nd character is E and second last character is E

SELECT *
FROM customers
WHERE contactFirstName LIKE '_e%e_';

-- Fetch all the records where contact first name has 5 characters

SELECT *
FROM customers
WHERE contactFirstName LIKE '_____';


-- Fetch all the records where contact first name has at least 8 characters

SELECT *
FROM customers
WHERE contactFirstName LIKE '%________%';

-- Fetch all records where the credit limit of the customer is more than the average credit limit [SUBQUERY]

SELECT * FROM customers 
WHERE creditLimit > (SELECT AVG(creditLimit) FROM customers);

-- Find all the customers who have paid more than the average customer payments

DESCRIBE payments;

SELECT AVG (amount) FROM payments;

SELECT * FROM payments WHERE amount > (SELECT AVG (amount) FROM payments);

-- Fetching NULL values in an SQL Table

SELECT *
FROM customers
WHERE addressLine2 IS NULL;

-- showing null count

SELECT *,
(SELECT COUNT(*) FROM customers WHERE addressLine2 IS NULL) AS null_count
FROM customers
WHERE addressLine2 IS NULL;

/* For arithmatic operations, check the video titled "Arithmetic operations on Column Data" */

-- GROUP BY QUERIES
-- NEW QUERY

SELECT jobTitle, count(*) AS "Number of Employees" 
FROM employees 
GROUP BY jobTitle;

-- NEW QUERY

SELECT officeCode, count(*) AS "Total Employees" 
FROM employees 
GROUP BY officeCode;

-- NEW QUERY

SELECT country , count(*) AS "Country_Count"  
FROM customers 
GROUP BY country;

-- NEW QUERY

SELECT country , ROUND(avg(creditLimit), 2) AS "Credit Limit" 
FROM customers 
GROUP BY country 
HAVING avg(creditLimit)> 80000;

-- NEW QUERY

SELECT * 
FROM customers 
WHERE creditLimit > 50000;

-- NEW QUERY

SELECT country , ROUND(avg(creditLimit), 2) AS "Credit Limit" 
FROM customers 
WHERE creditLimit > 50000 
GROUP BY country 
HAVING avg(creditLimit)> 80000;

-- NEW QUERY

SELECT
SUM(CASE WHEN addressLine2 IS NULL THEN 1 ELSE 0 END) AS null_count,
SUM(CASE WHEN addressLine2 IS NOT NULL THEN 1 ELSE 0 END) AS not_null_count
FROM customers;

-- NEW QUERY

SELECT
addressLine2,
COUNT(*) AS count
FROM customers
GROUP BY addressLine2;

-- NEW QUERY

SELECT
addressLine2,
COUNT(*) AS count
FROM
customers
WHERE
addressLine2 IS NULL
GROUP BY
addressLine2;


-- INNER JOIN


SELECT
employeeNumber,
lastname,
firstname,
email,
-- employees.officeCode,
city,
state
FROM 
employees

INNER JOIN offices ON employees.officeCode = offices.officeCode;


-- LEFT JOIN
-- MIDIFICATIONS

ALTER TABLE employees
DROP FOREIGN KEY `employees_ibfk_2`;

SELECT * FROM employees;

INSERT INTO `classicmodels`.`employees`
(`employeeNumber`, `lastName`, `firstName`, `extension`, `email`, `officeCode`, `reportsTo`, `jobTitle`)
VALUES (1703, 'Test', 'Test', 'x1100', 'abcd@yahoo.com', 9, 1102, 'Sales Rep');


INSERT INTO `classicmodels`.`offices`(`officeCode`,`city`,`phone`,`addressLine1`,`addressLine2`,`state`,
`country`,`postalCode`,`territory`) VALUES (8, 'Noida', '+91-8743913121', 'Add1', 'Add2', 'ND', 'IND', 201301, 'NA');

-- LEFT JOIN QUERY MAIN
/*SELECT * FROM employees;
SELECT * FROM offices;*/

SELECT
employeeNumber,
firstName,
lastName,
email,
city
FROM
employees
LEFT JOIN 
offices
ON employees.officeCode = offices.officeCode;

-- RIGHT JOIN

SELECT 
employeeNumber, 
firstName, 
lastname, 
email, 
city, 
state, 
country
FROM 
employees 
RIGHT JOIN 
offices

ON employees.officeCode = offices.officeCode;

-- FULL OUTER JOIN

SELECT 
e.employeeNumber, e.firstname, e.lastname, e.email, o.city, o.state, o.country
FROM 
employees e
LEFT JOIN 
offices o ON e.officeCode = o.officeCode

UNION

SELECT 
e.employeeNumber, e.firstname, e.lastname, e.email, o.city, o.state, o.country
FROM 
employees e
RIGHT JOIN 
offices o ON e.officeCode = o.officeCode;

-- SELF JOIN

SELECT
A.firstname AS "Emp Name",
B.firstname AS "Manager Name"
FROM
employees A
INNER JOIN
employees B ON A.reportsTo = B.employeeNumber;

-- START FROM SECTION 7: WORKING WITH TABLES



























































