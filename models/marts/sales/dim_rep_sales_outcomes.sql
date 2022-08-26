with reps as (
    select * from {{ ref('int_inc_orders') }}
)

select * from reps