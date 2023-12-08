-- Show whole data of the table
SELECT * FROM employees;

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














