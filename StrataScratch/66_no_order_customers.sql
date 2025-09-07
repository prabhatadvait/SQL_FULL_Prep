-- SELECT c.first_name
-- FROM customers c
-- WHERE NOT EXISTS (
--     SELECT 1
--     FROM orders o
--     WHERE o.cust_id = c.id
--       AND o.order_date BETWEEN '2019-02-01' AND '2019-03-01'
-- );

SELECT
    c.first_name
FROM customers  c
LEFT JOIN orders  o ON c.id = o.cust_id
    AND o.order_date BETWEEN '2019-02-01' AND '2019-03-01'
WHERE o.order_date IS NULL;