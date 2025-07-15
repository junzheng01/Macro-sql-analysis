--4. Data Quality Checks (Subqueries & EXISTS)
--Q: Are there any years missing data in critical tables like macro_gdp or macro_trade?

--Use: EXISTS or NOT EXISTS with correlated subqueries



--Q: List years present in macro_years but missing from macro_money_supply.

--Use: LEFT JOIN + WHERE money_supply.year IS NULL



