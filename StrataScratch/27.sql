select 
    type,
    round( sum(case when processed then 1 else 0 end)::decimal / count(*), 2 ) as processed_rate
from facebook_complaints
group by type;