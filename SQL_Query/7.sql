#Top 5 batsmen based on past 3 years boundary % (fours and sixes).
SELECT 
    batsmanName,
    ROUND((SUM(4s) * 4 + SUM(6s) * 6) / SUM(runs) * 100, 2) AS boundary_percentage
FROM 
    fact_bating_summary
GROUP BY 
    batsmanName
HAVING
    SUM(runs) > 500
ORDER BY 
    boundary_percentage DESC
LIMIT 5;

