{{ config(materialized='table') }}

with source_movies_nodes as (

    select

    id as src_content_id, id as dst_content_id, 'season' as dst_content_type
    
    FROM {{ ref('content_season_gold') }}

)

select * from source_movie_nodes