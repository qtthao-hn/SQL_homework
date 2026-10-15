-- Bai 1
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    city VARCHAR(255)
);

-- Bai 2
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);

-- Bai 3
SELECT 
    customers.customer_id, 
    customers.name,
    orders.order_id,
    orders.order_date
    
    FROM customers
    LEFT JOIN orders
    ON customers.customer_id = orders.customer_id;

-- Bai 4
SELECT 
    orders.order_id,
    orders.order_date,
    customers.name

    FROM orders
    LEFT JOIN customers
    ON orders.customer_id = customers.customer_id;

-- Bai 5
SELECT 
    customers.name,
    orders.order_id

    FROM customers
    LEFT JOIN orders
    ON customers.customer_id = orders.customer_id
    WHERE orders.order_id IS NULL;

