
USE world;
show tables;

SELECT * 
	FROM country;

SELECT * 
	FROM city;
SELECT * 
	FROM country;
SELECT * 
	FROM countrylanguage;
	
SELECT region, COUNT(Name) as num_countries
	FROM country
	GROUP BY region
	ORDER BY num_countries ASC; 
	
SELECT region, SUM(population) as population 
	FROM country
	GROUP by region
	ORDER BY population DESC;
	
SELECT continent, SUM(population) as population 
	FROM country 
	GROUP BY continent 
	ORDER BY population DESC;
	
SELECT AVG(LifeExpectancy)
	FROM country;
	
SELECT continent, AVG(LifeExpectancy) as life_expectancy
	FROM country
	GROUP BY continent
	ORDER BY life_expectancy ASC;
	
SELECT region, AVG(LifeExpectancy) as life_expectancy
	FROM country
	GROUP BY region
	ORDER BY life_expectancy ASC;
	
SELECT Name, LocalName
	FROM country 
		WHERE Name != LocalName;

SELECT COUNT(*) 
	FROM country
		WHERE LifeExpectancy < 70;
		
SELECT district
	FROM city 
		WHERE city = 'New York';

#Sakila Database

use sakila;
show tables;

SELECT * 
	FROM actor;
SELECT *
	FROM actor_info;
SELECT *
	FROM film_actor;
SELECT *
	FROM country;
SELECT * 
	FROM address;
SELECT * 
	FROM staff;
SELECT * 
	FROM film_list;
SELECT *
	FROM film_actor;
SELECT * 
	FROM film;
SELECT * 
	FROM inventory;
SELECT * 
	FROM customer;
SELECT * 
	FROM customer_list;
SELECT * 
	FROM store;
SELECT * 
	FROM language;
SELECT * 
	FROM payment;
DESCRIBE payment;
SELECT *
	FROM rental;
SELECT *
	FROM film_text;
SELECT * 
	FROM sales_by_store;
SELECT * 
	FROM category;
DESCRIBE category;

#1	
SELECT lower(CONCAT(first_name, ' ', last_name))
	FROM actor;

#3
SELECT *
	FROM actor 
		WHERE last_name LIKE '%gen%';
		
#4 
SELECT * 
	FROM actor
		WHERE last_name LIKE '%li%'
		ORDER BY last_name, first_name;
		
#5 
SELECT country_id, country
	FROM country
		WHERE country IN ('Afghanistan', 'Bangladesh', 'China');
		
#6 
SELECT DISTINCT last_name as last_name, COUNT(last_name) as count
	FROM actor
	GROUP BY last_name
	ORDER BY count DESC;
	
#7
SELECT DISTINCT last_name, COUNT(last_name) as count
	FROM actor
	GROUP BY last_name
	HAVING count > 1
	ORDER BY count DESC;
	
#8 
SELECT title, COUNT(actor_id) as number_of_actors
	FROM film 
	JOIN film_actor 
		ON film.film_id = film_actor.film_id
	GROUP BY film.film_id
	ORDER BY number_of_actors DESC;
	
SELECT COUNT(film_id) as copies_in_inventory
	FROM inventory 
	WHERE film_id = 439;
	
SELECT title 
	FROM film 
		WHERE title LIKE "K%" 
		OR title LIKE "Q%";

SELECT CONCAT(first_name, ' ', last_name)
	FROM actor 
		WHERE actor_id IN (
			SELECT actor_id 
			FROM film_actor 
			WHERE film_id IN 
				(
				SELECT film_id 
				FROM film 
				WHERE title = 'ALONE TRIP'
				)
		);

SELECT CONCAT(first_name, ' ', last_name) as name, email
	FROM customer 
	WHERE customer_id IN (
		SELECT customer_id 
		FROM customer_list 
		WHERE country = 'Canada'
	)
	ORDER By name;
	
SELECT title
	FROM film_list
		WHERE category = 'Family';
		
		
#1A
SELECT *
	FROM actor;
#1B
SELECT last_name
	FROM actor;

#2A 
SELECT DISTINCT last_name 
	FROM actor;
	
#2B
SELECT DISTINCT postal_code
	FROM address;

#2C
SELECT DISTINCT rating
	FROM film;
	
#3A
SELECT title, description, rating, length
	FROM film 
	WHERE length >= 180;
	
#3B
SELECT payment_id, amount, payment_date 
	FROM payment 
	WHERE payment_date >= 2005-05-27;
	
#3c 

#3d 
SELECT * 
	FROM customer 
		WHERE last_name LIKE '%S'
			AND first_name LIKE '%N';
			
#3e
SELECT *
	FROM customer 
		WHERE active = 0
		OR last_name LIKE 'M%';
		
#3f 
SELECT * 
	FROM category 
	WHERE category_id > 4 
	AND (name LIKE 'C%'
		or name LIKE 'S%'
		or name LIKE 'T%');

#3g 
SELECT staff_id, first_name, last_name, address_id, picture, email, store_id, active, username, last_update 
	FROM staff 
	WHERE password IS NOT NULL;	

#3h 
SELECT staff_id, first_name, last_name, address_id, picture, email, store_id, active, username, last_update 
	FROM staff 
	WHERE password IS NULL;	

#4a
SELECT phone, district
	FROM address 
	WHERE district IN ('California', 'England', 'Taipei', 'West Java');

#4b
SELECT payment_id, amount, payment_date 
	FROM payment 
	WHERE substring(payment_date, 1, 10) IN ('2005-05-25', '2005-05-27', '2005-05-29');

#4c 
SELECT * 
	FROM film
	WHERE rating IN ('G', 'PG-13', 'NC-17');
	
#5a 
SELECT * 
	FROM payment
	WHERE payment_date BETWEEN '2005-05-25 12:00:00' AND '2005-05-26 11:59:59';
	