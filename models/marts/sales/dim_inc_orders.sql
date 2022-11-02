{{ config(
    tags=["sales"]
) }}

with incs as (
    select * from {{ ref('int_inc_orders') }}
)

select * from incs