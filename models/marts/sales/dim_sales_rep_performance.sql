{{
    config(
        materialized = 'table'
    )
}}
{{  config(
        tags=["sales"]
) 
}}


with rep_data as (
    select * from {{ ref('int_sales_rep_performance' )}}
)

select * FROM rep_data