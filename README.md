# Underconsutrction (Current Project)
# National Macro Insights: Advanced SQL Analytics on Crises & Recovery (2000–2025) 

This project explores economic trends and crisis patterns using advanced SQL techniques on data from [GlobalMacroData.com](https://www.globalmacrodata.com/data.html). It simulates the kind of deep analytical work a **data analyst or business analyst** would perform in the finance, policy, or consulting sector.

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

This project uses a **3-table normalized schema**:

###  `macro_indicators`
| Column | Type | Description |
|--------|------|-------------|
| `indicator_id` | INT (PK) |
| `country_id` | INT (FK) |
| `year` | INT |
| `rGDP`, `infl`, `govdebt_GDP`, ... | FLOAT | Economic indicators |

###  `crisis_events` (optional, derived)
| Column | Type | Description |
|--------|------|-------------|
| `event_id` | INT (PK) |
| `country_id` | INT (FK) |
| `year` | INT |
| `crisis_type` | TEXT | One of `'Banking'`, `'Currency'`, `'Sovereign Debt'` |

---

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
