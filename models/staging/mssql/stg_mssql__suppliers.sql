with

suppliers as (
  select * from {{ source('src_mssql', 'suppliers') }}
),

final as (

  select
    supplierid as supplier_id,
    suppliername as supplier_name,
    suppliercategoryid as supplier_category_id,
    supplierreference as supplier_reference,
    alternatecontactpersonid as alternate_contact_person_id,
    primarycontactpersonid as primary_contact_person_id,

    paymentdays as payment_days,
    phonenumber as phone_number,
    bankaccountcode as bank_account_code,
    bankaccountname as bank_account_name,
    bankaccountbranch as bank_acount_branch,
    bankaccountnumber as bank_account_number,
    bankinternationalcode as bank_intrnational_code,
    faxnumber as fax_number,

    postalcityid as postal_city_id,
    postaladdressline1 as postal_address_line1,
    postaladdressline2 as postal_address_line2,
    deliverycityid as delivery_city_id,
    deliverylocation as delivery_location,
    deliverymethodid as delivery_method_id,
    deliverypostalcode as delivery_postal_code,
    deliveryaddressline1 as delivery_address_line1,
    deliveryaddressline2 as delivery_address_line2,
    postalpostalcode as postal_code,

    websiteurl as website_url,
    internalcomments as internal_comments,
    validto as valid_to,
    validfrom as valid_from,
    lasteditedby as last_edited_by,


  from suppliers
)

select * from final
