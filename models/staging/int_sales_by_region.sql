with inc_orders as (
   select * from {{ ref('int_inc_orders')}}
)

select customer_segment, department, region, count(customer_id) as order_count

from inc_orders
group by customer_segment, department, region

order by region asc
