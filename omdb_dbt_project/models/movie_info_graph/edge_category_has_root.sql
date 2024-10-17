{{ config(materialized='table') }}

with source_category_has_parent_edges as (

    select

    
    category_id as src_category_id, root_id as dst_category_id
    
    FROM {{ ref('all_categories_gold') }}

    where root_id is not null

)

select * from source_category_has_parent_edges