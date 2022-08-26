select {{ dbt_utils.star(
    from=ref('stg_sale_fact'),
    except=["Sales","UNIT_PRICE"]
) }} 
from {{ ref('stg_sale_fact') }}
limit 100