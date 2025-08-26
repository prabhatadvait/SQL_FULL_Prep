select (100.0 * sum(case when c.address IS NOT NULL THEN 1 ELSE 0 END):: decimal/count(*)) as percentage_shippable from orders o join customers c on o.cust_id=c.id ;



