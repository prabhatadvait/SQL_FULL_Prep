-- WITH base AS
-- (
-- select account_id
--       ,CASE WHEN record_date BETWEEN '2020-12-01' AND '2020-12-31' THEN user_id ELSE NULL END AS dec_user
--       ,CASE WHEN record_date > '2020-12-31' THEN user_id ELSE NULL END AS post_dec_user
--       ,CASE WHEN record_date BETWEEN '2021-01-01' AND '2021-01-31' THEN user_id ELSE NULL END AS jan_user
--       ,CASE WHEN record_date > '2021-01-31' THEN user_id ELSE NULL END AS post_jan_user
-- from sf_events
-- GROUP BY 1,2,3,4,5
-- )

-- SELECT a.account_id
--       ,(COUNT(DISTINCT c.post_jan_user)::float / COUNT(DISTINCT a.jan_user)::float)
--       /
--       (COUNT(DISTINCT b.post_dec_user)::float / COUNT(DISTINCT a.dec_user)::float) AS ret_rate
-- FROM base AS a
-- LEFT JOIN base AS b ON a.dec_user = b.post_dec_user
-- LEFT JOIN base AS c ON a.jan_user = c.post_jan_user
-- GROUP BY 1;

WITH base AS (
    SELECT 
        account_id,
        user_id,
        MAX(CASE WHEN record_date BETWEEN '2020-12-01' AND '2020-12-31' THEN 1 ELSE 0 END) AS is_dec,
        MAX(CASE WHEN record_date > '2020-12-31' THEN 1 ELSE 0 END) AS is_post_dec,
        MAX(CASE WHEN record_date BETWEEN '2021-01-01' AND '2021-01-31' THEN 1 ELSE 0 END) AS is_jan,
        MAX(CASE WHEN record_date > '2021-01-31' THEN 1 ELSE 0 END) AS is_post_jan
    FROM sf_events
    GROUP BY account_id, user_id
)
SELECT 
    account_id,
    ( -- Jan retention rate ÷ Dec retention rate
      (COUNT(DISTINCT CASE WHEN is_jan = 1 AND is_post_jan = 1 THEN user_id END)::float 
       / NULLIF(COUNT(DISTINCT CASE WHEN is_jan = 1 THEN user_id END), 0)::float)
      /
      (COUNT(DISTINCT CASE WHEN is_dec = 1 AND is_post_dec = 1 THEN user_id END)::float 
       / NULLIF(COUNT(DISTINCT CASE WHEN is_dec = 1 THEN user_id END), 0)::float)
    ) AS ret_rate_ratio
FROM base
GROUP BY account_id;