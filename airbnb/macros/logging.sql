{% macro test_logging() %}
    {{ log ("Hello World", info = True)}}
{% endmacro %}