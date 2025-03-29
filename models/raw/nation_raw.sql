{{ config(
    materialized='incremental',
    on_schema_change='sync_all_columns'
) }}

SELECT src.*
    , {{ utc_to_est_conversion() }} AS dbt_INSERT
    , {{ utc_to_est_conversion() }} AS dbt_update
FROM {{ source('SNOWFLAKE_SAMPLE_DATA_NAME', 'NATION') }} src

{% if is_incremental() %}
    WHERE dbt_update > (SELECT MAX(dbt_update) FROM {{ this }})
{% endif %}
