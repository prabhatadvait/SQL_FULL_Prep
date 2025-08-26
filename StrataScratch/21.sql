WITH cte AS (
    SELECT 
        entry_date,
        account_id,
        final_price
    FROM premium_accounts_by_day
    WHERE final_price > 0
)
SELECT 
    a.entry_date,
    count(a.account_id) as premium,count(b.account_id) as premium_7th_day
FROM cte a
 JOIN cte b
    ON a.account_id = b.account_id and b.entry_date =  a.entry_date + INTERVAL '7 days'
    group by a.entry_date
ORDER BY a.entry_date
LIMIT 7;