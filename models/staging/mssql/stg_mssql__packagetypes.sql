with 

packagetypes as (
  select * from {{ source('src_mssql', 'packagetypes') }}
),

final as (

  select 
    packagetypeid as package_type_id,
    packagetypename as package_type_name,
    validto as valid_to,
    validfrom as vaid_from,
    lasteditedby as last_edited_by,
    
  from packagetypes
)

select * from final