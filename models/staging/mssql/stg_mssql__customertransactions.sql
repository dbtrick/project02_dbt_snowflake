with 

customertransactions as (
  select * from {{ source('src_mssql', 'customertransactions') }}
),

final as (

  select
    customertransactionid as customer_transaction_id,
    customerid as customer_id,
    invoiceid as invoice_id,
    paymentmethodid as payment_method_id,
    transactiontypeid as transaction_type_id,

    transactionamount as transaction_amount,
    transactiondate as transaction_date,
    taxamount as tax_amount,
    amountexcludingtax as amount_excluding_tax,
    outstandingbalance as outstanding_balance,
    
    lasteditedby as last_edited_by,
    lasteditedwhen as last_edited_when,
    isfinalized as is_finalized
  
  from customertransactions
)

select * from final