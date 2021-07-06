#1
USE employees;


CREATE TEMPORARY TABLE germain_1458.employees_with_departments AS
SELECT first_name, last_name, dept_name
FROM employees
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
WHERE dept_emp.to_date >= NOW()
LIMIT 100;

USE germain_1458;
SELECT * FROM employees_with_departments;


#1a 
ALTER TABLE employees_with_departments ADD full_name VARCHAR(200);

#1b
UPDATE germain_1458.employees_with_departments 
SET full_name=CONCAT(first_name, " ", last_name);

USE germain_1458;
SELECT * FROM employees_with_departments;

#1c

ALTER TABLE employees_with_departments DROP COLUMN first_name;
ALTER TABLE employees_with_departments DROP COLUMN last_name;

USE germain_1458;
SELECT * FROM employees_with_departments;

#1d We could have ended up with this same table by initial selecting like this.

USE employees;

CREATE TEMPORARY TABLE germain_1458.employees_with_departments0 AS
SELECT CONCAT(first_name, " ", last_name) as full_name, dept_name
FROM employees
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
WHERE dept_emp.to_date >= NOW()
LIMIT 100;

USE germain_1458;
SELECT * FROM employees_with_departments0;

#2 

USE sakila;
SHOW TABLES;

SELECT * 
FROM payment;

CREATE TEMPORARY TABLE germain_1458.temp_payment AS
SELECT *
FROM payment;

USE germain_1458;
SELECT * FROM temp_payment;

ALTER TABLE temp_payment ADD amount_int INT;

UPDATE temp_payment SET amount_int = CAST(amount*100 AS UNSIGNED);

SELECT * FROM temp_payment;

#3
USE employees;

CREATE TEMPORARY TABLE germain_1458.zscore8 AS 
	SELECT dept_name, AVG(salary) as z_score
	FROM salaries 
	JOIN dept_emp
	ON salaries.emp_no=dept_emp.emp_no
	JOIN departments 
	ON departments.dept_no = dept_emp.dept_no 	 
	WHERE 
		dept_emp.to_date >= NOW()
		AND salaries.to_date >= NOW()
	GROUP BY dept_name
	ORDER BY z_score;
	
USE germain_1458;
UPDATE zscore8 SET z_score = z_score - (SELECT AVG(salary) FROM employees.salaries);
UPDATE zscore8 SET z_score = z_score / ( SELECT STD(salary) FROM employees.salaries);
SELECT * FROM zscore8;

#Sales has the highest Z-score at 1.4814. Human Resources has the lowest Z-Score at 0.0066.