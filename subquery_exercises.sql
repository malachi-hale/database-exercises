USE employees;
show tables;
describe titles;
describe dept_emp_latest_date;
describe dept_manager;
describe salaries;

#1
SELECT * 
	FROM employees 
		WHERE employees.hire_date IN (
			SELECT hire_date 
			FROM employees
				WHERE emp_no IN (
					SELECT emp_no 
					FROM dept_emp
					WHERE emp_no = 101010
						AND dept_emp.to_date >= NOW()
				)
		);
		
#2 
SELECT title
	FROM titles
		WHERE titles.emp_no IN (
			SELECT emp_no 
			FROM dept_emp
				WHERE dept_emp.to_date >= NOW()
				AND emp_no IN (
					SELECT emp_no 
					FROM employees
					WHERE first_name ='Aamod'
				)
			)
		GROUP BY title;
			
#3
SELECT COUNT(*)
	FROM employees 
		WHERE emp_no IN (
			SELECT emp_no
			FROM dept_emp_latest_date
				WHERE to_date < NOW()
		);			
#59,900 employees are no longer working for the company. 

#4
SELECT first_name, last_name
	FROM employees 
		WHERE emp_no IN (
			SELECT emp_no
			FROM dept_manager 
				WHERE to_date >= NOW()
			)	
			AND gender = 'F';	
# Isamu Legleitner, Karsten Sigstam, Leon DasSarma, and Hilary Kambil.

#$
SELECT * 
	FROM employees 
		WHERE emp_no IN (
			SELECT emp_no 
			FROM salaries
				WHERE emp_no IN (
					SELECT emp_no
						FROM dept_emp
						WHERE dept_emp.to_date >= NOW()
						)
				AND salary > (SELECT AVG(salary) FROM salaries)
				);
				
#6 
SELECT COUNT(salary)
	FROM salaries
		WHERE salaries.to_date >= NOW()
			AND salary >= (SELECT MAX(salary) FROM salaries WHERE salaries.to_date >= NOW()) - (SELECT STD(salary) FROM salaries WHERE salaries.to_date >= NOW()) ;
#83 current salaries are within 1 standard deviation of the current highest salaries. 
	