/*
Write a solution to report the customer ids from the Customer table that bought all the products in the Product table.

Return the result table in any order.
*/

# Write your MySQL query statement below
WITH customer_orders AS (
    SELECT
        c.customer_id AS customer_id,
        COUNT(DISTINCT p.product_key) AS product_count
    FROM Customer c
    LEFT JOIN Product p
        ON c.product_key = p.product_key
    GROUP BY c.customer_id
)
SELECT
    customer_id
FROM customer_orders
WHERE product_count = (
    SELECT COUNT(DISTINCT product_key)
    FROM Product
)
;

# Write your MySQL query statement below
SELECT
    customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(product_key) FROM Product)