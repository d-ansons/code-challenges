/*
Write a solution to report the sum of all total investment values in 2016 tiv_2016, for all policyholders who:

have the same tiv_2015 value as one or more other policyholders, and
are not located in the same city as any other policyholder (i.e., the (lat, lon) attribute pairs must be unique).
Round tiv_2016 to two decimal places.
*/

-- Write your PostgreSQL query statement below
SELECT
    ROUND(SUM(tiv_2016)::DECIMAL, 2) AS tiv_2016
FROM Insurance
WHERE (lat, lon) NOT IN (
    SELECT
        lat,
        lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) > 1
) AND tiv_2015 IN (
    SELECT
        tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(tiv_2015) > 1
)
