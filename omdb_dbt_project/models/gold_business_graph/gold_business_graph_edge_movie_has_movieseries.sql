{{ config(materialized='table') }}

with source_has_movieseries_edges as (

    select

    movie_id as src_movie_id, movieseries_id as dst_movieseries_id
    
    FROM {{ ref('gold_business_movie') }}
    where movieseries_id is not null

)

select * from source_has_movieseries_edges