select state,max(no_of_star) as star_5 from(
select state,sum(case when stars = 5 then 1 else 0 end) as no_of_star from yelp_business group by state ) t
group by state order by max(no_of_star) desc limit 7;