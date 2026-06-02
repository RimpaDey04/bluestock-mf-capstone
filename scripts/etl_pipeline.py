import os
import pandas as pd

RAW_PATH = "E:/bluestock_mf_capstone/data/raw"

files = [f for f in os.listdir(RAW_PATH)
         if f.endswith(".csv")]

print(f"\nTotal CSV Files Found: {len(files)}")

for file in files:

    path = os.path.join(RAW_PATH,file)

    df = pd.read_csv(path)

    print("\n"+"="*60)
    print("FILE:",file)

    print("\nShape:")
    print(df.shape)

    print("\nColumns:")
    print(df.columns.tolist())

    print("\nData Types:")
    print(df.dtypes)

    print("\nHead:")
    print(df.head())

    print("\nMissing Values:")
    print(df.isnull().sum())

    print("\nDuplicate Rows:")
    print(df.duplicated().sum())