# Data Dictionary

## Project

**Mutual Fund Analytics Capstone**

---

# Table: fact_nav

| Column Name | Data Type | Description                 |
| ----------- | --------- | --------------------------- |
| amfi_code   | TEXT      | Unique AMFI scheme code     |
| date        | DATE      | NAV date                    |
| nav         | REAL      | Net Asset Value of the fund |

**Source:** nav_history_clean.csv

---

# Table: fact_transactions

| Column Name        | Data Type | Description                   |
| ------------------ | --------- | ----------------------------- |
| investor_id        | TEXT      | Unique investor identifier    |
| transaction_date   | DATE      | Date of transaction           |
| amfi_code          | TEXT      | Fund AMFI code                |
| transaction_type   | TEXT      | SIP, Lumpsum, or Redemption   |
| amount_inr         | REAL      | Transaction amount in INR     |
| state              | TEXT      | Investor state                |
| city               | TEXT      | Investor city                 |
| city_tier          | TEXT      | City classification (T30/B30) |
| age_group          | TEXT      | Investor age category         |
| gender             | TEXT      | Investor gender               |
| annual_income_lakh | REAL      | Annual income in lakhs        |
| payment_mode       | TEXT      | Payment method used           |
| kyc_status         | TEXT      | KYC verification status       |

**Source:** investor_transactions_clean.csv

---

# Table: fact_performance

| Column Name        | Data Type | Description                      |
| ------------------ | --------- | -------------------------------- |
| amfi_code          | TEXT      | Fund AMFI code                   |
| scheme_name        | TEXT      | Name of mutual fund scheme       |
| fund_house         | TEXT      | Asset management company         |
| category           | TEXT      | Fund category                    |
| plan               | TEXT      | Direct or Regular plan           |
| return_1yr_pct     | REAL      | 1-year return percentage         |
| return_3yr_pct     | REAL      | 3-year return percentage         |
| return_5yr_pct     | REAL      | 5-year return percentage         |
| benchmark_3yr_pct  | REAL      | Benchmark return percentage      |
| alpha              | REAL      | Alpha measure                    |
| beta               | REAL      | Beta measure                     |
| sharpe_ratio       | REAL      | Risk-adjusted return metric      |
| sortino_ratio      | REAL      | Downside risk-adjusted return    |
| std_dev_ann_pct    | REAL      | Annualized standard deviation    |
| max_drawdown_pct   | REAL      | Maximum drawdown percentage      |
| aum_crore          | REAL      | Assets Under Management (Crores) |
| expense_ratio_pct  | REAL      | Expense ratio percentage         |
| morningstar_rating | INTEGER   | Morningstar rating               |
| risk_grade         | TEXT      | Risk category of the scheme      |

**Source:** scheme_performance_clean.csv

---

# Database

**Database Name:** bluestock_mf.db

**Database Type:** SQLite

---

# Data Cleaning Rules

### NAV Data

* Converted date column to DATE format
* Removed duplicate records
* Checked missing values
* Validated NAV > 0

### Transaction Data

* Standardized transaction types
* Validated amount > 0
* Checked KYC status values
* Converted transaction dates to DATE format

### Performance Data

* Converted return columns to numeric
* Flagged negative Sharpe ratios
* Validated expense ratio range (0.1%–2.5%)

---

# Author

Rimpa Dey

Mutual Fund Analytics Capstone Internship