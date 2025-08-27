WITH sales AS (
    SELECT 
        EXTRACT(MONTH FROM invoicedate) AS month,
        description,
        SUM(unitprice * quantity) AS total_paid
    FROM online_retail
    GROUP BY month, description
),
ranked AS (
    SELECT 
        month,
        description,
        total_paid,
        RANK() OVER (PARTITION BY month ORDER BY total_paid DESC) AS rnk
    FROM sales
)
SELECT 
    month,
    description,
    total_paid
FROM ranked
WHERE rnk = 1
ORDER BY month;