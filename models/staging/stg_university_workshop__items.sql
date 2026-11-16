
with source as (

    select * from {{ source('university_workshop', 'raw_items') }}

),

renamed as (

    select
        id as item_id,
        order_id,
        sku

    from source

)

select * from renamed

