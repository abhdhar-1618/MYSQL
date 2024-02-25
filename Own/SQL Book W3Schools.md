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









