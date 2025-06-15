# Write your MySQL query statement below
WITH title_table AS (SELECT DISTINCT m.movie_id, m.title as title,
                     AVG(mt.rating) OVER(PARTITION BY m.title) AS avg_rating
                     FROM Movies m
                     JOIN MovieRating mt ON m.movie_id = mt.movie_id
                     WHERE mt.created_at >= '2020-02-01' AND mt.created_at <= '2020-02-29'
                     ORDER BY avg_rating DESC, m.title ASC
                     LIMIT 1),


 name_table AS (SELECT DISTINCT u.user_id, u.name as name,
                      COUNT(mt.movie_id) OVER(PARTITION BY mt.user_id) as cnt
                      FROM Users u
                      JOIN MovieRating mt ON u.user_id = mt.user_id
                      ORDER BY cnt DESC, name ASC
                      LIMIT 1)

SELECT name as results
FROM name_table
UNION ALL
SELECT title as results
FROM title_table
                    
                     