--Q: Are there any years missing data in critical tables like macro_gdp or macro_trade?

select * 
from macro_money_supply
where m0 is null or 
m1 is null or
m2 is null or
m3 is null ; 
