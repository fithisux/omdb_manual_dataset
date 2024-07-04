{{ config(materialized='table') }}


with source_all_casts_cleansed as (

    select

    distinct *
    
    FROM {{ref('all_casts_with_types')}}
)

select * from source_all_casts_cleansed