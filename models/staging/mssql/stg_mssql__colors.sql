with

colors as (
  select * from {{ source('src_mssql', 'colors') }}
),

final as (

  select 
    colorid as color_id,
    colorname as color_name,
    validto as valid_to,
    validfrom as valid_from,
    lasteditedby as last_edited_by

  from colors
)

select * from final 