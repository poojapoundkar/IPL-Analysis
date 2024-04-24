# Top 4 teams based on past 3 years winning %
WITH TeamMatches AS (
    SELECT Team1 AS Team, Winner FROM dim_match_summary
    UNION ALL
    SELECT Team2 AS Team, Winner FROM dim_match_summary
)

SELECT 
    Team,
    ROUND(SUM(Winner = Team) * 100.0 / COUNT(*), 2) AS Win_Percentage
FROM TeamMatches
GROUP BY Team
ORDER BY Win_Percentage desc
LIMIT 4;