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

base as (
  select 
    fct.transaction_amount,
    fct.tax_amount,
    fct.amount_excluding_tax,
    fct.outstanding_balance,
    fct.is_finalized,
    dim_customer.customer_name,
    dim_customer.customer_category_name,
    dim_customer.account_opened_date,
    dim_customer.postal_code,
    dim_payment_method.payment_method_name,
    dim_transaction_type.transaction_type_name
  from {{ ref('fact_transaction') }} fct
  left join {{ ref('dim_customer') }} dim_customer
    on fct.customer_key = dim_customer.customer_key
  left join {{ ref('dim_paymentmethod') }} dim_payment_method
    on fct.payment_method_key = dim_payment_method.payment_method_key
  left join {{ ref('dim_transactiontype') }} dim_transaction_type
    on fct.transaction_type_key = dim_transaction_type.transaction_type_key
),

aggregated_metrics as (
  select
    -- Financial Metrics
    sum(transaction_amount) as total_revenue,
    sum(tax_amount) as total_tax_collected,
    avg(transaction_amount) as avg_transaction_value,
    sum(outstanding_balance) as total_outstanding_balance,
    sum(case when is_finalized = true then 1 else 0 end) * 100.0 / count(*) as finalized_transaction_percentage,
    sum(amount_excluding_tax) as total_transactions_excluding_tax,

    -- Customer Metrics
    count(distinct customer_name) as total_customers,
    count(*) * 1.0 / count(distinct customer_name) as avg_transactions_per_customer,

    -- Payment Method Metrics
    count(distinct payment_method_name) as total_payment_methods,

    -- Transaction Type Metrics
    count(distinct transaction_type_name) as total_transaction_types,

    -- Time-Based Metrics
    date_trunc('month', min(account_opened_date)) as first_customer_date,
    date_trunc('month', max(account_opened_date)) as most_recent_customer_date,

    -- Geographic Metrics
    count(distinct postal_code) as total_unique_postal_codes
  from base
)

select * from aggregated_metrics
