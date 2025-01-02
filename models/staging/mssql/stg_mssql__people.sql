with 

people as (
  select * from {{ source('src_mssql', 'people') }}
),

final as (

  select 
    photo,
    validto as valid_to,
    fullname,
    personid as person_id,
    faxnumber as fax_number,
    logonname as logon_name,
    validfrom as valid_from,
    isemployee as is_employee,
    searchname as search_name,
    phonenumber as phone_number,
    customfields as custom_fields,
    emailaddress as email_address,
    issystemuser as is_system_user,
    lasteditedby as last_edited_by,
    issalesperson as is_sales_person,
    preferredname as preferred_name,
    hashedpassword as hashed_password,
    otherlanguages as other_languages,
    userpreferences as user_preferences,
    ispermittedtologon as is_permitted_to_logon,
    isexternallogonprovider as is_external_logon_provider,

  from people
)

select * from final