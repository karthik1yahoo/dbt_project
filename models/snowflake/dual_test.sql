{{
    config(
        materialized="table"

    )
}}

SELECT a.* , {{ utc_to_est_conversion() }} as test_time FROM {{ref("employee")}} a
