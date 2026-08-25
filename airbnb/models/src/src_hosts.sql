--- create CTE for RAW_HOSTS
WITH src_hosts AS (
    SELECT * FROM {{source('airbnb','hosts')}}
)

SELECT 
    id,
    name,
    is_superhost,
    created_at,
    updated_at
FROM
    src_hosts