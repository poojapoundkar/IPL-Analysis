CREATE TABLE fact_bating_summary_with_season AS 
SELECT b.*,
    CASE 
        WHEN m.matchdate LIKE '%2021' THEN 'Season 14'
        WHEN m.matchdate LIKE '%2022' THEN 'Season 15'
        WHEN m.matchdate LIKE '%2023' THEN 'Season 16'
        ELSE 'NA' 
    END AS season,
    m.winner,
    m.margin 
FROM fact_bating_summary AS b 
JOIN dim_match_summary AS m ON b.match_id = m.match_id;