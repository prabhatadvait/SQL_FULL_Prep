-- https://www.hackerrank.com/challenges/salary-of-employees/problem?isFullScreen=true

SELECT name
FROM Employee
WHERE salary > 2000 AND months < 10 
  ORDER BY employee_id;