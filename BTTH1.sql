CREATE DATABASE nghi_le_on_tap;
USE nghi_le_on_tap;

CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE,
    address VARCHAR(255),
    customer_type ENUM('Normal', 'VIP') DEFAULT 'Normal'
);

CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2) CHECK (price > 0),
    stock INT CHECK (stock >= 0)
);

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    status ENUM('completed', 'cancelled') DEFAULT 'completed',
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE order_details (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT CHECK (quantity > 0),
    total_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO customers (full_name, phone, address, customer_type) 
VALUES
('Nguyen Van A', '0901111111', 'Ha Noi', 'VIP'),
('Tran Thi B', '0902222222', 'Hai Phong', 'Normal'),
('Le Van C', '0903333333', 'Da Nang', 'VIP'),
('Pham Thi D', '0904444444', 'HCM', 'Normal'),
('Hoang Van E', '0905555555', 'Hue', 'Normal'),
('Vu Thi F', '0906666666', 'Ha Noi', 'Normal'), -- chưa mua
('Dang Van G', '0907777777', 'Ha Noi', 'Normal'); -- chưa mua

INSERT INTO products (product_name, category, price, stock) 
VALUES
('Milk', 'Food', 20000, 50),
('Bread', 'Food', 15000, 40),
('Apple', 'Food', 30000, 0), -- stock = 0 
('Shampoo', 'Cosmetic', 120000, 20),
('Soap', 'Cosmetic', 25000, 60),
('Toothpaste', 'Cosmetic', 35000, 30),
('Notebook', 'Stationery', 10000, 100),
('Pen', 'Stationery', 5000, 200),
('Pencil', 'Stationery', 3000, 150),
('Eraser', 'Stationery', 2000, 80);

INSERT INTO orders (customer_id, order_date, status) 
VALUES
(1, '2025-03-01', 'completed'),
(2, '2025-03-02', 'completed'),
(3, '2025-03-03', 'cancelled'),
(1, '2025-03-04', 'completed'),
(4, '2025-03-05', 'completed');

INSERT INTO order_details (order_id, product_id, quantity, total_price) 
VALUES
(1, 1, 2, 40000),
(1, 2, 1, 15000),
(2, 3, 1, 30000),
(2, 4, 1, 120000),
(3, 5, 2, 50000),
(3, 6, 1, 35000),
(4, 7, 5, 50000),
(4, 8, 2, 10000),
(4, 9, 1, 3000),
(5, 1, 3, 60000),
(5, 2, 2, 30000),
(5, 10, 1, 2000);

-- TRỪ 5 ĐƠN VỊ DO CÓ KHÁCH ĐÃ MUA MÃ HÀNG CÓ ID LÀ 1
UPDATE products
SET stock = stock - 5
WHERE id = 1 AND stock >= 5;

-- HIỂN THỊ 4 BẢNG 
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_details;
