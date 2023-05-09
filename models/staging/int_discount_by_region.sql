with orders as (
    select * from {{ ref('int_inc_orders')}}
),
discounts as (
    select * from {{ ref('dim_sales_by_product')}}
)

select city, "STATE", customer_segment, o.item, o.item_id, o.order_date,
        postal_code, region, rep,  discount,  product_base_margin
from orders o
left join 
discounts d 
on o.item_id = d.item_id
