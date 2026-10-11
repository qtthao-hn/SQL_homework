CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255) UNIQUE,
  city VARCHAR(255)
);
