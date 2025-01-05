with

people as (
  select * from {{ ref('stg_mssql__people') }}
),

final as (

  select
    {{ dbt_utils.generate_surrogate_key(['people.person_id'])}},

    people.person_id,
    people.fullname as employee_name,
    people.preferred_name,
    people.is_sales_person,
    people.email_address,
    people.phone_number,
    people.photo,
    people.valid_from,
    people.valid_to,
    people.last_edited_by

  from people

  where people.is_employee = 1

)

select * from final

