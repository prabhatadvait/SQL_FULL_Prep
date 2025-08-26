select client_id, EXTRACT (MONTH FROM time_id) AS month,count(distinct user_id)
 from fact_events group by client_id,month;