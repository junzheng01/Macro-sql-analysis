-- STAGING , unnnormalized data: populating my tables
CREATE TABLE us_macro_data (
    countryname VARCHAR(15) NOT NULL,
    id VARCHAR(3),
    year INT NOT NULL,

    nGDP NUMERIC(15,2),          
    rGDP NUMERIC(15,2),
    rGDP_pc NUMERIC(15,2),

    rGDP_USD NUMERIC(15,2),

    deflator NUMERIC(10,4),

    exports NUMERIC(15,2),
    exports_pct_GDP NUMERIC(5,2),

    imports NUMERIC(15,2),
    imports_pct_GDP NUMERIC(5,2),

    govexp NUMERIC(15,2),
    govexp_pct_GDP NUMERIC(5,2),

    govrev NUMERIC(15,2),
    govrev_pct_GDP NUMERIC(5,2),

    govdef NUMERIC(15,2),
    govdef_pct_GDP NUMERIC(5,2),

    govdebt NUMERIC(15,2),
    govdebt_pct_GDP NUMERIC(5,2),

    infl_pct NUMERIC(5,2),

    pop BIGINT,
    unemp_pct NUMERIC(5,2),

    M0 NUMERIC(15,2),
    M1 NUMERIC(15,2),
    M2 NUMERIC(15,2),
    M3 NUMERIC(15,2),

    SovDebtCrisis BOOLEAN,
    CurrencyCrisis BOOLEAN,
    BankingCrisis BOOLEAN,

    nGDP_USD NUMERIC(15,2),
    imports_USD NUMERIC(15,2),
    exports_USD NUMERIC(15,2),

    PRIMARY KEY (year, countryname)
);
