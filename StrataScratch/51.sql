with cte as (select user_id,(100.0*sum(case when event_type in ('video call received', 'video call sent', 'voice call received', 'voice call sent') then 1 else 0 end)::decimal/count(event_id)) as perc from fact_events group by user_id),
cte2 as (select user_id from cte where perc >= 50)

select client_id from fact_events where user_id in (select user_id from cte2) group by client_id order by count(distinct user_id) desc limit 1;