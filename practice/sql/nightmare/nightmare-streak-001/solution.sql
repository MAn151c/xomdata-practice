-- Xom Data · Customers active and purchasing 3 weeks in a row
-- Problem: https://xomdata.com/practice/nightmare-streak-001
-- Solved: 2026-07-02

WITH purchase_weeks AS (
    SELECT DISTINCT 
        user_id, 
        strftime('%Y-%W', event_date) AS week_str,
        (CAST(strftime('%Y', event_date) AS INTEGER) * 53 + CAST(strftime('%W', event_date) AS INTEGER)) AS week_idx
    FROM events
    WHERE subtype = 'purchase'
),
grouped AS (
    SELECT 
        user_id,
        week_str,
        week_idx - ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY week_idx) AS grp
    FROM purchase_weeks
)
SELECT 
    user_id,
    MIN(week_str) AS streak_start_week,
    MAX(week_str) AS streak_end_week,
    COUNT(*) AS n_weeks
FROM grouped
GROUP BY user_id, grp
HAVING COUNT(*) >= 3
ORDER BY user_id, streak_start_week;
