SELECT 
    trackname,
    COUNT(*) AS cnt_top
FROM spotify_worldwide_daily_song_ranking
WHERE position = 1
GROUP BY trackname
ORDER BY cnt_top DESC;