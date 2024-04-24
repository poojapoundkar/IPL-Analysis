# Top 10 batsmen based on past 3 years total runs scored
SELECT 
    batsmanName,
    sum(runs) AS total_runs
FROM 
    fact_bating_summary
GROUP BY 
    batsmanName 
ORDER BY 
    total_runs DESC
LIMIT 10;

