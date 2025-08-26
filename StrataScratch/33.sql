with total_count as (
    select games,count(distinct id) as unique_athlete from olympics_athletes_events group by games
    )
    select games,unique_athlete from total_count order by unique_athlete desc limit 1;