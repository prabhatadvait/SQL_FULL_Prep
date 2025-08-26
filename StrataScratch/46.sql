-- SELECT 
--   TRIM(category) AS category,
--   SUM(review_count) AS review_cnt
-- FROM (
--   SELECT 
--     unnest(string_to_array(categories, ';')) AS category,
--     review_count
--   FROM yelp_business
--   WHERE categories IS NOT NULL
-- ) AS exploded
-- GROUP BY TRIM(category)
-- ORDER BY review_cnt DESC;

SELECT
    TRIM(category) AS category,
    SUM(review_count) AS review_cnt
FROM (
    SELECT
        UNNEST(STRING_TO_ARRAY(categories,';')) AS category,
        review_count
    FROM yelp_business
    WHERE categories IS NOT NULL
) AS EXPLODED
GROUP BY TRIM(category)
ORDER BY review_cnt DESC;