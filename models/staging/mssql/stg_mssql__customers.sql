with 

customers as (
  select * from {{ source('src_mssql', 'customers') }}
),

final as (

  select 
    customerid as customer_id,
    customername as customer_name,
    primarycontactpersonid as primary_contact_personid,
    alternatecontactpersonid as alternate_contact_personid,
    customercategoryid as customer_category_id,
    accountopeneddate as account_opened_date,

    billtocustomerid as bill_customer_id,
    creditlimit as credit_limit,
    deliveryrun as delivery_run,
    paymentdays as payment_days,
    phonenumber as phone_number,
    runposition as run_position,

    buyinggroupid as buying_group_id,
    deliverycityid as delivery_city_id,
    deliverymethodid as delivery_method_id,
    deliverylocation as delivery_location,
    deliverypostalcode as delivery_postal_code,
    isoncredithold as ison_credit_hold,
    isstatementsent as is_statement_sent,
    standarddiscountpercentage as standard_discount_percentage,
    postalcityid as postal_city_id,
    postalpostalcode as postal_code,
    postaladdressline1 as postal_address_line1,
    postaladdressline2 as postal_address_line2,

    websiteurl as website_url,
    faxnumber as fax_number,
    validfrom as valid_from,
    validto as valid_to,
    lasteditedby as last_edited_by
    
  from customers
)

select * from final 