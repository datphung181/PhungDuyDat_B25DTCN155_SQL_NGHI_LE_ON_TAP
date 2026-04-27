USE nghi_le_on_tap;

SELECT SUM(od.total_price) AS total_revenue
FROM order_details od
JOIN orders o ON od.order_id = o.id
WHERE o.status = 'completed';

SELECT 
	category, 
	COUNT(*) total_products, 
    ROUND(AVG(price), 2) avg_price
FROM products
GROUP BY category;

SELECT 
    c.full_name,
    SUM(od.total_price) AS total_spent
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_details od ON o.id = od.order_id
WHERE o.status = 'completed'
GROUP BY c.id, c.full_name
HAVING SUM(od.total_price) > 50000; -- do khách hàng của em không có ai tiêu đến 500k nên em để 50k thôi ạ

SELECT * FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
);
