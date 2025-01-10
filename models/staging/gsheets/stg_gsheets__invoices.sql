with

invoices as (
  select * from {{ source('src_gsheets', 'invoices') }}
),

final as (

  select
    cast(orderid as int) as order_id,
    comments,
    cast(invoiceid as int) as invoice_id,
    cast(customerid as int) as customer_id,
    deliveryrun as delivery_run,
    cast(invoicedate as date) invoice_date,
    runposition as run_position,
    cast(iscreditnote as boolean) as is_credit_note,
    cast(lasteditedby as int) as last_edited_by,
    cast(totaldryitems as int) as total_dry_items,
    TO_TIMESTAMP(lasteditedwhen, 'YYYY-MM-DD HH24:MI:SS') AS last_edited_when,
    cast(contactpersonid as int) as contact_person_id,
    cast(billtocustomerid as int) as bill_to_customer_id,
    creditnotereason as credit_note_reason,
    cast(deliverymethodid as int) as delivery_method_id,
    internalcomments as internal_comments,
    cast(packedbypersonid as int) as packed_by_person_id,
    cast(totalchilleritems as int) as total_chiller_items,
    confirmedreceivedby as confirmed_received_by,
    cast(salespersonpersonid as int) as salesperson_person_id,
    deliveryinstructions as delivery_instructions,
    returneddeliverydata as returned_delivery_data,
    to_timestamp(confirmeddeliverytime, 'YYYY-MM-DD HH24:MI:SS') as confirmed_delivery_time,
    cast(customerpurchaseordernumber as int) as customer_purchase_order_number

  from invoices
)

select * from final