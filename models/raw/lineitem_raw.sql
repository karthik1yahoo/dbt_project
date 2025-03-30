{{
    config(
        materialized="incremental",
        unique_key=["L_LINENUMBER"],
        incremental_strategy='merge'
    )
}}

select  src.*
    , {{ utc_to_est_conversion() }} AS dbt_INSERT
    , {{ utc_to_est_conversion() }} AS dbt_update
from {{source("SNOWFLAKE_SAMPLE_DATA_NAME",'LINEITEM')}}  src
WHERE src.L_ORDERKEY in 
(select distinct O_ORDERKEY from SNOWFLAKE_SAMPLE_DATA.TPCH_SF10.ORDERS
 WHERE O_ORDERDATE  BETWEEN '1990-12-31' AND '1995-09-08' )