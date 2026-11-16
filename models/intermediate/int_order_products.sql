with order_items as (
    select *
    from {{ ref('fct_order_items') }}
)

select DISTINCT
    order_id,
    sku
from order_items