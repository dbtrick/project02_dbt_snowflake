with 

transactiontype as (
  select * from {{ ref('stg_mssql__transactiontypes') }}
),

final as (

  select 
    {{ dbt_utils.generate_surrogate_key(['transactiontype.transaction_type_id'])}} as transaction_type_key,

    transactiontype.transaction_type_id,
    transactiontype.transaction_type_name,
    transactiontype.valid_from,
    transactiontype.valid_to,
    transactiontype.last_edited_by

  from transactiontype

)

select * from final

