##  Database Schema Design

This project uses a **7-table normalized schema**:

###  `macro_years`

Stores baseline yearly data and acts as the anchor table for all other tables.

| Column      | Type         | Description                          |
|-------------|--------------|--------------------------------------|
| `year`      | INT          | Primary key; represents calendar year |
| `pop`       | BIGINT       | Population of the country            |
| `infl_pct`  | NUMERIC(5,2) | Inflation rate (%)                   |
| `unemp_pct` | NUMERIC(5,2) | Unemployment rate (%)                |

###  `macro_gdp`

Contains national and per capita GDP data, both nominal and real, along with deflator metrics.

| Column        | Type           | Description                         |
|---------------|----------------|-------------------------------------|
| `year`        | INT            | Foreign key to `macro_years(year)` |
| `nGDP`        | NUMERIC(15,2)  | Nominal GDP                         |
| `rGDP`        | NUMERIC(15,2)  | Real GDP                            |
| `rGDP_pc`     | NUMERIC(15,2)  | Real GDP per capita                 |
| `rGDP_USD`    | NUMERIC(15,2)  | Real GDP in USD                     |
| `deflator`    | NUMERIC(10,4)  | GDP deflator                        |
| `nGDP_USD`    | NUMERIC(15,2)  | Nominal GDP in USD                  |

###  `macro_trade`

Tracks international trade metrics, including exports/imports and their relation to GDP.

| Column             | Type           | Description                         |
|--------------------|----------------|-------------------------------------|
| `year`             | INT            | Foreign key to `macro_years(year)` |
| `exports`          | NUMERIC(15,2)  | Export value                        |
| `exports_pct_GDP`  | NUMERIC(5,2)   | Exports as % of GDP                 |
| `exports_USD`      | NUMERIC(15,2)  | Exports in USD                      |
| `imports`          | NUMERIC(15,2)  | Import value                        |
| `imports_pct_GDP`  | NUMERIC(5,2)   | Imports as % of GDP                 |
| `imports_USD`      | NUMERIC(15,2)  | Imports in USD                      |

###  `macro_government`

Captures key fiscal indicators such as expenditure, revenue, deficit, and debt.

| Column             | Type           | Description                         |
|--------------------|----------------|-------------------------------------|
| `year`             | INT            | Foreign key to `macro_years(year)` |
| `govexp`           | NUMERIC(15,2)  | Government expenditure              |
| `govexp_pct_GDP`   | NUMERIC(5,2)   | Gov. expenditure as % of GDP        |
| `govrev`           | NUMERIC(15,2)  | Government revenue                  |
| `govrev_pct_GDP`   | NUMERIC(5,2)   | Gov. revenue as % of GDP            |
| `govdef`           | NUMERIC(15,2)  | Government deficit                  |
| `govdef_pct_GDP`   | NUMERIC(5,2)   | Gov. deficit as % of GDP            |
| `govdebt`          | NUMERIC(15,2)  | Government debt                     |
| `govdebt_pct_GDP`  | NUMERIC(5,2)   | Gov. debt as % of GDP               |

###  `macro_money_supply`

Represents various levels of money supply (monetary aggregates).

| Column | Type           | Description                    |
|--------|----------------|--------------------------------|
| `year` | INT            | Foreign key to `macro_years`  |
| `M0`   | NUMERIC(15,2)  | Physical currency              |
| `M1`   | NUMERIC(15,2)  | M0 + demand deposits           |
| `M2`   | NUMERIC(15,2)  | M1 + short-term time deposits  |
| `M3`   | NUMERIC(15,2)  | M2 + large time deposits       |

### `crisis_events`

Tracks economic crises by year and type.

| Column        | Type | Description                                       |
|---------------|------|---------------------------------------------------|
| `year`        | INT  | Foreign key to `macro_years(year)`               |
| `crisis_type` | TEXT | Type of crisis: `Banking`, `Sovereign`, or `Currency` |

### `unemployment_long`

| Column | Type           | Description                    |
|--------|----------------|--------------------------------|
| `year` | INT            | References, Primary key to `macro_years`  |
| `month`   | TEXT  | Primary Key              |
|  `month_num` | INT  | Month in Digit           |
| `unemployment_rate`   | FLOAT  | Percent  |
