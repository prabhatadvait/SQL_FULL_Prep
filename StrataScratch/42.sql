-- WITH first_purchase AS (
--     SELECT 
--         user_id,
--         MIN(created_at) AS first_date
--     FROM amazon_transactions
--     GROUP BY user_id
-- )
-- SELECT DISTINCT f.user_id
-- FROM first_purchase f
-- JOIN amazon_transactions t
--   ON f.user_id = t.user_id
--  AND t.created_at > f.first_date                  -- must be after first purchase
--  AND t.created_at <= f.first_date + INTERVAL '7 days'; -- within 7 days
 
 WITH first_purchase AS (
    SELECT 
        user_id,
        MIN(created_at) AS first_date
    FROM amazon_transactions
    GROUP BY user_id
)
SELECT f.user_id
FROM first_purchase f
WHERE EXISTS (
    SELECT 1
    FROM amazon_transactions t
    WHERE t.user_id = f.user_id
      AND t.created_at > f.first_date                  -- must be after first purchase
      AND t.created_at <= f.first_date + INTERVAL '7 days' -- within 7 days
);
