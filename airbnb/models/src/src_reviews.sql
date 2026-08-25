--- create CTE for RAW_REVIEWS
WITH src_reviews AS (
    SELECT * FROM {{source('airbnb','reviews')}}
)

SELECT
    LISTING_ID,
    DATE AS review_date,
    REVIEWER_NAME,
    COMMENTS AS review_text,
    SENTIMENT AS review_sentiment
FROM src_reviews