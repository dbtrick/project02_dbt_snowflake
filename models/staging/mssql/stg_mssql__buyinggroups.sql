with 

buyinggroups as (
  select * from {{ source('src_mssql', 'buyinggroups') }}
),

final as (

  select
    buyinggroupid as buying_group_id,
    buyinggroupname as buying_group_name,   
    validto as valid_to,
    validfrom as valid_from,
    lasteditedby as last_edited_by
  
  from buyinggroups
)

select * from final