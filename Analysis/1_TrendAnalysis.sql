-- Q.1: Compare GDP (rGDP, accounts for inflation) between consecutive years (2001–2024)
-- Skills: Advanced Joins, CTEs, CASE, Percentage Calculations

-- Step 1: Year-over-year rGDP change and percent change, plus Crisis Flag
WITH rgdp_change AS (
  SELECT
    curr.year,
    curr.rGDP,
    prev.rGDP AS prev_rGDP,
    curr.rGDP - prev.rGDP AS rGDP_change,
    ROUND(100.0 * (curr.rGDP - prev.rGDP)/prev.rGDP, 2) AS rgdp_pct_change,
    CASE 
      WHEN (curr.rGDP - prev.rGDP)/prev.rGDP < -0.02 THEN 'CRISIS'
      ELSE 'STABLE'
    END AS crisis_flag
  FROM macro_gdp curr
  LEFT JOIN macro_gdp prev 
    ON curr.year = prev.year + 1
  WHERE prev.rGDP IS NOT NULL
)
-- Use -2% threshold for significant contraction; adjust as needed for sensitivity
-- Step 2: Select everything and order
SELECT * 
FROM rgdp_change
ORDER BY year;

-- Step 3: Average rGDP change 
SELECT 
  ROUND(AVG(curr.rGDP - prev.rGDP), 2) AS avg_rgdp_all_years
FROM macro_gdp curr
JOIN macro_gdp prev ON curr.year = prev.year + 1;

--Insight:  
-- The 2008–2009 Financial Crisis and 2020 COVID-19 Pandemic caused large contractions.
-- In 2021, the economy rebounded with GDP growth over $1.05T, far above the long-run average.
-- We benchmarked GDP performance both with and without crisis years to better understand volatility vs. normal trends.
-- The 2008 Financial Crisis 
-- 2008: rgdp_change: 17065.00     rgdp_avg : 330681.375000000000
-- 2009: rgdp_change: -387545.00   rgdp_avg : 330681.375000000000
-- 2010: rgdp_change: 394954.00    rgdp_avg : 330681.375000000000

-- The COVID-19 Pandemic     
-- 2019: rgdp_change: 446538.00    rgdp_avg : 330681.375000000000
-- 2020: rgdp_change: -410526.00   rgdp_avg : 330681.375000000000
-- 2021: rgdp_change: 1051938.00   rgdp_avg : 330681.375000000000
 






