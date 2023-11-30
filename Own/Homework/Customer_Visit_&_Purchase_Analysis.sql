
-- For question, check from 00:40 minute
-- Creating customer_orders table

CREATE TABLE customer_orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    order_amount INT
);

SELECT * FROM customer_orders

-- Entering records into customer_orders table
INSERT INTO customer_orders (order_id, customer_id, order_date, order_amount) VALUES
    (1, 100, '2023-01-01', 2000),
    (2, 200, '2023-01-01', 2500),
    (3, 300, '2023-01-01', 2100),
    (4, 100, '2023-01-02', 2000),
    (5, 400, '2023-01-02', 2200),
    (6, 500, '2023-01-02', 2700),
    (7, 100, '2023-01-03', 3000),
    (8, 400, '2023-01-03', 1000),
    (9, 600, '2023-01-03', 3000);
    
    
SELECT * FROM customer_orders

-- find out first visit date of each customer

SELECT customer_id,MIN(order_date) as First_Visit_Date
FROM customer_orders
GROUP BY customer_id

/*This query retrieves the earliest visit date (First_Visit_Date) 
for each customer from the customer_orders table. The results are grouped by customer_id. 
In other words, it identifies the first order date for each customer, 
providing a summary of when each customer first visited and made a purchase.*/


-- to add a new column with the first visit date for each customer
WITH First_Visit AS (
SELECT customer_id,MIN(order_date) as First_Visit_Date
FROM customer_orders
GROUP BY customer_id)

SELECT co.*,fv.First_Visit_Date FROM customer_orders co
INNER JOIN First_Visit fv ON co.customer_id = fv.customer_id
ORDER BY order_id

/* This query utilizes a CTE named First_Visit to find the earliest visit date for each customer. 
The main query then selects all columns from the customer_orders table along with 
the First_Visit_Date for each order, joining the results based on the customer_id. 
The final result set is ordered by order_id. Essentially, it provides a detailed list of customer orders 
with their corresponding first visit dates. */

-- adding columns to indicate whether the customer has visited for the first time or is it a repeat visit

WITH First_Visit AS (
SELECT customer_id,MIN(order_date) as First_Visit_Date
FROM customer_orders
GROUP BY customer_id)

SELECT co.*,fv.First_Visit_Date
, CASE WHEN co.order_date=fv.First_Visit_Date THEN 1 ELSE 0 END AS First_Visit_Flag
, CASE WHEN co.order_date!=fv.First_Visit_Date THEN 1 ELSE 0 END AS Repeat_Visit_Flag
FROM customer_orders co
INNER JOIN First_Visit fv ON co.customer_id = fv.customer_id
ORDER BY order_id

/* This query utilizes a CTE to find the earliest visit date for each customer 
and then joins the results with the main customer_orders table. 
It includes flags (First_Visit_Flag and Repeat_Visit_Flag) to identify orders 
that correspond to the first visit or repeat visits. The final result set is ordered by order_id. 
Essentially, it provides a detailed list of customer orders with additional flags indicating the nature of each order.*/




-- Finding out number of new customers and repeat customers on a specific date

WITH First_Visit AS (
SELECT customer_id,MIN(order_date) as First_Visit_Date
FROM customer_orders
GROUP BY customer_id)
 , Visit_Flag AS
(SELECT co.*,fv.First_Visit_Date
, CASE WHEN co.order_date=fv.First_Visit_Date THEN 1 ELSE 0 END AS First_Visit_Flag
, CASE WHEN co.order_date!=fv.First_Visit_Date THEN 1 ELSE 0 END AS Repeat_Visit_Flag
FROM customer_orders co
INNER JOIN First_Visit fv ON co.customer_id = fv.customer_id
)
SELECT order_date , SUM(First_Visit_Flag) AS No_of_New_Customers,SUM(Repeat_Visit_Flag) AS No_of_Repeat_Customers
FROM Visit_Flag
GROUP BY order_date

/*This query uses two CTEs to calculate the first visit date for each customer 
and then applies flags to identify new and repeat visits. The main query summarizes 
the number of new and repeat customers for each order date, providing insights into 
customer behavior over time. */

--  2nd variation of Finding out number of new customers and repeat customers on a specific date

WITH First_Visit AS (
SELECT customer_id,MIN(order_date) as First_Visit_Date
FROM customer_orders
GROUP BY customer_id)
SELECT co.order_date
, SUM(CASE WHEN co.order_date=fv.First_Visit_Date THEN 1 ELSE 0 END) AS First_Visit_Flag
, SUM(CASE WHEN co.order_date!=fv.First_Visit_Date THEN 1 ELSE 0 END) AS Repeat_Visit_Flag
FROM customer_orders co
INNER JOIN First_Visit fv ON co.customer_id=fv.customer_id
GROUP BY co.order_date
;

/* This query utilizes a CTE to find the earliest visit date for each customer 
and then joins the results with the main customer_orders table. 
It calculates the number of first visits and repeat visits for each order date, 
providing insights into customer behavior over time. */
