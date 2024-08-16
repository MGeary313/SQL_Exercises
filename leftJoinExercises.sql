-- LEFT JOIN EXERCISES

--Problem 1: Write a SQL query to list all customers along with the details of their last rental. 
--If a customer has not made any rentals, they should still be included in the list with NULL values for the rental details.

--SELECT DISTINCT ON (customer.customer_id) customer.customer_id, customer.first_name, customer.last_name, customer.email, film.title FROM customer
--LEFT OUTER JOIN rental ON customer.customer_id = rental.customer_id
--LEFT OUTER JOIN inventory ON rental.inventory_id = inventory.inventory_id
--LEFT OUTER JOIN film ON inventory.film_id = film.film_id
--ORDER BY customer.customer_id, rental.rental_date DESC, customer.first_name;



--Problem 2: Write a SQL query to find the most popular film categories based on the total number of rentals. 
--List the top 5 categories along with the number of rentals in each category.

--SELECT category.name, COUNT(rental.rental_id) AS total_rentals FROM category
--JOIN film_category ON category.category_id = film_category.category_id
--JOIN film ON film_category.film_id = film.film_id
--JOIN inventory ON film.film_id = inventory.film_id
--LEFT OUTER JOIN rental ON inventory.inventory_id = rental.inventory_id
--GROUP BY category.name
--ORDER BY total_rentals DESC
--LIMIT 5;


--Problem 3; Write a SQL query to find the top 10 customers who have spent the most money on rentals. 
--Include the customer’s name, email, and the total amount they’ve spent.

--SELECT customer.customer_id, customer.first_name, customer.last_name, customer.email, SUM(film.rental_rate) FROM customer
--LEFT OUTER JOIN rental ON rental.customer_id = customer.customer_id
--LEFT OUTER JOIN inventory ON rental.inventory_id = inventory.inventory_id
--LEFT OUTER JOIN film ON film.film_id = inventory.film_id
--GROUP BY customer.customer_id
--ORDER BY SUM(film.rental_rate) DESC
--LIMIT 10


--Problem 4; What are the emails of the customers who live in California?
--SELECT customer.email, address.district FROM customer
--LEFT OUTER JOIN address ON customer.address_id = address.address_id
--WHERE address.district = 'California'


--Problem 5; Get a list of all of the movies 'Nick Wahlberg' is in
SELECT film.title, actor.first_name, actor.last_name FROM actor
LEFT OUTER JOIN film_actor ON actor.actor_id = film_actor.actor_id
LEFT OUTER JOIN film ON film_actor.film_id = film.film_id
WHERE actor.first_name = 'Nick' AND actor.last_name = 'Wahlberg'
