SELECT
    p.post_date,
    ROUND(
        100.0  * SUM(CASE WHEN LOWER(p.post_keywords) LIKE '%spam%' THEN 1 ELSE 0 END) / COUNT(*),2
    ) AS spam_view_percentage
FROM facebook_post_views v
JOIN facebook_posts p ON v.post_id = p.post_id
GROUP BY p.post_date
ORDER BY p.post_date;