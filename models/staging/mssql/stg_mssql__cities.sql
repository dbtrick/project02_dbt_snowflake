
with 

cities as (
  select * from {{ source('src_mssql', 'cities') }}
),

final as (

  select  
    cityid as city_id,
    stateprovinceid as state_province_id,
    cityname as city_name,
    location as location,
    latestrecordedpopulation as last_recorded_population,
    validto as valid_to,
    validfrom as valid_from,
    lasteditedby as last_edited_by

  from cities
)

select * from final