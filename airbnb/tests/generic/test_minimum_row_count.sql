-- a test with custom parameters
-- test for minimum row number be present in table
{% test test_minimum_row_count(model, min_row_count) %}
{{ config(severity='warn') }} -- a severity can be set here too
SELECT
    COUNT(*) AS cnt
FROM
    {{model}}
HAVING
    COUNT(*) < {{min_row_count}}
{% endtest %}