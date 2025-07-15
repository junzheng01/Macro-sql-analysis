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

SELECT year , 
ROUND((rgdp - LAG(rgdp, 1) OVER(ORDER BY year) )*100 / rgdp , 2) GDP_Change_Pct
from macro_gdp
offset 1; 
