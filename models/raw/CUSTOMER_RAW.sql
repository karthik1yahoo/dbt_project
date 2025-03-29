{{ config(materialized='table') }}

SELECT src.*
    ,{{ utc_to_est_conversion() }} AS dbt_INSERT
    ,{{ utc_to_est_conversion() }} AS dbt_update
 FROM {{ source('SNOWFLAKE_SAMPLE_DATA_NAME', 'CUSTOMER') }} src
