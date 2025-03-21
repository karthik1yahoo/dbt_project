<<<<<<< HEAD
select * from {{ref("employee")}}
=======
{{
    config(
        materialized="table"

    )
}}

SELECT * FROM {{ref("employee")}}
>>>>>>> 058fd9aaea38d6a5c08a5c329b27ed3fdd667c64
