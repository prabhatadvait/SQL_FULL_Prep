SELECT 
    video_id,
    COUNT(DISTINCT (user_firstname, user_lastname)) AS unique_flag
FROM user_flags
WHERE flag_id IS NOT NULL
GROUP BY video_id;