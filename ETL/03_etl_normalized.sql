-- ===============================================
-- ETL Script: Normalize us_macro_data → Analysis Tables
-- ===============================================

-- Insert core yearly data
INSERT INTO macro_years (year, pop, infl_pct, unemp_pct)
SELECT
    year,
    pop,
    infl_pct,
    unemp_pct
FROM us_macro_data;

-- Insert GDP data
INSERT INTO macro_gdp (
    year,
    nGDP,
    rGDP,
    rGDP_pc,
    rGDP_USD,
    deflator,
    nGDP_USD
)
SELECT
    year,
    nGDP,
    rGDP,
    rGDP_pc,
    rGDP_USD,
    deflator,
    nGDP_USD
FROM us_macro_data;

-- Insert trade data
INSERT INTO macro_trade (
    year,
    exports,
    exports_pct_GDP,
    exports_USD,
    imports,
    imports_pct_GDP,
    imports_USD
)
SELECT
    year,
    exports,
    exports_pct_GDP,
    exports_USD,
    imports,
    imports_pct_GDP,
    imports_USD
FROM us_macro_data;

-- Insert government fiscal data
INSERT INTO macro_government (
    year,
    govexp,
    govexp_pct_GDP,
    govrev,
    govrev_pct_GDP,
    govdef,
    govdef_pct_GDP,
    govdebt,
    govdebt_pct_GDP
)
SELECT
    year,
    govexp,
    govexp_pct_GDP,
    govrev,
    govrev_pct_GDP,
    govdef,
    govdef_pct_GDP,
    govdebt,
    govdebt_pct_GDP
FROM us_macro_data;

-- Insert money supply data
INSERT INTO macro_money_supply (
    year,
    M0,
    M1,
    M2,
    M3
)
SELECT
    year,
    M0,
    M1,
    M2,
    M3
FROM us_macro_data;

-- Insert Banking Crisis events
INSERT INTO crisis_events (year, crisis_type)
SELECT
    year,
    'Banking'
FROM us_macro_data
WHERE BankingCrisis IS TRUE;

-- Insert Sovereign Debt Crisis events
INSERT INTO crisis_events (year, crisis_type)
SELECT
    year,
    'Sovereign'
FROM us_macro_data
WHERE SovDebtCrisis IS TRUE;

-- Insert Currency Crisis events
INSERT INTO crisis_events (year, crisis_type)
SELECT
    year,
    'Currency'
FROM us_macro_data
WHERE CurrencyCrisis IS TRUE;

 ===============================================
-- Cleanup: Clear staging table after ETL completes
-- ===============================================
    
TRUNCATE TABLE us_macro_data;
