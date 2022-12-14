{{config (materialized = "table")
}}

{%- set payment_method = ['bank_transfer', 'coupon', 'credit_card', 'gift_card'] -%}

with payments as (
    select * from {{ref ('stg_payments')}}
),
    pivoted as (
        select 
        order_id,
        {% for method in payment_method -%}

        sum(case when payment_method = '{{ method }}' then amount else 0 end) as {{method}}_amount

        {%- if not loop.last -%}
            ,
        {%- endif %}
        {% endfor -%}
       

        from payments
        group by 1
    )

    select * from pivoted 