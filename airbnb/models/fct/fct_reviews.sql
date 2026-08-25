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

SELECT * FROM src_reviews
WHERE review_text IS NOT NULL
{% if is_incremental() %} --- incremental check
    AND review_date > (SELECT MAX(review_date) FROM {{this}}) -- if true then add an SQL condition, 'this' refers to fct_reviews model
{% endif %}