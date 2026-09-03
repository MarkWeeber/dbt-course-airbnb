def model(dbt, session):
    # a snowflake dataframe object:
    listings = dbt.ref("dim_listings_cleansed")

    # uses snowflake dataframe syntax to filter out the dataframe and return it
    return (listings.filter(listings["MINIMUM_NIGHTS"] >= 30)
                   .select("LISTING_ID", "LISTING_NAME", "PRICE"))