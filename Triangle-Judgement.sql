-- Write your PostgreSQL query statement below
-- sum of two sides is equal to or greater than third side

SELECT x,y,z,
       CASE WHEN (x+y)> z AND (y+z)> x AND (z+x)> y THEN 'Yes'
       ELSE 'No'
       END AS triangle
FROM Triangle