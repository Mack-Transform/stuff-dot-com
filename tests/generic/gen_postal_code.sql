{% test gen_postal_code(model, column_name) %}

    select *
    from {{ model }}
    where len({{ column_name }}) < 5

{% endtest %}