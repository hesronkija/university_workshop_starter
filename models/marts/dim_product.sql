with product as(
    select *
    from {{ ref('stg_university_workshop__products') }}
)

select
    sku,
    product_name,
    product_type,
    product_description
from product