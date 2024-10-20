{{ config(materialized='table') }}


with source_all_casts_node as (

    select

    *
    
    FROM {{ref('cast_gold')}}
)

select * from source_all_casts_node