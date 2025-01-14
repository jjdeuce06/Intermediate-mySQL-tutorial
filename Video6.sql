-- Window Functions

-- Have worked with GROUP BY statements
SELECT gender, AVG(salary) as avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender;

-- Looking at average salary over
-- OVER(PARTITION BY variable) (first window function looked at)
SELECT gender, AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
; -- Gives exact same number in additional rows

-- Sometimes need more information, which will not work with the group by statement
SELECT dem.first_name, dem.last_name, gender, AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;


-- Look at the sum of the salary rather than average
-- Rolling total with ORDER BY 
SELECT dem.first_name, dem.last_name, gender, SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS Rollling_Total
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

-- Window function advantages
-- ROW_NUMBER(), RANK (DENSE RANK has no duplicates)
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS drank_num
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;