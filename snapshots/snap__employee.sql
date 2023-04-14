{% snapshot employee_snapshot %}

{{
    config(
      target_database='ANALYTICS',
      target_schema='DBT_AMACK',
      unique_key='EMP_ID',

      strategy='timestamp',
      updated_at='CREATED_AT',
    )
}}

select * from  {{source('transactions','employee')}}

{% endsnapshot %}