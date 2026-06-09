-- =========================================
-- DIMENSION TABLE
-- =========================================

CREATE TABLE IF NOT EXISTS dim_fund (
    amfi_code TEXT PRIMARY KEY,
    scheme_name TEXT,
    fund_house TEXT,
    category TEXT,
    plan TEXT,
    risk_grade TEXT
);

-- =========================================
-- FACT NAV TABLE
-- =========================================

CREATE TABLE IF NOT EXISTS fact_nav (
    amfi_code TEXT,
    nav_date DATE,
    nav REAL,
    daily_return REAL,

    FOREIGN KEY (amfi_code)
    REFERENCES dim_fund(amfi_code)
);

-- =========================================
-- FACT TRANSACTIONS TABLE
-- =========================================

CREATE TABLE IF NOT EXISTS fact_transactions (
    investor_id TEXT,
    transaction_date DATE,
    amfi_code TEXT,
    transaction_type TEXT,
    amount_inr REAL,
    state TEXT,
    city TEXT,
    city_tier TEXT,
    age_group TEXT,
    gender TEXT,
    annual_income_lakh REAL,
    payment_mode TEXT,
    kyc_status TEXT,

    FOREIGN KEY (amfi_code)
    REFERENCES dim_fund(amfi_code)
);

-- =========================================
-- FACT PERFORMANCE TABLE
-- =========================================

CREATE TABLE IF NOT EXISTS fact_performance (
    amfi_code TEXT,

    return_1yr_pct REAL,
    return_3yr_pct REAL,
    return_5yr_pct REAL,

    benchmark_3yr_pct REAL,

    alpha REAL,
    beta REAL,

    sharpe_ratio REAL,
    sortino_ratio REAL,

    std_dev_ann_pct REAL,
    max_drawdown_pct REAL,

    aum_crore REAL,
    expense_ratio_pct REAL,

    morningstar_rating INTEGER,

    negative_sharpe_flag BOOLEAN,

    FOREIGN KEY (amfi_code)
    REFERENCES dim_fund(amfi_code)
);



SELECT name
FROM sqlite_master
WHERE type='table';


