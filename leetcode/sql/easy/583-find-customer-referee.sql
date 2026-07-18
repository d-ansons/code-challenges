/*
Find the names of the customer that are either:

referred by any customer with id != 2.
not referred by any customer.
Return the result table in any order.
*/


-- Write your PostgreSQL query statement below
SELECT
    name
FROM Customer
WHERE referee_id IS NULL
    OR referee_id != 2
;