-- =====================================================
-- QUERY 1: Total NAV Records
-- =====================================================

SELECT COUNT(*) AS total_nav_records
FROM fact_nav;

-- =====================================================
-- QUERY 2: Total Transactions
-- =====================================================

SELECT COUNT(*) AS total_transactions
FROM fact_transactions;

-- =====================================================
-- QUERY 3: Top 5 Funds by AUM
-- =====================================================

SELECT
amfi_code,
aum_crore
FROM fact_performance
ORDER BY aum_crore DESC
LIMIT 5;

-- =====================================================
-- QUERY 4: Average NAV
-- =====================================================

SELECT
AVG(nav) AS average_nav
FROM fact_nav;

-- =====================================================
-- QUERY 5: Transactions by State
-- =====================================================

SELECT
state,
COUNT(*) AS total_transactions
FROM fact_transactions
GROUP BY state
ORDER BY total_transactions DESC;

-- =====================================================
-- QUERY 6: Transactions by Type
-- =====================================================

SELECT
transaction_type,
COUNT(*) AS total_count
FROM fact_transactions
GROUP BY transaction_type;

-- =====================================================
-- QUERY 7: Funds with Expense Ratio < 1%
-- =====================================================

SELECT
amfi_code,
expense_ratio_pct
FROM fact_performance
WHERE expense_ratio_pct < 1;

-- =====================================================
-- QUERY 8: Negative Sharpe Ratio Funds
-- =====================================================

SELECT
amfi_code,
sharpe_ratio
FROM fact_performance
WHERE sharpe_ratio < 0;

-- =====================================================
-- QUERY 9: Average Transaction Amount
-- =====================================================

SELECT
AVG(amount_inr) AS avg_transaction_amount
FROM fact_transactions;

-- =====================================================
-- QUERY 10: Top 10 States by Investment Amount
-- =====================================================

SELECT
state,
SUM(amount_inr) AS total_investment
FROM fact_transactions
GROUP BY state
ORDER BY total_investment DESC
LIMIT 10;