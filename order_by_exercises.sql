USE employees;

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;
#Irena Reutenauer is the first and the Vidya Simmmen is the last. 

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;
#Irena Acton is the first and Vidya Zweizig is the last. 

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;
#Irena Acton is the first and Maya Zyda is the last. 

SELECT * 
FROM employees 
WHERE (last_name LIKE '%E') AND (last_name LIKE 'E%')
ORDER BY emp_no;
#899 employees returned. Employee 10021 Ramzi Erde is the first employee. Employee 499648 Tadahiro Erde is the last employee.

SELECT * 
FROM employees 
WHERE (last_name LIKE '%E') AND (last_name LIKE 'E%')
ORDER BY hire_date DESC;
#899 employees returned. Teji Eldridge is the newest employee. Sergi Erde is the oldest employee. 

SELECT * 
FROM employees 
WHERE (hire_date LIKE '199%') AND (birth_date LIKE '%12-25')
ORDER BY birth_date ASC, hire_date DESC;
#Khun Bernini is the oldest employee who was hired last. Douadi Pettis is the youngest employee who was hired first. 