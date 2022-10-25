with orders as (
    select * from {{ ref('stg_inc_orders')}}
),
reps as (
    select * from {{ ref('stg_employee')}}
)

select category, city, customer_segment, department, item, order_date, 
        postal_code, o.region, rep, "STATE", emp_id, first_name, last_name, customer_id

from orders o 
left join reps r
on o.rep = r.emp_id