with 

stateprovinces as (
  select * from {{ source('src_mssql', 'stateprovinces') }}
),

final as (

  select
    stateprovinceid as state_province_id,
    countryid as country_id,
    stateprovincename as state_province_name,
    stateprovincecode as state_province_code,
    salesterritory as sales_territory,
    border,
    latestrecordedpopulation as latest_recorded_population,
    validto as valid_to,
    validfrom as valid_from,
    lasteditedby as last_edited_by
  
  from stateprovinces
)

select * from final 