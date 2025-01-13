-- Joins

SELECT *
FROM employee_demographics
;


SELECT *
FROM employee_salary
;

SELECT dem.employee_id, age, occupation
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;
-- Outer joins
SELECT *
FROM employee_demographics AS dem
LEFT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

SELECT *
FROM employee_demographics AS dem
RIGHT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- Self Join

SELECT lsal.employee_id AS lsal_santa,
lsal.first_name AS first_name_santa,
lsal.last_name AS last_name_santa,
rsal.employee_id AS rsal_santa,
rsal.first_name AS first_name_santa,
rsal.last_name AS last_name_santa
FROM employee_salary AS lsal
JOIN employee_salary AS rsal
	ON lsal.employee_id + 1 = rsal.employee_id
    ;
    
-- Multiple table joins

SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments pd
	ON sal.dept_id = pd.department_id
;

SELECT *
FROM park_departments;