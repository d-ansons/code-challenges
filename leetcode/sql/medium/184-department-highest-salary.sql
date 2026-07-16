/*
Write a solution to find employees who have the highest salary in each of the departments.

Return the result table in any order.
*/



-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        d.name AS Department,
        e.name AS Employee,
        e.salary AS Salary,
        MAX(e.salary) OVER ( PARTITION BY d.name ORDER BY e.salary DESC) AS HighestSalary
    FROM Employee e
    INNER JOIN Department d
        ON e.departmentId = d.id
)
SELECT
    Department,
    Employee,
    Salary
FROM cte
WHERE Salary = HighestSalary
;