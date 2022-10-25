{%- set priority_ship = ['Low','Medium','High','Critical'] -%}

with order_table as (
    select *, DATEDIFF(day,cast(order_date as date),cast(ship_date as date)) handling 
     from {{ref('stg_order_details')}}
),
sale_table as (
    select * from {{ref('stg_sale_fact')}}
),
sale_order as (
    select handling, o.order_id, ship_date, order_date, order_priority,
    s."sales" as sales 
    from order_table o
    left join sale_table s
    on (o.order_id = s.order_id)
),
final as (
    select order_id,
    {% for i in priority_ship %}

    sum(case when order_priority = '{{ i }}' then sales else 0 end) as {{ i }}_priority
    {%- if not loop.last -%}
        ,
    {%- endif %}
    {% endfor -%}

    from sale_order
    group by 1
)

select * from final
