WITH monthly_comments AS (
    SELECT 
        fu.country,
        TO_CHAR(fc.created_at, 'YYYY-MM') AS month,
        SUM(fc.number_of_comments) AS total_comments
    FROM fb_comments_count fc
    JOIN fb_active_users fu 
        ON fc.user_id = fu.user_id
    WHERE TO_CHAR(fc.created_at, 'YYYY-MM') IN ('2019-12', '2020-01')
    GROUP BY fu.country, TO_CHAR(fc.created_at, 'YYYY-MM')
),
ranked AS (
    SELECT 
        country,
        month,
        total_comments,
        DENSE_RANK() OVER (
            PARTITION BY month
            ORDER BY total_comments DESC
        ) AS rank_in_month
    FROM monthly_comments
)
SELECT 
    dec.country
FROM ranked dec
JOIN ranked jan
    ON dec.country = jan.country
   AND dec.month = '2019-12'
   AND jan.month = '2020-01'
WHERE jan.rank_in_month < dec.rank_in_month
ORDER BY jan.rank_in_month;