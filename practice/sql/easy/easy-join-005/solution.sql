-- Xom Data · Ticket statuses guests can read
-- Problem: https://xomdata.com/practice/easy-join-005
-- Solved: 2026-10-28

-- Write your SQL here
SELECT ticket_code,
       status_name
FROM statuses
JOIN tickets ON statuses.code = tickets.status_code
