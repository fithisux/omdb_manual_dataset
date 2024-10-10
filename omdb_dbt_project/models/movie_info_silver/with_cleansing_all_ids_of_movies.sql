{{ config(materialized='table') }}

with source_all_movie_ids_cleansed as (

    select id from {{ ref('all_movies_cleansed') }}
    UNION
    select id from {{ ref('all_movieseries_cleansed') }}

)

select * from source_all_movie_ids_cleansed