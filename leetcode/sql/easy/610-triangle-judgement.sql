/*
Report for every three line segments whether they can form a triangle.

Return the result table in any order.
*/

-- Write your PostgreSQL query statement below
SELECT
    x,
    y,
    z,
    CASE 
        WHEN x + y > z AND x + z > y AND y + z > x THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM Triangle
;

-- Write your MySQL query statement below
SELECT
    x,
    y,
    z,
    IF(x + y > z AND x + z > y AND y + z > x, 'Yes', 'No') AS triangle
FROM Triangle
;