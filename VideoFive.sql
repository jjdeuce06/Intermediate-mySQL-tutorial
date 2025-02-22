-- Subqueries

SELECT *
FROM employee_demographics
WHERE employee_id IN 
				  (SELECT employee_id
					FROM employee_salary
					WHERE dept_id = 1)
; -- Grabbing employees whose ID in demographics is in the salary


-- Compare employee salary to average salary
SELECT first_name, salary, 
(SELECT AVG(salary)
FROM employee_salary)
FROM employee_salary
GROUP BY first_name, salary;

-- Find average, max, min, and count of ages in demographics
SELECT gender, AVG(max_age)
FROM
(SELECT gender, AVG(age) AS avg_age, 
MAX(age) AS max_age, 
MIN(age) AS min_age, 
COUNT(age) as age_count
FROM employee_demographics
GROUP BY gender) AS Agg_table
GROUP BY gender;
