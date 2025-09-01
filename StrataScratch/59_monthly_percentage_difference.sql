SELECT 
    TO_CHAR(created_at, 'YYYY-MM') AS y_m,
    ROUND(
        (
            (SUM(value) - LAG(SUM(value)) OVER (ORDER BY TO_CHAR(created_at, 'YYYY-MM'))) 
            / NULLIF(LAG(SUM(value)) OVER (ORDER BY TO_CHAR(created_at, 'YYYY-MM')), 0) * 100.0
        ), 2
    ) AS revenue_perc
FROM sf_transactions
GROUP BY TO_CHAR(created_at, 'YYYY-MM')
ORDER BY y_m;