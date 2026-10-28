-- Xom Data · Users who never took a ride
-- Problem: https://xomdata.com/practice/easy-leftjoin-001
-- Solved: 2026-10-28

-- Write your SQL here
SELECT user_name,joined_date
FROM users
LEFT JOIN rides ON users.id = rides.user_id
WHERE rides.id IS NULL
