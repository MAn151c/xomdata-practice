-- Xom Data · Customers who ever bought skincare
-- Problem: https://xomdata.com/practice/easy-join-006
-- Solved: 2026-10-28

-- Write your SQL here
SELECT DISTINCT(customer_name)
FROM customers
JOIN purchases ON customers.id = purchases.customer_id
WHERE category = 'Skincare'
