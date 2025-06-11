-- Write your PostgreSQL query statement below
WITH CTE AS (SELECT *, SUM(weight) OVER(ORDER BY turn) as total_weight
             FROM Queue)

SELECT person_name
FROM CTE
WHERE total_weight <= 1000 
ORDER BY turn DESC LIMIT 1