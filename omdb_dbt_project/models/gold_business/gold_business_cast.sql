{{ config(materialized='table') }}


with source_cast as (

    select

    *
    
    FROM {{ref('gold_denormalized_cast')}}
)

select * from source_cast