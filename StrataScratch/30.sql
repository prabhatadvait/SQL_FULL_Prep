SELECT department, first_name, salary
FROM employee
WHERE (department, salary) IN (
    SELECT department, MAX(salary)
    FROM employee
    GROUP BY department
);