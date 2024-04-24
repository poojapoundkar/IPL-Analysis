#Top 5 bowlers based on past 3 years dot ball %.
WITH cte AS (
    SELECT 
        bowlerName,
        ROUND(SUM(overs), 1) AS total_overs,
        SUM(0s) AS dot_balls,
        SUM(FLOOR(overs) * 6 + ((overs - FLOOR(overs)) * 10)) AS total_balls
    FROM 
        fact_bowling_summary 
    GROUP BY 
        bowlerName
    HAVING
        SUM(FLOOR(overs) * 6 + ((overs - FLOOR(overs)) * 10)) > 500 -- Filter for bowlers who have bowled more than 500 balls
)
SELECT 
    bowlerName,
    total_balls,
    dot_balls,
    ROUND((dot_balls / total_balls) * 100, 2) AS dot_balls_percentage
FROM 
    cte
ORDER BY
    dot_balls_percentage DESC
LIMIT 5;
