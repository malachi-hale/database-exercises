
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
	

