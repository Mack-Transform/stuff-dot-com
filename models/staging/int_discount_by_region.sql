with orders as (
    select * from {{ ref('int_inc_orders')}}
),
discounts as (
    select * from {{ ref('dim_sales_by_product')}}
)

select city, "STATE", customer_segment, ord.item, ord.item_id, ord.order_date,
        postal_code, region, rep,  discount
from orders as ord
left join 
discounts as dis 
on ord.item_id = dis.item_id
