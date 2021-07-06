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

SHOW TABLES;

SELECT * FROM salaries;
SELECT * FROM dept_emp;
SELECT * FROM departments;
