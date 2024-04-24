# Top 10 batsmen based on past 3 years strike rate (min 60 balls faced in each season)
SELECT 
    batsmanName,
    ROUND(SUM(runs) / SUM(balls) * 100,2) AS strike_rate
FROM 
    fact_bating_summary_with_season
WHERE 
    season IN ('Season 14', 'Season 15', 'Season 16')
GROUP BY 
    batsmanName
HAVING 
    SUM(CASE WHEN season = 'Season 14' THEN balls END) >= 60
    AND SUM(CASE WHEN season = 'Season 15' THEN balls END) >= 60
    AND SUM(CASE WHEN season = 'Season 16' THEN balls END) >= 60
ORDER BY 
    strike_rate DESC
LIMIT 10;





