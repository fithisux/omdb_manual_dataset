{{ config(materialized='table') }}

with source_has_keyword_edge as (

    select

    
    content_id as src_content_id, category_id as dst_category_id
    
    FROM {{ ref('gold_denormalized_content_has_keyword') }}

)

select * from source_has_keyword_edge