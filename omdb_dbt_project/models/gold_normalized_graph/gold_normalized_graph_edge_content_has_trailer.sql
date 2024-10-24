{{ config(materialized='table') }}

with source_content_has_categories_edges as (

    select

    content_id as src_content_id, trailer_id as dst_trailer_id
    
    FROM {{ ref('gold_normalized_content_trailer') }}

)

select * from source_content_has_categories_edges