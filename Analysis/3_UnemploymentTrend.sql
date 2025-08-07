--Q1. Has unemployment returned to pre-crisis levels? 
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



