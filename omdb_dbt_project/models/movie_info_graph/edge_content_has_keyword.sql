{{ config(materialized='table') }}

with source_has_keyword_edge as (

    select

    
     movie_id as src_movie_id, movie_id as dst_movie_id, category_id as dst_category_id
    
    FROM {{ ref('edge_has_keyword_gold') }}

)

select * from source_has_keyword_gold