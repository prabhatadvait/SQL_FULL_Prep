select count(distinct counta.user_id) from (
 select user_id, case when min(created_at) over (Partition By user_id)
 <> min(created_at) over(partition by user_id,product_id) then 1 else 0 end as campaign
 from marketing_campaign
 ) counta
 where campaign = 1;
