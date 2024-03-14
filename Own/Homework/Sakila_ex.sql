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


SELECT * 
FROM film
LEFT JOIN inventory ON film.film_id = inventory.film_id;

SELECT * 
FROM film
RIGHT JOIN inventory ON film.film_id = inventory.film_id;


SELECT * 
FROM film
LEFT JOIN inventory ON film.film_id = inventory.film_id
WHERE inventory.film_id IS NULL OR film.film_id IS NULL;






















