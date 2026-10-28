-- Xom Data · Today's showtimes in time order
-- Problem: https://xomdata.com/practice/easy-join-004
-- Solved: 2026-10-28

-- Write your SQL here
SELECT start_time,
       title,
       screen
FROM movies
JOIN showtimes ON movies.id = showtimes.movie_id
ORDER BY start_time ASC, title ASC
