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



















































