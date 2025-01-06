with

mssql_supplier as (
  select * from {{ ref('stg_mssql__suppliers') }}
),

website_supplier as (
  select * from {{ ref('stg_website__suppliers') }}
),

suppliercategorie as (
  select * from {{ ref('stg_mssql__suppliercategories') }}
),

final as (

  select 
    {{ dbt_utils.generate_surrogate_key(['mssql_supplier.supplier_id'])}},

    mssql_supplier.supplier_id,
    mssql_supplier.supplier_name,

    website_supplier.primary_contact,
    website_supplier.alternate_contact,

    suppliercategorie.supplier_category_name,

    mssql_supplier.supplier_reference,
    mssql_supplier.payment_days,
    mssql_supplier.phone_number,
    mssql_supplier.postal_code,
    mssql_supplier.valid_from,
    mssql_supplier.valid_to,
    mssql_supplier.last_edited_by

  from mssql_supplier

  left join website_supplier
    on mssql_supplier.supplier_id = website_supplier.supplier_id
  left join suppliercategorie
    on mssql_supplier.supplier_category_id = suppliercategorie.supplier_category_id

)

select * from final