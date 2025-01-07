with

stockitem as (
  select * from {{ ref('stg_mssql__stockitems') }}
),

packagetype as (
  select * from {{ ref('stg_mssql__packagetypes') }}
),

color as (
  select * from {{ ref('stg_mssql__colors') }}
),

final as (

  select
    {{ dbt_utils.generate_surrogate_key(['stockitem.stock_item_id'])}} as stock_item_key,

    stockitem.stock_item_id,
    stockitem.stock_item_name,
    stockitem.unit_price,

    color.color_name,
    packagetype.package_type_name,

    stockitem.typical_weight_per_unit,
    stockitem.size,
    stockitem.tags,
    stockitem.brand,
    stockitem.photo,
    stockitem.barcode,
    stockitem.taxrate,
    stockitem.recommended_retail_price,
    stockitem.quantity_per_outer,
    stockitem.lead_time_days,
    stockitem.valid_from,
    stockitem.valid_to,
    stockitem.last_edited_by

  from stockitem

  left join packagetype
    on stockitem.outer_package_id = packagetype.package_type_id
  left join color 
    on stockitem.color_id = color.color_id

)

select * from final