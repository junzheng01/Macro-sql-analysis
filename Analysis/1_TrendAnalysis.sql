-- Q: Compare GDP or inflation between consecutive years (year vs year-1) 
-- USA from 2001 - 2024 , since 2000 has no data to compare to, I chose to remove that row
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


--Q: How has GDP growth (rGDP) trended over the last 10 years?
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
