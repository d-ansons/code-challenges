/*
Write a solution to find the nth highest distinct salary from the Employee table. If there are less than n distinct salaries, return null.

The result format is in the following example.
*/
CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
  RETURN QUERY (
    -- Write your PostgreSQL query statement below.
    SELECT 
        LEAD(NthHighestSalary, N-1) OVER (ORDER BY NthHighestSalary DESC) AS NthHighestSalary
        FROM (
        SELECT DISTINCT 
            e.salary AS NthHighestSalary
        FROM Employee e
        ORDER BY e.salary DESC
    )
    LIMIT 1
  );
END;
$$ LANGUAGE plpgsql;