{%- macro utc_to_est_conversion1(timestamp=none) -%}

{%- if timestamp is none -%}
convert_timezone('UTC', 'America/New_York', sysdate())
{%- else -%}
convert_timezone('UTC', 'America/New_York', {{ timestamp }})
{%- endif -%}

{%- endmacro -%}
