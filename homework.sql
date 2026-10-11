CREATE TABLE `customers` (
  `customer_id` interger PRIMARY KEY,
  `name` varchar(255),
  `email` varchar(255) UNIQUE,
  `city` varchar(255)
);
