-- Question 1)a)  Find the top 5 customers by total spend in the last 30 days


SELECT u.username, SUM(o.total_amount) AS total_spent
FROM orders o
JOIN users u ON o.user_id = u.user_id
WHERE o.order_date >= CURRENT_DATE - INTERVAL '30 days'
GROUP BY u.user_id, u.username
ORDER BY total_spent DESC
LIMIT 5;

-- Question 1)b)  Find Most purchased product till date.

SELECT p.product_name, SUM(oi.quantity) AS total_quantity_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity_sold DESC
LIMIT 1;

