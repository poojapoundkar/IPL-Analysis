# Top 2 teams with the highest number of wins achieved by chasing targets over the past 3 years.
SELECT 
    winner, COUNT(winner) as Total_wins
FROM
    dim_match_summary
WHERE
    margin LIKE '%wicket%'
GROUP BY 
	winner
ORDER BY 
	Total_wins DESC;
