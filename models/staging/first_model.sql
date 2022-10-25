with first_model as (
    select * from {{ source('transactions', 'sale_fact')}}
)

select * from first_model