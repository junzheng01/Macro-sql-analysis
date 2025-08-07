# National Macro Insights: Advanced SQL Analytics on Crises & Recovery (2001–2024) 

This project explores economic trends and crisis patterns using advanced SQL techniques on data from 
- [GlobalMacroData.com](https://www.globalmacrodata.com/data.html)
- [Bureau of Labor Statistics (bls.gov) - U-3 Unemployment Rate](https://data.bls.gov/timeseries/LNS14000000)

It simulates the kind of deep analytical work a **data analyst or business analyst** would perform in the finance, policy, or consulting sector.

---

##  Goals
Understand how macroeconomic conditions evolve over time and impact national economies by:
- Normalize and structure real-world economic data for analysis
- Practice advanced SQL (window functions, CTEs, subqueries, joins, views)
- Identify patterns in GDP recovery, inflation, government spending, and crises
- Build reusable SQL logic for macroeconomic dashboards and insights
- Assessing correlation between key economic indicators (e.g. inflation vs unemployment)

---

##  Dataset Overview

Source: Global Macro Data — time-series macroeconomic indicators for 150+ countries
- Coverage: 1950–2025 (but focus analysis on 2000–2024 for relevance)
- Size: ~58,000 rows, 56 columns
- Stores values in the **Millions**

Source: Bureau of Labor Statistics (BLS) monthly unemployment rate (U‑3), derived from the Current Population Survey.
- Period: January 2000 through December 2024, seasonally adjusted U‑3 unemployment rate for the U.S.
- Size 26 rows, 13 columns

---

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

## POSTGRESQL Techniques Demonstrated

| Technique | Where Used |
|----------|------------|
|  CTEs (WITH clauses) | Query decomposition, temporary tables |
|  Window Functions | Year-over-year growth, rankings, rolling averages |
|  Subqueries | Comparative analysis, filtering |
|  Advanced Joins | Multi-table, LEFT JOIN for missing data |
|  Data Normalization | Entity separation (countries, indicators, crises) |
|  Constraints & Governance | PK/FK, null handling, boolean parsing |
|  Views | Cleaned views for dashboard export |
|  Optional: Indexing, Role Management | Performance + governance for production

---

## Key Analyses

- **Crisis Detection**: Identify country-years with simultaneous GDP decline and inflation spike  
- **Recovery Duration**: Time from GDP trough to full recovery by country  
- **Correlation Patterns**: Inflation vs. unemployment (Phillips curve)  
- **Missing Data Audit**: Track NULLs over time and across countries  

---

## Sample Insights

>  *The U.S. recovered from the 2008 crisis faster than most G7 peers, signaling stronger financial infrastructure resilience — useful for fintech credit risk models.*  

>  *Emerging markets often face a longer lag between inflation control and unemployment improvement — a key consideration for lending expansion.*  

---
## For Employers

This project demonstrates:  
- Complex SQL skills (joins, CTEs, window functions)  
- Business-oriented thinking applied to macroeconomic data  
- End-to-end project ownership: ETL → Analysis → Insight  

Contact: [junzheng01@gmail.com](mailto:junzheng01@gmail.com)
