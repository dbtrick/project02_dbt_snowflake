with 

countries as (
  select * from {{ source('src_mssql', 'countries') }}
),

final as (

  select  
    countryid as country_id,
    countryname as country_name,
    formalname as formal_name,
    countrytype as country_type,
    region,
    subregion as sub_region,
    continent,
    border,
    isoalpha3code as iso_alpha3_code,
    isonumericcode as iso_numeric_code,
    latestrecordedpopulation as last_recorded_population,
    validfrom as valid_from,
    validto as valid_to,
    lasteditedby as last_edited_by
    
  from countries
)

select * from final
