# Underconsutrction (Current Project)
# National Macro Insights: Advanced SQL Analytics on Crises & Recovery (2000–2025) 

This project explores economic trends and crisis patterns using advanced SQL techniques on data from [GlobalMacroData.com](https://www.globalmacrodata.com/data.html) and Unemployment Rate (Data Folder). It simulates the kind of deep analytical work a **data analyst or business analyst** would perform in the finance, policy, or consulting sector.

---

##  Goals

- Normalize and structure real-world economic data for analysis
- Practice advanced SQL (window functions, CTEs, subqueries, joins, views)
- Identify patterns in GDP recovery, inflation, government spending, and crises
- Build reusable SQL logic for macroeconomic dashboards and insights

---

##  Dataset

- Source: Global Macro Data — time-series macroeconomic indicators for 150+ countries
- Coverage: 1950–2025 (but focus analysis on 2000–2025 for relevance)
- Size: ~58,000 rows, 56 columns

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

## 🛠️ SQL Techniques Demonstrated

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
