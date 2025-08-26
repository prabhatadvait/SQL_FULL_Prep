with cte as (select * from fb_friend_requests where action='sent'),

cte2 as (select * from fb_friend_requests where action='accepted')

select cte.date,(count(cte2.user_id_receiver)::decimal/count(cte.user_id_sender)) as acceptance_rate 
from cte left join cte2 on cte.user_id_sender=cte2.user_id_sender 
and cte.user_id_receiver = cte2.user_id_receiver group by cte.date;
