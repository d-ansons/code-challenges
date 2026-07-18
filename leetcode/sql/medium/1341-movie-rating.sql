/*
Write a solution to:

Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.
*/


-- Write your PostgreSQL query statement below
WITH user_rating AS (
    SELECT
        u.name AS user_name,
        COUNT(mr.movie_id) AS total_ratings
    FROM Users u
    INNER JOIN MovieRating mr
        ON u.user_id = mr.user_id
    GROUP BY u.name
    ORDER BY total_ratings DESC, u.name ASC
    LIMIT 1
),
movie_rating AS (
    SELECT
        m.title AS movie_title,
        AVG(mr.rating) AS avg_rating
    FROM movies m
    INNER JOIN MovieRating mr
        ON m.movie_id = mr.movie_id
    WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY m.title
    ORDER BY avg_rating DESC, m.title ASC
    LIMIT 1
)
SELECT 
    user_name AS results
FROM user_rating

UNION ALL

SELECT movie_title AS results
FROM movie_rating
;