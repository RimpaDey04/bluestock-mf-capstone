from sqlalchemy import create_engine
import os

# Create db folder if it doesn't exist
os.makedirs("data/db", exist_ok=True)

# Create SQLite database file
engine = create_engine("sqlite:///data/db/bluestock_mf.db")

# Open and close connection
conn = engine.connect()
conn.close()

print("✅ SQLite database created successfully!")