{{
    config(
        materialized='incremental',
        unique_key='unique_key'
    )
}}


select 

*

from {{ source('sport', 'table1') }}


{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where last_update_date >= (select max(last_update_date) from {{ this }})

{% endif %}