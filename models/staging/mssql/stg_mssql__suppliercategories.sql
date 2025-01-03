with

suppliercategories as (
  select * from {{ source('src_mssql', 'suppliercategories') }}
),

final as (

  select
    suppliercategoryid as supplier_category_id,
    suppliercategoryname as supplier_category_name,
    validto as valid_to,
    validfrom as valid_from,
    lasteditedby as last_edited_by

  from suppliercategories
)

select * from final