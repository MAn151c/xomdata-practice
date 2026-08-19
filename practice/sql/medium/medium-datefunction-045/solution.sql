-- Xom Data · Transaction count and amount by month
-- Problem: https://xomdata.com/practice/medium-datefunction-045
-- Solved: 2026-08-19

SELECT
  strftime('%Y-%m', transaction_date) AS month,
  COUNT(transaction_date) AS transaction_count,
  SUM(amount) AS total_amount,
  SUM(amount) - LAG(SUM(amount)) OVER (
    ORDER BY
      strftime('%Y-%m', transaction_date)
  ) AS mom_delta
FROM
  transactions
GROUP BY
  month
ORDER BY
  month ASC;
