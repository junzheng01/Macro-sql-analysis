--Crisis Event Impact (Joins & Subqueries)

--Q: What was the average GDP growth in years with a banking crisis vs. years without?

--Use: LEFT JOIN between macro_gdp and crisis_events filtered on crisis type

--Use conditional aggregation with CASE WHEN

Select rgdp , crisis_type
from macro_gdp a
left join crisis_events b
on a.year = b.year
;
