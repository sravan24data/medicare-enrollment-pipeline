import requests
import pandas as pd
import os

def extract_data():
    # 2026 Medicare Monthly Enrollment API Endpoint
    api_url = "https://data.cms.gov/data-api/v1/dataset/d7fabe1e-d19b-4333-9eff-e80e0643f2fd/data"
    
    print("Connecting to CMS API...")
    # We fetch a sample of 5000 rows to start
    response = requests.get(api_url, params={"size": 5000})
    
    if response.status_code == 200:
        data = response.json()
        df = pd.DataFrame(data)
        
        # Create a 'data' folder if it doesn't exist
        os.makedirs('data', exist_ok=True)
        
        # Save the file locally
        file_path = "data/medicare_raw.csv"
        df.to_csv(file_path, index=False)
        print(f"Success! Saved {len(df)} rows to {file_path}")
    else:
        print(f"Error: API returned status code {response.status_code}")

if __name__ == "__main__":
    extract_data()