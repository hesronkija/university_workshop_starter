with order_products as (

    select *
    from {{ ref('int_order_products') }}

)

select
    a.order_id,
    a.sku as product_a_sku,
    b.sku as product_b_sku,
    1 as pair_count

from order_products as a

inner join order_products as b
    on a.order_id = b.order_id
    and a.sku < b.sku