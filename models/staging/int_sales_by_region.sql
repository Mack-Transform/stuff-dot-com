with sale_table as (
    select * from {{ref('stg_sale_fact')}}
),
order_table as (
    select * from {{ref('stg_order_details')}}
),
cust_table as (
    select * from {{ref('stg_customers1')}}
),
final as (
    select s."Discount" as discount, s.product_base_margin, s.order_id , 
    s."Profit" as profit, s."Sales" as sales, 
    s.unit_price, s.customer_id, o.order_date,
    c.customer_segment, postal_code, c."Region" as region, "State" as state --,c."City" as city, 
    from sale_table s
    left join order_table o
    on (s.order_id = o.order_id)
    left join cust_table c
    on (s.customer_id = c.customer_id)
)

select * from final