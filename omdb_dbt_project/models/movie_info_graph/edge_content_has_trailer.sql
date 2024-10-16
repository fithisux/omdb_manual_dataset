{{ config(materialized='table') }}

with source_content_has_categories_edges as (

    select

    movie_id as src_movie_id, trailer_id as dst_trailer_id
    
    FROM {{ ref('edge_has_keyword_gold') }}

)

select * from source_content_has_categories_edges