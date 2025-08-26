-- Below  will run with no doubt

-- WITH daily_cost AS (
--   SELECT cust_id, order_date, SUM(total_order_cost) AS cost
--   FROM orders
--   WHERE order_date BETWEEN '2019-02-01' AND '2019-05-01'
--   GROUP BY cust_id, order_date
-- ),
-- ranked AS (
--   SELECT *, RANK() OVER (PARTITION BY order_date ORDER BY cost DESC) AS rnk
--   FROM daily_cost
-- )
-- SELECT c.first_name, r.order_date, r.cost AS max_cost
-- FROM ranked r
-- JOIN customers c ON r.cust_id = c.id
-- WHERE r.rnk = 1
-- ORDER BY r.order_date;

with cte as (
    select c.first_name,
           o.order_date,
           sum(o.total_order_cost) as total_cost
    from customers c
    join orders o on c.id = o.cust_id
    where o.order_date between '2019-02-01' and '2019-05-01'
    group by c.first_name, o.order_date
),
rank_cte as (
    select *,
           rank() over(partition by order_date order by total_cost desc) as rk
    from cte
)
select first_name, order_date, total_cost
from rank_cte
where rk=1;
