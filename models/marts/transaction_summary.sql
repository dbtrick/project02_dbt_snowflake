with

fct_transaction as (
  select * from {{ ref('fact_transaction') }}
),

dim_customer as (
  select * from {{ ref('dim_customer') }}
),

dim_payment_method as (
  select * from {{ ref('dim_paymentmethod') }}
),

dim_transaction_type as (
  select * from {{ ref('dim_transactiontype') }}
),

final as (

  select
    fct_transaction.transaction_key,
    fct_transaction.invoice_key,

    dim_customer.customer_name,
    dim_customer.phone_number,
    dim_customer.account_opened_date,
    dim_customer.primary_contact,
    dim_customer.alternate_contact,
    dim_customer.customer_category_name,
    dim_customer.buying_group_name,
    dim_customer.postal_code,
    dim_customer.fax_number,

    dim_payment_method.payment_method_name,

    dim_transaction_type.transaction_type_name, 

    fct_transaction.transaction_amount,
    fct_transaction.tax_amount,
    fct_transaction.amount_excluding_tax,
    fct_transaction.outstanding_balance,
    fct_transaction.is_finalized

  from fct_transaction

  left join dim_customer
    on fct_transaction.customer_key = dim_customer.customer_key
  left join dim_payment_method
    on fct_transaction.payment_method_key = dim_payment_method.payment_method_key
  left join dim_transaction_type
    on fct_transaction.transaction_type_key = dim_transaction_type.transaction_type_key

)

select * from final