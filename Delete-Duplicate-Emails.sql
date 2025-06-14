# Write your MySQL query statement below
WITH CTE AS (SELECT email, MIN(id) as id
            FROM Person
            GROUP BY email)

DELETE 
FROM Person
WHERE id NOT IN (SELECT id
             FROM CTE)
