--Q1: Has unemployment returned to pre-crisis levels? 
-- Skill: Window function LAG(), CTE
WITH unemp_trend AS (
  SELECT
    year,
    unemp_pct,
    LAG(unemp_pct) OVER (ORDER BY year) AS prev_unemp
  FROM macro_years
  WHERE year >= 2000
)
SELECT
  year,
  unemp_pct,
  prev_unemp,
  unemp_pct - prev_unemp AS change_from_prev_year
FROM unemp_trend
WHERE year IN (2008, 2009, 2020, 2021);
-- Insight: Unemployment during key economic crises 
--          assess how long it took for unemployment to rebound


--Q.2:Which years had the highest average monthly unemployment?
-- Skill: Aggregation, Grouping, JOIN
SELECT
  year,
  AVG(unemployment_rate) AS avg_monthly_unemp 
FROM unemployment_long
GROUP BY year
ORDER BY avg_monthly_unemp DESC
LIMIT 5
;

-- Insight: Identifies the top 5 years with the highest avg monthly unemployment rates
--          Helpful in spotting prolong economic distress 

-- Q3: How closely does real GDP growth predict changes in the unemployment rate?”
-- Skill: Window functions (LAG()), joins, computed fields
SELECT
  m.year,
  g.rgdp,
  g.rgdp - LAG(g.rgdp) OVER (ORDER BY m.year) AS rgdp_change,
  m.unemp_pct,
  m.unemp_pct - LAG(m.unemp_pct) OVER (ORDER BY m.year) AS unemp_change
FROM macro_years m
JOIN macro_gdp g ON m.year = g.year
ORDER BY m.year;

--Insight: Shows year-by-year relationships between real GDP growth and unemployment rate changes
