CREATE DATABASE payment_method;

USE payment_method;

CREATE TABLE xyz (
    customer_id INT PRIMARY KEY,
    customer VARCHAR(100),
    mode VARCHAR(40),
    city VARCHAR(100)
);

INSERT INTO xyz (customer_id, customer, mode, city) VALUES
(101, "olivia", "netbanking", "portland"),
(102, "ethan", "credit card", "miami"),
(103, "maya", "credit card", "seattle"),
(104, "liam", "netbanking", "denver"),
(105, "sophia", "credit card", "new orleans"),
(106, "caleb", "debit card", "minneapolis"),
(107, "ava", "debit card", "phoenix"),
(108, "lucas", "netbanking", "boston"),
(109, "isabella", "netbanking", "nashville"),
(110, "jackson", "credit card", "boston");

SELECT mode, COUNT(customer)
FROM xyz
GROUP BY mode;