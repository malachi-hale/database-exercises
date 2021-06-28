use employees; 
SELECT CONCAT(first_name, " ", last_name) as full_name
	FROM employees 
	WHERE (last_name LIKE 'E%') AND (last_name LIKE '%E');
	
SELECT upper(CONCAT(first_name, " ", last_name)) as full_name
	FROM employees 
	WHERE (last_name LIKE 'E%') AND (last_name LIKE '%E');
	
SELECT first_name, last_name,  datediff(CURDATE(), hire_date) as days_working_at_company
	FROM employees 
	WHERE (hire_date LIKE '199%') AND (birth_date LIKE '%12-25');
	
SELECT MIN(salary) as smallest_salary, MAX(salary) as largest_salary
	FROM salaries;
	
SELECT lower(CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), "_", SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2))) as username, first_name, last_name, birth_date
	FROM employees;