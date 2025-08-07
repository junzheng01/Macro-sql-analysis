--Q2. Compare GDP Growth and Unemployment
-- Skills: Dual column comparison + basic correlation interpretation
SELECT 
  year,
  ROUND(rgdp - LAG(rgdp) OVER (ORDER BY year), 2) AS gdp_change,
  ROUND(unemployment_rate - LAG(unemployment_rate) OVER (ORDER BY year), 2) AS unemp_change
FROM macro_data
WHERE country = 'United States'
  AND year >= 2001;


