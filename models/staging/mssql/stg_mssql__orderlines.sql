with

orderlines as (
  select * from {{ source('src_mssql', 'orderlines') }}
),

final as (

  select
    orderlineid as orderline_id,
    orderid as order_id,
    stockitemid as stock_item_id,
    packagetypeid as package_type_id,

    taxrate as tax_rate,
    quantity,
    unitprice as unit_price,
    description,
    
    lasteditedby as last_edited_by,
    lasteditedwhen as last_edited_when

  from orderlines
)

select * from final