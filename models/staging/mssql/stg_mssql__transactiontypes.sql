with

transactiontypes as (
  select * from {{ source('src_mssql', 'transactiontypes') }}
),

final as (

  select
    transactiontypeid as transaction_type_id,
    transactiontypename as transaction_type_name,
    validto as valid_to,
    validfrom as valid_from,
    lasteditedby as last_edited_by
  
  from transactiontypes
)

select * from final