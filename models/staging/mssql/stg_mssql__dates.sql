with stg_date as (
   
    {{ dbt_date.get_date_dimension("2013-01-01", "9999-12-31") }}
)

select 
    *
from stg_date
