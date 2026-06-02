import requests
import pandas as pd
import os

# Create output folder path
output_folder = "E:/bluestock_mf_capstone/data/raw"

# AMFI Scheme Codes
funds = {
    "SBI_Bluechip": 119551,
    "ICICI_Bluechip": 120503,
    "Nippon_Large_Cap": 118632,
    "Axis_Bluechip": 119092,
    "Kotak_Bluechip": 120841
}

for fund_name, scheme_code in funds.items():

    print(f"\nFetching {fund_name}...")

    url = f"https://api.mfapi.in/mf/{scheme_code}"

    response = requests.get(url)

    if response.status_code == 200:

        data = response.json()

        nav_df = pd.DataFrame(data["data"])

        file_path = os.path.join(
            output_folder,
            f"{fund_name}.csv"
        )

        nav_df.to_csv(
            file_path,
            index=False
        )

        print(f"Saved: {fund_name}.csv")

    else:
        print(f"Failed for {fund_name}")