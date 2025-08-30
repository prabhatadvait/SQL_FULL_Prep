-- WITH cte AS (
--     SELECT
--         CASE WHEN contents LIKE '%bull%' THEN 'bull' END AS keyword
--     FROM google_file_store
--     UNION ALL
--     SELECT
--         CASE WHEN contents LIKE '%bear%' THEN 'bear' END
--     FROM google_file_store
-- )
-- SELECT keyword, COUNT(*) AS occurrences
-- FROM cte
-- WHERE keyword IS NOT NULL
-- GROUP BY keyword;

WITH bull AS (
    SELECT 'bull' AS keyword
    FROM google_file_store
    WHERE contents LIKE '%bull%'
),
bear AS (
    SELECT 'bear' AS keyword
    FROM google_file_store
    WHERE contents LIKE '%bear%'
)
SELECT 'bull' AS keyword, COUNT(*) AS count_keyword FROM bull
UNION ALL
SELECT 'bear' AS keyword, COUNT(*) AS count_keyword FROM bear;