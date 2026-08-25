--- override dbt_project.yml config file to set the materialization as view rather than a table
{{
    config(
        materialized = 'view'
    )
}}

--- create CTE for src_hosts
WITH src_hosts AS (
    SELECT * FROM {{ref('src_hosts')}}
)

SELECT
    id AS host_id,
    NVL(name, 'Anonymous') AS host_name,
    is_superhost,
    created_at,
    updated_at
FROM
    src_hosts