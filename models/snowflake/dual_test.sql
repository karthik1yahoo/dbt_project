{{
    config(
        materialized="table"

    )
}}

SELECT * FROM {{ref("employee")}}
