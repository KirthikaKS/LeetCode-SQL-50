# Write your MySQL query statement below
WITH cte AS (SELECT *,
             DENSE_RANK() OVER(PARTITION BY product_id ORDER BY year) AS rnk
             FROM sales)

SELECT product_id, year as first_year, quantity, price
FROM cte
WHERE rnk = 1


