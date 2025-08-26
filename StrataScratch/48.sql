-- SELECT 
--     e.employee_title,
--     e.sex,
--     AVG(e.salary + b.total_bonus) AS avg_total_compensation
-- FROM sf_employee e
-- JOIN (
--     SELECT 
--         worker_ref_id, 
--         SUM(bonus) AS total_bonus 
--     FROM sf_bonus 
--     GROUP BY worker_ref_id
-- ) b
-- ON e.id = b.worker_ref_id
-- GROUP BY e.employee_title, e.sex;

with cte as (select e.id, e.employee_title,e.sex,e.salary, sum(b.bonus) as total_bonus from sf_employee e
    join sf_bonus b on e.id = b.worker_ref_id group by e.id)
select employee_title,sex,avg(salary+total_bonus) as avg_compensation from cte group by employee_title,sex;