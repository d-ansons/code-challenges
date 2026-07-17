/*
Write a solution to find all dates' id with higher temperatures compared to its previous dates (yesterday).

Return the result table in any order.
*/



-- Write your PostgreSQL query statement below
SELECT
    w.id AS id
FROM Weather w
LEFT JOIN Weather w2
    ON w.recordDate = w2.recordDate + INTERVAL '1 day'
WHERE w.temperature > w2.temperature
;