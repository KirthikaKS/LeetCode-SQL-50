# Write your MySQL query statement below
/*
WITH CTE AS (SELECT student,
                CASE WHEN id % 2 = 1 AND id+1 <= (SELECT MAX(id) FROM Seat) THEN id+1
                WHEN id % 2 = 0 THEN id-1
                ELSE id
                END AS new_id
             FROM Seat)


SELECT a.id, b.student
FROM Seat a
JOIN CTE b ON a.id = b.new_id
ORDER BY 1
*/

SELECT IF(id < (SELECT MAX(id) FROM Seat),(IF(id % 2 = 1, id+1, id-1)),IF(id % 2 = 0, id-1,id)) as id, 
       student
FROM Seat
ORDER BY id