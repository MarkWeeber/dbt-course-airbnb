--- incremental materilization
{{
    config(
        materialized = 'incremental',
        on_schema_change = 'fail'
    )
}}

--- creating a fact table for reviews
WITH src_reviews AS (
    SELECT * FROM {{ref('src_reviews')}}
)

SELECT
    -- adding special code to utilize surrogate key generation
    -- since this fact table has no unique key value
    -- we will create a unique based on comibation of several columns to make it unique
    {{ dbt_utils.generate_surrogate_key(['listing_id', 'review_date', 'reviewer_name', 'review_text']) }}
    AS review_id,
    *
FROM src_reviews
WHERE review_text IS NOT NULL
{% if is_incremental() %} --- incremental check
    AND review_date > (SELECT MAX(review_date) FROM {{this}}) -- if true then add an SQL condition, 'this' refers to fct_reviews model
{% endif %}