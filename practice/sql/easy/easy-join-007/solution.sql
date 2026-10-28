-- Xom Data · Deal count per client
-- Problem: https://xomdata.com/practice/easy-join-007
-- Solved: 2026-10-28

-- Write your SQL here
SELECT client_name, COUNT(client_id) AS num_deals 
FROM clients
JOIN deals ON clients.id = deals.client_id
GROUP BY client_name
ORDER BY COUNT(client_id) DESC, client_name ASC
