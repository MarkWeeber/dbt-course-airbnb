{% docs dim_listing_cleansed__minimum_nights %}
Minimum number of nights required to rent this property.

Keep in mind that old listings might have `minimum_nights` set
to 0 in the source tables. Our cleansing algorithm updates this to `1`.

{% enddocs %}

{% docs dim_hosts_cleansed %}
A dimensional table for hosts, which is also cleansed from empty host names
All empty host names are filled with 'Anonymous' text
{% enddocs %}