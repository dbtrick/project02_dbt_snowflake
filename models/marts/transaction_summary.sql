{# with

transaction as (
  select * from {{ ref('fact_transaction') }}
),

customer as (
  select * from {{ ref('dim_customer') }}
),

invoice as (
  select * from {{ source('src_gsheets', 'invoices') }}
),

payment_method as (
  select * from {{ ref('dim_paymentmethod') }}
),

transaction_type as (
  select * from {{ ref('dim_transactiontype') }}
),

final as (

  select 

) #}