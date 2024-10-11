{{ config(materialized='table') }}


with source_all_casts_gold as (

    select

    distinct *
    
    FROM {{ref('all_casts_cleansed')}}
)

select * from source_all_casts_gold