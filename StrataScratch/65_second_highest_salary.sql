with cte as (select *, rank() over (order by salary desc) as rk from employee)
select salary from cte where rk =2;