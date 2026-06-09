import pandas as pd
from sqlalchemy import create_engine

# Create database connection
engine = create_engine(
    "sqlite:///data/db/bluestock_mf.db"
)

# Load cleaned CSV files
nav = pd.read_csv(
    "data/processed/nav_history_clean.csv"
)

transactions = pd.read_csv(
    "data/processed/investor_transactions_clean.csv"
)

performance = pd.read_csv(
    "data/processed/scheme_performance_clean.csv"
)

# Load into database tables
nav.to_sql(
    "fact_nav",
    engine,
    if_exists="replace",
    index=False
)

transactions.to_sql(
    "fact_transactions",
    engine,
    if_exists="replace",
    index=False
)

performance.to_sql(
    "fact_performance",
    engine,
    if_exists="replace",
    index=False
)

print("Data loaded successfully!")