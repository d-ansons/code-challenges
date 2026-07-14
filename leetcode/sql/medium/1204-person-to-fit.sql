/*
There is a queue of people waiting to board a bus. However, the bus has a weight limit of 1000 kilograms, so there may be some people who cannot board.

Write a solution to find the person_name of the last person that can fit on the bus without exceeding the weight limit. The test cases are generated such that the first person does not exceed the weight limit.

Note that only one person can board the bus at any given turn.

The result format is in the following example.
*/

WITH passengers AS (
    SELECT
        person_name,
        SUM(weight) OVER ( ORDER BY turn ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
    FROM Queue
)
SELECT 
    person_name
FROM passengers
WHERE running_total <= 1000
ORDER BY running_total DESC
LIMIT 1
;