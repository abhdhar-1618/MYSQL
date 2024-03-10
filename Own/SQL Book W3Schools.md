## The SQL AND Operator

The `WHERE` clause can contain one or many `AND` operators.

The `AND` operator is used to filter records based on more than one condition, like if you want to return all customers from Spain that starts with the letter 'G':

### Example

Select all customers from Spain that starts with the letter 'G':

```
SELECT *  
FROM Customers  
WHERE Country = 'Spain' AND CustomerName LIKE 'G%';
```

## Syntax

```
SELECT _column1_, _column2, ..._  
FROM _table_name_  
WHERE _condition1_ AND _condition2_ AND _condition3 ..._;
```

## AND vs OR

```
The `AND` operator displays a record if _all_ the conditions are TRUE.

The `OR` operator displays a record if _any_ of the conditions are TRUE.
```


## All Conditions Must Be True

The following SQL statement selects all fields from `Customers` where `Country` is "Germany" AND `City` is "Berlin" AND `PostalCode` is higher than 12000:

```
SELECT * FROM Customers  
WHERE Country = 'Germany'  
AND City = 'Berlin'  
AND PostalCode > 1200;
```

## Combining AND and OR

You can combine the `AND` and `OR` operators.

The following SQL statement selects all customers from Spain that starts with a "G" or an "R".

Make sure you use parenthesis to get the correct result.


### Example

Select all Spanish customers that starts with either "G" or "R":


```
SELECT * FROM Customers  
WHERE Country = 'Spain' AND (CustomerName LIKE 'G%' OR CustomerName LIKE 'R%');
```

## The SQL OR Operator

The `WHERE` clause can contain one or more `OR` operators.

The `OR` operator is used to filter records based on more than one condition, like if you want to return all customers from Germany but also those from Spain:

### Example

Select all customers from Germany or Spain:

```
SELECT *  
FROM Customers  
WHERE Country = 'Germany' OR Country = 'Spain';
```

## Syntax

```
SELECT _column1_, _column2, ..._  
FROM _table_name_  
WHERE _condition1_ OR _condition2_ OR _condition3 ..._;
```

## OR vs AND

The `OR` operator displays a record if _any_ of the conditions are TRUE.

The `AND` operator displays a record if _all_ the conditions are TRUE.

## At Least One Condition Must Be True

The following SQL statement selects all fields from Customers where either `City` is "Berlin", `CustomerName` starts with the letter "G" or `Country` is "Norway":

```
SELECT * FROM Customers  
WHERE City = 'Berlin' OR CustomerName LIKE 'G%' OR Country = 'Norway';
```


## Combining AND and OR

You can combine the `AND` and `OR` operators.

The following SQL statement selects all customers from Spain that starts with a "G" or an "R".

Make sure you use parenthesis to get the correct result.

### Example

Select all Spanish customers that starts with either "G" or "R":

```
SELECT * FROM Customers  
WHERE Country = 'Spain' AND (CustomerName LIKE 'G%' OR CustomerName LIKE 'R%');
```

Without parenthesis, the select statement will return all customers from Spain that starts with a "G", _plus_ all customers that starts with an "R", regardless of the country value:


### Example

Select all customers that either:  
are from Spain and starts with either "G", _or_  
starts with the letter "R":


```
SELECT * FROM Customers  
WHERE Country = 'Spain' AND CustomerName LIKE 'G%' OR CustomerName LIKE 'R%';
```


# SQL NOT Operator

## The NOT Operator

The `NOT` operator is used in combination with other operators to give the opposite result, also called the negative result.

In the select statement below we want to return all customers that are NOT from Spain:

### Example

Select only the customers that are NOT from Spain:

```
SELECT * FROM Customers  
WHERE NOT Country = 'Spain';
```


In the example above, the `NOT` operator is used in combination with the `=` operator, but it can be used in combination with other comparison and/or logical operators. See examples below.

## Syntax

SELECT _column1_, _column2, ..._  
FROM _table_name_  
WHERE NOT _condition_;

## NOT LIKE

### Example

Select customers that does not start with the letter 'A':


```
SELECT * FROM Customers  
WHERE CustomerName NOT LIKE 'A%';
```

## NOT BETWEEN

### Example

Select customers with a customerID not between 10 and 60:

```
SELECT * FROM Customers  
WHERE CustomerID NOT BETWEEN 10 AND 60;
```


## NOT IN

### Example

Select customers that are not from Paris or London:

```
SELECT * FROM Customers  
WHERE City NOT IN ('Paris', 'London');
```

## NOT Greater Than

### Example

Select customers with a CustomerId not greater than 50:

```
SELECT * FROM Customers  
WHERE NOT CustomerID > 50;
```

**Note:** There is a not-greater-then operator: `!>` that would give you the same result.

## NOT Less Than

### Example

Select customers with a CustomerID not less than 50:

```
SELECT * FROM Customers  
WHERE NOT CustomerId < 50;
```


**Note:** There is a not-less-then operator: `!<` that would give you the same result.

# SQL INSERT INTO Statement

## The SQL INSERT INTO Statement

The `INSERT INTO` statement is used to insert new records in a table.

### INSERT INTO Syntax

It is possible to write the `INSERT INTO` statement in two ways:

1. Specify both the column names and the values to be inserted:


```
INSERT INTO _table_name_ (_column1_, _column2_, _column3_, ...) 
VALUES (_value1_, _value2_, _value3_, ...);
```

2. If you are adding values for all the columns of the table, you do not need to specify the column names in the SQL query. However, make sure the order of the values is in the same order as the columns in the table. Here, the `INSERT INTO` syntax would be as follows:
```
INSERT INTO _table_name_  
VALUES (_value1_, _value2_, _value3_, ...);
```


## INSERT INTO Example

The following SQL statement inserts a new record in the "Customers" table:

```
INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)  
VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');
```

## Insert Data Only in Specified Columns

It is also possible to only insert data in specific columns.

The following SQL statement will insert a new record, but only insert data in the "CustomerName", "City", and "Country" columns (CustomerID will be updated automatically):


```
INSERT INTO Customers (CustomerName, City, Country)  
VALUES ('Cardinal', 'Stavanger', 'Norway');
```


## Insert Multiple Rows

It is also possible to insert multiple rows in one statement.

To insert multiple rows of data, we use the same `INSERT INTO` statement, but with multiple values:


### Example

```
INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)  
VALUES  
('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway'),  
('Greasy Burger', 'Per Olsen', 'Gateveien 15', 'Sandnes', '4306', 'Norway'),  
('Tasty Tee', 'Finn Egan', 'Streetroad 19B', 'Liverpool', 'L1 0AA', 'UK');
```


# SQL NULL Values

## What is a NULL Value?

A field with a NULL value is a field with no value.

If a field in a table is optional, it is possible to insert a new record or update a record without adding a value to this field. Then, the field will be saved with a NULL value.

## How to Test for NULL Values?

It is not possible to test for NULL values with comparison operators, such as =, <, or <>.

We will have to use the `IS NULL` and `IS NOT NULL` operators instead.

### IS NULL Syntax

```
SELECT _column_names  
_FROM _table_name_  
WHERE _column_name_ IS NULL;
```

### IS NOT NULL Syntax

```
SELECT _column_names  
_FROM _table_name_  
WHERE _column_name_ IS NOT NULL;
```

## The IS NULL Operator

The `IS NULL` operator is used to test for empty values (NULL values).

The following SQL lists all customers with a NULL value in the "Address" field:

```
SELECT CustomerName, ContactName, Address  
FROM Customers  
WHERE Address IS NULL;
```

## The IS NOT NULL Operator

The `IS NOT NULL` operator is used to test for non-empty values (NOT NULL values).

The following SQL lists all customers with a value in the "Address" field:

### Example

```
SELECT CustomerName, ContactName, Address  
FROM Customers  
WHERE Address IS NOT NULL;
```


## The SQL UPDATE Statement

The `UPDATE` statement is used to modify the existing records in a table.

### UPDATE Syntax

```
UPDATE _table_name_  
SET _column1_ = _value1_, _column2_ = _value2_, ...  
WHERE _condition_;
```


## UPDATE Table

The following SQL statement updates the first customer (CustomerID =1) with a new contact person _and_ a new city.

```
UPDATE Customers  
SET ContactName = 'Alfred Schmidt', City= 'Frankfurt'  
WHERE CustomerID = 1;
```

## UPDATE Multiple Records

It is the `WHERE` clause that determines how many records will be updated.

The following SQL statement will update the ContactName to "Juan" for all records where country is "Mexico":

```
UPDATE Customers  
SET ContactName='Juan'  
WHERE Country='Mexico';
```

## Update Warning!

Be careful when updating records. If you omit the `WHERE` clause, ALL records will be updated!


```
UPDATE Customers  
SET ContactName='Juan';
```


# SQL DELETE Statement

## The SQL DELETE Statement

The `DELETE` statement is used to delete existing records in a table.

### DELETE Syntax

```
DELETE FROM _table_name_ WHERE _condition_;
```


## SQL DELETE Example

The following SQL statement deletes the customer "Alfreds Futterkiste" from the "Customers" table:

```
DELETE FROM Customers WHERE CustomerName='Alfreds Futterkiste';
```

## Delete All Records

It is possible to delete all rows in a table without deleting the table. This means that the table structure, attributes, and indexes will be intact:

```
DELETE FROM _table_name_;
```

The following SQL statement deletes all rows in the "Customers" table, without deleting the table:

```
DELETE FROM Customers;
```

## Delete a Table

To delete the table completely, use the `DROP TABLE` statement:

### Example

Remove the Customers table:

```
DROP TABLE Customers;
```


## The SQL SELECT TOP Clause

The `SELECT TOP` clause is used to specify the number of records to return.

The `SELECT TOP` clause is useful on large tables with thousands of records. Returning a large number of records can impact performance.


### Example
Select only the first 3 records of the Customers table:

```
SELECT TOP 3 * FROM Customers;
```

**Note:** Not all database systems support the `SELECT TOP` clause. MySQL supports the `LIMIT` clause to select a limited number of records, while Oracle uses `FETCH FIRST _n_ ROWS ONLY` and `ROWNUM`.

**MySQL Syntax:**

```
SELECT _column_name(s)_  
FROM _table_name  
_WHERE _condition_  
LIMIT _number_;
```

## LIMIT

The following SQL statement shows the equivalent example for MySQL:

### Example

Select the first 3 records of the Customers table:

```
SELECT * FROM Customers  
LIMIT 3;
```


## FETCH FIRST

The following SQL statement shows the equivalent example for Oracle:

### Example

Select the first 3 records of the Customers table:

```
SELECT * FROM Customers  
FETCH FIRST 3 ROWS ONLY;
```


## SQL TOP PERCENT Example

The following SQL statement selects the first 50% of the records from the "Customers" table (for SQL Server/MS Access):

```
SELECT TOP 50 PERCENT * FROM Customers;
```


## ADD a WHERE CLAUSE

The following SQL statement selects the first three records from the "Customers" table, where the country is "Germany":

```
SELECT * FROM Customers  
WHERE Country='Germany'  
LIMIT 3;
```


## ADD the ORDER BY Keyword

The following SQL statement shows the equivalent example for MySQL:


```
SELECT * FROM Customers  
ORDER BY CustomerName DESC  
LIMIT 3;
```

# SQL Aggregate Functions

## SQL Aggregate Functions


An aggregate function is a function that performs a calculation on a set of values, and returns a single value.

Aggregate functions are often used with the `GROUP BY` clause of the `SELECT` statement. The `GROUP BY` clause splits the result-set into groups of values and the aggregate function can be used to return a single value for each group.

The most commonly used SQL aggregate functions are:

- `MIN()` - returns the smallest value within the selected column
- `MAX()` - returns the largest value within the selected column
- `COUNT()` - returns the number of rows in a set
- `SUM()` - returns the total sum of a numerical column
- `AVG()` - returns the average value of a numerical column

Aggregate functions ignore null values (except for `COUNT()`).

We will go through the aggregate functions above in the next chapters.


# SQL MIN() and MAX() Functions


## The SQL MIN() and MAX() Functions

The `MIN()` function returns the smallest value of the selected column.

The `MAX()` function returns the largest value of the selected column.

### MIN Example

Find the lowest price in the Price column:

```
SELECT MIN(Price)  
FROM Products;
```

### MAX Example

Find the highest price in the Price column:

```
SELECT MAX(Price)  
FROM Products;
```

## Syntax

```
SELECT MIN(_column_name_)  
FROM _table_name_  
WHERE _condition_;
```

```
SELECT MAX(_column_name_)  
FROM _table_name_  
WHERE _condition_;
```


## Set Column Name (Alias)

When you use `MIN()` or `MAX()`, the returned column will not have a descriptive name. To give the column a descriptive name, use the `AS` keyword:

```
SELECT MIN(Price) AS SmallestPrice  
FROM Products;
```

## Use MIN() with GROUP BY

Here we use the `MIN()` function and the `GROUP BY` clause, to return the smallest price for each category in the Products table:


```
SELECT MIN(Price) AS SmallestPrice, CategoryID  
FROM Products  
GROUP BY CategoryID;
```

