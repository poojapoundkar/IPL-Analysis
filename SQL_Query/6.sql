# Top 10 bowlers based on past 3 years economy rate. (min 60 balls bowled in each season)
SELECT 
    bowlerName,
    ROUND(SUM(Runs) / SUM(Overs),2) AS economy_rate
FROM 
    fact_bowling_summary_with_season
WHERE
    season IN ('Season 14', 'Season 15', 'Season 16')
GROUP BY 
    bowlerName
HAVING 
    SUM(CASE WHEN season = 'Season 14' THEN FLOOR(overs) * 6 + (overs - FLOOR(overs)) * 10 END) >= 60
    AND SUM(CASE WHEN season = 'Season 15' THEN FLOOR(overs) * 6 + (overs - FLOOR(overs)) * 10 END) >= 60
    AND SUM(CASE WHEN season = 'Season 16' THEN FLOOR(overs) * 6 + (overs - FLOOR(overs)) * 10 END) >= 60
ORDER BY 
    economy_rate ASC
LIMIT 10;

