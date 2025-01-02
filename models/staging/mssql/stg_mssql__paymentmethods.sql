with 

paymentmethods as (
  select * from {{ source('src_mssql', 'paymentmethods') }}
),

final as (

  select
    paymentmethodid as payment_method_id,
    paymentmethodname as payment_method_name,
    validto as valid_to,
    validfrom as valid_from,
    lasteditedby as last_edited_by,
    
  from paymentmethods
)

select * from final

