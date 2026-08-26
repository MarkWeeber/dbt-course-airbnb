-- a generic test to test for positive values
-- Jinja statements
{% test test_positive_values(model, column_name) %}
SELECT * FROM {{ model }} WHERE {{ column_name }} <= 0
{% endtest %}