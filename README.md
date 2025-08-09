# National Macro Insights: Advanced SQL Analytics on Crises & Recovery (2001–2024) 

**Tech Stack:** PostgreSQL, SQL, ETL, Data Modeling, Data Normalization, Performance Tuning
**Dataset Sources:**  
- [GlobalMacroData.com](https://www.globalmacrodata.com/data.html)
- [Bureau of Labor Statistics (bls.gov) - U-3 Unemployment Rate](https://data.bls.gov/timeseries/LNS14000000)

--- 

## Project Overview
This project simulates an **end-to-end financial analytics workflow** that a Data Analyst or Business Analyst in **finance, consulting, or policy** might perform.  
It integrates, cleans, and analyzes curated **U.S.-only macroeconomic data** to uncover **GDP, inflation, and unemployment trends during major economic crises** — with an emphasis on insights that can guide **credit risk modeling** and **portfolio management decisions**.

---

## Objectives
- **Structure & Normalize** cleaned U.S. economic data for efficient querying.
- **Apply Advanced SQL** (CTEs, window functions, subqueries, conditional aggregation) to uncover key historical patterns.
- **Identify Crisis Impacts** on GDP, unemployment, and inflation — and measure recovery timelines.
- **Generate Insights** relevant to lending thresholds, investment strategies, and economic forecasts.

---

## Dataset Summary
This project uses **cleaned, U.S.-only datasets** from 2000–2024, prepared in Excel before importing into PostgreSQL.

### 1. USA_macro.csv
- **Rows:** 25 years (2000–2024)
- **Columns (33):**
  - GDP metrics (nominal, real, per capita, deflator, USD conversions)
  - Inflation & unemployment (annual)
  - Government finance (expenditure, revenue, debt, deficit)
  - International trade (exports, imports, % of GDP)
  - Money supply (M0–M3)
  - Crisis flags (Banking, Sovereign, Currency)
  - USD-converted trade and GDP values
- **Source:** GlobalMacroData.com (cleaned & U.S.-filtered)

### 2. Unemployment_rate.csv
- **Rows:** 25 years (2000–2024)
- **Columns (13):** Year + monthly U-3 unemployment rate (Jan–Dec)
- **Source:** U.S. Bureau of Labor Statistics (seasonally adjusted)
- **Transformation:** Converted from wide to long format in SQL for trend analysis
  
---

### Why This Matters
By narrowing the scope to the **United States**, the project:
- Enables **deep analysis** of specific economic shocks like the 2008 Financial Crisis and 2020 COVID-19 recession.
- Demonstrates **real-world analyst workflow** — data cleaning, normalization, SQL analysis, and business interpretation.
- Supports **business-relevant insights** for credit risk modeling, lending decisions, and economic forecasting.

Business Relevance, Macroeconomic shocks directly influence:
- **Credit Risk Models** — Adjusting approval thresholds in recessionary periods.
- **Bank Lending Decisions** — Calibrating interest rates based on inflation spikes.
- **Portfolio Management** — Allocating assets defensively during downturns.
- **Policy Advisory** — Quantifying recovery lags for fiscal and monetary policy planning.
  
---

## Project Architecture
**1. Data Ingestion & Staging**  
- Cleaned raw macroeconomic CSVs in Excel, Pivot Tables, Filter 
- Loaded cleaned macroeconomic CSVs into a **staging table** (`us_macro_data`).

**2. Data Normalization & Schema Design**  
- Designed a **7-table normalized schema** with **PK/FK constraints** for:
  - GDP (`macro_gdp`)
  - Inflation & Unemployment (`macro_years`)
  - Trade (`macro_trade`)
  - Government Finance (`macro_government`)
  - Money Supply (`macro_money_supply`)
  - Crisis Events (`crisis_events`)
  - Monthly Unemployment (`unemployment_long`)

**3. ETL Processing**  
- Extracted → Transformed → Loaded data into normalized tables.
- Converted **wide-format** unemployment data into **long-format** for trend analysis.

**4. Analysis Queries**  
- **GDP Recovery Analysis:** Measured contractions & rebounds post-2008 and 2020.
- **Inflation Ranking:** Identified top 10% inflationary years since 2001.
- **Crisis Correlation:** Compared GDP growth in years with vs. without banking crises.
- **Unemployment Trends:** Calculated time to return to pre-crisis employment levels.

---

## Key Insights
| Insight | Finding | Business Implication |
|---------|---------|----------------------|
| GDP Recovery | Post-crisis rebound in 2021 exceeded $1.05T growth | Signals strong post-shock recovery potential |
| Inflation Peaks | 2021 (5%) & 2022 (8%) ranked top 10% inflation years | Suggests tightening monetary policy |
| Unemployment | Sharp rise in 2009 & 2020; recovery lag of ~2 years | Affects labor market forecasts & loan default rates |
| Crisis Correlation | GDP averages significantly lower in crisis years | Reinforces need for stress testing models |

---

## Advanced SQL Techniques Used
| Technique | Example in Project |
|-----------|-------------------|
| **CTEs** (`WITH`) | Breaking down GDP recovery calculations into stages |
| **Window Functions** | `LAG()` for YoY changes, `PERCENT_RANK()` for inflation percentile |
| **Conditional Aggregation** | Comparing GDP in crisis vs. non-crisis years |
| **Multi-Table Joins** | Combining GDP, inflation, and crisis data in trend queries |
| **Data Normalization** | 3NF schema to eliminate redundancy |
| **Indexing** | Performance tuning on `year` and `crisis_type` joins |

