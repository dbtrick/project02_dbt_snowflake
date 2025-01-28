## Overview
For this project, I collaborated with a sample client, Wide World Importers (WWI), to enhance their business operations through data-driven insights. Utilizing cutting-edge technologies, I developed a robust end-to-end solution for data management and analytics. This project involved leveraging Snowflake for scalable data storage, Airbyte for efficient data integration, dbt for automated data transformations, Git and GitHub for version control, GitHub Actions for CI/CD automation, Looker for insightful data visualization, and Dagster for orchestrating data workflows. The dataset provided by Wide World Importers offered valuable insights into their business activities, enabling the creation of actionable analytics and improving operational efficiency. For more information about the Wide World Importers dataset, visit [Microsoft's official documentation.](https://learn.microsoft.com/en-us/sql/samples/wide-world-importers-what-is?view=sql-server-ver16)

### Project Data Architecture Diagram
![modern-data-stack (1)](https://github.com/user-attachments/assets/d5e9095b-2c6b-4a8b-b2e5-210e3de212fc)

### dbt Project Structure
## [Staging Layer](https://github.com/dbtrick/project02_dbt_snowflake/tree/main/models/staging)
- **Materialized as Views:** Data is materialized as views.
- **One-to-One to the Sources:** Each staging model corresponds directly to a source table.
- **Transformations:**
    - **Casting:** Ensure data types are correctly cast.
    - **Renaming:** Rename columns to align with naming conventions.
    - **SQL Conditional Statements:** Utilize CASE WHEN statements for conditional logic.
- **Automation:** Utilized dbt [codegen](https://hub.getdbt.com/dbt-labs/codegen/latest/) to automate the extraction of source tables and columns.
  
### [Warehouse Layer](https://github.com/dbtrick/project02_dbt_snowflake/tree/main/models/warehouse)
- **Facts and Dimensions Tables:** Create fact and dimension tables based on the star schema.
- **Surrogate Keys:** Utilized [dbt_utils](https://hub.getdbt.com/dbt-labs/dbt_utils/latest/) to generate surrogate keys.
  
### [Marts Layer](https://github.com/dbtrick/project02_dbt_snowflake/tree/main/models/marts)
- **One Big Table:** Aggregate data into a single table for easy access and analysis.
- **Cube Table:** Create aggregate tables based on business requirements.

### [CI/CD with GitHub Actions](https://github.com/dbtrick/project02_dbt_snowflake/blob/main/.github/workflows/dbt_build_ci.yml)
- **Automate dbt Build:** Automate the dbt build process before deploying models.
- **Automate dbt Documentation:** Generate dbt documentation and host it using GitHub Pages.
- **View dbt documentation:** https://dbtrick.github.io/project01_dbt_snowflake/#!/overview

### [Orchestration with Dagster](https://github.com/dbtrick/project02_dbt_snowflake/tree/main/dw_dagster)
- **Airbyte for Extraction:** Orchestrate the data extraction process using Airbyte.
- **dbt for Transformation:** Orchestrate the data transformation process using dbt.

### [Data Visualization using Looker](https://lookerstudio.google.com/reporting/4b27a047-c5e6-4e6a-bd0e-f913677c2b79/page/Dub4D)
- Enhanced transaction insights with a detailed "Contribution of Each Payment Method to Total Transactions" chart.
- Boosted customer insights through a "Top Spending Customer Categories" chart.
- Improved revenue tracking using a "Transaction Trends by Type" analysis
- Refined customer segmentation by identifying "Engagement Levels by Buying Group and Customer Category."



