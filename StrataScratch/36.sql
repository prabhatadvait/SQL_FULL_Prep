select language,count(distinct case when device in ('macbook pro','iphone 5s','ipad air') then pe.user_id end) as apple_users, count(distinct pe.user_id) as total_users from playbook_events pe join playbook_users pu on pe.user_id = pu.user_id 
group by language
order by total_users desc;