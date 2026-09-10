{#
    the generate_schema_name is already a built-in macro in dbt
    we are overriding it, so it gets parsed executed well before models are materialized
    we override it with custom logic:
    if the target is production then no concatenation for custom schemas - just use custom schema name
    else the concatenation would work as usual with underscore symbol _
#}

{% macro generate_schema_name(custom_schema_name, node) -%}

  {% set custom_schema_name_cleansed = custom_schema_name | trim | upper %}
  {% set target_schema_cleansed = target.schema | trim | upper %}

  {%- if custom_schema_name is none -%}
    {# No custom schema: always use target schema as-is (uppercased above) #}
    {{ target_schema_cleansed }}
  {%- else -%}
    {%- if target.name == 'production' -%}
        {# Prod: use clean custom schema name only #}
        {{ custom_schema_name_cleansed }}
    {%- else -%}
      {# Staging / Dev / feature branches: prefix with personal/branch schema. #}
      {{ target_schema_cleansed }}_{{ custom_schema_name_cleansed }}
    {%- endif -%}
  {%- endif -%}
{%- endmacro %}