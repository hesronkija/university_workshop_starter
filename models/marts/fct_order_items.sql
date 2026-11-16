with items as (
    select *
    from {{ ref('stg_university_workshop__items') }}
)

select 
    item_id,
    order_id,
    sku
from items