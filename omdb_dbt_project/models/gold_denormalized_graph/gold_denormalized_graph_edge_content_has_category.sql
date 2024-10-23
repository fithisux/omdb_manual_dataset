{{ config(materialized='table') }}

with source_content_has_categories_edges as (

    select

    content_id as src_content_id, category_id as dst_category_id
    
    FROM {{ ref('gold_denormalized_content_has_category') }}

)

select * from source_content_has_categories_edges