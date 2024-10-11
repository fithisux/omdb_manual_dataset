{{ config(materialized='table') }}

with source_all_categories_gold as (

    select

   *
    
    FROM {{ref('all_categories_cleansed')}}
)

select * from source_all_categories_gold