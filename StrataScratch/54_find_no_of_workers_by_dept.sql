SELECT department, 
       COUNT(worker_id) AS no_of_worker
FROM worker
WHERE joining_date >= DATE('2014-04-01')
GROUP BY department
ORDER BY COUNT(worker_id) DESC;
