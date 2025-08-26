-- select name,review_count,row_number() over (order by review_count desc) as rn from yelp_business limit 5;
SELECT name, review_count
FROM (
    SELECT 
        name, 
        review_count,
        ROW_NUMBER() OVER (ORDER BY review_count DESC) AS rn
    FROM yelp_business
) t
WHERE rn <= 5;
