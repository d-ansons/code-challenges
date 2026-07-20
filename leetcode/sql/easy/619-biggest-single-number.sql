/*
A single number is a number that appeared only once in the MyNumbers table.

Find the largest single number. If there is no single number, report null.
*/


# Write your MySQL query statement below
SELECT
    MAX(num) AS num
FROM MyNumbers
WHERE num IN (
    SELECT
        *
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1
)