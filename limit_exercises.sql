USE employees;

SELECT DISTINCT last_name 
FROM employees
ORDER BY last_name DESC
LIMIT 10;

SELECT * 
FROM employees 
WHERE (hire_date LIKE '199%') AND (birth_date LIKE '%12-25')
ORDER BY hire_date
LIMIT 5;
#Alselm Cappello, Utz Mandell, Bouchung Schreiter, Baocai Kushner, Petter Stroustrup.

SELECT * 
FROM employees 
WHERE (hire_date LIKE '199%') AND (birth_date LIKE '%12-25')
ORDER BY hire_date
LIMIT 5 OFFSET 50;
#Christophe Baca, Moie Birsak, Chikako Ibel, Shounak Jansen, Zhigen Boissier
#OFFSET divided by LIMIT is page number. 