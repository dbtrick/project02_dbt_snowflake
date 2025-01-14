with

transaction as (
  select * from {{ ref('stg_mssql__customertransactions') }}
),

customer as (
  select * from {{ ref('dim_customer') }}
),

invoice as (
  select * from {{ ref('stg_gsheets__invoices') }}
),

payment_method as (
  select * from {{ ref('dim_paymentmethod') }}
),

transaction_type as (
  select * from {{ ref('dim_transactiontype') }}
),

date as (
  select * from {{ ref('dim_date') }}
),

final as (

  select
    {{ dbt_utils.generate_surrogate_key(['transaction.customer_transaction_id'])}} as transaction_key,
    {{ dbt_utils.generate_surrogate_key(['invoice.invoice_id']) }} as invoice_key,

    customer.customer_key,
    payment_method.payment_method_key,
    transaction_type.transaction_type_key,
    date.date_key,

    transaction.transaction_amount,
    transaction.tax_amount,
    transaction.amount_excluding_tax,
    transaction.outstanding_balance,
    transaction.is_finalized

  from transaction

  left join customer
    on transaction.customer_id = customer.customer_id
  left join invoice
    on transaction.invoice_id = invoice.invoice_id
  left join payment_method
    on transaction.payment_method_id = payment_method.payment_method_id 
  left join transaction_type
    on transaction.transaction_type_id = transaction_type.transaction_type_id
  left join date
    on transaction.transaction_date = date.date_day
)

select * from final
