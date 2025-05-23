-- Write your PostgreSQL query statement below
SELECT e1.employee_id, e1.name, COUNT(e2.employee_id) as reports_count, ROUND(AVG(e2.age),0) as average_age
FROM employees e1
JOIN employees e2 ON
e1.employee_id = e2.reports_to
GROUP BY 1,2
ORDER BY 1;