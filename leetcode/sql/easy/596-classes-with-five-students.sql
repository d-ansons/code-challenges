/*
Write a solution to find all the classes that have at least five students.

Return the result table in any order.
*/

-- Write your PostgreSQL query statement below
SELECT
    class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5
;