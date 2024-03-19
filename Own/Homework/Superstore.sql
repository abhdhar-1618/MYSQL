/*
Source .csv files:-

D:\Main\My Practice and experiments\My Practice LAB\SQL\Medium Superstore data\superstore


*/
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

SELECT * FROM orders; -- to see the table

SELECT ROUND(SUM(Sales)) AS Total_Sales
FROM orders;

-- GROUPING STUFF

SELECT Segment,COUNT(*) AS total_segments
FROM orders
GROUP BY Segment;

SELECT Region,Segment,COUNT(*) AS total_orders,COUNT(DISTINCT Segment) AS segment_count
FROM orders
GROUP BY Region, Segment;

-- What is the total profit for all orders in the dataset?
-- also segment wise disctribution

SELECT Segment, round(SUM(Profit)) AS Total_Profit
FROM Orders
GROUP BY Segment;

-- How many distinct orders are in the dataset?

SELECT COUNT(DISTINCT`Order ID`) AS total_orders
FROM orders;

-- What is the average discount applied to orders?

SELECT ROUND(AVG(Discount),2) AS Average_Discount
FROM orders;

-- Which product category has the most orders?
-- alternative 1

SELECT Category, COUNT(Category) AS Category_Count
FROM orders
GROUP BY Category
ORDER BY Category_Count DESC
LIMIT 1;

-- alternative 2

SELECT category, COUNT(*) AS NumberOfOrders
FROM orders
GROUP BY Category
ORDER BY NumberOfOrders DESC
LIMIT 1;

-- What is the most profitable product?

-- Alternative 1

SELECT `Product Name`, ROUND(SUM(profit)) AS total_profit
FROM orders
GROUP BY `Product Name`
ORDER BY total_profit DESC;
-- LIMIT 1;

-- Alternative 2

SELECT `Product Name`, ROUND(SUM(profit)) AS TotalProfit
FROM orders
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- How many orders were returned, and what percentage of all orders does this represent?

SELECT ReturnedOrdersCount,TotalOrdersCount,
ROUND((ReturnedOrdersCount * 100.0) / TotalOrdersCount) AS PercentageReturnedOrders
FROM
    (SELECT COUNT(*) AS ReturnedOrdersCount FROM returns) AS ReturnedOrders,
    (SELECT COUNT(*) AS TotalOrdersCount FROM orders) AS TotalOrders;
    

-- Who are the top 5 customers based on their total spending?

SELECT `Customer Name`, ROUND(SUM(Sales)) AS Total_Sales
FROM orders
GROUP BY `Customer Name`
ORDER BY Total_Sales DESC
LIMIT 5;

-- What is the total sales revenue for each region?

SELECT Region, ROUND(SUM(Sales)) AS Revenue
FROM orders
GROUP BY Region
ORDER BY Revenue DESC;

-- How many orders were placed in each year?

-- all queries failed, data bad. check below for reference query

/*
SELECT EXTRACT(YEAR FROM orderdate) AS year, COUNT(*) AS NumberofOrders
FROM orders
GROUP BY year
ORDER BY year;
*/

-- What is the average discount for each product category?

SELECT Category, ROUND(AVG(Discount), 2) AS Average_Discount
FROM orders
GROUP BY Category;

-- How many returned orders are there for each product category?

SELECT orders.Category, COUNT(returns.`Order ID`) AS `Returned_orders_Count`
FROM orders
LEFT JOIN returns ON orders.`Order ID` = returns.`Order ID`
GROUP BY orders.Category
ORDER BY `Returned_orders_Count` DESC;


SELECT o.category, COUNT(r.`Order ID`) AS ReturnedOrdersCount
FROM orders o
JOIN returns r ON o.`Order ID` = r.`Order ID`
GROUP BY o.category;

-- Difference between LEFT JOIN and RIGHT JOIN

SELECT r.*, o.`Order ID`
FROM returns r
RIGHT JOIN orders o ON r.`Order ID` = o.`Order ID`;

SELECT r.*, o.`Order ID`
FROM returns r
LEFT JOIN orders o ON r.`Order ID` = o.`Order ID`;


-- Which customers have returned orders, and how many times?

-- my attempt
SELECT 
o.`Customer Name`,
COUNT(r.`Order ID`) AS order_count
FROM orders o
LEFT JOIN returns r ON o.`Order ID` = r.`Order ID`
GROUP BY `Customer Name`
HAVING COUNT(r.`ORDER ID`) > 0
ORDER BY `order_count` DESC;

-- answer 
SELECT o.`Customer Name`, COUNT(r.`Order ID`) AS ReturnCount
FROM orders o
LEFT JOIN returns r ON o.`Order ID` = r.`Order ID`
GROUP BY o.`Customer Name`
HAVING COUNT(r.`Order ID`) > 0
ORDER BY 2 DESC;

-- Identify customers who have made at least five purchases and calculate their average order value.

SELECT `Customer Name`, COUNT(*) AS TotalOrders, ROUND(AVG(Sales),2) AS AverageOrderValue
FROM orders
GROUP BY `Customer Name`
HAVING COUNT(*) >= 5
ORDER BY TotalOrders, AverageOrderValue DESC;


-- Product Category Ranking: Rank product categories by total sales in descending order using window functions.
SELECT Category,ROUND(SUM(Sales)) AS Total_Sales,
RANK() OVER (ORDER BY SUM(Sales) DESC) AS CategoryRank
FROM Orders
GROUP BY Category
ORDER BY Total_Sales DESC; 













 








    








































    
    






















