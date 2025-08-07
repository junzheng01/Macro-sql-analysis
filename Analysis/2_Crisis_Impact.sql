-- In which years did real GDP shrink (i.e., a recession year), 
-- and how many economic crises occurred in the 5 years leading up to and including that year?"
--Skills : CASE , WINDOW FUNCTION, CTE 
WITH yearly_stats AS (
  SELECT
    year,
    rGDP,
    LAG(rGDP) OVER (ORDER BY year) AS prev_rGDP,
    CASE WHEN crisis_type IS NOT NULL THEN 1 ELSE 0 END AS has_crisis
  FROM macro_gdp
  LEFT JOIN crisis_events USING(year)
),
gdp_calc AS (
  SELECT
    year,
    rGDP,
    prev_rGDP,
    rGDP - prev_rGDP AS gdp_growth,
    SUM(has_crisis) OVER (ORDER BY year ROWS BETWEEN 5 PRECEDING AND CURRENT ROW) AS crises_last_5_years
  FROM yearly_stats
)
SELECT *
FROM gdp_calc
WHERE gdp_growth < 0;

 
--Q: How did unemployment evolve during key crises (e.g., 2008, 2020)?
-- Skills: Join , Filter, LAG() to compare month-over-month change.

SELECT c.year, month, unemployment_rate,
lag(unemployment_rate, 1) over (ORDER BY month_num) unemploy_prev_month
FROM unemployment_long u 
JOIN crisis_events c
ON u.year = c.year 
ORDER BY month_num ASC
;

--Q: What was the average GDP growth in years with a banking crisis vs. years without?
--Use: LEFT JOIN between macro_gdp and crisis_events filtered on crisis type
--Use conditional aggregation with CASE WHEN

SELECT avg(rgdp ) 
FROM ( 
SELECT rgdp , crisis_type 
FROM macro_gdp a
LEFT  JOIN crisis_events b
ON a.year = b.year
WHERE crisis_type IS NULL
) 
UNION
SELECT avg(rgdp) 
FROM ( 
SELECT rgdp , crisis_type 
FROM macro_gdp a
LEFT JOIN crisis_events b
ON a.year = b.year
WHERE crisis_type IS NOT NULL
);
