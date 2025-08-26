select cust_id,sum(total_order_cost) as total_revenue
 from orders where TO_CHAR(order_date,'YYYY-MM') = '2019-03'
  group by cust_id order by total_revenue;