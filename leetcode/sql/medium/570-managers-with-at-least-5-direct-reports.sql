/*
Write a solution to find managers with at least five direct reports.

Return the result table in any order.
*/

-- Write your PostgreSQL query statement below
WITH managers AS (
    SELECT
        e.id AS manager_id,
        e.name AS manager_name,
        COUNT(e2.id) AS employee_count
    FROM Employee e
    INNER JOIN Employee e2
        ON e.id = e2.managerId
    GROUP BY manager_name, manager_id
)
SELECT
    manager_name AS name
FROM managers
WHERE employee_count >= 5
;
