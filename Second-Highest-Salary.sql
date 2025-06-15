# Write your MySQL query statement below
WITH CTE AS (SELECT *,
             DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk
             FROM Employee)

SELECT CASE WHEN c.rnk = 2 THEN c.salary
            WHEN COUNT(DISTINCT e.id) = 1 THEN null
       END AS SecondHighestSalary
FROM CTE c, Employee e
WHERE c.rnk = 2


