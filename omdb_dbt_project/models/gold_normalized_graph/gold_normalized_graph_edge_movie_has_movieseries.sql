{{ config(materialized='table') }}

with source_has_movieseries_edges as (

    select

    movie_id as src_content_id, movieseries_id as dst_content_id
    
    FROM {{ ref('gold_normalized_content_movie') }}
    where movieseries_id is not null

)

select * from source_has_movieseries_edges