WITH user_status AS (
    SELECT 
    d.date,
    a.paying_customer,
    d.downloads
    from ms_download_facts d
    join ms_user_dimension u ON d.user_id = u.user_id
    join ms_acc_dimension a on u.acc_id = a.acc_id
),
agg AS(
    SELECT 
        date,
        SUM(CASE WHEN paying_customer='no' THEN downloads ELSE 0 END) AS non_paying_downloads,
        SUM(CASE WHEN paying_customer='yes' THEN downloads ELSE 0 END) AS paying_downloads
    FROM user_status
    GROUP BY date
)
SELECT 
    date,
    non_paying_downloads,
    paying_downloads
FROM agg
WHERE non_paying_downloads > paying_downloads
ORDER BY date;