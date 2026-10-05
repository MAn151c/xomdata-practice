-- Xom Data · Line totals from the price list
-- Problem: https://xomdata.com/practice/easy-join-003
-- Solved: 2026-10-05

-- Write your SQL here
SELECT product_name, quantity, price * quantity AS line_total
FROM products
 JOIN sale_items
ON products.id = sale_items.product_id
