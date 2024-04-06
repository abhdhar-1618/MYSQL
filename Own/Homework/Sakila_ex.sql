show tables;

DESCRIBE actor;

SELECT COUNT(*) AS row_count
FROM actor;

SELECT customer.customer_id, CONCAT(customer.first_name, ' ', customer.last_name) AS customer_name, COUNT(rental.rental_id) AS rental_count
FROM customer
INNER JOIN rental ON customer.customer_id = rental.customer_id
GROUP BY customer.customer_id
ORDER BY rental_count DESC
LIMIT 10;


SELECT * FROM actor;
SELECT * FROM actor_info;
SELECT * FROM address;
SELECT * FROM category;
SELECT * FROM city;
SELECT * FROM country;
SELECT * FROM customer;
SELECT * FROM customer_list;
SELECT * FROM film;
SELECT * FROM film_actor;
SELECT * FROM film_category;
SELECT * FROM film_list;
SELECT * FROM film_text;
SELECT * FROM inventory;
SELECT * FROM language;
SELECT * FROM nicer_but_slower_film_list;
SELECT * FROM payment;
SELECT * FROM rental;
SELECT * FROM sales_by_film_category;
SELECT * FROM sales_by_store;
SELECT * FROM staff;
SELECT * FROM staff_list;
SELECT * FROM store;


SELECT DISTINCT * 
FROM film
LEFT JOIN inventory ON film.film_id = inventory.film_id
LIMIT 5;

SELECT DISTINCT * 
FROM film
RIGHT JOIN inventory ON film.film_id = inventory.film_id
LIMIT 5;


SELECT * 
FROM film
LEFT JOIN inventory ON film.film_id = inventory.film_id
WHERE inventory.film_id IS NULL OR film.film_id IS NULL;

SELECT table_name, table_rows
FROM information_schema.tables
WHERE table_schema = 'employees';

SELECT * FROM titles;
SELECT * FROM salaries;
SELECT * FROM employees;
SELECT * FROM dept_manager;
SELECT * FROM dept_emp_latest_date;
SELECT * FROM dept_emp;
SELECT * FROM departments;
SELECT * FROM current_dept_emp;





















