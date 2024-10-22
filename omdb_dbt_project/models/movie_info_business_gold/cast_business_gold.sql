{{ config(materialized='table') }}


with source_cast_gold as (

    select

    *
    
    FROM {{ref('cast_gold')}}
)

select * from source_cast_gold