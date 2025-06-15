-- Write your PostgreSQL query statement below
WITH RankedSalaries AS (
  SELECT DISTINCT salary,
         DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
  FROM Employee
)
SELECT 
  (SELECT salary FROM RankedSalaries WHERE rnk = 2) AS SecondHighestSalary;
