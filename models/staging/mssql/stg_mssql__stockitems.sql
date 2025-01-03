with

stockitems as (
  select * from {{ source('src_mssql', 'stockitems') }}
),

final as (

  select
    stockitemid as stock_item_id,
    stockitemname as stock_item_name,
    unitpackageid as unit_package_id,
    unitprice as unit_price,
    typicalweightperunit as typical_weight_per_unit,
    
    size,
    tags,
    brand,
    photo,
    barcode,
    taxrate,
    recommendedretailprice as recommended_retail_price,

    colorid as color_id,
    supplierid as supplier_id,
    outerpackageid as outer_package_id,
    quantityperouter as quantity_per_outer,
    ischillerstock as is_chiller_stock,
  
    customfields as custom_fields,
    leadtimedays as lead_time_days,
    searchdetails as search_details,
    internalcomments as internal_comments,
    marketingcomments as marketing_comments,

    validto as valid_to,
    validfrom as valid_from,
    lasteditedby as last_edited_by
    
  from stockitems
)

select * from final
