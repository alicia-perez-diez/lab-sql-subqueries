-- Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.
SELECT COUNT(i.inventory_id) AS number_of_copies FROM sakila.inventory AS i
WHERE film_id IN (SELECT film_id
	FROM sakila.film
	WHERE title = "Hunchback Impossible"
);

-- List all films whose length is longer than the average length of all the films in the Sakila database.
SELECT f.title FROM sakila.film AS f
WHERE f.length > (SELECT AVG(f.length) FROM sakila.film AS f);

-- Use a subquery to display all actors who appear in the film "Alone Trip".
SELECT a.first_name AS name, a.last_name AS surname FROM sakila.actor AS a
WHERE actor_id IN (SELECT fa.actor_id AS actor_id
	FROM sakila.film_actor AS fa
	WHERE film_id IN (SELECT film_id
		FROM sakila.film
		WHERE title = "Alone Trip"
));

-- Sales have been lagging among young families, and you want to target family movies for a promotion. Identify all movies categorized as family films.
SELECT f.title AS title FROM sakila.film AS f
WHERE film_id IN (SELECT fc.film_id AS film_id
	FROM sakila.film_category AS fc
	WHERE category_id IN (SELECT c.category_id AS category_id
		FROM sakila.category AS c
		WHERE c.name = "Family"
));

-- Retrieve the name and email of customers from Canada using both subqueries and joins. To use joins, you will need to identify the relevant tables and their primary and foreign keys.
SELECT c.first_name AS name, c.email AS email
FROM sakila.customer AS c
JOIN sakila.address AS a
ON c.address_id = a.address_id 
JOIN sakila.city AS ci
ON a.city_id = ci.city_id
WHERE country_id IN (SELECT co.country_id AS country_id
	FROM sakila.country AS co
	WHERE co.country = "Canada")
    
