#  Global Macro Insights: Advanced SQL Analytics on Crises & Recovery (2000–2025)

This project explores global economic trends and crisis patterns using advanced SQL techniques on data from [GlobalMacroData.com](https://www.globalmacrodata.com/data.html). It simulates the kind of deep analytical work a **data analyst or business analyst** would perform in the finance, policy, or consulting sector.

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

### 1. `countries`
| Column | Type | Description |
|--------|------|-------------|
| `country_id` | INT (PK) | Unique ID |
| `countryname` | TEXT | Country full name |
| `ISO3` | TEXT | 3-letter country code |

### 2. `macro_indicators`
| Column | Type | Description |
|--------|------|-------------|
| `indicator_id` | INT (PK) |
| `country_id` | INT (FK) |
| `year` | INT |
| `rGDP`, `infl`, `govdebt_GDP`, ... | FLOAT | Economic indicators |

### 3. `crisis_events` (optional, derived)
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

##  Key Business/Analysis Questions (To Implement in `/queries/`)

Each one lists skills you’ll practice. Try writing each yourself first!

### 1. Which countries had the fastest real GDP recovery after the 2008 crisis?
-  *Skills:* `LAG()`, `RANK() OVER`, `CTE`, `CASE`, `PERCENT_CHANGE`

---

### 2. Which countries had overlapping crises (banking + sovereign debt)?
-  *Skills:* `UNION ALL`, filtering, `JOIN`, data transformation

---

### 3. Which years saw the most global crises across countries?
-  *Skills:* `GROUP BY`, subqueries, `SUM(CASE WHEN...)`

---

### 4. How does inflation correlate with unemployment over time?
-  *Skills:* `JOIN`, `CORRELATION` (or export to BI tool), `ROLLING AVG`, `LAG()`

---

### 5. Which countries run the highest trade surpluses (exports - imports as % of GDP)?
-  *Skills:* `CTE`, `RANK() OVER`, arithmetic

---

### 6. What are 3-year rolling averages of inflation for each country?
-  *Skills:* `WINDOW FRAME: ROWS BETWEEN`, `PARTITION BY`

---

### 7. How did government debt change during and after crisis years?
-  *Skills:* `CASE`, `FILTER`, subqueries, `OUTER JOIN` with `crisis_events`

---

### 8. Which countries consistently increased consumption as a % of GDP?
-  *Skills:* `CTE`, `WINDOW FUNCTION`, `CASE`, `AVG()`

---

## Tableau Dashboard

