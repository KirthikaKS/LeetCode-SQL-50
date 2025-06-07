# Write your MySQL query statement below
SELECT ROUND(COUNT(DISTINCT b.player_id)/COUNT(DISTINCT a.player_id),2) as fraction
FROM (SELECT player_id, MIN(event_date) as event_date
      FROM activity 
      GROUP BY player_id ) a
LEFT JOIN activity b on a.player_id = b.player_id AND a.event_date + INTERVAL 1 DAY = b.event_date
