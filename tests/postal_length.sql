-- Ensures that postal codes with leading 0's are loaded correctly
with
orders as (
    select * from {{ ref('stg_inc_orders') }}
)

select postal_code 
from orders
where len(postal_code) < 5