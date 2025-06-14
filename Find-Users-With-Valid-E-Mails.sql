# Write your MySQL query statement below
SELECT *
FROM Users
WHERE REGEXP_LIKE( mail,'^[A-Za-z][[A-Za-z][0-9][_.-]]*@leetcode\\.com$','c')