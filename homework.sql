CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    city VARCHAR(255)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date TIMESTAMP,

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
)

SELECT 
    customers.customer_id, 
    customers.name,
    orders.order_id,
    orders.order_date
    
    FROM customers
    LEFT JOIN orders
    ON customers.customer_id = orders.customer_id;