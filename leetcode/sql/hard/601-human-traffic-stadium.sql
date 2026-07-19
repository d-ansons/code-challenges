/*
Write a solution to display the records with three or more rows with consecutive id's, and the number of people is greater than or equal to 100 for each.

Return the result table ordered by visit_date in ascending order.
*/


-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        *,
        id - ROW_NUMBER() OVER () AS id_diff
    FROM stadium
    WHERE people >= 100
)
SELECT 
    id,
    visit_date,
    people
FROM CTE
WHERE id_diff IN (
    SELECT
        id_diff
    FROM cte
    GROUP BY id_diff
    HAVING COUNT(*) > 2
)
ORDER BY visit_date
;