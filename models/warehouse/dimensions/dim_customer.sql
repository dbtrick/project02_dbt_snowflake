with

mssql_customer as (
  select * from {{ ref('stg_mssql__customers') }}
),

website_customers as (
  select * from {{ ref('stg_website__customers') }}
),

customercategories as (
  select * from {{ ref('stg_mssql__customercategories') }}
),

buyinggroups as (
  select * from {{ ref('stg_mssql__buyinggroups') }}
),

final as (

  select  
    {{ dbt_utils.generate_surrogate_key(['mssql_customer.customer_id'])}} as customer_key,

    mssql_customer.customer_id,
    mssql_customer.customer_name,
    mssql_customer.phone_number,
    mssql_customer.account_opened_date,

    website_customers.primary_contact,
    website_customers.alternate_contact,
    
    customercategories.customer_category_name,
    buyinggroups.buying_group_name,

    mssql_customer.postal_code,
    mssql_customer.fax_number,
    mssql_customer.valid_from,
    mssql_customer.valid_to,
    mssql_customer.last_edited_by

  from mssql_customer

  left join website_customers
    on mssql_customer.customer_id = website_customers.customer_id
  left join customercategories
    on mssql_customer.customer_category_id = customercategories.customer_category_id
  left join buyinggroups
    on mssql_customer.buying_group_id = buyinggroups.buying_group_id

)

select * from final

