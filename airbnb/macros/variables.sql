{# Macro to test jinja and dbt project variables #}

{% macro learn_variables() %}

    {# testing jinja variable #}
    {# setting jinja variable #}
    {% set jinja_var = "This is Jinja variable "%}

    {# logging the jinja variable #}
    {{log("Jinja VAR: " ~ jinja_var, info=True)}}

    {# testing dbt project variable #}
    {# if not found then a default value will be returned #}
    {# will be overriden if the variable is set in command line #}

    {{ log("dbt VAR: " ~ var("dbt_variable", "no variable is set"), info=True) }}

{% endmacro %}