with

cities as (
  select * from {{ ref('stg_mssql__cities') }}
),

stateprovinces as (
  select * from {{ ref('stg_mssql__stateprovinces') }}
),

countries as (
  select * from {{ ref('stg_mssql__countries') }}
),

final as (

  select
    {{ dbt_utils.generate_surrogate_key(['cities.city_id']) }} as city_key,

    cities.city_id,
    cities.city_name,

    stateprovinces.state_province_name,
    stateprovinces.state_province_code,
    stateprovinces.sales_territory,

    countries.country_name,
    countries.region,
    countries.sub_region,
    countries.continent,
    countries.country_type,

    cities.last_recorded_population,
    cities.valid_from,
    cities.valid_to

  from cities
  
  left join stateprovinces
    on cities.state_province_id = stateprovinces.state_province_id
  left join countries
    on stateprovinces.country_id = countries.country_id

)

select * from final