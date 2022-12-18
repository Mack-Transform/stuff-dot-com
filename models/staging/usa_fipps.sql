with usa_fipps as (
    select * from {{ ref('usa_staten_codes')}}
)
select * from usa_fipps