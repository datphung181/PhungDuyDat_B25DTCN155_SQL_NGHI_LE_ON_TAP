-- TRUY VẤN THEO YÊU CẦU 
-- do danh sách sản phẩm của em không có mục nước giải khát nên em sẽ lấy mục mỹ phẩm để thay thế
SELECT * FROM products
WHERE category = 'Cosmetic'
	AND price BETWEEN 10000 AND 50000
    AND stock > 0;

SELECT * FROM customers 
WHERE full_name LIKE 'Nguyen%' 
	OR address LIKE '%Ha Noi%';
    
SELECT * FROM orders
ORDER BY order_date DESC;


SELECT c.full_name, o.order_date, p.product_name, od.quantity, p.price 
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_details od ON o.id = od.order_id
JOIN products p ON od.product_id = p.id;


SELECT * FROM customers c
WHERE NOT EXISTS (
    SELECT * FROM orders o
    WHERE o.customer_id = c.id
);
