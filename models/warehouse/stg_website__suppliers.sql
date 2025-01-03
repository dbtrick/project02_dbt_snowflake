with

suppliers as (
  select * from {{ source('src_website', 'suppliers') }}
),

final as (
  
  select
    supplierid as supplier_id,
    suppliername as supplier_name,
    supplierreference as supplier_reference,
    suppliercategoryname as supplier_category_name,
    primarycontact as primary_contact,
    alternatecontact as alternate_contact,
    phonenumber as phone_number,
    cityname as city_name,
    faxnumber as fax_number,
    deliverymethod as delivery_method,
    websiteurl as website_url
  
  from suppliers
)

select * from final