WITH ranked AS (
  SELECT
    id,
    first_name,
    last_name,
    department_id,
    salary,
    ROW_NUMBER() OVER (PARTITION BY id ORDER BY salary DESC) AS rn
  FROM ms_employee_salary
)
SELECT
  id,
  first_name,
  last_name,
  department_id,
  salary
FROM ranked
WHERE rn = 1
ORDER BY id;
