-- Write your PostgreSQL query statement below
select e.name,b.bonus from Employee e  left join Bonus b on e.empId=b.empId where b.bonus < 1000 or b.bonus is null;

-- SELECT e.name, b.bonus
-- FROM Employee e
-- LEFT JOIN Bonus b ON e.empId = b.empId
-- WHERE COALESCE(b.bonus, 0) < 1000;

