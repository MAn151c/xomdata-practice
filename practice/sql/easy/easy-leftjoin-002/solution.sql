-- Xom Data · Total spend per member
-- Problem: https://xomdata.com/practice/easy-leftjoin-002
-- Solved: 2026-10-16

-- Write your SQL here
SELECT m.member_name,
COALESCE(SUM(b.amount),0) AS total_spent
FROM members m
LEFT JOIN bills b
ON m.id = b.member_id
GROUP BY m.id, m.member_name 
ORDER BY member_name ASC
