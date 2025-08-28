WITH cte AS (
    SELECT
        player_id,
        match_date,
        match_result,
        -- Create "groups" by counting cumulative losses up to each row
        SUM(CASE WHEN match_result = 'L' THEN 1 ELSE 0 END)
            OVER (
                PARTITION BY player_id
                ORDER BY match_date
                ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
            ) AS grp
    FROM players_results
),

cte2 AS (
    SELECT
        player_id,
        grp,
        COUNT(*) AS streak
    FROM cte
    WHERE match_result = 'W'
    GROUP BY player_id, grp
)

SELECT
    player_id,
    streak
FROM cte2
WHERE streak = (SELECT MAX(streak) FROM cte2);
