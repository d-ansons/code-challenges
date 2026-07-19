/*
Write a solution to find the people who have the most friends and the most friends number.

The test cases are generated so that only one person has the most friends.
*/


-- Original - Overkill
WITH requester AS (
    SELECT
        requester_id,
        COUNT(accepter_id) AS accepted_count
    FROM RequestAccepted
    GROUP BY requester_id
),
accepter AS (
    SELECT
        accepter_id,
        COUNT(requester_id) AS requester_count
    FROM RequestAccepted
    GROUP BY accepter_id
),
unioned AS (
    SELECT
        requester_id AS id,
        accepted_count AS num
    FROM requester
    UNION ALL
    SELECT
        accepter_id AS id,
        requester_count AS num
    FROM accepter
)
SELECT
    id AS id,
    SUM(num) AS num
FROM unioned
GROUP BY id
ORDER BY num DESC
LIMIT 1
;

-- Better
SELECT
    id,
    COUNT(*) AS num
FROM (
    SELECT requester_id AS id
    FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id
    FROM RequestAccepted
)
GROUP BY id
ORDER BY num DESC
LIMIT 1
;

-- Revist, what if tie exists?