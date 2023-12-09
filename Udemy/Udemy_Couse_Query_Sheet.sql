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





































