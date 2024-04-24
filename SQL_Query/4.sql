#Top 10 bowlers based on past 3 years total wickets taken
SELECT 
    bowlerName,
    SUM(wickets) AS total_wickets
FROM 
    fact_bowling_summary
GROUP BY 
    bowlerName
ORDER BY 
    total_wickets DESC
LIMIT 10;