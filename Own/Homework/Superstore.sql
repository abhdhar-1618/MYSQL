show tables;

SELECT * FROM orders;

SELECT * FROM returns;

SELECT DISTINCT City, State, `Postal Code`, Segment
FROM orders
WHERE Segment = 'Consumer';

SELECT `Order ID`,`Customer Name`, count(`Order ID`) AS Order_ID_Count
FROM orders
GROUP BY `Order ID`
ORDER BY Order_ID_Count DESC;

SELECT * FROM orders;

SELECT * FROM orders
WHERE `Customer Name` = 'Seth Vernon';




SELECT  orders.`Order ID`,`Ship Mode`,`Customer Name`,`Product ID`FROM orders
LEFT JOIN returns
ON orders.`Order ID` = returns.`Order ID`
WHERE `Ship Mode` = 'Standard Class';


-- Checking for missing values.

SELECT * FROM orders
WHERE `Row ID` IS NULL OR `Order ID` IS NULL OR `Order Date` IS NULL OR `Customer Name` IS NULL;

-- Checking for duplicate Row.

SELECT * FROM Orders
WHERE (SELECT COUNT(*)
	   FROM Orders o
       WHERE o.`Order ID` = Orders.`Order ID`) > 1;
       


-- to check the total row count of each table
       
SELECT table_name, table_rows
FROM information_schema.tables
WHERE table_schema = 'superstore';

-- What is the total sales revenue for all orders in the dataset?

-- SELECT * FROM orders; -- to see the table

SELECT ROUND(SUM(Sales)) AS Total_Sales
FROM orders;










