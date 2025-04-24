-- Write your PostgreSQL query statement below
--- group by cust_id, sort by order date, assign the immediate / scheduled, immediate count/count of dist cust_id

WITH CTE AS (SELECT *,
             RANK() OVER (PARTITION BY customer_id ORDER BY order_date) as rnk,
             CASE WHEN order_date = customer_pref_delivery_date THEN 'immediate'
             ELSE 'scheduled'
             END AS category
             FROM Delivery)

SELECT ROUND(((COUNT(*)*100.00)/(SELECT COUNT(*) FROM CTE WHERE rnk = '1')),2) as immediate_percentage
FROM CTE
WHERE rnk = '1' AND category = 'immediate'
