-- Write your PostgreSQL query statement below
SELECT product_id, year as first_year, quantity, price
FROM sales
WHERE (product_id, year) IN (SELECT product_id, min(year) 
                             FROM sales
                             GROUP BY product_id)