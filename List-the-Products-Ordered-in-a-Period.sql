-- Write your PostgreSQL query statement below
--- join, group by month year and sum the units

SELECT product_name, SUM(unit) as unit
FROM Products p
JOIN Orders o ON p.product_id = o.product_id 
WHERE order_date BETWEEN '2020-02-01' AND '2020-02-29' 
GROUP BY 1
HAVING SUM(unit) >= 100