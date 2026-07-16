WITH ranks AS (
    SELECT
        DENSE_RANK() OVER (PARTITION BY d.id ORDER BY e.salary DESC) AS salary_rank,
        d.name AS Department,
        e.name AS Employee,
        e.salary AS Salary
    FROM Employee e
    INNER JOIN Department d
        ON e.departmentId = d.id
)
SELECT
    Department,
    Employee,
    Salary
FROM ranks
WHERE salary_rank <= 3
;


-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        d.name AS Department,
        e.name AS Employee,
        e.salary AS Salary,
        DENSE_RANK() OVER (PARTITION BY d.name ORDER BY e.salary DESC) AS salary_rank
    FROM Employee e
    INNER JOIN Department d
        ON e.departmentId = d.id
)
SELECT
    Department,
    Employee,
    Salary
FROM cte
WHERE salary_rank <= 3
;
