with

customers as (
  select * from {{ source('src_website', 'customers') }}
),

final as (

  select
    customerid as customer_id,
    customername as customer_name,
    customercategoryname as customer_category_name,
    primarycontact as primary_contact,
    alternatecontact as alternate_contact,
    phonenumber as phone_number,
    runposition as run_position,
    buyinggroupname as buying_group_name,

    deliverymethod as delivery_method,
    deliverylocation as delivery_location,
    deliveryrun as delivery_run,
    cityname as city_name,
    faxnumber as fax_number,
    websiteurl as website_url
    
  from customers
)

select * from final