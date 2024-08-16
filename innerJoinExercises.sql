--INNER JOIN PRACTICE


--Problem 1; Write a query to fetch the first name, last name of customers, and the titles of the movies they have rented.
--SELECT first_name, last_name, title FROM customer
--INNER JOIN rental ON customer.customer_id = rental.customer_id
--INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
--INNER JOIN film ON inventory.film_id = film.film_id
--ORDER BY last_name


--Problem 2; Write a query to fetch the title of the movie and the names of all the actors that played in that movie.
--SELECT first_name, last_name, title FROM actor
--INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
--INNER JOIN film ON film_actor.film_id = film.film_id


--Problem 3; Write a query to fetch the store ID, the title of the movie, and the inventory ID of each movie available in that store.
--SELECT store_id, inventory_id, title FROM inventory
--INNER JOIN film ON inventory.film_id = film.film_id


--Problem 4; Write a query to calculate the total amount spent by each customer. List the customer’s first name, last name, and the total amount they have spent.
--SELECT first_name, last_name, SUM(amount) from customer
--INNER JOIN payment ON payment.customer_id = customer.customer_id
--GROUP BY customer.customer_id, customer.first_name, customer.last_name
--ORDER BY SUM(amount) DESC


--Problem 5; Write a query to list the films rented by customers from the city "Aurora." Include the customer's first name, last name, and the title of the rented film.
--NEED; film title, city, first name, last name
--customer.address_id (firstname, lastname) -> address.address, address.city_id -> city.city_id(city)
--customer.store_id -> inventory.store_id, inventory.film_id -> film.film_id

SELECT first_name, last_name, city, title FROM customer
INNER JOIN address ON customer.address_id = address.address_id
INNER JOIN city ON address.city_id = city.city_id
INNER JOIN rental ON customer.customer_id = rental.customer_id
INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
INNER JOIN film ON inventory.film_id = film.film_id
WHERE city.city = 'Aurora'