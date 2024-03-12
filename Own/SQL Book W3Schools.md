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

# SQL COUNT() Function


## The SQL COUNT() Function

The `COUNT()` function returns the number of rows that matches a specified criterion.

### Example

Find the total number of rows in the `Products` table:

```
SELECT COUNT(*)  
FROM Products;
```

## Syntax

```
SELECT COUNT(_column_name_)  
FROM _table_name_  
WHERE _condition_;
```

## Specify Column

You can specify a column name instead of the asterix symbol `(*)`.

If you specify a column name instead of `(*)`, NULL values will not be counted.

### Example

Find the number of products where the `ProductName` is not null:

```
SELECT COUNT(ProductName)  
FROM Products;
```

## Add a WHERE Clause


You can add a `WHERE` clause to specify conditions:

### Example

Find the number of products where `Price` is higher than 20:

```
SELECT COUNT(ProductID)  
FROM Products  
WHERE Price > 20;
```

## Ignore Duplicates

You can ignore duplicates by using the `DISTINCT` keyword in the `COUNT()` function.

If `DISTINCT` is specified, rows with the same value for the specified column will be counted as one.

### Example

How many _different_ prices are there in the `Products` table:

```
SELECT COUNT(DISTINCT Price)  
FROM Products;
```

## Use an Alias

Give the counted column a name by using the `AS` keyword.

### Example

Name the column "Number of records":

```
SELECT COUNT(*) AS [Number of records]  
FROM Products;
```

## Use COUNT() with GROUP BY

Here we use the `COUNT()` function and the `GROUP BY` clause, to return the number of records for each category in the Products table:

### Example

```
SELECT COUNT(*) AS [Number of records], CategoryID  
FROM Products  
GROUP BY CategoryID;
```

# SQL SUM() Function


## The SQL SUM() Function


The `SUM()` function returns the total sum of a numeric column.

### Example

Return the sum of all `Quantity` fields in the `OrderDetails` table:

```
SELECT SUM(Quantity)  
FROM OrderDetails;
```

## Syntax

```
SELECT SUM(_column_name_)  
FROM _table_name_  
WHERE _condition_;
```

## Add a WHERE Clause

You can add a `WHERE` clause to specify conditions:

### Example

Return the sum of the `Quantity` field for the product with `ProductID` 11:

```
SELECT SUM(Quantity)  
FROM OrderDetails  
WHERE ProductId = 11;
```

## Use an Alias

Give the summarized column a name by using the `AS` keyword.

### Example

Name the column "total":

```
SELECT SUM(Quantity) AS total  
FROM OrderDetails;
```

## Use SUM() with GROUP BY

Here we use the `SUM()` function and the `GROUP BY` clause, to return the `Quantity` for each `OrderID` in the OrderDetails table:

### Example

```
SELECT OrderID, SUM(Quantity) AS 'Total Quantity'
FROM OrderDetails  
GROUP BY OrderID;
```


## SUM() With an Expression

The parameter inside the `SUM()` function can also be an expression.

If we assume that each product in the `OrderDetails` column costs 10 dollars, we can find the total earnings in dollars by multiply each quantity with 10:

### Example

Use an expression inside the `SUM()` function:

```
SELECT SUM(Quantity * 10)  
FROM OrderDetails;
```


We can also join the `OrderDetails` table to the `Products` table to find the actual amount, instead of assuming it is 10 dollars:

### Example

Join `OrderDetails` with `Products`, and use `SUM()` to find the total amount:

```
SELECT SUM(Price * Quantity)  
FROM OrderDetails  
LEFT JOIN Products ON OrderDetails.ProductID = Products.ProductID;
```


# SQL AVG() Function

## The SQL AVG() Function

The `AVG()` function returns the average value of a numeric column.

### Example

Find the average price of all products:

```
SELECT AVG(Price)  
FROM Products;
```

## Syntax

```
SELECT AVG(_column_name_)  
FROM _table_name_  
WHERE _condition_;
```


## Add a WHERE Clause

You can add a `WHERE` clause to specify conditions:

### Example

Return the average price of products in category 1:

```
SELECT AVG(Price)  
FROM Products  
WHERE CategoryID = 1;
```

## Use an Alias

Give the AVG column a name by using the `AS` keyword.

### Example

Name the column "average price":

```
SELECT AVG(Price) AS 'average price'  
FROM Products;
```

## Higher Than Average

To list all records with a higher price than average, we can use the `AVG()` function in a sub query:

### Example

Return all products with a higher price than the average price:

```
SELECT * FROM Products  
WHERE price > (SELECT AVG(price) FROM Products);
```

## Use AVG() with GROUP BY

Here we use the `AVG()` function and the `GROUP BY` clause, to return the average price for each category in the Products table:

### Example

```
SELECT AVG(Price) AS AveragePrice, CategoryID  
FROM Products  
GROUP BY CategoryID;
```


# SQL LIKE Operator

## The SQL LIKE Operator

The `LIKE` operator is used in a `WHERE` clause to search for a specified pattern in a column.

There are two wildcards often used in conjunction with the `LIKE` operator:

-  The percent sign `%` represents zero, one, or multiple characters
-  The underscore sign `_` represents one, single character

### Example

Select all customers that starts with the letter "a":

```
SELECT * FROM Customers  
WHERE CustomerName LIKE 'a%';
```


## Syntax

```
SELECT _column1, column2, ..._  
FROM _table_name_  
WHERE _columnN_ LIKE _pattern_;
```


## The _ Wildcard

The `_` wildcard represents a single character.

It can be any character or number, but each `_` represents one, and only one, character.

### Example

Return all customers from a city that starts with 'L' followed by one wildcard character, then 'nd' and then two wildcard characters:


```
SELECT * FROM Customers  
WHERE city LIKE 'L_nd__';
```

## The % Wildcard

The `%` wildcard represents any number of characters, even zero characters.

### Example

Return all customers from a city that _contains_ the letter 'L':

```
SELECT * FROM Customers  
WHERE city LIKE '%L%';
```

## Starts With

To return records that starts with a specific letter or phrase, add the `%` at the end of the letter or phrase.

### Example

Return all customers that starts with 'La':

```
SELECT * FROM Customers  
WHERE CustomerName LIKE 'La%';
```

**Tip:** You can also combine any number of conditions using `AND` or `OR` operators.

### Example

Return all customers that starts with 'a' or starts with 'b':

```
SELECT * FROM Customers  
WHERE CustomerName LIKE 'a%' OR CustomerName LIKE 'b%';
```

## Ends With

To return records that ends with a specific letter or phrase, add the `%` at the beginning of the letter or phrase.


### Example

Return all customers that ends with 'a':


```
SELECT * FROM Customers  
WHERE CustomerName LIKE '%a';
```

**Tip:** You can also combine "starts with" and "ends with":


### Example

Return all customers that starts with "b" and ends with "s":

```
SELECT * FROM Customers  
WHERE CustomerName LIKE 'b%s';
```

## Contains

To return records that contains a specific letter or phrase, add the `%` both before and after the letter or phrase.

### Example

Return all customers that contains the phrase 'or'

```
SELECT * FROM Customers  
WHERE CustomerName LIKE '%or%';
```

## Combine Wildcards

Any wildcard, like `%` and `_` , can be used in combination with other wildcards.

### Example

Return all customers that starts with "a" and are at least 3 characters in length:

```
SELECT * FROM Customers  
WHERE CustomerName LIKE 'a__%';
```

### Example

Return all customers that have "r" in the second position:

```
SELECT * FROM Customers  
WHERE CustomerName LIKE '_r%';
```

## Without Wildcard

If no wildcard is specified, the phrase has to have an exact match to return a result.

### Example

Return all customers from Spain:

```
SELECT * FROM Customers  
WHERE Country LIKE 'Spain';
```

# SQL Wildcards

## SQL Wildcard Characters

A wildcard character is used to substitute one or more characters in a string.

Wildcard characters are used with the `[LIKE](https://www.w3schools.com/sql/sql_like.asp)` operator. The `LIKE` operator is used in a `WHERE` clause to search for a specified pattern in a column.

### Example

Return all customers that starts with the letter 'a':

```
SELECT * FROM Customers  
WHERE CustomerName LIKE 'a%';
```


## Wildcard Characters

|Symbol|Description|
|---|---|
|%|Represents zero or more characters|
|_|Represents a single character|
|[]|Represents any single character within the brackets *|
|^|Represents any character not in the brackets *|
|-|Represents any single character within the specified range *|
|{}|Represents any escaped character **|

[*]  Not supported in PostgreSQL and MySQL databases.

[**]  Supported only in Oracle databases.


## Using the % Wildcard

The `%` wildcard represents any number of characters, even zero characters.

### Example

Return all customers that ends with the pattern 'es':

```
SELECT * FROM Customers  
WHERE CustomerName LIKE '%es';
```

### Example

Return all customers that _contains_ the pattern 'mer':

```
SELECT * FROM Customers  
WHERE CustomerName LIKE '%mer%';
```

## Using the _ Wildcard

The `_` wildcard represents a single character.

It can be any character or number, but each `_` represents one, and only one, character.

### Example

Return all customers with a `City` starting with any character, followed by "ondon":

```
SELECT * FROM Customers  
WHERE City LIKE '_ondon';
```


### Example

Return all customers with a `City` starting with "L", followed by any 3 characters, ending with "on":

```
SELECT * FROM Customers  
WHERE City LIKE 'L___on';
```

## Using the [] Wildcard

The `[]` wildcard returns a result if _any_ of the characters inside gets a match.

### Example

Return all customers starting with either "b", "s", or "p":

```
SELECT * FROM Customers  
WHERE CustomerName LIKE '[bsp]%';
```

## Combine Wildcards

Any wildcard, like `%` and `_` , can be used in combination with other wildcards.

### Example

Return all customers that starts with "a" and are at least 3 characters in length:

```
SELECT * FROM Customers  
WHERE CustomerName LIKE 'a__%';
```

### Example

Return all customers that have "r" in the second position:

```
SELECT * FROM Customers  
WHERE CustomerName LIKE '_r%';
```

## Without Wildcard

If no wildcard is specified, the phrase has to have an exact match to return a result.

### Example

Return all customers from Spain:

```
SELECT * FROM Customers
WHERE Country LIKE 'Spain';
```

# SQL IN Operator

## The SQL IN Operator

The `IN` operator allows you to specify multiple values in a `WHERE` clause.

The `IN` operator is a shorthand for multiple `OR` conditions.

### Example

Return all customers from 'Germany', 'France', or 'UK'

```
SELECT * FROM Customers  
WHERE Country IN ('Germany', 'France', 'UK');
```

## Syntax

```
SELECT _column_name(s)_  
FROM _table_name_  
WHERE _column_name_ IN (_value1_, _value2_, ...);
```


## NOT IN

By using the `NOT` keyword in front of the `IN` operator, you return all records that are NOT any of the values in the list.

### Example

Return all customers that are NOT from 'Germany', 'France', or 'UK':

```
SELECT * FROM Customers  
WHERE Country NOT IN ('Germany', 'France', 'UK');
```

## IN (SELECT)

You can also use `IN` with a subquery in the `WHERE` clause.

With a subquery you can return all records from the main query that are present in the result of the subquery.

### Example

Return all customers that have an order in the [**Orders**](https://www.w3schools.com/sql/trysql.asp?filename=trysql_orders) table:

```
SELECT * FROM Customers  
WHERE CustomerID IN (SELECT CustomerID FROM Orders);
```


## NOT IN (SELECT)

The result in the example above returned 74 records, that means that there are 17 customers that haven't placed any orders.

Let us check if that is correct, by using the `NOT IN` operator.

### Example

Return all customers that have NOT placed any orders in the [**Orders**](https://www.w3schools.com/sql/trysql.asp?filename=trysql_orders) table:

```
SELECT * FROM Customers  
WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders);
```





































































