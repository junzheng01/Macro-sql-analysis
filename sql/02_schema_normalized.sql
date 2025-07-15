--normalized database: 
CREATE TABLE macro_years (
  year INT PRIMARY KEY,
  pop BIGINT,
  infl_pct NUMERIC(5,2),
  unemp_pct NUMERIC(5,2)
);

CREATE TABLE macro_gdp (
  year INT REFERENCES macro_years(year),
  nGDP NUMERIC(15,2),
  rGDP NUMERIC(15,2),
  rGDP_pc NUMERIC(15,2),
  rGDP_USD NUMERIC(15,2),
  deflator NUMERIC(10,4),
  nGDP_USD NUMERIC(15,2),
  PRIMARY KEY (year)
);

CREATE TABLE macro_trade (
  year INT REFERENCES macro_years(year),
  exports NUMERIC(15,2),
  exports_pct_GDP NUMERIC(5,2),
  exports_USD NUMERIC(15,2),
  imports NUMERIC(15,2),
  imports_pct_GDP NUMERIC(5,2),
  imports_USD NUMERIC(15,2),
  PRIMARY KEY (year)
);

CREATE TABLE macro_government (
  year INT REFERENCES macro_years(year),
  govexp NUMERIC(15,2),
  govexp_pct_GDP NUMERIC(5,2),
  govrev NUMERIC(15,2),
  govrev_pct_GDP NUMERIC(5,2),
  govdef NUMERIC(15,2),
  govdef_pct_GDP NUMERIC(5,2),
  govdebt NUMERIC(15,2),
  govdebt_pct_GDP NUMERIC(5,2),
  PRIMARY KEY (year)
);

CREATE TABLE macro_money_supply (
  year INT REFERENCES macro_years(year),
  M0 NUMERIC(15,2),
  M1 NUMERIC(15,2),
  M2 NUMERIC(15,2),
  M3 NUMERIC(15,2),
  PRIMARY KEY (year)
);

CREATE TABLE crisis_events (
  year INT REFERENCES macro_years(year),
  crisis_type TEXT CHECK (crisis_type IN ('Banking', 'Sovereign', 'Currency')),
  PRIMARY KEY (year, crisis_type)
);
