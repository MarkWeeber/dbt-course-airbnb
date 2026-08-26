-- a singular test to see if any records in dim_listings_cleansed have incorrect data
-- from business logic minimum nights cannot be 0 or negative
SELECT * FROM {{ref('dim_listings_cleansed')}}
WHERE minimum_nights < 1
LIMIT 10 -- nice way to reduce load on data warehouse
