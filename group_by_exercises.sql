USE employees;

describe titles;

SELECT DISTINCT title
FROM titles;
#There have been 7 unique titles. 

SELECT last_name 
	FROM employees 
	WHERE (last_name LIKE 'E%') AND (last_name LIKE '%E')
	GROUP BY last_name;
	
SELECT CONCAT(first_name, ' ', last_name) as full_name
	FROM employees 
	WHERE (last_name LIKE 'E%') AND (last_name LIKE '%E')
	GROUP BY full_name; 	
	
SELECT last_name 
	FROM employees
	WHERE (last_name LIKE '%q%') AND (last_name NOT LIKE '%qu%')
	GROUP BY last_name;
#Chleq, Lindqvist, Qiwen

SELECT last_name, COUNT(last_name) 
	FROM employees
	WHERE (last_name LIKE '%q%') AND (last_name NOT LIKE '%qu%')
	GROUP BY last_name;


SELECT first_name, gender, COUNT(*)
	FROM employees 
	WHERE first_name IN ('Irena', 'Vidya', 'Maya')
    GROUP BY gender, first_name;


SELECT lower(CONCAT(SUBSTR(first_name, 1, 1), 
		SUBSTR(last_name, 1, 4), "_", 
		SUBSTR(birth_date, 6, 2), 
		SUBSTR(birth_date, 3, 2))) as username, COUNT(*) as number_of_times_used
	 FROM employees
	GROUP BY username
	HAVING COUNT(*)>1
	ORDER BY COUNT(*) DESC;
#13251 usernames are duplicates. 