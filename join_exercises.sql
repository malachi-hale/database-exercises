USE join_example_db;

SELECT users.name AS user_name, roles.name AS role_name 
FROM users 
JOIN roles ON users.role_id = roles.id;

SELECT users.name AS user_name, roles.name AS role_name 
FROM users 
RIGHT JOIN roles ON users.role_id = roles.id;

SELECT users.name AS user_name, roles.name AS role_name
FROM roles
LEFT JOIN users ON users.role_id = roles.id;

SELECT roles.name, COUNT(*) as number_of_users
FROM roles
RIGHT JOIN users ON roles.id=users.role_id
GROUP BY roles.name;

USE employees;

SELECT departments.dept_name as Department_Name, CONCAT(employees.first_name, ' ', employees.last_name) as Department_Manager
	FROM employees 
		JOIN dept_manager 
  			ON dept_manager.emp_no = employees.emp_no
		JOIN departments 
  			ON departments.dept_no = dept_manager.dept_no
	WHERE to_date >= NOW();

SELECT departments.dept_name as Department_Name, CONCAT(employees.first_name, ' ', employees.last_name) as Manger_Name
	FROM employees 
		JOIN dept_manager 
  			ON dept_manager.emp_no = employees.emp_no
		JOIN departments 
  			ON departments.dept_no = dept_manager.dept_no
	WHERE to_date >= NOW();
		AND gender = 'F';
		
SELECT title as Title, COUNT(*) as COUNT
FROM titles
JOIN dept_emp 
  ON titles.emp_no = dept_emp.emp_no
JOIN departments 
	ON dept_emp.dept_no = departments.dept_no
WHERE titles.to_date >= NOW() 
	AND dept_emp.to_date >= NOW()
	AND dept_name = 'Customer Service'
GROUP BY titles.title
ORDER BY title;


SELECT dept_name as Department_Name, CONCAT(first_name, ' ', last_name) as Name, salary as Salary 
FROM departments 
JOIN dept_emp 
	ON departments.dept_no = dept_emp.dept_no
JOIN employees 
	ON dept_emp.emp_no = employees.emp_no
JOIN salaries 
	ON employees.emp_no = salaries.emp_no
JOIN dept_manager
	ON salaries.emp_no = dept_manager.emp_no
WHERE salaries.to_date >= NOW()
	AND dept_manager.to_date >= NOW()
ORDER BY dept_name;

SELECT departments.dept_no, dept_name, COUNT(*) as num_employees
FROM departments
	JOIN dept_emp
		ON departments.dept_no = dept_emp.dept_no
	JOIN employees 
		ON dept_emp.emp_no = employees.emp_no
	WHERE dept_emp.to_date >= NOW()
	GROUP BY dept_no
	ORDER BY dept_no;
	
SELECT departments.dept_name, AVG(salary) as average_salary
	FROM departments 
		JOIN dept_emp
			ON departments.dept_no = dept_emp.dept_no
		JOIN salaries 
			ON dept_emp.emp_no = salaries.emp_no
		WHERE dept_emp.to_date >= NOW() 
		AND salaries.to_date >= NOW()
		GROUP BY dept_name
		ORDER BY average_salary DESC
		LIMIT 1;
		
SELECT employees.first_name, employees.last_name
	FROM departments
	JOIN dept_emp 
		ON departments.dept_no = dept_emp.dept_no
	JOIN employees
		ON employees.emp_no = dept_emp.emp_no
	JOIN salaries
		ON employees.emp_no = salaries.emp_no	

	WHERE dept_name = 'Marketing'
	    AND dept_emp.to_date >= NOW() 
		AND salaries.to_date >= NOW()
	ORDER BY salary DESC
	LIMIT 1;
	
SELECT first_name, last_name, salary, dept_name
	FROM dept_manager	
		JOIN employees
			ON dept_manager.emp_no = employees.emp_no 
		JOIN dept_emp
			ON employees.emp_no = dept_emp.emp_no
	 	JOIN salaries
			ON dept_emp.emp_no = salaries.emp_no
		JOIN departments
			ON dept_manager.dept_no = departments.dept_no
			WHERE dept_emp.to_date >= NOW() 
				AND salaries.to_date >= NOW()
			AND dept_manager.to_date >= NOW()	
				ORDER BY salary DESC
		LIMIT 1;
		
SELECT CONCAT(e.first_name, ' ', e.last_name) as Employee_Name, dept_name as Department_Name, CONCAT(e0.first_name, ' ', e0.last_name) as Manager_name
	FROM employees as e
		JOIN dept_emp as de
			ON  de.emp_no = e.emp_no
		JOIN departments as d 
			ON d.dept_no = de.dept_no
		JOIN dept_manager as dm
		JOIN employees as e0
			ON e0.emp_no = dm.emp_no;

SELECT departments.dept_name, MAX(salaries.Salary)
	FROM departments
		JOIN dept_emp 
			ON departments.dept_no = dept_emp.emp_no
		RIGHT JOIN employees
			ON dept_emp.emp_no = employees.emp_no 
		JOIN salaries 
			ON salaries.emp_no = employees.emp_no
		GROUP BY departments.dept_no;