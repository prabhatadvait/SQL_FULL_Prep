SELECT event_name, COUNT(*) AS event_count
FROM playbook_events
WHERE device LIKE '%macbook pro%'
GROUP BY event_name
ORDER BY event_count DESC;
