with 

stg_date as (
    -- Referencing the staging table stg_mssql__date
    select * from {{ ref('stg_mssql__dates') }}
),

{# -- Staging Table for Date Dimension
 stg_mssql__date AS (
    -- Generating a date range from 2013-01-01 to 9999-12-31
    {{ dbt_date.get_date_dimension("2013-01-01", "9999-12-31") }}
), #}

-- Date Dimension Logic
date_dimension AS (
    SELECT
        date_day,
        -- Standard Date Attributes
        DAY(date_day) AS day_of_month,
        WEEK(date_day) AS week_of_year,
        DAYOFWEEK(date_day) AS day_of_week,
        TO_CHAR(date_day, 'Month') AS month_name,
        TO_CHAR(date_day, 'Day') AS day_name,
        -- Weekend Check (1 = Sunday, 7 = Saturday)
        CASE WHEN DAYOFWEEK(date_day) IN (1, 7) THEN TRUE ELSE FALSE END AS is_weekend,
        -- Holiday Check (use your holiday table or hardcoded dates)
        CASE WHEN date_day IN ('2023-12-25', '2024-01-01') THEN TRUE ELSE FALSE END AS is_holiday,
        -- Year and Quarter Details
        EXTRACT(YEAR FROM date_day) AS year,
        EXTRACT(MONTH FROM date_day) AS month,
        EXTRACT(QUARTER FROM date_day) AS quarter,
        -- Weekday and Weekend Flags
        CASE WHEN DAYOFWEEK(date_day) IN (2, 3, 4, 5, 6) THEN TRUE ELSE FALSE END AS is_weekday,
        -- Other custom fields like fiscal year and fiscal quarter can be added
        -- Example: Fiscal Year if the fiscal year starts in October
        CASE WHEN EXTRACT(MONTH FROM date_day) >= 10 THEN EXTRACT(YEAR FROM date_day) + 1 
             ELSE EXTRACT(YEAR FROM date_day) END AS fiscal_year,
        CASE WHEN EXTRACT(MONTH FROM date_day) IN (10, 11, 12) THEN 'Q4'
             WHEN EXTRACT(MONTH FROM date_day) IN (1, 2, 3) THEN 'Q1'
             WHEN EXTRACT(MONTH FROM date_day) IN (4, 5, 6) THEN 'Q2'
             ELSE 'Q3' END AS fiscal_quarter
    FROM stg_date
),

final as (

  -- Final Dimension Table Output
SELECT
    {{ dbt_utils.generate_surrogate_key(['date_day']) }} AS date_key, 
     -- Surrogate Key
    date_day,
    day_of_month,
    week_of_year,
    day_of_week,
    month_name,
    day_name,
    is_weekend,
    is_holiday,
    year,
    month,
    quarter,
    is_weekday,
    fiscal_year,
    fiscal_quarter

FROM date_dimension

)

select * from final 

