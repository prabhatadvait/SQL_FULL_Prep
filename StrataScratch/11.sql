WITH avg_sal AS (
  SELECT department, AVG(salary) AS avg_salary
  FROM employee
  GROUP BY department
)
SELECT 
  e.department,
  e.first_name,
  e.salary,
  a.avg_salary
FROM employee e
JOIN avg_sal a ON e.department = a.department;