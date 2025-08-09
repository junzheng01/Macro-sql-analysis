# National Macro Insights: Advanced SQL Analytics on Crises & Recovery (2001–2024) 

**Tech Stack:** PostgreSQL, SQL, ETL, Data Modeling, Data Normalization, Performance Tuning, Tableau (optional if dashboard added)  
**Dataset Sources:**  
- [GlobalMacroData.com](https://www.globalmacrodata.com/data.html)
- [Bureau of Labor Statistics (bls.gov) - U-3 Unemployment Rate](https://data.bls.gov/timeseries/LNS14000000)

--- 
## Project Overview
This project focuses on **U.S. macroeconomic trends** from 2000–2024, using a cleaned dataset with **26 columns** of curated economic indicators.  
The source data (originally from GlobalMacroData) was cleaned in Excel to remove irrelevant countries and harmonize formats, resulting in a U.S.-only dataset optimized for **deep historical analysis**.

---

## Dataset Summary
- **Coverage:** 2000–2024 (annual + monthly metrics)
- **Rows:** 26 years of annual data + monthly unemployment rates
- **Columns:** 26 key economic indicators, grouped into:
  - GDP (nominal, real, per capita, deflator, USD conversions)
  - Inflation & unemployment
  - Government finance (expenditure, revenue, debt, deficit)
  - International trade (exports, imports, % of GDP)
  - Money supply (M0–M3)
  - Crisis events (Banking, Sovereign, Currency)
  - Monthly U-3 unemployment rates

---

## Why Focus on the U.S.?
- Enables **high-resolution analysis** of U.S. crises such as the **2008 Financial Crisis** and **2020 COVID-19 pandemic**.
- Supports **business-relevant metrics** for U.S. finance & fintech use cases:
  - Lending threshold adjustments
  - Credit risk model stress testing
  - Inflation-driven policy scenario planning

---

## Objectives
- **Structure & Normalize** real-world macroeconomic data for fast and reliable querying.
- **Apply Advanced SQL** (CTEs, window functions, subqueries, conditional aggregation) to uncover key historical patterns.
- **Identify Crisis Impacts** on GDP, unemployment, and inflation — and measure recovery timelines.
- **Generate Insights** that inform lending thresholds, investment strategies, and economic forecasts.

---

## Business Relevance
Macroeconomic shocks directly influence:
- **Credit Risk Models** — Adjusting approval thresholds in recessionary periods.
- **Bank Lending Decisions** — Calibrating interest rates based on inflation spikes.
- **Portfolio Management** — Allocating assets defensively during downturns.
- **Policy Advisory** — Quantifying recovery lags for fiscal and monetary policy planning.

---

## Project Architecture
**1. Data Ingestion & Staging**  
- Loaded raw macroeconomic CSVs into a **staging table** (`us_macro_data`).

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

---
## Repository Structure
Macro-sql-analysis/
│
├── Analysis/ # Business-focused queries
│ ├── 0_QualityCheck.sql
│ ├── 1_GDPTrend_Analysis.sql
│ ├── 2_Crisis_Impact.sql
│ └── 3_UnemploymentTrend.sql
│
├── ETL/ # Data staging & normalization scripts
│ ├── 01_schema_staging.sql
│ ├── 02_schema_normalized.sql
│ ├── 03_etl_normalized.sql
│ └── 04_UnemployWide-Long.sql
│
├── data/ #  datasets
│ ├── USA_macro.csv
│ ├── Unemployment_rate.csv
│ ├── schema_design.md
└── README.md

