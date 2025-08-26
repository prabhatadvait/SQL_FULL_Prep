WITH cte AS (
    SELECT 
        u.user_firstname,
        u.user_lastname,
        COUNT(distinct u.video_id) AS yt_cont
    FROM user_flags u
    JOIN flag_review r 
        ON u.flag_id = r.flag_id 
    WHERE r.reviewed_outcome = 'APPROVED'
    GROUP BY u.user_firstname, u.user_lastname
),
ranked AS (
    SELECT 
        (user_firstname || ' '||
        user_lastname) as fullname,
        yt_cont,
        DENSE_RANK() OVER (ORDER BY yt_cont DESC) AS rn
    FROM cte
)
SELECT 
    fullname
FROM ranked
WHERE rn = 1;