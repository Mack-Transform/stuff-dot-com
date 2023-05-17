{{
    config(
        materialized = 'table',
        tags=["sales"]
    )
}}

with rep_data as (
    select * from {{ ref('int_sales_rep_performance' )}}
)

select * FROM rep_data
where first_name is not null 
and last_name is not null