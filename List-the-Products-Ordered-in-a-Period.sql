# Write your MySQL query statement below
SELECT p.product_name, SUM(o.unit) as unit
FROM Products p
JOIN Orders o ON p.product_id = o.product_id 
WHERE o.order_date >= '2020-02-01' AND o.order_date <= '2020-02-29' 
GROUP BY p.product_name
HAVING SUM(o.unit) >= 100 ;