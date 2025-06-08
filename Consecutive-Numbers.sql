-- Write your PostgreSQL query statement below
SELECT DISTINCT a.num AS ConsecutiveNums
FROM logs a
JOIN logs b on a.id = b.id + 1 AND a.num = b.num
JOIN logs c on a.id = c.id + 2 AND a.num = c.num