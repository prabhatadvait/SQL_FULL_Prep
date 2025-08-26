SELECT 
  popularity,
  MIN(price) AS min_price,
  AVG(price) AS avg_price,
  MAX(price) AS max_price
FROM (
  SELECT 
    *,
    CASE 
      WHEN number_of_reviews = 0 THEN 'New'
      WHEN number_of_reviews BETWEEN 1 AND 5 THEN 'Rising'
      WHEN number_of_reviews BETWEEN 6 AND 15 THEN 'Trending Up'
      WHEN number_of_reviews BETWEEN 16 AND 40 THEN 'Popular'
      ELSE 'Hot'
    END AS popularity
  FROM airbnb_host_searches
) AS sub
GROUP BY popularity
ORDER BY min_price;