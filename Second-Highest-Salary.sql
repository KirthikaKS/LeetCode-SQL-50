# Write your MySQL query statement below
/*WITH CTE AS (SELECT *,
             DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk
             FROM Employee)

SELECT CASE WHEN c.rnk = 2 THEN c.salary
            WHEN COUNT(DISTINCT c.id) = 1 THEN null
       END AS SecondHighestSalary
FROM CTE c
WHERE c.rnk = 2 */


/*WITH RankedSalaries AS (
  SELECT DISTINCT salary,
         DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
  FROM Employee
)
SELECT 
  (SELECT salary FROM RankedSalaries WHERE rnk = 2) AS SecondHighestSalary;*/


SELECT (SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        LIMIT 1 OFFSET 1 ) AS SecondHighestSalary ;
