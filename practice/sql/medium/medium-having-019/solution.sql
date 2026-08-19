-- Xom Data · High-rated sellers with many orders
-- Problem: https://xomdata.com/practice/medium-having-019
-- Solved: 2026-08-19

WITH
  rs AS (
    SELECT
      s.reputation_score,
      s.store_name,
      COUNT(o.id) AS order_count
    FROM
      sellers s
      LEFT JOIN orders o ON s.id = o.seller_id
    WHERE
      reputation_score >= 4.5
    GROUP BY
      s.id,
      s.store_name,
      s.reputation_score
    HAVING
      COUNT(o.id) >= 3
  )
SELECT
  store_name,
  reputation_score,
  order_count,
  DENSE_RANK() OVER (
    ORDER BY
      order_count DESC
  ) AS rank_by_orders,
  SUM(order_count) OVER (
    ORDER BY
      order_count DESC,store_name ASC
  ) AS cumulative_orders
FROM
  rs
ORDER BY
  rank_by_orders ASC,
  store_name ASC
