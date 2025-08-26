SELECT 
    TO_CHAR(shipment_date, 'YYYY-MM') AS year_month,
    COUNT(shipment_id + sub_id) AS n_count
FROM amazon_shipment
GROUP BY year_month;