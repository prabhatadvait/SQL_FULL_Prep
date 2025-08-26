WITH cte AS (
    SELECT 
        user_id, 
        DATE(timestamp) AS date, 
        MAX(CASE WHEN action = 'page_load' THEN timestamp END) AS page_load,
        MIN(CASE WHEN action = 'page_exit' THEN timestamp END) AS page_exit
    FROM facebook_web_log
    GROUP BY user_id, DATE(timestamp)
)
SELECT 
    user_id,
    AVG(EXTRACT(EPOCH FROM (page_exit - page_load))) AS avg_time_diff --extract epoch is to convert it into seconds
FROM cte
WHERE page_load < page_exit
GROUP BY user_id;
