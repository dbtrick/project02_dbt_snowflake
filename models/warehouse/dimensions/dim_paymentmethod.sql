with 

paymentmethod as (
  select * from {{ ref('stg_mssql__paymentmethods') }}
),

final as (

  select 
    {{ dbt_utils.generate_surrogate_key(['paymentmethod.payment_method_id'])}},

    paymentmethod.payment_method_id,
    paymentmethod.payment_method_name,
    paymentmethod.valid_from,
    paymentmethod.valid_to,
    paymentmethod.last_edited_by

  from paymentmethod

)

select * from final
