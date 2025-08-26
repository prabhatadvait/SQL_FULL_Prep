with cte as (select *,1.0/count(*) over(partition by voter) as votes from voting_results
where candidate is not null),
cte2 as (select candidate,sum(votes) as total_votes, dense_rank() over(order by sum(votes) desc) as rn from cte group by candidate)
select candidate from cte2 where rn=1;