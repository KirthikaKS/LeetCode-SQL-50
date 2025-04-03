-- Write your PostgreSQL query statement below
SELECT employee_id
FROM employees
WHERE manager_id is not null and employee_id NOT IN (SELECT e1.employee_id
                                                     FROM employees e1
                                                     JOIN employees e2 on e1.manager_id = e2.employee_id)
AND salary < 30000
ORDER BY employee_id ;