-- Compare GDP or inflation between consecutive years (year vs year-1)
-- Skills:  Advanced Joins 
SELECT
  curr.year,
  curr.rGDP,
  prev.rGDP AS prev_rGDP,
  curr.rGDP - prev.rGDP AS rGDP_change
FROM macro_gdp curr
LEFT JOIN macro_gdp prev 
ON curr.year = prev.year + 1
ORDER BY curr.year
offset 1;
