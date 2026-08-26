-- checks that there is no review date that is submitted before its listing was created
SELECT R.listing_id FROM {{ref('fct_reviews')}} AS R
    INNER JOIN {{ref('dim_listings_cleansed')}} AS L ON R.listing_id = L.listing_id
WHERE R.review_date < L.created_at
LIMIT 10