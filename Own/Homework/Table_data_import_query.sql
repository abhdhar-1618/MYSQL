/*

SQL WORKING FILE LOCATIONS

D:\Main\My Practice and experiments\My Practice LAB\SQL\TechTFQ\TechTFQ.sql
D:\Main\My Practice and experiments\My Practice LAB\SQL\Statquest\SQ_Problems.sql
D:\Main\My Practice and experiments\My Practice LAB\SQL\Medium Superstore data\superstore\Superstore.sql
D:\Main\My Practice and experiments\My Practice LAB\SQL\Edureka\edureka.sql
D:\Main\My Practice and experiments\My Practice LAB\SQL\Udemy\SQL - MySQL for Data Analytics and Business Intelligence\employees.sql
D:\Main\My Practice and experiments\My Practice LAB\SQL\W3 Schools Database\W3Schools.sql
*/


CREATE DATABASE IF NOT EXISTS w3shools;


SELECT * FROM Customers
WHERE Country='Mexico';

UPDATE Customers
SET Country = TRIM(Country);

SHOW TABLES;

CREATE TABLE Customers (
    CustomerID INTEGER,
    CustomerName VARCHAR(255),
    ContactName VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(255),
    PostalCode VARCHAR(255),
    Country VARCHAR(255)
);

SELECT * FROM customers;

CREATE TABLE OrderDetails (OrderDetailID INTEGER, OrderID INTEGER, ProductID INTEGER, Quantity INTEGER);
SHOW TABLES;
    
SELECT * FROM orderdetails;

CREATE TABLE Categories (
    CategoryID INTEGER PRIMARY KEY,
    CategoryName TEXT NOT NULL,
    Description TEXT
);
    

SELECT * FROM employees;

SELECT * FROM Employees 
WHERE DATE_FORMAT(BirthDate, '%d-%m') = '02-07';

    
SHOW TABLES;

CREATE TABLE Orders (
    OrderID INTEGER,
    CustomerID INTEGER,
    EmployeeID INTEGER,
    OrderDate DATE, -- Correcting the data type to DATE
    ShipperID INTEGER
);

SELECT * FROM orders;

SHOW TABLES;

-- SQL code to create the table:
CREATE TABLE Products (ProductID INTEGER, ProductName TEXT, SupplierID INTEGER, CategoryID INTEGER, Unit TEXT, Price INTEGER);

SELECT * FROM Products;

SHOW tables;

-- SQL code to create the table:
CREATE TABLE Suppliers (SupplierID INTEGER, SupplierName TEXT, ContactName TEXT, Address TEXT, City TEXT, PostalCode TEXT, Country TEXT, Phone TEXT);

-- SQL code to create the table:
CREATE TABLE Shippers (ShipperID INTEGER, ShipperName TEXT, Phone TEXT);

-- SQL code to insert data into the table:
    
SELECT table_name, table_rows
FROM information_schema.tables
WHERE table_schema = 'datacamp';

-- Drop the table if it already exists
DROP TABLE IF EXISTS user_posts;

-- Create the user_posts table
    
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'datacamp'
AND TABLE_NAME = 'films';

ALTER TABLE countries
RENAME COLUMN country_name TO name;

ALTER TABLE films MODIFY COLUMN duration INT NULL;
DESCRIBE films;

SELECT * FROM films
WHERE id = 4968;

SELECT * FROM cities;

DROP TABLE films;



SELECT *FROM countries
WHERE indep_year IS NULL;


-- Generate the UPDATE statement dynamically
SET @sql = CONCAT('UPDATE countries SET ',
    (SELECT GROUP_CONCAT(
            CONCAT(column_name, ' = NULLIF(', column_name, ', '')')
            SEPARATOR ', ')
    FROM information_schema.columns
    WHERE table_schema = 'datacamp' AND table_name = 'countries'),
    ';');

-- Execute the generated UPDATE statement
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SELECT * FROM cities;
SELECT * FROM countries;
SELECT * FROM currencies;
SELECT * FROM economies;
SELECT * FROM economies2015;
SELECT * FROM economies2019;
SELECT * FROM eu_countries;
SELECT * FROM films;
SELECT * FROM languages;
SELECT * FROM monarchs;
SELECT * FROM people;
SELECT * FROM populations;
SELECT * FROM presidents;
SELECT * FROM prime_ministers;
SELECT * FROM prime_minister_terms;
SELECT * FROM reviews;
SELECT * FROM roles;
SELECT * FROM states;
SELECT * FROM students;

-- European Soccer Database tables

SELECT * FROM matches;
SELECT * FROM player;
SELECT * FROM Country;
SELECT * FROM Player_Attributes;
SELECT * FROM Team_Attributes;
SELECT * FROM Team;
SELECT * FROM League;








RENAME TABLE `match` TO `matches`;













CREATE TABLE `team` 
(
    `id`	INT,
    `team_api_id`	INT,
    `team_fifa_api_id`	INT,
    `team_long_name`	VARCHAR(512),
    `team_short_name`	VARCHAR(512)
);

TRUNCATE TABLE team;

SELECT * FROM team;


ALTER TABLE matches
CHANGE away_team_goal away_goal INT,
CHANGE home_team_api_id hometeam_id INT,
CHANGE away_team_api_id awayteam_id INT,
CHANGE home_team_goal home_goal INT;



SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Country';















