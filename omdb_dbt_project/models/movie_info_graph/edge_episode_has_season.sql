{{ config(materialized='table') }}

with source_movies_nodes as (

    select

    id as src_id, season_id as dst_id
    
    FROM {{ ref('content_episode_gold') }}
    where season_id is not null

)

select * from source_movie_nodes