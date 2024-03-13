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


# SQL BETWEEN Operator

## The SQL BETWEEN Operator

The `BETWEEN` operator selects values within a given range. The values can be numbers, text, or dates.

The `BETWEEN` operator is inclusive: begin and end values are included.

### Example

Selects all products with a price between 10 and 20:

```
SELECT * FROM Products  
WHERE Price BETWEEN 10 AND 20;
```


## Syntax

```
SELECT _column_name(s)_  
FROM _table_name_  
WHERE _column_name_ BETWEEN _value1_ AND _value2;_
```

## NOT BETWEEN

To display the products outside the range of the previous example, use `NOT BETWEEN`:

### Example

```
SELECT * FROM Products  
WHERE Price NOT BETWEEN 10 AND 20;
```


## BETWEEN with IN

The following SQL statement selects all products with a price between 10 and 20. In addition, the CategoryID must be either 1,2, or 3:


### Example

```
SELECT * FROM Products  
WHERE Price BETWEEN 10 AND 20  
AND CategoryID IN (1,2,3);
```


## BETWEEN Text Values

The following SQL statement selects all products with a ProductName alphabetically between Carnarvon Tigers and Mozzarella di Giovanni:

### Example

```
SELECT * FROM Products  
WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'  
ORDER BY ProductName;
```

The following SQL statement selects all products with a ProductName between Carnarvon Tigers and Chef Anton's Cajun Seasoning:


### Example

```
SELECT * FROM Products  
WHERE ProductName BETWEEN "Carnarvon Tigers" AND "Chef Anton's Cajun Seasoning"  
ORDER BY ProductName;
```

## NOT BETWEEN Text Values

The following SQL statement selects all products with a ProductName not between Carnarvon Tigers and Mozzarella di Giovanni:


```
SELECT * FROM Products  
WHERE ProductName NOT BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'  
ORDER BY ProductName;
```

## BETWEEN Dates

The following SQL statement selects all orders with an OrderDate between '01-July-1996' and '31-July-1996':

### Example

```
SELECT * FROM Orders  
WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';
```

# SQL Aliases

## SQL Aliases

SQL aliases are used to give a table, or a column in a table, a temporary name.

Aliases are often used to make column names more readable.

An alias only exists for the duration of that query.

An alias is created with the `AS` keyword.


### Example

```
SELECT CustomerID AS ID  
FROM Customers;
```

## AS is Optional

Actually, in most database languages, you can skip the AS keyword and get the same result:


```
SELECT CustomerID ID  
FROM Customers;
```


## Syntax

When alias is used on column:


```
SELECT _column_name_ AS _alias_name_  
FROM _table_name;_
```

When alias is used on table:

```
SELECT _column_name(s)_  
FROM _table_name_ AS _alias_name;_
```

## Alias for Columns

The following SQL statement creates two aliases, one for the CustomerID column and one for the CustomerName column:

### Example

```
SELECT CustomerID AS ID, CustomerName AS Customer  
FROM Customers;
```

## Using Aliases With a Space Character

If you want your alias to contain one or more spaces, like "`My Great Products`", surround your alias with square brackets or double quotes.

### Example

Using [square brackets] for aliases with space characters:

```
SELECT ProductName AS [My Great Products]  
FROM Products;
```

### Example

Using "double quotes" for aliases with space characters:

```
SELECT ProductName AS "My Great Products"  
FROM Products;
```

**Note:** Some database systems allows both [] and "", and some only allows one of them.

## Concatenate Columns

The following SQL statement creates an alias named "Address" that combine four columns (Address, PostalCode, City and Country):

### Example

```
SELECT CustomerName, CONCAT(Address,', ',PostalCode,', ',City,', ',Country) AS Address  
FROM Customers;
```

## Alias for Tables

The same rules applies when you want to use an alias for a table.

### Example

Refer to the Customers table as Persons instead:

```
SELECT * FROM Customers AS Persons;
```


It might seem useless to use aliases on tables, but when you are using more than one table in your queries, it can make the SQL statements shorter.

The following SQL statement selects all the orders from the customer with CustomerID=4 (Around the Horn). We use the "Customers" and "Orders" tables, and give them the table aliases of "c" and "o" respectively (Here we use aliases to make the SQL shorter):
### Example

```
SELECT o.OrderID, o.OrderDate, c.CustomerName  
FROM Customers AS c, Orders AS o  
WHERE c.CustomerName='Around the Horn' AND c.CustomerID=o.CustomerID;
```


The following SQL statement is the same as above, but without aliases:

```
SELECT Orders.OrderID, Orders.OrderDate, Customers.CustomerName  
FROM Customers, Orders  
WHERE Customers.CustomerName='Around the Horn' AND Customers.CustomerID=Orders.CustomerID;
```

Aliases can be useful when:

- There are more than one table involved in a query
- Functions are used in the query
- Column names are big or not very readable
- Two or more columns are combined together

# SQL Joins

## SQL JOIN

A `JOIN` clause is used to combine rows from two or more tables, based on a related column between them.

Let's look at a selection from the "Orders" table:

| OrderID | CustomerID | OrderDate  |
|---------|------------|------------|
| 10308   | 2          | 1996-09-18 |
| 10309   | 37         | 1996-09-19 |
| 10310   | 77         | 1996-09-20 |

Then, look at a selection from the "Customers" table:

| CustomerID | CustomerName                       | ContactName    | Country |
|------------|------------------------------------|----------------|---------|
| 1          | Alfreds Futterkiste                | Maria Anders   | Germany |
| 2          | Ana Trujillo Emparedados y helados | Ana Trujillo   | Mexico  |
| 3          | Antonio Moreno Taquería            | Antonio Moreno | Mexico  |

Notice that the "CustomerID" column in the "Orders" table refers to the "CustomerID" in the "Customers" table. The relationship between the two tables above is the "CustomerID" column.

Then, we can create the following SQL statement (that contains an `INNER JOIN`), that selects records that have matching values in both tables:

### Example

```
SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate  
FROM Orders  
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;
```

and it will produce something like this:

|OrderID|CustomerName|OrderDate|
|---|---|---|
|10308|Ana Trujillo Emparedados y helados|9/18/1996|
|10365|Antonio Moreno Taquería|11/27/1996|
|10383|Around the Horn|12/16/1996|
|10355|Around the Horn|11/15/1996|
|10278|Berglunds snabbköp|8/12/1996|

## Different Types of SQL JOINs

Here are the different types of the JOINs in SQL:

- `(INNER) JOIN`: Returns records that have matching values in both tables
- `LEFT (OUTER) JOIN`: Returns all records from the left table, and the matched records from the right table
- `RIGHT (OUTER) JOIN`: Returns all records from the right table, and the matched records from the left table
- `FULL (OUTER) JOIN`: Returns all records when there is a match in either left or right table


# SQL INNER JOIN

## INNER JOIN

The `INNER JOIN` keyword selects records that have matching values in both tables.

Let's look at a selection of the [**Products**](https://www.w3schools.com/sql/trysql.asp?filename=trysql_products) table:

| ProductID | ProductName   | CategoryID | Price |
|-----------|---------------|------------|-------|
| 1         | Chais         | 1          | 18    |
| 2         | Chang         | 1          | 19    |
| 3         | Aniseed Syrup | 2          | 10    |

And a selection of the [**Categories**](https://www.w3schools.com/sql/trysql.asp?filename=trysql_categories) table:

| CategoryID | CategoryName | Description                                                |
|------------|--------------|------------------------------------------------------------|
| 1          | Beverages    | Soft drinks, coffees, teas, beers, and ales                |
| 2          | Condiments   | Sweet and savory sauces, relishes, spreads, and seasonings |
| 3          | Confections  | Desserts, candies, and sweet breads                        |


We will join the Products table with the Categories table, by using the `CategoryID` field from both tables:

### Example

Join Products and Categories with the INNER JOIN keyword:

```
SELECT ProductID, ProductName, CategoryName  
FROM Products  
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID;
```


**Note:** The `INNER JOIN` keyword returns only rows with a match in both tables. Which means that if you have a product with no CategoryID, or with a CategoryID that is not present in the Categories table, that record would not be returned in the result.

## Syntax

```
SELECT _column_name(s)_  
FROM _table1_  
INNER JOIN _table2  
_ON _table1.column_name_ = _table2.column_name_;
```

## Naming the Columns

It is a good practice to include the table name when specifying columns in the SQL statement.

### Example

Specify the table names:

```
SELECT Products.ProductID, Products.ProductName, Categories.CategoryName  
FROM Products  
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID;
```


Note:The example above works without specifying table names, because none of the specified column names are present in both tables. If you try to include `CategoryID` in the `SELECT` statement, you will get an error if you do not specify the table name (because `CategoryID` is present in both tables).


## JOIN or INNER JOIN

`JOIN` and `INNER JOIN` will return the same result.

`INNER` is the default join type for `JOIN`, so when you write `JOIN` the parser actually writes `INNER JOIN`.


### Example

JOIN is the same as INNER JOIN:

## JOIN Three Tables

The following SQL statement selects all orders with customer and shipper information:

### Example

```
SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName  
FROM ((Orders  
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)  
INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID);
```


# SQL LEFT JOIN Keyword

## SQL LEFT JOIN Keyword

The `LEFT JOIN` keyword returns all records from the left table (table1), and the matching records from the right table (table2). The result is 0 records from the right side, if there is no match.

### LEFT JOIN Syntax

```
SELECT _column_name(s)_  
FROM _table1_  
LEFT JOIN _table2  
_ON _table1.column_name_ = _table2.column_name_;
```


**Note:** In some databases LEFT JOIN is called LEFT OUTER JOIN.

## SQL LEFT JOIN Example

The following SQL statement will select all customers, and any orders they might have:

### Example

```
SELECT Customers.CustomerName, Orders.OrderID  
FROM Customers  
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID  
ORDER BY Customers.CustomerName;
```


**Note:** The `LEFT JOIN` keyword returns all records from the left table (Customers), even if there are no matches in the right table (Orders).

# SQL RIGHT JOIN Keyword

## SQL RIGHT JOIN Keyword

The `RIGHT JOIN` keyword returns all records from the right table (table2), and the matching records from the left table (table1). The result is 0 records from the left side, if there is no match.

### RIGHT JOIN Syntax


```
SELECT _column_name(s)_  
FROM _table1_  
RIGHT JOIN _table2  
_ON _table1.column_name_ = _table2.column_name_;
```


**Note:** In some databases `RIGHT JOIN` is called `RIGHT OUTER JOIN`.

## SQL RIGHT JOIN Example

The following SQL statement will return all employees, and any orders they might have placed:

### Example

```
SELECT Orders.OrderID, Employees.LastName, Employees.FirstName  
FROM Orders  
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID  
ORDER BY Orders.OrderID;
```

**Note:** The `RIGHT JOIN` keyword returns all records from the right table (Employees), even if there are no matches in the left table (Orders).

# SQL FULL OUTER JOIN Keyword

## SQL FULL OUTER JOIN Keyword

The `FULL OUTER JOIN` keyword returns all records when there is a match in left (table1) or right (table2) table records.

**Tip:** `FULL OUTER JOIN` and `FULL JOIN` are the same.

### FULL OUTER JOIN Syntax

```
SELECT _column_name(s)_  
FROM _table1_  
FULL OUTER JOIN _table2  
_ON _table1.column_name_ = _table2.column_name_WHERE _condition_;
```

**Note:** `FULL OUTER JOIN` can potentially return very large result-sets!


## SQL FULL OUTER JOIN Example

The following SQL statement selects all customers, and all orders:

```
SELECT Customers.CustomerName, Orders.OrderID  
FROM Customers  
FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID  
ORDER BY Customers.CustomerName;
```


**Note:** The `FULL OUTER JOIN` keyword returns all matching records from both tables whether the other table matches or not. So, if there are rows in "Customers" that do not have matches in "Orders", or if there are rows in "Orders" that do not have matches in "Customers", those rows will be listed as well.

# SQL Self Join


## SQL Self Join

A self join is a regular join, but the table is joined with itself.

### Self Join Syntax

```
SELECT _column_name(s)_  
FROM _table1 T1, table1 T2_  
WHERE _condition_;
```

_T1_ and _T2_ are different table aliases for the same table.

## SQL Self Join Example

The following SQL statement matches customers that are from the same city:

```
SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City  
FROM Customers A, Customers B  
WHERE A.CustomerID <> B.CustomerID  
AND A.City = B.City  
ORDER BY A.City;
```

# SQL UNION Operator


## The SQL UNION Operator

The `UNION` operator is used to combine the result-set of two or more `SELECT` statements.

- Every `SELECT` statement within `UNION` must have the same number of columns
- The columns must also have similar data types
- The columns in every `SELECT` statement must also be in the same order

### UNION Syntax

```
SELECT _column_name(s)_ FROM _table1_  
UNION  
SELECT _column_name(s)_ FROM _table2_;
```


### UNION ALL Syntax

The `UNION` operator selects only distinct values by default. To allow duplicate values, use `UNION ALL`:

```
SELECT _column_name(s)_ FROM _table1_  
UNION ALL  
SELECT _column_name(s)_ FROM _table2_;
```

**Note:** The column names in the result-set are usually equal to the column names in the first `SELECT` statement.

## SQL UNION Example

The following SQL statement returns the cities (only distinct values) from both the "Customers" and the "Suppliers" table:

### Example

```
SELECT City FROM Customers  
UNION  
SELECT City FROM Suppliers  
ORDER BY City;
```


**Note:** If some customers or suppliers have the same city, each city will only be listed once, because `UNION` selects only distinct values. Use `UNION ALL` to also select duplicate values!


## SQL UNION ALL Example

The following SQL statement returns the cities (duplicate values also) from both the "Customers" and the "Suppliers" table:

### Example

```
SELECT City FROM Customers  
UNION ALL  
SELECT City FROM Suppliers  
ORDER BY City;
```

## SQL UNION With WHERE

The following SQL statement returns the German cities (only distinct values) from both the "Customers" and the "Suppliers" table:

### Example

```
SELECT City, Country FROM Customers  
WHERE Country='Germany'  
UNION  
SELECT City, Country FROM Suppliers  
WHERE Country='Germany'  
ORDER BY City;
```


## SQL UNION ALL With WHERE

The following SQL statement returns the German cities (duplicate values also) from both the "Customers" and the "Suppliers" table:

### Example

```
SELECT City, Country FROM Customers  
WHERE Country='Germany'  
UNION ALL  
SELECT City, Country FROM Suppliers  
WHERE Country='Germany'  
ORDER BY City;
```

## Another UNION Example

The following SQL statement lists all customers and suppliers:

### Example

```
SELECT 'Customer' AS Type, ContactName, City, Country  
FROM Customers  
UNION  
SELECT 'Supplier', ContactName, City, Country  
FROM Suppliers;
```


# SQL GROUP BY Statement

## The SQL GROUP BY Statement

The `GROUP BY` statement groups rows that have the same values into summary rows, like "find the number of customers in each country".

The `GROUP BY` statement is often used with aggregate functions (`COUNT()`, `MAX()`, `MIN()`, `SUM()`, `AVG()`) to group the result-set by one or more columns.

### GROUP BY Syntax

```
SELECT _column_name(s)_  
FROM _table_name_  
WHERE _condition_  
GROUP BY _column_name(s)  
_ORDER BY _column_name(s);_
```

## SQL GROUP BY Examples

The following SQL statement lists the number of customers in each country:
### Example

```
SELECT COUNT(CustomerID), Country  
FROM Customers  
GROUP BY Country;
```

The following SQL statement lists the number of customers in each country, sorted high to low:

### Example

```
SELECT COUNT(CustomerID), Country  
FROM Customers  
GROUP BY Country  
ORDER BY COUNT(CustomerID) DESC;
```

## GROUP BY With JOIN Example

The following SQL statement lists the number of orders sent by each shipper:

### Example

```
SELECT Shippers.ShipperName, COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders  
LEFT JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID  
GROUP BY ShipperName;
```


# SQL HAVING Clause

## The SQL HAVING Clause

The `HAVING` clause was added to SQL because the `WHERE` keyword cannot be used with aggregate functions.

### HAVING Syntax

```
SELECT _column_name(s)_  
FROM _table_name_  
WHERE _condition_  
GROUP BY _column_name(s)  
_HAVING _condition  
_ORDER BY _column_name(s);_
```

## SQL HAVING Examples

The following SQL statement lists the number of customers in each country. Only include countries with more than 5 customers:

### Example

```
SELECT COUNT(CustomerID), Country  
FROM Customers  
GROUP BY Country  
HAVING COUNT(CustomerID) > 5;
```

The following SQL statement lists the number of customers in each country, sorted high to low (Only include countries with more than 5 customers):

### Example

```
SELECT COUNT(CustomerID), Country  
FROM Customers  
GROUP BY Country  
HAVING COUNT(CustomerID) > 5  
ORDER BY COUNT(CustomerID) DESC;
```

## More HAVING Examples

The following SQL statement lists the employees that have registered more than 10 orders:

### Example

```
SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders  
FROM (Orders  
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID)  
GROUP BY LastName  
HAVING COUNT(Orders.OrderID) > 10;
```

The following SQL statement lists if the employees "Davolio" or "Fuller" have registered more than 25 orders:

### Example

```
SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders  
FROM Orders  
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID  
WHERE LastName = 'Davolio' OR LastName = 'Fuller'  
GROUP BY LastName  
HAVING COUNT(Orders.OrderID) > 25;
```


# SQL EXISTS Operator

## The SQL EXISTS Operator

The `EXISTS` operator is used to test for the existence of any record in a subquery.

The `EXISTS` operator returns TRUE if the subquery returns one or more records.

### EXISTS Syntax

```
SELECT _column_name(s)_  
FROM _table_name_  
WHERE EXISTS  
(SELECT _column_name_ FROM _table_name_ WHERE _condition_);
```

## SQL EXISTS Examples

The following SQL statement returns TRUE and lists the suppliers with a product price less than 20:

### Example

```
SELECT SupplierName  
FROM Suppliers  
WHERE EXISTS (SELECT ProductName FROM Products WHERE Products.SupplierID = Suppliers.supplierID AND Price < 20);
```

The following SQL statement returns TRUE and lists the suppliers with a product price equal to 22:

### Example

```
SELECT SupplierName  
FROM Suppliers  
WHERE EXISTS (SELECT ProductName FROM Products WHERE Products.SupplierID = Suppliers.supplierID AND Price = 22);
```

# SQL ANY and ALL Operators

## The SQL ANY and ALL Operators

The `ANY` and `ALL` operators allow you to perform a comparison between a single column value and a range of other values.

## The SQL ANY Operator

The `ANY` operator:

- returns a boolean value as a result
- returns TRUE if ANY of the subquery values meet the condition

`ANY` means that the condition will be true if the operation is true for any of the values in the range.

### ANY Syntax


```
SELECT _column_name(s)_  
FROM _table_name_  
WHERE _column_name operator_ ANY  
  (SELECT _column_name_  FROM _table_name_  WHERE _condition_);
```

**Note:** The _operator_ must be a standard comparison operator (=, <>, !=, >, >=, <, or <=).


## The SQL ALL Operator

The `ALL` operator:

- returns a boolean value as a result
- returns TRUE if ALL of the subquery values meet the condition
- is used with `SELECT`, `WHERE` and `HAVING` statements

`ALL` means that the condition will be true only if the operation is true for all values in the range. 

### ALL Syntax With SELECT

```
SELECT ALL _column_name(s)_  
FROM _table_name_  
WHERE _condition_;
```


### ALL Syntax With WHERE or HAVING

```
SELECT _column_name(s)_  
FROM _table_name_  
WHERE _column_name operator_ ALL  
  (SELECT _column_name_  FROM _table_name_  WHERE _condition_);
```

**Note:** The _operator_ must be a standard comparison operator (=, <>, !=, >, >=, <, or <=).

## SQL ANY Examples

The following SQL statement lists the ProductName if it finds ANY records in the OrderDetails table has Quantity equal to 10 (this will return TRUE because the Quantity column has some values of 10):

### Example

```
SELECT ProductName  
FROM Products  
WHERE ProductID = ANY  
  (SELECT ProductID  
  FROM OrderDetails  
  WHERE Quantity = 10);
```

### Example

The following SQL statement lists the ProductName if it finds ANY records in the OrderDetails table has Quantity larger than 99 (this will return TRUE because the Quantity column has some values larger than 99):

### Example

```
SELECT ProductName  
FROM Products  
WHERE ProductID = ANY  
  (SELECT ProductID  
  FROM OrderDetails  
  WHERE Quantity > 99);
```


The following SQL statement lists the ProductName if it finds ANY records in the OrderDetails table has Quantity larger than 1000 (this will return FALSE because the Quantity column has no values larger than 1000):

### Example

```
SELECT ProductName  
FROM Products  
WHERE ProductID = ANY  
  (SELECT ProductID  
  FROM OrderDetails  
  WHERE Quantity > 1000);
```


## SQL ALL Examples

The following SQL statement lists ALL the product names:

### Example

```
SELECT ALL ProductName  
FROM Products  
WHERE TRUE;
```


The following SQL statement lists the ProductName if ALL the records in the OrderDetails table has Quantity equal to 10. This will of course return FALSE because the Quantity column has many different values (not only the value of 10):

### Example

```
SELECT ProductName  
FROM Products  
WHERE ProductID = ALL  
  (SELECT ProductID  
  FROM OrderDetails  
  WHERE Quantity = 10);
```


# SQL SELECT INTO Statement

## The SQL SELECT INTO Statement

The `SELECT INTO` statement copies data from one table into a new table.

### SELECT INTO Syntax

Copy all columns into a new table:

```
SELECT *  
INTO _newtable_ [IN _externaldb_]  
FROM _oldtable  
_WHERE _condition_;
```

Copy only some columns into a new table:

```
SELECT _column1_, _column2_, _column3_, ...  
INTO _newtable_ [IN _externaldb_]  
FROM _oldtable  
_WHERE _condition;_
```

The new table will be created with the column-names and types as defined in the old table. You can create new column names using the `AS` clause.

## SQL SELECT INTO Examples

The following SQL statement creates a backup copy of Customers:

```
SELECT * INTO CustomersBackup2017  
FROM Customers;
```

The following SQL statement uses the `IN` clause to copy the table into a new table in another database:

```
SELECT * INTO CustomersBackup2017 IN 'Backup.mdb'  
FROM Customers;
```


The following SQL statement copies only a few columns into a new table:

```
SELECT CustomerName, ContactName INTO CustomersBackup2017  
FROM Customers;
```


The following SQL statement copies only the German customers into a new table:

```
SELECT * INTO CustomersGermany  
FROM Customers  
WHERE Country = 'Germany';
```


The following SQL statement copies data from more than one table into a new table:

```
SELECT Customers.CustomerName, Orders.OrderID  
INTO CustomersOrderBackup2017  
FROM Customers  
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
```


**Tip:** `SELECT INTO` can also be used to create a new, empty table using the schema of another. Just add a `WHERE` clause that causes the query to return no data:

```
SELECT * INTO _newtable_  
FROM _oldtable_  
WHERE 1 = 0;
```

# SQL INSERT INTO SELECT Statement

## The SQL INSERT INTO SELECT Statement

The `INSERT INTO SELECT` statement copies data from one table and inserts it into another table.

The `INSERT INTO SELECT` statement requires that the data types in source and target tables match.

**Note:** The existing records in the target table are unaffected.

### INSERT INTO SELECT Syntax

Copy all columns from one table to another table:

```
INSERT INTO _table2_  
SELECT * FROM _table1  
_WHERE _condition_;
```

Copy only some columns from one table into another table:

```
INSERT INTO _table2_ (_column1_, _column2_, _column3_, ...)  
SELECT _column1_, _column2_, _column3_, ...  
FROM _table1_  
WHERE _condition_;
```


## SQL INSERT INTO SELECT Examples

### Example

Copy "Suppliers" into "Customers" (the columns that are not filled with data, will contain NULL):

```
INSERT INTO Customers (CustomerName, City, Country)  
SELECT SupplierName, City, Country FROM Suppliers;
```

### Example

Copy "Suppliers" into "Customers" (fill all columns):

```
INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)  
SELECT SupplierName, ContactName, Address, City, PostalCode, Country FROM Suppliers;
```

### Example

Copy only the German suppliers into "Customers":

```
INSERT INTO Customers (CustomerName, City, Country)  
SELECT SupplierName, City, Country FROM Suppliers  
WHERE Country='Germany';
```

# SQL CASE Expression

## The SQL CASE Expression

The `CASE` expression goes through conditions and returns a value when the first condition is met (like an if-then-else statement). So, once a condition is true, it will stop reading and return the result. If no conditions are true, it returns the value in the `ELSE` clause.

If there is no `ELSE` part and no conditions are true, it returns NULL.

## CASE Syntax

```
CASE  
    WHEN _condition1_ THEN _result1_  
    WHEN _condition2_ THEN _result2_  
    WHEN _conditionN_ THEN _resultN_  
    ELSE _result_  
END;
```


## SQL CASE Examples

The following SQL goes through conditions and returns a value when the first condition is met:

```
SELECT OrderID, Quantity,  
CASE  
    WHEN Quantity > 30 THEN 'The quantity is greater than 30'  
    WHEN Quantity = 30 THEN 'The quantity is 30'  
    ELSE 'The quantity is under 30'  
END AS QuantityText  
FROM OrderDetails;
```


The following SQL will order the customers by City. However, if City is NULL, then order by Country:

### Example

```
SELECT CustomerName, City, Country  
FROM Customers  
ORDER BY  
(CASE  
    WHEN City IS NULL THEN Country  
    ELSE City  
END);
```

# SQL NULL Functions

## SQL IFNULL(), ISNULL(), COALESCE(), and NVL() Functions

Suppose that the "UnitsOnOrder" column is optional, and may contain NULL values.

Look at the following SELECT statement:

```
SELECT ProductName, UnitPrice * (UnitsInStock + UnitsOnOrder)  
FROM Products;
```


In the example above, if any of the "UnitsOnOrder" values are NULL, the result will be NULL.

## Solutions

**MySQL**

The MySQL `[IFNULL()] function lets you return an alternative value if an expression is NULL:



# SQL Stored Procedures for SQL Server

## What is a Stored Procedure?

A stored procedure is a prepared SQL code that you can save, so the code can be reused over and over again.

So if you have an SQL query that you write over and over again, save it as a stored procedure, and then just call it to execute it.

You can also pass parameters to a stored procedure, so that the stored procedure can act based on the parameter value(s) that is passed.

### Stored Procedure Syntax

```
CREATE PROCEDURE _procedure_name_  
AS  
_sql_statement_  
GO;
```

### Execute a Stored Procedure

```
EXEC _procedure_name_;
```

## Stored Procedure Example

The following SQL statement creates a stored procedure named "SelectAllCustomers" that selects all records from the "Customers" table:

### Example

```
CREATE PROCEDURE SelectAllCustomers  
AS  
SELECT * FROM Customers  
GO;
```

Execute the stored procedure above as follows:

### Example

```
EXEC SelectAllCustomers;
```

## Stored Procedure With One Parameter

The following SQL statement creates a stored procedure that selects Customers from a particular City from the "Customers" table:

### Example

```
CREATE PROCEDURE SelectAllCustomers @City nvarchar(30)  
AS  
SELECT * FROM Customers WHERE City = @City  
GO;
```

Execute the stored procedure above as follows:
### Example

```
EXEC SelectAllCustomers @City = 'London';
```


## Stored Procedure With Multiple Parameters

Setting up multiple parameters is very easy. Just list each parameter and the data type separated by a comma as shown below.

The following SQL statement creates a stored procedure that selects Customers from a particular City with a particular PostalCode from the "Customers" table:

### Example

```
CREATE PROCEDURE SelectAllCustomers @City nvarchar(30), @PostalCode nvarchar(10)  
AS  
SELECT * FROM Customers WHERE City = @City AND PostalCode = @PostalCode  
GO;
```

Execute the stored procedure above as follows:

### Example

```
EXEC SelectAllCustomers @City = 'London', @PostalCode = 'WA1 1DP';
```


# SQL Comments

## SQL Comments

Comments are used to explain sections of SQL statements, or to prevent execution of SQL statements.

**Note: Comments are not supported in Microsoft Access databases!**

## Single Line Comments

Single line comments start with `--`.

Any text between -- and the end of the line will be ignored (will not be executed).

The following example uses a single-line comment as an explanation:

### Example

```
-- Select all:  
SELECT * FROM Customers;
```

The following example uses a single-line comment to ignore the end of a line:

### Example

```
SELECT * FROM Customers -- WHERE City='Berlin';
```

The following example uses a single-line comment to ignore a statement:

### Example

```
-- SELECT * FROM Customers;  
SELECT * FROM Products;
```



## Multi-line Comments

Multi-line comments start with `/*` and end with `*/`.

Any text between /* and */ will be ignored.

The following example uses a multi-line comment as an explanation:

### Example

```
/*Select all the columns  
of all the records  
in the Customers table:*/  
SELECT * FROM Customers;
```

The following example uses a multi-line comment to ignore many statements:

### Example

```
/*SELECT * FROM Customers;  
SELECT * FROM Products;  
SELECT * FROM Orders;  
SELECT * FROM Categories;*/  
SELECT * FROM Suppliers;
```

To ignore just a part of a statement, also use the /* */ comment.

The following example uses a comment to ignore part of a line:

### Example

```
SELECT CustomerName, /*City,*/ Country FROM Customers;
```

The following example uses a comment to ignore part of a statement:

### Example

```
SELECT * FROM Customers WHERE (CustomerName LIKE 'L%'  
OR CustomerName LIKE 'R%' /*OR CustomerName LIKE 'S%'  
OR CustomerName LIKE 'T%'*/ OR CustomerName LIKE 'W%')  
AND Country='USA'  
ORDER BY CustomerName;
```

