SELECT c.first_name, o.order_date, o.order_details, o.total_order_cost
FROM orders o
JOIN customers c ON o.cust_id = c.id
WHERE c.first_name IN ('Jill', 'Eva')
ORDER BY o.cust_id;