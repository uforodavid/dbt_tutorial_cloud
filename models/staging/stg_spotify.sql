select *

from {{ source('sport', 'spotify') }}
