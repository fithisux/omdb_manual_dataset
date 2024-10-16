{{ config(materialized='table') }}

with source_all_categories_nodes as (

    select

   *
    
    FROM {{ref('all_categories_gold')}}
)

select * from source_all_categories_nodes