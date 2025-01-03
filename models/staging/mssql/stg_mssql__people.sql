with 

people as (
  select * from {{ source('src_mssql', 'people') }}
),

final as (

  select 
    personid as person_id,
    fullname,
    preferredname as preferred_name,
    logonname as logon_name,
    searchname as search_name,
    isemployee as is_employee,
    issystemuser as is_system_user,
    issalesperson as is_sales_person,
    emailaddress as email_address,
    phonenumber as phone_number,
    photo,
    ispermittedtologon as is_permitted_to_logon,
    isexternallogonprovider as is_external_logon_provider,
    hashedpassword as hashed_password,
    otherlanguages as other_languages,
    userpreferences as user_preferences,
    
    faxnumber as fax_number,
    customfields as custom_fields,
    
    validfrom as valid_from,
    validto as valid_to,
    lasteditedby as last_edited_by,
  
  from people
)

select * from final