with orders as (
    select * from {{ ref('stg_inc_orders')}}
),
reps as (
    select * from {{ ref('stg_employee')}}
)

select category, city, customer_segment, item, item_id, order_date, department,
        postal_code, o.region, rep, "STATE", emp_id, first_name, last_name

from orders o 
left join reps r
on o.rep = r.emp_id