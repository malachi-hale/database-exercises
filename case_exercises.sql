USE employees;
SHOW TABLES;
DESCRIBE employees;
DESCRIBE dept_emp;
DESCRIBE current_dept_emp;
DESCRIBE dept_emp_latest_date;
SELECT * 
	FROM dept_manager;

SELECT 
	emp_no,
	MAX(to_date) AS max_date
FROM dept_emp
GROUP BY emp_no;

#1pm's
SELECT 
	dept_emp.emp_no, dept_no, from_date, to_date,
	IF(to_date > NOW(), true, false) as current_employee
FROM dept_emp 
	JOIN (SELECT emp_no, MAX(to_date) as max_date
	FROM dept_emp 
	GROUP BY emp_no) as last_dept
	ON dept_emp.emp_no = last_dept.emp_no 
	AND dept_emp.to_date = last_dept.max_date;

#2
SELECT CONCAT(first_name, ' ', last_name) as employee_name,
	CASE 
		WHEN substring(last_name, 1, 1) >= 'a' and substring(last_name, 1, 1) <= 'h' THEN 'A-H'
		WHEN substring(last_name, 1, 1) >= 'i' and substring(last_name, 1, 1) <= 'q' THEN 'I-Q'
  		  WHEN substring(last_name, 1, 1) >= 'r' and substring(last_name, 1, 1) <= 'z' THEN 'R-Z'
  		  ELSE 'other'
		END AS alpha_group
	FROM employees;

#3	
SELECT CONCAT(substring(birth_date, 1, 3), "0's") as decade, COUNT(*) as number_born_in_this_decade
FROM employees
GROUP BY decade;

#Bonus
SELECT 
	CASE 
		WHEN dept_name IN ('Customer Service') THEN 'Customer Service'
		WHEN dept_name IN ('Finance', 'Human Resources') THEN 'Finance & HR'
		WHEN dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'
		WHEN dept_name IN ('Research', 'Development') THEN 'R&D'
		WHEN dept_name IN ('Sales', 'Marketing') THEN 'Sales and Marketing'
		END as dept_group,
	AVG(salary) as Average_Salary_for_the_Department
	FROM salaries 
	JOIN dept_emp ON dept_emp.emp_no = salaries.emp_no
	JOIN departments ON departments.dept_no = dept_emp.dept_no 
	WHERE salaries.to_date >= NOW()
	GROUP BY dept_group
	ORDER BY Average_Salary_for_the_Department DESC;