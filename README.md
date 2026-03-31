Medicare Enrollment Data Pipeline & Dashboard

Project Overview
This project demonstrates a complete data engineering lifecycle: from automated data ingestion using Kestra, storage and transformation in Google BigQuery, to final visualization in Looker Studio. The dataset focuses on Medicare Beneficiary enrollment data, providing insights into geographic distributions.

Live Dashboard
(https://lookerstudio.google.com/reporting/54e6980e-37f3-4ebf-9e60-54f31c7bd601)


Tech Stack
Orchestration: Kestra (Workflow automation for API ingestion).

Data Warehouse: Google BigQuery (SQL-based storage).

Visualization: Looker Studio (BI Reporting).

Language: SQL (for data casting and transformations).

Dashboard Features
The dashboard consists of two primary tiles designed to meet the evaluation criteria for categorical and temporal distribution:

Tile 1: Geographic Distribution (Categorical)

Type: Horizontal Bar Chart.

Description: Displays the total number of Medicare beneficiaries across different U.S. States.

Technical Note: Uses a BENE_GEO_LVL = 'State' filter to ensure data accuracy and prevent double-counting of national totals.

Tile 2: Enrollment Snapshot (Temporal)

Type: Column Chart / Table.

Description: Visualizes the enrollment data for the 2013 period.

Technical Note: Implemented a calculated field using CAST(REPLACE(TOT_BENES, ',', '') AS NUMBER) to convert raw string data from the API into aggregatable numeric values.

Data Pipeline Challenges


Data Cleaning: Handled non-numeric characters and "Year" suffixes within the raw BigQuery strings.

Schema Mapping: Successfully mapped BigQuery table schemas to Looker Studio dimensions and metrics.

Filtering: Applied logic to separate State-level data from National-level aggregates to maintain data integrity.