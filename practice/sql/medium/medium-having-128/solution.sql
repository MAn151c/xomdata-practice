-- Xom Data · Employees averaging over 5 overtime hours
-- Problem: https://xomdata.com/practice/medium-having-128
-- Solved: 2026-08-19

WITH
  STAT AS (
    SELECT
      e.id,
      e.full_name,
      e.employee_code,
      AVG(a.work_days) AS avg_work_days,
      AVG(a.overtime_hours) AS avg_overtime_hours,
      AVG(p.net_salary) AS avg_salary
    FROM
      employees e
      LEFT JOIN attendance a ON e.id = a.employee_id
      LEFT JOIN payroll p ON e.id = p.employee_id AND a.month = p.month
    GROUP BY
      e.id,
      e.full_name,
      e.employee_code
    HAVING
      AVG(a.overtime_hours) > 5 AND
      AVG(a.work_days) >= 18
  )
SELECT
  full_name,
  employee_code,
  avg_work_days,
  avg_overtime_hours,
  avg_salary,
  ROUND(avg_overtime_hours / avg_work_days, 4) AS overtime_intensity,
  RANK() OVER (
    ORDER BY
      ROUND(avg_overtime_hours / avg_work_days, 4) DESC
  ) AS intensity_rank,
  NTILE(4) OVER (
    ORDER BY
      ROUND(avg_overtime_hours / avg_work_days, 4) DESC
  ) AS workload_quartile
FROM
  STAT
ORDER BY
  intensity_rank ASC,
  id ASC
