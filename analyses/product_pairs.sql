with pair_totals as (

    select
        product_a_sku,
        product_b_sku,
        sum(pair_count) as orders_together
    from {{ ref('fct_order_product_pairs') }}
    group by product_a_sku, product_b_sku

)

select
    product_a.product_name as product_a_name,
    product_b.product_name as product_b_name,
    pairs.orders_together
from pair_totals as pairs
left join {{ ref('dim_product') }} as product_a
    on pairs.product_a_sku = product_a.sku
left join {{ ref('dim_product') }} as product_b
    on pairs.product_b_sku = product_b.sku
order by orders_together desc, pairs.product_a_sku, pairs.product_b_sku
