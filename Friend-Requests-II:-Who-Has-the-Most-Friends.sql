-- Write your PostgreSQL query statement below

SELECT id, count(*) as num
FROM (SELECT requester_id as id FROM RequestAccepted 
      UNION ALL
      SELECT accepter_id as id FROM RequestAccepted)
GROUP BY id
ORDER BY num DESC
LIMIT 1