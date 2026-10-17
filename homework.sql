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

-- Bai 6:
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(255),
    price INT
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,

    FOREIGN KEY (order_id)
    REFERENCES orders(order_id),
    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);

SELECT
    products.product_id,
    products.product_name,
    -- in ra total_quantity hoac 0
    COALESCE(SUM(order_items.quantity), 0)

    FROM products
    LEFT JOIN order_items
    ON products.product_id = order_items.product_id
    -- select id va name -> group by can co id va name
    GROUP BY products.product_name, products.product_id;

-- Bai 7
SELECT 
    orders.order_id,
    orders.order_date,
    customers.name

    FROM orders
    JOIN customers
    ON orders.customer_id = customers.customer_id
    WHERE MONTH(order_date) = MONTH(NOW());

-- Bai 8
SELECT 
    order_items.order_id,
    SUM(products.price * order_items.quantity) AS total_amount

    FROM order_items
    JOIN products
    ON order_items.product_id = products.product_id
    GROUP BY order_items.order_id;

-- Bai 9
SELECT 
    orders.order_id,
    orders.order_date,
    customers.name,
    SUM(order_items.quantity * products.price) AS total_amount

    FROM customers
    JOIN orders ON customers.customer_id = orders.customer_id
    JOIN order_items ON orders.order_id = order_items.order_id
    JOIN products ON order_items.product_id = products.product_id

    GROUP BY orders.order_id, orders.order_date, customers.name;

-- Bai 10
SELECT 
    customers.name,
    SUM(order_items.quantity * products.price) AS total_spend

    FROM customers
    JOIN orders ON customers.customer_id = orders.customer_id
    JOIN order_items ON orders.order_id = order_items.order_id
    JOIN products ON order_items.product_id = products.product_id

    GROUP BY customers.name

    -- DESC = descending
    ORDER BY total_spend DESC
    -- Chi in ra dong dau tien
    LIMIT 1;
