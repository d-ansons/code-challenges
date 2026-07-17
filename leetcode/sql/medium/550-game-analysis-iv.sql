/*
Write a solution to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. In other words, you need to determine the number of players who logged in on the day immediately following their initial login, and divide it by the number of total players.
*/
-- Write your PostgreSQL query statement below

-- 1st, get the first login date
-- 2nd, check if a date exists after the first login date

WITH first_day AS (
    SELECT
        player_id,
        MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
)
SELECT
    ROUND(COUNT(DISTINCT f.player_id)::decimal / COUNT(DISTINCT a.player_id)::decimal, 2) AS fraction
FROM Activity a
LEFT JOIN first_day f
    ON a.event_date = f.first_login + 1
    AND a.player_id = f.player_id
;