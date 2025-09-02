with cte as (select state,PERCENTILE_CONT(0.95) WITHIN group (order by fraud_score) as p95
from fraud_score group by state)
select f.policy_num,f.state,f.claim_cost,f.fraud_score from fraud_score f
join cte c on f.state = c.state where f.fraud_score >= c.p95;