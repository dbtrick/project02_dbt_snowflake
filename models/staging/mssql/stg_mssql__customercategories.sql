with

customercategories as (
  select * from {{ source('src_mssql', 'customercategories') }}
),

final as (

  select
    customercategoryid as customer_category_id,
    customercategoryname as customer_category_name,
    validto as valid_to,
    validfrom as valid_from,
    lasteditedby as last_edited_by

  from customercategories
)

select * from final