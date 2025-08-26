SELECT 
    EXTRACT(YEAR FROM inspection_date) AS inspection_year,
    COUNT(*) AS n_violation
FROM sf_restaurant_health_violations
WHERE business_name = 'Roxanne Cafe'
  AND violation_id IS NOT NULL
GROUP BY inspection_year
ORDER BY n_violation desc;
