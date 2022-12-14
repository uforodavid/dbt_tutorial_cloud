{% snapshot orders_snapshot %}

{{
    config(
      target_database='curious-scarab-309814',
      target_schema='snapshots',
      unique_key='id',

      strategy='timestamp',
      updated_at='order_date',
    )
}}

select * from {{ source('shop', 'raw_orders') }}

{% endsnapshot %}