{{ config(materialized='table') }}

with source_category as (

    select

   id as category_id, parent_id, root_id
    
    FROM {{ref('silver_cleansed_all_categories')}}
)

select * from source_category