{{ config(materialized='table') }}

with source_all_categories_nodes as (

    select

    category_id, parent_id, root_id
    
    FROM {{ref('category_gold')}}
)

select * from source_all_categories_nodes