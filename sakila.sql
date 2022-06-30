-- Question 1
USE sakila;
SELECT first_name, last_name FROM actor;

-- Question 2
SELECT last_name FROM actor WHERE first_name = 'john';

-- Question 3
SELECT * FROM actor WHERE last_name = 'neeson';

-- Question 4
SELECT * FROM actor WHERE actor_id LIKE '%0';

-- Question 5
SELECT description FROM film WHERE film_id = 100;

-- Question 6
SELECT * FROM film WHERE rating = 'r';

-- Question 7
SELECT * FROM film WHERE rating NOT IN ('R');

-- Question 8
SELECT * FROM film ORDER BY length LIMIT 10;

-- Question 9
SELECT title FROM film WHERE length=(
    SELECT max(length)
    FROM film
);

-- QUESTION 10
SELECT * FROM film WHERE special_features LIKE '%deleted scenes%';

-- Question 11
SELECT last_name FROM actor GROUP BY last_name HAVING COUNT(*) = 1 ORDER BY last_name DESC;

-- Question 12
SELECT last_name, COUNT(last_name) FROM actor GROUP BY last_name HAVING COUNT(*)>1 ORDER BY COUNT(last_name) DESC;

-- Question 13
SELECT a.first_name, a.last_name, COUNT(f.film_id) FROM actor a
  INNER JOIN film_actor f on a.actor_id = f.actor_id
 GROUP BY f.actor_id ORDER BY COUNT(f.film_id) DESC; 
 
 -- Question 14
SELECT "academy dinosaur", DATE_ADD(r.rental_date, INTERVAL f.rental_duration DAY) AS due_date  FROM film f 
 INNER JOIN inventory i ON f.film_id = i.film_id
 INNER JOIN rental r ON i.inventory_id = r.inventory_id
WHERE f.title = "academy dinosaur" AND r.return_date IS NULL;

-- Question 15
SELECT AVG(length) FROM film;

-- Question 16
SELECT c.name, AVG(f.length) FROM film f
 INNER JOIN film_category fc ON f.film_id = fc.film_id
 INNER JOIN category c ON fc.category_id = c.category_id
GROUP BY fc.category_id ORDER BY AVG(f.length);
 
 -- Question 17
 SELECT * FROM film_text WHERE description LIKE "%robot%";
 
 -- Question 18
 SELECT COUNT(film_id) FROM film WHERE release_year = 2010;
 
-- Question 19
SELECT f.title, c.name FROM film f
 INNER JOIN film_category fc ON f.film_id = fc.film_id
 INNER JOIN category c ON fc.category_id = c.category_id 
WHERE c.name = "horror";
 
 -- Question 20
 SELECT name FROM staff_list WHERE id = 2 ;
 
 -- Question 21
 SELECT f.title, a.actor_id FROM film f
  INNER JOIN film_actor fa ON f.film_id = fa.film_id
  INNER JOIN actor a ON fa.actor_id = a.actor_id
WHERE a.first_name = "fred" AND a.last_name = "costner";

-- Question 22
SELECT DISTINCT COUNT(country) FROM country;

-- Question 23
SELECT name FROM language ORDER BY name DESC;

-- Question 24
SELECT first_name, last_name FROM actor GROUP BY first_name HAVING last_name LIKE "%son" ORDER BY first_name;

-- Question 25
SELECT c.name, COUNT(fc.category_id) FROM film_category fc
 INNER JOIN category c ON c.category_id = fc.category_id
GROUP BY c.name ORDER BY COUNT(fc.category_id) DESC; 