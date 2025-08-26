-- https://www.hackerrank.com/challenges/the-blunder/problem?isFullScreen=true

SELECT 
    CEIL(AVG(Salary) - AVG(REPLACE(Salary,0,'')))
FROM EMPLOYEES;