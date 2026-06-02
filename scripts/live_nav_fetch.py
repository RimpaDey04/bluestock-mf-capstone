import requests
import pandas as pd

url = "https://api.mfapi.in/mf/125497"

response = requests.get(url)

if response.status_code == 200:
    data = response.json()

    nav_df = pd.DataFrame(data["data"])

    print(nav_df.head())

    nav_df.to_csv(
        "E:/bluestock_mf_capstone/data/raw/HDFC_TOP100_NAV.csv",
        index=False
    )

    print("NAV data saved successfully!")
else:
    print("API request failed")