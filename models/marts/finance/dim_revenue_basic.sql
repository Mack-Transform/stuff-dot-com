{{ config(
    tags=["finance"]
) }}

with sale_table as (
    select * from {{ref('stg_sale_fact')}}
),
order_table as (
    select * from {{ref('stg_order_details')}}
),
final as (
    select s.discount, s.product_base_margin, s.order_id , 
    s.profit, s.sales, 
    s.unit_price, o.order_date
    from sale_table s
    left join order_table o
    on (s.order_id = o.order_id)
)
select * from final

