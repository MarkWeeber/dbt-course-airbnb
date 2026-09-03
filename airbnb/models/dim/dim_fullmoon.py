# it is actually used on data warehouse and not here
# so showing error that package is missing is totally fine
import holidays

# a function that returns if the given date is a holiday in Germany
# returns true or false
def is_holiday(date_col):
    german_holidays = holidays.Germany()
    is_holiday = (date_col in german_holidays)
    return is_holiday

# main model function which will be returned and materialized
def model(dbt, session):
    # configure the dbt
    dbt.config(
        materialized = "table",
        # specifically tell data warehouse to install 'holidays' package
        packages = ["holidays", "pandas", "pyarrow"] 
    )

    # getting the reference to seed
    orders_df = dbt.ref("seed_full_moon_dates")

    # using pandas dataframe
    # converting to pandas dataframe
    df = orders_df.to_pandas()

    # creating a new column and apply the is_holiday() function
    df["IS_HOLIDAY"] = df["FULL_MOON_DATE"].apply(is_holiday)

    # return final dataset (Pandas DataFrame)
    return df