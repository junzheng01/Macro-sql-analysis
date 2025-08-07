-- Q.1: Compare GDP (rGDP, accounts for inflation) between consecutive years (2000-2024) 
-- Skills:  Advanced Joins 
SELECT
  curr.year,
  curr.rGDP,
  prev.rGDP AS prev_rGDP,
  curr.rGDP - prev.rGDP AS rGDP_change
FROM macro_gdp curr
LEFT JOIN macro_gdp prev 
ON curr.year = prev.year + 1
ORDER BY curr.year;
---Insight:  
--- The 2008 Financial Crisis 
--- 2008: rgdp_change: 17065.00 
--- 2009: rgdp_change: -387545.00
--- 2010: rgdp_change: 394954.00

--- The COVID-19 Pandemic     
--- 2019: rgdp_change: 446538.00, 
--- 2020: rgdp_change: -410526.00
--- 2021: rgdp_change:1051938.00

---Q.1.A: Compare the rgdp_change with the average rgdp_change 
---       (excludes the negative as crisises are not a "normal" account of rgdp) 
SELECT 
AVG(rgdp_change) AS rgdp_avg
FROM(
SELECT
curr.year, 
CASE 
WHEN curr.rGDP - prev.rGDP > 0 THEN curr.rGDP - prev.rGDP
ELSE 0
END AS rgdp_change
FROM macro_gdp curr
LEFT JOIN macro_gdp prev 
ON curr.year = prev.year + 1
ORDER BY curr.year
OFFSET 1
);
--- rgdp_avg : 363934.333333333333









--Q.2: How has GDP growth (rGDP) trended over the last 10 years?
--Skills: CTE + Window Functions LAG() 

WITH yearly_gdp_stats AS(SELECT year , rgdp, LAG(rgdp, 1) OVER(ORDER BY year) prev_rgdp,
ROUND((rgdp - LAG(rgdp, 1) OVER(ORDER BY year) )*100 / rgdp , 2) GDP_Change_Pct
from macro_gdp)

SELECT ROUND(avg(gdp_change_pct), 2) Pct_10Years
from yearly_gdp_stats
where year BETWEEN 2014 and 2024
; 
-- A : rGDP has averaged a 2.26% growth 

-- Rank years by inflation rate and highlight years in the top 10%.
-- SKills : RANK(), PERCENT_RANK(), CTE 
WITH percentile AS (select RANK() OVER (ORDER BY infl_pct DESC) , year , infl_pct,
PERCENT_RANK() OVER (ORDER BY infl_pct) AS percentile_infl
from macro_years)

SELECT * 
from percentile
where percentile_infl >= .90
ORDER BY rank asc
;
