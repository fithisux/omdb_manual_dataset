{{ config(materialized='table') }}

with source_category_gold as (

    select

   id as category_id, parent_id, root_id
    
    FROM {{ref('all_categories_cleansed')}}
)

select * from source_category_gold