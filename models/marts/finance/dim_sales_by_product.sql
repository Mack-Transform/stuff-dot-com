with sale_table as (
    select * from {{ref('stg_sale_fact')}}
),
order_table as (
    select * from {{ref('stg_order_details')}}
),
prod_table as (
    select * from {{ref('stg_products')}}
),
final as (
    select s.discount, s.product_base_margin, 
    s.profit, s.sales, s.unit_price, s.customer_id, s.item_id, o.order_date,
    p.category, p.department, item
    from sale_table s
    left join order_table o
    on (s.order_id = o.order_id)
    left join prod_table p 
    on (s.item_id = p.item_id)
)

select * from final