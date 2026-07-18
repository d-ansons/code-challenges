/*
Write a solution to find the customer_number for the customer who has placed the largest number of orders.

The test cases are generated so that exactly one customer will have placed more orders than any other customer.
*/

-- Write your PostgreSQL query statement below
WITH orders AS (
    SELECT
        customer_number,
        COUNT(order_number) AS num_orders
    FROM Orders
    GROUP BY customer_number
),
ranked AS (
    SELECT
        customer_number,
        num_orders,
        RANK() OVER (ORDER BY num_orders DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS rank
    FROM orders
)
SELECT
    customer_number
FROM ranked
WHERE rank = 1
;
