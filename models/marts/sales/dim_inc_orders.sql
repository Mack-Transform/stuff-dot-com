{{
    config(
        materialized = 'incremental'
    )
}}

select customer_id, city, state, postal_code, category, item,
    order_date, ship_date,DATEDIFF(day,cast(order_date as date),cast(ship_date as date)) handling 
    FROM {{ ref('stg_inc_orders') }}

{% if is_incremental() %}
    where created_at =  (select max(created_at) 
    from {{ ref('stg_inc_orders') }})

{% endif %}