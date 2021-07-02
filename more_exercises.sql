USE world;
show tables;

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