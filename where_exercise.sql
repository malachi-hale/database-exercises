USE employees;

SELECT *
	FROM employees 
	WHERE first_name IN ('Irena', 'Vidya', 'Maya');
#709 records returned. 
	
SELECT * 
	FROM employees 
	WHERE first_name = 'Irena'
	OR first_name = 'Vidya'
	OR first_name = 'Maya';
#709 records returned. 	
	
SELECT * 
	FROM employees
	WHERE (first_name = 'Irena'
		OR first_name = 'Vidya'
		OR first_name = 'Maya')
		AND gender = 'M';
#441 records returned.

SELECT * 
	FROM employees 
	WHERE last_name LIKE 'E%';
#7330 records.

SELECT * 
	FROM employees 
	WHERE (last_name LIKE 'E%') OR (last_name LIKE '%E');	
#30723 employees have names that either start or end with East

SELECT * 
	FROM employees 
	WHERE (last_name NOT LIKE 'E%') AND (last_name LIKE '%E');
#23393 employees have names that end with E, but do not start with E.

SELECT * 
	FROM employees 
	WHERE (last_name LIKE 'E%') AND (last_name LIKE '%E');
#899 employees have a last name that starts and end with E

SELECT * 
	FROM employees
	WHERE last_name LIKE '%E';
#24292 employees have a last name that ends with E.

SELECT * 
	FROM employees 
	WHERE hire_date LIKE '199%';
#135214 employees were hired in the 90s.

SELECT * 
	FROM employees 
	WHERE birth_date LIKE '%12-25';
#842 employees were born on Christmas. 

SELECT * 
	FROM employees 
	WHERE (hire_date LIKE '199%') AND (birth_date LIKE '%12-25');
#362 employees were hired in the 90s and born on Christmas. 

SELECT * 
	FROM employees
	WHERE last_name LIKE '%q%';
#1873 employees have a 'q' in their last name.


SELECT * 
	FROM employees
	WHERE (last_name LIKE '%q%') AND (last_name NOT LIKE '%qu%');
#547 employees have a q but not qu in their name. 