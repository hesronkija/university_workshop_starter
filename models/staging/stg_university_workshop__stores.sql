
with source as (

    select * from {{ source('university_workshop', 'raw_stores') }}

),

renamed as (

    select
    id as store_id,
    name as store_name,
    timestamp(opened_at) as opened_at,
    cast(tax_rate as numeric) as tax_rate

    from source

)

select * from renamed

